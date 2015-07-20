====================================
2.10. Arbeiten nach der Installation
====================================

.. raw:: html

   <div class="navheader">

2.10. Arbeiten nach der Installation
`Zur?ck <install-final-warning.html>`__?
Kapitel 2. FreeBSD?8.\ *``X``* (und ?lter) installieren
?\ `Weiter <install-trouble.html>`__

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

2.10. Arbeiten nach der Installation
------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Nach einer erfolgreichen Installation wird das System konfiguriert. Sie
k?nnen das System direkt konfigurieren oder nach einem Neustart. Nach
einem Neustart rufen Sie ``sysinstall`` auf und w?hlen den Men?punkt
Configure.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.10.1. Netzwerkkonfiguration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn Sie schon PPP f?r eine FTP-Installation konfiguriert haben,
erscheint dieser Bildschirm nicht. Sie k?nnen die Konfiguration sp?ter
in sysinstall vornehmen.

Netzwerke und die Konfiguration von FreeBSD als Gateway oder Router
werden eingehend im Kapitel `Weiterf?hrende
Netzwerkthemen <advanced-networking.html>`__ behandelt.

.. code:: screen

                          User Confirmation Requested
       Would you like to configure any Ethernet or PPP network devices?

                                 [ Yes ]   No

Wenn Sie eine Netzwerkkarte konfigurieren wollen, w?hlen Sie [?Yes?] aus
und dr?cken Sie die Taste **Enter**. W?hlen Sie [?No?], um die
Netzwerkkonfiguration zu ?berspringen.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 2.28. Eine Netzwerkkarte ausw?hlen

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Eine Netzwerkkarte ausw?hlen|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

W?hlen Sie die zu konfigurierende Karte mit den Pfeiltasten aus und
dr?cken Sie die Taste **Enter**.

.. code:: screen

                          User Confirmation Requested
           Do you want to try IPv6 configuration of the interface?

                                  Yes   [ No ]

F?r das gezeigte Installationsbeispiel gen?gte das momentan verwendete
Internet-Protokoll (IPv4). Daher wurde mit den Pfeiltasten [?No?]
ausgew?hlt und mit der Taste **Enter** best?tigt.

Wenn Sie durch einen RA-Server mit einem IPv6-Netzwerk verbunden sind,
w?hlen Sie bitte [?Yes?] und dr?cken die Taste **Enter**. Die Suche nach
den RA-Servern dauert einige Sekunden.

.. code:: screen

                                 User Confirmation Requested
            Do you want to try DHCP configuration of the interface?

                                  Yes   [ No ]

Falls Sie das Dynamic Host Configuration Protocol (DHCP) nicht
verwenden, w?hlen Sie [?No?] aus und dr?cken Sie **Enter**.

Wenn Sie [?Yes?] ausw?hlen, wird das Programm dhclient ausgef?hrt und
bei Erfolg die Netzwerkkarte konfiguriert. Mehr ?ber DHCP k?nnen Sie in
`Abschnitt?31.5, „Automatische Netzwerkkonfiguration mit
DHCP“ <network-dhcp.html>`__ nachlesen.

Der n?chste Bildschirmabzug zeigt die Netzwerkkonfiguration eines
Systems, das Gateway f?r das lokale Netz ist.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 2.29. Die Netzwerkkarte ed0 konfigurieren

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Die Netzwerkkarte ed0 konfigurieren|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Tragen Sie in die Felder, die Sie mit der Taste **Tab** ausw?hlen
k?nnen, die richtige Konfiguration ein.

.. raw:: html

   <div class="variablelist">

Host
    Der vollst?ndige Rechnername (*fully-qualified hostname*), wie in
    diesem Beispiel ``k6-2.example.com``.

Domain
    Der Domain-Name, in dem sich der Rechner befindet. Im Beispiel ist
    das ``example.com``.

IPv4 Gateway
    Die IP-Adresse des Rechners, der Pakete an entfernte Netze
    weiterleitet. Sie m?ssen dieses Feld ausf?llen, wenn der sich der
    Rechner in einem Netzwerk befindet. *Lassen Sie das Feld leer*, wenn
    der Rechner der Gateway in das Internet ist. Der IPv4-Gateway wird
    auch *default gateway* oder *default route* genannt.

Name server
    Die IP-Adresse des lokalen DNS-Servers. Im Beispiel gibt es keinen
    lokalen DNS-Server, daher wurde der DNS-Server des Providers
    (``208.163.10.2``) benutzt.

IPv4 address
    Die IP-Adresse der Netzwerkkarte (``192.168.0.1``).

Netmask (Netzmaske)
    Im Beispiel werden Adressen aus einem Klasse?C Netz (``192.168.0.0``
    bis ``192.168.0.255``) benutzt. Standardm??ig besitzt ein Klasse?C
    Netz die Netzmaske ``255.255.255.0``.

Extra options to ifconfig (Optionen f?r ifconfig)
    Zus?tzliche Optionen f?r den Befehl ``ifconfig``, die spezifisch f?r
    die verwendete Netzwerkkarte sind. Im Beispiel sind keine Optionen
    angegeben.

.. raw:: html

   </div>

Wenn Sie alle Werte eingegeben haben, w?hlen Sie mit **Tab** [?OK?] aus
und dr?cken Sie **Enter**.

.. code:: screen

                          User Confirmation Requested
            Would you like to bring the ed0 interface up right now?

                                 [ Yes ]   No

Wenn Sie [?Yes?] ausw?hlen und **Enter** dr?cken, wird die
Netzwerkkonfiguration aktiviert. Allerdings bringt dies zu diesem
Zeitpunkt nicht viel, da der Rechner noch neu gestartet werden muss.

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

2.10.2. Gateway einrichten
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. code:: screen

                           User Confirmation Requested
           Do you want this machine to function as a network gateway?

                                  [ Yes ]    No

W?hlen Sie [?Yes?], wenn der Rechner ein Gateway f?r ein lokales Netz
ist und Pakete an andere Netze weiterleitet. Wenn der Rechner ein
normaler Netzknoten ist, w?hlen Sie [?No?] aus. Best?tigen Sie die
auswahl mit der Taste **Enter**.

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

2.10.3. IP-Dienste einrichten
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. code:: screen

                          User Confirmation Requested
    Do you want to configure inetd and the network services that it provides?

                                   Yes   [ No ]

Wenn [?No?] ausgew?hlt wird, werden Dienste wie telnetd nicht aktiviert.
Benutzer k?nnen sich dann von entfernten Rechnern nicht mit telnet an
dieser Maschine anmelden. Lokale Benutzer k?nnen aber auf entfernte
Rechner mit telnet zugreifen.

Die Dienste k?nnen Sie nach der Installation aktivieren, indem Sie die
Datei ``/etc/inetd.conf`` editieren. Dies wird in `Abschnitt?31.2.1,
„?berblick“ <network-inetd.html#network-inetd-overview>`__ beschrieben.

Wenn Sie jetzt weitere Dienste aktivieren m?chten, w?hlen Sie [?Yes?]
aus. Es erscheint die nachstehende R?ckfrage:

.. code:: screen

                          User Confirmation Requested
    The Internet Super Server (inetd) allows a number of simple Internet
    services to be enabled, including finger, ftp and telnetd.  Enabling
    these services may increase risk of security problems by increasing
    the exposure of your system.

    With this in mind, do you wish to enable inetd?

                                 [ Yes ]   No

