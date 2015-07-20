==============
15.10. OpenSSH
==============

.. raw:: html

   <div class="navheader">

15.10. OpenSSH
`Zur?ck <ipsec.html>`__?
Kapitel 15. Sicherheit
?\ `Weiter <fs-acl.html>`__

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

15.10. OpenSSH
--------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Beigetragen von Chern Lee.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

OpenSSH stellt Werkzeuge bereit, um sicher auf entfernte Maschinen
zuzugreifen. Die Kommandos ``rlogin``, ``rsh``, ``rcp`` und ``telnet``
k?nnen durch OpenSSH ersetzt werden. Zus?tzlich k?nnen
TCP/IP-Verbindungen sicher durch SSH weitergeleitet (getunnelt) werden.
Mit SSH werden alle Verbindungen verschl?sselt, dadurch wird verhindert,
dass die Verbindung zum Beispiel abgeh?rt oder ?bernommen (*Hijacking*)
werden kann.

OpenSSH wird vom OpenBSD-Projekt gepflegt und basiert auf SSH?v1.2.12
mit allen aktuellen Fixen und Aktualisierungen. OpenSSH ist mit den
SSH-Protokollen der Versionen 1 und 2 kompatibel.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

15.10.1. Vorteile von OpenSSH
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Mit
`telnet(1) <http://www.FreeBSD.org/cgi/man.cgi?query=telnet&sektion=1>`__
oder
`rlogin(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rlogin&sektion=1>`__
werden Daten in einer unverschl?sselten Form ?ber das Netzwerk gesendet.
Daher besteht die Gefahr, das Benutzer/Passwort Kombinationen oder alle
Daten an beliebiger Stelle zwischen dem Client und dem Server abgeh?rt
werden. Mit OpenSSH stehen eine Reihe von Authentifizierungs- und
Verschl?sselungsmethoden zur Verf?gung, um das zu verhindern.

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

15.10.2. Aktivieren von sshd
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Unter FreeBSD entscheidet der Anwender bei einer
``Standard``-Installation, ob der sshd-Daemon aktiviert werden soll. Um
zu ?berpr?fen, ob sshd auf Ihrem System aktiviert ist, suchen Sie in
``rc.conf`` nach der folgenden Zeile:

.. code:: programlisting

    sshd_enable="YES"

Ist diese Zeile vorhanden, wird
`sshd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sshd&sektion=8>`__,
der OpenSSH-D?mon, beim Systemstart automatisch aktiviert. Alternativ
k?nnen Sie OpenSSH auch ?ber das
`rc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc&sektion=8>`__-Skript
``/etc/rc.d/sshd`` starten:

.. code:: screen

    # /etc/rc.d/sshd start

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

15.10.3. SSH Client
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

`ssh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh&sektion=1>`__
arbeitet ?hnlich wie
`rlogin(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rlogin&sektion=1>`__:

.. code:: screen

    # ssh user@example.com
    Host key not found from the list of known hosts.
    Are you sure you want to continue connecting (yes/no)? yes
    Host 'example.com' added to the list of known hosts.
    user@example.com's password: *******

Der Anmeldevorgang wird danach, wie von ``rlogin`` oder ``telnet``
gewohnt, weiterlaufen. SSH speichert einen Fingerabdruck des
Serverschl?ssels. Die Aufforderung, ``yes`` einzugeben, erscheint nur
bei der ersten Verbindung zu einem Server. Weitere Verbindungen zu dem
Server werden gegen den gespeicherten Fingerabdruck des Schl?ssels
gepr?ft und der Client gibt eine Warnung aus, wenn sich der empfangene
Fingerabdruck von dem gespeicherten unterscheidet. Die Fingerabdr?cke
der Version 1 werden in ``~/.ssh/known_hosts``, die der Version 2 in
``~/.ssh/known_hosts2`` gespeichert.

