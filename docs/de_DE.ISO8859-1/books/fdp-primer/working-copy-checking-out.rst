================================
3.4. Die Arbeitskopie auschecken
================================

.. raw:: html

   <div class="navheader">

3.4. Die Arbeitskopie auschecken
`Zur?ck <working-copy-choosing-directory.html>`__?
Kapitel 3. Die Arbeitskopie
?\ `Weiter <working-copy-updating.html>`__

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

3.4. Die Arbeitskopie auschecken
--------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Der Download einer Arbeitskopie wird als *checkout* bezeichnet und
erfolgt ?ber den Befehl ``svn checkout``. Das folgende Beispiel checkt
die aktuelle Version der Dokumentatation (``head``) aus dem
Hauptdokumentationsbaum aus:

.. code:: screen

    % svn checkout https://svn0.us-west.FreeBSD.org/doc/head ~/doc

Das Auschecken des Quellcodes f?r die Arbeit an den Manualpages erfolgt
analog:

.. code:: screen

    % svn checkout https://svn0.us-west.FreeBSD.org/base/head ~/src

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------------------+-------------------------------------+----------------------------------------------+
| `Zur?ck <working-copy-choosing-directory.html>`__?   | `Nach oben <working-copy.html>`__   | ?\ `Weiter <working-copy-updating.html>`__   |
+------------------------------------------------------+-------------------------------------+----------------------------------------------+
| 3.3. Ein Verzeichnis f?r die Arbeitskopie w?hlen?    | `Zum Anfang <index.html>`__         | ?3.5. Die Arbeitskopie aktualisieren         |
+------------------------------------------------------+-------------------------------------+----------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