Best?tigen Sie die R?ckfrage mit [?Yes?].

.. code:: screen

                          User Confirmation Requested
    inetd(8) relies on its configuration file, /etc/inetd.conf, to determine
    which of its Internet services will be available.  The default FreeBSD
    inetd.conf(5) leaves all services disabled by default, so they must be
    specifically enabled in the configuration file before they will
    function, even once inetd(8) is enabled.  Note that services for
    IPv6 must be separately enabled from IPv4 services.

    Select [Yes] now to invoke an editor on /etc/inetd.conf, or [No] to
    use the current settings.

                                 [ Yes ]   No

Wenn Sie [?Yes?] ausw?hlen, k?nnen Sie Dienste aktivieren, in dem Sie
das Zeichen ``#`` am Zeilenanfang entfernen.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 2.30. ``inetd.conf`` editieren

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|inetd.conf editieren|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn Sie die gew?nschten Dienste aktiviert haben, dr?cken Sie die Taste
**Esc**. Es erscheint ein Men?, in dem Sie die ?nderungen abspeichern
und den Editor verlassen k?nnen.

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

2.10.4. SSH aktivieren
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. code:: screen

                          User Confirmation Requested
                      Would you like to enable SSH login?
                               Yes        [  No  ]

Durch die Auswahl von [?Yes?], wird
`sshd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sshd&sektion=8>`__,
der OpenSSH-Daemon aktiviert. Danach ist es m?glich, sich ?ber eine
verschl?sselte Verbindung auf Ihrem System anzumelden. Weitere
Informationen ?ber OpenSSH finden Sie in `Abschnitt?15.10,
„OpenSSH“ <openssh.html>`__ des FreeBSD-Handbuchs.

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

2.10.5. Anonymous-FTP
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. code:: screen

                          User Confirmation Requested
     Do you want to have anonymous FTP access to this machine?

                                  Yes    [ No ]

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.10.5.1. Anonymous-FTP verbieten
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn Sie die vorgegebene Auswahl [?No?] mit der Taste **Enter**
best?tigen, k?nnen Benutzer, die ein Konto und ein Passwort auf dem
System besitzen, immer noch mit FTP auf das System zugreifen.

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

2.10.5.2. Anonymous-FTP erlauben
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn Sie Anonymous-FTP erlauben, darf jeder auf Ihr System zugreifen.
Bedenken Sie die Folgen f?r die Systemsicherheit (siehe `Kapitel?15,
*Sicherheit* <security.html>`__) bevor Sie diese Option aktivieren.

Um Anonymous-FTP zu aktivieren, w?hlen Sie mit den Pfeiltasten [?Yes?]
aus und dr?cken Sie die Taste **Enter**. Es erscheint folgende Meldung:

.. code:: screen

                           User Confirmation Requested
     Anonymous FTP permits un-authenticated users to connect to the system
     FTP server, if FTP service is enabled.  Anonymous users are
     restricted to a specific subset of the file system, and the default
     configuration provides a drop-box incoming directory to which uploads
     are permitted.  You must separately enable both inetd(8), and enable
     ftpd(8) in inetd.conf(5) for FTP services to be available.  If you
     did not do so earlier, you will have the opportunity to enable inetd(8)
     again later.

     If you want the server to be read-only you should leave the upload
     directory option empty and add the -r command-line option to ftpd(8)
     in inetd.conf(5)

     Do you wish to continue configuring anonymous FTP?

                              [ Yes ]         No

Diese Nachricht informiert Sie dar?ber, dass der FTP-Dienst auch in der
Datei ``/etc/inetd.conf`` aktiviert werden muss, wenn Sie anonyme
FTP-Verbindungen erlauben wollen (lesen Sie dazu auch `Abschnitt?2.10.3,
„IP-Dienste einrichten“ <install-post.html#inetd-services>`__ des
FreeBSD-Handbuchs). W?hlen Sie [?Yes?] und dr?cken Sie **Enter**, um
fortzufahren. Danach erscheint der folgende Bildschirm:

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 2.31. Anonymous-FTP konfigurieren

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Anonymous-FTP konfigurieren|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Mit der Taste **Tab** wechseln Sie zwischen den Feldern, in die Sie die
ben?tigten Informationen eingeben.

.. raw:: html

   <div class="variablelist">

UID
    Die User-ID, die dem anonymen FTP-Benutzer zugewiesen werden soll.
    Alle hochgeladenen Dateien werden diesem User-ID geh?ren.

Group
    Die Gruppe, zu der der anonyme FTP-Benutzer geh?ren soll.

Comment
    Eine Beschreibung dieses Benutzers in der Datei ``/etc/passwd``.

FTP Root Directory
    Ort, an dem Dateien f?r anonymen FTP-Zugang bereitgestellt werden
    sollen.

Upload Subdirectory
    Das Verzeichnis, in dem von einem anonymen FTP-Benutzer hochgeladene
    Dateien gespeichert werden.

.. raw:: html

   </div>

Das FTP-Wurzelverzeichnis wird per Voreinstellung in ``/var`` angelegt.
Wenn in ``/var`` zu wenig Platz vorhanden ist, k?nnen Sie das
FTP-Wurzelverzeichnis beispielsweise nach ``/usr/ftp`` verlegen.

Wenn Sie mit den Einstellungen zufrieden sind, dr?cken Sie die Taste
**Enter**.

.. code:: screen

                              User Confirmation Requested
             Create a welcome message file for anonymous FTP users?

                                  [ Yes ]    No

Wenn Sie [?Yes?] ausw?hlen und mit **Enter** best?tigen, k?nnen Sie die
Begr??ungsmeldung des FTP-Servers in einem Editor ?ndern.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 2.32. Begr??ungsmeldung des FTP-Servers editieren

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Begr??ungsmeldung des FTP-Servers editieren|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Der Editor, in dem Sie sich befinden, hei?t ``ee``. Folgen Sie den
Anweisungen, um die Meldung zu editieren. Sie k?nnen die Meldung auch
sp?ter in einem Editor Ihrer Wahl editieren. Merken Sie sich dazu den
Dateinamen, der im Editor unten angezeigt wird.

Wenn Sie die Taste **Esc** dr?cken, erscheint ein Men?, in dem a) leave
editor vorgew?hlt ist. Dr?cken Sie die Taste **Enter**, um den Editor zu
verlassen. Falls Sie ?nderungen vorgenommen haben, best?tigen Sie die
?nderungen nochmals mit **Enter**.

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

2.10.6. Network-File-System einrichten
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Mit dem Network-File-System (NFS) k?nnen Sie ?ber ein Netzwerk auf
Dateien zugreifen. Ein Rechner kann NFS-Server, NFS-Client oder beides
sein. NFS wird in `Abschnitt?31.3, „NFS – Network File
System“ <network-nfs.html>`__ besprochen.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.10.6.1. NFS-Server einrichten
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. code:: screen

                           User Confirmation Requested
     Do you want to configure this machine as an NFS server?

                                  Yes    [ No ]

Wenn Sie keinen NFS-Server ben?tigen, w?hlen Sie [?No?] aus und
best?tigen Sie mit **Enter**.

