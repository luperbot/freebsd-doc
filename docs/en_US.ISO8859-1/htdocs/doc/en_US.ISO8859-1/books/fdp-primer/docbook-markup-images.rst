===========
9.7.?Images
===========

.. raw:: html

   <div class="navheader">

9.7.?Images
`Prev <docbook-markup-inline-elements.html>`__?
Chapter?9.?DocBook Markup
?\ `Next <docbook-markup-links.html>`__

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

9.7.?Images
-----------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="important" xmlns="">

Important:
~~~~~~~~~~

Image support in the documentation is somewhat experimental. The
mechanisms described here are unlikely to change, but that is not
guaranteed.

To provide conversion between different image formats, the
`graphics/ImageMagick <http://www.freebsd.org/cgi/url.cgi?ports/graphics/ImageMagick/pkg-descr>`__
port must be installed. This port is not included in the
`textproc/docproj <http://www.freebsd.org/cgi/url.cgi?ports/textproc/docproj/pkg-descr>`__
meta port, and must be installed separately.

A good example of the use of images is the
``doc/en_US.ISO8859-1/articles/vm-design/`` document. Examine the files
in that directory to see how these elements are used together. Build
different output formats to see how the format determines what images
are shown in the rendered document.

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

9.7.1.?Image Formats
~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The following image formats are currently supported. An image file will
automatically be converted to bitmap or vector image depending on the
output document format.

These are the *only* formats in which images should be committed to the
documentation repository.

.. raw:: html

   <div class="variablelist">

EPS (Encapsulated Postscript)
    Images that are primarily vector based, such as network diagrams,
    time lines, and similar, should be in this format. These images have
    a ``.eps`` extension.

PNG (Portable Network Graphic)
    For bitmaps, such as screen captures, use this format. These images
    have the ``.png`` extension.

PIC (PIC graphics language)
    PIC is a language for drawing simple vector-based figures used in
    the
    `pic(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pic&sektion=1>`__
    utility. These images have the ``.pic`` extension.

SCR (SCReen capture)
    This format is specific to screenshots of console output. The
    following command generates an SCR file ``shot.scr`` from video
    buffer of ``/dev/ttyv0``:

    .. code:: screen

        # vidcontrol -p < /dev/ttyv0 > shot.scr

    This is preferable to PNG format for screenshots because the SCR
    file contains plain text of the command lines so that it can be
    converted to a PNG image or a plain text depending on the output
    document format.

.. raw:: html

   </div>

Use the appropriate format for each image. Documentation will often have
a mix of EPS and PNG images. The ``Makefile``\ s ensure that the correct
format image is chosen depending on the output format used. *Do not
commit the same image to the repository in two different formats*.

.. raw:: html

   <div class="important" xmlns="">

Important:
~~~~~~~~~~

The Documentation Project may eventually switch to using the SVG
(Scalable Vector Graphic) format for vector images. However, the current
state of SVG capable editing tools makes this impractical.

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

9.7.2.?Image File Locations
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Image files can be stored in one of several locations, depending on the
document and image:

.. raw:: html

   <div class="itemizedlist">

-  In the same directory as the document itself, usually done for
   articles and small books that keep all their files in a single
   directory.

-  In a subdirectory of the main document. Typically done when a large
   book uses separate subdirectories to organize individual chapters.

   When images are stored in a subdirectory of the main document
   directory, the subdirectory name must be included in their paths in
   the ``Makefile`` and the ``imagedata`` element.

-  In a subdirectory of ``doc/share/images`` named after the document.
   For example, images for the Handbook are stored in
   ``doc/share/images/books/handbook``. Images that work for multiple
   translations are stored in this upper level of the documentation file
   tree. Generally, these are images that can be used unchanged in
   non-English translations of the document.

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

9.7.3.?Image Markup
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Images are included as part of a ``mediaobject``. The ``mediaobject``
can contain other, more specific objects. We are concerned with two, the
``imageobject`` and the ``textobject``.

Include one ``imageobject``, and two ``textobject`` elements. The
``imageobject`` will point to the name of the image file without the
extension. The ``textobject`` elements contain information that will be
presented to the user as well as, or instead of, the image itself.

Text elements are shown to the reader in several situations. When the
document is viewed in HTML, text elements are shown while the image is
loading, or if the mouse pointer is hovered over the image, or if a
text-only browser is being used. In formats like plain text where
graphics are not possible, the text elements are shown instead of the
graphical ones.

This example shows how to include an image called ``fig1.png`` in a
document. The image is a rectangle with an A inside it:

.. code:: programlisting

    <mediaobject>
      <imageobject>
        <imagedata fileref="fig1"> 
      </imageobject>

      <textobject>
        <literallayout class="monospaced">+---------------+ 
    |       A       |
    +---------------+</literallayout>
      </textobject>

      <textobject>
        <phrase>A picture</phrase> 
      </textobject>
    </mediaobject>

.. raw:: html

   <div class="calloutlist">

+--------------------------------------+--------------------------------------+
| `|1| <#co-image-ext>`__              | Include an ``imagedata`` element     |
|                                      | inside the ``imageobject`` element.  |
|                                      | The ``fileref`` attribute should     |
|                                      | contain the filename of the image to |
|                                      | include, without the extension. The  |
|                                      | stylesheets will work out which      |
|                                      | extension should be added to the     |
|                                      | filename automatically.              |
+--------------------------------------+--------------------------------------+
| `|2| <#co-image-literal>`__          | The first ``textobject`` contains a  |
|                                      | ``literallayout`` element, where the |
|                                      | ``class`` attribute is set to        |
|                                      | ``monospaced``. This is an           |
|                                      | opportunity to demonstrate ASCII art |
|                                      | skills. This content will be used if |
|                                      | the document is converted to plain   |
|                                      | text.                                |
|                                      |                                      |
|                                      | Notice how the first and last lines  |
|                                      | of the content of the                |
|                                      | ``literallayout`` element butt up    |
|                                      | next to the element's tags. This     |
|                                      | ensures no extraneous white space is |
|                                      | included.                            |
+--------------------------------------+--------------------------------------+
| `|3| <#co-image-phrase>`__           | The second ``textobject`` contains a |
|                                      | single ``phrase`` element. The       |
|                                      | contents of this phrase will become  |
|                                      | the ``alt`` attribute for the image  |
|                                      | when this document is converted to   |
|                                      | HTML.                                |
+--------------------------------------+--------------------------------------+

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

9.7.4.?Image ``Makefile`` Entries
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Images must be listed in the ``Makefile`` in the ``IMAGES`` variable.
This variable must contain the names of all the *source* images. For
example, if there are three figures, ``fig1.eps``, ``fig2.png``,
``fig3.png``, then the ``Makefile`` should have lines like this in it.

.. code:: programlisting

    …
    IMAGES= fig1.eps fig2.png fig3.png
    …

or

.. code:: programlisting

    …
    IMAGES=  fig1.eps
    IMAGES+= fig2.png
    IMAGES+= fig3.png
    …

Again, the ``Makefile`` will work out the complete list of images it
needs to build the source document, you only need to list the image
files *you* provided.

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

9.7.5.?Images and Chapters in Subdirectories
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Be careful when separating documentation into smaller files in different
directories (see `Section?7.7.1, “Using General Entities to Include
Files” <xml-primer-include.html#xml-primer-include-using-gen-entities>`__).

Suppose there is a book with three chapters, and the chapters are stored
in their own directories, called ``chapter1/chapter.xml``,
``chapter2/chapter.xml``, and ``chapter3/chapter.xml``. If each chapter
has images associated with it, place those images in each chapter's
subdirectory (``chapter1/``, ``chapter2/``, and ``chapter3/``).

However, doing this requires including the directory names in the
``IMAGES`` variable in the ``Makefile``, *and* including the directory
name in the ``imagedata`` element in the document.

For example, if the book has ``chapter1/fig1.png``, then
``chapter1/chapter.xml`` should contain:

.. code:: programlisting

    <mediaobject>
      <imageobject>
        <imagedata fileref="chapter1/fig1"/> 
      </imageobject>

      …

    </mediaobject>

.. raw:: html

   <div class="calloutlist">

+--------------------------------------+--------------------------------------+
| `|1| <#co-image-dir>`__              | The directory name must be included  |
|                                      | in the ``fileref`` attribute.        |
+--------------------------------------+--------------------------------------+

.. raw:: html

   </div>

The ``Makefile`` must contain:

.. code:: programlisting

    …
    IMAGES=  chapter1/fig1.png
    …

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------------------+--------------------------------+-------------------------------------------+
| `Prev <docbook-markup-inline-elements.html>`__?   | `Up <docbook-markup.html>`__   | ?\ `Next <docbook-markup-links.html>`__   |
+---------------------------------------------------+--------------------------------+-------------------------------------------+
| 9.6.?In-line Elements?                            | `Home <index.html>`__          | ?9.8.?Links                               |
+---------------------------------------------------+--------------------------------+-------------------------------------------+

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
