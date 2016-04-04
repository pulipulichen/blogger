/**
 * 檢查PULI_UTILS是否存在
 */
if (typeof PULI_UTILS == "undefined") {
	PULI_UTILS = {};
}
 
if (typeof PULI_UTILS.post == "undefined") {
	PULI_UTILS.post = {};
}

PULI_UTILS.post.iframelazyload = {
	
	/**
	 * 初始化，將iframe變成遮照
	 */
	init: function () {
		var iframes, imgs;
		
		var needle = "?imgmax=800";
		var filterImg = function (imgs)
		{
			for (var i = 0; i < imgs.length; i++)
			{
				var img = imgs.eq(i);
				var src = img.attr("src");
				if (typeof(src) == "undefined") {
					continue;
				}
				
				var len = src.length;
				if (src.substring(len - needle.length, len) == needle) {
					src = src.substring(0, len - needle.length);
					img.attr("src", src);
				}
			}
		};
		
		if (PULI_UTILS.is_blogger_fullpage() === false)
		{
			var entries = jQuery("div.blog-posts div.post .entry-content-text");
		
			for (var e = 0; e < entries.length; e++)
			{
				var element = jQuery("<div></div>").html(entries.eq(e).text());
				iframes = element.find("iframe");
				
				for (var i = 0; i < iframes.length; i++)
				{
					var iframe = iframes.eq(i);
					PULI_UTILS.post.iframelazyload.create_iframe_filter(iframe);
				}
				
				imgs = element.find("img");
				filterImg(imgs);
				
				entries.eq(e).text(element.html());
			}	//for (var e = 0; e < entries.length; e++)
		}
		else
		{
			iframes = jQuery("div.post-body iframe");
			for (i = 0; i < iframes.length; i++)
			{
				iframe = iframes.eq(i);
				
				var src = iframe.attr("src");
				needle = "http://www.facebook.com/plugins/like.php";
				//alert([src, needle]);
				if (src.substr(0, needle.length) === needle) {
					continue;
				}
				
				PULI_UTILS.post.iframelazyload.create_iframe_filter(iframe);
			}
			
			imgs = jQuery("div.post-body img");
			filterImg(imgs);
		}
		
	},
	
	/**
	 * 將iframe替換成filter
	 * @param {Object} iframe
	 */
	create_iframe_filter: function (iframe) 
	{
		var src = iframe.attr("src");
			var width = iframe.attr("width");
			var height = iframe.attr("height");
			var frameborder = iframe.attr("frameborder");
			
			var link = src;
			if (link.length > 50)
			{
				link = link.substr(0, 50) + "...";
			}
			
			var iframeDiv = jQuery("<div><table><tbody><tr><td>請點此開啟內嵌網頁" + link + "</td></tr></tbody></table></div>")
				.addClass("iframe-div")
				.append("<input type='hidden' class='width' value='"+width+"' />")
				.append("<input type='hidden' class='height' value='"+height+"' />")
				.append("<input type='hidden' class='src' value='"+src+"' />")
				.append("<input type='hidden' class='frameborder' value='"+frameborder+"' />")
				.attr("onclick", "openIframeDiv(this)")
				.insertAfter(iframe);
			iframe.remove();
			
			iframeDiv.find("table:first").click(function () {
				PULI_UTILS.post.iframelazyload.open(this);
			});
		return iframeDiv;
	},
	
	/**
	 * 開啟iframe
	 * @param {Object} thisObj iframe本身
	 */
	open: function (thisObj) {
		var div = jQuery(thisObj);
		if (div.hasClass("iframe-div") === false) {
			div = div.parents(".iframe-div:first");
		}
		
		var src = div.find(".src").attr("value");
		var frameborder = div.find(".frameborder").attr("value");
		var width = div.find(".width").attr("value");
		var height = div.find(".height").attr("value");
		
		var iframe = jQuery("<iframe></iframe>")
			.insertAfter(div);
		div.remove();
		
		iframe.attr("src", src)
			.attr("frameborder", frameborder)
			.attr("width", width)
			.attr("height", height);
			
		return thisObj;
	}
};
