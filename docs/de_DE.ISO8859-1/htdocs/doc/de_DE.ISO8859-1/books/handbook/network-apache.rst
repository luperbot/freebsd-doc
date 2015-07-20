============================
31.7. Der Apache HTTP-Server
============================

.. raw:: html

   <div class="navheader">

31.7. Der Apache HTTP-Server
`Zur?ck <network-dns.html>`__?
Kapitel 31. Netzwerkserver
?\ `Weiter <network-ftp.html>`__

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

31.7. Der Apache HTTP-Server
----------------------------

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

31.7.1. ?berblick
~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Einige der weltgr??ten Internetauftritte laufen unter FreeBSD. Die
Mehrzahl der Webserver im Internet nutzt den Apache HTTP-Server. Die
Installationspakete f?r den Apache sollten auf Ihrem Installationsmedium
vorhanden sein. Wenn Sie den Apache noch nicht installiert haben, k?nnen
Sie dies jederzeit ?ber den Port
`www/apache22 <http://www.freebsd.org/cgi/url.cgi?ports/www/apache22/pkg-descr>`__
nachholen.

Nachdem der Apache erfolgreich installiert wurde, muss er noch
konfiguriert werden.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Dieser Abschnitt beschreibt die Version 2.2.X des Apache HTTP-Servers,
da diese Version unter FreeBSD am h?ufigsten verwendet wird.
Weiterf?hrende Informationen zu Apache?2.X finden Sie auf
``http://httpd.apache.org/``.

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

31.7.2. Konfiguration
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Der Apache HTTP-Server wird unter FreeBSD prim?r ?ber die Datei
``/usr/local/etc/apache22/httpd.conf`` konfiguriert. Bei dieser Datei
handelt es sich um eine typische UNIX?-Konfigurationsdatei, in der
Kommentarzeilen mit einem ``#``-Zeichen beginnen. Eine komplette
Beschreibung aller Optionen w?rde den Rahmen dieses Handbuchs sprengen,
daher beschreiben wir hier nur die am h?ufigsten verwendeten Optionen.

.. raw:: html

   <div class="variablelist">

``ServerRoot "/usr/local"``
    Legt das Standardwurzelverzeichnis f?r die Apache-Installation fest.
    Bin?rdateien werden in die Verzeichnisse ``bin`` und ``sbin``
    unterhalb des Serverwurzelverzeichnisses installiert, w?hrend sich
    Konfigurationsdateien im Verzeichnis ``etc/apache`` befinden.

``ServerAdmin you@your.address``
    Die E-Mail-Adresse, an die Mitteilungen ?ber Serverprobleme
    geschickt werden sollen. Diese Adresse erscheint auf vom Server
    erzeugten Seiten, beispielsweise auf Fehlerseiten.

``ServerName www.example.com``
    ?ber die Option ``ServerName`` k?nnen Sie einen Rechnernamen
    festlegen, den Ihr Server an die Clients sendet, wenn sich dieser
    von tats?chlichen Rechnernamen unterscheidet (sie k?nnten etwa
    ``www`` statt des richtigen Rechnernamens verwenden).

``DocumentRoot "/usr/local/www/apache22/data"``
    ``DocumentRoot``: Das Verzeichnis, in dem Sie Ihre Dokumente
    ablegen. In der Voreinstellung befinden sich alle Seiten in diesem
    Verzeichnis, durch symbolische Links oder Aliase lassen sich aber
    auch andere Orte festlegen.

.. raw:: html

   </div>

Es ist empfehlenswert, eine Sicherungskopie Ihrer Konfigurationsdatei
anzulegen, bevor Sie ?nderungen durchf?hren. Nachdem Sie die
Konfiguration beendet haben, k?nnen Sie den Apache starten.

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

31.7.3. Den Apache betreiben
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Der ``www/apache22`` Port installiert ein
`rc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc&sektion=8>`__
Skript, welches zum starten, stoppen und neustarten von Apache benutzt
werden kann. Das Skript befindet sich in ``/usr/local/etc/rc.d/``.

Um den Apache beim Systemstart zu starten, f?gen Sie folgende Zeile in
``/etc/rc.conf`` ein:

.. code:: programlisting

    apache22_enable="YES"

Wenn Sie w?hrend des Systemstarts weitere Parameter an den Apache
?bergeben wollen, k?nnen Sie diese durch eine zus?tzliche Zeile in
``rc.conf`` angeben:

.. code:: programlisting

    apache22_flags=""

