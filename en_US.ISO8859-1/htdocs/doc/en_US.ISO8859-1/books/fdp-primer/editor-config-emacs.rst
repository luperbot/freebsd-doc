===========
13.2.?Emacs
===========

.. raw:: html

   <div class="navheader">

13.2.?Emacs
`Prev <editor-config.html>`__?
Chapter?13.?Editor Configuration
?\ `Next <editor-config-nano.html>`__

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

13.2.?Emacs
-----------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Install from
`editors/emacs <http://www.freebsd.org/cgi/url.cgi?ports/editors/emacs/pkg-descr>`__
or
`editors/xemacs <http://www.freebsd.org/cgi/url.cgi?ports/editors/xemacs/pkg-descr>`__.

Edit ``~/.emacs``, adding these lines:

.. code:: programlisting

        (defun local-sgml-mode-hook
          (setq fill-column 70
            indent-tabs-mode nil
            next-line-add-newlines nil
            standard-indent 4
            sgml-indent-data t)
          (auto-fill-mode t)
          (setq sgml-catalog-files '("/usr/local/share/xml/catalog")))
        (add-hook 'psgml-mode-hook
          '(lambda () (local-psgml-mode-hook)))

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------+-------------------------------+-----------------------------------------+
| `Prev <editor-config.html>`__?      | `Up <editor-config.html>`__   | ?\ `Next <editor-config-nano.html>`__   |
+-------------------------------------+-------------------------------+-----------------------------------------+
| Chapter?13.?Editor Configuration?   | `Home <index.html>`__         | ?13.3.?nano                             |
+-------------------------------------+-------------------------------+-----------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
