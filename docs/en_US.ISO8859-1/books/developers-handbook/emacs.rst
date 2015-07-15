=============================================
2.7.?Using Emacs as a Development Environment
=============================================

.. raw:: html

   <div class="navheader">

2.7.?Using Emacs as a Development Environment
`Prev <debugging.html>`__?
Chapter?2.?Programming Tools
?\ `Next <tools-reading.html>`__

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

2.7.?Using Emacs as a Development Environment
---------------------------------------------

.. raw:: html

   </div>

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

2.7.1.?Emacs
~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Emacs is a highly customizable editor—indeed, it has been customized to
the point where it is more like an operating system than an editor! Many
developers and sysadmins do in fact spend practically all their time
working inside Emacs, leaving it only to log out.

It is impossible even to summarize everything Emacs can do here, but
here are some of the features of interest to developers:

.. raw:: html

   <div class="itemizedlist">

-  Very powerful editor, allowing search-and-replace on both strings and
   regular expressions (patterns), jumping to start/end of block
   expression, etc, etc.

-  Pull-down menus and online help.

-  Language-dependent syntax highlighting and indentation.

-  Completely customizable.

-  You can compile and debug programs within Emacs.

-  On a compilation error, you can jump to the offending line of source
   code.

-  Friendly-ish front-end to the ``info`` program used for reading GNU
   hypertext documentation, including the documentation on Emacs itself.

-  Friendly front-end to ``gdb``, allowing you to look at the source
   code as you step through your program.

.. raw:: html

   </div>

And doubtless many more that have been overlooked.

Emacs can be installed on FreeBSD using the
`editors/emacs <http://www.freebsd.org/cgi/url.cgi?ports/editors/emacs/pkg-descr>`__
port.

Once it is installed, start it up and do **``C-h       t``** to read an
Emacs tutorial—that means hold down the **control** key, press **h**,
let go of the **control** key, and then press **t**. (Alternatively, you
can use the mouse to select Emacs Tutorial from the Help menu.)

Although Emacs does have menus, it is well worth learning the key
bindings, as it is much quicker when you are editing something to press
a couple of keys than to try to find the mouse and then click on the
right place. And, when you are talking to seasoned Emacs users, you will
find they often casually throw around expressions like
“``M-x         replace-s RET foo RET bar RET``” so it is useful to know
what they mean. And in any case, Emacs has far too many useful functions
for them to all fit on the menu bars.

Fortunately, it is quite easy to pick up the key-bindings, as they are
displayed next to the menu item. My advice is to use the menu item for,
say, opening a file until you understand how it works and feel confident
with it, then try doing C-x C-f. When you are happy with that, move on
to another menu command.

If you can not remember what a particular combination of keys does,
select Describe Key from the Help menu and type it in—Emacs will tell
you what it does. You can also use the Command Apropos menu item to find
out all the commands which contain a particular word in them, with the
key binding next to it.

By the way, the expression above means hold down the Meta key, press x,
release the Meta key, type **``replace-s``** (short for
``replace-string``—another feature of Emacs is that you can abbreviate
commands), press the return key, type **``foo``** (the string you want
replaced), press the return key, type bar (the string you want to
replace ``foo`` with) and press return again. Emacs will then do the
search-and-replace operation you have just requested.

If you are wondering what on earth the Meta key is, it is a special key
that many UNIX? workstations have. Unfortunately, PC's do not have one,
so it is usually the **alt** key (or if you are unlucky, the escape
key).

Oh, and to get out of Emacs, do ``C-x C-c`` (that means hold down the
control key, press x, press c and release the control key). If you have
any unsaved files open, Emacs will ask you if you want to save them.
(Ignore the bit in the documentation where it says ``C-z`` is the usual
way to leave Emacs—that leaves Emacs hanging around in the background,
and is only really useful if you are on a system which does not have
virtual terminals).

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

2.7.2.?Configuring Emacs
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Emacs does many wonderful things; some of them are built in, some of
them need to be configured.

Instead of using a proprietary macro language for configuration, Emacs
uses a version of Lisp specially adapted for editors, known as Emacs
Lisp. Working with Emacs Lisp can be quite helpful if you want to go on
and learn something like Common Lisp. Emacs Lisp has many features of
Common Lisp, although it is considerably smaller (and thus easier to
master).

