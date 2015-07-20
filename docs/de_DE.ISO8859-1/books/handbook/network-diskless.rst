==================================
33.8. Plattenloser Betrieb mit PXE
==================================

.. raw:: html

   <div class="navheader">

33.8. Plattenloser Betrieb mit PXE
`Zur?ck <network-aggregation.html>`__?
Kapitel 33. Weiterf?hrende Netzwerkthemen
?\ `Weiter <network-isdn.html>`__

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

33.8. Plattenloser Betrieb mit PXE
----------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Aktualisiert von Jean-Fran?ois Dock?s.

.. raw:: html

   </div>

.. raw:: html

   <div>

Reorganisiert und erweitert von Alex Dupre.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das Intel? Preboot eXecution Environment (PXE) erlaubt es dem
Betriebssystem ?ber das Netzwerk zu starten. Zum Beispiel kann ein
FreeBSD-System, ohne lokale Festplatte, ?ber das Netzwerk gestartet und
betrieben werden. Die Dateisysteme werden dabei ?ber einen NFS-Server
eingehangen. PXE-Unterst?tzung steht in der Regel im BIOS zur Verf?gung.
Um PXE beim Systemstart zu verwenden, m?ssen Sie im BIOS des Rechners
die Option ``?ber     das Netzwerk starten`` aktivieren. Alternativ
k?nnen Sie w?hrend der PC-Initialisierung auch eine Funktionstaste
dr?cken.

Um die notwendigen Dateien f?r ein Betriebssystem f?r den Start ?ber das
Netzwerk bereitzustellen, ben?tigt ein PXE-Setup einen richtig
konfigurierten DHCP-, TFTP- und NFS-Server, wobei:

.. raw:: html

   <div class="itemizedlist">

-  Die initialen Parameter, wie IP-Adresse, Dateiname und Speicherort
   der ausf?hrbaren Bootdateien, Servername sowie Root-Pfad vom
   DHCP-Server bezogen werden.

-  Der Loader f?r das Betriebssystem ?ber TFTP gestartet wird.

-  Die Dateisysteme ?ber NFS geladen werden.

.. raw:: html

   </div>

Sobald das Gastsystem startet, erh?lt es vom DHCP-Server Informationen,
wo der initiale Bootloader per TFTP zu bekommen ist. Nachdem das
Gastsystem diese Informationen erhalten hat, l?dt es den Bootloader ?ber
TFTP herunter und f?hrt diesen anschlie?end aus. In FreeBSD ist
``/boot/pxeboot`` der Bootloader. Nachdem ``/boot/pxeboot`` ausgef?hrt
und der FreeBSD-Kernel geladen wurde, wird mit dem Rest der
FreeBSD-Bootsequenz, wie in `Kapitel?13, *FreeBSDs
Bootvorgang* <boot.html>`__ beschrieben, fortgefahren.

Dieser Abschnitt beschreibt, wie Sie diese Dienste auf einem
FreeBSD-System so konfigurieren, sodass andere Systeme FreeBSD ?ber PXE
starten k?nnen. Weitere Informationen finden Sie in
`diskless(8) <http://www.FreeBSD.org/cgi/man.cgi?query=diskless&sektion=8>`__.

.. raw:: html

   <div class="caution" xmlns="">

Achtung:
~~~~~~~~

Wie beschrieben, ist das System, welches diese Dienste bereitstellt,
unsicher. Daher sollte es in einem gesch?tzten Bereich des Netzwerks
aufgestellt und von anderen Hosts als nicht vertrauensw?rdig eingestuft
werden.

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

33.8.1. Konfiguration der PXE-Umgebung
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div>

Beigetragen von Craig Rodrigues.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die in diesem Abschnitt dargestellten Schritte konfigurieren die in
FreeBSD enthaltenen NFS- und TFTP-Server. Der folgende Abschnitt
beschreibt die Installation und Konfiguration des DHCP-Servers. In
diesem Beispiel verwenden wir ``/b/tftpboot/FreeBSD/install``, welches
die Dateien f?r PXE-Benutzer enth?lt. Es ist wichtig, dass dieses
Verzeichnis existiert und das der gleiche Verzeichnisname ebenfalls in
``/etc/inetd.conf`` und ``/usr/local/etc/dhcpd.conf`` gesetzt wird.

.. raw:: html

   <div class="procedure">

