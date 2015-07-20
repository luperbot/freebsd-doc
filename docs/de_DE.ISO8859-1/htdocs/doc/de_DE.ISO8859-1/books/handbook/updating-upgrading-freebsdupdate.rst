====================
26.2. FreeBSD-Update
====================

.. raw:: html

   <div class="navheader">

26.2. FreeBSD-Update
`Zur?ck <updating-upgrading.html>`__?
Kapitel 26. FreeBSD aktualisieren
?\ `Weiter <updating-upgrading-portsnap.html>`__

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

26.2. FreeBSD-Update
--------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Geschrieben von Tom Rhodes.

.. raw:: html

   </div>

.. raw:: html

   <div>

Basierend auf bereitgestellten Mitschriften von Colin Percival.

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

Das Einspielen von Sicherheitsaktualisierungen ist ein wichtiger
Bestandteil bei der Wartung von Computersoftware, besonders wenn es um
das Betriebssystem geht. F?r lange Zeit war dieser Prozess unter FreeBSD
nicht einfach. Fehlerbehebungen mussten auf den Quellcode angewendet
werden, danach wurde der Code zu neuen Bin?rdateien ?bersetzt und
schliesslich mussten diese Dateien neu installiert werden.

Das ist seit l?ngerem nicht mehr der Fall, da FreeBSD jetzt ein Werkzeug
namens ``freebsd-update`` enth?lt. Dieses Werkzeug bringt zwei getrennte
Funktionen mit sich. Die erste Funktion erm?glicht die Anwendung von
Sicherheitsaktualisierungen im Bin?rformat auf das FreeBSD Basissystem,
ohne dieses neu zu ?bersetzen und zu installieren. Die zweite Funktion
unterst?tzt Aktualisierungen zwischen Haupt- und Unterversionen.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Bin?re Aktualisierungen sind f?r alle Architekturen und Releases
verf?gbar, die aktuell vom FreeBSD Security Team betreut werden. Vor der
Aktualisierung auf eine neue Release-Version sollten die aktuellen
Ank?ndigungen zu dem Release gelesen werden, da diese wichtige
Informationen zu der gew?nschten Version enthalten. Diese Ank?ndigungen
finden Sie unter dem folgenden Link:
``http://www.FreeBSD.org/releases/``.

.. raw:: html

   </div>

Wenn eine ``crontab`` existiert, welche die Eigenschaften von
``freebsd-update`` verwendet, muss diese deaktiviert werden, bevor die
folgende Aktion gestartet wird.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

26.2.1. Die Konfigurationsdatei
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Manche Anwender m?chten sicherlich Einstellungen in der
Standard-Konfigurationsdatei unter ``/etc/freebsd-update.conf``
vornehmen, um bessere Kontrolle ?ber den gesamten Prozess zu besitzen.
Die Optionen sind sehr gut dokumentiert, jedoch ben?tigen die folgenden
ein paar zus?tzliche Erkl?rungen:

.. code:: programlisting

    # Components of the base system which should be kept updated.
    Components src world kernel

Dieser Parameter kontrolliert, welche Teile von FreeBSD auf dem
aktuellen Stand gehalten werden sollen. Die Voreinstellung ist es, den
Quellcode zu aktualisieren, das gesamte Basissystem sowie den Kernel.
Die Komponenten sind die gleichen wie w?hrend der Installation, also
w?rde beispielsweise das hinzuf?gen von ``world/games`` an dieser Stelle
es erlauben, Aktualisierungen f?r Spiele anzuwenden. Die Verwendung von
``src/bin`` erlaubt es, den Quellcode in ``src/bin`` aktuell zu halten.

Die beste Einstellung ist, diese Option so zu belassen, da eine ?nderung
es bedingt, dass man als Benutzer jede Komponente auflisten muss, die
aktualisiert werden soll. Dies k?nnte katastrophale Folgen nach sich
ziehen, da der Quellcode und die Bin?rdateien dadurch nicht mehr
synchron w?ren.

