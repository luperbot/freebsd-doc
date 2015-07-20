============================================
32.4. Paket Filter (PF) von OpenBSD und ALTQ
============================================

.. raw:: html

   <div class="navheader">

32.4. Paket Filter (PF) von OpenBSD und ALTQ
`Zur?ck <firewalls-apps.html>`__?
Kapitel 32. Firewalls
?\ `Weiter <firewalls-ipf.html>`__

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

32.4. Paket Filter (PF) von OpenBSD und ALTQ
--------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Revised and updated by John Ferrell.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Im Juli 2003 wurde PF, die Standard-Firewall von OpenBSD, nach FreeBSD
portiert und in die FreeBSD-Ports-Sammlung aufgenommen. 2004 war PF in
FreeBSD?5.3 Teil des Basissystems. Bei PF handelt es sich um eine
komplette, vollausgestattete Firewall, die optional auch ALTQ
(Alternatives Queuing) unterst?tzt. ALTQ bietet Ihnen *Quality of
Service* (QoS)-Bandbreitenformung.

Das OpenBSD-Projekt leistet bereits hervorragende Dokumentationsarbeit
mit der `PF FAQ <http://www.openbsd.org/faq/pf/>`__. Aus diesem Grund
konzentriert sich dieser Handbuchabschnitt nur auf diejenigen
Besonderheiten von PF, die FreeBSD betreffen, sowie ein paar allgemeine
Informationen hinsichtlich der Verwendung. Genauere Informationen zum
Einsatz erhalten Sie in der `PF FAQ <http://www.openbsd.org/faq/pf/>`__.

Weitere Informationen zu PF f?r FreeBSD finden Sie unter
``http://pf4freebsd.love2party.net/``.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

32.4.1. Verwendung der PF-Kernelmodule
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Um die PF Kernel Module zu laden, f?gen Sie folgende Zeile in ihre
``/etc/rc.conf`` ein:

.. code:: programlisting

    pf_enable="YES"

Danach starten Sie das Startup Script um die Module zu laden:

.. code:: screen

    # /etc/rc.d/pf start

Das PF Modul wird nicht geladen, falls es die Ruleset
Konfigurationsdatei nicht findet. Standardm?ssig befindet sich diese
Datei in ``/etc/pf.conf``. Falls das PF Ruleset sich an einem anderen
Platz befindet, k?nnen Sie das durch Hinzuf?gen einer Zeile ?hnlich der
folgenden, in ihrer ``/etc/rc.conf`` ?ndern:

.. code:: programlisting

    pf_rules="/path/to/pf.conf"

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Ein Beispiel f?r die Datei ``pf.conf`` finden Sie im Verzeichnis
``/usr/share/examples/pf/``.

.. raw:: html

   </div>

Das PF-Modul kann auch manuell ?ber die Kommandozeile geladen werden:

.. code:: screen

    # kldload pf.ko

Protokollierungsfunktionen f?r PF werden durch das Modul ``pflog.ko``
zur Verf?gung gestellt und k?nnen durch folgenden Eintrag in der
``/etc/rc.conf`` aktiviert werden:

.. code:: programlisting

    pflog_enable="YES"

Danach starten Sie das Startup Script, um das Modul zu laden:

.. code:: screen

    # /etc/rc.d/pflog start

Falls Sie noch weitere Features f?r PF ben?tigen, m?ssen Sie diese in
den Kernel einbauen.

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

32.4.2. PF Kernel-Optionen
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Es ist nicht zwingend n?tig, dass Sie PF-Unterst?tzung in den
FreeBSD-Kernel kompilieren. Sie werden dies tun m?ssen, um eine von PFs
fortgeschritteneren Eigenschaften nutzen zu k?nnen, die nicht als
Kernelmodul verf?gbar ist. Genauer handelt es sich dabei um
`pfsync(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pfsync&sektion=4>`__,
ein Pseudo-Ger?t, welches bestimmte ?nderungen der PF-Zustandstabelle
offenlegt. Es kann mit
`carp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=carp&sektion=4>`__
kombiniert werden, um ausfallsichere Firewalls mit PF zu realisieren.
Weitere Informationen zu CARP erhalten Sie in `Abschnitt?33.11, „CARP -
Common Address Redundancy Protocol“ <carp.html>`__ des Handbuchs.

