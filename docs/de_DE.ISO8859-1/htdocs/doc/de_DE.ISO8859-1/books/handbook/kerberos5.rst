===============
15.7. Kerberos5
===============

.. raw:: html

   <div class="navheader">

15.7. Kerberos5
`Zur?ck <tcpwrappers.html>`__?
Kapitel 15. Sicherheit
?\ `Weiter <openssl.html>`__

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

15.7. Kerberos5
---------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Beigetragen von Tillman Hodgson.

.. raw:: html

   </div>

.. raw:: html

   <div>

Beruht auf einem Beitrag von Mark Murray.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Kerberos ist ein Netzwerk-Protokoll, das Benutzer mithilfe eines
sicheren Servers authentifiziert. Mit Risiken behaftete Dienste, wie das
Anmelden an entfernten Systemen oder das Kopieren von Daten auf
entfernte Systeme, werden durch Kerberos erheblich sicherer und lassen
sich leichter steuern.

Kerberos hat eine Aufgabe: Die sichere Pr?fung der Identit?t eines
Benutzers (Authentifizierung) ?ber das Netzwerk. Das System ?berpr?ft
weder die Berechtigungen der Benutzer (Autorisierung), noch verfolgt es
die durchgef?hrten Aktionen (Audit). Daher sollte Kerberos zusammen mit
anderen Sicherheits-Systemen eingesetzt werden, die diese Funktionen
bereitstellen. Die Daten einer Kommunikation k?nnen verschl?sselt
werden, nachdem die Kommunikationspartner mit Kerberos ihre Identit?t
gepr?ft haben.

Die folgenden Anweisungen beschreiben, wie Sie das mit FreeBSD
gelieferte Kerberos einrichten. Eine vollst?ndige Beschreibung des
Systems entnehmen Sie bitte den entsprechenden Hilfeseiten.

Die Beschreibung der Kerberos-Installation benutzt folgende Namensr?ume:

.. raw:: html

   <div class="itemizedlist">

-  Die DNS-Domain (Zone) hei?t example.org.

-  Das Kerberos-Realm hei?t EXAMPLE.ORG.

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Benutzen Sie echte Domain-Namen, wenn Sie Kerberos einrichten. Damit
vermeiden Sie DNS-Probleme und stellen die Zusammenarbeit mit anderen
Kerberos-Realms sicher.

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

15.7.1. Geschichte
~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das MIT entwickelte Kerberos, um Sicherheitsprobleme auf dem Netzwerk zu
l?sen. Das Kerberos-Protokoll verwendet starke Kryptographie, sodass ein
Server die Identit?t eines Clients (der umgekehrte Vorgang ist auch
m?glich) ?ber ein unsicheres Netzwerk feststellen kann.

Der Begriff Kerberos wird sowohl f?r das Protokoll als auch f?r
Programme verwendet, die Kerberos benutzen (wie Kerberos-Telnet). Die
aktuelle Protokollversion ist 5 und wird in RFC?1510 beschrieben.

Mehrere Implementierungen des Protokolls stehen frei zur Verf?gung und
decken viele Betriebssysteme ab. Das Massachusetts Institute of
Technology (MIT), an dem Kerberos urspr?nglich entwickelt wurde,
entwickelt seine Kerberos-Version weiter. In den USA wird diese Version
h?ufig eingesetzt, unterlag aber Export-Beschr?nkungen, da sie in den
USA entwickelt wurde. Die MIT-Version von Kerberos befindet sich im Port
`security/krb5 <http://www.freebsd.org/cgi/url.cgi?ports/security/krb5/pkg-descr>`__.
Heimdal ist eine weitere Implementierung der Protokollversion 5. Sie
wurde au?erhalb der USA entwickelt und unterliegt daher keinen
Export-Beschr?nkungen. Heimdal-Kerberos befindet sich im Port
`security/heimdal <http://www.freebsd.org/cgi/url.cgi?ports/security/heimdal/pkg-descr>`__
und das Basissystem von FreeBSD enth?lt eine minimale Installation von
Heimdal.

Um m?glichst viele Benutzer anzusprechen, verwenden die folgenden
Beispiele die in FreeBSD enthaltene Heimdal-Distribution.

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

