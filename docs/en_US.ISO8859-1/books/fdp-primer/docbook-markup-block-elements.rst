===================
9.5.?Block Elements
===================

.. raw:: html

   <div class="navheader">

9.5.?Block Elements
`Prev <docbook-markup-document-structure.html>`__?
Chapter?9.?DocBook Markup
?\ `Next <docbook-markup-inline-elements.html>`__

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

9.5.?Block Elements
-------------------

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

9.5.1.?Paragraphs
~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

DocBook supports three types of paragraphs: ``formalpara``, ``para``,
and ``simpara``.

Almost all paragraphs in FreeBSD documentation use ``para``.
``formalpara`` includes a ``title`` element, and ``simpara`` disallows
some elements from within ``para``. Stick with ``para``.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?9.6.?\ ``para``

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Usage:

.. code:: programlisting

    <para>This is a paragraph.  It can contain just about any
      other element.</para>

Appearance:

This is a paragraph. It can contain just about any other element.

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

9.5.2.?Block Quotations
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A block quotation is an extended quotation from another document that
should not appear within the current paragraph. These are rarely needed.

Blockquotes can optionally contain a title and an attribution (or they
can be left untitled and unattributed).

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?9.7.?\ ``blockquote``

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Usage:

.. code:: programlisting

    <para>A small excerpt from the US Constitution:</para>

    <blockquote>
      <title>Preamble to the Constitution of the United States</title>

      <attribution>Copied from a web site somewhere</attribution>

      <para>We the People of the United States, in Order to form a more
        perfect Union, establish Justice, insure domestic Tranquility,
        provide for the common defence, promote the general Welfare, and
        secure the Blessings of Liberty to ourselves and our Posterity, do
        ordain and establish this Constitution for the United States of
        America.</para>
    </blockquote>

Appearance:

A small excerpt from the US Constitution:

.. raw:: html

   <div class="blockquote">

?

.. raw:: html

   <div class="blockquote-title">

Preamble to the Constitution of the United States

.. raw:: html

   </div>

We the People of the United States, in Order to form a more perfect
Union, establish Justice, insure domestic Tranquility, provide for the
common defence, promote the general Welfare, and secure the Blessings of
Liberty to ourselves and our Posterity, do ordain and establish this
Constitution for the United States of America.

?
?
--Copied from a web site somewhere

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

9.5.3.?Tips, Notes, Warnings, Cautions, and Important Information
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Extra information may need to be separated from the main body of the
text. Typically this is “meta” information of which the user should be
aware.

Several types of admonitions are available: ``tip``, ``note``,
``warning``, ``caution``, and ``important``.

Which admonition to choose depends on the situation. The DocBook
documentation suggests:

.. raw:: html

   <div class="itemizedlist">

-  Note is for information that should be heeded by all readers.

-  Important is a variation on Note.

-  Caution is for information regarding possible data loss or software
   damage.

-  Warning is for information regarding possible hardware damage or
   injury to life or limb.

.. raw:: html

   </div>

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?9.8.?\ ``tip`` and ``important``

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Usage:

.. code:: programlisting

    <tip>
      <para>&os; may reduce stress.</para>
    </tip>

    <important>
      <para>Please use admonitions sparingly.  Too many admonitions
        are visually jarring and can have the opposite of the
        intended effect.</para>
    </important>

.. raw:: html

   </div>

.. raw:: html

   </div>

Appearance:

.. raw:: html

   <div class="tip" xmlns="">

Tip:
~~~~

FreeBSD may reduce stress.

.. raw:: html

   </div>

.. raw:: html

   <div class="important" xmlns="">

Important:
~~~~~~~~~~

Please use admonitions sparingly. Too many admonitions are visually
jarring and can have the opposite of the intended effect.

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

9.5.4.?Examples
~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Examples can be shown with ``example``.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?9.9.?\ ``example``

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Usage:

.. code:: programlisting

    <example>
      <para>Empty files can be created easily:</para>

      <screen>&prompt.user; <userinput>touch file1 file2 file3</userinput></screen>
    </example>

.. raw:: html

   </div>

.. raw:: html

   </div>

Appearance:

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?9.10.?

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Empty files can be created easily:

.. code:: screen

    % touch file1 file2 file3

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

9.5.5.?Lists and Procedures
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Information often needs to be presented as lists, or as a number of
steps that must be carried out in order to accomplish a particular goal.

To do this, use ``itemizedlist``, ``orderedlist``, ``variablelist``, or
``procedure``. There are other types of list elements in DocBook, but we
will not cover them here.

``itemizedlist`` and ``orderedlist`` are similar to their counterparts
in HTML, ``ul`` and ``ol``. Each one consists of one or more
``listitem`` elements, and each ``listitem`` contains one or more block
elements. The ``listitem`` elements are analogous to HTML's ``li`` tags.
However, unlike HTML, they are required.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?9.11.?\ ``itemizedlist`` and ``orderedlist``

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Usage:

.. code:: programlisting

    <itemizedlist>
      <listitem>
        <para>This is the first itemized item.</para>
      </listitem>

      <listitem>
        <para>This is the second itemized item.</para>
      </listitem>
    </itemizedlist>

    <orderedlist>
      <listitem>
        <para>This is the first ordered item.</para>
      </listitem>

      <listitem>
        <para>This is the second ordered item.</para>
      </listitem>
    </orderedlist>

Appearance:

.. raw:: html

   <div class="itemizedlist">

-  This is the first itemized item.

-  This is the second itemized item.

.. raw:: html

   </div>

.. raw:: html

   <div class="orderedlist">

#. This is the first ordered item.

#. This is the second ordered item.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

An alternate and often useful way of presenting information is the
``variablelist``. These are lists where each entry has a term and a
description. They are well suited for many types of descriptions, and
present information in a form that is often easier for the reader than
sections and subsections.

A ``variablelist`` has a ``title``, and then pairs of ``term`` and
``listitem`` entries.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?9.12.?\ ``variablelist``

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Usage:

.. code:: programlisting

    <variablelist>
      <varlistentry>
        <term>Parallel</term>

        <listitem>
          <para>In parallel communications, groups of bits arrive
        at the same time over multiple communications
        channels.</para>
        </listitem>
      </varlistentry>

      <varlistentry>
        <term>Serial</term>

        <listitem>
          <para>In serial communications, bits arrive one at a
        time over a single communications
        channel.</para>
        </listitem>
      </varlistentry>
    </variablelist>

Appearance:

.. raw:: html

   <div class="variablelist">

Parallel
    In parallel communications, groups of bits arrive at the same time
    over multiple communications channels.

Serial
    In serial communications, bits arrive one at a time over a single
    communications channel.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A ``procedure`` shows a series of ``step``\ s, which may in turn consist
of more ``step``\ s or ``substep``\ s. Each ``step`` contains block
elements and may include an optional title.

Sometimes, steps are not sequential, but present a choice: do *this* or
do *that*, but not both. For these alternative choices, use
``stepalternatives``.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?9.13.?\ ``procedure``

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Usage:

.. code:: programlisting

    <procedure>
      <step>
        <para>Do this.</para>
      </step>

      <step>
        <para>Then do this.</para>
      </step>

      <step>
        <para>And now do this.</para>
      </step>

      <step>
        <para>Finally, do one of these.</para>

        <stepalternatives>
          <step>
        <para>Go left.</para>
          </step>

          <step>
        <para>Go right.</para>
          </step>
        </stepalternatives>
      </step>
    </procedure>

Appearance:

.. raw:: html

   <div class="procedure">

#. Do this.

#. Then do this.

#. And now do this.

#. Finally, do one of these:

   -  Go left.

   -  Go right.

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

9.5.6.?Showing File Samples
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Fragments of a file (or perhaps a complete file) are shown by wrapping
them in the ``programlisting`` element.

