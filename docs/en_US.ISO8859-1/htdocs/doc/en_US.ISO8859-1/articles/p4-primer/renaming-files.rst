==================
13.?Renaming Files
==================

.. raw:: html

   <div class="navheader">

13.?Renaming Files
`Prev <working-with-diffs.html>`__?
?
?\ `Next <freebsd-cvs-and-p4.html>`__

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

13.?Renaming Files
------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Perforce does not have a built-in way of renaming files or moving them
to a different part of the tree. Simply copying a file to the new
location, doing a ``p4 add`` on it, and a ``p4     delete`` on the old
copy, works, but does not preserve change history of the file. This can
make future integrations with parents and children very bumpy, in fact.
A better method of dealing with this is to do a one-time, in-tree
integration, like so:

.. code:: screen

    % p4 integrate -i oldfile newfile
    % p4 resolve
    % p4 delete oldfile
    % p4 submit

The integration will force Perforce to keep a record of the relationship
between the old and new names, which will assist it in future
integrations. The ``-i`` flag tells it that it is a “baseless”
integration, meaning that there is no branch history available for it to
use in the integration. That is perfect for an integration like this,
but should not be used for normal branch-based integrations.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------+-------------------------+-------------------------------------------------------------+
| `Prev <working-with-diffs.html>`__?   | ?                       | ?\ `Next <freebsd-cvs-and-p4.html>`__                       |
+---------------------------------------+-------------------------+-------------------------------------------------------------+
| 12.?Working with Diffs?               | `Home <index.html>`__   | ?14.?Interactions Between FreeBSD Subversion and Perforce   |
+---------------------------------------+-------------------------+-------------------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