15.7.2. Das Heimdal KDC einrichten
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Kerberos authentifiziert Benutzer an einer zentralen Stelle: dem Key
Distribution Center (KDC). Das KDC verteilt *Tickets*, mit denen ein
Dienst die Identit?t eines Benutzers feststellen kann. Alle Mitglieder
eines Kerberos-Realms vertrauen dem KDC, daher gelten f?r das KDC
erh?hte Sicherheitsanforderungen.

Obwohl das KDC wenig Ressourcen eines Rechners ben?tigt, sollte es wegen
der Sicherheitsanforderungen auf einem separaten Rechner installiert
werden.

Das KDC wird in ``/etc/rc.conf`` wie folgt aktiviert:

.. code:: programlisting

    kerberos5_server_enable="YES"
    kadmind5_server_enable="YES"

Danach wird die Konfigurationsdatei von Kerberos, ``/etc/krb5.conf``,
erstellt:

.. code:: programlisting

    [libdefaults]
        default_realm = EXAMPLE.ORG
    [realms]
        EXAMPLE.ORG = {
            kdc = kerberos.example.org
        admin_server = kerberos.example.org
        }
    [domain_realm]
        .example.org = EXAMPLE.ORG

Diese Einstellungen setzen voraus, dass der voll qualifizierte Name des
KDCs ``kerberos.example.org`` ist. Wenn Ihr KDC einen anderen Namen hat,
m?ssen Sie in der DNS-Zone einen Alias-Eintrag (CNAME-Record) f?r das
KDC hinzuf?gen.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Auf gro?en Netzwerken mit einem ordentlich konfigurierten BIND
DNS-Server kann die Datei verk?rzt werden:

.. code:: programlisting

    [libdefaults]
          default_realm = EXAMPLE.ORG

Die Zonendatei von ``example.org`` muss dann die folgenden Zeilen
enthalten:

.. code:: programlisting

    _kerberos._udp      IN  SRV     01 00 88 kerberos.example.org.
    _kerberos._tcp      IN  SRV     01 00 88 kerberos.example.org.
    _kpasswd._udp       IN  SRV     01 00 464 kerberos.example.org.
    _kerberos-adm._tcp  IN  SRV     01 00 749 kerberos.example.org.
    _kerberos           IN  TXT     EXAMPLE.ORG

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Damit Klienten die Kerberos-Dienste benutzen k?nnen, muss die Datei
``/etc/krb5.conf`` entweder die vollst?ndige Konfiguration enthalten
oder eine minimale Konfiguration enthalten *und* zus?tzlich ein
DNS-Server richtig eingerichtet sein.

.. raw:: html

   </div>

Im n?chsten Schritt wird die Kerberos-Datenbank eingerichtet. Die
Datenbank enth?lt die Schl?ssel aller Prinzipale und ist mit einem
Passwort gesch?tzt. Dieses Passwort brauchen Sie nicht zu behalten, da
ein davon abgeleiteter Schl?ssel in der Datei ``/var/heimdal/m-key``
gespeichert wird. Den Schl?ssel erstellen Sie, indem Sie das Programm
``kstash`` aufrufen und ein Passwort eingeben.

Nachdem Sie den Schl?ssel in ``/var/heimdal/m-key`` erstellt haben,
k?nnen Sie die Datenbank mit dem Kommando ``kadmin`` initialisieren.
Verwenden Sie hierbei die Option ``-l`` (lokal). Mit dieser Option wird
die Datenbank lokal modifiziert. Normal w?rde der ``kadmind``-Dienst
benutzt, der aber zu diesem Zeitpunkt noch nicht l?uft. An der
Eingabeaufforderung von ``kadmin`` k?nnen Sie mit dem Kommando ``init``
die Datenbank des Realms einrichten.

Zuletzt erstellen Sie mit dem Kommando ``add`` Ihren ersten Prinzipal.
Benutzen Sie die voreingestellten Optionen; Sie k?nnen die Einstellungen
sp?ter mit dem Kommando ``modify`` ?ndern. An der Eingabeaufforderung
zeigt das Kommando ``?`` Hilfetexte an.

Zusammengefasst wird die Datenbank wie folgt eingerichtet:

.. code:: screen

    # kstash
    Master key: xxxxxxxx
    Verifying password - Master key: xxxxxxxx

    # kadmin -l
    kadmin> init EXAMPLE.ORG
    Realm max ticket life [unlimited]:
    kadmin> add tillman
    Max ticket life [unlimited]:
    Max renewable life [unlimited]:
    Attributes []:
    Password: xxxxxxxx
    Verifying password - Password: xxxxxxxx

