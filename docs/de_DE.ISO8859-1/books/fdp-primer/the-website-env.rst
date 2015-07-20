=======================
6.3. Umgebungsvariablen
=======================

.. raw:: html

   <div class="navheader">

6.3. Umgebungsvariablen
`Zur?ck <the-website-install.html>`__?
Kapitel 6. Die Webseite
?\ `Weiter <xml-primer.html>`__

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

6.3. Umgebungsvariablen
-----------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="variablelist">

``ENGLISH_ONLY``
    Ist diese Variable gesetzt und nicht leer, bauen und installieren
    die Makefiles ausschlie?lich die englischen Dokumente. S?mtliche
    ?bersetzungen werden dabei ignoriert. Dazu ein Beispiel:

    .. code:: screen

        # make ENGLISH_ONLY=YES all install

    Wenn Sie die Variable ``ENGLISH_ONLY`` deaktivieren und alle
    Webseiten inklusive aller ?bersetzungen bauen wollen, setzen Sie die
    Variable ``ENGLISH_ONLY`` auf einen leeren Wert:

    .. code:: screen

        # make ENGLISH_ONLY="" all install clean

``WEB_ONLY``
    Ist diese Variable gesetzt und nicht leer, bauen und installieren
    die Makefiles nur die HTML-Seiten des Verzeichnisses
    ``en_US.ISO8859-1/htdocs``. Alle anderen Dokumente des
    Verzeichnisses ``en_US.ISO8859-1`` (wie Handbuch, FAQ, Artikel)
    werden dabei ignoriert:

    .. code:: screen

        # make WEB_ONLY=YES all install

``WEB_LANG``
    Ist diese Variable gesetzt, wird die Dokumentation nur f?r die durch
    diese Variable festgelegten Sprachen gebaut und im Verzeichnis
    ``~/doc`` gebaut und danach installiert. Alle weiteren Sprachen
    (ausgenommen Englisch) werden ignoriert. Dazu ein Beispiel:

    .. code:: screen

        # make WEB_LANG="el_GR.ISO8859-7 es_ES.ISO8859-1 hu_HU.ISO8859-2 nl_NL.ISO8859-1" all install

.. raw:: html

   </div>

``WEB_ONLY``, ``ENGLISH_ONLY``, ``WEB_LANG`` sind Variablen f?r
`make(1) <http://www.FreeBSD.org/cgi/man.cgi?query=make&sektion=1>`__.
Diese werden entweder in ``/etc/make.conf``, in ``Makefile.inc`` oder
als Umgebungsvariablen auf der Kommandozeile oder in Ihrer
Konfigurationsdatei gesetzt.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------------------+------------------------------------+-----------------------------------+
| `Zur?ck <the-website-install.html>`__?              | `Nach oben <the-website.html>`__   | ?\ `Weiter <xml-primer.html>`__   |
+-----------------------------------------------------+------------------------------------+-----------------------------------+
| 6.2. Installieren der Webseiten auf Ihrem Server?   | `Zum Anfang <index.html>`__        | ?Kapitel 7. Die XML-Fibel         |
+-----------------------------------------------------+------------------------------------+-----------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
