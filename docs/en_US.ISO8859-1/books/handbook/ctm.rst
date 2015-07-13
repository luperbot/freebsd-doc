==============
A.3.?Using CTM
==============

.. raw:: html

   <div class="navheader">

A.3.?Using CTM
`Prev <mirrors-ftp.html>`__?
Appendix?A.?Obtaining FreeBSD
?\ `Next <svn.html>`__

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

A.3.?Using CTM
--------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

CTM is a method for keeping a remote directory tree in sync with a
central one. It is built into FreeBSD and can be used to synchronize a
system with FreeBSD's source repositories. It supports synchronization
of an entire repository or just a specified set of branches.

CTM is specifically designed for use on lousy or non-existent TCP/IP
connections and provides the ability for changes to be automatically
sent by email. It requires the user to obtain up to three deltas per day
for the most active branches. Update sizes are always kept as small as
possible and are typically less than 5K. About one in very ten updates
is 10-50K in size, and there will occasionally be an update larger than
100K+.

When using CTM to track FreeBSD development, refer to the caveats
related to working directly from the development sources rather than a
pre-packaged release. These are discussed in `Tracking a Development
Branch <current-stable.html>`__.

Little documentation exists on the process of creating deltas or using
CTM for other purposes. Contact the
`ctm-users <http://lists.FreeBSD.org/mailman/listinfo/ctm-users>`__
mailing list for answers to questions on using CTM.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

A.3.1.?Getting Deltas
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The “deltas” used by CTM can be obtained either through anonymous FTP or
email.

FTP deltas can be obtained from the following mirror sites. When using
anonymous FTP to obtain CTM deltas, select a mirror that is
geographically nearby. In case of problems, contact the
`ctm-users <http://lists.FreeBSD.org/mailman/listinfo/ctm-users>`__
mailing list.

.. raw:: html

   <div class="variablelist">

California, Bay Area, official source
    .. raw:: html

       <div class="itemizedlist">

    -  ``ftp://ftp.FreeBSD.org/pub/FreeBSD/development/CTM/``

    -  ``ftp://ftp.FreeBSD.org/pub/FreeBSD/CTM/``

    .. raw:: html

       </div>

South Africa, backup server for old deltas
    .. raw:: html

       <div class="itemizedlist">

    -  ``ftp://ftp.za.FreeBSD.org/pub/FreeBSD/CTM/``

    .. raw:: html

       </div>

Taiwan/R.O.C.
    .. raw:: html

       <div class="itemizedlist">

    -  ``ftp://ctm.tw.FreeBSD.org/pub/FreeBSD/development/CTM/``

    -  ``ftp://ctm2.tw.FreeBSD.org/pub/FreeBSD/development/CTM/``

    -  ``ftp://ctm3.tw.FreeBSD.org/pub/FreeBSD/development/CTM/``

    .. raw:: html

       </div>

.. raw:: html

   </div>

To instead receive deltas through email, subscribe to one of the
``ctm-src`` distribution lists available from
``http://lists.freebsd.org/mailman/listinfo``. For example,
`ctm-src-cur <http://lists.FreeBSD.org/mailman/listinfo/ctm-src-cur>`__
supports the head development branch and
`ctm-src-9 <http://lists.FreeBSD.org/mailman/listinfo/ctm-src-9>`__
supports the 9.X release branch.

As CTM updates arrive through email, use ``ctm_rmail`` to unpack and
apply them. This command can be run directly from an entry in
``/etc/aliases`` in order to automate this process. Refer to
`ctm\_rmail(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ctm_rmail&sektion=1>`__
for more details.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Regardless of the method which is used to get deltas, CTM users should
subscribe to the
`ctm-announce <http://lists.FreeBSD.org/mailman/listinfo/ctm-announce>`__
mailing list as this is the only mechanism by which CTM announcements
are posted.

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

A.3.2.?CTM Usage
~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Before CTM deltas can be used for the first time, a starting point must
be produced.

One method is to apply a “starter” delta to an empty directory. A
starter delta can be recognized by the ``XEmpty`` in its name, such as
``src-cur.3210XEmpty.gz``. The designation following the ``X``
corresponds to the origin of the initial “seed”, where ``Empty`` is an
empty directory. As a rule, a base transition from ``Empty`` is produced
every 100 deltas. Be aware that starter deltas are large and 70 to 80
Megabytes of ``gzip``'d data is common for the ``XEmpty`` deltas.

Another method is to copy or extract an initial source from a RELEASE
media as this can save a significant transfer of data from the Internet.

Once a base delta has been created, apply all deltas with higher
numbers. To apply the deltas:

.. code:: screen

    # cd /directory/to/store/the/stuff
    # ctm -v -v /directory/which/stores/the/deltas/src-xxx.*

Multiple deltas can be applied with a single command as they will be
processed one at a time and any deltas that are already applied will be
ignored. CTM understands ``gzip`` compressed deltas, which saves disk
space.

To verify a delta without applying it, include ``-c`` in the command
line. CTM will not actually modify the local tree but will instead
verify the integrity of the delta to see if it would apply cleanly.
Refer to
`ctm(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ctm&sektion=1>`__ for
more information about available options and an overview of the process
CTM uses when applying deltas.

To keep the local source tree up-to-date, every time a new delta becomes
available, apply it through CTM.

Once applied, it is recommended to not delete the deltas if it is a
burden to download them again. This way, a local copy is available in
case it is needed for future disaster recovery.

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

A.3.3.?Keeping Local Changes
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Developers often experiment with and change files in their local source
tree. CTM supports local modifications in a limited way: before checking
for the presence of a file, it first looks for a file with the same name
and a ``.ctm`` extension. If this file exists, CTM will operate on it
instead of the original filename.

This behavior provides a simple way to maintain local changes. Before
modifying a file, make a copy with a ``.ctm`` suffix. Make any changes
to the original filename, knowing that CTM will only apply updates to
the file with the ``.ctm`` suffix.

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

A.3.4.?Other CTM Options
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="variablelist">

Finding Out Exactly What Would Be Touched by an Update
    To determine the list of changes that CTM will make to the local
    source repository, use ``-l``. This option is useful for creating
    logs of the changes or when performing pre- or post-processing on
    any of the modified files.

Making Backups Before Updating
    To backup all of the files that would be changed by a CTM update,
    specify ``-B         backup-file``. This option tells CTM to backup
    all files touched by the applied CTM delta to ``backup-file``.

Restricting the Files Touched by an Update
    To restrict the scope of a given CTM update, or to extract just a
    few files from a sequence of deltas, filtering regular expressions
    can be specified using ``-e``, which specifies which files to
    process, or ``-x``, which specifies which files to ignore.

    For example, to extract an up-to-date copy of ``lib/libc/Makefile``
    from a collection of saved CTM deltas:

    .. code:: screen

        # cd /directory/to/extract/to/
        # ctm -e '^lib/libc/Makefile' /directory/which/stores/the/deltas/src-xxx.*

    For every file specified in a CTM delta, ``-e`` and ``-x`` are
    applied in the order given on the command line. A file is processed
    by CTM only if it is marked as eligible after all ``-e`` and ``-x``
    options are applied.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------+-------------------------+--------------------------+
| `Prev <mirrors-ftp.html>`__?   | `Up <mirrors.html>`__   | ?\ `Next <svn.html>`__   |
+--------------------------------+-------------------------+--------------------------+
| A.2.?FTP Sites?                | `Home <index.html>`__   | ?A.4.?Using Subversion   |
+--------------------------------+-------------------------+--------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
