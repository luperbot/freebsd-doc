======================
Chapter?6.?The Website
======================

.. raw:: html

   <div class="navheader">

Chapter?6.?The Website
`Prev <make-includes.html>`__?
?
?\ `Next <the-website-install.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="chapter">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Table of Contents

.. raw:: html

   </div>

`6.1. Build the Web Pages <the-website.html#the-website-build>`__
`6.2. Install the Web Pages <the-website-install.html>`__
`6.3. Environment Variables <the-website-env.html>`__

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

6.1.?Build the Web Pages
------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Having obtained the documentation and web site source files, the web
site can be built. In this example, the build directory is ``~/doc`` and
all the required files are already in place.

The web site is built from the ``en_US.ISO8859-1/htdocs`` subdirectory
of the document tree directory, ``~/doc`` in this example. Change to the
build directory and start the build by executing ``make all``.

.. code:: screen

    % cd ~/doc/en_US.ISO8859-1/htdocs
    % make all

.. raw:: html

   <div class="tip" xmlns="">

Tip:
~~~~

The web site build uses the ``INDEX`` from the Ports Collection and may
fail if that file or ``/usr/ports`` is not present. The simplest
approach is to install the `Ports
Collection <../../../../doc/en_US.ISO8859-1/books/handbook/ports.html#ports-tree>`__.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------------------+-------------------------+------------------------------------------+
| `Prev <make-includes.html>`__?                      | ?                       | ?\ `Next <the-website-install.html>`__   |
+-----------------------------------------------------+-------------------------+------------------------------------------+
| 5.3.?FreeBSD Documentation Project Make Includes?   | `Home <index.html>`__   | ?6.2.?Install the Web Pages              |
+-----------------------------------------------------+-------------------------+------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
