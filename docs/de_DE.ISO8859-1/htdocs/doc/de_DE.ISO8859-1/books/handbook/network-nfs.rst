===============================
31.3. NFS – Network File System
===============================

.. raw:: html

   <div class="navheader">

31.3. NFS – Network File System
`Zur?ck <network-inetd.html>`__?
Kapitel 31. Netzwerkserver
?\ `Weiter <network-nis.html>`__

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

31.3. NFS – Network File System
-------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Reorganisiert und erweitert von Tom Rhodes.

.. raw:: html

   </div>

.. raw:: html

   <div>

Geschrieben von Bill Swingle.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Eines der vielen von FreeBSD unterst?tzten Dateisysteme ist das
Netzwerkdateisystem, das auch als NFS bekannt ist. NFS erm?glicht es
einem System, Dateien und Verzeichnisse ?ber ein Netzwerk mit anderen zu
teilen. ?ber NFS k?nnen Benutzer und Programme auf Daten entfernter
Systeme zugreifen, und zwar genauso, wie wenn es sich um lokale Daten
handeln w?rde.

Einige der wichtigsten Vorteile von NFS sind:

.. raw:: html

   <div class="itemizedlist">

-  Lokale Arbeitsstationen ben?tigen weniger Plattenplatz, da gemeinsam
   benutzte Daten nur auf einem einzigen Rechner vorhanden sind. Alle
   anderen Stationen greifen ?ber das Netzwerk auf diese Daten zu.

-  Benutzer ben?tigen nur noch ein zentrales Heimatverzeichnis auf einem
   NFS-Server. Diese Verzeichnisse sind ?ber das Netzwerk auf allen
   Stationen verf?gbar.

-  Speicherger?te wie Disketten-, CD-ROM- oder Zip?-Laufwerke k?nnen
   ?ber das Netzwerk von anderen Arbeitstationen genutzt werden. Dadurch
   sind f?r das gesamte Netzwerk deutlich weniger Speicherger?te n?tig.

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

31.3.1. Wie funktioniert NFS?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

NFS besteht aus zwei Hauptteilen: Einem Server und einem oder mehreren
Clients. Der Client greift ?ber das Netzwerk auf die Daten zu, die auf
dem Server gespeichert sind. Damit dies korrekt funktioniert, m?ssen
einige Prozesse konfiguriert und gestartet werden:

Der Server ben?tigt folgende Daemonen:

.. raw:: html

   <div class="informaltable">

+-----------+--------------------------------------------------------------------------------------------------------------------------------------------------+
| Daemon    | Beschreibung                                                                                                                                     |
+===========+==================================================================================================================================================+
| nfsd      | Der NFS-Daemon. Er bearbeitet Anfragen der NFS-Clients.                                                                                          |
+-----------+--------------------------------------------------------------------------------------------------------------------------------------------------+
| mountd    | Der NFS-Mount-Daemon. Er bearbeitet die Anfragen, die `nfsd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=nfsd&sektion=8>`__ an ihn weitergibt.   |
+-----------+--------------------------------------------------------------------------------------------------------------------------------------------------+
| rpcbind   | Der Portmapper-Daemon. Durch ihn erkennen die NFS-Clients, welchen Port der NFS-Server verwendet.                                                |
+-----------+--------------------------------------------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

Der Client kann ebenfalls einen Daemon aufrufen, und zwar den
nfsiod-Daemon. Der nfsiod-Daemon bearbeitet Anfragen vom NFS-Server. Er
ist optional und verbessert die Leistung des Netzwerks. F?r eine normale
und korrekte Arbeit ist er allerdings nicht erforderlich. Mehr erfahren
Sie in der Hilfeseite
`nfsiod(8) <http://www.FreeBSD.org/cgi/man.cgi?query=nfsiod&sektion=8>`__.

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

31.3.2. NFS einrichten
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

NFS l?sst sich leicht einrichten. Die n?tigen Prozesse werden durch
einige ?nderungen in ``/etc/rc.conf`` bei jedem Systemstart gestartet.

Stellen Sie sicher, dass auf dem NFS-Server folgende Optionen in der
Datei ``/etc/rc.conf`` gesetzt sind:

