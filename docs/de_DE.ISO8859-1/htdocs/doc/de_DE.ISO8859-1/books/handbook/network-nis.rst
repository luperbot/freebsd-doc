==========================================
31.4. NIS/YP – Network Information Service
==========================================

.. raw:: html

   <div class="navheader">

31.4. NIS/YP – Network Information Service
`Zur?ck <network-nfs.html>`__?
Kapitel 31. Netzwerkserver
?\ `Weiter <network-dhcp.html>`__

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

31.4. NIS/YP – Network Information Service
------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Beigetragen von Bill Swingle.

.. raw:: html

   </div>

.. raw:: html

   <div>

Erweitert von Eric Ogren und Udo Erdelhoff.

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

31.4.1. Was ist NIS?
~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

NIS wurde von Sun Microsystems entwickelt, um UNIX?-Systeme
(urspr?nglich SunOS™) zentral verwalten zu k?nnen. Mittlerweile hat es
sich zu einem Industriestandard entwickelt, der von allen wichtigen
UNIX?-Systemen (Solaris™, HP-UX, AIX?, Linux, NetBSD, OpenBSD, FreeBSD
und anderen) unterst?tzt wird.

NIS war urspr?nglich als *Yellow Pages* bekannt, aus markenrechtlichen
Gr?nden wurde der Name aber ge?ndert. Die alte Bezeichnung (sowie die
Abk?rzung YP) wird aber nach wie vor h?ufig verwendet.

Bei NIS handelt es sich um ein RPC-basiertes Client/Server-System. Eine
Gruppe von Rechnern greift dabei innerhalb einer NIS-Dom?ne auf
gemeinsame Konfigurationsdateien zu. Ein Systemadministrator wird
dadurch in die Lage versetzt, NIS-Clients mit minimalem Aufwand
einzurichten, sowie ?nderungen an der Systemkonfiguration von einem
zentralen Ort aus durchzuf?hren.

Die Funktion entspricht dem Dom?nensystem von Windows?NT?; auch wenn
sich die interne Umsetzung unterscheidet, sind die Basisfunktionen
vergleichbar.

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

31.4.2. Wichtige Prozesse und Begriffe
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Es gibt verschiedene Begriffe und Anwenderprozesse, auf die Sie sto?en
werden, wenn Sie NIS unter FreeBSD einrichten, egal ob Sie einen Server
oder einen Client konfigurieren:

.. raw:: html

   <div class="informaltable">

+-------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Begriff           | Beschreibung                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
+===================+====================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================+
| NIS-Dom?nenname   | Ein NIS-Masterserver sowie alle Clients (inklusive der Slaveserver) haben einen NIS-Dom?nennamen. Dieser hat (?hnlich den Windows?NT?-Dom?nennamen) nichts mit DNS zu tun.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
+-------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| rpcbind           | Muss laufen, damit RPC (Remote Procedure Call, ein von NIS verwendetes Netzwerkprotokoll) funktioniert. NIS-Server sowie Clients funktionieren ohne rpcbind nicht.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
+-------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ypbind            | „Bindet“ einen NIS-Client an seinen NIS-Server. Der Client bezieht den NIS-Dom?nennamen vom System und stellt ?ber das RPC-Protokoll eine Verbindung zum NIS-Server her. ypbind ist der zentrale Bestandteil der Client-Server-Kommunikation in einer NIS-Umgebung. Wird >ypbind auf einem Client beendet, ist dieser nicht mehr in der Lage, auf den NIS-Server zuzugreifen.                                                                                                                                                                                                                                                                                                      |
+-------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ypserv            | Sollte nur auf dem NIS-Server laufen, da es sich um den Serverprozess selbst handelt. Wenn `ypserv(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ypserv&sektion=8>`__ nicht mehr l?uft, kann der Server nicht mehr auf NIS-Anforderungen reagieren (wenn ein Slaveserver existiert, kann dieser als Ersatz fungieren). Einige NIS-Systeme (allerdings nicht das von FreeBSD) versuchen allerdings erst gar nicht, sich mit einem anderen Server zu verbinden, wenn der bisher verwendete Server nicht mehr reagiert. Die einzige L?sung dieses Problems besteht dann darin, den Serverprozess (oder gar den Server selbst) oder den ypbind-Prozess auf dem Client neu zu starten.   |
+-------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| rpc.yppasswdd     | Ein weiterer Prozess, der nur auf dem NIS-Masterserver laufen sollte. Es handelt sich um einen Daemonprozess, der es NIS-Clients erm?glicht, sich auf dem NIS-Masterserver anzumelden, um ihr Passwort zu ?ndern.                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
+-------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

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

31.4.3. Wie funktioniert NIS?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In einer NIS-Umgebung gibt es drei Rechnerarten: Masterserver,
Slaveserver und Clients. Server dienen als zentraler Speicherort f?r
Rechnerkonfigurationen. Masterserver speichern die ma?gebliche Kopie
dieser Informationen, w?hrend Slaveserver diese Informationen aus
Redundanzgr?nden spiegeln. Die Clients beziehen ihre Informationen immer
vom Server.

Auf diese Art und Weise k?nnen Informationen aus verschiedenen Dateien
von mehreren Rechnern gemeinsam verwendet werden. ``master.passwd``,
``group``, und ``hosts`` werden oft gemeinsam ?ber NIS verwendet. Immer,
wenn ein Prozess auf einem Client auf Informationen zugreifen will, die
normalerweise in lokalen Dateien vorhanden w?ren, wird stattdessen eine
Anfrage an den NIS-Server gestellt, an den der Client gebunden ist.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

31.4.3.1. Arten von NIS-Rechnern
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="itemizedlist">

-  

   Ein *NIS-Masterserver* verwaltet, ?hnlich einem
   Windows?NT?-Dom?nencontroller, die von allen NIS-Clients gemeinsam
   verwendeten Dateien. ``passwd``, ``group``, sowie verschiedene andere
   von den Clients verwendete Dateien existieren auf dem Masterserver.

   .. raw:: html

      <div class="note" xmlns="">

   Anmerkung:
   ~~~~~~~~~~

   Ein Rechner kann auch f?r mehrere NIS-Dom?nen als Masterserver
   fungieren. Dieser Abschnitt konzentriert sich im Folgenden allerdings
   auf eine relativ kleine NIS-Umgebung.

   .. raw:: html

      </div>

-  

   *NIS-Slaveserver*. ?hnlich einem Windows?NT?-Backupdom?nencontroller,
   verwalten NIS-Slaveserver Kopien der Daten des NIS-Masterservers.
   NIS-Slaveserver bieten die Redundanz, die f?r kritische Umgebungen
   ben?tigt wird. Zus?tzlich entlasten Slaveserver den Masterserver:
   NIS-Clients verbinden sich immer mit dem NIS-Server, der zuerst
   reagiert. Dieser Server kann auch ein Slaveserver sein.

-  

   *NIS-Clients*. NIS-Clients identifizieren sich gegen?ber dem
   NIS-Server (?hnlich den Windows?NT?-Workstations), um sich am Server
   anzumelden.

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

31.4.4. NIS/YP konfigurieren
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dieser Abschnitt beschreibt an Hand eines Beispiels die Einrichtung
einer NIS-Umgebung.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