In der Voreinstellung akzeptieren aktuelle OpenSSH-Server nur SSH?v2
Verbindungen. Wenn m?glich, wird Version?2 verwendet, ist dies nicht
m?glich, f?llt der Server auf Version?1 zur?ck. Der Client kann
gezwungen werden, nur eine der beiden Versionen zu verwenden, indem die
Option ``-1`` (f?r die Version?1) oder ``-2`` (f?r die Version?2)
?bergeben wird. Die Unterst?tzung f?r Version?1 ist nur noch aus
Kompatibilit?tsgr?nden zu ?lteren Versionen enthalten.

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

15.10.4. Secure Copy
~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Mit `scp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=scp&sektion=1>`__
lassen sich Dateien analog wie mit
`rcp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rcp&sektion=1>`__ auf
entfernte Maschinen kopieren. Mit ``scp`` werden die Dateien allerdings
in einer sicheren Weise ?bertragen.

.. code:: screen

    #  scp user@example.com:/COPYRIGHT COPYRIGHT
    user@example.com's password:
    COPYRIGHT            100% |*****************************|  4735
    00:00
    #

Da der Fingerabdruck schon im vorigen Beispiel abgespeichert wurde, wird
er bei der Verwendung von ``scp`` in diesem Beispiel ?berpr?ft. Da die
Fingerabdr?cke ?bereinstimmen, wird keine Warnung ausgegeben.

Die Argumente, die ``scp`` ?bergeben werden, gleichen denen von ``cp``
in der Beziehung, dass die ersten Argumente die zu kopierenden Dateien
sind und das letzte Argument den Bestimmungsort angibt. Da die Dateien
?ber das Netzwerk kopiert werden, k?nnen ein oder mehrere Argumente die
Form ``user@host:<path_to_remote_file>`` besitzen.

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

15.10.5. Konfiguration
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die f?r das ganze System g?ltigen Konfigurationsdateien des
OpenSSH-D?mons und des Clients finden sich in dem Verzeichnis
``/etc/ssh``.

Die Client-Konfiguration befindet sich in ``ssh_config``, die des
Servers befindet sich in ``sshd_config``.

Das SSH-System l?sst sich weiterhin ?ber die Anweisungen
``sshd_program`` (Vorgabe ist ``/usr/sbin/sshd``) und ``sshd_flags`` in
``/etc/rc.conf`` konfigurieren.

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

15.10.6. ssh-keygen
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Mit
`ssh-keygen(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-keygen&sektion=1>`__
k?nnen DSA- oder RSA-Schl?ssel f?r einen Benutzer erzeugt werden, die
anstelle von Passw?rtern verwendet werden k?nnen:

.. code:: screen

    % ssh-keygen -t dsa
    Generating public/private dsa key pair.
    Enter file in which to save the key (/home/user/.ssh/id_dsa):
    Created directory '/home/user/.ssh'.
    Enter passphrase (empty for no passphrase):
    Enter same passphrase again:
    Your identification has been saved in /home/user/.ssh/id_dsa.
    Your public key has been saved in /home/user/.ssh/id_dsa.pub.
    The key fingerprint is:
    bb:48:db:f2:93:57:80:b6:aa:bc:f5:d5:ba:8f:79:17 user@host.example.com

`ssh-keygen(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-keygen&sektion=1>`__
erzeugt einen ?ffentlichen und einen privaten Schl?ssel f?r die
Authentifizierung. Der private Schl?ssel wird in ``~/.ssh/id_dsa`` oder
``~/.ssh/id_rsa`` gespeichert, w?hrend sich der ?ffentliche Schl?ssel in
``~/.ssh/id_dsa.pub`` oder ``~/.ssh/id_rsa.pub`` befindet, je nachdem,
ob es sich um einen DSA- oder einen RSA-Schl?ssel handelt. Der
?ffentliche Schl?ssel muss sowohl f?r RSA- als auch f?r DSA-Schl?ssel in
die Datei ``~/.ssh/authorized_keys`` auf dem entfernten Rechner
aufgenommen werden, damit der Schl?ssel funktioniert.

