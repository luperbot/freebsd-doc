=================================================
31.5. Automatische Netzwerkkonfiguration mit DHCP
=================================================

.. raw:: html

   <div class="navheader">

31.5. Automatische Netzwerkkonfiguration mit DHCP
`Zur?ck <network-nis.html>`__?
Kapitel 31. Netzwerkserver
?\ `Weiter <network-dns.html>`__

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

31.5. Automatische Netzwerkkonfiguration mit DHCP
-------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Geschrieben von Greg Sutter.

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

31.5.1. Was ist DHCP?
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

?ber DHCP, das Dynamic Host Configuration Protocol, kann sich ein System
mit einem Netzwerk verbinden und die f?r die Kommunikation mit diesem
Netzwerk n?tigen Informationen beziehen. FreeBSD verwendet den von
OpenBSD?3.7 stammenden ``dhclient``. Die Informationen in diesem
Abschnitt beziehen sich daher sowohl auf den ``dhclient`` von ISC als
auch auf den von OpenBSD. Als DHCP-Server wird in beiden F?llen der
DHCP-Server der ISC-Distribution verwendet.

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

31.5.2. ?bersicht
~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dieser Abschnitt beschreibt sowohl die Clientseite des ISC- als auch des
OpenBSD-Clients sowie die Serverseite des DHCP-Systems von ISC. Das
Clientprogramm ``dhclient`` ist in FreeBSD integriert, das
Serverprogramm kann ?ber den Port
`net/isc-dhcp42-server <http://www.freebsd.org/cgi/url.cgi?ports/net/isc-dhcp42-server/pkg-descr>`__
installiert werden. Weiter Informationen finden Sie in
`dhclient(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dhclient&sektion=8>`__,
`dhcp-options(5) <http://www.FreeBSD.org/cgi/man.cgi?query=dhcp-options&sektion=5>`__
sowie
`dhclient.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=dhclient.conf&sektion=5>`__.

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

31.5.3. Wie funktioniert DHCP?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Der DHCP-Client ``dhclient`` beginnt von einem Clientrechner aus ?ber
den UDP-Port 68 Konfigurationsinformationen anzufordern. Der Server
antwortet auf dem UDP-Port 67, indem er dem Client eine IP-Adresse
zuweist und ihm weitere wichtige Informationen ?ber das Netzwerk, wie
Netzmasken, Router und DNS-Server mitteilt. Diese Informationen werden
als *DHCP-Lease* bezeichnet und sind nur f?r eine bestimmte Zeit, die
vom Administrator des DHCP-Servers vorgegeben wird, g?ltig. Dadurch
fallen verwaiste IP-Adressen, deren Clients nicht mehr mit dem Netzwerk
verbunden sind, automatisch an den Server zur?ck.

DHCP-Clients k?nnen sehr viele Informationen von einem DHCP-Server
erhalten. Eine ausf?hrliche Liste finden Sie in
`dhcp-options(5) <http://www.FreeBSD.org/cgi/man.cgi?query=dhcp-options&sektion=5>`__.

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

31.5.4. Integration in FreeBSD
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD verwendet den DHCP-Client von OpenBSD. Sowohl w?hrend der
Installation als auch im Basissystem steht der DHCP-Client zur
Verf?gung. In Netzen mit DHCP-Servern wird dadurch die Konfiguration von
Systemen erheblich vereinfacht.

DHCP wird von sysinstall unterst?tzt. Wenn Sie eine Netzwerkkarte mit
sysinstall konfigurieren, lautet die zweite Frage „Do you want to try
DHCP configuration of the interface?“. Wenn Sie diese Frage bejahen,
wird ``dhclient`` aufgerufen, und die Netzkarte wird automatisch
eingerichtet.

Um DHCP beim Systemstart zu aktivieren, m?ssen Sie zwei Dinge erledigen:

.. raw:: html

   <div class="itemizedlist">