Jetzt kann das KDC gestartet werden. F?hren Sie zum Start der Dienste
die Kommandos ``/etc/rc.d/kerberos start`` und
``/etc/rc.d/kadmind start`` aus. Obwohl zu diesem Zeitpunkt noch keine
kerberisierten Dienste laufen, k?nnen Sie die Funktion des KDCs schon
?berpr?fen. F?r den eben angelegten Benutzer k?nnen Sie sich vom KDC
Tickets holen und diese Tickets anzeigen:

.. code:: screen

    % kinit tillman
    tillman@EXAMPLE.ORG's Password:

    % klist
    Credentials cache: FILE: /tmp/krb5cc_500
            Principal: tillman@EXAMPLE.ORG

      Issued           Expires          Principal
    Aug 27 15:37:58  Aug 28 01:37:58  krbtgt/EXAMPLE.ORG@EXAMPLE.ORG

Dieses Ticket kann, nachdem Sie Ihre Arbeit beendet haben, zur?ckgezogen
werden:

.. code:: screen

    % kdestroy

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

15.7.3. Heimdal Kerberos-Dienste einrichten
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Alle Rechner, die kerberisierte Dienste anbieten, m?ssen eine Kopie der
Kerberos-Konfigurationsdatei ``/etc/krb5.conf`` besitzen. Sie k?nnen die
Datei einfach vom KDC kopieren.

Anschlie?end m?ssen Sie die Datei ``/etc/krb5.keytab`` erzeugen. Im
Gegensatz zu normalen Workstations ben?tigt jeder Server eine
``keytab``. Diese Datei enth?lt den Schl?ssel des Servers, mit dem sich
der Server und das KDC gegenseitig authentifizieren k?nnen. Die Datei
muss sicher auf den Server transportiert werden (beispielsweise mit
`scp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=scp&sektion=1>`__ oder
einer Diskette). Unter keinen Umst?nden darf die Datei im Klartext, zum
Beispiel mit FTP, ?bertragen werden, da sonst die Sicherheit des Servers
gef?hrdet ist.

Sie k?nnen die ``keytab`` auch mit dem Programm ``kadmin`` ?bertragen.
Da Sie mit ``kadmin`` sowieso einen Host-Prinzipal f?r den Server
einrichten m?ssen, ist das ganz praktisch.

Sie m?ssen allerdings schon ein Ticket besitzen und berechtigt sein,
``kadmin`` auszuf?hren. Die Berechtigung erhalten Sie durch einen
Eintrag in der Zugriffskontrollliste ``kadmind.acl``. Weitere
Informationen ?ber Zugriffskontrolllisten erhalten Sie in den
Heimdal-Info-Seiten (``info heimdal``) im Abschnitt „Remote
administration“. Wenn der Zugriff auf ``kadmin`` von entfernten
Maschinen verboten ist, m?ssen Sie sich sicher auf dem KDC anmelden
(lokale Konsole,
`ssh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh&sektion=1>`__ oder
kerberisiertes Telnet) und die ``keytab`` lokal mit ``kadmin -l``
erzeugen.

Nachdem Sie die Datei ``/etc/krb5.conf`` installiert haben, k?nnen Sie
das Kommando ``kadmin`` benutzen. An der Eingabeaufforderung von
``kadmin`` erstellt das Kommando ``add --random-key`` den Host-Prinzipal
und das Kommando ``ext`` extrahiert den Schl?ssel des Prinzipals in eine
Datei:

.. code:: screen

    # kadmin
    kadmin> add --random-key host/myserver.example.org
    Max ticket life [unlimited]:
    Max renewable life [unlimited]:
    Attributes []:
    kadmin> ext host/myserver.example.org
    kadmin> exit

Das Kommando ``ext`` (von *extract*) speichert den extrahierten
Schl?ssel in der Datei ``/etc/krb5.keytab``.

Wenn auf dem KDC, vielleicht aus Sicherheitsgr?nden, ``kadmind`` nicht
l?uft, k?nnen Sie das Kommando ``kadmin`` von entfernten Rechnern nicht
benutzen. In diesem Fall legen Sie den Host-Prinzipal
``host/myserver.EXAMPLE.ORG`` direkt auf dem KDC an. Den Schl?ssel
extrahieren Sie in eine tempor?re Datei (damit die Datei
``/etc/krb5.keytab`` nicht ?berschrieben wird):

