===============
7.5. Kommentare
===============

.. raw:: html

   <div class="navheader">

7.5. Kommentare
`Zur?ck <xml-primer-xml-escape.html>`__?
Kapitel 7. Die XML-Fibel
?\ `Weiter <xml-primer-entities.html>`__

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

7.5. Kommentare
---------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Kommentare sind SGML-Konstrukte, die normalerweise nur in DTDs g?ltig
sind. Dennoch ist es, wie in `Abschnitt?7.4, „Die R?ckkehr zu
SGML“ <xml-primer-xml-escape.html>`__ gezeigt, m?glich Fragmente mit
SGML-Syntax in Dokumenten zu verwenden.

Zum Abgrenzen von SGML-Kommentaren wird ein doppelter Bindestrich
„``--``“ verwendet. Mit seinem ersten Auftreten ?ffnet er einen
Kommentar, mit seinem zweiten schlie?t er ihn wieder.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel 7.8. Beispiele f?r Kommentare in SGML

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    <!-- Testkommentar -->

.. code:: programlisting

    <!-- Text innerhalb eines Kommentars -->

    6lt;!-- Ein anderer Kommentar    -->

    6lt;!-- So k?nnen mehrzeilige Kommentare
         genutzt werden -->

    <!-- Eine andere M?glichkeit f?r --
      -- mehrzeilige Kommentare.     -->

.. raw:: html

   </div>

.. raw:: html

   </div>

Hat man fr?her schon Erfahrungen mit HTML gesammelt, wird man vielleicht
andere Regeln f?r den Gebrauch von Kommentaren kennengelernt haben.
Beispielsweise wird oft angenommen, dass Kommentare mit ``<!--``
begonnen und nur mit ``-->`` beendet werden.

Dies ist *nicht* der Fall. Viele Webbrowser haben fehlerhafte
HTML-Parser, die dies akzeptieren. Die SGML-Parser, die vom FDP
verwendet werden, halten sich strenger an die SGML-Spezifikation und
verwerfen Dokumente mit solchen Fehlern.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel 7.9. Fehlerhafte SGML-Kommentare

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    <!-- Innerhalb eines Kommentars --

         DIES IST NICHT TEIL EINES KOMMENTARS

      -- Wieder innerhalb eines Kommentars -->

SGML-Parser w?rden die mittlere Zeile wie folgt interpretieren:

.. code:: programlisting

    <!DIES IST NICHT TEIL EINES KOMMENTARS>

Da es sich hierbei nicht um g?ltiges SGML handelt, kann diese Zeile zur
verwirrenden Fehlermeldungen f?hren.

.. code:: programlisting

    <!----- Eine wirklich schlechte Idee  ----->

Wie das Beispiel zeigt, sollten solche Kommentare tunlichst vermieden
werden.

.. code:: programlisting

    <!--===================================================-->

Ein solcher Kommentar ist (ein wenig) besser, kann aber jemanden, der
mit SGML noch nicht so vertraut ist, verwirren.

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

7.5.1. Finger?bungen…
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="procedure">

#. Zur ?bung k?nnen Sie einige Kommentare in die Datei ``beispiel.xml``
   einf?gen und ?berpr?fen, ob die Datei nun noch erfolgreich von
   ``onsgmls`` validiert werden kann.

#. Zu Testzwecken sollten Sie auch noch ein paar fehlerhafte Kommentare
   hinzuf?gen und sich die resultierenden Fehlermeldungen von
   ``onsgmls`` ansehen.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------------+-----------------------------------+--------------------------------------------+
| `Zur?ck <xml-primer-xml-escape.html>`__?   | `Nach oben <xml-primer.html>`__   | ?\ `Weiter <xml-primer-entities.html>`__   |
+--------------------------------------------+-----------------------------------+--------------------------------------------+
| 7.4. Die R?ckkehr zu SGML?                 | `Zum Anfang <index.html>`__       | ?7.6. Entit?ten                            |
+--------------------------------------------+-----------------------------------+--------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
