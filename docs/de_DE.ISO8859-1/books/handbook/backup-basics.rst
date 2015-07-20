=====================
19.12. Datensicherung
=====================

.. raw:: html

   <div class="navheader">

19.12. Datensicherung
`Zur?ck <backup-strategies.html>`__?
Kapitel 19. Speichermedien
?\ `Weiter <disks-virtual.html>`__

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

19.12. Datensicherung
---------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die drei wichtigsten Programme zur Sicherung von Daten sind
`dump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dump&sektion=8>`__,
`tar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tar&sektion=1>`__ und
`cpio(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cpio&sektion=1>`__.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

19.12.1. Sichern und Wiederherstellen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``dump`` und ``restore`` sind die traditionellen Backup-Programme in
UNIX? Systemen. Sie betrachten das Laufwerk als eine Ansammlung von
Bl?cken, operieren also unterhalb des Abstraktionslevels von Dateien,
Links und Verzeichnissen, die die Grundlage des Dateisystemkonzepts
bilden. Im Gegensatz zu anderen Backup-Programmen sichert ``dump`` ein
ganzes Dateisystem auf einem Ger?t. Es ist nicht m?glich nur einen Teil
des Dateisystems, oder einen Verzeichnisbaum, der mehr als ein
Dateisystem umfasst, zu sichern. Das ``dump``-Kommando schreibt keine
Dateien oder Verzeichnisse auf das Band, sondern die Bl?cke, aus denen
Dateien und Verzeichnisse bestehen. Wenn ``restore`` f?r das Extrahieren
von Daten verwendet wird, werden tempor?re Dateien standardm??ig in
``/tmp/`` abgelegt - wenn Sie von einer Platte mit einem kleinen
``/tmp``-Verzeichnis zur?cksichern, m?ssen Sie m?glicherweise die
Umgebungsvariable ``TMPDIR`` auf ein Verzeichnis mit mehr freiem
Speicherplatz setzen, damit die Wiederherstellung gelingt.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Wenn Sie mit ``dump`` das Root-Verzeichnis sichern, werden ``/home``,
``/usr`` und viele andere Verzeichnisse nicht gesichert, da dies
normalerweise Mountpunkte f?r andere Dateisysteme oder symbolische Links
zu diesen Dateisystemen sind.

.. raw:: html

   </div>

``dump`` hat einige Eigenarten, die noch aus den fr?hen Tagen der
Version 6 von AT&T UNIX (ca. 1975) stammen. Die Parameter sind f?r
9-Spur-B?nder (6250?bpi) voreingestellt, nicht auf die heute ?blichen
Medien hoher Dichte (bis zu 62.182?ftpi). Bei der Verwendung der
Kapazit?ten moderner Bandlaufwerke muss diese Voreinstellung auf der
Kommandozeile ?berschrieben werden.

``rdump`` und ``rrestore`` k?nnen Daten ?ber Netzwerk auf ein Band, das
sich in einem Laufwerk eines anderen Computers befindet, ?berspielen.
Beide Programme benutzen die Funktionen
`rcmd(3) <http://www.FreeBSD.org/cgi/man.cgi?query=rcmd&sektion=3>`__
und
`ruserok(3) <http://www.FreeBSD.org/cgi/man.cgi?query=ruserok&sektion=3>`__
zum Zugriff auf das entfernte Bandlaufwerk. Daher muss der Anwender, der
das Backup durchf?hrt, auf dem entfernten Rechner in ``.rhosts``
eingetragen sein.

Die Argumente zu ``rdump`` und ``rrestore`` m?ssen zur Verwendung auf
dem entfernten Computer geeignet sein. Wenn Sie zum Beispiel mit
``rdump`` von einem FreeBSD-Rechner aus auf ein Exabyte-Bandlaufwerk
einer Sun mit Namen ``komodo`` zugreifen m?chten, setzen Sie das
folgende Kommando ab:

