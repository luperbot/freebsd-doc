==================
6.15.?Using Python
==================

.. raw:: html

   <div class="navheader">

6.15.?Using Python
`Prev <using-php.html>`__?
Chapter?6.?Special Considerations
?\ `Next <using-tcl.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="sect1">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.15.?Using Python
------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The Ports Collection supports parallel installation of multiple Python
versions. Ports must use a correct ``python`` interpreter, according to
the user-settable ``PYTHON_VERSION``. Most prominently, this means
replacing the path to ``python`` executable in scripts with the value of
``PYTHON_CMD``.

Ports that install files under ``PYTHON_SITELIBDIR`` must use the
``pyXY-`` package name prefix, so their package name embeds the version
of Python they are installed into.

.. code:: programlisting

    PKGNAMEPREFIX=   ${PYTHON_PKGNAMEPREFIX}

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Table?6.19.?Most Useful Variables for Ports That Use Python

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+-------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``USES=python``               | The port needs Python. The minimal required version can be specified with values such as ``2.7+``. Version ranges can also be specified by separating two version numbers with a dash: ``USES=python:3.2-3.3``                                                                                                                                                                               |
+-------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``USE_PYTHON=distutils``      | Use Python distutils for configuring, compiling, and installing. This is required when the port comes with ``setup.py``. This overrides the ``do-build`` and ``do-install`` targets and may also override ``do-configure`` if ``GNU_CONFIGURE`` is not defined.                                                                                                                              |
+-------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``USE_PYTHON=autoplist``      | Create the packaging list automatically. This also requires ``USE_PYTHON=distutils`` to be set.                                                                                                                                                                                                                                                                                              |
+-------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``USE_PYTHON=concurrent``     | The port will use an unique prefix, typically ``PYTHON_PKGNAMEPREFIX`` for certain directories, such as ``EXAMPLESDIR`` and ``DOCSDIR`` and also will append a suffix, the python version from ``PYTHON_VER``, to binaries and scripts to be installed. This allows ports to be installed for different Python versions at the same time, which otherwise would install conflicting files.   |
+-------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``PYTHON_PKGNAMEPREFIX``      | Used as a ``PKGNAMEPREFIX`` to distinguish packages for different Python versions. Example: ``py27-``                                                                                                                                                                                                                                                                                        |
+-------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``PYTHON_SITELIBDIR``         | Location of the site-packages tree, that contains installation path of Python (usually ``LOCALBASE``). ``PYTHON_SITELIBDIR`` can be very useful when installing Python modules.                                                                                                                                                                                                              |
+-------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``PYTHONPREFIX_SITELIBDIR``   | The PREFIX-clean variant of PYTHON\_SITELIBDIR. Always use ``%%PYTHON_SITELIBDIR%%`` in ``pkg-plist`` when possible. The default value of ``%%PYTHON_SITELIBDIR%%`` is ``lib/python%%PYTHON_VERSION%%/site-packages``                                                                                                                                                                        |
+-------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``PYTHON_CMD``                | Python interpreter command line, including version number.                                                                                                                                                                                                                                                                                                                                   |
+-------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``PYNUMERIC``                 | Dependency line for numeric extension.                                                                                                                                                                                                                                                                                                                                                       |
+-------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``PYNUMPY``                   | Dependency line for the new numeric extension, numpy. (PYNUMERIC is deprecated by upstream vendor).                                                                                                                                                                                                                                                                                          |
+-------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``PYXML``                     | Dependency line for XML extension (not needed for Python 2.0 and higher as it is also in base distribution).                                                                                                                                                                                                                                                                                 |
+-------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

A complete list of available variables can be found in
``/usr/ports/Mk/Uses/python.mk``.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?6.10.?Makefile for a Simple Python Module

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    PORTNAME= sample
    PORTVERSION=    1.2.3
    CATEGORIES= devel

    MAINTAINER= john@doe.tld
    COMMENT=    Python sample module

    USES=       python
    USE_PYTHON= autoplist distutils

    .include <bsd.port.mk>

.. raw:: html

   </div>

.. raw:: html

   </div>

Some Python applications claim to have ``DESTDIR`` support (which would
be required for staging) but it is broken (Mailman up to 2.1.16, for
instance). This can be worked around by recompiling the scripts. This
can be done, for example, in the ``post-build`` target. Assuming the
Python scripts are supposed to reside in ``PYTHONPREFIX_SITELIBDIR``
after installation, this solution can be applied:

.. code:: programlisting

    (cd ${STAGEDIR}${PREFIX} \
      && ${PYTHON_CMD} ${PYTHON_LIBDIR}/compileall.py \
       -d ${PREFIX} -f ${PYTHONPREFIX_SITELIBDIR:S;${PREFIX}/;;})

This recompiles the sources with a path relative to the stage directory,
and prepends the value of ``PREFIX`` to the file name recorded in the
byte-compiled output file by ``-d``. ``-f`` is required to force
recompilation, and the ``:S;${PREFIX}/;;`` strips prefixes from the
value of ``PYTHONPREFIX_SITELIBDIR`` to make it relative to ``PREFIX``.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------------+-------------------------+--------------------------------+
| `Prev <using-php.html>`__?                | `Up <special.html>`__   | ?\ `Next <using-tcl.html>`__   |
+-------------------------------------------+-------------------------+--------------------------------+
| 6.14.?Web Applications, Apache and PHP?   | `Home <index.html>`__   | ?6.16.?Using Tcl/Tk            |
+-------------------------------------------+-------------------------+--------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