31.4.4.1. Planung
^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Nehmen wir an, Sie seien der Administrator eines kleinen
Universit?tsnetzes. Dieses Netz besteht aus f?nfzehn FreeBSD-Rechnern,
f?r die derzeit keine zentrale Verwaltung existiert, jeder Rechner hat
also eine eigene Version von ``/etc/passwd`` und ``/etc/master.passwd``.
Diese Dateien werden manuell synchron gehalten; legen Sie einen neuen
Benutzer an, so muss dies auf allen f?nfzehn Rechnern manuell erledigt
werden (unter Verwendung von ``adduser``). Da diese L?sung sehr
ineffizient ist, soll das Netzwerk in Zukunft NIS verwenden, wobei zwei
der Rechner als Server dienen sollen.

In Zukunft soll das Netz also wie folgt aussehen:

.. raw:: html

   <div class="informaltable">

+-----------------+---------------------+-------------------------------+
| Rechnername     | IP-Adresse          | Rechneraufgabe                |
+=================+=====================+===============================+
| ``ellington``   | ``10.0.0.2``        | NIS-Master                    |
+-----------------+---------------------+-------------------------------+
| ``coltrane``    | ``10.0.0.3``        | NIS-Slave                     |
+-----------------+---------------------+-------------------------------+
| ``basie``       | ``10.0.0.4``        | Workstation der Fakult?t      |
+-----------------+---------------------+-------------------------------+
| ``bird``        | ``10.0.0.5``        | Clientrechner                 |
+-----------------+---------------------+-------------------------------+
| ``cli[1-11]``   | ``10.0.0.[6-17]``   | Verschiedene andere Clients   |
+-----------------+---------------------+-------------------------------+

.. raw:: html

   </div>

Wenn Sie NIS das erste Mal einrichten, ist es ratsam, sich zuerst ?ber
die Vorgangsweise Gedanken zu machen. Unabh?ngig von der Gr??e Ihres
Netzwerks m?ssen Sie stets einige Entscheidungen treffen.

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

31.4.4.1.1. Einen NIS-Dom?nennamen w?hlen
'''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dies muss nicht der „Domainname“ sein. Es handelt sich vielmehr um den
„NIS-Domainnamen“. Wenn ein Client Informationen anfordert, ist in
dieser Anforderung der Name der NIS-Dom?ne enthalten. Dadurch wei? jeder
Server im Netzwerk, auf welche Anforderung er antworten muss. Stellen
Sie sich den NIS-Dom?nennamen als den Namen einer Gruppe von Rechnern
vor, die etwas gemeinsam haben.

Manchmal wird der Name der Internetdom?ne auch f?r die NIS-Dom?ne
verwendet. Dies ist allerdings nicht empfehlenswert, da dies bei der
Behebung von Problemen verwirrend sein kann. Der Name der NIS-Dom?ne
sollte innerhalb Ihres Netzwerks einzigartig sein. Hilfreich ist es,
wenn der Name die Gruppe der in ihr zusammengefassten Rechner
beschreibt. Die Kunstabteilung von Acme Inc. h?tte daher die NIS-Dom?ne
„acme-art“. F?r unser Beispiel verwenden wir den NIS-Dom?nennamen
``test-domain``.

Es gibt jedoch auch Betriebssysteme (vor allem SunOS™), die als
NIS-Dom?nennamen den Name der Internetdom?ne verwenden. Wenn dies f?r
einen oder mehrere Rechner Ihres Netzwerks zutrifft, *m?ssen* Sie den
Namen der Internetdom?ne als Ihren NIS-Dom?nennamen verwenden.

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

31.4.4.1.2. Anforderungen an den Server
'''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn Sie einen NIS-Server einrichten wollen, m?ssen Sie einige Dinge
beachten. Eine unangenehme Eigenschaft von NIS ist die Abh?ngigkeit der
Clients vom Server. Wenn sich der Client nicht ?ber den Server mit
seiner NIS-Dom?ne verbinden kann, wird der Rechner oft unbenutzbar, da
das Fehlen von Benutzer- und Gruppeninformationen zum Einfrieren des
Clients f?hrt. Daher sollten Sie f?r den Server einen Rechner ausw?hlen,
der nicht regelm??ig neu gestartet werden muss und der nicht f?r
Testversuche verwendet wird. Idealerweise handelt es sich um einen
alleinstehenden Rechner, dessen einzige Aufgabe es ist, als NIS-Server
zu dienen. Wenn Sie ein Netzwerk haben, das nicht zu stark ausgelastet
ist, ist es auch m?glich, den NIS-Server als weiteren Dienst auf einem
anderen Rechner laufen zu lassen. Denken Sie aber daran, dass ein
Ausfall des NIS-Servers *alle* NIS-Clients betrifft.

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

31.4.4.2. NIS-Server
^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die verbindlichen Kopien aller NIS-Informationen befinden sich auf einem
einzigen Rechner, dem NIS-Masterserver. Die Datenbanken, in denen die
Informationen gespeichert sind, bezeichnet man als NIS-Maps. Unter
FreeBSD werden diese Maps unter ``/var/yp/[domainname]`` gespeichert,
wobei ``[domainname]`` der Name der NIS-Dom?ne ist. Ein einzelner
NIS-Server kann gleichzeitig mehrere NIS-Dom?nen verwalten, daher k?nnen
auch mehrere Verzeichnisse vorhanden sein. Jede Dom?ne verf?gt ?ber ein
eigenes Verzeichnis sowie einen eigenen, von anderen Dom?nen
unabh?ngigen Satz von NIS-Maps.

NIS-Master- und Slaveserver verwenden den ``ypserv``-Daemon, um
NIS-Anfragen zu bearbeiten. ``ypserv`` empf?ngt eingehende Anfragen der
NIS-Clients, ermittelt aus der angeforderten Dom?ne und Map einen Pfad
zur entsprechenden Datenbank, und sendet die angeforderten Daten von der
Datenbank zum Client.

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

31.4.4.2.1. Einen NIS-Masterserver einrichten
'''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Abh?ngig von Ihren Anforderungen ist die Einrichtung eines
NIS-Masterservers relativ einfach, da NIS von FreeBSD bereits in der
Standardkonfiguration unterst?tzt wird. Sie m?ssen nur folgende Zeilen
in ``/etc/rc.conf`` einf?gen:

.. raw:: html

   <div class="procedure">

#. .. code:: programlisting

       nisdomainname="test-domain"

   Diese Zeile setzt den NIS-Dom?nennamen auf ``test-domain``, wenn Sie
   das Netzwerk initialisieren (beispielsweise nach einem Systemstart).

#. .. code:: programlisting

       nis_server_enable="YES"

   Dadurch werden die NIS-Serverprozesse gestartet.

#. .. code:: programlisting

       nis_yppasswdd_enable="YES"

   Durch diese Zeile wird der ``rpc.yppasswdd``-Daemon aktiviert, der,
   wie bereits erw?hnt, die ?nderung von NIS-Passw?rtern von einem
   Client aus erm?glicht.

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

In Abh?ngigkeit von Ihrer NIS-Konfiguration k?nnen weitere Eintr?ge
erforderlich sein. Weitere Informationen finden Sie im Abschnitt
`NIS-Server, die auch als NIS-Clients
arbeiten <network-nis.html#nis-server-is-client>`__.

.. raw:: html

   </div>

Nachdem Sie obige Parameter konfiguriert haben, m?ssen Sie nur noch
``/etc/netstart`` als Superuser ausf?hren, um alles entsprechend Ihren
Vorgaben in der Datei ``/etc/rc.conf`` einzurichten. Bevor Sie die
NIS-Maps einrichten k?nnen, m?ssen Sie nun noch den ypserv-Daemon
manuell starten:

.. code:: screen

    # service ypserv start

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

31.4.4.2.2. Die NIS-Maps initialisieren
'''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

