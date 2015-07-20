================================
19.16. Partitionen verschl?sseln
================================

.. raw:: html

   <div class="navheader">

19.16. Partitionen verschl?sseln
`Zur?ck <quotas.html>`__?
Kapitel 19. Speichermedien
?\ `Weiter <swap-encrypting.html>`__

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

19.16. Partitionen verschl?sseln
--------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Beigetragen von Lucky Green.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD bietet ausgezeichnete M?glichkeiten, Daten vor unberechtigten
Zugriffen zu sch?tzen. Wenn das Betriebssystem l?uft, sch?tzen
Zugriffsrechte und vorgeschriebene Zugriffskontrollen (MAC) (siehe
`Kapitel?17, *Verbindliche Zugriffskontrolle* <mac.html>`__) die Daten.
Die Zugriffskontrollen des Betriebssystems sch?tzen allerdings nicht vor
einem Angreifer, der Zugriff auf den Rechner hat. Der Angreifer kann
eine Festplatte einfach in ein anderes System einbauen und dort die
Daten analysieren.

Die f?r FreeBSD verf?gbaren kryptografischen Subsysteme GEOM Based Disk
Encryption (gbde) und ``geli`` sind in der Lage, Daten auf Dateisystemen
auch vor hoch motivierten Angreifern zu sch?tzen, die ?ber erhebliche
Mittel verf?gen. Dieser Schutz ist unabh?ngig von der Art und Weise,
durch die ein Angreifer Zugang zu einer Festplatte oder zu einem Rechner
erlangt hat. Im Gegensatz zu schwerf?lligen Systemen, die einzelne
Dateien verschl?sseln, verschl?sseln gbde und ``geli`` transparent ganze
Dateisysteme. Auf der Festplatte werden dabei keine Daten im Klartext
gespeichert.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

19.16.1. Plattenverschl?sselung mit gbde
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="procedure">

#. **Wechseln sie zu ``root``**

   Sie ben?tigen Superuser-Rechte, um gbde einzurichten.

   .. code:: screen

       % su -
       Password:

#. **Aktivieren Sie
   `gbde(4) <http://www.FreeBSD.org/cgi/man.cgi?query=gbde&sektion=4>`__
   in der Kernelkonfigurationsdatei**

   F?gen Sie folgende Zeile in Ihre Kernelkonfigurationsdatei ein:

   ``options GEOM_BDE``

   ?bersetzen und installieren Sie den FreeBSD-Kernel wie in `Kapitel?9,
   *Konfiguration des FreeBSD-Kernels* <kernelconfig.html>`__
   beschrieben.

   Starten sie das System neu, um den neuen Kernel zu benutzen.

#. Alternativ zur Neukompilierung des Kernels k?nnen Sie auch
   ``kldload`` verwenden, um das Kernelmodul
   `gbde(4) <http://www.FreeBSD.org/cgi/man.cgi?query=gbde&sektion=4>`__
   zu laden:

   .. code:: screen

       # kldload geom_bde

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

19.16.1.1. Einrichten eines verschl?sselten Dateisystems
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das folgende Beispiel beschreibt, wie ein Dateisystem auf einer neuen
Festplatte verschl?sselt wird. Das Dateisystem wird in ``/private``
eingehangen. Mit gbde k?nnten auch ``/home`` und ``/var/mail``
verschl?sselt werden. Die dazu n?tigen Schritte k?nnen allerdings in
dieser Einf?hrung nicht behandelt werden.

.. raw:: html

   <div class="procedure">

#. **Installieren der Festplatte**

   Installieren Sie die Festplatte wie in `Abschnitt?19.3, „Hinzuf?gen
   von Laufwerken“ <disks-adding.html>`__ beschrieben. Im Beispiel
   verwenden wir die Partition ``/dev/ad4s1c``. Die Ger?tedateien
   ``/dev/ad0s1*`` sind Standard-Partitionen des FreeBSD-Systems.

   .. code:: screen

       # ls /dev/ad*
       /dev/ad0        /dev/ad0s1b     /dev/ad0s1e     /dev/ad4s1
       /dev/ad0s1      /dev/ad0s1c     /dev/ad0s1f     /dev/ad4s1c
       /dev/ad0s1a     /dev/ad0s1d     /dev/ad4

