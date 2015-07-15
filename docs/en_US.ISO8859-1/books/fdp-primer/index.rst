=========================================================
FreeBSD Documentation Project Primer for New Contributors
=========================================================

.. raw:: html

   <div class="navheader">

FreeBSD Documentation Project Primer for New Contributors
?
?
?\ `Next <preface.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="book" lang="en" lang="en">

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

Revision: ` <https://svnweb.freebsd.org/changeset/doc/>`__

.. raw:: html

   </div>

.. raw:: html

   <div>

Copyright ? 1998-2014 DocEng

.. raw:: html

   </div>

.. raw:: html

   <div>

`Copyright <legalnotice.html>`__

.. raw:: html

   </div>

.. raw:: html

   <div>

Last modified on by .

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="abstract" xmlns="http://www.w3.org/1999/xhtml">

.. raw:: html

   <div class="abstract-title">

Abstract

.. raw:: html

   </div>

Thank you for becoming a part of the FreeBSD Documentation Project. Your
contribution is extremely valuable, and we appreciate it.

This primer covers details needed to start contributing to the FreeBSD
Documentation Project, or FDP, including tools, software, and the
philosophy behind the Documentation Project.

This is a work in progress. Corrections and additions are always
welcome.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="docformatnavi">

[ Split HTML / `Single HTML <book.html>`__ ]

.. raw:: html

   </div>

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Table of Contents

.. raw:: html

   </div>

