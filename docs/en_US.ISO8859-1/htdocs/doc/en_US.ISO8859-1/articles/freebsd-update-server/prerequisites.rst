================
3.?Prerequisites
================

.. raw:: html

   <div class="navheader">

3.?Prerequisites
`Prev <introduction.html>`__?
?
?\ `Next <Configuration.html>`__

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

3.?Prerequisites
----------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

To build an internal FreeBSD Update Server some requirements should be
met.

.. raw:: html

   <div class="itemizedlist">

-  A running FreeBSD system.

   .. raw:: html

      <div class="note" xmlns="">

   Note:
   ~~~~~

   At a minimum, updates require building on a FreeBSD release greater
   than or equal to the target release version for distribution.

   .. raw:: html

      </div>

-  A user account with at least 4?GB of available space. This will allow
   the creation of updates for 7.1 and 7.2, but the exact space
   requirements may change from version to version.

-  An
   `ssh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh&sektion=1>`__
   account on a remote machine to upload distributed updates.

-  A web server, like
   `Apache <../../../../doc/en_US.ISO8859-1/books/handbook/network-apache.html>`__,
   with over half of the space required for the build. For instance,
   test builds for 7.1 and 7.2 consume a total amount of 4?GB, and the
   webserver space needed to distribute these updates is 2.6?GB.

-  Basic knowledge of shell scripting with Bourne shell,
   `sh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sh&sektion=1>`__.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------+-------------------------+-------------------------------------------+
| `Prev <introduction.html>`__?   | ?                       | ?\ `Next <Configuration.html>`__          |
+---------------------------------+-------------------------+-------------------------------------------+
| 2.?Introduction?                | `Home <index.html>`__   | ?4.?Configuration: Installation & Setup   |
+---------------------------------+-------------------------+-------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