The best way to learn Emacs Lisp is to download the `Emacs
Tutorial <ftp://ftp.gnu.org/old-gnu/emacs/elisp-manual-19-2.4.tar.gz>`__

However, there is no need to actually know any Lisp to get started with
configuring Emacs, as I have included a sample ``.emacs`` file, which
should be enough to get you started. Just copy it into your home
directory and restart Emacs if it is already running; it will read the
commands from the file and (hopefully) give you a useful basic setup.

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

2.7.3.?A sample ``.emacs`` file
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Unfortunately, there is far too much here to explain it in detail;
however there are one or two points worth mentioning.

.. raw:: html

   <div class="itemizedlist">

-  Everything beginning with a ``;`` is a comment and is ignored by
   Emacs.

-  In the first line, the ``-*-?Emacs-Lisp?-*-`` is so that we can edit
   the ``.emacs`` file itself within Emacs and get all the fancy
   features for editing Emacs Lisp. Emacs usually tries to guess this
   based on the filename, and may not get it right for ``.emacs``.

-  The tab key is bound to an indentation function in some modes, so
   when you press the tab key, it will indent the current line of code.
   If you want to put a tab character in whatever you are writing, hold
   the control key down while you are pressing the tab key.

-  This file supports syntax highlighting for C, C++, Perl, Lisp and
   Scheme, by guessing the language from the filename.

-  Emacs already has a pre-defined function called ``next-error``. In a
   compilation output window, this allows you to move from one
   compilation error to the next by doing ``M-n``; we define a
   complementary function, ``previous-error``, that allows you to go to
   a previous error by doing ``M-p``. The nicest feature of all is that
   ``C-c C-c`` will open up the source file in which the error occurred
   and jump to the appropriate line.

