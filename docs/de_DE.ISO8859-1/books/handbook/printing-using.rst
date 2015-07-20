=======================
10.5. Drucker verwenden
=======================

.. raw:: html

   <div class="navheader">

10.5. Drucker verwenden
`Zur?ck <printing-advanced.html>`__?
Kapitel 10. Drucken
?\ `Weiter <printing-lpd-alternatives.html>`__

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

10.5. Drucker verwenden
-----------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

?bersetzt von Johann Kois.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dieser Abschnitt beschreibt, wie Sie einen unter FreeBSD konfigurierten
Drucker verwenden k?nnen. Die folgende Liste bietet einen ?berblick ?ber
wichtige Anwenderbefehle:

.. raw:: html

   <div class="variablelist">

`lpr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lpr&sektion=1>`__
    Einen Druckauftrag drucken

`lpq(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lpq&sektion=1>`__
    Eine Druckerwarteschlange pr?fen

`lprm(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lprm&sektion=1>`__
    Einen Druckauftrag aus einer Warteschlange entfernen (stornieren)

.. raw:: html

   </div>

Zus?tzlich existiert mit
`lpc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=lpc&sektion=8>`__ ein
Befehl zur zur Steuerung von Druckern und Druckerwarteschlangen, der im
Abschnitt `Drucker verwalten <printing-using.html#printing-lpc>`__ n?her
beschrieben wird.

Jeder der drei Befehle
`lpr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lpr&sektion=1>`__,
`lprm(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lprm&sektion=1>`__,
sowie
`lpq(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lpq&sektion=1>`__
akzeptiert die Option ``-P printer-name``, mit der Sie den zu
verwendenden Drucker (der dazu in ``/etc/printcap`` definiert sein muss)
festlegen. Dadurch sind Sie in der Lage, Druckauftr?ge zu erstellen, zu
stornieren, oder den Status Ihrer Druckauftr?ge zu ?berpr?fen. Verwenden
Sie die Option ``-P`` nicht, wird der in der Umgebungsvariable
``PRINTER`` definierte Drucker verwendet. Existiert diese Variable
nicht, greifen diese Befehle auf den Drucker ``lp`` zur?ck.

Im Folgenden steht der Begriff *Standarddrucker* daher f?r den ?ber die
Umgebungsvariable ``PRINTER`` definierten Drucker, oder, falls diese
Variable nicht existiert, f?r den Drucker ``lp``.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

10.5.1. Druckauftr?ge erstellen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Um eine Datei zu drucken, geben Sie folgenden Befehl ein:

.. code:: screen

    % lpr filename ...

Dadurch wird jede angegebene Datei an den Standarddrucker geschickt.
Wenn Sie keine Datei angeben, liest
`lpr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lpr&sektion=1>`__ die
zu druckenden Daten von der Standardeingabe. Um beispielsweise einige
wichtige Systemdateien zu drucken, geben Sie folgenden Befehl ein:

.. code:: screen

    % lpr /etc/host.conf /etc/hosts.equiv

Um einen bestimmten Drucker auszuw?hlen, verwenden Sie:

.. code:: screen

    % lpr -P printer-name filename ...

Das folgende Beispiel gibt eine ausf?hrliche Liste aller im
Arbeitsverzeichnis enthaltenen Dateien auf den Drucker ``rattan`` aus:

.. code:: screen

    % ls -l | lpr -P rattan

Da keine Dateien an
`lpr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lpr&sektion=1>`__
?bergeben werden, liest ``lpr`` die zu druckenden Daten von der
Standardeingabe, in unserem Fall also die Ausgabe des Befehls ``ls -l``.

`lpr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lpr&sektion=1>`__
akzeptiert auch verschiedene Optionen zur Formatierung und Konvertierung
von Dateien, zur Erzeugung von multiplen Ausdrucken und so weiter. Lesen
Sie dazu den Abschnitt
`Druckoptionen <printing-using.html#printing-lpr-options>`__.

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