.. code:: screen

    # kadmin
    kadmin> ext --keytab=/tmp/example.keytab host/myserver.example.org
    kadmin> exit

Anschlie?end m?ssen Sie die erzeugte ``example.keytab`` sicher auf den
Server kopieren (mit ``scp`` oder mithilfe einer Diskette). Geben Sie
auf jeden Fall einen anderen Namen f?r die ``keytab`` an, weil sonst die
``keytab`` des KDCs ?berschrieben w?rde.

Wegen der Datei ``krb5.conf`` kann der Server nun mit dem KDC
kommunizieren und seine Identit?t mithilfe der Datei ``krb5.keytab``
nachweisen. Jetzt k?nnen wir kerberisierte Dienste aktivieren. F?r
``telnet`` muss die folgende Zeile in ``/etc/inetd.conf`` eingef?gt
werden:

.. code:: programlisting

    telnet    stream  tcp     nowait  root    /usr/libexec/telnetd  telnetd -a user

Ausschlaggebend ist, dass die Authentifizierungs-Methode mit ``-a`` auf
``user`` gesetzt wird. Weitere Details entnehmen Sie bitte der
Hilfeseite
`telnetd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=telnetd&sektion=8>`__.

Nachdem sie die Zeile in ``/etc/inetd.conf`` eingef?gt haben, starten
Sie
`inetd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=inetd&sektion=8>`__
mit dem Kommando ``/etc/rc.d/inetd restart`` durch.

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

15.7.4. Heimdal Kerberos-Clients einrichten
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Ein Client l?sst sich leicht einrichten. Sie ben?tigen nur die
Kerberos-Konfigurationsdatei ``/etc/krb5.conf``. Kopieren Sie die
Konfigurationsdatei einfach vom KDC auf den Client.

Sie k?nnen jetzt mit ``kinit`` Tickets anfordern, mit ``klist`` Tickets
anzeigen und mit ``kdestroy`` Tickets l?schen. Sie k?nnen mit
Kerberos-Anwendungen kerberisierte Server ansprechen. Wenn das nicht
funktioniert, Sie aber Tickets anfordern k?nnen, hat wahrscheinlich der
kerberisierte Server ein Problem und nicht der Client oder das KDC.

Wenn Sie eine Anwendung wie ``telnet`` testen, k?nnen Sie mit einem
Paket-Sniffer (beispielsweise
`tcpdump(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tcpdump&sektion=1>`__)
?berpr?fen, dass Passw?rter verschl?sselt ?bertragen werden. Probieren
Sie auch die Option ``-x`` von ``telnet``, die den gesamten Datenverkehr
verschl?sselt (analog zu ``ssh``).

Zu Heimdal geh?ren noch weitere Anwendungen. Allerdings enth?lt das
FreeBSD-Basissystem nur eine minimale Heimdal-Installation mit nur einer
kerberisierten Anwendung: ``telnet``.

Der Heimdal-Port enth?lt noch mehr kerberisierte Anwendungen wie
``ftp``, ``rsh``, ``rcp`` und ``rlogin``. Der MIT-Port enth?lt ebenfalls
weitere kerberisierte Anwendungen.

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

15.7.5. Die Benutzerkonfigurationsdateien ``.k5login`` und ``.k5users``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Normalerweise wird ein Kerberos-Prinzipal wie ``tillman@EXAMPLE.ORG``
auf ein lokales Benutzerkonto, beispielsweise ``tillman``, abgebildet.
Daher ben?tigen Client-Anwendungen (zum Beispiel ``telnet``) keinen
Benutzernamen.

Manchmal wird aber Zugriff auf ein lokales Benutzerkonto ben?tigt, zu
dem es keinen passenden Kerberos-Prinzipal gibt. Der Prinzipal
``tillman@EXAMPLE.ORG`` br?uchte beispielsweise Zugriff auf das Konto
``webdevelopers``. Ebenso k?nnten andere Prinzipale auf dieses Konto
zugreifen wollen.

Die Dateien ``.k5login`` und ``.k5users`` im Heimatverzeichnis eines
Benutzerkontos gew?hren Zugriffe ?hnlich wie die Dateien ``.hosts`` und
``.rhosts``. Um den Prinzipalen ``tillman@example.org`` und
``jdoe@example.org`` auf das Konto ``webdevelopers`` zu geben, wird im
Heimatverzeichnis von ``webdevelopers`` die Datei ``.k5login`` mit
folgendem Inhalt angelegt:

