==================
5.2. Bezeichnungen
==================

.. raw:: html

   <div class="navheader">

5.2. Bezeichnungen
`Zur?ck <makefile.html>`__?
Kapitel 5. Die Konfiguration des Makefile
?\ `Weiter <makefile-categories.html>`__

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

5.2. Bezeichnungen
------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Der erste Teil des ``Makefile`` beschreibt die Versionsnummer des Ports
und f?hrt ihn in der richtigen Kategorie auf.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.2.1. ``PORTNAME`` und ``PORTVERSION``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Setzen Sie bitte die Variable ``PORTNAME`` auf den Basisnamen Ihres
Ports und die Variable ``PORTVERSION`` auf dessen Versionsnummer.

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

5.2.2. ``PORTREVISION`` und ``PORTEPOCH``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

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

5.2.2.1. ``PORTREVISION``
^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die ``PORTREVISION``-Variable ist ein streng monoton wachsender Wert,
welcher auf 0 zur?ckgesetzt wird, nachdem ``PORTVERSION`` erh?ht wurde
(d.h. jedes Mal, wenn ein offizielles Release erfolgt). Sie wird an den
Namen des Pakets angeh?ngt, wenn sie ungleich 0 ist. ?nderungen an
``PORTREVISION`` werden von automatisierten Werkzeugen (z.B.
`pkg\_version(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_version&sektion=1>`__)
genutzt, um anzuzeigen, dass ein neues Paket verf?gbar ist.

``PORTREVISION`` sollte jedes Mal erh?ht werden, wenn eine ?nderung am
Port erfolgt, die betr?chtliche Auswirkungen auf den Inhalt oder
Struktur des aus dem Port erzeugten Pakets zur Folge hat.

Beispiele daf?r, wann ``PORTREVISION`` erh?ht werden sollte:

.. raw:: html

   <div class="itemizedlist">

-  Hinzuf?gen von Patches, welche Sicherheitsl?cken schlie?en, Fehler
   beseitigen oder neue Funktionalit?t zum Port hinzuf?gen.

-  ?nderungen am ``Makefile`` des Ports, welche compile-time-Optionen
   hinzuf?gen oder entfernen.

-  ?nderungen bez?glich Packliste oder am Verhalten w?hrend der
   Installation des Pakets (d.h. ?nderungen an einem Skript, welches
   Ausgangsdaten f?r das Paket erzeugt, wie z.B. SSH-Hostschl?ssel).

-  Versionssprung einer Shared-Library, welche eine Abh?ngigkeit dieses
   Ports ist (In diesem Fall w?rde ein Anwender bei der Installation des
   alten Pakets scheitern, falls er eine neue Version der Abh?ngigkeit
   bereits installiert hat, weil nach der alten Bibliothek libfoo.x
   anstatt nach libfoo.(x+1)) gesucht wird).

-  Schleichende ?nderungen am Distfile, welche bedeutende funktionale
   ?nderungen verursachen, d.h. ?nderungen des Distfile erfordern eine
   Korrektur an ``distinfo``, ohne dass damit zusammenh?ngend die
   ``PORTVERSION`` ver?ndert wird, obwohl ein ``diff -ru`` zwischen der
   alten und der neuen Version bedeutende Ver?nderungen am Code
   nachweist.

.. raw:: html

   </div>

Beispiele f?r ?nderungen, welche keine Erh?hung von ``PORTREVISION``
erfordern:

.. raw:: html

   <div class="itemizedlist">

-  Stilistische ?nderungen am Grundger?st des Ports ohne funktionale
   ?nderungen am daraus resultierenden Paket.

-  ?nderungen an der Variable ``MASTER_SITES`` oder andere funktionale
   ?nderungen, welche das resultierende Paket nicht ver?ndern.

-  Marginale Patches am Distfile wie die Korrektur von Tippfehlern,
   welche nicht wichtig genug sind, um dem Benutzer die B?rde eines
   Upgrades aufzuerlegen.