-  Stellen Sie sicher, dass ``bpf`` in Ihren Kernel kompiliert ist. Dazu
   f?gen Sie die Zeile ``device bpf`` in Ihre Kernelkonfigurationsdatei
   ein und erzeugen einen neuen Kernel. Weitere Informationen zur
   Kernelkonfiguration finden Sie in `Kapitel?9, *Konfiguration des
   FreeBSD-Kernels* <kernelconfig.html>`__ des Handbuchs.

   Das Ger?t ``bpf`` ist im ``GENERIC``-Kernel bereits enthalten. F?r
   die Nutzung von DHCP muss also kein angepasster Kernel erzeugt
   werden.

   .. raw:: html

      <div class="note" xmlns="">

   Anmerkung:
   ~~~~~~~~~~

   Wenn Sie um die Sicherheit Ihres Systems besorgt sind, sollten Sie
   wissen, dass ``bpf`` auch zur Ausf?hrung von Paketsniffern
   erforderlich ist (obwohl diese dennoch als ``root`` ausgef?hrt werden
   m?ssen). ``bpf`` *muss* vorhanden sein, damit DHCP funktioniert. Sind
   Sie sehr sicherheitsbewusst, sollten Sie ``bpf`` aus Ihrem Kernel
   entfernen, wenn Sie DHCP nicht verwenden.

   .. raw:: html

      </div>

-  Standardm?ssig l?uft die DHCP-Konfiguration bei FreeBSD im
   Hintergrund oder auch *asynchron*. Andere Startskripte laufen weiter,
   w?hrend DHCP fertig abgearbeitet wird, was den Systemstart
   beschleunigt.

   DHCP im Hintergrund funktioniert gut, wenn der DHCP-Server schnell
   auf Anfragen antwortet und der DHCP-Konfigurationsprozess ebenso
   schnell abl?uft. Jedoch kann DHCP eine lange Zeit ben?tigen, um auf
   manchen Systemen fertig zu werden. Falls Netzwerkdienste versuchen,
   vor DHCP zum Ende zu kommen, werden diese fehlschlagen. Durch die
   Verwendung von DHCP im *asynchronen*-Modus wird das Problem
   verhindert, so dass die Startskripte pausiert werden, bis die
   DHCP-Konfiguration abgeschlossen ist.

   Um sich zu einem DHCP-Server im Hintergrund zu verbinden, w?hrend
   andere Startskripte fortfahren (asynchroner Modus), benutzen Sie den
   „``DHCP``“-Wert in ``/etc/rc.conf``:

   .. code:: programlisting

       ifconfig_fxp0="DHCP"

   Um den Start zu pausieren, damit DHCP vorher abgeschlossen werden
   kann, benutzen Sie den synchronen Modus mit dem Eintrag
   „``SYNCDHCP``“:

   .. code:: programlisting

       ifconfig_fxp0="SYNCDHCP"

   .. raw:: html

      <div class="note" xmlns="">

   Anmerkung:
   ~~~~~~~~~~

   Ersetzen Sie *``fxp0``*, das in diesen Beispielen verwendet wurde,
   durch den Namen Ihrer Netzwerkschnittstelle, so wie es in
   `Abschnitt?12.8, „Einrichten von
   Netzwerkkarten“ <config-network-setup.html>`__ beschrieben ist.

   .. raw:: html

      </div>

   Wenn Sie ``dhclient`` an einem anderen Ort installiert haben, oder
   zus?tzliche Flags an ``dhclient`` ?bergeben wollen, f?gen Sie auch
   folgende (entsprechend angepasste) Zeilen ein:

   .. code:: programlisting

       dhclient_program="/sbin/dhclient"
       dhclient_flags=""

.. raw:: html

   </div>

Der DHCP-Server dhcpd ist als Teil des Ports
`net/isc-dhcp42-server <http://www.freebsd.org/cgi/url.cgi?ports/net/isc-dhcp42-server/pkg-descr>`__
verf?gbar. Dieser Port enth?lt die komplette ISC-DHCP-Distribution,
inklusive der Dokumentation.

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

31.5.5. Dateien
~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="itemizedlist">

-  ``/etc/dhclient.conf``

   ``dhclient`` ben?tigt die Konfigurationsdatei ``/etc/dhclient.conf``.
   Diese Datei enth?lt normalerweise nur Kommentare, da die Vorgabewerte
   zumeist ausreichend sind. Lesen Sie dazu auch
   `dhclient.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=dhclient.conf&sektion=5>`__.

