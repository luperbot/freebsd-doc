================
5.9. Manualpages
================

.. raw:: html

   <div class="navheader">

5.9. Manualpages
`Zur?ck <makefile-masterdir.html>`__?
Kapitel 5. Die Konfiguration des Makefile
?\ `Weiter <makefile-info.html>`__

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

5.9. Manualpages
----------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Variablen ``MAN[1-9LN]`` werden automatisch jede Manualpage zur
``pkg-plist`` hinzuf?gen (dies bedeutet, dass Sie Manualpages *nicht* in
der ``pkg-plist`` auflisten d?rfen, lesen Sie bitte `Erstellung der
PLIST <plist.html#plist-sub>`__ f?r weitere Details). Sie veranlassen
zudem den Installationsabschnitt dazu, die Manualpages zu Komprimieren
oder zu Dekomprimieren abh?ngig vom gesetzten Wert der Variable
``NO_MANCOMPRESS`` in ``/etc/make.conf``.

Falls Ihr Port versucht verschiedene Namen f?r Manualpages unter
Zuhilfenahme von Symlinks oder Hardlinks zu installieren, m?ssen Sie die
Variable ``MLINKS`` nutzen, um diese zu identifizieren. Der von Ihrem
Port installierte Link wird von ``bsd.port.mk`` gel?scht und wieder
eingef?gt, um sicherzustellen, dass er auf die korrekte Datei zeigt.
Jede Manualpage, welche in ``MLINKS`` aufgef?hrt ist, darf nicht in der
``pkg-plist`` aufgenommen werden.

Falls die Manualpages w?hrend der Installation komprimiert werden
sollen, m?ssen Sie die Variable ``MANCOMPRESSED`` setzen. Diese Variable
kann drei Werte annehmen, ``yes``, ``no`` und ``maybe``. ``yes``
bedeutet, dass Manualpages bereits komprimiert installiert sind, bei
``no`` sind sie es nicht und ``maybe`` bedeutet, dass die Software
bereits den Wert von ``NO_MANCOMPRESS`` beachtet, damit ``bsd.port.mk``
nichts Besonderes auszuf?hren hat.

``MANCOMPRESSED`` wird automatisch auf ``yes`` gesetzt, wenn
``USE_IMAKE`` vorgegeben ist und gleichzeitig ``NO_INSTALL_MANPAGES``
nicht. Im umgekehrten Falle ist ``MANCOMPRESSED`` auf ``no`` gesetzt.
Sie m?ssen es nicht explizit angeben, au?er die Standardvorgabe ist f?r
Ihren Port nicht passend.

Wenn Ihr Port den man tree irgendwo anders als in der Variable
``PREFIX`` verankert, k?nnen Sie ihn mit ``MANPREFIX`` bestimmen.
Sollten zudem Manualpages nur in bestimmten Abschnitten an einem
nicht-standardkonformen Platz liegen, wie z.B. bestimmte
``Perl``-Modul-Ports, dann k?nnen Sie mittels der Variable
``MANsect``\ PREFIX (wobei *``sect``* ein Wert aus ``1-9``, ``L`` oder
``N`` ist) individuelle Pfade zu den Manualpages festlegen.

Wenn Ihre Manualpages in sprachspezifische Unterverzeichnisse
installiert werden, dann bestimmen Sie bitte den Namen der Sprache mit
der Variable ``MANLANG``. Der Wert dieser Variable ist mit ``""``
vorgegeben (das bedeutet nur Englisch).

Hier ist ein Beispiel, welches alles zusammenfasst.

.. code:: programlisting

    MAN1=          foo.1
    MAN3=          bar.3
    MAN4=          baz.4
    MLINKS=        foo.1 alt-name.8
    MANLANG=       "" ja
    MAN3PREFIX=    ${PREFIX}/share/foobar
    MANCOMPRESSED= yes

Dies zeigt an, dass sechs Dateien von diesem Port installiert werden;

.. code:: programlisting

    ${MANPREFIX}/man/man1/foo.1.gz
    ${MANPREFIX}/man/ja/man1/foo.1.gz
    ${PREFIX}/share/foobar/man/man3/bar.3.gz
    ${PREFIX}/share/foobar/man/ja/man3/bar.3.gz
    ${MANPREFIX}/man/man4/baz.4.gz
    ${MANPREFIX}/man/ja/man4/baz.4.gz

``${MANPREFIX}/man/man8/alt-name.8.gz`` kann zus?tzlich von Ihrem Port
installiert werden, oder auch nicht. Unabh?ngig davon wird ein Symlink
erstellt, welcher die Manualpages foo(1) und alt-name(8) einbindet.

Falls nur manche Manualpages ?bersetzt sind, k?nnen Sie einige dynamisch
vom ``MANLANG``-Inhalt erzeugte Variablen nutzen:

.. code:: programlisting

    MANLANG=       "" de ja
    MAN1=          foo.1
    MAN1_EN=       bar.1
    MAN3_DE=       baz.3

Dies f?hrt zu folgender Liste von Dateien:

.. code:: programlisting

    ${MANPREFIX}/man/man1/foo.1.gz
    ${MANPREFIX}/man/de/man1/foo.1.gz
    ${MANPREFIX}/man/ja/man1/foo.1.gz
    ${MANPREFIX}/man/man1/bar.1.gz
    ${MANPREFIX}/man/de/man3/baz.3.gz

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------+---------------------------------+--------------------------------------+
| `Zur?ck <makefile-masterdir.html>`__?   | `Nach oben <makefile.html>`__   | ?\ `Weiter <makefile-info.html>`__   |
+-----------------------------------------+---------------------------------+--------------------------------------+
| 5.8. ``MASTERDIR``?                     | `Zum Anfang <index.html>`__     | ?5.10. Info-Dateien                  |
+-----------------------------------------+---------------------------------+--------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
