================================
Chapter?13.?Editor Configuration
================================

.. raw:: html

   <div class="navheader">

Chapter?13.?Editor Configuration
`Prev <writing-style-word-list.html>`__?
?
?\ `Next <editor-config-emacs.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="chapter">

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

`13.1. Vim <editor-config.html#editor-config-vim>`__
`13.2. Emacs <editor-config-emacs.html>`__
`13.3. nano <editor-config-nano.html>`__

.. raw:: html

   </div>

Adjusting text editor configuration can make working on document files
quicker and easier, and help documents conform to FDP guidelines.

.. raw:: html

   <div class="sect1">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

13.1.?Vim
---------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Install from
`editors/vim <http://www.freebsd.org/cgi/url.cgi?ports/editors/vim/pkg-descr>`__
or
`editors/vim-lite <http://www.freebsd.org/cgi/url.cgi?ports/editors/vim-lite/pkg-descr>`__.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

13.1.1.?Configuration
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Edit ``~/.vimrc``, adding these lines:

.. code:: programlisting

    if has("autocmd")
        au BufNewFile,BufRead *.sgml,*.ent,*.xsl,*.xml call Set_SGML()
        au BufNewFile,BufRead *.[1-9] call ShowSpecial()
    endif " has(autocmd)

    function Set_Highlights()
        "match ExtraWhitespace /^\s* \s*\|\s\+$/
        highlight default link OverLength ErrorMsg
        match OverLength /\%71v.\+/
        return 0
    endfunction

    function ShowSpecial()
        setlocal list listchars=tab:>>,trail:*,eol:$
        hi def link nontext ErrorMsg
        return 0
    endfunction " ShowSpecial()

    function Set_SGML()
        setlocal number
        syn match sgmlSpecial "&[^;]*;"
        setlocal syntax=sgml
        setlocal filetype=xml
        setlocal shiftwidth=2
        setlocal textwidth=70
        setlocal tabstop=8
        setlocal softtabstop=2
        setlocal formatprg="fmt -p"
        setlocal autoindent
        setlocal smartindent
        " Rewrap paragraphs
        noremap P gqj
        " Replace spaces with tabs
        noremap T :s/        /\t/<CR>
        call ShowSpecial()
        call Set_Highlights()
        return 0
    endfunction " Set_SGML()

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

13.1.2.?Use
~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Press **P** to reformat paragraphs or text that has been selected in
Visual mode. Press **T** to replace groups of eight spaces with a tab.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------------+-------------------------+------------------------------------------+
| `Prev <writing-style-word-list.html>`__?   | ?                       | ?\ `Next <editor-config-emacs.html>`__   |
+--------------------------------------------+-------------------------+------------------------------------------+
| 12.4.?Word List?                           | `Home <index.html>`__   | ?13.2.?Emacs                             |
+--------------------------------------------+-------------------------+------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
