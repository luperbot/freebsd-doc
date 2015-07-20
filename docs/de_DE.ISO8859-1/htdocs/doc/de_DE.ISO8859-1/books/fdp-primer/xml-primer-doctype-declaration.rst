============================
7.3. Die DOCTYPE-Deklaration
============================

.. raw:: html

   <div class="navheader">

7.3. Die DOCTYPE-Deklaration
`Zur?ck <xml-primer-elements.html>`__?
Kapitel 7. Die XML-Fibel
?\ `Weiter <xml-primer-xml-escape.html>`__

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

7.3. Die DOCTYPE-Deklaration
----------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Am Anfang jedes Dokuments muss der Name der dem Dokument
zugrundeliegenden DTD angegeben werden. Mit Hilfe dieser Information
k?nnen SGML-Parser die verwendete DTD feststellen und pr?fen, ob das
Dokument zu ihr konform ist.

?blicherweise steht diese Information in einer Zeile, die als
DOCTYPE-Deklaration bezeichnet wird.

Eine Deklaration f?r ein HTML-Dokument, das nach den Vorgaben der DTD
f?r HTML 4.0 geschrieben wurde, sieht so aus:

.. code:: programlisting

    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0//EN">

und besteht aus verschiedenen Teilen.

.. raw:: html

   <div class="variablelist">

``<!``
    Die Zeichenkette ``<!`` dient hier als *Indikator*, dass es sich bei
    diesem Ausdruck um eine SGML-Deklaration handelt und diese Zeile den
    Dokumententyp festlegt.

``DOCTYPE``
    Zeigt an, dass dies die SGML-Deklaration f?r den Dokumententyp ist.

``html``
    Nennt das erste `Element <xml-primer-elements.html>`__, das im
    Dokument auftaucht.

``PUBLIC "-//W3C//DTD HTML 4.0//EN"``
    Nennt den Formalen ?ffentlichen Bezeichner
    `:sup:`[5]` <#ftn.idp67548624>`__ der DTD des Dokuments. Diese
    Information wird von SGML-Parsern ausgewertet, um die von dem
    Dokument referenzierte DTD zu bestimmen.

    Das Schl?sselwort ``PUBLIC`` geh?rt nicht zum ?ffentlichen
    Bezeichner, sondern legt fest, wie ein SGML-Parser die DTD finden
    kann. Alternative Wege eine DTD zu referenzieren werden `sp?ter
    gezeigt <xml-primer-doctype-declaration.html#xml-primer-fpi-alternatives>`__.

``>``
    Schlie?t den mit ``<!`` begonnenen Ausdruck ab.

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

7.3.1. Formale ?ffentliche Bezeichner
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Dieser Abschnitt braucht nicht unbedingt zu gelesen zu werden. Dennoch
ist es empfehlenswert, da er n?tzliche Hintergrundinformationen enth?lt,
die hilfreich sein k?nnen, falls der SGML-Prozessor die genutzte DTD
nicht finden kann.

.. raw:: html

   </div>

Jeder ?ffentliche Bezeichner muss eine bestimmte Syntax haben, die wie
folgt lautet:

.. code:: programlisting

    "Besitzer//Schl?sselwort Beschreibung//Sprache"

.. raw:: html

   <div class="variablelist">

*``Besitzer``*
    Nennt den Besitzer des ?ffentlichen Bezeichners.

    Falls diese Zeichenkette mit „ISO“ beginnt, geh?rt der Bezeichner
    dem ISO-Komitee. Der Bezeichner
    ``"ISO 8879:1986//ENTITIES Greek                 Symbols//EN"``
    nennt „ISO 8879:1986“ als den Besitzer des Satzes von Entit?ten f?r
    griechische Zeichen. ISO 8879:1986 ist die ISO-Bezeichnung f?r den
    SGML-Standard.

    Beginnt die Zeichenkette nicht mit „ISO“, sieht sie entweder so
    ``-//Besitzer`` oder so ``+//Besitzer`` aus. Beide Varianten
    unterscheiden sich also nur durch das anf?ngliche ``+`` bzw. ``-``.

    Sofern am Anfang ein ``-`` steht, ist der Bezeichner nicht
    ?ffentlich registriert, steht hingegen ein ``+`` am Anfang, ist er
    registriert.

    Im ISO-Standard ISO 9070:1991 wurde festgelegt, wie registrierte
    Namen erzeugt werden k?nnen. Unter anderem k?nnen sie von den
    Bezeichnungen von ISO-Publikationen, von ISBN-Nummern oder einer
    Organisationsbezeichnungen entsprechend ISO 6523 abgeleitet werden.
    Antr?ge f?r neue offiziell registrierte Bezeichner werden vom
    ISO-Komitee an das American National Standards Institute (ANSI)
    weitergeleitet.

    Da das FreeBSD-Projekt seine Bezeichner nicht hat registrieren
    lassen, ist der Besitzer ``-//FreeBSD``. Unter anderem kann man
    daran auch sehen, dass das W3C sich nicht hat registrieren lassen.

*``Schl?sselwort``*
    Es gibt verschiedene Schl?sselw?rter mit denen man die Art der
    gegebenen Informationen beschreiben kann. Einige der ?blichsten sind
    ``DTD``, ``ELEMENT``, ``ENTITIES`` und ``TEXT``. ``DTD`` wird nur
    f?r Dateien mit DTDs verwandt, ``ELEMENT`` findet f?r Dateien mit
    Fragmenten von DTDs Verwendung, die nur Deklarationen f?r Entit?ten
    und Elemente enthalten. ``TEXT`` wird f?r SGML-Inhalte (Texte und
    Tags) verwendet.

