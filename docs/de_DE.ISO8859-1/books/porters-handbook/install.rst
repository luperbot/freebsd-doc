==============================
5.14. Installation von Dateien
==============================

.. raw:: html

   <div class="navheader">

5.14. Installation von Dateien
`Zur?ck <conflicts.html>`__?
Kapitel 5. Die Konfiguration des Makefile
?\ `Weiter <special.html>`__

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

5.14. Installation von Dateien
------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

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

5.14.1. INSTALL\_\* macros
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Nutzen Sie die Makros in ``bsd.port.mk``, um korrekte Modi und
Eigent?mer von Dateien in Ihren ``*-install``-Targets sicherzustellen.

.. raw:: html

   <div class="itemizedlist">

-  ``INSTALL_PROGRAM`` ist ein Befehl, um bin?re Bin?rdateien zu
   installieren.

-  ``INSTALL_SCRIPT`` ist ein Befehl, um ausf?hrbare Skripte zu
   installieren.

-  ``INSTALL_LIB`` ist ein Befehl zur Installation Shared-Libraries.

-  ``INSTALL_KLD`` ist ein Befehl, mit dem Kernelmodule installiert
   werden k?nnen. Einige Architekturen haben Probleme mit
   stripped-Modulen. Daher sollten Sie diesen Befehl anstelle von
   ``INSTALL_PROGRAM`` verwenden.

-  ``INSTALL_DATA`` ist ein Befehl, um gemeinsam nutzbare Daten zu
   installieren.

-  ``INSTALL_MAN`` ist ein Befehl, um Manualpages oder andere
   Dokumentation zu installieren (es wird nichts komprimiert).

.. raw:: html

   </div>

Das sind grunds?tzlich alle ``install``-Befehle mit ihren passenden
Flags.

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

5.14.2. Zerlegen von Bin?rdateien und Shared-Libraries
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Zerlegen Sie keine Bin?rdateien manuell, wenn Sie es nicht m?ssen. Alle
Binaries sollten gestripped werden; allerdings vermag das
``INSTALL_PROGRAM``-Makro gleichzeitig eine Bin?rdatei zu installieren
und zu strippen (beachten Sie den n?chsten Abschnitt). Das Makro
``INSTALL_LIB`` erledigt das gleiche f?r Shared-Libraries.

Wenn Sie eine Datei strippen m?ssen, aber weder das ``INSTALL_PROGRAM``-
noch das ``INSTALL_LIB``-Makro nutzen wollen, dann kann ``${STRIP_CMD}``
Ihr Programm strippen. Dies wird typischerweise innerhalb des
``post-install``-Targets gemacht. Zum Beispiel:

.. code:: programlisting

    post-install:
        ${STRIP_CMD} ${PREFIX}/bin/xdl

Nutzen Sie
`file(1) <http://www.FreeBSD.org/cgi/man.cgi?query=file&sektion=1>`__
f?r die installierte Applikation, um zu ?berpr?fen, ob eine Bin?rdatei
gestripped ist oder nicht. Wenn es nicht meldet ``not stripped``, dann
ist es bereits gestripped. Zudem wird
`strip(1) <http://www.FreeBSD.org/cgi/man.cgi?query=strip&sektion=1>`__
nicht ein bereits gestripptes Programm nochmals versuchen zu strippen,
sondern wird stattdessen einfach sauber beenden.

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

5.14.3. Installation eines ganzen Verzeichnisbaums inklusive Dateien
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Manchmal muss man eine gro?e Zahl von Dateien unter Erhalt ihrer
hierarchischen Struktur installieren, d.h. Kopieraktionen ?ber einen
ganzen Verzeichnisbaum von ``WRKSRC`` zu einem Zielverzeichnis unter
``PREFIX``.

F?r diesen Fall gibt es zwei Makros. Der Vorteil der Nutzung dieser
Makros anstatt ``cp`` ist, dass sie korrekte Besitzer und Berechtigungen
auf den Zieldateien garantieren. Das erste Makro, ``COPYTREE_BIN``, wird
alle installierten Dateien ausf?hrbar markieren und damit passend f?r
die Installation in ``PREFIX/bin`` vorbereiten. Das zweite Makro,
``COPYTREE_SHARE``, setzt keine Ausf?hrungsberechtigungen auf Dateien
und ist daher geeignet f?r die Installation von Dateien im Target von
``PREFIX/share``.