-  We enable Emacs's ability to act as a server, so that if you are
   doing something outside Emacs and you want to edit a file, you can
   just type in

   .. code:: screen

       % emacsclient filename
             

   and then you can edit the file in your Emacs!
   `:sup:`[6]` <#ftn.idp64898000>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?2.1.?A sample ``.emacs`` file

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    ;; -*-Emacs-Lisp-*-

    ;; This file is designed to be re-evaled; use the variable first-time
    ;; to avoid any problems with this.
    (defvar first-time t
      "Flag signifying this is the first time that .emacs has been evaled")

    ;; Meta
    (global-set-key "\M- " 'set-mark-command)
    (global-set-key "\M-\C-h" 'backward-kill-word)
    (global-set-key "\M-\C-r" 'query-replace)
    (global-set-key "\M-r" 'replace-string)
    (global-set-key "\M-g" 'goto-line)
    (global-set-key "\M-h" 'help-command)

    ;; Function keys
    (global-set-key [f1] 'manual-entry)
    (global-set-key [f2] 'info)
    (global-set-key [f3] 'repeat-complex-command)
    (global-set-key [f4] 'advertised-undo)
    (global-set-key [f5] 'eval-current-buffer)
    (global-set-key [f6] 'buffer-menu)
    (global-set-key [f7] 'other-window)
    (global-set-key [f8] 'find-file)
    (global-set-key [f9] 'save-buffer)
    (global-set-key [f10] 'next-error)
    (global-set-key [f11] 'compile)
    (global-set-key [f12] 'grep)
    (global-set-key [C-f1] 'compile)
    (global-set-key [C-f2] 'grep)
    (global-set-key [C-f3] 'next-error)
    (global-set-key [C-f4] 'previous-error)
    (global-set-key [C-f5] 'display-faces)
    (global-set-key [C-f8] 'dired)
    (global-set-key [C-f10] 'kill-compilation)

    ;; Keypad bindings
    (global-set-key [up] "\C-p")
    (global-set-key [down] "\C-n")
    (global-set-key [left] "\C-b")
    (global-set-key [right] "\C-f")
    (global-set-key [home] "\C-a")
    (global-set-key [end] "\C-e")
    (global-set-key [prior] "\M-v")
    (global-set-key [next] "\C-v")
    (global-set-key [C-up] "\M-\C-b")
    (global-set-key [C-down] "\M-\C-f")
    (global-set-key [C-left] "\M-b")
    (global-set-key [C-right] "\M-f")
    (global-set-key [C-home] "\M-<")
    (global-set-key [C-end] "\M->")
    (global-set-key [C-prior] "\M-<")
    (global-set-key [C-next] "\M->")

    ;; Mouse
    (global-set-key [mouse-3] 'imenu)

    ;; Misc
    (global-set-key [C-tab] "\C-q\t")   ; Control tab quotes a tab.
    (setq backup-by-copying-when-mismatch t)

    ;; Treat 'y' or <CR> as yes, 'n' as no.
    (fset 'yes-or-no-p 'y-or-n-p)
    (define-key query-replace-map [return] 'act)
    (define-key query-replace-map [?\C-m] 'act)

    ;; Load packages
    (require 'desktop)
    (require 'tar-mode)

    ;; Pretty diff mode
    (autoload 'ediff-buffers "ediff" "Intelligent Emacs interface to diff" t)
    (autoload 'ediff-files "ediff" "Intelligent Emacs interface to diff" t)
    (autoload 'ediff-files-remote "ediff"
      "Intelligent Emacs interface to diff")

    (if first-time
        (setq auto-mode-alist
          (append '(("\\.cpp$" . c++-mode)
                ("\\.hpp$" . c++-mode)
                ("\\.lsp$" . lisp-mode)
                ("\\.scm$" . scheme-mode)
                ("\\.pl$" . perl-mode)
                ) auto-mode-alist)))

    ;; Auto font lock mode
    (defvar font-lock-auto-mode-list
      (list 'c-mode 'c++-mode 'c++-c-mode 'emacs-lisp-mode 'lisp-mode 'perl-mode 'scheme-mode)
      "List of modes to always start in font-lock-mode")

    (defvar font-lock-mode-keyword-alist
      '((c++-c-mode . c-font-lock-keywords)
        (perl-mode . perl-font-lock-keywords))
      "Associations between modes and keywords")

    (defun font-lock-auto-mode-select ()
      "Automatically select font-lock-mode if the current major mode is in font-lock-auto-mode-list"
      (if (memq major-mode font-lock-auto-mode-list)
          (progn
        (font-lock-mode t))
        )
      )

    (global-set-key [M-f1] 'font-lock-fontify-buffer)

    ;; New dabbrev stuff
    ;(require 'new-dabbrev)
    (setq dabbrev-always-check-other-buffers t)
    (setq dabbrev-abbrev-char-regexp "\\sw\\|\\s_")
    (add-hook 'emacs-lisp-mode-hook
          '(lambda ()
             (set (make-local-variable 'dabbrev-case-fold-search) nil)
             (set (make-local-variable 'dabbrev-case-replace) nil)))
    (add-hook 'c-mode-hook
          '(lambda ()
             (set (make-local-variable 'dabbrev-case-fold-search) nil)
             (set (make-local-variable 'dabbrev-case-replace) nil)))
    (add-hook 'text-mode-hook
          '(lambda ()
             (set (make-local-variable 'dabbrev-case-fold-search) t)
             (set (make-local-variable 'dabbrev-case-replace) t)))

    ;; C++ and C mode...
    (defun my-c++-mode-hook ()
      (setq tab-width 4)
      (define-key c++-mode-map "\C-m" 'reindent-then-newline-and-indent)
      (define-key c++-mode-map "\C-ce" 'c-comment-edit)
      (setq c++-auto-hungry-initial-state 'none)
      (setq c++-delete-function 'backward-delete-char)
      (setq c++-tab-always-indent t)
      (setq c-indent-level 4)
      (setq c-continued-statement-offset 4)
      (setq c++-empty-arglist-indent 4))

    (defun my-c-mode-hook ()
      (setq tab-width 4)
      (define-key c-mode-map "\C-m" 'reindent-then-newline-and-indent)
      (define-key c-mode-map "\C-ce" 'c-comment-edit)
      (setq c-auto-hungry-initial-state 'none)
      (setq c-delete-function 'backward-delete-char)
      (setq c-tab-always-indent t)
    ;; BSD-ish indentation style
      (setq c-indent-level 4)
      (setq c-continued-statement-offset 4)
      (setq c-brace-offset -4)
      (setq c-argdecl-indent 0)
      (setq c-label-offset -4))

    ;; Perl mode
    (defun my-perl-mode-hook ()
      (setq tab-width 4)
      (define-key c++-mode-map "\C-m" 'reindent-then-newline-and-indent)
      (setq perl-indent-level 4)
      (setq perl-continued-statement-offset 4))

    ;; Scheme mode...
    (defun my-scheme-mode-hook ()
      (define-key scheme-mode-map "\C-m" 'reindent-then-newline-and-indent))

    ;; Emacs-Lisp mode...
    (defun my-lisp-mode-hook ()
      (define-key lisp-mode-map "\C-m" 'reindent-then-newline-and-indent)
      (define-key lisp-mode-map "\C-i" 'lisp-indent-line)
      (define-key lisp-mode-map "\C-j" 'eval-print-last-sexp))

    ;; Add all of the hooks...
    (add-hook 'c++-mode-hook 'my-c++-mode-hook)
    (add-hook 'c-mode-hook 'my-c-mode-hook)
    (add-hook 'scheme-mode-hook 'my-scheme-mode-hook)
    (add-hook 'emacs-lisp-mode-hook 'my-lisp-mode-hook)
    (add-hook 'lisp-mode-hook 'my-lisp-mode-hook)
    (add-hook 'perl-mode-hook 'my-perl-mode-hook)

    ;; Complement to next-error
    (defun previous-error (n)
      "Visit previous compilation error message and corresponding source code."
      (interactive "p")
      (next-error (- n)))

    ;; Misc...
    (transient-mark-mode 1)
    (setq mark-even-if-inactive t)
    (setq visible-bell nil)
    (setq next-line-add-newlines nil)
    (setq compile-command "make")
    (setq suggest-key-bindings nil)
    (put 'eval-expression 'disabled nil)
    (put 'narrow-to-region 'disabled nil)
    (put 'set-goal-column 'disabled nil)
    (if (>= emacs-major-version 21)
        (setq show-trailing-whitespace t))

    ;; Elisp archive searching
    (autoload 'format-lisp-code-directory "lispdir" nil t)
    (autoload 'lisp-dir-apropos "lispdir" nil t)
    (autoload 'lisp-dir-retrieve "lispdir" nil t)
    (autoload 'lisp-dir-verify "lispdir" nil t)

    ;; Font lock mode
    (defun my-make-face (face color &optional bold)
      "Create a face from a color and optionally make it bold"
      (make-face face)
      (copy-face 'default face)
      (set-face-foreground face color)
      (if bold (make-face-bold face))
      )

    (if (eq window-system 'x)
        (progn
          (my-make-face 'blue "blue")
          (my-make-face 'red "red")
          (my-make-face 'green "dark green")
          (setq font-lock-comment-face 'blue)
          (setq font-lock-string-face 'bold)
          (setq font-lock-type-face 'bold)
          (setq font-lock-keyword-face 'bold)
          (setq font-lock-function-name-face 'red)
          (setq font-lock-doc-string-face 'green)
          (add-hook 'find-file-hooks 'font-lock-auto-mode-select)

          (setq baud-rate 1000000)
          (global-set-key "\C-cmm" 'menu-bar-mode)
          (global-set-key "\C-cms" 'scroll-bar-mode)
          (global-set-key [backspace] 'backward-delete-char)
                        ;      (global-set-key [delete] 'delete-char)
          (standard-display-european t)
          (load-library "iso-transl")))

    ;; X11 or PC using direct screen writes
    (if window-system
        (progn
          ;;      (global-set-key [M-f1] 'hilit-repaint-command)
          ;;      (global-set-key [M-f2] [?\C-u M-f1])
          (setq hilit-mode-enable-list
            '(not text-mode c-mode c++-mode emacs-lisp-mode lisp-mode
              scheme-mode)
            hilit-auto-highlight nil
            hilit-auto-rehighlight 'visible
            hilit-inhibit-hooks nil
            hilit-inhibit-rebinding t)
          (require 'hilit19)
          (require 'paren))
      (setq baud-rate 2400)         ; For slow serial connections
      )

    ;; TTY type terminal
    (if (and (not window-system)
         (not (equal system-type 'ms-dos)))
        (progn
          (if first-time
          (progn
            (keyboard-translate ?\C-h ?\C-?)
            (keyboard-translate ?\C-? ?\C-h)))))

    ;; Under UNIX
    (if (not (equal system-type 'ms-dos))
        (progn
          (if first-time
          (server-start))))

    ;; Add any face changes here
    (add-hook 'term-setup-hook 'my-term-setup-hook)
    (defun my-term-setup-hook ()
      (if (eq window-system 'pc)
          (progn
    ;;  (set-face-background 'default "red")
        )))

    ;; Restore the "desktop" - do this as late as possible
    (if first-time
        (progn
          (desktop-load-default)
          (desktop-read)))

    ;; Indicate that this file has been read at least once
    (setq first-time nil)

    ;; No need to debug anything now

    (setq debug-on-error nil)

    ;; All done
    (message "All done, %s%s" (user-login-name) ".")
        

.. raw:: html

   </div>

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

2.7.4.?Extending the Range of Languages Emacs Understands
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Now, this is all very well if you only want to program in the languages
already catered for in the ``.emacs`` file (C, C++, Perl, Lisp and
Scheme), but what happens if a new language called “whizbang” comes out,
full of exciting features?

The first thing to do is find out if whizbang comes with any files that
tell Emacs about the language. These usually end in ``.el``, short for
“Emacs Lisp”. For example, if whizbang is a FreeBSD port, we can locate
these files by doing

.. code:: screen

    % find /usr/ports/lang/whizbang -name "*.el" -print

and install them by copying them into the Emacs site Lisp directory. On
FreeBSD, this is ``/usr/local/share/emacs/site-lisp``.

So for example, if the output from the find command was

.. code:: screen

    /usr/ports/lang/whizbang/work/misc/whizbang.el

we would do

.. code:: screen

    # cp /usr/ports/lang/whizbang/work/misc/whizbang.el /usr/local/share/emacs/site-lisp

Next, we need to decide what extension whizbang source files have. Let's
say for the sake of argument that they all end in ``.wiz``. We need to
add an entry to our ``.emacs`` file to make sure Emacs will be able to
use the information in ``whizbang.el``.

Find the auto-mode-alist entry in ``.emacs`` and add a line for
whizbang, such as:

.. code:: programlisting

    …
    ("\\.lsp$" . lisp-mode)
    ("\\.wiz$" . whizbang-mode)
    ("\\.scm$" . scheme-mode)
    …

This means that Emacs will automatically go into ``whizbang-mode`` when
you edit a file ending in ``.wiz``.

Just below this, you will find the font-lock-auto-mode-list entry. Add
``whizbang-mode`` to it like so:

.. code:: programlisting

    ;; Auto font lock mode
    (defvar font-lock-auto-mode-list
      (list 'c-mode 'c++-mode 'c++-c-mode 'emacs-lisp-mode 'whizbang-mode 'lisp-mode 'perl-mode 'scheme-mode)
      "List of modes to always start in font-lock-mode")

This means that Emacs will always enable ``font-lock-mode`` (ie syntax
highlighting) when editing a ``.wiz`` file.

And that is all that is needed. If there is anything else you want done
automatically when you open up a ``.wiz`` file, you can add a
``whizbang-mode hook`` (see ``my-scheme-mode-hook`` for a simple example
that adds ``auto-indent``).

.. raw:: html

   </div>

.. raw:: html

   <div class="footnotes">

--------------

.. raw:: html

   <div id="ftn.idp64898000" class="footnote">

`:sup:`[6]` <#idp64898000>`__\ Many Emacs users set their ``EDITOR``
environment to ``emacsclient`` so this happens every time they need to
edit a file.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------+-------------------------+------------------------------------+
| `Prev <debugging.html>`__?   | `Up <tools.html>`__     | ?\ `Next <tools-reading.html>`__   |
+------------------------------+-------------------------+------------------------------------+
| 2.6.?Debugging?              | `Home <index.html>`__   | ?2.8.?Further Reading              |
+------------------------------+-------------------------+------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
