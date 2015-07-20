=========================
16.6. Anwendung von Jails
=========================

.. raw:: html

   <div class="navheader">

16.6. Anwendung von Jails
`Zur?ck <jails-tuning.html>`__?
Kapitel 16. Jails
?\ `Weiter <mac.html>`__

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

16.6. Anwendung von Jails
-------------------------

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

16.6.1. Service-Jails
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div>

Beigetragen von Daniel Gerzo.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dieser Abschnitt basiert auf einer von Simon L. B. Nielsen auf
``http://simon.nitro.dk/service-jails.html`` pr?sentierten Idee und
einem aktualisierten Artikel von Ken Tom (``<locals@gmail.com>``). Er
beschreibt, wie ein FreeBSD-System durch Benutzung der
`jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8>`__-Funktion
mit zus?tzlichen Sicherheitsebenen ausgestattet werden kann. Es wird
dabei angenommen, dass auf Ihrem FreeBSD-System RELENG\_6\_0 oder neuer
installiert ist und dass Sie die Informationen aus den vorangehenden
Abschnitten gelesen und verstanden haben.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

16.6.1.1. Design
^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Eines der Hauptprobleme bei Jails ist das Management ihres
Upgrade-Prozesses. Dieser neigt dazu, problematisch zu sein, da jede
Jail bei jedem Upgrade komplett neu gebaut werden muss. Das stellt
normalerweise kein Problem dar, wenn es sich um eine einzelne Jail
handelt, da der Upgrade-Prozess recht einfach ist. Verwenden Sie aber
eine gr??ere Anzahl von Jails, kann dieser Prozess sehr zeitaufwendig
werden.

.. raw:: html

   <div class="warning" xmlns="">

Warnung:
~~~~~~~~

Diese Konfiguration erfordert fortgeschrittene Kenntnisse im Umgang mit
FreeBSD sowie der Benutzung seiner Funktionen. Sollten die unten
vorgestellten Schritte zu kompliziert wirken, wird empfohlen, sich
einfachere Verfahren wie
`sysutils/ezjail <http://www.freebsd.org/cgi/url.cgi?ports/sysutils/ezjail/pkg-descr>`__
anzusehen, da diese einfachere Methoden zur Administration von Jails
verwenden und daher nicht so anspruchsvoll sind wie der hier
beschriebene Aufbau.

.. raw:: html

   </div>

Diese Konfiguration basiert darauf, Jails so weit als m?glich gemeinsam
zu verwalten. Dies passiert auf sichere Art und Weise durch den Einsatz
von
`mount\_nullfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount_nullfs&sektion=8>`__-Mounts
(read-only). Dadurch werden Aktualisierungen erleichtert und das
Verteilen von verschiedenen Diensten auf verschiedene Jails wird
attraktiver. Au?erdem bietet dieses Verfahren einen einfachen Weg, Jails
hinzuzuf?gen, zu entfernen und zu aktualisieren.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Beispiele f?r Dienste sind in diesem Zusammenhang: Ein HTTP-Server, ein
DNS-Server, ein SMTP-Server und so weiter.

.. raw:: html

   </div>

Die Ziele des in diesem Abschnitt beschriebenen Aufbaus sind:

.. raw:: html

   <div class="itemizedlist">

-  Das Erstellen einer einfachen und gut verst?ndlichen Struktur von
   Jails. Dies beinhaltet, *nicht* f?r jede Jail ein vollst?ndiges
   installworld laufen lassen zu m?ssen.

-  Es einfach zu machen, neue Jails zu erstellen oder alte zu entfernen.

-  Es einfach zu machen, bestehende Jails zu aktualisieren.

-  Es einfach zu machen, einen angepassten FreeBSD-Zweig zu nutzen.

-  Paranoid bez?glich Sicherheit zu sein und Angriffsm?glickeiten
   weitgehend zu reduzieren.

-  Soviel Platz und Inodes wie m?glich einzusparen.

.. raw:: html

   </div>

