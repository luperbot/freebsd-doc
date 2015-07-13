====================
7.8.?Marked Sections
====================

.. raw:: html

   <div class="navheader">

7.8.?Marked Sections
`Prev <xml-primer-include.html>`__?
Chapter?7.?XML Primer
?\ `Next <xml-primer-conclusion.html>`__

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

7.8.?Marked Sections
--------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

XML provides a mechanism to indicate that particular pieces of the
document should be processed in a special way. These are called “marked
sections”.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?7.12.?Structure of a Marked Section

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    <![KEYWORD[
      Contents of marked section
    ]]>

.. raw:: html

   </div>

.. raw:: html

   </div>

As expected of an XML construct, a marked section starts with ``<!``.

The first square bracket begins the marked section.

*``KEYWORD``* describes how this marked section is to be processed by
the parser.

The second square bracket indicates the start of the marked section's
content.

The marked section is finished by closing the two square brackets, and
then returning to the document context from the XML context with ``>``.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

7.8.1.?Marked Section Keywords
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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

7.8.1.1.?\ ``CDATA``
^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

These keywords denote the marked sections *content model*, and allow you
to change it from the default.

When an XML parser is processing a document, it keeps track of the
“content model”.

The content model describes the content the parser is expecting to see
and what it will do with that content.

The ``CDATA`` content model is one of the most useful.

``CDATA`` is for “Character Data”. When the parser is in this content
model, it expects to see only characters. In this model the ``<`` and
``&`` symbols lose their special status, and will be treated as ordinary
characters.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

When using ``CDATA`` in examples of text marked up in XML, remember that
the content of ``CDATA`` is not validated. The included text must be
check with other means. For example, the content could be written in
another document, validated, and then pasted into the ``CDATA`` section.

.. raw:: html

   </div>

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?7.13.?Using a ``CDATA`` Marked Section

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    <para>Here is an example of how to include some text that contains
      many <literal>&lt;</literal> and <literal>&amp;</literal>
      symbols.  The sample text is a fragment of
      <acronym>XHTML</acronym>.  The surrounding text (<para> and
      <programlisting>) are from DocBook.</para>

    <programlisting><![CDATA[<p>This is a sample that shows some of the
      elements within <acronym>XHTML</acronym>.  Since the angle
      brackets are used so many times, it is simpler to say the whole
      example is a CDATA marked section than to use the entity names for
      the left and right angle brackets throughout.</p>

        <ul>
          <li>This is a listitem</li>
          <li>This is a second listitem</li>
          <li>This is a third listitem</li>
        </ul>

        <p>This is the end of the example.</p>]]></programlisting>

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

7.8.1.2.?\ ``INCLUDE`` and ``IGNORE``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

When the keyword is ``INCLUDE``, then the contents of the marked section
will be processed. When the keyword is ``IGNORE``, the marked section is
ignored and will not be processed. It will not appear in the output.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?7.14.?Using ``INCLUDE`` and ``IGNORE`` in Marked Sections

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    <![INCLUDE[
      This text will be processed and included.
    ]]>

    <![IGNORE[
      This text will not be processed or included.
    ]]>

.. raw:: html

   </div>

.. raw:: html

   </div>

By itself, this is not too useful. Text to be removed from the document
could be cut out, or wrapped in comments.

It becomes more useful when controlled by `parameter
entities <xml-primer-entities.html#xml-primer-parameter-entities>`__,
yet this usage is limited to entity files.

For example, suppose that documentation was produced in a hard-copy
version and an electronic version. Some extra text is desired in the
electronic version content that was not to appear in the hard-copy.

Create an entity file that defines general entities to include each
chapter and guard these definitions with a parameter entity that can be
set to either ``INCLUDE`` or ``IGNORE`` to control whether the entity is
defined. After these conditional general entity definitions, place one
more definition for each general entity to set them to an empty value.
This technique makes use of the fact that entity definitions cannot be
overridden but the first definition always takes effect. So the
inclusion of the chapter is controlled with the corresponding parameter
entity. Set to ``INCLUDE``, the first general entity definition will be
read and the second one will be ignored. Set to ``IGNORE``, the first
definition will be ignored and the second one will take effect.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?7.15.?Using a Parameter Entity to Control a Marked Section

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    <!ENTITY % electronic.copy "INCLUDE">

    <![%electronic.copy;[
    <!ENTITY chap.preface    SYSTEM "preface.xml">
    ]]>

    <!ENTITY chap.preface "">

When producing the hard-copy version, change the parameter entity's
definition to:

.. code:: programlisting

    <!ENTITY % electronic.copy "IGNORE">

.. raw:: html

   </div>

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

7.8.2.?To Do…
~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="procedure">

#. Modify ``entities.ent`` to contain the following:

   .. code:: programlisting

       <!ENTITY version "1.1">
       <!ENTITY % conditional.text "IGNORE">

       <![%conditional.text;[
       <!ENTITY para1 SYSTEM "para1.xml">
       ]]>

       <!ENTITY para1 "">

       <!ENTITY para2 SYSTEM "para2.xml">
       <!ENTITY para3 SYSTEM "para3.xml">

#. Normalize ``example.xml`` and notice that the conditional text is not
   present in the output document. Set the parameter entity guard to
   ``INCLUDE`` and regenerate the normalized document and the text will
   appear again. This method makes sense if there are more conditional
   chunks depending on the same condition. For example, to control
   generating printed or online text.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------+----------------------------+--------------------------------------------+
| `Prev <xml-primer-include.html>`__?     | `Up <xml-primer.html>`__   | ?\ `Next <xml-primer-conclusion.html>`__   |
+-----------------------------------------+----------------------------+--------------------------------------------+
| 7.7.?Using Entities to Include Files?   | `Home <index.html>`__      | ?7.9.?Conclusion                           |
+-----------------------------------------+----------------------------+--------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
