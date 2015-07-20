==============================
31.2. Der inetd „Super-Server“
==============================

.. raw:: html

   <div class="navheader">

31.2. Der inetd „Super-Server“
`Zur?ck <network-servers.html>`__?
Kapitel 31. Netzwerkserver
?\ `Weiter <network-nfs.html>`__

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

31.2. Der inetd „Super-Server“
------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Beigetragen von Chern Lee.

.. raw:: html

   </div>

.. raw:: html

   <div>

Aktualisiert vom FreeBSD?Documentation Project.

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

31.2.1. ?berblick
~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

`inetd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=inetd&sektion=8>`__
wird manchmal auch als „Internet Super-Server“ bezeichnet, weil er
Verbindungen f?r mehrere Dienste verwaltet. Wenn eine Verbindung
eintrifft, bestimmt inetd, welches Programm f?r die eingetroffene
Verbindung zust?ndig ist, aktiviert den entsprechenden Prozess und
reicht den Socket an ihn weiter (der Socket dient dabei als Standardein-
und -ausgabe sowie zur Fehlerbehandlung). Der Einsatz des inetd-Daemons
an Stelle viele einzelner Daemonen kann auf nicht komplett ausgelasteten
Servern zu einer Verringerung der Systemlast f?hren.

inetd wird vor allem dazu verwendet, andere Daemonen zu aktivieren,
einige Protokolle werden aber auch direkt verwaltet. Dazu geh?ren
chargen, auth, sowie daytime.

Dieser Abschnitt beschreibt die Konfiguration von inetd durch
Kommandozeilenoptionen sowie die Konfigurationsdatei
``/etc/inetd.conf``.

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

31.2.2. Einstellungen
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

inetd wird durch das
`rc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc&sektion=8>`__-System
initialisiert. Die Option ``inetd_enable`` ist in der Voreinstellung
zwar auf ``NO`` gesetzt, sie kann aber in Abh?ngigkeit von der vom
Benutzer bei der Installation gew?hlten Konfiguration von sysinstall
aktiviert werden. Die Verwendung von

.. code:: programlisting

    inetd_enable="YES"

oder

.. code:: programlisting

    inetd_enable="NO"

in ``/etc/rc.conf`` deaktiviert oder startet inetd beim Systemstart.
?ber den Befehl

.. code:: screen

    # service inetd rcvar

k?nnen Sie die aktuelle Konfiguration abfragen.

Weitere Optionen k?nnen ?ber die Option ``inetd_flags`` an inetd
?bergeben werden.

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

31.2.3. Kommandozeilenoptionen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wie die meisten anderen Server-Daemonen l?sst sich auch inetd ?ber
verschiedene Optionen steuern. Eine vollst?ndige Liste dieser Optionen
finden Sie in der Manualpage von
`inetd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=inetd&sektion=8>`__.

Die verschiedenen Optionen k?nnen ?ber die Option ``inetd_flags`` der
Datei ``/etc/rc.conf`` an inetd ?bergeben werden. In der Voreinstellung
hat diese Option den Wert ``-wW -C 60``. Durch das Setzen dieser Werte
wird das TCP-Wrapping f?r alle inetd-Dienste aktiviert. Zus?tzlich kann
eine einzelne IP-Adresse jeden Dienst nur maximal 60 Mal pro Minute
anfordern.

F?r Einsteiger ist es erfreulich, dass diese Parameter in der Regel
nicht angepasst werden m?ssen. Da diese Parameter aber dennoch von
Interesse sein k?nnen (beispielsweise, wenn Sie eine enorme Anzahl von
Verbindungsanfragen erhalten), werden einige dieser einschr?nkenden
Parameter im Folgenden n?her erl?utert. Eine vollst?ndige Auflistung
aller Optionen finden Sie hingegen in
`inetd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=inetd&sektion=8>`__.

.. raw:: html

   <div class="variablelist">

-c maximum
    Legt die maximale Anzahl von parallen Aufrufen eines Dienstes fest;
    in der Voreinstellung gibt es keine Einschr?nkung. Diese Einstellung
    kann f?r jeden Dienst durch Setzen des ``max-child`` -Parameters
    festgelegt werden.

-C rate
    Legt fest, wie oft ein Dienst von einer einzelnen IP-Adresse in
    einer Minute aufgerufen werden kann; in der Voreinstellung gibt es
    keine Einschr?nkung. Dieser Wert kann f?r jeden Dienst durch Setzen
    des Parameters ``max-connections-per-ip-per-minute`` festgelegt
    werden.

-R rate
    Legt fest, wie oft ein Dienst in der Minute aktiviert werden kann;
    in der Voreinstellung sind dies 256 Aktivierungen pro Minute. Ein
    Wert von 0 erlaubt unbegrenzt viele Aktivierungen.

-s maximum
    Legt fest, wie oft ein Dienst in der Minute von einer einzelnen
    IP-Adresse aus aktiviert werden kann; in der Voreinstellung gibt es
    hier keine Beschr?nkung. Diese Einstellung kann f?r jeden Dienst
    durch die Angabe ``max-child-per-ip`` angepasst werden.

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