-  Build fixes, die ein Paket erst kompilierbar machen, welches ohne
   diese ?nderungen vorher nicht erzeugt werden konnte (solange die
   ?nderungen keine funktionale Differenz bringen auf Plattformen, auf
   denen dieses Paket schon vorher gebaut werden konnte). Da
   ``PORTREVISION`` den Inhalt des Pakets wiederspiegelt, ist es nicht
   notwendig ``PORTREVISION`` zu erh?hen, wenn das Paket vorher nicht
   erstellt werden konnte.

.. raw:: html

   </div>

Als Faustregel gilt: Stellen Sie sich die Frage, ob die durchgef?hrte
?nderung am Port jedem hilft (entweder aufgrund einer Verbesserung,
Beseitigung eines Fehlers, oder der Annahme, dass das neue Paket
?berhaupt erst funktioniert) und w?gen Sie es gegen den Umstand ab, dass
jedermann, der seine Ports-Sammlung regelm?ssig auf dem neuesten Stand
h?lt, zu einer Aktualisierung gezwungen wird. Falls Sie die Frage
positiv beantworten sollten, erh?hen Sie die Variable ``PORTREVISION``.

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

5.2.2.2. ``PORTEPOCH``
^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Von Zeit zu Zeit geschieht es, dass irgendjemand (Drittanbieter von
Software oder FreeBSD Ports Committer) etwas Dummes tut und eine Version
einer Software ver?ffentlicht, deren Versionsnummer niedriger ist als
die der vorherigen. Ein Beispiel hierf?r ist ein Port, der von
foo-20000801 auf foo-1.0 ge?ndert wird (der Erstere wird
f?lschlicherweise als neue Version behandelt, weil 2000801 ein numerisch
gr??erer Wert ist als 1).

In Situationen wie diesen sollte die Variable ``PORTEPOCH`` erh?ht
werden. Wenn ``PORTEPOCH`` gr??er als 0 ist, wird sie an den Namen des
Pakets angeh?ngt, wie in Abschnitt 0 oberhalb bereits beschrieben.
``PORTEPOCH`` darf niemals verringert oder auf 0 gesetzt werden, weil
der Vergleich des Pakets mit einem fr?heren Zeitpunkt scheitern w?rde
(d.h. das Paket w?rde niemals als veraltet erkannt werden): Die neue
Versionsnummer (``1.0,1`` im obigen Beispiel) ist immer noch numerisch
kleiner als die vorherige Version (2000801), aber das Suffix ``,1`` wird
von automatisierten Werkzeugen gesondert behandelt und wird als gr??er
erkannt, als das implizit angenommene Suffix ``,0`` im fr?heren Paket.

Das Entfernen oder Zur?cksetzen von ``PORTEPOCH`` f?hrt zu unendlichem
?rger. Wenn Sie die obigen Ausf?hrungen nicht vollst?ndig verstanden
haben, lesen Sie es bitte unbedingt nochmals bis Sie es vollst?ndig
verinnerlicht haben, oder fragen Sie vor jeder ?nderung auf den
Mailinglisten nach!

Es wird erwartet, dass ``PORTEPOCH`` f?r die weitaus ?berwiegende Zahl
der Ports nicht verwendet wird und der verantwortungsvolle und
vorausschauende Umgang mit ``PORTVERSION`` macht es meist ?berfl?ssig,
falls ein sp?teres Release die Versionsstruktur ?ndern sollte. Vorsicht
ist geboten, wenn ein Release einer Drittanbieter-Software ohne eine
offizielle Versionsnummer ver?ffentlicht wird, wie z.B. bei
„Snapshot-Versionen“. Man ist versucht, das Release mit dem jeweiligen
Datum zu bezeichnen, was unweigerlich zu den oben beschriebenen
Problemen f?hrt, wenn das n?chste „offizielle“ Release erscheint.

Wenn z.B. ein Snapshot zum Datum 20000917 ver?ffentlicht wird und die
vorherige Version der Software war 1.2, dann sollte der Snapshot die
``PORTVERSION`` 1.2.20000917 oder ?hnlich erhalten und nicht 20000917,
damit das nachfolgende Release, angenommen 1.3, immer noch einen
gr??eren numerischen Wert aufweist.

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

