#
# See ./CONTRIBUTING.rst
#

DOCKER_TEST := docker-compose -f docker-compose.yml -f docker-compose/test.yml

test.lint: clean
	$(DOCKER_TEST) run --rm app \
		bash -c "pre-commit run --all-files --verbose";

test: clean
	@echo $(MESSAGE) Running tests on the current Python interpreter with coverage $(END)
	@echo
