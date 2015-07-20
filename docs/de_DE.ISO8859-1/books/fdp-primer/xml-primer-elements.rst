=======================================
7.2. Von Elementen, Tags und Attributen
=======================================

.. raw:: html

   <div class="navheader">

7.2. Von Elementen, Tags und Attributen
`Zur?ck <xml-primer.html>`__?
Kapitel 7. Die XML-Fibel
?\ `Weiter <xml-primer-doctype-declaration.html>`__

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

7.2. Von Elementen, Tags und Attributen
---------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Alle in SGML geschriebenen DTDs haben bestimmte gemeinsame
Eigenschaften. Das ist nicht verwunderlich, da sich die hinter SGML
stehende Idee unweigerlich bemerkbar macht. Zwei der markantesten
Merkmale dieser Idee sind die Begriffe *Inhalt* und *Element*.

Von einem Dokument, unabh?ngig, ob es sich um eine einzelne Webseite
oder ein langes Buch handelt, wird angenommen, dass es einen wie auch
immer gearteten Inhalt hat. Dieser l?sst sich selbst wiederum in
Teilelemente aufspalten, die ebenso zerlegbar sind. Durch die Aufnahme
von Auszeichnungselementen in einen Text, werden diese einzelnen
Elemente eindeutig benannt und voneinander abgegrenzt.

Nimmt man zum Beispiel ein typisches Buch, so kann man es auf der
obersten Ebene als ein Ganzes, als ein Element betrachten. Dieses
„Buch“-Element enth?lt nun Kapitel, die wiederum selbst als Elemente
bezeichnet werden k?nnen. Jedes einzelne Kapitel enth?lt weitere
Elemente. So gibt es beispielsweise Abs?tze, Zitate und Fu?noten. Jeder
Absatz kann wiederum selbst Elemente enthalten, die helfen, den
Absatzinhalt als direkte Rede oder als Namen eines der Protagonisten
einer Geschichte zu identifizieren.

Wenn man m?chte, kann man sich das als
„Unterteilung“`:sup:`[3]` <#ftn.idp64979280>`__ des Inhalts vorstellen.
Auf der obersten Ebene gibt es ein Element: das Buch selbst. Schaut man
ein wenig tiefer, findet man weitere Teilelemente: die einzelnen
Kapitel. Diese sind wiederum unterteilt in Abs?tze, Fu?noten, Namen und
so weiter und so weiter.

Anzumerken ist an dieser Stelle, dass das eben gesagte ohne weiteres auf
jeden Inhaltstyp angewandt werden kann, auch ohne dass von SGML die Rede
ist. Man k?nnte beispielsweise einfach verschiedene Stifte nehmen und
einen Ausdruck dieser Fibel vor sich hinlegen und dann mit verschiedenen
Farben die einzelnen Abschnitte des Buchinhalts markieren.

Leider gibt es keinen elektronischen Stift, um das zu tun. Deshalb muss
ein anderer Weg gew?hlt werden, um zu bestimmen, zu welchem Element die
einzelnen Inhalte geh?ren. In SGML-basierten Auszeichnungssprachen wie
HTML und DocBook werden daf?r so genannte *Tags* eingesetzt.

Mit einem solchen Tag wird eindeutig festgelegt, wo ein bestimmtes
Element beginnt und wo es endet. *Allerdings geh?rt der Tag selber nicht
zum Element.* Er legt lediglich die Grenzen des Elements fest. Da jede
DTD mit dem Ziel entwickelt wurde, einen speziellen Inhaltstyp
auszuzeichnen, wird jede DTD verschiedene Elemente kennen, die daher
nat?rlich auch unterschiedlich benannt sein werden.

Der Starttag f?r ein imagin?res Element mit dem Namen *``elementname``*
ist ``<elementname``>. Sein Gegenst?ck, der schlie?ende Endtag, ist
``</elementname``>.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel 7.1. Verwendung eines Elements (Start- und Endtag)

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