*NIS-Maps* sind Datenbanken, die sich im Verzeichnis ``/var/yp``
befinden. Sie werden am NIS-Masterserver aus den Konfigurationsdateien
unter ``/etc`` erzeugt. Einzige Ausnahme: ``/etc/master.passwd``. Dies
ist auch sinnvoll, da Sie die Passw?rter f?r Ihr ``root``- oder andere
Administratorkonten nicht an alle Server der NIS-Dom?ne verteilen
wollen. Bevor Sie also die NIS-Maps des Masterservers einrichten,
sollten Sie Folgendes tun:

.. code:: screen

    # cp /etc/master.passwd /var/yp/master.passwd
    # cd /var/yp
    # vi master.passwd

Entfernen Sie alle Systemkonten (wie ``bin``, ``tty``, ``kmem`` oder
``games``), sowie alle Konten, die Sie nicht an die NIS-Clients
weitergeben wollen (beispielsweise ``root`` und alle Konten mit der UID
0 (=Superuser).

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Stellen Sie sicher, dass ``/var/yp/master.passwd`` weder von der Gruppe
noch von der Welt gelesen werden kann (Zugriffsmodus 600)! Ist dies
nicht der Fall, ?ndern Sie dies mit ``chmod``.

.. raw:: html

   </div>

Nun k?nnen Sie die NIS-Maps initialisieren. FreeBSD verwendet daf?r das
Skript ``ypinit`` (lesen Sie dazu auch
`ypinit(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ypinit&sektion=8>`__).
Dieses Skript ist auf fast allen UNIX-Betriebssystemen verf?gbar. Bei
Digitals Unix/Compaq Tru64 UNIX nennt es sich allerdings ``ypsetup``. Da
wir Maps f?r einen NIS-Masterserver erzeugen, verwenden wir ``ypinit``
mit der Option ``-m``. Nachdem Sie die beschriebenen Aktionen
durchgef?hrt haben, erzeugen Sie nun die NIS-Maps:

.. code:: screen

    ellington# ypinit -m test-domain
    Server Type: MASTER Domain: test-domain
    Creating an YP server will require that you answer a few questions.
    Questions will all be asked at the beginning of the procedure.
    Do you want this procedure to quit on non-fatal errors? [y/n: n] n
    Ok, please remember to go back and redo manually whatever fails.
    If you don't, something might not work.
    At this point, we have to construct a list of this domains YP servers.
    rod.darktech.org is already known as master server.
    Please continue to add any slave servers, one per line. When you are
    done with the list, type a <control D>.
    master server   :  ellington
    next host to add:  coltrane
    next host to add:  ^D
    The current list of NIS servers looks like this:
    ellington
    coltrane
    Is this correct?  [y/n: y] y

    [..output from map generation..]

    NIS Map update completed.
    ellington has been setup as an YP master server without any errors.

Dadurch erzeugt ``ypinit`` ``/var/yp/Makefile`` aus der Datei
``/var/yp/Makefile.dist``. Durch diese Datei wird festgelegt, dass Sie
in einer NIS-Umgebung mit nur einem Server arbeiten und dass alle
Clients unter FreeBSD laufen. Da ``test-domain`` aber auch ?ber einen
Slaveserver verf?gt, m?ssen Sie ``/var/yp/Makefile`` entsprechend
anpassen:

.. code:: screen

    ellington# vi /var/yp/Makefile

Sie sollten die Zeile

.. code:: programlisting

    NOPUSH = "True"

auskommentieren (falls dies nicht bereits der Fall ist).

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

31.4.4.2.3. Einen NIS-Slaveserver einrichten
''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Ein NIS-Slaveserver ist noch einfacher einzurichten als ein
Masterserver. Melden Sie sich am Slaveserver an und ?ndern Sie
``/etc/rc.conf`` analog zum Masterserver. Der einzige Unterschied
besteht in der Verwendung der Option ``-s``, wenn Sie ``ypinit``
aufrufen. Die Option ``-s`` erfordert den Namen des NIS-Masterservers,
daher sieht unsere Ein- und Ausgabe wie folgt aus:

.. code:: screen

    coltrane# ypinit -s ellington test-domain

    Server Type: SLAVE Domain: test-domain Master: ellington

    Creating an YP server will require that you answer a few questions.
    Questions will all be asked at the beginning of the procedure.

    Do you want this procedure to quit on non-fatal errors? [y/n: n]  n

    Ok, please remember to go back and redo manually whatever fails.
    If you don't, something might not work.
    There will be no further questions. The remainder of the procedure
    should take a few minutes, to copy the databases from ellington.
    Transferring netgroup...
    ypxfr: Exiting: Map successfully transferred
    Transferring netgroup.byuser...
    ypxfr: Exiting: Map successfully transferred
    Transferring netgroup.byhost...
    ypxfr: Exiting: Map successfully transferred
    Transferring master.passwd.byuid...
    ypxfr: Exiting: Map successfully transferred
    Transferring passwd.byuid...
    ypxfr: Exiting: Map successfully transferred
    Transferring passwd.byname...
    ypxfr: Exiting: Map successfully transferred
    Transferring group.bygid...
    ypxfr: Exiting: Map successfully transferred
    Transferring group.byname...
    ypxfr: Exiting: Map successfully transferred
    Transferring services.byname...
    ypxfr: Exiting: Map successfully transferred
    Transferring rpc.bynumber...
    ypxfr: Exiting: Map successfully transferred
    Transferring rpc.byname...
    ypxfr: Exiting: Map successfully transferred
    Transferring protocols.byname...
    ypxfr: Exiting: Map successfully transferred
    Transferring master.passwd.byname...
    ypxfr: Exiting: Map successfully transferred
    Transferring networks.byname...
    ypxfr: Exiting: Map successfully transferred
    Transferring networks.byaddr...
    ypxfr: Exiting: Map successfully transferred
    Transferring netid.byname...
    ypxfr: Exiting: Map successfully transferred
    Transferring hosts.byaddr...
    ypxfr: Exiting: Map successfully transferred
    Transferring protocols.bynumber...
    ypxfr: Exiting: Map successfully transferred
    Transferring ypservers...
    ypxfr: Exiting: Map successfully transferred
    Transferring hosts.byname...
    ypxfr: Exiting: Map successfully transferred

    coltrane has been setup as an YP slave server without any errors.
    Don't forget to update map ypservers on ellington.

Sie sollten nun ?ber das Verzeichnis ``/var/yp/test-domain`` verf?gen.
Die Kopien der NIS-Masterserver-Maps sollten sich in diesem Verzeichnis
befinden. Allerdings m?ssen Sie diese auch aktuell halten. Die folgenden
Eintr?ge in ``/etc/crontab`` erledigen diese Aufgabe:

.. code:: programlisting

    20      *       *       *       *       root   /usr/libexec/ypxfr passwd.byname
    21      *       *       *       *       root   /usr/libexec/ypxfr passwd.byuid

Diese zwei Zeilen zwingen den Slaveserver, seine Maps mit denen des
Masterservers zu synchronisieren. Diese Eintr?ge sind nicht zwar nicht
unbedingt n?tig, da der Masterserver automatisch versucht, alle
?nderungen seiner NIS-Maps an seine Slaveserver weiterzugeben. Da
Passwortinformationen aber auch f?r nur vom Slaveserver abh?ngige
Systeme vital sind, ist es eine gute Idee, diese Aktualisierungen zu
erzwingen. Besonders wichtig ist dies in stark ausgelasteten Netzen, in
denen Map-Aktualisierungen unvollst?ndig sein k?nnten.

F?hren Sie nun ``/etc/netstart`` auch auf dem Slaveserver aus, um den
NIS-Server erneut zu starten.

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

31.4.4.3. NIS-Clients
^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Ein NIS-Client ``bindet`` sich unter Verwendung des ``ypbind``-Daemons
an einen NIS-Server. ``ypbind`` pr?ft die Standarddom?ne des Systems
(die durch ``domainname`` gesetzt wird), und beginnt RPCs ?ber das
lokale Netzwerk zu verteilen (broadcast). Diese Anforderungen legen den
Namen der Dom?ne fest, f?r die ``ypbind`` eine Bindung erzeugen will.
Wenn der Server der entsprechenden Dom?ne eine solche Anforderung
erh?lt, schickt er eine Antwort an ``ypbind``. ``ybind`` speichert
daraufhin die Adresse des Servers. Wenn mehrere Server verf?gbar sind
(beispielsweise ein Master- und mehrere Slaveserver), verwendet
``ypbind`` die erste erhaltene Adresse. Ab diesem Zeitpunkt richtet der
Client alle Anfragen an genau diesen Server. ``ypbind`` „pingt“ den
Server gelegentlich an, um sicherzustellen, dass der Server
funktioniert. Antwortet der Server innerhalb eines bestimmten Zeitraums
nicht (Timeout), markiert ``ypbind`` die Dom?ne als ungebunden und
beginnt erneut, RPCs ?ber das Netzwerk zu verteilen, um einen anderen
Server zu finden.

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

31.4.4.3.1. Einen NIS-Client konfigurieren
''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Einen FreeBSD-Rechner als NIS-Client einzurichten, ist recht einfach.

.. raw:: html

   <div class="procedure">

#. F?gen Sie folgende Zeilen in ``/etc/rc.conf`` ein, um den
   NIS-Dom?nennamen festzulegen, und um ``ypbind`` bei der
   Initialisierung des Netzwerks zu starten:

   .. code:: programlisting

       nisdomainname="test-domain"
       nis_client_enable="YES"

#. Um alle Passworteintr?ge des NIS-Servers zu importieren, l?schen Sie
   alle Benutzerkonten in ``/etc/master.passwd`` und f?gen mit ``vipw``
   folgende Zeile am Ende der Datei ein:

   .. code:: programlisting

       +:::::::::

   .. raw:: html

      <div class="note" xmlns="">

   Anmerkung:
   ~~~~~~~~~~

   Diese Zeile legt f?r alle g?ltigen Benutzerkonten der NIS-Server-Maps
   einen Zugang an. Es gibt verschiedene Wege, Ihren NIS-Client durch
   ?nderung dieser Zeile zu konfigurieren. Lesen Sie dazu auch den
   Abschnitt ?ber `Netzgruppen <network-nis.html#netgroups>`__ weiter
   unten. Weitere detaillierte Informationen finden Sie im Buch
   ``Managing NFS and NIS`` von O'Reilly.

   .. raw:: html

      </div>

   .. raw:: html

      <div class="note" xmlns="">

   Anmerkung:
   ~~~~~~~~~~

   Sie sollten zumindest ein lokales Benutzerkonto, das nicht ?ber NIS
   importiert wird, in Ihrer ``/etc/master.passwd`` behalten. Dieser
   Benutzer sollte au?erdem ein Mitglied der Gruppe ``wheel`` sein. Wenn
   es mit NIS Probleme gibt, k?nnen Sie diesen Zugang verwenden, um sich
   anzumelden, ``root`` zu werden und das Problem zu beheben.

   .. raw:: html

      </div>

#. Um alle m?glichen Gruppeneintr?ge vom NIS-Server zu importieren,
   f?gen sie folgende Zeile in ``/etc/group`` ein:

   .. code:: programlisting

       +:*::

.. raw:: html

   </div>

Um den NIS-Client sofort zu starten, f?hren Sie als Superuser die
folgenden Befehle aus:

.. code:: screen

    # /etc/netstart
    # service ypbind start

Nachdem Sie diese Schritte erledigt haben, sollten Sie mit
``ypcat passwd`` die ``passwd-Map`` des NIS-Servers anzeigen k?nnen.

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

31.4.5. Sicherheit unter NIS
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Im Allgemeinen kann jeder entfernte Anwender einen RPC an
`ypserv(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ypserv&sektion=8>`__
schicken, um den Inhalt Ihrer NIS-Maps abzurufen, falls er Ihren
NIS-Dom?nennamen kennt. Um solche unautorisierten Transaktionen zu
verhindern, unterst?tzt
`ypserv(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ypserv&sektion=8>`__
„securenets“, durch die man den Zugriff auf bestimmte Rechner
beschr?nken kann.
`ypserv(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ypserv&sektion=8>`__
versucht, beim Systemstart die Informationen ?ber ``securenets`` aus der
Datei ``/var/yp/securenets`` zu laden.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Die Datei ``securenets`` kann auch in einem anderen Verzeichnis stehen,
das mit der Option ``-p`` angegeben wird. Diese Datei enth?lt Eintr?ge,
die aus einer Netzwerkadresse und einer Netzmaske bestehen, die durch
Leerzeichen getrennt werden. Kommentarzeilen beginnen mit „#“.
``/var/yp/securnets`` k?nnte beispielsweise so aussehen:

.. raw:: html

   </div>

.. code:: programlisting

    # allow connections from local host -- mandatory
    127.0.0.1     255.255.255.255
    # allow connections from any host
    # on the 192.168.128.0 network
    192.168.128.0 255.255.255.0
    # allow connections from any host
    # between 10.0.0.0 to 10.0.15.255
    # this includes the machines in the testlab
    10.0.0.0      255.255.240.0

Wenn
`ypserv(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ypserv&sektion=8>`__
eine Anforderung von einer zu diesen Regeln passenden Adresse erh?lt,
wird die Anforderung bearbeitet. Gibt es keine passende Regel, wird die
Anforderung ignoriert und eine Warnmeldung aufgezeichnet. Wenn
``/var/yp/securenets`` nicht vorhanden ist, erlaubt ``ypserv``
Verbindungen von jedem Rechner aus.

``ypserv`` unterst?tzt auch das TCP-Wrapper-Paket von Wietse Venema. Mit
diesem Paket kann der Administrator f?r Zugriffskontrollen die
Konfigurationsdateien von TCP-Wrapper anstelle von
``/var/yp/securenets`` verwenden.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

W?hrend beide Kontrollmechanismen einige Sicherheit gew?hren,
beispielsweise durch privilegierte Ports, sind sie gegen?ber „IP
spoofing“-Attacken verwundbar. Jeder NIS-Verkehr sollte daher von Ihrer
Firewall blockiert werden.

Server, die ``/var/yp/securenets`` verwenden, k?nnen Schwierigkeiten bei
der Anmeldung von Clients haben, die ein veraltetes TCP/IP-Subsystem
besitzen. Einige dieser TCP/IP-Subsysteme setzen alle Rechnerbits auf
Null, wenn Sie einen ``Broadcast`` durchf?hren und/oder k?nnen die
Subnetzmaske nicht auslesen, wenn sie die Broadcast-Adresse berechnen.
Einige Probleme k?nnen durch ?nderungen der Clientkonfiguration behoben
werden. Andere hingegen lassen sich nur durch das Entfernen des
betreffenden Rechners aus dem Netzwerk oder den Verzicht auf
``/var/yp/securenets`` umgehen.

Die Verwendung von ``/var/yp/securenets`` auf einem Server mit einem
solch veralteten TCP/IP-Subsystem ist eine sehr schlechte Idee, die zu
einem Verlust der NIS-Funktionalit?t f?r gro?e Teile Ihres Netzwerks
f?hren kann.

Die Verwendung der TCP-Wrapper verlangsamt die Reaktion Ihres
NIS-Servers. Diese zus?tzliche Reaktionszeit kann in Clientprogrammen zu
Timeouts f?hren. Dies vor allem in Netzwerken, die stark ausgelastet
sind, oder nur ?ber langsame NIS-Server verf?gen. Wenn ein oder mehrere
Ihrer Clientsysteme dieses Problem aufweisen, sollten Sie die
betreffenden Clients in NIS-Slaveserver umwandeln, und diese an sich
selbst binden.

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

31.4.6. Bestimmte Benutzer an der Anmeldung hindern
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In unserem Labor gibt es den Rechner ``basie``, der nur f?r Mitarbeiter
der Fakult?t bestimmt ist. Wir wollen diesen Rechner nicht aus der
NIS-Dom?ne entfernen, obwohl ``passwd`` des NIS-Masterservers
Benutzerkonten sowohl f?r Fakult?tsmitarbeiter als auch f?r Studenten
enth?lt. Was k?nnen wir also tun?

Es gibt eine M?glichkeit, bestimmte Benutzer an der Anmeldung an einem
bestimmten Rechner zu hindern, selbst wenn diese in der NIS-Datenbank
vorhanden sind. Dazu m?ssen Sie lediglich an diesem Rechner den Eintrag
``-Benutzername`` und die richtige Anzahl von von Doppelpunkten an das
Ende von ``/etc/master.passwd`` setzen, wobei *``Benutzername``* der zu
blockierende Benutzername ist. Die Zeile mit dem geblockten Benutzer
muss dabei vor der ``+`` Zeile, f?r zugelassene Benutzer stehen. Diese
?nderung sollte bevorzugt durch ``vipw`` erledigt werden, da ``vipw``
Ihre ?nderungen an ``/etc/master.passwd`` auf Plausibilit?t ?berpr?ft
und nach erfolgter ?nderung die Passwortdatenbank automatisch
aktualisiert. Um also den Benutzer ``bill`` an der Anmeldung am Rechner
``basie`` zu hindern, gehen wir wie folgt vor:

.. code:: screen

    basie# vipw
    [add -bill to the end, exit]
    vipw: rebuilding the database...
    vipw: done

    basie# cat /etc/master.passwd

    root:[password]:0:0::0:0:The super-user:/root:/bin/csh
    toor:[password]:0:0::0:0:The other super-user:/root:/bin/sh
    daemon:*:1:1::0:0:Owner of many system processes:/root:/sbin/nologin
    operator:*:2:5::0:0:System &:/:/sbin/nologin
    bin:*:3:7::0:0:Binaries Commands and Source,,,:/:/sbin/nologin
    tty:*:4:65533::0:0:Tty Sandbox:/:/sbin/nologin
    kmem:*:5:65533::0:0:KMem Sandbox:/:/sbin/nologin
    games:*:7:13::0:0:Games pseudo-user:/usr/games:/sbin/nologin
    news:*:8:8::0:0:News Subsystem:/:/sbin/nologin
    man:*:9:9::0:0:Mister Man Pages:/usr/share/man:/sbin/nologin
    bind:*:53:53::0:0:Bind Sandbox:/:/sbin/nologin
    uucp:*:66:66::0:0:UUCP pseudo-user:/var/spool/uucppublic:/usr/libexec/uucp/uucico
    xten:*:67:67::0:0:X-10 daemon:/usr/local/xten:/sbin/nologin
    pop:*:68:6::0:0:Post Office Owner:/nonexistent:/sbin/nologin
    nobody:*:65534:65534::0:0:Unprivileged user:/nonexistent:/sbin/nologin
    -bill:::::::::
    +:::::::::

    basie#

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

31.4.7. Netzgruppen verwenden
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div>

Beigetragen von Udo Erdelhoff.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die im letzten Abschnitt beschriebene Methode eignet sich besonders,
wenn Sie spezielle Regeln f?r wenige Benutzer oder wenige Rechner
ben?tigen. In gro?en Netzwerken werden Sie allerdings *mit Sicherheit*
vergessen, einige Benutzer von der Anmeldung an bestimmten Rechnern
auszuschlie?en. Oder Sie werden gezwungen sein, jeden Rechner einzeln zu
konfigurieren. Dadurch verlieren Sie aber den Hauptvorteil von NIS, die
*zentrale* Verwaltung.

Die L?sung f?r dieses Problem sind *Netzgruppen*. Ihre Aufgabe und
Bedeutung ist vergleichbar mit normalen, von UNIX-Dateisystemen
verwendeten Gruppen. Die Hauptunterschiede sind das Fehlen einer
numerischen ID sowie die M?glichkeit, Netzgruppen zu definieren, die
sowohl Benutzer als auch andere Netzgruppen enthalten.

Netzgruppen wurden entwickelt, um gro?e, komplexe Netzwerke mit
Hunderten Benutzern und Rechnern zu verwalten. Sie sind also von
Vorteil, wenn Sie von dieser Situation betroffen sind. Andererseits ist
es dadurch beinahe unm?glich, Netzgruppen mit einfachen Beispielen zu
erkl?ren. Das hier verwendete Beispiel veranschaulicht dieses Problem.

Nehmen wir an, dass Ihre erfolgreiche Einf?hrung von NIS die
Aufmerksamkeit Ihrer Vorgesetzten geweckt hat. Ihre n?chste Aufgabe
besteht nun darin, Ihre NIS-Dom?ne um zus?tzliche Rechner zu erweitern.
Die folgenden Tabellen enthalten die neuen Benutzer und Rechner
inklusive einer kurzen Beschreibung.

.. raw:: html

   <div class="informaltable">

+-----------------------------------------+----------------------------------------+
| Benutzername(n)                         | Beschreibung                           |
+=========================================+========================================+
| ``alpha``, ``beta``                     | Besch?ftigte der IT-Abteilung          |
+-----------------------------------------+----------------------------------------+
| ``charlie``, ``delta``                  | Die neuen Lehrlinge der IT-Abteilung   |
+-----------------------------------------+----------------------------------------+
| ``echo``, ``foxtrott``, ``golf``, ...   | Normale Mitarbeiter                    |
+-----------------------------------------+----------------------------------------+
| ``able``, ``baker``, ...                | Externe Mitarbeiter                    |
+-----------------------------------------+----------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+------------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------+
| Rechnername(n)                                                   | Beschreibung                                                                                              |
+==================================================================+===========================================================================================================+
| ``war``, ``death``, ``famine``, ``pollution``                    | Ihre wichtigsten Server. Nur IT-Fachleute d?rfen sich an diesen Rechnern anmelden.                        |
+------------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------+
| ``pride``, ``greed``, ``envy``, ``wrath``, ``lust``, ``sloth``   | Weniger wichtige Server. Alle Mitarbeiter der IT-Abteilung d?rfen sich auf diesen Rechnern anmelden.      |
+------------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------+
| ``one``, ``two``, ``three``, ``four``, ...                       | Gew?hnliche Arbeitsrechner. Nur die *wirklichen* Mitarbeiter d?rfen diese Rechner verwenden.              |
+------------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------+
| ``trashcan``                                                     | Ein sehr alter Rechner ohne kritische Daten. Sogar externe Mitarbeiter d?rfen diesen Rechner verwenden.   |
+------------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

Wollten Sie diese Einschr?nkungen umsetzen, indem Sie jeden Benutzer
einzeln blockieren, m?ssten Sie auf jedem System f?r jeden Benutzer eine
entsprechende Zeile in ``passwd`` einf?gen. Wenn Sie nur einen Eintrag
vergessen, haben Sie ein Problem. Es mag noch angehen, dies w?hrend der
ersten Installation zu erledigen, im t?glichen Betrieb werden Sie
allerdings *mit Sicherheit* einmal vergessen, die entsprechenden
Eintr?ge anzulegen. Vergessen Sie nicht: Murphy war Optimist.

Die Verwendung von Netzgruppen hat in dieser Situation mehrere Vorteile.
Sie m?ssen nicht jeden Benutzer einzeln verwalten; weisen Sie
stattdessen den Benutzer einer Netzgruppe zu und erlauben oder verbieten
Sie allen Mitglieder dieser Gruppe die Anmeldung an einem Server. Wenn
Sie einen neuen Rechner hinzuf?gen, m?ssen Sie Zugangsbeschr?nkungen nur
f?r die Netzgruppen festlegen. Legen Sie einen neuen Benutzer an, m?ssen
Sie ihn nur einer oder mehrere Netzgruppen zuweisen. Diese Ver?nderungen
sind voneinander unabh?ngig; Anweisungen der Form „f?r diese Kombination
aus Benutzer und Rechner mache Folgendes ...“ sind nicht mehr n?tig.
Wenn Sie die Einrichtung von NIS sorgf?ltig geplant haben, m?ssen Sie
nur noch eine zentrale Konfigurationsdatei bearbeiten, um den Zugriff
auf bestimmte Rechner zu erlauben oder zu verbieten.

Der erste Schritt ist die Initialisierung der NIS-Maps der Netzgruppe.
`ypinit(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ypinit&sektion=8>`__
kann dies unter FreeBSD nicht automatisch durchf?hren. Sind die Maps
aber erst einmal erzeugt, werden sie jedoch von NIS problemlos
unterst?tzt. Um eine leere Map zu erzeugen, geben Sie Folgendes ein:

.. code:: screen

    ellington# vi /var/yp/netgroup

Danach legen Sie die Eintr?ge an. F?r unser Beispiel ben?tigen wir
mindestens vier Netzgruppen: IT-Besch?ftige, IT-Lehrlinge, normale
Besch?ftigte sowie Externe.

.. code:: programlisting

    IT_EMP  (,alpha,test-domain)    (,beta,test-domain)
    IT_APP  (,charlie,test-domain)  (,delta,test-domain)
    USERS   (,echo,test-domain)     (,foxtrott,test-domain) \
            (,golf,test-domain)
    INTERNS (,able,test-domain)     (,baker,test-domain)

Bei ``IT_EMP``, ``IT_APP`` usw. handelt es sich um Netzgruppennamen. In
den Klammern werden diesen Netzgruppen jeweils ein oder mehrere
Benutzerkonten hinzugef?gt. Die drei Felder in der Klammer haben
folgende Bedeutung:

.. raw:: html

   <div class="orderedlist">

#. Der Name des Rechners, auf dem die folgenden Werte g?ltig sind. Legen
   Sie keinen Rechnernamen fest, ist der Eintrag auf allen Rechnern
   g?ltig. Dadurch gehen Sie vielen Problemen aus dem Weg.

#. Der Name des Benutzerkontos, der zu dieser Netzgruppe geh?rt.

#. Die NIS-Dom?ne f?r das Benutzerkonto. Sie k?nnen Benutzerkonten von
   anderen NIS-Dom?nen in Ihre Netzgruppe importieren, wenn Sie mehrere
   NIS-Dom?nen verwalten.

.. raw:: html

   </div>

Jedes Feld kann Wildcards enthalten. Die Einzelheiten entnehmen Sie
bitte
`netgroup(5) <http://www.FreeBSD.org/cgi/man.cgi?query=netgroup&sektion=5>`__.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Netzgruppennamen sollten nicht l?nger als 8 Zeichen sein, vor allem
dann, wenn Sie Rechner mit verschiedenen Betriebssystemen in Ihrer
NIS-Dom?ne haben. Es wird zwischen Gro?- und Kleinschreibung
unterschieden. Die Verwendung von Gro?buchstaben f?r Netzgruppennamen
erm?glicht eine leichte Unterscheidung zwischen Benutzern, Rechnern und
Netzgruppen.

Einige NIS-Clients (dies gilt nicht f?r FreeBSD) k?nnen keine
Netzgruppen mit einer gro?en Anzahl von Eintr?gen verwalten. Einige
?ltere Versionen von SunOS™ haben beispielsweise Probleme, wenn
Netzgruppen mehr als f?nfzehn *Eintr?ge* enthalten. Sie k?nnen dieses
Problem umgehen, indem Sie mehrere Subnetzgruppen mit weniger als
f?nfzehn Benutzern anlegen und diese Subnetzgruppen wiederum in einer
Netzgruppe zusammenfassen:

.. code:: programlisting

    BIGGRP1  (,joe1,domain)  (,joe2,domain)  (,joe3,domain) [...]
    BIGGRP2  (,joe16,domain)  (,joe17,domain) [...]
    BIGGRP3  (,joe31,domain)  (,joe32,domain)
    BIGGROUP  BIGGRP1 BIGGRP2 BIGGRP3

Sie k?nnen diesen Vorgang wiederholen, wenn Sie mehr als 255 Benutzer in
einer einzigen Netzgruppe ben?tigen.

.. raw:: html

   </div>

Das Aktivieren und Verteilen Ihre neuen NIS-Map ist einfach:

.. code:: screen

    ellington# cd /var/yp
    ellington# make

Dadurch werden die NIS-Maps ``netgroup``, ``netgroup.byhost`` und
``netgroup.byuser`` erzeugt. Pr?fen Sie die Verf?gbarkeit Ihrer neuen
NIS-Maps mit
`ypcat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ypcat&sektion=1>`__.

.. code:: screen

    ellington% ypcat -k netgroup
    ellington% ypcat -k netgroup.byhost
    ellington% ypcat -k netgroup.byuser

Die Ausgabe des ersten Befehls gibt den Inhalt von ``/var/yp/netgroup``
wieder. Der zweite Befehl erzeugt nur dann eine Ausgabe, wenn Sie
rechnerspezifische Netzgruppen erzeugt haben. Der dritte Befehl gibt die
Netzgruppen nach Benutzern sortiert aus.

Die Einrichtung der Clients ist einfach. Sie m?ssen lediglich auf dem
Server ``war``
`vipw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=vipw&sektion=8>`__
aufrufen und die Zeile

.. code:: programlisting

    +:::::::::

durch

.. code:: programlisting

    +@IT_EMP:::::::::

ersetzen.

Ab sofort werden nur noch die Daten der in der Netzgruppe ``IT_EMP``
vorhandenen Benutzer in die Passwortdatenbank von ``war`` importiert.
Nur diese Benutzer d?rfen sich am Server anmelden.

Ungl?cklicherweise gilt diese Einschr?nkung auch f?r die ``~``-Funktion
der Shell und f?r alle Routinen, die auf Benutzernamen und numerische
Benutzer-IDs zugreifen. Oder anders formuliert, ``cd ~user`` ist nicht
m?glich, ``ls -l`` zeigt die numerische Benutzer-ID statt dem
Benutzernamen und ``find . -user joe -print`` erzeugt die Fehlermeldung
No such user. Um dieses Problem zu beheben, m?ssen Sie alle
Benutzereintr?ge importieren, *ohne ihnen jedoch zu erlauben, sich an
Ihrem Server anzumelden*.

Dazu f?gen Sie eine weitere Zeile in ``/etc/master.passwd`` ein. Diese
Zeile sollte ?hnlich der folgenden aussehen:

``+:::::::::/sbin/nologin``, was in etwa „Importiere alle Eintr?ge, aber
ersetze die Shell in den importierten Eintr?gen durch ``/sbin/nologin``“
entspricht. Sie k?nnen jedes Feld dieses Eintrages ersetzen, indem Sie
einen Standardwert in ``/etc/master.passwd`` eintragen.

.. raw:: html

   <div class="warning" xmlns="">

Warnung:
~~~~~~~~

Stellen Sie sicher, dass die Zeile ``+:::::::::/sbin/nologin`` *nach*
der Zeile ``+@IT_EMP:::::::::`` eingetragen ist. Sonst haben alle via
NIS importierten Benutzerkonten ``/sbin/nologin`` als Loginshell.

.. raw:: html

   </div>

Danach m?ssen Sie nur mehr eine einzige NIS-Map ?ndern, wenn ein neuer
Mitarbeiter ber?cksichtigt werden muss. F?r weniger wichtige Server
gehen Sie analog vor, indem Sie den alten Eintrag ``+:::::::::`` in den
lokalen Versionen von ``/etc/master.passwd`` durch folgende Eintr?ge
ersetzen:

.. code:: programlisting

    +@IT_EMP:::::::::
    +@IT_APP:::::::::
    +:::::::::/sbin/nologin

Die entsprechenden Zeilen f?r normale Arbeitspl?tze lauten:

.. code:: programlisting

    +@IT_EMP:::::::::
    +@USERS:::::::::
    +:::::::::/sbin/nologin

Ab jetzt w?re alles wunderbar, allerdings ?ndert sich kurz darauf die
Firmenpolitik: Die IT-Abteilung beginnt damit, externe Mitarbeiter zu
besch?ftigen. Externe d?rfen sich an normalen Arbeitspl?tzen sowie an
den weniger wichtigen Servern anmelden. Die IT-Lehrlinge d?rfen sich nun
auch an den Hauptservern anmelden. Sie legen also die neue Netzgruppe
``IT_INTERN`` an, weisen Ihr die neuen IT-Externen als Benutzer zu und
beginnen damit, die Konfiguration auf jedem einzelnen Rechner zu ?ndern
... Halt. Sie haben gerade die alte Regel „Fehler in der zentralisierten
Planung f?hren zu globaler Verwirrung.“ best?tigt.

Da NIS in der Lage ist, Netzgruppen aus anderen Netzgruppen zu bilden,
lassen sich solche Situationen leicht vermeiden. Eine M?glichkeit ist
die Erzeugung rollenbasierter Netzgruppen. Sie k?nnten eine Netzgruppe
``BIGSRV`` erzeugen, um den Zugang zu den wichtigsten Servern zu
beschr?nken, eine weitere Gruppe ``SMALLSRV`` f?r die weniger wichtigen
Server und eine dritte Netzgruppe ``USERBOX`` f?r die normalen
Arbeitsplatzrechner. Jede dieser Netzgruppen enth?lt die Netzgruppen,
die sich auf diesen Rechnern anmelden d?rfen. Die Eintr?ge der
Netzgruppen in der NIS-Map sollten ?hnlich den folgenden aussehen:

.. code:: programlisting

    BIGSRV    IT_EMP  IT_APP
    SMALLSRV  IT_EMP  IT_APP  ITINTERN
    USERBOX   IT_EMP  ITINTERN USERS

Diese Methode funktioniert besonders gut, wenn Sie Rechner in Gruppen
mit identischen Beschr?nkungen einteilen k?nnen. Ungl?cklicherweise ist
dies die Ausnahme und nicht die Regel. Meistens werden Sie die
M?glichkeit zur rechnerspezischen Zugangsbeschr?nkung ben?tigen.

Rechnerspezifische Netzgruppen sind die zweite M?glichkeit, um mit den
oben beschriebenen ?nderungen umzugehen. In diesem Szenario enth?lt
``/etc/master.passwd`` auf jedem Rechner zwei mit „+“ beginnende Zeilen.
Die erste Zeile legt die Netzgruppe mit den Benutzern fest, die sich auf
diesem Rechner anmelden d?rfen. Die zweite Zeile weist allen anderen
Benutzern ``/sbin/nologin`` als Shell zu. Verwenden Sie auch hier
(analog zu den Netzgruppen) Gro?buchstaben f?r die Rechnernamen. Die
Zeilen sollten also ?hnlich den folgenden aussehen:

.. code:: programlisting

    +@BOXNAME:::::::::
    +:::::::::/sbin/nologin

Wenn Sie dies f?r alle Rechner erledigt haben, werden Sie die lokalen
Versionen von ``/etc/master.passwd`` nie mehr ver?ndern m?ssen. Alle
weiteren ?nderungen geschehen ?ber die NIS-Maps. Nachfolgend ein
Beispiel f?r eine m?gliche Netzgruppen-Map, die durch einige
Besonderheiten erweitert wurde:

.. code:: programlisting

    # Define groups of users first
    IT_EMP    (,alpha,test-domain)    (,beta,test-domain)
    IT_APP    (,charlie,test-domain)  (,delta,test-domain)
    DEPT1     (,echo,test-domain)     (,foxtrott,test-domain)
    DEPT2     (,golf,test-domain)     (,hotel,test-domain)
    DEPT3     (,india,test-domain)    (,juliet,test-domain)
    ITINTERN  (,kilo,test-domain)     (,lima,test-domain)
    D_INTERNS (,able,test-domain)     (,baker,test-domain)
    #
    # Now, define some groups based on roles
    USERS     DEPT1   DEPT2     DEPT3
    BIGSRV    IT_EMP  IT_APP
    SMALLSRV  IT_EMP  IT_APP    ITINTERN
    USERBOX   IT_EMP  ITINTERN  USERS
    #
    # And a groups for a special tasks
    # Allow echo and golf to access our anti-virus-machine
    SECURITY  IT_EMP  (,echo,test-domain)  (,golf,test-domain)
    #
    # machine-based netgroups
    # Our main servers
    WAR       BIGSRV
    FAMINE    BIGSRV
    # User india needs access to this server
    POLLUTION  BIGSRV  (,india,test-domain)
    #
    # This one is really important and needs more access restrictions
    DEATH     IT_EMP
    #
    # The anti-virus-machine mentioned above
    ONE       SECURITY
    #
    # Restrict a machine to a single user
    TWO       (,hotel,test-domain)
    # [...more groups to follow]
          

Wenn Sie eine Datenbank verwenden, um Ihre Benutzerkonten zu verwalten,
sollten Sie den ersten Teil der NIS-Map mit Ihren Datenbanktools
erstellen k?nnen. Auf diese Weise haben neue Benutzer automatisch
Zugriff auf die Rechner.

Eine letzte Warnung: Es ist nicht immer ratsam, rechnerbasierte
Netzgruppen zu verwenden. Wenn Sie Dutzende oder gar Hunderte identische
Rechner einrichten m?ssen, sollten Sie rollenbasierte Netzgruppen
verwenden, um die Gr?sse der NISs-Maps in Grenzen zu halten.

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

31.4.8. Weitere wichtige Punkte
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Nachdem Sie Ihre NIS-Umgebung eingerichtet haben, m?ssen Sie einige
Dinge anders als bisher erledigen.

.. raw:: html

   <div class="itemizedlist">

-  Jedes Mal, wenn Sie einen neuen Benutzer anlegen wollen, tun Sie dies
   *ausschlie?lich* am NIS-Masterserver. Au?erdem *m?ssen* Sie
   anschlie?end die NIS-Maps neu erzeugen. Wenn Sie diesen Punkt
   vergessen, kann sich der neue Benutzer *nur* am NIS-Masterserver
   anmelden. Wenn Sie also den neuen Benutzer ``jsmith`` anlegen, gehen
   Sie folgerndermassen vor:

   .. code:: screen

       # pw useradd jsmith
       # cd /var/yp
       # make test-domain

   Statt ``pw useradd jsmith`` k?nnten Sie auch ``adduser jsmith``
   verwenden.

-  *Tragen Sie die Administratorkonten nicht in die NIS-Maps ein*.
   Administratorkonten und Passw?rter d?rfen nicht auf Rechnern
   verbreitet werden, auf denen sich Benutzer anmelden k?nnen, die auf
   diese Konten keine Zugriff haben sollen.

-  *Sichern Sie die NIS-Master- und Slaveserver und minimieren Sie die
   Ausfallzeiten*. Wenn diese Rechner gehackt oder einfach nur
   ausgeschaltet werden, haben viele Leute keinen Netzwerkzugriff mehr.

   Dies ist die gr??te Schw?che jeder zentralen Verwaltung. Wenn Sie
   Ihre NIS-Server nicht sch?tzen, werden Sie viele ver?rgerte Anwender
   haben.

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

31.4.9. Kompatibilit?t zu NIS v1
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

ypserv unterst?tzt NIS v1 unter FreeBSD nur eingeschr?nkt. Die
NIS-Implementierung von FreeBSD verwendet nur NIS v2, andere
Implementierungen unterst?tzen aus Gr?nden der Abw?rtskompatibilit?t mit
?lteren Systemen auch NIS v1. Die mit diesen Systemen gelieferten
ypbind-Daemonen versuchen, sich an einen NIS-v1-Server zu binden (Dies
selbst dann, wenn sie ihn nie ben?tigen. Au?erdem versuchen Sie auch
dann, einen v1-Server zu erreichen, wenn Sie zuvor eine Antwort von
einem v2-Server erhalten.). W?hrend normale Clientaufrufe unter FreeBSD
unterst?tzt werden, sind Anforderungen zum Transfer von v1-Maps nicht
m?glich. Daher kann FreeBSD nicht als Client oder Server verwendet
werden, wenn ein NIS-Server vorhanden ist, der nur NIS v1 unterst?tzt.
Gl?cklicherweise sollte es heute keine Server mehr geben, die nur NIS v1
unterst?tzen.

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

31.4.10. NIS-Server, die auch als NIS-Clients arbeiten
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn Sie ypserv in einer Multi-Serverdom?ne verwenden, in der NIS-Server
gleichzeitig als NIS-Clients arbeiten, ist es eine gute Idee, diese
Server zu zwingen, sich an sich selbst zu binden. Damit wird verhindert,
dass Bindeanforderungen gesendet werden und sich die Server gegenseitig
binden. Sonst k?nnten seltsame Fehler auftreten, wenn ein Server
ausf?llt, auf den andere Server angewiesen sind. Letztlich werden alle
Clients einen Timeout melden, und versuchen, sich an andere Server zu
binden. Die dadurch entstehende Verz?gerung kann betr?chtlich sein.
Au?erdem kann der Fehler erneut auftreten, da sich die Server wiederum
aneinander binden k?nnten.

Sie k?nnen einen Rechner durch die Verwendung von ``ypbind`` sowie der
Option ``-S`` zwingen, sich an einen bestimmten Server zu binden. Um
diesen Vorgang zu automatisieren, k?nnen Sie folgende Zeilen in
``/etc/rc.conf`` einf?gen:

.. code:: programlisting

    nis_client_enable="YES" # run client stuff as well
    nis_client_flags="-S NIS domain,server"

Lesen Sie
`ypbind(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ypbind&sektion=8>`__,
wenn Sie weitere Informationen ben?tigen.

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

31.4.11. Passwortformate
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Unterschiedliche Passwortformate sind das Hauptproblem, das beim
Einrichten eines NIS-Servers auftreten kann. Wenn der NIS-Server mit DES
verschl?sselte Passw?rter verwendet, werden nur Clients unterst?tzt, die
ebenfalls DES benutzen. Wenn sich auf Ihrem Netzwerk beispielsweise
Solaris™ NIS-Clients befinden, m?ssen die Passw?rter mit DES
verschl?sselt werden.

Welches Format die Server und Clients verwenden, steht in
``/etc/login.conf``. Wenn ein System Passw?rter mit DES verschl?sselt,
enth?lt die ``default``-Klasse einen Eintrag wie den folgenden:

.. code:: programlisting

    default:\
        :passwd_format=des:\
        :copyright=/etc/COPYRIGHT:\
        [weitere Eintr?ge]

M?gliche Werte f?r ``passwd_format`` sind unter anderem ``blf`` und
``md5`` (mit Blowfish und MD5 verschl?sselte Passw?rter).

Wenn die Datei ``/etc/login.conf`` ge?ndert wird, muss die
Login-Capability Datenbank neu erstellt werden. Geben Sie dazu als
``root`` den folgenden Befehl ein:

.. code:: screen

    # cap_mkdb /etc/login.conf

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Das Format der schon in ``/etc/master.passwd`` befindlichen Passw?rter
wird erst aktualisiert, wenn ein Benutzer sein Passwort ?ndert,
*nachdem* die Datenbank neu erstellt wurde.

.. raw:: html

   </div>

Damit die Passw?rter auch im gew?hlten Format abgespeichert werden, muss
mit ``crypt_default`` in der Datei ``/etc/auth.conf`` die richtige
Priorit?t der Formate eingestellt werden. Das gew?hlte Format sollte als
Erstes in der Liste stehen. Sollen die Passw?rter mit DES verschl?sselt
werden, verwenden Sie den folgenden Eintrag:

.. code:: programlisting

    crypt_default   =   des blf md5

Wenn Sie alle FreeBSD NIS-Server und NIS-Clients entsprechend den obigen
Schritten eingestellt haben, wird im ganzen Netzwerk dasselbe
Passwortformat verwendet. Falls Sie Probleme mit der Authentifizierung
eines NIS-Clients haben, kontrollieren Sie die verwendeten
Passwortformate. In einer heterogenen Umgebung werden Sie DES benutzen
m?ssen, da dies der meist unterst?tzte Standard ist.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------+----------------------------------------+------------------------------------------------------+
| `Zur?ck <network-nfs.html>`__?     | `Nach oben <network-servers.html>`__   | ?\ `Weiter <network-dhcp.html>`__                    |
+------------------------------------+----------------------------------------+------------------------------------------------------+
| 31.3. NFS – Network File System?   | `Zum Anfang <index.html>`__            | ?31.5. Automatische Netzwerkkonfiguration mit DHCP   |
+------------------------------------+----------------------------------------+------------------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
