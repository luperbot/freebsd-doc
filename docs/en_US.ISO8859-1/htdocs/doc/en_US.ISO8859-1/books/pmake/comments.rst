=============
2.4.?Comments
=============

.. raw:: html

   <div class="navheader">

2.4.?Comments
`Prev <variables.html>`__?
Chapter?2.?The Basics of PMake
?\ `Next <parellelism.html>`__

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

2.4.?Comments
-------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Comments in a makefile start with a ``#`` character and extend to the
end of the line. They may appear anywhere you want them, except in a
shell command (though the shell will treat it as a comment, too). If,
for some reason, you need to use the ``#`` in a variable or on a
dependency line, put a backslash in front of it. PMake will compress the
two into a single ``#``.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

This is not true if PMake is operating in full-compatibility mode).

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------+-------------------------+----------------------------------+
| `Prev <variables.html>`__?   | `Up <basics.html>`__    | ?\ `Next <parellelism.html>`__   |
+------------------------------+-------------------------+----------------------------------+
| 2.3.?Variables?              | `Home <index.html>`__   | ?2.5.?Parallelism                |
+------------------------------+-------------------------+----------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
