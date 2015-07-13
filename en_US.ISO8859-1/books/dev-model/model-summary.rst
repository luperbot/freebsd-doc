==================
4.3.?Model summary
==================

.. raw:: html

   <div class="navheader">

4.3.?Model summary
`Prev <release-branches.html>`__?
Chapter?4.?Methodology model
?\ `Next <sect-hats.html>`__

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

4.3.?Model summary
------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

To summarise, the development model of FreeBSD can be seen as the
following tree:

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?4.3.?The overall development model

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|The overall development model|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

| 

The tree of the FreeBSD development with ongoing development efforts and
continuous integration.

The tree symbolises the release versions with major versions spawning
new main branches and minor versions being versions of the main branch.
The top branch is the -CURRENT branch where all new development is
integrated, and the -STABLE branch is the branch directly below it.

Clouds of development efforts hang over the project where developers use
the development models they see fit. The product of their work is then
integrated into -CURRENT where it undergoes parallel debugging and is
finally merged from -CURRENT into -STABLE. Security fixes are merged
from -STABLE to the security branches.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------+-----------------------------------+--------------------------------+
| `Prev <release-branches.html>`__?   | `Up <methodology-model.html>`__   | ?\ `Next <sect-hats.html>`__   |
+-------------------------------------+-----------------------------------+--------------------------------+
| 4.2.?Release branches?              | `Home <index.html>`__             | ?Chapter?5.?Hats               |
+-------------------------------------+-----------------------------------+--------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.

.. |The overall development model| image:: freebsd-code-model.png