31.2.4. ``inetd.conf``
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Konfiguration von inetd erfolgt ?ber die Datei ``/etc/inetd.conf``.

Wenn ``/etc/inetd.conf`` ge?ndert wird, kann inetd veranlasst werden,
seine Konfigurationsdatei neu einzulesen.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel 31.1. Die inetd-Konfiguration neu einlesen

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    # service inetd reload

.. raw:: html

   </div>

.. raw:: html

   </div>

Jede Zeile der Konfigurationsdatei beschreibt jeweils einen Daemon.
Kommentare beginnen mit einem „#“. Ein Eintrag der Datei
``/etc/inetd.conf`` hat folgenden Aufbau:

.. code:: programlisting

    service-name
    socket-type
    protocol
    {wait|nowait}[/max-child[/max-connections-per-ip-per-minute[/max-child-per-ip]]]
    user[:group][/login-class]
    server-program
    server-program-arguments

Ein Eintrag f?r den IPv4 verwendenden
`ftpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ftpd&sektion=8>`__-Daemon
k?nnte so aussehen:

.. code:: programlisting

    ftp     stream  tcp     nowait  root    /usr/libexec/ftpd       ftpd -l

.. raw:: html

   <div class="variablelist">

service-name
    Der Dienstname eines bestimmten Daemons. Er muss einem in
    ``/etc/services`` aufgelisteten Dienst entsprechen. In dieser Datei
    wird festgelegt, welchen Port inetd abh?ren muss. Wenn ein neuer
    Dienst erzeugt wird, muss er zuerst in die Datei ``/etc/services``
    eingetragen werden.

socket-type
    Entweder ``stream``, ``dgram``, ``raw``, oder ``seqpacket``.
    ``stream`` muss f?r verbindungsorientierte TCP-Daemonen verwendet
    werden, w?hrend ``dgram`` das UDP-Protokoll verwaltet.

protocol
    Eines der folgenden:

    .. raw:: html

       <div class="informaltable">

    +-------------+---------------------------------------------+
    | Protokoll   | Bedeutung                                   |
    +=============+=============================================+
    | tcp, tcp4   | TCP (IPv4)                                  |
    +-------------+---------------------------------------------+
    | udp, udp4   | UDP (IPv4)                                  |
    +-------------+---------------------------------------------+
    | tcp6        | TCP (IPv6)                                  |
    +-------------+---------------------------------------------+
    | udp6        | UDP (IPv6)                                  |
    +-------------+---------------------------------------------+
    | tcp46       | TCP sowohl unter IPv4 als auch unter IPv6   |
    +-------------+---------------------------------------------+
    | udp46       | UDP sowohl unter IPv4 als auch unter IPv6   |
    +-------------+---------------------------------------------+

    .. raw:: html

       </div>

{wait\|nowait}[/max-child[/max-connections-per-ip-per-minute[/max-child-per-ip]]]
    ``wait|nowait`` gibt an, ob der von inetd aktivierte Daemon seinen
    eigenen Socket verwalten kann oder nicht. ``dgram``-Sockets m?ssen
    die Option ``wait`` verwenden, w?hrend Daemonen mit Stream-Sockets,
    die normalerweise auch aus mehreren Threads bestehen, die Option
    ``nowait`` verwenden sollten. Die Option ``wait`` gibt in der Regel
    mehrere Sockets an einen einzelnen Daemon weiter, w?hrend ``nowait``
    f?r jeden neuen Socket einen Childdaemon erzeugt.

    Die maximale Anzahl an Child-Daemonen, die inetd erzeugen kann, wird
    durch die Option ``max-child`` festgelegt. Wenn ein bestimmter
    Daemon 10 Instanzen ben?tigt, sollte der Wert ``/10`` hinter die
    Option ``nowait`` gesetzt werden. Geben Sie hingegen den Wert ``/0``
    an, gibt es keine Beschr?nkung.

    Zus?tzlich zu ``max-child`` kann die maximale Anzahl von
    Verbindungen eines Rechners mit einem bestimmten Daemon durch zwei
    weitere Optionen beschr?nkt werden. Die Option
    ``max-connections-per-ip-per-minute`` legt die maximale Anzahl von
    Verbindungsversuchen fest, die von einer bestimmten IP-Adresse aus
    unternommen werden k?nnen. Ein Wert von zehn w?rde die maximale
    Anzahl von Verbindungsversuchen einer IP-Adresse mit einem
    bestimmten Dienst auf zehn Versuche in der Minute beschr?nken. Durch
    die Angabe der Option ``max-child-per-ip`` k?nnen Sie hingegen
    festlegen, wie viele Child-Daemonen von einer bestimmten IP-Adresse
    aus gestartet werden k?nnen. Durch diese Optionen lassen sich ein
    absichtlicher oder unabsichtlicher Ressourcenverbrauch sowie die
    Auswirkungen eines ``Denial of Service (DoS)``-Angriffs auf einen
    Rechner begrenzen.

    Sie m?ssen hier entweder ``wait`` oder ``nowait`` angeben. Die
    Angabe von ``max-child``, ``max-connections-per-ip-per-minute`` und
    ``max-child-per-ip`` ist hingegen optional.

    Ein multithread-Daemon vom Streamtyp ohne die Optionen
    ``max-child``, ``max-connections-per-ip-per-minute`` oder
    ``max-child-per-ip`` sieht so aus: ``nowait``

    Der gleiche Daemon mit einer maximal m?glichen Anzahl von 10
    parallelen Daemonen w?rde so aussehen: ``nowait/10``

    Wird zus?tzlich die Anzahl der m?glichen Verbindungen pro Minute f?r
    jede IP-Adresse auf 20 sowie die m?gliche Gesamtzahl von
    Childdaemonen auf 10 begrenzt, so sieht der Eintrag so aus:
    ``nowait/10/20``

    All diese Optionen werden vom
    `fingerd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fingerd&sektion=8>`__-Daemon
    bereits in der Voreinstellung verwendet:

    .. code:: programlisting

        finger stream  tcp     nowait/3/10 nobody /usr/libexec/fingerd fingerd -s

    Will man die maximale Anzahl von Child-Daemonen auf 100 beschr?nken,
    wobei von jeder IP-Adresse aus maximal 5 Child-Daemonen gestartet
    werden d?rfen, verwendet man den folgenden Eintrag:
    ``nowait/100/0/5``.

