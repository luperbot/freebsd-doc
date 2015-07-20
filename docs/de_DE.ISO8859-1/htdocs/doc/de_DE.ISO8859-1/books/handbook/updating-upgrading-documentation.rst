==============================================
26.4. Aktualisieren der Dokumentationssammlung
==============================================

.. raw:: html

   <div class="navheader">

26.4. Aktualisieren der Dokumentationssammlung
`Zur?ck <updating-upgrading-portsnap.html>`__?
Kapitel 26. FreeBSD aktualisieren
?\ `Weiter <current-stable.html>`__

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

26.4. Aktualisieren der Dokumentationssammlung
----------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

?bersetzt von Benedict Reuschling.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Neben dem Basissystem und der Ports-Sammlung ist die Dokumentation ein
wichtiger Bestandteil des FreeBSD Betriebssystems. Obwohl eine aktuelle
Version der FreeBSD Dokumentation jederzeit auf der `FreeBSD
Webseite <http://www.freebsd.org/doc/>`__ verf?gbar ist, verf?gen manche
Benutzer nur ?ber eine langsame oder ?berhaupt keine Netzwerkverbindung.
Gl?cklicherweise gibt es mehrere M?glichkeiten, die Dokumentation,
welche mit jeder Version ausgeliefert wird, zu aktualisieren, indem eine
lokale Kopie der aktuellen FreeBSD-Dokumentationssammlung verwendet
wird.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

26.4.1. Verwenden von CVSup um die Dokumentation zu aktualisieren
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Quellen und die installierte Kopie der FreeBSD Dokumentation kann
mittels CVSup aktualisiert werden, indem ein ?hnlicher Mechanismus
angewendet wird, wie derjenige f?r die Betriebssystemquellen
(vergleichen Sie mit `Abschnitt?26.7, „Das komplette Basissystem neu
bauen“ <makeworld.html>`__). Dieser Abschnitt beschreibt:

.. raw:: html

   <div class="itemizedlist">

-  Wie die Dokumentations-Werkzeugsammlung installiert wird, welche die
   Werkzeuge enth?lt, die n?tig sind, um die FreeBSD Dokumentation aus
   den Quellen neu zu erstellen.

-  Wie man eine Kopie der Dokumentationsquellen nach ``/usr/doc``
   herunterl?dt, unter Verwendung von CVSup.

-  Wie man die FreeBSD Dokumentation aus den Quellen baut und unter
   ``/usr/share/doc`` installiert.

-  Manche der Optionen zum Erstellen, die vom System zum Bauen der
   Dokumentation unterst?tzt werden, z.B. die Optionen welche nur ein
   paar der unterschiedlichen Sprach?bersetzungen der Dokumentation
   erstellen oder die Optionen, die ein bestimmtes Ausgabeformat
   ausw?hlen.

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

26.4.2. CVSup und die Werkzeugsammlung der Dokumentation installieren
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die FreeBSD Dokumentation aus dem Quellen zu erstellen ben?tigt eine
ziemlich grosse Anzahl an Werkzeugen. Diese Werkzeuge sind nicht Teil
des FreeBSD Basissystems, da sie eine grosse Menge an Plattenplatz
verbrauchen und nicht von allen FreeBSD-Anwendern ben?tigt werden. Sie
sind nur f?r diejenigen Benutzer notwendig, die aktiv an neuer
Dokumentation f? FreeBSD schreiben oder h?ufig ihre Dokumentation aus
den Quellen bauen lassen.

Alle ben?tigten Werkzeuge sind als Teil der Ports-Sammlung verf?gbar.
Der Port
`textproc/docproj <http://www.freebsd.org/cgi/url.cgi?ports/textproc/docproj/pkg-descr>`__
dient als Masterport, der vom FreeBSD Documentation Project entwickelt
wurde, um die initiale Installation und zuk?nftige Aktualisierungen
dieser Werkzeuge zu vereinfachen.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Wenn Sie die Dokumentation nicht als PostScript? oder PDF ben?tigen,
k?nnen Sie alternativ die Installation des
`textproc/docproj-nojadetex <http://www.freebsd.org/cgi/url.cgi?ports/textproc/docproj-nojadetex/pkg-descr>`__-Ports
in Erw?gung ziehen. Diese Version der Dokumentations-Werkzeugsammlung
enth?lt alles ausser das teTeX-Textsatzsystem. teTeX ist eine sehr
grosse Sammlung an Werkzeugen, deshalb ist es vern?nftig, deren
Installation auszulassen, wenn die Ausgabe von PDF nicht unbedingt
gebraucht wird.

