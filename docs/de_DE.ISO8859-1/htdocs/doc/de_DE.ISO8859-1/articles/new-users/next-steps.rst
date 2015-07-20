========================
8. Die n?chsten Schritte
========================

.. raw:: html

   <div class="navheader">

8. Die n?chsten Schritte
`Zur?ck <other-useful-commands.html>`__?
?
?\ `Weiter <your-working-environment.html>`__

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

8. Die n?chsten Schritte
------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Sie sollten nun alle wichtigen Werkzeuge kennen, um sich auf Ihrem
System zurechtzufinden, Dateien zu editieren und alles am Laufen zu
halten. Viele n?tzliche Informationen finden sich im FreeBSD-Handbuch
(das vielleicht schon auf Ihrer Festplatte ist) und auf der `FreeBSD
Webseite <http://www.FreeBSD.org/index.html>`__. Viele Softwarepakte und
Ports sind sowohl auf der FreeBSD-CD-ROM als auch auf der Webseite
verf?gbar. Im Handbuch finden Sie Hinweise, wie Sie mit diesen arbeiten
k?nnen. Pakete installieren Sie mit
``pkg_add /cdrom/packages/All/Paketname``, wobei *``Paketname``* f?r den
Dateinamen des Paketes steht. Auf der CD-ROM finden Sie auch eine Liste
der Pakete und Ports inklusive einer kurzen Beschreibung. Lesen Sie dazu
``cdrom/packages/index``, ``cdrom/packages/index.txt`` sowie
``cdrom/ports/index``. Eine ausf?hrliche Beschreibung den jeweiligen
Ports finden Sie in ``/cdrom/ports/*/*/pkg-descr``, wobei die
``*``-Zeichen f?r die Kategorie und das Unterverzeichnis des jeweiligen
Programms stehen.

Falls Ihnen die Beschreibung zur Installation von Ports von der CD-ROM
im Handbuch zu kompliziert erscheint (mit Programmen wie ``lndir`` und
anderen), finden Sie hier eine alternative Beschreibung, die in der
Regel problemlos funktioniert:

Suchen Sie zuerst den Port, den Sie installieren m?chten, etwa
``kermit``. Auf der CD-ROM sollte daf?r ein entsprechendes Verzeichnis
vorhanden sein. Kopieren Sie dieses Unterverzeichnis nach ``/usr/local``
(ein guter Platz f?r Programme, die hinzugef?gt werden und allen
Benutzern zug?nglich sein sollen):

.. raw:: html

   <div class="informalexample">

.. code:: screen

    # cp -R /cdrom/ports/comm/kermit /usr/local

.. raw:: html

   </div>

Danach wird das Verzeichnis ``/usr/local/kermit`` angelegt, in dem sich
alle Dateien des Unterverzeichnisses ``kermit`` der CD-ROM finden.

Danach legen Sie mit ``mkdir`` das Verzeichnis ``/usr/ports/distfiles``
an, falls dieses noch nicht existiert. Suchen Sie dann in
``/cdrom/ports/distfiles`` nach der Datei, die dem Namen des Ports
gleicht, den Sie installieren m?chten. Kopieren Sie diese Datei nach
``/usr/ports/distfiles``. Unter neueren Versionen k?nnen Sie diesen
Schritt ?berspringen, da FreeBSD dies automatisch erledigt.

Wechseln Sie nun mit ``cd`` nach ``/usr/local/kermit``. In diesem
Verzeichnis befindet sich bereits ein ``Makefile``. Geben Sie hier
Folgendes ein:

.. raw:: html

   <div class="informalexample">

.. code:: screen

    # make all install

.. raw:: html

   </div>

