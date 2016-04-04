/*
if (typeof(jQuery) == 'undefined')
{
    document.write("<sc"+"ript src='http://www.google.com/jsapi' type='text/javascript'></scr"+"ipt>\n"
    + "<scri"+"pt type='text/javasc"+"ript'>google.load('jquery','1.2.6');</sc"+"ript>");
}
*/

/**
 * 布丁式Blogger留言板
 * @param {Object} config 設定
 * 用法：
$.puliGuestBook({
    blogID: "32606656",    //blog的ID
    postID: "115706763683822273",    //post的ID
    url: "http://pulipuli.blogspot.com/feeds/6921201361608060798/comments/default",    //訂閱張貼意見的網址，或是文章ID:115667103250300740
    css: "https://sites.google.com/site/puddingchen35/Home/puliguestbook/puliGuestBook.css",
    container: "#puliGuestBook",    //顯示留言的元素
    listNumber: 20,    //顯示留言數量。超過此數量時，會顯示「閱讀全部留言」的連結。
    adminName: '布丁布丁吃布丁',    //Blog主人的名字
    adminPhoto: 'http://1.bp.blogspot.com/_yr4MQB4zDus/SZ4Mb30N0aI/AAAAAAAAFUg/3OGhwhzBUOg/S45/',    //部落格主人的照片
    anonymous: '匿名',    //匿名者的名字
    readMore: '閱讀全部留言',    //閱讀全部留言連結的名稱
    write: '撰寫留言',    //撰寫留言連結的名稱
    reload: '重新讀取'    //重新讀取連結的名稱
});
 */
