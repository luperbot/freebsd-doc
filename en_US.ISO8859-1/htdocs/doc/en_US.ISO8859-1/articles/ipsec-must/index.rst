==========================================================
Independent Verification of IPsec Functionality in FreeBSD
==========================================================

.. raw:: html

   <div class="navheader">

Independent Verification of IPsec Functionality in FreeBSD
?
?
?\ `Next <solution.html>`__

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

   <div class="author" xmlns="http://www.w3.org/1999/xhtml">

David Honig
~~~~~~~~~~~

.. raw:: html

   <div class="affiliation">

.. raw:: html

   <div class="address">

``<honig@sprynet.com>``

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

`Legal Notice <trademarks.html>`__

.. raw:: html

   </div>

.. raw:: html

   <div>

Last modified on 1999-05-03 by .

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

You installed IPsec and it seems to be working. How do you know? I
describe a method for experimentally verifying that IPsec is working.

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

`1. The Problem <index.html#problem>`__
`2. The Solution <solution.html>`__
`3. The Experiment <experiment.html>`__
`4. Caveat <caveat.html>`__
`5. IPsec---Definition <IPsec.html>`__
`6. Installing IPsec <ipsec-install.html>`__
`7. src/sys/i386/conf/KERNELNAME <kernel.html>`__
`8. Maurer's Universal Statistical Test (for block size=8
bits) <code.html>`__

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

1.?The Problem
--------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

First, lets assume you have `installed *IPsec* <ipsec-install.html>`__.
How do you know it is `working <caveat.html>`__? Sure, your connection
will not work if it is misconfigured, and it will work when you finally
get it right.
`netstat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=netstat&sektion=1>`__
will list it. But can you independently confirm it?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----+-----+-------------------------------+
| ?   | ?   | ?\ `Next <solution.html>`__   |
+-----+-----+-------------------------------+
| ?   | ?   | ?2.?The Solution              |
+-----+-----+-------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
