==========
29.7. SLIP
==========

.. raw:: html

   <div class="navheader">

29.7. SLIP
`Zur?ck <pppoa.html>`__?
Kapitel 29. PPP und SLIP
?\ `Weiter <mail.html>`__

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

29.7. SLIP
----------

.. raw:: html

   </div>

.. raw:: html

   <div>

Urspr?nglich beigetragen von Satoshi Asami.

.. raw:: html

   </div>

.. raw:: html

   <div>

Mit Beitr?gen von Guy Helmer und Piero Serini.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="warning" xmlns="">

Warnung:
~~~~~~~~

Der folgende Abschnitt ist ausschlie?lich f?r FreeBSD?7.X relevant und
g?ltig.

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

29.7.1. Einrichtung eines SLIP-Clients
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Im Folgenden wird ein Weg beschrieben, SLIP auf einer FreeBSD-Maschine
f?r ein Netzwerk mit festen Hostnamen einzurichten. Bei einer
dynamischen Zuweisung des Hostnamens (das hei?t wenn sich Ihre Adresse
bei jeder Einwahl ?ndert) wird die Einrichtung wahrscheinlich etwas
komplexer aussehen.

Bestimmen Sie zuerst, an welcher seriellen Schnittstelle Ihr Modem
angeschlossen ist. Viele Leute erzeugen einen symbolischen Link, wie
etwa ``/dev/modem``, der auf den wirklichen Ger?tenamen ``/dev/cuadN``
verweist. Damit ist es Ihnen m?glich, vom eigentlichen Ger?tenamen zu
abstrahieren, sollten Sie das Modem einmal an eine andere Schnittstelle
anschlie?en m?ssen. Es kann ziemlich umst?ndlich sein, wenn Sie eine
viele Dateien in ``/etc`` und ``.kermrc``-Dateien, die ?ber das ganze
System verstreut sind, anpassen m?ssen!

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

``/dev/cuau0`` ist ``COM1``, ``/dev/cuau1`` ist ``COM2``, etc.

.. raw:: html

   </div>

Stellen Sie sicher, dass Folgendes in Ihrer Kernelkonfigurationsdatei
steht:

.. code:: programlisting

    device   sl      1

Dieses pseudo-device ist im ``GENERIC`` Kernel enthalten. Falls es von
Ihnen nicht gel?scht wurde, sollten Sie hier kein Problem haben.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

29.7.1.1. Dinge, die Sie nur einmal erledigen m?ssen
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="procedure">

#. Tragen Sie Ihren lokalen Rechner, das Gateway, sowie die Nameserver
   in Ihre Datei ``/etc/hosts`` ein. Diese Datei sieht bei mir so aus:

   .. code:: programlisting

       127.0.0.1               localhost loghost
       136.152.64.181          water.CS.Example.EDU water.CS water
       136.152.64.1            inr-3.CS.Example.EDU inr-3 slip-gateway
       128.32.136.9            ns1.Example.EDU ns1
       128.32.136.12           ns2.Example.EDU ns2

#. Vergewissern Sie sich, dass in der Datei ``/etc/host.conf`` im
   Abschnitt ``hosts:`` ``files`` vor ``dns`` steht. Ohne diese
   Reihenfolge k?nnten lustige Dinge passieren.

#. Editieren Sie die Datei ``/etc/rc.conf``.

   .. raw:: html

      <div class="orderedlist">

   #. Ihren Hostnamen geben Sie an, indem Sie folgende Zeile bearbeiten:

      .. code:: programlisting

          hostname="myname.my.domain"

      Hier sollte der vollst?ndige Internethostname Ihres Rechners
      angegeben werden.

   #. Den Defaultrouter geben Sie durch die Modifikation folgender Zeile
      an:

      .. code:: programlisting

          defaultrouter="NO"

      wird zu:

      .. code:: programlisting

          defaultrouter="slip-gateway"

   .. raw:: html

      </div>

#. Erstellen Sie die Datei ``/etc/resolv.conf``, die Folgendes enth?lt:

   .. code:: programlisting

       domain CS.Example.EDU
       nameserver 128.32.136.9
       nameserver 128.32.136.12

   Wie Sie sehen, werden hiermit die Nameserver angegeben. Nat?rlich
   h?ngen die tats?chlichen Domainnamen und Adressen von Ihren
   Gegebenheiten ab.