.. code:: programlisting

    rpcbind_enable="YES"
    nfs_server_enable="YES"
    mountd_flags="-r"

mountd l?uft automatisch, wenn der NFS-Server aktiviert ist.

Auf dem Client muss in ``/etc/rc.conf`` folgende Option gesetzt sein:

.. code:: programlisting

    nfs_client_enable="YES"

``/etc/exports`` legt fest, welche Dateisysteme NFS exportieren
(manchmal auch als „teilen“ bezeichnet) soll. Jede Zeile in
``/etc/exports`` legt ein Dateisystem sowie die Arbeitsstationen, die
darauf Zugriff haben, fest. Au?erdem ist es m?glich, Zugriffsoptionen
festzulegen. Es gibt viele verschiedene Optionen, allerdings werden hier
nur einige von ihnen erw?hnt. Wenn Sie Informationen zu weiteren
Optionen ben?tigen, lesen Sie
`exports(5) <http://www.FreeBSD.org/cgi/man.cgi?query=exports&sektion=5>`__.

Nun folgen einige Beispieleintr?ge f?r ``/etc/exports``:

Die folgenden Beispiele geben Ihnen Anhaltspunkte zum Exportieren von
Dateisystemen, obwohl diese Einstellungen nat?rlich von Ihrer
Arbeitsumgebung und Ihrer Netzwerkkonfiguration abh?ngen. Das n?chste
Beispiel exportiert das Verzeichnis ``/cdrom`` f?r drei Rechner, die
sich in derselben Dom?ne wie der Server befinden oder f?r die
entsprechende Eintr?ge in ``/etc/hosts`` existieren. Die Option ``-ro``
kennzeichnet das exportierte Dateisystem als schreibgesch?tzt. Durch
dieses Flag ist das entfernte System nicht in der Lage, das exportierte
Dateisystem zu ver?ndern.

.. code:: programlisting

    /cdrom -ro host1 host2 host3

Die n?chste Zeile exportiert ``/home`` auf drei durch IP-Adressen
bestimmte Rechner. Diese Einstellung ist n?tzlich, wenn Sie ?ber ein
privates Netzwerk ohne DNS-Server verf?gen. Optional k?nnten interne
Rechnernamen auch in ``/etc/hosts`` konfiguriert werden. Ben?tigen Sie
hierzu weitere Informationen, lesen Sie bitte
`hosts(5) <http://www.FreeBSD.org/cgi/man.cgi?query=hosts&sektion=5>`__.
Durch das Flag ``-alldirs`` wird es m?glich, auch Unterverzeichnisse als
Mountpunkte festzulegen. Dies bedeutet aber nicht, dass alle
Unterverzeichnisse eingeh?ngt werden, vielmehr wird es dem Client
erm?glicht, nur diejenigen Verzeichnisse einzuh?ngen, die auch ben?tigt
werden.

.. code:: programlisting

    /home  -alldirs  10.0.0.2 10.0.0.3 10.0.0.4

Die n?chste Zeile exportiert ``/a``, damit Clients von verschiedenen
Dom?nen auf das Dateisystem zugreifen k?nnen. Das ``-maproot=root``-Flag
erlaubt es dem Benutzer ``root`` des entfernten Systems, als ``root``
auf das exportierte Dateisystem zu schreiben. Wenn dieses Flag nicht
gesetzt ist, kann selbst ``root`` nicht auf das exportierte Dateisystem
schreiben.

.. code:: programlisting

    /a  -maproot=root  host.example.com box.example.org

Damit ein Client auf ein exportiertes Dateisystem zugreifen kann, muss
ihm dies explizit gestattet werden. Stellen Sie also sicher, dass der
Client in ``/etc/exports`` aufgef?hrt wird.

Jede Zeile in ``/etc/exports`` entspricht der Exportinformation f?r ein
Dateisystem auf einen Rechner. Ein entfernter Rechner kann f?r jedes
Dateisystem nur einmal festgelegt werden, und kann auch nur einen
Standardeintrag haben. Nehmen wir an, dass ``/usr`` ein einziges
Dateisystem ist. Dann w?ren folgende Zeilen ung?ltig:

.. code:: programlisting

    #Nicht erlaubt, wenn /usr ein einziges Dateisystem ist
    /usr/src   client
    /usr/ports client