-  ``/sbin/dhclient``

   ``dhclient`` ist statisch gelinkt und befindet sich in ``/sbin``.
   Weitere Informationen finden Sie in
   `dhclient(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dhclient&sektion=8>`__.

-  ``/sbin/dhclient-script``

   Bei ``dhclient-script`` handelt es sich um das FreeBSD-spezifische
   Konfigurationsskript des DHCP-Clients. Es wird in
   `dhclient-script(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dhclient-script&sektion=8>`__
   beschrieben und kann meist unver?ndert ?bernommen werden.

-  ``/var/db/dhclient.leases. interface``

   Der DHCP-Client verf?gt ?ber eine Datenbank, die alle derzeit
   g?ltigen Leases enth?lt und als Logdatei erzeugt wird. Weitere
   Informationen finden Sie in
   `dhclient(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dhclient&sektion=8>`__.

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

31.5.6. Weitere Informationen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das DHCP-Protokoll wird vollst?ndig im `RFC
2131 <http://www.freesoft.org/CIE/RFC/2131/>`__ beschrieben. Eine
weitere, lehrreiche Informationsquelle existiert unter
``http://www.dhcp.org/``.

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

31.5.7. Einen DHCP-Server installieren und einrichten
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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

31.5.7.1. ?bersicht
^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dieser Abschnitt beschreibt die Einrichtung eines FreeBSD-Systems als
DHCP-Server. Dazu wird die DHCP-Implementation von ISC (Internet Systems
Consortium) verwendet.

Der DHCP-Server ist nicht im Basissystem von FreeBSD enthalten, daher
m?ssen Sie als Erstes den Port
`net/isc-dhcp42-server <http://www.freebsd.org/cgi/url.cgi?ports/net/isc-dhcp42-server/pkg-descr>`__
installieren. Lesen Sie `Kapitel?5, *Installieren von Anwendungen:
Pakete und Ports* <ports.html>`__, wenn Sie weitere Informationen zur
Ports-Sammlung ben?tigen.

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

31.5.7.2. Den DHCP-Server installieren
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Stellen Sie sicher, dass
`bpf(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bpf&sektion=4>`__ in
Ihren Kernel kompiliert ist. Dazu f?gen Sie die Zeile ``device bpf``
Ihre Kernelkonfigurationsdatei ein und erzeugen einen neuen Kernel. Die
Kernelkonfiguration wird in `Kapitel?9, *Konfiguration des
FreeBSD-Kernels* <kernelconfig.html>`__ beschrieben.

Das Ger?t ``bpf`` ist im ``GENERIC``-Kernel bereits enthalten. F?r die
Nutzung von DHCP muss also kein angepasster Kernel erzeugt werden.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Wenn Sie um die Sicherheit Ihres Systems besorgt sind, sollten Sie
wissen, dass ``bpf`` auch zur Ausf?hrung von Paketsniffern erforderlich
ist (obwohl diese dennoch als ``root`` ausgef?hrt werden m?ssen).
``bpf`` *muss* vorhanden sein, damit DHCP funktioniert. Sind Sie sehr
sicherheitsbewusst, sollten Sie ``bpf`` aus Ihrem Kernel entfernen, wenn
Sie DHCP nicht verwenden.

.. raw:: html

   </div>

Danach m?ssen Sie die vom Port
`net/isc-dhcp42-server <http://www.freebsd.org/cgi/url.cgi?ports/net/isc-dhcp42-server/pkg-descr>`__
erzeugte Vorlage f?r ``dhcpd.conf`` anpassen. Die bei der Installation
erzeugte Datei ``/usr/local/etc/dhcpd.conf.sample`` sollten Sie nach
``/usr/local/etc/dhcpd.conf`` kopieren, bevor Sie Ver?nderungen
vornehmen.

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

31.5.7.3. Den DHCP-Server einrichten
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``dhcpd.conf`` besteht aus Festlegungen zu Subnetzen und Rechnern und
l?sst sich am besten an einem Beispiel erkl?ren:

