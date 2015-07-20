======================================
19.18. Highly Available Storage (HAST)
======================================

.. raw:: html

   <div class="navheader">

19.18. Highly Available Storage (HAST)
`Zur?ck <swap-encrypting.html>`__?
Kapitel 19. Speichermedien
?\ `Weiter <GEOM.html>`__

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

19.18. Highly Available Storage (HAST)
--------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Beigetragen von Daniel Gerzo.

.. raw:: html

   </div>

.. raw:: html

   <div>

Mit Beitr?gen von Freddie Cash, Pawel Jakub Dawidek, Michael W. Lucas
und Viktor Petersson.

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

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

19.18.1. ?berblick
~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Hochverf?gbarkeit ist eine der Hauptanforderungen von ernsthaften
Gesch?ftsanwendungen und hochverf?gbarer Speicher ist eine
Schl?sselkomponente in solchen Umgebungen. Highly Available STorage,
oder HAST\ *Highly Available STorage*, wurde von Pawel Jakub Dawidek als
ein Framework entwickelt, welches die transparente Speicherung der
gleichen Daten ?ber mehrere physikalisch getrennte Maschinen erm?glicht,
die ?ber ein TCP/IP-Netzwerk verbunden sind. HAST kann als ein
netzbasiertes RAID1 (Spiegel) verstanden werden und ist dem
DRBD?-Speichersystem der GNU/Linux?-Plattform ?hnlich. In Kombination
mit anderen Hochverf?gbarkeitseigenschaften von FreeBSD wie CARP,
erm?glicht es HAST, hochverf?gbare Speichercluster zu bauen, die in der
Lage sind, Hardwareausf?llen zu widerstehen.

Nachdem Sie diesen Abschnitt gelesen haben, werden Sie folgendes wissen:

.. raw:: html

   <div class="itemizedlist">

-  Was HAST ist, wie es funktioniert und welche Eigenschaften es
   besitzt.

-  Wie man HAST auf FreeBSD aufsetzt und verwendet.

-  Wie man CARP und
   `devd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=devd&sektion=8>`__
   kombiniert, um ein robustes Speichersystem zu bauen.

.. raw:: html

   </div>

Bevor Sie diesen Abschnitt lesen, sollten Sie:

.. raw:: html

   <div class="itemizedlist">

-  die Grundlagen von UNIX? und FreeBSD verstanden haben (`Kapitel?4,
   *Grundlagen des UNIX Betriebssystems* <basics.html>`__).

-  wissen, wie man Netzwerkschnittstellen und andere Kernsysteme von
   FreeBSD konfiguriert (`Kapitel?12, *Konfiguration und
   Tuning* <config-tuning.html>`__).

-  ein gutes Verst?ndnis der FreeBSD-Netzwerkfunktionalit?t besitzen
   (`Teil?IV, „Netzwerke“ <network-communication.html>`__).

-  FreeBSD?8.1-RELEASE oder h?her einsetzen.

.. raw:: html

   </div>

Das HAST-Projekt wurde von der FreeBSD Foundation mit Unterst?tzung der
`OMCnet Internet Service GmbH <http://www.omc.net/>`__ und `TransIP
BV <http://www.transip.nl/>`__ gesponsert.

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

19.18.2. HAST-Merkmale
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Hauptmerkmale des HAST-Systems sind:

.. raw:: html

   <div class="itemizedlist">

-  Es kann zur Maskierung von I/O-Fehlern auf lokalen Festplatten
   eingesetzt werden.

-  Dateisystem-unabh?ngig, was es erlaubt, jedes von FreeBSD
   unterst?tzte Dateisystem zu verwenden.

-  Effiziente und schnelle Resynchronisation: es werden nur die Bl?cke
   synchronisiert, die w?hrend der Ausfallzeit eines Knotens ge?ndert
   wurden.

-  Es kann in einer bereits bestehenden Umgebung eingesetzt werden, um
   zus?tzliche Redundanz zu erreichen.

-  Zusammen mit CARP, Heartbeat, oder anderen Werkzeugen, ist es
   m?glich, ein robustes und dauerhaftes Speichersystem zu bauen.

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

19.18.3. HAST im Einsatz
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

HAST stellt auf Block-Ebene eine synchrone Replikation eines beliebigen
Speichermediums auf mehreren Maschinen zur Verf?gung. Daher werden
mindestens zwei Knoten (physikalische Maschinen) ben?tigt: der
``primary`` (auch bekannt als ``master``) Knoten, sowie der
``secondary`` (``slave``) Knoten. Diese beiden Maschinen zusammen werden
als Cluster bezeichnet.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