Die Konfiguration von Apache kann vor dem ersten Start des
``httpd``-Daemon, oder bei nachfolgenden ?nderungen an der
Konfigurationsdatei bei laufendem ``httpd``, auf Fehler ?berpr?ft
werden. Dies kann durch das
`rc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc&sektion=8>`__-Skript
direkt , oder ?ber das Dienstprogramm
`service(8) <http://www.FreeBSD.org/cgi/man.cgi?query=service&sektion=8>`__
geschehen, indem Sie eines der folgenden Kommandos ausf?hren:

.. code:: screen

    # service apache22
    configtest

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Es ist wichitg zu beachten, dass ``configtest`` kein
`rc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc&sektion=8>`__-Standard
ist, und somit nicht zwingend mit anderen
`rc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc&sektion=8>`__-Startskripten
funktioniert.

.. raw:: html

   </div>

Wenn der Apache keine Fehler in der Konfiguration meldet, kann der
Apache? ``httpd`` mithilfe von
`service(8) <http://www.FreeBSD.org/cgi/man.cgi?query=service&sektion=8>`__
gestartet werden:

.. code:: screen

    # /usr/local/etc/rc.d/apache22
    start

.. code:: screen

    # service apache22
    start

Sie k?nnen den ``httpd``-Dienst testen, indem Sie ``http://localhost``
in Ihren Browser eingeben, wobei Sie *``localhost``* durch den
vollqualifizierten Domainnamen der Machine ersetzen, auf dem der
``httpd`` l?uft. Die Standard Webseite, die angezeigt wird, ist
``/usr/local/www/apache22 /data/index.html``.

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

31.7.4. Virtual Hosting
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Der Apache unterst?tzt zwei Formen des *Virtual Hostings*. Die erste
M?glichkeit bezeichnet man als namenbasiertes virtuelles Hosting. Dabei
wird der HTTP/1.1-Header der Clients dazu verwendet, den Rechnernamen zu
bestimmen. Dadurch wird es m?glich, mehrere Domains unter der gleichen
IP-Adresse zu betreiben.

Damit der Apache namenbasierte virtuelle Domains verwalten kann, f?gen
Sie die folgende Zeile in ``httpd.conf`` ein:

.. code:: programlisting

    NameVirtualHost *

Wenn Ihr Webserver ``www.domain.tld`` hei?t und Sie die virtuelle Domain
``www.someotherdomain.tld`` einrichten wollen, erg?nzen Sie
``httpd.conf`` um folgende Eintr?ge:

.. code:: screen

    <VirtualHost *>
    ServerName www.domain.tld
    DocumentRoot /www/domain.tld
    </VirtualHost>

    <VirtualHost *>
    ServerName www.someotherdomain.tld
    DocumentRoot /www/someotherdomain.tld
    </VirtualHost>

Ersetzen Sie dabei die Adressen sowie den Pfad zu den Dokumenten durch
Ihre eigenen Einstellungen.

Ausf?hrliche Informationen zum Einrichten von virtuellen Domains finden
Sie in der offiziellen Apache-Dokumentation unter
``http://httpd.apache.org/docs/vhosts/``.

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

31.7.5. H?ufig verwendete Apache-Module
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Es gibt viele verschiedene Apache-Module, die den Server um zus?tzliche
Funktionen erweitern. Die FreeBSD-Ports-Sammlung erm?glicht es Ihnen,
den Apache gemeinsam mit einigen der beliebtesten Zusatzmodule zu
installieren.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

31.7.5.1. mod\_ssl
^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das Modul mod\_ssl verwendet die OpenSSL-Bibliothek, um, unter Nutzung
der Protokolle Secure Sockets Layer (SSL v2/v3) sowie Transport Layer
Security (TLS v1) starke Verschl?sselung zu erm?glichen. Durch dieses
Modul k?nnen Sie ein signiertes Zertifikat von einer
Zertifizierungsstelle anfordern, damit Sie einen sicheren Webserver
unter FreeBSD betreiben k?nnen.

Das Modul mod\_ssl wird standardm??ig kompiliert, kann aber auch noch
nachtr?glich durch die Angabe von ``-DWITH_SSL`` zur Kompilierzeit
aktiviert werden.

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

31.7.5.2. Skriptsprachen
^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

F?r die wichtigsten Skriptsprachen existieren Module, die es erlauben,
Apache-Module nahezu vollst?ndig in einer Skriptsprache zu
programmieren. Derartige Module dienen oft dazu, einen
Sprach-Interpreter in den Webserver einzubetten. Dadurch wird ein
zus?tzlicher externer Interpreter ?berfl?ssig, was die Startzeit von
dynamischen Internetseiten deutlich verringert.

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

