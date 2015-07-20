==============================
FreeBSD und Solid State-Ger?te
==============================

.. raw:: html

   <div class="article" lang="de" lang="de">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="authorgroup" xmlns="http://www.w3.org/1999/xhtml">

.. raw:: html

   <div class="author">

John Kozubik
~~~~~~~~~~~~

.. raw:: html

   <div class="affiliation">

.. raw:: html

   <div class="address">

``<john@kozubik.com>``

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div>

Version: ` <https://svnweb.freebsd.org/changeset/doc/>`__

.. raw:: html

   </div>

.. raw:: html

   <div>

Copyright ? 2001, 2009 The FreeBSD Documentation Project

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="legalnotice" xmlns="http://www.w3.org/1999/xhtml">

FreeBSD ist ein eingetragenes Warenzeichen der FreeBSD Foundation.

Viele Produktbezeichnungen von Herstellern und Verk?ufern sind
Warenzeichen. Soweit dem FreeBSD Project das Warenzeichen bekannt ist,
werden die in diesem Dokument vorkommenden Bezeichnungen mit dem Symbol
„™“ oder dem Symbol „?“ gekennzeichnet.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="legalnotice" xmlns="http://www.w3.org/1999/xhtml">

Redistribution and use in source (SGML DocBook) and 'compiled' forms
(SGML, HTML, PDF, PostScript, RTF and so forth) with or without
modification, are permitted provided that the following conditions are
met:

.. raw:: html

   <div class="orderedlist">

#. Redistributions of source code (SGML DocBook) must retain the above
   copyright notice, this list of conditions and the following
   disclaimer as the first lines of this file unmodified.

#. Redistributions in compiled form (transformed to other DTDs,
   converted to PDF, PostScript, RTF and other formats) must reproduce
   the above copyright notice, this list of conditions and the following
   disclaimer in the documentation and/or other materials provided with
   the distribution.

.. raw:: html

   </div>

.. raw:: html

   <div class="important" xmlns="">

Wichtig:
~~~~~~~~

THIS DOCUMENTATION IS PROVIDED BY THE FREEBSD DOCUMENTATION PROJECT "AS
IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE FREEBSD
DOCUMENTATION PROJECT BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
DOCUMENTATION, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div>

Zuletzt bearbeitet am von .

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="abstract" xmlns="http://www.w3.org/1999/xhtml">

.. raw:: html

   <div class="abstract-title">

Zusammenfassung

.. raw:: html

   </div>

Dieser Artikel behandelt die Verwendung von Solid State Festplatten in
FreeBSD, um eingebettete Systeme zu erstellen.

Eingebettete Systeme haben den Vorteil, dass sie eine h?here Stabilit?t
aufgrund des fehlens von beweglichen Bauteilen (Festplatten) besitzen.
Es muss jedoch beachtet werden, dass generell weniger Speicherplatz zur
Verf?gung steht und die Lebensdauer des Speichermediums geringer ist.

Spezielle Themen die behandelt werden beinhalten die Typen und Attribute
von Solid State Datentr?gern, die in FreeBSD verwendet werden,
Kernel-Optionen die in solch einer Umgebung von Interesse sind, der
``rc.initdiskless``-Mechanismus, welcher die Initalisierung solcher
Systeme automatisiert, sowie die Notwendigkeit von
Nur-Lese-Dateisystemen und das Erstellen von Dateisystemen von Grund
auf. Der Artikel schliesst mit ein paar generellen Strategien f?r kleine
und Nur-Lese-FreeBSD Umgebungen.

*?bersetzt von Benedict Reuschling*.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="docformatnavi">

[ `einzelne Abschnitte <index.html>`__ / komplettes Dokument ]

.. raw:: html

   </div>

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Inhaltsverzeichnis

.. raw:: html

   </div>

`1. Solid State Festplattenger?te <#intro>`__
`2. Kerneloptionen <#kernel>`__
`3. Die ``rc``-Subsysteme und nur-Lese Dateisysteme <#ro-fs>`__
`4. Ein Dateisystem von Grund auf neu erstellen <#idp61907664>`__
`5. Systemstrategien f?r kleine und Nur-Lese-Umgebungen <#strategies>`__

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

