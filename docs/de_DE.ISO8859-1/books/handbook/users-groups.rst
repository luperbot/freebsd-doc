=============
14.8. Gruppen
=============

.. raw:: html

   <div class="navheader">

14.8. Gruppen
`Zur?ck <users-limiting.html>`__?
Kapitel 14. Benutzer und grundlegende Account-Verwaltung
?\ `Weiter <security.html>`__

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

14.8. Gruppen
-------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Eine Gruppe ist einfach eine Zusammenfassung von Accounts. Gruppen
werden durch den Gruppennamen und die GID (group ID) identifiziert. Der
Kernel von FreeBSD (und den meisten anderen UNIX? Systemen) entscheidet
anhand der UID und der Gruppenmitgliedschaft eines Prozesses, ob er dem
Prozess etwas erlaubt oder nicht. Im Unterschied zur UID kann ein
Prozess zu einer Reihe von Gruppen geh?ren. Wenn jemand von der GID
eines Benutzers oder Prozesses spricht, meint er damit meistens die
erste Gruppe der Gruppenliste.

Die Zuordnung von Gruppennamen zur GID steht in ``/etc/group``, einer
Textdatei mit vier durch Doppelpunkte getrennten Feldern. Im ersten Feld
steht der Gruppenname, das zweite enth?lt ein verschl?sseltes Passwort,
das dritte gibt die GID an und das vierte besteht aus einer Komma
separierten Liste der Mitglieder der Gruppe. Diese Datei kann einfach
editiert werden (nat?rlich nur, wenn Sie dabei keine Syntaxfehler
machen). Eine ausf?hrliche Beschreibung der Syntax dieser Datei finden
Sie in
`group(5) <http://www.FreeBSD.org/cgi/man.cgi?query=group&sektion=5>`__.

Wenn Sie ``/etc/group`` nicht h?ndisch editieren m?chten, k?nnen Sie
`pw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pw&sektion=8>`__ zum
Editieren benutzen. Das folgende Beispiel zeigt das Hinzuf?gen einer
Gruppe mit dem Namen ``teamtwo``:

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel 14.7. Setzen der Mitgliederliste einer Gruppe mit
`pw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pw&sektion=8>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    # pw groupadd teamtwo
    # pw groupshow teamtwo
    teamtwo:*:1100:

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Zahl ``1100`` ist die GID der Gruppe ``teamtwo``. Momentan hat
``teamtwo`` noch keine Mitglieder und ist daher ziemlich nutzlos. Um das
zu ?ndern, nehmen wir nun ``jru`` in ``teamtwo`` auf.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel 14.8. Ein Gruppenmitglied mit ``pw`` hinzuf?gen

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    # pw groupmod teamtwo -M jru
    # pw groupshow teamtwo
    teamtwo:*:1100:jru

.. raw:: html

   </div>

.. raw:: html

   </div>

Als Argument von ``-M`` geben Sie eine Komma separierte Liste von
Mitgliedern an, die in die Gruppe aufgenommen werden sollen. Aus den
vorherigen Abschnitten ist bekannt, dass die Passwort-Datei ebenfalls
eine Gruppe f?r jeden Benutzer enth?lt. Das System teilt dem Benutzer
automatisch eine Gruppe zu, die aber vom ``groupshow`` Kommando von
`pw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pw&sektion=8>`__ nicht
angezeigt wird. Diese Information wird allerdings von
`id(1) <http://www.FreeBSD.org/cgi/man.cgi?query=id&sektion=1>`__ und
?hnlichen Werkzeugen angezeigt. Das hei?t, dass
`pw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pw&sektion=8>`__ nur
``/etc/group`` manipuliert, es wird nicht versuchen, zus?tzliche
Informationen aus ``/etc/passwd`` zu lesen.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel 14.9. Hinzuf?gen eines neuen Gruppenmitglieds mittels
`pw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pw&sektion=8>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    # pw groupmod teamtwo -m db
    # pw groupshow teamtwo
    teamtwo:*:1100:jru,db

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Argumente zur Option ``-m`` ist eine durch Komma getrennte Liste von
Benutzern, die der Gruppe hinzugef?gt werden sollen. Anders als im
vorherigen Beispiel werden diese Benutzer in die Gruppe aufgenommen und
ersetzen nicht die Liste der bereits bestehenden Benutzer in der Gruppe.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel 14.10. Mit ``id`` die Gruppenzugeh?rigkeit bestimmen

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    % id jru
    uid=1001(jru) gid=1001(jru) groups=1001(jru), 1100(teamtwo)

.. raw:: html

   </div>

.. raw:: html

   </div>

Wie Sie sehen, ist ``jru`` Mitglied von ``jru`` und ``teamtwo``.

Weitere Informationen entnehmen Sie bitte
`pw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pw&sektion=8>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------+-------------------------------+---------------------------------+
| `Zur?ck <users-limiting.html>`__?   | `Nach oben <users.html>`__    | ?\ `Weiter <security.html>`__   |
+-------------------------------------+-------------------------------+---------------------------------+
| 14.7. Benutzer einschr?nken?        | `Zum Anfang <index.html>`__   | ?Kapitel 15. Sicherheit         |
+-------------------------------------+-------------------------------+---------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
