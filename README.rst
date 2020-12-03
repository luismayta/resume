Resume
======

|resume| |cv|

|Build Status| |GitHub issues| |GitHub license|


:Version: 0.3.2
:Web: https://github.com/luismayta/resume
:Download: http://github.com/luismayta/resume
:Source: http://github.com/luismayta/resume
:Keywords: resume, latex

.. contents:: Table of Contents:
    :local:

An elegant `LaTeX`_ resume template, compiled with
`XeLaTeX`_ . Inspired by `billryan/resume`_

Features
--------

-  Easy to be further customized or extended
-  Full support for unicode characters (e.g. CJK) with
   `XeLaTeX`_
-  FontAwesome 4.5.0 support (alias not support yet)

Dependencies
------------

List of applications:

- `Python 3.6.4`_
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


Support
-------

If you want to support this project, i only accept ``IOTA`` :p.

.. code-block:: bash

    Address: FTDCZELEMOQGL9MBWFZENJLFIZUBGMXLFVPRB9HTWYDYPTFKASJCEGJMSAXUWDQC9SJUDMZVIQKACQEEYPEUYLAMMD


Team
----

+---------------+
| |Luis Mayta|  |
+---------------+
| `luis mayta`_ |
+---------------+

License
-------

MIT

Changelog
---------

Please see `CHANGELOG`_ for more information what
has changed recently.

Contributing
------------

Contributions are welcome!

Review the `CONTRIBUTING`_ for details on how to:

* Submit issues
* Submit pull requests

Contact Info
------------

Feel free to contact me to discuss any issues, questions, or comments.

* `Email`_
* `Twitter`_
* `GitHub`_
* `LinkedIn`_
* `Website`_
* `PGP`_

|linkedin| |beacon| |made|

Made with :coffee: and :pizza: by `luis mayta`_ and `hadenlabs`_.

.. Links
.. _`changelog`: CHANGELOG.rst
.. _`contributors`: AUTHORS
.. _`contributing`: CONTRIBUTING.rst

.. _`hadenlabs`: https://github.com/hadenlabs
.. _`luis mayta`: https://github.com/luismayta

.. _`Github`: https://github.com/luismayta
.. _`Linkedin`: https://pe.linkedin.com/in/luismayta
.. _`Email`: slovacus@gmail.com
    :target: mailto:slovacus@gmail.com
.. _`Twitter`: https://twitter.com/slovacus
.. _`Website`: http://luismayta.github.io
.. _`PGP`: https://keybase.io/luismayta/pgp_keys.asc

.. |Build Status| image:: https://travis-ci.org/luismayta/resume.svg
   :target: https://travis-ci.org/luismayta/resume
.. |GitHub issues| image:: https://img.shields.io/github/issues/luismayta/resume.svg
   :target: https://github.com/luismayta/resume/issues
.. |GitHub license| image:: https://img.shields.io/github/license/mashape/apistatus.svg?style=flat-square
   :target: LICENSE

.. resume
.. |resume| image:: https://img.shields.io/badge/resume-pdf-green.svg
  :target: https://github.com/luismayta/resume/raw/master/src/examples/resume.pdf
  :alt: Resume
.. |cv| image:: https://img.shields.io/badge/cv-pdf-green.svg
  :target: https://github.com/luismayta/resume/raw/master/src/examples/cv.pdf
  :alt: CV

.. Team:
.. |Luis Mayta| image:: https://github.com/luismayta.png?size=100
   :target: https://github.com/luismayta

.. Links
.. _`English`: https://latexonline.cc/compile?git=https://github.com/luismayta/resume&target=src/resume.tex&command=xelatex
.. _`XeLaTeX`: https://www.overleaf.com/learn/latex/XeLaTeX
.. _`LaTeX`: https://www.latex-project.org/about/
.. _`billryan/resume`: https://github.com/billryan/resume

.. Footer:
.. |linkedin| image:: http://www.linkedin.com/img/webpromo/btn_liprofile_blue_80x15.png
   :target: https://pe.linkedin.com/in/luismayta
.. |beacon| image:: https://ga-beacon.appspot.com/UA-65019326-1/github.com/luismayta/resume/readme
   :target: https://github.com/luismayta/resume
.. |made| image:: https://img.shields.io/badge/Made%20with-Latex-1f425f.svg
   :target: https://www.latex-project.org/about/

.. Dependences:

.. _Python 3.6.4: https://www.python.org/downloads/release/python-364
.. _Docker: https://www.docker.com/
.. _Docker Compose: https://docs.docker.com/compose/