Damit werden Verbindungen zu der entfernten Maschine ?ber SSH-Schl?sseln
anstelle von Passw?rtern authentifiziert.

Wenn bei der Erstellung der Schl?ssel mit
`ssh-keygen(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-keygen&sektion=1>`__
ein Passwort angegeben wurde, wird der Benutzer bei jeder Anmeldung zur
Eingabe des Passworts aufgefordert. Um den Umgang mit SSH-Schl?sseln zu
erleichtern, kann
`ssh-agent(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-agent&sektion=1>`__
die Verwaltung dieser Schl?ssel f?r Sie ?bernehmen. Lesen Sie dazu den
`Abschnitt?15.10.7, „ssh-agent und
ssh-add“ <openssh.html#security-ssh-agent>`__ weiter unten.

.. raw:: html

   <div class="warning" xmlns="">

Warnung:
~~~~~~~~

Die Kommandozeilenoptionen und Dateinamen sind abh?ngig von der
OpenSSH-Version. Die f?r Ihr System g?ltigen Optionen finden Sie in der
Hilfeseite
`ssh-keygen(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-keygen&sektion=1>`__.

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

15.10.7. ssh-agent und ssh-add
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Mit
`ssh-agent(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-agent&sektion=1>`__
und
`ssh-add(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-add&sektion=1>`__
ist es m?glich, SSH-Schl?ssel in den Speicher zu laden, damit die
Passphrase nicht jedesmal eingegeben werden muss.

`ssh-agent(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-agent&sektion=1>`__
?bernimmt die Authentifizierung von ihm geladener privater Schl?ssel.
`ssh-agent(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-agent&sektion=1>`__
sollte nur dazu verwendet werden, ein anderes Programm zu starten,
beispielsweise eine Shell oder einen Window-Manager.

Um
`ssh-agent(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-agent&sektion=1>`__
in einer Shell zu verwenden, muss es mit einer Shell als Argument
aufgerufen werden. Zus?tzlich m?ssen die zu verwaltende Identit?t (durch
`ssh-add(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-add&sektion=1>`__)
sowie deren Passphrase f?r den privaten Schl?ssel ?bergeben werden.
Nachdem dies erledigt ist, kann sich ein Benutzer ?ber
`ssh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh&sektion=1>`__ auf
jedem Rechner anmelden, der einen entsprechenden ?ffentlichen Schl?ssel
besitzt. Dazu ein Beispiel:

.. code:: screen

    % ssh-agent csh
    % ssh-add
    Enter passphrase for /home/user/.ssh/id_dsa:
    Identity added: /home/user/.ssh/id_dsa (/home/user/.ssh/id_dsa)
    %

Um
`ssh-agent(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-agent&sektion=1>`__
unter X11 zu verwenden, m?ssen Sie
`ssh-agent(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-agent&sektion=1>`__
in Ihre ``~/.xinitrc`` aufnehmen. Dadurch k?nnen alle unter X11
gestarteten Programme die Dienste von
`ssh-agent(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-agent&sektion=1>`__
nutzen. Ihre ``~/.xinitrc`` k?nnte dazu etwas so aussehen:

.. code:: programlisting

    exec ssh-agent startxfce4

Dadurch wird bei jedem Start von X11 zuerst
`ssh-agent(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-agent&sektion=1>`__
aufgerufen, das wiederum XFCE startet. Nachdem Sie diese ?nderung
durchgef?hrt haben, m?ssen Sie X11 neu starten. Danach k?nnen Sie mit
`ssh-add(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-add&sektion=1>`__
Ihre SSH-Schl?ssel laden.

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

15.10.8. SSH-Tunnel
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Mit OpenSSH ist es m?glich, einen Tunnel zu erstellen, in dem ein
anderes Protokoll verschl?sselt ?bertragen wird.