.. raw:: html

   </div>

F?r weitere Informationen ?ber das Installieren und Verwenden von CVSup,
lesen Sie `CVSup verwenden <cvsup.html>`__.

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

26.4.3. Die Dokumentationsquellen aktualisieren
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das Programm CVSup kann eine saubere Kopie der Dokumentationsquellen
holen, indem es die Datei ``/usr/share/examples/cvsup/doc-supfile`` als
Konfigurationsvorlage verwendet. Der Standard-Host zum Aktualisieren ist
auf einen Platzhalterwert im ``doc-supfile`` gesetzt, aber
`cvsup(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cvsup&sektion=1>`__
akzeptiert auch einen Hostnamen ?ber die Kommandozeile. Somit k?nnen die
Dokumentationsquellen von einem der CVSup-Server geholt werden, indem
man eingibt:

.. code:: screen

    # cvsup -h cvsup.FreeBSD.org -g -L 2 /usr/share/examples/cvsup/doc-supfile

?ndern Sie *``cvsup.FreeBSD.org``* auf den Ihnen am n?chsten gelegenen
CVSup-Server. Eine vollst?ndige Liste von Spiegelservern finden Sie
unter `Abschnitt?A.8.7, „CVSup-Server“ <cvsup.html#cvsup-mirrors>`__.

Es dauert eine Weile, wenn die Dokumentationsquellen das allererste Mal
heruntergeladen werden. Lassen Sie es laufen, bis es fertig ist.

Zuk?nftige Aktualisierungen der Dokumentationsquellen k?nnen Sie ?ber
den gleichen Befehl bekommen. Das Programm CVSup l?dt und kopiert nur
diejenigen Aktualisierungen herunter, die seit seinem letzten Aufruf
hinzugekommen sind. Deshalb sollte jeder weitere Aufruf von CVSup nach
dem Ersten wesentlich schneller abgeschlossen sein.

Nachdem die Quellen einmal ausgecheckt wurden, besteht ein anderer Weg,
die Dokumentation zu aktualisieren, darin, das ``Makefile`` im
Verzeichnis ``/usr/doc`` anzupassen. Durch setzen von ``SUP_UPDATE``,
``SUPHOST`` und ``DOCSUPFILE`` in der Datei ``/etc/make.conf`` ist es
jetzt m?glich, folgendes zu tun:

.. code:: screen

    # cd /usr/doc
    # make update

Ein typischer Satz dieser
`make(1) <http://www.FreeBSD.org/cgi/man.cgi?query=make&sektion=1>`__-Optionen
f?r ``/etc/make.conf`` ist:

.. code:: programlisting

    SUP_UPDATE= yes
    SUPHOST?= cvsup.freebsd.org
    DOCSUPFILE?= /usr/share/examples/cvsup/doc-supfile

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Das Setzen des Werts von ``SUPHOST`` und ``DOCSUPFILE`` auf ``?=``
erlaubt es, diese in der Kommandozeile von make zu ?berschreiben. Diese
Methode wird empfohlen, um Optionen zu ``make.conf`` hinzuzuf?gen, um zu
verhindern, dass man die Datei jedes Mal bearbeiten muss, um einen
anderen Wert f?r die Option auszuprobieren.

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

26.4.4. Einstellbare Optionen der Dokumentationsquellen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das System zum aktualisieren und erstellen der FreeBSD-Dokumentation
unterst?tzt ein paar Optionen, welche den Prozess der Aktualisierung von
Teilen der Dokumentation oder einer bestimmten ?bersetzung erleichtert.
Diese Optionen lassen sich entweder systemweit in der Datei
``/etc/make.conf`` setzen, oder als Kommandozeilenoptionen, die dem
`make(1) <http://www.FreeBSD.org/cgi/man.cgi?query=make&sektion=1>`__-Werkzeug
?bergeben werden.

Die folgenden Optionen sind ein paar davon:

.. raw:: html

   <div class="variablelist">

