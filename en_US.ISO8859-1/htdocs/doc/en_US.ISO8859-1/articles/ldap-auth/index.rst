===================
LDAP Authentication
===================

.. raw:: html

   <div class="navheader">

LDAP Authentication
?
?
?\ `Next <ldap.html>`__

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

Toby Burress
~~~~~~~~~~~~

.. raw:: html

   <div class="affiliation">

.. raw:: html

   <div class="address">

| 
|  ????\ ``<kurin@causa-sui.net>``
|  ??

.. raw:: html

   </div>

.. raw:: html

   </div>

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

Copyright ? 2007-2008 The FreeBSD Documentation Project

.. raw:: html

   </div>

.. raw:: html

   <div>

`Legal Notice <trademarks.html>`__

.. raw:: html

   </div>

.. raw:: html

   <div>

Last modified on by .

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

This document is intended as a guide for the configuration of an LDAP
server (principally an OpenLDAP server) for authentication on FreeBSD.
This is useful for situations where many servers need the same user
accounts, for example as a replacement for NIS.

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

`1. Preface <index.html#preface>`__
`2. Configuring LDAP <ldap.html>`__
`3. Client Configuration <client.html>`__
`4. Security Considerations <secure.html>`__
`A. Useful Aids <useful.html>`__
`B. OpenSSL Certificates for LDAP <ssl-ca.html>`__

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

1.?Preface
----------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This document is intended to give the reader enough of an understanding
of LDAP to configure an LDAP server. This document will attempt to
provide an explanation of
`net/nss\_ldap <http://www.freebsd.org/cgi/url.cgi?ports/net/nss_ldap/pkg-descr>`__
and
`security/pam\_ldap <http://www.freebsd.org/cgi/url.cgi?ports/security/pam_ldap/pkg-descr>`__
for use with client machines services for use with the LDAP server.

When finished, the reader should be able to configure and deploy a
FreeBSD server that can host an LDAP directory, and to configure and
deploy a FreeBSD server which can authenticate against an LDAP
directory.

This article is not intended to be an exhaustive account of the
security, robustness, or best practice considerations for configuring
LDAP or the other services discussed herein. While the author takes care
to do everything correctly, they do not address security issues beyond a
general scope. This article should be considered to lay the theoretical
groundwork only, and any actual implementation should be accompanied by
careful requirement analysis.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----+-----+---------------------------+
| ?   | ?   | ?\ `Next <ldap.html>`__   |
+-----+-----+---------------------------+
| ?   | ?   | ?2.?Configuring LDAP      |
+-----+-----+---------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
