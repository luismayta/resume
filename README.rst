Resume
######

|resume| |cv|

|build_status| |wercker_status| |code_climate| |github_tag| |github_issues| |test_coverage| |license|

:Version: 0.3.0
:Web: https://github.com/luismayta/resume
:Download: http://github.com/luismayta/resume
:Source: http://github.com/luismayta/resume
:Keywords: resume, latex

.. contents:: Table of Contents:
    :local:

An elegant `LaTeX`_ resume template, compiled with
`XeLaTeX`_ . Inspired by `billryan/resume`_

Features
========

-  Easy to be further customized or extended
-  Full support for unicode characters (e.g. CJK) with
   `XeLaTeX`_
-  FontAwesome 4.5.0 support (alias not support yet)

Requirements:
=============

List of applications:

- `Python 3.6.1`_
- `Docker`_
- `Docker Compose`_

Quick Start
===========

- Fork this repository
- Add information about you directly in GitHub
- Compile TeX file to PDF with [LaTeX.Online](https://latexonline.cc/)


Usage
-----

- Install dependences

.. code-block:: bash

  λ make setup

- Compile tex on your Computer

.. code-block:: bash

  λ make docker.build
  λ make resume.make

Actions:
========

.. code-block:: bash

  λ make
      ༼ つ ◕_◕ ༽つ Makefile for resume

      Usage:
          environment                  create environment with pyenv
          install                      install dependences python by env
          clean                        remove files of build
          setup                        install requirements

          Docker:

              docker.build              build all services with docker-compose
              docker.down               down services docker-compose
              docker.ssh                connect by ssh to container
              docker.stop               stop services by env
              docker.verify_network     verify network
              docker.up                 up services of docker-compose
              docker.list               list services of docker

          Resume:
              resume.make               Run All tests with coverage

          Tests:

              test                      Run All tests with coverage
              test.lint                 Run all pre-commit


License
=======

MIT

Changelog
=========

Please see `CHANGELOG`_ for more information what
has changed recently.

Contributing
============

Please see `CONTRIBUTING`_ for details.

Credits
=======

-  `author`_
-  `contributors`_

Made with ♥️and ☕️by `author`_ and `company`_.

.. |code_climate| image:: https://codeclimate.com/github/luismayta/resume/badges/gpa.svg
  :target: https://codeclimate.com/github/luismayta/resume
  :alt: Code Climate

.. |github_tag| image:: https://img.shields.io/github/tag/luismayta/resume.svg?maxAge=2592000
  :target: https://github.com/luismayta/resume
  :alt: Github Tag

.. |build_status| image:: https://travis-ci.org/luismayta/resume.svg
  :target: https://travis-ci.org/luismayta/resume
  :alt: Build Status Tag

.. |wercker_status| image:: https://app.wercker.com/status/2040327c395b07be15b2031426ec92f1/s/master "wercker status"
  :target: https://app.wercker.com/project/byKey/2040327c395b07be15b2031426ec92f1
  :alt: wercker status

.. |github_issues| image:: https://img.shields.io/github/issues/luismayta/resume.svg
  :target: https://github.com/luismayta/resume/resume/issues
  :alt: Github Issues

.. |license| image:: https://img.shields.io/github/license/mashape/apistatus.svg?style=flat-square
  :target: LICENSE
  :alt: License

.. |test_coverage| image:: https://codeclimate.com/github/luismayta/resume/badges/coverage.svg
  :target: https://codeclimate.com/github/luismayta/resume/coverage
  :alt: Test Coverage

.. resume

.. |resume| image:: https://img.shields.io/badge/resume-pdf-green.svg
  :target: https://raw.githubusercontent.com/luismayta/resume/master/src/examples/resume.pdf
  :alt: Resume

.. |cv| image:: https://img.shields.io/badge/cv-pdf-green.svg
  :target: https://raw.githubusercontent.com/luismayta/resume/master/src/examples/cv.pdf
  :alt: CV

.. Links
.. _`English`: https://latexonline.cc/compile?git=https://github.com/luismayta/resume&target=src/resume.tex&command=xelatex
.. _`changelog`: CHANGELOG.rst
.. _`contributors`: AUTHORS
.. _`contributing`: CONTRIBUTING.rst

.. _`LaTeX`: https://www.latex-project.org/about/
.. _`company`: https://github.com/hadenlabs
.. _`author`: https://github.com/luismayta
.. _`billryan/resume`: https://github.com/billryan/resume

.. dependences
.. _Python 3.6.1: https://www.python.org/downloads/release/python-361
.. _Docker: https://www.docker.com/
.. _Docker Compose: https://docs.docker.com/compose/
