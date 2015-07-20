=======================================
6. Dateien mit Hilfe von DOS ausdrucken
=======================================

.. raw:: html

   <div class="navheader">

6. Dateien mit Hilfe von DOS ausdrucken
`Zur?ck <editing-text.html>`__?
?
?\ `Weiter <other-useful-commands.html>`__

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

6. Dateien mit Hilfe von DOS ausdrucken
---------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Bis zu diesem Zeitpunkt haben Sie wahrscheinlich noch keinen Drucker
eingerichtet, daher zeigen wir Ihnen, wie man eine Datei aus einer
Manualpage erzeugt, diese auf eine Diskette kopiert und dann unter DOS
ausdruckt. M?chten Sie etwa nachlesen, wie Sie Dateirechte ver?ndern
k?nnen (was sehr wichtig ist), rufen Sie mit ``man chmod`` die
entsprechende Manualpage auf. Der Befehl

.. raw:: html

   <div class="informalexample">

.. code:: screen

    % man chmod | col -b > chmod.txt

.. raw:: html

   </div>

entfernt alle Formatierungen und leitet die Ausgabe der Manualpage nach
``chmod.txt`` um, statt diese auf dem Bildschirm anzuzeigen. Legen Sie
danach eine DOS-formatierte Diskette in Ihr Diskettenlaufwerk ``a`` ein
und geben Sie ``su`` ein, um zu ``root`` zu werden. Tippen Sie nun

.. raw:: html

   <div class="informalexample">

.. code:: screen

    # /sbin/mount -t msdosfs /dev/fd0 /mnt

.. raw:: html

   </div>

ein, um das Diskettenlaufwerk unter ``/mnt`` einzuh?ngen.

Da Sie ab nun keine ``root``-Rechte mehr ben?tigen, werden Sie durch die
Eingabe von ``exit`` wieder zu ``jack`` und wechseln dann in das
Verzeichnis, in dem sich ``chmod.txt`` befindet, und kopieren diese
Datei mit

.. raw:: html

   <div class="informalexample">

.. code:: screen

    % cp chmod.txt /mnt

.. raw:: html

   </div>

auf Ihre Diskette. Zeigen Sie mit ``ls /mnt`` den Inhalt von ``/mnt``
an. Als Ergebnis sollten Sie ``chmod.txt`` erhalten.

Leiten Sie nun die Ausgabe von ``/sbin/dmesg`` in eine Datei um, indem
Sie

.. raw:: html

   <div class="informalexample">

.. code:: screen

    % /sbin/dmesg > dmesg.txt

.. raw:: html

   </div>

eingeben und diese Datei ebenfalls auf die Diskette kopieren. Mit
``/sbin/dmesg`` k?nnen Sie alle w?hrend des Systemstarts angezeigten
Meldungen ausgeben. Es ist wichtig, dass Sie diese Meldungen verstehen,
da hier angezeigt wird, welche Hardware von FreeBSD beim Systemstart
gefunden wurde. Falls Sie Fragen auf der Mailingliste 'Fragen und
Antworten zu FreeBSD' ``<de-bsd-questions@de.FreeBSD.org>`` oder im
USENET stellen (etwa „FreeBSD erkennt mein Bandlaufwerk nicht, was soll
ich tun?“), wird man Sie fragen, was ``dmesg`` ausgibt.

Anschlie?end k?nnen Sie das Diskettenlaufwerk wieder aus dem
Verzeichnisbaum aush?ngen (unmounten), um die Diskette zu entfernen.
Dies funktioniert nat?rlich nur als ``root``:

.. raw:: html

   <div class="informalexample">

.. code:: screen

    # /sbin/umount /mnt

.. raw:: html

   </div>

Danach starten Sie DOS (Windows?). Kopieren Sie die Dateien in ein
Verzeichnis. Nun ?ffnen Sie die Dateien mit DOS EDIT, Windows? Notepad,
Wordpad oder einem anderen Schreibprogramm, speichern die Datei, falls
Sie kleinere ?nderungen vornehmen wollen, und drucken die Datei unter
DOS oder Windows aus. Manualpages werden unter DOS am besten mit
``print`` ausgedruckt.

Um Ihren Drucker unter FreeBSD einzurichten, muss ein entsprechender
Eintrag in ``/etc/printcap`` und ein Spool-Verzeichnis unter
``/var/spool/output`` angelegt werden. Falls der Drucker an lpt0
(entspricht LPT1 unter DOS) angeschlossen ist, m?ssen Sie wahrscheinlich
nur nach ``/var/spool/output`` wechseln und (als ``root``) das
Verzeichnis ``lpd`` mit ``mkdir lpd`` anlegen, falls es nicht schon
vorhanden ist. Danach sollte sich der Drucker, wenn er eingeschaltet
ist, beim Booten melden und ``lp`` oder ``lpr`` sollte eine Datei zum
Drucker schicken und ausdrucken. Ob die Datei schlie?lich ausgedruckt
wird, h?ngt von der Konfiguration des Druckers ab, die im `FreeBSD
Handbuch <../../../../doc/de_DE.ISO8859-1/books/handbook/index.html>`__
ausf?hrlich beschrieben ist.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------+-------------------------------+----------------------------------------------+
| `Zur?ck <editing-text.html>`__?   | ?                             | ?\ `Weiter <other-useful-commands.html>`__   |
+-----------------------------------+-------------------------------+----------------------------------------------+
| 5. Textdateien bearbeiten?        | `Zum Anfang <index.html>`__   | ?7. Weitere n?tzliche Befehle                |
+-----------------------------------+-------------------------------+----------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