.. code:: screen

    tillman@example.org
    jdoe@example.org

Die angegebenen Prinzipale haben nun ohne ein gemeinsames Passwort
Zugriff auf das Konto.

Einzelheiten entnehmen Sie bitte den Hilfeseiten zu diesen Dateien. Die
Datei ``.k5users`` wird in der Hilfeseite des Kommandos ``ksu``
beschrieben.

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

15.7.6. Tipps und Fehlersuche
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="itemizedlist">

-  Wenn Sie den Heimdal-Port oder den MIT-Port benutzen, muss in der
   Umgebungsvariable ``PATH`` der Pfad zu den Programmen des Ports vor
   dem Pfad zu den Kerberos-Programmen des Systems stehen.

-  Sind die Uhrzeiten der Systeme synchronisiert? Wenn nicht, schl?gt
   vielleicht die Authentifizierung fehl. `Abschnitt?31.10, „Die Uhrzeit
   mit NTP synchronisieren“ <network-ntp.html>`__ beschreibt, wie Sie
   mithilfe von NTP die Uhrzeiten synchronisieren.

-  Die MIT- und Heimdal-Systeme arbeiten bis auf ``kadmin`` gut
   zusammen. F?r ``kadmin`` wurde das Protokoll nicht normiert.

-  Wenn Sie den Namen eines Rechners ?ndern, m?ssen Sie auch den
   ``host/``-Prinzipal ?ndern und die Datei ``keytab`` aktualisieren.
   Dies betrifft auch spezielle Eintr?ge wie den Prinzipal f?r Apaches
   `www/mod\_auth\_kerb <http://www.freebsd.org/cgi/url.cgi?ports/www/mod_auth_kerb/pkg-descr>`__.

-  Die Rechnernamen m?ssen vor- und r?ckw?rts aufgel?st werden (im DNS
   oder in ``/etc/hosts``). CNAME-Eintr?ge im DNS funktionieren, aber
   die entsprechenden A- und PTR-Eintr?ge m?ssen vorhanden und richtig
   sein. Wenn sich Namen nicht aufl?sen lassen, ist die Fehlermeldung
   nicht gerade selbstsprechend: Kerberos5 refuses authentication
   because Read req failed: Key table entry not found.

-  Einige Betriebssysteme installieren ``ksu`` mit falschen
   Zugriffsrechten; es fehlt das Set-UID-Bit f?r ``root``. Das mag aus
   Sicherheitsgr?nden richtig sein, doch funktioniert ``ksu`` dann
   nicht. Dies ist kein Fehler des KDCs.

-  Wenn Sie f?r einen Prinzipal unter MIT-Kerberos Tickets mit einer
   l?ngeren G?ltigkeit als der vorgegebenen zehn Stunden einrichten
   wollen, m?ssen Sie zwei Sachen ?ndern. Benutzen Sie das
   ``modify_principal`` von ``kadmin``, um die maximale G?ltigkeitsdauer
   f?r den Prinzipal selbst und den Prinzipal ``krbtgt`` zu erh?hen.

-  Mit einem Packet-Sniffer k?nnen Sie feststellen, dass Sie sofort nach
   dem Aufruf von ``kinit`` eine Antwort vom KDC bekommen – noch bevor
   Sie ?berhaupt ein Passwort eingegeben haben! Das ist in Ordnung: Das
   KDC h?ndigt ein Ticket-Granting-Ticket (TGT) auf Anfrage aus, da es
   durch einen vom Passwort des Benutzers abgeleiteten Schl?ssel
   gesch?tzt ist. Wenn das Passwort eingegeben wird, wird es nicht zum
   KDC gesendet, sondern zum Entschl?sseln der Antwort des KDCs benutzt,
   die ``kinit`` schon erhalten hat. Wird die Antwort erfolgreich
   entschl?sselt, erh?lt der Benutzer einen Sitzungs-Schl?ssel f?r die
   k?nftige verschl?sselte Kommunikation mit dem KDC und das
   Ticket-Granting-Ticket. Das Ticket-Granting-Ticket wiederum ist mit
   dem Schl?ssel des KDCs verschl?sselt. Diese Verschl?sselung ist f?r
   den Benutzer v?llig transparent und erlaubt dem KDC, die Echtheit
   jedes einzelnen TGT zu pr?fen.

