=====================
Einf?hrung in NanoBSD
=====================

.. raw:: html

   <div class="article" lang="de" lang="de">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="authorgroup" xmlns="http://www.w3.org/1999/xhtml">

.. raw:: html

   <div class="author">

Daniel Gerzo
~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div>

Copyright ? 2006 The FreeBSD Documentation Project

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="legalnotice" xmlns="http://www.w3.org/1999/xhtml">

FreeBSD ist ein eingetragenes Warenzeichen der FreeBSD Foundation.

Viele Produktbezeichnungen von Herstellern und Verk?ufern sind
Warenzeichen. Soweit dem FreeBSD Project das Warenzeichen bekannt ist,
werden die in diesem Dokument vorkommenden Bezeichnungen mit dem Symbol
„™“ oder dem Symbol „?“ gekennzeichnet.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div>

Zuletzt bearbeitet am von .

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="abstract" xmlns="http://www.w3.org/1999/xhtml">

.. raw:: html

   <div class="abstract-title">

Zusammenfassung

.. raw:: html

   </div>

Dieses Dokument stellt Informationen zu den NanoBSD Werkzeugen bereit,
die dazu verwendet werden k?nnen ein FreeBSD Abbild f?r eingebettete
Systeme zu erstellen, welche auf eine Compact Flash Karte passen (oder
andere Massenspeicher).

*?bersetzt von Bj?rn Heidotting*.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Inhaltsverzeichnis

.. raw:: html

   </div>

`1. Einf?hrung in NanoBSD <#intro>`__
`2. NanoBSD Anleitung <#howto>`__
`Stichwortverzeichnis <#idp62101712>`__

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

1. Einf?hrung in NanoBSD
------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

NanoBSD ist ein Werkzeug welches derzeit von Poul-Henning Kamp
entwickelt wird. Es erstellt ein FreeBSD Systemabbild f?r eingebettete
Systeme, die auf eine Compact Flash Karte passen (oder andere
Massenspeicher).

Es kann dazu benutzt werden um spezialisierte Installationsabbilder zu
bauen, entworfen f?r die einfache Installation und Wartung von Systemen
die als "Computer Appliances" bekannt sind. Computer Appliances haben
ihre Hard- und Software fest verbaut, dass bedeutet alle Anwendungen
sind vorinstalliert. Die Appliance wird an ein bestehendes Netzwerk
angeschlossen und kann mit der Arbeit (fast) sofort beginnen.

Zu den Eigenschaften von NanoBSD geh?ren:

.. raw:: html

   <div class="itemizedlist">

-  Ports und Pakete funktionieren wie in FreeBSD — Jede einzelne
   Anwendung kann auf dem NanoBSD Abbild installiert und benutzt werden,
   auf die gleiche Weise wie Sie es aus FreeBSD gewohnt sind.

-  Keine fehlende Funktionalit?t — Wenn es m?glich ist, etwas mit
   FreeBSD zu tun, ist es auch m?glich, die gleiche Sache mit NanoBSD zu
   tun, es sei denn, eine oder mehrere Funktionen wurden ausdr?cklich
   vor dem Bau des NanoBSD Abbilds entfernt.

-  Zur Laufzeit ist alles read-only — Es ist sicher den Stromstecker zu
   ziehen. Es besteht dann keine Notwendigkeit, einen
   `fsck(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck&sektion=8>`__
   nach einem nicht ordnungsgem??em Herunterfahren des Systems
   auszuf?hren.

-  Einfach zu bauen und anzupassen — Unter Verwendung von nur einem
   Shell-Skript und einer Konfigurationsdatei ist es m?glich, ein
   reduziertes und angepasstes Abbild zu bauen, welches jegliche Reihe
   von Anforderungen erf?llt.

.. raw:: html

   </div>

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

2. NanoBSD Anleitung
--------------------

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

2.1. Das Design von NanoBSD
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Sobald das Abbild auf dem Medium verf?gbar ist, kann NanoBSD gebootet
werden. Der Massenspeicher ist standardm??ig in drei Teile unterteilt:

.. raw:: html

   <div class="itemizedlist">

-  Zwei Abbild Partitionen: ``code#1`` und ``code#2``.

-  Die Partition der Konfigurationsdatei, welche zur Laufzeit unter dem
   ``/cfg`` Verzeichnis gemountet werden kann.

.. raw:: html

   </div>

Diese Partitionen sind im Allgemeinen read-only.

Die ``/etc`` und ``/var`` Verzeichnisse sind
`md(4) <http://www.FreeBSD.org/cgi/man.cgi?query=md&sektion=4>`__
(malloc) Speicher.

