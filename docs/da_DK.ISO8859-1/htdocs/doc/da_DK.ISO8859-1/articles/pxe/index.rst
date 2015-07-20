=======================
FreeBSD kvikstart Guide
=======================

.. raw:: html

   <div class="navheader">

FreeBSD kvikstart Guide
?
?
?\ `n?ste <server-config.html>`__

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

   <div class="authorgroup" xmlns="http://www.w3.org/1999/xhtml">

.. raw:: html

   <div class="author">

Alfred Perlstein
~~~~~~~~~~~~~~~~

.. raw:: html

   <div class="affiliation">

.. raw:: html

   <div class="address">

``<alfred@FreeBSD.org>``

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

`Retslig note <trademarks.html>`__

.. raw:: html

   </div>

.. raw:: html

   <div>

af .

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

Denne artikel viser metoden hvorved man kan f? maskiner til at
installere FreeBSD ved hj?lp af Intel? PXE metoden til at boote en
maskine over et netv?rk.

*Dansk version af Laust S. Jespersen ``<Laust@doc.freebsd.dk>``.*

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

`1. Introduktion <index.html#introduction>`__
`2. Server Konfiguration <server-config.html>`__
`3. Bootstrap ops?tning <bootstrap-config.html>`__
`4. Installations ops?tning <install-setup.html>`__
`5. Tilpasset Post-Install Pakke <custom-postinst-package.html>`__

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

1. Introduktion
---------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="warning" xmlns="">

Advarsel:
~~~~~~~~~

Denne procedure vil g?re “Serveren” b?de usikker og farlig. Det er bedst
bare at holde “Serveren” p? sin egen hub og ikke p? nogen m?de
tilg?ngelig for andre maskiner end “klienterne”.

.. raw:: html

   </div>

Terminologi:

.. raw:: html

   <div class="informaltable">

+-----------+--------------------------------------------------------------+
| Server:   | Maskinen der tilbyder netboot og installations muligheder.   |
+-----------+--------------------------------------------------------------+
| Klient:   | Maskinen der skal have FreeBSD installeret p? sig.           |
+-----------+--------------------------------------------------------------+

.. raw:: html

   </div>

Kr?ver: Klienter der underst?tter Intel? PXE netboot muligheden, en
Ethernet forbindelse.

Lad mig gerne vide hvis du falder over noget du har problemer med, eller
forslag til yderligere dokumentation.

Hvis du skal bruge nogen til at tr?ne/implementere et specifikt
netinstallations system for dig, s? send mig venligst en e-mail s? vi
kan diskutere vilk?r.

Jeg vil ogs? gerne takke Paul Saab og John Baldwin for, at lave det
meste af programmeringsarbejdet p? pxeboot, interfacet til Intel? PXE
(netboot) systemet.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----+-----+-------------------------------------+
| ?   | ?   | ?\ `n?ste <server-config.html>`__   |
+-----+-----+-------------------------------------+
| ?   | ?   | ?2. Server Konfiguration            |
+-----+-----+-------------------------------------+

.. raw:: html

   </div>

Dette og andre dokumenter kan downloades fra
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| For sp?rgsm?l om FreeBSD, l?s
  `documentationen <http://www.FreeBSD.org/docs.html>`__ f?r du
  kontakter <questions@FreeBSD.org\ >.
|  For sp?rgsm?l ang?ende denne dokumentation, e-mail
  <doc@FreeBSD.org\ >.
