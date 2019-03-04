#
# See ./CONTRIBUTING.rst
#
CC = xelatex
EXAMPLES_DIR = examples
RESUME_DIR = examples/resume
CV_DIR = examples/cv
DOCKER_RUN := $(docker-compose) -f "${PATH_DOCKER_COMPOSE}"/dev.yml run --rm app

latex.make: clean latex.resume latex.cv

latex.resume: clean
	$(DOCKER_RUN) \
		bash -c "cd src &&  $(CC) -output-directory=$(EXAMPLES_DIR) resume.tex";

latex.cv: clean
	$(DOCKER_RUN) \
		bash -c "cd src &&  $(CC) -output-directory=$(EXAMPLES_DIR) cv.tex";