Die Kernelkonfigurationsoptionen von PF befinden sich in
``/usr/src/sys/conf/NOTES`` und sind im Folgenden wiedergegeben:

.. code:: programlisting

    device pf
    device pflog
    device pfsync

Die Option ``device pf`` aktiviert die Unterst?tzung f?r die „Packet
Filter“-Firewall
(`pf(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pf&sektion=4>`__).

Die Option ``device pflog`` aktiviert das optionale
`pflog(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pflog&sektion=4>`__-Pseudonetzwerkger?t,
das zum Protokollieren des Datenverkehrs ?ber einen
`bpf(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bpf&sektion=4>`__-Deskriptor
dient.
`pflogd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pflogd&sektion=8>`__
ist in der Lage, diese Protokolldateien auf Ihre Platte zu speichern.

Die Option ``device pfsync`` aktiviert das optionale
`pfsync(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pfsync&sektion=4>`__-Pseudonetzwerkger?t
f?r die ?berwachung von „Status?nderungen“.

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

32.4.3. Verf?gbare rc.conf-Optionen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die folgenden
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5>`__-Eintr?ge
konfigurieren PF und
`pflog(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pflog&sektion=4>`__
beim Systemstart:

.. code:: programlisting

    pf_enable="YES"                 # PF aktivieren (Modul, wenn n?tig, aktivieren)
    pf_rules="/etc/pf.conf"         # Datei mit Regeldefinitionen f?r pf
    pf_flags=""                     # zus?tzliche Parameter f?r den Start von pfctl
    pflog_enable="YES"              # starte pflogd(8)
    pflog_logfile="/var/log/pflog"  # wo soll pflogd die Protokolldatei speichern
    pflog_flags=""                  # zus?tzliche Parameter f?r den Start von pflogd

Wenn Sie ein lokales Netzwerk hinter dieser Firewall betreiben und
Pakete f?r dessen Rechner weiterleiten oder NAT verwenden wollen,
ben?tigen Sie zus?tzlich die folgende Option:

.. code:: programlisting

    gateway_enable="YES"            # LAN Gateway aktivieren

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

32.4.4. Filterregeln erstellen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

PF liest seine konfigurierten Regeln aus
`pf.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=pf.conf&sektion=5>`__
(standardm?ssig ``/etc/pf.conf``) und modifiziert, verwirft oder l?sst
Pakete passieren anhand der Regeln oder Definitionen, die in dieser
Datei gespeichert sind. FreeBSD enth?lt dazu nach der Installation
mehrere Beispieldateien, die in ``/usr/share/examples/pf/`` abgelegt
sind. F?r eine ausf?hrliche Behandlung des PF-Regelwerks lesen Sie bitte
die `PF FAQ <http://www.openbsd.org/faq/pf/>`__.

.. raw:: html

   <div class="warning" xmlns="">

Warnung:
~~~~~~~~

Beim Lesen der `PF FAQ <http://www.openbsd.org/faq/pf/>`__ wollten Sie
darauf achten, dass verschiedene Versionen von FreeBSD auch
unterschiedliche Versionen von PF enthalten. FreeBSD?8.\ *``X``* (und
?lter) FreeBSD-Versionen benutzen PF aus OpenBSD?4.1.
FreeBSD?9.\ *``X``* (und neuer) benutzen hingegen PF aus OpenBSD?4.5.

.. raw:: html

   </div>

Die `FreeBSD packet filter mailing
list <http://lists.FreeBSD.org/mailman/listinfo/freebsd-pf>`__ ist eine
erste Anlaufstelle f?r Fragen zur Konfiguration und dem Einsatz der PF
Firewall. Vergessen Sie nicht, vorher die Mailinglistenarchive zu
durchsuchen, bevor Sie dort eine Frage stellen!

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

32.4.5. Arbeiten mit PF
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Benutzen Sie
`pfctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pfctl&sektion=8>`__,
um PF zu steuern. Unten finden Sie ein paar n?tzliche Befehle (lesen Sie
auch die Manualpage zu
`pfctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pfctl&sektion=8>`__,
um alle verf?gbaren Optionen nachzuschlagen):

.. raw:: html

   <div class="informaltable">

+---------------------------------------------------------+---------------------------------------------------------------------------------------------------------------------------+
| Befehl                                                  | Zweck                                                                                                                     |
+=========================================================+===========================================================================================================================+
| ``pfctl -e``                                            | PF aktivieren                                                                                                             |
+---------------------------------------------------------+---------------------------------------------------------------------------------------------------------------------------+
| ``pfctl -d``                                            | PF deaktivieren                                                                                                           |
+---------------------------------------------------------+---------------------------------------------------------------------------------------------------------------------------+
| ``pfctl -F all -f /etc/pf.conf``                        | Alle Filterregeln zur?cksetzen (NAT, Filter, Zustand, Tabelle, etc.) und erneut aus der Datei ``/etc/pf.conf`` auslesen   |
+---------------------------------------------------------+---------------------------------------------------------------------------------------------------------------------------+
| ``pfctl -s [ rules | nat |                 states ]``   | Bericht ?ber die Filterregeln, NAT-Regeln, oder Zustandstabellen                                                          |
+---------------------------------------------------------+---------------------------------------------------------------------------------------------------------------------------+
| ``pfctl -vnf /etc/pf.conf``                             | ?berpr?ft ``/etc/pf.conf`` auf Fehler, l?dt aber das Regelwerk nicht neu                                                  |
+---------------------------------------------------------+---------------------------------------------------------------------------------------------------------------------------+

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

32.4.6. ALTQ aktivieren
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

ALTQ muss vor der Verwendung in den FreeBSD-Kernel kompiliert werden.
Beachten Sie, dass ALTQ nicht von allen verf?gbaren
Netzwerkkartentreibern unterst?tzt wird. Sehen Sie daher zuerst in
`altq(4) <http://www.FreeBSD.org/cgi/man.cgi?query=altq&sektion=4>`__
nach, ob Ihre Netzwerkkarte diese Funktion unter Ihrer FreeBSD-Version
unterst?tzt.

Die folgenden Kerneloptionen aktivieren ALTQ sowie alle
Zusatzfunktionen:

.. code:: programlisting

    options         ALTQ
    options         ALTQ_CBQ        # Class Bases Queuing (CBQ)
    options         ALTQ_RED        # Random Early Detection (RED)
    options         ALTQ_RIO        # RED In/Out
    options         ALTQ_HFSC       # Hierarchical Packet Scheduler (HFSC)
    options         ALTQ_PRIQ       # Priority Queuing (PRIQ)
    options         ALTQ_NOPCC      # Wird von SMP ben?tigt

``options ALTQ`` aktiviert das ALTQ-Framework.

``options ALTQ_CBQ`` aktiviert das *Class Based Queuing* (CBQ). CBQ
erlaubt es, die Bandbreite einer Verbindung in verschiedene Klassen oder
Warteschlangen zu unterteilen, um die Priorit?t von Datenpaketen
basierend auf Filterregeln zu ?ndern.

``options ALTQ_RED`` aktiviert *Random Early Detection* (RED). RED wird
zur Vermeidung einer Netzwerkverstopfung verwendet. Dazu ermittelt RED
die Gr??e der Warteschlange und vergleicht diesen Wert mit den minimalen
und maximalen Grenzwerten der Warteschlange. Ist die Warteschlange
gr??er als das erlaubte Maximum, werden alle neuen Pakete verworfen.
Getreu seinem Namen verwirft RED Pakete unterschiedlicher Verbindungen
nach dem Zufallsprinzip.

``options ALTQ_RIO`` aktiviert *Random Early Detection In and Out*.

``options ALTQ_HFSC`` aktiviert den *Hierarchical Fair Service
Curve*-Paketplaner. Weitere Informationen zu HFSC finden Sie unter
``http://www-2.cs.cmu.edu/~hzhang/HFSC/main.html``.

``options ALTQ_PRIQ`` aktiviert *Priority Queuing* (PRIQ). PRIQ l?sst
Verkehr einer Warteschlange mit h?herer Priorit?t zuerst durch.

``options ALTQ_NOPCC`` aktiviert die SMP Unterst?tzung von ALTQ. Diese
Option ist nur auf SMP-System erforderlich.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------+----------------------------------+--------------------------------------+
| `Zur?ck <firewalls-apps.html>`__?   | `Nach oben <firewalls.html>`__   | ?\ `Weiter <firewalls-ipf.html>`__   |
+-------------------------------------+----------------------------------+--------------------------------------+
| 32.3. Firewallpakete?               | `Zum Anfang <index.html>`__      | ?32.5. Die IPFILTER-Firewall (IPF)   |
+-------------------------------------+----------------------------------+--------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