Die Partition der Konfigurationsdatei besteht unter dem ``/cfg``
Verzeichnis. Sie enth?lt Dateien f?r das ``/etc`` Verzeichnis und wird
direkt nach dem Botten read-only eingehangen, weshalb es erforderlich
ist ge?nderte Dateien von ``/etc`` zur?ck nach ``/cfg`` zu kopieren
falls die ?nderungen nach einem Neustart bestehen bleiben sollen.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel 1. Dauerhafte ?nderungen in ``/etc/resolv.conf`` vornehmen

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    # vi /etc/resolv.conf
    [...]
    # mount /cfg
    # cp /etc/resolv.conf /cfg
    # umount /cfg

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Die ``/cfg`` Partition sollte nur w?hrend des Bootvorgangs und zu
?nderungen an den Konfigurationsdateien gemountet werden.

Die ``/cfg`` Partition jederzeit gemountet zu haben ist keine gute Idee,
besonders wenn das NanoBSD System auf einem Massenspeicher betrieben
wird, der eventuell druch eine gro?e Anzahl von Schreiboperationen
nachteilig beeintr?chtigt wird (z. B. wenn der Dateisystem-Syncer den
Speicher mit Daten ?berflutet).

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

2.2. Ein NanoBSD Abbild erstellen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Ein NanoBSD Abbild wird ?ber ein einfaches ``nanobsd.sh`` Shell-Skript
gebaut, das sich unter ``/usr/src/tools/tools/nanobsd`` befindet. Das
Skript erstellt ein Abbild, welches dann mittels
`dd(1) <http://www.FreeBSD.org/cgi/man.cgi?query=dd&sektion=1>`__ auf
einen Massenspeicher kopiert werden kann.

Die folgenden Kommandos sind notwendig um ein NanoBSD Abbild zu
erstellen:

.. code:: screen

    # cd /usr/src/tools/tools/nanobsd 
    # sh nanobsd.sh 
    # cd /usr/obj/nanobsd.full 
    # dd if=_.disk.full of=/dev/da0 bs=64k 

.. raw:: html

   <div class="calloutlist">

+--------------------------------------+--------------------------------------+
| `|1| <#nbsd-cd>`__                   | Wechsel in das Basisverzeichnis des  |
|                                      | NanoBSD Skripts.                     |
+--------------------------------------+--------------------------------------+
| `|2| <#nbsd-sh>`__                   | Den Bauprozess starten.              |
+--------------------------------------+--------------------------------------+
| `|3| <#nbsd-cd2>`__                  | Wechsel in das Verzeichnis, in dem   |
|                                      | das gebaute Abbild liegt.            |
+--------------------------------------+--------------------------------------+
| `|4| <#nbsd-dd>`__                   | NanoBSD auf einem Massenspeicher     |
|                                      | installieren.                        |
+--------------------------------------+--------------------------------------+

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

2.3. Ein NanoBSD Abbild anpassen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dies ist wahrscheinlich das wichtigste und interessanteste Merkmal von
NanoBSD. Hierbei werden Sie auch die meiste Zeit mit der Entwicklung von
NanoBSD verbringen.

Der Aufruf des folgenden Kommandos wird ``nanobsd.sh`` dazu zwingen,
seine Konfiguration aus ``myconf.nano`` aus dem aktuellen Verzeichnis zu
lesen:

.. code:: screen

    # sh nanobsd.sh -c myconf.nano

Die Anpassung wird auf zwei Arten geschehen:

.. raw:: html

   <div class="itemizedlist">

-  Konfigurations-Optionen

-  Benutzerdefinierte Funktionen

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

2.3.1. Konfigurations-Optionen
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Durch Konfigurationseinstellungen ist es m?glich Optionen zu ?bergeben,
die sowohl die ``buildworld`` und ``installworld`` Phasen des NanoBSD
Bauprozesses betreffen, sowie interne Optionen, die den Haupt-Bauprozess
von NanoBSD beeinflussen. Durch diese Optionen ist es m?glich, das
System so zu reduzieren, dass es mit wenig Platz, etwa 64 MB auskommt.
Sie k?nnen die Konfigurationsdateien dazu nutzten FreeBSD noch weiter zu
trimmen, bis es nur noch aus dem Kernel und zwei oder drei Dateien im
Userland besteht.

Die Konfigurationsdatei besteht aus Konfigurations-Optionen, welche die
Standardwerte ?berschreiben.

.. raw:: html

   <div class="itemizedlist">