Wenn Sie [?Yes?] ausw?hlen, erscheint der Hinweis, dass die Datei
``exports`` angelegt werden muss.

.. code:: screen

                                   Message
    Operating as an NFS server means that you must first configure an
    /etc/exports file to indicate which hosts are allowed certain kinds of
    access to your local filesystems.
    Press [Enter] now to invoke an editor on /etc/exports
                                   [ OK ]

Dr?cken Sie **Enter** und es wird ein Editor gestartet, in dem Sie die
Datei ``exports`` editieren k?nnen.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 2.33. ``exports`` editieren

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|exports editieren|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Folgen Sie den Anweisungen, um Dateisysteme zu exportieren. Sie k?nnen
die Datei auch sp?ter in einem Editor Ihrer Wahl editieren. Merken Sie
sich dazu den Dateinamen, der im Editor unten angezeigt wird.

Dr?cken Sie die Taste **Esc** und es erscheint ein Men?, in dem a) leave
editor vorgew?hlt ist. Dr?cken Sie die Taste **Enter**, um den Editor zu
verlassen.

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

2.10.6.2. NFS-Client einrichten
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Mit einem NFS-Client k?nnen Sie auf NFS-Server zugreifen.

.. code:: screen

                           User Confirmation Requested
     Do you want to configure this machine as an NFS client?

                                  Yes   [ No ]

W?hlen Sie entweder [?Yes?] oder [?No?] aus und dr?cken Sie **Enter**.

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

2.10.7. Die Systemkonsole einrichten
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Sie k?nnen verschiedene Merkmale der Systemkonsole anpassen.

.. code:: screen

                          User Confirmation Requested
           Would you like to customize your system console settings?

                                  [ Yes ]  No

Wenn Sie die Merkmale der Systemkonsole anpassen wollen, w?hlen Sie
[?Yes?] aus und dr?cken Sie die Taste **Enter**.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 2.34. Merkmale der Systemkonsole

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Merkmale der Systemkonsole|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Oft wird ein Bildschirmschoner auf der Konsole aktiviert. W?len Sie mit
den Pfeiltasten Saver aus und dr?cken Sie die Taste **Enter**.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 2.35. Bildschirmschoner ausw?hlen

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Bildschirmschoner ausw?hlen|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

W?hlen Sie den gew?nschten Bildschirmschoner mit den Pfeiltasten aus und
dr?cken Sie **Enter**. Das Konfigurationsmen? der Systemkonsole
erscheint wieder.

In der Voreinstellung wird der Bildschirmschoner nach 300?Sekunden
aktiviert. Um diese Zeitspanne zu ?ndern, w?hlen Sie wieder Saver aus.
Mit den Pfeiltasten w?hlen Sie dann Timeout aus und dr?cken **Enter**.
Es erscheint ein Eingabefenster:

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 2.36. Den Bildschirmschoner einstellen

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Den Bildschirmschoner einstellen|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

?ndern Sie die Zeitspanne und w?hlen Sie [?OK?] aus. Mit **Enter**
kehren Sie in das Konfigurationsmen? der Systemkonsole zur?ck.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 2.37. Die Konfiguration der Systemkonsole verlassen

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Die Konfiguration der Systemkonsole verlassen|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Um die Nacharbeiten fortzuf?hren, w?hlen Sie Exit aus und dr?cken Sie
**Enter**.

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

2.10.8. Die Zeitzone einstellen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn Sie die Zeitzone richtig einstellen, kann Ihr Rechner automatisch
regional bedingte Zeitumstellungen ausf?hren und andere von der Zeitzone
abh?ngige Funktionen handhaben.

Das folgende Beispiel gilt f?r den Osten der USA. Ihre Auswahl h?ngt vom
geographischen Standort Ihres Rechners ab.

.. code:: screen

                          User Confirmation Requested
              Would you like to set this machine's time zone now?

                                [ Yes ]   No

Um die Zeitzone einzustellen, w?hlen Sie [?Yes?] und dr?cken **Enter**.

.. code:: screen

                           User Confirmation Requested
     Is this machine's CMOS clock set to UTC? If it is set to local time
     or you don't know, please choose NO here!

                                  Yes   [ No ]

Je nachdem ob die Systemzeit die Zeitzone UTC verwendet, w?hlen Sie
[?Yes?] oder [?No?] aus. Best?tigen Sie die Auswahl mit der Taste
**Enter**.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 2.38. Das Gebiet ausw?hlen

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Das Gebiet ausw?hlen|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

W?hlen Sie mit den Pfeiltasten das richtige Gebiet aus und dr?cken Sie
**Enter**.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 2.39. Das Land ausw?hlen

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Das Land ausw?hlen|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

W?hlen Sie mit den Pfeiltasten das richtige Land aus und dr?cken Sie
**Enter**.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 2.40. Die Zeitzone ausw?hlen

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Die Zeitzone ausw?hlen|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

W?hlen Sie mit den Pfeiltasten die richtige Zeitzone aus dr?cken Sie
**Enter**.

.. code:: screen

                                Confirmation
                Does the abbreviation 'EDT' look reasonable?

                                [ Yes ]   No

Wenn die angezeigte Abk?rzung der Zeitzone richtig ist, best?tigen Sie
diese mit der Taste **Enter**.

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

2.10.9. Linux-Kompatibilit?t
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Die folgenden Anweisungen sind nur f?r FreeBSD?7.X g?ltig. Installieren
Sie eine FreeBSD?8.X-Version, wird der folgende Bildschirm nicht
angezeigt.

.. raw:: html

   </div>

.. code:: screen

                          User Confirmation Requested
              Would you like to enable Linux binary compatibility?

                                [ Yes ]   No

Wenn Sie [?Yes?] ausw?hlen und **Enter** dr?cken, k?nnen Sie
Linux-Software auf FreeBSD laufen lassen. Sp?ter wird dazu die
notwendige Software installiert.

Wenn Sie ?ber FTP installieren, m?ssen Sie mit dem Internet verbunden
sein. Einige FTP-Server bieten nicht alle verf?gbare Software an. Es
kann sein, dass die n?tige Software f?r die Linux-Kompatibilit?t nicht
installiert werden kann, dies k?nnen Sie sp?ter jedoch nachholen.

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

2.10.10. Die Maus konfigurieren
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Mit einer 3-Tasten-Maus k?nnen Sie Texte auf der Konsole und in
Programmen markieren und einf?gen (*cut and paste*). Wenn Sie eine
2-Tasten-Maus besitzen, k?nnen Sie eine 3-Tasten-Maus emulieren. Lesen
Sie dazu nach der Installation die Hilfeseite
`moused(8) <http://www.FreeBSD.org/cgi/man.cgi?query=moused&sektion=8>`__.
Das folgende Beispiel zeigt die Konfiguration einer nicht-USB-Maus (PS/2
oder serielle Maus):

.. code:: screen

                          User Confirmation Requested
             Does this system have a PS/2, serial, or bus mouse?

                                [ Yes ]    No 