HAST ist momentan auf insgesamt zwei Knoten im Cluster beschr?nkt.

.. raw:: html

   </div>

Da HAST in einer prim?r-sekund?r-Konfiguration funktioniert, ist immer
nur ein Knoten des Clusters zu jeder Zeit aktiv. Der ``prim?re`` Knoten,
auch ``active`` genannt, ist derjenige, der alle I/O-Anfragen
verarbeitet, die an die HAST-Schnittstelle gesendet werden. Der
``secondary``-Knoten wird automatisch vom ``primary``-Knoten aus
synchronisiert.

Die physischen Komponenten des HAST-Systems sind:

.. raw:: html

   <div class="itemizedlist">

-  lokale Platte (am Prim?rknoten)

-  Platte am entfernten Rechner (Sekund?rknoten)

.. raw:: html

   </div>

HAST arbeitet synchron auf Blockebene, was es f?r Dateisysteme und
Anwendungen transparent macht. HAST stellt gew?hnliche GEOM-Provider im
Verzeichnis ``/dev/hast/`` f?r die Verwendung durch andere Werkzeuge
oder Anwendungen zur Verf?gung, somit gibt es keinen Unterschied
zwischen dem Einsatz von durch HAST bereitgestellten Ger?ten und
herk?mmlichen Platten, Partitionen, etc.

Jede Schreib-, L?sch- oder Entleerungsoperation wird an die lokale und
?ber TCP/IP zu der entfernt liegenden Platte gesendet. Jede
Leseoperation wird von der lokalen Platte durchgef?hrt, es sei denn, die
lokale Platte ist nicht aktuell oder es tritt ein I/O-Fehler auf. In
solchen F?llen wird die Leseoperation an den Sekund?rknoten geschickt.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

19.18.3.1. Synchronisation und Replikationsmodi
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

HAST versucht, eine schnelle Fehlerbereinigung zu gew?hrleisten. Aus
diesem Grund ist es sehr wichtig, die Synchronisationszeit nach dem
Ausfall eines Knotens zu reduzieren. Um eine schnelle Synchronisation zu
erm?glichen, verwaltet HAST eine Bitmap von unsauberen Bereichen auf der
Platte und synchronisiert nur diese w?hrend einer regul?ren
Synchronisation (mit Ausnahme der initialen Synchronisation).

Es gibt viele Wege, diese Synchronisation zu behandeln. HAST
implementiert mehrere Replikationsarten, um unterschiedliche Methoden
der Synchronisation zu realisieren:

.. raw:: html

   <div class="itemizedlist">

-  *memsync*: meldet Schreiboperationen als vollst?ndig, wenn die lokale
   Schreiboperation beendet ist und der entfernt liegende Knoten die
   Ankunft der Daten best?tigt hat, jedoch bevor die Daten wirklich
   gespeichert wurden. Die Daten werden auf dem entfernt liegenden
   Knoten direkt nach dem Senden der Best?tigung gespeichert. Dieser
   Modus ist daf?r gedacht, Latenzen zu verringern und zus?tzlich eine
   gute Verl?sslichkeit zu bieten. Der *memsync*-Replikationsmodus ist
   momentan noch nicht implementiert.

-  *fullsync*: meldet Schreiboperationen als vollst?ndig, wenn die
   lokale Schreiboperation beendet ist und die entfernte
   Schreiboperation ebenfalls abgeschlossen wurde. Dies ist der
   sicherste und zugleich der langsamste Replikationsmodus. Er stellt
   den momentanen Standardmodus dar.

-  *async*: meldet Schreiboperationen als vollst?ndig, wenn lokale
   Schreibvorg?nge abgeschlossen wurden. Dies ist der schnellste und
   gef?hrlichste Replikationsmodus. Er sollte verwendet werden, wenn die
   Latenz zu einem entfernten Knoten bei einer Replikation zu hoch ist
   f?r andere Modi. Der *async*-Replikationsmodus ist zum gegenw?rtigen
   Zeitpunkt nicht implementiert.

.. raw:: html

   </div>

.. raw:: html

   <div class="warning" xmlns="">

Warnung:
~~~~~~~~

Momentan wird nur der *fullsync*-Replikationsmodus unterst?tzt.

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

19.18.4. HAST-Konfiguration
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