Das Dateisystem ``/usr`` wird hier zweimal auf den selben Rechner
(``client``) exportiert. Dies ist aber nicht zul?ssig. Der korrekte
Eintrag sieht daher so aus:

.. code:: programlisting

    /usr/src /usr/ports  client

Die Eigenschaften eines auf einen anderen Rechner exportierten
Dateisystems m?ssen alle in einer Zeile stehen. Zeilen, in denen kein
Rechner festgelegt wird, werden als einzelner Rechner behandelt. Dies
schr?nkt die M?glichkeiten zum Export von Dateisystemen ein, f?r die
meisten Anwender ist dies aber kein Problem.

Eine g?ltige Exportliste, in der ``/usr`` und ``/exports`` lokale
Dateisysteme sind, sieht so aus:

.. code:: programlisting

    # Export src and ports to client01 and client02, but only
    # client01 has root privileges on it
    /usr/src /usr/ports -maproot=root    client01
    /usr/src /usr/ports                  client02
    # The client machines have root and can mount anywhere
    # on /exports. Anyone in the world can mount /exports/obj read-only
    /exports -alldirs -maproot=root      client01 client02
    /exports/obj -ro

Der Daemon mountd muss die Datei ``/etc/exports`` nach jeder ?nderung
neu einlesen, damit die ?nderungen wirksam werden. Dies kann durch das
Senden des HUP-Signals an den ``mountd``-Prozess erfolgen:

.. code:: screen

    # kill -HUP `cat /var/run/mountd.pid`

Alternativ k?nnen Sie das
``mountd``-`rc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc&sektion=8>`__-Skript
auch mit dem passenden Parameter aufrufen:

.. code:: screen

    # service mountd onereload

Lesen Sie bitte `Abschnitt?12.7, „Das rc-System f?r
Systemdienste“ <configtuning-rcd.html>`__ des Handbuchs f?r
Informationen zum Einsatz der rc-Skripte.

Eine weitere M?glichkeit, diese ?nderungen zu ?bernehmen, w?re der
Neustart des Systems. Dies ist allerdings nicht n?tig. Wenn Sie die
folgenden Befehle als ``root`` ausf?hren, sollte alles korrekt gestartet
werden.

Auf dem NFS-Server:

.. code:: screen

    # rpcbind
    # nfsd -u -t -n 4
    # mountd -r

Auf dem NFS-Client:

.. code:: screen

    # nfsiod -n 4

Nun sollte alles bereit sein, um ein entferntes Dateisystem einh?ngen zu
k?nnen. In unseren Beispielen nennen wir den Server ``server``, den
Client ``client``. Wenn Sie ein entferntes Dateisystem nur zeitweise
einh?ngen wollen, oder nur Ihre Konfiguration testen m?chten, f?hren Sie
auf dem Client als ``root`` einen Befehl ?hnlich dem folgenden aus:

.. code:: screen

    # mount server:/home /mnt

Dadurch wird das Verzeichnis ``/home`` des Servers auf dem Client unter
``/mnt`` eingeh?ngt. Wenn alles korrekt konfiguriert wurde, sehen Sie
auf dem Client im Verzeichnis ``/mnt`` alle Dateien des Servers.

Wenn Sie ein entferntes Dateisystem nach jedem Systemstart automatisch
einh?ngen wollen, f?gen Sie das Dateisystem in ``/etc/fstab`` ein. Dazu
ein Beispiel:

.. code:: programlisting

    server:/home   /mnt    nfs rw  0   0

Eine Beschreibung aller Optionen enth?lt die Hilfeseite
`fstab(5) <http://www.FreeBSD.org/cgi/man.cgi?query=fstab&sektion=5>`__.

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

31.3.3. Dateien sperren (*Locking*)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Einige Anwendungen (beispielsweise mutt) erfordern die Sperrung von
Dateien, damit sie korrekt arbeiten. Verwenden Sie NFS, so k?nnen Sie
f?r die Sperrung von Dateien rpc.lockd einsetzen. Um diesen Daemon zu
aktivieren, m?ssen Sie in ``/etc/rc.conf`` (sowohl auf Client- als auch
auf Serverseite) folgende Zeilen aufnehmen (wobei vorausgesetzt wird,
dasss NFS auf beiden Systemen bereits konfiguriert ist):