.. code:: programlisting

    option domain-name "example.com";
    option domain-name-servers 192.168.4.100;
    option subnet-mask 255.255.255.0;

    default-lease-time 3600;
    max-lease-time 86400;
    ddns-update-style none;

    subnet 192.168.4.0 netmask 255.255.255.0 {
      range 192.168.4.129 192.168.4.254;
      option routers 192.168.4.1;
    }

    host mailhost {
      hardware ethernet 02:03:04:05:06:07;
      fixed-address mailhost.example.com;
    }

.. raw:: html

   <div class="calloutlist">

+--------------------------------------+--------------------------------------+
| `|1| <#domain-name>`__               | Diese Option beschreibt die Dom?ne,  |
|                                      | die den Clients als                  |
|                                      | Standardsuchdom?ne zugewiesen wird.  |
|                                      | Weitere Informationen finden Sie in  |
|                                      | man.resolv.conf.5;.                  |
+--------------------------------------+--------------------------------------+
| `|2| <#domain-name-servers>`__       | Diese Option legt eine, durch        |
|                                      | Kommata getrennte Liste von          |
|                                      | DNS-Servern fest, die von den        |
|                                      | Clients verwendet werden sollen.     |
+--------------------------------------+--------------------------------------+
| `|3| <#subnet-mask>`__               | Die den Clients zugewiesene          |
|                                      | Netzmaske.                           |
+--------------------------------------+--------------------------------------+
| `|4| <#default-lease-time>`__        | Ein Client kann eine Lease einer     |
|                                      | bestimmten Dauer anfordern.          |
|                                      | Geschieht dies nicht, weist der      |
|                                      | Server eine Lease mit einer          |
|                                      | vorgegebenen Ablaufdauer (in         |
|                                      | Sekunden) zu.                        |
+--------------------------------------+--------------------------------------+
| `|5| <#max-lease-time>`__            | Die maximale Zeitdauer, f?r die der  |
|                                      | Server Konfigurationsinformationen   |
|                                      | vergibt. Sollte ein Client eine      |
|                                      | l?ngere Zeitspanne anfordern, wird   |
|                                      | dennoch nur der Wert                 |
|                                      | ``max-lease-time`` in Sekunden       |
|                                      | zugewiesen.                          |
+--------------------------------------+--------------------------------------+
| `|6| <#ddns-update-style>`__         | Diese Option legt fest, ob der       |
|                                      | DHCP-Server eine DNS-Aktualisierung  |
|                                      | versuchen soll, wenn                 |
|                                      | Konfigurationsdateien vergeben oder  |
|                                      | zur?ckgezogen werden. In der         |
|                                      | ISC-Implementation *muss* diese      |
|                                      | Option gesetzt sein.                 |
+--------------------------------------+--------------------------------------+
| `|7| <#range>`__                     | Dadurch werden die IP-Adressen       |
|                                      | festgelegt, die den Clients          |
|                                      | zugewiesen werden k?nnen.            |
|                                      | IP-Adressen zwischen diesen Grenzen  |
|                                      | sowie die einschlie?enden Adressen   |
|                                      | werden den Clients zugewiesen.       |
+--------------------------------------+--------------------------------------+
| `|8| <#routers>`__                   | Legt das Standard-Gateway fest, das  |
|                                      | den Clients zugewiesen wird.         |
+--------------------------------------+--------------------------------------+
| `|9| <#hardware>`__                  | Die (Hardware-)MAC-Adresse eines     |
|                                      | Rechners (durch die der DHCP-Server  |
|                                      | den Client erkennt, der eine         |
|                                      | Anforderung an ihn stellt).          |
+--------------------------------------+--------------------------------------+
| `|10| <#fixed-address>`__            | Einem Rechner soll immer die gleiche |
|                                      | IP-Adresse zugewiesen werden.        |
|                                      | Beachten Sie, dass hier auch ein     |
|                                      | Rechnername g?ltig ist, da der       |
|                                      | DHCP-Server den Rechnernamen         |
|                                      | aufl?st, bevor er die                |
|                                      | Konfigurationsinformationen zuweist. |
+--------------------------------------+--------------------------------------+

.. raw:: html

   </div>

Nachdem Sie ``dhcpd.conf`` fertig konfiguriert haben, sollten Sie den
DHCP-Server aktivieren, indem Sie folgende Zeilen in ``/etc/rc.conf``
aufnehmen:

.. code:: programlisting

    dhcpd_enable="YES"
    dhcpd_ifaces="dc0"

Dabei m?ssen Sie den Ger?teeintrag ``dc0`` durch die Ger?tedatei
(mehrere Ger?tedateien m?ssen durch Leerzeichen getrennt werden)
ersetzen, die Ihr DHCP-Server auf Anfragen von DHCP-Clients hin
?berwachen soll.

Danach k?nnen Sie den Server durch Eingabe des folgenden Befehls
starten:

.. code:: screen

    # service isc-dhcpd start

Sollten Sie die Konfiguration Ihres Servers einmal ver?ndern m?ssen,
reicht es nicht aus, ein ``SIGHUP``-Signal an dhcpd zu senden, weil
damit die Konfiguration *nicht* erneut geladen wird (im Gegensatz zu den
meisten Daemonen). Sie m?ssen den Prozess vielmehr mit dem Signal
``SIGTERM`` stoppen, um ihn anschlie?end neu zu starten.

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

31.5.7.4. Dateien
^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="itemizedlist">

-  ``/usr/local/sbin/dhcpd``

   dhcpd ist statisch gelinkt und befindet sich in ``/usr/local/sbin``.
   Lesen Sie auch die mit dem Port installierte Hilfeseite
   `dhcpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dhcpd&sektion=8>`__,
   wenn Sie weitere Informationen zu dhcpd ben?tigen.

-  ``/usr/local/etc/dhcpd.conf``

   dhcpd ben?tigt die Konfigurationsdatei ``/usr/local/etc/dhcpd.conf``,
   damit der Server den Clients seine Dienste anbieten kann. Diese Datei
   muss alle Informationen enthalten, die an die Clients weitergegeben
   werden soll. Au?erdem sind hier Informationen zur Konfiguration des
   Servers enthalten. Die mit dem Port installierte Hilfeseite
   `dhcpd.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=dhcpd.conf&sektion=5>`__
   enth?lt weitere Informationen.

-  ``/var/db/dhcpd.leases``

   Der DHCP-Server hat eine Datenbank, die alle vergebenen Leases
   enth?lt. Diese wird als Logdatei erzeugt. Weitere Informationen
   finden Sie in der vom Port installierten Hilfeseite
   `dhcpd.leases(5) <http://www.FreeBSD.org/cgi/man.cgi?query=dhcpd.leases&sektion=5>`__.

-  ``/usr/local/sbin/dhcrelay``

   dhcrelay wird in komplexen Umgebungen verwendet, in denen ein
   DHCP-Server eine Anfrage eines Clients an einen DHCP-Server in einem
   separaten Netzwerk weiterleitet. Wenn Sie diese Funktion ben?tigen,
   m?ssen Sie den Port
   `net/isc-dhcp42-relay <http://www.freebsd.org/cgi/url.cgi?ports/net/isc-dhcp42-relay/pkg-descr>`__
   installieren. Weitere Informationen zu diesem Thema finden Sie in
   `dhcrelay(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dhcrelay&sektion=8>`__.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------------+----------------------------------------+------------------------------------+
| `Zur?ck <network-nis.html>`__?                | `Nach oben <network-servers.html>`__   | ?\ `Weiter <network-dns.html>`__   |
+-----------------------------------------------+----------------------------------------+------------------------------------+
| 31.4. NIS/YP – Network Information Service?   | `Zum Anfang <index.html>`__            | ?31.6. DNS – Domain Name Service   |
+-----------------------------------------------+----------------------------------------+------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.

.. |1| image:: ./imagelib/callouts/1.png
.. |2| image:: ./imagelib/callouts/2.png
.. |3| image:: ./imagelib/callouts/3.png
.. |4| image:: ./imagelib/callouts/4.png
.. |5| image:: ./imagelib/callouts/5.png
.. |6| image:: ./imagelib/callouts/6.png
.. |7| image:: ./imagelib/callouts/7.png
.. |8| image:: ./imagelib/callouts/8.png
.. |9| image:: ./imagelib/callouts/9.png
.. |10| image:: ./imagelib/callouts/10.png