HAST ben?tigt ``GEOM_GATE``-Unterst?tzung, um korrekt zu funktionieren.
Der ``GENERIC``-Kernel enth?lt jedoch ``GEOM_GATE`` *nicht* von
vornherein, jedoch ist in der Standardinstallation von FreeBSD
``geom_gate.ko`` als ladbares Modul vorhanden. Stellen Sie bei Systemen,
bei denen nur das Allern?tigste vorhanden sein soll, sicher, dass dieses
Modul zur Verf?gung steht. Als Alternative l?sst sich die
``GEOM_GATE``-Unterst?tzung direkt in den Kernel statisch einbauen,
indem Sie die folgende Zeile zu Ihrer Kernelkonfigurationsdatei
hinzuf?gen:

.. code:: programlisting

    options    GEOM_GATE

Das HAST-Framework besteht aus Sicht des Betriebssystems aus mehreren
Bestandteilen:

.. raw:: html

   <div class="itemizedlist">

-  Dem
   `hastd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=hastd&sektion=8>`__-Dienst,
   welcher f?r die Datensynchronisation verantwortlich ist,

-  Dem
   `hastctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=hastctl&sektion=8>`__
   Management-Werkzeug,

-  Der Konfigurationsdatei
   `hast.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=hast.conf&sektion=5>`__.

.. raw:: html

   </div>

Das folgende Beispiel beschreibt, wie man zwei Knoten als
``master``-``slave`` / ``primary``-``secondary`` mittels HAST
konfiguriert, um Daten zwischen diesen beiden auszutauschen. Die Knoten
werden als ``hasta`` mit der IP-Adresse *``172.16.0.1``* und ``hastb``
mit der IP-Adresse *``172.16.0.2``* bezeichnet. Beide Knoten besitzen
eine dedizierte Festplatte ``/dev/ad6`` mit der gleichen Gr?sse f?r den
HAST-Betrieb. Der HAST-Pool (manchmal auch Ressource genannt, z.B. der
GEOM-Provider in ``/dev/hast/``) wird als ``test`` bezeichnet.

Die Konfiguration von HAST wird in der Datei ``/etc/hast.conf``
vorgenommen. Diese Datei sollte auf beiden Knoten gleich sein. Die
denkbar einfachste Konfiguration ist folgende:

.. code:: programlisting

    resource test {
        on hasta {
            local /dev/ad6
            remote 172.16.0.2
        }
        on hastb {
            local /dev/ad6
            remote 172.16.0.1
        }
    }

Schlagen Sie in der
`hast.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=hast.conf&sektion=5>`__-Manualpage
nach, wenn Sie an erweiterten Konfigurationsm?glichkeiten interessiert
sind.

.. raw:: html

   <div class="tip" xmlns="">

Tipp:
~~~~~

Es ist ebenfalls m?glich, den Hostnamen in den ``remote``-Anweisungen zu
verwenden. Stellen Sie in solchen F?llen sicher, dass diese Rechner auch
aufgel?st werden k?nnen, also in der Datei ``/etc/hosts`` aufgef?hrt
sind, oder alternativ im lokalen DNS.

.. raw:: html

   </div>

Da nun die Konfiguration auf beiden Rechnern vorhanden ist, kann ein
HAST-Pool erstellt werden. Lassen Sie diese Kommandos auf beiden Knoten
ablaufen, um die initialen Metadaten auf die lokale Platte zu schreiben
und starten Sie anschliessend den
`hastd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=hastd&sektion=8>`__-Dienst:

.. code:: screen

    # hastctl create test
    # service hastd onestart

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Es ist *nicht* m?glich, GEOM-Provider mit einem bereits bestehenden
Dateisystem zu verwenden (z.B. um einen bestehenden Speicher in einen
von HAST verwalteten Pool zu konvertieren), weil diese Prozedur
bestimmte Metadaten auf den Provider schreiben muss und daf?r nicht
genug freier Platz zur Verf?gung stehen wird.

.. raw:: html

   </div>

Die Rolle eines HAST Knotens (``primary`` oder ``secondary``) wird vom
einem Administrator, oder einer Software wie Heartbeat, mittels des
`hastctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=hastctl&sektion=8>`__-Werkzeugs
festgelegt. Auf dem prim?ren Knoten (``hasta``) geben Sie diesen Befehl
ein:

.. code:: screen

    # hastctl role primary test

Geben Sie folgendes Kommando auf dem sekund?ren Knoten (``hastb``) ein:

.. code:: screen

    # hastctl role secondary test

.. raw:: html

   <div class="caution" xmlns="">

Achtung:
~~~~~~~~

