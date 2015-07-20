=======================================================================================
31.9. Mit Samba einen Datei- und Druckserver f?r Microsoft??Windows?-Clients einrichten
=======================================================================================

.. raw:: html

   <div class="navheader">

31.9. Mit Samba einen Datei- und Druckserver f?r
Microsoft??Windows?-Clients einrichten
`Zur?ck <network-ftp.html>`__?
Kapitel 31. Netzwerkserver
?\ `Weiter <network-ntp.html>`__

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

31.9. Mit Samba einen Datei- und Druckserver f?r Microsoft??Windows?-Clients einrichten
---------------------------------------------------------------------------------------

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

31.9.1. ?berblick
~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Samba ist ein beliebtes Open Source-Softwarepaket, das es Ihnen
erm?glicht, einen Datei- und Druckserver f?r Microsoft??Windows?-Clients
einzurichten. Clients k?nnen sich dadurch mit einem FreeBSD-System
verbinden und dessen Speicherplatz oder dessen Drucker verwenden. Dies
genauso, als wenn es sich um lokale Drucker oder Festplatten handeln
w?rde.

Samba sollte als Softwarepaket auf Ihren Installationsmedien vorhanden
sein. Wenn Sie Samba noch nicht installiert haben, k?nnen Sie dies
jederzeit ?ber den Port oder das Paket
`net/samba34 <http://www.freebsd.org/cgi/url.cgi?ports/net/samba34/pkg-descr>`__
nachholen.

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

31.9.2. Konfiguration
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Standardkonfigurationsdatei von Samba hei?t
``/usr/local/share/examples/samba34/smb.conf.default``. Diese Datei muss
nach ``/usr/local/etc/smb.conf`` kopiert und angepasst werden, bevor
Samba verwendet werden kann.

Die Datei ``smb.conf`` enth?lt Laufzeitinformationen f?r Samba,
beispielsweise Druckerdefinitionen oder *filesystem shares*, also
Bereiche des Dateisystems, die Sie mit Windows?-Clients teilen wollen.
Die Konfiguration der Datei ``smb.conf`` erfolgt webbasiert ?ber das im
Samba-Paket enthaltene Programm swat.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

31.9.2.1. Das Samba Web Administration Tool (SWAT) verwenden
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das *Samba Web Administration Tool* (SWAT) wird als Daemon von inetd
aktiviert. Daher m?ssen Sie inetd, wie in `Abschnitt?31.2, „Der inetd
„Super-Server““ <network-inetd.html>`__ beschrieben, aktivieren und die
folgende Zeile in ``/etc/inetd.conf`` entfernen, bevor Sie swat zur
Konfiguration von Samba verwenden k?nnen:

.. code:: programlisting

    swat   stream  tcp     nowait/400      root    /usr/local/sbin/swat    swat

Wie bereits in `Beispiel?31.1, „Die inetd-Konfiguration neu
einlesen“ <network-inetd.html#network-inetd-reread>`__ beschrieben,
m?ssen Sie die inetd-Konfiguration neu einlesen, nachdem Sie diese
?nderung durchgef?hrt haben.

Nachdem swat in der Datei ``inetd.conf`` aktiviert wurde, rufen Sie in
Ihrem Internetbrowser die Adresse ``http://localhost:901`` auf und
melden sich mit dem ``root``-Benutzerkonto an.

Nachdem Sie sich erfolgreich angemeldet haben, wird die
Hauptkonfigurationseite von Samba geladen. Sie k?nnen nun die
Dokumentation lesen, oder durch einen Klick auf die Globals-Karteikarte
mit der Konfiguration beginnen. Die Einstellungen, die Sie hier
vornehmen k?nnen, entsprechen denen des Abschnitts ``[global]`` von
``/usr/local/etc/smb.conf``.

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

31.9.2.2. Globale Einstellungen
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Unabh?ngig davon, ob Sie swat verwenden, oder
``/usr/local/etc/smb.conf`` direkt editieren, sollten Sie zuerst
folgende Einstellungen anpassen:

.. raw:: html

   <div class="variablelist">

``workgroup``
    Der NT-Dom?nenname oder der Arbeitsgruppenname der Rechner, die auf
    den Server Zugriff haben sollen.

``netbios name``
    Legt den NetBIOS-Namen fest, unter dem der Samba-Server bekannt ist.
    In der Regel handelt es sich dabei um den ersten Teil des DNS-Namens
    des Servers.

``server string``
    Legt die Beschreibung fest, die angezeigt werden soll, wenn mit
    ``net view`` oder ?ber andere Netzwerkprogramme Informationen ?ber
    den Server angefordert werden.

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

31.9.2.3. Samba absichern
^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Zwei der wichtigsten Einstellungen in ``/usr/local/etc/smb.conf``
betreffen das zu verwendende Sicherheitsmodell sowie das
Backend-Passwortformat f?r die Benutzer der Samba-Clients. Folgende
Optionen sind daf?r verantwortlich:

.. raw:: html

   <div class="variablelist">

``security``
    Die h?ufigsten Optionen sind ``security = share`` und
    ``security = user``. Wenn Ihre Clients Benutzernamen verwenden, die
    den Benutzernamen auf Ihrem FreeBSD-Rechner entsprechen, dann
    sollten Sie die Einstellung *user level* verwenden. Dies ist auch
    die Standardeinstellung. Allerdings ist es dazu erforderlich, dass
    sich die Clients auf Ihrem Rechner anmelden, bevor sie auf
    gemeinsame Ressourcen zugreifen k?nnen.

    In der Einstellung *share level* m?ssen sich Clients nicht unter
    Verwendung eines g?ltigen Logins auf Ihrem Rechner anmelden, bevor
    sie auf gemeinsame Ressourcen zugreifen k?nnen. In fr?heren
    Samba-Versionen war dies die Standardeinstellung.

``passdb backend``
    Samba erlaubt verschiedene Backend-Authentifizierungsmodelle. Sie
    k?nnen Clients durch LDAP, NIS+, eine SQL-Datenbank oder eine
    Passwortdatei authentifizieren. In der Voreinstellung wird
    ``smbpasswd`` verwendet. Diese Methode wird im folgenden Abschnitt
    n?her beschrieben.

.. raw:: html

   </div>

Wenn Sie ``smbpasswd`` verwenden, m?ssen Sie die Datei
``/usr/local/etc/samba/smbpasswd`` erzeugen, damit Samba in der Lage
ist, Clients zu authentifizieren. Wenn Sie auf Ihrem UNIX?-Rechner
vorhandenen Benutzern den Zugriff von einem Windows?-Client aus
erm?glichen wollen, verwenden Sie den folgenden Befehl:

.. code:: screen

    # smbpasswd -a username

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Als Backend wird inzwischen ``tdbsam`` empfohlen. Mit dem folgenden
Befehl legen Sie neue Benutzerkonten an:

.. code:: screen

    # pdbedit -a -u username

.. raw:: html

   </div>

Ausf?hrliche Informationen zur Konfiguration von Samba finden Sie im
`Official Samba
HOWTO <http://www.samba.org/samba/docs/man/Samba-HOWTO-Collection/>`__.
Sie sollten aber bereits nach dem Lesen dieses Abschnitts in der Lage
sein, Samba zu starten.

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

31.9.3. Samba starten
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Der Port
`net/samba34 <http://www.freebsd.org/cgi/url.cgi?ports/net/samba34/pkg-descr>`__
legt ein neues Startskript an, mit dem Samba gesteuert (also etwa
gestartet oder beendet) werden kann. Um dieses Skript zu aktivieren,
f?gen Sie folgende Zeile in ``/etc/rc.conf`` ein:

.. code:: programlisting

    samba_enable="YES"

Alternativ k?nnen Sie auch die folgenden beiden Eintr?ge verwenden:

.. code:: programlisting

    nmbd_enable="YES"

.. code:: programlisting

    smbd_enable="YES"

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Durch diese Eintr?ge wird Samba beim Systemstart automatisch aktiviert.

.. raw:: html

   </div>

Danach k?nnen Sie Samba jederzeit durch folgenden Befehl starten:

.. code:: screen

    # service samba start
    Starting SAMBA: removing stale tdbs :
    Starting nmbd.
    Starting smbd.

Weitere Informationen zu den rc-Startskripten finden Sie im
`Abschnitt?12.7, „Das rc-System f?r
Systemdienste“ <configtuning-rcd.html>`__ des Handbuchs.

Samba verwendet drei Daemonen. Beachten Sie, dass sowohl nmbd als auch
smbd durch das Skript ``samba`` gestartet werden. Wenn Sie die *winbind
name resolution services* in ``smb.conf`` aktiviert haben, wird
zus?tzlich der winbindd-Daemon gestartet.

Sie k?nnen Samba jederzeit durch den folgenden Befehl beenden:

.. code:: screen

    # service samba stop

Samba ist ein komplexes Softwarepaket mit umfassenden Funktionen, die
eine weitreichende Integration von Microsoft??Windows?-Netzwerken
erm?glichen. F?r eine Beschreibung dieser Zusatzfunktionen sollten Sie
sich auf ``http://www.samba.org`` umsehen.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------+----------------------------------------+-----------------------------------------------+
| `Zur?ck <network-ftp.html>`__?        | `Nach oben <network-servers.html>`__   | ?\ `Weiter <network-ntp.html>`__              |
+---------------------------------------+----------------------------------------+-----------------------------------------------+
| 31.8. FTP – File Transfer Protocol?   | `Zum Anfang <index.html>`__            | ?31.10. Die Uhrzeit mit NTP synchronisieren   |
+---------------------------------------+----------------------------------------+-----------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
