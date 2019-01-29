#
# See ./CONTRIBUTING.rst
#
CC = xelatex
EXAMPLES_DIR = examples
RESUME_DIR = examples/resume
CV_DIR = examples/cv
# RESUME_SRCS = $(shell find $(RESUME_DIR) -name '*.tex')
# CV_SRCS = $(shell find $(CV_DIR) -name '*.tex')
DOCKER_RUN := docker-compose -f docker-compose.yml run --rm app

latex.make: clean latex.resume latex.cv

latex.resume: clean
	$(DOCKER_RUN) \
		bash -c "cd src &&  $(CC) -output-directory=$(EXAMPLES_DIR) resume.tex";

latex.cv: clean
	$(DOCKER_RUN) \
		bash -c "cd src &&  $(CC) -output-directory=$(EXAMPLES_DIR) cv.tex";