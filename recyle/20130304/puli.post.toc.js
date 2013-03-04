 /**
  * 檢查PULI_UTILS是否存在
  */
 if (typeof PULI_UTILS == "undefined") {
 	PULI_UTILS = {};
 }


PULI_UTILS.post.toc = function(cataSlt, heading) {
	
	/**
	 * 要在哪裡顯示目錄，是交由Conroller決定
	 * View只要做好View的工作就好，這邊不決定是否顯示目錄
	 * 
	 * @version 20130304 Pulipuli Chen
	 */
	/*
	if (typeof PULI_UTILS.is_blogger_fullpage == "function"
		&& PULI_UTILS.is_blogger_fullpage() === false) {
		 return;
	}
	else {
		count = location.href.split('/');
		if ((count.length != 1 && !(count.length > 5 && count[4] != "label")) || count[0] == "file:") {
			return;
		}	
	}
	*/
	
	if (typeof(heading) == "undefined") {
		heading = "h4";
	}
	
	//get cataSlt ID
	var cata = jQuery(cataSlt);
	var prefix = cata.attr("id");
	
	//取得divID所在的所有的heading
	var postBody = jQuery(cataSlt).parents("div.post-body:first");
	//postBody.css("border", "1px solid red");
	var headingAry = postBody.find("h4,h5");
	//headingAry.css("border", "1px solid red");

	var cataTitleID = prefix+"cataTitle";
	var cataTitle = jQuery("<div class='cata-title' style='width: 75%'>目錄<a name='"+cataTitleID+"' id='"+cataTitleID+"' /></div>");
		
	var goCata = jQuery('<a style="margin:0;padding:0;text-decoration:none;font-size:smaller;font-weight:normal;" href="#'+cataTitleID+'"><sup>&lt;^&gt;</sup></a>');


	var ulObj = jQuery("<ul></ul>");
	//在每個Heading後面加入錨點
	for (var i = 0; i < headingAry.length; i++)
	{
		var hdObj = headingAry.eq(i);
		
		var title = hdObj.text();
		var anchorID = prefix + "_anchor" + i;
		
		var anc = jQuery("<a id='"+anchorID+"' name='"+anchorID+"' />");
		hdObj.append(anc);
		
		var tagName = hdObj.attr('tagName').toLowerCase();
		
		var hd = jQuery("<li><a href='#"+anchorID+"'>"+title+"</a></li>");
		if (tagName == 'h4')
		{
			ulObj.append(hd);
		}
		else
		{
			var lastHd = ulObj.find('li:last');
			
			if (lastHd.length === 0)
			{
				lastHd = $('<li></li>').appendTo(ulObj);
			}
			
			var lastUl = lastHd.find("ul:last");
			
			if (lastUl.length === 0)
			{
				lastUl = $('<ul></ul>').appendTo(lastHd);
			}
			
			lastUl.append(hd);
		}
		
		hdObj.append(goCata.clone());
	}
	if (headingAry.length !== 0)
	{
		
		postBody.prepend("<hr width='75%' />");	
		postBody.prepend(ulObj);
		postBody.prepend(cataTitle);
		
	}
};