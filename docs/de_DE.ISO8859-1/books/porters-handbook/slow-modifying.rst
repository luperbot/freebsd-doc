========================
4.3. Den Port bearbeiten
========================

.. raw:: html

   <div class="navheader">

4.3. Den Port bearbeiten
`Zur?ck <slow-sources.html>`__?
Kapitel 4. Einen Port in aller Ruhe erstellen
?\ `Weiter <slow-patch.html>`__

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

4.3. Den Port bearbeiten
------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Entpacken Sie eine Kopie des Tarballs in ein privates Verzeichnis und
nehmen Sie alle ?nderungen vor, die n?tig sind, um den Port unter einer
aktuellen FreeBSD-Version kompilieren zu k?nnen. *Protokollieren Sie
sorgf?ltig* alle Schritte, die Sie vornehmen, da Sie den Prozess in
K?rze automatisieren werden. Alles, auch das Entfernen, Hinzuf?gen oder
Bearbeiten von Dateien, sollte von einem automatisierten Skript oder
einer Patch-Datei machbar sein, wenn Ihr Port fertig ist.

Falls Ihr Port bedeutende Interaktionen/Ver?nderungen durch den Benutzer
ben?tigt, um ihn zu Kompilieren oder zu Installieren, sollten Sie einen
Blick auf Larry Walls klassische Configure-Skripte werfen oder
vielleicht etwas ?hnliches selbst erstellen. Das Ziel der Ports-Sammlung
ist es, jeden Port so „plug-and-play-f?hig“ wie m?glich f?r den
Endbenutzer zu machen, w?hrend ein Minimum an Speicherplatz gebraucht
wird.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Solange nicht anders angegeben wird von Patch-Dateien, Skripten und
anderen Dateien, die Sie erstellt und der FreeBSD Ports-Sammlung
hinzugef?gt haben, angenommen, dass Sie unter den standardm??igen
BSD-Copyright-Bedingungen stehen.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------------+-------------------------------+-----------------------------------+
| `Zur?ck <slow-sources.html>`__?           | `Nach oben <slow.html>`__     | ?\ `Weiter <slow-patch.html>`__   |
+-------------------------------------------+-------------------------------+-----------------------------------+
| 4.2. Den originalen Quelltext besorgen?   | `Zum Anfang <index.html>`__   | ?4.4. Fehlerbehebung (Patches)    |
+-------------------------------------------+-------------------------------+-----------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