Wie bereits erw?hnt, ist dieses Design stark darauf angewiesen, dass
eine read-only-Hauptvorlage in jede Jail hinein gemountet wird (bekannt
als nullfs), und dass jede Jail ?ber wenigstens ein beschreibbares Ger?t
verf?gt. Das Ger?t kann hierbei eine separate physikalische Platte oder
ein vnode unterst?tztes
`md(4) <http://www.FreeBSD.org/cgi/man.cgi?query=md&sektion=4>`__-Ger?t
sein. Im folgenden Beispiel wird ein nullfs-Mount genutzt, auf den nur
Lesezugriff erlaubt ist.

Das Layout des Dateisystems wird in der folgenden Liste beschrieben:

.. raw:: html

   <div class="itemizedlist">

-  Jede Jail wird unterhalb des ``/home/j``-Verzeichnisses gemountet.

-  ``/home/j/mroot`` ist die Vorlage f?r jede Jail und die nur lesbare
   Partition f?r alle Jails.

-  Unterhalb von ``/home/j`` wird f?r jede Jail ein leeres Verzeichnis
   angelegt.

-  Jede Jail bekommt ein ``/s``-Verzeichnis, das zum
   read/write-Teilbereich des Systems verlinkt wird.

-  Jede Jail bekommt ihr eigenes read/write-System, das auf
   ``/home/j/skel`` basiert.

-  Jeder Jailbereich (genauer der read/write-Teilbereich jeder Jail)
   wird in ``/home/js`` erstellt.

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Es wird angenommen, dass die Jails sich unterhalb des ``/home``
Verzeichnisses befinden. Dieser Ort kann von Ihnen nat?rlich ge?ndert
werden. Allerdings m?ssen die Pfade in den folgenden Beispielen dann
entsprechend angepasst werden.

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

16.6.1.2. Erstellen der Vorlage
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dieser Abschnitt beschreibt die Schritte, die zum Erstellen der
Hauptvorlage (die den nur lesbaren Bereich f?r alle weiteren Jails
darstellt) notwendig sind.

Es ist immer eine gute Idee, FreeBSD auf den aktuellen -RELEASE-Zweig zu
aktualisieren. Lesen Sie das entsprechende
`Kapitel <../../../../doc/de_DE.ISO8859-1/books/handbook/makeworld.html>`__
des Handbuchs f?r Informationen zu diesem Thema. Selbst wenn Sie auf
eine Aktualisierung des Betriebssystems verzichten, m?ssen Sie dennoch
ein buildworld durchf?hren, um fortfahren zu k?nnen. Au?erdem m?ssen Sie
das Paket
`sysutils/cpdup <http://www.freebsd.org/cgi/url.cgi?ports/sysutils/cpdup/pkg-descr>`__
installiert sein. In diesem Beispiel wird
`portsnap(8) <http://www.FreeBSD.org/cgi/man.cgi?query=portsnap&sektion=8>`__
verwendet, um die aktuelle FreeBSD Ports-Sammlung herunterzuladen. Der
Abschnitt
`Portsnap <../../../../doc/de_DE.ISO8859-1/books/handbook/portsnap.html>`__
des Handbuchs beschreibt, wie Sie dieses Werkzeug effektiv einsetzen.

.. raw:: html

   <div class="procedure">

#. Zuerst erstellen wir eine Verzeichnissstruktur f?r das
   read-only-Dateisystem, das die FreeBSD-Bin?rdateien f?r unsere Jails
   enthalten wird. Anschlie?end wechseln wir in den
   FreeBSD-Quellcodebaum und installieren das read-only-Dateisystem in
   die (Vorlage-)Jail.

   .. code:: screen

       # mkdir /home/j /home/j/mroot
       # cd /usr/src
       # make installworld DESTDIR=/home/j/mroot

#. Als n?chstes bereiten wir die Ports-Sammlung f? die Jails vor und
   kopieren den FreeBSD Quellcodebaum in die Jail, da dieser f?r
   mergemaster ben?tigt wird:

   .. code:: screen

       # cd /home/j/mroot
       # mkdir usr/ports
       # portsnap -p /home/j/mroot/usr/ports fetch extract
       # cpdup /usr/src /home/j/mroot/usr/src