-  Wenn Sie OpenSSH verwenden und Tickets mir einer langen G?ltigkeit
   (beispielsweise einer Woche) benutzen, setzen Sie die Option
   ``TicketCleanup`` in der Datei ``sshd_config`` auf ``no``. Ansonsten
   werden Ihre Tickets gel?scht, wenn Sie sich abmelden.

-  Host-Prinzipale k?nnen ebenfalls Tickets mit l?ngerer G?ltigkeit
   besitzen. Wenn der Prinzipal eines Benutzers ?ber ein Ticket verf?gt,
   das eine Woche g?ltig ist, das Ticket des Host-Prinzipals aber nur
   neun Stunden g?ltig ist, funktioniert der Ticket-Cache nicht wie
   erwartet. Im Cache befindet sich dann ein abgelaufenes Ticket des
   Host-Prinzipals.

-  Wenn Sie mit ``krb5.dict`` die Verwendung schlechter Passw?rter
   verhindern wollen, geht das nur mit Prinzipalen, denen eine
   Passwort-Policy zugewiesen wurde. Die Hilfeseite von ``kadmind``
   beschreibt kurz, wie ``krb5.dict`` verwendet wird. Das Format von
   ``krb5.dict`` ist einfach: Die Datei enth?lt pro Zeile ein Wort. Sie
   k?nnen daher einen symbolischen Link auf ``/usr/share/dict/words``
   erstellen.

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

15.7.7. Unterschiede zum MIT-Port
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Der Hauptunterschied zwischen MIT-Kerberos und Heimdal-Kerberos ist das
Kommando ``kadmin``. Die Befehlss?tze des Kommandos (obwohl funktional
gleichwertig) und das verwendete Protokoll unterscheiden sich in beiden
Varianten. Das KDC l?sst sich nur mit dem ``kadmin`` Kommando der
passenden Kerberos-Variante verwalten.

