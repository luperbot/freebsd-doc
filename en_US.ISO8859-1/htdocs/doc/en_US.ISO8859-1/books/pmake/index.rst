==================
PMake — A Tutorial
==================

.. raw:: html

   <div class="navheader">

PMake — A Tutorial
?
?
?\ `Next <intro.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="book" lang="en" lang="en">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="author" xmlns="http://www.w3.org/1999/xhtml">

Adam de Boor
~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div>

Revision: ` <https://svnweb.freebsd.org/changeset/doc/>`__

.. raw:: html

   </div>

.. raw:: html

   <div>

Copyright ? 1988-1989 Adam de Boor

.. raw:: html

   </div>

.. raw:: html

   <div>

Copyright ? 1989 Berkeley Softworks

.. raw:: html

   </div>

.. raw:: html

   <div>

Copyright ? 1988-1989, 1993 The Regents of the University of California.

.. raw:: html

   </div>

.. raw:: html

   <div>

`Legal Notice <legalnotice.html>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Table of Contents

.. raw:: html

   </div>

`1. Introduction <intro.html>`__
`2. The Basics of PMake <basics.html>`__
`2.1. Dependency Lines <basics.html#deplines>`__
`2.2. Shell Commands <shellcmds.html>`__
`2.3. Variables <variables.html>`__
`2.4. Comments <comments.html>`__
`2.5. Parallelism <parellelism.html>`__
`2.6. Writing and Debugging a Makefile <writeanddebug.html>`__
`2.7. Invoking PMake <invoking.html>`__
`2.8. Summary <summary.html>`__
`3. Short-cuts and Other Nice Things <shortcuts.html>`__
`3.1. Transformation Rules <shortcuts.html#rules>`__
`3.2. Including Other Makefiles <including.html>`__
`3.3. Saving Commands <savingcmds.html>`__
`3.4. Target Attributes <targetattr.html>`__
`3.5. Special Targets <specialtargets.html>`__
`3.6. Modifying Variable Expansion <modyvarex.html>`__
`3.7. More Exercises <moreexercises.html>`__
`4. PMake for Gods <gods.html>`__
`4.1. Search Paths <gods.html#searchpaths>`__
`4.2. Archives and Libraries <archivesandlibraries.html>`__
`4.3. On the Condition... <condition.html>`__
`4.4. A Shell is a Shell is a Shell <ashell.html>`__
`4.5. Compatibility <compatibility.html>`__
`4.6. DEFCON 3 – Variable Expansion <defcon3.html>`__
`4.7. DEFCON 2 – The Number of the Beast <defcon2.html>`__
`4.8. DEFCON 1 – Imitation is the Not the Highest Form of
Flattery <defcon1.html>`__
`4.9. The Way Things Work <theway.html>`__
`5. Answers to Exercises <answers.html>`__
`Glossary of Jargon <glossary.html>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----+-----+----------------------------+
| ?   | ?   | ?\ `Next <intro.html>`__   |
+-----+-----+----------------------------+
| ?   | ?   | ?Chapter?1.?Introduction   |
+-----+-----+----------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
