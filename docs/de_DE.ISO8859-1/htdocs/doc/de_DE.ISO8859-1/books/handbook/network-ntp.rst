==========================================
31.10. Die Uhrzeit mit NTP synchronisieren
==========================================

.. raw:: html

   <div class="navheader">

31.10. Die Uhrzeit mit NTP synchronisieren
`Zur?ck <network-samba.html>`__?
Kapitel 31. Netzwerkserver
?\ `Weiter <network-syslogd.html>`__

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

31.10. Die Uhrzeit mit NTP synchronisieren
------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Beigetragen von Tom Hukins.

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

31.10.1. ?berblick
~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Da die interne Uhrzeit eines Computers nie ganz exakt ist, wurde mit NTP
(*Network Time Protocol*) eine M?glichkeit geschaffen, die exakte
Uhrzeit zu ermitteln und festzulegen.

Viele Internetdienste sind von einer exakten Uhrzeit abh?ngig. Ein
Webserver k?nnte beispielsweise die Anforderung erhalten, eine Datei zu
versenden, wenn sich diese in einer bestimmten Zeitspanne ge?ndert hat.
In einem lokalen Netzwerk ist es unbedingt notwendig, dass Rechner, die
Dateien von einem gemeinsamen Dateiserver beziehen, ihre Uhrzeit
synchronisieren, damit die Zeitstempel der Dateien konstistent bleiben.
Dienste wie
`cron(8) <http://www.FreeBSD.org/cgi/man.cgi?query=cron&sektion=8>`__
f?hren Befehle zu einem bestimmten Zeitpunkt aus. Ist die Uhrzeit nicht
korrekt, kann dies zu Problemen f?hren.

FreeBSD verwendet den
`ntpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ntpd&sektion=8>`__-
NTP-Server, um die genaue Uhrzeit von anderen NTP-Servern abzufragen,
die eigene Systemzeit zu setzen, oder um diese anderen Rechnern
anzubieten.

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

31.10.2. Einen passenden NTP-Server ausw?hlen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Um die Uhrzeit zu synchronisieren, m?ssen Sie sich mit einem NTP-Server
verbinden. Ihr Netzwerkadministrator oder Ihr Internetprovider haben
vielleicht schon einen NTP-Server eingerichtet. Lesen Sie deren
Dokumentation, um dies zu ?berpr?fen. Es gibt im Internet eine `Liste
mit frei zug?nglichen
NTP-Servern <http://support.ntp.org/bin/view/Servers/WebHome>`__, aus
der Sie sich einen in Ihrer N?he gelegenen Server ausw?hlen k?nnen.
Beachten Sie aber auf jeden Fall die Nutzungsbedingungen des
entsprechenden Servers, und fragen Sie um Erlaubnis, wenn dies n?tig
ist.

Die Auswahl von mehreren NTP-Servern kann sinnvoll sein, wenn ein Server
ausf?llt oder falsche Zeiten liefert.
`ntpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ntpd&sektion=8>`__
verwendet die Antworten anderer Server, um zuverl?ssige Server zu
bestimmen, die dann bevorzugt abgefragt werden.

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

31.10.3. NTP unter FreeBSD einrichten
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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

31.10.3.1. NTP aktivieren
^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn Sie Ihre Uhrzeit nur beim Systemstart synchronisieren wollen,
k?nnen Sie
`ntpdate(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ntpdate&sektion=8>`__
verwenden. F?r Desktoprechner, die regelm??ig neu gestartet werden und
keine st?ndige Synchronisation ben?tigen, ist dies akzeptabel. In allen
anderen F?llen sollten Sie jedoch
`ntpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ntpd&sektion=8>`__
verwenden.

Die Ausf?hrung von
`ntpdate(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ntpdate&sektion=8>`__
w?hrend des Systemstarts ist aber auch f?r Rechner, die
`ntpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ntpd&sektion=8>`__
verwenden, sinnvoll.
`ntpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ntpd&sektion=8>`__
passt die Systemzeit nur bei gr??eren Abweichungen an, w?hrend
`ntpdate(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ntpdate&sektion=8>`__
die Zeit immer synchronisiert, egal wie gro? die Differenz zwischen
Systemzeit und korrekter Zeit ist.

Um
`ntpdate(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ntpdate&sektion=8>`__
beim Systemstart zu aktivieren, f?gen Sie den Eintrag
``ntpdate_enable="YES"`` in ``/etc/rc.conf`` ein. Au?erdem m?ssen Sie
alle Server, mit denen Sie sich synchronisieren wollen, sowie alle an
`ntpdate(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ntpdate&sektion=8>`__
zu ?bergebenden Optionen in den ``ntpdate_flags`` angeben.

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

31.10.3.2. NTP einrichten
^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Konfiguration von NTP erfolgt ?ber die Datei ``/etc/ntp.conf``, und
wird in der Hilfeseite
`ntp.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=ntp.conf&sektion=5>`__
beschrieben. Dazu ein einfaches Beispiel:

.. code:: programlisting

    server ntplocal.example.com prefer
    server timeserver.example.org
    server ntp2a.example.net

    driftfile /var/db/ntp.drift

Die Option ``server`` legt die zu verwendenden Server fest, wobei jeder
Server in einer eigenen Zeile steht. Wenn ein Server mit der Option
``prefer`` versehen ist, wie dies hier bei ``ntplocal.example.com`` der
Fall ist, wird dieser Server bevorzugt verwendet. Eine Antwort von einem
bevorzugten Server wird nur dann verworfen, wenn sie signifikant von
denen anderer Server abweicht, ansonsten wird sie ohne Abfrage weiterer
Server verwendet. Die Option ``prefer`` wird gew?hnlich nur f?r sehr
zuverl?ssige und genaue Server verwendet, die ?ber eine spezielle
Hardware zur Zeit?berwachung verf?gen.