W?hlen Sie [?Yes?] f?r eine PS/2-, eine serielle oder eine Bus-Maus.
Haben Sie hingegen eine USB-Maus, w?hlen Sie [?No?]. Danach dr?cken Sie
**Enter**.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 2.41. Das Mausprotokoll festlegen

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Das Mausprotokoll festlegen|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Markieren Sie mit den Pfeiltasten Type und dr?cken Sie press **Enter**.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 2.42. Das Mausprotokoll festlegen

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Das Mausprotokoll festlegen|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Im Beispiel wurde eine PS/2-Maus verwendet, sodass die Vorgabe Auto
passend war. Sie k?nnen das Protokoll mit den Pfeiltasten ?ndern.
Stellen Sie sicher, dass [?OK?] aktiviert ist und verlassen Sie das Men?
mit der Taste **Enter**.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 2.43. Den Mausport einstellen

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Den Mausport einstellen|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

W?hlen Sie mit den Pfeiltasten Port und dr?cken Sie die Taste **Enter**.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 2.44. Den Mausport einstellen

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Den Mausport einstellen|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Im Beispiel wurde eine PS/2-Maus verwendet, sodass die Vorgabe PS/2
richtig war. Sie k?nnen den Port mit den Pfeiltasten ?ndern. Best?tigen
Sie die Auswahl mit der Taste **Enter**.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 2.45. Den Mouse-Daemon aktivieren

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Den Mouse-Daemon aktivieren|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

W?hlen Sie nun mit den Pfeiltasten Enable aus und dr?cken Sie die Taste
**Enter**, um den Mouse-Daemon zu aktivieren und zu testen.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 2.46. Den Mouse-Daemon testen

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Den Mouse-Daemon testen|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Bewegen Sie die Maus hin und her und pr?fen Sie, dass sich der
Mauszeiger entsprechend bewegt. Wenn alles in Ordnung ist, w?hlen Sie
[?Yes?] aus und dr?cken Sie **Enter**. Wenn sich die Maus nicht richtig
verh?lt, wurde sie nicht korrekt konfiguriert. W?hlen Sie in diesem Fall
[?No?] und versuchen Sie, die Einstellungen zu korrigieren.

Um mit den Nacharbeiten fortzufahren, w?hlen Sie mit den Pfeiltasten
Exit aus und dr?cken Sie **Enter**.

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

2.10.11. Pakete installieren
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Pakete (*packages*) sind schon ?bersetzte Programme und sind ein
zweckm??iger Weg, Programme zu installieren.

Beispielhaft wird im Folgenden die Installation eines Paketes gezeigt.
In diesem Schritt k?nnen auch weitere Pakete installiert werden. Nach
der Installation k?nnen Sie mit ``sysinstall`` zus?tzliche Pakete
installieren.

.. code:: screen

                         User Confirmation Requested
     The FreeBSD package collection is a collection of hundreds of
     ready-to-run applications, from text editors to games to WEB servers
     and more. Would you like to browse the collection now?

                                [ Yes ]   No

Nachdem Sie [ Yes ] ausgew?hlt und **Enter** gedr?ckt haben, gelangen
Sie in die Paketauswahl:

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 2.47. Die Paketkategorie aussuchen

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Die Paketkategorie aussuchen|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Es stehen nur die Pakete zur Auswahl, die sich auf dem momentanen
Installationsmedium befinden.

Wenn Sie All ausw?hlen, werden alle Pakete angezeigt. Sie k?nnen die
Anzeige auf die Pakete einer Kategorie beschr?nken. W?hlen Sie mit den
Pfeiltasten die Kategorie aus und dr?cken Sie die Taste **Enter**.

Ein Men? mit allen Paketen der ausgew?hlten Kategorie erscheint:

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 2.48. Pakete ausw?hlen

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Pakete ausw?hlen|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Im gezeigten Bildschirm ist das Paket bash ausgew?hlt. Sie k?nnen
weitere Pakete ausw?hlen, indem Sie die Pakete mit den Pfeiltasten
markieren und die Taste **Space** dr?cken. In der unteren linken Ecke
des Bildschirms wird eine Kurzbeschreibung des ausgew?hlten Pakets
angezeigt.

Die Taste **Tab** wechselt zwischen dem zuletzt ausgesuchten Paket,
[?OK?] und [?Cancel?].

Wenn Sie die zu installierenden Pakete ausgew?hlt haben, dr?cken Sie
einmal **Tab**, um [?OK?] zu markieren. Dr?cken Sie dann **Enter**, um
wieder in die Paketauswahl zu gelangen.

Die rechte und die linke Pfeiltaste wechseln ebenfalls zwischen [?OK?]
und [?Cancel?]. Mit diesen Tasten k?nnen Sie auch [?OK?] ausw?hlen und
dann mit **Enter** zur Paketauswahl zur?ckkehren.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 2.49. Pakete installieren

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Pakete installieren|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Benutzen Sie die Taste **Tab** und die Pfeiltasten um [?Install?]
auszuw?hlen. Dr?cken Sie anschlie?end die Taste **Enter**. Sie m?ssen
jetzt die Installation der Pakete best?tigen:

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 2.50. Paketinstallation best?tigen

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Paketinstallation best?tigen|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Paketinstallation wird gestartet, wenn Sie [?OK?] ausw?hlen und
**Enter** dr?cken. Den Verlauf der Installation k?nnen Sie anhand der
angezeigten Meldungen verfolgen; achten Sie dabei auf Fehlermeldungen.

Nach der Paketinstallation k?nnen Sie die Nacharbeiten fortsetzen. Wenn
Sie keine Pakete ausgew?hlt haben und die Nacharbeiten fortsetzen
m?chten, w?hlen Sie trotzdem [?Install?] aus.

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

2.10.12. Benutzer und Gruppen anlegen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

W?hrend der Installation sollten Sie mindestens ein Benutzerkonto
anlegen, sodass Sie das System ohne das Konto ``root`` benutzen k?nnen.
Normalerweise ist die Root-Partition recht klein und l?uft schnell voll,
wenn Sie Anwendungen unter dem ``root``-Konto laufen lassen. Vor der
gr??ten Gefahr warnt der nachstehende Hinweis:

.. code:: screen

                         User Confirmation Requested
     Would you like to add any initial user accounts to the system? Adding
     at least one account for yourself at this stage is suggested since
     working as the "root" user is dangerous (it is easy to do things which
     adversely affect the entire system).

                                [ Yes ]   No

Der Bildschirm auf Deutsch:

.. code:: screen

                          Best?tigung erforderlich
     Wollen Sie Benutzerkonten anlegen?  Wir empfehlen, mindestens
     ein Konto f?r sich selbst anzulegen, da es gef?hrlich
     ist, unter "root" zu arbeiten (es ist leicht, Befehle einzugeben,
     die das System nachhaltig beeintr?chtigen).

                                [ Yes ]   No

Um ein Benutzerkonto anzulegen, w?hlen Sie [?Yes?] aus und dr?cken
**Enter**.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 2.51. Benutzerkonto ausw?hlen

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Benutzerkonto ausw?hlen|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Markieren Sie User mit den Pfeiltasten und dr?cken Sie die Taste
**Enter**.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 2.52. Benutzerkonto anlegen

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Benutzerkonto anlegen|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

W?hlen Sie die Felder zum Ausf?llen mit der Taste **Tab** aus. Zur Hilfe
werden die nachstehenden Beschreibungen werden im unteren Teil des
Bildschirms angezeigt:

.. raw:: html

   <div class="variablelist">

Login ID
    Der Name des Benutzerkontos (verpflichtend).