HTML kennt das Element ``p``, um festzulegen, dass ein bestimmter
abgegrenzter Bereich einen Absatz darstellt. Dieses Element hat sowohl
einen Start- als auch einen Endtag.

.. code:: programlisting

    <p>Das ist ein Absatz. Er beginnt mit Starttag
      f?r das Element 'p' und endet mit dem Endtag f?r
      das Element 'p'.</p>

    <p>Das ist ein etwas k?rzerer Absatz.</p>

.. raw:: html

   </div>

.. raw:: html

   </div>

Elemente m?ssen nicht notwendigerweise einen Endtag haben. Ebenso ist es
nicht notwendig, dass Elemente einen Inhalt haben. Beispielsweise kann
in HTML-Dokumenten mittels eines speziellen Elements festgelegt werden,
dass eine horizontale Linie an einer bestimmten Stelle erscheinen soll.
Da dieses Element offensichtlich keinen Inhalt hat, wird auch kein
Endtag ben?tigt.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel 7.2. Verwendung eines Elements (nur Starttag)

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

In HTML kann man mit dem Element ``hr`` festlegen, dass an einer
bestimmten Stelle eine horizontale Linie angezeigt werden soll. Da
dieses Element keinen Inhalt umschlie?t, hat es nur einen Starttag.

.. code:: programlisting

    <p>Das ist ein Abschnitt.</p>

    <hr>

    <p>Das ist ein weiterer Absatz. Eine horizontale Linie
      trennt ihn vom vorherigen Absatz.</p>

.. raw:: html

   </div>

.. raw:: html

   </div>

Elemente k?nnen andere Elemente enthalten. Im anfangs erw?hnten Buch
enthielt das Buch-Element alle Kapitel-Elemente, die wiederum alle
Absatz-Elemente enthielten und so fort.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel 7.3. Verschachtelte Elemente: ``em``

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    <p>Das ist ein einfacher <em>Abschnitt</em>, in dem
      einige <em>Worte</em> <em>hervorgehoben</em> wurden.

.. raw:: html

   </div>

.. raw:: html

   </div>

Welche Elemente andere Elemente enthalten k?nnen und welche das sind,
wird innerhalb der DTD eines Dokuments festgelegt.

.. raw:: html

   <div class="important" xmlns="">

Wichtig:
~~~~~~~~

Viele Leute sind oft verwirrt, wenn es um die richtige Benutzung der
Begriffe Tag und Element geht. Im Ergebnis werden sie oft so genutzt,
als w?ren sie austauschbar. Allerdings sind sie das nicht.

Ein Element ist ein konzeptioneller Teil eines Dokuments und hat einen
festgelegten Anfang und ein festgelegtes Ende. Ein Tag hingegen markiert
die Stelle, an der ein Element beginnt und endet.

Wenn in diesem Dokument vom „Tag ``p``“ gesprochen wird, ist damit der
Text gemeint, der aus den drei Zeichen ``<``, ``p`` und ``>`` besteht.
Wird hingegen von dem „Element ``p``“ gesprochen, ist damit das gesamte
Element gemeint.

Diese Unterscheidung ist sicherlich subtil. Trotzdem sollte man sie sich
vergegenw?rtigen.

.. raw:: html

   </div>

Elemente k?nnen selber Attribute haben, die aus einem Namen und einem
Wert bestehen. Die Attribute haben die Aufgabe, dem Element zus?tzliche
Informationen hinzuzuf?gen. Denkbar sind hier Festlegungen ?ber die
Darstellung, Bezeichner, ?ber die das Element eindeutig identifiziert
werden kann, oder beliebige andere Informationen.

Elementattribute werden in den *Starttag* eingef?gt und haben die Form
``Attributename="Wert"``.

Bei einigen HTML-Versionen kennt das Element ``p`` das Attribut
``align``, mit dessen Hilfe die Textausrichtung eines Absatzes bestimmt
werden kann.

