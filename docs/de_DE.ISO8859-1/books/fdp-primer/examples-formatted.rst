============================
A.3. Ausgabeformate erzeugen
============================

.. raw:: html

   <div class="navheader">

A.3. Ausgabeformate erzeugen
`Zur?ck <examples-docbook-article.html>`__?
Anhang A. Beispiele
?\ `Weiter <ix01.html>`__

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

A.3. Ausgabeformate erzeugen
----------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

F?r diesen Abschnitt wird vorausgesetzt, dass die im Port
`textproc/docproj <http://www.freebsd.org/cgi/url.cgi?ports/textproc/docproj/pkg-descr>`__
enthaltene Software manuell oder ?ber das Portssystem installiert wurde.
Weiter wird vorausgesetzt, dass alle Programme unterhalb des
Verzeichnisses ``/usr/local`` installiert worden sind und die
Verzeichnisse, die die ausf?hrbaren Programme enthalten, in der Variable
``PATH`` enthalten sind.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

A.3.1. Benutzung von Jade
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel A.3. Ein DocBook-Dokument in eine einzelne HTML-Datei umwandeln

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    % jade -V nochunks \  
    -c /usr/local/share/xml/docbook/dsssl/modular/catalog \ 
    -c /usr/local/share/xml/docbook/catalog \
    -c /usr/local/share/xml/jade/catalog \
    -d /usr/local/share/xml/docbook/dsssl/modular/html/docbook.dsl \
    -t sgml  datei.xml > datei.html 

.. raw:: html

   <div class="calloutlist">

+--------------------------------------+--------------------------------------+
| `|1| <#examples-co-jade-1-nochunks>` | ?bergibt den Parameter ``nochunks``  |
| __                                   | an die Stylesheets. Dadurch wird die |
|                                      | gesamte Ausgabe in die               |
|                                      | Standardausgabe geschrieben (bei der |
|                                      | Benutzung von Norm Walshs            |
|                                      | Stylesheets).                        |
+--------------------------------------+--------------------------------------+
| `|2| <#examples-co-jade-1-catalog>`_ | Legt die von Jade zur Verarbeitung   |
| _                                    | ben?tigten drei Kataloge fest. Der   |
|                                      | erste Katalog enth?lt Informationen  |
|                                      | zu den DSSSL-Stylesheets, der zweite |
|                                      | zur DocBook DTD und der dritte       |
|                                      | Jade-spezifische Informationen.      |
+--------------------------------------+--------------------------------------+
| `|3| <#examples-co-jade-1-dsssl>`__  | ?bergibt den vollen Pfad zum         |
|                                      | DSSSL-Stylesheet, das von Jade zur   |
|                                      | Verarbeitung des Dokuments benutzt   |
|                                      | wird.                                |
+--------------------------------------+--------------------------------------+
| `|4| <#examples-co-jade-1-transform> | Weist Jade an, eine *Transformation* |
| `__                                  | von einer DTD zu einer anderen DTD   |
|                                      | vorzunehmen. In diesem Falle, von    |
|                                      | der DocBook DTD zur HTML DTD.        |
+--------------------------------------+--------------------------------------+
| `|5| <#examples-co-jade-1-filename>` | Legt fest, welche Datei Jade         |
| __                                   | verarbeiten soll und leitet die      |
|                                      | Ausgabe in die Datei ``datei.html``  |
|                                      | um.                                  |
+--------------------------------------+--------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel A.4. Ein DocBook-Dokument in mehrere kleine HTML-Dateien
umwandeln

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    % jade \
    -c /usr/local/share/xml/docbook/dsssl/modular/catalog \ 
    -c /usr/local/share/xml/docbook/catalog \
    -c /usr/local/share/xml/jade/catalog \
    -d /usr/local/share/xml/docbook/dsssl/modular/html/docbook.dsl \
    -t sgml  datei.xml 

.. raw:: html

   <div class="calloutlist">

+--------------------------------------+--------------------------------------+
| `|1| <#examples-co-jade-2-catalog>`_ | Legt die von Jade zur Verarbeitung   |
| _                                    | ben?tigten drei Kataloge fest. Der   |
|                                      | erste Katalog enth?lt Informationen  |
|                                      | zu den DSSSL-Stylesheets, der zweite |
|                                      | zur DocBook DTD und der dritte       |
|                                      | Jade-spezifische Informationen.      |
+--------------------------------------+--------------------------------------+
| `|2| <#examples-co-jade-2-dsssl>`__  | ?bergibt den vollen Pfad zum         |
|                                      | DSSSL-Stylesheet, das von Jade zur   |
|                                      | Verarbeitung des Dokuments benutzt   |
|                                      | wird.                                |
+--------------------------------------+--------------------------------------+
| `|3| <#examples-co-jade-2-transform> | Weist Jade an, eine *Transformation* |
| `__                                  | von einer DTD zu einer anderen DTD   |
|                                      | vorzunehmen. In diesem Falle, von    |
|                                      | der DocBook DTD zur HTML DTD.        |
+--------------------------------------+--------------------------------------+
| `|4| <#examples-co-jade-2-filename>` | Legt die zu verarbeitende Datei      |
| __                                   | fest. Die Stylesheets ermitteln      |
|                                      | eigenst?ndig die Namen aller         |
|                                      | HTML-Ausgabedateien.                 |
+--------------------------------------+--------------------------------------+