F?r dieselbe Funktion k?nnen auch die Client-Anwendungen leicht
ge?nderte Kommandozeilenoptionen besitzen. Folgen Sie bitte der
Anleitung auf der Kerberos-Seite (``http://web.mit.edu/Kerberos/www/``)
des MITs. Achten Sie besonders auf den Suchpfad f?r Anwendungen. Der
MIT-Port wird standardm??ig in ``/usr/local/`` installiert. Wenn die
Umgebungsvariable ``PATH`` zuerst die Systemverzeichnisse enth?lt,
werden die Systemprogramme anstelle der MIT-Programme ausgef?hrt.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Wenn Sie den MIT-Port
`security/krb5 <http://www.freebsd.org/cgi/url.cgi?ports/security/krb5/pkg-descr>`__
verwenden, erscheint bei der Anmeldung mit ``telnetd`` und ``klogind``
die Fehlermeldung incorrect permissions on cache file. Lesen Sie dazu
bitte die im Port enthaltene Datei
``/usr/local/share/doc/krb5/README.FreeBSD``. Wichtig ist, dass zur
Authentifizierung die Bin?rdatei ``login.krb5`` verwendet wird, die f?r
durchgereichte Berechtigungen die Eigent?mer korrekt ?ndert.

.. raw:: html

   </div>

In der Datei ``rc.conf`` m?ssen folgende Zeilen aufgenommen werden:

.. code:: programlisting

    kerberos5_server="/usr/local/sbin/krb5kdc"
    kadmind5_server="/usr/local/sbin/kadmind"
    kerberos5_server_enable="YES"
    kadmind5_server_enable="YES"

Diese Zeilen sind notwendig, weil die Anwendungen von MIT-Kerberos
Bin?rdateien unterhalb von ``/usr/local`` installieren.

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

15.7.8. Beschr?nkungen von Kerberos
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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

15.7.8.1. Kerberos muss ganzheitlich verwendet werden
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Jeder ?ber das Netzwerk angebotetene Dienst muss mit Kerberos
zusammenarbeiten oder auf anderen Wegen gegen Angriffe aus dem Netzwerk
gesch?tzt sein. Andernfalls k?nnen Berechtigungen gestohlen und
wiederverwendet werden. Es ist beispielsweise nicht sinnvoll, f?r
Anmeldungen mit ``rsh`` und ``telnet`` Kerberos zu benutzen, dagegen
aber POP3-Zugriff auf einen Mail-Server zu erlauben, da POP3 Passw?rter
im Klartext versendet.

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

15.7.8.2. Kerberos ist f?r Einbenutzer-Systeme gedacht
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In Mehrbenutzer-Umgebungen ist Kerberos unsicherer als in
Einbenutzer-Umgebungen, da die Tickets im f?r alle lesbaren Verzeichnis
``/tmp`` gespeichert werden. Wenn ein Rechner von mehreren Benutzern
verwendet wird, ist es m?glich, dass Tickets gestohlen werden.

Dieses Problem k?nnen Sie l?sen, indem Sie mit der Kommandozeilenoption
``-c`` oder besser mit der Umgebungsvariablen ``KRB5CCNAME`` einen Ort
f?r die Tickets vorgeben. Diese Vorgehensweise wird leider selten
benutzt. Es reicht, die Tickets im Heimatverzeichnis eines Benutzers zu
speichern und mit Zugriffsrechten zu sch?tzen.

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

15.7.8.3. Das KDC ist verwundbar
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das KDC muss genauso abgesichert werden wie die auf ihm befindliche
Passwort-Datenbank. Auf dem KDC d?rfen keine anderen Dienste laufen und
der Rechner sollte physikalisch gesichert sein. Die Gefahr ist gro?, da
Kerberos alle Passw?rter mit einem Schl?ssel, dem Haupt-Schl?ssel,
verschl?sselt. Der Haupt-Schl?ssel wiederum wird in einer Datei auf dem
KDC gespeichert.

Ein kompromittierter Haupt-Schl?ssel ist nicht ganz so schlimm wie
allgemein angenommen. Der Haupt-Schl?ssel wird nur zum Verschl?sseln der
Passwort-Datenbank und zum Initialisieren des Zufallsgenerators
verwendet. Solange der Zugriff auf das KDC abgesichert ist, kann ein
Angreifer wenig mit dem Haupt-Schl?ssel anfangen.

Wenn das KDC nicht zur Verf?gung steht, vielleicht wegen eines
Denial-of-Service Angriffs oder wegen eines Netzwerkproblems, ist eine
Authentifizierung unm?glich. Damit k?nnen die Netzwerk-Dienste nicht
benutzt werden; das KDC ist also ein optimales Ziel f?r einen
Denial-of-Service Angriff. Sie k?nnen diesem Angriff ausweichen, indem
Sie mehrere KDCs (einen Master und einen oder mehrere Slaves) verwenden.
Der R?ckfall auf ein sekund?res KDC oder eine andere
Authentifizierungs-Methode (dazu ist PAM bestens geeignet) muss
sorgf?ltig eingerichtet werden.

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

15.7.8.4. M?ngel von Kerberos
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Mit Kerberos k?nnen sich Benutzer, Rechner und Dienste gegenseitig
authentifizieren. Allerdings existiert kein Mechanismus, der das KDC
gegen?ber Benutzern, Rechnern oder Diensten authentifiziert. Ein
ver?ndertes ``kinit`` k?nnte beispielsweise alle Benutzernamen und
Passw?rter abfangen. Die von ver?nderten Programmen ausgehende Gefahr
k?nnen Sie lindern, indem Sie die Integrit?t von Dateien mit Werkzeugen
wie
`security/tripwire <http://www.freebsd.org/cgi/url.cgi?ports/security/tripwire/pkg-descr>`__
pr?fen.

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

15.7.9. Weiterf?hrende Dokumentation
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="itemizedlist">

-  `The Kerberos
   FAQ <http://www.faqs.org/faqs/Kerberos-faq/general/preamble.html>`__

-  `Designing an Authentication System: a Dialogue in Four
   Scenes <http://web.mit.edu/Kerberos/www/dialogue.html>`__

-  `RFC 1510, The Kerberos Network Authentication Service
   (V5) <http://www.ietf.org/rfc/rfc1510.txt?number=1510>`__

-  `MIT Kerberos-Seite <http://web.mit.edu/Kerberos/www/>`__

-  `Heimdal Kerberos-Seite <http://www.pdc.kth.se/heimdal/>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------+---------------------------------+--------------------------------+
| `Zur?ck <tcpwrappers.html>`__?   | `Nach oben <security.html>`__   | ?\ `Weiter <openssl.html>`__   |
+----------------------------------+---------------------------------+--------------------------------+
| 15.6. TCP-Wrapper?               | `Zum Anfang <index.html>`__     | ?15.8. OpenSSL                 |
+----------------------------------+---------------------------------+--------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