.. code:: screen

    # /sbin/rdump 0dsbfu 54000 13000 126 komodo:/dev/nsa8 /dev/da0a 2>&1

Zum Ausf?hren dieses Kommandos m?ssen Sie auf dem entfernten Rechner in
``.rhosts`` eingetragen sein. Die r-Kommandos sind ein gro?es
Sicherheitsrisiko, daher sollten Sie deren Verwendung sorgf?ltig
abw?gen.

Es ist auch m?glich, ``dump`` und ``restore`` ?ber eine gesicherte
Verbindung mit ``ssh`` einzusetzen:

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel 19.1. ``dump`` mit ssh benutzen

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    # /sbin/dump -0uan -f - /usr | gzip -2 | ssh -c blowfish \
          targetuser@targetmachine.example.com dd of=/mybigfiles/dump-usr-l0.gz

.. raw:: html

   </div>

.. raw:: html

   </div>

Sie k?nnen ebenfalls mit der internen Methode von ``dump`` auf entfernte
Rechner zugreifen, indem Sie die Umgebungsvariable ``RSH`` setzen:

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel 19.2. ``dump`` ?ber ssh mit gesetzter ``RSH`` benutzen

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    # env RSH=/usr/bin/ssh /sbin/dump -0uan -f tatargetuser@targetmachine.example.com:/dev/sa0 /usr

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

19.12.2. ``tar``
~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

`tar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tar&sektion=1>`__
stammt ebenfalls aus Version 6 von AT&T UNIX (ca. 1975). ``tar``
arbeitet mit dem Dateisystem, denn es schreibt Dateien und Verzeichnisse
auf das Band. ``tar`` unterst?tzt zwar nicht alle Optionen, die bei
`cpio(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cpio&sektion=1>`__
zur Verf?gung stehen, aber daf?r erfordert es auch nicht die
ungew?hnliche Kommando-Pipeline, die von ``cpio`` verwendet wird.

Um Daten mit ``tar`` auf ein an einer Sun-Workstation (namens
``komodo``) angeschlossenes Exabyte-Bandlaufwerk zu archivieren, geben
Sie Folgendes ein:

.. code:: screen

    # tar cf - . | rsh komodo dd of=tape-device obs=20b

Wenn Sie Bedenken bez?glich der Sicherheit beim Backup ?ber das Netz
haben, sollten Sie ``ssh`` anstatt ``rsh`` benutzen.

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

19.12.3. Cpio
~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

`cpio(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cpio&sektion=1>`__
ist das urspr?ngliche Programm von UNIX? Systemen zum Dateitransfer mit
magnetischen Medien. ``cpio`` hat (neben vielen anderen
Leistungsmerkmalen) Optionen zum Byte-Swapping, zum Schreiben einer
Anzahl verschiedener Archivformate und zum Weiterleiten von Daten an
andere Programme ?ber eine Pipeline. Dieses letzte Leistungsmerkmal
macht ``cpio`` zu einer ausgezeichneten Wahl f?r Installationsmedien.
Leider kann ``cpio`` keine Dateib?ume durchlaufen, so dass eine Liste
der zu bearbeitenden Dateien ?ber ``stdin`` angegeben werden muss.

``cpio`` unterst?tzt keine Backups ?ber das Netzwerk. Man kann aber eine
Pipeline und ``rsh`` verwenden, um Daten an ein entferntes Bandlaufwerk
zu senden.

.. code:: screen

    # for f in directory_list; do
    find $f >> backup.list
    done
    # cpio -v -o --format=newc < backup.list | ssh user@host "cat > backup_device"

Dabei steht *``directory_list``* f?r eine Aufz?hlung der Verzeichnisse,
die Sie sichern wollen. *``user``*\ @\ *``host``* gibt den Benutzer auf
dem Zielrechner an, der die Sicherung laufen l?sst. Der Ort der
Sicherung wird durch *``backup_device``* angegeben (z.B. ``/dev/nsa0``).

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

19.12.4. ``pax``
~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