#. Erstellen Sie das Root-Verzeichnis, welches eine FreeBSD-Installation
   enth?lt und ?ber NFS eingehangen werden kann.

   .. code:: screen

       # export NFSROOTDIR=/b/tftpboot/FreeBSD/install
       # mkdir -p ${NFSROOTDIR}

#. Aktivieren Sie den NFS-Server, indem Sie folgende Zeile in
   ``/etc/rc.conf`` hinzuf?gen:

   .. code:: programlisting

       nfs_server_enable="YES"

   Exportieren Sie das Root-Verzeichnis ?ber NFS, indem Sie folgende
   Zeile in ``/etc/exports`` hinzuf?gen:

   .. code:: programlisting

       /b -ro -alldirs

#. Starten Sie den NFS-Server:

   .. code:: screen

       # service nfsd start

#. Aktivieren Sie
   `inetd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=inetd&sektion=8>`__,
   indem Sie folgende Zeile in ``/etc/rc.conf`` hinzuf?gen:

   .. code:: programlisting

       inetd_enable="YES"

#. Kommentieren Sie die folgende Zeile in ``/etc/inetd.conf`` aus, indem
   Sie sicherstellen, dass die Zeile nicht mit einem ``#``-Zeichen
   beginnt:

   .. code:: programlisting

       tftp dgram udp wait root /usr/libexec/tftp tftp -l -s /b/tftpboot

   .. raw:: html

      <div class="note" xmlns="">

   Anmerkung:
   ~~~~~~~~~~

   Einige PXE-Versionen ben?tigen die TCP-Version von TFTP. In diesem
   Fall k?nnen Sie die zweite ``tftp``-Zeile, welche ``stream tcp``
   enth?lt, auskommentieren.

   .. raw:: html

      </div>

#. Starten Sie
   `inetd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=inetd&sektion=8>`__:

   .. code:: screen

       # service inetd start

#. Erstellen Sie einen neues Basissystem und einen FreeBSD-Kernel
   (detaillierte Anweisungen hierzu finden Sie unter `Abschnitt?26.7,
   „Das komplette Basissystem neu bauen“ <makeworld.html>`__):

   .. code:: screen

       # cd /usr/src
       # make buildworld
       # make buildkernel

#. Installieren sie FreeBSD in das Verzeichnis, welches ?ber NFS
   eingehangen ist:

   .. code:: screen

       # make installworld DESTDIR=${NFSROOTDIR}
       # make installkernel DESTDIR=${NFSROOTDIR}
       # make distribution DESTDIR=${NFSROOTDIR}
                 

#. Testen Sie den TFTP-Server und vergewissern Sie sich, dass Sie den
   Bootloader herunterladen k?nnen, der ?ber PXE bereitgestellt wird:

   .. code:: screen

       # tftp localhost
       tftp> get FreeBSD/install/boot/pxeboot
       Received 264951 bytes in 0.1 seconds
                 

#. Bearbeiten Sie ``${NFSROOTDIR}/etc/fstab`` und erstellen Sie einen
   Eintrag, um das Root-Dateisystem ?ber NFS einzuh?ngen:

   .. code:: programlisting

       # Device                                      Mountpoint    FSType    Options   Dump  Pass
       myhost.example.com:/b/tftpboot/FreeBSD/install    /         nfs       ro        0     0
                 

   Ersetzen Sie *``myhost.example.com``* durch den Hostnamen oder die
   IP-Adresse Ihres NFS-Servers. In diesem Beispiel wird das
   Root-Dateisystem schreibgesch?tzt eingehangen, um ein potenzielles
   L?schen des Inhalts durch die NFS-Clients zu verhindern.

#. Setzen Sie das root-Passwort in der PXE-Umgebung f?r
   Client-Maschinen, die ?ber PXE starten:

   .. code:: screen

       # chroot ${NFSROOTDIR} 
       # passwd

#. Falls erforderlich, aktivieren Sie
   `ssh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh&sektion=1>`__
   root-Logins f?r Client-Maschinen, die ?ber PXE starten, indem Sie die
   Option ``PermitRootLogin`` in ``${NFSROOTDIR}/etc/ssh/sshd_config``
   aktivieren. Dies ist in
   `sshd\_config(5) <http://www.FreeBSD.org/cgi/man.cgi?query=sshd_config&sektion=5>`__
   dokumentiert.