.. code:: programlisting

    rpc_lockd_enable="YES"
    rpc_statd_enable="YES"

Danach starten Sie die Anwendung zur Verwaltung der Dateisperren durch
folgenden Befehl:

.. code:: screen

    # service lockd start
    # /etc/rc.d/statd start

Ben?tigen Sie keine echten Dateisperren zwischen den NFS-Clients und dem
NFS-Server, k?nnen Sie den NFS-Client durch die ?bergabe der Option
``-L`` an
`mount\_nfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount_nfs&sektion=8>`__
zu einer lokalen Sperrung von Dateien zwingen. Lesen Sie dazu auch die
Manualpage
`mount\_nfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount_nfs&sektion=8>`__.

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

31.3.4. Praktische Anwendungen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

NFS ist in vielen Situationen n?tzlich. Einige Anwendungsbereiche finden
Sie in der folgenden Liste:

.. raw:: html

   <div class="itemizedlist">

-  Mehrere Maschinen k?nnen sich ein CD-ROM-Laufwerk oder andere Medien
   teilen. Dies ist billiger und au?erdem praktischer, um Programme auf
   mehreren Rechnern zu installieren.

-  In gr??eren Netzwerken ist es praktisch, einen zentralen NFS-Server
   einzurichten, auf dem die Heimatverzeichnisse der Benutzer
   gespeichert werden. Diese Heimatverzeichnisse werden ?ber das
   Netzwerk exportiert. Dadurch haben die Benutzer immer das gleiche
   Heimatverzeichnis zur Verf?gung, unabh?ngig davon, an welchem
   Arbeitsplatz sie sich anmelden.

-  Verschiedene Rechner k?nnen auf ein gemeinsames Verzeichnis
   ``/usr/ports/distfiles`` zugreifen. Wenn Sie nun einen Port auf
   mehreren Rechnern installieren wollen, greifen Sie einfach auf dieses
   Verzeichnis zu, ohne die Quelldateien auf jede Maschine zu kopieren.

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

31.3.5. AMD
~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div>

Beigetragen von Wylie Stilwell.

.. raw:: html

   </div>

.. raw:: html

   <div>

?berarbeitet von Chern Lee.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

`amd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=amd&sektion=8>`__
(Automatic Mounter Daemon) h?ngt ein entferntes Dateisystem automatisch
ein, wenn auf eine Datei oder ein Verzeichnis in diesem Dateisystem
zugegriffen wird. Dateisysteme, die ?ber einen gewissen Zeitraum inaktiv
sind, werden von amd automatisch abgeh?ngt. amd ist eine einfache
Alternative zum dauerhaften Einh?ngen von Dateisystemen in
``/etc/fstab``.

In der Voreinstellung stellt amd die Verzeichnisse ``/host`` und
``/net`` als NFS-Server bereit. Wenn auf eine Datei in diesen
Verzeichnissen zugegriffen wird, sucht amd den entsprechenden Mountpunkt
und h?ngt das Dateisystem automatisch ein. ``/net`` wird zum Einh?ngen
von exportierten Dateisystemen von einer IP-Adresse verwendet, w?hrend
``/host`` zum Einh?ngen von exportierten Dateisystemen eines durch
seinen Namen festgelegten Rechners dient.

Ein Zugriff auf eine Datei in ``/host/foobar/usr`` w?rde amd
veranlassen, das von ``foobar`` exportierte Dateisystem ``/usr``
einzuh?ngen.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel 31.2. Ein exportiertes Dateisystem mit amd in den
Verzeichnisbaum einh?ngen

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Sie k?nnen sich die verf?gbaren Mountpunkte eines entfernten Rechners
mit ``showmount`` ansehen. Wollen Sie sich die Mountpunkte des Rechners
``foobar`` ansehen, so verwenden Sie:

.. code:: screen

    % showmount -e foobar
    Exports list on foobar:
    /usr                               10.10.10.0
    /a                                 10.10.10.0
    % cd /host/foobar/usr

.. raw:: html

   </div>

.. raw:: html

   </div>

