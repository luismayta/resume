#
# See ./docs/contributing.md
#
CC = xelatex
EXAMPLES_DIR = examples
RESUME_DIR = examples/resume

xelatex.help:
	@echo '    xelatex:'
	@echo ''
	@echo '        xelatex          show help'
	@echo '        xelatex.make     make resume'
	@echo '        xelatex.resume   make resume'
	@echo ''

xelatex:
	make xelatex.help

xelatex.make: xelatex.resume

xelatex.resume:
	@$(docker-dev-run) \
		bash -c "cd src && $(CC) -output-directory=$(EXAMPLES_DIR) resume.tex";