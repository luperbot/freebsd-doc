========================================================
31.11. Protokollierung von anderen Hosts mittels syslogd
========================================================

.. raw:: html

   <div class="navheader">

31.11. Protokollierung von anderen Hosts mittels ``syslogd``
`Zur?ck <network-ntp.html>`__?
Kapitel 31. Netzwerkserver
?\ `Weiter <firewalls.html>`__

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

31.11. Protokollierung von anderen Hosts mittels ``syslogd``
------------------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Beigetragen von Tom Rhodes.

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

Die Interaktion mit Systemprotokollen ist ein wichtiger Aspekt, sowohl
was Sicherheit als auch Systemadministration anbelangt. ?berwachen der
Protokolldateien von mehreren Hosts kann sehr unhandlich werden, wenn
diese Hosts ?ber mittlere oder grosse Netze verteilt sind oder wenn sie
Teile von unterschiedlichen Netzwerken sind. In diesen F?llen macht die
Konfiguration der Protokollierung von anderen Hosts diesen Prozess
wesentlich komfortabler.

Die zentralisierte Protokollierung auf einen bestimmten
Protokollierungshost kann manche der administrativen Belastungen der
Protokolldateiadministration reduzieren. Protokolldateiaggregation,
-zusammenf?hrung und -rotation kann an einer zentralen Stelle mit den
FreeBSD-eigenen Werkzeugen wie
`syslogd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=syslogd&sektion=8>`__
und
`newsyslog(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newsyslog&sektion=8>`__
konfiguriert werden. In der folgenden Beispielkonfiguration sammelt Host
``A``, genannt ``logserv.example.com``, Protokollinformationen f?r das
lokale Netzwerk. Host ``B``, genannt ``logclient.example.com`` wird
seine Protokollinformationen an den Server weiterleiten. In realen
Konfigurationen ben?tigen beide Hosts passende Vorw?rts- und
Umkehr-Eintr?ge im DNS oder in ``/etc/hosts``. Andernfalls werden die
Daten vom Server abgelehnt.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

31.11.1. Konfiguration des Protokollierungs-Servers
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Protokollierungs-Server sind Maschinen, die konfiguriert sind,
Protokollinformationen von anderen Hosts zu akzeptieren. In den meisten
F?llen wird dies zur Vereinfachung der Konfiguration eingesetzt, in
anderen F?llen ist es einfach nur ein Schritt in eine bessere
Verwaltung. Was auch immer die Gr?nde sind, ein paar Anforderungen
m?ssen vorher erf?llt sein.

Ein richtig konfigurierter Protokollierungs-Server muss minimal die
folgenden Anforderungen erf?llen:

.. raw:: html

   <div class="itemizedlist">

-  Das Regelwerk der Firewall muss UDP auf Port 514 sowohl auf Client-
   als auch auf Serverseite erlauben;

-  syslogd wurde so konfiguriert, dass es Nachrichten von anderen
   Clientrechnern akzeptiert;

-  Der syslogd-Server und alle Clientrechner m?ssen g?ltige Eintr?ge f?r
   sowohl Vorw?rts- als auch Umkehr-DNS besitzen, oder in ``/etc/hosts``
   korrekt eingetragen sein.

.. raw:: html

   </div>

Um den Protokollierungs-Server zu konfigurieren, muss der Client in
``/etc/syslog.conf`` eingetragen sein und der Verbindungsweg der
Protokollierung muss spezifiziert sein:

.. code:: programlisting

    +logclient.example.com
    *.*     /var/log/logclient.log

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Weitere Informationen zu den verschiedenen unterst?tzten und verf?gbaren
*Verbindungswegen* finden sich in der Manualpage
`syslog.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=syslog.conf&sektion=5>`__.

.. raw:: html

   </div>

Einmal hinzugef?gt, werden alle Nachrichten ?ber den ``Verbindungsweg``
in die zuvor angegebene Datei, ``/var/log/logclient.log`` protokolliert.

Der Server ben?tigt ausserdem die folgenden Zeilen in der
``/etc/rc.conf``:

.. code:: programlisting

    syslogd_enable="YES"
    syslogd_flags="-a logclient.example.com -v -v"

Die erste Option aktiviert den ``syslogd``-Dienst w?hrend des
Systemstarts und die zweite Option erlaubt es, Daten von dem
spezifizierten Client auf diesem Server zu akzeptieren. Die Verwendung
von ``-v -v`` im letzten Teil erh?ht die Anzahl von
Protokollnachrichten. Dies ist sehr hilfreich f?r die Feineinstellung
der Verbindungspfade, da Administratoren auf diese Weise erkennen,
welche Arten von Nachrichten unter welchen Einstellungen protokolliert
werden.

Mehrere ``-a``-Optionen k?nnen angegeben werden, um die Protokollierung
von mehreren Clients zu erlauben. IP-Adressen und ganze Netzbl?cke
k?nnen ebenfalls spezifiziert werden. Lesen Sie dazu die
`syslog(3) <http://www.FreeBSD.org/cgi/man.cgi?query=syslog&sektion=3>`__-Manualpage,
um eine vollst?ndige Liste von m?glichen Optionen zu erhalten.

