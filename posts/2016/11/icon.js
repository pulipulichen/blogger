(function () {
    var _getQueryVariable = function (variable) {
        var query = window.location.search.substring(1);
        var vars = query.split("&");
        for (var i=0;i<vars.length;i++) {
          var pair = vars[i].split("=");
          if (pair[0] === variable) {
            return pair[1];
          }
        }
    };
    
    if (ICON === undefined) {
        return;
    }
    
    var _icon = ICON;
    if (_icon !== undefined) {
        $("head link[rel='icon']").remove();
        $("head link[rel='shortcut icon']").remove();
        $("head link[rel='apple-touch-icon']").remove();
        $("head").append('<link rel="shortcut icon" href="'+_icon+'" type="image/' + _icon.substr(_icon.lastIndexOf('.')+1) + '" size="192x192" />');
    }
})();