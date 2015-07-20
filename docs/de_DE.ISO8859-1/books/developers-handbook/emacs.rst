=============================================
2.7. Emacs als Entwicklungsumgebung verwenden
=============================================

.. raw:: html

   <div class="navheader">

2.7. Emacs als Entwicklungsumgebung verwenden
`Zur?ck <debugging.html>`__?
Kapitel 2. Werkzeuge zur Programmierung
?\ `Weiter <tools-reading.html>`__

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

2.7. Emacs als Entwicklungsumgebung verwenden
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

2.7.1. Emacs
~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Leider werden UNIX?-Systeme nicht mit einem
alles-was-du-jemals-brauchst-und-vieles-mehr-megapaket an integrierten
Entwicklungsumgebungen ausgestattet, die bei anderen Systemen dabei
sind. `:sup:`[7]` <#ftn.idp65067216>`__ Trotzdem ist es m?glich, seine
eigene Entwicklungsumgebung aufzusetzen. Diese wird vielleicht nicht so
h?bsch und integriert sein, aber daf?r k?nnen Sie sie Ihren eigenen
W?nschen anpassen. Und sie ist frei. Und Sie haben die Quelltexte davon.

Der Schl?ssel zu all dem ist Emacs. Es gibt zwar ein paar Leute die ihn
hassen, es gibt jedoch auch viele die ihn lieben. Falls Sie zu ersteren
geh?ren bef?rchte ich, da? dieser Abschnitt Ihnen wenig interessantes zu
bieten hat. Des weiteren ben?tigen Sie eine angemessene Menge an freiem
Speicher, um ihn zu benutzen—ich w?rde 8MB f?r den Textmodus und 16MB
unter X als absolutes Minimum empfehlen, um eine halbwegs brauchbare
Performance zu erhalten.

Emacs ist im Prinzip ein extrem anpassbarer Editor— in der Tat ist er so
stark ver?nderbar, da? er eher einem Betriebssystem als einem Editor
gleicht! Viele Entwickler und Systemadministratoren erledigen praktisch
ihre gesamte Arbeit aus Emacs heraus und beenden ihn nur, um sich
komplett auszuloggen.

Es ist nicht einmal m?glich alles hier zusammenzufassen, was man mit dem
Emacs machen kann. Im Folgenden werden einige Features aufgelistet, die
f?r einen Entwickler interessant sein k?nnten:

.. raw:: html

   <div class="itemizedlist">

-  Sehr m?chtiger Editor, der suchen-und-ersetzen mit Zeichenfolgen und
   regul?ren Ausdr?cken (Pattern) sowie das direkte Anspringen von
   Anfang/Ende von Blockausdr?cken erlaubt, etc, etc.

-  Pull-Down Men?s und eine Online-Hilfe.

-  Sprachunabh?ngige Syntaxhervorhebung und automatische Einr?ckung.

-  Vollst?ndig konfigurierbar.

-  Sie k?nnen Programme im Emacs kompilieren und debuggen.

-  Bei Kompilationsfehlern k?nnen Sie direkt zu der entsprechenden Zeile
   im Quelltext springen.

-  Benutzerfreundliches Front-End f?r das ``info``-Programm, um die GNU
   Hypertext Dokumentation inklusive der Dokumentation des Emacs selber.

-  Benutzerfreundliches Front-End f?r den ``gdb`` um sich beim Verfolgen
   der Programmanweisungen den zugeh?rigen Quelltext anzeigen zu lassen.

-  Sie k?nnen E-Mails und News im Usenet lesen, w?hrend ihr Programm
   kompiliert wird.

.. raw:: html

   </div>

Und zweifelsfrei viele weitere Punkte, die ich ?bersehen habe.

Emacs kann unter FreeBSD ?ber den
`editors/emacs <http://www.freebsd.org/cgi/url.cgi?ports/editors/emacs/pkg-descr>`__
Port installiert werden.

Sobald er installiert ist starten Sie ihn, und geben dann **``C-h t``**
ein, um die Einf?hrung in Emacs zu lesen—d.h. Sie sollen bei gedr?ckter
**Strg**-Taste die **h**-Taste dr?cken, beide wieder loslassen und
anschlie?end **t** dr?cken. (Alternativ k?nnen Sie mit der Maus den
Eintrag Emacs Tutorial aus dem Hilfe-Men? ausw?hlen).

