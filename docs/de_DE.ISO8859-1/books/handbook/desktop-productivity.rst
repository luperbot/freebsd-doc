====================
7.3. B?roanwendungen
====================

.. raw:: html

   <div class="navheader">

7.3. B?roanwendungen
`Zur?ck <desktop-browsers.html>`__?
Kapitel 7. Desktop-Anwendungen
?\ `Weiter <desktop-viewers.html>`__

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

7.3. B?roanwendungen
--------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Neue Benutzer suchen oft ein komplettes Office-Paket oder eine leicht zu
bedienende Textverarbeitung. Einige
`Benutzeroberfl?chen <x11-wm.html>`__ wie KDE enthalten zwar ein
Office-Paket, diese werden in der Standardeinstellung unter FreeBSD aber
nicht installiert. Unabh?ngig von der verwendeten Benutzeroberfl?che
k?nnen Sie diverse Office-Pakete aber jederzeit ?ber die Ports-Sammlung
installlieren.

Dieser Abschnitt behandelt die nachstehenden Anwendungen:

.. raw:: html

   <div class="informaltable">

+---------------------+--------------------+--------------------------------------+------------------------------+
| Anwendung           | Ressourcenbedarf   | Installationsaufwand aus den Ports   | wichtige Abh?ngigkeiten      |
+=====================+====================+======================================+==============================+
| KOffice             | niedrig            | hoch                                 | KDE                          |
+---------------------+--------------------+--------------------------------------+------------------------------+
| AbiWord             | niedrig            | niedrig                              | Gtk+ oder GNOME              |
+---------------------+--------------------+--------------------------------------+------------------------------+
| The Gimp            | niedrig            | hoch                                 | Gtk+                         |
+---------------------+--------------------+--------------------------------------+------------------------------+
| Apache OpenOffice   | hoch               | enorm                                | JDK™, Mozilla                |
+---------------------+--------------------+--------------------------------------+------------------------------+
| LibreOffice         | etwas hoch         | enorm                                | Gtk+, KDE/ GNOME oder JDK™   |
+---------------------+--------------------+--------------------------------------+------------------------------+

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

7.3.1. KOffice
~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die KDE-Gemeinschaft stellt ein Office-Paket bereit, das auch au?erhalb
von KDE eingesetzt werden kann. Es besteht aus vier, von anderen
Office-Paketen bekannten, Komponenten: KWord ist die Textverarbeitung,
KSpread die Tabellenkalkulation, mit KPresenter werden Pr?sentationen
erstellt und Kontour ist ein Zeichenprogramm.

Stellen Sie vor der Installation des neusten KOffice sicher, dass Sie
eine aktuelle Version von KDE besitzen.

Mit dem folgenden Kommando installieren Sie das KOffice-Paket f?r KDE4:

.. code:: screen

    # pkg_add -r koffice-kde4

Wenn das Paket nicht zur Verf?gung steht, benutzen Sie bitte die
Ports-Sammlung. Wenn Sie beispielsweise KOffice f?r KDE4 installieren
wollen, setzen Sie die nachstehendenen Befehle ab:

.. code:: screen

    # cd /usr/ports/editors/koffice-kde4
    # make install clean

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

7.3.2. AbiWord
~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

AbiWord ist eine freie Textverarbeitung, die ?hnlich wie Microsoft? Word
ist. Sie k?nnen damit Artikel, Briefe, Berichte, Notizen usw. verfassen.
Das Programm ist sehr schnell, besitzt viele Funktionen und ist sehr
benutzerfreundlich.

AbiWord kann viele Dateiformate, unter anderem nicht offene wie ``.doc``
von Microsoft?, importieren und exportieren.

Das AbiWord-Paket installieren Sie wie folgt:

.. code:: screen

    # pkg_add -r AbiWord

Sollte das Paket nicht zur Verf?gung stehen, k?nnen Sie das Programm mit
der Ports-Sammlung, die zudem aktueller als die Pakete ist, ?bersetzen.
Gehen Sie dazu folgenderma?en vor:

.. code:: screen

    # cd /usr/ports/editors/AbiWord
    # make install clean

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

7.3.3. The GIMP
~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The GIMP ist ein sehr ausgereiftes Bildverarbeitungsprogramm mit dem Sie
Bilder erstellen oder retuschieren k?nnen. Sie k?nnen es sowohl als
einfaches Zeichenprogramm als auch zum retuschieren von Fotografien
benutzen. Das Programm besitzt eine eingebaute Skriptsprache und es
existieren sehr viele Plug-Ins. The GIMP kann Bilder in zahlreichen
Formaten lesen und speichern und stellt Schnittstellen zu Scannern und
grafischen Tabletts zur Verf?gung.

