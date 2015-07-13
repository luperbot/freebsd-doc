================
1.2.?Quick Start
================

.. raw:: html

   <div class="navheader">

1.2.?Quick Start
`Prev <overview.html>`__?
Chapter?1.?Overview
?\ `Next <tools.html>`__

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

1.2.?Quick Start
----------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Some preparatory steps must be taken before editing the FreeBSD
documentation. First, subscribe to the `FreeBSD documentation project
mailing list <http://lists.FreeBSD.org/mailman/listinfo/freebsd-doc>`__.
Some team members also interact on the ``#bsddocs`` IRC channel on
`EFnet <http://www.efnet.org/>`__. These people can help with questions
or problems involving the documentation.

.. raw:: html

   <div class="procedure">

#. Install the
   `textproc/docproj <http://www.freebsd.org/cgi/url.cgi?ports/textproc/docproj/pkg-descr>`__
   package or port. This meta-port installs all of the software needed
   to edit and build FreeBSD documentation.

#. Install a local working copy of the documentation from a mirror of
   the FreeBSD repository in ``~/doc`` (see `Chapter?3, *The Working
   Copy* <working-copy.html>`__).

   .. code:: screen

       % svn checkout https://svn0.us-west.FreeBSD.org/doc/head ~/doc

#. Configure the text editor:

   .. raw:: html

      <div class="itemizedlist">

   -  Word wrap set to 70 characters.

   -  Tab stops set to 2.

   -  Replace each group of 8 leading spaces with a single tab.

   .. raw:: html

      </div>

   Specific editor configurations are listed in `Chapter?13, *Editor
   Configuration* <editor-config.html>`__.

#. Update the local working copy:

   .. code:: screen

       % svn up ~/doc

#. Edit the documentation files that require changes. If a file needs
   major changes, consult the mailing list for input.

   References to tag and entity usage can be found in `Chapter?8, *XHTML
   Markup* <xhtml-markup.html>`__ and `Chapter?9, *DocBook
   Markup* <docbook-markup.html>`__.

#. After editing, check for problems by running:

   .. code:: screen

       % igor -R filename.xml | less -RS

   Review the output and edit the file to fix any problems shown, then
   rerun the command to find any remaining problems. Repeat until all of
   the errors are resolved.

#. *Always* build-test changes before submitting them. Running
   **``make``** in the top-level directory of the documentation being
   edited will generate that documentation in split HTML format. For
   example, to build the English version of the Handbook in HTML, run
   ``make`` in the ``en_US.ISO8859-1/books/handbook/`` directory.

#. When changes are complete and tested, generate a “diff file”:

   .. code:: screen

       % cd ~/doc
       % svn diff > bsdinstall.diff.txt

   Give the diff file a descriptive name. In the example above, changes
   have been made to the ``bsdinstall`` portion of the Handbook.

#. Submit the diff file using the web-based `Problem
   Report <../../../../support.html#gnats>`__ system. If using the web
   form, enter a synopsis of *[patch]
   *``short description of         problem``**. Select the category
   ``docs`` and the class ``doc-bug``. In the body of the message, enter
   a short description of the changes and any important details about
   them. Use the [?Browse...?] button to attach the diff file.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------+--------------------------+----------------------------+
| `Prev <overview.html>`__?   | `Up <overview.html>`__   | ?\ `Next <tools.html>`__   |
+-----------------------------+--------------------------+----------------------------+
| Chapter?1.?Overview?        | `Home <index.html>`__    | ?Chapter?2.?Tools          |
+-----------------------------+--------------------------+----------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
