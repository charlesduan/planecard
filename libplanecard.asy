/*
 * Copyright 2020 Charles Duan. Please see LICENSE.txt.
 */
void addgraphic(string file, path clippath, int rotation, int scale=0, pair
offset=(0, 0)) {
    if (file != "") {
        picture pic = new picture;
        real wid = max(clippath).x - min(clippath).x;
        label(pic=pic,
            rotate(rotation) * graphic(file, format("width=%fbp", wid + scale)),
            min(clippath) - offset, NE);
        clip(pic, clippath);
        add(pic, (0, 0));
    } else {
        // draw(clippath); // If you want to see where the graphic would go
    }
}


