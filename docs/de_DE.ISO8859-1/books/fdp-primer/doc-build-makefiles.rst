====================================================
5.2. Die Makefiles des Dokumentationsbaums verstehen
====================================================

.. raw:: html

   <div class="navheader">

5.2. Die ``Makefile``\ s des Dokumentationsbaums verstehen
`Zur?ck <doc-build.html>`__?
Kapitel 5. Die Erzeugung der Zieldokumente
?\ `Weiter <make-includes.html>`__

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

5.2. Die ``Makefile``\ s des Dokumentationsbaums verstehen
----------------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Innerhalb des FreeBSD Documentation Projects gibt es drei verschiedene
Arten von ``Makefile``\ s:

.. raw:: html

   <div class="itemizedlist">

-  Ein ```Makefile`` <doc-build-makefiles.html#sub-make>`__ in einem
   Unterverzeichnis gibt Anweisungen an dessen Dateien und
   Unterverzeichnisse weiter.

-  Ein `Dokument-\ ``Makefile`` <doc-build-makefiles.html#doc-make>`__
   beschreibt das Dokument, das aus dem Inhalt des jeweiligen
   Verzeichnisses gebaut werden soll.

-  `Make-Includes <make-includes.html>`__ sind der "Klebstoff", der f?r
   den Bau der Dokumentation erforderlich ist. In der Regel heissen
   diese Dokumente ``doc.xxx``.mk.

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

5.2.1. Unterverzeichnis-\ ``Makefile``\ s
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Derartige ``Makefile``\ s sind in der Regel wie folgt aufgebaut:

.. code:: programlisting

    SUBDIR =articles
    SUBDIR+=books

    COMPAT_SYMLINK = en

    DOC_PREFIX?= ${.CURDIR}/..
    .include "${DOC_PREFIX}/share/mk/doc.project.mk"

Die ersten vier nicht-leeren Zeilen definieren die
`make(1) <http://www.FreeBSD.org/cgi/man.cgi?query=make&sektion=1>`__-Variablen
``SUBDIR``, ``COMPAT_SYMLINK``, und ``DOC_PREFIX``.

Die ``SUBDIR``-Anweisung weist (ebenso wie die
``COMPAT_SYMLINK``-Anweisung) einer Variable einen Wert zu und
?berschreibt dabei deren urspr?nglichen Wert.

Die zweite ``SUBDIR``-Anweisung zeigt, wie man den aktuellen Wert einer
Variable erg?nzen kann. Nach der Ausf?hrung dieser Anweisung hat die
Variable ``SUBDIR`` den Wert ``articles books``.

Die Anweisung ``DOC_PREFIX`` zeigt, wie man einer Variable einen Wert
zuweist (vorausgesetzt, die Variable ist nicht bereits definiert). Eine
derartige Anweisung ist beispielsweise sinnvoll, wenn sich
``DOC_PREFIX`` nicht dort befindet, wo es vom ``Makefile`` erwartet
wird. Durch das Setzen dieser Variable kann der korrekte Wert an das
Makefile ?bergeben werden.

Was hei?t dies nun konkret? Mit den ``SUBDIR``-Anweisungen legen Sie
fest, welche Unterverzeichnisse beim Bau der Dokumentation
eingeschlossen werden m?ssen.

``COMPAT_SYMLINK`` wird zur Erstellung von symbolischen Links zwischen
den jeweiligen Dokumentsprachen und deren offizieller Kodierung ben?tigt
(so wird beispielsweise ``doc/en`` nach ``en_US.ISO-8859-1`` verlinkt).

``DOC_PREFIX`` gibt den Pfad zum Wurzelverzeichnis des Quellcode-Baums
des FreeBSD Documentation Projects an. Diese Vorgabe kann jederzeit
durch einen eigenen Wert ersetzt werden. Bei ``.CURDIR`` handelt es sich
um eine in
`make(1) <http://www.FreeBSD.org/cgi/man.cgi?query=make&sektion=1>`__
eingebaute Variable, die den Pfad des aktuellen Verzeichnisses enth?lt.

Die letzte Zeile bindet ``doc.project.mk``, die zentrale, projektweite
`make(1) <http://www.FreeBSD.org/cgi/man.cgi?query=make&sektion=1>`__-Datei
des FreeBSD Documentation Projects, in den Bau ein. Diese Datei enth?lt
den "Klebstoff", der die diversen Variablen in Anweisungen zum Bau der
Dokumentation konvertiert.

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

5.2.2. Dokument-\ ``Makefile``\ s
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Diese ``Makefile``\ s definieren diverse make-Variablen mit Vorgaben zum
Bau der im Verzeichnis enthaltenen Dokumentation.

Dazu ein Beispiel:

.. code:: programlisting

    MAINTAINER=nik@FreeBSD.org

    DOC?= book

    FORMATS?= html-split html

    INSTALL_COMPRESSED?= gz
    INSTALL_ONLY_COMPRESSED?=

    # SGML content
    SRCS=  book.xml

    DOC_PREFIX?= ${.CURDIR}/../../..

    .include "$(DOC_PREFIX)/share/mk/docproj.docbook.mk"

Die Variable ``MAINTAINER`` ist von zentraler Bedeutung. Sie legt fest,
wer f?r ein bestimmtes Dokument des FreeBSD Documentation Projects
verantwortlich ist.

``DOC`` (ohne die Erweiterung ``.xml``) ist der Name des Hauptdokuments
des Verzeichnisses, in dem sich das Makefile befindet. Mit
``SRCS``-Anweisungen geben Sie alle Dokumente an, aus denen das Dokument
besteht. Zus?tzlich binden Sie damit wichtige Dateien ein, deren
?nderung einen erneuten Bau der Dokumentation erforderlich macht.

Mit ``FORMATS`` geben Sie an, in welchen Formaten die Dokumentation
gebaut werden soll. ``INSTALL_COMPRESSED`` enth?lt die Standardvorgaben,
die beim Bau komprimierter Pakte der Dokumentation verwendet werden
sollen. Der Variable ``INSTALL_ONLY_COMPRESS`` (die in der
Voreinstellung leer ist) wird nur dann ein Wert zugewiesen, wenn
ausschlie?lich komprimierte Pakete der Dokumentation erstellt werden
sollen.

Die Variable ``DOC_PREFIX`` und die verschiedenen Include-Anweisungen
sollten Ihnen ebenfalls bereits vertraut sein.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------------+----------------------------------+-------------------------------------------------------------+
| `Zur?ck <doc-build.html>`__?                  | `Nach oben <doc-build.html>`__   | ?\ `Weiter <make-includes.html>`__                          |
+-----------------------------------------------+----------------------------------+-------------------------------------------------------------+
| Kapitel 5. Die Erzeugung der Zieldokumente?   | `Zum Anfang <index.html>`__      | ?5.3. make(1)-Includes des FreeBSD Documentation Projects   |
+-----------------------------------------------+----------------------------------+-------------------------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
