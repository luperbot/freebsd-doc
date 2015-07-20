==============================================
5.12. Die Festlegung des Arbeitsverzeichnisses
==============================================

.. raw:: html

   <div class="navheader">

5.12. Die Festlegung des Arbeitsverzeichnisses
`Zur?ck <makefile-options.html>`__?
Kapitel 5. Die Konfiguration des Makefile
?\ `Weiter <conflicts.html>`__

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

5.12. Die Festlegung des Arbeitsverzeichnisses
----------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Jeder Port wird extrahiert in ein Arbeitsverzeichnis, welches
beschreibbar sein muss. Das Ports-System gibt als Standard vor, dass die
``DISTFILES`` in einem Verzeichnis namens ``${DISTNAME}`` entpackt
werden. Mit anderen Worten, wenn Sie:

.. code:: programlisting

    PORTNAME=      foo
    PORTVERSION=   1.0

festgelegt haben, dann enthalten die Distributions-Dateien des Ports ein
Verzeichnis auf oberster Ebene, ``foo-1.0``, und der Rest der Dateien
befindet sich unter diesem Verzeichnis.

Es gibt eine Reihe von Variablen, die Sie ?berschreiben k?nnen, falls
dies nicht der Fall sein sollte.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.12.1. ``WRKSRC``
~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Diese Variable listet den Namen des Verzeichnisses, welches erstellt
wird, wenn die Distfiles der Applikation extrahiert werden. Wenn unser
vorheriges Beispiel in einem Verzeichnis namens ``foo`` (und nicht
``foo-1.0``) extrahiert wurde, w?rden Sie schreiben:

.. code:: programlisting

    WRKSRC=      ${WRKDIR}/foo

oder m?glicherweise

.. code:: programlisting

    WRKSRC=      ${WRKDIR}/${PORTNAME}
          

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.12.2. ``NO_WRKSUBDIR``
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn der Port ?berhaupt nicht in einem Unterverzeichnis extrahiert wird,
sollten Sie dies mit dem Setzen von ``NO_WRKSUBDIR`` anzeigen.

.. code:: programlisting

    NO_WRKSUBDIR= yes

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------+---------------------------------+----------------------------------+
| `Zur?ck <makefile-options.html>`__?   | `Nach oben <makefile.html>`__   | ?\ `Weiter <conflicts.html>`__   |
+---------------------------------------+---------------------------------+----------------------------------+
| 5.11. Makefile-Optionen?              | `Zum Anfang <index.html>`__     | ?5.13. Konfliktbehandlung        |
+---------------------------------------+---------------------------------+----------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
