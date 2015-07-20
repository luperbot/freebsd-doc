=======================
7.8. Markierte Bereiche
=======================

.. raw:: html

   <div class="navheader">

7.8. Markierte Bereiche
`Zur?ck <xml-primer-include.html>`__?
Kapitel 7. Die XML-Fibel
?\ `Weiter <xml-primer-conclusion.html>`__

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

7.8. Markierte Bereiche
-----------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

SGML erlaubt es, dass bestimmte Dokumentabschnitte w?hrend der
Verarbeitung besonders behandelt werden sollen. Diese Abschnitte werden
als „markierte Bereiche“ `:sup:`[8]` <#ftn.idp67814224>`__ bezeichnet.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel 7.14. Aufbau eines markierten Bereiches

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    <![ SCHL?SSELWORT [
      Inhalt des markierten Bereiches
    ]]>

.. raw:: html

   </div>

.. raw:: html

   </div>

Da es sich bei markierten Bereichen um SGML-Konstrukte handelt, werden
sie mit ``<!`` eingeleitet. Der eigentliche Anfang des markierten
Bereiches wird von der folgenden eckigen Klammer bestimmt. Das darauf
folgende *``SCHL?SSELWORT``* legt fest, wie der „markierte Inhalt“ durch
einen SGML-Prozessor w?hrend der Verarbeitung behandelt werden soll. Der
„markierte“ Inhalt selbst beginnt erst nach der zweiten eckigen Klammer
und erstreckt sich bis zu den zwei schlie?enden eckigen Klammern am Ende
des Bereiches. Mit Hilfe des ``>`` Zeichens wird der mit ``<!``
begonnene SGML-Kontext wieder verlassen.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

7.8.1. Schl?sselworte f?r markierte Bereiche
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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

7.8.1.1. ``CDATA`` und ``RCDATA``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Schl?sselworte ``CDATA`` und ``RCDATA`` bestimmen das
*Inhaltsmodell* f?r markierte Bereiche. Dadurch ist es m?glich, vom
Standardmodell abzuweichen.

Ein SGML-Prozessor muss w?hrend der Verarbeitung eines Dokuments zu
jedem Zeitpunkt wissen, welches *Inhaltsmodell* gerade anzuwenden ist.

Was ist ein Inhaltsmodell? Kurz gesagt beschreibt das Inhaltsmodell,
welche Art von Inhalt der Parser zu erwarten und wie er damit umzugehen
hat.

Bei ``CDATA`` und ``RCDATA`` handelt es sich wahrscheinlich um die
n?tzlichsten Inhaltsmodelle. ``CDATA`` steht f?r
Zeichendaten`:sup:`[9]` <#ftn.idp67825744>`__. Trifft ein Parser auf
dieses Inhaltsmodell, wird er annehmen, dass sich im zugeh?rigen
Dokumentenbereich nur „gew?hnliche“ Zeichen befinden. Das bedeutet, dass
``<`` und ``&`` ihre besondere Bedeutung verlieren und als einfache
Zeichen behandelt werden.

``RCDATA`` steht f?r Entit?tenreferenzen und
Zeichendaten`:sup:`[10]` <#ftn.idp67832784>`__. F?r einen Bereich mit
diesem Inhaltsmodell, wird ein Parser davon ausgehen, dass er sowohl
Zeichen als auch Enit?tenreferenzen finden kann. ``<`` verliert hier
zwar auch seine besondere Bedeutung, doch ``&`` wird weiterhin als
Anfang einer Entit?t interpretiert.

