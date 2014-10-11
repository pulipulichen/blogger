if (typeof($P) === "undefined") {
    $P = {};
}

if (typeof($P.ajax_cache) === "undefined") {
    $P.ajax_cache = {};
}

$P.ajax_cache.getJSON = function (_url, _callback) {
    
    var _cb = function (_data) {
        if (typeof (_callback) === "function") {
            _callback(_data);
        }
    };
    
    $.getJSON(_url, _cb);
    return this;
};