user
    Der Benutzername, unter dem der jeweilige Daemon laufen soll.
    Meistens laufen Daemonen als User ``root``. Aus Sicherheitsgr?nden
    laufen einige Server aber auch als User ``daemon``, oder als am
    wenigsten privilegierter User ``nobody``.

server-program
    Der vollst?ndige Pfad des Daemons, der eine Verbindung
    entgegennimmt. Wird der Daemon von inetd intern bereitgestellt,
    sollte die Option ``internal`` verwendet werden.

server-program-arguments
    Dieser Eintrag legt (gemeinsam mit ``server-program`` und beginnend
    mit ``argv[0]``), die Argumente fest, die bei der Aktivierung an den
    Daemon ?bergeben werden. Wenn die Anweisung auf der Kommandozeile
    also ``mydaemon -d`` lautet, w?re ``mydaemon -d`` auch der Wert der
    Option ``server program arguments``. Wenn es sich beim Daemon um
    einen internen Dienst handelt, sollte wiederum die Option
    ``internal`` verwendet werden.

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

31.2.5. Sicherheit
~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Abh?ngig von der bei der Installation festgelegten Konfiguration werden
viele der von inetd verwalteten Dienste automatisch aktiviert! Wenn Sie
einen bestimmten Daemon nicht ben?tigen, sollten Sie ihn deaktivieren!
Dazu kommentieren Sie den jeweiligen Daemon in ``/etc/inetd.conf`` mit
einem „#“ aus, um danach die `inetd-Konfiguration neu
einzulesen <network-inetd.html#network-inetd-reread>`__. Einige
Daemonen, zum Beispiel fingerd, sollten generell deaktiviert werden, da
sie zu viele Informationen an einen potentiellen Angreifer liefern.

Einige Daemonen haben unsichere Einstellungen, etwa gro?e oder
nichtexistierende Timeouts f?r Verbindungsversuche, die es einem
Angreifer erlauben, ?ber lange Zeit langsam Verbindungen zu einem
bestimmten Daemon aufzubauen, um dessen verf?gbare Ressourcen zu
verbrauchen. Es ist daher eine gute Idee, diese Daemonen durch die
Optionen ``max-connections-per-ip-per-minute``, ``max-child`` sowie
``max-child-per-ip`` zu beschr?nken, wenn Sie sehr viele
Verbindungsversuche mit Ihrem System registrieren.

TCP-Wrapping ist in der Voreinstellung aktiviert. Lesen Sie
`hosts\_access(5) <http://www.FreeBSD.org/cgi/man.cgi?query=hosts_access&sektion=5>`__,
wenn Sie weitere Informationen zum Setzen von TCP-Beschr?nkungen f?r
verschiedene von inetd aktivierte Daemonen ben?tigen.

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

31.2.6. Verschiedenes
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Bei daytime, time, echo, discard, chargen, und auth handelt es sich um
intern von inetd bereitgestellte Dienste.

Der auth-Dienst bietet Identifizierungsdienste ?ber das Netzwerk an und
ist bis zu einem bestimmten Grad konfigurierbar, w?hrend die meisten
anderen Dienste nur aktiviert oder deaktiviert werden k?nnen.

Eine ausf?hrliche Beschreibung finden Sie in
`inetd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=inetd&sektion=8>`__.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+----------------------------------------+------------------------------------+
| `Zur?ck <network-servers.html>`__?   | `Nach oben <network-servers.html>`__   | ?\ `Weiter <network-nfs.html>`__   |
+--------------------------------------+----------------------------------------+------------------------------------+
| Kapitel 31. Netzwerkserver?          | `Zum Anfang <index.html>`__            | ?31.3. NFS – Network File System   |
+--------------------------------------+----------------------------------------+------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