1. Solid State Festplattenger?te
--------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Der Umfang des Artikels ist auf Solid State Ger?te beschr?nkt, die auf
Flash-Speicher basieren. Flash-Speicher ist ein Solid State Speicher
(keine beweglichen Teile), der nicht fl?chtig ist (der Speicher beh?lt
die Daten sogar nachdem alle Energiequellen ausgeschaltet wurden).
Flash-Speicher kann grossen physischen Schock aushalten und ist
vergleichsweise schnell (die Flash-Speicher L?sungen, die in diesem
Artikel behandelt werden, sind nur wenig langsamer als eine
EIDE-Festplatte in der Schreibgeschwindigkeit und viel schneller bei
Lese-Operationen). Ein sehr wichtiger Aspekt von Flash-Speichern, dessen
Auswirkungen sp?ter in diesem Artikel diskutiert werden, ist, dass jeder
Sektor eine begrenzte Kapazit?t zur Wiederbeschreibung besitzt. Man kann
nur eine bestimmte Anzahl von Schreib-, L?sch- und
Wiederbeschreibungsvorg?ngen durchf?hren, bevor der Sektor permanent
unbrauchbar wird. Obwohl viele Flash-Speicher Produkte automatisch
schlechte Bl?cke markieren und manche Ger?te Schreiboperationen
gleichm?ssig verteilen, bleibt weiterhin die Anzahl der durchf?hrbaren
Schreibvorg?nge begrenzt. Verschiedene Ger?teeinheiten besitzen zwischen
1,000,000 und 10,000,000 Schreibzyklen pro Sektor in ihren
Spezifikationen. Diese Zahlen variieren aufgrund der
Umgebungstemperatur.

Im Speziellen werden wir ATA-kompatible Compact-Flash-Karten betrachten,
welche als Speichermedien f?r Digitalkameras ziemlich popul?r sind. Von
besonderem Interesse ist der Umstand, dass diese direkt an den IDE-Bus
angeschlossen werden und kompatibel zu den ATA-Befehlen sind. Aus diesem
Grund k?nnen diese Ger?te mit einem einfachen und billigen Adapter
direkt an den IDE-Bus eines Computers angeschlossen werden. Auf diese
Weise sehen Betriebssysteme wie FreeBSD diese Ger?te dann als normale
(wenn auch sehr kleine) Festplatten an.

Andere Solid State Plattenl?sungen existieren, jedoch platzieren deren
Kosten, Obskurit?t und ihre Unhandlichkeit sie aussserhalb des Umfangs
dieses Artikels.

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

2. Kerneloptionen
-----------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Ein paar Kerneloptionen sind von besonderem Interesse f?r diejenigen,
welche diese eingebetteten FreeBSD-Systeme erstellen m?chten.

Alle eingebetteten FreeBSD-Systeme, die Flash-Speicher als Systemplatte
verwenden, sind interessant f?r Dateisysteme im Hauptspeicher und
RAM-Disks. Wegen der begrenzten Anzahl von Schreibzyklen, die auf
Flash-Speicher durchgef?hrt werden k?nnen, werden die Platte und die
Dateisysteme darauf mit grosser Wahrscheinlichkeit nur lesend eingeh?ngt
werden. In dieser Umgebung werden Dateisysteme wie ``/tmp`` und ``/var``
als RAM-Disks eingebunden, um dem System zu erlauben, Logdateien
anzulegen und Z?hler sowie tempor?re Dateien zu aktualisieren. RAM-Disks
sind eine kritische Komponente f?r eine erfolgreiche Solid State
Umsetzung in FreeBSD.

Sie sollten daf?r sorgen, dass die folgenden Zeilen in Ihrer
Kernelkonfigurationsdatei vorhanden sind:

.. code:: programlisting

    options         MFS             # Memory Filesystem
    options         MD_ROOT         # md device usable as a potential root device
    pseudo-device   md              # memory disk

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

3. Die ``rc``-Subsysteme und nur-Lese Dateisysteme
--------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Initialisierung nach dem Bootvorgang eines eingebetteten
FreeBSD-Systems wird von ``/etc/rc.initdiskless`` kontrolliert.

``/etc/rc.d/var`` h?ngt ``/var`` als RAM-Disk ein, erstellt eine
konfigurierbare Liste von Verzeichnissen in ``/var`` mittels des
`mkdir(1) <http://www.FreeBSD.org/cgi/man.cgi?query=mkdir&sektion=1>`__-Kommandos
und ?ndert die Attribute von ein paar dieser Verzeichnisse. Bei der
Ausf?hrung von ``/etc/rc.d/var`` kommt eine andere ``rc.conf``-Variable
ins Spiel: ``varsize``. Die Datei ``/etc/rc.d/var`` erstellt eine
``/var``-Partition basierend auf dem Wert dieser Variable in
``rc.conf``:

