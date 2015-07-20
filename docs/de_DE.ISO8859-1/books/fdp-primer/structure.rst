============================================
Kapitel 4. Dokumentation-Verzeichnisstruktur
============================================

.. raw:: html

   <div class="navheader">

Kapitel 4. Dokumentation-Verzeichnisstruktur
`Zur?ck <working-copy-subversion-references.html>`__?
?
?\ `Weiter <structure-locale.html>`__

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

   <div>

?bersetzt von Johann Kois.

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

`4.1. ``doc/`` als h?chste Ebene <structure.html#structure-top>`__
`4.2. Die Verzeichnisse
``Sprache``.\ *``Kodierung``*/ <structure-locale.html>`__
`4.3. Dokumentenspezifische Informationen <structure-document.html>`__

.. raw:: html

   </div>

Die Struktur der Dateien und Ordner unterhalb von ``doc/`` hilft dabei,

.. raw:: html

   <div class="orderedlist">

#. die automatische Konvertierung der Dokumente in andere Formate
   einfach zu gestalten,

#. die Konsistenz zwischen den verschiedenen auf diese Weise
   organisierten Dokumenten sicherzustellen, was die parallele
   Bearbeitung verschiedener Dokumente vereinfacht, sowie

#. die Entscheidung, wo neue Dokumente innerhalb des Baumes platziert
   werden sollen, leichter zu machen.

.. raw:: html

   </div>

Zus?tzlich wird dadurch dem Umstand Rechnung getragen, dass die
Dokumentation in verschiedenen Sprachen und Kodierungen vorhanden sein
kann. Es ist von gro?er Bedeutung, dass die Struktur des
Dokumentationsbaumes dabei dennoch einheitlich bleibt.

.. raw:: html

   <div class="sect1">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.1. ``doc/`` als h?chste Ebene
-------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Unterhalb von ``doc/`` existieren zwei Arten von Verzeichnissen, die
jeweils ?ber spezifische Dateinamen und eine spezifische Bedeutung
verf?gen.

.. raw:: html

   <div class="informaltable">

+-----------------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Verzeichnis                 | Bedeutung                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
+=============================+=================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================+
| ``share``                   | Enth?lt Dateien, die f?r alle Sprachen und Kodierungen der Dokumentation g?ltig sind. Es enth?lt weitere Unterverzeichnisse, um diese Informationen zu kategorisieren. So enth?lt ``share/mk`` beispielsweise die Dateien, die die `make(1) <http://www.FreeBSD.org/cgi/man.cgi?query=make&sektion=1>`__-Infrastruktur bilden, w?hrend sich die f?r die XML-Unterst?tzung n?tigen Dateien (darunter die FreeBSD DocBook DTD) unter ``share/xml`` befinden.                                                                      |
+-----------------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``lang``.\ *``encoding``*   | F?r jede verf?gbare Sprache und Kodierung existiert ein eigenes Unterverzeichnis. Beispiele daf?r sind ``en_US.ISO8859-1/`` oder ``zh_TW.UTF-8/``. Zwar sind diese Verzeichnisnamen nicht gerade kurz, durch die vollst?ndige Angabe von Sprache und Kodierung werden aber Probleme bei einer eventuellen Erweiterung der Dokumentation (etwa um eine zus?tzliche Kodierung f?r eine bereits vorhandene Sprache) vermieden. Auch eine eventuelle Konvertierung der Dokumentation nach Unicode ist dadurch problemlos m?glich.   |
+-----------------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------------------------+-------------------------------+----------------------------------------------------------+
| `Zur?ck <working-copy-subversion-references.html>`__?   | ?                             | ?\ `Weiter <structure-locale.html>`__                    |
+---------------------------------------------------------+-------------------------------+----------------------------------------------------------+
| 3.8. Referenzen zu Subversion?                          | `Zum Anfang <index.html>`__   | ?4.2. Die Verzeichnisse ``Sprache``.\ *``Kodierung``*/   |
+---------------------------------------------------------+-------------------------------+----------------------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