#. Legen Sie ein Passwort f?r ``root`` und ``toor`` (sowie f?r alle
   anderen Accounts die kein Passwort haben) fest.

#. Starten Sie Ihren Rechner neu und ?berpr?fen Sie, ob er mir dem
   richtigen Hostnamen startet.

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

29.7.1.2. Aufbau einer SLIP-Verbindung
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="procedure">

#. W?hlen Sie sich ein, geben Sie ``slip`` und am Prompt den Namen Ihres
   Rechners sowie Ihr Passwort ein. Was Sie eingeben m?ssen, h?ngt von
   Ihren Gegebenheiten ab. Wenn Sie Kermit verwenden, k?nnen Sie ein
   Skript ?hnlich dem Folgenden verwenden:

   .. code:: programlisting

       # kermit setup
       set modem hayes
       set line /dev/modem
       set speed 115200
       set parity none
       set flow rts/cts
       set terminal bytesize 8
       set file type binary
       # The next macro will dial up and login
       define slip dial 643-9600, input 10 =>, if failure stop, -
       output slip\x0d, input 10 Username:, if failure stop, -
       output silvia\x0d, input 10 Password:, if failure stop, -
       output ***\x0d, echo \x0aCONNECTED\x0a

   Nat?rlich m?ssen Sie hier Ihren Benutzernamen und Ihr Passwort
   eintragen. Wenn Sie das getan haben, k?nnen Sie am Kermit-Prompt
   einfach ``slip`` eingeben, um sich zu verbinden.

   .. raw:: html

      <div class="note" xmlns="">

   Anmerkung:
   ~~~~~~~~~~

   Es ist generell eine *schlechte* Idee, Ihr Passwort in einer
   unverschl?sselten Textdatei irgendwo im Dateisystem zu speichern. Tun
   Sie dies auf Ihr eigenes Risiko.

   .. raw:: html

      </div>

#. Belassen Sie Kermit so (Sie k?nnen es mit **Ctrl**+**z**
   unterbrechen) und geben Sie als ``root`` ein:

   .. code:: screen

       # slattach -h -c -s 115200 /dev/modem

   Wenn Sie mit ``ping`` Hosts auf der anderen Seite des Routers
   erreichen k?nnen, sind Sie verbunden! Wenn es nicht funktionieren
   sollte, k?nnen Sie versuchen ``-a`` statt ``-c`` als Argument f?r
   ``slattach`` zu verwenden.

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

29.7.1.3. Beenden der Verbindung
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Um ``slattach`` zu beenden, geben Sie Folgendes ein:

.. code:: screen

    # kill -INT `cat /var/run/slattach.modem.pid`

Beachten Sie, dass Sie ``root`` sein m?ssen, um dies durchf?hren zu
k?nnen. Kehren Sie zu ``kermit`` zur?ck (mit Hilfe von ``fg``, wenn Sie
es unterbrochen haben) und beenden Sie dieses Programm (**q**).

`slattach(8) <http://www.FreeBSD.org/cgi/man.cgi?query=slattach&sektion=8>`__
gibt an, dass ``ifconfig sl0 down`` verwendet werden soll, um das
Interface zu deaktivieren, doch das scheint keinen Unterschied zu
machen. (``ifconfig sl0`` gibt dasselbe aus).

Es kann vorkommen, dass Ihr Modem sich weigert, das Tr?gersignal zu
beenden. In diesem Fall starten Sie ``kermit`` einfach neu und beenden
es wieder. Beim zweiten Versuch geht es meist aus.

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

29.7.1.4. L?sungen bei Problemen
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn es nicht funktionieren sollte, k?nnen Sie an die Mailingliste
`freebsd-net <http://lists.FreeBSD.org/mailman/listinfo/freebsd-net>`__
schreiben. ?ber diese Dinge sind Benutzer bisher gestolpert:

.. raw:: html

   <div class="itemizedlist">

-  Nicht ``-c`` oder ``-a`` in ``slattach`` verwenden (Das sollte nicht
   entscheidend sein, aber einige Benutzer haben berichtet, dass dies
   ihre Probleme l?st).

-  Verwendung von ``s10`` statt ``sl0`` (bei einigen Schriftarten kann
   der Unterschied schwer zu erkennen sein).

