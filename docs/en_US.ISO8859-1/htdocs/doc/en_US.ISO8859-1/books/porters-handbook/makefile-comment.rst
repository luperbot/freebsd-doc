============
5.6.?COMMENT
============

.. raw:: html

   <div class="navheader">

5.6.?\ ``COMMENT``
`Prev <makefile-maintainer.html>`__?
Chapter?5.?Configuring the Makefile
?\ `Next <makefile-portscout.html>`__

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

5.6.?\ ``COMMENT``
------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This is a one-line description of the port. Please respect these rules:

.. raw:: html

   <div class="orderedlist">

#. Try to keep the COMMENT value at no longer than 70 characters, as
   this line will be used by ``pkg info`` (see
   `pkg-info(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg-info&sektion=8>`__)
   to display a one-line summary of the port;

#. Do *not* include the package name (or version number of the
   software);

#. The comment must begin with a capital and end without a period;

#. Do not start with an indefinite article (that is, A or An);

#. Names are capitalized (for example, Apache, JavaScript, Perl);

#. For lists of words, use the Oxford comma (for example, green, red*,*
   and blue);

#. Spell check the text.

.. raw:: html

   </div>

Here is an example:

.. code:: programlisting

    COMMENT= Cat chasing a mouse all over the screen

The COMMENT variable immediately follows the MAINTAINER variable in the
``Makefile``.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------+---------------------------+-----------------------------------------+
| `Prev <makefile-maintainer.html>`__?   | `Up <makefiles.html>`__   | ?\ `Next <makefile-portscout.html>`__   |
+----------------------------------------+---------------------------+-----------------------------------------+
| 5.5.?\ ``MAINTAINER``?                 | `Home <index.html>`__     | ?5.7.?\ ``PORTSCOUT``                   |
+----------------------------------------+---------------------------+-----------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
