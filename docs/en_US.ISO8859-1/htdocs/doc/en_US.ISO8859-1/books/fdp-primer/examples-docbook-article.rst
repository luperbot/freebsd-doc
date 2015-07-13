====================
A.2.?DocBook article
====================

.. raw:: html

   <div class="navheader">

A.2.?DocBook ``article``
`Prev <examples.html>`__?
Appendix?A.?Examples
?\ `Next <ix01.html>`__

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

A.2.?DocBook ``article``
------------------------

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

Example?A.2.?DocBook ``article``

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    <!DOCTYPE article PUBLIC "-//FreeBSD//DTD DocBook XML V5.0-Based Extension//EN"
        "http://www.FreeBSD.org/XML/share/xml/freebsd50.dtd">

    <article xmlns="http://docbook.org/ns/docbook"
      xmlns:xlink="http://www.w3.org/1999/xlink" version="5.0"
      xml:lang="en">

      <info>
        <title>An Example Article</title>

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
          <para>If your article has an abstract then it should go here.</para>
        </abstract>
      </info>

      <sect1>
        <title>My First Section</title>

        <para>This is the first section in my article.</para>

        <sect2>
          <title>My First Sub-Section</title>

          <para>This is the first sub-section in my article.</para>
        </sect2>
      </sect1>
    </article>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------+--------------------------+---------------------------+
| `Prev <examples.html>`__?   | `Up <examples.html>`__   | ?\ `Next <ix01.html>`__   |
+-----------------------------+--------------------------+---------------------------+
| Appendix?A.?Examples?       | `Home <index.html>`__    | ?Index                    |
+-----------------------------+--------------------------+---------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
