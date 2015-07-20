===========================
4.13. Weitere Informationen
===========================

.. raw:: html

   <div class="navheader">

4.13. Weitere Informationen
`Zur?ck <binary-formats.html>`__?
Kapitel 4. Grundlagen des UNIX Betriebssystems
?\ `Weiter <ports.html>`__

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

4.13. Weitere Informationen
---------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

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

4.13.1. Manualpages
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die umfassendste Dokumentation rund um FreeBSD gibt es in Form von
Manualpages. Ann?hernd jedes Programm im System bringt eine kurze
Referenzdokumentation mit, die die grunds?tzliche Funktion und
verschiedene Parameter erkl?rt. Diese Dokumentationen kann man mit dem
``man`` Kommando benutzen. Die Benutzung des ``man`` Kommandos ist
einfach:

.. code:: screen

    % man Kommando

``Kommando`` ist der Name des Kommandos, ?ber das Sie etwas erfahren
wollen. Um beispielsweise mehr ?ber das Kommando ``ls`` zu lernen, geben
Sie ein:

.. code:: screen

    % man ls

Die Online-Dokumentation ist in nummerierte Sektionen unterteilt:

.. raw:: html

   <div class="orderedlist">

#. Benutzerkommandos.

#. Systemaufrufe und Fehlernummern.

#. Funktionen der C Bibliothek.

#. Ger?tetreiber.

#. Dateiformate.

#. Spiele und andere Unterhaltung.

#. Verschiedene Informationen.

#. Systemverwaltung und -Kommandos.

#. Kernel Entwickler.

.. raw:: html

   </div>

In einigen F?llen kann dasselbe Thema in mehreren Sektionen auftauchen.
Es gibt zum Beispiel ein ``chmod`` Benutzerkommando und einen
``chmod()`` Systemaufruf. In diesem Fall k?nnen Sie dem ``man`` Kommando
sagen, aus welcher Sektion Sie die Information erhalten m?chten, indem
Sie die Sektion mit angeben:

.. code:: screen

    % man 1 chmod

Dies wird Ihnen die Manualpage f?r das Benutzerkommando ``chmod``
zeigen. Verweise auf eine Sektion der Manualpages werden traditionell in
Klammern gesetzt. So bezieht sich
`chmod(1) <http://www.FreeBSD.org/cgi/man.cgi?query=chmod&sektion=1>`__
auf das Benutzerkommando ``chmod`` und mit
`chmod(2) <http://www.FreeBSD.org/cgi/man.cgi?query=chmod&sektion=2>`__
ist der Systemaufruf gemeint.

Das ist nett, wenn Sie den Namen eines Kommandos wissen, und lediglich
wissen wollen, wie es zu benutzen ist. Aber was tun Sie, wenn Sie Sich
nicht an den Namen des Kommandos erinnern k?nnen? Sie k?nnen mit ``man``
nach Schl?sselbegriffen in den Kommandobeschreibungen zu suchen, indem
Sie den Parameter ``-k`` benutzen:

.. code:: screen

    % man -k mail

Mit diesem Kommando bekommen Sie eine Liste der Kommandos, deren
Beschreibung das Schl?sselwort „mail“ enth?lt. Diese Funktionalit?t
erhalten Sie auch, wenn Sie das Kommando ``apropos`` benutzen.

Nun, Sie schauen Sich alle die geheimnisvollen Kommandos in ``/usr/bin``
an, haben aber nicht den blassesten Schimmer, wozu die meisten davon gut
sind? Dann rufen Sie doch das folgende Kommando auf:

.. code:: screen

    % cd /usr/bin
    % man -f *

Dasselbe erreichen Sie durch Eingabe von:

.. code:: screen

    % cd /usr/bin
    % whatis *

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

4.13.2. GNU Info Dateien
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD enth?lt viele Anwendungen und Utilities der Free Software
Foundation (FSF). Zus?tzlich zu den Manualpages bringen diese Programme
ausf?hrlichere Hypertext-Dokumente (``info`` genannt) mit, welche man
sich mit dem Kommando ``info`` ansehen kann. Wenn Sie emacs installiert
haben, k?nnen Sie auch dessen info-Modus benutzen.

Um das Kommando
`info(1) <http://www.FreeBSD.org/cgi/man.cgi?query=info&sektion=1>`__ zu
benutzen, geben Sie ein:

.. code:: screen

    % info

Eine kurze Einf?hrung gibt es mit ``h``; eine Befehlsreferenz erhalten
Sie durch Eingabe von: ``?``.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------+-------------------------------+--------------------------------------------------------------+
| `Zur?ck <binary-formats.html>`__?   | `Nach oben <basics.html>`__   | ?\ `Weiter <ports.html>`__                                   |
+-------------------------------------+-------------------------------+--------------------------------------------------------------+
| 4.12. Bin?rformate?                 | `Zum Anfang <index.html>`__   | ?Kapitel 5. Installieren von Anwendungen: Pakete und Ports   |
+-------------------------------------+-------------------------------+--------------------------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