10.5.2. Druckauftr?ge verwalten
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn Sie
`lpr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lpr&sektion=1>`__
verwenden, werden alle zu druckenden Daten in ein Paket, den sogenannten
„Druckauftrag“, gepackt und an LPD geschickt. Jeder Drucker verf?gt ?ber
eine Druckerwarteschlange, in der Ihre Druckauftr?ge gemeinsam mit denen
anderer Benutzer verbleiben, bis sie gedruckt werden k?nnen. Zuerst
eintreffende Druckauftr?ge werden dabei auch zuerst gedruckt.

Um die Druckerwarteschlange des Standarddruckers anzuzeigen, verwenden
Sie `lpq(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lpq&sektion=1>`__.
Wollen Sie einen anderen Drucker abfragen, m?ssen Sie die Option ``-P``
verwenden. Der Befehl

.. code:: screen

    % lpq -P bamboo

zeigt so die Druckerwarteschlange des Druckers ``bamboo`` an. Dieser
Befehl liefert eine Ausgabe ?hnlich der folgenden:

.. code:: screen

    bamboo is ready and printing
    Rank   Owner    Job  Files                              Total Size
    active kelly    9    /etc/host.conf, /etc/hosts.equiv   88 bytes
    2nd    kelly    10   (standard input)                   1635 bytes
    3rd    mary     11   ...                                78519 bytes

Derzeit enth?lt die Warteschlange von ``bamboo`` drei Druckauftr?ge. Dem
ersten Auftrag, der vom Benutzer kelly erstellt wurde, wurde die
„Auftragsnummer (job number)“ 9 zugewiesen. Analog erh?lt jeder
Druckerauftrag eine eindeutige Nummer zugewiesen. Diese Nummern sind nur
dann von Bedeutung, wenn Sie einen Druckauftrag stornieren wollen. Der
Abschnitt `Druckauftr?ge
stornieren <printing-using.html#printing-lprm>`__ beschreibt, wie Sie
dazu vorgehen.

Der Auftrag mit der Nummer 9 besteht aus zwei Dateien, mehrere an
`lpr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lpr&sektion=1>`__
?bergebene Dateien werden also als Teil eines (gemeinsamen)
Druckauftrags betrachtet. Dieser Druckauftrag ist derzeit aktiv
(beachten Sie den Status ``active`` in der Spalte „Rank“), wird also
gerade gedruckt. Der zweite Auftrag besteht aus Daten, die von der
Standardeingabe an
`lpr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lpr&sektion=1>`__
?bergeben wurden. Der dritte Auftrag wurde vom Benutzer ``mary``
erstellt. Er ist sehr viel gr??er als die anderen Auftr?ge. Da der Pfad
der zu druckenden Datei aufgrund seiner L?nge nicht in der Spalte
„Files“ Platz hat, werden von
`lpq(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lpq&sektion=1>`__ nur
drei Punkte angezeigt.

Die erste Zeile der Ausgabe von
`lpq(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lpq&sektion=1>`__ ist
ebenfalls sehr n?tzlich: Sie beschreibt den momentanen Druckerstatus
(oder zumindest, was LPD denkt, dass der Drucker gerade macht).

`lpq(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lpq&sektion=1>`__
unterst?tzt auch die Option ``-l`` zur Erstellung einer ausf?hrlicheren
Ausgabe. Die Eingabe von ``lpq -l`` erzeugt f?r unser obiges Beispiel
die folgende Ausgabe:

.. code:: screen

    waiting for bamboo to become ready (offline ?)
    kelly: 1st               [job 009rose]
           /etc/host.conf                    73 bytes
           /etc/hosts.equiv                  15 bytes

    kelly: 2nd               [job 010rose]
           (standard input)                  1635 bytes

    mary: 3rd                                [job 011rose]
          /home/orchid/mary/research/venus/alpha-regio/mapping 78519 bytes

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

