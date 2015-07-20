========================
Kapitel 7. Die XML-Fibel
========================

.. raw:: html

   <div class="navheader">

Kapitel 7. Die XML-Fibel
`Zur?ck <the-website-env.html>`__?
?
?\ `Weiter <xml-primer-elements.html>`__

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

`7.1. ?berblick <xml-primer.html#xml-primer-overview>`__
`7.2. Von Elementen, Tags und Attributen <xml-primer-elements.html>`__
`7.3. Die DOCTYPE-Deklaration <xml-primer-doctype-declaration.html>`__
`7.4. Die R?ckkehr zu SGML <xml-primer-xml-escape.html>`__
`7.5. Kommentare <xml-primer-comments.html>`__
`7.6. Entit?ten <xml-primer-entities.html>`__
`7.7. Dateien mit Entit?ten einbinden <xml-primer-include.html>`__
`7.8. Markierte Bereiche <xml-primer-marked-sections.html>`__
`7.9. Schlussbemerkung <xml-primer-conclusion.html>`__

.. raw:: html

   </div>

Die Mehrzahl der Dokumente des FDPs sind in XML geschrieben. Ziel dieses
Kapitels ist es, genau zu erkl?ren, was das bedeutet und wie man die
XML-Quellen liest und versteht. Ebenso werden die in den Quellen
genutzten Kniffe erkl?rt, auf die man beim Lesen der Dokumente sto?en
wird.

Teile dieses Kapitels basieren auf Mark Galassis „`Get Going With
DocBook <http://www.galassi.org/mark/mydocs/docbook-intro/docbook-intro.html>`__“.

.. raw:: html

   <div class="sect1">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

7.1. ?berblick
--------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In den guten alten Zeiten war der Umgang mit „elektronischem“ Text
einfach. Man musste lediglich wissen, welcher Zeichensatz (ASCII, EBCDIC
oder ein anderer) vorlag. Text war einfach Text und sah so aus, wie man
ihn sah. Keine Extras, keine Formatierungen und kein sonstiger
Schnickschnack.

F?r viele Zwecke war dies allerdings nicht ausreichend. Von einem
maschinenlesbaren Text wird erwartet, dass er auch von Maschinen gelesen
und intelligent weiterverarbeitet werden kann. Einzelne Stellen sollen
hervorgehoben werden, andere sollen in ein Glossar aufgenommen werden
oder auf andere Textstellen verweisen. Dateinamen wiederum sollen in
einer „schreibmaschinen?hnlichen“ Schrift auf dem Bildschirm dargestellt
werden, der Ausdruck soll jedoch in „Schr?gschrift“ oder in einer
beliebigen anderen Darstellungsform erfolgen.

Anf?nglich gab es die Hoffnung, dass die K?nstliche Intelligenz (KI)
helfen w?rde, dieses Ziel zu erreichen. Computer sollte den Text lesen
und dazu in der Lage sein, selbstst?ndig wichtige Formulierungen,
Dateinamen, Benutzereingaben oder Beispiele zu erkennen. Leider verlief
die Entwicklung in diesem Bereich nicht wie gew?nscht und Computer
ben?tigen nach wie vor etwas Unterst?tzung, bevor sie Texte vern?nftig
verarbeiten k?nnen.

Genauer gesagt, man muss ihnen sagen, was was ist. Sehen wir uns
folgende Zeilen an:

.. raw:: html

   <div class="blockquote">

    L?schen Sie ``/tmp/foo`` mittels
    `rm(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rm&sektion=1>`__.

    .. code:: screen

        % rm /tmp/foo

.. raw:: html

   </div>

Es f?llt uns leicht, zu erkennen, was ein Dateiname, ein einzugebender
Befehl oder ein Verweis auf eine Hilfeseite ist. Das kann ein Computer,
der einen Text verarbeitet, nicht. Aus diesem Grund ist es notwendig,
Texte mit weiteren Informationen „auszuzeichnen“.

Der Begriff „Auszeichnung`:sup:`[1]` <#ftn.idp64943312>`__“ bedeutet,
dass sich der Wert eines Textes erh?ht, aber auch seine Kosten. Durch
Auszeichnungen wird einem Dokument zus?tzlicher Text hinzugef?gt, der
aber von dem eigentlichen Dokumenteninhalt auf eine bestimmte Art und
Weise unterschieden werden kann, so dass Programme die Auszeichnung
erkennen k?nnen und mittels dieser Informationen w?hrend der
Verarbeitung in der Lage sind, Entscheidungen zu treffen. Texteditoren
k?nnen diese Auszeichnungselemente vor dem Benutzer verbergen, um zu
vermeiden, dass er durch sie abgelenkt wird.