Wie Sie an diesem Beispiel erkennen k?nnen, zeigt ``showmount`` ``/usr``
als exportiertes Dateisystem an. Wenn man in das Verzeichnis
``/host/foobar/usr`` wechselt, versucht amd den Rechnernamen ``foobar``
aufzul?sen und den gew?nschten Export in den Verzeichnisbaum
einzuh?ngen.

amd kann durch das Einf?gen der folgenden Zeile in ``/etc/rc.conf``
automatisch gestartet werden:

.. code:: programlisting

    amd_enable="YES"

Mit der Option ``amd_flags`` kann amd angepasst werden. Die
Voreinstellung f?r ``amd_flags`` sieht so aus:

.. code:: programlisting

    amd_flags="-a /.amd_mnt -l syslog /host /etc/amd.map /net /etc/amd.map"

``/etc/amd.map`` legt die Standardoptionen fest, mit denen exportierte
Dateisysteme in den Verzeichnisbaum eingeh?ngt werden. ``/etc/amd.conf``
hingegen legt einige der erweiterten Optionen von amd fest.

Weitere Informationen finden Sie in den Hilfeseiten
`amd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=amd&sektion=8>`__ und
`amd.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=amd.conf&sektion=5>`__.

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

31.3.6. Integrationsprobleme mit anderen Systemen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div>

Beigetragen von John Lind.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Bestimmte ISA-Ethernetadapter haben Beschr?nkungen, die zu ernsthaften
Netzwerkproblemen, insbesondere mit NFS f?hren k?nnen. Es handelt sich
dabei nicht um ein FreeBSD-spezifisches Problem, aber FreeBSD-Systeme
sind davon ebenfalls betroffen.

Das Problem tritt fast ausschlie?lich dann auf, wenn
(FreeBSD)-PC-Systeme mit Hochleistungsrechnern verbunden werden, wie
Systemen von Silicon?Graphics, Inc. oder Sun?Microsystems, Inc. Das
Einh?ngen via NFS funktioniert problemlos, auch einige Dateioperationen
k?nnen erfolgreich sein. Pl?tzlich aber wird der Server nicht mehr auf
den Client reagieren, obwohl Anfragen von anderen Rechnern weiterhin
bearbeitet werden. Dieses Problem betrifft stets den Client, egal ob es
sich beim Client um das FreeBSD-System oder den Hochleistungsrechner
handelt. Auf vielen Systemen gibt es keine M?glichkeit mehr, den Client
ordnungsgem?? zu beenden. Die einzige L?sung ist es oft, den Rechner neu
zu starten, da dieses NFS-Problem nicht mehr behoben werden kann.

Die „korrekte“ L?sung f?r dieses Problem ist es, sich eine schnellere
Ethernetkarte f?r FreeBSD zu kaufen. Allerdings gibt es auch eine
einfache und meist zufriedenstellende L?sung, um dieses Problem zu
umgehen. Wenn es sich beim FreeBSD-System um den *Server* handelt,
verwenden Sie beim Einh?ngen in den Verzeichnisbaum auf der Clientseite
zus?tzlich die Option ``-w=1024`` . Wenn es sich beim FreeBSD-System um
den *Client* handelt, dann h?ngen Sie das NFS-Dateisystem mit der
zus?tzlichen Option ``-r=1024`` ein. Diese Optionen k?nnen auf der
Clientseite auch durch das vierte Feld der Eintr?ge in ``/etc/fstab``
festgelegt werden, damit die Dateisysteme automatisch eingeh?ngt werden.
Um die Dateisysteme manuell einzuh?ngen, verwendet man bei
`mount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount&sektion=8>`__
zus?tzlich die Option ``-o``.

Es gibt ein anderes Problem, das oft mit diesem verwechselt wird. Dieses
andere Problem tritt auf, wenn sich ?ber NFS verbundene Server und
Clients in verschiedenen Netzwerken befinden. Wenn dies der Fall ist,
stellen Sie *sicher*, dass Ihre Router die n?tigen UDP-Informationen
weiterleiten, oder Sie werden nirgends hingelangen, egal was Sie machen.