.. code:: programlisting

    # Paths which start with anything matching an entry in an IgnorePaths
    # statement will be ignored.
    IgnorePaths

F?gen Sie Pfade wie ``/bin`` oder ``/sbin`` hinzu, um diese speziellen
Verzeichnisse w?hrend des Aktualisierungsprozesses unber?hrt zu lassen.
Diese Option kann verwendet werden, um zu verhindern, dass
``freebsd-update`` lokale ?nderungen ?berschreibt.

.. code:: programlisting

    # Paths which start with anything matching an entry in an UpdateIfUnmodified
    # statement will only be updated if the contents of the file have not been
    # modified by the user (unless changes are merged; see below).
    UpdateIfUnmodified /etc/ /var/ /root/ /.cshrc /.profile

Aktualisieren Sie Konfigurationsdateien in den angegebenen
Verzeichnissen nur, wenn diese nicht ge?ndert wurden. Jegliche ?nderung,
die der Benutzer daran vorgenommen hat, wird die automatische
Aktualisierung dieser Dateien ung?ltig machen. Es gibt eine weitere
Option ``KeepModifiedMetadata``, die ``freebsd-update`` instruiert, die
?nderungen w?hrend der Zusammenf?hrung zu speichern.

.. code:: programlisting

    # When upgrading to a new FreeBSD release, files which match MergeChanges
    # will have any local changes merged into the version from the new release.
    MergeChanges /etc/ /var/named/etc/

Eine Liste von Verzeichnissen mit Konfigurationsdateien, in denen
``freebsd-update`` Zusammenf?hrungen versuchen soll. Dieser
Verschmelzungsprozess von Dateien ist eine Serie von
`diff(1) <http://www.FreeBSD.org/cgi/man.cgi?query=diff&sektion=1>`__-Korrekturen,
?hnlich wie
`mergemaster(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mergemaster&sektion=8>`__
mit weniger Optionen. Die ?nderungen werden entweder akzeptiert, ?ffnen
einen Editor oder ``freebsd-update`` bricht ab. Wenn Sie im Zweifel
sind, sichern Sie das ``/etc`` Verzeichnis und akzeptieren einfach die
?nderungen. Lesen Sie `Abschnitt?26.7.11.1,
„\ ``mergemaster``\ “ <makeworld.html#mergemaster>`__, um Informationen
?ber das ``mergemaster``-Kommando zu erhalten.

.. code:: programlisting

    # Directory in which to store downloaded updates and temporary
    # files used by FreeBSD Update.
    # WorkDir /var/db/freebsd-update

In diesem Verzeichnis werden alle Korrekturen und tempor?ren Dateien
abgelegt. F?r F?lle in denen der Anwender eine Versionsaktualisierung
vornimmt, sollte diesem Verzeichnis mindestens ein Gigabyte
Festplattenspeicher zur Verf?gung stehen.

.. code:: programlisting

    # When upgrading between releases, should the list of Components be
    # read strictly (StrictComponents yes) or merely as a list of components
    # which *might* be installed of which FreeBSD Update should figure out
    # which actually are installed and upgrade those (StrictComponents no)?
    # StrictComponents no

Wenn dies auf ``yes`` gesetzt ist, wird ``freebsd-update`` annehmen,
dass die ``Components``-Liste vollst?ndig ist und nicht versuchen,
?nderungen ausserhalb dieser Liste zu t?tigen. Tats?chlich wird
``freebsd-update`` versuchen, jede Datei zu aktualisieren, die zu der
``Components``-Liste geh?rt.

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

26.2.2. Sicherheitsaktualisierungen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Sicherheitsaktualisierungen sind auf einer entfernten Maschine abgelegt
und k?nnen durch das folgende Kommando heruntergeladen und installiert
werden:

.. code:: screen

    # freebsd-update fetch
    # freebsd-update install