W?hrend der Installation wird sich der Port alle gepackten Dateien via
FTP holen, die zur Installation ben?tigt werden, aber nicht auf der
CD-ROM oder unter ``/usr/ports/distfiles`` vorhanden sind. Falls Sie
noch keine Internetverbindung haben und die ben?tigten Dateien nicht in
``/cdrom/ports/distfiles`` vorhanden sind, m?ssen Sie sich die Dateien
?ber einem anderen Rechner besorgen und manuell nach
``/usr/ports/distfiles`` kopieren (entweder ?ber eine Diskette oder
durch das Einh?ngen einer DOS-Partition. Sehen Sie im ``Makefile`` (mit
``cat``, ``more`` oder ``view``) nach, wo die Dateien zu finden sind
(meist auf der Hauptseite des Programms) und besorgen Sie sich die
Datei. Laden Sie die Datei unter DOS herunter, wird der Dateiname
m?glicherweise gek?rzt. In diesem Fall m?ssen Sie, nachdem die Datei
nach ``/usr/ports/distfiles`` kopiert wurde, den urspr?nglichen Namen
mit ``mv`` wiederherstellen, damit die Datei von der
Installationsroutine gefunden werden kann. Laden Sie die Datei mit FTP
herunter, m?ssen Sie den Bin?r-Modus verwenden. Nun wechseln Sie zur?ck
nach ``/usr/local/kermit`` (hier befindet sich ja das zur Installation
n?tige ``Makefile``) und installieren das Programm mit
``make all install``.

Beim Installieren von Ports oder Paketen kann es auch passieren, dass
andere Programme ben?tigt werden. Falls die Installation beispielsweise
mit can't find unzip oder einer ?hnlichen Meldung abbricht, m?ssen Sie
zuerst das unzip-Paket oder den entsprechende Port installieren, bevor
Sie mit der Installation fortfahren k?nnen.

Ist die Installation abgeschlossen, geben Sie ``rehash`` ein, damit
FreeBSD den Pfad neu einliest und wei?, wo welche Programme zu finden
sind. (Falls beim Ausf?hren von ``whereis`` oder ``which`` viele
Fehlermeldungen wie path not found auftreten, m?ssen Sie die
Pfad-Anweisungen in Ihrer ``.cshrc`` im Heimatverzeichnis erweitern. Die
Pfad-Anweisung tut unter UNIX? dasselbe wie unter DOS. Das aktuelle
Verzeichnis ist allerdings aus Sicherheitsgr?nden nicht im
voreingestellten Ausf?hrungspfad enthalten. Befindet sich die
auszuf?hrende Datei im aktuellen Verzeichnis, muss ``./`` vor dem Befehl
eingegeben werden, (wobei nach dem Slash kein Leerzeichen stehen darf),
damit die Datei ausgef?hrt wird.)

Vielleicht m?chten Sie auch die neueste Version des Netscape?-Browsers
(zu finden auf der `FTP-Seite <ftp://ftp.netscape.com/>`__ von
Netscape?) installieren, von der es auch eine FreeBSD-Version gibt. Dazu
m?ssen Sie allerdings das X Window-System installiert haben. Nach dem
Herunterladen verwenden Sie ``gunzip dateiname`` und
``tar xvf dateiname``, um die Datei zu entpacken. Danach kopieren Sie
die Bin?rdatei nach ``/usr/local/bin`` oder ein anderes Verzeichnis
Ihres Pfades, und geben abschlie?end ``rehash`` ein. F?gen Sie dann in
``/etc/csh.cshrc``, der systemweiten Konfigurationsdatei von ``csh``,
folgende Zeilen ein:

.. raw:: html

   <div class="informalexample">

.. code:: programlisting

    setenv XKEYSYMDB /usr/X11R6/lib/X11/XKeysymDB
    setenv XNLSPATH /usr/X11R6/lib/X11/nls

.. raw:: html

   </div>

Dabei wird davon ausgegangen, dass ``XKeysymDB`` und das Verzeichnis
``nls`` sich unter ``/usr/X11R6/lib/X11`` befinden. Ist dies auf Ihrem
System nicht der Fall, m?ssen Sie diese finden und dorthin kopieren.

Falls Sie Netscape? schon als Port von der CD-ROM oder ?ber FTP
installiert haben, achten Sie unbedingt darauf, nicht versehentlich
``/usr/local/bin/netscape`` durch die neue Bin?rdatei zu ersetzen, da es
sich bei dieser Datei nur um ein Shell-Skript handelt, das die
Umgebungsvariablen f?r Sie setzt. Nennen Sie die neue Bin?rdatei
stattdessen besser ``netscape.bin`` und ersetzen Sie die alte Version
``/usr/local/netscape/netscape``.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------------+-------------------------------+-------------------------------------------------+
| `Zur?ck <other-useful-commands.html>`__?   | ?                             | ?\ `Weiter <your-working-environment.html>`__   |
+--------------------------------------------+-------------------------------+-------------------------------------------------+
| 7. Weitere n?tzliche Befehle?              | `Zum Anfang <index.html>`__   | ?9. Die Arbeitsumgebung                         |
+--------------------------------------------+-------------------------------+-------------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
