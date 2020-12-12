# Airplane Greeting Card!

This repository contains a folding guide for a paper airplane called the "Boom,"
designed by Alex Duan, which was coded with facilities for graphics in the
[Asymptote](https://asymptote.sourceforge.io/) language.

## I just want my airplane

Print the file [default-planecard.pdf](default-planecard.pdf), double-sided to
flip on the long edge.

## Can I add text or graphics?

You sure can! Edit or copy the file
[default-planecard.asy](default-planecard.asy), which contains the definitions
for most of the editable material on the plane. There is a helper function
`addgraphic`, defined in [libplanecard.asy](libplanecard.asy), for adding
images. (The `offset` and `scale` parameters are somewhat hackish; I just adjust
them by trial and error.)

To compile, assuming you have Asymptote installed, you can call `make
[file].pdf` or run `asy -tex xelatex [file].asy`. (I use `xelatex` because it
can process jpeg graphics.)

## If only you'd put that fold over here...

You're also welcome to modify the design of the plane, under the Creative
Commons license noted on the plane itself, and the underlying source code, which
uses the MIT license. The file [planecard.asy](planecard.asy) contains the
instructions that draw the fold lines and place the text and graphics.

## Are you telling me a 7-year-old invented this paper airplane?

It's pretty impressive what one can learn from watching YouTube videos on a
single subject for several months.