#. Danach wird die Struktur f?r den read/write-Bereich des Systems
   erstellt:

   .. code:: screen

       # mkdir /home/j/skel /home/j/skel/home /home/j/skel/usr-X11R6 /home/j/skel/distfiles
       # mv etc /home/j/skel
       # mv usr/local /home/j/skel/usr-local
       # mv tmp /home/j/skel
       # mv var /home/j/skel
       # mv root /home/j/skel

#. Nutzen Sie mergemaster, um fehlende Konfigurationsdateien zu
   installieren. Anschlie?end werden die von mergemaster erstellten
   Extra-Verzeichnisse entfernt:

   .. code:: screen

       # mergemaster -t /home/j/skel/var/tmp/temproot -D /home/j/skel -i
       # cd /home/j/skel
       # rm -R bin boot lib libexec mnt proc rescue sbin sys usr dev

#. Nun wird das read/write-Dateisystem mit dem read-only-Dateisystem
   verlinkt. Bitte vergewissern Sie sich, dass die symbolischen Links an
   den korrekten ``s/`` Positionen erstellt werden. Echte Verzeichnisse
   oder an falschen Positionen erstellte Verzeichnisse lassen die
   Installation fehlschlagen.

   .. code:: screen

       # cd /home/j/mroot
       # mkdir s
       # ln -s s/etc etc
       # ln -s s/home home
       # ln -s s/root root
       # ln -s ../s/usr-local usr/local
       # ln -s ../s/usr-X11R6 usr/X11R6
       # ln -s ../../s/distfiles usr/ports/distfiles
       # ln -s s/tmp tmp
       # ln -s s/var var

#. Zuletzt erstellen Sie eine allgemeine ``/home/j/skel/etc/make.conf``
   mit folgendem Inhalt:

   .. code:: programlisting

       WRKDIRPREFIX?=  /s/portbuild

   Ein gesetztes ``WRKDIRPREFIX`` erlaubt es, die FreeBSD-Ports
   innerhalb jeder Jail zu kompilieren. Das Ports-Verzeichnis ist Teil
   des read-only System. Der angepasste Pfad des ``WRKDIRPREFIX`` macht
   es m?glich, innerhalb des read/write-Bereichs der Jail Ports zu
   bauen.

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

16.6.1.3. Jails erstellen
^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Da nun eine komplette FreeBSD-Jailvorlage vorliegt, sind wir nun in der
Lage, Jails einrichten und in ``/etc/rc.conf`` zu konfigurieren. Dieses
Beispiel zeigt das Erstellen von drei Jails: „NS“, „MAIL“ und „WWW“.

.. raw:: html

   <div class="procedure">

#. F?gen Sie die folgenden Zeilen in ``/etc/fstab`` ein, damit die
   read-only-Vorlage und der read/write-Bereich f?r alle Jails verf?gbar
   sind:

   .. code:: programlisting

       /home/j/mroot   /home/j/ns     nullfs  ro  0   0
       /home/j/mroot   /home/j/mail   nullfs  ro  0   0
       /home/j/mroot   /home/j/www    nullfs  ro  0   0
       /home/js/ns     /home/j/ns/s   nullfs  rw  0   0
       /home/js/mail   /home/j/mail/s nullfs  rw  0   0
       /home/js/www    /home/j/www/s  nullfs  rw  0   0

   .. raw:: html

      <div class="note" xmlns="">

   Anmerkung:
   ~~~~~~~~~~

   Mit der Pass-Nummer 0 markierte Partitionen werden beim Booten des
   Systems nicht von
   `fsck(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck&sektion=8>`__
   gepr?ft, mit 0 als Dump-Nummer markierte Partitonen werden von
   `dump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dump&sektion=8>`__
   nicht gesichert. Wir wollen nicht, dass fsck unsere nullfs-Mounts
   pr?ft oder dass dump die nur lesbaren nullfs-Mounts unserer Jails
   sichert. Deshalb werden diese Bereiche in den letzten beiden Spalten
   der obenstehenden ``fstab`` mit „0?0“ markiert.

   .. raw:: html

      </div>

