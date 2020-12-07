main: planecard.pdf

%.pdf: %.asy
	asy -tex xelatex "$<"
