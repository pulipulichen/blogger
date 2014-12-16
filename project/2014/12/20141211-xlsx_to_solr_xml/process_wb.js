var rABS = typeof FileReader !== "undefined" && typeof FileReader.prototype !== "undefined" && typeof FileReader.prototype.readAsBinaryString !== "undefined";
if(!rABS) {
    document.getElementsByName("userabs")[0].disabled = true;
    document.getElementsByName("userabs")[0].checked = false;
}

var use_worker = typeof Worker !== 'undefined';
if(!use_worker) {
    document.getElementsByName("useworker")[0].disabled = true;
    document.getElementsByName("useworker")[0].checked = false;
}

var transferable = use_worker;
if(!transferable) {
    document.getElementsByName("xferable")[0].disabled = true;
    document.getElementsByName("xferable")[0].checked = false;
}

var wtf_mode = false;

function fixdata(data) {
    var o = "", l = 0, w = 10240;
    for(; l<data.byteLength/w; ++l) o+=String.fromCharCode.apply(null,new Uint8Array(data.slice(l*w,l*w+w)));
    o+=String.fromCharCode.apply(null, new Uint8Array(data.slice(l*w)));
    return o;
}

function ab2str(data) {
    var o = "", l = 0, w = 10240;
    for(; l<data.byteLength/w; ++l) o+=String.fromCharCode.apply(null,new Uint16Array(data.slice(l*w,l*w+w)));
    o+=String.fromCharCode.apply(null, new Uint16Array(data.slice(l*w)));
    return o;
}

function s2ab(s) {
    var b = new ArrayBuffer(s.length*2), v = new Uint16Array(b);
    for (var i=0; i != s.length; ++i) v[i] = s.charCodeAt(i);
    return [v, b];
}

function xlsxworker_noxfer(data, cb) {
    var worker = new Worker('./xlsxworker.js');
    worker.onmessage = function(e) {
        switch(e.data.t) {
            case 'ready': break;
            case 'e': console.error(e.data.d); break;
            case 'xlsx': cb(JSON.parse(e.data.d)); break;
        }
    };
    var arr = rABS ? data : btoa(fixdata(data));
    worker.postMessage({d:arr,b:rABS});
}

function xlsxworker_xfer(data, cb) {
    //var worker = new Worker(rABS ? './xlsxworker2.js' : './xlsxworker1.js');
    //var worker = new Worker(xlsxworker2);
    var worker = xlsxworker2;
    worker.onmessage = function(e) {
        switch(e.data.t) {
            case 'ready': break;
            case 'e': console.error(e.data.d); break;
            default: xx=ab2str(e.data).replace(/\n/g,"\\n").replace(/\r/g,"\\r"); console.log("done"); cb(JSON.parse(xx)); break;
        }
    };
    if(rABS) {
        var val = s2ab(data);
        worker.postMessage(val[1], [val[1]]);
    } else {
        worker.postMessage(data, [data]);
    }
}

function xlsxworker(data, cb) {
    transferable = document.getElementsByName("xferable")[0].checked;
    if(transferable) xlsxworker_xfer(data, cb);
    else xlsxworker_noxfer(data, cb);
}

function get_radio_value( radioName ) {
    var radios = document.getElementsByName( radioName );
    for( var i = 0; i < radios.length; i++ ) {
        if( radios[i].checked || radios.length === 1 ) {
            return radios[i].value;
        }
    }
}

function to_json(workbook) {
    var result = {};
    workbook.SheetNames.forEach(function(sheetName) {
        var roa = XLSX.utils.sheet_to_row_object_array(workbook.Sheets[sheetName]);
        if(roa.length > 0){
            result[sheetName] = roa;
        }
    });
    return result;
}

/**
 * [to_solr_xml description]
 * @author Pulipuli Chen 20141212
 * @param  {[type]} workbook [description]
 * @return {[type]}          [description]
 */
function to_solr_xml(workbook) {
    var result = [];
    var _split = document.getElementsByName( 'split_20141212' )[0].value;
    
    workbook.SheetNames.forEach(function(sheetName) {
        //var csv = XLSX.utils.sheet_to_csv(workbook.Sheets[sheetName]);
        var csv = XLSX.utils.sheet_to_solr_xml(workbook.Sheets[sheetName], {
            SPLIT: _split
        });
        if(csv.length > 0){
            //result.push("SHEET: " + sheetName);
            result.push("<add>");
            result.push("");
            result.push(csv);
            result.push("</add>");
        }
    });
    return result.join("\n");
}

