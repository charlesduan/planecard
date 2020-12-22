/*
 * Copyright 2020 Charles Duan. Please see LICENSE.txt.
 */
settings.outformat = "pdf";

pen valley = linetype(new real[] {24, 16});
pen mountain = linetype(new real[] {24, 8, 2, 8, 2, 8});

bottom_graphics(
    box((h/2 + margin, winglet + margin),
        (w - margin, h/2 - fuselage - margin)),
    box((h/2 + margin, h/2 + fuselage + margin),
        (w - margin, h - winglet - margin))
);

draw(
    (h/2, 0) -- (0, h/2), p=valley,
    L=rotate(-45) * Label("1 (fold to center line)", position=Relative(0.33))
);
draw(
    (h/2, h) -- (0, h/2), p=valley,
    L=rotate(45) * Label("2 (fold to center line)", position=Relative(0.2),
    align=SE)
);

draw((0, h/2) -- (w, h/2), p=mountain, L=Label("5 (this side up)",
        position=Relative(0.75)));

draw((h/2, h/2 - fuselage) -- (w, h/2 - fuselage), p=valley,
        L=Label("5 (wing)"));
draw((h/2, h/2 + fuselage) -- (w, h/2 + fuselage), p=valley,
        L=Label("6 (wing)"));

draw((h/2, winglet) -- (w, winglet), p=mountain, L=Label("8"), align=N);
draw((h/2, h - winglet) -- (w, h - winglet), p=mountain,
        L=Label("9 (nine)"));


//
// Instructions
//
pair open_top = (0.2 * h, (h/2 - fuselage));
outside_instructions(open_top);
draw(open_top -- (open_top.x, h/2 - margin), arrow=Arrow);
inside_instructions((open_top.x, h/2 + fuselage));


//
// Ship out the page
//
clip(box((0, 0), (w, h)));
fixedscaling((0, 0), (w, h));

newpage();

imprint((h/30, h/22), (w - h/8, h/4 + margin), (w - h/8, 3h/4 - margin));

wing_graphics(
    shift(w - h/2, 0) *
        ((margin * (1 + sqrt(2)), margin) -- (h/4, h/4 - margin * sqrt(2)) --
        (h/2 - margin * (1 + sqrt(2)), margin) -- cycle),
    shift(w - h/2, 0) *
        ((margin * (1 + sqrt(2)), h - margin)
        -- (h/4, h - h/4 + margin * sqrt(2))
        -- (h/2 - margin * (1 + sqrt(2)), h - margin) -- cycle)
);

path bigpath = (margin, winglet + margin)
    -- extension(
        (0, winglet + margin), (w, winglet + margin),
        (w - h/2, margin * sqrt(2)), (w - h/4 - margin * sqrt(2), h/4)
    ) -- extension(
        (w - h/2, margin * sqrt(2)), (w - h/4 - margin * sqrt(2), h/4),
        (w - h/4 - margin, 0), (w - h/4 - margin, h)
    ) -- (w - h/4 - margin, h/2 - fuselage - margin)
    -- (margin, h/2 - fuselage - margin) -- cycle;

top_graphics(bigpath, reflect((0, h/2), (w, h/2)) * bigpath);

// Center of fuselage messages
fuselage_text(
    ((w - h/4) / 2, h/2 - fuselage/2),
    ((w - h/4) / 2, h/2 + fuselage/2)
);

label("",
    (w - h/8, h/4 + margin), align=N);

label(rotate(180) *
    Label(""),
    (w - h/8, 3h/4 - margin), align=S);

draw((w - h/8, 3h/8) -- (w, 3h/8), p=valley, L=Label("3 (fold point"));
draw((w - h/8, 5h/8) -- (w, 5h/8), p=valley,
        L=rotate(180) * Label("to line 4)", align=N));

draw((w - h/4, h/4) -- (w, h/4), p=valley, L=Label("4"));
draw((w - h/4, 3h/4) -- (w, 3h/4), p=valley);

draw((w - h/4, h/2 - fuselage) -- (w - h/8, h/2 - fuselage), p=valley,
        L=Label("6"));
draw((w - h/4, h/2 + fuselage) -- (w - h/8, h/2 + fuselage), p=valley,
        L=Label("7"));

clip(box((0, 0), (w, h)));
fixedscaling((0, 0), (w, h));


