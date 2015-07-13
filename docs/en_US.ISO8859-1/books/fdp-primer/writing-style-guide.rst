=================
12.3.?Style Guide
=================

.. raw:: html

   <div class="navheader">

12.3.?Style Guide
`Prev <writing-style-guidelines.html>`__?
Chapter?12.?Writing Style
?\ `Next <writing-style-word-list.html>`__

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

12.3.?Style Guide
-----------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

To keep the source for the documentation consistent when many different
people are editing it, please follow these style conventions.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

12.3.1.?Letter Case
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Tags are entered in lower case, ``para``, *not* ``PARA``.

Text that appears in SGML contexts is generally written in upper case,
``<!ENTITY…>``, and ``<!DOCTYPE…>``, *not* ``<!entity…>`` and
``<!doctype…>``.

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

12.3.2.?Acronyms
~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Acronyms should be defined the first time they appear in a document, as
in: “Network Time Protocol (NTP)”. After the acronym has been defined,
use the acronym alone unless it makes more sense contextually to use the
whole term. Acronyms are usually defined only once per chapter or per
document.

All acronyms should be enclosed in ``acronym`` tags.

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

12.3.3.?Indentation
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The first line in each file starts with no indentation, *regardless* of
the indentation level of the file which might contain the current file.

Opening tags increase the indentation level by two spaces. Closing tags
decrease the indentation level by two spaces. Blocks of eight spaces at
the start of a line should be replaced with a tab. Do not use spaces in
front of tabs, and do not add extraneous whitespace at the end of a
line. Content within elements should be indented by two spaces if the
content runs over more than one line.

For example, the source for this section looks like this:

.. code:: programlisting

    <chapter>
      <title>...</title>

      <sect1>
        <title>...</title>

        <sect2>
          <title>Indentation</title>

          <para>The first line in each file starts with no indentation,
        <emphasis>regardless</emphasis> of the indentation level of
        the file which might contain the current file.</para>

          ...
        </sect2>
      </sect1>
    </chapter>

Tags containing long attributes follow the same rules. Following the
indentation rules in this case helps editors and writers see which
content is inside the tags:

.. code:: programlisting

    <para>See the <link
        linkend="gmirror-troubleshooting">Troubleshooting</link>
      section if there are problems booting.  Powering down and
      disconnecting the original <filename>ada0</filename> disk
      will allow it to be kept as an offline backup.</para>

    <para>It is also possible to journal the boot disk of a &os;
      system.  Refer to the article <link
        xlink:href="&url.articles.gjournal-desktop;">Implementing UFS
        Journaling on a Desktop PC</link> for detailed
      instructions.</para>

When an element is too long to fit on the remainder of a line without
wrapping, moving the start tag to the next line can make the source
easier to read. In this example, the ``systemitem`` element has been
moved to the next line to avoid wrapping and indenting:

.. code:: programlisting

    <para>With file flags, even
      <systemitem class="username">root</systemitem> can be
      prevented from removing or altering files.</para>

Configurations to help various text editors conform to these guidelines
can be found in `Chapter?13, *Editor
Configuration* <editor-config.html>`__.

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

12.3.4.?Tag Style
~~~~~~~~~~~~~~~~~

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

12.3.4.1.?Tag Spacing
^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Tags that start at the same indent as a previous tag should be separated
by a blank line, and those that are not at the same indent as a previous
tag should not:

.. raw:: html

   <div class="informalexample">

.. code:: programlisting

    <article lang='en'>
      <articleinfo>
        <title>NIS</title>

        <pubdate>October 1999</pubdate>

        <abstract>
          <para>...
        ...
        ...</para>
        </abstract>
      </articleinfo>

      <sect1>
        <title>...</title>

        <para>...</para>
      </sect1>

      <sect1>
        <title>...</title>

        <para>...</para>
      </sect1>
    </article>

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

12.3.4.2.?Separating Tags
^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Tags like ``itemizedlist`` which will always have further tags inside
them, and in fact do not take character data themselves, are always on a
line by themselves.

Tags like ``para`` and ``term`` do not need other tags to contain normal
character data, and their contents begin immediately after the tag, *on
the same line*.

The same applies to when these two types of tags close.

This leads to an obvious problem when mixing these tags.

When a starting tag which cannot contain character data directly follows
a tag of the type that requires other tags within it to use character
data, they are on separate lines. The second tag should be properly
indented.

When a tag which can contain character data closes directly after a tag
which cannot contain character data closes, they co-exist on the same
line.

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

12.3.5.?Whitespace Changes
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

*Do not commit changes to content at the same time as changes to
formatting*.

When content and whitespace changes are kept separate, translation teams
can easily see whether a change was content that must be translated or
only whitespace.

For example, if two sentences have been added to a paragraph so that the
line lengths now go over 80 columns, first commit the change with the
too-long lines. Then fix the line wrapping, and commit this second
change. In the commit message for the second change, indicate that this
is a whitespace-only change that can be ignored by translators.

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

12.3.6.?Non-Breaking Space
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Avoid line breaks in places where they look ugly or make it difficult to
follow a sentence. Line breaks depend on the width of the chosen output
medium. In particular, viewing the HTML documentation with a text
browser can lead to badly formatted paragraphs like the next one:

.. code:: literallayout

    Data capacity ranges from 40 MB to 15
    GB.  Hardware compression …

The general entity ``&nbsp;`` prohibits line breaks between parts
belonging together. Use non-breaking spaces in the following places:

.. raw:: html

   <div class="itemizedlist">

-  between numbers and units:

   .. code:: programlisting

       57600&nbsp;bps

-  between program names and version numbers:

   .. code:: programlisting

       &os;&nbsp;9.2

-  between multiword names (use with caution when applying this to more
   than 3-4 word names like “The FreeBSD Brazilian Portuguese
   Documentation Project”):

   .. code:: programlisting

       Sun&nbsp;Microsystems

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------------+-------------------------------+----------------------------------------------+
| `Prev <writing-style-guidelines.html>`__?   | `Up <writing-style.html>`__   | ?\ `Next <writing-style-word-list.html>`__   |
+---------------------------------------------+-------------------------------+----------------------------------------------+
| 12.2.?Guidelines?                           | `Home <index.html>`__         | ?12.4.?Word List                             |
+---------------------------------------------+-------------------------------+----------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
