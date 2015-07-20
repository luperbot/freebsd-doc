=====================================
Kapitel 3. Einen neuen Port erstellen
=====================================

.. raw:: html

   <div class="navheader">

Kapitel 3. Einen neuen Port erstellen
`Zur?ck <own-port.html>`__?
?
?\ `Weiter <porting-desc.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="chapter">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Inhaltsverzeichnis

.. raw:: html

   </div>

`3.1. Das ``Makefile``
schreiben <quick-porting.html#porting-makefile>`__
`3.2. Die Beschreibungsdateien erstellen <porting-desc.html>`__
`3.3. Die Checksummendatei erzeugen <porting-checksum.html>`__
`3.4. Den Port testen <porting-testing.html>`__
`3.5. Ihren Port mit ``portlint`` ?berpr?fen <porting-portlint.html>`__
`3.6. Den neuen Port einreichen <porting-submitting.html>`__

.. raw:: html

   </div>

Dieser Abschnitt beschreibt, wie Sie schnell einen neuen Port erstellen
k?nnen. In vielen F?llen ist dies allerdings nicht ausreichend, dann
werden Sie in diesem Buch weiterlesen m?ssen.

Als Erstes besorgen Sie sich das Original-Tarball (komprimiertes Archiv)
und legen es im ``DISTDIR`` ab, welches standardm??ig
``/usr/ports/distfiles`` ist.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Im Folgenden wird angenommen, dass die Software unver?ndert kompiliert
werden konnte, dass also keinerlei ?nderungen n?tig waren, um den Port
auf Ihrem FreeBSD-Rechner zum Laufen zu bringen. Falls Sie ?nderungen
vornehmen mussten, werden Sie auch den n?chsten Abschnitt beachten
m?ssen.

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

3.1. Das ``Makefile`` schreiben
-------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Ein minimales ``Makefile`` sieht in etwa so aus:

.. code:: programlisting

    # New ports collection makefile for:   oneko
    # Date created:        5 December 1994
    # Whom:                asami
    #
    # $FreeBSD$
    #

    PORTNAME=      oneko
    PORTVERSION=   1.1b
    CATEGORIES=    games
    MASTER_SITES=  ftp://ftp.cs.columbia.edu/archives/X11R5/contrib/

    MAINTAINER=    asami@FreeBSD.org
    COMMENT=       A cat chasing a mouse all over the screen

    MAN1=          oneko.1
    MANCOMPRESSED= yes
    USE_IMAKE=     yes

    .include <bsd.port.mk>

Versuchen Sie es zu verstehen. Machen Sie sich keine Gedanken um die
``$FreeBSD$``-Zeile, diese wird automatisch vom CVS eingef?gt, wenn der
Port in den Haupt-Ports-Tree importiert wird. Ein detailliertes Beispiel
finden Sie im Abschnitt `sample Makefile <porting-samplem.html>`__.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------+-------------------------------+--------------------------------------------+
| `Zur?ck <own-port.html>`__?              | ?                             | ?\ `Weiter <porting-desc.html>`__          |
+------------------------------------------+-------------------------------+--------------------------------------------+
| Kapitel 2. Einen neuen Port erstellen?   | `Zum Anfang <index.html>`__   | ?3.2. Die Beschreibungsdateien erstellen   |
+------------------------------------------+-------------------------------+--------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
