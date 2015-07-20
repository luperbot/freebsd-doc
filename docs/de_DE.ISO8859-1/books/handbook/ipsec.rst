====================
15.9. VPNs mit IPsec
====================

.. raw:: html

   <div class="navheader">

15.9. VPNs mit IPsec
`Zur?ck <openssl.html>`__?
Kapitel 15. Sicherheit
?\ `Weiter <openssh.html>`__

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

15.9. VPNs mit IPsec
--------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Geschrieben von Nik Clayton.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dieser Abschnitt beschreibt, wie Sie mit FreeBSD-Gateways ein
*Virtual-Private-Network* (VPN) einrichten. Als Beispiel wird ein VPN
zwischen zwei Netzen verwendet, die ?ber das Internet miteinander
verbunden sind.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

15.9.1. IPsec Grundlagen
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div>

Geschrieben von Hiten M. Pandya.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dieser Abschnitt zeigt Ihnen, wie Sie IPsec einrichten. Um IPsec
einzurichten, sollten Sie einen neuen Kernel bauen k?nnen (siehe
`Kapitel?9, *Konfiguration des FreeBSD-Kernels* <kernelconfig.html>`__).

IPsec ist ein Protokoll, das auf dem Internet-Protokoll (IP) aufbaut.
Mit IPsec k?nnen mehrere Systeme gesch?tzt miteinander kommunizieren.
Das in FreeBSD realisierte IPsec-Protokoll baut auf der
`KAME-Implementierung <http://www.kame.net/>`__ auf und unterst?tzt
sowohl IPv4 als auch IPv6.

IPsec besteht wiederum aus zwei Protokollen:

.. raw:: html

   <div class="itemizedlist">

-  *Encapsulated Security Payload (ESP)* verschl?sselt IP-Pakete mit
   einem symmetrischen Verfahren (beispielsweise Blowfish oder 3DES).
   Damit werden die Pakete vor Manipulationen Dritter gesch?tzt.

-  Der *Authentication Header (AH)* enth?t eine kryptographische
   Pr?fsumme, die sicher stellt, dass ein IP-Paket nicht ver?ndert
   wurde. Der Authentication-Header folgt nach dem normalen IP-Header
   und erlaubt dem Empf?nger eines IP-Paketes, dessen Integrit?t zu
   pr?fen.

.. raw:: html

   </div>

ESP und AH k?nnen, je nach Situation, zusammen oder einzeln verwendet
werden.

IPsec kann in zwei Modi betrieben werden: Der *Transport-Modus*
verschl?sselt die Daten zwischen zwei Systemen. Der *Tunnel-Modus*
verbindet zwei Subnetze miteinander. Durch einen Tunnel k?nnen dann
beispielsweise verschl?sselte Daten ?bertragen werden. Ein Tunnel wird
auch als Virtual-Private-Network (VPN) bezeichnet. Detaillierte
Informationen ?ber das IPsec-Subsystem von FreeBSD enth?lt die
Hilfeseite
`ipsec(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipsec&sektion=4>`__.

Die folgenden Optionen in der Kernelkonfiguration aktivieren IPsec:

.. code:: screen

    options   IPSEC        #IP security
    device    crypto

Wenn Sie zur Fehlersuche im IPsec-Subsystem Unterst?tzung w?nschen,
sollten Sie die folgende Option ebenfalls aktivieren:

.. code:: screen

    options   IPSEC_DEBUG  #debug for IP security

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

15.9.2. Was ist ein VPN?
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Es gibt keinen Standard, der festlegt, was ein Virtual-Private-Network
ist. VPNs k?nnen mit verschiedenen Techniken, die jeweils eigene Vor-
und Nachteile besitzen, implementiert werden. Dieser Abschnitt stellt
eine M?glichkeit vor, ein VPN aufzubauen.

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

15.9.3. Das Szenario: Zwei Netzwerke, ein Heim- und ein Firmennetzwerk. Beide sind mit dem Internet verbunden und verhalten sich dank VPN wie ein Netzwerk.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dieses Szenario hat die folgenden Vorausetzungen:

