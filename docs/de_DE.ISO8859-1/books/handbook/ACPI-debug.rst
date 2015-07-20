=======================
12.17. ACPI-Fehlersuche
=======================

.. raw:: html

   <div class="navheader">

12.17. ACPI-Fehlersuche
`Zur?ck <acpi-overview.html>`__?
Kapitel 12. Konfiguration und Tuning
?\ `Weiter <boot.html>`__

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

12.17. ACPI-Fehlersuche
-----------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Verfasst von Nate Lawson.

.. raw:: html

   </div>

.. raw:: html

   <div>

Mit Beitr?gen von Peter Schultz und Tom Rhodes.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

ACPI ist ein g?nzlich neuer Weg, um Ger?te aufzufinden und deren
Stromverbrauch zu regulieren. Weiterhin bietet ACPI einen einheitlichen
Zugriff auf Ger?te, die vorher vom BIOS verwaltet wurden. Es werden zwar
Fortschritte gemacht, dass ACPI auf allen Systemen l?uft, doch tauchen
immer wieder Fehler auf: fehlerhafter Bytecode der ACPI-Machine-Language
(AML) einiger Systemplatinen, ein unvollst?ndiges
FreeBSD-Kernel-Subsystem oder Fehler im ACPI-CA-Interpreter von Intel?.

Dieser Abschnitt hilft Ihnen, zusammen mit den Betreuern des
FreeBSD-ACPI-Subsystems, Fehlerquellen zu finden und Fehler zu
beseitigen. Danke, dass Sie diesen Abschnitt lesen; hoffentlich hilft
er, Ihre Systemprobleme zu l?sen.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

12.17.1. Fehlerberichte einreichen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Bevor Sie einen Fehlerbericht einreichen, stellen Sie bitte sicher, dass
Ihr BIOS und die Firmware Ihres Controllers aktuell sind.

.. raw:: html

   </div>

Wenn Sie sofort einen Fehlerbericht einsenden wollen, schicken Sie bitte
die folgenden Informationen an die Mailingliste
`freebsd-acpi <mailto:freebsd-acpi@FreeBSD.org>`__:

.. raw:: html

   <div class="itemizedlist">

-  Beschreiben Sie den Fehler und alle Umst?nde, unter denen der Fehler
   auftritt. Geben Sie ebenfalls den Typ und das Modell Ihres Systems
   an. Wenn Sie einen neuen Fehler entdeckt haben, versuchen Sie
   m?glichst genau zu beschreiben, wann der Fehler das erste Mal
   aufgetreten ist.

-  Die Ausgabe von
   `dmesg(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dmesg&sektion=8>`__
   nach der Eingabe von ``boot -v``. Geben Sie auch alle Fehlermeldungen
   an, die erscheinen, wenn Sie den Fehler provozieren.

-  Die Ausgabe von
   `dmesg(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dmesg&sektion=8>`__
   nach der Eingabe von ``boot -v`` und mit deaktiviertem ACPI, wenn das
   Problem ohne ACPI nicht auftritt.

-  Die Ausgabe von ``sysctl hw.acpi``. Dieses Kommando zeigt die vom
   System unterst?tzten ACPI-Funktionen an.

-  Die URL, unter der die ACPI-Source-Language (ASL) liegt. Schicken Sie
   bitte *nicht* die ASL an die Mailingliste, da die ASL sehr gro? sein
   kann. Eine Kopie der ASL erstellen Sie mit dem nachstehenden Befehl:

   .. code:: screen

       # acpidump -td > name-system.asl

   Setzen Sie bitte f?r *``name``* den Namen Ihres Kontos und f?r
   *``system``* den Hersteller und das Modell Ihres Systems ein. Zum
   Beispiel: ``njl-FooCo6000.asl``.

.. raw:: html

   </div>