Obwohl der Emacs Men?s besitzt ist das Erlernen der
Tastaturkombinationen lohnenswert, da man beim Editieren sehr viel
schneller Tastenkombinationen eingeben kann, als die Maus zu finden und
mit dieser dann an der richtigen Stelle zu klicken. Und wenn Sie sich
mit erfahrenen Emacs-Benutzern unterhalten werden Sie feststellen, da?
diese h?ufig nebenbei Ausdr?cke wie
„``M-x     replace-s RET foo RET bar RET``“ verwenden, weshalb das
Erlernen dieser sehr n?tzlich ist. Und Emacs hat auf jeden Fall weit
mehr n?tzliche Funktionen als das diese in der Men?leiste unterzubringen
w?ren.

Zum Gl?ck ist es sehr einfach die jeweiligen Tastaturkombinationen
herauszubekommen, da diese direkt neben den Men?eintr?gen stehen. Meine
Empfehlung w?re, den Men?eintrag f?r, sagen wir, das ?ffnen einer Datei
zu verwenden, bis Sie die Funktionsweise verstanden haben und sie mit
dieser vertraut sind, und es dann mit C-x C-f versuchen. Wenn Sie damit
zufrieden sind, gehen Sie zum n?chsten Men?eintrag.

Falls Sie sich nicht daran erinnern k?nnen, was eine bestimmte
Tastenkombination macht, w?hlen Sie Describe Key aus dem Hilfe-Men? aus
und geben Sie die Tastenkombination ein—Emacs sagt Ihnen dann was diese
macht. Sie k?nnen ebenfalls den Men?eintrag Command Apropos verwenden,
um alle Befehle, die ein bestimmtes Wort enthalten, mit den zugeh?rigen
Tastenkombinationen aufgelistet zu bekommen.

?brigends bedeutet der Ausdruck weiter oben, bei gedr?ckter Meta-Taste x
zu dr?cken, beide wieder loszulassen, **``replace-s``** einzugeben
(Kurzversion f?r ``replace-string``—ein weiteres Feature des Emacs ist,
da? Sie Befehle abk?rzen k?nnen), anschlie?end die return-Taste zu
dr?cken, dann **``foo``** einzugeben (die Zeichenkette, die Sie ersetzen
m?chten), dann wieder return, dann die Leertaste zu dr?cken (die
Zeichenkette, mit der Sie ``foo`` ersetzen m?chten) und anschlie?end
erneut return zu dr?cken. Emacs wird dann die gew?nschte
suchen-und-ersetzen-Operation ausf?hren.

Wenn Sie sich fragen was in aller Welt die Meta-Taste ist, das ist eine
spezielle Taste die viele UNIX?-Workstations besitzen.
Bedauerlicherweise haben PCs keine solche Taste, und daher ist es
?blicherweise die **alt**-Taste (oder falls Sie Pech haben die
**Esc**-Taste).

Oh, und um den Emacs zu verlassen m?ssen sie ``C-x C-c`` (das bedeutet,
Sie m?ssen bei gedr?ckter Strg-Taste zuerst x und dann c dr?cken)
eingeben. Falls Sie noch irgendwelche ungespeicherten Dateien offen
haben wird Emacs Sie fragen ob Sie diese speichern wollen. (Ignorieren
Sie bitte die Stelle der Dokumentation, an der gesagt wird, da? ``C-z``
der ?bliche Weg ist, Emacs zu verlassen—dadurch wird der Emacs in den
Hintergrund geschaltet, was nur n?tzlich ist, wenn Sie an einem System
ohne virtuelle Terminals arbeiten).

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

2.7.2. Emacs konfigurieren
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Emacs kann viele wundervolle Dinge; manche dieser Dinge sind schon
eingebaut, andere m?ssen erst konfiguriert werden.

Anstelle einer propriet?ren Macrosprache verwendet der Emacs f?r die
Konfiguration eine speziell f?r Editoren angepa?te Version von Lisp,
auch bekannt als Emacs Lisp. Das Arbeiten mit Emacs Lisp kann sehr
hilfreich sein, wenn Sie darauf aufbauend etwas wie Common Lisp lernen
m?chten. Emacs Lisp hat viele Features von Common Lisp obwohl es
betr?chtlich kleiner ist (und daher auch einfacher zu beherrschen).