-  Probieren Sie ``ifconfig sl0``, um den Status Ihrer Schnittstelle
   abzufragen. Das Ergebnis k?nnte beispielsweise so aussehen:

   .. code:: screen

       # ifconfig sl0
       sl0: flags=10<POINTOPOINT>
               inet 136.152.64.181 --> 136.152.64.1 netmask ffffff00

-  Wenn
   `ping(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ping&sektion=8>`__
   die Fehlermeldung no route to host ausgibt, kann die Routingtabelle
   falsch sein. Die Routen k?nnen Sie sich mit dem Kommando
   ``netstat -r`` ansehen:

   .. code:: screen

       # netstat -r
       Routing tables
       Destination      Gateway            Flags     Refs     Use  IfaceMTU    Rtt    Netmasks:

       (root node)
       (root node)

       Route Tree for Protocol Family inet:
       (root node) =>
       default          inr-3.Example.EDU  UG          8   224515  sl0 -      -
       localhost.Exampl localhost.Example. UH          5    42127  lo0 -       0.438
       inr-3.Example.ED water.CS.Example.E UH          1        0  sl0 -      -
       water.CS.Example localhost.Example. UGH        34 47641234  lo0 -       0.438
       (root node)

   Die Zahlen im Beispiel stammen von einer recht ausgelasteten
   Maschine. Die Zahlen auf Ihrem System werden, je nach Netzaktivit?t,
   von den gezeigten abweichen.

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

29.7.2. Einrichtung eines SLIP-Servers
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dieses Dokument bietet Empfehlungen, wie Sie Ihr FreeBSD-System als
SLIP-Server einrichten. Typischerweise bedeutet dies, Ihr System so zu,
konfigurieren, dass beim Login automatisch eine Verbindung f?r entfernte
SLIP-Clients aufgebaut wird.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

29.7.2.1. Voraussetzungen
^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dieser Abschnitt ist ausgesprochen technischer Natur, weshalb
Hintergrundwissen erforderlich ist. Wir gehen davon aus, dass Sie mit
dem TCP/IP Protokoll, insbesondere mit Netzwerk- und
Rechneradressierung, Netzwerkmasken, Subnetzen, Routing und
Routingprotokollen, wie RIP, vertraut sind. Die Konfiguration von
SLIP-Diensten auf einem Einw?hlserver erfordert die Kenntnis dieser
Konzepte. Wenn Sie damit nicht vertraut sein sollten, lesen Sie bitte
Craig Hunt's *TCP/IP Network Administration* publiziert von O'Reilly &
Associates, Inc. (ISBN Nummer 0-937175-82-X) oder die B?cher von Douglas
Comer ?ber das TCP/IP Protokoll.

Wir gehen au?erdem davon aus, dass Sie Ihr(e) Modem(s) eingerichtet
haben und die entsprechenden Systemdateien so konfiguriert haben, dass
Logins durch Ihr Modem zugelassen sind. Wenn Sie Ihr System daf?r noch
nicht vorbereitet haben, lesen Sie bitte `Abschnitt?28.4,
„Einw?hlverbindungen“ <dialup.html>`__, um Ihre Einwahlverbindung zu
konfigurieren. Hilfreich sind auch die Manualpages
`sio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sio&sektion=4>`__ mit
Informationen zum Ger?tetreiber der seriellen Schnittstelle
`ttys(5) <http://www.FreeBSD.org/cgi/man.cgi?query=ttys&sektion=5>`__,
sowie
`gettytab(5) <http://www.FreeBSD.org/cgi/man.cgi?query=gettytab&sektion=5>`__,
`getty(8) <http://www.FreeBSD.org/cgi/man.cgi?query=getty&sektion=8>`__
und
`init(8) <http://www.FreeBSD.org/cgi/man.cgi?query=init&sektion=8>`__
f?r Informationen zur Konfiguration von Logins ?ber ein Modem.
`stty(1) <http://www.FreeBSD.org/cgi/man.cgi?query=stty&sektion=1>`__
bietet Informationen zur Einstellung der Parameter der seriellen
Schnittstelle (etwa von ``clocal`` f?r direkt angeschlossene serielle
Ger?te).

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

