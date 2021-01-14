#
# See ./CONTRIBUTING.rst
#
CC = xelatex
EXAMPLES_DIR = examples
RESUME_DIR = examples/resume
CV_DIR = examples/cv

xelatex.help:
	@echo '    xelatex:'
	@echo ''
	@echo '        xelatex          show help'
	@echo '        xelatex.make     make resume and cv'
	@echo '        xelatex.resume   make resume'
	@echo '        xelatex.cv       make cv'
	@echo ''

xelatex:
	make xelatex.help

xelatex.make: latex.resume latex.cv

xelatex.resume:
	$(docker-dev-run) \
		bash -c "cd src && $(CC) -output-directory=$(EXAMPLES_DIR) resume.tex";

xelatex.cv:
	$(docker-dev-run) \
		bash -c "cd src && $(CC) -output-directory=$(EXAMPLES_DIR) cv.tex";