/**
 * @author Pulipuli Chen 20141216
 * @param  {[type]} workbook [description]
 * @return {[type]}          [description]
 */
function csv_to_solr_xml(_csv_array) {
    _csv_array = _csv_array.data;
    var result = [];
    var SPLIT = document.getElementsByName( 'split_20141212' )[0].value;
    console.log(_csv_array);
    //console.log(_csv_array);
    var _fields = [];
    if(_csv_array.length > 0){
        result.push("<add>");
        var _first = true;
        //console.log(_csv_array[0]);
        for (var _j = 0; _j < _csv_array.length; _j++) {
            var _row_xml = "";
            var _row = _csv_array[_j];
            
            if (_first === true) {
                for (var _col in _row) {
                    _fields.push(_row[_col]);
                }
            }
            else {
                var _txt_first = true;
                for (var _k = 0; _k < _row.length; _k++) {
                    var _field = _fields[_k];
                    //console.log(_field);
                    var txt = _row[_k];
                    var _txt_first = true;
                    if (SPLIT !== undefined 
                            && txt.indexOf(SPLIT) > -1) {
                        var _txt_ary = txt.split(SPLIT);
                        for (var _i in _txt_ary) {
                            txt = _txt_ary[_i];	
                            txt = txt.trim();
                            if (txt === '') {
                                    continue;
                            }
                            txt = htmlEnDeCode_20141216.htmlEncode(txt);
                            txt = '\t\t<field name="' + _field + '">' + txt + '</field>\n';
                            
                            _row_xml += txt;
                        }
                    }
                    else {
                        if (txt.trim() === '') {
                            continue;
                        }
                        txt = htmlEnDeCode_20141216.htmlEncode(txt);
                        txt = '\t\t<field name="' + _field + '">' + txt + '</field>\n';
                        
                        _row_xml += txt;
                    }
                    _txt_first = false;
                }
                
                if (_row_xml !== "") {
                    _row_xml = '\t<doc>\n' + _row_xml + '\t</doc>';
                }
            }   //else {
            //console.log(_row_xml);
            result.push(_row_xml);
            _first = false;
        }
        result.push("</add>");
    }
    
    _utils_20141216.check_fields(_fields);
    return result.join("\n");
}

function to_csv(workbook) {
    var result = [];
    workbook.SheetNames.forEach(function(sheetName) {
        var csv = XLSX.utils.sheet_to_csv(workbook.Sheets[sheetName]);
        if(csv.length > 0){
            result.push("SHEET: " + sheetName);
            result.push("");
            result.push(csv);
        }
    });
    return result.join("\n");
}

function to_formulae(workbook) {
    var result = [];
    workbook.SheetNames.forEach(function(sheetName) {
        var formulae = XLSX.utils.get_formulae(workbook.Sheets[sheetName]);
        if(formulae.length > 0){
            result.push("SHEET: " + sheetName);
            result.push("");
            result.push(formulae.join("\n"));
        }
    });
    return result.join("\n");
}

var tarea = document.getElementById('b64data');
function b64it() {
    if(typeof console !== 'undefined') console.log("onload", new Date());
    var wb = XLSX.read(tarea.value, {type: 'base64',WTF:wtf_mode});
    process_wb(wb);
}

function process_wb(wb) {
    var output = "";
    switch(get_radio_value("format")) {
        case "solr_xml":
            output = to_solr_xml(wb);
            break;
        case "json":
            output = JSON.stringify(to_json(wb), 2, 2);
            break;
        case "form":
            output = to_formulae(wb);
            break;
        default:
            output = to_csv(wb);
    }
    process_wb_output(output)
}

var _utils_20141216 = {
    check_fields: function (_fields) {
        //console.log(_fields);
        var _has_id = false;
        var _has_title = false;
        for (var _i in _fields) {
            var _field = _fields[_i];
            if (_field === "id") _has_id = true;
            if (_field === "title") _has_title = true;
        }
        
        if (_has_id === false || _has_title === false) {
            var _msg = 'You must have "id" and "title" fields.';
            alert(_msg);
            throw _msg;
        }
    }
};

