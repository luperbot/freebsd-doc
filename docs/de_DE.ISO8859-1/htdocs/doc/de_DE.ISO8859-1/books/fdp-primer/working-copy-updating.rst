===================================
3.5. Die Arbeitskopie aktualisieren
===================================

.. raw:: html

   <div class="navheader">

3.5. Die Arbeitskopie aktualisieren
`Zur?ck <working-copy-checking-out.html>`__?
Kapitel 3. Die Arbeitskopie
?\ `Weiter <working-copy-revert.html>`__

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

3.5. Die Arbeitskopie aktualisieren
-----------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Dokumente und Dateien im FreeBSD-Repository ?ndern sich beinahe
t?glich. ?nderungen werden durchgef?hrt und committed. Bereits kurz nach
einem Checkout kann es daher Unterschiede zwischen Ihrer Arbeitskopie
und dem FreeBSD-Hauptrepository geben. Um eine lokale Arbeitskopie auf
den Stand des Hauptrepository zu aktualisieren, wenden Sie den Befehl
``svn update`` auf das Verzeichnis an, in dem sich Ihre lokale
Arbeitskopie befindet:

.. code:: screen

    % svn update ~/doc

Gew?hnen Sie sich an, ``svn update`` auszuf?hren, bevor Sie Dokumente
bearbeiten. Sonst kann es passieren, dass das Dokument in der
Zwischenzeit bearbeitet wurde, Ihre lokale Kopie diese ?nderungen aber
noch nicht enth?lt. Es ist deutlich einfacher, die aktuelle Version zu
bearbeiten, als Ihre ?lteren lokalen ?nderungen mit den aktuellen
?nderungen des Repositories zu kombininieren.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------------+-------------------------------------+-----------------------------------------------------+
| `Zur?ck <working-copy-checking-out.html>`__?   | `Nach oben <working-copy.html>`__   | ?\ `Weiter <working-copy-revert.html>`__            |
+------------------------------------------------+-------------------------------------+-----------------------------------------------------+
| 3.4. Die Arbeitskopie auschecken?              | `Zum Anfang <index.html>`__         | ?3.6. ?nderungen an der Arbeitskopie zur?cknehmen   |
+------------------------------------------------+-------------------------------------+-----------------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