*``Beschreibung``*
    Eine frei w?hlbare Beschreibung des Inhalts der referenzierten
    Datei. M?glich sind hier Versionsnummern oder ein kurzer und
    sinnvoller Text, der innerhalb der SGML-Welt eindeutig ist.

*``Sprache``*
    Ein ISO-Code aus zwei Buchstaben, der die f?r die Datei verwendete
    Sprache nennt. ``EN`` steht hier f?r Englisch, ``DE`` f?r Deutsch.

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

7.3.1.1. Die ``catalog``-Dateien
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn man die oben beschriebene Syntax f?r Bezeichner verwendet und ein
Dokument durch einen SGML-Prozessor schickt, muss dieser die M?glichkeit
haben, den Bezeichner auf eine real existierende Datei abzubilden, die
die ben?tigte DTD enth?lt.

Einer der m?glichen Wege hierf?r sind Katalogdateien. Eine solche Datei,
die ?blicherweise ``catalog`` hei?t, besteht aus einzelnen Zeilen, die
Bezeichner auf Dateinamen abbilden. Enth?lt ein Katalog beispielsweise
die Zeile

.. code:: programlisting

    PUBLIC "-//W3C//DTD HTML 4.0//EN"             "4.0/strict.dtd"

kann ein SGML-Prozessor dar?ber feststellen, dass die ben?tigte DTD in
der Datei ``strict.dtd`` im Unterverzeichnis ``4.0`` des Verzeichnisses
des Katalogs zu finden ist.

Ein gutes Beispiel f?r einen Katalog ist
``/usr/local/share/xml/html/catalog``. Diese Datei enth?lt den Katalog
f?r alle HTML DTDs, die im Zuge der Installation von
`textproc/docproj <http://www.freebsd.org/cgi/url.cgi?ports/textproc/docproj/pkg-descr>`__
installiert wurden.

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

7.3.1.2. Die Variable ``SGML_CATALOG_FILES``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Nat?rlich muss einem SGML-Prozessor noch mitgeteilt werden k?nnen, wo er
seine Kataloge finden kann. Viele Programme bieten hierf?r
Kommandozeilenoptionen an, ?ber die man einen oder mehrere Kataloge
angeben kann.

Zus?tzlich besteht noch die M?glichkeit mit der Umgebungsvariablen
``SGML_CATALOG_FILES`` auf SGML-Kataloge zu verweisen. Die Eintr?ge von
``SGML_CATALOG_FILES`` m?ssen aus den vollst?ndigen Pfadnamen der
Kataloge, jeweils durch Komma getrennt, bestehen.

?blicherweise werden die folgenden Kataloge ?ber ``SGML_CATALOG_FILES``
f?r die Arbeit an den Dokumenten des FDPs eingebunden:

.. raw:: html

   <div class="itemizedlist">

-  ``/usr/local/share/xml/docbook/4.1/catalog``

-  ``/usr/local/share/xml/html/catalog``

-  ``/usr/local/share/xml/iso8879/catalog``

-  ``/usr/local/share/xml/jade/catalog``

.. raw:: html

   </div>

Allerdings sollte das `schon geschehen
sein <xml-primer-elements.html#xml-primer-envars>`__.

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

7.3.2. Alternativen zu Formalen ?ffentlichen Bezeichnern
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Anstatt mit einem Bezeichner die zum Dokument geh?rende DTD zu
referenzieren, kann auch explizit auf die Datei der DTD verwiesen
werden.

Die Syntax der DOCTYPE-Deklaration ist in diesem Falle anders:

.. code:: programlisting

    <!DOCTYPE html SYSTEM "/pfad/zur/dokumenten.dtd">

Das Schl?sselwort ``SYSTEM`` legt fest, dass ein SGML-Prozessor die DTD
auf „systemspezifische“ Art und Weise bestimmen soll. Meistens, aber
nicht immer, wird so auf eine Datei im Dateisystem verwiesen.

Allerdings sollte man ?ffentliche Bezeichner aus Gr?nden der
Portabilit?t bevorzugen, da man so nicht eine Kopie der DTD mit dem
Dokument selber verteilen muss, beziehungsweise da man, wenn man mit
``SYSTEM`` arbeitet, nicht davon ausgehen kann, dass die ben?tigte DTD
auf anderen Systemen genau unter dem gleichen Pfad verf?gbar ist.

.. raw:: html

   </div>

.. raw:: html

   <div class="footnotes">

--------------

.. raw:: html

   <div id="ftn.idp67548624" class="footnote">

`:sup:`[5]` <#idp67548624>`__\ auf Englisch *Formal Public Identifier
(FPI)*

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------------+-----------------------------------+----------------------------------------------+
| `Zur?ck <xml-primer-elements.html>`__?     | `Nach oben <xml-primer.html>`__   | ?\ `Weiter <xml-primer-xml-escape.html>`__   |
+--------------------------------------------+-----------------------------------+----------------------------------------------+
| 7.2. Von Elementen, Tags und Attributen?   | `Zum Anfang <index.html>`__       | ?7.4. Die R?ckkehr zu SGML                   |
+--------------------------------------------+-----------------------------------+----------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
