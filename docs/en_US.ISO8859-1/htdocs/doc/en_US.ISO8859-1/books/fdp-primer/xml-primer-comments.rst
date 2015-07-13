=============
7.5.?Comments
=============

.. raw:: html

   <div class="navheader">

7.5.?Comments
`Prev <xml-primer-xml-escape.html>`__?
Chapter?7.?XML Primer
?\ `Next <xml-primer-entities.html>`__

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

7.5.?Comments
-------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Comments are an XML construct, and are normally only valid inside a DTD.
However, as `Section?7.4, “Escaping Back to
XML” <xml-primer-xml-escape.html>`__ shows, it is possible to use XML
syntax within the document.

The delimiter for XML comments is the string “``--``”. The first
occurrence of this string opens a comment, and the second closes it.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?7.6.?XML Generic Comment

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    <!-- This is inside the comment -->

    <!-- This is another comment    -->

    <!-- This is one way
         of doing multiline comments -->

    <!-- This is another way of   --
      -- doing multiline comments -->

.. raw:: html

   </div>

.. raw:: html

   </div>

XHTML users may be familiar with different rules for comments. In
particular, it is often believed that the string ``<!--`` opens a
comment, and it is only closed by ``-->``.

This is *not* correct. Many web browsers have broken XHTML parsers, and
will accept incorrect input as valid. However, the XML parsers used by
the Documentation Project are more strict, and will reject documents
with that error.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?7.7.?Erroneous XML Comments

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    <!-- This is in the comment --

         THIS IS OUTSIDE THE COMMENT!

      -- back inside the comment -->

The XML parser will treat this as though it were actually:

.. code:: programlisting

    <!THIS IS OUTSIDE THE COMMENT>

That is not valid XML, and may give confusing error messages.

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

7.5.1.?To Do…
~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="procedure">

#. Add some comments to ``example.xml``, and check that the file still
   validates using ``xmllint``.

#. Add some invalid comments to ``example.xml``, and see the error
   messages that ``xmllint`` gives when it encounters an invalid
   comment.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------+----------------------------+------------------------------------------+
| `Prev <xml-primer-xml-escape.html>`__?   | `Up <xml-primer.html>`__   | ?\ `Next <xml-primer-entities.html>`__   |
+------------------------------------------+----------------------------+------------------------------------------+
| 7.4.?Escaping Back to XML?               | `Home <index.html>`__      | ?7.6.?Entities                           |
+------------------------------------------+----------------------------+------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
