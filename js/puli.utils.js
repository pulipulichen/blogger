/**
 * PULI_UTILS
 * for Pulipuli.blogspot.tw
 * 
 * 「布丁布丁吃什麼？」專用工具箱
 */
if (typeof PULI_UTILS == "undefined") {
	PULI_UTILS = {};
}

/**
 * 記錄
 * 
 * @param {String} _title 標題
 * @param {String} _message 內文
 */
PULI_UTILS.log = function (_title, _message) {
	if (_message === undefined) {
		_message = _title;
		_title = null;
	}
	
	if (_title !== null) {
		_message = "[" + _title + "] " + _message;
	}
	
	_message = "[PULIPULI] " + _message;
	console.log(_message);
};
		
/**
 * 確認Blogger是否是全文網頁
 * @return {boolean}
 */
PULI_UTILS.is_blogger_fullpage = function()
{
	var href_array = location.href.split("/");
	//var href_array2 = location.href.split("\\");
	var _is_fulllpage = (href_array.length > 5 && href_array[4] != "label");
	var _is_file = href_array[0] != "file:";
	var _is_localhost = (href_array[2] == 'localhost');
	var _is_localhost_fullpage = (href_array[href_array.length-1] == 'fullpage.html');
	
	if (_is_localhost) {
		if (_is_localhost_fullpage) {
		return true;
	}
	else {
		return false;
	}
	}
	
	if (_is_fulllpage 
			&& _is_file) {
		//console.log('is_blogger_fullpage: true');
		return true;
	}
	else {
		//console.log('is_blogger_fullpage: false');
		return false;
	}
};

/**
 * 建立獨一無二的ID
 * @return {integer}
 */
PULI_UTILS.create_id = function () {
	return (new Date()).getTime() + '';
};

