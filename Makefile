#
# See ./docs/contributing.md
#

OS := $(shell uname)

.PHONY: help
.DEFAULT_GOAL := help

HAS_PIP := $(shell command -v pip;)
HAS_PIPENV := $(shell command -v pipenv;)

ifdef HAS_PIPENV
	PIPENV_RUN:=pipenv run
	PIPENV_INSTALL:=pipenv install
else
	PIPENV_RUN:=
	PIPENV_INSTALL:=
endif

TEAM := luismayta
REPOSITORY_DOMAIN:=github.com
REPOSITORY_OWNER:=${TEAM}
AWS_VAULT ?= ${TEAM}
PROJECT := resume

PYTHON_VERSION=3.8.0
NODE_VERSION=14.16.1
PYENV_NAME="${PROJECT}"
GIT_IGNORES:=python,node,go,latex,zsh
GI:=gi

# Configuration.
SHELL ?=/bin/bash
ROOT_DIR=$(shell pwd)
MESSAGE:=🍺️
MESSAGE_HAPPY?:="Done! ${MESSAGE}, Now Happy Hacking"
SOURCE_DIR=$(ROOT_DIR)
PROVISION_DIR:=$(ROOT_DIR)/provision
DOCS_DIR:=$(ROOT_DIR)/docs
BUILD_DIR:=$(ROOT_DIR)/build
README_TEMPLATE:=$(PROVISION_DIR)/templates/README.tpl.md

export README_FILE ?= README.md
export README_YAML ?= provision/generators/README.yaml
export README_INCLUDES ?= $(file://$(shell pwd)/?type=text/plain)

FILE_README:=$(ROOT_DIR)/README.md

include provision/make/*.mk

## Display help for all targets
.PHONY: help
help:
	@echo '${MESSAGE} Makefile for ${PROJECT}'
	@echo ''
	@awk '/^.PHONY: / { \
		msg = match(lastLine, /^## /); \
			if (msg) { \
				cmd = substr($$0, 9, 100); \
				msg = substr(lastLine, 4, 1000); \
				printf "  ${GREEN}%-30s${RESET} %s\n", cmd, msg; \
			} \
	} \
	{ lastLine = $$0 }' $(MAKEFILE_LIST)

## Create README.md by building it from README.yaml
.PHONY: readme
readme:
	@gomplate --file $(README_TEMPLATE) \
		--out $(README_FILE)

## setup dependences of project
.PHONY: setup
setup:
	@echo "==> install packages..."
	make python.setup
	make python.precommit
	@[ -e ".env" ] || cp -rf .env.example .env
	make git.setup
	@echo ${MESSAGE_HAPPY}

## setup environment of project
.PHONY: environment
environment:
	@echo "==> loading virtualenv ${PYENV_NAME}..."
	make python.environment
	@echo ${MESSAGE_HAPPY}
