==============================
Kapitel 10. Kernel-Fehlersuche
==============================

.. raw:: html

   <div class="navheader">

Kapitel 10. Kernel-Fehlersuche
`Zur?ck <kernelbuild-new.html>`__?
Teil?III.?Kernel
?\ `Weiter <kerneldebug-gdb.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="chapter">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

Kapitel 10. Kernel-Fehlersuche
------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Contributed by Paul Richards, J?rg Wunsch und Robert Watson.

.. raw:: html

   </div>

.. raw:: html

   <div>

?bersetzt von Fabian Ruch.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Inhaltsverzeichnis

.. raw:: html

   </div>

`10.1. Besorgen eines Speicherauszugs nach einem Kernel-Absturz
(Kernel-Crash-Dump) <kerneldebug.html#kerneldebug-obtain>`__
`10.2. Fehlersuche in einem Speicherauszug nach einem Kernel-Absturz mit
``kgdb`` <kerneldebug-gdb.html>`__
`10.3. Fehlersuche in einem Speicherauszug nach einem Absturz mit
DDD <kerneldebug-ddd.html>`__
`10.4. Online-Kernel-Fehlersuche mit
DDB <kerneldebug-online-ddb.html>`__
`10.5. Online-Kernel-Fehlersuche mit GDB auf einem entfernten
System <kerneldebug-online-gdb.html>`__
`10.6. Fehlersuche bei einem
Konsolen-Treiber <kerneldebug-console.html>`__
`10.7. Fehlersuche bei Deadlocks <kerneldebug-deadlocks.html>`__
`10.8. Glossar der Kernel-Optionen zur
Fehlersuche <kerneldebug-options.html>`__

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

10.1. Besorgen eines Speicherauszugs nach einem Kernel-Absturz (Kernel-Crash-Dump)
----------------------------------------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn ein Entwicklungs-Kernel (z.B. FreeBSD-CURRENT) wie zum Beispiel ein
Kernel unter Extrembedingungen (z.B. sehr hohe Belastungsraten (Load),
eine ?u?erst hohe Anzahl an gleichzeitigen Benutzern, Hunderte
`jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8>`__\ s
usw.) eingesetzt oder eine neue Funktion oder ein neuer Ger?tetreiber in
FreeBSD-STABLE verwendet wird (z.B. PAE), tritt manchmal eine
Kernel-Panic ein. In einem solchen Fall zeigt dieses Kapitel, wie dem
Absturz n?tzliche Informationen entnommen werden k?nnen.

Bei Kernel-Panics ist ein Neustart unvermeidlich. Nachdem ein System neu
gestartet wurde, ist der Inhalt des physikalischen Speichers (RAM),
genauso wie jedes Bit, das sich vor der Panic auf dem Swap-Ger?t befand,
verloren. Um die Bits im physikalischen Speicher zu erhalten, zieht der
Kernel Nutzen aus dem Swap-Ger?t als vor?bergehenden Ablageort, wo die
Bits, welche sich im RAM befinden, auch nach einem Neustart nach einem
Absturz verf?gbar sind. Durch diese Vorgehensweise kann ein
Kernel-Abbild, wenn FreeBSD nach einem Absturz startet, abgezogen und
mit der Fehlersuche begonnen werden.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Ein Swap-Ger?t, das als Ausgabeger?t (Dump-Device) konfiguriert wurde,
verh?lt sich immer noch wie ein Swap-Ger?t. Die Ausgabe auf
Nicht-Swap-Ger?te (wie zum Beispiel B?nder oder CDRWs) wird zur Zeit
nicht unterst?tzt. Ein „Swap-Ger?t“ ist gleichbedeutend mit einer
„Swap-Partition“.

.. raw:: html

   </div>

Es stehen verschiedene Arten von Speicherabz?gen zur Verf?gung:
komplette Speicherabz?ge (full memory dumps), welche den gesamten Inhalt
des physischen Speichers beinhalten, Miniausz?ge (minidumps), die nur
die gerade verwendeten Speicherseiten des Kernels enthalten (FreeBSD?6.2
und h?here Versionen) und Textausz?ge (textdumps), welche geskriptete
oder Debugger-Ausgaben enthalten (FreeBSD?7.1 und h?her). Miniausz?ge
sind der Standardtyp der Abz?ge seit FreeBSD?7.0 und fangen in den
meisten F?llen alle n?tigen Informationen ein, die in einem kompletten
Kernel-Speicherabzug enthalten sind, da die meisten Probleme nur durch
den Zustand des Kernels isoliert werden k?nnen.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

