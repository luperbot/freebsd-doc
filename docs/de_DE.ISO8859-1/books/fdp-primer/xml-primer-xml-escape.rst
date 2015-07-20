=========================
7.4. Die R?ckkehr zu SGML
=========================

.. raw:: html

   <div class="navheader">

7.4. Die R?ckkehr zu SGML
`Zur?ck <xml-primer-doctype-declaration.html>`__?
Kapitel 7. Die XML-Fibel
?\ `Weiter <xml-primer-comments.html>`__

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

7.4. Die R?ckkehr zu SGML
-------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

An einer fr?heren Stelle wurde erw?hnt, dass man SGML nur ben?tigt,
falls man selbst eine DTD entwickeln m?chte. Genaugenommen ist das nicht
100%ig richtig. Einige Teile der SGML-Syntax k?nnen auch in normalen
Dokumenten verwendet werden, falls dies gew?nscht oder notwendig ist.

In diesem Falle muss daf?r Sorge getragen werden, dass ein
SGML-Prozessor feststellen kann, dass ein bestimmter Abschnitt des
Inhalts SGML ist, das er verarbeiteten muss.

Solche SGML-Abschnitte werden mittels ``<!?...?>`` in Dokumenten
besonders gekennzeichnet. Alles, was sich zwischen diesen Begrenzungen
befindet, ist SGML, wie es auch in DTDs gefunden werden kann.

Demnach ist die
`DOCTYPE-Deklaration <xml-primer-doctype-declaration.html>`__ ein gutes
Beispiel f?r SGML, das in Dokumenten verwendet werden muss…

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------------------+-----------------------------------+--------------------------------------------+
| `Zur?ck <xml-primer-doctype-declaration.html>`__?   | `Nach oben <xml-primer.html>`__   | ?\ `Weiter <xml-primer-comments.html>`__   |
+-----------------------------------------------------+-----------------------------------+--------------------------------------------+
| 7.3. Die DOCTYPE-Deklaration?                       | `Zum Anfang <index.html>`__       | ?7.5. Kommentare                           |
+-----------------------------------------------------+-----------------------------------+--------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
