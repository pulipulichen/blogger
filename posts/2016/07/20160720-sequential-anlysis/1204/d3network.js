function d3network(config) {

// get the data
//d3.csv("force.csv", function(error, links) {


    var nodes = {};
    var links = config.links

// Compute the distinct nodes from the links.
    links.forEach(function (link) {
        link.source = nodes[link.source] ||
                (nodes[link.source] = {name: link.source});
        link.target = nodes[link.target] ||
                (nodes[link.target] = {name: link.target});
        link.value = +link.value;
    });

    var width = 960,
            height = 500;

    var force = d3.layout.force()
            .nodes(d3.values(nodes))
            .links(links)
            .size([width, height])
            .linkDistance(150)
            .charge(-300)
            .on("tick", tick)
            .start();

    var svg = d3.select("body").append("svg")
            .attr("width", width)
            .attr("height", height);

// build the arrow.
    svg.append("svg:defs").selectAll("marker")
            .data(["end"])      // Different link/path types can be defined here
            .enter().append("svg:marker")    // This section adds in the arrows
            .attr("id", String)
            .attr("viewBox", "0 -5 10 10")
            .attr("refX", 15)
            .attr("refY", -1.5)
            .attr("markerWidth", 6)
            .attr("markerHeight", 6)
            .attr("orient", "auto")
            .append("svg:path")
            .attr("d", "M0,-5L10,0L0,5");

// add the links and the arrows
    var pg = svg.append("svg:g").selectAll("path")
            .data(force.links())
            .enter().append("g");

    var path = pg.append("path")
            .attr("class", "link")
            .attr("marker-end", "url(#end)");

    var text = pg.append("text")
            .text(function (d, i) {
                //console.log(d);
                return d.label;
            })
            .style("fill", "black");
//text[0][1].innerText = "布丁布丁布丁布丁布丁布丁布丁布丁布丁布丁";

// define the nodes
    var node = svg.selectAll(".node")
            .data(force.nodes())
            .enter().append("g")
            .attr("class", "node")
            .call(force.drag);

// add the nodes
    node.append("circle")
            .attr("r", 5);

// add the text 
    node.append("text")
            .attr("x", 12)
            .attr("dy", ".35em")
            .text(function (d) {
                return d.name;
            });

// add the curvy lines
    function tick() {
        path.attr("d", function (d) {
            var dx = d.target.x - d.source.x,
                    dy = d.target.y - d.source.y,
                    dr = Math.sqrt(dx * dx + dy * dy);
            return "M" +
                    d.source.x + "," +
                    d.source.y + "A" +
                    dr + "," + dr + " 0 0,1 " +
                    d.target.x + "," +
                    d.target.y;
        });

        text.attr("transform", function (d) {
            x = ((d.source.x - d.target.x) / 3 + d.target.x);
            y = ((d.source.y - d.target.y) / 3 + d.target.y);
            // 8
            if (d.source.x === d.target.x && d.source.y > d.target.y) {
                x = x - 30;
            }
            // 9
            else if (d.source.x < d.target.x && d.source.y > d.target.y) {
                x = x - 30;
                y = y - 30;
            }
            // 6
            else if (d.source.x < d.target.x && d.source.y === d.target.y) {
                //x = x - 30;
                y = y - 30;
            }
            // 3
            else if (d.source.x < d.target.x && d.source.y < d.target.y) {
                x = x + 30;
                y = y - 10;
            }
            // 2
            else if (d.source.x === d.target.x && d.source.y < d.target.y) {
                x = x + 30;
                //y = y - 30;
            }
            // 1
            else if (d.source.x > d.target.x && d.source.y < d.target.y) {
                x = x + 30;
                y = y + 30;
            }
            // 4
            else if (d.source.x > d.target.x && d.source.y === d.target.y) {
                //x = x + 30;
                y = y + 30;
            }
            // 7
            else if (d.source.x > d.target.x && d.source.y > d.target.y) {
                x = x - 30;
                y = y + 30;
            }

            return "translate(" + x + "," + y + ")";
        });

        node
                .attr("transform", function (d) {
                    return "translate(" + d.x + "," + d.y + ")";
                });
    }

//});

}