``align`` akzeptiert einen von vier vorgegebenen Werten: ``left``,
``center``, ``right`` und ``justify``. Ist ``align`` nicht angegeben,
wird vom Standardwert ``left`` ausgegangen.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel 7.4. Elemente mit Attributen nutzen

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    <p align="left">Die Verwendung des align-Attributs
      f?r diesen Absatz ist ?berfl?ssig, da left
      der Standardwert ist.</p>

    <p align="center">Dieser Absatz wird hoffentlich mittig dargestellt.</p>

.. raw:: html

   </div>

.. raw:: html

   </div>

Einige Attribute akzeptieren nur bestimmte Werte, wie beispielsweise
``left`` oder ``justify``. Andere akzeptieren jeden beliebigen Wert.
Enth?lt Attributwert doppelte Anf?hrungszeichen (``"``), wird der Wert
in einfachen Anf?hrungszeichen eingeschlossen.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel 7.5. Attribute mit einfachen Anf?hrungszeichen

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    <p align='right'>Ich stehe rechts!</p>

.. raw:: html

   </div>

.. raw:: html

   </div>

Manchmal k?nnen die Anf?hrungszeichen um den Attributwert weggelassen
werden. Allerdings sind die Regeln, die festlegen wann dies zul?ssig
ist, sehr spitzfindig. Am besten schlie?en Sie Attributwerte *immer* in
Anf?hrungszeichen ein.

Die Informationen ?ber Attribute, Elemente und Tags sind in
SGML-Katalogen abgelegt und werden von den verschiedenen Werkzeugen des
Dokumentationsprojektes genutzt, um die geschriebenen Dokumente zu
validieren. Die Programme die durch
`textproc/docproj <http://www.freebsd.org/cgi/url.cgi?ports/textproc/docproj/pkg-descr>`__
installiert werden, bringen ihre eigenen Katalogvarianten mit, zudem
pflegt das FDP seine eigenen Kataloge. Beide Katalogarten m?ssen von
allen Programmen gefunden werden k?nnen.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

7.2.1. Was daf?r getan werden muss;…
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Damit die Beispiele dieser Fibel ausgef?hrt werden k?nnen, ist es
notwendig, dass einige Programme auf dem Rechner installiert sind und
das eine Umgebungsvariable korrekt gesetzt wird.

.. raw:: html

   <div class="procedure">

#. Der erste Schritt ist die Installation des Ports
   `textproc/docproj <http://www.freebsd.org/cgi/url.cgi?ports/textproc/docproj/pkg-descr>`__
   ?ber das FreeBSD-Portsystem.
   `textproc/docproj <http://www.freebsd.org/cgi/url.cgi?ports/textproc/docproj/pkg-descr>`__
   ist ein *Metaport*, der alle vom FDP ben?tigten Programme und Daten
   aus dem Netz laden und installieren sollte.

#. Anschlie?end muss in den Shellkonfigurationsdateien die Variable
   ``SGML_CATALOG_FILES`` `:sup:`[4]` <#ftn.idp65075792>`__ gesetzt
   werden.

   .. raw:: html

      <div class="example">

   .. raw:: html

      <div class="example-title">

   Beispiel 7.6. ``.profile``, f?r
   `sh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sh&sektion=1>`__ und
   `bash(1) <http://www.FreeBSD.org/cgi/man.cgi?query=bash&sektion=1>`__
   Benutzer

   .. raw:: html

      </div>

   .. raw:: html

      <div class="example-contents">

   .. code:: programlisting

       SGML_ROOT=/usr/local/share/xml
       SGML_CATALOG_FILES=${SGML_ROOT}/jade/catalog
       SGML_CATALOG_FILES=${SGML_ROOT}/docbook/4.1/catalog:$SGML_CATALOG_FILES
       SGML_CATALOG_FILES=${SGML_ROOT}/html/catalog:$SGML_CATALOG_FILES
       SGML_CATALOG_FILES=${SGML_ROOT}/iso8879/catalog:$SGML_CATALOG_FILES
       SGML_CATALOG_FILES=/usr/doc/share/xml/catalog:$SGML_CATALOG_FILES
       SGML_CATALOG_FILES=/usr/doc/en_US.ISO8859-1/share/xml/catalog:$SGML_CATALOG_FILES
       export SGML_CATALOG_FILES

   .. raw:: html

      </div>

   .. raw:: html

      </div>

   | 

   .. raw:: html

      <div class="example">

   .. raw:: html

      <div class="example-title">

   Beispiel 7.7. ``.cshrc``, f?r
   `csh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=csh&sektion=1>`__-
   und
   `tcsh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tcsh&sektion=1>`__-Benutzer

   .. raw:: html

      </div>

   .. raw:: html

      <div class="example-contents">

   .. code:: programlisting

       setenv SGML_ROOT /usr/local/share/xml
       setenv SGML_CATALOG_FILES ${SGML_ROOT}/jade/catalog
       setenv SGML_CATALOG_FILES ${SGML_ROOT}/docbook/4.1/catalog:$SGML_CATALOG_FILES
       setenv SGML_CATALOG_FILES ${SGML_ROOT}/html/catalog:$SGML_CATALOG_FILES
       setenv SGML_CATALOG_FILES ${SGML_ROOT}/iso8879/catalog:$SGML_CATALOG_FILES
       setenv SGML_CATALOG_FILES /usr/doc/share/xml/catalog:$SGML_CATALOG_FILES
       setenv SGML_CATALOG_FILES /usr/doc/en_US.ISO8859-1/share/xml/catalog:$SGML_CATALOG_FILES
       setenv SGML_CATALOG_FILES /usr/doc/de_DE.ISO8859-1/share/xml/catalog:$SGML_CATALOG_FILES

   .. raw:: html

      </div>

   .. raw:: html

      </div>

   | 

   Damit die ?nderungen wirksam werden, meldet man sich ab und
   anschlie?end wieder an – oder man f?hrt die obigen Anweisungen direkt
   in der Shell aus und setzt so die ben?tigten Umgebungsvariablen.

.. raw:: html

   </div>

.. raw:: html

   <div class="procedure">

#. Nun sollte man eine Datei ``beispiel.xml`` anlegen, die den folgenden
   Text enth?lt:

   .. code:: programlisting

       <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

       <html>
         <head>
           <title>Eine Beispieldatei in HTML</title>
         </head>

         <body>
           <p>Das ist ein Absatz mit etwas Text.</p>

           <p>Das ist ein Absatz mit anderem Text.</p>

           <p align="right">Dieser Absatz wird rechtsb?ndig
             ausgerichtet.</p>
         </body>
       </html>

#. Nachdem die Datei abgespeichert wurde, kann sie mit Hilfe eines
   SGML-Parsers validiert werden.

   Bestandteil von
   `textproc/docproj <http://www.freebsd.org/cgi/url.cgi?ports/textproc/docproj/pkg-descr>`__
   ist ``onsgmls`` - ein `validierender
   Parser <xml-primer.html#xml-primer-validating>`__. ``onsgmls`` liest
   ein Dokument entsprechend einer SGML-DTD ein und gibt anschlie?end
   ein Element-Structure-Information-Set (ESIS) aus. Allerdings ist das
   an dieser Stelle nicht weiter wichtig.

   Wird ``onsgmls`` mit der Option ``-s`` aufgerufen, werden nur
   Fehlermeldungen ausgegeben. Dadurch kann leicht gepr?ft werden, ob
   ein Dokument g?ltig ist oder nicht.

   So pr?ft man mit ``onsgmls``, ob die neuangelegte Beispieldatei
   g?ltig ist:

   .. code:: screen

       % onsgmls -s beispiel.xml

   Sofern das Beispiel korrekt abgetippt wurde, wird sich ``onsgmls``
   ohne jegliche Ausgabe beenden. Das bedeutet, dass das Dokument
   erfolgreich validiert werden konnte und somit g?ltig ist.

#. Jetzt sollten die Tags ``title`` und ``/title`` aus dem Dokument
   gel?scht und das Dokument erneut validiert werden:

   .. code:: screen

       % onsgmls -s beispiel.xml
       onsgmls:beispiel.xml:5:4:E: character data is not allowed here
       onsgmls:beispiel.xml:6:8:E: end tag for "HEAD" which is not finished

   Die Fehlermeldungen, die von ``onsgmls`` ausgegeben werden, sind in
   durch Doppelpunkte getrennte Spalten unterteilt.

   .. raw:: html

      <div class="informaltable">

   Spalte
   Bedeutung
   1
   Der Name des Programms, das den Fehler meldet. Hier wird immer
   ``onsgmls`` stehen.
   2
   Der Name der fehlerhaften Datei.
   3
   Die Zeilennummer des Fehlers.
   4
   Die Spaltenummer des Fehlers.
   5
   Ein einbuchstabiger Code, der ?ber die Art des Fehlers informiert.
   ``I`` steht f?r eine informelle Meldung, ``W`` f?r eine Warnung und
   ``E`` f?r Fehler`:sup:`[a]` <#ftn.idp67503952>`__ und ``X`` f?r einen
   Querverweis. Bei den oben stehenden Ausgaben handelt es sich also um
   Fehlermeldungen.
   6
   Die Meldung.

   .. raw:: html

      <div id="ftn.idp67503952" class="footnote">

   `:sup:`[a]` <#idp67503952>`__\ Nicht immer besteht eine Meldung aus
   f?nf Spalten. Die Ausgabe von ``onsgmls -sv`` ist beispielsweise
   ``onsgmls:I: SP version                           "1.3"`` (nat?rlich
   abh?ngig von der Version). Wie man sehen kann, handelt es sich hier
   um eine informelle Meldung.

   .. raw:: html

      </div>

   .. raw:: html

      </div>

   Durch das Weglassen des Tags ``title`` sind zwei unterschiedliche
   Fehler entstanden.

   Der erste Fehler besagt, dass Inhalt (in diesem Falle Zeichen anstatt
   eines Starttags) an einer Stelle gefunden wurde, an der der Parser
   etwas anderes erwartet hat. Genauer gesagt wurde der Starttag eines
   Elements erwartet, das innerhalb von ``head`` auftreten kann.

   Der zweite Fehler wurde dadurch verursacht, dass das Element ``head``
   ein Element ``title`` enthalten *muss* und ``onsgmls`` nicht
   ber?cksichtigt, dass dieser Fehler auf dem vorhergehenden beruht. Es
   wird lediglich festgestellt, dass der Endtag von ``head`` auftritt,
   obwohl nicht alle notwendigen Elemente vorhanden sind.

#. Zum Schluss sollte der Tag ``title`` wieder in die Beispieldatei
   eingef?gt werden.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="footnotes">

--------------

.. raw:: html

   <div id="ftn.idp64979280" class="footnote">

`:sup:`[3]` <#idp64979280>`__\ Im angels?chsischen Sprachraum wird hier
von „chunking“ gesprochen.

.. raw:: html

   </div>

.. raw:: html

   <div id="ftn.idp65075792" class="footnote">

`:sup:`[4]` <#idp65075792>`__\ Sofern man nicht an der deutschen
Dokumentation arbeitet, m?ssen die Verzeichnisangaben entsprechend
angepasst werden.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------+-----------------------------------+-------------------------------------------------------+
| `Zur?ck <xml-primer.html>`__?   | `Nach oben <xml-primer.html>`__   | ?\ `Weiter <xml-primer-doctype-declaration.html>`__   |
+---------------------------------+-----------------------------------+-------------------------------------------------------+
| Kapitel 7. Die XML-Fibel?       | `Zum Anfang <index.html>`__       | ?7.3. Die DOCTYPE-Deklaration                         |
+---------------------------------+-----------------------------------+-------------------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