`pax(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pax&sektion=1>`__ ist
die Antwort von IEEE/POSIX? auf ``tar`` und ``cpio``. ?ber die Jahre
hinweg sind die verschiedenen Versionen von ``tar`` und ``cpio`` leicht
inkompatibel geworden. Daher hat POSIX?, statt eine Standardisierung
zwischen diesen auszufechten, ein neues Archivprogramm geschaffen.
``pax`` versucht viele der unterschiedlichen ``cpio``- und
``tar``-Formate zu lesen und zu schreiben, au?erdem einige neue, eigene
Formate. Die Kommandostruktur ?hnelt eher ``cpio`` als ``tar``.

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

19.12.5. Amanda
~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Amanda (Advanced Maryland Network Disk Archiver) ist ein
Client/Server-Backupsystem, nicht nur ein einzelnes Programm. Ein
Amanda-Server kann auf einem einzigen Bandlaufwerk Datensicherungen von
jeder beliebigen Anzahl von Computern speichern, sofern auf diesen
jeweils ein Amanda-Client l?uft und sie ?ber Netzwerk mit dem
Amanda-Server verbunden sind.

Ein h?ufiges Problem bei Standorten mit einer Anzahl gro?er Festplatten
ist, dass das Kopieren der Daten auf Band langsamer vor sich geht als
solche Daten anfallen. Amanda l?st dieses Problem durch Verwendung einer
„Holding Disk“, einer Festplatte zum gleichzeitigen Zwischenspeichern
mehrerer Dateisysteme.

F?r Datensicherungen ?ber einen l?ngeren Zeitraum erzeugt Amanda
„Archivsets“ von allen Dateisystemen, die in Amandas Konfigurationsdatei
genannt werden. Ein Archivset ist eine Gruppe von B?ndern mit vollen
Backups und Reihen von inkrementellen (oder differentiellen) Backups,
die jeweils nur die Unterschiede zum vorigen Backup enthalten. Zur
Wiederherstellung von besch?digten Dateisystemen ben?tigt man Das Letzte
volle Backup und alle darauf folgenden inkrementellen Backups.

Die Konfigurationsdatei erm?glicht die Feineinstellung der Backups und
des Netzwerkverkehrs von Amanda. Amanda kann zum Schreiben der Daten auf
das Band jedes der oben beschriebenen Backuprogramme verwenden. Amanda
ist nicht Teil des Basissystems, Sie m?ssen Amanda ?ber die
Ports-Sammlung oder als Paket installieren.

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

19.12.6. Tue nichts
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

„Tue nichts“ ist kein Computerprogramm, sondern die am h?ufigsten
angewendete Backupstrategie. Diese kostet nichts, man muss keinen Backup
Plan befolgen, einfach nur nein sagen. Wenn etwas passiert, einfach
grinsen und ertragen!

Wenn Ihre Zeit und Ihre Daten nicht so wichtig sind, dann ist die
Strategie „Tue nichts“ das geeignetste Backup-Programm f?r Ihren
Computer. Aber UNIX? ist ein n?tzliches Werkzeug, Sie m?ssen damit
rechnen, dass Sie innerhalb von sechs Monaten eine Sammlung von Dateien
haben, die f?r Sie wertvoll geworden sind.

„Tue nichts“ ist die richtige Backupmethode f?r ``/usr/obj`` und andere
Verzeichnisb?ume, die vom Computer exakt wiedererzeugt werden k?nnen.
Ein Beispiel sind die Dateien, die diese Handbuchseiten darstellen – sie
wurden aus Quelldateien im Format SGML erzeugt. Es ist nicht n?tig,
Sicherheitskopien der Dateien in den sekund?ren Formaten wie etwa HTML
zu erstellen. Die Quelldateien in SGML sollten jedoch in die
regelm??igen Backups mit einbezogen werden.

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