#. Konfigurieren Sie die Jails in ``/etc/rc.conf``:

   .. code:: programlisting

       jail_enable="YES"
       jail_set_hostname_allow="NO"
       jail_list="ns mail www"
       jail_ns_hostname="ns.example.org"
       jail_ns_ip="192.168.3.17"
       jail_ns_rootdir="/usr/home/j/ns"
       jail_ns_devfs_enable="YES"
       jail_mail_hostname="mail.example.org"
       jail_mail_ip="192.168.3.18"
       jail_mail_rootdir="/usr/home/j/mail"
       jail_mail_devfs_enable="YES"
       jail_www_hostname="www.example.org"
       jail_www_ip="62.123.43.14"
       jail_www_rootdir="/usr/home/j/www"
       jail_www_devfs_enable="YES"

   .. raw:: html

      <div class="warning" xmlns="">

   Warnung:
   ~~~~~~~~

   Der Grund daf?r, dass die Variablen ``jail_name``\ \_rootdir nach
   ``/usr/home`` statt nach ``/home`` zeigen, liegt darin, dass der
   physikalische Pfad des ``/home``-Verzeichnisses unter FreeBSD
   ``/usr/home`` lautet. Die Variable ``jail_name``\ \_rootdir darf im
   Pfad aber *keinen symbolischen Link* enthalten, weil das Jail
   ansonsten nicht gestartet werden kann. Verwenden Sie
   `realpath(1) <http://www.FreeBSD.org/cgi/man.cgi?query=realpath&sektion=1>`__,
   um den korrekten Wert f?r diese Variable zu bestimmen. Weitere
   Informationen finden Sie im Security Advisory FreeBSD-SA-07:01.jail.

   .. raw:: html

      </div>

#. Erstellen Sie die notwendigen Mountpunkte f?r die nur lesbaren
   Bereiche jeder Jail:

   .. code:: screen

       # mkdir /home/j/ns /home/j/mail /home/j/www

#. Installieren Sie die read/write-Vorlage in jede Jail. Benutzen Sie
   hierf?r
   `sysutils/cpdup <http://www.freebsd.org/cgi/url.cgi?ports/sysutils/cpdup/pkg-descr>`__,
   welches es erleichtert, eine korrekte Kopie jedes Verzeichnisses zu
   erstellen:

   .. code:: screen

       # mkdir /home/js
       # cpdup /home/j/skel /home/js/ns
       # cpdup /home/j/skel /home/js/mail
       # cpdup /home/j/skel /home/js/www

#. An dieser Stelle werden die Jails erstellt und f? den Betrieb
   vorbereitet. Zuerst mounten Sie die notwendigen Dateisysteme f?r jede
   Jail und starten diese dann mit dem Skript ``/etc/rc.d/jail``:

   .. code:: screen

       # mount -a
       # /etc/rc.d/jail start

.. raw:: html

   </div>

Die Jails sollten nun laufen. Um zu pr?fen, ob sie korrekt gestartet
wurden, verwenden Sie
`jls(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jls&sektion=8>`__.
Nach dem Aufruf dieses Befehls sollten Sie eine Ausgabe ?hnlich der
folgenden erhalten:

.. code:: screen

    # jls
       JID  IP Address      Hostname                      Path
         3  192.168.3.17    ns.example.org                /home/j/ns
         2  192.168.3.18    mail.example.org              /home/j/mail
         1  62.123.43.14    www.example.org               /home/j/www

An diesem Punkt sollte es m?glich sein, sich an jeder Jail anzumelden,
Benutzer anzulegen und Dienste zu konfigurieren. Die Spalte ``JID`` gibt
die Jail-Identifikationsnummer jeder laufenden Jail an. Nutzen Sie den
folgenden Befehl, um administrative Aufgaben in der Jail mit der ``JID``
3 durchzuf?hren:

.. code:: screen

    # jexec 3 tcsh

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

