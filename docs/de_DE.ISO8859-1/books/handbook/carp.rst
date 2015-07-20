================================================
33.11. CARP - Common Address Redundancy Protocol
================================================

.. raw:: html

   <div class="navheader">

33.11. CARP - Common Address Redundancy Protocol
`Zur?ck <network-ipv6.html>`__?
Kapitel 33. Weiterf?hrende Netzwerkthemen
?\ `Weiter <appendices.html>`__

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

33.11. CARP - Common Address Redundancy Protocol
------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Beigetragen von Tom Rhodes.

.. raw:: html

   </div>

.. raw:: html

   <div>

Aktualisiert von Allan Jude.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das *Common Address Redundancy Protocol* (CARP) erlaubt es, mehreren
Rechnern die gleiche IP-Adresse zuzuweisen und *Hochverf?gbarkeit*
bereitzustellen. Das bedeutet, dass ein oder mehrere Rechner ausfallen
k?nnen und die anderen Rechner transparent einspringen, ohne das der
Benutzer etwas von einem Ausfall mitbekommt. Neben der gemeinsamen
IP-Adresse, haben die jeweiligen Rechner auch eine eindeutige IP-Adresse
zur Verwaltung und Konfiguration, wie in den folgenden Beispielen zu
sehen ist.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

33.11.1. Hochverf?gbarkeit mit CARP
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

CARP wird h?ufig verwendet, um einen oder mehrere Dienste hochverf?gbar
zu machen. Dieses Beispiel konfiguriert eine Failover-Unterst?tzung mit
drei Servern (mit jeweils eigener, eindeutiger IP-Adresse), die alle den
gleichen Web-Inhalt anbieten. Die Lastverteilung dieser Maschinen wird
dabei ?ber *Round Robin* DNS konfiguriert. Mit Ausnahme des Hostnamens
und der IP-Management-Adresse sind Master- und Backup-Maschinen
identisch konfiguriert. Die Server m?ssen die gleiche Konfiguration und
die gleichen Dienste aktiviert haben. Tritt ein Failover auf, k?nnen
Anfragen an den Dienst mit der gemeinsam genutzten IP-Adresse nur dann
richtig beantwortet werden, wenn der Backup-Server Zugriff auf denselben
Inhalt hat. Die Backup-Maschine verf?gt ?ber zwei zus?tzliche
CARP-Schnittstellen, eine f?r jede IP-Adresse des
Master-Content-Servers. Sobald ein Fehler auftritt, ?bernimmt der
Backup-Server die IP-Adresse des ausgefallenen Master-Servers. Die
Benutzer werden einen Dienstausfall ?berhaupt nicht bemerken.

Dieses Beispiel benutzt zwei verschiedene Master namens
``hosta.example.org`` und ``hostb.example.org`` mit einem gemeinsamen
Backup namens ``hostc.example.org``.

Jede virtuelle IP-Adresse hat eine eindeutige Identifikationsnummer, die
als *Virtual Host Identification* (VHID) bekannt ist. Alle Maschinen,
die sich eine IP-Adresse teilen, verwenden die gleiche VHID. Die VHID
f?r jede einzelne IP-Adresse muss, entsprechend der Broadcast-Dom?ne der
Netzwerkschnittstelle, eindeutig sein.

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

33.11.2. CARP mit FreeBSD?10 (und neuer) benutzen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Unterst?tzung f?r CARP erhalten Sie durch das Laden des Kernelmoduls
``carp.ko`` in ``/boot/loader.conf``:

.. code:: programlisting

    carp_load="YES"

Das CARP-Modul kann auch, wie in `Kapitel?9, *Konfiguration des
FreeBSD-Kernels* <kernelconfig.html>`__ beschrieben, direkt in den
FreeBSD Kernel eingebunden werden:

.. code:: programlisting

    device  carp

Hostname, IP-Management-Adresse, Subnetzmaske, gemeinsame IP-Adresse und
VHID werden durch das Hinzuf?gen in ``/etc/rc.conf`` gesetzt. Dieses
Beispiel ist f?r ``hosta.example.org``:

.. code:: programlisting

    hostname="hosta.example.org"
    ifconfig_em0="inet 192.168.1.3 netmask 255.255.255.0"
    ifconfig_em0_alias0="vhid 1 pass testpass alias 192.168.1.50/32"

Beispiel f?r ``hostb.example.org``:

