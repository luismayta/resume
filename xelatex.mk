#
# See ./CONTRIBUTING.rst
#

DOCKER_RUN := docker-compose -f docker-compose.yml run --rm app

resume.make: clean
	$(DOCKER_RUN) \
		bash -c "cd src && xelatex resume.tex";