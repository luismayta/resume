#!/usr/bin/env bash
# -*- coding: utf-8 -*-

# shellcheck source=/dev/null
[ -r "script/bootstrap.sh" ] && source "script/bootstrap.sh"

# Clean

# Code python
{
    rm -rf -- **/**/**/*_pycache__
    rm -rf -- **/**/**/*.pyc
    rm -rf -- **/**/**/*.swp
	find . -regex "\(.*__pycache__.*\|*.py[co]\)" -delete
} >> /dev/null 2>&1

# Sphinx
{
    rm -rf -- docs/_build/*
} >> /dev/null 2>&1
