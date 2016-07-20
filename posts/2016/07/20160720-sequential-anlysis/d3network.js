
var d3network = function (_config) {
    
    
    var width = _config.width;
    var height = _config.height;
    var _linkDistance = _config.linkDistance;
    
    var links = _config.links;
    var nodes = {};

    var _strokeWidths = [];
    var _stdStrokeWidths = [];

    // Compute the distinct nodes from the links.
    links.forEach(function (link) {
        link.source = nodes[link.source] ||
                (nodes[link.source] = {name: link.source});
        link.target = nodes[link.target] ||
                (nodes[link.target] = {name: link.target});
        link.value = +link.value;
        //console.log(link.value);
        
        _strokeWidths.push(link.value);
    });
    
    // -----------------------------------------
    //console.log(_strokeWidths);
    var _maxStrokeWidth, _minStrokeWidth;
    if (_strokeWidths.length > 0) {
        _maxStrokeWidth = _strokeWidths[0];
        _minStrokeWidth = _strokeWidths[0];
    }
    for (var _i = 1; _i < _strokeWidths.length; _i++) {
        //console.log(_i);
        if (_strokeWidths[_i] > _maxStrokeWidth) {
            _maxStrokeWidth = _strokeWidths[_i];
        }
        if (_strokeWidths[_i] < _minStrokeWidth) {
            _minStrokeWidth = _strokeWidths[_i];
        }
    }
    var _intervalStrokeWidth = _maxStrokeWidth - _minStrokeWidth;
    //console.log(_intervalStrokeWidth);
    if (_intervalStrokeWidth > 0) {
        // 標準化
        var _setMaxStrokeWidth = _config.maxStrokeWidth;
        var _setMinStrokeWidth = _config.minStrokeWidth;
        var _setIntervalStrokeWidth = _setMaxStrokeWidth - _setMinStrokeWidth;
        //console.log(_setIntervalStrokeWidth);
        for (var _i = 0; _i < _strokeWidths.length; _i++) {
            var _s = _strokeWidths[_i];
            _s = (_s - _minStrokeWidth) / _intervalStrokeWidth * _setIntervalStrokeWidth + _setMinStrokeWidth;
            _stdStrokeWidths[_i] = _s;
            // 2-5
            // 1-3
        }
        
        //console.log(_strokeWidths);
    }
    
    // -----------------------------------------
    
    var force = d3.layout.force()
            .nodes(d3.values(nodes))
            .links(links)
            .size([width, height])
            .linkDistance(_linkDistance)
            .charge(-200)
            .on("tick", tick)
            .start();

    var svg = d3.select("body").append("svg")
            .attr("width", width)
            .attr("height", height);

    var link = svg.selectAll(".link")
            .data(force.links())
            .enter()
            .append("line")
            .attr("class", "link");
    
    var _i = 0;
    link[0].forEach(function (_l) {
        //_l.css("stroke-width", "10px");
        
        //var _value = links[_i].value;
        var _value = _stdStrokeWidths[_i];
        
        //console.log(_value);
        if (typeof(_value) === "number") {
            //_value = _value / 10;
            link[0][_i].style.strokeWidth = _value + "px";
        }        
        _i++;
    });
    
    // ------------------------
    
    var node = svg.selectAll(".node")
            .data(force.nodes())
            .enter().append("g")
            .attr("class", "node")
            .on("mouseover", mouseover)
            .on("mouseout", mouseout)
            .on("click", click)
            .on("dblclick", dblclick)
            .call(force.drag);

    node.append("circle")
            .attr("r", 8)
            .style("fill", "#3182bd");

    node.append("text")
            .attr("x", 12)
            .attr("dy", ".35em")
            .style("fill", "#3182bd")
            .text(function (d) {
                return d.name;
            });

    function tick() {
        link
                .attr("x1", function (d) {
                    return d.source.x;
                })
                .attr("y1", function (d) {
                    return d.source.y;
                })
                .attr("x2", function (d) {
                    return d.target.x;
                })
                .attr("y2", function (d) {
                    return d.target.y;
                });
        
        node.attr("transform", function (d) {
            return "translate(" + d.x + "," + d.y + ")";
        });
    }

    function mouseover() {
        d3.select(this).select("circle").transition()
                .duration(750)
                .attr("r", 16);
    }

    function mouseout() {
        d3.select(this).select("circle").transition()
                .duration(750)
                .attr("r", 8);
    }
// action to take on mouse click
    function click() {
        d3.select(this).select("text").transition()
                .duration(750)
                .attr("x", 22)
                .style("stroke-width", ".5px")
                .style("opacity", 1)
                .style("fill", "#E34A33")
                .style("font", "17.5px serif");
        d3.select(this).select("circle").transition()
                .duration(750)
                .style("fill", "#E34A33")
                .attr("r", 16)
    }

// action to take on mouse double click
    function dblclick() {
        d3.select(this).select("circle").transition()
                .duration(750)
                .attr("r", 6)
                .style("fill", "#E34A33");
        d3.select(this).select("text").transition()
                .duration(750)
                .attr("x", 12)
                .style("stroke", "none")
                .style("fill", "#E34A33")
                .style("stroke", "none")
                .style("opacity", 0.6)
                .style("font", "7px serif");
    }
};