===========================
Kapitel 3. Die Arbeitskopie
===========================

.. raw:: html

   <div class="navheader">

Kapitel 3. Die Arbeitskopie
`Zur?ck <tools-optional.html>`__?
?
?\ `Weiter <working-copy-choosing-mirror.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="chapter">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Inhaltsverzeichnis

.. raw:: html

   </div>

`3.1. Die Dokumentation und
Manualpages <working-copy.html#working-copy-doc-and-src>`__
`3.2. Einen Spiegelserver w?hlen <working-copy-choosing-mirror.html>`__
`3.3. Ein Verzeichnis f?r die Arbeitskopie
w?hlen <working-copy-choosing-directory.html>`__
`3.4. Die Arbeitskopie auschecken <working-copy-checking-out.html>`__
`3.5. Die Arbeitskopie aktualisieren <working-copy-updating.html>`__
`3.6. ?nderungen an der Arbeitskopie
zur?cknehmen <working-copy-revert.html>`__
`3.7. Eine Differenzdatei erstellen <working-copy-making-diff.html>`__
`3.8. Referenzen zu
Subversion <working-copy-subversion-references.html>`__

.. raw:: html

   </div>

Die *Arbeitskopie* ist eine Kopie des FreeBSD
Dokumentationsrepositories, die Sie auf Ihren lokalen Computer
heruntergeladen haben. ?nderungen an der Dokumentation werden in der
Arbeitskopie durchgef?hrt und getestet. Patches f?r ?nderungen im
Hauptrepository werden aus der Arbeitskopie erzeugt, nachdem Sie Ihre
?nderungen durchgef?hrt haben.

Eine komplette Kopie des Dokumentationsbaums ist etwa 700 Megabyte gro?.
Damit Sie die Dokumentation auch in verschiedenen Formaten testen und
bauen k?nnen, sollten Sie f?r das Repository mindestens 1 Gigabyte an
freiem Speicherplatz bereitstellen.

Die Dateien der FreeBSD-Dokumentation werden mit
`Subversion <../../../../doc/de_DE.ISO8859-1/books/handbook/svn.html>`__
verwaltet. Falls es auf Ihrem System noch nicht vorhanden ist, wird
dieses Werkzeug vom Port
`textproc/docproj <http://www.freebsd.org/cgi/url.cgi?ports/textproc/docproj/pkg-descr>`__
automatisch installiert.

.. raw:: html

   <div class="sect1">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.1. Die Dokumentation und Manualpages
--------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die FreeBSD-Dokumentation besteht nicht nur aus B?chern und Artikeln.
Auch die Manualpages f?r alle Befehle und Konfigurationsdateien sind
Teil des FDP. Die Dokumentation ist dabei auf zwei Repositories
verteilt: ``doc`` f?r B?cher und Artikel sowie ``base`` f?r das
Betriebssystem und Manualpages. Um Manualpages zu bearbeiten, muss
zus?tzlich das Repository ``base`` ausgecheckt werden.

Ein Repository kann multiple Versionen der Dokumentatation enthalten.
?nderungen werden in der Regel aber immer nur an der aktuellen Version
durchgef?hrt, die als ``head`` bezeichnet wird.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------+-------------------------------+-----------------------------------------------------+
| `Zur?ck <tools-optional.html>`__?   | ?                             | ?\ `Weiter <working-copy-choosing-mirror.html>`__   |
+-------------------------------------+-------------------------------+-----------------------------------------------------+
| 2.2. Optionale Werkzeuge?           | `Zum Anfang <index.html>`__   | ?3.2. Einen Spiegelserver w?hlen                    |
+-------------------------------------+-------------------------------+-----------------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
