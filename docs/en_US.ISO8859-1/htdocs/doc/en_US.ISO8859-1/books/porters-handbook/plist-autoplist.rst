====================================
7.5.?Automated Package List Creation
====================================

.. raw:: html

   <div class="navheader">

7.5.?Automated Package List Creation
`Prev <plist-dynamic.html>`__?
Chapter?7.?Advanced ``pkg-plist`` Practices
?\ `Next <plist-keywords.html>`__

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

7.5.?Automated Package List Creation
------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

First, make sure the port is almost complete, with only ``pkg-plist``
missing. Running ``make     makeplist`` will show an example for
``pkg-plist``. The output of ``makeplist`` must be double checked for
correctness as it tries to automatically guess a few things, and can get
it wrong.

User configuration files should be installed as ``filename``.sample, as
it is described in `Section?7.3, “Configuration
Files” <plist-config.html>`__. ``info/dir`` must not be listed and
appropriate ``install-info`` lines must be added as noted in the `info
files <makefile-info.html>`__ section. Any libraries installed by the
port must be listed as specified in the `shared
libraries <porting-shlibs.html>`__ section.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------------+-------------------------+----------------------------------------------+
| `Prev <plist-dynamic.html>`__?             | `Up <plist.html>`__     | ?\ `Next <plist-keywords.html>`__            |
+--------------------------------------------+-------------------------+----------------------------------------------+
| 7.4.?Dynamic Versus Static Package List?   | `Home <index.html>`__   | ?7.6.?Expanding Package List with Keywords   |
+--------------------------------------------+-------------------------+----------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
