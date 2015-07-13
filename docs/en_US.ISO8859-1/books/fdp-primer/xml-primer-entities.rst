=============
7.6.?Entities
=============

.. raw:: html

   <div class="navheader">

7.6.?Entities
`Prev <xml-primer-comments.html>`__?
Chapter?7.?XML Primer
?\ `Next <xml-primer-include.html>`__

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

7.6.?Entities
-------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Entities are a mechanism for assigning names to chunks of content. As an
XML parser processes a document, any entities it finds are replaced by
the content of the entity.

This is a good way to have re-usable, easily changeable chunks of
content in XML documents. It is also the only way to include one marked
up file inside another using XML.

There are two types of entities for two different situations: *general
entities* and *parameter entities*.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

7.6.1.?General Entities
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

General entities are used to assign names to reusable chunks of text.
These entities can only be used in the document. They cannot be used in
an XML context.

To include the text of a general entity in the document, include
``&entity-name``; in the text. For example, consider a general entity
called ``current.version`` which expands to the current version number
of a product. To use it in the document, write:

.. code:: programlisting

    <para>The current version of our product is
      &current.version;.</para>

When the version number changes, edit the definition of the general
entity, replacing the value. Then reprocess the document.

General entities can also be used to enter characters that could not
otherwise be included in an XML document. For example, ``<`` and ``&``
cannot normally appear in an XML document. The XML parser sees the ``<``
symbol as the start of a tag. Likewise, when the ``&`` symbol is seen,
the next text is expected to be an entity name.

These symbols can be included by using two predefined general entities:
``&lt;`` and ``&amp;``.

General entities can only be defined within an XML context. Such
definitions are usually done immediately after the DOCTYPE declaration.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?7.8.?Defining General Entities

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" [
    <!ENTITY current.version    "3.0-RELEASE">
    <!ENTITY last.version       "2.2.7-RELEASE">
    ]>

The DOCTYPE declaration has been extended by adding a square bracket at
the end of the first line. The two entities are then defined over the
next two lines, the square bracket is closed, and then the DOCTYPE
declaration is closed.

The square brackets are necessary to indicate that the DTD indicated by
the DOCTYPE declaration is being extended.

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

7.6.2.?Parameter Entities
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Parameter entities, like `general
entities <xml-primer-entities.html#xml-primer-general-entities>`__, are
used to assign names to reusable chunks of text. But parameter entities
can only be used within an `XML context <xml-primer-xml-escape.html>`__.

Parameter entity definitions are similar to those for general entities.
However, parameter entries are included with ``%entity-name``;. The
definition also includes the ``%`` between the ``ENTITY`` keyword and
the name of the entity.

For a mnemonic, think “*P*arameter entities use the *P*ercent symbol”.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?7.9.?Defining Parameter Entities

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" [
    <!ENTITY % param.some "some">
    <!ENTITY % param.text "text">
    <!ENTITY % param.new  "%param.some more %param.text">

    <!-- %param.new now contains "some more text" -->
    ]>

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

7.6.3.?To Do…
~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="procedure">

#. Add a general entity to ``example.xml``.

   .. code:: programlisting

       <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
       "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" [
       <!ENTITY version "1.1">
       ]>

       <html xmlns="http://www.w3.org/1999/xhtml">
         <head>
           <title>An Example XHTML File</title>
         </head>

         <!-- There may be some comments in here as well -->

         <body>
           <p>This is a paragraph containing some text.</p>

           <p>This paragraph contains some more text.</p>

           <p align="right">This paragraph might be right-justified.</p>

           <p>The current version of this document is: &version;</p>
         </body>
       </html>

#. Validate the document using ``xmllint``.

#. Load ``example.xml`` into a web browser. It may have to be copied to
   ``example.html`` before the browser recognizes it as an XHTML
   document.

   Older browsers with simple parsers may not render this file as
   expected. The entity reference ``&version;`` may not be replaced by
   the version number, or the XML context closing ``]>`` may not be
   recognized and instead shown in the output.

#. The solution is to *normalize* the document with an XML normalizer.
   The normalizer reads valid XML and writes equally valid XML which has
   been transformed in some way. One way the normalizer transforms the
   input is by expanding all the entity references in the document,
   replacing the entities with the text that they represent.

   ``xmllint`` can be used for this. It also has an option to drop the
   initial DTD section so that the closing ``]>`` does not confuse
   browsers:

   .. code:: screen

       % xmllint --noent --dropdtd example.xml > example.html

   A normalized copy of the document with entities expanded is produced
   in ``example.html``, ready to load into a web browser.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------+----------------------------+-----------------------------------------+
| `Prev <xml-primer-comments.html>`__?   | `Up <xml-primer.html>`__   | ?\ `Next <xml-primer-include.html>`__   |
+----------------------------------------+----------------------------+-----------------------------------------+
| 7.5.?Comments?                         | `Home <index.html>`__      | ?7.7.?Using Entities to Include Files   |
+----------------------------------------+----------------------------+-----------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
