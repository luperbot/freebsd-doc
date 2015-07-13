========================
4.6.?Handling User Input
========================

.. raw:: html

   <div class="navheader">

4.6.?Handling User Input
`Prev <slow-configure.html>`__?
Chapter?4.?Slow Porting
?\ `Next <makefiles.html>`__

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

4.6.?Handling User Input
------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If the port requires user input to build, configure, or install, set
``IS_INTERACTIVE`` in the ``Makefile``. This will allow “overnight
builds” to skip it. If the user sets the variable ``BATCH`` in his
environment (and if the user sets the variable ``INTERACTIVE``, then
*only* those ports requiring interaction are built). This will save a
lot of wasted time on the set of machines that continually build ports
(see below).

It is also recommended that if there are reasonable default answers to
the questions, ``PACKAGE_BUILDING`` be used to turn off the interactive
script when it is set. This will allow us to build the packages for
CDROMs and FTP.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------+------------------------------+----------------------------------------+
| `Prev <slow-configure.html>`__?   | `Up <slow-porting.html>`__   | ?\ `Next <makefiles.html>`__           |
+-----------------------------------+------------------------------+----------------------------------------+
| 4.5.?Configuring?                 | `Home <index.html>`__        | ?Chapter?5.?Configuring the Makefile   |
+-----------------------------------+------------------------------+----------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
