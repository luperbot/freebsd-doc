===============================
11.3. Mathematica? installieren
===============================

.. raw:: html

   <div class="navheader">

11.3. Mathematica? installieren
`Zur?ck <linuxemu-lbc-install.html>`__?
Kapitel 11. Linux-Bin?rkompatibilit?t
?\ `Weiter <linuxemu-maple.html>`__

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

11.3. Mathematica? installieren
-------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

F?r Mathematica 5.x aktualisiert von Boris Hollas.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dieses Dokument beschreibt die Installation der Linux-Version von
Mathematica? 5.x auf einem FreeBSD-System.

Die Linux-Version von Mathematica? oder Mathematica? f?r Studenten kann
direkt von Wolfram unter ``http://www.wolfram.com/`` bestellt werden.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

11.3.1. Den Mathematica?-Installer starten
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Zuerst m?ssen Sie FreeBSD mitteilen, dass die Linux-Bin?rversion von
Mathematica? die Linux-ABI verwendet. Dies erreichen Sie am einfachsten,
indem Sie die Standard-ELF-Kennzeichnung f?r alle ungekennzeichneten
Bin?rdateien auf Linux festlegen:

.. code:: screen

    # sysctl kern.fallback_elf_brand=3

Danach wird FreeBSD annehmen, dass alle ungekennzeichneten
ELF-Bin?rdateien die Linux-ABI verwenden und es w?re nun m?glich, das
Installationsprogramm direkt von der CD-ROM zu starten.

Unter FreeBSD m?ssen allerdings die Datei ``MathInstaller`` in ein
lokales Verzeichnis Ihrer Festplatte kopieren:

.. code:: screen

    # mount /cdrom
    # cp /cdrom/Unix/Installers/Linux/MathInstaller /LokalesVerzeichnis/

In dieser Datei ersetzen Sie in der ersten Zeile den Wert ``/bin/sh``
durch ``/compat/linux/bin/sh``. Dadurch wird sichergestellt, dass der
Installer von der Linux-Version von
`sh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sh&sektion=1>`__
aufgerufen wird. Danach ersetzen Sie durch das im n?chsten Abschnitt zu
findende Skript oder ?ber einen Texteditor alle Vorkommen von ``Linux)``
durch ``FreeBSD)``. Dadurch ist es dem Mathematica?-Installer m?glich,
durch den Einsatz von ``uname -s`` das Betriebssystem zu bestimmen.
FreeBSD wird dabei als Linux-artiges Betriebssystem behandelt. Durch den
Aufruf von ``MathInstaller`` kann Mathematica? anschlie?end installiert
werden.

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

11.3.2. Die Mathematica?-Programmdateien anpassen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das von Mathematica? w?hrend der Installation erzeugte Shell-Skript muss
angepasst werden, bevor Sie es einsetzen k?nnen. Wenn Sie die
Mathematica?-Programmdateien unter ``/usr/local/bin`` installieren,
finden Sie in diesem Verzeichnis die symbolische Links ``math``,
``mathematica``, ``Mathematica``, sowie ``MathKernel``. In jeder dieser
Dateien m?ssen Sie jedes Vorkommen von ``Linux)`` durch ``FreeBSD)``
ersetzen (entweder ?ber einen Texteditor oder durch das folgende
Shellskript):

.. code:: programlisting

    #!/bin/sh
    cd /usr/local/bin
    for i in math mathematica Mathematica MathKernel
      do sed 's/Linux)/FreeBSD)/g' $i > $i.tmp
      sed 's/\/bin\/sh/\/compat\/linux\/bin\/sh/g' $i.tmp > $i
      rm $i.tmp
      chmod a+x $i
    done

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

11.3.3. Ihr Mathematica?-Passwort anfordern
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn Sie Mathematica? das erste Mal starten, werden Sie nach einem
Passwort gefragt. Haben Sie noch kein Passwort von Wolfram erhalten,
m?ssen Sie zuerst im Installationsverzeichnis ``mathinfo`` aufrufen, um
Ihre „Rechner-ID“ zu bestimmen. Diese Rechner-ID basiert ausschlie?lich
auf der MAC-Adresse Ihrer ersten Netzwerkkarte. Daher ist es nicht
m?glich, Ihre Mathematica?-Kopie auf verschiedenen Rechnern zu
installieren.