10.5.3. Druckauftr?ge stornieren
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Mit
`lprm(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lprm&sektion=1>`__
k?nnen Sie einen Druckauftrag stornieren. H?ufig ist
`lprm(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lprm&sektion=1>`__
auch noch in der Lage, einen bereits aktiven Auftrag abzubrechen,
allerdings wird dabei in der Regel trotzdem ein Teil des Auftrages oder
der gesamte Auftrag gedruckt.

Um einen Druckauftrag auf dem Standarddrucker zu stornieren, m?ssen Sie
zuerst die Auftragsnummer ?ber
`lpq(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lpq&sektion=1>`__
ermitteln. Danach geben Sie Folgendes ein:

.. code:: screen

    % lprm Job-Nummer

Um einen Druckauftrag eines anderen Druckers zu stornieren, ben?tigen
Sie wiederum die Option ``-P``. Der folgende Befehl entfernt den
Druckauftrag mit der Nummer 10 aus der Warteschlange des Druckers
``bamboo``:

.. code:: screen

    % lprm -P bamboo 10

`lprm(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lprm&sektion=1>`__
unterst?tzt verschiedene Kurzbefehle:

.. raw:: html

   <div class="variablelist">

lprm -
    Entfernt alle Druckauftr?ge (des Standarddruckers), die von Ihnen
    erstellt wurden.

lprm *``user``*
    Entfernt alle Druckauftr?ge (des Standarddruckers), die vom Benutzer
    *``user``* erstellt wurden. Der Superuser kann im Gegensatz zu einem
    normalen Benutzer auch Auftr?ge anderer Benutzer entfernen.

lprm
    Wenn Sie weder eine Auftragsnummer, einen Benutzernamen, noch die
    Option ``-`` angeben, entfernt
    `lprm(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lprm&sektion=1>`__
    den aktiven Druckauftrag auf dem Standarddrucker, falls dieser
    Auftrag von Ihnen erstellt wurde. Der Superuser kann hingegen jeden
    aktiven Druckauftrag abbrechen.

.. raw:: html

   </div>

Verwenden Sie zus?tzlich die Option ``-P`` zu den eben beschriebenen
Kurzbefehlen, wenn Sie diese auf einen anderen Drucker als den
Standarddrucker anwenden wollen. So entfernt der folgende Befehl
beispielsweise alle Druckauftr?ge des aktuellen Benutzers aus der
Druckerwarteschlange des Druckers ``rattan``:

.. code:: screen

    % lprm -P rattan -

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Wenn Sie in einer Netzwerkumgebung arbeiten, erlaubt es
`lprm(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lprm&sektion=1>`__
Ihnen nur, Druckauftr?ge auf dem Rechner zu stornieren, auf dem sie
erstellt wurden. Dies gilt selbst dann, wenn der gleiche Drucker auch
auf anderen Rechnern des Netzwerks verf?gbar ist. Die folgende
Befehlsfolge veranschaulicht diesen Umstand:

.. code:: screen

    % lpr -P rattan myfile
    % rlogin orchid
    % lpq -P rattan
    Rank   Owner      Job  Files                          Total Size
    active seeyan     12    ...                           49123 bytes
    2nd    kelly      13   myfile                         12 bytes
    % lprm -P rattan 13
    rose: Permission denied
    % logout
    % lprm -P rattan 13
    dfA013rose dequeued
    cfA013rose dequeued
        

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

10.5.4. Abseits von normalem Text: Druckoptionen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

`lpr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lpr&sektion=1>`__
unterst?tzt verschiedene Optionen zur Formatierung von Text, zur
Konvertierung von Grafik- und anderen Dateiformaten, zur Erzeugung von
multiplen Kopien, zur Verwaltung von Druckauftr?gen und andere mehr.
Dieser Abschnitt beschreibt einige dieser Optionen.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

10.5.4.1. Formatierungs- und Konvertierungsoptionen
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die folgenden
`lpr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lpr&sektion=1>`__-Optionen
kontrollieren die Formatierung von in einem Druckauftrag enthaltenen
Dateien. Verwenden Sie diese Optionen, wenn Ihr Druckauftrag keinen
normalen Text enth?lt, oder wenn Sie normalen Text mit
`pr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pr&sektion=1>`__
formatieren wollen.