Sie installieren das Paket mit dem nachstehenden Befehl:

.. code:: screen

    # pkg_add -r gimp

Benutzen Sie die Ports-Sammlung, wenn Ihr FTP-Server das Paket nicht
bereitstellt. Im Verzeichnis
`graphics <../../../../ports/graphics.html>`__ finden Sie das Handbuch
The Gimp Manual. Sie k?nnen alles mit den folgenden Befehlen
installieren:

.. code:: screen

    # cd /usr/ports/graphics/gimp
    # make install clean
    # cd /usr/ports/graphics/gimp-manual-pdf
    # make install clean

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Die Entwickler-Version von The GIMP finden Sie im Verzeichnis
`graphics <../../../../ports/graphics.html>`__ der Ports-Sammlung. Das
Handbuch ist im HTML-Format
(`graphics/gimp-manual-html <http://www.freebsd.org/cgi/url.cgi?ports/graphics/gimp-manual-html/pkg-descr>`__)
erh?ltlich.

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

7.3.4. Apache OpenOffice
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Am 1. Juni 2011 spendete die Oracle Corporation den Quellcode von
OpenOffice.org an die Apache Software Foundation. OpenOffice.org ist
jetzt als Apache OpenOffice bekannt und wird nun unter dem Fl?gel eines
Incubator der Apache Software Foundation entwickelt.

Apache OpenOffice enth?lt alles, was von einem Office-Paket erwartet
wird: Textverarbeitung, Tabellenkalkulation, Pr?sentation und ein
Zeichenprogramm. Die Bedienung gleicht anderen Office-Paketen und das
Programm kann zahlreiche Dateiformate importieren und exportieren. Es
gibt lokalisierte Versionen mit angepassten Men?s,
Rechtschreibkontrollen und W?rterb?chern.

Die Textverarbeitung von Apache OpenOffice speichert Dateien im
XML-Format. Dadurch wird die Verwendbarkeit der Dateien auf anderen
Systemen erh?ht und die Handhabung der Daten vereinfacht. Die
Tabellenkalkulation besitzt eine Makrosprache und eine Schnittstelle zu
Datenbanken. Apache OpenOffice l?uft auf Windows?, Solaris™, Linux,
FreeBSD und Mac?OS??X. Weitere Informationen ?ber Apache OpenOffice
finden Sie auf der `Apache OpenOffice
Website <http://www.openoffice.org/>`__. Spezifische Informationen f?r
FreeBSD finden Sie auf der Webseite `FreeBSD Apache OpenOffice Porting
Team <http://porting.openoffice.org/freebsd/>`__. Von dort k?nnen Sie
auch direkt das OpenOffice-Paket herunterladen.

Apache OpenOffice installieren Sie wie folgt:

.. code:: screen

    # pkg_add -r apache-openoffice

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Diese Art der Installation sollte mit einer -RELEASE-Version
funktionieren. Verwenden Sie eine andere Version, sollten Sie die
Internetseite des FreeBSD Apache OpenOffice Porting Teams besuchen und
das entsprechende Paket herunterladen und ?ber
`pkg\_add(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_add&sektion=1>`__
installieren, wobei Sie zwischen der aktuellen Version und der
Entwicklerversion w?hlen k?nnen.

.. raw:: html

   </div>

Nachdem das Paket installiert ist, m?ssen Sie lediglich folgenden Befehl
eingeben, um Apache OpenOffice zu starten:

.. code:: screen

    % openoffice-X.Y.Z

wobei es sich bei *``X.Y.Z``* um die Versionsnummer des installierten
Apache OpenOffice handelt, z.B. *``3.4.0``*.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Nach dem ersten Start werden Ihnen einige Fragen gestellt. Au?erdem wird
in Ihrem Heimatverzeichnis der neue Unterordner ``.openoffice.org``
angelegt.

.. raw:: html

   </div>

Falls die Apache OpenOffice-Pakete nicht zur Verf?gung stehen, k?nnen
Sie immer noch die Ports-Sammlung benutzen. Beachten Sie aber bitte,
dass Sie sehr viel Plattenplatz und Zeit ben?tigen, um die Quellen zu
?bersetzen.

.. code:: screen

    # cd /usr/ports/editors/openoffice-3
    # make install clean

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Wenn Sie ein lokalisierte Version bauen wollen, ersetzen Sie den letzten
Befehl durch die folgende Zeile:

.. code:: screen

    # make LOCALIZED_LANG=Ihre_Sprache install clean

Dabei ersetzen Sie *``Ihre_Sprache``* durch den korrekten ISO-Code. Eine
Liste der unterst?tzten Codes enth?lt die Datei
``files/Makefile.localized``, die sich im Portsverzeichnis befindet.

.. raw:: html

   </div>

Nachdem die Installation abgeschlossen ist, k?nnen Sie Apache OpenOffice
durch folgenden Befehl starten:

.. code:: screen

    % openoffice-X.Y.Z

wobei *``X.Y.Z``* f?r die Versionsnummer des installierten Apache
OpenOffice steht, z.B. *``3.4.0``*.

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

7.3.5. LibreOffice
~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

LibreOffice ist ein als freie Software verf?gbares Office-Paket, welches
von `The Document Foundation <http://www.documentfoundation.org/>`__
entwickelt wird, das mit anderen grossen Office-Paketen kompatibel ist
und auf einer Vielzahl von Plattformen lauff?hig ist. Es ist ein Fork
von OpenOffice.org unter neuem Namen, der alle notwendigen Anwendungen
in einem kompletten B?roanwendungspaket enth?lt: eine Textverarbeitung,
eine Tabellenkalkulation, ein Pr?sentationsmanager, ein Zeichenprogramm,
ein Datenbankmanagementprogramm und ein Werkzeug zum Erstellen und
Bearbeiten von mathematischen Formeln. Es steht in einer Reihe von
Sprachen zur Verf?gung; die Internationalisierung wurde auf die
Oberfl?che, Rechtschreibkorrektur und die W?rterb?cher ausgeweitet.

Das Textverarbeitungsprogramm von LibreOffice benutzt ein natives
XML-Dateiformat f?r erh?hte Portabilit?t und Flexibilit?t. Die
Tabellenkalkulation enth?lt eine Makrosprache und kann mit externen
Datenbanken Verbindungen herstellen. LibreOffice ist bereits stabil
genug und l?uft nativ auf Windows?, Linux, FreeBSD und Mac?OS??X.
Weitere Informationen zu LibreOffice k?nnen auf der `LibreOffice
Webseite <http://www.libreoffice.org/>`__ abgerufen werden.

Um LibreOffice als Paket zu installieren, geben Sie folgenden Befehl
ein:

.. code:: screen

    # pkg_add -r libreoffice

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Dies sollte funktionieren, wenn Sie eine -RELEASE-Version von FreeBSD
einsetzen.

.. raw:: html

   </div>

Sobald das Paket installiert ist, geben Sie das folgende Kommando ein,
um LibreOffice zu starten:

.. code:: screen

    % libreoffice

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

W?hrend des ersten Starts werden Sie ein paar Fragen gestellt bekommen
und es wird ein Verzeichnis ``.libreoffice`` in Ihrem Heimatverzeichnis
erstellt.

.. raw:: html

   </div>

Wenn die LibreOffice-Pakete nicht verf?gbar sind, haben Sie immer noch
die M?glichkeit, den Port zu verwenden. Jedoch m?ssen Sie bedenken, dass
dies eine Menge Speicherplatz ben?tigt und viel Zeit in Anspruch nimmt,
bis der Port fertig gebaut ist.

.. code:: screen

    # cd /usr/ports/editors/libreoffice
    # make install clean

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Wenn Sie eine Version in Ihrer Sprache bauen m?chten, ersetzen Sie das
vorhergehende Kommando mit dem folgenden:

.. code:: screen

    # make LOCALIZED_LANG=ihre_Sprache install clean

Sie m?ssen *``ihre_Sprache``* mit dem richtigen ISO-Code f?r ihre
Sprache ersetzen. Eine Liste von unterst?tzten Sprachcodes sind im
``Makefile`` des Ports als ``pre-fetch``-Target verf?gbar.

.. raw:: html

   </div>

Sobald dies abgeschlossen ist, kann LibreOffice mit dem folgenden Befehl
gestartet werden:

.. code:: screen

    % libreoffice

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------+--------------------------------+----------------------------------------+
| `Zur?ck <desktop-browsers.html>`__?   | `Nach oben <desktop.html>`__   | ?\ `Weiter <desktop-viewers.html>`__   |
+---------------------------------------+--------------------------------+----------------------------------------+
| 7.2. Browser?                         | `Zum Anfang <index.html>`__    | ?7.4. Anzeigen von Dokumenten          |
+---------------------------------------+--------------------------------+----------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