Es kann passieren, dass beide Knoten nicht in der Lage sind, miteinander
zu kommunizieren und dadurch beide als prim?re Knoten konfiguriert sind;
die Konsequenz daraus wird als ``split-brain`` bezeichnet. Um diese
Situation zu bereinigen, folgen Sie den Schritten, die in
`Abschnitt?19.18.5.2, „Aufl?sung des
Split-brain-Zustands“ <disks-hast.html#disks-hast-sb>`__ beschrieben
sind.

.. raw:: html

   </div>

?berpr?fen Sie das Ergebnis mit
`hastctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=hastctl&sektion=8>`__
auf beiden Knoten:

.. code:: screen

    # hastctl status test

Der wichtigste Teil ist die ``status``-Textzeile, die auf jedem Knoten
``complete`` lauten sollte. Falls der Status als ``degraded``
zur?ckgemeldet wird, ist etwas schief gegangen. Zu diesem Zeitpunkt hat
die Synchronisation zwischen den beiden Knoten bereits begonnen. Die
Synchronisation ist beendet, wenn ``hastctl status`` meldet, dass die
``dirty``-Bereiche 0 Bytes betragen.

Der n?chste Schritt ist, ein Dateisystem auf dem ``/dev/hast/test``
GEOM-Provider anzulegen und dieses ins System einzuh?ngen. Dies muss auf
dem ``primary``-Knoten durchgef?hrt werden, da ``/dev/hast/test`` nur
auf dem ``primary``-Knoten erscheint. Die Erstellung des Dateisystems
kann ein paar Minuten dauern, abh?ngig von der Gr?sse der Festplatte:

.. code:: screen

    # newfs -U /dev/hast/test
    # mkdir /hast/test
    # mount /dev/hast/test /hast/test

Sobald das HAST-Framework richtig konfiguriert wurde, besteht der letzte
Schritt nun darin, sicherzustellen, dass HAST w?hrend des Systemstarts
automatisch gestartet wird. F?gen Sie diese Zeile in ``/etc/rc.conf``
hinzu:

.. code:: programlisting

    hastd_enable="YES"

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

19.18.4.1. Failover-Konfiguration
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das Ziel dieses Beispiels ist, ein robustes Speichersystem zu bauen,
welches Fehlern auf einem beliebigen Knoten widerstehen kann. Das
Szenario besteht darin, dass der ``primary``-Knoten des Clusters
ausf?llt. Sollte das passieren, ist der ``secondary``-Knoten da, um
nahtlos einzuspringen, das Dateisystem zu pr?fen, einzuh?ngen und mit
der Arbeit fortzufahren, ohne dass auch nur ein einzelnes Bit an Daten
verloren geht.

Um diese Aufgabe zu bewerkstelligen, wird eine weitere Eigenschaft von
FreeBSD benutzt, welche ein automatisches Failover auf der IP-Schicht
erm?glicht: CARP. CARP (Common Address Redundancy Protocol) erlaubt es
mehreren Rechnern im gleichen Netzsegment, die gleiche IP-Adresse zu
verwenden. Setzen Sie CARP auf beiden Knoten des Clusters anhand der
Dokumentation in `Abschnitt?33.11, „CARP - Common Address Redundancy
Protocol“ <carp.html>`__ auf. Nach der Konfiguration wird jeder Knoten
seine eigene ``carp0``-Schnittstelle, mit der geteilten IP-Adresse
*``172.16.0.254``* besitzen. Der prim?re HAST-Knoten des Clusters muss
der CARP-Masterknoten sein.

Der HAST-Pool, welcher im vorherigen Abschnitt erstellt wurde, ist nun
bereit f?r den Export ?ber das Netzwerk auf den anderen Rechner. Dies
kann durch den Export ?ber NFS, Samba etc. erreicht werden, indem die
geteilte IP-Addresse *``172.16.0.254``* verwendet wird. Das einzige
ungel?ste Problem ist der automatische Failover, sollte der prim?re
Knoten einmal ausfallen.

Falls die CARP-Schnittstelle aktiviert oder deaktiviert wird, generiert
das FreeBSD-Betriebssystem ein
`devd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=devd&sektion=8>`__-Ereignis,
was es erm?glicht, Zustands?nderungen auf den CARP-Schnittstellen zu
?berwachen. Eine Zustands?nderung auf der CARP-Schnittstelle ist ein
Indiz daf?r, dass einer der Knoten gerade ausgefallen oder wieder
verf?gbar ist. Diese Zustands?nderungen machen es m?glich, ein Skript zu
starten, welches automatisch den HAST-Failover durchf?hrt.

