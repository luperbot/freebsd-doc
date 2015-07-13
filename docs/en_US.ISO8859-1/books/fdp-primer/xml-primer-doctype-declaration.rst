============================
7.3.?The DOCTYPE Declaration
============================

.. raw:: html

   <div class="navheader">

7.3.?The DOCTYPE Declaration
`Prev <xml-primer-elements.html>`__?
Chapter?7.?XML Primer
?\ `Next <xml-primer-xml-escape.html>`__

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

7.3.?The DOCTYPE Declaration
----------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The beginning of each document can specify the name of the DTD to which
the document conforms. This DOCTYPE declaration is used by XML parsers
to identify the DTD and ensure that the document does conform to it.

A typical declaration for a document written to conform with version 1.0
of the XHTML DTD looks like this:

.. code:: programlisting

    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

That line contains a number of different components.

.. raw:: html

   <div class="variablelist">

``<!``
    The *indicator* shows this is an XML declaration.

``DOCTYPE``
    Shows that this is an XML declaration of the document type.

``html``
    Names the first `element <xml-primer-elements.html>`__ that will
    appear in the document.

``PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"     "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"``
    Lists the Formal Public Identifier (FPI) for the DTD to which this
    document conforms. The XML parser uses this to find the correct DTD
    when processing this document.

    ``PUBLIC`` is not a part of the FPI, but indicates to the XML
    processor how to find the DTD referenced in the FPI. Other ways of
    telling the XML parser how to find the DTD are shown
    `later <xml-primer-doctype-declaration.html#xml-primer-fpi-alternatives>`__.

``"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"``
    A local filename or a URL to find the DTD.

``>``
    Ends the declaration and returns to the document.

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

7.3.1.?Formal Public Identifiers (FPIs)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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

It is not necessary to know this, but it is useful background, and might
help debug problems when the XML processor can not locate the DTD.

.. raw:: html

   </div>

FPIs must follow a specific syntax:

.. code:: programlisting

    "Owner//Keyword Description//Language"

.. raw:: html

   <div class="variablelist">

*``Owner``*
    The owner of the FPI.

    The beginning of the string identifies the owner of the FPI. For
    example, the FPI
    ``"ISO 8879:1986//ENTITIES Greek         Symbols//EN"`` lists
    ``ISO 8879:1986`` as being the owner for the set of entities for
    Greek symbols. ISO 8879:1986 is the International Organization for
    Standardization (ISO) number for the SGML standard, the predecessor
    (and a superset) of XML.

    Otherwise, this string will either look like ``-//Owner`` or
    ``+//Owner`` (notice the only difference is the leading ``+`` or
    ``-``).

    If the string starts with ``-`` then the owner information is
    unregistered, with a ``+`` identifying it as registered.

    ISO 9070:1991 defines how registered names are generated. It might
    be derived from the number of an ISO publication, an ISBN code, or
    an organization code assigned according to ISO 6523. Additionally, a
    registration authority could be created in order to assign
    registered names. The ISO council delegated this to the American
    National Standards Institute (ANSI).

    Because the FreeBSD Project has not been registered, the owner
    string is ``-//FreeBSD``. As seen in the example, the W3C are not a
    registered owner either.

*``Keyword``*
    There are several keywords that indicate the type of information in
    the file. Some of the most common keywords are ``DTD``, ``ELEMENT``,
    ``ENTITIES``, and ``TEXT``. ``DTD`` is used only for DTD files,
    ``ELEMENT`` is usually used for DTD fragments that contain only
    entity or element declarations. ``TEXT`` is used for XML content
    (text and tags).

*``Description``*
    Any description can be given for the contents of this file. This may
    include version numbers or any short text that is meaningful and
    unique for the XML system.

*``Language``*
    An ISO two-character code that identifies the native language for
    the file. ``EN`` is used for English.

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

7.3.1.1.?\ ``catalog`` Files
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

With the syntax above, an XML processor needs to have some way of
turning the FPI into the name of the file containing the DTD. A catalog
file (typically called ``catalog``) contains lines that map FPIs to
filenames. For example, if the catalog file contained the line:

.. code:: programlisting

    PUBLIC  "-//W3C//DTD XHTML 1.0 Transitional//EN"             "1.0/transitional.dtd"

The XML processor knows that the DTD is called ``transitional.dtd`` in
the ``1.0`` subdirectory of the directory that held ``catalog``.

Examine the contents of ``/usr/local/share/xml/dtd/xhtml/catalog.xml``.
This is the catalog file for the XHTML DTDs that were installed as part
of the
`textproc/docproj <http://www.freebsd.org/cgi/url.cgi?ports/textproc/docproj/pkg-descr>`__
port.

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

7.3.2.?Alternatives to FPIs
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Instead of using an FPI to indicate the DTD to which the document
conforms (and therefore, which file on the system contains the DTD), the
filename can be explicitly specified.

The syntax is slightly different:

.. code:: programlisting

    <!DOCTYPE html SYSTEM "/path/to/file.dtd">

The ``SYSTEM`` keyword indicates that the XML processor should locate
the DTD in a system specific fashion. This typically (but not always)
means the DTD will be provided as a filename.

Using FPIs is preferred for reasons of portability. If the ``SYSTEM``
identifier is used, then the DTD must be provided and kept in the same
location for everyone.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------+----------------------------+--------------------------------------------+
| `Prev <xml-primer-elements.html>`__?   | `Up <xml-primer.html>`__   | ?\ `Next <xml-primer-xml-escape.html>`__   |
+----------------------------------------+----------------------------+--------------------------------------------+
| 7.2.?Elements, Tags, and Attributes?   | `Home <index.html>`__      | ?7.4.?Escaping Back to XML                 |
+----------------------------------------+----------------------------+--------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