`Preface <preface.html>`__
`1. Shell Prompts <preface.html#preface-prompts>`__
`2. Typographic Conventions <preface-conventions.html>`__
`3. Notes, Tips, Important Information, Warnings, and
Examples <preface-notes.html>`__
`4. Acknowledgments <preface-acknowledgements.html>`__
`1. Overview <overview.html>`__
`1.1. The FreeBSD Documentation Set <overview.html#overview-doc>`__
`1.2. Quick Start <overview-quick-start.html>`__
`2. Tools <tools.html>`__
`2.1. Required Tools <tools.html#tools-required>`__
`2.2. Optional Tools <tools-optional.html>`__
`3. The Working Copy <working-copy.html>`__
`3.1. Documentation and Manual
Pages <working-copy.html#working-copy-doc-and-src>`__
`3.2. Choosing a Mirror <working-copy-choosing-mirror.html>`__
`3.3. Choosing a Directory <working-copy-choosing-directory.html>`__
`3.4. Checking Out a Copy <working-copy-checking-out.html>`__
`3.5. Updating a Working Copy <working-copy-updating.html>`__
`3.6. Reverting Changes <working-copy-revert.html>`__
`3.7. Making a Diff <working-copy-making-diff.html>`__
`3.8. Subversion References <working-copy-subversion-references.html>`__
`4. Documentation Directory Structure <structure.html>`__
`4.1. The Top Level, ``doc/`` <structure.html#structure-top>`__
`4.2. The ``lang``.\ *``encoding``*/
Directories <structure-locale.html>`__
`4.3. Document-Specific Information <structure-document.html>`__
`5. The Documentation Build Process <doc-build.html>`__
`5.1. The FreeBSD Documentation Build
Toolset <doc-build.html#doc-build-toolset>`__
`5.2. Understanding ``Makefile``\ s in the Documentation
Tree <doc-build-makefiles.html>`__
`5.3. FreeBSD Documentation Project Make
Includes <make-includes.html>`__
`6. The Website <the-website.html>`__
`6.1. Build the Web Pages <the-website.html#the-website-build>`__
`6.2. Install the Web Pages <the-website-install.html>`__
`6.3. Environment Variables <the-website-env.html>`__
`7. XML Primer <xml-primer.html>`__
`7.1. Overview <xml-primer.html#xml-primer-overview>`__
`7.2. Elements, Tags, and Attributes <xml-primer-elements.html>`__
`7.3. The DOCTYPE Declaration <xml-primer-doctype-declaration.html>`__
`7.4. Escaping Back to XML <xml-primer-xml-escape.html>`__
`7.5. Comments <xml-primer-comments.html>`__
`7.6. Entities <xml-primer-entities.html>`__
`7.7. Using Entities to Include Files <xml-primer-include.html>`__
`7.8. Marked Sections <xml-primer-marked-sections.html>`__
`7.9. Conclusion <xml-primer-conclusion.html>`__
`8. XHTML Markup <xhtml-markup.html>`__
`8.1. Introduction <xhtml-markup.html#xhtml-markup-introduction>`__
`8.2. Formal Public Identifier (FPI) <xhtml-markup-fpi.html>`__
`8.3. Sectional Elements <xhtml-markup-sectional-elements.html>`__
`8.4. Block Elements <xhtml-markup-block-elements.html>`__
`8.5. In-line Elements <xhtml-markup-inline-elements.html>`__
`9. DocBook Markup <docbook-markup.html>`__
`9.1. Introduction <docbook-markup.html#docbook-markup-introduction>`__
`9.2. FreeBSD Extensions <docbook-markup-freebsd-extensions.html>`__
`9.3. Formal Public Identifier (FPI) <docbook-markup-fpi.html>`__
`9.4. Document Structure <docbook-markup-document-structure.html>`__
`9.5. Block Elements <docbook-markup-block-elements.html>`__
`9.6. In-line Elements <docbook-markup-inline-elements.html>`__
`9.7. Images <docbook-markup-images.html>`__
`9.8. Links <docbook-markup-links.html>`__
`10. Style Sheets <stylesheets.html>`__
`10.1. CSS <stylesheets.html#stylesheets-css>`__
`11. Translations <translations.html>`__
`12. Writing Style <writing-style.html>`__
`12.1. Tips <writing-style.html#writing-style-tips>`__
`12.2. Guidelines <writing-style-guidelines.html>`__
`12.3. Style Guide <writing-style-guide.html>`__
`12.4. Word List <writing-style-word-list.html>`__
`13. Editor Configuration <editor-config.html>`__
`13.1. Vim <editor-config.html#editor-config-vim>`__
`13.2. Emacs <editor-config-emacs.html>`__
`13.3. nano <editor-config-nano.html>`__
`14. See Also <see-also.html>`__
`14.1. The FreeBSD Documentation Project <see-also.html#see-also-fdp>`__
`14.2. XML <see-also-xml.html>`__
`14.3. HTML <see-also-html.html>`__
`14.4. DocBook <see-also-docbook.html>`__
`A. Examples <examples.html>`__
`A.1. DocBook ``book`` <examples.html#examples-docbook-book>`__
`A.2. DocBook ``article`` <examples-docbook-article.html>`__
`Index <ix01.html>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="list-of-examples">

.. raw:: html

   <div class="toc-title">

List of Examples

.. raw:: html

   </div>

1. `A Sample Example <preface-notes.html#idp63435344>`__
7.1. `Using an Element (Start and End
Tags) <xml-primer-elements.html#idp64630736>`__
7.2. `Using an Element Without
Content <xml-primer-elements.html#idp64680784>`__
7.3. `Elements Within Elements;
``em`` <xml-primer-elements.html#idp64700368>`__
7.4. `Using an Element with an
Attribute <xml-primer-elements.html#idp64751696>`__
7.5. `Single Quotes Around
Attributes <xml-primer-elements.html#idp64770000>`__
7.6. `XML Generic Comment <xml-primer-comments.html#idp67224656>`__
7.7. `Erroneous XML Comments <xml-primer-comments.html#idp67233488>`__
7.8. `Defining General
Entities <xml-primer-entities.html#idp67259088>`__
7.9. `Defining Parameter
Entities <xml-primer-entities.html#idp67275216>`__
7.10. `Using General Entities to Include
Files <xml-primer-include.html#idp67349072>`__
7.11. `Using Parameter Entities to Include
Files <xml-primer-include.html#idp67364560>`__
7.12. `Structure of a Marked
Section <xml-primer-marked-sections.html#idp67406160>`__
7.13. `Using a ``CDATA`` Marked
Section <xml-primer-marked-sections.html#idp67432912>`__
7.14. `Using ``INCLUDE`` and ``IGNORE`` in Marked
Sections <xml-primer-marked-sections.html#idp67450320>`__
7.15. `Using a Parameter Entity to Control a Marked
Section <xml-primer-marked-sections.html#idp67468368>`__
8.1. `Normal XHTML Document
Structure <xhtml-markup-sectional-elements.html#idp67504464>`__
8.2. ```h1``, ``h2``, and Other Header
Tags <xhtml-markup-block-elements.html#idp67522512>`__
8.3. ```p`` <xhtml-markup-block-elements.html#idp67536464>`__
8.4. ```blockquote`` <xhtml-markup-block-elements.html#idp67540304>`__
8.5. ```ul`` and
``ol`` <xhtml-markup-block-elements.html#idp67553872>`__
8.6. `Definition Lists with
``dl`` <xhtml-markup-block-elements.html#idp67569616>`__
8.7. ```pre`` <xhtml-markup-block-elements.html#idp67596112>`__
8.8. `Simple Use of
``table`` <xhtml-markup-block-elements.html#idp67608784>`__
8.9. `Using
``rowspan`` <xhtml-markup-block-elements.html#idp67624272>`__
8.10. `Using
``colspan`` <xhtml-markup-block-elements.html#idp67633232>`__
8.11. `Using ``rowspan`` and ``colspan``
Together <xhtml-markup-block-elements.html#idp67646288>`__
8.12. ```em`` and
``strong`` <xhtml-markup-inline-elements.html#idp67681616>`__
8.13. ```tt`` <xhtml-markup-inline-elements.html#idp67688528>`__
8.14. `Using
``<a href="...">`` <xhtml-markup-inline-elements.html#idp67696592>`__
8.15. `Creating an
Anchor <xhtml-markup-inline-elements.html#idp67704016>`__
8.16. `Linking to a Named Part of a Different
Document <xhtml-markup-inline-elements.html#idp67709008>`__
8.17. `Linking to a Named Part of the Same
Document <xhtml-markup-inline-elements.html#idp67715280>`__
9.1. `Boilerplate ``book`` with
``info`` <docbook-markup-document-structure.html#idp67864784>`__
9.2. `Boilerplate ``article`` with
``info`` <docbook-markup-document-structure.html#idp67895248>`__
9.3. `A Simple
Chapter <docbook-markup-document-structure.html#idp67921616>`__
9.4. `Empty
Chapters <docbook-markup-document-structure.html#idp67925328>`__
9.5. `Sections in
Chapters <docbook-markup-document-structure.html#idp67946064>`__
9.6. ```para`` <docbook-markup-block-elements.html#idp67991888>`__
9.7. ```blockquote`` <docbook-markup-block-elements.html#idp67996880>`__
9.8. ```tip`` and
``important`` <docbook-markup-block-elements.html#idp68021968>`__
9.9. ```example`` <docbook-markup-block-elements.html#idp68036048>`__
9.10. ` <docbook-markup-block-elements.html#idp68042064>`__
9.11. ```itemizedlist`` and
``orderedlist`` <docbook-markup-block-elements.html#idp68059344>`__
9.12.
```variablelist`` <docbook-markup-block-elements.html#docbook-markup-variablelist-example>`__
9.13. ```procedure`` <docbook-markup-block-elements.html#idp68105680>`__
9.14.
```programlisting`` <docbook-markup-block-elements.html#idp68142672>`__
9.15. ```co`` and
``calloutlist`` <docbook-markup-block-elements.html#idp68163280>`__
9.16.
```informaltable`` <docbook-markup-block-elements.html#idp68199760>`__
9.17. `Tables Where
``frame="none"`` <docbook-markup-block-elements.html#idp68228048>`__
9.18. ```screen``, ``prompt``, and
``userinput`` <docbook-markup-block-elements.html#idp68260432>`__
9.19. ```emphasis`` <docbook-markup-inline-elements.html#idp68284368>`__
9.20. `Acronyms <docbook-markup-inline-elements.html#idp68299984>`__
9.21. `Quotations <docbook-markup-inline-elements.html#idp68317776>`__
9.22. `Keys, Mouse Buttons, and
Combinations <docbook-markup-inline-elements.html#idp68334800>`__
9.23. `Applications, Commands, and
Options <docbook-markup-inline-elements.html#idp68383568>`__
9.24. ```filename`` <docbook-markup-inline-elements.html#idp68425168>`__
9.25. ```package``
Tag <docbook-markup-inline-elements.html#idp68451536>`__
9.26. ```systemitem`` and
Classes <docbook-markup-inline-elements.html#idp68481360>`__
9.27. ```email`` with a
Hyperlink <docbook-markup-inline-elements.html#idp68521808>`__
9.28. ```email`` Without a
Hyperlink <docbook-markup-inline-elements.html#idp68544208>`__
9.29. ```buildtarget`` and
``varname`` <docbook-markup-inline-elements.html#idp68560336>`__
9.30. ```literal`` <docbook-markup-inline-elements.html#idp68591184>`__
9.31.
```replaceable`` <docbook-markup-inline-elements.html#idp68598608>`__
9.32.
```guibutton`` <docbook-markup-inline-elements.html#idp68626384>`__
9.33.
```errorname`` <docbook-markup-inline-elements.html#idp68632656>`__
9.34. ```xml:id`` on Chapters and
Sections <docbook-markup-links.html#idp68749264>`__
9.35. ```anchor`` <docbook-markup-links.html#idp68760016>`__
9.36. `Using ``xref`` <docbook-markup-links.html#idp68765648>`__
9.37. `Using ``link`` <docbook-markup-links.html#idp68792912>`__
9.38. ```link`` to a FreeBSD Documentation Web
Page <docbook-markup-links.html#idp68806352>`__
9.39. ```link`` to a FreeBSD Web
Page <docbook-markup-links.html#idp68865488>`__
9.40. ```ulink`` to an External Web
Page <docbook-markup-links.html#idp68870480>`__
A.1. `DocBook ``book`` <examples.html#idp69292368>`__
A.2. `DocBook ``article`` <examples-docbook-article.html#idp69332304>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----+-----+------------------------------+
| ?   | ?   | ?\ `Next <preface.html>`__   |
+-----+-----+------------------------------+
| ?   | ?   | ?Preface                     |
+-----+-----+------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