.. code:: programlisting

    post-install:
        ${MKDIR} ${EXAMPLESDIR}
        (cd ${WRKSRC}/examples/ && ${COPYTREE_SHARE} \* ${EXAMPLESDIR})

Dieses Beispiel wird den Inhalt des ``examples``-Verzeichnisses im
Distfile des Drittanbieters in das Beispielverzeichnis Ihres Ports
kopieren.

.. code:: programlisting

    post-install:
        ${MKDIR} ${DATADIR}/summer
        (cd ${WRKSRC}/temperatures/ && ${COPYTREE_SHARE} "June July August" ${DATADIR}/summer/)

Und dieses Beispiel wird die Daten der Sommermonate in das
``summer``-Unterverzeichnis eines ``DATADIR`` installieren.

Zus?tzliche ``find``-Argumente k?nnen mit dem dritten Argument an die
``COPYTREE_*``-Makros ?bergeben werden. Um zum Beispiel alle Dateien aus
dem 1. Beispiel ohne die Makefiles zu installieren, kann man folgenden
Befehl benutzen.

.. code:: programlisting

    post-install:
        ${MKDIR} ${EXAMPLESDIR}
        (cd ${WRKSRC}/examples/ && \
        ${COPYTREE_SHARE} \* ${EXAMPLESDIR} "! -name Makefile")

Beachten Sie bitte, dass diese Makros die installierten Dateien nicht
zur ``pkg-plist`` hinzuf?gen, Sie m?ssen sie immer noch selbst
auflisten.

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

5.14.4. Installation zus?tzlicher Dokumentation
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Falls Ihre Software zus?tzlich zu den ?blichen Manualpages und
Info-Seiten weitere Dokumentation hat und Sie diese f?r n?tzlich halten,
dann installieren Sie sie unter ``PREFIX/share/doc``. Dies kann wie
vorstehend im Target des ``post-install`` geschehen.

Legen Sie ein neues Verzeichnis f?r Ihren Port an. Das Verzeichnis
sollte wiederspiegeln, was der Port ist. Das bedeutet normalerweise
``PORTNAME``. Wie auch immer, wenn Sie meinen, der Nutzer m?chte
verschiedene Versionen des Ports zur gleichen Zeit installiert haben,
dann k?nnen Sie die gesamte Variable ``PKGNAME`` nutzen.

Machen Sie die Installation von der Variablen ``NOPORTDOCS`` abh?ngig,
damit die Nutzer sie in ``/etc/make.conf`` abschalten k?nnen:

.. code:: programlisting

    post-install:
    .if !defined(NOPORTDOCS)
        ${MKDIR} ${DOCSDIR}
        ${INSTALL_MAN} ${WRKSRC}/docs/xvdocs.ps ${DOCSDIR}
    .endif

Hier einige praktische Variablen und wie sie standardm?ssig bei
Verwendung im ``Makefile`` expandiert werden:

.. raw:: html

   <div class="itemizedlist">

-  ``DATADIR`` wird expandiert zu ``PREFIX/share/PORTNAME``.

-  ``DATADIR_REL`` wird expandiert zu ``share/PORTNAME``.

-  ``DOCSDIR`` wird expandiert zu ``PREFIX/share/doc/PORTNAME``.

-  ``DOCSDIR_REL`` wird expandiert zu ``share/doc/PORTNAME``.

-  ``EXAMPLESDIR`` wird expandiert zu
   ``PREFIX/share/examples/PORTNAME``.

-  ``EXAMPLESDIR_REL`` wird expandiert zu ``share/examples/PORTNAME``.

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

``NOPORTDOCS`` behandelt nur zus?tzliche Dokumentation, die in
``DOCSDIR`` installiert ist. F?r normale Manualpages und Info-Seiten
wird die Variable benutzt. Dinge, welche in ``DATADIR`` und
``EXAMPLESDIR`` installiert werden, legen die Variablen ``NOPORTDATA``
und ``NOPORTEXAMPLES`` fest.

.. raw:: html

   </div>

Die Variablen werden nach ``PLIST_SUB`` exportiert. Ihre Werte
erscheinen dort als Pfadnamen relativ zu ``PREFIX``, falls m?glich. Das
bedeutet, dass ``share/doc/PORTNAME`` standardm?ssig ersetzt wird durch
``%%DOCSDIR%%`` in der Packliste usw. (mehr zur Ersetzung durch die
``pkg-plist`` finden Sie `hier <plist.html#plist-sub>`__).

