#
# See ./docs/contributing.md
#
CC = xelatex

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
		bash -c "cd src && $(CC) -output-directory=$(BUILD_DIR) resume.tex";