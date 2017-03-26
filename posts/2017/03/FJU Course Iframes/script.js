var _process_file = function(_input, _callback) {
  
    var _url_title = $('#url_title').val();
    
    // -----------------------------
    
    // https://docs.google.com/document/d/1j_7ZEWzIUiwutXmmeAZlhH263IDzKvbL1V8Za3sP4ZI/edit?usp=sharing
    var _result = _url_title + "<br />\n";
    
    var _id = _input.substring(_input.indexOf("/d/")+3, _input.lastIndexOf("/edit?"));
    // https://docs.google.com/document/d/1j_7ZEWzIUiwutXmmeAZlhH263IDzKvbL1V8Za3sP4ZI/export?format=doc
    var _doc_url = "https://docs.google.com/document/d/" + _id + "/export?format=doc";
    _result = _result + '<a href="' + _doc_url + '" target="_blank">' + _doc_url + '</a>';
    
    $("#html_preview").html(_result);
    
    if (typeof(_callback) === "function") {
        _callback(_result);
    }
    //}, 1000);
        
};

var _output_filename_surffix="_output";


// -------------------------------------

var _load_file = function(evt) {
    //console.log(1);
    if(!window.FileReader) return; // Browser is not compatible

    var _panel = $(".file-process-framework");
    
    _panel.find(".loading").removeClass("hide");

    var reader = new FileReader();
    var _result;

    var _file_name = evt.target.files[0].name;
    
    reader.onload = function(evt) {
        if(evt.target.readyState !== 2) return;
        if(evt.target.error) {
            alert('Error while reading file');
            return;
        }

        //filecontent = evt.target.result;

        //document.forms['myform'].elements['text'].value = evt.target.result;
        _result =  evt.target.result;

        _process_file(_result, function (_result) {
            _panel.find(".preview").val(_result);
            _panel.find(".filename").val(_file_name);
                        
            $(".file-process-framework .myfile").val("");
            $(".file-process-framework .loading").addClass("hide");
            _panel.find(".display-result").show();
            _panel.find(".display-result .encoding").show();

            var _auto_download = (_panel.find('[name="autodownload"]:checked').length === 1);
            if (_auto_download === true) {
                _panel.find(".download-file").click();
            }
            
            //_download_file(_result, _file_name, "txt");
        });
    };

    var _pos = _file_name.lastIndexOf(".");
    _file_name = _file_name.substr(0, _pos)
        + _output_filename_surffix
        + _file_name.substring(_pos, _file_name.length);

    //console.log(_file_name);

    reader.readAsText(evt.target.files[0]);
};

var _load_textarea = function(evt) {
    var _panel = $(".file-process-framework");
    
    // --------------------------

    var _result = _panel.find(".input-mode.textarea").val();
    if (_result.trim() === "") {
        return;
    }

    // ---------------------------
    
    _panel.find(".loading").removeClass("hide");

    // ---------------------------
    var d = new Date();
    var utc = d.getTime() - (d.getTimezoneOffset() * 60000);
  
    var local = new Date(utc);
    var _file_name = local.toJSON().slice(0,19).replace(/:/g, "-");
    _file_name = "output_" + _file_name + ".txt";

    // ---------------------------

    _panel.find(".filename").val(_file_name);
    _process_file(_result, function (_result) {
        _panel.find(".preview").val(_result);

        _panel.find(".loading").addClass("hide");
        _panel.find(".display-result").show();
        _panel.find(".display-result .encoding").hide();

        var _auto_download = (_panel.find('[name="autodownload"]:checked').length === 1);
        if (_auto_download === true) {
            _panel.find(".download-file").click();
        }
    });
};

var _download_file_button = function () {
    var _panel = $(".file-process-framework");
    
    var _file_name = _panel.find(".filename").val();
    var _data = _panel.find(".preview").val();
    
    _download_file(_data, _file_name, "txt");
};


var _download_file = function (data, filename, type) {
    var a = document.createElement("a"),
        file = new Blob([data], {type: type});
    if (window.navigator.msSaveOrOpenBlob) // IE10+
        window.navigator.msSaveOrOpenBlob(file, filename);
    else { // Others
        var url = URL.createObjectURL(file);
        a.href = url;
        a.download = filename;
        document.body.appendChild(a);
        a.click();
        setTimeout(function() {
            document.body.removeChild(a);
            window.URL.revokeObjectURL(url);  
        }, 0); 
    }

}

$(function () {
  var _panel = $(".file-process-framework");
  _panel.find(".input-mode.textarea").click(_load_textarea).keyup(_load_textarea).click();
  _panel.find(".myfile").change(_load_file);
  _panel.find(".download-file").click(_download_file_button);
  
  $('.menu .item').tab();
});