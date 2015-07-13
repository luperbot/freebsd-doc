==========================
6.3.?Environment Variables
==========================

.. raw:: html

   <div class="navheader">

6.3.?Environment Variables
`Prev <the-website-install.html>`__?
Chapter?6.?The Website
?\ `Next <xml-primer.html>`__

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

6.3.?Environment Variables
--------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="variablelist">

``ENGLISH_ONLY``
    If set and not empty, only the English documents will be built or
    installed. All translations will be ignored. E.g.:

    .. code:: screen

        # make ENGLISH_ONLY=YES all install

    To unset the variable and build all pages, including translations,
    set ``ENGLISH_ONLY`` to an empty value:

    .. code:: screen

        # make ENGLISH_ONLY="" all install clean

``WEB_ONLY``
    If set and not empty, only the HTML pages from the
    ``en_US.ISO8859-1/htdocs`` directory will be built or installed. All
    other directories within ``en_US.ISO8859-1`` (Handbook, FAQ,
    Tutorials) will be ignored. E.g.:

    .. code:: screen

        # make WEB_ONLY=YES all install

``WEB_LANG``
    If set, build or install only for the languages specified by this
    variable inside the ``~/doc`` directory. All other languages except
    English will be ignored. E.g.:

    .. code:: screen

        # make WEB_LANG="el_GR.ISO8859-7 es_ES.ISO8859-1 hu_HU.ISO8859-2 nl_NL.ISO8859-1" all install

.. raw:: html

   </div>

``WEB_ONLY``, ``WEB_LANG``, and ``ENGLISH_ONLY`` are
`make(1) <http://www.FreeBSD.org/cgi/man.cgi?query=make&sektion=1>`__
variables and can be set in ``/etc/make.conf``, ``Makefile.inc``, as
environment variables on the command line, or in dot files.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------+-----------------------------+---------------------------------+
| `Prev <the-website-install.html>`__?   | `Up <the-website.html>`__   | ?\ `Next <xml-primer.html>`__   |
+----------------------------------------+-----------------------------+---------------------------------+
| 6.2.?Install the Web Pages?            | `Home <index.html>`__       | ?Chapter?7.?XML Primer          |
+----------------------------------------+-----------------------------+---------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