10.1.1. Konfigurieren des Ausgabeger?ts
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Bevor der Kernel den Inhalt seines physikalischen Speichers auf einem
Ausgabeger?t ablegt, muss ein solches konfiguriert werden. Ein
Ausgabeger?t wird durch Benutzen des
`dumpon(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dumpon&sektion=8>`__-Befehls
festgelegt, um dem Kernel mitzuteilen, wohin die Speicherausz?ge bei
einem Kernel-Absturz gesichert werden sollen. Das
`dumpon(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dumpon&sektion=8>`__-Programm
muss aufgerufen werden, nachdem die Swap-Partition mit
`swapon(8) <http://www.FreeBSD.org/cgi/man.cgi?query=swapon&sektion=8>`__
konfiguriert wurde. Dies wird normalerweise durch Setzen der
``dumpdev``-Variable in
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5>`__
auf den Pfad des Swap-Ger?ts (der empfohlene Weg, um einen
Kernel-Speicherauszug zu entnehmen) bewerkstelligt, oder ?ber ``AUTO``,
um die erste konfigurierte Swap-Partition zu verwenden. In HEAD ist die
Standardeinstellung f?r ``dumpdev`` ``AUTO`` und ?nderte sich in den
RELENG\_\*-Zweigen (mit Ausnahme von RELENG\_7, bei dem ``AUTO``
beibehalten wurde) auf ``NO``. In FreeBSD?9.0-RELEASE und sp?teren
Versionen fragt bsdinstall, ob Speicherausz?ge f?r das Zielsystem
w?hrend des Installationsvorgangs aktiviert werden sollen.

.. raw:: html

   <div class="tip" xmlns="">

Tipp:
~~~~~

Vergleichen Sie ``/etc/fstab`` oder
`swapinfo(8) <http://www.FreeBSD.org/cgi/man.cgi?query=swapinfo&sektion=8>`__
f?r eine Liste der Swap-Ger?te.

.. raw:: html

   </div>

.. raw:: html

   <div class="important" xmlns="">

Wichtig:
~~~~~~~~

Stellen Sie sicher, dass das in
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5>`__
festgelegte ``dumpdir`` vor einem Kernel-Absturz vorhanden ist.

.. code:: screen

    # mkdir /var/crash
    # chmod 700 /var/crash

Denken Sie auch daran, dass der Inhalt von ``/var/crash`` heikel ist und
sehr wahrscheinlich vertrauliche Informationen wie Passw?rter enth?lt.

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

10.1.2. Entnehmen eines Kernel-Speicherauszugs (Kernel-Dump)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Sobald ein Speicherauszug auf ein Ausgabeger?t geschrieben wurde, muss
er entnommen werden, bevor das Swap-Ger?t eingeh?ngt wird. Um einen
Speicherauszug aus einem Ausgabeger?t zu entnehmen, benutzen Sie das
`savecore(8) <http://www.FreeBSD.org/cgi/man.cgi?query=savecore&sektion=8>`__-Programm.
Falls ``dumpdev`` in
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5>`__
gesetzt wurde, wird
`savecore(8) <http://www.FreeBSD.org/cgi/man.cgi?query=savecore&sektion=8>`__
automatisch beim ersten Start in den Multiuser-Modus nach dem Absturz
und vor dem Einh?ngen des Swap-Ger?ts aufgerufen. Der Speicherort des
entnommenen Kernels ist im
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5>`__-Wert
``dumpdir``, standardm??ig ``/var/crash``, festgelegt und der Dateiname
wird ``vmcore.0`` sein.

In dem Fall, dass bereits eine Datei mit dem Namen ``vmcore.0`` in
``/var/crash`` (oder auf was auch immer ``dumpdir`` gesetzt ist)
vorhanden ist, erh?ht der Kernel die angeh?ngte Zahl bei jedem Absturz
um eins und verhindert damit, dass ein vorhandener ``vmcore`` (z.B.
``vmcore.1``) ?berschrieben wird. W?hrend der Fehlersuche, m?chten Sie
h?chst wahrscheinlich den ``vmcore`` mit der h?chsten Version in
``/var/crash`` benutzen, wenn Sie den passenden ``vmcore`` suchen.

.. raw:: html

   <div class="tip" xmlns="">

Tipp:
~~~~~

Falls Sie einen neuen Kernel testen, aber einen anderen starten m?ssen,
um Ihr System wieder in Gang zu bringen, starten Sie es nur in den
Singleuser-Modus, indem Sie das ``-s``-Flag an der
Boot-Eingabeaufforderung benutzen, und nehmen dann folgende Schritte
vor:

.. code:: screen

    # fsck -p
    # mount -a -t ufs       # make sure /var/crash is writable
    # savecore /var/crash /dev/ad0s1b
    # exit                  # exit to multi-user

Dies weist
`savecore(8) <http://www.FreeBSD.org/cgi/man.cgi?query=savecore&sektion=8>`__
an, einen Kernel-Speicherauszug aus ``/dev/ad0s1b`` zu entnehmen und den
Inhalt in ``/var/crash`` abzulegen. Vergessen Sie nicht sicherzustellen,
dass das Zielverzeichnis ``/var/crash`` genug freien Speicherplatz f?r
den Speicherauszug zur Verf?gung hat. Vergessen Sie auch nicht, den
korrekten Pfad des Swap-Ger?ts anzugeben, da es sehr wahrscheinlich
anders als ``/dev/ad0s1b`` lautet!

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------------------------+-------------------------------+-------------------------------------------------------------------------------------+
| `Zur?ck <kernelbuild-new.html>`__?                      | `Nach oben <kernel.html>`__   | ?\ `Weiter <kerneldebug-gdb.html>`__                                                |
+---------------------------------------------------------+-------------------------------+-------------------------------------------------------------------------------------+
| 9.2. Einen Kernel auf die „neue“ Art und Weise bauen?   | `Zum Anfang <index.html>`__   | ?10.2. Fehlersuche in einem Speicherauszug nach einem Kernel-Absturz mit ``kgdb``   |
+---------------------------------------------------------+-------------------------------+-------------------------------------------------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