Um Zustands?nderungen auf der CARP-Schnittstelle abzufangen, m?ssen
diese Zeilen in ``/etc/devd.conf`` auf jedem Knoten hinzugef?gt werden:

.. code:: programlisting

    notify 30 {
        match "system" "IFNET";
        match "subsystem" "carp0";
        match "type" "LINK_UP";
        action "/usr/local/sbin/carp-hast-switch master";
    };

    notify 30 {
        match "system" "IFNET";
        match "subsystem" "carp0";
        match "type" "LINK_DOWN";
        action "/usr/local/sbin/carp-hast-switch slave";
    };

Starten Sie
`devd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=devd&sektion=8>`__
auf beiden Knoten neu, um die neue Konfiguration wirksam werden zu
lassen:

.. code:: screen

    # service devd restart

F?r den Fall, dass die ``carp0``-Schnittstelle aktiviert oder
deaktiviert wird (sich also der Status der Schnittstelle ?ndert),
erzeugt das System eine Meldung, was es dem
`devd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=devd&sektion=8>`__-Subsystem
erm?glicht, ein beliebiges Skript zu starten, in diesem Fall also
``/usr/local/sbin/carp-hast-switch``. Dies ist das Skript, dass den
automatischen Failover durchf?hrt. F?r genauere Informationen zu der
obigen
`devd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=devd&sektion=8>`__-Konfiguration,
lesen Sie die
`devd.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=devd.conf&sektion=5>`__-Manualpage.

Ein Beispiel f?r ein solches Skript k?nnte so aussehen:

.. code:: programlisting

    #!/bin/sh

    # Original script by Freddie Cash <fjwcash@gmail.com>
    # Modified by Michael W. Lucas <mwlucas@BlackHelicopters.org>
    # and Viktor Petersson <vpetersson@wireload.net>

    # The names of the HAST resources, as listed in /etc/hast.conf
    resources="test"

    # delay in mounting HAST resource after becoming master
    # make your best guess
    delay=3

    # logging
    log="local0.debug"
    name="carp-hast"

    # end of user configurable stuff

    case "$1" in
        master)
            logger -p $log -t $name "Switching to primary provider for ${resources}."
            sleep ${delay}

            # Wait for any "hastd secondary" processes to stop
            for disk in ${resources}; do
                while $( pgrep -lf "hastd: ${disk} \(secondary\)" > /dev/null 2>&1 ); do
                    sleep 1
                done

                # Switch role for each disk
                hastctl role primary ${disk}
                if [ $? -ne 0 ]; then
                    logger -p $log -t $name "Unable to change role to primary for resource ${disk}."
                    exit 1
                fi
            done

            # Wait for the /dev/hast/* devices to appear
            for disk in ${resources}; do
                for I in $( jot 60 ); do
                    [ -c "/dev/hast/${disk}" ] && break
                    sleep 0.5
                done

                if [ ! -c "/dev/hast/${disk}" ]; then
                    logger -p $log -t $name "GEOM provider /dev/hast/${disk} did not appear."
                    exit 1
                fi
            done

            logger -p $log -t $name "Role for HAST resources ${resources} switched to primary."


            logger -p $log -t $name "Mounting disks."
            for disk in ${resources}; do
                mkdir -p /hast/${disk}
                fsck -p -y -t ufs /dev/hast/${disk}
                mount /dev/hast/${disk} /hast/${disk}
            done

        ;;

        slave)
            logger -p $log -t $name "Switching to secondary provider for ${resources}."

            # Switch roles for the HAST resources
            for disk in ${resources}; do
                if ! mount | grep -q "^/dev/hast/${disk} on "
                then
                else
                    umount -f /hast/${disk}
                fi
                sleep $delay
                hastctl role secondary ${disk} 2>&1
                if [ $? -ne 0 ]; then
                    logger -p $log -t $name "Unable to switch role to secondary for resource ${disk}."
                    exit 1
                fi
                logger -p $log -t $name "Role switched to secondary for resource ${disk}."
            done
        ;;
    esac

Im Kern f?hrt das Skript die folgenden Aktionen durch, sobald ein Knoten
zum ``master`` / ``primary`` wird:

.. raw:: html

   <div class="itemizedlist">

-  Es ernennt den HAST-Pool als den prim?ren f?r einen gegebenen Knoten.

-  Es pr?ft das Dateisystem, dass auf dem HAST-Pool erstellt wurde.

