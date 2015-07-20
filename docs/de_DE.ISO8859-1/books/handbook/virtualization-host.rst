=====================================
24.3. FreeBSD als Host-Betriebssystem
=====================================

.. raw:: html

   <div class="navheader">

24.3. FreeBSD als Host-Betriebssystem
`Zur?ck <virtualization-guest.html>`__?
Kapitel 24. Virtualisierung
?\ `Weiter <l10n.html>`__

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

24.3. FreeBSD als Host-Betriebssystem
-------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

?bersetzt von Benedict Reuschling und Christoph Sold.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Seit einigen Jahren wurde FreeBSD nicht offiziell von irgendeiner der
verf?gbaren Virtualisierungsl?sungen als Host-Betriebssystem
unterst?tzt. Viele Anwender verwenden aber noch ?ltere VMware-Versionen
(z.B.
`emulators/vmware3 <http://www.freebsd.org/cgi/url.cgi?ports/emulators/vmware3/pkg-descr>`__),
welches die Linux?-Kompatibilit?tsschicht nutzt. Kurz nach der
Ver?ffentlichung von FreeBSD?7.2 erschien VirtualBox™ als Open-Source
Edition (OSE) von Sun™ in der Ports-Sammlung als ein direkt auf FreeBSD
lauff?higes Programm.

VirtualBox™ ist ein vollst?ndiges Virtualisierungspaket, das aktiv
weiterentwickelt wird und f?r die meisten Betriebssysteme
einschliesslich Windows?, Mac?OS?, Linux? und FreeBSD zur Verf?gung
steht. Es kann sowohl Windows? als auch UNIX?-?hnliche Gastsysteme
betreiben. Es ist als Open Source und als propriet?re Edition
erh?ltlich. Die wichtigste Einschr?nkung der OSE aus Anwendersicht ist
die fehlende USB-Unterst?tzung. Weitere Unterschiede k?nnen von der
„Editions“-Seite des VirtualBox™-Wikis, das unter
``http://www.virtualbox.org/wiki/Editions`` zu finden ist, entnommen
werden. Momentan steht nur OSE unter FreeBSD zur Verf?gung.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

24.3.1. VirtualBox™ installieren
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

VirtualBox™ steht als FreeBSD-Port in
`emulators/virtualbox-ose <http://www.freebsd.org/cgi/url.cgi?ports/emulators/virtualbox-ose/pkg-descr>`__
bereit und kann ?ber den folgenden Befehl installiert werden:

.. code:: screen

    # cd /usr/ports/emulators/virtualbox-ose
    # make install clean

Eine n?tzliche Option im Konfigurationsdialog ist die
``GuestAdditions``-Programmsammlung. Diese stellen eine Reihe von
n?tzlichen Eigenschaften in den Gastbetriebssystemen zur Verf?gung, wie
beispielsweise Mauszeigerintegration (was es erm?glicht, die Maus
zwischen dem Host und dem Gast zu teilen ohne eine spezielle
Tastenkombination f?r diesen Wechsel zu dr?cken), sowie schnelleres
Rendern von Videos, besonders in Windows? G?sten. Diese Gastzus?tze sind
im Devices-Men? zu finden, nachdem die Installation des
Gastbetriebssystem abgeschlossen ist.

Ein paar Konfigurations?nderungen sind notwendig, bevor VirtualBox™ das
erste Mal gestartet wird. Der Port installiert ein Kernelmodul in
``/boot/modules``, das in den laufenden Kernel geladen werden muss:

.. code:: screen

    # kldload vboxdrv

Um sicherzustellen, dass das Modul immer nach einem Neustart geladen
wird, f?gen Sie die folgende Zeile in die Datei ``/boot/loader.conf``
ein:

.. code:: programlisting

    vboxdrv_load="YES"

?ltere Versionen als 3.1.2 von VirtualBox™ ben?tigen auch das
eingeh?ngte ``proc``-Dateisystem. Dies wird in aktuellen Versionen nicht
mehr ben?tigt, da dort die Funktionen von der
`sysctl(3) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=3>`__
Bibliothek bereitgestellt werden.

Wenn Sie eine ?ltere Version aus den Ports benutzen, befolgen Sie die
unten stehenden Anweisungen und stellen Sie sicher, dass ``proc``
eingehangen ist.

.. code:: screen

    # mount -t procfs proc /proc

Um auch diese Einstellung nach einem Neustart zu erhalten, wird die
folgende Zeile in ``/etc/fstab`` eingef?gt:

.. code:: programlisting

    proc      /proc   procfs  rw      0       0

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

M?glicherweise erscheint eine Fehlermeldung ?hnlich der Folgenden, wenn
VirtualBox™ von einem Terminal aus gestartet wird:

.. code:: screen

    VirtualBox: supR3HardenedExecDir: couldn't read "", errno=2 cchLink=-1

Wahrscheinlich ist der ?belt?ter das ``proc``-Dateisystem. Verwenden Sie
bitte das ``mount``-Kommando um zu ?berpr?fen, ob es korrekt eingeh?ngt
ist.

.. raw:: html

   </div>

Die Gruppe ``vboxusers`` wird w?hrend der Installation von VirtualBox™
angelegt. Alle Benutzer, die Zugriff auf VirtualBox™ haben sollen,
m?ssen in diese Gruppe aufgenommen werden. Der ``pw``-Befehl kann
benutzt werden, um neue Mitglieder hinzuzuf?gen:

.. code:: screen

    # pw groupmod vboxusers -m yourusername

Um VirtualBox™ zu starten, w?hlen Sie entweder den Eintrag Sun
VirtualBox aus dem Men? Ihrer graphischen Benutzeroberfl?che, oder geben
Sie den folgenden Befehl in ein Terminal ein:

.. code:: screen

    % VirtualBox

Besuchen Sie die offizielle Webseite von VirtualBox™ unter
``http://www.virtualbox.org``, um weitere Informationen zur
Konfiguration und Verwendung zu erhalten. Da der FreeBSD-Port noch recht
neu ist, befindet er sich noch unter st?ndiger Entwicklung. Um die
aktuellen Nachrichten und Anleitungen zur Fehlerbehebung zu erhalten,
besuchen Sie die entsprechende Seite im FreeBSD-Wiki unter
``http://wiki.FreeBSD.org/VirtualBox``.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------------+---------------------------------------+------------------------------------------------------------------+
| `Zur?ck <virtualization-guest.html>`__?   | `Nach oben <virtualization.html>`__   | ?\ `Weiter <l10n.html>`__                                        |
+-------------------------------------------+---------------------------------------+------------------------------------------------------------------+
| 24.2. FreeBSD als Gast-Betriebssystem?    | `Zum Anfang <index.html>`__           | ?Kapitel 25. Lokalisierung – I18N/L10N einrichten und benutzen   |
+-------------------------------------------+---------------------------------------+------------------------------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
