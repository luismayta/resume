Resume
######

|build_status| |wercker_status| |code_climate| |github_tag| |github_issues| |test_coverage| |license|

:Version: 0.1.0
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

Sample OutPut
-------------

- `English`_

Usage
-----

- Install dependences

.. code-block:: bash

  λ make setup

- Compile tex on your Computer

.. code-block:: bash

  λ docker-compose run --rm app make generate

Actions:
========

.. code-block:: bash

  λ make
    ༼ つ ◕_◕ ༽つ Commands
      build                Build docker container by env
      clean                clean Files compiled
      documentation        Make Documentation
      down                 remove containers docker by env
      environment          Make environment for developer
      env                  Show envs available
      install              Install with var env Dependences
      generate             Generate pdf
      list                 List of current active services by env
      lint                 Make Lint Files
      test                 make test
      up                   Up application by env
      restart              Reload services
      ssh                  Connect to container
      stop                 stop containers docker by env
      setup                Install dependences initial
      verify_network       Verify network
      help                 Show help text


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

.. |wercker_status| image::
                    https://app.wercker.com/status/2040327c395b07be15b2031426ec92f1/s/master"wercker
                    status"
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