Obwohl die meisten Entwickler die Mailingliste
`freebsd-current <http://lists.FreeBSD.org/mailman/listinfo/freebsd-current>`__
lesen, sollten Sie Fehlerberichte an die Liste
`freebsd-acpi <http://lists.FreeBSD.org/mailman/listinfo/freebsd-acpi>`__
schicken. Seien Sie bitte geduldig; wir haben alle Arbeit au?erhalb des
Projekts. Wenn der Fehler nicht offensichtlich ist, bitten wir Sie
vielleicht, einen offiziellen Fehlerbericht (PR) mit
`send-pr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=send-pr&sektion=1>`__
einzusenden. Geben Sie im Fehlerbericht bitte dieselben Informationen
wie oben an. Mithilfe der PRs verfolgen und l?sen wir Probleme. Senden
Sie bitte keinen PR ein, ohne vorher den Fehlerbericht an die Liste
`freebsd-acpi <http://lists.FreeBSD.org/mailman/listinfo/freebsd-acpi>`__
zu senden. Wir benutzen die PRs als Erinnerung an bestehende Probleme
und nicht zum Sammeln aller Probleme. Es kann sein, dass der Fehler
schon von jemand anderem gemeldet wurde.

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

12.17.2. ACPI-Grundlagen
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

ACPI gibt es in allen modernen Rechnern der ia32- (x86), ia64- (Itanium)
und amd64- (AMD) Architektur. Der vollst?ndige Standard bietet
Funktionen zur Steuerung und Verwaltung der CPU-Leistung, der
Stromversorgung, von W?rmebereichen, Batterien, eingebetteten
Controllern und Bussen. Auf den meisten Systemen wird nicht der
vollst?ndige Standard implementiert. Arbeitsplatzrechner besitzen meist
nur Funktionen zur Verwaltung der Busse, w?hrend Notebooks Funktionen
zur Temperaturkontrolle und Ruhezust?nde besitzen.

Ein ACPI konformes System besitzt verschiedene Komponenten. Die BIOS-
und Chipsatz-Hersteller stellen mehrere statische Tabellen bereit (zum
Beispiel die Fixed-ACPI-Description-Table, FADT). Die Tabellen enthalten
beispielsweise die mit SMP-Systemen benutzte APIC-Map,
Konfigurationsregister und einfache Konfigurationen. Zus?tzlich gibt es
die Differentiated-System-Description-Table (DSDT), die Bytecode
enth?lt. Die Tabelle ordnet Ger?te und Methoden in einem baumartigen
Namensraum an.

Ein ACPI-Treiber muss die statischen Tabellen einlesen, einen
Interpreter f?r den Bytecode bereitstellen und die Ger?tetreiber im
Kernel so modifizieren, dass sie mit dem ACPI-Subsystem kommunizieren.
F?r FreeBSD, Linux und NetBSD hat Intel? den Interpreter ACPI-CA, zur
Verf?gung gestellt. Der Quelltext zu ACPI-CA befindet sich im
Verzeichnis ``src/sys/contrib/dev/acpica``. Die Schnittstelle von
ACPI-CA zu FreeBSD befindet sich unter ``src/sys/dev/acpica/Osd``.
Treiber, die verschiedene ACPI-Ger?te implementieren, befinden sich im
Verzeichnis ``src/sys/dev/acpica``.

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

12.17.3. H?ufige Probleme
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Damit ACPI richtig funktioniert, m?ssen alle Teile funktionieren. Im
Folgenden finden Sie eine Liste mit Problemen und m?glichen Umgehungen
oder Fehlerbehebungen. Die Liste ist nach der H?ufigkeit, mit der die
Probleme auftreten, sortiert.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

12.17.3.1. Mausprobleme
^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Es kann vorkommen, dass die Maus nicht mehr funktioniert, wenn Sie nach
einem Suspend weiterarbeiten wollen. Ist dies bei Ihnen der Fall, reicht
es meistens aus, den Eintrag ``hint.psm.0.flags="0x3000"`` in
``/boot/loader.conf`` aufzunehmen. Besteht das Problem weiterhin,
sollten Sie einen Fehlerbericht an das FreeBSD Project senden.

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

12.17.3.2. Suspend/Resume
^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

