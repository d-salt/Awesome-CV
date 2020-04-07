.PHONY: all

CC = xelatex
RESUME_DIR = resume
CV_DIR = cv
RESUME_SRCS = $(shell find $(RESUME_DIR) -name '*.tex')
CV_SRCS = $(shell find $(CV_DIR) -name '*.tex')
DEPS = enumitem xifthen ifmtarg sourcesanspro tcolorbox environ trimspaces lm-math

all: $(foreach x, coverletter cv resume, $x.pdf)

resume.pdf: resume.tex $(RESUME_SRCS)
	$(CC) $<

cv.pdf: cv.tex $(CV_SRCS)
	$(CC) $<

coverletter.pdf: coverletter.tex
	$(CC) $<

install_deps:
	sudo tlmgr update --self && sudo tlmgr install $(DEPS)

FontAwesome.otf:
	curl -O https://github.com/FortAwesome/Font-Awesome/blob/v4.7.0/fonts/FontAwesome.otf

clean:
	rm -rf *.pdf