5.2.2.3. Beispiel f?r den Gebrauch von ``PORTREVISION`` und ``PORTEPOCH``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Der ``gtkmumble``-Port, Version ``0.10``, befindet sich in der
Ports-Sammlung:

.. code:: programlisting

    PORTNAME=       gtkmumble
    PORTVERSION=    0.10

``PKGNAME`` wird zu ``gtkmumble-0.10``.

Ein Sicherheitsloch wurde entdeckt, das einen lokalen Patch von FreeBSD
erforderlich macht. ``PORTREVISION`` wird entsprechend erh?ht.

.. code:: programlisting

    PORTNAME=       gtkmumble
    PORTVERSION=    0.10
    PORTREVISION=   1

``PKGNAME`` wird zu ``gtkmumble-0.10_1``

Eine neue Version wird vom Software-Drittanbieter ver?ffentlicht,
bezeichnet mit der Version ``0.2`` (es stellt sich heraus, dass der
Autor beabsichtigte, dass ``0.10`` eigentlich ``0.1.0`` bedeuten sollte,
nicht „was kommt nach 0.9“ ?–?Hoppla, aber nun ist es zu sp?t). Da die
neue Unterversion ``2`` numerisch kleiner ist als die vorherige Version
``10``, muss ``PORTEPOCH`` erh?ht werden, um sicherzustellen, dass das
neue Paket auch als „neuer“ erkannt wird. Da es ein neues Release des
Drittanbieters ist, wird ``PORTREVISION`` auf 0 zur?ckgesetzt (oder aus
dem ``Makefile`` entfernt).

.. code:: programlisting

    PORTNAME=       gtkmumble
    PORTVERSION=    0.2
    PORTEPOCH=      1

``PKGNAME`` wird zu ``gtkmumble-0.2,1``

Das n?chste Release ist 0.3. Da ``PORTEPOCH`` niemals verringert wird,
sind die Versionsvariablen nun wie folgt:

.. code:: programlisting

    PORTNAME=       gtkmumble
    PORTVERSION=    0.3
    PORTEPOCH=      1

``PKGNAME`` wird zu ``gtkmumble-0.3,1``

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Falls ``PORTEPOCH`` mit diesem Upgrade auf ``0`` zur?ckgesetzt worden
w?re, dann w?rde jemand, der das Paket ``gtkmumble-0.10_1`` installiert
h?tte, das Paket ``gtkmumble-0.3`` nicht als neuer erkennen, da ``3``
immer noch numerisch kleiner ist als ``10``. Bedenken Sie, dass genau
dies der springende Punkt an ``PORTEPOCH`` ist.

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

5.2.3. ``PKGNAMEPREFIX`` und ``PKGNAMESUFFIX``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Zwei optionale Variablen, ``PKGNAMEPREFIX`` und ``PKGNAMESUFFIX``,
werden verkn?pft mit ``PORTNAME`` und ``PORTVERSION``, um ``PKGNAME`` zu
bilden als
``       ${PKGNAMEPREFIX}${PORTNAME}${PKGNAMESUFFIX}-${PORTVERSION}       ``.
Stellen Sie bitte unbedingt sicher, dass diese Variablen den
`Richtlinien f?r einen guten
Paketnamen <makefile-naming.html#porting-pkgname>`__ entsprechen.
Insbesondere d?rfen Sie *keinesfalls* einen Bindestrich (``-``) in
``PORTVERSION`` verwenden. Falls das Paket den *``language-``* oder
*``-compiled.specifics``*-Teil aufweist (siehe unten) benutzen Sie
``PKGNAMEPREFIX`` oder ``PKGNAMESUFFIX`` respektive. Machen Sie diese
Variablen nicht zum Bestandteil von ``PORTNAME``!

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

