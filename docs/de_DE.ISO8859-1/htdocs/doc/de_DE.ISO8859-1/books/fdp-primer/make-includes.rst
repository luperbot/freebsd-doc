========================================================
5.3. make(1)-Includes des FreeBSD Documentation Projects
========================================================

.. raw:: html

   <div class="navheader">

5.3. make(1)-Includes des FreeBSD Documentation Projects
`Zur?ck <doc-build-makefiles.html>`__?
Kapitel 5. Die Erzeugung der Zieldokumente
?\ `Weiter <the-website.html>`__

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

5.3. `make(1) <http://www.FreeBSD.org/cgi/man.cgi?query=make&sektion=1>`__-Includes des FreeBSD Documentation Projects
----------------------------------------------------------------------------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Diese Dateien lassen sich am besten verstehen, indem man sich deren
Inhalt n?her ansieht. Konkret handelt es sich dabei um folgende Dateien:

.. raw:: html

   <div class="itemizedlist">

-  ``doc.project.mk`` ist die Haupt-Include-Datei, die bei Bedarf alle
   folgenden Include-Dateien enth?lt.

-  ``doc.subdir.mk`` sorgt daf?r, dass alle ben?tigten Verzeichnisse
   (und Unterverzeichnisse) beim Bau der Dokumentation durchlaufen
   werden.

-  ``doc.install.mk`` definiert Variablen, die die Installation der
   Dokumentation beeinflussen.

-  ``doc.docbook.mk`` wird verwendet, wenn die Variable ``DOCFORMAT``
   den Wert ``docbook`` hat und die Variable ``DOC`` gesetzt ist.

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

5.3.1. ``doc.project.mk``
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Diese Datei hat folgenden Aufbau:

.. code:: programlisting

    DOCFORMAT?=    docbook
    MAINTAINER?=    doc@FreeBSD.org

    PREFIX?=    /usr/local
    PRI_LANG?=  en_US.ISO8859-1

    .if defined(DOC)
    .if ${DOCFORMAT} == "docbook"
    .include "doc.docbook.mk"
    .endif
    .endif

    .include "doc.subdir.mk"
    .include "doc.install.mk"

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.3.1.1. Variablen
^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``DOCFORMAT`` und ``MAINTAINER`` enthalten Standardwerte, falls ihnen
?ber das Dokument-Makefile keine anderen Werte zugewiesen werden.

Bei ``PREFIX`` handelt es sich um das Pr?fix, unter dem die zum Bau der
Dokumentation erforderlichen `SGML-Werkzeuge <tools.html>`__ installiert
sind. In der Regel handelt es sich dabei um ``/usr/local``.

``PRI_LANG`` sollte auf die Sprache und Kodierung eingestellt werden,
die unter den Leser der Dokumentation am h?ufigsten verwendet wird.
Diese Variable hat den Standardwert "US English".

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

``PRI_LANG`` beeinflusst nicht, welche Dokumente gebaut werden k?nnen
oder sollen. Diese Variable wird lediglich dazu verwendet, h?ufig
verwendete Dokumente in das Wurzelverzeichnis der installierten
Dokumentation zu verlinken.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.3.1.2. Bedingungen
^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Zeile ``.if defined(DOC)`` ist ein Beispiel f?r eine
`make(1) <http://www.FreeBSD.org/cgi/man.cgi?query=make&sektion=1>`__-Bedingung,
die (analog zum Einsatz in anderen Programmen) festlegt, was geschehen
soll, wenn eine Bedingung "wahr" oder "falsch" ist. ``defined`` ist eine
Funktion, die zur?ckgibt, ob die angegebene Variable existiert oder
nicht.

``.if ${DOCFORMAT} == "docbook"`` testet, ob die Variable ``DOCFORMAT``
den Wert ``"docbook"`` hat. Ist dies der Fall, wird ``doc.docbook.mk``
mit in den Bau aufgenommen.

Die zwei ``.endif``\ s schlie?en die zwei weiter oben definierten
Bedingungen.

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

5.3.2. ``doc.subdir.mk``
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Den Inhalt dieser Datei hier zu beschreiben, w?rde zu weit f?hren. Sie
sollten aber nach dem Lesen der vorangegangenen Abschnitte und der
folgenden Ausf?hrungen in der Lage sein, Inhalt und Aufgabe dieser Datei
zu verstehen.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.3.2.1. Variablen
^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="itemizedlist">

-  ``SUBDIR`` legt die Unterverzeichnisse fest, deren Inhalt beim Bau
   der Dokumentation inkludiert werden muss.

-  Mit ``ROOT_SYMLINKS`` wird der Name der Verzeichnisse angegeben, die
   von ihrer tats?chlichen Position aus in das Wurzelverzeichnis, unter
   dem die Dokumentation installiert wird, verlinkt werden sollen.
   Vorausgesetzt, bei der verwendeten Sprache handelt es sich um die
   prim?re Sprache (die ?ber ``PRI_LANG`` festgelegt wird).

-  ``COMPAT_SYMLINK`` wird im Abschnitt
   `Unterverzeichnis-Makefile <doc-build-makefiles.html#sub-make>`__\ s
   beschrieben.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.3.2.2. Targets und Makros
