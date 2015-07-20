=================================================================
Die Fibel f?r neue Mitarbeiter des FreeBSD-Dokumentationsprojekts
=================================================================

.. raw:: html

   <div class="navheader">

Die Fibel f?r neue Mitarbeiter des FreeBSD-Dokumentationsprojekts
?
?
?\ `Weiter <preface.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="book" lang="de" lang="de">

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

.. raw:: html

   <div class="author" xmlns="http://www.w3.org/1999/xhtml">

The FreeBSD Documentation Project
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div>

Version: ` <https://svnweb.freebsd.org/changeset/doc/>`__

.. raw:: html

   </div>

.. raw:: html

   <div>

Copyright ? 1998-2014 The FreeBSD Documentation Project

.. raw:: html

   </div>

.. raw:: html

   <div>

Copyright ? 1998-2015 The FreeBSD German Documentation Project

.. raw:: html

   </div>

.. raw:: html

   <div>

`Rechtlicher Hinweis <legalnotice.html>`__

.. raw:: html

   </div>

.. raw:: html

   <div>

Zuletzt bearbeitet am von .

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="abstract" xmlns="http://www.w3.org/1999/xhtml">

.. raw:: html

   <div class="abstract-title">

Zusammenfassung

.. raw:: html

   </div>

Vielen Dank f?r Ihr Interesse und Ihre Mitarbeit an der
FreeBSD-Dokumentation. Wir freuen uns ?ber jeden Beitrag.

Diese Fibel enth?lt die Informationen, die Sie f?r die Mitarbeit am
FreeBSD-Dokumentationsprojekt (auch als FDP bekannt) ben?tigen. Diese
reichen von verpflichtender und optionaler Software bis hin zur
Philosophie des FreeBSD-Dokumentationsprojekts.

Bitte beachten Sie, dass diese Fibel *jederzeit* unter Bearbeitung und
noch nicht vollst?ndig ist. Falls Sie einen Fehler finden, w?rden wir
uns freuen, wenn Sie uns dar?ber informieren.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="docformatnavi">

[ einzelne Abschnitte / `komplettes Dokument <book.html>`__ ]

.. raw:: html

   </div>

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Inhaltsverzeichnis

.. raw:: html

   </div>