19.12.7. Welches Backup-Programm ist am Besten?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``dump``, *Punkt und Schluss.* Elizabeth?D. Zwicky hat alle hier
genannten Backup-Programme bis zur Ersch?pfung ausgetestet. Ihre
eindeutige Wahl zur Sicherung aller Daten mit Ber?cksichtigung aller
Besonderheiten von UNIX? Dateisystemen ist ``dump``.

Elizabeth erzeugte Dateisysteme mit einer gro?en Vielfalt ungew?hnlicher
Bedingungen (und einiger gar nicht so ungew?hnlicher) und testete jedes
Programm durch ein Backup und eine Wiederherstellung dieser
Dateisysteme. Unter den Besonderheiten waren Dateien mit L?chern,
Dateien mit L?chern und einem Block mit Null-Zeichen, Dateien mit
ausgefallenen Buchstaben im Dateinamen, unlesbare und nichtschreibbare
Dateien, Ger?tedateien, Dateien, deren L?nge sich w?hrend des Backups
?ndert, Dateien, die w?hrend des Backups erzeugt und gel?scht werden,
u.v.m. Sie berichtete ?ber ihre Ergebnisse in LISA V im Oktober 1991, s.
`Torture-testing Backup and Archive
Programs <http://www.coredumps.de/doc/dump/zwicky/testdump.doc.html>`__.

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

19.12.8. Die Wiederherstellung in einem Notfall
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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

19.12.8.1. Vor dem Ungl?ck
^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Es sind nur vier Vorkehrungen zu treffen, um auf jedes erdenkliche
Ungl?ck vorbereitet zu sein.

Als erstes drucken Sie das bsdlabel jeder Ihrer Festplatten (z.B.
mittels ``bsdlabel da0 | lpr``), die Partitions- und Dateisystemtabelle
jeder Festplatte (mit ``/etc/fstab``) sowie alle Bootmeldungen, jeweils
in zweifacher Ausfertigung.

Zweitens, brennen Sie eine „livefs“-CD. Diese CD-ROM enth?lt alle
n?tigen Programme, um in einen Reperaturmodus zu starten, aus dem heraus
Sie unter anderem
`dump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dump&sektion=8>`__,
`restore(8) <http://www.FreeBSD.org/cgi/man.cgi?query=restore&sektion=8>`__,
`fdisk(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fdisk&sektion=8>`__,
`bsdlabel(8) <http://www.FreeBSD.org/cgi/man.cgi?query=bsdlabel&sektion=8>`__,
`newfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newfs&sektion=8>`__
sowie
`mount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount&sektion=8>`__
starten k?nnen. ISO-Abbilder f?r das „livefs“-System finden Sie unter
``ftp://ftp.FreeBSD.org/pub/FreeBSD/releases/i386/ISO-IMAGES/10.1/FreeBSD-10.1-RELEASE-i386-livefs.iso``.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Seit FreeBSD?9.0-RELEASE sind ISO-Abbilder f?r das „livefs“-System nicht
mehr verf?gbar. Neben den ISO-Abbildern f?r CD-ROM k?nnen auch Abbilder
f?r USB-Datenspeicher verwendet werden, um ein System
wiederherzustellen. Das „memstick“-Abbild f?r FreeBSD/i386?10.1-RELEASE
finden Sie unter
``ftp://ftp.FreeBSD.org/pub/FreeBSD/releases/i386/i386/ISO-IMAGES/10.1/FreeBSD-10.1-RELEASE-i386-memstick.img``.

.. raw:: html

   </div>

Drittens, machen Sie regelm??ig Backups auf Band. Jede ?nderung seit
Ihrem letzten Backup kann unwiederbringlich verloren gehen. Versehen Sie
die Backup-B?nder mit Schreibschutz.

Viertens, testen Sie das in Schritt 2 erstellte „livefs“-System sowie
die f?r das Backup notwendigen B?nder. Dokumentieren Sie diesen Test und
bewahren Sie diese Notizen zusammen mit der „livefs“-CD und den B?ndern
auf. Wenn der Ernstfall eintritt, werden Sie vielleicht so genervt sein,
dass Sie ohne Ihre Notizen vielleicht das Backup auf Ihren B?ndern
zerst?ren. (Wie das geht? Man braucht nur ungl?cklicherweise den Befehl
``tar cvf             /dev/sa0`` einzugeben um ein Band zu
?berschreiben).

