function pulipuli_related_results_labels_thumbs(e) {
    //console.log(e);
    if (typeof(e.feed.entry) === "undefined") {
        $("#related-posts").hide();
        return;
    }

    for (var t = 0; t < e.feed.entry.length; t++) {
        var n = e.feed.entry[t];
        relatedTitles[relatedTitlesNum] = n.title.$t;
        try {
            thumburl[relatedTitlesNum] = n.media$thumbnail.url
        } catch (r) {
            s = n.content.$t;
            a = s.indexOf("<img");
            b = s.indexOf('src="', a);
            c = s.indexOf('"', b + 5);
            d = s.substr(b + 5, c - b - 5);
            if (a != -1 && b != -1 && c != -1 && d != "") {
                thumburl[relatedTitlesNum] = d
            } else {
                if (typeof defaultnoimage !== "undefined")
                    thumburl[relatedTitlesNum] = defaultnoimage;
                else
                    thumburl[relatedTitlesNum] = ""
            }
        }
        if (relatedTitles[relatedTitlesNum].length > 60)
            relatedTitles[relatedTitlesNum] = relatedTitles[relatedTitlesNum].substring(0, 60) + "...";
        for (var i = 0; i < n.link.length; i++) {
            if (n.link[i].rel == "alternate") {
                relatedUrls[relatedTitlesNum] = n.link[i].href;
                relatedTitlesNum++
            }
        }
    }
}