White space and line breaks within ``programlisting`` *are* significant.
In particular, this means that the opening tag should appear on the same
line as the first line of the output, and the closing tag should appear
on the same line as the last line of the output, otherwise spurious
blank lines may be included.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?9.14.?\ ``programlisting``

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Usage:

.. code:: programlisting

    <para>When finished, the program will look like
      this:</para>

    <programlisting>#include &lt;stdio.h&gt;

    int
    main(void)
    {
        printf("hello, world\n");
    }</programlisting>

Notice how the angle brackets in the ``#include`` line need to be
referenced by their entities instead of being included literally.

Appearance:

When finished, the program will look like this:

.. code:: programlisting

    #include <stdio.h>

    int
    main(void)
    {
        printf("hello, world\n");
    }

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

9.5.7.?Callouts
~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A callout is a visual marker for referring to a piece of text or
specific position within an example.

Callouts are marked with the ``co`` element. Each element must have a
unique ``id`` assigned to it. After the example, include a
``calloutlist`` that describes each callout.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?9.15.?\ ``co`` and ``calloutlist``

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    <para>When finished, the program will look like
      this:</para>

    <programlisting>#include &lt;stdio.h&gt; <co xml:id="co-ex-include"/>

    int <co xml:id="co-ex-return"/>
    main(void)
    {
        printf("hello, world\n"); <co xml:id="co-ex-printf"/>
    }</programlisting>

    <calloutlist>
      <callout arearefs="co-ex-include">
        <para>Includes the standard IO header file.</para>
      </callout>

      <callout arearefs="co-ex-return">
        <para>Specifies that <function>main()</function> returns an
          int.</para>
      </callout>

      <callout arearefs="co-ex-printf">
        <para>The <function>printf()</function> call that writes
          <literal>hello, world</literal> to standard output.</para>
      </callout>
    </calloutlist>

Appearance:

When finished, the program will look like this:

.. code:: programlisting

    #include <stdio.h> 

    int 
    main(void)
    {
        printf("hello, world\n"); 
    }

.. raw:: html

   <div class="calloutlist">

+--------------------------------------+--------------------------------------+
| `|1| <#co-ex-include>`__             | Includes the standard IO header      |
|                                      | file.                                |
+--------------------------------------+--------------------------------------+
| `|2| <#co-ex-return>`__              | Specifies that ``main()`` returns an |
|                                      | int.                                 |
+--------------------------------------+--------------------------------------+
| `|3| <#co-ex-printf>`__              | The ``printf()`` call that writes    |
|                                      | ``hello, world`` to standard output. |
+--------------------------------------+--------------------------------------+

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

9.5.8.?Tables
~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Unlike HTML, DocBook does not need tables for layout purposes, as the
stylesheet handles those issues. Instead, just use tables for marking up
tabular data.

In general terms (and see the DocBook documentation for more detail) a
table (which can be either formal or informal) consists of a ``table``
element. This contains at least one ``tgroup`` element, which specifies
(as an attribute) the number of columns in this table group. Within the
tablegroup there is one ``thead`` element, which contains elements for
the table headings (column headings), and one ``tbody`` which contains
the body of the table.

Both ``tgroup`` and ``thead`` contain ``row`` elements, which in turn
contain ``entry`` elements. Each ``entry`` element specifies one cell in
the table.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?9.16.?\ ``informaltable``

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Usage:

.. code:: programlisting

    <informaltable pgwide="1">
      <tgroup cols="2">
        <thead>
          <row>
            <entry>This is Column Head 1</entry>
            <entry>This is Column Head 2</entry>
          </row>
        </thead>

        <tbody>
          <row>
        <entry>Row 1, column 1</entry>
        <entry>Row 1, column 2</entry>
          </row>

          <row>
        <entry>Row 2, column 1</entry>
        <entry>Row 2, column 2</entry>
          </row>
        </tbody>
      </tgroup>
    </informaltable>

Appearance:

.. raw:: html

   <div class="informaltable">

+-------------------------+-------------------------+
| This is Column Head 1   | This is Column Head 2   |
+=========================+=========================+
| Row 1, column 1         | Row 1, column 2         |
+-------------------------+-------------------------+
| Row 2, column 1         | Row 2, column 2         |
+-------------------------+-------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Always use the ``pgwide`` attribute with a value of ``1`` with the
``informaltable`` element. A bug in Internet Explorer can cause the
table to render incorrectly if this is omitted.

Table borders can be suppressed by setting the ``frame`` attribute to
``none`` in the ``informaltable`` element. For example,
``informaltable frame="none"``.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?9.17.?Tables Where ``frame="none"``

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Appearance:

.. raw:: html

   <div class="informaltable">

+-------------------------+-------------------------+
| This is Column Head 1   | This is Column Head 2   |
+=========================+=========================+
| Row 1, column 1         | Row 1, column 2         |
+-------------------------+-------------------------+
| Row 2, column 1         | Row 2, column 2         |
+-------------------------+-------------------------+

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

9.5.9.?Examples for the User to Follow
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Examples for the user to follow are often necessary. Typically, these
will consist of dialogs with the computer; the user types in a command,
the user gets a response back, the user types another command, and so
on.

A number of distinct elements and entities come into play here.

.. raw:: html

   <div class="variablelist">

``screen``
    Everything the user sees in this example will be on the computer
    screen, so the next element is ``screen``.

    Within ``screen``, white space is significant.

``prompt``, ``&prompt.root;`` and ``&prompt.user;``
    Some of the things the user will be seeing on the screen are prompts
    from the computer (either from the operating system, command shell,
    or application). These should be marked up using ``prompt``.

    As a special case, the two shell prompts for the normal user and the
    root user have been provided as entities. To indicate the user is at
    a shell prompt, use one of ``&prompt.root;`` and ``&prompt.user;``
    as necessary. They do not need to be inside ``prompt``.

    .. raw:: html

       <div class="note" xmlns="">

    Note:
    ~~~~~

    ``&prompt.root;`` and ``&prompt.user;`` are FreeBSD extensions to
    DocBook, and are not part of the original DTD.

    .. raw:: html

       </div>

``userinput``
    When displaying text that the user should type in, wrap it in
    ``userinput`` tags. It will be displayed differently than system
    output text.

.. raw:: html

   </div>

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?9.18.?\ ``screen``, ``prompt``, and ``userinput``

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Usage:

.. code:: programlisting

    <screen>&prompt.user; <userinput>ls -1</userinput>
    foo1
    foo2
    foo3
    &prompt.user; <userinput>ls -1 | grep foo2</userinput>
    foo2
    &prompt.user; <userinput>su</userinput>
    <prompt>Password: </prompt>
    &prompt.root; <userinput>cat foo2</userinput>
    This is the file called 'foo2'</screen>

Appearance:

.. code:: screen

    % ls -1
    foo1
    foo2
    foo3
    % ls -1 | grep foo2
    foo2
    % su
    Password: 
    # cat foo2
    This is the file called 'foo2'

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Even though we are displaying the contents of the file ``foo2``, it is
*not* marked up as ``programlisting``. Reserve ``programlisting`` for
showing fragments of files outside the context of user actions.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------------------+--------------------------------+-----------------------------------------------------+
| `Prev <docbook-markup-document-structure.html>`__?   | `Up <docbook-markup.html>`__   | ?\ `Next <docbook-markup-inline-elements.html>`__   |
+------------------------------------------------------+--------------------------------+-----------------------------------------------------+
| 9.4.?Document Structure?                             | `Home <index.html>`__          | ?9.6.?In-line Elements                              |
+------------------------------------------------------+--------------------------------+-----------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.

.. |1| image:: ./imagelib/callouts/1.png
.. |2| image:: ./imagelib/callouts/2.png
.. |3| image:: ./imagelib/callouts/3.png