N?tzlich ist das ``CDATA``-Modell vor allem dann, wenn es darum geht
Texte eins-zu-eins zu ?bernehmen, in denen ``<`` und ``&`` geh?uft
auftreten. Zwar kann man solche Texte ?berarbeiten und jedes ``<`` durch
ein ``&lt;`` und jedes ``&`` durch ein ``&amp;`` ersetzen, doch es wird
in den meisten F?llen einfacher sein, f?r den betreffenden Text
``CDATA`` als Inhaltsmodell festzulegen. Ein SGML-Parser wird dann,
sobald er auf ``<`` oder ``&`` trifft, diese als Zeichen in einem Text
betrachten.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Bei der Verwendung von ``CDATA`` und ``RCDATA`` als Inhaltsmodell f?r
SGML-Beispiele, wie sie in diesem Dokument enthalten sind, muss bedacht
werden, dass der Inhalt eines ``CDATA``-Bereiches nicht validiert wird.
dass das SGML in diesen Bereichen g?ltig ist, muss auf andere Weise
sichergestellt werden. Denkbar ist beispielsweise, es in einem separaten
Dokument zu erstellen, dort zu pr?fen und erst dann in das eigentliche
Dokument einzuf?gen.

.. raw:: html

   </div>

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel 7.15. CDATA als Inhaltsmodell f?r markierte Bereiche

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    <para>Das ist ein Beispiel, wie man einen Text,
      der viele &lt;- und &amp;-
      Entit?ten enth?lt, in ein Dokument einbinden kann.
      Das Beispiel selbst, das sich innerhalb des markierten Bereiches befindet,
      ist ein HTML-Fragment. Der diesen Text umschlie?ende Tag, beginnend mit
      mit para und endend mit /para, stammt aus der DocBook DTD.</para>

    <programlisting>
      <![RCDATA[  
        <p>Dieses Beispiel demonstriert die Verwendung von HTML-Elementen.
          Da spitze Klammern so oft vorkommen, ist es einfacher, das
          gesamte Beispiel als CDATA Abschnitt auszuweisen, als die
          entsprechenden Entit?ten zu nutzen.</p>

        <ul>
          <li>Das ist ein Listenelement.</li>
          <li>Das ist ein zweites Listenelement.</li>
          <li>Das ist ein drittes Listenelement.</li>
        </ul>

        <p>Und das hier, das ist das Ende des Beispiels.</p>
      ]]>
    </programlisting>

Liest man die Quellen dieser Fibel, wird man feststellen, dass diese
Technik durchg?ngig angewandt wurde.

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

7.8.1.2. ``INCLUDE`` und ``IGNORE``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das Schl?sselwort ``INCLUDE`` legt fest, dass der Inhalt des
betreffenden Abschnittes mitverarbeitet wird. Demgegen?ber bestimmt
``IGNORE``, dass er ignoriert wird, dass hei?t, dass er bei der
Verarbeitung ?bergangen wird und in der Ausgabe nicht enthalten ist.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel 7.16. Anwendung von ``INCLUDE`` und ``IGNORE`` in markierten
Abschnitten

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    <![ INCLUDE [
      Dieser Text wird verarbeitet und eingebunden.
    ]]>

    <![ IGNORE [
      Dieser Text wird weder verarbeitet noch eingebunden.
    ]]>

.. raw:: html

   </div>

.. raw:: html

   </div>

F?r sich alleine ist ``IGNORE`` als Anweisung nicht besonders n?tzlich,
da ein Bereich, der von der Verarbeitung ausgenommen sein soll, auch
auskommentiert werden kann.

Kombiniert man ``IGNORE`` hingegen mit
`Parameterentit?ten <xml-primer-entities.html#xml-primer-parameter-entities>`__,
steht so ein Weg zur Verf?gung, um dessen Anwendung besser steuern zu
k?nnen. Zwar k?nnen Parameterentit?ten nur in einem SGML-Kontext
einsetzt werden, da aber markierte Bereiche ebenfalls SGML-Konstrukte
sind, ist diese Einschr?nkung irrelevant.

Soll beispielsweise ein und dasselbe Dokument in zwei unterschiedlichen
Varianten produziert werden, einer gedruckten und einer digitalen, und
soll nur die digitale zus?tzliche Informationen enthalten, kann dies mit
einem Trick erreicht werden.