.. code:: programlisting

    varsize=8192

Standardm?ssig wird dieser Wert in Sektoren angegeben.

Der Fakt, dass es sich bei ``/var`` um ein nur-Lese Dateisystem handelt,
ist eine wichtige Unterscheidung, da die ``/``-Partition (und jede
andere Partition, die Sie auf Ihrem Flash-Medium haben) nur lesend
eingeh?ngt wird. Erinnern Sie sich, dass in `Abschnitt?1, „Solid State
Festplattenger?te“ <#intro>`__ die Beschr?nkungen von Flash-Speichern
erl?utert wurden, speziell deren begrenzte Kapazit?t zum Schreiben. Die
Notwendigkeit, Dateisysteme auf Flash-Speichern nur lesend einzubinden
und keine Swap-Dateien zu verwenden, kann nicht oft genug erw?hnt
werden. Eine Swap-Datei auf einem ausgelasteten System kann in weniger
als einem Jahr den gesamten Flash-Speicher aufbrauchen. H?ufige
Protokollierung oder das Erstellen und L?schen von tempor?ren Dateien
kann das gleiche verursachen. Aus diesem Grund sollten Sie zus?tzlich
zum entfernen des ``swap``-Eintrags aus ihrer ``/etc/fstab``-Datei auch
noch die Optionsfelder f?r jedes Dateisystem auf ``ro`` wie folgt
stellen:

.. code:: programlisting

    # Device                Mountpoint      FStype  Options         Dump    Pass#
    /dev/ad0s1a             /               ufs     ro              1       1

Ein paar Anwendungen im normalen System werden sofort nach dieser
?nderung ausfallen. Beispielsweise wird Cron nicht richtig
funktionieren, aufgrund von fehlenden Cron-Tabellen in ``/var`` die von
``/etc/rc.d/var`` erstellt wurden. Syslog und DHCP werden ebenfalls
Probleme durch das nur-Lese Dateisystem und fehlende Elemente im
Verzeichnis ``/var`` verursachen, die ``/etc/rc.d/var`` erstellt hat.
Diese Probleme sind jedoch nur vor?bergehend und werden zusammen mit
L?sungen zur Ausf?hrung von anderen gebr?uchlichen Softwarepaketen in
`Abschnitt?5, „Systemstrategien f?r kleine und
Nur-Lese-Umgebungen“ <#strategies>`__ angesprochen.

Eine wichtige Sache, an die man sich erinnern sollte, ist, dass ein
Dateisystem, welches als nur lesend in ``/etc/fstab`` eingebunden wurde,
jederzeit als schreibend durch das folgende Kommando eingeh?ngt werden
kann:

.. code:: screen

    # /sbin/mount -uw partition

und auch wieder zur?ck auf nur lesend durch den Befehl:

.. code:: screen

    # /sbin/mount -ur partition

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

4. Ein Dateisystem von Grund auf neu erstellen
----------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn ATA-kompatible Compact-Flash-Karten von FreeBSD als normale
IDE-Festplatten erkannt werden, k?nnten Sie theoretisch FreeBSD aus dem
Netzwerk mittels der Kern- und mfsroot-Floppies oder einer CD
installieren.

Jedoch kann selbst eine kleine Installation von FreeBSD durch die
normale Installationsprozedur ein System erzeugen, dass gr?sser als
200?MB ist. Da die meisten Leute kleinere Flash-Speichermedien einsetzen
(128?MB wird hier als gross angesehen - 32 oder sogar 16?MB sind
gebr?uchlich) ist eine gew?hnliche Installation mit normalen Methoden
nicht m?glich, da es einfach nicht genug freien Plattenplatz gibt,
selbst f?r die kleinste Installationsart.

Der einfachste Weg, diese Speicherlimitierung zu umgehen, ist, FreeBSD
auf konventionelle Weise auf eine normale Festplatte zu installieren.
Nachdem die Installation abgeschlossen wurde, k?rzen Sie das
Betriebssystem auf das n?tigste, bis Sie eine Gr?sse erreicht hat, die
auf das Flash-Medium passt und benutzen Sie dann tar auf dem gesamten
Dateisystem. Die folgenden Schritte werden Sie durch den Prozess der
Vorbereitung eines Flash-Mediums f?r ihr getartes Dateisystem f?hren.
Beachten Sie, dass Operationen wie Partitionierung, Benennung,
Erstellung von Dateisystemen, etc. von Hand durchgef?hrt werden m?ssen,
da eine normale Installation nicht m?glich ist. Zus?tzlich zu den Kern-
und mfsroot-Disketten ben?tigen Sie auch die fixit-Floppy.