Der folgende Befehl druckt so beispielsweise eine DVI-Datei (des
TeX-Satzsystems) namens ``fish-report.dvi`` auf dem Drucker ``bamboo``:

.. code:: screen

    % lpr -P bamboo -d fish-report.dvi

Diese Optionen gelten f?r jede Datei des Druckauftrags, daher ist es
nicht m?glich beispielsweise DVI- und ditroff-Dateien ?ber den gleichen
Druckauftrag zu drucken. Sie m?ssen diese Dateien vielmehr ?ber
getrennte Druckauftr?ge drucken, wobei Sie jeweils geeignete
Konvertierungsoptionen verwenden.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Alle Optionen mit Ausnahme von ``-p`` und ``-T`` setzen einen
installierten und f?r den jeweiligen Drucker konfigurierten
Konvertierungsfilter voraus. So ben?tigt die Option ``-d`` den
DVI-Konvertierungsfilter. Diese Filter werden im Abschnitt
`Konvertierungsfilter <printing-advanced.html#printing-advanced-convfilters>`__
ausf?hrlich beschrieben.

.. raw:: html

   </div>

.. raw:: html

   <div class="variablelist">

``-c``
    Druckt cifplot-Dateien.

``-d``
    Druckt DVI-Dateien.

``-f``
    Druckt FORTRAN-Textdateien.

``-g``
    Druckt Plot-Daten.

``-i anzahl``
    R?ckt die Ausgabe um *``anzahl``* Spalten ein, lassen Sie
    *``anzahl``* weg, wird der Text um 8 Spalten einger?ckt. Beachten
    Sie aber, dass diese Option nicht mit allen Konvertierungsfiltern
    funktioniert.

    .. raw:: html

       <div class="note" xmlns="">

    Anmerkung:
    ~~~~~~~~~~

    Zwischen der Option ``-i`` und der der Zahl darf dabei kein
    Leerzeichen stehen.

    .. raw:: html

       </div>

``-l``
    Druckt Text inklusive vorhandener Steuerzeichen.

``-n``
    Druckt ditroff-Dateien (ger?teunabh?ngiges troff).

-p
    Formatiert normalen Text mit
    `pr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pr&sektion=1>`__,
    bevor der Ausdruck erfolgt.

``-T titel``
    Verwende *``titel``* auf dem
    `pr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pr&sektion=1>`__-Deckblatt
    anstelle des Dateinamens. Diese Option ist nur wirksam, wenn sie
    gemeinsam mit der Option ``-p`` verwendet.

``-t``
    Druckt troff-Daten.

``-v``
    Druckt Rasterdaten.

.. raw:: html

   </div>

Dazu ein Beispiel. Der folgende Befehl druckt eine formatierte Version
der Manualpage zu
`ls(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ls&sektion=1>`__ auf
den Standarddrucker:

.. code:: screen

    % zcat /usr/share/man/man1/ls.1.gz | troff -t -man | lpr -t

`zcat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=zcat&sektion=1>`__
dekomprimiert den Quellcode der Manualpage
`ls(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ls&sektion=1>`__ und
reicht ihn an
`troff(1) <http://www.FreeBSD.org/cgi/man.cgi?query=troff&sektion=1>`__
weiter, das ihn formatiert und daraus GNU troff-Daten erzeugt. Diese
werden wiederum an
`lpr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lpr&sektion=1>`__
weitergereicht, das den Druckauftrag schlie?lich an LPD ?bergibt. Da die
Option ``-t`` von
`lpr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lpr&sektion=1>`__
verwendet wurde, konvertiert das Drucksystem die GNU troff-Daten zuvor
in ein Format, das der Standarddrucker verstehen und ausgeben kann.

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

10.5.4.2. Druckauftr?ge verwalten
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die folgenden Optionen von
`lpr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lpr&sektion=1>`__
weisen LPD an, den Druckauftrag auf verschiedene Art und Weise zu
behandeln:

.. raw:: html

   <div class="variablelist">