ACPI kennt drei Suspend-to-RAM-Zust?nde (STR): ``S1``-``S3``. Es gibt
einen Suspend-to-Disk-Zustand: ``S4``. Der Zustand ``S5`` wird Soft-Off
genannt. In diesem Zustand befindet sich ein Rechner, wenn die
Stromversorgung angeschlossen ist, der Rechner aber nicht hochgefahren
ist. Der Zustand ``S4`` kann auf zwei Arten implementiert werden:
``S4``\ BIOS und ``S4``\ OS. Im ersten Fall wird der
Suspend-to-Disk-Zustand durch das BIOS hergestellt im zweiten Fall
alleine durch das Betriebssystem.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Die Suspend-Zust?nde sind Ruhezust?nde, in denen der Rechner weniger
Energie als im Normalbetrieb ben?tigt. Resume bezeichnet die R?ckkehr
zum Normalbetrieb.

.. raw:: html

   </div>

Die Suspend-Zust?nde k?nnen Sie mit dem Kommando ``sysctl hw.acpi``
ermitteln. Das Folgende k?nnte beispielsweise ausgegeben werden:

.. code:: screen

    hw.acpi.supported_sleep_state: S3 S4 S5
    hw.acpi.s4bios: 0

Diese Ausgabe besagt, dass mit dem Befehl ``acpiconf -s`` die Zust?nde
``S3``, ``S4``\ OS und ``S5`` eingestellt werden k?nnen. H?tte
``s4bios`` den Wert ``1``, g?be es den Zustand ``S4``\ BIOS anstelle von
``S4``\ OS.

Wenn Sie die Suspend- und Resume-Funktionen testen, fangen Sie mit dem
``S1``-Zustand an, wenn er angeboten wird. Dieser Zustand wird am
ehesten funktionieren, da der Zustand wenig Treiber-Unterst?tzung
ben?tigt. Der Zustand ``S2`` ist ?hnlich wie ``S1``, allerdings hat ihn
noch niemand implementiert. Als n?chstes sollten Sie den Zustand ``S3``
ausprobieren. Dies ist der tiefste STR-Schlafzustand. Dieser Zustand ist
auf massive Treiber-Unterst?tzung angewiesen, um die Ger?te wieder
richtig zu initialisieren. Wenn Sie Probleme mit diesem Zustand haben,
k?nnen Sie die Mailingliste
`freebsd-acpi <http://lists.FreeBSD.org/mailman/listinfo/freebsd-acpi>`__
anschreiben. Erwarten Sie allerdings nicht zu viel: Es gibt viele
Treiber und Ger?te, an denen noch gearbeitet und getestet wird.

Ein h?ufiges Problem mit Suspend/Resume ist, dass viele Ger?tetreiber
ihre Firmware, Register und Ger?tespeicher nicht korrekt speichern,
wiederherstellen und/oder reinitialisieren. Um dieses Problem zu l?sen,
sollten Sie zuerst die folgenden Befehle ausf?hren:

.. code:: screen

    # sysctl debug.bootverbose=1
    # sysctl debug.acpi.suspend_bounce=1
    # acpiconf -s 3

