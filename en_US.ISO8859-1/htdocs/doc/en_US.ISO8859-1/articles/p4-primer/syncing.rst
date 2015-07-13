==========
4.?Syncing
==========

.. raw:: html

   <div class="navheader">

4.?Syncing
`Prev <clients.html>`__?
?
?\ `Next <branches.html>`__

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

4.?Syncing
----------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Once you have a client specification defined and the ``P4CLIENT``
variable set, the next step is to pull the files for that client down to
your local machine. This is done with ``p4 sync``, which instructs
Perforce to synchronize the local files in your client with the
repository. The first time it runs, it will download all of the files.
Subsequent runs will only download files that have changed since the
previous run. This allows you to stay in sync with others whom you might
be working with.

Sync operations only work on files that the Perforce server knows has
changed. If you change or delete a file locally without informing the
server, doing a sync will not bring it back. However, doing a
``p4 sync -f`` will unconditionally sync all files, regardless of their
state. This is useful for resolving problems where you think that your
tree might be corrupt.

You can sync a subset of your tree or client by specifying a relative
path to the sync command. For example, to only sync the ``ufs``
directory of the ``smpng`` project, you might do the following:

.. code:: screen

    % cd projectroot/smpng
    % p4 sync src/sys/ufs/...

Specifying a local relative path works for many other ``p4`` commands.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------+-------------------------+-------------------------------+
| `Prev <clients.html>`__?   | ?                       | ?\ `Next <branches.html>`__   |
+----------------------------+-------------------------+-------------------------------+
| 3.?Clients?                | `Home <index.html>`__   | ?5.?Branches                  |
+----------------------------+-------------------------+-------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