16.6.1.4. Jails aktualisieren
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Mit der Zeit wird es notwendig sein, das System auf eine neuere Version
von FreeBSD zu aktualisieren. Zum einen aus Sicherheitsgr?nden, zum
anderen, um neu eingef?hrte Funktionen nutzen zu k?nnen, die f?r die
bestehenden Jails sinnvoll sind. Das Design dieses Aufbaus bietet einen
einfachen Weg, bestehende Jails zu aktualisieren. Zudem reduziert es die
Downtime, da die Jails erst im allerletzten Schritt gestoppt werden
m?ssen. Au?erdem bietet es die M?glichkeit, zu ?lteren Versionen
zur?ckzukehren, falls irgendwelche Probleme auftreten.

.. raw:: html

   <div class="procedure">

#. Im ersten Schritt wird das Host-System aktualisiert. Anschlie?end
   wird eine tempor?re neue read-only Vorlage ``/home/j/mroot2``
   erstellt.

   .. code:: screen

       # mkdir /home/j/mroot2
       # cd /usr/src
       # make installworld DESTDIR=/home/j/mroot2
       # cd /home/j/mroot2
       # cpdup /usr/src usr/src
       # mkdir s

   Der ``installworld``-Durchlauf erzeugt einige unn?tige Verzeichnisse,
   die nun entfernt werden sollten:

   .. code:: screen

       # chflags -R 0 var
       # rm -R etc var root usr/local tmp

#. Erzeugen Sie neue symbolische Links f?r das Hauptdateisystem:

   .. code:: screen

       # ln -s s/etc etc
       # ln -s s/root root
       # ln -s s/home home
       # ln -s ../s/usr-local usr/local
       # ln -s ../s/usr-X11R6 usr/X11R6
       # ln -s s/tmp tmp
       # ln -s s/var var

#. Nun ist es an der Zeit, die Jails zu stoppen:

   .. code:: screen

       # /etc/rc.d/jail stop

#. Unmounten des originalen Dateisystems:

   .. code:: screen

       # umount /home/j/ns/s
       # umount /home/j/ns
       # umount /home/j/mail/s
       # umount /home/j/mail
       # umount /home/j/www/s
       # umount /home/j/www

   .. raw:: html

      <div class="note" xmlns="">

   Anmerkung:
   ~~~~~~~~~~

   Die read/write-Systeme sind an das read-only System angeh?ngt
   (``/s``), das daher zuerst ausgeh?ngt werden muss.

   .. raw:: html

      </div>

#. Verschieben Sie das alte read-only-Dateisystem und ersetzen Sie es
   durch das neue Dateisystem. Das alte Dateisystem kann so als Backup
   dienen, falls etwas schief geht. Die Namensgebung entspricht hier
   derjenigen bei der Erstellung eines neuen read-only-Dateisystems.
   Verschieben Sie die originale FreeBSD Ports-Sammlung in das neue
   Dateisystem, um Platz und Inodes zu sparen:

   .. code:: screen

       # cd /home/j
       # mv mroot mroot.20060601
       # mv mroot2 mroot
       # mv mroot.20060601/usr/ports mroot/usr

#. Nun ist die neue read-only-Vorlage fertig. Sie m?ssen daher nur noch
   die Dateisysteme erneut mounten und die Jails starten:

   .. code:: screen

       # mount -a
       # /etc/rc.d/jail start

.. raw:: html

   </div>

Nutzen Sie
`jls(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jls&sektion=8>`__ um
zu pr?fen, ob die Jails korrekt gestartet wurden. Vergessen Sie nicht,
innerhalb jeder Jail ``mergemaster`` laufen zu lassen. Die
Konfigurationsdateien m?ssen (ebenso wie die rc.d-Skripten) aktualisiert
werden.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------------+-------------------------------+-----------------------------------------------+
| `Zur?ck <jails-tuning.html>`__?            | `Nach oben <jails.html>`__    | ?\ `Weiter <mac.html>`__                      |
+--------------------------------------------+-------------------------------+-----------------------------------------------+
| 16.5. Feinabstimmung und Administration?   | `Zum Anfang <index.html>`__   | ?Kapitel 17. Verbindliche Zugriffskontrolle   |
+--------------------------------------------+-------------------------------+-----------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