Wenn Sie sich bei Wolfram registrieren (durch E-Mail, Telefon oder Fax),
teilen Sie Ihre „Rechner-ID“ mit und erhalten daf?r ein aus
Zahlengruppen bestehendes Passwort.

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

11.3.4. Das Mathematica?-Frontend ?ber ein Netzwerk ausf?hren
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Mathematica? verwendet einige spezielle Schriftarten, um Zeichen
anzuzeigen, die in den Standardzeichens?tzen nicht vorhanden sind (z.B.
Integrale, Summen, griechische Buchstaben). Das X-Protokoll verlangt
allerdings, dass diese Schriftarten *lokal* installiert sind. Das
bedeutet, dass Sie diese Schriftarten von der CD-ROM oder von einem
Rechner, auf dem Mathematica? installiert ist, auf Ihren Rechner
kopieren m?ssen. Diese Schriftarten befinden sich normalerweise in
``/cdrom/Unix/Files/SystemFiles/Fonts`` (Mathematica?-CD) oder in
``/usr/local/mathematica/SystemFiles/Fonts`` (Festplatte). Die aktuellen
Schriftarten befinden sich dabei in den Unterverzeichnissen ``Type1``
und ``X``. Um diese Schriftarten zu verwenden, gibt es mehrere
M?glichkeiten, die nun beschrieben werden:

Die erste M?glichkeit besteht darin, die Schriftarten in eins der
bereits existierenden Schriftartenverzeichnisse unter
``/usr/X11R6/lib/X11/fonts`` zu kopieren. Dies bedeutet, dass Sie
``fonts.dir`` editieren m?ssen, indem Sie die Schriftnamen hinzuf?gen
und die Anzahl der Schriftarten in der ersten Zeile ?ndern. Alternativ
ist es auch m?glich, im Verzeichnis, in das Sie die Schriftarten kopiert
haben, das Kommando
`mkfontdir(1) <http://www.FreeBSD.org/cgi/man.cgi?query=mkfontdir&sektion=1>`__
auszuf?hren.

Die zweite M?glichkeit, besteht darin, die Verzeichnisse nach
``/usr/X11R6/lib/X11/fonts`` zu kopieren:

.. code:: screen

    # cd /usr/X11R6/lib/X11/fonts
    # mkdir X
    # mkdir MathType1
    # cd /cdrom/Unix/Files/SystemFiles/Fonts
    # cp X/* /usr/X11R6/lib/X11/fonts/X
    # cp Type1/* /usr/X11R6/lib/X11/fonts/MathType1
    # cd /usr/X11R6/lib/X11/fonts/X
    # mkfontdir
    # cd ../MathType1
    # mkfontdir

Nun f?gen Sie die neuen Schriftartenverzeichnisse in Ihren Pfad ein:

.. code:: screen

    # xset fp+ /usr/X11R6/lib/X11/fonts/X
    # xset fp+ /usr/X11R6/lib/X11/fonts/MathType1
    # xset fp rehash

Wenn Sie den Xorg-Server verwenden, k?nnen Sie die
Schriftarten-Verzeichnisse automatisch laden lassen, wenn Sie sie in
Ihrer ``xorg.conf`` angeben.

Wenn Sie *noch kein* ``/usr/X11R6/lib/X11/fonts/Type1``-Verzeichnis
haben, k?nnen Sie das ``MathType1``-Verzeichnis im vorherigen Beispiel
in ``Type1`` umbenennen.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------------+---------------------------------+---------------------------------------+
| `Zur?ck <linuxemu-lbc-install.html>`__?   | `Nach oben <linuxemu.html>`__   | ?\ `Weiter <linuxemu-maple.html>`__   |
+-------------------------------------------+---------------------------------+---------------------------------------+
| 11.2. Installation?                       | `Zum Anfang <index.html>`__     | ?11.4. Maple™ installieren            |
+-------------------------------------------+---------------------------------+---------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