UID
    Die numerische ID dieses Kontos. Wenn Sie das Feld leer lassen, wird
    eine ID automatisch zugeteilt.

Group
    Die diesem Konto zugeordnete Login-Gruppe. Wenn Sie das Feld leer
    lassen, wird automatisch eine Gruppe zugeteilt.

Password
    Das Passwort des Benutzerkontos. F?llen Sie dieses Feld sehr
    sorgf?tig aus.

Full name
    Der vollst?ndige Name des Benutzers (Kommentarfeld).

Member groups
    Die Gruppen, in denen dieses Konto Mitglied ist (das Konto erh?lt
    Zugriffsrechte auf Dateien dieser Gruppe).

Home directory
    Das Heimatverzeichnis des Benutzerkontos. Wenn Sie das Feld leer
    lassen, wird das Verzeichnis automatisch festgelegt.

Login shell
    Die Login-Shell des Kontos. Wenn Sie das Feld leer lassen, wird
    ``/bin/sh`` als Login-Shell festgesetzt.

.. raw:: html

   </div>

Im Beispiel wurde die Login-Shell von ``/bin/sh`` zu der vorher
installierten ``/usr/local/bin/bash`` ge?ndert. Tragen Sie keine Shell
ein, die nicht existiert, da sich sonst nicht anmelden k?nnen. In der
BSD-Welt wird h?ufig die C-Shell benutzt, die Sie mit ``/bin/tcsh``
angeben k?nnen.

Damit ein Wechsel auf den Superuser ``root`` m?glich ist, wurde dem
Benutzerkonto die Gruppe ``wheel`` zugeordnet.

Wenn Sie zufrieden sind, dr?cken Sie [?OK?]. Es erscheint wieder das
Benutzer-Men?:

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 2.53. Benutzermen? verlassen

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Benutzermen? verlassen|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Weitere Gruppen k?nnen, wenn Sie die Anforderungen schon kennen, zu
diesem Zeitpunkt angelegt werden. Nach der Installation k?nnen Sie
Gruppen mit dem Werkzeug ``sysinstall`` anlegen.

Wenn Sie alle Benutzer angelegt haben, w?hlen Sie mit den Pfeiltasten
Exit aus und dr?cken Sie die Taste **Enter**.

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

2.10.13. Das ``root``-Passwort festlegen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. code:: screen

                            Message
     Now you must set the system manager's password.
     This is the password you'll use to log in as "root".

                             [ OK ]

                   [ Press enter or space ]

Um das ``root``-Passwort festzulegen, dr?cken Sie die Taste **Enter**.

Sie m?ssen das Passwort zweimal eingeben. Stellen Sie sicher, dass Sie
das Passwort nicht vergessen. Beachten Sie, dass bei der Eingabe das
Passwort weder ausgegeben wird noch Sterne angezeigt werden.

.. code:: screen

    New password :
    Retype new password :

Nach der erfolgreichen Eingabe des Passworts kann die Installation
fortgesetzt werden.

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

2.10.14. Die Installation beenden
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn Sie noch weitere Netzwerkkarten konfigurieren oder `weitere
Einstellungen <install-post.html#network-services>`__ vornehmen wollen,
k?nnen Sie das jetzt tun. Sie k?nnen die Einstellungen auch nach der
Installation mit ``sysinstall`` vornehmen.

.. code:: screen

                         User Confirmation Requested
     Visit the general configuration menu for a chance to set any last
     options?

                                  Yes   [ No ]

Um in das Hauptmen? zur?ckzukehren, w?hlen Sie mit den Pfeiltasten
[?No?] aus und dr?cken Sie **Enter**.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 2.54. Die Installation beenden

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Die Installation beenden|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

W?hlen Sie mit den Pfeiltasten [X Exit Install] aus und dr?cken Sie die
Taste **Enter**. Sie m?ssen das Beenden der Installation best?tigen:

.. code:: screen

                         User Confirmation Requested
     Are you sure you wish to exit? The system will reboot.

                                [ Yes ]   No

W?hlen Sie [?Yes?]. Wenn Sie von einer CD-ROM gestartet haben, erhalten
Sie die folgende Meldung, die Sie daran erinnert, die CD-ROM aus dem
Laufwerk zu entfernen:

.. code:: screen

                        Message
    Be sure to remove the media from the drive.

                        [ OK ]
               [ Press enter or space ]

Das CD-Laufwerk ist bis zum Neustart des Systems verriegelt. Entfernen
Sie die CD z?gig, wenn der Rechner startet.

Achten Sie beim Neustart des Systems auf eventuell auftauchende
Fehlermeldungen (lesen Sie `Abschnitt?2.10.16, „FreeBSD
starten“ <install-post.html#freebsdboot>`__ f?r weitere Informationen).

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

2.10.15. Weitere Netzwerkdienste einrichten
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div>

Beigetragen von Tom Rhodes.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Anf?nger ohne Vorwissen finden das Einrichten von Netzwerkdiensten oft
deprimierend. Netzwerke und das Internet sind f?r moderne
Betriebssysteme von entscheidender Bedeutung. Es ist daher wichtig, die
Netzwerkfunktionen von FreeBSD zu kennen. Die von FreeBSD angebotenen
Netzwerkdienste k?nnen Sie w?hrend der Installation kennen lernen.

Netzwerkdienste sind Programme, die Eingaben aus dem Netzwerk
entgegennehmen. Es wird gro?e M?he darauf verwendet, dass diese
Programme keinen Schaden verursachen. Leider k?nnen auch Programmierern
Fehler unterlaufen und es gibt F?lle, in denen Fehler in
Netzwerkdiensten von Angreifern ausgenutzt wurden. Es ist daher wichtig,
dass Sie nur Dienste aktivieren, die Sie ben?tigen. Im Zweifallsfall
sollten Sie einen Dienst solange nicht aktivieren, bis Sie herausfinden,
dass Sie den Dienst ben?tigen. Einen Dienst k?nnen Sie sp?ter immer noch
mit sysinstall oder in der Datei ``/etc/rc.conf`` aktivieren.

W?hlen Sie den Men?punkt Networking und es erscheint ein Men? wie das
nachstehende:

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 2.55. Netzwerkdienste – obere H?lfte

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Netzwerkdienste – obere H?lfte|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die erste Option, Interfaces, wurde schon in `Abschnitt?2.10.1,
„Netzwerkkonfiguration“ <install-post.html#inst-network-dev>`__
konfiguriert. Sie k?nnen daher diesen Punkt ?berspringen.

Der Punkt AMD aktiviert einen Dienst, der automatisch Dateisysteme
einh?ngt. Normalerweise wird der Dienst zusammen mit dem NFS-Protokoll
(siehe unten) verwendet, um automatisch entfernte Dateisysteme
einzuh?ngen. Dieser Men?punkt erfordert keine weitere Konfiguration.

Der n?chste Men?punkt ist AMD Flags. Wenn Sie den Punkt ausw?hlen,
erscheint ein Fenster, in dem Sie AMD-spezifische Optionen eingeben
k?nnen. Die nachstehenden Optionen sind schon vorgegeben:

.. code:: screen

    -a /.amd_mnt -l syslog /host /etc/amd.map /net /etc/amd.map

