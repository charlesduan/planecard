/*
 * Copyright 2020 Charles Duan. Please see LICENSE.txt.
 */
real h = 11 * 72;
real w = 8.5 * 72;
real fuselage = 1.25 * 72;
real winglet = 0.75 * 72;
real margin = 0.25 * 72;

include libplanecard;

void outside_instructions(pair top_point) {
    label(
        rotate(90) *
        Label("\Large\begin{tabular}{c}
        Open with\\this side up!\\Follow the arrow\\for instructions
        \end{tabular}"),
        top_point, align=S, filltype=Fill(white)
    );
}

void inside_instructions(pair bottom_point) {
    label(
        rotate(90) *
        minipage("\textbf{How to fold the ``Boom''}\par
        \emph{Designed by Alex Duan, Dec.~6, 2020}\par
        \begin{itemize}
        \item Fold along the 9 lines shown. Dashed lines are valley folds;
        dot-dashed are mountain folds.
        \item Hold near the front of the plane and throw gently.
        \item This plane flies pretty wild (like 2020), but if it dives or
        climbs too much, curl the back edge up or down to adjust.
        \end{itemize}
        This design is available online at:\\
        https://github.com/charlesduan/planecard", 3 inches),
        bottom_point, align=N, filltype=Fill(white)
    );
}

void imprint(pair center, pair left, pair right) {
    label("\footnotesize\begin{tabular}{c}
        \textcopyright\\
        2020\\
        Alex \&\\
        Charles Duan
        \end{tabular}", left, align=N);
    label(rotate(180) * Label("\tiny\begin{tabular}{l}
        Licensed\\
        under CC BY-NC 4.0 \\
        https://creativecommons.org\\
        /licenses/by-nc/4.0
        \end{tabular}"), right, align=S);
}

void bottom_graphics(path p1, path p2) {
    addgraphic("", p1, 90, scale=30, offset=(24, 0));
    addgraphic("", p2, 90, scale=100, offset=(24, 0));
}

void wing_graphics(path p1, path p2) {
    addgraphic("", p1, 0, scale=-100, offset=(-45, 160));
    addgraphic("", p2, 90, offset=(-90, 0), scale=-120);
}

void top_graphics(path p1, path p2) {
    addgraphic("", p1, 0, offset=(50, 70));
    addgraphic("", p2, 180, scale=-60);
}

void fuselage_text(pair p1, pair p2) {}


include planecard;