-# *``anzahl``*
    Erzeugt *``anzahl``* Ausdrucke jeder im Druckauftrag enthaltenen
    Datei anstelle eines einzigen Exemplars. Diese Option kann von einem
    Administrator deaktiviert werden, um die Beanspruchung des Druckers
    zu verringern. Lesen Sie den Abschnitt `Den Ausdruck von mehreren
    Kopien
    verhindern <printing-advanced.html#printing-advanced-restricting-copies>`__,
    wenn Sie diese Funktion ben?tigen.

    Das folgende Beispiel druckt drei Kopien der Datei ``parser.c``,
    gefolgt von drei Kopien von ``parser.h`` auf den Standarddrucker:

    .. code:: screen

        % lpr -#3 parser.c parser.h

-m
    Verschickt eine E-Mail, nachdem der Druckauftrag beendet wurde.
    Verwenden Sie diese Option, sendet LPD Ihnen eine E-Mail, wenn es
    die Bearbeitung Ihres Druckauftrages abgeschlossen hat. Diese
    Nachricht enth?lt Informationen dar?ber, ob Ihr Auftrag erfolgreich
    erledigt wurde oder ob ein Fehler auftrat. Ist dies der Fall, wird
    meist noch angegeben, welcher Fehler auftrat.

-s
    Kopiert die Dateien nicht in das Spooling-Verzeichnis, sondern
    verlinkt stattdessen symbolisch auf diese Dateien.

    Wenn Sie einen umfangreichen Druckauftrag erstellen, werden Sie
    diese Option wahrscheinlich verwenden wollen. Einerseits sparen Sie
    dadurch Speicherplatz im Spooling-Verzeichnis (im schlimmsten Fall
    k?nnte Ihr Druckauftrag ansonsten das Dateisystem des
    Spooling-Verzeichnis zum ?berlaufen bringen), andererseits sparen
    Sie dadurch auch Zeit, weil LPD die in Ihrem Druckauftrag
    enthaltenen Dateien nicht in das Spooling-Verzeichnis kopieren muss.

    Da LPD in diesem Fall die Originaldateien verwendet, muss
    sichergestellt sein, dass diese nicht ver?ndert werden, bevor der
    Ausdruck abgeschlossen ist.

    .. raw:: html

       <div class="note" xmlns="">

    Anmerkung:
    ~~~~~~~~~~

    Wenn Sie auf einen entfernten Drucker drucken, muss LPD die Dateien
    dennoch vom lokalen auf den entfernten Rechner kopieren. In diesem
    Fall spart die Option ``-s`` Speicherplatz lediglich im lokalen
    Spooling-Verzeichnis, nicht aber im entfernten. Dennoch ist diese
    Option auch in diesem Fall n?tzlich.

    .. raw:: html

       </div>

-r
    L?scht die im Druckauftrag enthaltenen Dateien, nachdem sie in das
    Spooling-Verzeichnis kopiert oder unter Verwendung der Option ``-s``
    gedruckt werden. Verwenden Sie diese Option daher nur mit ?u?erster
    Vorsicht!

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

10.5.4.3. Deckblatt-Optionen
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die folgenden
`lpr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lpr&sektion=1>`__-Optionen
passen den Text an, der auf einem Deckblatt eines Druckauftrages
ausgegeben wird. Wird die Ausgabe von Deckbl?ttern auf dem Zieldrucker
unterdr?ckt, bleiben diese Optionen wirkungslos. Lesen Sie den Abschnitt
`Deckbl?tter <printing-advanced.html#printing-advanced-header-pages>`__,
wenn Sie diese Funktion ben?tigen.

.. raw:: html

   <div class="variablelist">

-C *``text``*
    Ersetzt den Rechnernamen auf dem Deckblatt durch *``text``*. Der
    Rechnername ist dabei in der Regel der Name des Rechners, auf dem
    der Druckauftrag erstellt wurde.