Wenn irgendeine ?nderung auf den Kernel angewendet wurde ben?tigt das
System einen Neustart. Wenn alles gut verlaufen ist, sollte das System
aktualisiert sein und ``freebsd-update`` kann als n?chtlicher
`cron(8) <http://www.FreeBSD.org/cgi/man.cgi?query=cron&sektion=8>`__-Job
ablaufen. Ein Eintrag in der Datei ``/etc/crontab`` ist f?r diese
Aufgabe ausreichend:

.. code:: programlisting

    @daily                                  root    freebsd-update cron

Dieser Eintrag besagt, dass einmal am Tag ``freebsd-update`` ausgef?hrt
wird. Auf diese Weise kann ``freebsd-update`` nur durch die Verwendung
des ``cron``-Arguments pr?fen, ob Aktualisierungen vorliegen. Wenn
Korrekturen existieren, werden diese automatisch auf die lokale
Festplatte heruntergeladen, aber nicht eingespielt. Der
``root``-Benutzer bekommt eine Nachricht, damit dieser die Korrekturen
manuell installiert.

Sollte irgendetwas schief gelaufen sein, kann ``freebsd-update`` den
letzten Satz von ?nderungen mit dem folgenden Befehl zur?ckrollen:

.. code:: screen

    # freebsd-update rollback

Sobald dieser Vorgang abgeschlossen ist, sollte das System neu gestartet
werden, wenn der Kernel oder ein beliebiges Kernelmodul ge?ndert wurde.
Dies erm?glicht es FreeBSD, die neuen Bin?rdateien in den Hauptspeicher
zu laden.

Das ``freebsd-update``-Werkzeug kann nur den ``GENERIC``-Kernel
automatisch aktualisieren. Wenn ein selbstkonfigurierter Kernel
verwendet wird, muss dieser neu erstellt und installiert werden, nachdem
``freebsd-update`` den Rest der Aktualisierungen durchgef?hrt hat.
Allerdings wird ``freebsd-update`` den ``GENERIC``-Kernel in
``/boot/GENERIC`` erkennen und aktualisieren (falls dieser existiert),
sogar dann, wenn dies nicht der aktuell verwendete Kernel des Systems
ist.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Es ist eine gute Idee, immer eine Kopie des ``GENERIC``-Kernels in
``/boot/GENERIC`` aufzubewahren. Das wird bei der Diagnose von
verschiedenen Problemen eine grosse Hilfe sein, sowie bei der
Durchf?hrung von Versionsaktualisierungen mit ``freebsd-update``, wie in
`Abschnitt?26.2.3, „Aktualisierungen an Haupt- und
Unterversionen“ <updating-upgrading-freebsdupdate.html#freebsdupdate-upgrade>`__
beschrieben ist.

.. raw:: html

   </div>

Solange die Standardkonfiguration in ``/etc/freebsd-update.conf`` nicht
ge?ndert wurde, wird ``freebsd-update`` die aktualisierten
Quellcodedateien des Kernels zusammen mit dem Rest der Neuerungen
installieren. Die erneute ?bersetzung und Installation ihres neuen,
selbstkonfigurierten Kernels kann dann auf die ?bliche Art und Weise
durchgef?hrt werden.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Die Aktualisierungen, die ?ber ``freebsd-update`` verteilt werden,
betreffen nicht immer den Kernel. Es ist nicht notwendig, den
selbstkonfigurierten Kernel neu zu erstellen, wenn die Kernelquellen
nicht durch die Ausf?hrung von ``freebsd-update install`` ge?ndert
wurden. Allerdings wird ``freebsd-update`` auf alle F?lle die Datei
``/usr/src/sys/conf/newvers.sh`` aktualisieren. Der aktuelle Patch-Level
(angegeben durch die ``-p``-Nummer, die von dem Kommando
``uname           -r`` ausgegeben wird) wird aus dieser Datei
ausgelesen. Die Neuinstallation des selbstkonfigurierten Kernels, selbst
wenn sich daran nichts ge?ndert hat, erlaubt es
`uname(1) <http://www.FreeBSD.org/cgi/man.cgi?query=uname&sektion=1>`__,
den aktuellen Patch-Level des Systems korrekt wiederzugeben. Dies ist
besonders hilfreich, wenn mehrere Systeme gewartet werden, da es eine
schnelle Einsch?tzung der installierten Aktualisierungen in jedem
einzelnen System erm?glicht.

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

