all: cv_fr.pdf cv_en.pdf cv_fr.png cv_en.png

cv_fr.png: cv_fr.pdf
	convert -density 300 "$^" -background white -flatten -quality 100 "$@"

cv_en.png: cv_en.pdf
	convert -density 300 "$^" -background white -flatten -quality 100 "$@"

cv_fr.pdf: cv.tex icons/* sections/*
	texfot pdflatex -jobname=cv_fr --file-line-error --shell-escape "\def\lang{fr} \input{cv.tex}"

cv_en.pdf: cv.tex icons/* sections/*
	texfot pdflatex -jobname=cv_en --file-line-error --shell-escape "\def\lang{en} \input{cv.tex}"

.PHONY: clean all
clean:
	rm *.aux *.out *.log