Zum Schluss muss noch die Protokolldatei erstellt werden. Auf welche
Weise dies geschieht ist nicht wichtig, aber in den meisten F?llen
funktioniert
`touch(1) <http://www.FreeBSD.org/cgi/man.cgi?query=touch&sektion=1>`__
grossartig, wie hier dargestellt:

.. code:: screen

    # touch /var/log/logclient.log

Zu diesem Zeitpunkt sollte der ``syslogd``-Dienst neu gestartet und
?berpr?ft werden:

.. code:: screen

    # service syslogd restart
    # pgrep syslog

Wenn eine PID zur?ckgegeben wird, wurde der Server erfolgreich neu
gestartet und die Clientkonfiguration kann beginnen. Wenn der Server
nicht neu gestartet wurde, suchen Sie im ``/var/log/messages``-Protokoll
nach eventuellen Fehlermeldungen.

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

31.11.2. Konfiguration des Protokollierungs-Clients
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Ein Protokollierungs-Client ist eine Maschine, die
Protokollinformationen an einen Protokollierungs-Server sendet,
zus?tzlich zu ihren lokalen Kopien.

?hnlich wie Protokollierungs-Server m?ssen Clients auch ein paar
minimale Anforderungen erf?llen:

.. raw:: html

   <div class="itemizedlist">

-  `syslogd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=syslogd&sektion=8>`__
   muss so konfiguriert sein, dass es Nachrichten eines bestimmten Typs
   an einen Protokollierungs-Server schickt, welcher diese akzeptieren
   muss;

-  Die Firewall muss UDP-Pakete durch Port 514 erlauben;

-  Sowohl Vorw?rts- als auch Umkehr-DNS muss konfiguriert sein oder es
   m?ssen passende Eintr?ge in ``/etc/hosts`` vorhanden sein.

.. raw:: html

   </div>

Die Clientkonfiguration ist ein bisschen entspannter, verglichen mit der
des Servers. Der Clientrechner muss ebenfalls die folgenden Eintr?ge in
der ``/etc/rc.conf`` besitzen:

.. code:: programlisting

    syslogd_enable="YES"
    syslogd_flags="-s -v -v"

Wie zuvor aktivieren diese Eintr?ge den ``syslogd``-Dienst w?hrend des
Systemstarts und erh?hen die Anzahl der Protokollnachrichten. Die Option
``-s`` verhindert, dass dieser Client Protokolle von anderen Hosts
akzeptiert.

Verbindungspfade beschreiben den Systemteil, f?r den eine Nachricht
generiert wird. Beispielsweise sind ftp und ipfw beides
Verbindungspfade. Wenn Protokollnachrichten f?r diese beiden Dienste
generiert werden, sind diese beiden Werkzeuge normalerweise in jeder
Protokollnachricht enthalten. Verbindungspfade sind mit einer Priorit?t
oder Stufe verbunden, die dazu verwendet wird, zu markieren, wie wichtig
eine Nachricht im Protokoll ist. Die H?ftigste ist ``warning`` und
``info``. Bitte lesen Sie die
`syslog(3) <http://www.FreeBSD.org/cgi/man.cgi?query=syslog&sektion=3>`__
Manualpage, um eine komplette Liste der verf?gbaren Verbindungspfade und
Priorit?ten zu erhalten.

Der Protokollierungs-Server muss in der ``/etc/syslog.conf`` des Clients
eingetragen sein. In diesem Beispiel wird das ``@``-Symbol benutzt, um
Protokolldaten an einen anderen Server zu senden. Der Eintrag sieht wie
folgt aus:

.. code:: programlisting

    *.*               @logserv.example.com

Einmal hinzugef?gt, muss ``syslogd`` neu gestartet werden, damit diese
?nderungen wirksam werden:

.. code:: screen

    # service syslogd restart

Um zu testen, ob Protokollnachrichten ?ber das Netzwerk gesendet werden,
kann
`logger(1) <http://www.FreeBSD.org/cgi/man.cgi?query=logger&sektion=1>`__
auf dem Client benutzt werden, um eine Nachricht an ``syslogd`` zu
schicken:

.. code:: screen

    # logger "Test message from logclient"

Diese Nachricht sollte jetzt sowohl in ``/var/log/messages`` auf dem
Client, als auch in ``/var/log/logclient.log`` auf dem Server vorhanden
sein.

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

31.11.3. Fehlerbehebung beim Protokollierungs-Server
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In bestimmten F?llen ist die Fehlerbehebung notwendig, wenn Nachrichten
nicht auf dem Protokollierungs-Server empfangen werden. Es gibt mehrere
Gr?nde daf?r, jedoch treten am h?ufigsten Probleme bei der
Netzwerkverbindung und beim DNS auf. Um diese F?lle zu ?berpr?fen,
stellen Sie sicher, dass beide Hosts in der Lage sind, sich gegenseitig
?ber den Hostnamen zu erreichen, der in ``/etc/rc.conf`` angegeben ist.
Wenn das funktioniert, ist m?glicherweise eine ?nderung der
``syslogd_flags``-Option in ``/etc/rc.conf`` notwendig.

