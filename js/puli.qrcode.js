 /**
  * 檢查PULI_UTILS是否存在
  */
 if (typeof PULI_UTILS == "undefined") {
 	PULI_UTILS = {};
 }

/**
 * 「布丁布丁吃什麼？」專用
 * 設置QR Code的功能
 * 
 * @see QRCode
 */
 PULI_UTILS.qrcode = {
 	setup: function (_options) {
		if (_options === undefined) {
			_options = {};
		}
		
		_options	= $.extend( {}, {
			container	: '.post.hentry',
			width		: 80,
			height		: 80,
			title_width : "auto",
			footer: "布丁布丁吃什麼？ <img src='http://pulipuli.blogspot.tw/favicon.ico' /> <br /> <a class='link' href='http://pulipuli.blgospot.tw/'>http://pulipuli.blogspot.tw/</a>"
		}, _options);
		
		var _containers = $(_options.container);
		
		//PULI_UTILS.log('_containers', _containers.length);
		
		var _setup = function (_container) {
			var _a = _container.find('h3:first a:first');
			var _h3 = _container.find('h3:first');
			if (_a.length > 0) {
				_options.text = _a.attr("href");
				_options.title = _a.text();
			}
			else if (_h3.length > 0) {
				_options.title = _h3.text();
			}
			
			var _qrcode_div = $('<div></div>')
				.addClass('qrcode')
				.appendTo(_container);
			_qrcode_div.qrcode(_options);
			
			var _footer = $('<div></div>')
				.html(_options.footer)
				.addClass('footer')
				.appendTo(_qrcode_div);
		};
		
		if (_containers.length > 1) {
			_containers.each(function(_i, _container) {
				_container = $(_container);
				_setup(_container);
			});	//_containers.each(function(_i, _contrainer) {
		}
		else if (_containers.length == 1) {
			_setup(_containers);
		}
			
	}
 };
