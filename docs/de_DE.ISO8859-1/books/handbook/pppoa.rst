==========================
29.6. PPP over ATM (PPPoA)
==========================

.. raw:: html

   <div class="navheader">

29.6. PPP over ATM (PPPoA)
`Zur?ck <pppoe.html>`__?
Kapitel 29. PPP und SLIP
?\ `Weiter <slip.html>`__

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

29.6. PPP over ATM (PPPoA)
--------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Nachfolgend wird beschrieben, wie PPP over ATM (PPPoA) eingerichtet
wird. PPPoA ist vor allem unter europ?ischen DSL-Providern popul?r.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

29.6.1. Der Einsatz von PPPoA mit dem Alcatel SpeedTouch™ USB
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

PPPoA-Unterst?tzung f?r dieses Ger?t ist unter FreeBSD als Port
verf?gbar, da die Firmware unter `Alcatels
Lizenzvereinbarung <http://www.speedtouchdsl.com/disclaimer_lx.htm>`__
vertrieben wird und deshalb nicht mit dem FreeBSD-Basissystem frei
verteilt werden kann.

Um die Software zu installieren, verwenden Sie einfach die
`Ports-Sammlung <ports.html>`__. Installieren Sie den Port
`net/pppoa <http://www.freebsd.org/cgi/url.cgi?ports/net/pppoa/pkg-descr>`__
und folgen Sie den dabei angegebenen Instruktionen.

F?r den ordnungsgem??en Betrieb muss das Alcatel SpeedTouch™ USB, wie
viele USB-Ger?te, Firmware auf den Gastrechner laden. FreeBSD kann die
Firmware automatisch laden, wenn das Ger?t mit dem USB-Anschluss
verbunden wird. Dazu f?gen Sie als Benutzer ``root`` die nachstehenden
Zeilen in ``/etc/usbd.conf`` ein:

.. code:: programlisting

    device "Alcatel SpeedTouch USB"
        devname "ugen[0-9]+"
        vendor 0x06b9
        product 0x4061
        attach "/usr/local/sbin/modem_run -f /usr/local/libdata/mgmt.o"

Den USB-D?mon aktivieren Sie mit der folgenden Zeile in
``/etc/rc.conf``:

.. code:: programlisting

    usbd_enable="YES"

Wenn die Verbindung beim Start von ppp aufgebaut werden soll, f?gen Sie
die nachstehenden Zeilen als Benutzer ``root`` in ``/etc/rc.conf`` ein:

.. code:: programlisting

    ppp_enable="YES"
    ppp_mode="ddial"
    ppp_profile="adsl"

Verwenden Sie bitte diese Einstellungen zusammen mit der
Beispielkonfiguration in ``ppp.conf`` des Ports
`net/pppoa <http://www.freebsd.org/cgi/url.cgi?ports/net/pppoa/pkg-descr>`__.

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

29.6.2. Die Verwendung von mpd
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Sie k?nnen mpd verwenden, um zu einer Reihe von Diensten, insbesondere
PPTP-Diensten eine Verbindung herzustellen. Sie finden mpd in der
Ports-Sammlung unter
`net/mpd <http://www.freebsd.org/cgi/url.cgi?ports/net/mpd/pkg-descr>`__.
Viele ADSL Modems, wie das Alcatel SpeedTouch™ Home, sind auf einen
PPTP-Tunnel zwischen dem Modem und dem Rechner angewiesen.

Zuerst m?ssen Sie den Port installieren, um danach mpd entsprechend
Ihren Anforderungen und den Vorgaben Ihres Providers konfigurieren zu
k?nnen. Der Port installiert auch einige gut dokumentierte
Beispielkonfigurationsdateien in ``PREFIX/etc/mpd/``. Beachten Sie, dass
*``PREFIX``* hier das Verzeichnis angibt, in das Ihre Ports installiert
werden. Standardm??ig ist dies das Verzeichnis ``/usr/local/``. Ein
kompletter Leitfaden zur Konfiguration von mpd ist im HTML-Format
verf?gbar, sobald der Port installiert ist. Dieser ist in
``PREFIX/share/doc/mpd/`` zu finden. Hier ist eine
Beispielkonfiguration, um mit mpd eine Verbindung zu einem ADSL-Dienst
aufzubauen. Die Konfiguration ist auf zwei Dateien verteilt. Zun?chst
die Datei ``mpd.conf``:

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Dieses Beispiel f?r ``mpd.conf`` funktioniert nur mit mpd 4.x.