Dieser Test emuliert einen Suspend/Resume-Zyklus f?r alle Ger?te (ohne
dass diese dabei wirklich in den Status ``S3`` wechseln). In vielen
F?llen reicht dies bereits aus, um Probleme (beispielsweise verlorener
Firmware-Status, Timeouts, h?ngende Ger?te) zu entdecken. Beachten Sie
dabei, dass das Ger?t bei diesem Test nicht wirklich in den Status
``S3`` wechseln. Es kann also vorkommen, dass manche Ger?te weiterhin
mit Strom versorgt werden (dies w?re bei einem wirklichen Wechsel in den
Status ``S3`` NICHT m?glich. Andere Ger?te werden normal weiterarbeiten,
weil sie ?ber keine Suspend/Resume-Funktionen verf?gen.

Schwierigere F?lle k?nnen den Einsatz zus?tzlicher Hardware
(beispielsweise serielle Ports/Kabel f?r die Verbindung ?ber eine
serielle Konsole oder Firewire-Ports/Kabel f?r
`dcons(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dcons&sektion=4>`__)
sowie Kenntnisse im Bereich Kerneldebugging erforderlich machen.

Um das Problem einzugrenzen, entfernen Sie soviele Treiber wie m?glich
aus dem Kernel. Sie k?nnen das Problem isolieren, indem Sie einen
Treiber nach dem anderen laden, bis der Fehler wieder auftritt.
Typischerweise verursachen bin?re Treiber wie ``nvidia.ko``,
X11-Grafiktreiber und USB-Treiber die meisten Fehler, hingegen laufen
Ethernet-Treiber f?r gew?hnlich sehr zuverl?ssig. Wenn ein Treiber
zuverl?ssig geladen und entfernt werden kann, k?nnen Sie den Vorgang
automatisieren, indem Sie die entsprechenden Kommandos in die Dateien
``/etc/rc.suspend`` und ``/etc/rc.resume`` einf?gen. In den Dateien
finden Sie ein deaktiviertes Beispiel, das einen Treiber l?dt und wieder
entfernt. Ist die Bildschirmanzeige bei der Wiederaufnahme des Betriebs
gest?rt, setzen Sie bitte die Variable ``hw.acpi.reset_video`` auf
``0``. Versuchen Sie auch, die Variable ``hw.acpi.sleep_delay`` auf
k?rzere Zeitspannen zu setzen.

Die Suspend- und Resume-Funktionen k?nnen Sie auch auf einer neuen
Linux-Distribution mit ACPI testen. Wenn es mit Linux funktioniert,
liegt das Problem wahrscheinlich bei einem FreeBSD-Treiber. Es hilft
uns, das Problem zu l?sen, wenn Sie feststellen k?nnen, welcher Treiber
das Problem verursacht. Beachten Sie bitte, dass die ACPI-Entwickler
normalerweise keine anderen Treiber pflegen (beispielsweise Sound- oder
ATA-Treiber). Es ist wohl das beste, die Ergebnisse der Fehlersuche an
die Mailingliste
`freebsd-current <http://lists.FreeBSD.org/mailman/listinfo/freebsd-current>`__
und den Entwickler des Treibers zu schicken. Wenn Ihnen danach ist,
versuchen Sie, den Fehler in der Resume-Funktion zu finden, indem Sie
einige
`printf(3) <http://www.FreeBSD.org/cgi/man.cgi?query=printf&sektion=3>`__-Anweisungen
in den Code des fehlerhaften Treibers einf?gen.

Schlie?lich k?nnen Sie ACPI noch abschalten und stattdessen APM
verwenden. Wenn die Suspend- und Resume-Funktionen mit APM
funktionieren, sollten Sie vielleicht besser APM verwenden (insbesondere
mit alter Hardware von vor dem Jahr 2000). Die Hersteller ben?tigten
einige Zeit, um ACPI korrekt zu implementieren, daher gibt es mit
?lterer Hardware oft ACPI-Probleme.

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

12.17.3.3. Tempor?re oder permanente Systemh?nger
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die meisten Systemh?nger entstehen durch verlorene Interrupts oder einen
Interrupt-Sturm. Probleme werden verursacht durch die Art, in der das
BIOS Interrupts vor dem Systemstart konfiguriert, durch eine fehlerhafte
APIC-Tabelle und durch die Zustellung des System-Control-Interrupts
(SCI).

Anhand der Ausgabe des Befehls ``vmstat -i`` k?nnen Sie verlorene
Interrupts von einem Interrupt-Sturm unterscheiden. Untersuchen Sie die
Ausgabezeile, die ``acpi0`` enth?lt. Ein Interrupt-Sturm liegt vor, wenn
der Z?hler ?fter als ein paar Mal pro Sekunde hochgez?hlt wird. Wenn
sich das System aufgehangen hat, versuchen Sie mit der Tastenkombination
**Ctrl**+**Alt**+**Esc** in den Debugger DDB zu gelangen. Geben Sie dort
den Befehl ``show interrupts`` ein.

Wenn Sie Interrupt-Probleme haben, ist es vorerst wohl am besten, APIC
zu deaktivieren. Tragen Sie dazu die Zeile ``hint.apic.0.disabled="1"``
in ``loader.conf`` ein.

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

12.17.3.4. Abst?rze (Panics)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

*Panics* werden so schnell wie m?glich behoben; mit ACPI kommt es aber
selten dazu. Zuerst sollten Sie die Panic reproduzieren und dann
versuchen einen *backtrace* (eine R?ckverfolgung der Funktionsaufrufe)
zu erstellen. Richten Sie dazu den DDB ?ber die serielle Schnittstelle
(siehe `Abschnitt?28.6.5.3, „DDB Debugger ?ber die serielle
Schnittstelle“ <serialconsole-setup.html#serialconsole-ddb>`__) oder
eine gesonderte
`dump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dump&sektion=8>`__-Partition
ein. In DDB k?nnen Sie den *backtrace* mit dem Kommando ``tr``
erstellen. Falls Sie den *backtrace* vom Bildschirm abschreiben m?ssen,
schreiben Sie bitte mindestens die f?nf ersten und die f?nf letzten
Zeile der Ausgabe auf.

Versuchen Sie anschlie?end, das Problem durch einen Neustart ohne ACPI
zu beseitigen. Wenn das funktioniert hat, k?nnen Sie versuchen, das
verantwortliche ACPI-Subsystem durch Setzen der Variablen
``debug.acpi.disable`` herauszufinden. Die Hilfeseite
`acpi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=acpi&sektion=4>`__
enth?lt dazu einige Beispiele.

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

12.17.3.5. Nach einem Suspend oder einem Stopp startet das System wieder
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Setzen Sie zuerst in
`loader.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=loader.conf&sektion=5>`__
die Variable ``hw.acpi.disable_on_poweroff`` auf ``0``. Damit wird
verhindert, dass ACPI w?hrend des Systemabschlusses die Bearbeitung
verschiedener Ereignisse deaktiviert. Auf manchen Systemen muss die
Variable den Wert ``1`` besitzen (die Voreinstellung). Normalerweise
wird der unerw?nschte Neustart des Systems durch Setzen dieser Variablen
behoben.

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

12.17.3.6. Andere Probleme
^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn Sie weitere Probleme mit ACPI haben (Umgang mit einer
Docking-Station, nicht erkannte Ger?te), schicken Sie bitte eine
Beschreibung an die Mailingliste. Allerdings kann es sein, dass einige
Probleme von noch unvollst?ndigen Teilen des ACPI-Subsystems abh?ngen
und es etwas dauern kann bis diese Teile fertig sind. Seien Sie geduldig
und rechnen Sie damit, dass wir Ihnen Fehlerbehebungen zum Testen
senden.

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

12.17.4. ASL, ``acpidump`` und IASL
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Ein h?ufiges Problem ist fehlerhafter Bytecode des BIOS-Herstellers.
Dies erkennen Sie an Kernelmeldungen auf der Konsole wie die folgende:

.. code:: screen

    ACPI-1287: *** Error: Method execution failed [\\_SB_.PCI0.LPC0.FIGD._STA] \\
    (Node 0xc3f6d160), AE_NOT_FOUND

Oft k?nnen Sie das Problem dadurch l?sen, dass Sie eine aktuelle
BIOS-Version einspielen. Die meisten Meldungen auf der Konsole sind
harmlos, wenn aber beispielsweise der Batteriestatus falsch angezeigt
wird, k?nnen Sie in den Meldungen nach Problemen mit der
AML-Machine-Language (AML) suchen. Der Bytecode der AML wird aus der
ACPI-Source-Language (ASL) ?bersetzt und in einer Tabelle, der DSDT,
abgelegt. Eine Kopie der ASL k?nnen Sie mit dem Befehl
`acpidump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=acpidump&sektion=8>`__
erstellen. Verwenden Sie mit diesem Befehl sowohl die Option ``-t`` (die
Inhalte der statischen Tabellen anzeigen) als auch die Option ``-d``
(die AML in ASL zur?ck?bersetzen). Ein Beispiel f?r die Syntax finden
Sie im Abschnitt `Fehlerberichte
einreichen <ACPI-debug.html#ACPI-submitdebug>`__.

Sie k?nnen einfach pr?fen, ob sich die ASL ?bersetzen l?sst. F?r
gew?hnlich k?nnen Sie Warnungen w?hrend des ?bersetzens ignorieren.
Fehlermeldungen f?hren normal dazu, dass ACPI fehlerhaft arbeitet. Ihre
ASL ?bersetzen Sie mit dem nachstehenden Kommando:

.. code:: screen

    # iasl ihre.asl

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

12.17.5. Die ASL reparieren
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Auf lange Sicht ist es unser Ziel, dass ACPI ohne Eingriffe des
Benutzers l?uft. Zurzeit entwickeln wir allerdings noch Umgehungen f?r
Fehler der BIOS-Hersteller. Der Microsoft?-Interpreter (``acpi.sys`` und
``acpiec.sys``) pr?ft die ASL nicht streng gegen den Standard. Daher
reparieren BIOS-Hersteller, die ACPI nur unter Windows? testen, ihre ASL
nicht. Wir hoffen, dass wir das vom Standard abweichende Verhalten des
Microsoft?-Interpreters dokumentieren und in FreeBSD replizieren k?nnen.
Dadurch m?ssen Benutzer ihre ASL nicht selbst reparieren. Sie k?nnen
Ihre ASL selbst reparieren, wenn Sie ein Problem umgehen und uns helfen
m?chten. Senden Sie uns bitte die mit
`diff(1) <http://www.FreeBSD.org/cgi/man.cgi?query=diff&sektion=1>`__
erstellte Differenz zwischen alter und neuer ASL. Wir werden versuchen,
den Interpreter ACPI-CA zu korrigieren, damit die Fehlerbehebung nicht
mehr erforderlich ist.

Die nachfolgende Liste enth?lt h?ufige Fehlermeldungen, deren Ursache
und eine Beschreibung, wie die Fehler korrigiert werden:

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

12.17.5.1. Abh?ngigkeiten vom Betriebssystem
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Einige AMLs gehen davon aus, dass die Welt ausschlie?lich aus
verschiedenen Windows?-Versionen besteht. FreeBSD kann vorgeben,
irgendein Betriebssystem zu sein. Versuchen Sie das Betriebssystem, das
Sie in der ASL finden, in der Datei ``/boot/loader.conf`` anzugeben:
``hw.acpi.osname="Windows 2001"``.

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

12.17.5.2. Fehlende Return-Anweisungen
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Einige Methoden verzichten auf die vom Standard vorgeschriebene R?ckgabe
eines Wertes. Obwohl der Interpreter ACPI-CA dies nicht beheben kann,
besitzt FreeBSD die M?glichkeit, den R?ckgabewert implizit zu setzen.
Wenn Sie wissen, welcher Wert zur?ckgegeben werden muss, k?nnen Sie die
fehlenden Return-Anweisungen selbst einsetzen. Die Option ``-f`` zwingt
``iasl``, die ASL zu ?bersetzen.

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

12.17.5.3. ?berschreiben der vorgegebenen AML
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Nachdem Sie Ihre ASL in der Datei ``ihre.asl`` angepasst haben,
?bersetzen Sie die ASL wie folgt:

.. code:: screen

    # iasl ihre.asl

Mit der Option ``-f`` erzwingen Sie das Erstellen der AML auch wenn
w?hrend der ?bersetzung Fehler auftreten. Beachten Sie, dass einige
Fehler, wie fehlende Return-Anweisungen, automatisch vom Interpreter
umgangen werden.

In der Voreinstellung erstellt der Befehl ``iasl`` die Ausgabedatei
``DSDT.aml``. Wenn Sie diese Datei anstelle der fehlerhaften Kopie des
BIOS laden wollen, editieren Sie ``/boot/loader.conf`` wie folgt:

.. code:: programlisting

    acpi_dsdt_load="YES"
    acpi_dsdt_name="/boot/DSDT.aml"

Stellen Sie bitte sicher, dass sich die Datei ``DSDT.aml`` im
Verzeichnis ``/boot`` befindet.

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

12.17.6. ACPI-Meldungen zur Fehlersuche erzeugen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Der ACPI-Treiber besitzt flexible M?glichkeiten zur Fehlersuche. Sie
k?nnen sowohl die zu untersuchenden Subsysteme als auch die zu
erzeugenden Ausgaben festlegen. Die zu untersuchenden Subsysteme werden
als so genannte „layers“ angegeben. Die Subsysteme sind in
ACPI-CA-Komponenten (``ACPI_ALL_COMPONENTS``) und ACPI-Hardware
(``ACPI_ALL_DRIVERS``) aufgeteilt. Welche Meldungen ausgegeben werden,
wird ?ber „level“ gesteuert. „level“ reicht von ``ACPI_LV_ERROR`` (es
werden nur Fehler ausgegeben) bis zu ``ACPI_LV_VERBOSE`` (alles wird
ausgegeben). „level“ ist eine Bitmaske, sodass verschiedene Stufen auf
einmal (durch Leerzeichen getrennt) angegeben werden k?nnen. Die
erzeugte Ausgabemenge passt vielleicht nicht in den Konsolenpuffer. In
diesem Fall sollten Sie die Ausgaben mithilfe einer seriellen Konsole
sichern. Die m?glichen Werte f?r „layers“ und „level“ werden in der
Hilfeseite
`acpi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=acpi&sektion=4>`__
beschrieben.

Die Ausgaben zur Fehlersuche sind in der Voreinstellung nicht aktiviert.
Wenn ACPI im Kernel enthalten ist, f?gen Sie ``options ACPI_DEBUG`` zur
Kernelkonfigurationsdatei hinzu. Sie k?nnen die Ausgaben zur Fehlersuche
global aktivieren, indem Sie in der Datei ``/etc/make.conf`` die Zeile
``ACPI_DEBUG=1`` einf?gen. Das Modul ``acpi.ko`` k?nnen Sie wie folgt
neu ?bersetzen:

.. code:: screen

    # cd /sys/modules/acpi/acpi
    && make clean &&
    make ACPI_DEBUG=1

Installieren Sie anschlie?end ``acpi.ko`` im Verzeichnis
``/boot/kernel``. In der Datei ``loader.conf`` stellen Sie „level“ und
„layer“ ein. Das folgende Beispiel aktiviert die Ausgabe von Fehlern f?r
alle ACPI-CA-Komponenten und alle ACPI-Hardwaretreiber (wie CPU, LID):

.. code:: programlisting

    debug.acpi.layer="ACPI_ALL_COMPONENTS ACPI_ALL_DRIVERS"
    debug.acpi.level="ACPI_LV_ERROR"

Wenn ein Problem durch ein bestimmtes Ereignis, beispielsweise den Start
nach einem Ruhezustand, hervorgerufen wird, k?nnen Sie die Einstellungen
f?r „level“ und „layer“ auch mit dem Kommando ``sysctl`` vornehmen. In
diesem Fall m?ssen Sie die Datei ``loader.conf`` nicht editieren. Auf
der ``sysctl``-Kommandozeile geben Sie dieselben Variablennamen wie in
``loader.conf`` an.

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

12.17.7. ACPI-Informationsquellen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Weitere Informationen zu ACPI erhalten Sie an den folgenden Stellen:

.. raw:: html

   <div class="itemizedlist">

-  die `FreeBSD
   ACPI <http://lists.FreeBSD.org/mailman/listinfo/freebsd-acpi>`__
   Mailingliste,

-  die Archive der ACPI-Mailingliste:
   ``http://lists.FreeBSD.org/pipermail/freebsd-acpi/``,

-  die alten Archive der ACPI-Mailingliste:
   ``http://home.jp.FreeBSD.org/mail-list/acpi-jp/``,

-  die ACPI-Spezifikation (Version 2.0): ``http://acpi.info/spec.htm``,

-  in den nachstehenden FreeBSD-Hilfeseiten:
   `acpi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=acpi&sektion=4>`__,
   `acpi\_thermal(4) <http://www.FreeBSD.org/cgi/man.cgi?query=acpi_thermal&sektion=4>`__,
   `acpidump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=acpidump&sektion=8>`__,
   `iasl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=iasl&sektion=8>`__
   und
   `acpidb(8) <http://www.FreeBSD.org/cgi/man.cgi?query=acpidb&sektion=8>`__,

-  `DSDT debugging
   resource <http://www.cpqlinux.com/acpi-howto.html#fix_broken_dsdt>`__
   (als Beispiel wird Compaq erl?utert, die Ressource ist aber dennoch
   n?tzlich).

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------------+--------------------------------------+-------------------------------------+
| `Zur?ck <acpi-overview.html>`__?            | `Nach oben <config-tuning.html>`__   | ?\ `Weiter <boot.html>`__           |
+---------------------------------------------+--------------------------------------+-------------------------------------+
| 12.16. Energie- und Ressourcenverwaltung?   | `Zum Anfang <index.html>`__          | ?Kapitel 13. FreeBSDs Bootvorgang   |
+---------------------------------------------+--------------------------------------+-------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