^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Abh?ngigkeiten (*Dependencies*) werden folgenderma?en definiert:
``target`` *``abhaengigkeit1 abhaengigkeit2 ...``*. Um ``target`` zu
bauen, m?ssen Sie zuvor die angegebenen Abh?ngigkeiten bauen.

Daran anschlie?end k?nnen Anweisungen zum Bau des angegebenen Targets
folgen, falls der Konvertierungsprozess zwischen dem Target und seinen
Abh?ngigkeiten nicht bereits fr?her definiert wurde oder falls die
Konvertierung nicht der Standardkonvertierungsmethode entspricht.

Die spezielle Abh?ngigkeit ``.USE`` definiert das ?quivalent eines
Makros.

.. code:: programlisting

    _SUBDIRUSE: .USE
    .for entry in ${SUBDIR}
        @${ECHO} "===> ${DIRPRFX}${entry}"
        @(cd ${.CURDIR}/${entry} && \
        ${MAKE} ${.TARGET:S/realpackage/package/:S/realinstall/install/} DIRPRFX=${DIRPRFX}${entry}/ )
    .endfor

In diesem Beispiel kann ``_SUBDIRUSE`` nun als Makro, welches die
angegebenen Befehle ausf?hrt, verwendet werden, indem es im Makefile als
Abh?ngigkeit angegeben wird.

Was unterscheidet dieses Makro nun von beliebigen anderen Targets? Der
Hauptunterschied ist, dass es *nach* den Anweisungen der Bauprozedur, in
der es als Abh?ngigkeit angegeben ist, ausgef?hrt wird. Au?erdem ?ndert
es die Variable ``.TARGET`` (die den Namen des aktuell gebauten Targets
enth?lt) nicht.

.. code:: programlisting

    clean: _SUBDIRUSE
        rm -f ${CLEANFILES}

In diesem Beispiel f?hrt ``clean`` das Makro ``_SUBDIRUSE`` aus, nachdem
es den Befehl ``rm -f ${CLEANFILES}`` erfolgreich ausgef?hrt hat.
Dadurch l?scht ``clean`` zwar beim Wechsel in ein neues
*Unterverzeichnis* beim Bau erstellte Dateien, aber nicht beim Wechsel
aus einem Unterverzeichnis in ein ?bergeordnetes Verzeichnis.

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.3.2.2.1. Vorhandene Targets
'''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="itemizedlist">

-  ``install`` und ``package`` arbeiten nacheinander alle
   Unterverzeichnisse ab und rufen dabei jeweils ihre realen Versionen
   (``realinstall`` beziehungsweise ``realpackage``) auf.

-  ``clean`` entfernt alle Dateien, die beim Bau der Dokumentation
   erzeugt wurden (dies sowohl im aktuellen Verzeichnis als auch in
   allen Unterverzeichnissen). ``cleandir`` hat die gleiche Aufgabe,
   w?rde aber zus?tzlich die Objekt-Verzeichnisse l?schen (falls diese
   existieren).

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.3.2.3. Weitere Bedingungen
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="itemizedlist">

-  ``exists`` gibt "wahr" zur?ck, wenn die angegebene Datei bereits
   existiert.

-  ``empty`` gibt "wahr" zur?ck, wenn die angegebene Variable leer ist.

-  ``target`` gibt "wahr" zur?ck, wenn das angegebene Target noch nicht
   existiert.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.3.2.4. Schleifenkonstrukte in ``make (.for)``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``.for`` erlaubt es, bestimmte Anweisungen f?r jedes Element einer
Variable zu wiederholen, indem dieser Variable in jedem Durchlauf der
Schleife das jeweilige Element der untersuchten Liste zugewiesen wird.

.. code:: programlisting

    _SUBDIRUSE: .USE
    .for entry in ${SUBDIR}
        @${ECHO} "===> ${DIRPRFX}${entry}"
        @(cd ${.CURDIR}/${entry} && \
        ${MAKE} ${.TARGET:S/realpackage/package/:S/realinstall/install/} DIRPRFX=${DIRPRFX}${entry}/ )
    .endfor

Falls das Verzeichnis ``SUBDIR`` leer ist, w?rde in unserem Beispiel
keine Aktion erfolgen. Enth?lt das Verzeichnis hingegen ein oder mehrere
Elemente, werden die Anweisungen zwischen ``.for`` und ``.endfor`` f?r
jedes Element ausgef?hrt, wobei ``entry`` durch das jeweilige Element
ersetzt werden w?rde.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------------------------------+----------------------------------+------------------------------------+
| `Zur?ck <doc-build-makefiles.html>`__?                        | `Nach oben <doc-build.html>`__   | ?\ `Weiter <the-website.html>`__   |
+---------------------------------------------------------------+----------------------------------+------------------------------------+
| 5.2. Die ``Makefile``\ s des Dokumentationsbaums verstehen?   | `Zum Anfang <index.html>`__      | ?Kapitel 6. Die Webseite           |
+---------------------------------------------------------------+----------------------------------+------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