Die Option ``-a`` legt das Verzeichnis fest (hier ``/.amd_mnt``), unter
dem Dateisysteme eingehangen werden. Die Option ``-l`` legt die
Protokolldatei fest. Wenn syslogd verwendet wird, werden alle Meldungen
an den Daemon syslogd gesendet. Das Verzeichnis ``/host`` dient zum
Zugriff auf exportierte Verzeichnisse von entfernten Rechnern, das
Verzeichnis ``/net`` dient zum Zugriff auf exportierte Verzeichnisse von
entfernten IP-Adressen. Die Datei ``/etc/amd.map`` enth?lt die
Einstellungen f?r von AMD verwaltete Dateisysteme.

Die Auswahl Anon FTP erlaubt Anonymous-FTP-Verbindungen. W?hlen Sie
diese Option, wenn Sie einen Anonymous-FTP-Server einrichten wollen.
Seien Sie sich ?ber die Sicherheitsrisiken bewusst, wenn Sie
Anonymous-FTP erlauben. Die Sicherheitsrisiken und die Konfiguration von
Anonymous-FTP werden in einem gesonderten Fenster erkl?rt, das aufgeht,
wenn Sie diese Option ausw?hlen.

Der Men?punkt Gateway konfiguriert das System, wie vorher erl?utert, als
Gateway. Wenn Sie w?hrend der Installation den Rechner aus Versehen als
Gateway konfiguriert haben, k?nnen Sie dies hier wieder r?ckg?ngig
machen.

Der Men?punkt Inetd konfiguriert, wie schon oben besprochen, den Daemon
`inetd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=inetd&sektion=8>`__.

Die Auswahl Mail konfiguriert den Mail Transfer Agent (MTA) des Systems.
Wenn Sie diesen Punkt ausw?hlen, erscheint das folgende Men?:

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 2.56. Den MTA festlegen

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Den MTA festlegen|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In diesem Men? w?hlen Sie aus, welcher MTA installiert und benutzt wird.
Ein MTA ist ein Mail-Server, der E-Mails an lokale Empf?nger oder an
Empf?nger im Internet ausliefert.

Die Auswahl Sendmail installiert das verbreitete sendmail (in FreeBSD
die Voreinstellung). Die Auswahl Sendmail local verwendet sendmail als
MTA, deaktiviert aber den Empfang von E-Mails aus dem Internet. Postfix
und Exim sind ?hnlich wie Sendmail. Beide Programme liefern E-Mails aus
und einige Anwender verwenden lieber eines der beiden Programme als MTA.

Nachdem Sie einen MTA ausgew?hlt haben (oder beschlossen haben, keinen
MTA zu benutzen), erscheint wieder das Men? Netzwerkdienste. Der n?chste
Men?punkt ist NFS client.

Die Auswahl NFS client erlaubt es dem System, mit einem NFS-Server zu
kommunizieren. Ein NFS-Server stellt mithilfe des NFS-Protokolls
Dateisysteme f?r andere Systeme auf dem Netzwerk bereit. Wenn der
Rechner alleine f?r sich steht, k?nnen Sie diesen Men?punkt auslassen.
Wahrscheinlich m?ssen Sie noch weitere Einstellungen vornehmen; der
`Abschnitt?31.3, „NFS – Network File System“ <network-nfs.html>`__
beschreibt die Einstellungen f?r NFS-Server und NFS-Clients.

Der Men?punkt NFS server richtet einen NFS-Server auf dem Rechner ein.
Durch die Auswahl dieses Punktes werden die f?r Remote-Procedure-Call
(RPC) ben?tigten Dienste gestartet. Mit RPC werden Routinen auf
entfernten Rechnern aufgerufen.

Der n?chste Punkt, Ntpdate, konfiguriert die Zeitsynchronisation. Wenn
Sie diesen Punkt ausw?hlen, erscheint das folgende Men?:

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 2.57. Ntpdate konfigurieren

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Ntpdate konfigurieren|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

W?hlen Sie aus diesem Men? einen nahe liegenden Server aus. Die
Zeitsynchronisation mit einem nahe liegenden Server ist, wegen der
geringeren Latenzzeit, genauer als die Synchronisation mit einem weiter
entfernten Server.

Der n?chste Men?punkt ist PCNFSD. Wenn Sie diesen Punkt ausw?hlen, wird
`net/pcnfsd <http://www.freebsd.org/cgi/url.cgi?ports/net/pcnfsd/pkg-descr>`__
aus der Ports-Sammlung installiert. Dieses n?tzliche Werkzeug stellt
NFS-Authentifizierungsdienste f?r Systeme bereit, die diese Dienste
nicht anbieten (beispielsweise Microsofts MS-DOS?).

Um die n?chsten Men?punkte zu sehen, m?ssen Sie herunterbl?ttern:

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 2.58. Netzwerkdienste – untere H?lfte

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Netzwerkdienste – untere H?lfte|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Programme
`rpcbind(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rpcbind&sektion=8>`__,
`rpc.statd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rpc.statd&sektion=8>`__
und
`rpc.lockd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rpc.lockd&sektion=8>`__
werden f?r Remote-Procedure-Calls (RPC) benutzt. Das Programm
``rpcbind`` verwaltet die Kommunikation zwischen NFS-Servern und
NFS-Clients und ist f?r den Betrieb eines NFS-Servers erforderlich. Der
Daemon rpc.statd h?lt zusammen mit dem Daemon rpc.statd des entfernten
Rechners den Status der Verbindung. Der Status einer Verbindung wird
normalerweise in der Datei ``/var/db/statd.status`` festgehalten. Der
n?chste Men?punkt ist rpc.lockd, der Dateisperren (*file locks*)
bereitstellt. rpc.lockd wird normalerweise zusammen mit dem Daemon
rpc.statd benutzt, der festh?lt welche Rechner Sperren anfordern und wie
oft Sperren angefordert werden. Beide Dienste sind wunderbar zur
Fehlersuche geeignet, doch werden Sie zum Betrieb von NFS-Servern und
NFS-Clients nicht ben?tigt.

Der n?chste Punkt in der Auswahl ist Routed, der Routing-Daemon. Das
Programm
`routed(8) <http://www.FreeBSD.org/cgi/man.cgi?query=routed&sektion=8>`__
verwaltet die Routing-Tabelle, entdeckt Multicast-Router und stellt die
Routing-Tabelle auf Anfrage jedem mit dem Netz verbundenen Rechner zur
Verf?gung. Der Daemon wird haupts?chlich auf Gateways eines lokalen
Netzes eingesetzt. Wenn Sie den Punkt ausw?hlen m?ssen Sie den Ort des
Programms angeben. Die Vorgabe k?nnen Sie mit der Taste **Enter**
?bernehmen. Anschlie?end werden Sie nach den Kommandozeilenoptionen f?r
``routed`` gefragt. Vorgegeben ist die Option ``-q``.

Der n?chste Men?punkt ist Rwhod. Wenn Sie diesen Punkt ausw?hlen, wird
w?hrend des Systemstarts der Daemon
`rwhod(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rwhod&sektion=8>`__
gestartet. Das Kommando ``rwhod`` schickt Broadcast-Meldungen in das
Netz oder empf?ngt diese im Consumer-Mode. Die Funktion der Werkzeuge
wird in den Hilfeseiten
`ruptime(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ruptime&sektion=1>`__
und
`rwho(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rwho&sektion=1>`__
beschrieben.

