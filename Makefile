main: default-planecard.pdf

%.pdf: %.asy FORCE
	asy -tex xelatex "$<"

FORCE:
