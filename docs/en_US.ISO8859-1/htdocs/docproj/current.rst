===============================================
FreeBSD Documentation Project: Current projects
===============================================

.. raw:: html

   <div id="containerwrap">

.. raw:: html

   <div id="container">

.. raw:: html

   <div id="content">

.. raw:: html

   <div id="sidewrap">

.. raw:: html

   <div id="sidenav">

Section Navigation
------------------

-  `Documentation <../docs.html>`__
-  `FAQ <../doc/en_US.ISO8859-1/books/faq/>`__
-  `Handbook <../doc/en_US.ISO8859-1/books/handbook/>`__
-  `Manual Pages <//www.FreeBSD.org/cgi/man.cgi>`__
-  `Books and Articles Online <../docs/books.html>`__
-  `Publications <../publish.html>`__
-  `Web Resources <../docs/webresources.html>`__
-  `For Newbies <../projects/newbies.html>`__
-  `Documentation Project <../docproj/>`__
-  `Archive <https://docs.freebsd.org/doc/>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div id="contentwrap">

FreeBSD Documentation Project: Current projects
===============================================

Here are the projects currently under way (or being actively
contemplated on the freebsd-doc mailing list).

If you think you can contribute to any of these, please do not hesitate
to stand up and be counted. You should talk to the person responsible
for that particular project, who can then bring you up to speed on what
is happening. If you have any ideas for a new project then please email
FreeBSD-doc@FreeBSD.org.

-  `Documentation TODO list <#todo>`__
-  `Open documentation problem reports <#pr>`__
-  `Improve Handbook Index <#handbook-index>`__
-  `Contribute Advocacy Slides/Presentations <#slides>`__
-  `Write a section in the Handbook and/or FAQ <#handbooksection>`__
-  `Write some new Papers <#newpapers>`__
-  `CGI Scripts <#cgiscripts>`__
-  `Multilingual Web scripts <#multilingualwebscripts>`__
-  `Translations of the FreeBSD Documentation <#translations>`__

Documentation TODO list
~~~~~~~~~~~~~~~~~~~~~~~

The Documentation `TODO <https://wiki.freebsd.org/DocIdeaList>`__ list
is an up-to-date list of documentation issues that should be resolved.
If you wish to help us to improve the FreeBSD documentation set you
should, at first, choose to work on one of the TODO list items.

Open documentation problem reports
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Current FreeBSD problems reports are tracked using a Problem Reports
database. You can
`view <https://bugs.freebsd.org/bugzilla/buglist.cgi?product=Documentation&component=Documentation&resolution=--->`__
the open documentation problem reports.

Improve Handbook Index
~~~~~~~~~~~~~~~~~~~~~~

**Responsible:** FreeBSD-doc <FreeBSD-doc@FreeBSD.org\ >

**Synopsis:** Many new sections have been added to the FreeBSD Handbook
without index terms, others have been added under inappropriate primary
or secondary indexterms that do not fit the existing scheme. Some
indexterms have been added inside list items or other areas where they
are not allowed by our stylesheets, causing ``???`` to be printed in the
index instead of a real page number.

Index work requires experience and anyone who works on this task is
highly encouraged to carefully read through the existing (print-output)
index, and to have read the Chicago Manual of Style or other style books
that deal with indexing. Please see the CVS history of some of the
chapter.xml files to see some of the indexing errors that have been
corrected in the past. It is imperative to view the PostScript version
of the Handbook after making any changes to indexterms as many errors,
such as long words or deeply nested indexterms will break the two column
output there, or cause the page number to be listed as ``???``.

There is a script ``doc/share/misc/indexreport.pl`` which can be used to
find areas of an SGML file where <indexterms> are sparse.

Contribute Advocacy Slides/Presentations
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**Responsible:** FreeBSD-doc <doc@FreeBSD.org\ >

**Synopsis:** Presentations marked up in the DocBook-slides DTD have
recently been added to the documentation set in
``doc/en_US.ISO8859-1/slides``. More advocacy content is needed, and
additional stylesheet work is needed to pull in content from the release
notes and other XML content in our documentation set to build up-to-date
slides with 'make'. A simple example presentation was committed with
some of this functionality, but there is more work to be done! Also, the
stylesheets for print/PDF output (using the Java based XSLT processors,
PassiveTeX is too limiting for slides) could be improved as the default
DocBook Slides XSL-FO stylesheets produce very spartan slides.

Write a section in the Handbook and/or FAQ
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**Responsible:** FreeBSD-doc <doc@FreeBSD.org\ >

**Synopsis:** Chunks of the FAQ and Handbook have empty sections in
them. They need filling. If you have just had to use one of these
documents to complete a task, and found them lacking, please find the
time to write up your experiences as a possible replacement.

Alternatively, if you have just had to do something that had no entry in
the FAQ and/or Handbook, please consider writing a new section. Then
submit it as outlined above.

Write some new Papers
~~~~~~~~~~~~~~~~~~~~~

The New SCSI layer for FreeBSD (CAM)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

**Responsible:** <doc@FreeBSD.org\ >, <scsi@FreeBSD.org\ >

**Synopsis:** See `The Design and Implementation of the FreeBSD SCSI
Subsystem <http://www.FreeBSD.org/~gibbs/>`__ for a first snapshot.

CGI Scripts
~~~~~~~~~~~

**Responsible:** <doc@FreeBSD.org\ >, Wolfram Schneider
<wosch@FreeBSD.org\ >

**Synopsis:**\ Modify the CGI script ports.cgi and the script portindex
to use the Perl
`FreeBSD::Ports <http://people.FreeBSD.org/~tom/portpm/>`__ modules.
These modules also need thorough testing.

Multilingual Web scripts
~~~~~~~~~~~~~~~~~~~~~~~~

**Responsible:** <doc@FreeBSD.org\ >

**Synopsis:**

Our main Web pages are written in (American) English. The `FreeBSD
Translations Projects <translations.html>`__ translate the web pages,
Handbook and FAQ to other languages.

We must translate the cgi scripts and web build scripts too. The scripts
should support multiple languages, not only one. Most scripts are
written in perl.

-  Merge the perl scripts
   `www/en/ports/portindex <ftp://ftp.FreeBSD.org/pub/FreeBSD/FreeBSD-current/www/en/ports/portindex>`__
   and
   `www/ja/ports/portindex <ftp://ftp.FreeBSD.org/pub/FreeBSD/FreeBSD-current/www/ja/ports/portindex>`__
   into one script. Add an option for English and Japanese output.

Translations of the FreeBSD Documentation
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**Responsible:** <doc@FreeBSD.org\ >

Translate the FreeBSD documentation (Web pages, FAQ, Handbook, Manual
pages) into other languages. See the `FreeBSD translations
projects <translations.html>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div id="footer">

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>
