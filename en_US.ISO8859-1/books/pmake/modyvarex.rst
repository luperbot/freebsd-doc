=================================
3.6.?Modifying Variable Expansion
=================================

.. raw:: html

   <div class="navheader">

3.6.?Modifying Variable Expansion
`Prev <specialtargets.html>`__?
Chapter?3.?Short-cuts and Other Nice Things
?\ `Next <moreexercises.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="section">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.6.?Modifying Variable Expansion
---------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Variables need not always be expanded verbatim. PMake defines several
modifiers that may be applied to a variable's value before it is
expanded. You apply a modifier by placing it after the variable name
with a colon between the two, like so:

.. code:: programlisting

    ${VARIABLE:modifier}

Each modifier is a single character followed by something specific to
the modifier itself. You may apply as many modifiers as you want – each
one is applied to the result of the previous and is separated from the
previous by another colon.

There are seven ways to modify a variable's expansion, most of which
come from the C shell variable modification characters:

.. raw:: html

   <div class="variablelist">

``Mpattern``
    This is used to select only those words (a word is a series of
    characters that are neither spaces nor tabs) that match the given
    pattern. The pattern is a wildcard pattern like that used by the
    shell, where ``*`` means ``0`` or more characters of any sort; ``?``
    is any single character; ``[abcd]`` matches any single character
    that is either ``a``, ``b``, ``c`` or ``d`` (there may be any number
    of characters between the brackets); ``[0-9]`` matches any single
    character that is between ``0`` and ``9`` (i.e. any digit. This form
    may be freely mixed with the other bracket form), and ``\`` is used
    to escape any of the characters ``*``, ``?``, ``[`` or ``:``,
    leaving them as regular characters to match themselves in a word.
    For example, the system makefile ``<makedepend.mk>`` uses
    ``$(CFLAGS:M-[ID]*)`` to extract all the ``-I`` and ``-D`` flags
    that would be passed to the C compiler. This allows it to properly
    locate include files and generate the correct dependencies.

``Npattern``
    This is identical to ``:M`` except it substitutes all words that do
    not match the given pattern.

``S/search-string/replacement-string/[g]``
    Causes the first occurrence of search-string in the variable to be
    replaced by replacement-string, unless the ``g`` flag is given at
    the end, in which case all occurrences of the string are replaced.
    The substitution is performed on each word in the variable in turn.
    If search-string begins with a ``^``, the string must match starting
    at the beginning of the word. If search-string ends with a ``$``,
    the string must match to the end of the word (these two may be
    combined to force an exact match). If a backslash precedes these two
    characters, however, they lose their special meaning. Variable
    expansion also occurs in the normal fashion inside both the
    search-string and the replacement-string, except that a backslash is
    used to prevent the expansion of a ``$``, not another dollar sign,
    as is usual. Note that search-string is just a string, not a
    pattern, so none of the usual regularexpression/wildcard characters
    have any special meaning save ``^`` and ``$``. In the replacement
    string, the ``&`` character is replaced by the search-string unless
    it is preceded by a backslash. You are allowed to use any character
    except colon or exclamation point to separate the two strings. This
    so-called delimiter character may be placed in either string by
    preceding it with a backslash.

``T``
    Replaces each word in the variable expansion by its last component
    (its “tail”). For example, given:

    .. code:: programlisting

        OBJS = ../lib/a.o b /usr/lib/libm.a
        TAILS = $(OBJS:T)

    the variable ``TAILS`` would expand to ``a.o b libm.a.``

``H``
    This is similar to ``:T``, except that every word is replaced by
    everything but the tail (the “head”). Using the same definition of
    ``OBJS``, the string ``$(OBJS:H)`` would expand to
    ``../lib /usr/lib.`` Note that the final slash on the heads is
    removed and anything without a head is replaced by the empty string.

``E``
    ``:E`` replaces each word by its suffix (“extension”). So
    ``$(OBJS:E)`` would give you ``.o .a.``

``R``
    This replaces each word by everything but the suffix (the “root” of
    the word). ``$(OBJS:R)`` expands to ``../lib/a b /usr/lib/libm``.

.. raw:: html

   </div>

In addition, the System V style of substitution is also supported. This
looks like:

.. code:: programlisting

    $(VARIABLE:search-string=replacement)

It must be the last modifier in the chain. The search is anchored at the
end of each word, so only suffixes or whole words may be replaced.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------+---------------------------+------------------------------------+
| `Prev <specialtargets.html>`__?   | `Up <shortcuts.html>`__   | ?\ `Next <moreexercises.html>`__   |
+-----------------------------------+---------------------------+------------------------------------+
| 3.5.?Special Targets?             | `Home <index.html>`__     | ?3.7.?More Exercises               |
+-----------------------------------+---------------------------+------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
