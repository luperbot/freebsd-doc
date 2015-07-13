====================================
7.7.?Using Entities to Include Files
====================================

.. raw:: html

   <div class="navheader">

7.7.?Using Entities to Include Files
`Prev <xml-primer-entities.html>`__?
Chapter?7.?XML Primer
?\ `Next <xml-primer-marked-sections.html>`__

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

7.7.?Using Entities to Include Files
------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Both `general <xml-primer-entities.html#xml-primer-general-entities>`__
and
`parameter <xml-primer-entities.html#xml-primer-parameter-entities>`__
entities are particularly useful for including one file inside another.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

7.7.1.?Using General Entities to Include Files
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Consider some content for an XML book organized into files, one file per
chapter, called ``chapter1.xml``, ``chapter2.xml``, and so forth, with a
``book.xml`` that will contain these chapters.

In order to use the contents of these files as the values for entities,
they are declared with the ``SYSTEM`` keyword. This directs the XML
parser to include the contents of the named file as the value of the
entity.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?7.10.?Using General Entities to Include Files

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" [
    <!ENTITY chapter.1 SYSTEM "chapter1.xml">
    <!ENTITY chapter.2 SYSTEM "chapter2.xml">
    <!ENTITY chapter.3 SYSTEM "chapter3.xml">
    <!-- And so forth -->
    ]>

    <html xmlns="http://www.w3.org/1999/xhtml">
      <!-- Use the entities to load in the chapters -->

      &chapter.1;
      &chapter.2;
      &chapter.3;
    </html>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="warning" xmlns="">

Warning:
~~~~~~~~

When using general entities to include other files within a document,
the files being included (``chapter1.xml``, ``chapter2.xml``, and so on)
*must not* start with a DOCTYPE declaration. This is a syntax error
because entities are low-level constructs and they are resolved before
any parsing happens.

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

7.7.2.?Using Parameter Entities to Include Files
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Parameter entities can only be used inside an XML context. Including a
file in an XML context can be used to ensure that general entities are
reusable.

Suppose that there are many chapters in the document, and these chapters
were reused in two different books, each book organizing the chapters in
a different fashion.

The entities could be listed at the top of each book, but that quickly
becomes cumbersome to manage.

Instead, place the general entity definitions inside one file, and use a
parameter entity to include that file within the document.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?7.11.?Using Parameter Entities to Include Files

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Place the entity definitions in a separate file called ``chapters.ent``
and containing this text:

.. code:: programlisting

    <!ENTITY chapter.1 SYSTEM "chapter1.xml">
    <!ENTITY chapter.2 SYSTEM "chapter2.xml">
    <!ENTITY chapter.3 SYSTEM "chapter3.xml">

Create a parameter entity to refer to the contents of the file. Then use
the parameter entity to load the file into the document, which will then
make all the general entities available for use. Then use the general
entities as before:

.. code:: programlisting

    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" [
    <!-- Define a parameter entity to load in the chapter general entities -->
    <!ENTITY % chapters SYSTEM "chapters.ent">

    <!-- Now use the parameter entity to load in this file -->
    %chapters;
    ]>

    <html xmlns="http://www.w3.org/1999/xhtml">
      &chapter.1;
      &chapter.2;
      &chapter.3;
    </html>

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

7.7.3.?To Do…
~~~~~~~~~~~~~

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

7.7.3.1.?Use General Entities to Include Files
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="procedure">

#. Create three files, ``para1.xml``, ``para2.xml``, and ``para3.xml``.

   Put content like this in each file:

   .. code:: programlisting

       <p>This is the first paragraph.</p>

#. Edit ``example.xml`` so that it looks like this:

   .. code:: programlisting

       <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
       "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" [
       <!ENTITY version "1.1">
       <!ENTITY para1 SYSTEM "para1.xml">
       <!ENTITY para2 SYSTEM "para2.xml">
       <!ENTITY para3 SYSTEM "para3.xml">
       ]>

       <html xmlns="http://www.w3.org/1999/xhtml">
         <head>
           <title>An Example XHTML File</title>
         </head>

         <body>
           <p>The current version of this document is: &version;</p>

           &para1;
           &para2;
           &para3;
         </body>
       </html>

#. Produce ``example.html`` by normalizing ``example.xml``.

   .. code:: screen

       % xmllint --dropdtd --noent example.xml > example.html

#. Load ``example.html`` into the web browser and confirm that the
   ``paran``.xml files have been included in ``example.html``.

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

7.7.3.2.?Use Parameter Entities to Include Files
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

The previous steps must have completed before this step.

.. raw:: html

   </div>

.. raw:: html

   <div class="procedure">

#. Edit ``example.xml`` so that it looks like this:

   .. code:: programlisting

       <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
       "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" [
       <!ENTITY % entities SYSTEM "entities.ent"> %entities;
       ]>

       <html xmlns="http://www.w3.org/1999/xhtml">
         <head>
           <title>An Example XHTML File</title>
         </head>

         <body>
           <p>The current version of this document is: &version;</p>

           &para1;
           &para2;
           &para3;
         </body>
       </html>

#. Create a new file called ``entities.ent`` with this content:

   .. code:: programlisting

       <!ENTITY version "1.1">
       <!ENTITY para1 SYSTEM "para1.xml">
       <!ENTITY para2 SYSTEM "para2.xml">
       <!ENTITY para3 SYSTEM "para3.xml">

#. Produce ``example.html`` by normalizing ``example.xml``.

   .. code:: screen

       % xmllint --dropdtd --noent example.xml > example.html

#. Load ``example.html`` into the web browser and confirm that the
   ``paran``.xml files have been included in ``example.html``.

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

+----------------------------------------+----------------------------+-------------------------------------------------+
| `Prev <xml-primer-entities.html>`__?   | `Up <xml-primer.html>`__   | ?\ `Next <xml-primer-marked-sections.html>`__   |
+----------------------------------------+----------------------------+-------------------------------------------------+
| 7.6.?Entities?                         | `Home <index.html>`__      | ?7.8.?Marked Sections                           |
+----------------------------------------+----------------------------+-------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
