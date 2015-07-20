==============================
4.11. Ger?te und Ger?tedateien
==============================

.. raw:: html

   <div class="navheader">

4.11. Ger?te und Ger?tedateien
`Zur?ck <editors.html>`__?
Kapitel 4. Grundlagen des UNIX Betriebssystems
?\ `Weiter <binary-formats.html>`__

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

4.11. Ger?te und Ger?tedateien
------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Der Begriff Ger?t wird meist in Verbindung mit Hardware wie Laufwerken,
Druckern, Grafikkarten oder Tastaturen gebraucht. Der Gro?teil der
Meldungen, die beim Booten von FreeBSD angezeigt werden, beziehen sich
auf gefundene Ger?te. Sie k?nnen sich die Bootmeldungen sp?ter in
``/var/run/dmesg.boot`` ansehen.

Ger?tenamen, die Sie wahrscheinlich in den Bootmeldungen sehen werden,
sind zum Beispiel ``acd0``, das erste IDE CD-ROM oder ``kbd0``, die
Tastatur.

Auf die meisten Ger?te wird unter UNIX? Systemen ?ber spezielle
Ger?tedateien im ``/dev`` Verzeichnis zugegriffen.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.11.1. Anlegen von Ger?tedateien
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn sie ein neues Ger?t zu Ihrem System hinzuf?gen, oder die
Unterst?tzung f?r zus?tzliche Ger?te kompilieren, m?ssen ein oder
mehrere Ger?tedateien erstellt werden.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.11.1.1. ``DEVFS`` (Ger?tedateisystem)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das Ger?tedateisystem ``DEVFS`` erm?glicht durch den Namensraum des
Dateisystems Zugriff auf den Namensraum der Ger?te im Kernel. Damit
m?ssen Ger?tedateien nicht mehr extra angelegt werden, sondern werden
von ``DEVFS`` verwaltet.

Weitere Informationen finden Sie in
`devfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=devfs&sektion=5>`__.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------+-------------------------------+---------------------------------------+
| `Zur?ck <editors.html>`__?   | `Nach oben <basics.html>`__   | ?\ `Weiter <binary-formats.html>`__   |
+------------------------------+-------------------------------+---------------------------------------+
| 4.10. Text-Editoren?         | `Zum Anfang <index.html>`__   | ?4.12. Bin?rformate                   |
+------------------------------+-------------------------------+---------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
