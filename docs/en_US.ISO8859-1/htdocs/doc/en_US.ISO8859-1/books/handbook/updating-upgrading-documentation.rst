====================================
24.3.?Updating the Documentation Set
====================================

.. raw:: html

   <div class="navheader">

24.3.?Updating the Documentation Set
`Prev <updating-upgrading-freebsdupdate.html>`__?
Chapter?24.?Updating and Upgrading FreeBSD
?\ `Next <current-stable.html>`__

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

24.3.?Updating the Documentation Set
------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Documentation is an integral part of the FreeBSD operating system. While
an up-to-date version of the FreeBSD documentation is always available
on the FreeBSD web site
(`http://www.freebsd.org/doc/ <../../../../doc/>`__), it can be handy to
have an up-to-date, local copy of the FreeBSD website, handbooks, FAQ,
and articles.

This section describes how to use either source or the FreeBSD Ports
Collection to keep a local copy of the FreeBSD documentation up-to-date.

For information on editing and submitting corrections to the
documentation, refer to the FreeBSD Documentation Project Primer for New
Contributors
(`http://www.freebsd.org/doc/en\_US.ISO8859-1/books/fdp-primer/ <../../../../doc/en_US.ISO8859-1/books/fdp-primer>`__).

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

24.3.1.?Updating Documentation from Source
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Rebuilding the FreeBSD documentation from source requires a collection
of tools which are not part of the FreeBSD base system. The required
tools, including svn, can be installed from the
`textproc/docproj <http://www.freebsd.org/cgi/url.cgi?ports/textproc/docproj/pkg-descr>`__
package or port developed by the FreeBSD Documentation Project.

Once installed, use svn to fetch a clean copy of the documentation
source. Replace *``https://svn0.us-west.FreeBSD.org``* with the address
of the closest geographic mirror from `Section?A.4.4, “Subversion Mirror
Sites” <svn.html#svn-mirrors>`__:

.. code:: screen

    # svn checkout https://svn0.us-west.FreeBSD.org/doc/head /usr/doc

The initial download of the documentation sources may take a while. Let
it run until it completes.

Future updates of the documentation sources may be fetched by running:

.. code:: screen

    # svn update /usr/doc

Once an up-to-date snapshot of the documentation sources has been
fetched to ``/usr/doc``, everything is ready for an update of the
installed documentation.

A full update of all available languages may be performed by typing:

.. code:: screen

    # cd /usr/doc
    # make install clean

If an update of only a specific language is desired, ``make`` can be
invoked in a language-specific subdirectory of ``/usr/doc``:

.. code:: screen

    # cd /usr/doc/en_US.ISO8859-1
    # make install clean

An alternative way of updating the documentation is to run this command
from ``/usr/doc`` or the desired language-specific subdirectory:

.. code:: screen

    # make update

The output formats that will be installed may be specified by setting
``FORMATS``:

.. code:: screen

    # cd /usr/doc
    # make FORMATS='html html-split' install clean

Several options are available to ease the process of updating only parts
of the documentation, or the build of specific translations. These
options can be set either as system-wide options in ``/etc/make.conf``,
or as command-line options passed to ``make``.

The options include:

.. raw:: html

   <div class="variablelist">

``DOC_LANG``
    The list of languages and encodings to build and install, such as
    ``en_US.ISO8859-1`` for English documentation.

``FORMATS``
    A single format or a list of output formats to be built. Currently,
    ``html``, ``html-split``, ``txt``, ``ps``, and ``pdf`` are
    supported.

``DOCDIR``
    Where to install the documentation. It defaults to
    ``/usr/share/doc``.

.. raw:: html

   </div>

For more ``make`` variables supported as system-wide options in FreeBSD,
refer to
`make.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=make.conf&sektion=5>`__.

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

24.3.2.?Updating Documentation from Ports
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div>

Based on the work of Marc Fonvieille.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The previous section presented a method for updating the FreeBSD
documentation from sources. This section describes an alternative method
which uses the Ports Collection and makes it possible to:

.. raw:: html

   <div class="itemizedlist">

-  Install pre-built packages of the documentation, without having to
   locally build anything or install the documentation toolchain.

-  Build the documentation sources through the ports framework, making
   the checkout and build steps a bit easier.

.. raw:: html

   </div>

This method of updating the FreeBSD documentation is supported by a set
of documentation ports and packages which are updated by the
Documentation Engineering Team ``<doceng@FreeBSD.org>`` on a monthly
basis. These are listed in the FreeBSD Ports?Collection, under the docs
category (http://www.freshports.org/docs/).

Organization of the documentation ports is as follows:

.. raw:: html

   <div class="itemizedlist">

-  The
   `misc/freebsd-doc-en <http://www.freebsd.org/cgi/url.cgi?ports/misc/freebsd-doc-en/pkg-descr>`__
   package or port installs all of the English documentation.

-  The
   `misc/freebsd-doc-all <http://www.freebsd.org/cgi/url.cgi?ports/misc/freebsd-doc-all/pkg-descr>`__
   meta-package or port installs all documentation in all available
   languages.

-  There is a package and port for each translation, such as
   `misc/freebsd-doc-hu <http://www.freebsd.org/cgi/url.cgi?ports/misc/freebsd-doc-hu/pkg-descr>`__
   for the Hungarian documentation.

.. raw:: html

   </div>

When binary packages are used, the FreeBSD documentation will be
installed in all available formats for the given language. For example,
the following command will install the latest package of the Hungarian
documentation:

.. code:: screen

    # pkg install hu-freebsd-doc

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Packages use a format that differs from the corresponding port's name:
``lang``-freebsd-doc, where *``lang``* is the short format of the
language code, such as ``hu`` for Hungarian, or ``zh_cn`` for Simplified
Chinese.

.. raw:: html

   </div>

To specify the format of the documentation, build the port instead of
installing the package. For example, to build and install the English
documentation:

.. code:: screen

    # cd /usr/ports/misc/freebsd-doc-en
    # make install clean

The port provides a configuration menu where the format to build and
install can be specified. By default, split HTML, similar to the format
used on ``http://www.FreeBSD.org``, and PDF are selected.

Alternately, several ``make`` options can be specified when building a
documentation port, including:

.. raw:: html

   <div class="variablelist">

``WITH_HTML``
    Builds the HTML format with a single HTML file per document. The
    formatted documentation is saved to a file called ``article.html``,
    or ``book.html``.

``WITH_PDF``
    The formatted documentation is saved to a file called
    ``article.pdf`` or ``book.pdf``.

``DOCBASE``
    Specifies where to install the documentation. It defaults to
    ``/usr/local/share/doc/freebsd``.

.. raw:: html

   </div>

This example uses variables to install the Hungarian documentation as a
PDF in the specified directory:

.. code:: screen

    # cd /usr/ports/misc/freebsd-doc-hu
    # make -DWITH_PDF DOCBASE=share/doc/freebsd/hu install clean

Documentation packages or ports can be updated using the instructions in
`Chapter?5, *Installing Applications: Packages and
Ports* <ports.html>`__. For example, the following command updates the
installed Hungarian documentation using
`ports-mgmt/portmaster <http://www.freebsd.org/cgi/url.cgi?ports/ports-mgmt/portmaster/pkg-descr>`__
by using packages only:

.. code:: screen

    # portmaster -PP hu-freebsd-doc

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------------------+------------------------------------+----------------------------------------+
| `Prev <updating-upgrading-freebsdupdate.html>`__?   | `Up <updating-upgrading.html>`__   | ?\ `Next <current-stable.html>`__      |
+-----------------------------------------------------+------------------------------------+----------------------------------------+
| 24.2.?FreeBSD Update?                               | `Home <index.html>`__              | ?24.4.?Tracking a Development Branch   |
+-----------------------------------------------------+------------------------------------+----------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
