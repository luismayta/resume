#
# See ./CONTRIBUTING.rst
#

REQUIREMENTS_FILE :="requirements.txt"
TAG=""
END=""

.PHONY: help build up requirements clean lint test help
.DEFAULT_GOAL := help

PROJECT_NAME := resume
PROJECT_NAME_DEV := $(PROJECT_NAME)_dev
PROJECT_NAME_STAGE := $(PROJECT_NAME)_stage
PROJECT_NAME_TEST := $(PROJECT_NAME)_test

PYTHON_VERSION=3.6.1
PYENV_NAME="${PROJECT_NAME}"

# Configuration.
SHELL := /bin/bash
ROOT_DIR=$(shell pwd)
MESSAGE:=༼ つ ◕_◕ ༽つ
MESSAGE_HAPPY:="${MESSAGE} Happy Coding"
SCRIPT_DIR=$(ROOT_DIR)/extras/scripts
SOURCE_DIR=$(ROOT_DIR)/src
REQUIREMENTS_DIR=$(ROOT_DIR)/requirements/
FILE_README=$(ROOT_DIR)/README.rst

include *.mk

help:
	@echo '${MESSAGE} Makefile for ${PROJECT_NAME}'
	@echo ''
	@echo 'Usage:'
	@echo '    environment               create environment with pyenv'
	@echo '    install                   install dependences python by env'
	@echo '    clean                     remove files of build'
	@echo '    setup                     install requirements'
	@echo ''
	@echo '    Docker:'
	@echo ''
	@echo '        docker.build         build all services with docker-compose'
	@echo '        docker.down          down services docker-compose'
	@echo '        docker.ssh           connect by ssh to container'
	@echo '        docker.stop          stop services by env'
	@echo '        docker.verify_network           verify network'
	@echo '        docker.up             up services of docker-compose'
	@echo '        docker.list           list services of docker'
	@echo ''
	@echo '    Tests:'
	@echo ''
	@echo '        test                       Run All tests with coverage'
	@echo '        test.lint                  Run all pre-commit'
	@echo '        test.syntax                Run all syntax in code'
	@echo ''

clean:
	@echo "$(TAG)"Cleaning up"$(END)"
	@rm -rf .tox *.egg dist build .coverage
	@find . -name '__pycache__' -delete -print -o -name '*.pyc' -delete -print -o -name '*.tmp' -delete -print
	@rm -rf *.egg-info/
	@echo

setup: clean
	pip install -r "${REQUIREMENTS_DIR}/setup.txt"
	pre-commit install
	cp -rf extras/git/hooks/prepare-commit-msg .git/hooks

environment: clean
	@if [ -e "$(HOME)/.pyenv" ]; then \
		eval "$(pyenv init -)"; \
		eval "$(pyenv virtualenv-init -)"; \
	fi
	pyenv virtualenv "${PYTHON_VERSION}" "${PYENV_NAME}" >> /dev/null 2>&1 || echo 'Oh Yeah!!'
	pyenv activate "${PYENV_NAME}" >> /dev/null 2>&1 || echo 'Oh Yeah!!'

install: clean
	@echo $(MESSAGE) "Deployment environment: ${env}"
	@if [ "${env}" == "" ]; then \
		pip install --no-cache -r "${REQUIREMENTS_FILE}"; \
	else \
		pip install --no-cache -r "${REQUIREMENTS_DIR}/${env}.txt"; \
	fi