31.7.6. Dynamische Webseiten
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In den vergangenen Jahren haben immer mehr Unternehmen das Internet als
Mittel f?r die Steigerung ihrer Einnahmen sowie f?r die Erh?hung ihrer
Reichweite entdeckt. Dadurch stieg auch die Nachfrage nach interaktiven
Internetinhalten. Neben einigen Unternehmen, darunter Microsoft?, die
daf?r propriet?re Produkte entwickelt haben, hat auch die Open Source
Community auf diesen Umstand reagiert und unter anderem mit Django, Ruby
on Rails, mod\_perl2, und mod\_php M?glichkeiten zur Generierung
dynamischer Internetseiten geschaffen.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

31.7.6.1. Django
^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Bei *Django* handelt es sich um ein unter der BSD-Lizenz verf?gbares
Framework zur schnellen Erstellung von m?chtigen Internet-Applikationen.
Es beinhaltet einen objekt-relationalen Mapper (wodurch Datentypen als
Phyton-Objekte entwickelt werden k?nnen) sowie eine API f?r den
dynamischen Datenbankzugriff auf diese Objekte, ohne dass Entwickler
jemals SQL-Code schreiben m?ssen. Zus?tzlich existiert ein umfangreiches
Template-System, wodurch die Programmlogik von der HTML-Pr?sentation
getrennt werden kann.

Django setzt das Modul mod\_python, den Apache-Webserver sowie eine
SQL-Datenbank voraus. F?r FreeBSD gibt es einen Port, der alle
Abh?ngigkeiten mit sinnvollen Optionen konfiguriert und installiert.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel 31.3. Django mit Apache2, mod\_python3, und PostgreSQL
installieren

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    # cd /usr/ports/www/py-django; make all install clean -DWITH_MOD_PYTHON3 -DWITH_POSTGRESQL

.. raw:: html

   </div>

.. raw:: html

   </div>

Nachdem Django (sowie die abh?ngigen Pakete) installiert ist, m?ssen Sie
ein Projektverzeichnis erstellen. Danach konfigurieren Sie Apache so,
dass der eingebettete Python-Interpreter spezifische URLs Ihrer Seiten
aufruft.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel 31.4. Apache-Konfiguration f?r Django/mod\_python

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Sie m?ssen die Apache-Konfigurationsdatei ``httpd.conf`` anpassen, damit
Apache Anfragen f?r bestimmte URLs an Ihre Internet-Applikation
?bergibt:

.. code:: screen

    <Location "/">
        SetHandler python-program
        PythonPath "['/dir/to/your/django/packages/'] + sys.path"
        PythonHandler django.core.handlers.modpython
        SetEnv DJANGO_SETTINGS_MODULE mysite.settings
        PythonAutoReload On
        PythonDebug On
    </Location>

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

31.7.6.2. Ruby on Rails
^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Bei *Ruby on Rails* handelt es sich um ein weiteres, als Open Source
verf?gbares Webframework. Es bietet einen kompletten Entwicklungsstack
und erlaubt es Webentwicklern, umfangreiche und m?chtige Applikationen
in kurzer Zeit zu programmieren. Das Framework kann ?ber die
Ports-Sammlung installiert werden.

.. code:: screen

    # cd /usr/ports/www/rubygem-rails; make all install clean

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

31.7.6.3. mod\_perl2
^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Kombination Apache/Perl vereinigt die Vorteile der
Programmiersprache Perl und des Apache HTTP-Servers. Durch das Modul
mod\_perl2 ist es m?glich, vollst?ndig in Perl geschriebene
Apache-Module zu erzeugen. Da der Perl-Interpreter in den Server
eingebettet wird, m?ssen Sie weder einen externen Interpreter noch Perl
zus?tzlich aufrufen.

mod\_perl2 ist ?ber den Port ``www/mod_perl2`` erh?ltlich.

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

31.7.6.4. mod\_php
^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   <div>

Geschrieben von Tom Rhodes.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Bei PHP, dem „Hypertext Preprocessor“, handelt es sich um eine
vielseitig verwendbare Skriptsprache, die besonders f?r die
Internetprogrammierung geeignet ist. PHP kann in HTML eingebettet werden
und ?hnelt von der Syntax her Sprachen wie C, Java™ und Perl. Das
Hauptanliegen von PHP ist es, Internetprogrammierern die rasche
Erstellung von dynamisch erzeugten Internetseiten zu erm?glichen.

Damit Ihr System PHP5 unterst?tzt, m?ssen Sie als Erstes den Apache
Webserver ?ber den Port
`lang/php5 <http://www.freebsd.org/cgi/url.cgi?ports/lang/php5/pkg-descr>`__
installieren.