29.7.2.2. Ein kurzer ?berblick
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Mit der normal verwendeten Konfiguration funktioniert der
FreeBSD-SLIP-Server folgenderma?en: Ein SLIP-Benutzer w?hlt einen
FreeBSD-SLIP-Server an und meldet sich mit einer speziellen
SLIP-Login-ID ein, wobei ``/usr/sbin/sliplogin`` als Shell dieses
besonderen Accounts dient. Das Programm ``sliplogin`` durchsucht die
Datei ``/etc/sliphome/slip.hosts`` nach einer passenden Zeile f?r diesen
Account. Falls ein Treffer erzielt wird, verbindet es den seriellen
Anschluss mit einem verf?gbaren SLIP-Interface und f?hrt das Shellskript
``/etc/sliphome/slip.login`` aus, um das SLIP-Interface zu
konfigurieren.

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

29.7.2.2.1. Ein Beispiel f?r ein Login eines SLIP-Servers
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn beispielsweise die Kennung eines SLIP-Benutzers, ``Shelmerg`` w?re,
k?nnte der Eintrag des Benutzers ``Shelmerg`` in der Datei
``/etc/master.passwd`` etwa so aussehen:

.. code:: programlisting

    Shelmerg:password:1964:89::0:0:Guy Helmer - SLIP:/usr/users/Shelmerg:/usr/sbin/sliplogin

Wenn sich ``Shelmerg`` anmeldet, wird ``sliplogin`` die Datei
``/etc/sliphome/slip.hosts`` nach einer ?bereinstimmenden
Benutzerkennung durchsuchen. So k?nnte etwa folgende Zeile in
``/etc/sliphome/slip.hosts`` stehen:

.. code:: programlisting

    Shelmerg        dc-slip sl-helmer       0xfffffc00          autocomp

``sliplogin`` wird die passende Zeile finden, den seriellen Anschluss
mit dem n?chsten verf?gbaren SLIP-Interface verbinden und dann
``/etc/sliphome/slip.login`` wie hier dargestellt ausf?hren:

.. code:: programlisting

    /etc/sliphome/slip.login 0 19200 Shelmerg dc-slip sl-helmer 0xfffffc00 autocomp

Wenn alles gut l?uft, wird ``/etc/sliphome/slip.login`` ein ``ifconfig``
f?r das SLIP-Interface durchf?hren, mit dem sich ``sliplogin`` verbunden
hat (in obigem Beispiel ist das slip 0, der als erster Parameter in der
Liste an ``slip.login`` ?bergeben wurde), um die lokale IP-Adresse
(``dc-slip``), die entfernte IP-Adresse (``sl-helmer``), die Netzmaske
des SLIP-Interface (``0xfffffc00``) und alle zus?tzlichen Optionen
(``autocomp``) festzulegen. Wenn etwas schief laufen sollte, bietet,
``sliplogin`` normalerweise informative Meldungen durch den
syslogd-Daemon, der die Meldungen standardm??ig nach
``/var/log/messages`` schreibt (sehen Sie hierzu auch in den
Manual-Seiten f?r
`syslogd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=syslogd&sektion=8>`__
und
`syslog.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=syslog.conf&sektion=5>`__
nach). ?berpr?fen Sie auch ``/etc/syslog.conf``, um zu sehen, was
``syslogd`` aufzeichnet und wo es aufgezeichnet wird.

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

29.7.2.3. Kernelkonfiguration
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Der Standardkernel von FreeBSD (``GENERIC``) bietet bereits
SLIP-Unterst?tzung
(`sl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sl&sektion=4>`__).
Falls Sie einen angepassten Kernel verwenden, m?ssen Sie sicherstellen,
dass Ihre Kernelkonfigurationsdatei folgende Zeile enth?lt:

.. code:: programlisting

    device   sl

In der Voreinstellung leitet Ihr FreeBSD-Rechner keine Pakete weiter.
Wenn Sie Ihren FreeBSD-SLIP-Server als Router einsetzen m?chten, m?ssen
Sie die Datei ``/etc/rc.conf`` bearbeiten und den Wert der Variable
``gateway_enable`` auf ``YES`` setzen. Dadurch ist sichergestellt, dass
die Routingoptionen auch nach einem Neustart erhalten bleiben.

Um die Einstellungen sofort anzuwenden, f?hren Sie den folgenden Befehl
als ``root``-Benutzer aus:

.. code:: screen

    # /etc/rc.d/routing start

Weitere Informationen zur Konfiguration Ihres Kernels, finden Sie in
`Kapitel?9, *Konfiguration des FreeBSD-Kernels* <kernelconfig.html>`__
dieses Handbuches.

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

29.7.2.4. Konfiguration des Sliplogin
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wie bereits erw?hnt, gibt es im Verzeichnis ``/etc/sliphome`` drei
Dateien, die Teil der Konfiguration f?r ``/usr/sbin/sliplogin`` sind
(``sliplogin`` ist in
`sliplogin(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sliplogin&sektion=8>`__
beschrieben): ``slip.hosts``, definiert die SLIP-Benutzer sowie deren
IP-Adresse; ``slip.login``, womit normalerweise nur das SLIP-Interface
konfiguriert wird und (optional) ``slip.logout``, womit die Auswirkungen
von ``slip.login`` r?ckg?ngig gemacht werden, wenn die serielle
Verbindung beendet wird.

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

29.7.2.4.1. Konfiguration der Datei ``slip.hosts``
''''''''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``/etc/sliphome/slip.hosts`` enth?lt Zeilen, die mindestens vier durch
Leerzeichen getrennte Elemente enthalten:

.. raw:: html

   <div class="itemizedlist">

-  Login-Kennung des SLIP-Benutzers

-  Lokale Adresse (lokal f?r den SLIP-Server) der SLIP-Verbindung

-  Entfernte Adresse der SLIP-Verbindung

-  Netzwerkmaske

.. raw:: html

   </div>

Die lokalen und entfernten Adressen k?nnen Hostnamen sein, deren
zugeh?rige IP-Adresse durch die Datei ``/etc/hosts`` oder mithilfe des
Domain Name Service aufgel?st wird. Wie die Adressen aufgel?st werden,
h?ngt von den Einstellungen in ``/etc/nsswitch.conf`` ab. Die
Netzwerkmaske kann ein Name sein, der durch eine Suche in
``/etc/networks`` aufgel?st werden kann. Auf einem Beispielsystem, w?rde
die Datei ``/etc/sliphome/slip.hosts`` folgenderma?en aussehen:

.. code:: programlisting

    #
    # login local-addr      remote-addr     mask            opt1    opt2
    #                                               (normal,compress,noicmp)
    #
    Shelmerg  dc-slip       sl-helmerg      0xfffffc00      autocomp

Am Ende der Zeile stehen eine oder mehrere der folgenden Optionen.

.. raw:: html

   <div class="itemizedlist">

-  ``normal`` – keine Header-Kompression

-  ``compress`` – Header werden komprimiert

-  ``autocomp`` – Header werden komprimiert, sofern die Gegenstelle es
   erlaubt

-  ``noicmp`` – ICMP-Pakete werden deaktiviert („ping“ Pakete werden
   unterdr?ckt, statt die Ihnen zur Verf?gung stehende Bandbreite
   aufzubrauchen)

.. raw:: html

   </div>

Die Auswahl von lokalen und entfernten Adressen f?r Ihre
SLIP-Verbindung, h?ngt davon ab, ob Sie ein TCP/IP-Subnetz reservieren
oder ob Sie „proxy ARP“ auf Ihrem SLIP-Server verwenden (es handelt sich
nicht um „echtes“ proxy ARP, aber dieser Begriff wird in diesem
Abschnitt verwendet, um diesen Sachverhalt zu beschreiben). Wenn Sie
nicht sicher sind, welche Methode Sie w?hlen sollen oder wie IP-Adressen
zugewiesen werden, lesen Sie bitte in den B?chern zum Thema TCP/IP nach,
die als Voraussetzungen f?r SLIP (`Abschnitt?29.7.2.1,
„Voraussetzungen“ <slip.html#slips-prereqs>`__) angegeben worden sind
oder fragen Sie Ihren IP-Netzwerkadministrator.

Wenn Sie f?r Ihre SLIP-Clients ein eigenes Subnetz verwenden, werden Sie
die Nummer des Subnetzes aus der Ihnen zugewiesenen IP-Netzwerknummer
zuteilen und die IP-Adressen Ihrer SLIP-Clients aus diesem Subnetz
verwenden m?ssen. Dann k?nnen Sie eine statische Route zu Ihrem
SLIP-Subnetz ?ber Ihren SLIP-Server auf Ihren n?chsten IP-Router
konfigurieren.