26.2.3. Aktualisierungen an Haupt- und Unterversionen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dieser Prozess entfernt alte Objekt-Dateien und Bibliotheken, was dazu
f?hrt, dass die meisten Anwendungen von Drittherstellern nicht mehr
funktionieren. Es wird empfohlen, dass alle installierten Ports entweder
entfernt und neu installiert oder zu einem sp?teren Zeitpunkt mittels
`ports-mgmt/portupgrade <http://www.freebsd.org/cgi/url.cgi?ports/ports-mgmt/portupgrade/pkg-descr>`__
aktualisiert werden. Die meisten Anwender werden wahrscheinlich einen
Testlauf mittels des folgenden Kommandos durchf?hren wollen:

.. code:: screen

    # portupgrade -af

Dies sorgt daf?r, dass alles korrekt neu installiert wird. Beachten Sie,
dass das Setzen der ``BATCH``-Umgebungsvariable auf ``yes`` w?hrend
dieses Prozesses auf jede Eingabe mit ``ja`` antwortet, was es nicht
mehr notwendig macht, manuell eingreifen zu m?ssen.

Wenn ein selbstkonfigurierter Kernel verwendet wird, ist der
Aktualisierungsprozess ein kleines bisschen aufw?ndiger. Eine Kopie des
``GENERIC``-Kernels wir ben?tigt und sollte in ``/boot/GENERIC``
abgelegt sein. Wenn der ``GENERIC``-Kernel nicht bereits im System
vorhanden ist, kann dieser ?ber eine der folgenden Methoden bezogen
werden:

.. raw:: html

   <div class="itemizedlist">

-  Wenn ein eigener Kernel genau einmal gebaut wurde, ist der Kernel im
   Verzeichnis ``/boot/kernel.old`` in Wirklichkeit der
   ``GENERIC``-Kernel. Benennen Sie einfach dieses Verzeichnis in
   ``/boot/GENERIC`` um.

-  Angenommen, direkter Zugriff auf die Maschine ist m?glich, so kann
   eine Kopie des ``GENERIC``-Kernels von den CD-ROM-Medien installiert
   werden. Legen Sie die Installations-CD ein und benutzen Sie die
   folgenden Befehle:

   .. code:: screen

       # mount /cdrom
       # cd /cdrom/X.Y-RELEASE/kernels
       # ./install.sh GENERIC

   Ersetzen Sie ``X.Y-RELEASE`` mit der richtigen Version der
   Ver?ffentlichung, die Sie verwenden. Der ``GENERIC``-Kernel wird
   standardm?ssig in ``/boot/GENERIC`` installiert.

-  Falls alle obigen Schritte fehlschlagen, kann der ``GENERIC``-Kernel
   folgendermassen aus den Quellen neu gebaut und installiert werden:

   .. code:: screen

       # cd /usr/src
       # env DESTDIR=/boot/GENERIC make kernel
       # mv /boot/GENERIC/boot/kernel/* /boot/GENERIC
       # rm -rf /boot/GENERIC/boot

   Damit dieser Kernel als ``GENERIC``-Kernel von ``freebsd-update``
   erkannt wird, darf die ``GENERIC``-Konfigurationsdatei in keiner
   Weise ge?ndert worden sein. Es wird ebenfalls empfohlen, dass dieser
   ohne irgendwelche speziellen Optionen erstellt wird (bevorzugt mit
   einer leeren ``/etc/make.conf``).

.. raw:: html

   </div>

Der Neustart in den ``GENERIC``-Kernel ist zu diesem Zeitpunkt nicht
notwendig.

Aktualisierungen an Haupt- und Unterversionen k?nnen durchgef?hrt
werden, wenn man ``freebsd-update`` eine Release-Version als Ziel
?bergibt. Beispielsweise wird das folgende Kommando das System auf
FreeBSD?8.1 aktualisieren:

