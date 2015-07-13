=====================
8.5.?In-line Elements
=====================

.. raw:: html

   <div class="navheader">

8.5.?In-line Elements
`Prev <xhtml-markup-block-elements.html>`__?
Chapter?8.?XHTML Markup
?\ `Next <docbook-markup.html>`__

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

8.5.?In-line Elements
---------------------

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

8.5.1.?Emphasizing Information
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Two levels of emphasis are available in XHTML, ``em`` and ``strong``.
``em`` is for a normal level of emphasis and ``strong`` indicates
stronger emphasis.

``em`` is typically rendered in italic and ``strong`` is rendered in
bold. This is not always the case, and should not be relied upon.
According to best practices, web pages only hold structural and
semantical information, and stylesheets are later applied to them. Think
of semantics, not formatting, when using these tags.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?8.12.?\ ``em`` and ``strong``

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Usage:

.. code:: programlisting

    <p><em>This</em> has been emphasized, while
      <strong>this</strong> has been strongly emphasized.</p>

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

8.5.2.?Indicating Fixed-Pitch Text
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Content that should be rendered in a fixed pitch (typewriter) typeface
is tagged with ``tt`` (for “teletype”).

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?8.13.?\ ``tt``

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Usage:

.. code:: programlisting

    <p>Many system settings are stored in
      <tt>/etc</tt>.</p>

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

8.5.3.?Links
~~~~~~~~~~~~

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

Links are also inline elements.

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

8.5.3.1.?Linking to Other Documents on the Web
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A link points to the URL of a document on the web. The link is indicated
with ``a``, and the ``href`` attribute contains the URL of the target
document. The content of the element becomes the link, indicated to the
user by showing it in a different color or with an underline.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?8.14.?Using ``<a href="...">``

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Usage:

.. code:: programlisting

    <p>More information is available at the
      <a href="http://www.&os;.org/">&os; web site</a>.</p>

.. raw:: html

   </div>

.. raw:: html

   </div>

This link always takes the user to the top of the linked document.

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

8.5.3.2.?Linking to Specific Parts of Documents
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

To link to a specific point within a document, that document must
include an *anchor* at the desired point. Anchors are included by
setting the ``id`` attribute of an element to a name. This example
creates an anchor by setting the ``id`` attribute of a ``p`` element.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?8.15.?Creating an Anchor

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Usage:

.. code:: programlisting

    <p id="samplepara">This paragraph can be referenced
      in other links with the name <tt>samplepara</tt>.</p>

.. raw:: html

   </div>

.. raw:: html

   </div>

Links to anchors are similar to plain links, but include a ``#`` symbol
and the anchor's ID at the end of the URL.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?8.16.?Linking to a Named Part of a Different Document

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

The ``samplepara`` example is part of a document called ``foo.html``. A
link to that specific paragraph in the document is constructed in this
example.

.. code:: programlisting

    <p>More information can be found in the
      <a href="foo.html#samplepara">sample paragraph</a> of
      <tt>foo.html</tt>.</p>

.. raw:: html

   </div>

.. raw:: html

   </div>

To link to a named anchor within the same document, omit the document's
URL, and just use the ``#`` symbol followed by the name of the anchor.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?8.17.?Linking to a Named Part of the Same Document

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

The ``samplepara`` example resides in this document. To link to it:

.. code:: programlisting

    <p>More information can be found in the
      <a href="#samplepara">sample paragraph</a> of this
      document.</p>

.. raw:: html

   </div>

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

+------------------------------------------------+------------------------------+-------------------------------------+
| `Prev <xhtml-markup-block-elements.html>`__?   | `Up <xhtml-markup.html>`__   | ?\ `Next <docbook-markup.html>`__   |
+------------------------------------------------+------------------------------+-------------------------------------+
| 8.4.?Block Elements?                           | `Home <index.html>`__        | ?Chapter?9.?DocBook Markup          |
+------------------------------------------------+------------------------------+-------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