``DOC_LANG``
    Eine Liste von Sprachen und Kodierungen, die gebaut und installiert
    werden sollen, z.B. ``en_US.ISO8859-1``, um nur die englische
    Dokumentation zu erhalten.

``FORMATS``
    Ein einzelnes Format oder eine Liste von Ausgabeformaten, das gebaut
    werden soll. Momentan werden ``html``, ``html-split``, ``txt``,
    ``ps``, ``pdf``, und ``rtf`` unterst?tzt.

``SUPHOST``
    Der Hostname des CVSup-Servers, der verwendet werden soll, um
    Aktualisierungen zu holen.

``DOCDIR``
    Wohin die Dokumentation installiert werden soll. Der Standardpfad
    ist ``/usr/share/doc``.

.. raw:: html

   </div>

F?r weitere make-Variablen, die als systemweite Optionen in FreeBSD
unterst?tzt werden, lesen Sie
`make.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=make.conf&sektion=5>`__.

F?r weitere make-Variablen, die vom System zum Erstellen der
FreeBSD-Dokumentation unterst?tzt werden, lesen Sie die `Fibel f?r neue
Mitarbeiter des
FreeBSD-Dokumentationsprojekts <../../../../doc/de_DE.ISO8859-1/books/fdp-primer>`__.

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

26.4.5. Die FreeBSD-Dokumentation aus den Quellen installieren
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn ein aktueller Schnappschuss der Dokumentationsquellen nach
``/usr/doc`` heruntergeladen wurde, ist alles bereit f?r eine
Aktualisierung der bestehenden Dokumentation.

Eine komplette Aktualisierung aller Sprachoptionen, definiert durch die
``DOC_LANG`` Makefile-Option, kann durch folgende Eingabe erreicht
werden:

.. code:: screen

    # cd /usr/doc
    # make install clean

Wenn ``make.conf`` mit den richtigen Optionen ``DOCSUPFILE``,
``SUPHOST`` und ``SUP_UPDATE`` eingerichtet wurde, kann der
Installationsschritt mit einer Aktualisierung der Dokumentationsquellen
kombiniert werden, indem man eingibt:

.. code:: screen

    # cd /usr/doc
    # make update install clean

Wenn nur eine Aktualisierung einer bestimmten Sprache gew?nscht wird,
kann
`make(1) <http://www.FreeBSD.org/cgi/man.cgi?query=make&sektion=1>`__ in
einem sprachspezifischen Unterverzeichnis von ``/usr/doc`` aufgerufen
werden, z.B.:

.. code:: screen

    # cd /usr/doc/en_US.ISO8859-1
    # make update install clean

Die zu installierenden Ausgabeformate k?nnen durch das Setzen der
make-Variablen ``FORMATS`` angegeben werden, z.B.:

.. code:: screen

    # cd /usr/doc
    # make FORMATS='html html-split' install clean

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

26.4.6. Verwendung von Dokumentations-Ports
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div>

Basierend auf der Arbeit von Marc Fonvieille.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Im vorherigen Abschnitt wurde eine Methode gezeigt, wie die
FreeBSD-Dokumentation aus den Quellen gebaut werden kann. Allerdings
sind quellbasierte Aktualisierungen m?glicherweise nicht f?r alle
FreeBSD-Systeme geeignet oder praktikabel. Das Erstellen der
Dokumentationsquellen ben?tigt eine grosse Anzahl an Werkzeugen,
Programmen und Hilfsmitteln, die *documentation toolchain*, ein gewisser
Grad an Vertrautheit mit CVS und ausgecheckte Quellen von einem
Repository, sowie ein paar manuelle Schritte, um diese ausgecheckten
Quellen zu bauen. In diesem Abschnitt wird eine alternative Art und
Weise vorgestellt, wie man die installierte Kopie der
FreeBSD-Dokumentation aktualisieren kann. Diese Methode verwendet die
Ports-Sammlung und erlaubt es:

.. raw:: html

   <div class="itemizedlist">

-  vorgefertigte Schnappsch?sse der Dokumentation herunter zu laden und
   zu installieren, ohne vorher irgendetwas lokal zu erstellen (dadurch
   ist es nicht mehr notwendig, den kompletten Werkzeugkasten der
   Dokumentation zu installieren).

