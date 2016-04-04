(function( $ ){
	$.fn.qrcode = function(options) {
		var _title;
		
		//判斷來源是text有無文字
		
		//加上框線設計
		
		// if options is null
		if ( options === undefined) {
			_title = null;
			if ($('head title').length > 0) {
				_title = $('head title').text();
			}
			
			options = {
				title: _title,
				text: location.href
			};
			
		}
		// if options is string, 
		if( typeof options === 'string' ){
			options	= { text: options };	
		}

		// set default values
		// typeNumber < 1 for automatic calculation
		options	= $.extend( {}, {
			title_max	: null,
			title_width : null,
			render		: "canvas",
			width		: 256,
			height		: 256,
			typeNumber	: -1,
			correctLevel	: QRErrorCorrectLevel.H,
                        background      : "#ffffff",
                        foreground      : "#000000"
		}, options);
		
		if (options.text === undefined) {
			options.text = location.href;
		}
		if (options.title === undefined) {
			if (typeof options.text == 'string'
				&& options.text.substr(0, 3) == '<a ') {
				var _a = $(options.text);
				
				if (_a.hasAttr('href')) {
					options.title = _a.text();
					options.text = _a.attr('href');
				}
			}
			
			if (options.title === undefined) {
				options.title = $('head title').text();
			}
		}
		
		/*
		_title = options.title;
		var _text = options.text;
		
		if ((_title === null || _title === undefined) 
			&& (typeof _text == 'string') 
			&& _text.substr(0, 3) == '<a ') {
			var _a = $(_text);
			
			_title = _text.text();
			_text = _text.attr('href');
			
			options.title = _title;
			options.text = _text;
		}
		else if (_title == null && _text === null) {
			
			if ($('head title').length > 0) {
				_title = $('head title').text();
			}
			
			options.title = _title;
			options.text = location.href;
		}
		*/
		
		//PULI_UTILS.log(typeof options.title);
		
		
		if (options.title_max !== null && options.title_max !== undefined
			&& options.title !== null && options.title !== undefined
			&& options.title.length > options.title_max) {
			options.title = options.title.substr(0, options.title_max) + '...'; 
		}
		
		/**
		 * 以上參數設定完畢
		 */

		var createCanvas	= function(){
			// create the qrcode itself
			var qrcode	= new QRCode(options.typeNumber, options.correctLevel);
			qrcode.addData(options.text);
			qrcode.make();

			// create canvas element
			var canvas	= document.createElement('canvas');
			canvas.width	= options.width;
			canvas.height	= options.height;
			var ctx		= canvas.getContext('2d');

			// compute tileW/tileH based on options.width/options.height
			var tileW	= options.width  / qrcode.getModuleCount();
			var tileH	= options.height / qrcode.getModuleCount();

			// draw in the canvas
			for( var row = 0; row < qrcode.getModuleCount(); row++ ){
				for( var col = 0; col < qrcode.getModuleCount(); col++ ){
					ctx.fillStyle = qrcode.isDark(row, col) ? options.foreground : options.background;
					var w = (Math.ceil((col+1)*tileW) - Math.floor(col*tileW));
					var h = (Math.ceil((row+1)*tileW) - Math.floor(row*tileW));
					ctx.fillRect(Math.round(col*tileW),Math.round(row*tileH), w, h);  
				}	
			}
			// return just built canvas
			return canvas;
		};

		// from Jon-Carlos Rivera (https://github.com/imbcmdth)
		var createTable	= function(){
			// create the qrcode itself
			var qrcode	= new QRCode(options.typeNumber, options.correctLevel);
			qrcode.addData(options.text);
			qrcode.make();
			
			// create table element
			var $table	= $('<table></table>')
				.css("width", options.width+"px")
				.css("height", options.height+"px")
				.css("border", "0px")
				.css("border-collapse", "collapse")
				.css('background-color', options.background);
		  
			// compute tileS percentage
			var tileW	= options.width / qrcode.getModuleCount();
			var tileH	= options.height / qrcode.getModuleCount();

			// draw in the table
			for(var row = 0; row < qrcode.getModuleCount(); row++ ){
				var $row = $('<tr></tr>').css('height', tileH+"px").appendTo($table);
				
				for(var col = 0; col < qrcode.getModuleCount(); col++ ){
					$('<td></td>')
						.css('width', tileW+"px")
						.css('background-color', qrcode.isDark(row, col) ? options.foreground : options.background)
						.appendTo($row);
				}	
			}
			
			// return just built canvas
			return $table;
		};
  

		var _title_display = options.title;
		_title_display = '<a href="'+options.text+'">'+options.title+'</a>';
		var _title_width = options.title_width;
		if (_title_width === null) {
			_title_width = options.width;
		}	
		
		return this.each(function(){
			var element	= options.render == "canvas" ? createCanvas() : createTable();
			$(element).appendTo(this);
			
			
			if (options.title !== null && options.title !== '') {
				var $title = $('<div class="title" style="width:'+_title_width+'px;">'+_title_display+'</div>');
				$title.appendTo(this);
			}
			
		});
	};
})( jQuery );