Man definiert eine Parameterentit?t, der man als Wert die Zeichenkette
``INCLUDE`` zuweist und deklariert den betreffenden Bereich, der nur in
der digitalen Variante erscheinen soll, als markierten Abschnitt und
setzt als Schl?sselwort die zuvor definierte Parameterentit?t ein.

Soll anstelle der digitalen die gedruckte Variante produziert werden,
muss lediglich der Entit?t ``IGNORE`` als Wert zugewiesen und das
Ursprungsdokument erneut durch den SGML-Prozessor geschickt werden.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel 7.17. Kontrolle von markierten Bereichen ?ber
Parameterentit?ten

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0//EN" [
    <!ENTITY % digitale.kopie "INCLUDE">
    ]]>

    ...

    <![ %digitale.kopie [
      Dieser Satz sollte nur in der digitalen Version enthalten sein.
    ]]>    

Bei der Produktion der gedruckten Variante muss der Wert der Entit?t
ge?ndert werden.

.. code:: programlisting

    <!ENTITY % digitale.kopie "IGNORE">

Bei der Verarbeitung wird als Schl?sselwort in beiden F?llen der von
``%digitale.kopie`` repr?sentierte Wert verwendet. Im ersten Fall wird
der Inhalt des markierten Bereichs mitverarbeitet, im zweiten Fall
nicht.

.. raw:: html

   </div>

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

7.8.2. Finger?bung…
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="procedure">

#. Legen Sie eine neue Datei ``abschnitt.xml`` an, die folgenden Inhalt
   hat:

   .. code:: programlisting

       <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0//EN" [
       <!ENTITY % text.ausgabe "INCLUDE">
       ]>

       <html>
         <head>
           <title>Ein Beispiel mit markierten Abschnitten</title>
         </head>

         <body>
           <p>Dieser Absatz <![CDATA[beinhaltet viele <
             Zeichen (< < < < <). Weshalb es einfacher ist,
             ihn als CDATA Bereich auszuweisen. ]]></p>

           <![ IGNORE [
           <p>Dieser Absatz wird NICHT in der Ausgabe enthalten sein.</p>
           ]]>

           <![ %text.ausgabe [
            <p>Dieser Absatz wird in Abh?ngigkeit von %text.ausgabe
              mitausgegeben.</p>
           ]]>
         </body>
       </html>

#. Normalisieren Sie den Inhalt dieser Datei mit Hilfe von ``osgmlnorm``
   und sehen Sie sich das Ergebnis an. Achten Sie dabei darauf, welche
   Abs?tze enthalten beziehungsweise nicht enthalten sind und was aus
   den ``CDATA``-Bereichen geworden ist.

#. ?ndern Sie die Definition von ``text.ausgabe`` so, dass es den Wert
   ``IGNORE`` zugewiesen bekommt. Verarbeiten Sie dann die Datei erneut
   mit ``osgmlnorm`` und vergleichen die Ausgabe mit der vom ersten
   ``osgmlnorm`` Lauf.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="footnotes">

--------------

.. raw:: html

   <div id="ftn.idp67814224" class="footnote">

`:sup:`[8]` <#idp67814224>`__\ auf Englisch *marked sections*

.. raw:: html

   </div>

.. raw:: html

   <div id="ftn.idp67825744" class="footnote">

`:sup:`[9]` <#idp67825744>`__\ auf Englisch *character data*

.. raw:: html

   </div>

.. raw:: html

   <div id="ftn.idp67832784" class="footnote">

`:sup:`[10]` <#idp67832784>`__\ auf Englisch *Entity references and
character data*

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------+-----------------------------------+----------------------------------------------+
| `Zur?ck <xml-primer-include.html>`__?   | `Nach oben <xml-primer.html>`__   | ?\ `Weiter <xml-primer-conclusion.html>`__   |
+-----------------------------------------+-----------------------------------+----------------------------------------------+
| 7.7. Dateien mit Entit?ten einbinden?   | `Zum Anfang <index.html>`__       | ?7.9. Schlussbemerkung                       |
+-----------------------------------------+-----------------------------------+----------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