-  die Dokumentationsquellen herunterzuladen und durch das Ports-System
   erstellen zu lassen (was die Schritte zum Auschecken und Erstellen
   etwas erleichtert).

.. raw:: html

   </div>

Diese beiden Methoden der Aktualisierung der FreeBSD-Dokumentation
werden durch eine Menge von *Dokumentations-Ports* unterst?tzt, die von
Documentation Engineering Team ``<doceng@FreeBSD.org>`` monatlich
aktualisiert wird. Diese sind in der Ports-Sammlung unter der virtuellen
Kategorie, `docs <http://www.freshports.org/docs/>`__ genannt, gelistet.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

26.4.6.1. Erstellen und Installieren von Dokumentations-Ports
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Dokumentations-Ports nutzen das Ports-System, um das Erstellen von
Dokumentation wesentlich einfacher zu machen. Es automatisiert den
Prozess des Auscheckens der Dokumentationsquellen, aufrufen von
`make(1) <http://www.FreeBSD.org/cgi/man.cgi?query=make&sektion=1>`__
mit den passenden Umgebungsvariablen und Kommandozeilenoptionen und
macht die Installation und Deinstallation von Dokumentation so einfach
wie die Installation von jedem anderen Port oder Paket.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Als zus?tzliche Eigenschaft zeichnen sie eine Abh?ngigkeit zum
*Dokumentations-Werkzeugsatz* auf, wenn die Dokumentations-Ports lokal
erstellt werden, weshalb dieser auch automatisch mitinstalliert wird.

.. raw:: html

   </div>

Die Dokumentations-Ports sind wie folgt organisiert:

.. raw:: html

   <div class="itemizedlist">

-  Es existiert ein „Master-Port“,
   `misc/freebsd-doc-en <http://www.freebsd.org/cgi/url.cgi?ports/misc/freebsd-doc-en/pkg-descr>`__,
   in dem alle Dateien zu den Dokumentations-Ports abgelegt sind. Es
   dient als Basis f?r alle Dokumentations-Ports. Als Voreinstellung
   wird nur die englische Dokumentation gebaut.

-  Es gibt einen „Alles-in-Einem-Port“,
   `misc/freebsd-doc-all <http://www.freebsd.org/cgi/url.cgi?ports/misc/freebsd-doc-all/pkg-descr>`__,
   welcher die komplette Dokumentation in allen verf?gbaren Sprachen
   erstellt und installiert.

-  Schliesslich gibt es noch einen sogenannten „slave port“ f?r jede
   ?bersetzung, z.B.:
   `misc/freebsd-doc-hu <http://www.freebsd.org/cgi/url.cgi?ports/misc/freebsd-doc-hu/pkg-descr>`__
   f?r Dokumentation in ungarischer Sprache. All diese ben?tigen den
   Master-Port und installieren die ?bersetzte Dokumentation in der
   entsprechenden Sprache.

.. raw:: html

   </div>

Um einen Dokumentations-Port aus den Quellen zu installieren, geben Sie
das folgende Kommando (als ``root``) ein:

.. code:: screen

    # cd /usr/ports/misc/freebsd-doc-en
    # make install clean