Wenn Sie aber andererseits die „proxy ARP“ Methode verwenden m?chten,
werden Sie die IP-Adressen Ihrer SLIP-Clients aus dem Subnetz Ihres
SLIP-Server nehmen und die Skripte ``/etc/sliphome/slip.login``
``/etc/sliphome/slip.logout`` anpassen m?ssen, damit diese
`arp(8) <http://www.FreeBSD.org/cgi/man.cgi?query=arp&sektion=8>`__ zur
Verwaltung der „proxy ARP“-Eintr?ge in der ARP-Tabelle Ihres
SLIP-Servers verwenden.

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

29.7.2.4.2. Konfiguration von ``slip.login``
''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Eine typische Datei ``/etc/sliphome/slip.login`` sieht folgenderma?en
aus:

.. code:: programlisting

    #!/bin/sh -
    #
    #       @(#)slip.login  5.1 (Berkeley) 7/1/90

    #
    # generic login file for a slip line.  sliplogin invokes this with
    # the parameters:
    #      1        2         3        4          5         6     7-n
    #   slipunit ttyspeed loginname local-addr remote-addr mask opt-args
    #
    /sbin/ifconfig sl$1 inet $4 $5 netmask $6

Diese ``slip.login`` Datei f?hrt lediglich ``ifconfig`` f?r das
entsprechende SLIP-Interface mit den lokalen und entfernten Adressen und
der Netzwerkmaske des SLIP-Interface aus.

Wenn Sie sich daf?r entschieden haben, die „proxy ARP“ Methode zu
verwenden (statt eines separaten Subnetzes f?r Ihre SLIP-Clients) sollte
Ihre Datei ``/etc/sliphome/slip.login`` etwa folgenderma?en aussehen:

.. code:: programlisting

    #!/bin/sh -
    #
    #       @(#)slip.login  5.1 (Berkeley) 7/1/90

    #
    # generic login file for a slip line.  sliplogin invokes this with
    # the parameters:
    #      1        2         3        4          5         6     7-n
    #   slipunit ttyspeed loginname local-addr remote-addr mask opt-args
    #
    /sbin/ifconfig sl$1 inet $4 $5 netmask $6
    # Answer ARP requests for the SLIP client with our Ethernet addr
    /usr/sbin/arp -s $5 00:11:22:33:44:55 pub

Die zus?tzliche Zeile ``arp -s         $5 00:11:22:33:44:55 pub`` in der
Datei ``slip.login`` erzeugt einen ARP-Eintrag in der ARP-Tabelle des
SLIP-Servers. Dieser ARP-Eintrag veranlasst den SLIP-Server mit seiner
Ethernet MAC-Adresse zu antworten, sobald ein anderer IP-Knoten im
Ethernet mit der IP-Adresse des SLIP-Clients Kontakt aufnehmen m?chte.

Wenn Sie das Beispiel von oben verwenden, achten Sie darauf die Ethernet
MAC-Adresse (``00:11:22:33:44:55``) durch die MAC-Adresse der
Ethernetkarte Ihres Systems zu ersetzen. Sonst wird Ihr „proxy ARP“
sicher nicht funktionieren! Sie k?nnen die MAC-Adresse Ihres
SLIP-Servers herausfinden, indem Sie sich die Ausgabe von ``netstat -i``
ansehen. Die zweite Zeile der Ausgabe sollte ungef?hr aussehen wie diese
hier:

.. code:: screen

    ed0   1500  <Link>0.2.c1.28.5f.4a         191923  0   129457     0   116

Dies zeigt an, dass die Ethernet MAC-Adresse dieses Systems
``00:02:c1:28:5f:4a`` lautet. Die Punkte in der Ethernet MAC-Adresse,
die von ``netstat -i`` ausgegeben wird, m?ssen durch Doppelpunkte
ersetzt werden. Bei jeder einstelligen Hexadezimalzahl sollten au?erdem
f?hrende Nullen hinzugef?gt werden, um die Adresse in die Form zu
bringen, die von
`arp(8) <http://www.FreeBSD.org/cgi/man.cgi?query=arp&sektion=8>`__
verlangt wird. Die Manual-Seite von
`arp(8) <http://www.FreeBSD.org/cgi/man.cgi?query=arp&sektion=8>`__
bietet hierzu eine vollst?ndige ?bersicht.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Wenn Sie die Dateien ``/etc/sliphome/slip.login`` und
``/etc/sliphome/slip.logout`` erstellen, m?ssen diese ausf?hrbar gemacht
werden
(``chmod 755 /etc/sliphome/slip.login         /etc/sliphome/slip.logout``),
da ``sliplogin`` auf deren Ausf?hrbarkeit angewiesen ist.