.. raw:: html

   <div class="procedure">

#. **Partitionierung Ihrer Flash-Medien**

   W?hlen Sie nach dem Starten der Kern- und mfsroot-Disketten,
   ``custom`` aus dem Installationsmen?. In diesem Men? w?hlen Sie dann
   ``partition`` aus. Dort sollten Sie alle bestehenden Partitionen mit
   Hilfe der Taste **d** l?schen. Nachdem alle bestehenden Partitionen
   gel?scht wurden, erstellen Sie mittels der Taste **c** eine Partition
   und akzeptieren Sie den Standardwert f?r die Gr?sse der Partition.
   Wenn Sie nach dem Typ der Partition gefragt werden, stellen Sie
   sicher, dass der Wert auf ``165`` eingestellt ist. Schreiben Sie
   jetzt diese Partitionstabelle auf die Platte durch bet?tigen der
   Taste **w** (dies ist die versteckte Option auf diesem Bildschirm).
   Wenn Sie eine ATA-kompatible Compact Flash-Karte verwenden, sollten
   Sie den FreeBSD Bootmanager ausw?hlen. Dr?cken Sie nun die Taste
   **q**, um das Partitionsmen? zu verlassen. Sie werden das Men? des
   Bootmanagers noch ein weiteres Mal gezeigt bekommt. In diesem Fall
   wiederholen Sie die Auswahl von vorher.

#. **Anlegen von Dateisystemen auf Ihrem Flashspeicher-Ger?t**

   Verlassen Sie das Installationsmen? und w?hlen Sie aus dem
   Hauptinstallationsmen? die Option ``fixit``. In der fixit-Umgebung
   angelangt, geben Sie den folgenden Befehl ein:

   .. code:: screen

       # disklabel -e /dev/ad0c

   Zu diesem Zeitpunkt sollten Sie sich im vi-Editor unter der
   Herrschaft des disklabel-Kommandos befinden. Als n?chstes m?ssen Sie
   die eine ``a:``-Zeile an das Ende der Datei hinzuf?gen. Diese
   ``a:``-Zeile sollte wie folgt aussehen:

   .. code:: programlisting

       a:      123456  0       4.2BSD  0       0

   Wobei *``123456``* eine Zahl darstellt, die exakt der gleichen Zahl
   in der bestehenden Zeile mit dem ``c:``-Eintrag entspricht. Sie
   kopieren quasi die bestehende Zeile ``c:`` als eine neue Zeile ``a:``
   und stellen sicher, dass fstype ``4.2BSD`` entspricht. Speichern Sie
   die Datei und verlassen Sie den Editor.

   .. code:: screen

       # disklabel -B -r /dev/ad0c
       # newfs /dev/ad0a

#. **Schreiben des Dateisystems auf Ihr Flash-Medium**

   H?ngen Sie das neu erstellte Flash-Medium ein:

   .. code:: screen

       # mount /dev/ad0a /flash

   Verbinden Sie diese Maschine mit dem Netzwerk, um die tar-Datei zu
   ?bertragen und extrahieren Sie es auf das Dateisystem des
   Flash-Mediums. Ein Beispiel dazu w?re folgendes:

   .. code:: screen

       # ifconfig xl0 192.168.0.10 netmask 255.255.255.0
       # route add default 192.168.0.1

   Jetzt da die Maschine ans Netzwerk angeschlossen ist, kopieren Sie
   die tar-Datei. An diesem Punkt werden Sie m?glicherweise mit einem
   Dilemma konfrontiert - sollte Ihr Flash-Speicher beispielsweise
   128?MB gross sein und Ihre tar-Datei gr?sser als 64?MB, k?nnen Sie
   ihre tar-Datei auf dem Flash-Speicher nicht entpacken - Ihnen wird
   vorher der Speicherplatz ausgehen. Eine L?sung f?r dieses Problem,
   sofern Sie FTP verwenden, ist, dass Sie die Datei entpacken k?nnen,
   w?hrend es von FTP ?bertragen wird. Wenn Sie die ?bertragung auf
   diese Weise durchf?hren, haben Sie niemals die tar-Datei und deren
   Inhalt zur gleichen Zeit auf Ihrem Medium:

   .. code:: screen

       ftp> get tarfile.tar "| tar xvf -"

   Sollte Ihre tar-Datei gezippt sein, k?nnen Sie dies ebenso
   bewerkstelligen:

   .. code:: screen

       ftp> get tarfile.tar "| zcat | tar xvf -"

   Nachdem der Inhalt Ihrer tar-Datei auf dem Dateisystem des
   Flash-Mediums abgelegt wurden, k?nnen Sie den Flash-Speicher
   aush?ngen und neu starten:

   .. code:: screen

       # cd /
       # umount /flash
       # exit

   In der Annahme, dass Sie Ihr Dateisystem richtig konfiguriert haben,
   als es noch auf der gew?hnlichen Festplatte gebaut wurde (mit Ihren
   Nur-Lese-Dateisystemen und den n?tigen Optionen im Kernel), sollten
   Sie nun erfolgreich von Ihrem FreeBSD Embedded-System starten k?nnen.