.. code:: screen

    # freebsd-update -r 8.1-RELEASE upgrade

Nachdem das Kommando empfangen wurde, ?berpr?ft ``freebsd-update`` die
Konfigurationsdatei und das aktuelle System, um die n?tigen
Informationen f?r die Systemaktualisierung zu sammeln. Eine
Bildschirmausgabe wird anzeigen, welche Komponenten erkannt und welche
nicht erkannt wurden. Zum Beispiel:

.. code:: screen

    Looking up update.FreeBSD.org mirrors... 1 mirrors found.
    Fetching metadata signature for 8.0-RELEASE from update1.FreeBSD.org... done.
    Fetching metadata index... done.
    Inspecting system... done.

    The following components of FreeBSD seem to be installed:
    kernel/smp src/base src/bin src/contrib src/crypto src/etc src/games
    src/gnu src/include src/krb5 src/lib src/libexec src/release src/rescue
    src/sbin src/secure src/share src/sys src/tools src/ubin src/usbin
    world/base world/info world/lib32 world/manpages

    The following components of FreeBSD do not seem to be installed:
    kernel/generic world/catpages world/dict world/doc world/games
    world/proflibs

    Does this look reasonable (y/n)? y

An diesem Punkt wird ``freebsd-update`` versuchen, alle notwendigen
Dateien f?r die Aktualisierung herunter zu laden. In manchen F?llen wird
der Benutzer mit Fragen konfrontiert, um festzustellen, was installiert
werden soll oder auf welche Art und Weise fortgesetzt werden soll.

Wenn ein selbstkonfigurierter Kernel benutzt wird, produziert der
vorherige Schritt eine Warnung ?hnlich zu der folgenden:

.. code:: screen

    WARNING: This system is running a "MYKERNEL" kernel, which is not a
    kernel configuration distributed as part of FreeBSD 8.0-RELEASE.
    This kernel will not be updated: you MUST update the kernel manually
    before running "/usr/sbin/freebsd-update install"

Diese Warnung kann an dieser Stelle problemlos ignoriert werden. Der
aktualisierte ``GENERIC``-Kernel wird als ein Zwischenschritt im
Aktualisierungsprozess verwendet.

Nachdem alle Korrekturen auf das lokale System heruntergeladen wurden,
werden diese nun eingespielt. Dieser Prozess kann eine gewisse Zeit in
Anspruch nehmen, abh?ngig von der Geschwindigkeit und Auslastung der
Maschine. Konfigurationsdateien werden ebenfalls zusammengef?gt - dieser
Teil der Prozedur ben?tigt einige Benutzereingaben, da eine Datei
m?glicherweise von Hand zusammengefasst werden muss oder ein Editor
erscheint auf dem Bildschirm zum manuellen bearbeiten. Die Ergebnisse
von jeder erfolgreichen Zusammenfassung werden dem Benutzer angezeigt,
w?hrend der Prozess weiterl?uft. Eine fehlgeschlagene oder ignorierte
Zusammenfassung wird den Prozess sofort beenden. Benutzer sollten eine
Sicherung von ``/etc`` anlegen und wichtige Dateien sp?ter manuell
vereinen, beispielsweise ``master.passwd`` oder ``group``.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Das System ist noch nicht ver?ndert worden, alle Korrekturen und
Vereinigungen sind in einem anderen Verzeichnis vorgenommen worden. Wenn
alle Korrekturen erfolgreich eingespielt, alle Konfigurationsdateien
zusammengef?gt wurden und es den Anschein hat, dass der Prozess
problemlos verlaufen wird, m?ssen die ?nderungen vom Anwender noch
angewendet werden.

.. raw:: html

   </div>

Sobald dieser Prozess abgeschlossen ist, k?nnen die Aktualisierungen
?ber das folgende Kommando auf die Platte geschrieben werden:

.. code:: screen

    # freebsd-update install