.. raw:: html

   <div class="itemizedlist">

-  Es m?ssen zwei Netzwerke vorhanden sein.

-  Beide Netzwerke m?ssen intern IP benutzen.

-  Beide Netzwerke sind ?ber ein FreeBSD-Gateway mit dem Internet
   verbunden.

-  Der Gateway jedes Netzwerks besitzt mindestens eine ?ffentliche
   IP-Adresse.

-  Die intern verwendeten IP-Adressen k?nnen private oder ?ffentliche
   Adressen sein. Sie d?rfen sich nicht ?berlappen; zum Beispiel: nicht
   beide sollten ``192.168.1.x`` benutzen.

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

15.9.4. Konfiguration von IPsec in FreeBSD
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div>

Geschrieben von Tom Rhodes.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Als erstes muss
`security/ipsec-tools <http://www.freebsd.org/cgi/url.cgi?ports/security/ipsec-tools/pkg-descr>`__
aus der Ports-Sammlung installiert werden. Dieses Softwarepaket Dritter
enth?lt einige Anwendungen, die ihnen bei der Konfiguration von IPsec
helfen.

Als n?chstes m?ssen zwei
`gif(4) <http://www.FreeBSD.org/cgi/man.cgi?query=gif&sektion=4>`__-Pseudoger?te
angelegt werden, um die Pakete zu tunneln und daf?r zu sorgen, dass
beide Netzwerke richtig miteinander kommunizieren k?nnen. Geben Sie als
Benutzer ``root`` die folgenden Befehle ein: Austausch der
*``internen``* und *``externen``* Werte durch die realen internen und
externen Gateways:

.. code:: screen

    # ifconfig gif0 create

.. code:: screen

    # ifconfig gif0 internal1 internal2

.. code:: screen

    # ifconfig gif0 tunnel external1 external2

Beispiel: Die ?ffentliche IP-Adresse des Firmennetzwerkes (LAN) ist:
``172.16.5.4`` mit einer internen IP-Adresse von ``10.246.38.1``. Das
Heimnetzwerk (LAN) hat die ?ffentliche IP-Adresse ``192.168.1.12`` mit
der internen privaten IP-Adresse ``10.0.0.5``.