function process_wb_output(output) {
    var out = document.getElementById('out_20141212');
    var textarea = document.getElementById('out_20141212_textarea');
    
    if(out.innerText === undefined) out.textContent = output;
    else out.innerText = output;

    textarea.value = output;
    //if(textarea.innerText === undefined) textarea.textContent = output;
    //else textarea.innerText = output;

    if(typeof console !== 'undefined') console.log("output", new Date());

    document.getElementById('solr_xml_20141212_output').style.display = 'block';
    document.getElementById('solr_xml_20141212_form').style.display = 'none';
}

var drop = document.getElementById('drop');
function handleDrop(e) {
    e.stopPropagation();
    e.preventDefault();
    rABS = document.getElementsByName("userabs")[0].checked;
    use_worker = document.getElementsByName("useworker")[0].checked;
    var files = e.dataTransfer.files;
    var i,f;
    for (i = 0, f = files[i]; i != files.length; ++i) {
        var reader = new FileReader();
        var name = f.name;
        
        if (name.substring(name.length - 4, name.length) !== ".csv") {
            reader.onload = function(e) {
                if(typeof console !== 'undefined') console.log("onload", new Date(), rABS, use_worker);
                var data = e.target.result;

                if(use_worker) {
                    xlsxworker(data, process_wb);
                } else {
                    var wb;
                    if(rABS) {
                        wb = XLSX.read(data, {type: 'binary'});
                    } else {
                    var arr = fixdata(data);
                        wb = XLSX.read(btoa(arr), {type: 'base64'});
                    }
                    process_wb(wb);
                }
            };  //reader.onload = function(e) {

            if(rABS) reader.readAsBinaryString(f);
            else reader.readAsArrayBuffer(f);
        }
        else {
        //if (name.substring(name.length - 4, name.length) !== ".csv") {
            reader.readAsText(f, 'UTF-8');
            
            reader.onload = function(e) {
                var data = e.target.result;
                //console.log(f);
                var results = Papa.parse(data);
                results = csv_to_solr_xml(results);
                //console.log(results);
                process_wb_output(results);
            }
                
         }
    }
}

function handleDragover(e) {
    e.stopPropagation();
    e.preventDefault();
    e.dataTransfer.dropEffect = 'copy';
}

if(drop.addEventListener) {
    drop.addEventListener('dragenter', handleDragover, false);
    drop.addEventListener('dragover', handleDragover, false);
    drop.addEventListener('drop', handleDrop, false);
}


var xlf = document.getElementById('xlf');
function handleFile(e) {
    rABS = document.getElementsByName("userabs")[0].checked;
    use_worker = document.getElementsByName("useworker")[0].checked;
    var files = e.target.files;
    var i,f;
    for (i = 0, f = files[i]; i != files.length; ++i) {
        var name = f.name;
        var reader = new FileReader();
        
        if (name.substring(name.length - 4, name.length) !== ".csv") {
            reader.onload = function(e) {
                if(typeof console !== 'undefined') console.log("onload", new Date(), rABS, use_worker);
                var data = e.target.result;
                if(use_worker) {
                    xlsxworker(data, process_wb);
                } else {
                    var wb;
                    if(rABS) {
                        wb = XLSX.read(data, {type: 'binary'});
                    } else {
                    var arr = fixdata(data);
                        wb = XLSX.read(btoa(arr), {type: 'base64'});
                    }
                    process_wb(wb);
                }
            };
            if(rABS) reader.readAsBinaryString(f);
            else reader.readAsArrayBuffer(f);
        }
        else {
            reader.readAsText(f, 'UTF-8');
            
            reader.onload = function(e) {
                var data = e.target.result;
                //console.log(f);
                var results = Papa.parse(data);
                results = csv_to_solr_xml(results);
                //console.log(results);
                process_wb_output(results);
            }
                
         }
    }
}

function reset_upload() {
    document.getElementById('solr_xml_20141212_output').style.display = 'none';
    document.getElementById('solr_xml_20141212_form').style.display = 'block';
}

function value_to_download(_output_id) {
    var _value = document.getElementById(_output_id).innerText;
    window.open("data:text/xml;charset=utf-8," + encodeURIComponent(_value));
}

if(xlf.addEventListener) xlf.addEventListener('change', handleFile, false);