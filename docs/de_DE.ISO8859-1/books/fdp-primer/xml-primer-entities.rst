==============
7.6. Entit?ten
==============

.. raw:: html

   <div class="navheader">

7.6. Entit?ten
`Zur?ck <xml-primer-comments.html>`__?
Kapitel 7. Die XML-Fibel
?\ `Weiter <xml-primer-include.html>`__

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

7.6. Entit?ten
--------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Entit?ten stellen einen Mechanismus dar, mit dem einzelnen
Dokumententeilen ein Name zugewiesen werden kann. Findet ein SGML-Parser
w?hrend des Parsens eine Entit?t, ersetzt er diese durch den ihr
zugewiesenen Inhalt.

Dadurch steht eine einfache M?glichkeit zur Verf?gung, mit der variabler
Inhalt in SGML-Dokumenten eingebunden werden kann. Zus?tzlich sind
Entit?ten der einzige Weg, ?ber den eine Datei in eine andere Datei mit
SGML-Mitteln eingebunden werden kann.

Es werden zwei Arten von Entit?ten unterschieden: *Allgemeine Entit?ten*
und *Parameterentit?ten*.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

7.6.1. Allgemeine Entit?ten
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Allgemeine Entit?ten k?nnen nur in Dokumenten benutzt werden. Sie k?nnen
zwar im SGML-Kontext definiert aber dort nicht benutzt werden.
Vergleichen Sie dies mit Im
`Parameterentit?ten <xml-primer-entities.html#xml-primer-parameter-entities>`__.

Jede allgemeine Entit?t hat einen Namen, ?ber den sie angesprochen
werden kann, um den von ihr referenzierten Inhalt in ein Dokument
einzubinden. Daf?r muss an der betreffenden Stelle der Namen der Entit?t
per ``&entitaetenname;`` einf?gt werden. Eine Entit?t
``current.version`` k?nnte beispielsweise durch die aktuelle
Versionsnummer eines Programms ersetzt werden. Man k?nnte also
schreiben:

.. code:: programlisting

    <para>Die aktuelle Version des
      Programms ist &current.version;.</para>

Wenn sich die Versionsnummer ?ndert, muss nur die Entit?t angepasst und
anschlie?end das Dokument neu erzeugt werden.

Eine weitere Einsatzm?glichkeit f?r Allgemeine Entit?ten ist das
Einbinden von Zeichen, die auf andere Weise nicht in ein SGML-Dokument
eingef?gt werden k?nnten. Ein Beispiel f?r solche Zeichen sind ``<`` und
``&``, die normalerweise nicht direkt in SGML-Dokumenten erlaubt sind.
St??t ein SGML-Parser bei seiner Arbeit auf das Symbol ``<``, nimmt er
an, dass der Anfang eines Start- oder Endtags gefunden wurde. Bei einem
``&`` wird er annehmen, den Anfang einer Entit?t gefunden zu haben.

Wenn eines der beiden Zeichen ben?tigt wird, werden daher die
allgemeinen Entit?ten ``&lt;`` und ``&amp;`` verwendet.

Allgemeine Entit?ten k?nnen nur in einem SGML-Kontext definiert werden.
?blich ist es, dies direkt nach der DOCTYPE-Deklaration zu tun:

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel 7.10. Allgemeine Entit?ten festlegen

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0//EN" [
    <!ENTITY current.version    "3.0-RELEASE">
    <!ENTITY last.version       "2.2.7-RELEASE">
    ]>

Wichtig ist an dieser Stelle, dass die DOCTYPE-Deklaration durch eine
eckige Klammer am Ende der ersten Zeile erweitert wurde. Die beiden
Entit?ten selber werden in den folgenden zwei Zeilen definiert, bevor in
der letzten Zeile die eckige Klammer und die DOCTYPE-Deklaration wieder
geschlossen werden.

Die eckigen Klammern sind notwendig um festzulegen, dass man die ?ber
DOCTYPE genannte DTD erweitern m?chte.

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

7.6.2. Parameterentit?ten
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Genau wie `Allgemeine
Entit?ten <xml-primer-entities.html#xml-primer-general-entities>`__
werden Parameterentit?ten eingesetzt um wiederverwendbare Inhaltsteile
mit Namen zu versehen. Im Gegensatz zu Allgemeinen Entit?ten k?nnen sie
aber nur innerhalb eines `SGML-Kontextes <xml-primer-xml-escape.html>`__
genutzt werden.

