settings.outformat = "pdf";

real h = 11 * 72;
real w = 8.5 * 72;
real fuselage = 1.25 * 72;
real winglet = 0.75 * 72;
real margin = 0.25 * 72;

pair page_min = (0, 0);
pair page_max = (w, h);
pen valley=linetype(new real[] {24, 16});
pen mountain=linetype(new real[] {24, 8, 2, 8, 2, 8});

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
        draw(clippath);
    }
}

addgraphic("",
    box((h/2 + margin, winglet + margin),
        (w - margin, h/2 - fuselage - margin)),
    90, scale=30, offset=(24, 0));

addgraphic("",
    box((h/2 + margin, h/2 + fuselage + margin),
        (w - margin, h - winglet - margin)),
    90, scale=100, offset=(24, 0));

draw(
    (h/2, 0) -- (0, h/2), p=valley,
    L=rotate(-45) * Label("1 (fold to center line)", position=Relative(0.33))
);
draw(
    (h/2, h) -- (0, h/2), p=valley,
    L=rotate(45) * Label("2 (fold to center line)", position=Relative(0.2),
    align=SE)
);

draw((0, h/2) -- (w, h/2), p=mountain, L=Label("4 (this side up)",
        position=Relative(0.75)));

draw((h/2, h/2 - fuselage) -- (w, h/2 - fuselage), p=valley,
        L=Label("5 (wing)"));
draw((h/2, h/2 + fuselage) -- (w, h/2 + fuselage), p=valley,
        L=Label("6 (wing)"));

draw((h/2, winglet) -- (w, winglet), p=mountain, L=Label("7"), align=N);
draw((h/2, h - winglet) -- (w, h - winglet), p=mountain,
        L=Label("8"));


pair open_top = (0.2 * h, (h/2 - fuselage));

label(
    rotate(90) *
    Label("\Large\shortstack{Open with\\this side up!\\Follow the arrow\\for
    instructions}"),
    open_top, align=S, filltype=Fill(white)
);

draw(open_top -- (open_top.x, h/2 - margin), arrow=Arrow);

pair instr_bot = (open_top.x, h/2 + fuselage);

label(
    rotate(90) *
    minipage("\textbf{The ``Boomer''}\par
    \emph{Designed by Alex Duan, Dec. 6, 2020}\par
    \begin{itemize}
    \item Fold along the 8 lines shown. Dashed lines are valley folds;
    dot-dashed are mountain folds.
    \item Hold near the front of the plane and throw gently.
    \item This plane flies pretty wild (like 2020), but if it dives or climbs
    too much, curl the back edge up or down to adjust.
    \end{itemize}", 3 inches),
    instr_bot, align=N, filltype=Fill(white)
);

clip(box(page_min + (.125, .125), page_max - (.125, .125)));
fixedscaling(page_min, page_max);

newpage();




addgraphic("", shift(w - h/2, 0) *
    ((margin * (1 + sqrt(2)), margin) -- (h/4, h/4 - margin * sqrt(2)) --
    (h/2 - margin * (1 + sqrt(2)), margin) -- cycle), 0,
    scale=-100, offset=(-45, 160));

addgraphic("", shift(w - h/2, 0) *
    ((margin * (1 + sqrt(2)), h - margin) -- (h/4, h - h/4 + margin * sqrt(2))
    -- (h/2 - margin * (1 + sqrt(2)), h - margin) -- cycle),
    90, offset=(-90, 0), scale=-120);

addgraphic("plane.jpg", ellipse((w - h/12, h/2), h/30, h/22), 90, scale=25,
offset=(8, 5));

path bigpath = (margin, winglet + margin)
    -- extension(
        (0, winglet + margin), (w, winglet + margin),
        (w - h/2, margin * sqrt(2)), (w - h/4 - margin * sqrt(2), h/4)
    ) -- extension(
        (w - h/2, margin * sqrt(2)), (w - h/4 - margin * sqrt(2), h/4),
        (w - h/4 - margin, 0), (w - h/4 - margin, h)
    ) -- (w - h/4 - margin, h/2 - fuselage - margin)
    -- (margin, h/2 - fuselage - margin) -- cycle;

addgraphic("",  bigpath,
    0, offset=(50, 70));
addgraphic("", reflect((0, h/2), (w, h/2)) * bigpath, 180, scale=-60);

// Center of fuselage messages
label(rotate(180) * Label(""),
    ((w - h/4) / 2, h/2 - fuselage/2));
label(rotate(180) * Label(""),
    ((w - h/4) / 2, h/2 + fuselage/2));

label("",
    (w - h/8, h/4 + margin), align=N);

label(rotate(180) *
    Label(""),
    (w - h/8, 3h/4 - margin), align=S);

draw((w - h/8, 3h/8) -- (w, 3h/8), p=valley, L=Label("2 (fold point"));
draw((w - h/8, 5h/8) -- (w, 5h/8), p=valley,
        L=rotate(180) * Label("to line 3)", align=N));

draw((w - h/4, h/4) -- (w, h/4), p=valley, L=Label("3"));
draw((w - h/4, 3h/4) -- (w, 3h/4), p=valley);

draw((w - h/4, h/2 - fuselage) -- (w - h/8, h/2 - fuselage), p=valley,
        L=Label("5"));
draw((w - h/4, h/2 + fuselage) -- (w - h/8, h/2 + fuselage), p=valley,
        L=Label("6"));
// draw((w - fuselage, 0) -- (w - fuselage, h/8), p=valley);
// draw((w - fuselage, h) -- (w - fuselage, 7h/8), p=valley);

// real wpos = w - h/2 + winglet;
// draw((wpos, 0) -- (wpos, winglet), p=mountain);
// draw((wpos, h) -- (wpos, h - winglet), p=mountain);



clip(box(page_min + (.125, .125), page_max - (.125, .125)));
fixedscaling(page_min, page_max);