`Benutzungshinweise <preface.html>`__
`1. Die Eingabeaufforderungen <preface.html#preface-prompts>`__
`2. Typographische Festlegungen <preface-conventions.html>`__
`3. Anmerkungen, Tipps, wichtige Hinweise, Warnungen und
Beispiel <preface-notes.html>`__
`4. Danksagungen <preface-acknowledgements.html>`__
`1. ?berblick <overview.html>`__
`1.1. Die FreeBSD-Dokumentationsreihe <overview.html#overview-doc>`__
`1.2. Schnellstart <overview-quick-start.html>`__
`2. Die Werkzeuge <tools.html>`__
`2.1. Verpflichtende Werkzeuge <tools.html#tools-required>`__
`2.2. Optionale Werkzeuge <tools-optional.html>`__
`3. Die Arbeitskopie <working-copy.html>`__
`3.1. Die Dokumentation und
Manualpages <working-copy.html#working-copy-doc-and-src>`__
`3.2. Einen Spiegelserver w?hlen <working-copy-choosing-mirror.html>`__
`3.3. Ein Verzeichnis f?r die Arbeitskopie
w?hlen <working-copy-choosing-directory.html>`__
`3.4. Die Arbeitskopie auschecken <working-copy-checking-out.html>`__
`3.5. Die Arbeitskopie aktualisieren <working-copy-updating.html>`__
`3.6. ?nderungen an der Arbeitskopie
zur?cknehmen <working-copy-revert.html>`__
`3.7. Eine Differenzdatei erstellen <working-copy-making-diff.html>`__
`3.8. Referenzen zu
Subversion <working-copy-subversion-references.html>`__
`4. Dokumentation-Verzeichnisstruktur <structure.html>`__
`4.1. ``doc/`` als h?chste Ebene <structure.html#structure-top>`__
`4.2. Die Verzeichnisse
``Sprache``.\ *``Kodierung``*/ <structure-locale.html>`__
`4.3. Dokumentenspezifische Informationen <structure-document.html>`__
`5. Die Erzeugung der Zieldokumente <doc-build.html>`__
`5.1. F?r den Bau der FreeBSD-Dokumentation ben?tigte
Werkzeuge <doc-build.html#doc-build-toolset>`__
`5.2. Die ``Makefile``\ s des Dokumentationsbaums
verstehen <doc-build-makefiles.html>`__
`5.3. make(1)-Includes des FreeBSD Documentation
Projects <make-includes.html>`__
`6. Die Webseite <the-website.html>`__
`6.1. Die Webseiten bauen <the-website.html#the-website-build>`__
`6.2. Installieren der Webseiten auf Ihrem
Server <the-website-install.html>`__
`6.3. Umgebungsvariablen <the-website-env.html>`__
`7. Die XML-Fibel <xml-primer.html>`__
`7.1. ?berblick <xml-primer.html#xml-primer-overview>`__
`7.2. Von Elementen, Tags und Attributen <xml-primer-elements.html>`__
`7.3. Die DOCTYPE-Deklaration <xml-primer-doctype-declaration.html>`__
`7.4. Die R?ckkehr zu SGML <xml-primer-xml-escape.html>`__
`7.5. Kommentare <xml-primer-comments.html>`__
`7.6. Entit?ten <xml-primer-entities.html>`__
`7.7. Dateien mit Entit?ten einbinden <xml-primer-include.html>`__
`7.8. Markierte Bereiche <xml-primer-marked-sections.html>`__
`7.9. Schlussbemerkung <xml-primer-conclusion.html>`__
`8. XHMTL Markup (noch nicht ?bersetzt) <xhtml-markup.html>`__
`9. DocBook Markup (noch nicht ?bersetzt) <docbook-markup.html>`__
`10. Stylesheets <stylesheets.html>`__
`10.1. DSSSL <stylesheets.html#stylesheets-dsssl>`__
`10.2. CSS <stylesheets-css.html>`__
`11. ?bersetzungen <translations.html>`__
`12. Der Schreibstil <writing-style.html>`__
`12.1. Anleitungen f?r einen korrekten
Schreibstil <writing-style.html#writing-style-guide>`__
`12.2. H?ufig verwendete W?rter <writing-style-word-list.html>`__
`13. Editor Configuration (noch nicht ?bersetzt) <editor-config.html>`__
`14. Weiterf?hrende Quellen <see-also.html>`__
`14.1. Das FreeBSD-Dokumentationsprojekt <see-also.html#see-also-fdp>`__
`14.2. XML <see-also-xml.html>`__
`14.3. HTML <see-also-html.html>`__
`14.4. DocBook <see-also-docbook.html>`__
`14.5. Das Linux-Dokumentationsprojekt <see-also-linuxdoc.html>`__
`A. Beispiele <examples.html>`__
`A.1. DocBook-Buch (``book``) <examples.html#examples-docbook-book>`__
`A.2. DocBook-Artikel (``article``) <examples-docbook-article.html>`__
`A.3. Ausgabeformate erzeugen <examples-formatted.html>`__
`Stichwortverzeichnis <ix01.html>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="list-of-examples">

.. raw:: html

   <div class="toc-title">

Liste der Beispiele

.. raw:: html

   </div>

1. `Ein Beispiel <preface-notes.html#idp63774032>`__
7.1. `Verwendung eines Elements (Start- und
Endtag) <xml-primer-elements.html#idp65008976>`__
7.2. `Verwendung eines Elements (nur
Starttag) <xml-primer-elements.html#idp65022288>`__
7.3. `Verschachtelte Elemente:
``em`` <xml-primer-elements.html#idp65027920>`__
7.4. `Elemente mit Attributen
nutzen <xml-primer-elements.html#idp65056720>`__
7.5. `Attribute mit einfachen
Anf?hrungszeichen <xml-primer-elements.html#idp65074640>`__
7.6. ```.profile``, f?r sh(1) und bash(1)
Benutzer <xml-primer-elements.html#xml-primer-envars>`__
7.7. ```.cshrc``, f?r csh(1)- und
tcsh(1)-Benutzer <xml-primer-elements.html#idp65100752>`__
7.8. `Beispiele f?r Kommentare in
SGML <xml-primer-comments.html#idp67661904>`__
7.9. `Fehlerhafte
SGML-Kommentare <xml-primer-comments.html#idp67665360>`__
7.10. `Allgemeine Entit?ten
festlegen <xml-primer-entities.html#idp67709264>`__
7.11. `Parameterentit?ten
festlegen <xml-primer-entities.html#idp67720912>`__
7.12. `Dateien mit Allgemeinen Entit?ten
einbinden <xml-primer-include.html#idp67750224>`__
7.13. `Dateien mit Parameterentit?ten
einbinden <xml-primer-include.html#idp67775824>`__
7.14. `Aufbau eines markierten
Bereiches <xml-primer-marked-sections.html#idp67815248>`__
7.15. `CDATA als Inhaltsmodell f?r markierte
Bereiche <xml-primer-marked-sections.html#idp67849168>`__
7.16. `Anwendung von ``INCLUDE`` und ``IGNORE`` in markierten
Abschnitten <xml-primer-marked-sections.html#idp67854672>`__
7.17. `Kontrolle von markierten Bereichen ?ber
Parameterentit?ten <xml-primer-marked-sections.html#idp67860816>`__
A.1. `Ein DocBook-Buch (``book``) <examples.html#idp68208720>`__
A.2. `Ein DocBook-Artikel
(``article``) <examples-docbook-article.html#idp68215760>`__
A.3. `Ein DocBook-Dokument in eine einzelne HTML-Datei
umwandeln <examples-formatted.html#idp68220368>`__
A.4. `Ein DocBook-Dokument in mehrere kleine HTML-Dateien
umwandeln <examples-formatted.html#idp68236240>`__
A.5. `Ein DocBook-Dokument nach Postscript
umwandeln <examples-formatted.html#examples-docbook-postscript>`__
A.6. `Eine PDF-Datei aus einem DocBook-Dokument
erzeugen <examples-formatted.html#idp68267600>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----+-----+--------------------------------+
| ?   | ?   | ?\ `Weiter <preface.html>`__   |
+-----+-----+--------------------------------+
| ?   | ?   | ?Benutzungshinweise            |
+-----+-----+--------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
