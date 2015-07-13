================
12.2.?Guidelines
================

.. raw:: html

   <div class="navheader">

12.2.?Guidelines
`Prev <writing-style.html>`__?
Chapter?12.?Writing Style
?\ `Next <writing-style-guide.html>`__

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

12.2.?Guidelines
----------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

To promote consistency between the myriad authors of the FreeBSD
documentation, some guidelines have been drawn up for authors to follow.

.. raw:: html

   <div class="variablelist">

Use American English Spelling
    There are several variants of English, with different spellings for
    the same word. Where spellings differ, use the American English
    variant. “color”, not “colour”, “rationalize”, not “rationalise”,
    and so on.

    .. raw:: html

       <div class="note" xmlns="">

    Note:
    ~~~~~

    The use of British English may be accepted in the case of a
    contributed article, however the spelling must be consistent within
    the whole document. The other documents such as books, web site,
    manual pages, etc. will have to use American English.

    .. raw:: html

       </div>

Do not use contractions
    Do not use contractions. Always spell the phrase out in full. “Don't
    use contractions” is wrong.

    Avoiding contractions makes for a more formal tone, is more precise,
    and is slightly easier for translators.

Use the serial comma
    In a list of items within a paragraph, separate each item from the
    others with a comma. Separate the last item from the others with a
    comma and the word “and”.

    For example:

    .. raw:: html

       <div class="blockquote">

        This is a list of one, two and three items.

    .. raw:: html

       </div>

    Is this a list of three items, “one”, “two”, and “three”, or a list
    of two items, “one” and “two and three”?

    It is better to be explicit and include a serial comma:

    .. raw:: html

       <div class="blockquote">

        This is a list of one, two, and three items.

    .. raw:: html

       </div>

Avoid redundant phrases
    Do not use redundant phrases. In particular, “the command”, “the
    file”, and “man command” are often redundant.

    For example, commands:

    .. raw:: html

       <div class="informalexample">

    Wrong: Use the command ``svn`` to update sources.

    .. raw:: html

       </div>

    .. raw:: html

       <div class="informalexample">

    Right: Use ``svn`` to update sources.

    .. raw:: html

       </div>

    Filenames:

    .. raw:: html

       <div class="informalexample">

    Wrong: … in the filename ``/etc/rc.local``\ …

    .. raw:: html

       </div>

    .. raw:: html

       <div class="informalexample">

    Right: … in ``/etc/rc.local``\ …

    .. raw:: html

       </div>

    Manual page references (the second example uses ``citerefentry``
    with the ``&man.csh.1;`` entity):.

    .. raw:: html

       <div class="informalexample">

    Wrong: See ``man csh`` for more information.

    .. raw:: html

       </div>

    .. raw:: html

       <div class="informalexample">

    Right: See
    `csh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=csh&sektion=1>`__.

    .. raw:: html

       </div>

Two spaces between sentences
    Always use two spaces between sentences, as it improves readability
    and eases use of tools such as Emacs.

    A period and spaces followed by a capital letter does not always
    mark a new sentence, especially in names. “Jordan K. Hubbard” is a
    good example. It has a capital ``H`` following a period and a space,
    and is certainly not a new sentence.

.. raw:: html

   </div>

For more information about writing style, see `Elements of
Style <http://www.bartleby.com/141/>`__, by William Strunk.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------+-------------------------------+------------------------------------------+
| `Prev <writing-style.html>`__?   | `Up <writing-style.html>`__   | ?\ `Next <writing-style-guide.html>`__   |
+----------------------------------+-------------------------------+------------------------------------------+
| Chapter?12.?Writing Style?       | `Home <index.html>`__         | ?12.3.?Style Guide                       |
+----------------------------------+-------------------------------+------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