Im folgenden Beispiel ist ``/var/log/logclient.log`` leer und die
``/var/log/messages``-Dateien enthalten keine Gr?nde f?r den Fehler. Um
die Fehlerausgabe zu erh?hen, ?ndern Sie die ``syslogd_flags``-Option
so, dass diese wie in dem folgenden Beispiel aussieht und initiieren Sie
dann einen Neustart:

.. code:: programlisting

    syslogd_flags="-d -a logclien.example.com -v -v"

.. code:: screen

    # service syslogd restart

Fehlerausgabedaten ?hnlich der Folgenden werden sofort nach dem Neustart
auf dem Bildschirm erscheinen:

.. code:: screen

    logmsg: pri 56, flags 4, from logserv.example.com, msg syslogd: restart
    syslogd: restarted
    logmsg: pri 6, flags 4, from logserv.example.com, msg syslogd: kernel boot file is /boot/kernel/kernel
    Logging to FILE /var/log/messages
    syslogd: kernel boot file is /boot/kernel/kernel
    cvthname(192.168.1.10)
    validate: dgram from IP 192.168.1.10, port 514, name logclient.example.com;
    rejected in rule 0 due to name mismatch.

Es scheint klar zu sein, dass die Nachrichten aufgrund eines
fehlerhaften Namens abgewiesen werden. Nach genauer Untersuchung der
Konfiguration, kommt ein Tippfehler in der folgenden Zeile der
``/etc/rc.conf`` als Fehler in Betracht:

.. code:: programlisting

    syslogd_flags="-d -a logclien.example.com -v -v"

Die Zeile sollte ``logclient`` und nicht ``logclien`` enthalten. Nachdem
die entsprechenden Ver?nderungen gemacht wurden, ist ein Neustart
f?llig, mit den entsprechenden Ergebnissen:

.. code:: screen

    # service syslogd restart
    logmsg: pri 56, flags 4, from logserv.example.com, msg syslogd: restart
    syslogd: restarted
    logmsg: pri 6, flags 4, from logserv.example.com, msg syslogd: kernel boot file is /boot/kernel/kernel
    syslogd: kernel boot file is /boot/kernel/kernel
    logmsg: pri 166, flags 17, from logserv.example.com,
    msg Dec 10 20:55:02 <syslog.err> logserv.example.com syslogd: exiting on signal 2
    cvthname(192.168.1.10)
    validate: dgram from IP 192.168.1.10, port 514, name logclient.example.com;
    accepted in rule 0.
    logmsg: pri 15, flags 0, from logclient.example.com, msg Dec 11 02:01:28 trhodes: Test message 2
    Logging to FILE /var/log/logclient.log
    Logging to FILE /var/log/messages

Zu diesem Zeitpunkt werden die Nachrichten korrekt empfangen und in die
richtige Datei geschrieben.

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

31.11.4. Sicherheitsbedenken
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wie mit jedem Netzwerkdienst, m?ssen Sicherheitsanforderungen in
Betracht gezogen werden, bevor diese Konfiguration umgesetzt wird.
Manchmal enthalten Protokolldateien sensitive Daten ?ber aktivierte
Dienste auf dem lokalen Rechner, Benutzerkonten und Konfigurationsdaten.
Daten, die vom Client an den Server geschickt werden, sind weder
verschl?sselt noch mit einem Passwort gesch?tzt. Wenn ein Bedarf f?r
Verschl?sselung besteht, ist es m?glich,
`security/stunnel <http://www.freebsd.org/cgi/url.cgi?ports/security/stunnel/pkg-descr>`__
zu verwenden, welches die Daten ?ber einen verschl?sselten Tunnel
versendet.

Lokale Sicherheit ist ebenfalls ein Thema. Protokolldateien sind w?hrend
der Verwendung oder nach ihrer Rotation nicht verschl?sselt. Lokale
Benutzer versuchen vielleicht, auf diese Dateien zuzugreifen, um
zus?tzliche Einsichten in die Systemkonfiguration zu erlangen. In diesen
F?llen ist es absolut notwendig, die richtigen Berechtigungen auf diesen
Dateien zu setzen. Das
`newsyslog(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newsyslog&sektion=8>`__-Werkzeug
unterst?tzt das Setzen von Berechtigungen auf gerade erstellte oder
rotierte Protokolldateien. Protokolldateien mit Zugriffsmodus ``600``
sollten verhindern, dass lokale Benutzer darin herumschn?ffeln.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------------+----------------------------------------+----------------------------------+
| `Zur?ck <network-ntp.html>`__?                | `Nach oben <network-servers.html>`__   | ?\ `Weiter <firewalls.html>`__   |
+-----------------------------------------------+----------------------------------------+----------------------------------+
| 31.10. Die Uhrzeit mit NTP synchronisieren?   | `Zum Anfang <index.html>`__            | ?Kapitel 32. Firewalls           |
+-----------------------------------------------+----------------------------------------+----------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
