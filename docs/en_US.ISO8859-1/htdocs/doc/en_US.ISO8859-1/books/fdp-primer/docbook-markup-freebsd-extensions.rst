=======================
9.2.?FreeBSD Extensions
=======================

.. raw:: html

   <div class="navheader">

9.2.?FreeBSD Extensions
`Prev <docbook-markup.html>`__?
Chapter?9.?DocBook Markup
?\ `Next <docbook-markup-fpi.html>`__

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

9.2.?FreeBSD Extensions
-----------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The FreeBSD Documentation Project has extended the DocBook DTD with
additional elements and entities. These additions serve to make some of
the markup easier or more precise.

Throughout the rest of this document, the term “DocBook” is used to mean
the FreeBSD-extended DocBook DTD.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Most of these extensions are not unique to FreeBSD, it was just felt
that they were useful enhancements for this particular project. Should
anyone from any of the other \*nix camps (NetBSD, OpenBSD, Linux, …) be
interested in collaborating on a standard DocBook extension set, please
contact Documentation Engineering Team ``<doceng@FreeBSD.org>``.

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

9.2.1.?FreeBSD Elements
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The additional FreeBSD elements are not (currently) in the Ports
Collection. They are stored in the FreeBSD Subversion tree, as
`head/share/xml/freebsd.dtd <http://svnweb.FreeBSD.org/doc/head/share/xml/freebsd.dtd>`__.

FreeBSD-specific elements used in the examples below are clearly marked.

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

9.2.2.?FreeBSD Entities
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This table shows some of the most useful entities available in the FDP.
For a complete list, see the ``*.ent`` files in ``doc/share/xml``.

.. raw:: html

   <div class="informaltable">

?
?
?
*FreeBSD Name Entities*
``&os;``
``FreeBSD``
?
``&os.stable;``
``FreeBSD-STABLE``
?
``&os.current;``
``FreeBSD-CURRENT``
?
?
?
?
Manual Page Entities
``&man.ls.1;``
`ls(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ls&sektion=1>`__
Usage:
``&man.ls.1; is the manual page           for           <command>ls</command>.``
``&man.cp.1;``
`cp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cp&sektion=1>`__
Usage:
``The manual page for           <command>cp</command> is           &man.cp.1;.``
``&man.command``.\ *``sectionnumber``*;
*link to *``command``* manual page in section *``sectionnumber``**
Entities are defined for all the `FreeBSD manual
pages <../../../../cgi/man.cgi>`__.
?
?
?
FreeBSD Mailing List Entities
``&a.doc;``
``FreeBSD documentation project mailing list``
Usage: ``A link to the           &a.doc;.``
``&a.questions;``
``FreeBSD general questions mailing list``
Usage: ``A link to the           &a.questions;.``
``&a.listname``;
*link to *``listname``**
Entities are defined for all the `FreeBSD mailing
lists <../../../../doc/en_US.ISO8859-1/books/handbook/eresources.html#eresources-mail>`__.
?
?
?
FreeBSD Document Link Entities
``&url.books.handbook;``
``../../../../doc/en_US.ISO8859-1/books/handbook``
Usage:
``A link to the <link           xlink:href="&url.books.handbook;/advanced-networking.html">Advanced           Networking</link> chapter of the           Handbook.``
``&url.books.bookname``;
*relative path to *``bookname``**
Entities are defined for all the `FreeBSD
books <../../../../doc/en_US.ISO8859-1/books/>`__.
``&url.articles.committers-guide;``
``../../../../doc/en_US.ISO8859-1/articles/committers-guide``
Usage:
``A link to the <link           xlink:href="&url.articles.committers-guide;">Committer's           Guide</link>           article.``
``&url.articles.articlename``;
*relative path to *``articlename``**
Entities are defined for all the `FreeBSD
articles <../../../../doc/en_US.ISO8859-1/articles/>`__.
?
?
?
Other Operating System Name Entities
``&linux;``
Linux?
The Linux? operating system.
``&unix;``
UNIX?
The UNIX? operating system.
``&windows;``
Windows?
The Windows? operating system.
?
?
?
Miscellaneous Entities
``&prompt.root;``
``#``
The ``root`` user prompt.
``&prompt.user;``
``%``
A prompt for an unprivileged user.
``&postscript;``
PostScript?
The PostScript? programming language.
``&tex;``
TeX
The TeX typesetting language.
``&xorg;``
Xorg
The Xorg open source X Window System.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------+--------------------------------+-----------------------------------------+
| `Prev <docbook-markup.html>`__?   | `Up <docbook-markup.html>`__   | ?\ `Next <docbook-markup-fpi.html>`__   |
+-----------------------------------+--------------------------------+-----------------------------------------+
| Chapter?9.?DocBook Markup?        | `Home <index.html>`__          | ?9.3.?Formal Public Identifier (FPI)    |
+-----------------------------------+--------------------------------+-----------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