jQuery.puliGuestBook = function (config) {
    
    var getParam = function (index, defaultValue) {
        if (typeof(config[index]) == 'undefined')
            return defaultValue;
        else
            return config[index];
    };
    
    var getBaseLink = function () {
        var host = location.href;
        
        // by Pudding Chen 20120609
        //因為字尾會被換成tw，所以不能這樣做了
        //var pos = host.indexOf('.com/');
        //host = host.substring(0, pos + 5);
        
        var _blogspot_str = '.blogspot.';
        var _blogspot_pos = host.indexOf(_blogspot_str);
        var _slash_pos = host.indexOf("/", _blogspot_pos);
        host = host.substring(0, _slash_pos + 1);
        
        return host;
    };
    
    var css = getParam('css', 'https://sites.google.com/site/puddingchen35/Home/puliguestbook/puliGuestBook.css');
    if (jQuery('head link[href="'+css+'"]').length == 0)
        jQuery("<link type='text/css' rel='stylesheet' href='"+css+"' /> ").appendTo(jQuery('head'));
    
    var _container_id = getParam('container', '#puliGuestBook');
    var container = jQuery(_container_id);
    if (container.length == 0)
    {
        var _id = _container_id.substr(1);
        document.write('<div id="' + _id + '">'+'Loading...'+'</div>');
        
        container = jQuery(_container_id);
    }
    container.addClass('puli-guest-book')
    
    var blogID = getParam('blogID', null);
    var postID = getParam('postID', null);
    var url = null;
    if (blogID == null && postID == null)
    {    
        url = getParam('url', null);
        if (url == null)
        {
            window.alert('puliGuestBook沒有設定URL');
            return;
        }
        
        
        if (url.substring(0,7) != 'http://')
        {
            var host = location.href;
            
            // by Pudding Chen 20120609
            //因為字尾會被換成tw，所以不能這樣做了
            //var pos = host.indexOf('.com/');
            //host = host.substring(0, pos + 5);
            
            var _blogspot_str = '.blogspot.';
            var _blogspot_pos = host.indexOf(_blogspot_str);
            var _slash_pos = host.indexOf("/", _blogspot_pos);
            host = host.substring(0, _slash_pos + 1);
            
            url = host + 'feeds/' + url + '/comments/full?alt=json-in-script&callback=handleGuestbookPulipuli';
        }
        
        var needle = 'default';
        if (url.substring(url.length - needle.length, url.length) == needle)
        {
            url = url.substring(0, url.length - needle.length);
            url = url + 'full?alt=json-in-script&callback=handleGuestbookPulipuli';
        }
    }
    else
    {
        var host = getBaseLink();
        
        url = host + 'feeds/' + postID + '/comments/full?alt=json-in-script&callback=handleGuestbookPulipuli';
    }
    
    var listID = getParam('listID', 'Feedpulipuli_guestbookDisplay');
    
    var listNumber = getParam('listNumber', 20); 
    var adminName = getParam('adminName', '布丁布丁吃布丁');
    //var adminPhoto = getParam('adminPhoto', 'http://1.bp.blogspot.com/_yr4MQB4zDus/SZ4Mb30N0aI/AAAAAAAAFUg/3OGhwhzBUOg/S45/');
    var adminPhoto = getParam('adminPhoto', null);
    var anonymous = getParam('anonymous', '匿名');
    var readMore = getParam('readMore', '閱讀全部的留言');
    var write = getParam('write', '撰寫留言');
    var reload = getParam('reload', '重新讀取');

    handleGuestbookPulipuli = function (json) {
	//document.getElementById("pulipuli_guestbook").innerHTML = '';
    container.html('');
	
	var temp = '<ul id="'+listID+'" class="guest-book-list">';
	var postshow= listNumber ;
	var titlelen = '20';
	var layout = "<span class='date'>%Y%-%M%-%D%</span> <strong class='name'>%authorname%</strong>: %comment%";
    var sortentry = [];
	try
	{
		sortentry=json.feed.entry.sort(function (a,b){
        	order= Date.parse(a.published.$t.replace(/^(\d{4})-(\d{2})-(\d{2})T([0-9:]*)([.0-9]*)(.)(.*)$/,
          '$1/$2/$3 $4 GMT')) - Date.parse(b.published.$t.replace(/^(\d{4})-(\d{2})-(\d{2})T([0-9:]*)([.0-9]*)(.)(.*)$/,
          '$1/$2/$3 $4 GMT'));
        	return 0-order;
        });
	}
	catch (e) { }
	var firstPost = null;
	for (var i=0, post; post = sortentry[i]; i++) 
	{
		if (i == 0)
			firstPost = post;
		if (i >= postshow) 
			break;
		var title=post.content.$t;
			var fulltitle = title.replace("\u003CBR/\u003E", "<br />\n");
			//var tmp = fulltitle.split('<br />'); fulltitle = tmp.join('&nbsp;\n');
			//var tmp = fulltitle.split('"'); fulltitle = tmp.join('&quot;');
			//var tmp = fulltitle.split('<'); fulltitle = tmp.join('&lt;');
			//var tmp = fulltitle.split('>'); fulltitle = tmp.join('&gt;');
		//if (titlelen != "" && title.length > titlelen)
		//  title = title.substr(0, titlelen) + "...";
		var title_temp = "";
		for (var j = 0; j < title.length; j++)
		{
			var temp_char = title.substr(j, 1);
			if (temp_char == "<")
			{
				var temp_j = title.indexOf(">", j);
				if (temp_j != -1)
					j = temp_j;
				continue;
			}
			else
				title_temp = title_temp + temp_char;
		}
		title = title_temp;
		var link=post.link[2].href;
		var title_link = fulltitle;
		var authorname=post.author[0].name.$t;
		if (authorname == 'Anonymous')
			authorname = anonymous;
		
		if (authorname == adminName && adminPhoto != null)
		{
			authorname = '<img src="'+adminPhoto+'" class="admin-photo" border="0" /> ' 
				+ authorname;
		}
			
		var uri = '';
		if (typeof(post.author[0].uri) != 'undefined')
		{
			uri = post.author[0].uri.$t;
			authorname = '<a href="'+uri+'" target="_blank">'+authorname+'</a>';
		}
		
		var timestamp=post.published.$t.substr(0,10);
		  var y = timestamp.substr(0, 4);
		  var m = timestamp.substr(5, 2);
		  var d = timestamp.substr(8, 2);
		
		var layout_replace = layout.replace("%comment%",title_link).replace("%Y%",y).replace("%M%",m).replace("%D%",d).replace("%authorname%",authorname);
		
		var odd = 0;
		if (i % 2 == 1)
			odd = 1;
		temp += '<li class="guest-book-li guest-book-li-'+odd+'"><span class="item-title">'+layout_replace+'</span></li>';
	  }
	
	var add_link = '';
	var rss_link = '';
	var reload_cmd = '';
	//if (firstPost != null)
    if (true)
	{
        var baseLink = null;
        if (blogID == null && postID == null && firstPost != null)
        {
            link = firstPost.link[0].href;
    		//http://www.blogger.com/feeds/16607461/1187506547871300947/comments/default/5372166020783852457
    		var parts = link.split('/');
    		blogID = parts[4];
    		postID = parts[5];
    		
    		var baseLink = firstPost.link[2].href;
    		var pos = baseLink.indexOf('.com/');
    		baseLink = baseLink.substring(0, pos + 5);    
        }
		else
            baseLink = getBaseLink();
        
		rss_link = baseLink + 'feeds/' + postID + '/comments/default';
		add_link = 'https://www.blogger.com/comment.g?blogID='+blogID+'&postID='+postID;
		//https://www.blogger.com/comment.g?blogID=16607461&postID=113544406852218769
		reload_cmd = "jQuery.getScript('"+baseLink+"feeds/"+postID+"/comments/full?alt=json-in-script&callback=handleGuestbookPulipuli')";
		//$.getScript('http://pulipuli.blogspot.com/feeds/1187506547871300947/comments/full?alt=json-in-script&callback=handleGuestbookPulipuli');
	}
	  
	  if (post = sortentry[i])
	  {
	  	link=add_link;
		
	  	temp += '<li class="guest-book-li readmore"><span class="item-title">'
			+ '<a href="'+link+'#comments" target="guestbook_write">'+readMore+'</a>'
			+ '</span></li>';
	  }
	temp+="</ul>";
	
	
	
	temp += '<div class="guestbook-write">'
		+ ' <a href="'+rss_link+'" style="float:right;"><img src="http://3.bp.blogspot.com/_yr4MQB4zDus/Ru35yvgloDI/AAAAAAAABOQ/bbtw-pQhpOk/s200/rss.gif" border="0" /></a>'
		
		+ ' <a href="'+add_link+'" class="write" target="guestbook_write">'+write+'</a>'
		+ ' <a class="write" onclick="'+reload_cmd+'">'+reload+'</a>'
		+ '</div>';
	
	//document.getElementById("pulipuli_guestbook").innerHTML = temp;
    container.html(temp);
}	//function handleGuestbookPulipuli(json) {

    //http://pulipuli.blogspot.com/feeds/113544406852218769/comments/full?alt=json-in-script&callback=handleGuestbookPulipuli
    //http://pulipuli.blogspot.com/feeds/6921201361608060798/comments/default 
    jQuery.ajax({
	  url: url,
	  dataType: 'script',
	  cache: false
	});

};    //$.puliGuestBook = function (config) {