.. raw:: html

   </div>

.. code:: programlisting

    default:
        load adsl

    adsl:
        new -i ng0 adsl adsl
        set bundle authname username 
        set bundle password password 
        set bundle disable multilink

        set link no pap acfcomp protocomp
        set link disable chap
        set link accept chap
        set link keep-alive 30 10

        set ipcp no vjcomp
        set ipcp ranges 0.0.0.0/0 0.0.0.0/0

        set iface route default
        set iface disable on-demand
        set iface enable proxy-arp
        set iface idle 0

        open

.. raw:: html

   <div class="calloutlist">

+--------------------------------------+--------------------------------------+
| `|1| <#co-mpd-ex-user>`__            | Der Benutzername, den Sie zur        |
|                                      | Authentifizierung bei Ihrem ISP      |
|                                      | verwenden.                           |
+--------------------------------------+--------------------------------------+
| `|2| <#co-mpd-ex-pass>`__            | Das Passwort, das Sie zur            |
|                                      | Authentifizierung bei Ihrem ISP      |
|                                      | verwenden.                           |
+--------------------------------------+--------------------------------------+

.. raw:: html

   </div>

Die Datei ``mpd.links`` enth?lt Informationen ?ber die Verbindung(en),
die Sie aufbauen m?chten. Eine Beispieldatei ``mpd.links``, die das
vorige Beispiel erg?nzt, wird unten angegeben:

.. code:: programlisting

    adsl:
        set link type pptp
        set pptp mode active
        set pptp enable originate outcall
        set pptp self 10.0.0.1 
        set pptp peer 10.0.0.138 

.. raw:: html

   <div class="calloutlist">

+--------------------------------------+--------------------------------------+
| `|1| <#co-mpd-ex-self>`__            | Die IP-Adresse des FreeBSD-Rechners  |
|                                      | von dem aus Sie mpd verwenden.       |
+--------------------------------------+--------------------------------------+
| `|2| <#co-mpd-ex-peer>`__            | Die IP-Adresse des ADSL-Modems. Das  |
|                                      | Alcatel SpeedTouch™ Home hat die     |
|                                      | Adresse ``10.0.0.138``               |
|                                      | voreingestellt.                      |
+--------------------------------------+--------------------------------------+

.. raw:: html

   </div>

Ein Verbindungsaufbau kann einfach durch Eingabe des folgenden Befehls
als ``root`` gestartet werden:

.. code:: screen

    # mpd -b adsl

Sie k?nnen sich den Status der Verbindung durch folgenden Befehl
anzeigen lassen:

.. code:: screen

    % ifconfig ng0
    ng0: flags=88d1<UP,POINTOPOINT,RUNNING,NOARP,SIMPLEX,MULTICAST> mtu 1500
         inet 216.136.204.117 --> 204.152.186.171 netmask 0xffffffff

Die Verwendung von mpd ist der empfehlenswerteste Weg, um mit FreeBSD
eine Verbindung zu einem ADSL-Dienst aufzubauen.

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

29.6.3. Die Verwendung von pptpclient
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Es ist au?erdem m?glich, mit FreeBSD eine Verbindung zu anderen
PPPoA-Diensten aufzubauen. Dazu wird
`net/pptpclient <http://www.freebsd.org/cgi/url.cgi?ports/net/pptpclient/pkg-descr>`__
verwendet.

Um mit
`net/pptpclient <http://www.freebsd.org/cgi/url.cgi?ports/net/pptpclient/pkg-descr>`__
eine eine Verbindung zu einem DSL-Dienst aufbauen zu k?nnen, m?ssen Sie
den entsprechenden Port bzw. das Paket installieren und die Datei
``/etc/ppp/ppp.conf`` bearbeiten. Sie m?ssen ``root`` sein, um diese
Schritte durchf?hren zu k?nnen. Eine Beispieldatei f?r ``ppp.conf`` ist
weiter unten angegeben. Weitere Informationen zu den Optionen von
``ppp.conf`` bietet die Manual-Seite ppp
`ppp(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ppp&sektion=8>`__:

.. code:: programlisting

    adsl:
     set log phase chat lcp ipcp ccp tun command
     set timeout 0
     enable dns
     set authname username 
     set authkey password 
     set ifaddr 0 0
     add default HISADDR

.. raw:: html

   <div class="calloutlist">

+--------------------------------------+--------------------------------------+
| `|1| <#co-pptp-ex-user>`__           | Der Benutzername f?r den Zugang zu   |
|                                      | den Diensten Ihres ISP.              |
+--------------------------------------+--------------------------------------+
| `|2| <#co-pptp-ex-pass>`__           | Das Passwort f?r Ihren Account.      |
+--------------------------------------+--------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   <div class="warning" xmlns="">

Warnung:
~~~~~~~~

Weil Sie Ihr Passwort in der Datei ``ppp.conf`` in Klartext angeben
m?ssen, sollten Sie sicherstellen, dass niemand den Inhalt dieser Datei
lesen kann. Die folgende Reihe von Befehlen stellt sicher, dass die
Datei nur von ``root`` lesbar ist. Zus?tzliche Informationen bieten die
Manual-Seiten
`chmod(1) <http://www.FreeBSD.org/cgi/man.cgi?query=chmod&sektion=1>`__
und
`chown(8) <http://www.FreeBSD.org/cgi/man.cgi?query=chown&sektion=8>`__:

.. code:: screen

    # chown root:wheel /etc/ppp/ppp.conf
    # chmod 600 /etc/ppp/ppp.conf

.. raw:: html

   </div>

Dies wird einen Tunnel f?r eine PPP-Session zu Ihrem DSL-Router ?ffnen.
Ethernet-DSL-Modems haben eine vorkonfigurierte LAN-IP-Adresse, mit der
Sie eine Verbindung aufbauen. Im Falle des Alcatel SpeedTouch™ Home
handelt es sich dabei um die Adresse ``10.0.0.138``. In der
Dokumentation Ihres Routers sollte angegeben sein, welche Adresse Ihr
Ger?t verwendet. Um den Tunnel zu ?ffnen und eine PPP-Session zu
starten, f?hren Sie bitte folgenden Befehl aus:

.. code:: screen

    # pptp address adsl

.. raw:: html

   <div class="tip" xmlns="">

Tipp:
~~~~~

Vielleicht m?chten Sie ein kaufm?nnisches Und („&“) an das Ende oben
angegebenen Kommandos anf?gen, da pptp sonst den Prompt nicht
zur?ckgibt.

.. raw:: html

   </div>

Ein virtuelles Tunnel-Device ``tun`` wird f?r das Zusammenspiel der
Prozesse pptp und ppp geschaffen. Wenn Sie den Prompt zur?ckerhalten
haben oder der pptp-Prozess das Vorliegen einer Verbindung best?tigt,
k?nnen Sie den Tunnel folgenderma?en ?berpr?fen:

.. code:: screen

    % ifconfig tun0
    tun0: flags=8051<UP,POINTOPOINT,RUNNING,MULTICAST> mtu 1500
            inet 216.136.204.21 --> 204.152.186.171 netmask 0xffffff00
            Opened by PID 918

Wenn Sie nicht in der Lage sein sollten, eine Verbindung aufzubauen,
?berpr?fen Sie die Konfiguration Ihres Routers, den Sie normalerweise
per telnet oder mit einem Web-Browser erreichen k?nnen. Falls dennoch
keine Verbindung zustande kommt, sollten Sie die Ausgabe des Befehls
``pptp`` und die Logdatei ``/var/log/ppp.log`` von ppp nach Hinweisen
auf die Ursache durchsuchen.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------+-------------------------------------+-----------------------------+
| `Zur?ck <pppoe.html>`__?           | `Nach oben <ppp-and-slip.html>`__   | ?\ `Weiter <slip.html>`__   |
+------------------------------------+-------------------------------------+-----------------------------+
| 29.5. PPP over Ethernet (PPPoE)?   | `Zum Anfang <index.html>`__         | ?29.7. SLIP                 |
+------------------------------------+-------------------------------------+-----------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.

.. |1| image:: ./imagelib/callouts/1.png
.. |2| image:: ./imagelib/callouts/2.png