-J *``text``*
    Ersetzt den Namen des Druckauftrages auf dem Deckblatt durch
    *``text``*. Der Name des Druckauftrages entspricht in der Regel dem
    Namen der ersten Datei des Druckauftrages oder ``stdin``, wenn Sie
    die Standardeingabe an den Drucker weiterleiten.

-h
    Verhindert den Ausdruck von Deckbl?ttern.

    .. raw:: html

       <div class="note" xmlns="">

    Anmerkung:
    ~~~~~~~~~~

    Ob diese Option funktioniert, h?ngt von der Art und Weise ab, wie
    Deckbl?tter auf Ihrem System erzeugt werden. Lesen Sie den Abschnitt
    `Deckbl?tter <printing-advanced.html#printing-advanced-header-pages>`__
    f?r weitere Informationen.

    .. raw:: html

       </div>

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

10.5.5. Drucker verwalten
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Als Administrator Ihres Systems ist es Ihre Aufgabe, Drucker zu
installieren, zu konfigurieren und zu testen. Um mit Ihrem Drucker zu
kommunizieren, k?nnen Sie
`lpc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=lpc&sektion=8>`__
verwenden. Dadurch sind Sie in der Lage,

.. raw:: html

   <div class="itemizedlist">

-  Ihre Drucker zu starten und zu beenden.

-  Die Warteschlangen Ihrer Drucker zu aktivieren und zu deaktivieren.

-  Die Reihenfolge der Druckauftr?ge zu ?ndern.

.. raw:: html

   </div>

Am Anfang dieses Abschnitts steht die Erkl?rung einiger Begriffe. Wenn
ein Drucker *beendet* ist, wird der Inhalt seiner Warteschlange nicht
gedruckt. Druckauftr?ge k?nnen zwar weiterhin erstellt werden, diese
verbleiben aber solange in der Warteschlange, bis der Drucker wieder
*gestartet* oder die Warteschlange gel?scht wird.

Ist eine Warteschlange *deaktiviert*, kann (mit Ausnahme von ``root``)
kein Benutzer mehr einen Druckauftrag erteilen. Ist die Warteschlange
hingegen *aktiviert*, k?nnen Druckauftr?ge erteilt werden. Ist ein
Drucker zwar *gestartet*, die Warteschlange hingegen *deaktiviert*,
werden dennoch alle noch in der Warteschlange vorhandenen Druckauftr?ge
gedruckt.

Im Allgemeinen ben?tigen Sie ``root``-Rechte, um
`lpc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=lpc&sektion=8>`__
einsetzen zu k?nnen. Als normaler Benutzer erlaubt es Ihnen
`lpc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=lpc&sektion=8>`__
lediglich, den Druckstatus abzufragen und einen h?ngenden Drucker neu zu
starten.

Es folgt nun eine Zusammenfassung der Befehle von
`lpc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=lpc&sektion=8>`__. Die
meisten dieser Befehle ben?tigen das Argument *``printer-name``*, mit
dem Sie angeben, auf welchen Drucker der Befehl angewendet werden soll.
Wenn Sie f?r *``printer-name``* ``all`` angeben, wird der Befehl auf
alle in ``/etc/printcap`` definierten Drucker angewendet.

.. raw:: html

   <div class="variablelist">

``abort           printer-name``
    Bricht den aktuellen Druckauftrag ab und beendet den Drucker.
    Solange die Warteschlange aktiviert ist, k?nnen allerdings weiterhin
    Druckauftr?ge erteilt werden.

``clean           printer-name``
    Entfernt veraltete Dateien aus dem Spooling-Verzeichnis des
    Druckers, da diese manchmal nicht vollst?ndig von LPD entfernt
    werden k?nnen. Dies ist insbesondere dann der Fall, wenn w?hrend der
    Bearbeitung des Druckauftrages Fehler auftraten. Dieser Befehl sucht
    dabei nach Dateien, die nicht in das Spooling-Verzeichnis geh?ren
    und entfernt diese.