Alle installierten Dokumentationsdateien und?–Verzeichnisse sollten in
der ``pkg-plist`` dem ``%%PORTDOCS%%``-Pr?fix enthalten sein, zum
Beispiel:

.. code:: programlisting

    %%PORTDOCS%%%%DOCSDIR%%/AUTHORS
    %%PORTDOCS%%%%DOCSDIR%%/CONTACT
    %%PORTDOCS%%@dirrm %%DOCSDIR%%

Alternativ zur Auflistung der Dokumentationsdateien in der ``pkg-plist``
kann in einem Port auch die Variable ``PORTDOCS`` gesetzt werden f?r
eine Liste von Dateien und Shell-Globs, um diese zur endg?ltigen
Packliste hinzuzuf?gen. Die Namen werden relativ zur Variable
``DOCSDIR`` sein. Wenn Sie also einen Port haben, welcher ``PORTDOCS``
benutzt, und Sie haben eine vom Standard abweichenden Platz f?r seine
Dokumentation, dann m?ssen Sie die Variable ``DOCSDIR`` entsprechend
setzen. Wenn ein Verzeichnis in ``PORTDOCS`` aufgef?hrt ist, oder von
einem Shell-Glob dieser Variable abgebildet wird, dann wird der
komplette Verzeichnisbaum inklusive Dateien und Verzeichnissen in der
endg?ltigen Packliste aufgenommen. Wenn die Variable ``NOPORTDOCS``
gesetzt ist, dann werden die Dateien und Verzeichnisse, die in
``PORTDOCS`` aufgelistet sind, nicht installiert und werden auch nicht
zur Packliste des Ports hinzugef?gt. Wie oben gezeigt bleibt es dem Port
selbst ?berlassen, die Dokumentation in ``PORTDOCS`` zu installieren.
Ein typisches Beispiel f?r den Gebrauch von ``PORTDOCS`` sieht wie folgt
aus:

.. code:: programlisting

    PORTDOCS=       README.* ChangeLog docs/*

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Die ?quivalente zu ``PORTDOCS`` f?r unter ``DATADIR`` und
``EXAMPLESDIR`` installierte Dateien sind ``PORTDATA`` beziehungsweise
``PORTEXAMPLES``.

Sie k?nnen auch ``pkg-message`` benutzen, um Meldungen w?hrend der
Installation anzuzeigen. Lesen Sie `diesen Abschnitt ?ber den Gebrauch
von ``pkg-message`` <pkg-files.html#porting-message>`__ f?r weitere
Details. Die ``pkg-message``-Datei muss nicht zur ``pkg-plist``
hinzugef?gt werden.

.. raw:: html

   </div>

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

5.14.5. Unterverzeichnisse mit PREFIX
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Lassen Sie den Port die Dateien in die richtigen Unterverzeichnisse von
``PREFIX`` verteilen. Einige Ports werfen alles in einen Topf und legen
es im Unterverzeichnis mit dem Namen des Ports ab, was falsch ist.
Ausserdem legen viele Ports alles ausser Binaries, Header-Dateien und
Manualpages in ein Unterverzeichnis von ``lib``, was nat?rlich auch
nicht der BSD-Philosophie entspricht und nicht gut funktioniert. Viele
der Dateien sollten in eines der folgenden Verzeichnisse geschoben
werden: ``etc`` (Konfigurationsdateien), ``libexec`` (intern gestartete
Bin?rdateien), ``sbin`` (Bin?rdateien f?r Superuser/Manager), ``info``
(Dokumentation f?r Info-Browser) oder ``share`` (Architektur-unabh?ngige
Dateien). Lesen Sie hierzu
`hier(7) <http://www.FreeBSD.org/cgi/man.cgi?query=hier&sektion=7>`__;
weitestgehend greifen die Regeln f?r ``/usr`` auch f?r ``/usr/local``.
Die Ausnahme sind Ports, welche mit „news“ aus dem USENET arbeiten. In
diesem Falle sollte ``PREFIX/news`` als Zielort f?r die Dateien benutzt
werden.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------+---------------------------------+--------------------------------+
| `Zur?ck <conflicts.html>`__?   | `Nach oben <makefile.html>`__   | ?\ `Weiter <special.html>`__   |
+--------------------------------+---------------------------------+--------------------------------+
| 5.13. Konfliktbehandlung?      | `Zum Anfang <index.html>`__     | ?Kapitel 6. Besonderheiten     |
+--------------------------------+---------------------------------+--------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
