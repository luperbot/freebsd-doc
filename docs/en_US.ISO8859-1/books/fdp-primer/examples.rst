====================
Appendix?A.?Examples
====================

.. raw:: html

   <div class="navheader">

Appendix?A.?Examples
`Prev <see-also-docbook.html>`__?
?
?\ `Next <examples-docbook-article.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="appendix">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Table of Contents

.. raw:: html

   </div>

`A.1. DocBook ``book`` <examples.html#examples-docbook-book>`__
`A.2. DocBook ``article`` <examples-docbook-article.html>`__

.. raw:: html

   </div>

These examples are not exhaustive—they do not contain all the elements
that might be desirable to use, particularly in a document's front
matter. For more examples of DocBook markup, examine the XML source for
this and other documents available in the Subversion ``doc`` repository,
or available online starting at ``http://svnweb.FreeBSD.org/doc/``.

.. raw:: html

   <div class="sect1">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

A.1.?DocBook ``book``
---------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?A.1.?DocBook ``book``

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    <!DOCTYPE book PUBLIC "-//FreeBSD//DTD DocBook XML V5.0-Based Extension//EN"
        "http://www.FreeBSD.org/XML/share/xml/freebsd50.dtd">

    <book xmlns="http://docbook.org/ns/docbook"
      xmlns:xlink="http://www.w3.org/1999/xlink" version="5.0"
      xml:lang="en">

      <info>
        <title>An Example Book</title>

        <author>
          <personname>
            <firstname>Your first name</firstname>
            <surname>Your surname</surname>
          </personname>

          <affiliation>
        <address>
          <email>foo@example.com</email>
        </address>
          </affiliation>
        </author>

        <copyright>
          <year>2000</year>
          <holder>Copyright string here</holder>
        </copyright>

        <abstract>
          <para>If your book has an abstract then it should go here.</para>
        </abstract>
      </info>

      <preface>
        <title>Preface</title>

        <para>Your book may have a preface, in which case it should be placed
          here.</para>
      </preface>

      <chapter>
        <title>My First Chapter</title>

        <para>This is the first chapter in my book.</para>

        <sect1>
          <title>My First Section</title>

          <para>This is the first section in my book.</para>
        </sect1>
      </chapter>
    </book>

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

+-------------------------------------+-------------------------+-----------------------------------------------+
| `Prev <see-also-docbook.html>`__?   | ?                       | ?\ `Next <examples-docbook-article.html>`__   |
+-------------------------------------+-------------------------+-----------------------------------------------+
| 14.4.?DocBook?                      | `Home <index.html>`__   | ?A.2.?DocBook ``article``                     |
+-------------------------------------+-------------------------+-----------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