-  Es h?ngt die Pools an die richtige Stelle im System ein.

.. raw:: html

   </div>

Wenn ein Knoten zum ``backup`` / ``secondary`` ernannt wird:

.. raw:: html

   <div class="itemizedlist">

-  H?ngt es den HAST-Pool aus dem Dateisystem aus.

-  Degradiert es den HAST-Pool zum sekund?ren.

.. raw:: html

   </div>

.. raw:: html

   <div class="caution" xmlns="">

Achtung:
~~~~~~~~

Bitte beachten Sie, dass dieses Skript nur ein Beispiel f?r eine
m?gliche L?sung darstellt. Es behandelt nicht alle m?glichen Szenarien,
die auftreten k?nnen und sollte erweitert bzw. abge?ndert werden, so
dass z.B. ben?tigte Dienste gestartet oder gestoppt werden usw.

.. raw:: html

   </div>

.. raw:: html

   <div class="tip" xmlns="">

Tipp:
~~~~~

F?r dieses Beispiel wurde ein Standard-UFS Dateisystem verwendet. Um die
Zeit f?r die Wiederherstellung zu verringern, kann ein UFS mit Journal
oder ein ZFS-Dateisystem benutzt werden.

.. raw:: html

   </div>

Weitere detaillierte Informationen mit zus?tzlichen Beispielen k?nnen
auf der `HAST Wiki <http://wiki.FreeBSD.org/HAST>`__-Seite abgerufen
werden.

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

19.18.5. Fehlerbehebung
~~~~~~~~~~~~~~~~~~~~~~~

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

19.18.5.1. Allgemeine Tipps zur Fehlerbehebung
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

HAST sollte generell ohne Probleme funktionieren. Jedoch kann es, wie
bei jeder anderen Software auch, zu gewissen Zeiten sein, dass sie sich
nicht so verh?lt wie angegeben. Die Quelle dieser Probleme kann
unterschiedlich sein, jedoch sollte als Faustregel gew?hrleistet werden,
dass die Zeit f?r beide Knoten im Cluster synchron l?uft.

F?r die Fehlersuche bei Problemen mit HAST sollte die Anzahl an
Debugging-Meldungen von
`hastd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=hastd&sektion=8>`__
erh?ht werden. Dies kann durch das Starten des
`hastd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=hastd&sektion=8>`__-Dienstes
mit der Option ``-d`` erreicht werden. Wichtig zu wissen ist, dass diese
Option mehrfach angegeben werden kann, um die Anzahl an Meldungen weiter
zu erh?hen. Sie k?nnen viele n?tzliche Informationen auf diese Art
bekommen. Sie sollten ebenfalls die Verwendung der Option ``-F`` in
Erw?gung ziehen, die den
`hastd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=hastd&sektion=8>`__-Dienst
in den Vordergrund bringt.

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

19.18.5.2. Aufl?sung des Split-brain-Zustands
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``split-brain`` bezeichnet eine Situation, in der beide Knoten des
Clusters nicht in der Lage sind, miteinander zu kommunizieren und
dadurch beide als prim?re Knoten fungieren. Dies ist ein gef?hrlicher
Zustand, weil es beiden Knoten erlaubt ist, ?nderungen an den Daten
vorzunehmen, die miteinander nicht in Einklang gebracht werden k?nnen.
Diese Situation muss vom Systemadministrator h?ndisch bereinigt werden.

Der Administrator muss entscheiden, welcher Knoten die wichtigsten
?nderungen von beiden besitzt (oder diese manuell miteinander
vermischen) und anschliessend den HAST-Knoten die volle Synchronisation
mit jenem Knoten durchf?hren zu lassen, welcher die besch?digten Daten
besitzt. Um dies zu tun, geben Sie folgende Befehle auf dem Knoten ein,
der neu synchronisiert werden soll:

.. code:: screen

    # hastctl role init <resource>
    # hastctl create <resource>
    # hastctl role secondary <resource>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------------------+-------------------------------+--------------------------------------------------------------------+
| `Zur?ck <swap-encrypting.html>`__?               | `Nach oben <disks.html>`__    | ?\ `Weiter <GEOM.html>`__                                          |
+--------------------------------------------------+-------------------------------+--------------------------------------------------------------------+
| 19.17. Den Auslagerungsspeicher verschl?sseln?   | `Zum Anfang <index.html>`__   | ?Kapitel 20. GEOM: Modulares Framework zur Plattentransformation   |
+--------------------------------------------------+-------------------------------+--------------------------------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