``disable           printer-name``
    Deaktiviert die Annahme neuer Druckauftr?ge. Solange der Drucker
    nicht beendet wird, werden weiterhin alle in der Warteschlange
    enthaltenen Auftrage bearbeitet und gedruckt. ``root`` kann
    jederzeit Druckauftr?ge erstellen, selbst dann, wenn die
    Druckerwarteschlange deaktiviert ist.

    Dieser Befehl ist besonders n?tzlich, wenn Sie einen neuen Drucker
    testen m?ssen oder einen neuen Filter installiert haben. Dazu
    deaktivieren Sie die Warteschlange des Druckers und erstellen Ihre
    Druckauftr?ge als ``root``. Andere Benutzer k?nnen erst dann einen
    Druckauftrag erstellen, wenn Sie Ihre Tests abgeschlossen haben und
    die Druckerwarteschlange mit ``enable`` wieder reaktivieren.

``down printer-name           nachricht``
    Beendet einen Drucker. ?quivalent zu ``disable``, gefolgt von
    ``stop``. Die von Ihnen definierte *``nachricht``* wird als
    Druckerstatus angezeigt, wenn ein Benutzer die Warteschlange des
    Druckers mit
    `lpq(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lpq&sektion=1>`__
    oder mit ``lpc status`` abfragt.

``enable           printer-name``
    Aktiviert die Warteschlange eines Druckers. Erteilte Druckauftr?ge
    k?nnen zwar erteilt werden, diese werden aber nur dann gedruckt,
    wenn der Drucker auch gestartet ist.

``help           command-name``
    Ausgaben von hilfreichen Informationen zu *``command-name``*. Wird
    kein *``command-name``* angegeben, wird die Liste der verf?gbaren
    Befehle ausgegeben.

``restart           printer-name``
    Startet den Drucker. Normale Benutzer k?nnen diesen Befehl
    verwenden, um einen h?ngenden LPD zu reaktivieren, sie sind
    allerdings nicht berechtigt, einen Drucker zu starten, der mit
    ``stop`` oder ``down`` beendet wurde. Dieser Befehl ist ?quivalent
    zu ``abort``, gefolgt von ``start``.

``start           printer-name``
    Startet den Drucker, um die in der Warteschlange enthaltenen
    Auftr?ge zu drucken.

``stop           printer-name``
    Beendet den Drucker. Der Drucker beendet den aktiven Druckauftrag
    noch, danach wird kein weiterer in der Warteschlange enthaltener
    Auftrag gedruckt. Obwohl der Drucker beendet wurde, k?nnen weiterhin
    Druckauftr?ge erteilt werden, solange die Warteschlange nicht
    deaktiviert wurde.

``topq printer-name           job-or-username``
    Sortiert die Druckerwarteschlange des Druckers *``printer-name``*
    um, wobei der Auftrag mit der angegebenen *``Auftragsnummer``*, oder
    Druckauftr?ge, die von *``username``* erstellt wurden, an den Beginn
    der Warteschlange gesetzt werden. F?r diesen Befehl kann die Option
    ``all`` nicht als *``printer-name``* verwendet werden.

``up           printer-name``
    Startet einen Drucker. Das Gegenst?ck zu ``down``. ?quivalent zu
    ``start``, gefolgt von ``enable``.

.. raw:: html

   </div>

`lpc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=lpc&sektion=8>`__
akzeptiert diese Befehle direkt auf der Kommandozeile. Geben Sie keinen
Befehl ein, wird
`lpc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=lpc&sektion=8>`__ im
interaktiven Modus gestartet. In diesem Modus k?nnen Sie solange Befehle
eingeben, bis Sie ``exit`` oder ``quit`` eingeben.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------------+---------------------------------+--------------------------------------------------+
| `Zur?ck <printing-advanced.html>`__?      | `Nach oben <printing.html>`__   | ?\ `Weiter <printing-lpd-alternatives.html>`__   |
+-------------------------------------------+---------------------------------+--------------------------------------------------+
| 10.4. Erweiterte Drucker-Konfiguration?   | `Zum Anfang <index.html>`__     | ?10.6. Alternativen zum LPD-Drucksystem          |
+-------------------------------------------+---------------------------------+--------------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