Wenn Sie den Port
`lang/php5 <http://www.freebsd.org/cgi/url.cgi?ports/lang/php5/pkg-descr>`__
das erste Mal installieren, werden die verf?gbaren Optionen
(``OPTIONS``) automatisch angezeigt. Erscheint das Konfigurationsmen?
bei Ihnen nicht, so liegt dies daran, dass Sie den Port
`lang/php5 <http://www.freebsd.org/cgi/url.cgi?ports/lang/php5/pkg-descr>`__
schon einmal auf Ihrem System installiert hatten. Es ist aber jederzeit
m?glich, dieses Men? aus dem Ports-Verzeichnis heraus ?ber folgenden
Befehl erneut aufzurufen:

.. code:: screen

    # make config

In diesem Konfigurationsmen? m?ssen Sie die Option ``APACHE`` ausw?hlen,
damit mod\_php5 als ein vom Apache-Webserver ladbares Modul gebaut wird.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Viele Seiten verwenden nach wie vor (beispielsweise wegen der ben?tigten
Kompatibilit?t zu bereits vorhandenen Web-Applikationen) PHP4. Ist dies
bei Ihnen der Fall, so m?ssen Sie statt mod\_php5 mod\_php4 ?ber den
Port
`lang/php4 <http://www.freebsd.org/cgi/url.cgi?ports/lang/php4/pkg-descr>`__
installieren. Der Port
`lang/php4 <http://www.freebsd.org/cgi/url.cgi?ports/lang/php4/pkg-descr>`__
unterst?tzt viele der Konfigurations- und Laufzeitoptionen von
`lang/php5 <http://www.freebsd.org/cgi/url.cgi?ports/lang/php5/pkg-descr>`__.

.. raw:: html

   </div>

Dieser Port installiert und konfiguriert die Module, die f?r die
Unterst?tzung von dynamischen PHP-Anwendungen ben?tigt werden. Stellen
Sie danach sicher, dass Ihre ``/usr/local/etc/apache22/httpd.conf`` die
folgenden Abschnitte enth?lt:

.. code:: programlisting

    LoadModule php5_module        libexec/apache/libphp5.so

.. code:: programlisting

    AddModule mod_php5.c
        <IfModule mod_php5.c>
            DirectoryIndex index.php index.html
        </IfModule>
        <IfModule mod_php5.c>
            AddType application/x-httpd-php .php
            AddType application/x-httpd-php-source .phps
        </IfModule>

Nachdem dies erledigt ist, rufen Sie ``apachectl`` auf, um das PHP-Modul
zu laden:

.. code:: screen

    # apachectl graceful

Bei k?nftigen Upgrades von PHP wird ``make config`` nicht mehr ben?tigt,
da die von Ihnen urspr?nglich ausgew?hlten Optionen (``OPTIONS``) vom
FreeBSD-Ports-Framework automatisch gespeichert werden.

Die PHP-Unterst?tzung von FreeBSD ist stark modular aufgebaut, daher
verf?gt eine Basisinstallation nur ?ber wenige Funktionen. Eine
Erweiterung um zus?tzliche Funktionen ist allerdings sehr einfach ?ber
den Port
`lang/php5-extensions <http://www.freebsd.org/cgi/url.cgi?ports/lang/php5-extensions/pkg-descr>`__
m?glich. Der Port bietet Ihnen ein Auswahlmen?, ?ber das Sie
verschiedene PHP-Erweiterungen installieren k?nnen. Alternativ k?nnen
Sie einzelne Erweiterungen aber weiterhin direkt ?ber den jeweiligen
Port installieren.

Um beispielsweise die Unterst?tzung des Datenbankservers MySQL in PHP5
zu aktivieren, installieren Sie den Port ``databases/php5-mysql``.

Nachdem Sie eine Erweiterung installiert haben, m?ssen Sie den
Apache-Server neu starten, damit die Erweiterung auch erkannt wird:

.. code:: screen

    # apachectl graceful

Ab nun wird MySQL von PHP unterst?tzt.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------+----------------------------------------+---------------------------------------+
| `Zur?ck <network-dns.html>`__?     | `Nach oben <network-servers.html>`__   | ?\ `Weiter <network-ftp.html>`__      |
+------------------------------------+----------------------------------------+---------------------------------------+
| 31.6. DNS – Domain Name Service?   | `Zum Anfang <index.html>`__            | ?31.8. FTP – File Transfer Protocol   |
+------------------------------------+----------------------------------------+---------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