#. **Verzeichnis f?r gbde-Lock-Dateien anlegen**

   .. code:: screen

       # mkdir /etc/gbde

   Die Lock-Dateien sind f?r den Zugriff von gbde auf verschl?sselte
   Partitionen notwendig. Ohne die Lock-Dateien k?nnen die Daten nur mit
   erheblichem manuellen Aufwand wieder entschl?sselt werden (dies wird
   auch von der Software nicht unterst?tzt). Jede verschl?sselte
   Partition ben?tigt eine gesonderte Lock-Datei.

#. **Vorbereiten der gbde-Partition**

   Eine von gbde benutzte Partition muss einmalig vorbereitet werden:

   .. code:: screen

       # gbde init /dev/ad4s1c -i -L /etc/gbde/ad4s1c.lock

   `gbde(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gbde&sektion=8>`__
   ?ffnet eine Vorlage in Ihrem Editor, in der Sie verschiedene Optionen
   einstellen k?nnen. Setzen Sie ``sector_size`` auf ``2048``, wenn Sie
   UFS1 oder UFS2 benutzen.

   .. code:: programlisting

       # $FreeBSD: src/sbin/gbde/template.txt,v 1.1.36.1 2009/08/03 08:13:06 kensmith Exp $
       #
       # Sector size is the smallest unit of data which can be read or written.
       # Making it too small decreases performance and decreases available space.
       # Making it too large may prevent filesystems from working.  512 is the
       # minimum and always safe.  For UFS, use the fragment size
       #
       sector_size     =       2048
       [...]

   `gbde(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gbde&sektion=8>`__
   fragt dann zweimal eine Passphrase zum Schutz der Daten ab. Die
   Passphrase muss beides Mal gleich eingegeben werden. Die Sicherheit
   der Daten h?ngt alleine von der Qualit?t der gew?hlten Passphrase ab.
   `:sup:`[12]` <#ftn.idp81929168>`__

   Mit ``gbde init`` wurde im Beispiel auch die Lock-Datei
   ``/etc/gbde/ad4s1c.lock`` angelegt. gbde-Lockdateien m?ssen die
   Dateiendung „.lock“ aufweisen, damit sie von ``/etc/rc.d/gbde``, dem
   Startskript von gbde, erkannt werden.

   .. raw:: html

      <div class="caution" xmlns="">

   Achtung:
   ~~~~~~~~

   Sichern Sie die Lock-Dateien von gbde immer zusammen mit den
   verschl?sselten Dateisystemen. Ein entschlossener Angreifer kann die
   Daten vielleicht auch ohne die Lock-Datei entschl?sseln. Ohne die
   Lock-Datei k?nnen Sie allerdings nicht auf die verschl?sselten Daten
   zugreifen. Dies ist nur noch mit erheblichem manuellen Aufwand
   m?glich, der weder von
   `gbde(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gbde&sektion=8>`__
   noch seinem Entwickler unterst?tzt wird.

   .. raw:: html

      </div>

#. **Einbinden der verschl?sselten Partition in den Kernel**

   .. code:: screen

       # gbde attach /dev/ad4s1c -l /etc/gbde/ad4s1c.lock

   Das Kommando fragt die Passphrase ab, die Sie beim Vorbereiten der
   Partition eingegeben haben. Das neue Ger?t erscheint danach als
   ``/dev/device_name.bde`` im Verzeichnis ``/dev``:

   .. code:: screen

       # ls /dev/ad*
       /dev/ad0        /dev/ad0s1b     /dev/ad0s1e     /dev/ad4s1
       /dev/ad0s1      /dev/ad0s1c     /dev/ad0s1f     /dev/ad4s1c
       /dev/ad0s1a     /dev/ad0s1d     /dev/ad4        /dev/ad4s1c.bde