Der vorletzte Men?punkt aktiviert den Daemon
`sshd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sshd&sektion=8>`__,
den OpenSSH Secure-Shell-Server. Wo m?glich sollte SSH anstelle von
telnet und FTP eingesetzt werden. Der Secure-Shell-Server erstellt
verschl?sselte und daher sichere Verbindungen zwischen zwei Rechnern.

TCP Extensions ist der letzte Men?punkt. Diese Auswahl aktiviert die
TCP-Erweiterungen aus RFC?1323 und RFC?1644. Obwohl dies auf vielen
Rechnern die Verbindungsgeschwindigkeit erh?ht, k?nnen durch diese
Option auch Verbindungsabbr?che auftreten. Auf Servern sollte diese
Option nicht aktiviert werden, auf Einzelmaschinen kann diese Option
n?tzlich sein.

Wenn Sie die Netzwerkdienste eingerichtet haben, bl?ttern Sie zum
Men?punkt Exit hoch, um die Nacharbeiten fortzusetzen oder verlassen Sie
sysinstall, indem Sie zweimal X Exit und danach [X Exit Install] w?hlen.

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

2.10.16. FreeBSD starten
~~~~~~~~~~~~~~~~~~~~~~~~

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

2.10.16.1. Start von FreeBSD auf FreeBSD/i386
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn alles funktioniert hat, laufen viele Meldungen ?ber den Bildschirm
und schlie?lich erscheint ein Anmeldeprompt. Um sich die Meldungen
anzusehen. dr?cken Sie die Taste **Scroll-Lock**. Sie k?nnen dann mit
den Tasten **PgUp** und **PgDn** bl?ttern. Wenn Sie erneut
**Scroll-Lock** dr?cken, kehren Sie zum Anmeldeprompt zur?ck.

Es kann sein, dass der Puffer zu klein ist, um alle Meldungen
anzuzeigen. Nachdem Sie sich angemeldet haben, k?nnen Sie sich mit dem
Kommando ``dmesg`` alle Meldungen ansehen.

Melden Sie sich bitte mit dem Benutzerkonto an (``rpratt`` im Beispiel),
das Sie w?hrend der Installation eingerichtet haben. Arbeiten Sie mit
``root`` nur dann wenn es erforderlich ist.

Die nachfolgende Abbildung zeigt typische Startmeldungen
(Versionsangaben entfernt):

.. code:: screen

    Copyright (c) 1992-2002 The FreeBSD Project.
    Copyright (c) 1979, 1980, 1983, 1986, 1988, 1989, 1991, 1992, 1993, 1994
            The Regents of the University of California. All rights reserved.

    Timecounter "i8254"  frequency 1193182 Hz
    CPU: AMD-K6(tm) 3D processor (300.68-MHz 586-class CPU)
      Origin = "AuthenticAMD"  Id = 0x580  Stepping = 0
      Features=0x8001bf<FPU,VME,DE,PSE,TSC,MSR,MCE,CX8,MMX>
      AMD Features=0x80000800<SYSCALL,3DNow!>
    real memory  = 268435456 (262144K bytes)
    config> di sn0
    config> di lnc0
    config> di le0
    config> di ie0
    config> di fe0
    config> di cs0
    config> di bt0
    config> di aic0
    config> di aha0
    config> di adv0
    config> q
    avail memory = 256311296 (250304K bytes)
    Preloaded elf kernel "kernel" at 0xc0491000.
    Preloaded userconfig_script "/boot/kernel.conf" at 0xc049109c.
    md0: Malloc disk
    Using $PIR table, 4 entries at 0xc00fde60
    npx0: <math processor> on motherboard
    npx0: INT 16 interface
    pcib0: <Host to PCI bridge> on motherboard
    pci0: <PCI bus> on pcib0
    pcib1: <VIA 82C598MVP (Apollo MVP3) PCI-PCI (AGP) bridge> at device 1.0 on pci0
    pci1: <PCI bus> on pcib1
    pci1: <Matrox MGA G200 AGP graphics accelerator> at 0.0 irq 11
    isab0: <VIA 82C586 PCI-ISA bridge> at device 7.0 on pci0
    isa0: <ISA bus> on isab0
    atapci0: <VIA 82C586 ATA33 controller> port 0xe000-0xe00f at device 7.1 on pci0
    ata0: at 0x1f0 irq 14 on atapci0
    ata1: at 0x170 irq 15 on atapci0
    uhci0: <VIA 83C572 USB controller> port 0xe400-0xe41f irq 10 at device 7.2 on pci0
    usb0: <VIA 83C572 USB controller> on uhci0
    usb0: USB revision 1.0
    uhub0: VIA UHCI root hub, class 9/0, rev 1.00/1.00, addr 1
    uhub0: 2 ports with 2 removable, self powered
    chip1: <VIA 82C586B ACPI interface> at device 7.3 on pci0
    ed0: <NE2000 PCI Ethernet (RealTek 8029)> port 0xe800-0xe81f irq 9 at
    device 10.0 on pci0
    ed0: address 52:54:05:de:73:1b, type NE2000 (16 bit)
    isa0: too many dependant configs (8)
    isa0: unexpected small tag 14
    fdc0: <NEC 72065B or clone> at port 0x3f0-0x3f5,0x3f7 irq 6 drq 2 on isa0
    fdc0: FIFO enabled, 8 bytes threshold
    fd0: <1440-KB 3.5” drive> on fdc0 drive 0
    atkbdc0: <keyboard controller (i8042)> at port 0x60-0x64 on isa0
    atkbd0: <AT Keyboard> flags 0x1 irq 1 on atkbdc0
    kbd0 at atkbd0
    psm0: <PS/2 Mouse> irq 12 on atkbdc0
    psm0: model Generic PS/2 mouse, device ID 0
    vga0: <Generic ISA VGA> at port 0x3c0-0x3df iomem 0xa0000-0xbffff on isa0
    sc0: <System console> at flags 0x1 on isa0
    sc0: VGA <16 virtual consoles, flags=0x300>
    sio0 at port 0x3f8-0x3ff irq 4 flags 0x10 on isa0
    sio0: type 16550A
    sio1 at port 0x2f8-0x2ff irq 3 on isa0
    sio1: type 16550A
    ppc0: <Parallel port> at port 0x378-0x37f irq 7 on isa0
    ppc0: SMC-like chipset (ECP/EPP/PS2/NIBBLE) in COMPATIBLE mode
    ppc0: FIFO with 16/16/15 bytes threshold
    ppbus0: IEEE1284 device found /NIBBLE
    Probing for PnP devices on ppbus0:
    plip0: <PLIP network interface> on ppbus0
    lpt0: <Printer> on ppbus0
    lpt0: Interrupt-driven port
    ppi0: <Parallel I/O> on ppbus0
    ad0: 8063MB <IBM-DHEA-38451> [16383/16/63] at ata0-master using UDMA33
    ad2: 8063MB <IBM-DHEA-38451> [16383/16/63] at ata1-master using UDMA33
    acd0: CDROM <DELTA OTC-H101/ST3 F/W by OIPD> at ata0-slave using PIO4
    Mounting root from ufs:/dev/ad0s1a
    swapon: adding /dev/ad0s1b as swap device
    Automatic boot in progress...
    /dev/ad0s1a: FILESYSTEM CLEAN; SKIPPING CHECKS
    /dev/ad0s1a: clean, 48752 free (552 frags, 6025 blocks, 0.9% fragmentation)
    /dev/ad0s1f: FILESYSTEM CLEAN; SKIPPING CHECKS
    /dev/ad0s1f: clean, 128997 free (21 frags, 16122 blocks, 0.0% fragmentation)
    /dev/ad0s1g: FILESYSTEM CLEAN; SKIPPING CHECKS
    /dev/ad0s1g: clean, 3036299 free (43175 frags, 374073 blocks, 1.3% fragmentation)
    /dev/ad0s1e: filesystem CLEAN; SKIPPING CHECKS
    /dev/ad0s1e: clean, 128193 free (17 frags, 16022 blocks, 0.0% fragmentation)
    Doing initial network setup: hostname.
    ed0: flags=8843<UP,BROADCAST,RUNNING,SIMPLEX,MULTICAST> mtu 1500
            inet 192.168.0.1 netmask 0xffffff00 broadcast 192.168.0.255
            inet6 fe80::5054::5ff::fede:731b%ed0 prefixlen 64 tentative scopeid 0x1
            ether 52:54:05:de:73:1b
    lo0: flags=8049<UP,LOOPBACK,RUNNING,MULTICAST> mtu 16384
            inet6 fe80::1%lo0 prefixlen 64 scopeid 0x8
            inet6 ::1 prefixlen 128
            inet 127.0.0.1 netmask 0xff000000
    Additional routing options: IP gateway=YES TCP keepalive=YES
    routing daemons:.
    additional daemons: syslogd.
    Doing additional network setup:.
    Starting final network daemons: creating ssh RSA host key
    Generating public/private rsa1 key pair.
    Your identification has been saved in /etc/ssh/ssh_host_key.
    Your public key has been saved in /etc/ssh/ssh_host_key.pub.
    The key fingerprint is:
    cd:76:89:16:69:0e:d0:6e:f8:66:d0:07:26:3c:7e:2d root@k6-2.example.com
     creating ssh DSA host key
    Generating public/private dsa key pair.
    Your identification has been saved in /etc/ssh/ssh_host_dsa_key.
    Your public key has been saved in /etc/ssh/ssh_host_dsa_key.pub.
    The key fingerprint is:
    f9:a1:a9:47:c4:ad:f9:8d:52:b8:b8:ff:8c:ad:2d:e6 root@k6-2.example.com.
    setting ELF ldconfig path: /usr/lib /usr/lib/compat /usr/X11R6/lib
    /usr/local/lib
    a.out ldconfig path: /usr/lib/aout /usr/lib/compat/aout /usr/X11R6/lib/aout
    starting standard daemons: inetd cron sshd usbd sendmail.
    Initial rc.i386 initialization:.
    rc.i386 configuring syscons: blank_time screensaver moused.
    Additional ABI support: linux.
    Local package initialization:.
    Additional TCP options:.

    FreeBSD/i386 (k6-2.example.com) (ttyv0)

    login: rpratt
    Password:

Das Erzeugen der RSA- und DSA-Schl?ssel kann auf langsamen Maschinen
lange dauern. Die Schl?ssel werden nur beim ersten Neustart erzeugt,
sp?tere Neustarts sind schneller.

Wenn der X-Server konfiguriert ist und eine Oberfl?che ausgew?hlt wurde,
k?nnen Sie X mit dem Kommando ``startx`` starten.

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

2.10.17. FreeBSD herunterfahren
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Es ist wichtig, dass Sie das Betriebssystem richtig herunterfahren.
Wechseln Sie zun?chst mit dem Befehl ``su`` zum Superuser; Sie m?ssen
dazu das ``root``-Passwort eingeben. Der Wechsel auf den Superuser
gelingt nur, wenn der Benutzer ein Mitglied der Gruppe ``wheel`` ist.
Ansonsten melden Sie sich direkt als Benutzer ``root`` an. Der Befehl
``shutdown -h now`` h?lt das System an.

.. code:: screen

    The operating system has halted.
    Please press any key to reboot.

Sie k?nnen den Rechner ausschalten, nachdem die Meldung
``Please press any key to reboot`` erschienen ist. Wenn Sie stattdessen
eine Taste dr?cken, startet das System erneut.

Sie k?nnen das System auch mit der Tastenkombination
**Ctrl**+**Alt**+**Del** neu starten. Sie sollten diese
Tastenkombination allerdings nicht gewohnheitsm??ig benutzen.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------------+--------------------------------+----------------------------------------+
| `Zur?ck <install-final-warning.html>`__?   | `Nach oben <install.html>`__   | ?\ `Weiter <install-trouble.html>`__   |
+--------------------------------------------+--------------------------------+----------------------------------------+
| 2.9. Die Installation festschreiben?       | `Zum Anfang <index.html>`__    | ?2.11. Fehlersuche                     |
+--------------------------------------------+--------------------------------+----------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.

.. |Eine Netzwerkkarte ausw?hlen| image:: install/ed0-conf.png
.. |Die Netzwerkkarte ed0 konfigurieren| image:: install/ed0-conf2.png
.. |inetd.conf editieren| image:: install/edit-inetd-conf.png
.. |Anonymous-FTP konfigurieren| image:: install/ftp-anon1.png
.. |Begr??ungsmeldung des FTP-Servers editieren| image:: install/ftp-anon2.png
.. |exports editieren| image:: install/nfs-server-edit.png
.. |Merkmale der Systemkonsole| image:: install/console-saver1.png
.. |Bildschirmschoner ausw?hlen| image:: install/console-saver2.png
.. |Den Bildschirmschoner einstellen| image:: install/console-saver3.png
.. |Die Konfiguration der Systemkonsole verlassen| image:: install/console-saver4.png
.. |Das Gebiet ausw?hlen| image:: install/timezone1.png
.. |Das Land ausw?hlen| image:: install/timezone2.png
.. |Die Zeitzone ausw?hlen| image:: install/timezone3.png
.. |Das Mausprotokoll festlegen| image:: install/mouse1.png
.. |Das Mausprotokoll festlegen| image:: install/mouse2.png
.. |Den Mausport einstellen| image:: install/mouse3.png
.. |Den Mausport einstellen| image:: install/mouse4.png
.. |Den Mouse-Daemon aktivieren| image:: install/mouse5.png
.. |Den Mouse-Daemon testen| image:: install/mouse6.png
.. |Die Paketkategorie aussuchen| image:: install/pkg-cat.png
.. |Pakete ausw?hlen| image:: install/pkg-sel.png
.. |Pakete installieren| image:: install/pkg-install.png
.. |Paketinstallation best?tigen| image:: install/pkg-confirm.png
.. |Benutzerkonto ausw?hlen| image:: install/adduser1.png
.. |Benutzerkonto anlegen| image:: install/adduser2.png
.. |Benutzermen? verlassen| image:: install/adduser3.png
.. |Die Installation beenden| image:: install/mainexit.png
.. |Netzwerkdienste – obere H?lfte| image:: install/net-config-menu1.png
.. |Den MTA festlegen| image:: install/mta-main.png
.. |Ntpdate konfigurieren| image:: install/ntp-config.png
.. |Netzwerkdienste – untere H?lfte| image:: install/net-config-menu2.png
