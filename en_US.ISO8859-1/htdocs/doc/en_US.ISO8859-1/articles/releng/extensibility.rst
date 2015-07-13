================
5.?Extensibility
================

.. raw:: html

   <div class="navheader">

5.?Extensibility
`Prev <distribution.html>`__?
?
?\ `Next <lessons-learned.html>`__

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

5.?Extensibility
----------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Although FreeBSD forms a complete operating system, there is nothing
that forces you to use the system exactly as we have packaged it up for
distribution. We have tried to design the system to be as extensible as
possible so that it can serve as a platform that other commercial
products can be built on top of. The only “rule” we have about this is
that if you are going to distribute FreeBSD with non-trivial changes, we
encourage you to document your enhancements! The FreeBSD community can
only help support users of the software we provide. We certainly
encourage innovation in the form of advanced installation and
administration tools, for example, but we cannot be expected to answer
questions about it.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.1.?Scripting ``sysinstall``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The FreeBSD system installation and configuration tool,
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8>`__,
can be scripted to provide automated installs for large sites. This
functionality can be used in conjunction with Intel? PXE
`:sup:`[6]` <#ftn.idp64292816>`__ to bootstrap systems from the network.

.. raw:: html

   </div>

.. raw:: html

   <div class="footnotes">

--------------

.. raw:: html

   <div id="ftn.idp64292816" class="footnote">

`:sup:`[6]` <#idp64292816>`__
``../../../../doc/en_US.ISO8859-1/books/handbook/network-pxe-nfs.html``

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------+-------------------------+----------------------------------------+
| `Prev <distribution.html>`__?   | ?                       | ?\ `Next <lessons-learned.html>`__     |
+---------------------------------+-------------------------+----------------------------------------+
| 4.?Distribution?                | `Home <index.html>`__   | ?6.?Lessons Learned from FreeBSD?4.4   |
+---------------------------------+-------------------------+----------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