#. **Dateisystem auf dem verschl?sselten Ger?t anlegen**

   Wenn der Kernel die verschl?sselte Partition kennt, k?nnen Sie ein
   Dateisystem auf ihr anlegen. Benutzen Sie dazu den Befehl
   `newfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newfs&sektion=8>`__.
   Da ein Dateisystem vom Typ UFS2 sehr viel schneller als eins vom Typ
   UFS1 angelegt wird, empfehlen wir Ihnen, die Option ``-O2`` zu
   benutzen.

   .. code:: screen

       # newfs -U -O2 /dev/ad4s1c.bde

   .. raw:: html

      <div class="note" xmlns="">

   Anmerkung:
   ~~~~~~~~~~

   `newfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newfs&sektion=8>`__
   muss auf einer dem Kernel bekannten gbde-Partition (einem Ger?t mit
   dem Namen ``*.bde`` laufen.

   .. raw:: html

      </div>

#. **Einh?ngen der verschl?sselten Partition**

   Legen Sie einen Mountpunkt f?r das verschl?sselte Dateisystem an:

   .. code:: screen

       # mkdir /private

   H?ngen Sie das verschl?sselte Dateisystem ein:

   .. code:: screen

       # mount /dev/ad4s1c.bde /private

#. **?berpr?fen des verschl?sselten Dateisystem**

   Das verschl?sselte Dateisystem sollte jetzt von
   `df(1) <http://www.FreeBSD.org/cgi/man.cgi?query=df&sektion=1>`__
   erkannt werden und benutzt werden k?nnen.

   .. code:: screen

       % df -H
       Filesystem        Size   Used  Avail Capacity  Mounted on
       /dev/ad0s1a      1037M    72M   883M     8%    /
       /devfs            1.0K   1.0K     0B   100%    /dev
       /dev/ad0s1f       8.1G    55K   7.5G     0%    /home
       /dev/ad0s1e      1037M   1.1M   953M     0%    /tmp
       /dev/ad0s1d       6.1G   1.9G   3.7G    35%    /usr
       /dev/ad4s1c.bde   150G   4.1K   138G     0%    /private

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

19.16.1.2. Einh?ngen eines existierenden verschl?sselten Dateisystems
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Nach jedem Neustart m?ssen verschl?sselte Dateisysteme dem Kernel wieder
bekannt gemacht werden, auf Fehler ?berpr?ft werden und eingehangen
werden. Die dazu n?tigen Befehle m?ssen als ``root`` durchgef?hrt
werden.

.. raw:: html

   <div class="procedure">

#. **gbde-Partition im Kernel bekannt geben**

   .. code:: screen

       # gbde attach /dev/ad4s1c -l /etc/gbde/ad4s1c.lock

   Das Kommando fragt nach der Passphrase, die Sie beim Vorbereiten der
   verschl?sselten gbde-Partition festgelegt haben.

#. **Pr?fen des Dateisystems**

   Das verschl?sselte Dateisystem kann noch nicht automatisch ?ber
   ``/etc/fstab`` eingehangen werden. Daher muss es vor dem Einh?ngen
   mit
   `fsck(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck&sektion=8>`__
   gepr?ft werden:

   .. code:: screen

       # fsck -p -t ffs /dev/ad4s1c.bde

#. **Einh?ngen des verschl?sselten Dateisystems**

   .. code:: screen

       # mount /dev/ad4s1c.bde /private

   Das verschl?sselte Dateisystem steht danach zur Verf?gung.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

19.16.1.2.1. Verschl?sselte Dateisysteme automatisch einh?ngen
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Mit einem Skript k?nnen verschl?sselte Dateisysteme automatisch bekannt
gegeben, gepr?ft und eingehangen werden. Wir raten Ihnen allerdings aus
Sicherheitsgr?nden davon ab. Starten Sie das Skript manuell an der
Konsole oder in einer
`ssh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh&sektion=1>`__-Sitzung.

Zu diesem Zweck existiert ein ``rc.d``-Skript, an das ?ber Eintr?ge in
der Datei
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5>`__
Argumente ?bergeben werden k?nnen. Dazu ein Beispiel:

.. code:: programlisting

    gbde_autoattach_all="YES"
    gbde_devices="ad4s1c"
    gbde_lockdir="/etc/gbde"

Durch diese Argumente muss beim Systemstart die gbde-Passphrase
eingegeben werden. Erst nach Eingabe der korrekten Passphrase wird die
gbde-verschl?sselte Partition automatisch in den Verzeichnisbaum
eingeh?ngt. Dieses Vorgehen ist insbesondere dann n?tzlich, wenn Sie
gbde auf einem Notebook einsetzen wollen.

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

19.16.1.3. Kryptografische Methoden von gbde
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

`gbde(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gbde&sektion=8>`__
benutzt den 128-Bit AES im CBC-Modus, um die Daten eines Sektors zu
verschl?sseln. Jeder Sektor einer Festplatte wird mit einem
unterschiedlichen AES-Schl?ssel verschl?sselt. Mehr Informationen, unter
anderem wie die Schl?ssel f?r einen Sektor aus der gegebenen Passphrase
ermittelt werden, erhalten Sie in
`gbde(4) <http://www.FreeBSD.org/cgi/man.cgi?query=gbde&sektion=4>`__.

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

19.16.1.4. Kompatibilit?t
^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8>`__
kann nicht mit verschl?sselten gbde-Ger?ten umgehen. Vor dem Start von
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8>`__
sind alle ``*.bde``-Ger?te zu deaktivieren, da
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8>`__
sonst bei der Ger?tesuche abst?rzt. Das im Beispiel verwendete Ger?t
wird mit dem folgenden Befehl deaktiviert:

.. code:: screen

    # gbde detach /dev/ad4s1c

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Sie k?nnen gbde nicht zusammen mit vinum benutzen, da
`vinum(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vinum&sektion=4>`__
das
`geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4>`__-Subsystem
nicht benutzt.

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

19.16.2. Plattenverschl?sselung mit ``geli``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div>

Beigetragen von Daniel Gerzo.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``geli`` ist als alternative kryptografische GEOM-Klasse verf?gbar und
wird derzeit von Pawel Jakub Dawidek weiterentwickelt. ``geli``
unterscheidet sich von ``gbde`` durch unterschiedliche F?higkeiten und
einen unterschiedlichen Ansatz f?r die Verschl?sselung von Festplatten.

Die wichtigsten Merkmale von
`geli(8) <http://www.FreeBSD.org/cgi/man.cgi?query=geli&sektion=8>`__
sind:

.. raw:: html

   <div class="itemizedlist">

-  Der Einsatz des
   `crypto(9) <http://www.FreeBSD.org/cgi/man.cgi?query=crypto&sektion=9>`__-Frameworks
   – verf?gt das System ?ber kryptografische Hardware, wird diese von
   ``geli`` automatisch verwendet.

-  Die Unterst?tzung verschiedener kryptografischer Algorithmen (derzeit
   AES, Blowfish, sowie 3DES).

-  Die M?glichkeit, die root-Partition zu verschl?sseln. Um auf die
   verschl?sselte root-Partition zugreifen zu k?nnen, muss beim
   Systemstart die Passphrase eingegeben werden.

-  ``geli`` erlaubt den Einsatz von zwei voneinander unabh?ngigen
   Schl?sseln (etwa einem privaten „Schl?ssel“ und einem
   „Unternehmens-Schl?ssel“).

-  ``geli`` ist durch einfache Sektor-zu-Sektor-Verschl?sselung sehr
   schnell.

-  Die M?glichkeit, Master-Keys zu sichern und wiederherzustellen. Wenn
   ein Benutzer seinen Schl?ssel zerst?rt, kann er ?ber seinen zuvor
   gesicherten Schl?ssel wieder auf seine Daten zugreifen.

-  ``geli`` erlaubt es, Platten mit einem zuf?lligen Einmal-Schl?ssel
   einzusetzen, was insbesondere f?r Swap-Partitionen und tempor?re
   Dateisysteme interessant ist.

.. raw:: html

   </div>

Weitere Informationen zu den F?higkeiten von ``geli`` finden Sie in
`geli(8) <http://www.FreeBSD.org/cgi/man.cgi?query=geli&sektion=8>`__.

Die folgenden Schritte beschreiben, wie Sie ``geli`` im FreeBSD-Kernel
aktivieren und einen ``geli``-Verschl?sselungs-Provider anlegen k?nnen.

Da Sie Ihren Kernel anpassen m?ssen, ben?tigen Sie au?erdem
``root``-Privilegien.

.. raw:: html

   <div class="procedure">

#. **Aufnahme der ``geli``-Unterst?tzung in Ihre
   Kernelkonfigurationsdatei**

   F?gen Sie die folgenden Zeilen in Ihre Kernelkonfigurationsdatei ein:

   .. code:: programlisting

       options GEOM_ELI
       device crypto

   Bauen und installieren Sie Ihren neuen Kernel wie in `Kapitel?9,
   *Konfiguration des FreeBSD-Kernels* <kernelconfig.html>`__
   beschrieben.

   Alternativ k?nnen Sie aber auch das ``geli``-Kernelmodul beim
   Systemstart laden. Dazu f?gen Sie die folgende Zeile in
   ``/boot/loader.conf`` ein:

   .. code:: programlisting

       geom_eli_load="YES"

   Ab sofort wird
   `geli(8) <http://www.FreeBSD.org/cgi/man.cgi?query=geli&sektion=8>`__
   vom Kernel unterst?tzt.

#. **Erzeugen des Master-Keys**

   Das folgende Beispiel beschreibt, wie Sie eine Schl?sseldatei
   erzeugen, die als Teil des Master-Keys f?r den
   Verschl?sselungs-Provider verwendet wird, der unter ``/private`` in
   den Verzeichnisbaum eingeh?ngt („gemountet“) wird. Diese
   Schl?sseldatei liefert zuf?llige Daten, die f?r die Verschl?sselung
   des Master-Keys ben?tigt werden. Zus?tzlich wird der Master-Key durch
   eine Passphrase gesch?tzt. Die Sektorgr??e des Providers betr?gt
   4?KB. Au?erdem wird beschrieben, wie Sie einen ``geli``-Provider
   aktivieren, ein vom ihm verwaltetes Dateisystem erzeugen, es mounten,
   mit ihm arbeiten und wie Sie es schlie?lich wieder unmounten und den
   Provider deaktivieren.

   Um eine bessere Leistung zu erzielen, sollten Sie eine gr??ere
   Sektorgr??e (beispielsweise 4?KB) verwenden.

   Der Master-Key wird durch eine Passphrase sowie die Daten der
   Schl?sseldatei (die von ``/dev/random`` stammen) gesch?tzt. Die
   Sektorgr??e von ``/dev/da2.eli`` (das als Provider bezeichnet wird)
   betr?gt 4?KB.

   .. code:: screen

       # dd if=/dev/random of=/root/da2.key bs=64 count=1
       # geli init -s 4096 -K /root/da2.key /dev/da2
       Enter new passphrase:
       Reenter new passphrase:

   Es ist nicht zwingend n?tig, sowohl eine Passphrase als auch eine
   Schl?sseldatei zu verwenden. Die einzelnen Methoden k?nnen auch
   unabh?ngig voneinander eingesetzt werden.

   Wird f?r die Schl?sseldatei der Wert „-“ angegeben, wird daf?r die
   Standardeingabe verwendet. Das folgende Beispiel zeigt, dass Sie auch
   mehr als eine Schl?sseldatei verwenden k?nnen.

   .. code:: screen

       # cat keyfile1 keyfile2 keyfile3 | geli init -K - /dev/da2

#. **Aktivieren des Providers mit dem erzeugten Schl?ssel**

   .. code:: screen

       # geli attach -k /root/da2.key /dev/da2
       Enter passphrase:

   Dadurch wird die (Normaltext-)Ger?tedatei ``/dev/da2.eli`` angelegt.

   .. code:: screen

       # ls /dev/da2*
       /dev/da2  /dev/da2.eli

#. **Das neue Dateisystem erzeugen**

   .. code:: screen

       # dd if=/dev/random of=/dev/da2.eli bs=1m
       # newfs /dev/da2.eli
       # mount /dev/da2.eli /private

   Das verschl?sselte Dateisystem wird nun von
   `df(1) <http://www.FreeBSD.org/cgi/man.cgi?query=df&sektion=1>`__
   angezeigt und kann ab sofort eingesetzt werden.

   .. code:: screen

       # df -H
       Filesystem     Size   Used  Avail Capacity  Mounted on
       /dev/ad0s1a    248M    89M   139M    38%    /
       /devfs         1.0K   1.0K     0B   100%    /dev
       /dev/ad0s1f    7.7G   2.3G   4.9G    32%    /usr
       /dev/ad0s1d    989M   1.5M   909M     0%    /tmp
       /dev/ad0s1e    3.9G   1.3G   2.3G    35%    /var
       /dev/da2.eli   150G   4.1K   138G     0%    /private

#. **Das Dateisystem unmounten und den Provider deaktivieren**

   Wenn Sie nicht mehr mit dem verschl?sselten Dateisystem arbeiten und
   die unter ``/private`` eingeh?ngte Partition daher nicht mehr
   ben?tigen, sollten Sie diese unmounten und den
   ``geli``-Verschl?sselungs-Provider wieder deaktivieren.

   .. code:: screen

       # umount /private
       # geli detach da2.eli

.. raw:: html

   </div>

Weitere Informationen zum Einsatz von ``geli`` finden Sie in
`geli(8) <http://www.FreeBSD.org/cgi/man.cgi?query=geli&sektion=8>`__.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

19.16.2.1. Der Einsatz des ``geli``- ``rc.d``-Skripts
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``geli`` verf?gt ?ber ein ``rc.d``-Skript, das den Einsatz von ``geli``
deutlich vereinfacht. Es folgt nun ein Beispiel, in dem ``geli`` ?ber
die Datei
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5>`__
konfiguriert wird:

.. code:: programlisting

    geli_devices="da2"
    geli_da2_flags="-p -k /root/da2.key"

Durch diese Eintr?ge wird ``/dev/da2`` als ``geli``-Provider festgelegt.
Der Master-Key befindet sich in ``/root/da2.key``. Beim Aktivieren des
``geli``-Providers wird keine Passphrase abgefragt (beachten Sie, dass
dies nur dann m?glich ist, wenn Sie ``geli`` mit dem Parameter ``-P``
initialisieren). Wird das System heruntergefahren, wird der
``geli``-Provider zuvor deaktiviert.

Weitere Informationen zur Konfiguration der ``rc.d``-Skripten finden Sie
im Abschnitt `rc.d <configtuning-rcd.html>`__ des Handbuchs.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="footnotes">

--------------

.. raw:: html

   <div id="ftn.idp81929168" class="footnote">

`:sup:`[12]` <#idp81929168>`__\ Die Auswahl einer sicheren und leicht zu
merkenden Passphrase wird auf der Webseite `Diceware
Passphrase <http://world.std.com/~reinhold/diceware.html>`__
beschrieben.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------+-------------------------------+--------------------------------------------------+
| `Zur?ck <quotas.html>`__?    | `Nach oben <disks.html>`__    | ?\ `Weiter <swap-encrypting.html>`__             |
+------------------------------+-------------------------------+--------------------------------------------------+
| 19.15. Dateisystem-Quotas?   | `Zum Anfang <index.html>`__   | ?19.17. Den Auslagerungsspeicher verschl?sseln   |
+------------------------------+-------------------------------+--------------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