.. raw:: html

   </div>

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

29.7.2.4.3. Konfiguration von ``slip.logout``
'''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Datei\ ``/etc/sliphome/slip.logout`` ist nicht zwingend erforderlich
(au?er Sie verwenden „proxy ARP“), aber falls Sie diese Datei erzeugen
m?chten, ist hier ein Beispiel f?r ein grundlegendes ``slip.logout``
Skript:

.. code:: programlisting

    #!/bin/sh -
    #
    #       slip.logout

    #
    # logout file for a slip line.  sliplogin invokes this with
    # the parameters:
    #      1        2         3        4          5         6     7-n
    #   slipunit ttyspeed loginname local-addr remote-addr mask opt-args
    #
    /sbin/ifconfig sl$1 down

Wenn Sie „proxy ARP“ einsetzen, muss ``/etc/sliphome/slip.logout`` den
ARP-Eintrag f?r den SLIP-Client l?schen:

.. code:: programlisting

    #!/bin/sh -
    #
    #       @(#)slip.logout

    #
    # logout file for a slip line.  sliplogin invokes this with
    # the parameters:
    #      1        2         3        4          5         6     7-n
    #   slipunit ttyspeed loginname local-addr remote-addr mask opt-args
    #
    /sbin/ifconfig sl$1 down
    # Quit answering ARP requests for the SLIP client
    /usr/sbin/arp -d $5

``arp -d $5`` l?scht den ARP-Eintrag, den die „proxy ARP“ ``slip.login``
hinzuf?gte, als der SLIP-Client sich eingeloggt hatte.

Es soll nochmals darauf hingewiesen werden, dass f?r die Datei
``/etc/sliphome/slip.logout`` das Ausf?hrungs-Bit gesetzt werden muss,
nachdem die Datei erstellt worden ist (z.B.
``chmod 755           /etc/sliphome/slip.logout``).

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

29.7.2.5. ?berlegungen zum Routing
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn Sie nicht die „proxy ARP“ Methode benutzen, um Datenpakete zwischen
Ihren SLIP-Clients und dem Rest Ihres Netzwerkes (oder vielleicht dem
Internet) zu routen, werden Sie wahrscheinlich statische Routen zu Ihrem
n?chsten Standardrouter hinzuf?gen m?ssen, um Pakete aus dem Subnetz
Ihres SLIP-Clients ?ber Ihren SLIP-Server weiterzuleiten.

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

29.7.2.5.1. Statische Routen
''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das Hinzuf?gen von statischen Routen zu Ihrem n?chsten Standardrouter
kann problematisch sein (oder unm?glich, wenn Sie nicht die
erforderliche Berechtigung haben...). Wenn Sie in Ihrer Organisation ein
Netzwerk mit mehreren Routern haben, m?ssen einige Router, wie etwa die
von Cisco und Proteon hergestellten, nicht nur mit der statischen Route
zum SLIP-Subnetz konfiguriert werden, sondern es muss ihnen auch
mitgeteilt werden, ?ber welche statischen Routen sie andere Router
informieren sollen. Daher ist einiges an Fachwissen und
Probleml?sungskompetenz erforderlich, um auf statischen Routen
basierendes Routing erfolgreich einzurichten.

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

+-------------------------------+-------------------------------------+--------------------------------------------+
| `Zur?ck <pppoa.html>`__?      | `Nach oben <ppp-and-slip.html>`__   | ?\ `Weiter <mail.html>`__                  |
+-------------------------------+-------------------------------------+--------------------------------------------+
| 29.6. PPP over ATM (PPPoA)?   | `Zum Anfang <index.html>`__         | ?Kapitel 30. Elektronische Post (E-Mail)   |
+-------------------------------+-------------------------------------+--------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
