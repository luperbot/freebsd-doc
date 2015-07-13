================================
Pluggable Authentication Modules
================================

.. raw:: html

   <div class="navheader">

Pluggable Authentication Modules
?
?
?\ `Next <pam-terms.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="article" lang="en" lang="en">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="authorgroup" xmlns="http://www.w3.org/1999/xhtml">

.. raw:: html

   <div class="author">

Dag-Erling Sm?rgrav
~~~~~~~~~~~~~~~~~~~

Contributed by ?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div>

Revision: ` <https://svnweb.freebsd.org/changeset/doc/>`__

.. raw:: html

   </div>

.. raw:: html

   <div>

Copyright ? 2001-2003 Networks Associates Technology, Inc.

.. raw:: html

   </div>

.. raw:: html

   <div>

`Legal Notice <pam-legalnotice.html>`__

.. raw:: html

   </div>

.. raw:: html

   <div>

`Legal Notice <trademarks.html>`__

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="abstract" xmlns="http://www.w3.org/1999/xhtml">

.. raw:: html

   <div class="abstract-title">

Abstract

.. raw:: html

   </div>

This article describes the underlying principles and mechanisms of the
Pluggable Authentication Modules (PAM) library, and explains how to
configure PAM, how to integrate PAM into applications, and how to write
PAM modules.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="docformatnavi">

[ Split HTML / `Single HTML <article.html>`__ ]

.. raw:: html

   </div>

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Table of Contents

.. raw:: html

   </div>

`1. Introduction <index.html#pam-intro>`__
`2. Terms and conventions <pam-terms.html>`__
`3. PAM Essentials <pam-essentials.html>`__
`4. PAM Configuration <pam-config.html>`__
`5. FreeBSD PAM Modules <pam-freebsd-modules.html>`__
`6. PAM Application Programming <pam-appl-prog.html>`__
`7. PAM Module Programming <pam-module-prog.html>`__
`A. Sample PAM Application <pam-sample-appl.html>`__
`B. Sample PAM Module <pam-sample-module.html>`__
`C. Sample PAM Conversation Function <pam-sample-conv.html>`__
`Further Reading <pam-further.html>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="section">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

1.?Introduction
---------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The Pluggable Authentication Modules (PAM) library is a generalized API
for authentication-related services which allows a system administrator
to add new authentication methods simply by installing new PAM modules,
and to modify authentication policies by editing configuration files.

PAM was defined and developed in 1995 by Vipin Samar and Charlie Lai of
Sun Microsystems, and has not changed much since. In 1997, the Open
Group published the X/Open Single Sign-on (XSSO) preliminary
specification, which standardized the PAM API and added extensions for
single (or rather integrated) sign-on. At the time of this writing, this
specification has not yet been adopted as a standard.

Although this article focuses primarily on FreeBSD 5.x, which uses
OpenPAM, it should be equally applicable to FreeBSD 4.x, which uses
Linux-PAM, and other operating systems such as Linux and Solaris™.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----+-----+--------------------------------+
| ?   | ?   | ?\ `Next <pam-terms.html>`__   |
+-----+-----+--------------------------------+
| ?   | ?   | ?2.?Terms and conventions      |
+-----+-----+--------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
