============================================
4.6. Anh?ngen und Abh?ngen von Dateisystemen
============================================

.. raw:: html

   <div class="navheader">

4.6. Anh?ngen und Abh?ngen von Dateisystemen
`Zur?ck <disk-organization.html>`__?
Kapitel 4. Grundlagen des UNIX Betriebssystems
?\ `Weiter <basics-processes.html>`__

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

4.6. Anh?ngen und Abh?ngen von Dateisystemen
--------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Ein Dateisystem wird am besten als ein Baum mit der Wurzel ``/``
veranschaulicht. ``/dev``, ``/usr``, und die anderen Verzeichnisse im
Rootverzeichnis sind Zweige, die wiederum eigene Zweige wie
``/usr/local`` haben k?nnen.

Es gibt verschiedene Gr?nde, bestimmte dieser Verzeichnisse auf eigenen
Dateisystemen anzulegen. ``/var`` enth?lt ``log/``, ``spool/`` sowie
verschiedene andere tempor?re Dateien und kann sich daher schnell
f?llen. Es empfiehlt sich, ``/var`` von ``/`` zu trennen, da es schlecht
ist, wenn das Root-Dateisystem voll l?uft.

Ein weiterer Grund bestimmte Verzeichnisb?ume auf andere Dateisysteme zu
legen, ist gegeben, wenn sich die Verzeichnisb?ume auf gesonderten
physikalischen oder virtuellen Platten, wie `Network File
System <network-nfs.html>`__ oder CD-ROM-Laufwerken, befinden.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.6.1. Die ``fstab`` Datei
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

W?hrend des `Boot-Prozesses <boot.html>`__ werden in ``/etc/fstab``
aufgef?hrte Verzeichnisse, sofern sie nicht mit der Option ``noauto``
versehen sind, automatisch angehangen.

Die Zeilen in ``/etc/fstab`` haben das folgende Format:

.. code:: programlisting

    device    /mount-point  fstype    options   dumpfreq  passno

.. raw:: html

   <div class="variablelist">

``device``
    Ein existierender Ger?tename wie in `Abschnitt?19.2,
    „Ger?tenamen“ <disks-naming.html>`__ beschrieben.

``mount-point``
    Ein existierendes Verzeichnis, an das das Dateisystem angehangen
    wird.

``fstype``
    Der Typ des Dateisystems, der an
    `mount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount&sektion=8>`__
    weitergegeben wird. FreeBSDs Standarddateisystem ist ``ufs``.

``options``
    Entweder ``rw`` f?r beschreibbare Dateisysteme oder ``ro`` f?r
    schreibgesch?tzte Dateisysteme, gefolgt von weiteren ben?tigten
    Optionen. Eine h?ufig verwendete Option ist ``noauto`` f?r
    Dateisysteme, die w?hrend der normalen Bootsequenz nicht angehangen
    werden sollen. Weitere Optionen finden sich in
    `mount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount&sektion=8>`__.

``dumpfreq``
    Gibt die Anzahl der Tage an, nachdem das Dateisystem gesichert
    werden soll. Fehlt der Wert, wird ``0`` angenommen.

``passno``
    Bestimmt die Reihenfolge, in der die Dateisysteme ?berpr?ft werden
    sollen. F?r Dateisysteme, die ?bersprungen werden sollen, ist
    ``passno`` auf null zu setzen. F?r das Root-Dateisystem, das vor
    allen anderen ?berpr?ft werden muss, sollte der Wert von ``passno``
    eins betragen. Allen anderen Dateisystemen sollten Werte gr??er eins
    zugewiesen werden. Wenn mehrere Dateisysteme den gleichen Wert
    besitzen, wird
    `fsck(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck&sektion=8>`__
    versuchen, diese parallel zu ?berpr?fen.

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

4.6.2. Das ``mount`` Kommando
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

`mount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount&sektion=8>`__
h?ngt schlie?lich Dateisysteme an.