In den folgenden Beispielen ist ``fastws`` der Name des
Hochleistungsrechners (bzw. dessen Schnittstelle), ``freebox`` hingegen
ist der Name des FreeBSD-Systems, das ?ber eine Netzkarte mit geringer
Leistung verf?gt. ``/sharedfs`` ist das exportierte NFS?-Dateisystem
(lesen Sie dazu auch
`exports(5) <http://www.FreeBSD.org/cgi/man.cgi?query=exports&sektion=5>`__).
Bei ``/project`` handelt es sich um den Mountpunkt, an dem das
exportierte Dateisystem auf der Clientseite eingeh?ngt wird. In allen
F?llen k?nnen zus?tzliche Optionen, wie z.B. ``hard``, ``soft`` oder
``bg`` w?nschenswert sein.

FreeBSD als Client (eingetragen in ``/etc/fstab`` auf ``freebox``):

.. code:: programlisting

    fastws:/sharedfs /project nfs rw,-r=1024 0 0

Manuelles Einh?ngen auf ``freebox``:

.. code:: screen

    # mount -t nfs -o -r=1024 fastws:/sharedfs /project

FreeBSD als Server (eingetragen in ``/etc/fstab`` auf ``fastws``):

.. code:: programlisting

    freebox:/sharedfs /project nfs rw,-w=1024 0 0

Manuelles Einh?ngen auf ``fastws``:

.. code:: screen

    # mount -t nfs -o -w=1024 freebox:/sharedfs /project

Nahezu alle 16-bit Ethernetadapter erlauben Operationen ohne
obengenannte Einschr?nkungen auf die Lese- oder Schreibgr??e.

F?r alle technisch Interessierten wird nun beschrieben, was passiert,
wenn dieser Fehler auftritt, und warum er irreversibel ist. NFS arbeitet
?blicherweise mit einer „Blockgr??e“ von 8?kByte (obwohl es kleinere
Fragmente zulassen w?rde). Da die maximale Rahmengr??e von Ethernet
1500?Bytes betr?gt, wird der NFS-„Block“ in einzelne Ethernetrahmen
aufgeteilt, obwohl es sich nach wie vor um eine Einheit handelt, die
auch als Einheit empfangen, verarbeitet und *best?tigt* werden muss. Der
Hochleistungsrechner verschickt die Pakete, aus denen der NFS-Block
besteht, so eng hintereinander, wie es der Standard erlaubt. Auf der
anderen Seite (auf der sich die langsamere Netzkarte befindet),
?berschreiben die sp?teren Pakete ihre Vorg?nger, bevor diese vom System
verarbeitet werden (?berlauf!). Dies hat zur Folge, dass der NFS-Block
nicht mehr rekonstruiert und best?tigt werden kann. Als Folge davon
glaubt der Hochleistungsrechner, dass der andere Rechner nicht
erreichbar ist (Timeout!) und versucht die Sendung zu wiederholen.
Allerdings wird wiederum der komplette NFS-Block verschickt, so dass
sich der ganze Vorgang wiederholt, und zwar immer wieder (oder bis zum
Systemneustart).

Indem wir die Einheitengr??e unter der maximalen Gr??e der
Ethernetpakete halten, k?nnen wir sicherstellen, dass jedes vollst?ndig
erhaltene Ethernetpaket individuell angesprochen werden kann und
vermeiden die Blockierung des Systems.

?berl?ufe k?nnen zwar nach wie vor auftreten, wenn ein
Hochleistungsrechner Daten auf ein PC-System transferiert. Durch die
besseren (und schnelleren) Netzkarten treten solche ?berl?ufe allerdings
nicht mehr *zwingend* auf, wenn NFS-„Einheiten“ ?bertragen werden. Tritt
nun ein ?berlauf auf, wird die betroffene Einheit erneut verschickt, und
es besteht eine gute Chance, dass sie nun erhalten, verarbeitet und
best?tigt werden kann.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------+----------------------------------------+-----------------------------------------------+
| `Zur?ck <network-inetd.html>`__?   | `Nach oben <network-servers.html>`__   | ?\ `Weiter <network-nis.html>`__              |
+------------------------------------+----------------------------------------+-----------------------------------------------+
| 31.2. Der inetd „Super-Server“?    | `Zum Anfang <index.html>`__            | ?31.4. NIS/YP – Network Information Service   |
+------------------------------------+----------------------------------------+-----------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
