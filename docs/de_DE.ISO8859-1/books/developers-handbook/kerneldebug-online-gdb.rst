===================================================================
10.5. Online-Kernel-Fehlersuche mit GDB auf einem entfernten System
===================================================================

.. raw:: html

   <div class="navheader">

10.5. Online-Kernel-Fehlersuche mit GDB auf einem entfernten System
`Zur?ck <kerneldebug-online-ddb.html>`__?
Kapitel 10. Kernel-Fehlersuche
?\ `Weiter <kerneldebug-console.html>`__

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

10.5. Online-Kernel-Fehlersuche mit GDB auf einem entfernten System
-------------------------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Diese Funktion wird seit FreeBSD 2.2 unterst?tzt und ist wirklich sehr
geschickt.

GDB unterst?tzt *die Fehlersuche von einem entfernten System aus*
bereits einige Zeit. Dies geschieht unter Benutzung eines sehr einfachen
Protokolls ?ber eine serielle Verbindung. Anders als bei den anderen,
oben beschriebenen, Vorgehensweisen werden hier zwei Systeme ben?tigt.
Das eine ist das Hostsystem, welches die Umgebung zur Fehlersuche,
einschlie?lich aller Quellen und einer Kopie der Kernel-Bin?rdatei mit
allen Symbolen bereitstellt, und das andere das Zielsystem, welches
einfach nur eine Kopie desselben Kernels ausf?hrt (ohne die
Informationen zur Fehlersuche).

Sie sollten den Kernel im Zweifelsfall mit ``config       -g``
konfigurieren, ``DDB`` in die Konfiguration aufnehmen und den Kernel,
wie sonst auch, kompilieren. Dies ergibt, aufgrund der zus?tzlichen
Informationen zur Fehlersuche, eine umfangreiche Bin?rdatei. Kopieren
Sie diesen Kernel auf das Zielsystem, entfernen Sie die Symbole zur
Fehlersuche mit ``strip       -x`` und starten Sie ihn mit der
``-d``-Boot-Option. Stellen Sie die serielle Verbindung zwischen dem
Zielsystem, welches "flags 80" f?r dessen sio-Ger?t gesetzt hat, und dem
Hostsystem, welches die Fehlersuche ?bernimmt, her. Nun wechseln Sie auf
dem Hostsystem in das Bauverzeichnis des Ziel-Kernels und starten
``gdb``:

.. code:: screen

    % kgdb kernel
    GDB is free software and you are welcome to distribute copies of it
     under certain conditions; type "show copying" to see the conditions.
    There is absolutely no warranty for GDB; type "show warranty" for details.
    GDB 4.16 (i386-unknown-freebsd),
    Copyright 1996 Free Software Foundation, Inc...
    (kgdb) 

Stellen Sie die entfernte Sitzung zur Fehlersuche ein mit (angenommen,
der erste serielle Port ist in Verwendung):

.. code:: screen

    (kgdb) target remote /dev/cuaa0

Jetzt geben Sie auf dem Zielsystem, welches noch vor Beginn der
Ger?tesuche in DDB gelangt ist, ein:

.. code:: screen

    Debugger("Boot flags requested debugger")
    Stopped at Debugger+0x35: movb  $0, edata+0x51bc
    db> gdb

DDB antwortet dann mit:

.. code:: screen

    Next trap will enter GDB remote protocol mode

Jedesmal wenn Sie ``gdb`` eingeben, wird zwischen dem lokalen DDB und
entfernten GDB umgeschaltet. Um einen n?chsten Trap sofort zu erzwingen,
geben Sie einfach ``s`` (step) ein. Ihr GDB auf dem Hostsystem erh?lt
nun die Kontrolle ?ber den Ziel-Kernel:

.. code:: screen

    Remote debugging using /dev/cuaa0
    Debugger (msg=0xf01b0383 "Boot flags requested debugger")
        at ../../i386/i386/db_interface.c:257
    (kgdb)

Sie k?nnen mit dieser Sitzung wie mit jeder anderen GDB-Sitzung umgehen,
einschlie?lich vollem Zugriff auf die Quellen, Starten im gud-Modus
innerhalb eines Emacs-Fensters (was Ihnen automatische Quelltext-Ausgabe
in einem weiteren Emacs-Fenster bietet), usw.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------------+------------------------------------+-------------------------------------------------+
| `Zur?ck <kerneldebug-online-ddb.html>`__?   | `Nach oben <kerneldebug.html>`__   | ?\ `Weiter <kerneldebug-console.html>`__        |
+---------------------------------------------+------------------------------------+-------------------------------------------------+
| 10.4. Online-Kernel-Fehlersuche mit DDB?    | `Zum Anfang <index.html>`__        | ?10.6. Fehlersuche bei einem Konsolen-Treiber   |
+---------------------------------------------+------------------------------------+-------------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