Der Kernel und die Module werden zuerst aktualisiert. Zu diesem
Zeitpunkt muss die Maschine neu gestartet werden. Wenn das System einen
selbstkonfigurierten Kernel verwendet, benutzen Sie das
`nextboot(8) <http://www.FreeBSD.org/cgi/man.cgi?query=nextboot&sektion=8>`__-Kommando,
um den Kernel f?r den n?chsten Neustart auf ``/boot/GENERIC`` zu setzen
(welcher aktualisiert wurde):

.. code:: screen

    # nextboot -k GENERIC

.. raw:: html

   <div class="warning" xmlns="">

Warnung:
~~~~~~~~

Bevor mit dem ``GENERIC``-Kernel das System neu gestartet wird,
vergewissern Sie sich, dass alle notwendigen Treiber f?r ihr System
enthalten sind, um korrekt zu starten (und schliessen Sie ihn ans
Netzwerk an, falls auf die Maschine, die aktualisiert wird, von der
Ferne aus zugegriffen wird). Achten Sie besonders darauf, dass wenn der
vorherige selbstkonfigurierte Kernel Funktionalit?t beinhaltet, die von
Kernelmodulen zur Verf?gung gestellt wurde, dass diese tempor?r in den
``GENERIC``-Kernel ?ber die Datei ``/boot/loader.conf`` ?bernommen
werden. Sie sollten ebenfalls nicht ben?tigte Dienste, eingeh?ngte
Platten, verbundene Netzlaufwerke, usw. deaktivieren, bis der
Aktualisierungsprozess abgeschlossen ist.

.. raw:: html

   </div>

Die Maschine sollte nun mit dem aktualisierten Kernel neu gestartet
werden:

.. code:: screen

    # shutdown -r now

Sobald das System wieder hochgefahren wurde, muss ``freebsd-update``
erneut gestartet werden. Der Zustand des Prozesses wurde zuvor gesichert
und deshalb wird ``freebsd-update`` nicht von vorne beginnen, jedoch
alle alten Shared-Libraries und Objektdateien l?schen. Um zu diesem
Zustand zu gelangen, setzen Sie das folgende Kommando ab:

.. code:: screen

    # freebsd-update install

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Abh?ngig davon, ob irgendwelche Bibliotheksversionen erh?ht wurden, kann
es sein, dass nur zwei Installationsphasen anstatt drei durchlaufen
werden.

.. raw:: html

   </div>

Nun muss alle Drittanbieter-Software neu erstellt und neu installiert
werden. Dies ist notwendig, da die installierte Software m?glicherweise
Abh?ngigkeiten zu Bibliotheken enth?lt, die w?hrend der Aktualisierung
entfernt wurden. Der
`ports-mgmt/portupgrade <http://www.freebsd.org/cgi/url.cgi?ports/ports-mgmt/portupgrade/pkg-descr>`__-Befehl
kann verwendet werden, um diesen Vorgang zu automatisieren. Die
folgenden Kommandos k?nnen verwendet werden, um diesen Prozess zu
starten:

.. code:: screen

    # portupgrade -f ruby
    # rm /var/db/pkg/pkgdb.db
    # portupgrade -f ruby18-bdb
    # rm /var/db/pkg/pkgdb.db /usr/ports/INDEX-*.db
    # portupgrade -af

Sobald dies abgeschlossen ist, beenden Sie den Aktualisierungsprozess
mit einem letzten Aufruf von ``freebsd-update``. Geben Sie den folgenden
Befehl ein, um alle losen Enden des Aktualisierungsprozesses miteinander
zu verkn?pfen:

.. code:: screen

    # freebsd-update install

Wenn der ``GENERIC``-Kernel tempor?r Verwendung fand, ist dies der
richtige Zeitpunkt, einen neuen, selbstkonfigurierten Kernel zu bauen
und ?ber die ?bliche Methode zu installieren.

Booten Sie anschliessend die Maschine in die neue FreeBSD-Version. Der
Prozess ist damit abgeschlossen.

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

