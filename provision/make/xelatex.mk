#
# See ./docs/contributing.md
#
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
	docker run --rm -v "${PWD}":/data hadenlabs/xelatex:4.1 -output-directory=./ resume.tex -file-line-error -interaction=nonstopmode