Der beste Weg um Emacs Lisp zu erlernen besteht darin, sich das `Emacs
Tutorial <ftp://ftp.gnu.org/old-gnu/emacs/elisp-manual-19-2.4.tar.gz>`__
herunterzuladen.

Es ist jedoch keine Kenntnis von Lisp erforderlich, um mit der
Konfiguration von Emacs zu beginnen, da ich eine beispielhafte
``.emacs``-Datei hier eingef?gt habe, die f?r den Anfang ausreichen
sollte. Kopieren Sie diese einfach in Ihr Heimverzeichnis und starten
Sie den Emacs neu, falls dieser bereits l?uft; er wird die Befehle aus
der Datei lesen und Ihnen (hoffentlich) eine brauchbare Grundeinstellung
bieten.

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

2.7.3. Eine beispielhafte ``.emacs``-Datei
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Bedauerlicherweise gibt es hier viel zu viel, um es im Detail zu
erkl?ren; es gibt jedoch ein oder zwei Punkte, die besonders
erw?hnenswert sind.

.. raw:: html

   <div class="itemizedlist">

-  Alles was mit einem ``;`` anf?ngt ist ein Kommentar und wird von
   Emacs ignoriert.

-  In der ersten Zeile mit ``-*-?Emacs-Lisp?-*-`` sorgt daf?r, da? wir
   die Datei ``.emacs`` in Emacs selber editieren k?nnen und uns damit
   alle tollen Features zum Editieren von Emacs Lisp zur Verf?gung
   stehen. Emacs versucht dies normalerweise anhand des Dateinamens
   auszumachen, was vielleicht bei ``.emacs`` nicht funktionieren
   k?nnte.

-  Die Tab-Taste ist in manchen Modi an die Einr?ckungsfunktion
   gebunden, so da? beim dr?cken dieser Taste die aktuelle Zeile
   einger?ckt wird. Wenn Sie ein tab-Zeichen in einen Text, welchen auch
   immer Sie dabei schreiben, einf?gen wollen, m?ssen Sie bei gedr?ckter
   Strg-Taste die Tab-Taste dr?cken.

-  Diese Datei unterst?tzt Syntax Highlighting f?r C, C++, Perl, Lisp
   und Scheme, indem die Sprache anhand des Dateinamens erraten wird.

-  Emacs hat bereits eine vordefinierte Funktion mit dem Namen
   ``next-error``. Diese erlaubt es einem, in einem Fenster mit der
   Kompilierungsausgabe mittels ``M-n`` von einem zum n?chsten
   Kompilierungsfehler zu springen; wir definieren eine komplement?re
   Funktion ``previous-error``, die es uns erlaubt, mittels ``M-p`` von
   einem zum vorherigen Kompilierungsfehler zu springen. Das sch?nste
   Feature von allen ist, da? mittels ``C-c         C-c`` die
   Quelltextdatei, in der der Fehler aufgetreten ist, ge?ffnet und die
   betreffende Zeile direkt angesprungen wird.

