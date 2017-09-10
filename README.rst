Resume
######

|build_status| |code_climate| |github_tag| |github_issues| |test_coverage| |license|

:Version: 0.0.0
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
-  Perfect Simplified Chinese fonts support with Adobefonts
-  FontAwesome 4.5.0 support (alias not support yet)

|English| |Spanish|

-  English PDF - /docs/resume.pdf
-  Spanish PDF - /docs/resume-es-PE.pdf

Requirements:
=============

List of applications:

- `Python 3.6.1`_
- `Docker`_
- `Docker Compose`_

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