In der grundlegenden Form wird es wie folgt benutzt:

.. raw:: html

   <div class="informalexample">

.. code:: screen

    # mount device mountpoint

.. raw:: html

   </div>

Viele Optionen werden in
`mount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount&sektion=8>`__
beschrieben, die am h?ufigsten verwendeten sind:

.. raw:: html

   <div class="variablelist">

.. raw:: html

   <div class="variablelist-title">

Optionen von ``mount``

.. raw:: html

   </div>

``-a``
    H?ngt alle Dateisysteme aus ``/etc/fstab`` an. Davon ausgenommen
    sind Dateisysteme, die mit „noauto“ markiert sind, die mit der
    Option ``-t`` ausgeschlossen wurden und Dateisysteme, die schon
    angehangen sind.

``-d``
    F?hrt alles bis auf den ``mount``-Systemaufruf aus. N?tzlich ist
    diese Option in Verbindung mit ``-v``. Damit wird angezeigt, was
    `mount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount&sektion=8>`__
    tats?chlich versuchen w?rde, um das Dateisystem anzuh?ngen.

``-f``
    Erzwingt das Anh?ngen eines unsauberen Dateisystems oder erzwingt
    die R?cknahme des Schreibzugriffs, wenn der Status des Dateisystems
    von beschreibbar auf schreibgesch?tzt ge?ndert wird.

``-r``
    H?ngt das Dateisystem schreibgesch?tzt ein. Das kann auch durch
    Angabe von ``ro`` als Argument der Option ``-o`` erreicht werden.

``-t`` *``fstype``*
    H?ngt das Dateisystem mit dem angegebenen Typ an, oder h?ngt nur
    Dateisysteme mit dem angegebenen Typ an, wenn auch ``-a`` angegeben
    wurde.

    Die Voreinstellung f?r den Typ des Dateisystems ist „ufs“.

``-u``
    Aktualisiert die Mountoptionen des Dateisystems.

``-v``
    Geschw?tzig sein.

``-w``
    H?ngt das Dateisystem beschreibbar an.

.. raw:: html

   </div>

``-o`` erwartet eine durch Kommata separierte Liste von Optionen, unter
anderem die folgenden:

.. raw:: html

   <div class="variablelist">

noexec
    Verbietet das Ausf?hren von bin?ren Dateien auf dem Dateisystem.
    Dies ist eine n?tzliche Sicherheitsfunktion.

nosuid
    SetUID und SetGID Bits werden auf dem Dateisystem nicht beachtet.
    Dies ist eine n?tzliche Sicherheitsfunktion.

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

4.6.3. Das ``umount`` Kommando
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

`umount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=umount&sektion=8>`__
akzeptiert als Parameter entweder einen Mountpoint, einen Ger?tenamen,
oder die Optionen ``-a`` oder ``-A``.

Jede Form akzeptiert ``-f``, um das Abh?ngen zu erzwingen, und ``-v``,
um etwas geschw?tziger zu sein. Seien Sie bitte vorsichtig mit ``-f``:
Ihr Computer kann abst?rzen oder es k?nnen Daten auf dem Dateisystem
besch?digt werden, wenn Sie das Abh?ngen erzwingen.

``-a`` und ``-A`` werden benutzt um alle Dateisysteme, deren Typ durch
``-t`` modifiziert werden kann, abzuh?ngen. ``-A`` h?ngt das
Rootdateisystem nicht ab.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------------+-------------------------------+-----------------------------------------+
| `Zur?ck <disk-organization.html>`__?        | `Nach oben <basics.html>`__   | ?\ `Weiter <basics-processes.html>`__   |
+---------------------------------------------+-------------------------------+-----------------------------------------+
| 4.5. Festplatten, Slices und Partitionen?   | `Zum Anfang <index.html>`__   | ?4.7. Prozesse                          |
+---------------------------------------------+-------------------------------+-----------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