26.2.4. Vergleich des Systemzustands
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das ``freebsd-update``-Werkzeug kann verwendet werden, um den Zustand
der installierten FreeBSD-Version gegen?ber einer bekannten und
funktionierenden Kopie zu vergleichen. Diese Option vergleicht die
aktuelle Version von Systemwerkzeugen, Bibliotheken und
Konfigurationsdateien. Um diesen Vergleich zu starten, geben Sie den
folgenden Befehl ein:

.. code:: screen

    # freebsd-update IDS >> outfile.ids

.. raw:: html

   <div class="warning" xmlns="">

Warnung:
~~~~~~~~

Obwohl der Befehlsname IDS lautet, sollte er in keiner Weise als Ersatz
f?r ein Intrusion Detection System wie
`security/snort <http://www.freebsd.org/cgi/url.cgi?ports/security/snort/pkg-descr>`__
angesehen werden. Da ``freebsd-update`` seine Daten auf Platte ablegt,
ist die M?glichkeit von Verf?lschungen offensichtlich. Obwohl diese
M?glichkeit durch die Verwendung von ``kern.securelevel`` oder die
Ablage von ``freebsd-update`` auf einem Nur-Lese Dateisystem, wenn es
gerade nicht gebraucht wird, einged?mmt werden kann, besteht eine
bessere L?sung darin, das System gegen ein gesichertes Medium, wie eine
DVD oder einen externen, separat aufbewahrten USB-Plattenspeicher, zu
vergleichen.

.. raw:: html

   </div>

Das System wird jetzt untersucht und eine Liste von Dateien ausgegeben,
zusammen mit deren
`sha256(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sha256&sektion=1>`__-Hashwerten,
sowohl der von der Release-Version bekannte Wert als auch der des
aktuell installierten Systems. Das ist der Grund daf?r, warum die
Ausgabe an die Datei ``outfile.ids`` geschickt wurde. Es scrollt zu
schnell vorbei, um diese mit den Augen zu vergleichen und bald wird auch
der Konsolenpuffer damit ?berf?llt.

Diese Zeilen sind dazu noch extrem lang, aber das Ausgabeformat kann
sehr einfach verarbeitet werden. Um beispielsweise eine Liste von allen
Dateien zu erhalten, die sich vom aktuellen Release unterscheiden, geben
Sie das folgende Kommando ein:

.. code:: screen

    # cat outfile.ids | awk '{ print $1 }' | more
    /etc/master.passwd
    /etc/motd
    /etc/passwd
    /etc/pf.conf

Diese Ausgabe wurde abgeschnitten, es existieren noch viel mehr Dateien
dazu. Manche dieser Dateien besitzen ganz selbstverst?ndliche
Ver?nderungen, ``/etc/passwd`` wurde beispielsweise ge?ndert, um
Benutzer zum System hinzuzuf?gen. In manchen F?llen kann es anderen
Dateien wie Kernelmodule geben, welche sich ge?ndert haben, weil
``freebsd-update`` diese aktualisiert hat. Um bestimmte Dateien oder
Verzeichnisse auszuschliessen, h?ngen Sie diese an die
``IDSIgnorePaths``-Option in ``/etc/freebsd-update.conf`` an.

Diese Vorgehensweise kann als Teil einer ausgekl?gelten
Aktualisierungsmethode benutzt werden, unabh?ngig von der zuvor
angesprochenen Variante.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------+-------------------------------------------+-----------------------------------------------------------------------+
| `Zur?ck <updating-upgrading.html>`__?   | `Nach oben <updating-upgrading.html>`__   | ?\ `Weiter <updating-upgrading-portsnap.html>`__                      |
+-----------------------------------------+-------------------------------------------+-----------------------------------------------------------------------+
| Kapitel 26. FreeBSD aktualisieren?      | `Zum Anfang <index.html>`__               | ?26.3. Portsnap: Ein Werkzeug zur Aktualisierung der Ports-Sammlung   |
+-----------------------------------------+-------------------------------------------+-----------------------------------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
