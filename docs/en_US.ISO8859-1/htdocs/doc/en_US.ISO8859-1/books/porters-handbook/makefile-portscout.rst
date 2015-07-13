==============
5.7.?PORTSCOUT
==============

.. raw:: html

   <div class="navheader">

5.7.?\ ``PORTSCOUT``
`Prev <makefile-comment.html>`__?
Chapter?5.?Configuring the Makefile
?\ `Next <makefile-depend.html>`__

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

5.7.?\ ``PORTSCOUT``
--------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Portscout is an automated distfile check utility for the FreeBSD?Ports
Collection, described in detail in `Section?14.5, “Portscout: the
FreeBSD Ports Distfile Scanner” <distfile-survey.html>`__.

``PORTSCOUT`` defines special conditions within which the Portscout
distfile scanner is restricted.

Situations where ``PORTSCOUT`` is set include:

.. raw:: html

   <div class="itemizedlist">

-  When distfiles have to be ignored, whether for specific versions, or
   specific minor revisions. For example, to exclude version *``8.2``*
   from distfile version checks because it is known to be broken, add:

   .. code:: programlisting

       PORTSCOUT=   ignore:8.2

-  When specific versions or specific major and minor revisions of a
   distfile must be checked. For example, if only version *``0.6.4``*
   must be monitored because newer versions have compatibility issues
   with FreeBSD, add:

   .. code:: programlisting

       PORTSCOUT=  limit:^0\.6\.4

-  When URLs listing the available versions differ from the download
   URLs. For example, to limit distfile version checks to the download
   page for the
   `databases/pgtune <http://www.freebsd.org/cgi/url.cgi?ports/databases/pgtune/pkg-descr>`__
   port, add:

   .. code:: programlisting

       PORTSCOUT=    site:http://pgfoundry.org/frs/?group_id=1000416

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------+---------------------------+--------------------------------------+
| `Prev <makefile-comment.html>`__?   | `Up <makefiles.html>`__   | ?\ `Next <makefile-depend.html>`__   |
+-------------------------------------+---------------------------+--------------------------------------+
| 5.6.?\ ``COMMENT``?                 | `Home <index.html>`__     | ?5.8.?Dependencies                   |
+-------------------------------------+---------------------------+--------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
