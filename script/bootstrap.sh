#!/usr/bin/env bash
# -*- coding: utf-8 -*-

export PROJECT_NAME=resume
export PYTHON_VERSION=3.6.1
export PYENV_NAME="${PROJECT_NAME}"

# Vars Dir
export ROOT_DIR
ROOT_DIR=$(pwd)
export RESOURCES_DIR="$ROOT_DIR/resources"
export RESOURCES_DB_DIR="$RESOURCES_DIR/db"
export PROVISION_DIR="$ROOT_DIR/provision/ansible"
export SOURCE_DIR="${ROOT_DIR}/"
export REQUIREMENTS_DIR="${ROOT_DIR}/requirements/"
export FILE_README="${ROOT_DIR}/README.rst"

export message="\{^_^}/"