.. code:: programlisting

    hostname="hostb.example.org"
    ifconfig_em0="inet 192.168.1.4 netmask 255.255.255.0"
    ifconfig_em0_alias0="vhid 2 pass testpass alias 192.168.1.51/32"

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Achten Sie unbedingt darauf, dass die durch die Option ``pass`` an
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8>`__
?bergebenen Passw?rter auf beiden Systemen identisch sind, da
``carp``-Ger?te nur mit Systemen kommunizieren k?nnen, die ?ber ein
korrektes Passwort verf?gen.

.. raw:: html

   </div>

Die dritte Maschine, ``hostc.example.org`` ist so konfiguriert, das sie
aktiviert wird, wenn eines der beiden zuvor konfigurierten Systeme
ausf?llt. Diese Maschine ist mit zwei CARP VHIDs konfiguriert, eine f?r
jede virtuelle IP-Adresse der beiden Master-Server. Die Option
``advskew`` (CARP advertising skew) wird gesetzt, um sicherzustellen,
dass sich der Backup-Server sp?ter ank?ndigt wie der Master-Server.
``advskew`` steuert die Rangfolge f?r den Fall das mehrere Backup-Server
zur Verf?gung stehen. Passen Sie die Konfiguration in ``/etc/rc.conf``
an:

.. code:: programlisting

    hostname="hostc.example.org"
    ifconfig_em0="inet 192.168.1.5 netmask 255.255.255.0"
    ifconfig_em0_alias0="vhid 1 advskew 100 pass testpass alias 192.168.1.50/32"
    ifconfig_em1_alias0="vhid 2 advskew 100 pass testpass alias 192.168.1.51/32"

Durch die zwei konfigurierten CARP VHIDs ist ``hostc.example.org`` in
der Lage festzustellen, wenn einer der Master-Server nicht mehr
reagiert. Wenn der Master-Server sich sp?ter ank?ndigt als der
Backup-Server, ?bernimmt der Backup-Server die gemeinsame IP-Adresse,
bis der Master-Server erneut verf?gbar ist.

*Preemption* ist standardm??ig deaktiviert. Wird *Preemption* aktiviert,
kann es vorkommen, dass ``hostc.example.org`` die virtuelle IP-Adresse
nicht wieder an den Master-Server zur?ckgibt. Der Administrator kann
jedoch den Backup-Server dazu zwingen, die ?bernommene IP-Adresse wieder
an den Master-Server zur?ckzugeben:

.. code:: screen

    # ifconfig em0 vhid 1 state
    backup

An dieser Stelle muss entweder das Netzwerk neu gestartet, oder die
Maschine neu gebootet werden, um CARP zu aktivieren.

Die Funktionalit?t von CARP kann, wie in der Manualpage
`carp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=carp&sektion=4>`__
beschrieben, ?ber verschiedene
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
Parameter kontrolliert werden. Mit dem Einsatz von
`devd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=devd&sektion=8>`__
k?nnen weitere Aktionen zu CARP-Ereignissen ausgel?st werden.

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

33.11.3. CARP mit FreeBSD?9 (und ?lter) benutzen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Unterst?tzung f?r CARP erhalten Sie durch das Laden des Kernelmoduls
``carp.ko`` in ``/boot/loader.conf``:

.. code:: programlisting

    if_carp_load="YES"

CARP kann auch direkt in den Kernel eingebunden werden. Diese Prozedur
wird in `Kapitel?9, *Konfiguration des
FreeBSD-Kernels* <kernelconfig.html>`__ beschrieben:

.. code:: programlisting

    device    carp

Die CARP-Schnittstellen selbst k?nnen mittels
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8>`__
erstellt werden:

.. code:: screen

    # ifconfig carp0
    create

Konfigurieren Sie Hostnamen, IP-Management-Adresse, die gemeinsam
genutzte IP-Adresse und die VHID, indem Sie die erforderlichen Zeilen in
``/etc/rc.conf`` hinzuf?gen. Hierzu ein Beispiel f?r
``hosta.example.org``:

.. code:: programlisting

    hostname="hosta.example.org"
    ifconfig_fxp0="inet 192.168.1.3 netmask 255.255.255.0"
    cloned_interfaces="carp0"
    ifconfig_carp0="vhid 1 pass testpass 192.168.1.50/24"

Beispiel f?r ``hostb.example.org``:

.. code:: programlisting

    hostname="hostb.example.org"
    ifconfig_fxp0="inet 192.168.1.4 netmask 255.255.255.0"
    cloned_interfaces="carp0"
    ifconfig_carp0="vhid 2 pass testpass 192.168.1.51/24"

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

*Preemption* ist im GENERIC FreeBSD Kernel deaktiviert. Haben Sie jedoch
*Preemption* in einem angepassten Kernel aktiviert, dass
``hostc.example.org`` die virtuelle IP-Adresse nicht wieder an den
Master-Server zur?ckgibt. Der Administrator kann jedoch den
Backup-Server dazu zwingen, die ?bernommene IP-Adresse wieder an den
Master-Server zur?ckzugeben:

.. code:: screen

    # ifconfig carp0 down && ifconfig carp0 up

Dieser Befehl muss auf dem ``carp``-Ger?t ausgef?hrt werden, dass dem
betroffenen System zugeordnet ist.

.. raw:: html

   </div>

An dieser Stelle muss entweder das Netzwerk neu gestartet, oder die
Maschine neu gebootet werden, um CARP zu aktivieren.

Die Funktionalit?t von CARP kann, wie in der Manualpage
`carp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=carp&sektion=4>`__
beschrieben, ?ber verschiedene
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
Parameter kontrolliert werden. Mit dem Einsatz von
`devd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=devd&sektion=8>`__
k?nnen weitere Aktionen zu CARP-Ereignissen ausgel?st werden.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------------+--------------------------------------------+-----------------------------------+
| `Zur?ck <network-ipv6.html>`__?              | `Nach oben <advanced-networking.html>`__   | ?\ `Weiter <appendices.html>`__   |
+----------------------------------------------+--------------------------------------------+-----------------------------------+
| 33.10. IPv6 – Internet Protocol Version 6?   | `Zum Anfang <index.html>`__                | ?Teil?V.?Anhang                   |
+----------------------------------------------+--------------------------------------------+-----------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
