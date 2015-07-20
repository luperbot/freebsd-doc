=========================
5. Textdateien bearbeiten
=========================

.. raw:: html

   <div class="navheader">

5. Textdateien bearbeiten
`Zur?ck <getting-help.html>`__?
?
?\ `Weiter <printing-files-from-dos.html>`__

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

5. Textdateien bearbeiten
-------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Um Ihr System konfigurieren zu k?nnen, m?ssen Sie h?ufig Textdateien
bearbeiten. Die meisten Konfigurationsdateien befinden sich im
Verzeichnis ``/etc``. Um diese editieren zu k?nnen, m?ssen Sie mit
``su`` zu ``root`` werden. Sie k?nnen den einfachen Editor ``ee``
verwenden, auf lange Sicht lohnt es sich aber, die Bedienung von ``vi``
zu erlernen. Falls Sie die Systemquellen installiert haben, befindet
sich unter ``/usr/src/contrib/nvi/docs/tutorial`` ein ausgezeichnetes
Tutorial zu ``vi``.

Bevor Sie eine Datei bearbeiten, sollten Sie eine Sicherheitskopie der
Datei anlegen. Wenn Sie beispielsweise ``/etc/rc.conf`` bearbeiten
m?chten, wechseln Sie mit ``cd /etc`` nach ``/etc`` und geben Folgendes
ein:

.. raw:: html

   <div class="informalexample">

.. code:: screen

    # cp rc.conf rc.conf.orig

.. raw:: html

   </div>

Dadurch wird eine Kopie von ``rc.conf`` mit dem Namen ``rc.conf.orig``
angelegt, mit der Sie notfalls das Original wiederherstellen k?nnen,
indem Sie ``etc.conf.orig`` nach ``etc.conf`` kopieren. Noch besser ist
es, die Datei zuerst zu verschieben (umzubenennen) und dann zu kopieren:

.. raw:: html

   <div class="informalexample">

.. code:: screen

    # mv rc.conf rc.conf.orig
    # cp rc.conf.orig rc.conf

.. raw:: html

   </div>

weil bei der Verwendung von ``mv`` das Datum und der Besitzer der Datei
erhalten bleiben. Danach k?nnen Sie die Datei ``rc.conf`` bearbeiten.
M?chten Sie die Originaldatei wiederherstellen, geben Sie
**``mv rc.conf rc.conf.myedit``** (falls Sie die bearbeitete Version
erhalten m?chten), gefolgt von:

.. raw:: html

   <div class="informalexample">

.. code:: screen

    # mv rc.conf.orig rc.conf

.. raw:: html

   </div>

ein, um den Originalzustand wiederherzustellen.

Um eine Datei zu bearbeiten, geben Sie

.. raw:: html

   <div class="informalexample">

.. code:: screen

    # vi filename

.. raw:: html

   </div>

ein.

Innerhalb des Textes k?nnen Sie sich mit den Pfeiltasten bewegen. Mit
der **Esc**-Taste wechselt ``vi`` in den Kommandomodus. Einige der
wichtigsten Kommandos sind:

.. raw:: html

   <div class="variablelist">

``x``
    l?scht den Buchstaben links vom Cursor

``dd``
    l?scht die komplette Zeile, auch wenn diese am Bildschirm
    umgebrochen wird.

``i``
    f?gt Text an der Cursorposition ein.

``a``
    f?gt Text rechts vom Cursor ein.

.. raw:: html

   </div>

Nachdem Sie ``i`` oder ``a`` eingegeben haben, k?nnen Sie also die Datei
bearbeiten. Mit ``Esc`` kommen Sie wieder in den Kommandomodus, wo Sie
beispielsweise

.. raw:: html

   <div class="variablelist">

``:w``
    eingeben, um Ihre ?nderungen zu speichern und mit ``vi``
    weiterarbeiten k?nnen.

``:wq``
    Speichern und Beenden.

``:q!``
    Beenden, ohne die ?nderungen zu speichern.

``/text``
    bewegt den Cursor an die Stelle des ersten Vorkommens von
    *``text``*; ``/Enter`` (die Enter-Taste) findet dann das n?chste
    Vorkommen von *``text``*.

``G``
    bewegt den Cursor ans Ende der Datei.

``nG``
    bewegt den Cursor in die Zeile *``n``* der Datei, wobei *``n``* f?r
    eine Zahl steht.

**Ctrl**+**L**
    zeichnet den Bildschirm neu.

**Ctrl**+**b** und **Ctrl**+**f**
    eine Bildschirmseite zur?ck oder vorw?rts gehen, analog zu ``more``
    und ``view``.

.. raw:: html

   </div>

Am besten sammeln Sie praktische Erfahrungen mit ``vi`` in Ihrem
Heimatverzeichnis, indem Sie eine Datei anlegen und danach bearbeiten,
die Datei speichern und wieder aufrufen. ``vi`` birgt wirklich einige
?berraschungen, da es sich um ein komplexes Programm handelt. Manchmal
werden Sie versehentlich ein Kommando ausf?hren, das etwas anderes tut,
als Sie erwarten. (``vi`` ist viel leistungsf?higer als der DOS-Editor
EDIT. Rufen Sie doch einmal das Kommando ``:r`` auf.) Dr?cken Sie die
**Esc**-Taste ruhig ?fter als einmal, um sicher zu gehen, dass Sie sich
im Kommandomodus befinden und arbeiten Sie in diesem Modus weiter, falls
Probleme auftreten. Speichern Sie die Datei immer wieder mit ``:w``, und
geben Sie ``:q!`` ein, um von vorne zu beginnen (genauer gesagt, vom
letzten ``:w``-Kommando), falls dies n?tig sein sollte.

Danach k?nnen Sie mit ``cd`` nach ``/etc`` wechseln, mit ``su`` zu
``root`` werden, und mit ``vi`` ``/etc/group`` bearbeiten und einen
Benutzer zur Gruppe ``wheel`` hinzuf?gen, damit dieser mit ``su``
``root``-Rechte erlangen kann. F?gen Sie daf?r einfach ein Komma und den
Login-Namen des Benutzers an das Ende der ersten Zeile an, dr?cken Sie
**Esc** und ``:wq`` (um die Datei zu speichern und den ``vi`` zu
verlassen). Sehr effizient, nicht wahr? (Sie haben hoffentlich kein
Leerzeichen nach dem Komma eingef?gt?)

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------+-------------------------------+------------------------------------------------+
| `Zur?ck <getting-help.html>`__?        | ?                             | ?\ `Weiter <printing-files-from-dos.html>`__   |
+----------------------------------------+-------------------------------+------------------------------------------------+
| 4. Hilfe und Informationen erhalten?   | `Zum Anfang <index.html>`__   | ?6. Dateien mit Hilfe von DOS ausdrucken       |
+----------------------------------------+-------------------------------+------------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