.. raw:: html

   </div>

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

5. Systemstrategien f?r kleine und Nur-Lese-Umgebungen
------------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In `Abschnitt?3, „Die ``rc``-Subsysteme und nur-Lese
Dateisysteme“ <#ro-fs>`__ wurde darauf hingewiesen, dass das
``/var``-Dateisystem von ``/etc/rc.d/var`` konstruiert wurde und die
Pr?senz eines Nur-Lese-Wurzeldateisystems Probleme mit vielen in FreeBSD
gebr?chlichen Softwarepaketen verursacht. In diesem Artikel werden
Vorschl?ge f?r das erfolgreiche Betreiben von cron, syslog,
Installationen von Ports und dem Apache-Webserver unterbreitet.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.1. cron
~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

W?hrend des Bootvorgangs wird ``/var`` von ``/etc/rc.d/var`` anhand der
Liste aus ``/etc/mtree/BSD.var.dist`` gef?llt, damit ``cron``,
``cron/tabs``, ``at`` und ein paar weitere Standardverzeichnisse
erstellt werden.

Jedoch l?st das noch nicht das Problem, Crontabs ?ber Neustarts des
Systems hinaus zu erhalten. Wenn das System neu gestartet wird,
verschwindet das ``/var``-Dateiystem, welches sich im Hauptspeicher
befunden hat und jegliche Crontabs, die Sie hatten werden ebenfalls
verschwinden. Aus diesem Grund besteht eine L?sung darin, Crontabs f?r
diejenigen Benutzer zu erstellen, die diese auch ben?tigen. Dazu sollte
das ``/``-Dateisystem lesend und schreibend eingeh?ngt und diese
Crontabs an einen sicheren Ort kopiert werden, wie beispielsweise
``/etc/tabs``. F?gen Sie dann eine Zeile an das Ende der Datei
``/etc/rc.initdiskless`` hinzu, die diese Crontabs in ``/var/cron/tabs``
kopiert, nachdem dieses Verzeichnis w?hrend der Systeminitialisierung
erstellt wurde. Sie werden auch eine Zeile hinzuf?gen m?ssen, welche die
Besitzer und Berechtigungen auf diesen Verzeichnissen, die Sie erstellen
und den dazugeh?rigen Dateien, die Sie mittels ``/etc/rc.initdiskless``
kopieren, setzen.

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

5.2. syslog
~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Datei ``syslog.conf`` spezifiziert den Ort von bestimmten
Logdateien, welche in ``/var/log`` existieren. Diese Dateien werden
nicht von ``/etc/rc.d/var`` w?hrend der Systeminitialisierung erstellt.
Aus diesem Grund m?ssen Sie irgendwo in ``/etc/rc.d/var`` nach dem
Abschnitt, der die Verzeichnisse in ``/var`` erstellt, eine Zeile
?hnlich der folgenden hinzuf?gen:

.. code:: screen

    # touch /var/log/security /var/log/maillog /var/log/cron /var/log/messages
    # chmod 0644 /var/log/*

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