Die Definition von Parameterentit?ten erfolgt ?hnlich zu der Allgemeiner
Entit?ten. Sie werden lediglich mit ``%entitaetenname;`` anstelle von
``&entitaetenname;`` referenziert`:sup:`[6]` <#ftn.idp67666768>`__.
Wichtig ist, dass das ``%``-Zeichen zwischen ``ENTITY`` und dem
Entit?tennamen ein Teil der Definition ist.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel 7.11. Parameterentit?ten festlegen

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0//EN" [
    <!ENTITY % param.etwas "etwas">
    <!ENTITY % param.text "Text">
    <!ENTITY % param.neu  "%param.etwas mehr %param.text">
    ]>

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

7.6.3. Finger?bungen…
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="procedure">

#. F?gen Sie in ``beispiel.xml`` eine Allgemeine Entit?t ein.

   .. code:: programlisting

       <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" [
       <!ENTITY version "1.1">
       ]>

       <html>
         <head>
           <title>Eine HTML-Beispieldatei</title>
         </head>

         <body>
           <p>Das ist ein Absatz mit etwas Text.</p>

           <p>Das ist ein Absatz mit anderem Text.</p>

           <p align="right">Dieser Absatz wird rechtsb?ndig
             ausgerichtet.</p>

           <p>Die aktuelle Version ist: &amp;version;</p>
         </body>
       </html>

#. Validieren Sie diese Datei mit ``onsgmls``

#. ?ffnen Sie nun ``beispiel.xml`` mit Ihrem Webbrowser. Es kann
   notwendig sein, dass Sie die Datei vorher in ``beispiel.html``
   umbenennen m?ssen, damit die Datei auch als HTML-Dokument erkannt
   wird.

   Nur wenn Sie einen sehr modernen Browser haben, werden Sie sehen
   k?nnen, dass ``&version;`` durch die Versionsnummer ersetzt wurde.
   Leider haben die meisten Webbrowser sehr einfache SGML-Parser, die
   nicht richtig mit SGML umgehen
   k?nnen`:sup:`[7]` <#ftn.idp67675984>`__.

#. Die L?sung hierf?r ist, das Dokument zu *normalisieren*. Zu diesem
   Zweck liest ein Normer das Dokument ein und gibt anschlie?end
   semantisch gleichwertiges SGML wieder aus, dass auf verschiedene
   Arten transformiert worden sein kann. Eine dieser m?glichen
   Transformationen ist das Ersetzen der Referenzen auf Entit?ten mit
   dem von ihnen pr?sentierten Inhalt.

   Versuchen Sie, die Beispieldatei mittels ``osgmlnorm`` zu
   normalisieren:

   .. code:: screen

       % osgmlnorm beispiel.xml > beispiel.html

   Anschlie?end sollten Sie eine normalisierte Version, dass hei?t eine,
   bei der die Entit?ten gegen ihren Inhalt ersetzt wurden, in der Datei
   ``beispiel.html`` finden. Diese Datei k?nnen Sie sich nun mit Ihrem
   Browser ansehen.

#. Wenn Sie sich die Ausgaben von ``osgmlnorm`` ansehen, werden Sie
   feststellen, dass die DOCTYPE-Deklaration am Anfang der Datei nicht
   mehr enthalten ist. M?chten Sie die Deklaration behalten, muss
   ``osgmlnorm`` mit der Option ``-d`` aufrufen werden:

   .. code:: screen

       % osgmlnorm -d beispiel.xml > beispiel.html

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="footnotes">

--------------

.. raw:: html

   <div id="ftn.idp67666768" class="footnote">

`:sup:`[6]` <#idp67666768>`__\ Es wird das Prozentzeichen anstelle des
kaufm?nnischen Unds verwendet.

.. raw:: html

   </div>

.. raw:: html

   <div id="ftn.idp67675984" class="footnote">

`:sup:`[7]` <#idp67675984>`__\ Eigentlich ist das eine Schande. Man
stelle sich vor, welche Probleme und Hacks, wie beispielsweise Server
Side Includes, man an dieser Stelle h?tte vermeiden k?nnen.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------+-----------------------------------+-------------------------------------------+
| `Zur?ck <xml-primer-comments.html>`__?   | `Nach oben <xml-primer.html>`__   | ?\ `Weiter <xml-primer-include.html>`__   |
+------------------------------------------+-----------------------------------+-------------------------------------------+
| 7.5. Kommentare?                         | `Zum Anfang <index.html>`__       | ?7.7. Dateien mit Entit?ten einbinden     |
+------------------------------------------+-----------------------------------+-------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
