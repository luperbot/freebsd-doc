=========================================================
9.5. Erstellen und Installation eines angepassten Kernels
=========================================================

.. raw:: html

   <div class="navheader">

9.5. Erstellen und Installation eines angepassten Kernels
`Zur?ck <kernelconfig-modules.html>`__?
Kapitel 9. Konfiguration des FreeBSD-Kernels
?\ `Weiter <kernelconfig-config.html>`__

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

9.5. Erstellen und Installation eines angepassten Kernels
---------------------------------------------------------

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

Sie ben?tigen den kompletten Quellcodebaum, um den Kernel zu bauen.

.. raw:: html

   </div>

Zuerst erl?utern wir die Verzeichnisstruktur, in der der Kernel gebaut
wird. Die im Folgenden genannten Verzeichnisse sind relativ zum
Verzeichnis ``/usr/src/sys`` angegeben, das Sie auch ?ber den Pfad
``/sys`` erreichen k?nnen. Es existieren mehrere Unterverzeichnisse, die
bestimmte Teile des Kernels darstellen, aber die f?r uns wichtigsten
sind ``arch/conf``, in dem Sie die Konfigurationsdatei f?r den
angepassten Kernel erstellen werden, und ``compile``, in dem der Kernel
gebaut wird. *``arch``* kann entweder ``i386``, ``amd64``, ``ia64``,
``powerpc``, ``sparc64`` oder ``pc98`` (eine in Japan beliebte
Architektur) sein. Alles in diesen Verzeichnissen ist nur f?r die
jeweilige Architektur relevant. Der Rest des Codes ist
maschinenunabh?ngig und f?r alle Plattformen, auf die FreeBSD portiert
werden kann, gleich. Beachten Sie die Verzeichnisstruktur, die jedem
unterst?tzten Ger?t, jedem Dateisystem und jeder Option ein eigenes
Verzeichnis zuordnet.

Die Beispiele in diesem Kapitel verwenden ein i386-System. Wenn Sie ein
anderes System benutzen, passen Sie bitte die Pfade entsprechend der
Architektur des Systems an.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Falls Sie kein ``/usr/src/``-Verzeichnis vorfinden (oder dieses leer
ist), so sind die Quellen nicht installiert. Der einfachste Weg, dies
nachzuholen, ist die Verwendung von
`csup(1) <http://www.FreeBSD.org/cgi/man.cgi?query=csup&sektion=1>`__,
wie in `Abschnitt?26.6, „Synchronisation der Quellen“ <synching.html>`__
beschrieben ist. Falls nicht vorhanden, sollten Sie auch noch einen
symbolischen Link auf ``/usr/src/sys/`` anlegen:

.. code:: screen

    # ln -s /usr/src/sys /sys

.. raw:: html

   </div>

Als n?chstes wechseln sie in das Verzeichnis ``arch/conf`` und kopieren
die Konfigurationsdatei ``GENERIC`` in eine Datei, die den Namen Ihres
Kernels tr?gt. Zum Beispiel:

.. code:: screen

    # cd /usr/src/sys/i386/conf
    # cp GENERIC MYKERNEL

Traditionell ist der Name des Kernels immer in Gro?buchstaben. Wenn Sie
mehrere FreeBSD mit unterschiedlicher Hardware warten, ist es n?tzlich,
wenn Sie Konfigurationsdatei nach dem Hostnamen der Maschinen benennen.
Im Beispiel verwenden wir den Namen ``MYKERNEL``.

.. raw:: html

   <div class="tip" xmlns="">

Tipp:
~~~~~

Es ist nicht zu empfehlen die Konfigurationsdatei direkt unterhalb von
``/usr/src`` abzuspeichern. Wenn Sie Probleme haben, k?nnten Sie der
Versuchung erliegen, ``/usr/src`` einfach zu l?schen und wieder von
vorne anzufangen. Wenn Sie so vorgehen, werden Sie kurz darauf merken,
dass Sie soeben Ihre Kernelkonfigurationsdatei gel?scht haben.

Editieren Sie immer eine Kopie von ``GENERIC``. ?nderungen an
``GENERIC`` k?nnen verloren gehen, wenn der `Quellbaum
aktualisiert <updating-upgrading.html>`__ wird.

Sie sollten die Konfigurationsdatei an anderer Stelle aufheben und im
Verzeichnis ``i386`` einen Link auf die Datei erstellen.

Beispiel:

.. code:: screen

    # cd /usr/src/sys/i386/conf
    # mkdir /root/kernels
    # cp GENERIC /root/kernels/MYKERNEL
    # ln -s /root/kernels/MYKERNEL

.. raw:: html

   </div>

Jetzt editieren Sie ``MYKERNEL`` mit einem Texteditor Ihres Vertrauens.
Wenn Sie gerade neu anfangen, ist Ihnen vielleicht nur der vi Editor
bekannt, der allerdings zu komplex ist, um hier erkl?rt zu werden. Er
wird aber in vielen B?chern aus der
`Bibliographie <bibliography.html>`__ gut erkl?rt. FreeBSD bietet aber
auch einen leichter zu benutzenden Editor, den ee an, den Sie, wenn Sie
Anf?nger sind, benutzen sollten. Sie k?nnen die Kommentare am Anfang der
Konfigurationsdatei ?ndern, um die ?nderungen gegen?ber ``GENERIC`` zu
dokumentieren.