Dies mag verwirrend erscheinen, schauen Sie sich deshalb das folgende
Beispiel aus dem
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8>`__-Befehl
an:

.. code:: programlisting

    Gateway 1:

    gif0: flags=8051 mtu 1280
    tunnel inet 172.16.5.4 --> 192.168.1.12
    inet6 fe80::2e0:81ff:fe02:5881%gif0 prefixlen 64 scopeid 0x6
    inet 10.246.38.1 --> 10.0.0.5 netmask 0xffffff00

    Gateway 2:

    gif0: flags=8051 mtu 1280
    tunnel inet 192.168.1.12 --> 172.16.5.4
    inet 10.0.0.5 --> 10.246.38.1 netmask 0xffffff00
    inet6 fe80::250:bfff:fe3a:c1f%gif0 prefixlen 64 scopeid 0x4

Wenn Sie fertig sind, sollten beide privaten IPs mit dem
`ping(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ping&sektion=8>`__
Befehl, wie die folgende Darstellung zeigt, erreichbar sein:

.. code:: programlisting

    priv-net# ping 10.0.0.5
    PING 10.0.0.5 (10.0.0.5): 56 data bytes
    64 bytes from 10.0.0.5: icmp_seq=0 ttl=64 time=42.786 ms
    64 bytes from 10.0.0.5: icmp_seq=1 ttl=64 time=19.255 ms
    64 bytes from 10.0.0.5: icmp_seq=2 ttl=64 time=20.440 ms
    64 bytes from 10.0.0.5: icmp_seq=3 ttl=64 time=21.036 ms
    --- 10.0.0.5 ping statistics ---
    4 packets transmitted, 4 packets received, 0% packet loss
    round-trip min/avg/max/stddev = 19.255/25.879/42.786/9.782 ms

    corp-net# ping 10.246.38.1
    PING 10.246.38.1 (10.246.38.1): 56 data bytes
    64 bytes from 10.246.38.1: icmp_seq=0 ttl=64 time=28.106 ms
    64 bytes from 10.246.38.1: icmp_seq=1 ttl=64 time=42.917 ms
    64 bytes from 10.246.38.1: icmp_seq=2 ttl=64 time=127.525 ms
    64 bytes from 10.246.38.1: icmp_seq=3 ttl=64 time=119.896 ms
    64 bytes from 10.246.38.1: icmp_seq=4 ttl=64 time=154.524 ms
    --- 10.246.38.1 ping statistics ---
    5 packets transmitted, 5 packets received, 0% packet loss
    round-trip min/avg/max/stddev = 28.106/94.594/154.524/49.814 ms

Wie erwartet, k?nnen nun beiden Seiten ICMP-Pakete von ihren privaten
Adressen senden und empfangen. Als n?chstes m?ssen beide Gateways so
konfiguriert werden, dass sie die Pakete des anderen Netzwerkes richtig
routen. Mit dem folgenden Befehl erreicht man das Ziel:

.. code:: screen

    # corp-net# route add 10.0.0.0 10.0.0.5 255.255.255.0

.. code:: screen

    # corp-net# route add net 10.0.0.0: gateway 10.0.0.5

.. code:: screen

    # priv-net# route add 10.246.38.0 10.246.38.1 255.255.255.0

.. code:: screen

    # priv-net# route add host 10.246.38.0: gateway 10.246.38.1

Ab jetzt sollten die Rechner von den Gateways sowie von den Rechnern
hinter den Gateways erreichbar sein. Dies wird an dem folgendem Beispiel
deutlich:

.. code:: programlisting

    corp-net# ping 10.0.0.8
    PING 10.0.0.8 (10.0.0.8): 56 data bytes
    64 bytes from 10.0.0.8: icmp_seq=0 ttl=63 time=92.391 ms
    64 bytes from 10.0.0.8: icmp_seq=1 ttl=63 time=21.870 ms
    64 bytes from 10.0.0.8: icmp_seq=2 ttl=63 time=198.022 ms
    64 bytes from 10.0.0.8: icmp_seq=3 ttl=63 time=22.241 ms
    64 bytes from 10.0.0.8: icmp_seq=4 ttl=63 time=174.705 ms
    --- 10.0.0.8 ping statistics ---
    5 packets transmitted, 5 packets received, 0% packet loss
    round-trip min/avg/max/stddev = 21.870/101.846/198.022/74.001 ms

    priv-net# ping 10.246.38.107
    PING 10.246.38.1 (10.246.38.107): 56 data bytes
    64 bytes from 10.246.38.107: icmp_seq=0 ttl=64 time=53.491 ms
    64 bytes from 10.246.38.107: icmp_seq=1 ttl=64 time=23.395 ms
    64 bytes from 10.246.38.107: icmp_seq=2 ttl=64 time=23.865 ms
    64 bytes from 10.246.38.107: icmp_seq=3 ttl=64 time=21.145 ms
    64 bytes from 10.246.38.107: icmp_seq=4 ttl=64 time=36.708 ms
    --- 10.246.38.107 ping statistics ---
    5 packets transmitted, 5 packets received, 0% packet loss
    round-trip min/avg/max/stddev = 21.145/31.721/53.491/12.179 ms

Das Konfigurieren der Tunnel ist der einfache Teil. Die Konfiguration
einer sicheren Verbindung geht sehr viel mehr in die Tiefe. Die folgende
Konfiguration benutzt pre-shared (PSK) RSA-Schl?ssel. Abgesehen von den
IP-Adressen, sind beide ``/usr/local/etc/racoon/racoon.conf`` identisch
und sehen ?hnlich aus wie:

.. code:: programlisting

    path    pre_shared_key  "/usr/local/etc/racoon/psk.txt"; #location of pre-shared key file
    log     debug;  #log verbosity setting: set to 'notify' when testing and debugging is complete

    padding # options are not to be changed
    {
            maximum_length  20;
            randomize       off;
            strict_check    off;
            exclusive_tail  off;
    }

    timer   # timing options. change as needed
    {
            counter         5;
            interval        20 sec;
            persend         1;
    #       natt_keepalive  15 sec;
            phase1          30 sec;
            phase2          15 sec;
    }

    listen  # address [port] that racoon will listening on
    {
            isakmp          172.16.5.4 [500];
            isakmp_natt     172.16.5.4 [4500];
    }

    remote  192.168.1.12 [500]
    {
            exchange_mode   main,aggressive;
            doi             ipsec_doi;
            situation       identity_only;
            my_identifier   address 172.16.5.4;
            peers_identifier        address 192.168.1.12;
            lifetime        time 8 hour;
            passive         off;
            proposal_check  obey;
    #       nat_traversal   off;
            generate_policy off;

                            proposal {
                                    encryption_algorithm    blowfish;
                                    hash_algorithm          md5;
                                    authentication_method   pre_shared_key;
                                    lifetime time           30 sec;
                                    dh_group                1;
                            }
    }

    sainfo  (address 10.246.38.0/24 any address 10.0.0.0/24 any)    # address $network/$netmask $type address $network/$netmask $type ( $type being any or esp)
    {                                                               # $network must be the two internal networks you are joining.
            pfs_group       1;
            lifetime        time    36000 sec;
            encryption_algorithm    blowfish,3des,des;
            authentication_algorithm        hmac_md5,hmac_sha1;
            compression_algorithm   deflate;
    }

Die Erkl?rung einer jeden verf?gbaren Option w?rde den Rahmen dieses
Textes sprengen. Es gibt sehr viele relevante Informationen in der
racoon-Konfigurationsanleitung.

Die SPD-Methoden m?ssn noch konfiguriert werden so dass, FreeBSD und
racoon in der Lage sind den Netzwerkverkehr zwischen den Hosts zu ver-
und entschl?sseln.

Dies wird durch ein einfaches Shellscript ?hnlich wie das folgende, das
auf dem Firmennetzwerk-Gateway liegt, ausgef?hrt. Diese Datei wird
w?hrend der Systeminitialisierung ausgef?hrt und sollte unter
``/usr/local/etc/racoon/setkey.conf`` abgespeichert werden.

.. code:: programlisting

    flush;
    spdflush;

    # To the home network
    spdadd 10.246.38.0/24 10.0.0.0/24 any -P out ipsec esp/tunnel/172.16.5.4-192.168.1.12/use;
    spdadd 10.0.0.0/24 10.246.38.0/24 any -P in ipsec esp/tunnel/192.168.1.12-172.16.5.4/use;

Einmal abgespeichert, kann racoon durch das folgende Kommando auf beiden
Gateways gestartet werden:

.. code:: screen

    # /usr/local/sbin/racoon -F -f /usr/local/etc/racoon/racoon.conf -l /var/log/racoon.log

Die Ausgabe sollte so ?hnlich aussehen:

.. code:: programlisting

    corp-net# /usr/local/sbin/racoon -F -f /usr/local/etc/racoon/racoon.conf
    Foreground mode.
    2006-01-30 01:35:47: INFO: begin Identity Protection mode.
    2006-01-30 01:35:48: INFO: received Vendor ID: KAME/racoon
    2006-01-30 01:35:55: INFO: received Vendor ID: KAME/racoon
    2006-01-30 01:36:04: INFO: ISAKMP-SA established 172.16.5.4[500]-192.168.1.12[500] spi:623b9b3bd2492452:7deab82d54ff704a
    2006-01-30 01:36:05: INFO: initiate new phase 2 negotiation: 172.16.5.4[0]192.168.1.12[0]
    2006-01-30 01:36:09: INFO: IPsec-SA established: ESP/Tunnel 192.168.1.12[0]->172.16.5.4[0] spi=28496098(0x1b2d0e2)
    2006-01-30 01:36:09: INFO: IPsec-SA established: ESP/Tunnel 172.16.5.4[0]->192.168.1.12[0] spi=47784998(0x2d92426)
    2006-01-30 01:36:13: INFO: respond new phase 2 negotiation: 172.16.5.4[0]192.168.1.12[0]
    2006-01-30 01:36:18: INFO: IPsec-SA established: ESP/Tunnel 192.168.1.12[0]->172.16.5.4[0] spi=124397467(0x76a279b)
    2006-01-30 01:36:18: INFO: IPsec-SA established: ESP/Tunnel 172.16.5.4[0]->192.168.1.12[0] spi=175852902(0xa7b4d66)

Um sicherzustellen, dass der Tunnel richtig funktioniert, wechseln Sie
auf eine andere Konsole und benutzen Sie
`tcpdump(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tcpdump&sektion=1>`__
mit dem folgenden Befehl, um sich den Netzwerkverkehr anzusehen.
Tauschen Sie ``em0`` durch die richtige Netzwerkkarte aus.

.. code:: screen

    # tcpdump -i em0 host 172.16.5.4 and dst 192.168.1.12

Die Ausgabe der Konsole sollte dem hier ?hneln. Wenn nicht, gibt es ein
Problem und ein Debuggen der ausgegebenen Daten ist notwendig.

.. code:: programlisting

    01:47:32.021683 IP corporatenetwork.com > 192.168.1.12.privatenetwork.com: ESP(spi=0x02acbf9f,seq=0xa)
    01:47:33.022442 IP corporatenetwork.com > 192.168.1.12.privatenetwork.com: ESP(spi=0x02acbf9f,seq=0xb)
    01:47:34.024218 IP corporatenetwork.com > 192.168.1.12.privatenetwork.com: ESP(spi=0x02acbf9f,seq=0xc)

An diesem Punkt sollten beide Netzwerke verf?gbar sein und den Anschein
haben, dass sie zum selben Netzwerk geh?ren. Meistens sind beide
Netzwerke durch eine Firewall gesch?tzt. Um den Netzwerkverkehr zwischen
den beiden Netzwerken zu erlauben, ist es notwendig Regeln zu erstellen.
F?r die
`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8>`__
Firewall f?gen Sie folgende Zeilen in ihre Firewall-Konfigurationsdatei
ein:

.. code:: programlisting

    ipfw add 00201 allow log esp from any to any
    ipfw add 00202 allow log ah from any to any
    ipfw add 00203 allow log ipencap from any to any
    ipfw add 00204 allow log udp from any 500 to any

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Die Regelnummern m?ssen eventuell, je nach ihrer Hostkonfiguration,
angepasst werden.

.. raw:: html

   </div>

F?r Benutzer der
`pf(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pf&sektion=4>`__- oder
`ipf(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipf&sektion=8>`__-Firewall
sollte folgendes funktionieren:

.. code:: programlisting

    pass in quick proto esp from any to any
    pass in quick proto ah from any to any
    pass in quick proto ipencap from any to any
    pass in quick proto udp from any port = 500 to any port = 500
    pass in quick on gif0 from any to any
    pass out quick proto esp from any to any
    pass out quick proto ah from any to any
    pass out quick proto ipencap from any to any
    pass out quick proto udp from any port = 500 to any port = 500
    pass out quick on gif0 from any to any

Zum Ende, um dem Computer den Start vom VPN w?hrend der
Systeminitialisierung zu erlauben, f?gen Sie folgende Zeilen in ihre
``/etc/rc.conf``: ein

.. code:: programlisting

    ipsec_enable="YES"
    ipsec_program="/usr/local/sbin/setkey"
    ipsec_file="/usr/local/etc/racoon/setkey.conf" # allows setting up spd policies on boot
    racoon_enable="yes"

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------+---------------------------------+--------------------------------+
| `Zur?ck <openssl.html>`__?   | `Nach oben <security.html>`__   | ?\ `Weiter <openssh.html>`__   |
+------------------------------+---------------------------------+--------------------------------+
| 15.8. OpenSSL?               | `Zum Anfang <index.html>`__     | ?15.10. OpenSSH                |
+------------------------------+---------------------------------+--------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
