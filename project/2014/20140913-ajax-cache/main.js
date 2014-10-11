var ajax_cache_schema = {
  name: 'ajax_cache',
  keyPath: 'url', // optional, 
  autoIncrement: true, // optional. 
  indexes: [
    {
      name: 'data', // optional
    },
    {
      name: 'time', // optional  
    }]
};
var _schema = {
  stores: [ajax_cache_schema]
};

genUrls = function(n) {
  var out = [];
  for (var i = 0; i < n; i++) {
      var _int = parseInt(Math.random() * 10);
    out[i] = {
      url: "/"+_int,
      data: "p"+_int+"@gmail.com",
      time: (new Date()).getTime()
    };
  }
  return out;
};

var _db_name = "PULI_UTILS"
var _schema_name = "ajax_cache";
_db = new ydn.db.Storage(_db_name, _schema);
var _urls = genUrls(1);
console.log("url:" + JSON.stringify(_urls));
//console.log(authors.length);
//_db.put(_schema_name, _urls)
//        .then(
//  function(ids) {
//    console.log(ids.length + ' authors put.');
//  }, function(e) {
//    console.log(e.message || e);
//  }
//);
_db.put(_schema_name, _urls);

_db.count(_schema_name).done(function(x) {
  console.log('Number of URLs: ' + x);
});

_db.from(_schema_name)
        .order("time")
        .list().done(function(_records) {
    for (var _i in _records) {
        console.log(_records[_i]);
    }
});

////var _db_name = "PULI_UTILS";
//var _store_name = "ajax_cache";
//
//var author_store_schema = {
//  name: 'author',
//  keyPath: 'email', // optional, 
//  autoIncrement: false, // optional. 
//  indexes: [
//    {
//      name: 'born', // optional
//      keyPath: 'born',
//      unique: false, // optional, default to false
//      multiEntry: false // optional, default to false
//    }, {
//      name: 'company'
//    }, {
//      name: 'hobby',
//      multiEntry: true
//    }
//  ] // optional, list of index schema as array.
//};
//schema = {
//  stores: [author_store_schema]
//};
//
//var db = new ydn.db.Storage(_db_name, schema);
//var _url = "data3.php?callback=?";
//var _data = [{
//      url: _url
//    , data: "This is a test  data"
//    , time: (new Date()).getTime()
//}];
//db.put(_store_name, _data);
////db.get(_store_name, _url).always(function(record) {
////  console.log(record);
////});
//db.from(_store_name)
//        .order('time')
//        .list()
//        .always(function(records) {
//  console.log(records);
//});       
//
//db.count(_store_name).done(function(results) {
//  console.log(results);
//}, function(e) {
//  throw e;
//});
//
//$(function () {
//    //alert(1212);
//    $P.ajax_cache.getJSON("data.php?callback=?", function (_data) {
//        //alert(_data);
//    });
//});