.. raw:: html

   </div>

Abh?ngig von der Struktur des zu verarbeitenden Dokumentes und den
Stylesheetregeln zur Aufteilung des Dokumentes, kann dieser Befehl auch
nur eine einzelne HTML-Datei erzeugen.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel A.5. Ein DocBook-Dokument nach Postscript umwandeln

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Um eine Postscript-Ausgabe zu erzeugen, muss zuerst die XML-Quelle in
eine TeX-Datei umgewandelt werden.

.. code:: screen

    % jade -V tex-backend \ 
        -c /usr/local/share/xml/docbook/dsssl/modular/catalog \ 
        -c /usr/local/share/xml/docbook/catalog \
        -c /usr/local/share/xml/jade/catalog \
        -d /usr/local/share/xml/docbook/dsssl/modular/print/docbook.dsl \
        -t tex  datei.xml

.. raw:: html

   <div class="calloutlist">

+--------------------------------------+--------------------------------------+
| `|1| <#examples-co-jade-3-tex-backen | Weist die Stylesheets an,            |
| d>`__                                | verschiedene TeX-spezifische         |
|                                      | Optionen zu benutzen.                |
+--------------------------------------+--------------------------------------+
| `|2| <#examples-co-jade-3-catalog>`_ | Legt die von Jade zur Verarbeitung   |
| _                                    | ben?tigten drei Kataloge fest. Der   |
|                                      | erste Katalog enth?lt Informationen  |
|                                      | zu den DSSSL-Stylesheets, der zweite |
|                                      | zur DocBook DTD und der dritte       |
|                                      | Jade-spezifische Informationen.      |
+--------------------------------------+--------------------------------------+
| `|3| <#examples-co-jade-3-dsssl>`__  | ?bergibt den vollen Pfad zum         |
|                                      | DSSSL-Stylesheet, das von Jade zur   |
|                                      | Verarbeitung des Dokuments benutzt   |
|                                      | wird.                                |
+--------------------------------------+--------------------------------------+
| `|4| <#examples-co-jade-3-tex>`__    | Weist Jade an, die Ausgabe in eine   |
|                                      | TeX-Datei umzuwandeln.               |
+--------------------------------------+--------------------------------------+

.. raw:: html

   </div>

Die so erzeugte ``.tex``-Datei muss anschlie?end mittels ``tex``, unter
Angabe des Makropakets ``&jadetex`` weiterverarbeitet werden.

.. code:: screen

    % tex "&jadetex" datei.tex

``tex`` muss *mindestens* dreimal ausgef?hrt werden. Der erste Lauf
ermittelt die die Querverweise innerhalb des Dokumentes, die f?r
Stichwortverzeichnisse und ?hnliches ben?tigt werden.

Warnungen, wie LaTeX Warning: Reference \`136' on page 5 undefined on
input line 728., die zu diesem Zeitpunkt ausgegeben werden, k?nnen ohne
weiteres ignoriert werden.

Der zweite Lauf kann jetzt, da mehr Informationen, wie zum Beispiel die
Seitenl?ngen, zur Verf?gung stehen, Eintr?ge im Stichwortverzeichnis und
Querverweise genauer bestimmen.

Der dritte Lauf ist f?r abschlie?ende Aufr?umarbeiten notwendig. Die so
von ``tex`` erzeugte Ausgabe befindet sich anschlie?end in der Datei
``datei.div``.

Zum Schluss muss noch ``dvips`` aufgerufen werden, um die ``.div``-Datei
in ein Postscript-Dokument umzuwandeln.

.. code:: screen

    % dvips -o datei.ps datei.dvi

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel A.6. Eine PDF-Datei aus einem DocBook-Dokument erzeugen

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Die ersten Schritte, um ein DocBook-Dokument in ein PDF umzuwandeln,
stimmen mit denen ?berein, die notwendig sind, um eine
Postscript-Ausgabe zu erzeugen (`Beispiel?A.5, „Ein DocBook-Dokument
nach Postscript
umwandeln“ <examples-formatted.html#examples-docbook-postscript>`__).

Nachdem die ``.tex``-Datei durch Jade erzeugt wurde, muss pdfTeX
stattdessen mit dem Makropaket ``&pdfjadetex`` aufgerufen werden.

.. code:: screen

    % pdftex "&pdfjadetex" datei.tex

Dieser Befehl muss ebenfalls dreimal ausgef?hrt werden. Am Ende liegt
mit ``datei.pdf`` das fertige PDF-Dokument vor. Weitere Schritte sind
jetzt nicht mehr notwendig.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------------+---------------------------------+-----------------------------+
| `Zur?ck <examples-docbook-article.html>`__?   | `Nach oben <examples.html>`__   | ?\ `Weiter <ix01.html>`__   |
+-----------------------------------------------+---------------------------------+-----------------------------+
| A.2. DocBook-Artikel (``article``)?           | `Zum Anfang <index.html>`__     | ?Stichwortverzeichnis       |
+-----------------------------------------------+---------------------------------+-----------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.

.. |1| image:: ./imagelib/callouts/1.png
.. |2| image:: ./imagelib/callouts/2.png
.. |3| image:: ./imagelib/callouts/3.png
.. |4| image:: ./imagelib/callouts/4.png
.. |5| image:: ./imagelib/callouts/5.png
