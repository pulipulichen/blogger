d3network({
    links: [
        {"source": "A", "target": "C", value: 1},
        {"source": "A", "target": "D", value: 2.35},
        {"source": "A", "target": "J", value: 4.5},
        {"source": "B", "target": "E", value: 1},
        {"source": "B", "target": "F", value: 2},
        {"source": "C", "target": "G", value: 1},
        {"source": "C", "target": "H", value: 4},
        {"source": "D", "target": "I", value: 1}
    ],
    width: 400,
    height: 250,
    linkDistance: 50,
    minStrokeWidth: 1,
    maxStrokeWidth: 5
});