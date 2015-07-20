==================================
31.8. FTP – File Transfer Protocol
==================================

.. raw:: html

   <div class="navheader">

31.8. FTP – File Transfer Protocol
`Zur?ck <network-apache.html>`__?
Kapitel 31. Netzwerkserver
?\ `Weiter <network-samba.html>`__

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

31.8. FTP – File Transfer Protocol
----------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Beigetragen von Murray Stokely.

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

31.8.1. ?berblick
~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das File Transfer Protocol (FTP) erm?glicht auf einfache Art und Weise
den Dateiaustausch mit einem FTP-Server. Der FTP-Server ftpd ist bei
FreeBSD bereits im Basisystem enthalten. Daher sind Konfiguration und
Betrieb eines FTP-Servers unter FreeBSD relativ einfach.

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

31.8.2. Konfiguration
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Der wichtigste Punkt ist hier die Entscheidung dar?ber, welche Benutzer
auf Ihren FTP-Server zugreifen d?rfen. Ein FreeBSD-System verf?gt ?ber
diverse Systembenutzerkonten, um einzelnen Daemonen den Zugriff auf das
System zu erm?glichen. Anonyme Benutzer sollten sich allerdings nicht
?ber diese Benutzerkonten anmelden d?rfen. Die Datei ``/etc/ftpusers``
enth?lt alle Benutzer, die vom FTP-Zugriff ausgeschlossen sind. In der
Voreinstellung gilt dies auch die gerade erw?hnten Systembenutzerkonten.
Sie k?nnen ?ber diese Datei weitere Benutzer vom FTP-Zugriff
ausschlie?en.

Sie k?nnen den Zugriff f?r einige Benutzer einschr?nken, ohne FTP
komplett zu verbieten. Dazu passen Sie ``/etc/ftpchroot`` entsprechend
an. Diese Datei enth?lt Benutzer und Gruppen sowie die f?r sie geltenden
FTP-Einschr?nkungen und wird in
`ftpchroot(5) <http://www.FreeBSD.org/cgi/man.cgi?query=ftpchroot&sektion=5>`__
ausf?hrlich beschrieben.

Wenn Sie einen anonymen FTP-Zugriff auf Ihren Server erm?glichen wollen,
m?ssen Sie den Benutzer ``ftp`` auf Ihrem FreeBSD-System anlegen. Danach
k?nnen sich Benutzer mit dem Benutzernamen ``ftp`` oder ``anonymous``
auf Ihrem FTP-Server anmelden. Das Passwort ist dabei beliebig
(allerdings wird dazu in der Regel eine E-Mail-Adresse verwendet).
Meldet sich ein anonymer Benutzer an, aktiviert der FTP-Server
`chroot(2) <http://www.FreeBSD.org/cgi/man.cgi?query=chroot&sektion=2>`__,
um den Zugriff auf das Heimatverzeichnis des Benutzers ``ftp`` zu
beschr?nken.

Es gibt zwei Textdateien, deren Inhalt Sie bei der Anmeldung an Ihrem
FTP-Server anzeigen lassen k?nnen. Der Inhalt von ``/etc/ftpwelcome``
wird angezeigt, bevor der Login-Prompt erscheint. Nach einer
erfolgreichen Anmeldung wird der Inhalt von ``/etc/ftpmotd`` angezeigt.
Beachten Sie aber, dass es dabei um einen Pfad relativ zur Umgebung des
anzumeldenden Benutzers handelt. Bei einer anonymen Anmeldung w?rde also
die Datei ``~ftp/etc/ftpmotd`` angezeigt.

Nachdem Sie den FTP-Server konfiguriert haben, m?ssen Sie Ihn in
``/etc/inetd.conf`` aktivieren. Dazu m?ssen Sie lediglich das
Kommentarsymbol „#“ am Beginn der bereits vorhandenen ftpd-Zeile
entfernen:

.. code:: programlisting

    ftp   stream  tcp nowait  root    /usr/libexec/ftpd   ftpd -l

Nachdem Sie diese ?nderung durchgef?hrt haben, m?ssen Sie, wie in
`Beispiel?31.1, „Die inetd-Konfiguration neu
einlesen“ <network-inetd.html#network-inetd-reread>`__ beschrieben, die
inetd-Konfiguration neu einlesen. Lesen Sie bitte Abschnitt
`Abschnitt?31.2.2,
„Einstellungen“ <network-inetd.html#network-inetd-settings>`__ des
Handbuchs f?r weitere Informationen zur Aktivierung von inetd auf Ihren
System.

Alternativ k?nnen Sie auch nur den ftpd-Server starten. In diesem Fall
ist es ausreichend, die entsprechende Variable in der Datei
``/etc/rc.conf`` zu setzen:

.. code:: programlisting

    ftpd_enable="YES"

Nachdem Sie diese Variable gesetzt haben, wird k?nftig beim Systemstart
nur der FTP-Server gestartet. Alternativ k?nnen Sie den Server auch
manuell starten, indem Sie als Benutzer ``root`` den folgenden Befehl
ausf?hren:

.. code:: screen

    # service ftpd start

Danach k?nnen Sie sich auf Ihrem FTP-Server anmelden:

.. code:: screen

    % ftp localhost

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

31.8.3. Wartung
~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Der ftpd-Daemon verwendet
`syslog(3) <http://www.FreeBSD.org/cgi/man.cgi?query=syslog&sektion=3>`__,
um Protokolldateien zu erstellen. In der Voreinstellung werden alle FTP
betreffenden Nachrichten in die Datei ``/var/log/xferlog`` geschrieben.
Dies l?sst sich aber durch das Einf?gen der folgenden Zeile in
``/etc/syslog.conf`` ?ndern:

.. code:: programlisting

    ftp.info      /var/log/xferlog

Beachten Sie, dass mit dem Betrieb eines anonymen FTP-Servers
verschiedene Sicherheitsrisiken verbunden sind. Problematisch ist hier
vor allem die Erlaubnis zum anonymen Upload von Dateien. Dadurch k?nnte
Ihr Server zur Verbreitung von illegaler oder nicht lizensierter
Software oder noch Schlimmeren missbraucht werden. Wollen Sie anonyme
Uploads dennoch erlauben, sollten Sie die Zugriffsrechte so setzen, dass
solche Dateien erst nach Ihrer Zustimmung von anderen Benutzern
heruntergeladen werden k?nnen.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------+----------------------------------------+--------------------------------------------------------------------------------------------+
| `Zur?ck <network-apache.html>`__?   | `Nach oben <network-servers.html>`__   | ?\ `Weiter <network-samba.html>`__                                                         |
+-------------------------------------+----------------------------------------+--------------------------------------------------------------------------------------------+
| 31.7. Der Apache HTTP-Server?       | `Zum Anfang <index.html>`__            | ?31.9. Mit Samba einen Datei- und Druckserver f?r Microsoft??Windows?-Clients einrichten   |
+-------------------------------------+----------------------------------------+--------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