5.2.4. ``LATEST_LINK``
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Umgebungsvariable ``LATEST_LINK`` wird w?hrend der Paketerstellung
verwendet, um einen Kurznamen festzulegen, der danach von ``pkg_add -r``
genutzt werden kann. Dadurch wird es beispielsweise m?glich, die
aktuelle Perl-Version durch einen einfachen Aufruf von
``pkg_add -r perl`` zu installieren (ohne die Angabe der korrekten
Versionsnummer). Dieser Name muss eindeutig sowie „offensichtlich“ sein.

In einigen F?llen k?nnen mehrere Versionen einer Applikation
gleichzeitig in der Ports-Sammlung sein. Das index build- und das
package build-System m?ssen nun in der Lage sein, diese als
unterschiedliche Ports zu erkennen, obwohl diese Versionen alle die
gleichen Variablen ``PORTNAME``, ``PKGNAMEPREFIX`` und sogar
``PKGNAMESUFFIX`` aufweisen. In solchen F?llen sollte die optionale
Variable ``LATEST_LINK`` auf einen unterschiedlichen Wert f?r alle Ports
gesetzt werden mit Ausnahme des „Haupt-Ports“. Beispiele hierf?r sind
die ``lang/gcc46`` und ``lang/gcc``-Ports und die
``www/apache*``-Familie. Wenn Sie die Umgebungsvariable
``NO_LATEST_LINK`` setzen, wird kein Link erzeugt, was f?r alle
Versionen (aber nicht f?r die „Hauptversion“) n?tzlich sein kann.
Beachten Sie bitte, dass die Frage der Auswahl der „wichtigsten“ Version
(„am popul?rsten“, „am besten Unterst?tzt“, „zuletzt gepatcht“ usw.)
ausserhalb der M?glichkeiten dieses Handbuches liegt. Wir sagen Ihnen
nur, wie Sie die anderen Ports spezifizieren, nachdem Sie den
„Haupt-Port“ erkoren haben.

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

5.2.5. Namensregeln f?r Pakete
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Im Folgenden finden Sie die Regeln f?r die Benennung Ihrer Pakete. Diese
sollen gew?hrleisten, dass das Paketverzeichnis leicht zu durchsuchen
ist, da es bereits abertausende Pakete gibt und die Nutzer sich mit
Schauder abwenden, wenn Ihre Augen ?berstrapaziert werden!

Der Paketname soll aussehen wie
``language_region-name-compiled.specifics-version.numbers``.

Der Paketname ist definiert als
``       ${PKGNAMEPREFIX}${PORTNAME}${PKGNAMESUFFIX}-${PORTVERSION}       ``.
Stellen Sie bitte sicher, dass die Variablen Ihres Ports diesem Format
entsprechen.

.. raw:: html

   <div class="orderedlist">

#. FreeBSD bem?ht sich ausserordentlich, die Landessprachen seiner
   Nutzer zu unterst?tzen. Die *``language-``*\ Variable soll eine
   Abk?rzung mit 2 Buchstaben sein der Sprachen gem?? ISO-639, falls der
   Port f?r eine bestimmte Sprache spezifisch ist. Beispiele hierf?r
   sind ``ja`` f?r Japanisch, ``ru`` f?r Russisch, ``vi`` f?r
   Vietnamesisch, ``zh`` f?r Chinesisch, ``ko`` f?r Koreanisch und
   ``de`` f?r Deutsch.

   Sollte der Port spezifisch sein f?r eine gewisse Region innerhalb
   eines Sprachraumes, dann f?gen Sie bitte auch den L?ndercode mit 2
   Buchstaben hinzu. Beispiele sind ``en_US`` f?r nordamerikanisches
   Englisch und ``fr_CH`` f?r schweizerisches Franz?sisch.

   Der *``language-``*\ Teil muss in der ``PKGNAMEPREFIX``-Variable
   gesetzt werden.

#. Der erste Buchstabe des ``name``-Teils muss kleingeschrieben werden
   (der Rest des Namens kann Gro?buchstaben enthalten. Daher seien Sie
   bitte umsichtig, wenn Sie den Namen einer Software konvertieren,
   welche Grossbuchstaben enth?lt). Es ist Tradition, ``Perl 5``-Module
   durch ein vorstehendes ``p5-`` und durch Umwandlung des doppelten
   Doppelpunktes in Bindestriche zu bezeichnen. So wird z.B. aus dem
   ``Data::Dumper``-Modul der ``p5-Data-Dumper``-Port.

