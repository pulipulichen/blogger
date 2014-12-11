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
    var out = document.getElementById('out_20141212');
    if(out.innerText === undefined) out.textContent = output;
    else out.innerText = output;
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
        var reader = new FileReader();
        var name = f.name;
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