Auf diese Weise wird die englische Dokumentation gebaut und als
getrenntes HTML-Format im Verzeichnis ``/usr/local/share/doc/freebsd``
installiert (genau wie unter ``http://www.FreeBSD.org`` zu finden).

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

26.4.6.1.1. Gebr?uchliche Schalter und Optionen
'''''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Es gibt viele Optionen, um das Standarderhalten der Dokumentations-Ports
zu ver?ndern. Im Folgenden sind nur ein paar davon aufgef?hrt:

.. raw:: html

   <div class="variablelist">

``WITH_HTML``
    Erlaubt das Erstellen im HTML-Format: eine einzige HTML-Datei pro
    Dokument. Die formatierte Dokumentation wird als Datei mit dem Namen
    ``article.html`` gespeichert, oder, je nachdem, als ``book.html``,
    zuzu?glich der Bilder.

``WITH_PDF``
    Erlaubt das Erstellen von Adobe? Portable Document Format, f?r die
    Verwendung mit Adobe? Acrobat?Reader?, Ghostscript oder anderen
    PDF-Betrachtern. Die formatierte Dokumentation wird als Datei mit
    dem Namen ``article.pdf`` oder, soweit angemessen, als ``book.pdf``
    gespeichert.

``DOCBASE``
    Wohin die Dokumentation installiert werden soll. Der Standardpfad
    ist ``/usr/local/share/doc/freebsd``.

    .. raw:: html

       <div class="note" xmlns="">

    Anmerkung:
    ~~~~~~~~~~

    Beachten Sie, dass sich der Standardpfad von dem Verzeichnis
    unterscheidet, das von der CVSup-Methode verwendet wird. Das liegt
    daran, dass ein Port installiert wird und diese ?blicherweise im
    Verzeichnis ``/usr/local`` abgelegt werden. Durch setzen der
    ``PREFIX``-Variablen kann dieses Verhalten ge?ndert werden.

    .. raw:: html

       </div>

.. raw:: html

   </div>

Es folgt ein kurzes Beispiel, wie die Variablen verwendet werden, um die
oben erw?hnte ungarische Dokumentation als Portable Document Format zu
installieren:

.. code:: screen

    # cd /usr/ports/misc/freebsd-doc-hu
    # make -DWITH_PDF DOCBASE=share/doc/freebsd/hu install clean

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

26.4.6.2. Verwendung von Dokumentations-Paketen
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das Erstellen der Dokumentations-Ports aus den Quellen, wie im
vorherigen Abschnitt beschrieben, ben?tigt die lokale Installation der
Dokumentations-Werkzeugsammlung und ein wenig Festplattenspeicher f?r
das Bauen der Ports. Sollten die Ressourcen zum Bauen der
Dokumentations-Werkzeugsammlung nicht zur Verf?gung stehen, oder weil
das erstellen zuviel Plattenplatz ben?tigen w?rde, ist es trotzdem
m?glich, bereits zuvor gebaute Schnappsch?sse der Dokumentations-Ports
zu installieren.

Documentation Engineering Team ``<doceng@FreeBSD.org>`` erstellt
monatliche Schnappsch?sse der Dokumentations-Pakete von FreeBSD. Diese
Bin?rpakete k?nnen mit jedem der mitgelieferten Paketwerkzeuge
installiert werden, beispielsweise
`pkg\_add(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_add&sektion=1>`__,
`pkg\_delete(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_delete&sektion=1>`__
und so weiter.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Wenn Bin?rpakete zu Einsatz kommen, wird die FreeBSD-Dokumentation in
*allen* verf?gbaren Formaten in der gegebenen Sprache installiert.

.. raw:: html

   </div>

Zum Beispiel installiert das folgende Kommando das aktuelle,
vorgefertigte Paket der ungarischen Dokumentation:

.. code:: screen

    # pkg_add -r hu-freebsd-doc

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Pakete haben das folgende Namensformat, welches sich von dem Namen des
dazugeh?rigen Ports unterscheidet: ``lang-freebsd-doc``. *``lang``*
entspricht hier der Kurzform des Sprachcodes, z.B. ``hu`` f?r Ungarisch,
oder ``zh_cn`` f?r vereinfachtes Chinesisch.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

26.4.6.3. Dokumentations-Ports aktualisieren
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Um einen zuvor installierten Dokumentations-Port zu aktualisieren, kann
jedes Werkzeug, das auch zum Aktualisieren von Ports verwendet wird,
eingesetzt werden. Beispielsweise aktualisiert das folgende Kommando die
installierte ungarische Dokumentation mittels des Programms
`ports-mgmt/portupgrade <http://www.freebsd.org/cgi/url.cgi?ports/ports-mgmt/portupgrade/pkg-descr>`__
indem nur Pakete verwendet werden sollen:

.. code:: screen

    # portupgrade -PP hu-freebsd-doc

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------------------------------------+-------------------------------------------+-----------------------------------------+
| `Zur?ck <updating-upgrading-portsnap.html>`__?                        | `Nach oben <updating-upgrading.html>`__   | ?\ `Weiter <current-stable.html>`__     |
+-----------------------------------------------------------------------+-------------------------------------------+-----------------------------------------+
| 26.3. Portsnap: Ein Werkzeug zur Aktualisierung der Ports-Sammlung?   | `Zum Anfang <index.html>`__               | ?26.5. Einem Entwicklungszweig folgen   |
+-----------------------------------------------------------------------+-------------------------------------------+-----------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
