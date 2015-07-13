==========
13.3.?nano
==========

.. raw:: html

   <div class="navheader">

13.3.?nano
`Prev <editor-config-emacs.html>`__?
Chapter?13.?Editor Configuration
?\ `Next <see-also.html>`__

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

13.3.?nano
----------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Install from
`editors/nano <http://www.freebsd.org/cgi/url.cgi?ports/editors/nano/pkg-descr>`__
or
`editors/nano-devel <http://www.freebsd.org/cgi/url.cgi?ports/editors/nano-devel/pkg-descr>`__.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

13.3.1.?Configuration
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Copy the sample XML syntax highlight file to the user's home directory:

.. code:: screen

    % cp /usr/local/share/nano/xml.nanorc ~/.nanorc

Add these lines to the new ``~/.nanorc``.

.. code:: programlisting

    syntax "xml" "\.([jrs]html?|xml|xslt?)$"
    # trailing whitespace
    color ,blue "[[:space:]]+$"
    # multiples of eight spaces at the start a line
    # (after zero or more tabs) should be a tab
    color ,blue "^([TAB]*[ ]{8})+"
    # tabs after spaces
    color ,yellow "( )+TAB"
    # highlight indents that have an odd number of spaces
    color ,red "^(([ ]{2})+|(TAB+))*[ ]{1}[^ ]{1}"
    # lines longer than 70 characters
    color ,yellow "^(.{71})|(TAB.{63})|(TAB{2}.{55})|(TAB{3}.{47}).+$"

Process the file to create embedded tabs:

.. code:: screen

    % perl -i'' -pe 's/TAB/\t/g' ~/.nanorc

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

13.3.2.?Use
~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Specify additional helpful options when running the editor:

.. code:: screen

    % nano -AKipwz -r 70 -T8 chapter.xml

Users of
`csh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=csh&sektion=1>`__ can
define an alias in ``~/.cshrc`` to automate these options:

.. code:: programlisting

    alias nano "nano -AKipwz -r 70 -T8"

After the alias is defined, the options will be added automatically:

.. code:: screen

    % nano chapter.xml

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------+-------------------------------+-------------------------------+
| `Prev <editor-config-emacs.html>`__?   | `Up <editor-config.html>`__   | ?\ `Next <see-also.html>`__   |
+----------------------------------------+-------------------------------+-------------------------------+
| 13.2.?Emacs?                           | `Home <index.html>`__         | ?Chapter?14.?See Also         |
+----------------------------------------+-------------------------------+-------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