5.3. Installation von Ports
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Bevor die notwendigen ?nderungen erk?rt werden, einen Ports-Baum zu
verwenden, ist es notwendig, Sie an die Nur-Lese-Besonderheit Ihres
Dateisystems auf dem Flash-Medium zu erinnern. Da dieses nur lesend
verf?gbar ist, m?ssen Sie es vor?bergehend mit Schreibrechten
ausstatten, indem Sie die mount-Syntax, wie in `Abschnitt?3, „Die
``rc``-Subsysteme und nur-Lese Dateisysteme“ <#ro-fs>`__ dargestellt
wird, verwenden. Sie sollten immer diese Dateisysteme erneut mit
nur-Lese-Rechten einh?ngen wenn Sie damit fertig sind - unn?tige
Schreibvorg?nge auf dem Flash-Medium kann dessen Lebenszeit erheblich
verk?rzen.

Um es zu erm?glichen, in das Ports-Verzeichnis zu wechseln und
erfolgreich ``make`` ``install`` auszuf?hren, m?ssen wir ein
Paketverzeichnis auf einem Nicht-Hauptspeicherdateisystem erstellen,
welches die Pakete ?ber Neustarts hinweg im Auge beh?lt. Weil es sowieso
n?tig ist, Ihre Dateisysteme mit Lese-Schreibrechten f?r die
Installation eines Pakets einzuh?ngen, ist es sinnvoll anzunehmen, dass
ein Bereich Ihres Flash-Mediums ebenfalls f?r Paketinformationen, die
darauf abgespeichert werden, verwendet wird.

Erstellen Sie zuerst ein Verzeichnis f?r die Paketdatenbank.
Normalerweise ist dies ``/var/db/pkg``, jedoch k?nnen wir es dort nicht
unterbringen, da es jedesmal verschwinden wird, wenn das System neu
gestartet wird.

.. code:: screen

    # mkdir /etc/pkg

F?gen Sie nun eine Zeile in ``/etc/rc.d/var`` hinzu, welche das
``/etc/pkg``-Verzeichnis mit ``/var/db/pkg`` verkn?pft. Ein Beispiel:

.. code:: screen

    # ln -s /etc/pkg /var/db/pkg

Nun wird jedes Mal, wenn Sie Ihre Dateisysteme mit Lese-Schreibrechten
einbinden und ein Paket installieren, der Befehl ``make`` ``install``
funktionieren und Paketinformationen werden erfolgreich nach
``/etc/pkg`` geschrieben (da zu diesem Zeitpunkt das Dateisystem mit
Lese-Schreibrechten eingebunden ist), welche dann stets dem
Betriebssystem als ``/var/db/pkg`` zur Verf?gung stehen.

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

5.4. Apache Webserver
~~~~~~~~~~~~~~~~~~~~~

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

Die Anweisungen in diesem Abschnitt sind nur notwendig, wenn Apache so
eingerichtet ist, dass dieser seine PID oder
Protokollierungsinformationen ausserhalb von ``/var`` ablegt.
Standardm?ssig bewahrt Apache seine PID-Datei in ``/var/run/httpd.pid``
und seine Protokolldateien in ``/var/log`` auf.

.. raw:: html

   </div>

Es wird nun davon ausgegangen, dass Apache seine Protokolldateien in
einem Verzeichnis namens ``apache_log_dir`` ausserhalb von ``/var``
speichert. Wenn dieses Verzeichnis auf einem nur-Lese-Dateisystem
existiert, wird Apache nicht in der Lage sein, Protokolldateien zu
speichern und wird vermutlich nicht richtig funktionieren. Wenn dies der
Fall ist, muss ein neues Verzeichnis zu der Liste der Verzeichnisse in
``/etc/rc.d/var`` hinzugef?gt werden, um dieses in ``/var`` zu erstellen
und um ``apache_log_dir`` nach ``/var/log/apache`` zu verkn?pfen. Es ist
auch n?tig, Berechtigungen und Besitzer auf diesem neuen Verzeichnis zu
setzen.

F?gen Sie zuerst das Verzeichnis ``log/apache`` zu der Liste von
Verzeichnissen hinzu, die in ``/etc/rc.d/var`` angelegt werden sollen.

Danach tragen Sie die folgenden Befehle in ``/etc/rc.d/var`` nach dem
Abschnitt zum Erstellen der Verzeichnisse ein:

.. code:: screen

    # chmod 0774 /var/log/apache
    # chown nobody:nobody /var/log/apache

Schliesslich l?schen Sie das bestehende ``apache_log_dir`` Verzeichnis
und ersetzen es mit einer Verkn?pfung:

.. code:: screen

    # rm -rf apache_log_dir
    # ln -s /var/log/apache apache_log_dir

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>