-  Wir aktivieren die M?glichkeit von Emacs als Server zu agieren, so
   da? wenn Sie etwas au?erhalb von Emacs machen und eine Datei
   editieren m?chten, Sie einfach das folgende eingeben k?nnen

   .. code:: screen

       % emacsclient filename
             

   und dann die Datei in Ihrem Emacs editieren k?nnen!
   `:sup:`[8]` <#ftn.idp67564240>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel 2.1. Eine einfache ``.emacs``-Datei

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

2.7.4. Erweitern des von Emacs unterst?tzten Sprachbereichs
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das ist jetzt alles sehr sch?n wenn Sie ausschlie?lich in einer der
Sprachen programmieren wollen, um die wir uns bereits in der
``.emacs``-Datei gek?mmert haben (C, C++, Perl, Lisp und Scheme), aber
was passiert wenn eine neue Sprache namens „whizbang“ herauskommt, mit
jeder Menge neuen tollen Features?

Als erstes mu? festgestellt werden, ob whizbang mit irgendwelchen
Dateien daherkommt, die Emacs etwas ?ber die Sprache sagen. Diese enden
?blicherweise auf ``.el``, der Kurzform f?r „Emacs Lisp“. Falls whizbang
zum Beispiel ein FreeBSD Port ist, k?nnten wir diese Dateien mittels

.. code:: screen

    % find /usr/ports/lang/whizbang -name "*.el" -print

finden und durch Kopieren in das Emacs-seitige Lisp-Verzeichnis
installieren. Unter FreeBSD ist dies
``/usr/local/share/emacs/site-lisp``.

Wenn zum Beispiel die Ausgabe des find-Befehls wie folgt war

.. code:: screen

    /usr/ports/lang/whizbang/work/misc/whizbang.el

k?nnten wir das folgende tun

.. code:: screen

    # cp /usr/ports/lang/whizbang/work/misc/whizbang.el /usr/local/share/emacs/site-lisp

Als n?chstes m?ssen wir festlegen, welche Dateiendung Quelltextdateien
f?r whizbang haben. Lassen Sie uns um der Argumente Willen annehmen, die
Dateiendung sei ``.wiz``. Wir m?ssen dann einen Eintrag unserer
``.emacs``-Datei hinzuf?gen um sicherzustellen, da? Emacs die
Informationen in ``whizbang.el`` auch verwenden kann.

Suchen Sie den auto-mode-alist Eintrag in der ``.emacs``-Datei und f?gen
Sie an dieser Stelle eine Zeile wie folgt f?r whizbang hinzu:

.. code:: programlisting

    …
    ("\\.lsp$" . lisp-mode)
    ("\\.wiz$" . whizbang-mode)
    ("\\.scm$" . scheme-mode)
    …

Dies bedeutet das Emacs automatisch in den ``whizbang-mode`` wechseln
wird, wenn Sie eine Datei mit der Dateiendung ``.wiz`` editieren.

Direkt darunter werden Sie den Eintrag font-lock-auto-mode-list finden.
Erweitern Sie den ``whizbang-mode`` um diesen wie folgt:

.. code:: programlisting

    ;; Auto font lock mode
    (defvar font-lock-auto-mode-list
      (list 'c-mode 'c++-mode 'c++-c-mode 'emacs-lisp-mode 'whizbang-mode 'lisp-mode 'perl-mode 'scheme-mode)
      "List of modes to always start in font-lock-mode")

Dies bedeutet das Emacs immer ``font-lock-mode`` (z.B. Syntax
Highlighting) aktiviert, wenn Sie eine ``.wiz``-Datei editieren.

Und das ist alles was ben?tigt wird. Falls es weitere Dinge gibt, die
automatisch beim ?ffnen einer ``.wiz``-Datei ausgef?hrt werden sollen,
k?nnen Sie einen ``whizbang-mode     hook``-Eintrag hinzuf?gen (f?r ein
einfaches Beispiel, welches ``auto-indent`` hinzuf?gt, sehen Sie sich
bitte ``my-scheme-mode-hook`` an).

.. raw:: html

   </div>

.. raw:: html

   <div class="footnotes">

--------------

.. raw:: html

   <div id="ftn.idp65067216" class="footnote">

`:sup:`[7]` <#idp65067216>`__\ Es gibt jetzt einige m?chtige und freie
IDEs in der Ports-Sammlung wie etwa KDevelop.

.. raw:: html

   </div>

.. raw:: html

   <div id="ftn.idp67564240" class="footnote">

`:sup:`[8]` <#idp67564240>`__\ Viele Emacs-Benutzer setzen Ihre
``EDITOR``-Umgebungsvariable auf ``emacsclient``, so da? dies immer
passiert, wenn sie eine Datei editieren m?ssen.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------+-------------------------------+--------------------------------------+
| `Zur?ck <debugging.html>`__?   | `Nach oben <tools.html>`__    | ?\ `Weiter <tools-reading.html>`__   |
+--------------------------------+-------------------------------+--------------------------------------+
| 2.6. Debuggen?                 | `Zum Anfang <index.html>`__   | ?2.8. Weiterf?hrende Literatur       |
+--------------------------------+-------------------------------+--------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
