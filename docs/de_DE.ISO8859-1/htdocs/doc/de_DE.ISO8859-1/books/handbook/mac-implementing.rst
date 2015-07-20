===========================================
17.15. Beispiel 1: Nagios in einer MAC Jail
===========================================

.. raw:: html

   <div class="navheader">

17.15. Beispiel 1: Nagios in einer MAC Jail
`Zur?ck <mac-lomac.html>`__?
Kapitel 17. Verbindliche Zugriffskontrolle
?\ `Weiter <mac-userlocked.html>`__

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

17.15. Beispiel 1: Nagios in einer MAC Jail
-------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die folgende Demonstration setzt eine sichere Umgebung mithilfe
verschiedener MAC Module und sorgf?ltig konfigurierter Richtlinien um.
Es handelt sich jedoch nur um einen Test und sollte nicht als Antwort
auf jedes Problem in Fragen Sicherheit gesehen werden. Eine Richtlinie
nur umzusetzen und dann einfach laufen zu lassen, funktioniert nie und
kann eine echte Arbeitsumgebung in eine Katastrophe st?rzen.

Bevor es losgeht, mu? jedes Dateisystem mit der Option ``multilabel``,
wie weiter oben beschrieben, markiert werden. Dies nicht zu tun, f?hrt
zu Fehlern. Au?erdem m?ssen die Ports
`net-mngt/nagios-plugins <http://www.freebsd.org/cgi/url.cgi?ports/net-mngt/nagios-plugins/pkg-descr>`__,
`net-mngt/nagios <http://www.freebsd.org/cgi/url.cgi?ports/net-mngt/nagios/pkg-descr>`__
und
`www/apache22 <http://www.freebsd.org/cgi/url.cgi?ports/www/apache22/pkg-descr>`__
installiert und konfiguriert sein, so dass sie ordentlich laufen.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

17.15.1. Erstellen einer Nutzerklasse ``insecure``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Beginnen wir die Prozedur mit dem Hinzuf?gen einer Nutzerklasse in der
Datei ``/etc/login.conf``:

.. code:: programlisting

    insecure:\
    :copyright=/etc/COPYRIGHT:\
    :welcome=/etc/motd:\
    :setenv=MAIL=/var/mail/$,BLOCKSIZE=K:\
    :path=~/bin:/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin--
    :manpath=/usr/share/man /usr/local/man:\
    :nologin=/usr/sbin/nologin:\
    :cputime=1h30m:\
    :datasize=8M:\
    :vmemoryuse=100M:\
    :stacksize=2M:\
    :memorylocked=4M:\
    :memoryuse=8M:\
    :filesize=8M:\
    :coredumpsize=8M:\
    :openfiles=24:\
    :maxproc=32:\
    :priority=0:\
    :requirehome:\
    :passwordtime=91d:\
    :umask=022:\
    :ignoretime@:\
    :label=biba/10(10-10):

Zus?tzlich f?gen wir beim Standardnutzer folgende Zeile hinzu:

.. code:: programlisting

    :label=biba/high:

Anschlie?end mu? die Datenbank neu erstellt werden:

.. code:: screen

    # cap_mkdb /etc/login.conf

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

17.15.2. Boot-Konfiguration
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Starten Sie den Rechner noch nicht neu. F?gen Sie zun?chst noch die
folgenden Zeilen in die Datei ``/boot/loader.conf`` ein, damit die
ben?tigten Module w?hrend des Systemstarts geladen werden:

.. code:: programlisting

    mac_biba_load="YES"
    mac_seeotheruids_load="YES"

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

17.15.3. Nutzer einrichten
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Ordnen Sie den Superuser ``root`` der Klasse ``default`` zu:

.. code:: screen

    # pw usermod root -L default

Alle Nutzerkonten, die weder ``root`` noch Systemkonten sind, brauchen
nun eine Loginklasse, da sie sonst keinen Zugriff auf sonst ?bliche
Befehle erhalten, wie bspw.
`vi(1) <http://www.FreeBSD.org/cgi/man.cgi?query=vi&sektion=1>`__. Das
folgende ``sh`` Skript wird diese Aufgabe erledigen:

.. code:: screen

    # for x in `awk -F: '($3 >= 1001) && ($3 != 65534) { print $1 }' \
          /etc/passwd`; do pw usermod $x -L default; done;

Verschieben Sie die Nutzer ``nagios`` und ``www`` in die ``insecure``
Klasse:

.. code:: screen

    # pw usermod nagios -L insecure

.. code:: screen

    # pw usermod www -L insecure

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

17.15.4. Die Kontextdatei erstellen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Nun mu? eine Kontextdatei erstellt werden. Die folgende Beispieldatei
soll dazu in ``/etc/policy.contexts`` gespeichert werden:

.. code:: programlisting

    # This is the default BIBA policy for this system.

    # System:
    /var/run                        biba/equal
    /var/run/*                      biba/equal

    /dev                            biba/equal
    /dev/*                          biba/equal

    /var                biba/equal
    /var/spool                      biba/equal
    /var/spool/*                    biba/equal

    /var/log                        biba/equal
    /var/log/*                      biba/equal

    /tmp                biba/equal
    /tmp/*                  biba/equal
    /var/tmp                biba/equal
    /var/tmp/*              biba/equal

    /var/spool/mqueue               biba/equal
    /var/spool/clientmqueue         biba/equal

    # For Nagios:
    /usr/local/etc/nagios
    /usr/local/etc/nagios/*         biba/10

    /var/spool/nagios               biba/10
    /var/spool/nagios/*             biba/10

    # For apache
    /usr/local/etc/apache           biba/10
    /usr/local/etc/apache/*         biba/10

Die Richtlinie erzwingt Sicherheit, indem der Informationsflu?
Einschr?nkungen unterworfen wird. In der vorliegenden Konfiguration kann
kein Nutzer, weder ``root`` noch andere, auf Nagios zugreifen.
Konfigurationsdateien und die Prozesse, die Teil von Nagios sind, werden
durch unsere MAC vollst?ndig abgegrenzt.

Die Kontextdatei kann nun vom System eingelesen werden, indem folgender
Befehl ausgef?hrt wird:

.. code:: screen

    # setfmac -ef /etc/policy.contexts /
    # setfmac -ef /etc/policy.contexts /

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Das obenstehende Dateisystem-Layout kann, je nach Umgebung, sehr
unterschiedlich aussehen. Au?erdem mu? es auf jedem einzelnen
Dateisystem ausgef?hrt werden.

.. raw:: html

   </div>

In die Datei ``/etc/mac.conf`` m?ssen nun noch diese ?nderungen
eingetragen werden:

.. code:: programlisting

    default_labels file ?biba
    default_labels ifnet ?biba
    default_labels process ?biba
    default_labels socket ?biba

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

17.15.5. Netzwerke einbinden
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Tragen Sie die folgende Zeile in die Datei ``/boot/loader.conf`` ein:

.. code:: programlisting

    security.mac.biba.trust_all_interfaces=1

Und das Folgende geh?rt in Datei ``rc.conf`` zu den Optionen f?r die
Netzwerkkarte. Falls die Netzwerkverbindung(-en) via DHCP konfiguriert
werden, mu? man dies nach jedem Systemstart eigenh?ndig nachtragen:

.. code:: programlisting

    maclabel biba/equal

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

17.15.6. Testen der Konfiguration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Versichern Sie sich, dass der Webserver und Nagios nicht automatisch
geladen werden und starten Sie den Rechner neu. Pr?fen Sie nun, ob
``root`` wirklich keinen Zugriff auf die Dateien im
Konfigurationsverzeichnis von Nagios hat. Wenn ``root`` den Befehl
`ls(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ls&sektion=1>`__ auf
``/var/spool/nagios`` ausf?hren kann, ist irgendwas schief gelaufen. Es
sollte ein permission denied Fehler ausgegeben werden.

Wenn alles gut aussieht, k?nnen Nagios, Apache und Sendmail gestartet
werden - allerdings auf eine Weise, die unserer Richtlinie gerecht wird.
Zum Beispiel durch die folgenden Kommandos:

.. code:: screen

    # cd /etc/mail && make stop && \
    setpmac biba/equal make start && setpmac biba/10\(10-10\) apachectl start && \
    setpmac biba/10\(10-10\) /usr/local/etc/rc.d/nagios.sh forcestart

Versichern Sie sich lieber doppelt, dass alles ordentlich l?uft. Wenn
nicht, pr?fen Sie die Logs und Fehlermeldungen. Verwenden Sie das
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
Werkzeug um die Sicherheitsrichtlinie
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
zu deaktivieren und versuchen Sie dann alles noch einmal zu starten.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Der Superuser kann den Vollzug der Richtlinie schalten und die
Konfiguration ohne Furcht ver?ndern. Folgender Befehl stuft eine neu
gestartete Shell herunter:

.. code:: screen

    # setpmac biba/10 csh

Um dies zu vermeiden, werden die Nutzer durch
`login.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=login.conf&sektion=5>`__
eingeschr?nkt. Wenn
`setpmac(8) <http://www.FreeBSD.org/cgi/man.cgi?query=setpmac&sektion=8>`__
einen Befehl au?erhalb der definierten Schranken ausf?hren soll, wird
ein Fehler zur?ckgeliefert. In so einem Fall mu? ``root`` auf
``biba/high(high-high)`` gesetzt werden.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------+-------------------------------+---------------------------------------+
| `Zur?ck <mac-lomac.html>`__?   | `Nach oben <mac.html>`__      | ?\ `Weiter <mac-userlocked.html>`__   |
+--------------------------------+-------------------------------+---------------------------------------+
| 17.14. Das MAC Modul LOMAC?    | `Zum Anfang <index.html>`__   | ?17.16. Beispiel 2: User Lock Down    |
+--------------------------------+-------------------------------+---------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
