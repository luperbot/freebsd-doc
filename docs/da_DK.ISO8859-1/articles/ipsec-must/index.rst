========================================================
Uafh?ngig Verifikation af IPsec Funktionalitet i FreeBSD
========================================================

.. raw:: html

   <div class="navheader">

Uafh?ngig Verifikation af IPsec Funktionalitet i FreeBSD
?
?
?\ `n?ste <solution.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="article" lang="da" lang="da">

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

`Retslig note <trademarks.html>`__

.. raw:: html

   </div>

.. raw:: html

   <div>

3 Maj 1999 af .

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="abstract" xmlns="http://www.w3.org/1999/xhtml">

.. raw:: html

   <div class="abstract-title">

Resum?

.. raw:: html

   </div>

*Dansk version af Laust S. Jespersen ``<Laust@doc.freebsd.dk>``.*

Du installerede IPsec og det ser ud til at virke. Men hvordan ved du
det? Jeg beskriver en metode til eksperimentalt at verificere at IPsec
virker.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="docformatnavi">

[ Opdelt / `Samlet <article.html>`__ ]

.. raw:: html

   </div>

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Indholdsfortegnelse

.. raw:: html

   </div>

`1. Problemet <index.html#problem>`__
`2. L?sningen <solution.html>`__
`3. Eksperimentet <experiment.html>`__
`4. Undtagelse <caveat.html>`__
`5. IPsec---Definition <IPsec.html>`__
`6. Installering af IPsec <ipsec-install.html>`__
`7. src/sys/i386/conf/KERNELNAME <kernel.html>`__
`8. Maurers universelle statistiske test (for blok st?rrelse=8
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

1. Problemet
------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Lad os antage, at du har `installeret *IPsec* <ipsec-install.html>`__.
Hvordan ved du at det `virker <caveat.html>`__? Selvf?lgelig virker din
forbindelse ikke hvis den er miskonfigureret, og den vil virke n?r du
endelig laver det rigtigt.
`netstat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=netstat&sektion=1>`__
lister den. Men kan du verificere det uafh?ngigt?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----+-----+--------------------------------+
| ?   | ?   | ?\ `n?ste <solution.html>`__   |
+-----+-----+--------------------------------+
| ?   | ?   | ?2. L?sningen                  |
+-----+-----+--------------------------------+

.. raw:: html

   </div>

Dette og andre dokumenter kan downloades fra
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| For sp?rgsm?l om FreeBSD, l?s
  `documentationen <http://www.FreeBSD.org/docs.html>`__ f?r du
  kontakter <questions@FreeBSD.org\ >.
|  For sp?rgsm?l ang?ende denne dokumentation, e-mail
  <doc@FreeBSD.org\ >.
