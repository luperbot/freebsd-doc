===============================================
Informationen f?r FreeBSD- und UNIX?-Einsteiger
===============================================

.. raw:: html

   <div class="navheader">

Informationen f?r FreeBSD- und UNIX?-Einsteiger
?
?
?\ `Weiter <adding-a-user.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="article" lang="de" lang="de">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="authorgroup" xmlns="http://www.w3.org/1999/xhtml">

.. raw:: html

   <div class="author">

Annelise Anderson
~~~~~~~~~~~~~~~~~

.. raw:: html

   <div class="affiliation">

.. raw:: html

   <div class="address">

``<andrsn@andrsn.stanford.edu>``

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div>

Version: ` <https://svnweb.freebsd.org/changeset/doc/>`__

.. raw:: html

   </div>

.. raw:: html

   <div>

`Rechtlicher Hinweis <trademarks.html>`__

.. raw:: html

   </div>

.. raw:: html

   <div>

Zuletzt bearbeitet am 1997-08-15 von .

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="abstract" xmlns="http://www.w3.org/1999/xhtml">

.. raw:: html

   <div class="abstract-title">

Zusammenfassung

.. raw:: html

   </div>

Wir gratulieren Ihnen zur Installation von FreeBSD! Diese Einf?hrung ist
f?r alle Personen gedacht, die FreeBSD und UNIX? noch nicht kennen, und
enth?lt daher auch einige grundlegende Informationen. Es wird davon
ausgegangen, dass Sie FreeBSD?2.0.5 oder neuer in der von FreeBSD.org
ver?ffentlichten Form installiert haben sowie ?ber gute Kenntnisse von
DOS/Windows? oder OS/2? verf?gen.

*?bersetzt von Fabio Tosques*.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="docformatnavi">

[ einzelne Abschnitte / `komplettes Dokument <article.html>`__ ]

.. raw:: html

   </div>

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Inhaltsverzeichnis

.. raw:: html

   </div>

`1. An- und Abmelden <index.html#in-and-out>`__
`2. Einen neuen Benutzer anlegen, der ``root``-Rechte erlangen
kann <adding-a-user.html>`__
`3. Sich im System umsehen <looking-around.html>`__
`4. Hilfe und Informationen erhalten <getting-help.html>`__
`5. Textdateien bearbeiten <editing-text.html>`__
`6. Dateien mit Hilfe von DOS
ausdrucken <printing-files-from-dos.html>`__
`7. Weitere n?tzliche Befehle <other-useful-commands.html>`__
`8. Die n?chsten Schritte <next-steps.html>`__
`9. Die Arbeitsumgebung <your-working-environment.html>`__
`10. Einige abschlie?ende Bemerkungen <other.html>`__
`11. Kommentare <comments-welcome.html>`__

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

1. An- und Abmelden
-------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Melden Sie sich (wenn ``login:`` am Bildschirm erscheint) als derjenige
Benutzer, den Sie w?hrend der Installation angelegt haben, oder als
``root`` an. (Die FreeBSD-Installationsroutine legt in jedem Fall einen
Benutzer ``root`` an; dieser darf auf dem System fast alles tun,
einschlie?lich dem L?schen von wichtigen Dateien. Seien Sie also
vorsichtig, wenn Sie sich als ``root`` anmelden.) Die Zeichen ``%`` und
``#`` stellen im folgenden die Eingabeaufforderung dar, wobei ``%`` f?r
den gew?hnlichen Benutzer und ``#`` f?r den Benutzer ``root`` steht.

Um sich abzumelden, geben Sie

.. raw:: html

   <div class="informalexample">

.. code:: screen

    # exit

.. raw:: html

   </div>

so oft wie n?tig ein (und zwar bis wieder ``login:`` erscheint). Dr?cken
Sie nach jedem Befehl die Enter-Taste und beachten Sie, dass UNIX?
zwischen Gro?- und Kleinschreibung unterscheidet – ``exit`` und ``EXIT``
sind also zwei verschiedene Befehle.

Um den Rechner herunterzufahren, geben Sie

.. raw:: html

   <div class="informalexample">

.. code:: screen

    # /sbin/shutdown -h now

.. raw:: html

   </div>

ein.

Um den Rechner neu zu starten, geben Sie

.. raw:: html

   <div class="informalexample">

.. code:: screen

    # /sbin/shutdown -r now

.. raw:: html

   </div>

ein, oder Sie rufen einfach

.. raw:: html

   <div class="informalexample">

.. code:: screen

    # /sbin/reboot

.. raw:: html

   </div>

auf.

Sie k?nnen nat?rlich auch den Rechner mit **Strg**+**Alt**+**Entf** neu
starten. Warten Sie danach, bis der Neustart erfolgt ist. Diese
Tastenkombination ist in neueren FreeBSD-Versionen mit ``/sbin/reboot``
identisch und viel besser als das Dr?cken des Reset-Knopfes. Sie wollen
das System ja sicher nicht noch einmal neu installieren, oder?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----+-----+-----------------------------------------------------------------------+
| ?   | ?   | ?\ `Weiter <adding-a-user.html>`__                                    |
+-----+-----+-----------------------------------------------------------------------+
| ?   | ?   | ?2. Einen neuen Benutzer anlegen, der ``root``-Rechte erlangen kann   |
+-----+-----+-----------------------------------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
