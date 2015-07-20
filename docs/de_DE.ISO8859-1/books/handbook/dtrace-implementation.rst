=========================================
27.2. Unterschiede in der Implementierung
=========================================

.. raw:: html

   <div class="navheader">

27.2. Unterschiede in der Implementierung
`Zur?ck <dtrace.html>`__?
Kapitel 27. DTrace
?\ `Weiter <dtrace-enable.html>`__

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

27.2. Unterschiede in der Implementierung
-----------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Obwohl DTrace in FreeBSD sehr ?hnlich zu dem in Solaris™ ist, existieren
doch Unterschiede. Der Hauptunterschied besteht darin, dass in FreeBSD
DTrace als eine Menge von Kernelmodulen implementiert ist und DTrace
nicht verwendet werden kann, bis diese Module geladen wurden. Um alle
n?tigen Module zu laden, geben Sie ein:

.. code:: screen

    # kldload dtraceall

Beginnend mit FreeBSD 10.0-RELEASE werden die Module automatisch
geladen, sobald ``dtrace`` aufgerufen wird.

FreeBSD verwendet die Kerneloption ``DDB_CTF``, um die Unterst?tzung im
Kernel f?r das Laden von CTF-Daten aus Kernelmodulen und dem Kernel
selbst zu erm?glichen. CTF ist das Compact C Type Format von Solaris™,
welches eine reduzierte Form von Debug-Informationen kapselt, ?hnlich zu
DWARF und den antiken Stabs. Diese CTF-Daten werden dem Bin?rcode von
den ``ctfconvert`` und ``ctfmerge`` Befehlen den Werkzeugen zum Bauen
des Systems hinzugef?gt. Das ``ctfconvert``-Dienstprogramm parst die vom
Compiler erstellten DWARF ELF Debug-Abschnitte und ``ctfmerge`` vereint
CTF ELF-Abschnitte aus Objekten, entweder in ausf?hrbare Dateien oder
Shared-Libraries.

Einige Provider in FreeBSD unterscheiden sich von der
Solaris™-Implementierung. Am deutlichsten wird das beim
``dtmalloc``-Provider, welcher das Aufzeichnen von ``malloc()`` nach
Typen im FreeBSD-Kernel erm?glicht. Manche der Provider in Solaris™ wie
``cpc`` und ``mib`` sind in FreeBSD nicht vorhanden. Diese k?nnen in
zuk?nftigen FreeBSD-Versionen auftauchen. Weiterhin sind manche der
Provider in beiden Betriebssystemen nicht zueinander kompatibel, in dem
Sinne da? deren Sonden unterschiedliche Argumenttypen aufweisen. Dadurch
k?nnen D-Skripte, die unter Solaris™ geschrieben wurden, evtl. unter
FreeBSD funktionieren oder auch nicht, umgekehrt ist das genauso.

In FreeBSD darf DTrace wegen unterschiedlicher Sicherheitskonzepte nur
von ``root`` verwendet werden. Solaris™ besitzt ein paar
Audit-Funktionen auf den unteren Ebenen, die noch nicht in FreeBSD
implementiert sind. Deshalb kann nur ``root`` auf ``/dev/dtrace/dtrace``
zugreifen.

Zum Schluss muss noch erw?hnt werden, dass die DTrace-Software unter die
CDDL Lizenz f?llt. Die
``Common Development and Distribution       License`` wird von FreeBSD
mitgeliefert, sehen Sie sich dazu
``/usr/src/cddl/contrib/opensolaris/OPENSOLARIS.LICENSE`` an, oder lesen
Sie die Online-Version unter
``http://www.opensolaris.org/os/licensing``.

Diese Lizenz bedeutet, dass ein FreeBSD-Kernel mit den DTrace-Optionen
immer noch BSD-lizenziert ist; allerdings tritt die CDDL in Kraft, wenn
Module in Bin?rform vertrieben werden oder die Bin?rdateien geladen
werden.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------+-------------------------------+----------------------------------------------+
| `Zur?ck <dtrace.html>`__?   | `Nach oben <dtrace.html>`__   | ?\ `Weiter <dtrace-enable.html>`__           |
+-----------------------------+-------------------------------+----------------------------------------------+
| Kapitel 27. DTrace?         | `Zum Anfang <index.html>`__   | ?27.3. Die DTrace Unterst?tzung aktivieren   |
+-----------------------------+-------------------------------+----------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