#. F?hren Sie alle weiteren Anpassungen der PXE-Umgebung in
   ${NFSROOTDIR} durch, wie zum Beispiel die Installation weiterer
   Pakete, oder dass Bearbeiten der Passwortdatei mit
   `vipw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=vipw&sektion=8>`__.

.. raw:: html

   </div>

Booten Sie von einem NFS-Root-Volume, so erkennt ``/etc/rc`` dies und
startet daraufhin das ``/etc/rc.initdiskless`` Skript. Lesen Sie die
Kommentare in diesem Skript um zu verstehen, was dort vor sich geht.
Weil das NFS-Root-Verzeichnis schreibgesch?tzt ist, wir aber
Schreibzugriff f?r ``/etc`` und ``/var`` ben?tigen, m?ssen wir diese
Verzeichnisse ?ber Speicher-Dateisysteme (memory backed file system)
einbinden.

.. code:: screen

    # chroot ${NFSROOTDIR}
    # mkdir -p conf/base
    # tar -c -v -f conf/base/etc.cpio.gz --format cpio
    --gzip etc
    # tar -c -v -f conf/base/var.cpio.gz --format cpio
    --gzip var

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

33.8.2. Konfiguration des DHCP-Servers
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Der DHCP-Server muss nicht auf der selben Maschine laufen wie der TFTP-
und NFS-Server, aber er muss ?ber das Netzwerk erreichbar sein.

DHCP ist nicht Bestandteil des FreeBSD Basissystems, kann jedoch ?ber
den Port
`net/isc-dhcp42-server <http://www.freebsd.org/cgi/url.cgi?ports/net/isc-dhcp42-server/pkg-descr>`__
oder als Paket nachinstalliert werden.

Einmal installiert, bearbeiten Sie seine Konfigurationsdatei,
``/usr/local/etc/dhcpd.conf``. Konfigurieren Sie die ``next-server``,
``filename`` und ``root-path`` Einstellungen, wie in diesem Beispiel zu
sehen ist:

.. code:: programlisting

    subnet 192.168.0.0 netmask 255.255.255.0 {
    range 192.168.0.2 192.168.0.3;
    option subnet-mask 255.255.255.0;
    option routers 192.168.0.1;
    option broadcast-address 192.168.0.255;
    option domain-name-servers 192.168.35.35, 192.168.35.36;
    option domain-name "example.com";

    # IP address of TFTP server
    next-server 192.168.0.1;

    # path of boot loader obtained via tftp
    filename "FreeBSD/install/boot/pxeboot";

    # pxeboot boot loader will try to NFS mount this directory for root FS
    option root-path "192.168.0.1:/b/tftpboot/FreeBSD/install/";
    }

Die Anweisung ``next-server`` wird benutzt, um die IP-Adresse des
TFTP-Servers anzugeben.

Die Anweisung ``filename`` definiert den Pfad zu ``/boot/pxeboot``. Da
hier der relative Dateiname verwendet wird, bedeutet das, dass
``/b/tftpboot`` nicht im Pfad enthalten ist.

Die Option ``root-path`` bestimmt den Pfad zum NFS root-Dateisystem.

Sobald die ?nderungen gespeichert werden, aktivieren Sie NFS beim
Systemstart, indem Sie die folgende Zeile in ``/etc/rc.conf``
hinzuf?gen:

.. code:: programlisting

    dhcpd_enable="YES"

Starten Sie anschlie?end den DHCP-Dienst:

.. code:: screen

    # service isc-dhcpd
    start

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

33.8.3. Fehlersuche bei PXE Problemen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Sobald alle Dienste konfiguriert und gestartet wurden, sollten
PXE-Clients in der Lage sein, FreeBSD automatisch ?ber das Netzwerk zu
starten. Wenn ein bestimmter Client beim hochfahren keine Verbindung
herstellen kann, sehen Sie im BIOS nach, ob die Option f?r den Start
?ber das Netzwerk konfiguriert ist.

Dieser Abschnitt gibt einige Tipps zu Fehlerbehebung und zeigt, wie Sie
Konfigurationsprobleme eingrezen k?nnen f?r den Fall, dass PXE-Clients
nicht in der Lage sind ?ber das Netzwerk zu starten.

.. raw:: html

   <div class="procedure">