Als zus?tzliche Sicherheitsvorkehrung, kann man jeweils die „livefs“-CD
und B?nder doppelt erstellen. Eine der Kopien sollte an einem entfernten
Standort aufbewahrt werden. Ein entfernter Standort ist NICHT der Keller
im gleichen B?rogeb?ude. Eine Anzahl von Firmen im World Trade Center
musste diese Lektion auf die harte Tour lernen. Ein entfernter Standort
sollte von Ihrem Computer und Ihren Festplatten physikalisch durch eine
erhebliche Entfernung getrennt sein.

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

19.12.8.2. Nach dem Ungl?ck
^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Schl?sselfrage ist, ob Ihre Hardware ?berlebt hat. Denn da Sie ja
regelm??ig Backups angefertigt haben, brauchen Sie sich um die Software
keine Sorgen zu machen.

Falls die Hardware besch?digt wurde, ersetzen Sie zuerst die defekten
Teile bevor Sie den Computer benutzen.

Falls die Hardware funktioniert, legen Sie die „livefs“-CD in das
Laufwerk ein und starten den Rechner, wodurch das originale
Installationsprogramm von FreeBSD gestartet wird. Legen Sie zuerst Ihr
Land fest. Danach ?ffnen Sie das Men?
``Fixit -- Repair mode with CDROM/DVD/floppy or start           a shell.``
und w?hlen den Eintrag CDROM/DVD -- Use the live filesystem CDROM/DVD
aus. ``restore`` und die anderen Programme, die Sie ben?tigen, befinden
sich dann im Verzeichnis ``/mnt2/rescue``.

Stellen Sie die Dateisysteme nacheinander wieder her.

Versuchen Sie die Root-Partition Ihrer ersten Festplatte einzuh?ngen
(z.B. mit ``mount /dev/sd0a             /mnt``). Wenn das Bsdlabel
besch?digt wurde, benutzen Sie ``bsdlabel`` um die Platte neu zu
partitionieren und zu benennen und zwar so, dass die Festplatte mit dem
Label ?bereinstimmt, das Sie ausgedruckt und aufbewahrt haben.

Verwenden Sie ``newfs`` um neue Dateisysteme auf den Partitionen
anzulegen. H?ngen Sie nun die Root-Partition der Festplatte mit
Schreibzugriff ein (mit ``mount -u -o rw             /mnt``). Benutzen
Sie Ihr Backup-Programm um die Daten f?r das jeweilige Dateisystem aus
den Backup-B?ndern wieder her zu stellen (z.B. durch
``restore vrf             /dev/sta``). H?ngen Sie das Dateisystem wieder
aus (z.B. durch ``umount /mnt``). Wiederholen Sie diesen Ablauf f?r
jedes betroffene Dateisystem.

Sobald Ihr System wieder l?uft, machen Sie gleich wieder ein
vollst?ndiges Backup auf neue B?nder. Denn die Ursache f?r den Absturz
oder den Datenverlust kann wieder zuschlagen. Eine weitere Stunde, die
Sie jetzt noch dranh?ngen, kann Ihnen sp?ter ein weiteres Missgeschick
ersparen.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------+-------------------------------+---------------------------------------------------------------+
| `Zur?ck <backup-strategies.html>`__?   | `Nach oben <disks.html>`__    | ?\ `Weiter <disks-virtual.html>`__                            |
+----------------------------------------+-------------------------------+---------------------------------------------------------------+
| 19.11. Backup-Strategien?              | `Zum Anfang <index.html>`__   | ?19.13. Netzwerk-, speicher- und dateibasierte Dateisysteme   |
+----------------------------------------+-------------------------------+---------------------------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
