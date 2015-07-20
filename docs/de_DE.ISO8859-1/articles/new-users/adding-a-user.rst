==============================================================
2. Einen neuen Benutzer anlegen, der root-Rechte erlangen kann
==============================================================

.. raw:: html

   <div class="navheader">

2. Einen neuen Benutzer anlegen, der ``root``-Rechte erlangen kann
`Zur?ck <index.html>`__?
?
?\ `Weiter <looking-around.html>`__

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

2. Einen neuen Benutzer anlegen, der ``root``-Rechte erlangen kann
------------------------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Falls Sie w?hrend der Installation des Systems keine Benutzer angelegt
haben und noch als ``root`` angemeldet sind, sollten Sie mit

.. raw:: html

   <div class="informalexample">

.. code:: screen

    # adduser

.. raw:: html

   </div>

einen neuen Benutzer anlegen.

Wenn Sie ``adduser`` das erste Mal ausf?hren, werden Sie gefragt, ob Sie
einige Standardeinstellungen abspeichern m?chten. Vielleicht m?chten Sie
`csh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=csh&sektion=1>`__
statt `sh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sh&sektion=1>`__
als Default-Shell ausw?hlen (falls ``sh`` als Default-Shell angeboten
wird). Diese Standardeinstellungen sind in ``/etc/adduser.conf``
gespeichert und k?nnen von Ihnen ver?ndert werden.

Angenommen, Sie m?chten den Benutzer ``jack`` mit dem vollst?ndigen
Namen *Jack Benimble* anlegen. Weisen Sie ``jack`` auf jeden Fall ein
Passwort zu (auch Kinder, die auf der Tastatur spielen, k?nnen ein
Problem darstellen). Wenn Sie gefragt werden, ob ``jack`` Mitglied in
anderen Gruppen sein soll, geben Sie ``wheel`` ein.

.. raw:: html

   <div class="informalexample">

.. code:: screen

    Login group is ``jack''. Invite jack into other groups: wheel

.. raw:: html

   </div>

Dadurch k?nnen Sie sich als ``jack`` anmelden, und mit
`su(1) <http://www.FreeBSD.org/cgi/man.cgi?query=su&sektion=1>`__
``root``-Rechte erlangen. Dann werden Sie nie wieder daf?r kritisiert
werden, dass Sie sich als ``root`` am System anmelden.

Das Programm ``adduser`` kann jederzeit mit **Strg**+**C** beendet
werden. Am Schlu? haben Sie die M?glichkeit, die Einstellungen f?r den
neuen Benutzer nochmals zu kontrollieren oder diese mit **n** zu
verwerfen. Sie sollten noch einen zweiten Benutzer anlegen, damit Sie
auch dann auf Ihr System zugreifen k?nnen, wenn Sie die Anmeldedaten von
``jack`` bearbeitet und dabei einen Fehler gemacht haben.

Haben Sie alle Benutzer angelegt, geben Sie ``exit`` ein, damit Sie sich
als ``jack`` anmelden k?nnen. Es ist generell sinnvoll, wann immer
m?glich, als gew?hnlicher Benutzer und nicht als der allm?chtige
Benutzer ``root`` zu arbeiten.

Falls Sie schon einen Benutzer angelegt haben und diesem die M?glichkeit
einr?umen wollen, mit ``su`` ``root``-Rechte zu erlangen, k?nnen Sie
sich als ``root`` anmelden und die Datei ``/etc/group`` anpassen. F?gen
Sie in der ersten Zeile (der Gruppe ``wheel``) den Benutzer ``jack``
ein. Sie sollten auch den Umgang mit dem Texteditor
`vi(1) <http://www.FreeBSD.org/cgi/man.cgi?query=vi&sektion=1>`__
erlernen. Alternativ k?nnen Sie auch den einfacher zu bedienenden
Texteditor
`ee(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ee&sektion=1>`__
verwenden, der auf aktuellen FreeBSD-Systemen automatisch installiert
wird.

Mit ``rmuser`` k?nnen Sie einen Benutzer l?schen.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------------------+-------------------------------+---------------------------------------+
| `Zur?ck <index.html>`__?                           | ?                             | ?\ `Weiter <looking-around.html>`__   |
+----------------------------------------------------+-------------------------------+---------------------------------------+
| Informationen f?r FreeBSD- und UNIX?-Einsteiger?   | `Zum Anfang <index.html>`__   | ?3. Sich im System umsehen            |
+----------------------------------------------------+-------------------------------+---------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