#. Benutzen Sie den ``net/wireshark`` Port um Fehler im Netzwerkverkehr
   w?hrend des Bootvorgangs von PXE zu finden. Der Bootvorgang wird im
   folgenden Diagramm schematisch dargestellt.

   .. raw:: html

      <div class="figure">

   .. raw:: html

      <div class="figure-title">

   Abbildung 33.1. PXE-Bootvorgang mit NFS Root Mount

   .. raw:: html

      </div>

   .. raw:: html

      <div class="figure-contents">

   .. raw:: html

      <div class="mediaobject">

   |PXE-Bootvorgang mit NFS Root Mount|

   .. raw:: html

      <div class="calloutlist">

   +--------------------------------------+--------------------------------------+
   | |1|                                  | Client sendet eine ``DHCPDISCOVER``  |
   |                                      | Nachricht.                           |
   +--------------------------------------+--------------------------------------+
   | |2|                                  | Der DHCP-Server antwortet mit einer  |
   |                                      | IP-Adresse, sowie den Werten f?r     |
   |                                      | ``next-server``, ``filename`` und    |
   |                                      | ``root-path``.                       |
   +--------------------------------------+--------------------------------------+
   | |3|                                  | Der Client sendet eine TFTP-Anfrage  |
   |                                      | an ``next-server``, mit der Bitte    |
   |                                      | ``filename`` zu empfangen.           |
   +--------------------------------------+--------------------------------------+
   | |4|                                  | Der TFTP-Server antwortet und sendet |
   |                                      | ``filename`` zum Client.             |
   +--------------------------------------+--------------------------------------+
   | |5|                                  | Der Client f?hrt ``filename``,       |
   |                                      | sprich                               |
   |                                      | `pxeboot(8) <http://www.FreeBSD.org/ |
   |                                      | cgi/man.cgi?query=pxeboot&sektion=8> |
   |                                      | `__                                  |
   |                                      | aus, was wiederum den Kernel l?dt.   |
   |                                      | Wenn der Kernel ausgef?hrt wird,     |
   |                                      | wird das Root-Dateisystem, welches   |
   |                                      | in ``root-path`` spezifiziert ist,   |
   |                                      | ?ber NFS eingebunden.                |
   +--------------------------------------+--------------------------------------+

   .. raw:: html

      </div>

   .. raw:: html

      </div>

   .. raw:: html

      </div>

   .. raw:: html

      </div>

   | 

#. Schauen Sie in ``/var/log/xferlog`` auf Ihrem TFTP-Server und
   vergewissern Sie sich, dass die ``pxeboot``-Datei von der richtigen
   Adresse heruntergeladen wurde. Um die obige Konfiguration von
   ``/usr/local/etc/dhcpd.conf`` zu testen, geben Sie folgendes ein:

   .. code:: screen

       # tftp 192.168.0.1
       tftp> get FreeBSD/install/boot/pxeboot
       Received 264951 bytes in 0.1 seconds

   Weitere Informationen finden Sie in
   `tftpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=tftpd&sektion=8>`__
   und
   `tftp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tftp&sektion=1>`__.
   Die ``BUGS``-Sektionen dieser Seiten dokumentieren einige
   Einschr?nkungen von TFTP.

#. Achten Sie darauf, dass Sie das Root-Dateisystem ?ber NFS einh?ngen
   k?nnen. Auch hier k?nnen Sie Ihre Einstellungen aus
   ``/usr/local/etc/dhcpd.conf`` wie folgt testen:

   .. code:: screen

       # mount -t nfs 192.168.0.1:/b
       /tftpboot/FreeBSD/install /mnt

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------+--------------------------------------------+---------------------------------------------------------+
| `Zur?ck <network-aggregation.html>`__?   | `Nach oben <advanced-networking.html>`__   | ?\ `Weiter <network-isdn.html>`__                       |
+------------------------------------------+--------------------------------------------+---------------------------------------------------------+
| 33.7. Link-Aggregation und Failover?     | `Zum Anfang <index.html>`__                | ?33.9. ISDN – dienstintegrierendes digitales Netzwerk   |
+------------------------------------------+--------------------------------------------+---------------------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.

.. |PXE-Bootvorgang mit NFS Root Mount| image:: advanced-networking/pxe-nfs.png
.. |1| image:: ./imagelib/callouts/1.png
.. |2| image:: ./imagelib/callouts/2.png
.. |3| image:: ./imagelib/callouts/3.png
.. |4| image:: ./imagelib/callouts/4.png
.. |5| image:: ./imagelib/callouts/5.png
