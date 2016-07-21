
var config = {};

// @var 使用箭頭 true || false
config.enableDirection = true;

config.canvasWidth = 960;
config.canvasHeight = 960;

config.strokeWidthMax = 0.3;
config.strokeWidthMin = 0.1;
config.arrowMaxSize = 0.2;
config.arrowDefaultSize = 12;
config.linkDistance = 150;

config.nodeR = 10;


config.links = [
    {
        "source":"Harry",
        "target":"Sally",
        targetClick: function () {
            //alert("clickTarget");
        },
        sourceClick: function () {
            //alert("clickSource");
        },
        "value":1.2, 
        label: "h>s", 
        linkClick: function () {
            //console.log("aaa");
            //alert("aaa");
        }
    },
    {"source":"Sally","target":"Harry","value":1, label: ""},
    {"source":"Harry","target":"Mario","value":1.3},
    {"source":"Sarah","target":"Alice","value":0.2},
    {"source":"Eveie","target":"Alice","value":0.5},
    {"source":"Peter","target":"Alice","value":1.6},
    {"source":"Mario","target":"Alice","value":0.4},
    {"source":"James","target":"Alice","value":0.6},
    {"source":"Harry","target":"Carol","value":0.7},
    {"source":"Harry","target":"Nicky","value":0.8},
    {"source":"Bobby","target":"Frank","value":0.8},
    {"source":"Alice","target":"Mario","value":0.7},
    {"source":"Harry","target":"Lynne","value":0.5},
    {"source":"Sarah","target":"James","value":1.9},
    {"source":"Roger","target":"James","value":1.1},
    {"source":"Maddy","target":"James","value":0.3},
    {"source":"Sonny","target":"Roger","value":0.5},
    {"source":"James","target":"Roger","value":1.5},
    {"source":"Alice","target":"Peter","value":1.1},
    {"source":"Johan","target":"Peter","value":1.6},
    {"source":"Alice","target":"Eveie","value":0.5},
    {"source":"Harry","target":"Eveie","value":0.1},
    {"source":"Eveie","target":"Harry","value":2.0},
    {"source":"Henry","target":"Mikey","value":0.4},
    {"source":"Elric","target":"Mikey","value":0.6},
    {"source":"James","target":"Sarah","value":1.5},
    {"source":"Alice","target":"Sarah","value":0.6},
    {"source":"James","target":"Maddy","value":0.5},
    {"source":"Peter","target":"Johan","value":0.7}
];

config.links = [
    {"source":"C","target":"B","value":3.1, label: "3.1"},
    {"source":"B","target":"C","value":13.58, label: "13.58"},
    //{"source":"B","target":"D","value":2.05, label: "2.05"},
    //{"source":"D","target":"B","value":8.96, label: "8.96"},
    //{"source":"C","target":"D","value":5.53, label: "5.53"}
];