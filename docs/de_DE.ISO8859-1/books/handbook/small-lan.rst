=====================================
26.9. Installation mehrerer Maschinen
=====================================

.. raw:: html

   <div class="navheader">

26.9. Installation mehrerer Maschinen
`Zur?ck <make-delete-old.html>`__?
Kapitel 26. FreeBSD aktualisieren
?\ `Weiter <dtrace.html>`__

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

26.9. Installation mehrerer Maschinen
-------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Beigetragen von Mike Meyer.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn Sie mehrere Maschinen besitzen, die Sie alle auf dem gleichen Stand
halten wollen, ist es eine Verschwendung von Ressourcen, die Quellen auf
jeder Maschine vorzuhalten und zu ?bersetzen. Die L?sung dazu ist, eine
Maschine den Gro?teil der Arbeit durchf?hren zu lassen und den anderen
Maschinen das Ergebnis mit NFS zur Verf?gung zu stellen. Dieser
Abschnitt zeigt Ihnen wie das geht.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

26.9.1. Voraussetzungen
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Stellen Sie zuerst eine Liste der Maschinen zusammen, die auf demselben
Stand sein sollen. Wir nennen diese Maschinen die *Baugruppe*. Jede
dieser Maschinen kann mit einem eigenen Kernel laufen, doch sind die
Programme des Userlands auf allen Maschinen gleich. W?hlen Sie aus der
Baugruppe eine Maschine aus, auf der der Bau durchgef?hrt wird, den
*Bau-Master*. Dies sollte eine Maschine sein, die ?ber die n?tigen
Ressourcen f?r ``make buildworld`` und ``make installworld`` verf?gt.
Sie brauchen auch eine *Testmaschine*, auf der Sie die Updates testen,
bevor Sie sie in Produktion installieren. Dies sollte eine Maschine,
eventuell der Bau-Master, sein, die ?ber einen l?ngeren Zeitraum nicht
zur Verf?gung stehen kann.

Alle Maschinen der Baugruppe m?ssen ``/usr/obj`` und ``/usr/src`` von
derselben Maschine an gleichem Ort einh?ngen. Idealerweise befinden sich
die beiden Verzeichnisse auf dem Bau-Master auf verschiedenen
Festplatten, sie k?nnen allerdings auch auf dem Bau-Master ?ber NFS zur
Verf?gung gestellt werden. Wenn Sie mehrere Baugruppen haben, sollte
sich ``/usr/src`` auf einem Bau-Master befinden und ?ber NFS f?r den
Rest der Maschinen zur Verf?gung gestellt werden.

Stellen Sie sicher, dass ``/etc/make.conf`` und ``/etc/src.conf`` auf
allen Maschinen einer Baugruppe mit der Datei des Bau-Masters
?bereinstimmt. Der Bau-Master muss jeden Teil des Systems bauen, den
irgendeine Maschine der Baugruppe ben?tigt. Auf dem Bau-Master m?ssen in
``/etc/make.conf`` alle zu bauenden Kernel mit der Variablen
``KERNCONF`` bekannt gegeben werden. Geben Sie dabei den Kernel des
Bau-Masters zuerst an. F?r jeden zu bauenden Kernel muss auf dem
Bau-Master die entsprechende Konfigurationsdatei unter
``/usr/src/sys/arch/conf`` abgelegt werden.

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

26.9.2. Installation des Basissystems
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Nach diesen Vorbereitungen k?nnen Sie mit dem Bau beginnen. Bauen Sie
auf dem Bau-Master, wie in `Abschnitt?26.7.7.2, „?bersetzen des
Basissystems“ <makeworld.html#make-buildworld>`__ beschrieben, den
Kernel und die Welt, installieren Sie aber nichts. Wechseln Sie auf die
Testmaschine und installieren Sie den gerade gebauten Kernel. Wenn diese
Maschine ``/usr/src`` und ``/usr/obj`` ?ber NFS bekommt, m?ssen Sie das
Netzwerk im Single-User-Modus aktivieren und die beiden Dateisysteme
einh?ngen. Am einfachsten ist dies, wenn Sie auf der Testmaschine
ausgehend vom Mehrbenutzermodus mit ``shutdown now`` in den
Single-User-Modus wechseln. Sie k?nnen dann mit der normalen Prozedur
den neuen Kernel und das System installieren und anschlie?end
``mergemaster`` laufen lassen. Wenn Sie damit fertig sind, k?nnen Sie
die Maschine wieder in den Mehrbenutzermodus booten.

Nachdem Sie sichergestellt haben, dass die Testmaschine einwandfrei
funktioniert, wiederholen Sie diese Prozedur f?r jede Maschine in der
Baugruppe.

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

26.9.3. Die Ports-Sammlung
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dasselbe Verfahren k?nnen Sie auch f?r die Ports-Sammlung anwenden.
Zuerst m?ssen alle Maschinen einer Baugruppe ``/usr/ports`` von
derselben Maschine ?ber NFS zur Verf?gung gestellt bekommen. Setzen Sie
dann ein Verzeichnis f?r die Quellen auf, das sich alle Maschinen
teilen. Dieses Verzeichnis k?nnen Sie in ``/etc/make.conf`` mit der
Variablen ``DISTDIR`` angeben. Das Verzeichnis sollte f?r den Benutzer
beschreibbar sein, auf den der Benutzer ``root`` vom NFS Subsystem
abgebildet wird. Jede Maschine sollte noch ``WRKDIRPREFIX`` auf ein
lokales Bauverzeichnis setzen. Wenn Sie vorhaben, Pakete zu bauen und zu
verteilen, sollten Sie ``PACKAGES`` auf ein Verzeichnis mit den gleichen
Eigenschaften wie ``DISTDIR`` setzen.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------------------------------------+-------------------------------------------+-------------------------------+
| `Zur?ck <make-delete-old.html>`__?                                 | `Nach oben <updating-upgrading.html>`__   | ?\ `Weiter <dtrace.html>`__   |
+--------------------------------------------------------------------+-------------------------------------------+-------------------------------+
| 26.8. Veraltete Dateien, Verzeichnisse und Bibliotheken l?schen?   | `Zum Anfang <index.html>`__               | ?Kapitel 27. DTrace           |
+--------------------------------------------------------------------+-------------------------------------------+-------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