-  ``NANO_NAME`` — Name des Build (wird verwendet, um die workdir Namen
   zu konstruieren).

-  ``NANO_SRC`` — Pfad zum Quelltextverzeichnis, das f?r den Bau des
   Abbilds verwendet wird.

-  ``NANO_KERNEL`` — Name der Kernelkonfigurationsdatei, die f?r den Bau
   des Kernels verwendet wird.

-  ``CONF_BUILD`` — Optionen f?r die ``buildworld`` Phase des
   Bauprozesses.

-  ``CONF_INSTALL`` — Optionen f?r die ``installworld`` Phase des
   Bauprozesses.

-  ``CONF_WORLD`` — Optionen f?r die ``buildworld`` und ``installworld``
   Phasen des Bauprozesses.

-  ``FlashDevice`` — Definiert den zu benutzenden Medientyp. ?berpr?fen
   Sie die Datei ``FlashDevice.sub`` f?r weitere Informationen.

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

2.3.2. Benutzerdefinierte Funktionen
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Mit Hilfe von Shell-Funktionen in der Konfigurationsdatei besteht die
M?glichkeit zur Feinabstimmung von NanoBSD. Das folgende Beispiel
illustriert das Grundmodell von benutzerdefinierten Funktionen:

.. code:: programlisting

    cust_foo () (
        echo "bar=baz" > \
            ${NANO_WORLDDIR}/etc/foo
    )
    customize_cmd cust_foo

Ein besseres Beispiel f?r eine Anpassung ist folgende, welche die
Standardgr??e des ``/etc`` Verzeichnisses von 5 MB auf 30 MB ?ndert:

.. code:: programlisting

    cust_etc_size () (
        cd ${NANO_WORLDDIR}/conf
        echo 30000 > default/etc/md_size
    )
    customize_cmd cust_etc_size

Es gibt ein paar vordefinierte Standardfunktionen die Sie nutzen k?nnen:

.. raw:: html

   <div class="itemizedlist">

-  ``cust_comconsole`` — Deaktiviert
   `getty(8) <http://www.FreeBSD.org/cgi/man.cgi?query=getty&sektion=8>`__
   auf den VGA Ger?ten (den ``/dev/ttyv*`` Ger?tedateien) und erm?glicht
   die Nutzung der seriellen Schnittstelle COM1 als Systemkonsole.

-  ``cust_allow_ssh_root`` — Erlaubt es ``root`` sich ?ber
   `sshd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sshd&sektion=8>`__
   anzumelden.

-  ``cust_install_files`` — Installiert Dateien aus dem
   ``nanobsd/Files`` Verzeichnis, das einige n?tzliche Skripte f?r die
   Systemverwaltung enth?lt.

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

2.3.3. Pakete hinzuf?gen
^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Durch benutzerdefinierte Funktionen k?nnen Pakete zum NanoBSD Abbild
hinzugef?gt werden. Die nachfolgende Funktion installiert alle Pakete
aus ``/usr/src/tools/tools/nanobsd/packages``:

.. code:: programlisting

    install_packages () (
    mkdir -p ${NANO_WORLDDIR}/packages
    cp /usr/src/tools/tools/nanobsd/packages/* ${NANO_WORLDDIR}/packages
    chroot ${NANO_WORLDDIR} sh -c 'cd packages; pkg_add -v *;cd ..;'
    rm -rf ${NANO_WORLDDIR}/packages
    )
    customize_cmd install_packages

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

2.3.4. Beispiel einer Konfigurationsdatei
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Ein komplettes Beispiel f?r eine Konfigurationsdatei zum Erstellen eines
benutzerdefinierten NanoBSD Abbilds k?nnte folgende sein:

.. code:: programlisting

    NANO_NAME=custom
    NANO_SRC=/usr/src
    NANO_KERNEL=MYKERNEL
    NANO_IMAGES=2

    CONF_BUILD='
    NO_KLDLOAD=YES
    NO_NETGRAPH=YES
    NO_PAM=YES
    '

    CONF_INSTALL='
    NO_ACPI=YES
    NO_BLUETOOTH=YES
    NO_CVS=YES
    NO_FORTRAN=YES
    NO_HTML=YES
    NO_LPR=YES
    NO_MAN=YES
    NO_SENDMAIL=YES
    NO_SHAREDOCS=YES
    NO_EXAMPLES=YES
    NO_INSTALLLIB=YES
    NO_CALENDAR=YES
    NO_MISC=YES
    NO_SHARE=YES
    '

    CONF_WORLD='
    NO_BIND=YES
    NO_MODULES=YES
    NO_KERBEROS=YES
    NO_GAMES=YES
    NO_RESCUE=YES
    NO_LOCALES=YES
    NO_SYSCONS=YES
    NO_INFO=YES
    '

    FlashDevice SanDisk 1G

    cust_nobeastie() (
        touch ${NANO_WORLDDIR}/boot/loader.conf
        echo "beastie_disable=\"YES\"" >> ${NANO_WORLDDIR}/boot/loader.conf
    )

    customize_cmd cust_comconsole
    customize_cmd cust_install_files
    customize_cmd cust_allow_ssh_root
    customize_cmd cust_nobeastie

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

2.4. NanoBSD aktualisieren
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The Update-Prozess von NanoBSD ist relativ einfach:

.. raw:: html

   <div class="procedure">

#. Erstellen Sie ein neues NanoBSD Abbild.

#. Laden Sie das neue Abbild in eine unbenutzte Partition eines
   laufenden NanoBSD Systems.

   Der wichtigste Unterschied dieses Schrittes zur ersten NanoBSD
   Installation besteht darin, das jetzt anstatt der Datei
   ``_.disk.full`` (enth?lt ein Abbild der gesamten Platte) die Datei
   ``_.disk.image`` (enth?lt ein Abbild einer einzelnen
   System-Partition) installiert wird.

#. Neustart, um das System von der neu installierten Partition zu
   starten.

#. Wenn alles gut geht, ist die Aktualisierung abgeschlossen.

#. Wenn etwas schief l?uft, starten Sie wieder in die vorherige
   Partition (die das alte, funktionierende Abbild enth?lt) um die
   System-Funktionalit?t so schnell wie m?glich wieder herzustellen.
   Beheben Sie alle Probleme des neu gebauten Abbilds, und wiederholen
   Sie den Vorgang.

.. raw:: html

   </div>

Um das neue Abbild auf das laufende NanoBSD System zu installieren, ist
es m?glich, entweder das ``updatep1`` oder ``updatep2`` Skript im
``/root`` Verzeichnis zu verwenden, je nachdem, von welcher Partition
das aktuelle System l?uft.

In Abh?ngigkeit davon welche Dienste der Host, der das NanoBSD Abbild
anbietet, und welche Art von Transfer bevorzugt wird, bestehen eine von
drei zu pr?fenden M?glichkeiten:

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.4.1. Verwendung von `ftp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ftp&sektion=1>`__
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn die ?bertragungsgeschwindigkeit an erster Stelle steht, verwenden
Sie dieses Beispiel:

.. code:: screen

    # ftp myhost
    get _.disk.image "| sh updatep1"

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

2.4.2. Verwendung von `ssh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh&sektion=1>`__
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn eine sichere ?bertragung bevorzugt wird, sollten Sie die Verwendung
dieses Beispiels in Betracht ziehen:

.. code:: screen

    # ssh myhost cat _.disk.image.gz | zcat | sh updatep1

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

2.4.3. Verwendung von `nc(1) <http://www.FreeBSD.org/cgi/man.cgi?query=nc&sektion=1>`__
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Verwenden Sie dieses Beispiel, wenn auf dem Remote-Host kein
`ftpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ftpd&sektion=8>`__
oder
`sshd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sshd&sektion=8>`__
Dienst l?uft:

.. raw:: html

   <div class="procedure">

#. Zun?chst ?ffnen Sie eine TCP-Listener auf dem Host der das Abbild
   bereitstellt und zum Client sendet:

   .. code:: screen

       myhost# nc -l 2222 < _.disk.image

   .. raw:: html

      <div class="note" xmlns="">

   Anmerkung:
   ~~~~~~~~~~

   Stellen Sie sicher das der benutzte Port nicht blockiert wird, um
   eingehende Verbindungen, vom NanoBSD Host durch die Firewall, zu
   erm?glichen.

   .. raw:: html

      </div>

#. Verbinden Sie sich zum Host der das Abbild bereitstellt und f?hren
   Sie das ``updatep1`` Skript aus:

   .. code:: screen

       # nc myhost 2222 | sh updatep1

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="index">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

Stichwortverzeichnis
--------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="index">

.. raw:: html

   <div class="indexdiv">

N
~

NanoBSD, `Einf?hrung in NanoBSD <#intro>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. |1| image:: ./imagelib/callouts/1.png
.. |2| image:: ./imagelib/callouts/2.png
.. |3| image:: ./imagelib/callouts/3.png
.. |4| image:: ./imagelib/callouts/4.png