#. Vergewissern Sie sich, dass der Name des Ports und seine
   Versionsnummer klar getrennt sind und in den Variablen ``PORTNAME``
   und ``PORTVERSION`` stehen. Der einzige Grund, um in ``PORTNAME``
   einen Versionsteil aufzunehmen ist der, dass die Software wirklich so
   bezeichnet wird, wie z.B. die Ports ``textproc/libxml2`` oder
   ``japanese/kinput2-freewnn``. Ansonsten sollte ``PORTNAME`` keine
   versionsspezifischen Bestandteile aufweisen. Es ist vollkommen
   normal, dass viele Ports den gleichen ``PORTNAME`` aufweisen wie z.B.
   die ``www/apache*``-Ports. In diesem Falle werden unterschiedliche
   Versionen (und unterschiedliche Indexeintr?ge) unterschieden durch
   die Werte von ``PKGNAMEPREFIX``, ``PKGNAMESUFFIX`` und
   ``LATEST_LINK``.

#. Falls der Port mit verschiedenen, `fest kodierten
   Vorgaben <makefile-masterdir.html>`__ (?blicherweise Teil des
   Verzeichnisnamens in einer Familie von Ports) gebaut werden kann,
   dann soll der *``-compiled.specifics``*-Teil die einkompilierten
   Vorgaben anzeigen (der Bindestrich ist optional). Beispiele hierf?r
   sind Papiergr??en und Font-Einheiten.

   Der *``-compiled.specifics``*-Teil muss in der Variablen
   ``PKGNAMESUFFIX`` gesetzt werden.

#. Die Versionszeichenfolge sollte einen Bindestrich (``-``) am Schluss
   haben und eine von Punkten getrennte Liste von Integer-Zahlen und
   kleingeschriebenen Buchstaben sein. Es ist nicht zul?ssig, einen
   weiteren Bindestrich innerhalb des Versionsstrings zu verwenden! Die
   einzige Ausnahme hiervon ist die Zeichenfolge ``pl`` (bedeutet
   „patchlevel“), welche *nur* dann gebraucht werden darf, wenn die
   Applikation ?ber keine Haupt–?oder Unterversionsnummern verf?gt. Wenn
   die Versionsbezeichnung der Software Zeichenketten wie „alpha“,
   „beta“, „rc“ oder „pre“ enth?lt, dann nehmen Sie bitte den ersten
   Buchstaben daraus und setzen ihn unmittelbar hinter einen Punkt.
   Falls die Versionszeichenfolge nach diesem Punkt fortgesetzt wird,
   sollen die Zahlen ohne einen Punkt zwischen den einzelnen Buchstaben
   folgen.

   Das Ziel ist es, die Ports anhand der Versionszeichenfolge zu
   sortieren. Stellen Sie bitte unbedingt sicher, dass die Bestandteile
   der Versionsnummer immer durch einen Punkt getrennt sind und falls
   Datumsangaben verwendet werden, dass diese im Format
   ``0.0.yyyy.mm.dd`` und nicht ``dd.mm.yyyy           `` oder gar dem
   nicht Y2K-kompatiblen Format ``           yy.mm.dd           ``
   vorliegen. Es ist wichtig, dass die Versionsnummer mit ``0.0.``
   beginnt, da die Versionsnummer im Falle einer Ver?ffentlichung auf
   jeden Fall kleiner als ``yyyy`` sein wird.

.. raw:: html

   </div>

Hier sind einige reale Beispiele, die aufzeigen, wie man den Namen einer
Applikation zu einem vern?nftigen Paketnamen umwandelt:

.. raw:: html

   <div class="informaltable">

+-------------------+---------------------+----------------+---------------------+-------------------+-----------------------------------------------------------+
| Softwarename      | ``PKGNAMEPREFIX``   | ``PORTNAME``   | ``PKGNAMESUFFIX``   | ``PORTVERSION``   | Grund                                                     |
+===================+=====================+================+=====================+===================+===========================================================+
| mule-2.2.2        | (leer)              | mule           | (leer)              | 2.2.2             | Keine ?nderung erforderlich                               |
+-------------------+---------------------+----------------+---------------------+-------------------+-----------------------------------------------------------+
| EmiClock-1.0.2    | (leer)              | emiclock       | (leer)              | 1.0.2             | keine Gro?buchstaben f?r einzelne Applikationen           |
+-------------------+---------------------+----------------+---------------------+-------------------+-----------------------------------------------------------+
| rdist-1.3alpha    | (leer)              | rdist          | (leer)              | 1.3.a             | Keine Zeichenketten wie ``alpha`` erlaubt                 |
+-------------------+---------------------+----------------+---------------------+-------------------+-----------------------------------------------------------+
| es-0.9-beta1      | (leer)              | es             | (leer)              | 0.9.b1            | keine Zeichenketten wie ``beta`` erlaubt                  |
+-------------------+---------------------+----------------+---------------------+-------------------+-----------------------------------------------------------+
| mailman-2.0rc3    | (leer)              | mailman        | (leer)              | 2.0.r3            | keine Zeichenketten wie ``rc`` erlaubt                    |
+-------------------+---------------------+----------------+---------------------+-------------------+-----------------------------------------------------------+
| v3.3beta021.src   | (leer)              | tiff           | (leer)              | 3.3               | Was sollte denn das eigentlich sein?                      |
+-------------------+---------------------+----------------+---------------------+-------------------+-----------------------------------------------------------+
| tvtwm             | (leer)              | tvtwm          | (leer)              | pl11              | Versionsstring zwingend erforderlich                      |
+-------------------+---------------------+----------------+---------------------+-------------------+-----------------------------------------------------------+
| piewm             | (leer)              | piewm          | (leer)              | 1.0               | Versionsstring zwingend erforderlich                      |
+-------------------+---------------------+----------------+---------------------+-------------------+-----------------------------------------------------------+
| xvgr-2.10pl1      | (leer)              | xvgr           | (leer)              | 2.10.1            | ``pl`` nur erlaubt, wenn keine Versionsnummer vorhanden   |
+-------------------+---------------------+----------------+---------------------+-------------------+-----------------------------------------------------------+
| gawk-2.15.6       | ja-                 | gawk           | (leer)              | 2.15.6            | Japanische Sprachversion                                  |
+-------------------+---------------------+----------------+---------------------+-------------------+-----------------------------------------------------------+
| psutils-1.13      | (leer)              | psutils        | -letter             | 1.13              | Papergr??e beim Paketbau fix kodiert                      |
+-------------------+---------------------+----------------+---------------------+-------------------+-----------------------------------------------------------+
| pkfonts           | (leer)              | pkfonts        | 300                 | 1.0               | Paket f?r 300 DPI Schriftarten                            |
+-------------------+---------------------+----------------+---------------------+-------------------+-----------------------------------------------------------+

.. raw:: html

   </div>

Falls es in der Originalquelle ?berhaupt keinen Anhaltspunkt f?r
irgendeine Versionsbezeichnung gibt und es unwahrscheinlich ist, dass
der Autor jemals eine neue Version ver?ffentlichen wird, dann setzen Sie
bitte die Version einfach auf ``1.0`` (wie im obigen Beispiel
``piewm``). Sie k?nnen auch den Autor fragen oder eine
Datumszeichenfolge in der Art ``0.0.yyyy.mm.dd`` als Version verwenden.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------------+---------------------------------+--------------------------------------------+
| `Zur?ck <makefile.html>`__?                  | `Nach oben <makefile.html>`__   | ?\ `Weiter <makefile-categories.html>`__   |
+----------------------------------------------+---------------------------------+--------------------------------------------+
| Kapitel 5. Die Konfiguration des Makefile?   | `Zum Anfang <index.html>`__     | ?5.3. Kategorisierung                      |
+----------------------------------------------+---------------------------------+--------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