Das folgende Kommando erzeugt einen Tunnel f?r telnet:

.. code:: screen

    % ssh -2 -N -f -L 5023:localhost:23 user@foo.example.com
    %

Dabei wurden die folgenden Optionen von ``ssh`` verwendet:

.. raw:: html

   <div class="variablelist">

``-2``
    Erzwingt die Version 2 des Protokolls (Benutzen Sie die Option nicht
    mit langsamen SSH-Servern).

``-N``
    Zeigt an, dass ein Tunnel erstellt werden soll. Ohne diese Option
    w?rde ``ssh`` eine normale Sitzung ?ffnen.

``-f``
    Zwingt ``ssh`` im Hintergrund zu laufen.

``-L``
    Ein lokaler Tunnel wird in der Form
    *``localport:remotehost:remoteport``* angegeben. Die Verbindung wird
    dabei von dem lokalen Port *``localport``* auf einen entfernten
    Rechner weitergeleitet.

``user@foo.example.com``
    Gibt den entfernten SSH-Server an.

.. raw:: html

   </div>

Ein SSH-Tunnel erzeugt ein Socket auf ``localhost`` und dem angegebenen
Port. Jede Verbindung, die auf dem angegebenen Socket aufgemacht wird,
wird dann auf den spezifizierten entfernten Rechner und Port
weitergeleitet.

Im Beispiel wird der Port *``5023``* auf die entfernte Maschine und dort
auf ``localhost`` Port *``23``* weitergeleitet. Da der Port *``23``* f?r
Telnet reserviert ist, erzeugt das eine sichere Telnet-Verbindung durch
einen SSH-Tunnel.

Diese Vorgehensweise kann genutzt werden, um jedes unsichere
TCP-Protokoll wie SMTP, POP3, FTP, usw. weiterzuleiten.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel 15.1. Mit SSH einen sicheren Tunnel f?r SMTP erstellen

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    % ssh -2 -N -f -L 5025:localhost:25 user@mailserver.example.com
    user@mailserver.example.com's password: *****
    % telnet localhost 5025
    Trying 127.0.0.1...
    Connected to localhost.
    Escape character is '^]'.
    220 mailserver.example.com ESMTP

Zusammen mit
`ssh-keygen(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-keygen&sektion=1>`__
und zus?tzlichen Benutzer-Accounts k?nnen Sie leicht benutzbare
SSH-Tunnel aufbauen. Anstelle von Passw?rtern k?nnen Sie Schl?ssel
benutzen und jeder Tunnel kann unter einem eigenen Benutzer laufen.

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

15.10.8.1. Beispiel f?r SSH-Tunnel
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

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