Die Option ``driftfile`` legt fest, in welcher Datei die Abweichungen
der Systemuhr protokolliert werden.
`ntpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ntpd&sektion=8>`__
verwendet diese Datei, um die Systemzeit automatisch anzupassen, selbst
wenn kurzzeitig kein NTP-Server zur Synchronisation verf?gbar ist.

Weiterhin legt die Option ``driftfile`` fest, wo Informationen ?ber
fr?here Antworten des von Ihnen verwendeten NTP-Servers gespeichert
werden sollen. Diese Datei enth?lt NTP-interne Informationen, sie sollte
daher von anderen Prozessen nicht ver?ndert werden.

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

31.10.3.3. Den Zugang zu Ihrem NTP-Server beschr?nken
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In der Voreinstellung ist Ihr NTP-Server f?r alle Rechner im Internet
erreichbar. ?ber die Option ``restrict`` in der Datei ``/etc/ntp.conf``
k?nnen Sie den Zugang zu Ihrem Server beschr?nken.

Wenn Sie alle Rechner vom Zugriff auf Ihren NTP-Server ausschlie?en
wollen, f?gen Sie folgende Zeile in ``/etc/ntp.conf`` ein:

.. code:: programlisting

    restrict default ignore

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Durch diesen Eintrag verhindern Sie den Zugriff Ihres Servers auf alle
auf Ihrem System konfigurierten Server. M?ssen Sie Ihren NTP-Server mit
einem externen NTP-Server synchronisieren, m?ssen Sie dies daher
dezidiert zulassen. Lesen Sie in diesem Fall die Manualpage
`ntp.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=ntp.conf&sektion=5>`__.

.. raw:: html

   </div>

Wenn Sie nur Rechnern Ihres eigenen Netzwerks die Synchronisation mit
Ihrem NTP-Server erlauben, gleichzeitig aber verhindern wollen, dass
diese den NTP-Server konfigurieren oder als Server f?r andere Rechner
dienen k?nnen, f?gen Sie folgende Zeile ein:

.. code:: programlisting

    restrict 192.168.1.0 mask 255.255.255.0 nomodify notrap

Bei ``192.168.1.0`` handelt es sich um einen Rechner Ihres Netzwerks.
``255.255.255.0`` ist die Netzmaske Ihres Netzwerks.

``/etc/ntp.conf`` kann verschiedene ``restrict``-Optionen enthalten.
Weiteres erfahren Sie im Abschnitt ``Access Control Support`` der
Hilfeseite
`ntp.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=ntp.conf&sektion=5>`__.

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

31.10.4. Den NTP-Server starten
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Damit der NTP-Server beim Systemstart automatisch gestartet wird, f?gen
Sie den Eintrag ``ntpd_enable="YES"`` in ``/etc/rc.conf`` ein. Wenn Sie
weitere Argumente an
`ntpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ntpd&sektion=8>`__
?bergeben wollen, passen Sie die Option ``ntpd_flags`` in der Datei
``/etc/rc.conf`` entsprechend an.

Um den NTP-Server ohne einen Systemneustart zu starten, rufen Sie
``ntpd`` mit den unter ``ntpd_flags`` in ``/etc/rc.conf`` festgelegten
Parametern auf. Hierzu ein Beispiel:

.. code:: screen

    # ntpd -p /var/run/ntpd.pid

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

31.10.5. ntpd mit einer Einwahlverbindung verwenden
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

`ntpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ntpd&sektion=8>`__
ben?tigt keine st?ndige Internetverbindung. Wenn Sie sich ins Internet
einw?hlen, ist es sinnvoll, zu verhindern, dass NTP-Verkehr eine
Verbindung aufbauen oder aufrechterhalten kann. Wenn Sie user-PPP
verwenden, k?nnen Sie dies in den ``filter``-Direktiven von
``/etc/ppp/ppp.conf`` festlegen. Sehen Sie sich dazu das folgende
Beispiel ein:

.. code:: programlisting

    set filter dial 0 deny udp src eq 123
    # Prevent NTP traffic from initiating dial out
    set filter dial 1 permit 0 0
    set filter alive 0 deny udp src eq 123
    # Prevent incoming NTP traffic from keeping the connection open
    set filter alive 1 deny udp dst eq 123
    # Prevent outgoing NTP traffic from keeping the connection open
    set filter alive 2 permit 0/0 0/0

Weitere Informationen finden Sie im Abschnitt ``PACKET FILTERING`` von
`ppp(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ppp&sektion=8>`__
sowie in den Beispielen unter ``/usr/share/examples/ppp/``.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Einige Internetprovider blockieren Ports mit niedrigen Nummern. In
solchen F?llen funktioniert NTP leider nicht, da Antworten eines
NTP-Servers Ihren Rechner nicht erreichen werden.

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

31.10.6. Weitere Informationen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Weiterf?hrende Dokumentation (im HTML-Format) zum NTP-Server finden Sie
unter ``/usr/share/doc/ntp/``.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------------------------------------------------------------+----------------------------------------+-----------------------------------------------------------------+
| `Zur?ck <network-samba.html>`__?                                                           | `Nach oben <network-servers.html>`__   | ?\ `Weiter <network-syslogd.html>`__                            |
+--------------------------------------------------------------------------------------------+----------------------------------------+-----------------------------------------------------------------+
| 31.9. Mit Samba einen Datei- und Druckserver f?r Microsoft??Windows?-Clients einrichten?   | `Zum Anfang <index.html>`__            | ?31.11. Protokollierung von anderen Hosts mittels ``syslogd``   |
+--------------------------------------------------------------------------------------------+----------------------------------------+-----------------------------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