Die durch die Auszeichnungselemente im Textdokument zus?tzlich
abgelegten Informationen erh?hen den Wert des Dokuments. Allerdings muss
diese Arbeit in den meisten F?llen von einem Menschen getan werden –
w?ren Maschinen dazu f?hig, w?ren zus?tzliche Auszeichnungselemente
unn?tig. Der damit verbundene Aufwand *erh?ht die Kosten*, die durch die
Erstellung des Dokuments entstehen.

Das etwas weiter oben gegebene Beispiel sieht im Quelltext so aus:

.. code:: programlisting

    <para>L?schen Sie <filename>/tmp/foo</filename> mittels &man.rm.1;.</para>

    <screen>&prompt.user; <userinput>rm /tmp/foo</userinput></screen>

Die Auszeichnungselemente sind deutlich vom eigentlichen Inhalt zu
unterscheiden.

Die Einf?hrung von Auszeichnungselementen setzt voraus, dass festgelegt
wird, welche Bedeutung einzelne Elemente haben und wie diese
interpretiert werden. Sie brauchen daher eine Auszeichnungssprache, der
Sie folgen, wenn Sie eigene Dokumente verfassen.

Nat?rlich kann es keine universelle Auszeichnungssprache geben und eine
einzige mag nicht ausreichend f?r alle m?glichen Anwendungsf?lle sein.
Eine Sprache f?r technische Dokumente wird sich wahrscheinlich stark von
einer f?r Kochrezepte unterscheiden. Die universelle L?sung ist eine
Basissprache, mit deren Hilfe weitere Sprachen entwickelt werden k?nnen
– eine *Meta-Auszeichnungssprache* also.

Genau diese Anforderung wird von der Standard Generalized Markup
Language (SGML) erf?llt. Mit ihrer Hilfe wurden viele andere
Auszeichnungssprachen wie beispielsweise HTML und DocBook, welche beide
von FDP genutzt werden, entwickelt.

Die eigentliche Sprachdefinition erfolgt in einer
Dokumenten-Typ-Definition (DTD). Innerhalb dieser DTD werden die Namen
der einzelnen Elemente, deren m?gliche Reihenfolge und Verschachtelung
sowie weitere Informationen festgelegt.

Eine DTD ist eine *vollst?ndige* Definition aller m?glichen
Sprachelemente, ihrer Reihenfolge`:sup:`[2]` <#ftn.idp64960336>`__,
optionaler Elemente und so weiter und so weiter. Dank dieser recht
formalen Festlegung ist es m?glich, SGML-*Parser* zu entwickeln, die
sowohl ein Dokument als auch seine DTD einlesen und anhand dieser DTD
pr?fen k?nnen, ob das Dokument allen Anforderungen der DTD entspricht.
Dieser Vorgang wird allgemein als *Validierung des Dokuments*
bezeichnet.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Das Validieren eines SGML-Dokuments gegen eine DTD ?berpr?ft lediglich
die korrekte Syntax des Dokuments, dass hei?t, ob nur g?ltige
Auszeichnungselemente verwendet wurden und ihre Reihenfolge stimmt.
Dabei wird *nicht* gepr?ft, ob die Elemente der DTD *sinngem??* verwandt
wurden. Sollten beispielsweise alle Dateinamen als Funktionsnamen
ausgezeichnet worden sein, so w?rde der Parser keinen Fehler
signalisieren. Formaler ausgedr?ckt: Der Parser pr?ft die Syntax, aber
nicht die Semantik.

.. raw:: html

   </div>

Es ist anzunehmen, dass, wenn man selber vor hat Dokumentation f?r das
FDP zu schreiben, der gr??te Teil davon mit Hilfe von HTML oder DocBook
geschrieben werden wird. Aus diesem Grunde wird an dieser Stelle nicht
erkl?rt, wie eine DTD entwickelt wird.

.. raw:: html

   </div>

.. raw:: html

   <div class="footnotes">

--------------

.. raw:: html

   <div id="ftn.idp64943312" class="footnote">

`:sup:`[1]` <#idp64943312>`__\ Im angels?chsischen Sprachraum wird von
‚markup‘ gesprochen.

.. raw:: html

   </div>

.. raw:: html

   <div id="ftn.idp64960336" class="footnote">

`:sup:`[2]` <#idp64960336>`__\ Bei nat?rlichen Sprachen spricht man vom
Satzbau – demjenigen Konstrukt, das unter anderem die Position des
Subjekts, Objekts und Pr?dikats in einem Satz festlegt.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+-------------------------------+--------------------------------------------+
| `Zur?ck <the-website-env.html>`__?   | ?                             | ?\ `Weiter <xml-primer-elements.html>`__   |
+--------------------------------------+-------------------------------+--------------------------------------------+
| 6.3. Umgebungsvariablen?             | `Zum Anfang <index.html>`__   | ?7.2. Von Elementen, Tags und Attributen   |
+--------------------------------------+-------------------------------+--------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