15.10.8.1.1. Sicherer Zugriff auf einen POP3-Server
'''''''''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Nehmen wir an, an Ihrer Arbeitsstelle gibt es einen SSH-Server, der
Verbindungen von au?en akzeptiert. Auf dem Netzwerk Ihrer Arbeitsstelle
soll sich zudem noch ein Mail-Server befinden, der POP3 spricht. Das
Netzwerk oder die Verbindung von Ihrem Haus zu Ihrer Arbeitsstelle ist
unsicher und daher m?ssen Sie Ihre E-Mail ?ber eine gesicherte
Verbindung abholen k?nnen. Die L?sung zu diesem Problem besteht darin,
eine SSH-Verbindung von Ihrem Haus zu dem SSH-Server an Ihrer
Arbeitsstelle aufzubauen, und von dort weiter zum Mail-Server zu
tunneln.

.. code:: screen

    % ssh -2 -N -f -L 2110:mail.example.com:110 user@ssh-server.example.com
    user@ssh-server.example.com's password: ******

Wenn Sie den Tunnel eingerichtet haben, konfigurieren Sie Ihren
Mail-Client so, dass er POP3 Anfragen zu ``localhost`` Port 2110 sendet.
Die Verbindung wird dann sicher zu ``mail.example.com`` weitergeleitet.

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

15.10.8.1.2. Umgehen einer strengen Firewall
''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Einige Netzwerkadministratoren stellen sehr drakonische Firewall-Regeln
auf, die nicht nur einkommende Verbindungen filtern, sondern auch
ausgehende. Es kann sein, dass Sie externe Maschinen nur ?ber die Ports
22 und 80 (SSH und Web) erreichen.

Sie wollen auf einen Dienst, der vielleicht nichts mit Ihrer Arbeit zu
tun hat, wie einen Ogg Vorbis Musik-Server, zugreifen. Wenn der Ogg
Vorbis Server nicht auf den Ports 22 oder 80 l?uft, k?nnen Sie aber
nicht auf ihn zugreifen.

Die L?sung hier ist es, eine SSH-Verbindung zu einer Maschine au?erhalb
der Firewall aufzumachen und durch diese zum Ogg Vorbis Server zu
tunneln.

.. code:: screen

    % ssh -2 -N -f -L 8888:music.example.com:8000 user@unfirewalled-system.example.org
    user@unfirewalled-system.example.org's password: *******

Konfigurieren Sie Ihren Client so, dass er ``localhost`` und Port 8888
benutzt. Die Verbindung wird dann zu ``music.example.com`` Port 8000
weitergeleitet und Sie haben die Firewall erfolgreich umgangen.

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

15.10.9. Die Option ``AllowUsers``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Es ist in der Regel ein gute Idee, festzulegen, welche Benutzer sich von
welchem Rechner aus anmelden k?nnen. Dies l?sst sich beispielsweise ?ber
die Option ``AllowUsers`` festlegen. Soll sich etwa nur ``root`` vom
Rechner mit der IP-Adresse ``192.168.1.32`` aus einw?hlen d?rfen, w?rden
Sie folgenden Eintrag in ``/etc/ssh/sshd_config`` aufnehmen:

.. code:: programlisting

    AllowUsers root@192.168.1.32

Damit sich ``admin`` von jedem Rechner aus anmelden kann, geben Sie nur
den Benutzernamen an:

.. code:: programlisting

    AllowUsers admin

Sie k?nnen auch mehrere Benutzer in einer Zeile auff?hren:

.. code:: programlisting

    AllowUsers root@192.168.1.32 admin

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Nur ein Benutzer, der in dieser Liste aufgef?hrt ist, darf sich auf
diesem Rechner anmelden.

.. raw:: html

   </div>

Nachdem Sie ``/etc/ssh/sshd_config`` angepasst haben, muss
`sshd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sshd&sektion=8>`__
seine Konfigurationsdateien neu einlesen. Dazu geben Sie Folgendes ein:

.. code:: screen

    # /etc/rc.d/sshd reload

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

15.10.10. Weiterf?hrende Informationen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

`OpenSSH <http://www.openssh.com/>`__

`ssh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh&sektion=1>`__
`scp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=scp&sektion=1>`__
`ssh-keygen(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-keygen&sektion=1>`__
`ssh-agent(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-agent&sektion=1>`__
`ssh-add(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-add&sektion=1>`__
`ssh\_config(5) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh_config&sektion=5>`__

`sshd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sshd&sektion=8>`__
`sftp-server(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sftp-server&sektion=8>`__
`sshd\_config(5) <http://www.FreeBSD.org/cgi/man.cgi?query=sshd_config&sektion=5>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------+---------------------------------+---------------------------------------------------+
| `Zur?ck <ipsec.html>`__?   | `Nach oben <security.html>`__   | ?\ `Weiter <fs-acl.html>`__                       |
+----------------------------+---------------------------------+---------------------------------------------------+
| 15.9. VPNs mit IPsec?      | `Zum Anfang <index.html>`__     | ?15.11. Zugriffskontrolllisten f?r Dateisysteme   |
+----------------------------+---------------------------------+---------------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