Falls Sie schon einmal einen Kernel unter SunOS™ oder einem anderen BSD
kompiliert haben, werden Sie diese Konfigurationsdatei bereits kennen.
Wenn Sie mit einem anderen Betriebssystem wie DOS vertraut sind, k?nnte
die ``GENERIC`` Konfigurationsdatei Sie verschrecken. In diesen Fall
sollten Sie den Beschreibungen im Abschnitt ?ber die
`Konfigurationsdatei <kernelconfig-config.html>`__ langsam und
vorsichtig folgen.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Wenn Sie die `FreeBSD Quellen
synchronisieren <updating-upgrading.html>`__, sollten Sie immer, bevor
Sie etwas ver?ndern, ``/usr/src/UPDATING`` durchlesen. Diese Datei
enth?lt alle wichtigen Informationen, die Sie beim Aktualisieren
beachten m?ssen. Da ``/usr/src/UPDATING`` immer zu Ihrer Version der
FreeBSD Quellen passt, sind die Informationen dort genauer, als in
diesem Handbuch.

.. raw:: html

   </div>

Nun m?ssen Sie die Kernelquellen kompilieren.

.. raw:: html

   <div class="procedure">

.. raw:: html

   <div class="procedure-title">

Prozedur 9.1. Den Kernel bauen

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Sie ben?tigen den kompletten Quellcodebaum, um den Kernel zu bauen.

.. raw:: html

   </div>

#. Wechseln Sie in das Verzeichnis ``/usr/src``:

   .. code:: screen

       # cd /usr/src

#. Kompilieren Sie den neuen Kernel:

   .. code:: screen

       # make buildkernel KERNCONF=MYKERNEL

#. Installieren Sie den neuen Kernel:

   .. code:: screen

       # make installkernel KERNCONF=MYKERNEL

.. raw:: html

   </div>

.. raw:: html

   <div class="tip" xmlns="">

Tipp:
~~~~~

In der Voreinstellung werden beim Bau eines angepassten Kernels stets
*alle* Kernelmodule neu gebaut. Wollen Sie Ihren Kernel schneller bauen
oder nur bestimmte Module bauen, sollten Sie ``/etc/make.conf``
anpassen, bevor Sie Ihren Kernel bauen:

.. code:: programlisting

    MODULES_OVERRIDE = linux acpi sound/sound sound/driver/ds1 ntfs

Wenn Sie diese Variable setzen, werden ausschlie?lich die hier
angegebenen Module gebaut (und keine anderen).

.. code:: programlisting

    WITHOUT_MODULES = linux acpi sound ntfs

Durch das Setzen dieser Variable werden werden alle Module auf oberster
Ebene bis auf die angegebenen gebaut. Weitere Variablen, die beim Bau
eines Kernels von Interesse sein k?nnten, finden Sie in
`make.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=make.conf&sektion=5>`__.

.. raw:: html

   </div>

Der neue Kernel wird im Verzeichnis ``/boot/kernel``, genauer unter
``/boot/kernel/kernel`` abgelegt, w?hrend der alte Kernel nach
``/boot/kernel.old/kernel`` verschoben wird. Um den neuen Kernel zu
benutzen, sollten Sie Ihren Rechner jetzt neu starten. Falls etwas
schief geht, sehen Sie bitte in dem Abschnitt zur
`Fehlersuche <kernelconfig-trouble.html>`__ am Ende dieses Kapitels
nach. Dort sollten Sie auch unbedingt den Abschnitt lesen, der erkl?rt,
was zu tun ist, `wenn der neue Kernel nicht
startet <kernelconfig-trouble.html#kernelconfig-noboot>`__.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Im Verzeichnis ``/boot`` werden andere Dateien, die zum Systemstart
ben?tigt werden, wie der Boot-Loader
(`loader(8) <http://www.FreeBSD.org/cgi/man.cgi?query=loader&sektion=8>`__)
und dessen Konfiguration, abgelegt. Module von Fremdherstellern oder
angepasste Module werden in ``/boot/kernel`` abgelegt. Beachten Sie
bitte, dass diese Module immer zu dem verwendeten Kernel passen m?ssen.
Module, die nicht zu dem verwendeten Kernel passen, gef?hrden die
Stabilit?t des Systems.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------------+-------------------------------------+--------------------------------------------+
| `Zur?ck <kernelconfig-modules.html>`__?      | `Nach oben <kernelconfig.html>`__   | ?\ `Weiter <kernelconfig-config.html>`__   |
+----------------------------------------------+-------------------------------------+--------------------------------------------+
| 9.4. Kerneltreiber, Subsysteme und Module?   | `Zum Anfang <index.html>`__         | ?9.6. Die Kernelkonfigurationsdatei        |
+----------------------------------------------+-------------------------------------+--------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
