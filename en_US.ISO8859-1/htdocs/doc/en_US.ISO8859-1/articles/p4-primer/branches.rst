===========
5.?Branches
===========

.. raw:: html

   <div class="navheader">

5.?Branches
`Prev <syncing.html>`__?
?
?\ `Next <Integrations.html>`__

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

5.?Branches
-----------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

One of the strongest features of Perforce is branching. Branches are
very cheap to create, and moving changes between related branches is
very easy (as will be explained later). Branches also allow you to do
very experimental work in a sandbox-like environment, without having to
worry about colliding with others or destabilizing the main tree. They
also provide insulation against mistakes while learning the Perforce
system. With all of these benefits, it makes sense for each project to
have its own branch, and we strongly encourage that with FreeBSD.
Frequent submits of changes to the server are also encouraged.

Similar to Subversion, the Perforce repository (the “depot”) is a single
flat tree. Every file, whether a unique creation or a derivative from a
branch, is accessible via a simple path under the server ``//depot``
directory. When you create a branch, all you are doing is creating a new
path under the ``//depot``. This is in sharp contrast to systems like
CVS, where each branch lives in the same path as its parent. With
Perforce, the server tracks the relationship between the files in the
parent and child, but the files themselves live under their own paths.

The first step to creating a branch is to create a branch specification.
This is similar to a client specification, but is created via the
command ``p4 branch     branchname``.

The following important fields are explained:

.. raw:: html

   <div class="variablelist">

``Branch``
    The name of the branch. It can be any name, but must be unique
    within the repository. The common convention in FreeBSD is to use
    *``username``*\ \_\ *``projectname``*.

``Description``
    This can hold a simple text description to describe the branch.

``View``
    This is the branch mapping. Instead of mapping from the depot to the
    local machine like a client map, it maps between the branch parent
    and branch child in the depot. For example, you might want to create
    a branch of the smpng project. The mapping might look like:

    .. code:: programlisting

        //depot/projects/smpng/... //depot/projects/my-super-smpng/...

    Or, you might want to create a brand new branch off of the stock
    FreeBSD sources:

    .. code:: programlisting

        //depot/vendor/freebsd/... //depot/projects/my-new-project/...

    This will map the FreeBSD HEAD tree to your new branch.

.. raw:: html

   </div>

Creating the branch spec only saves the spec itself in the server, it
does not modify the depot or change any files. The directory that you
specified in the branch is empty on the server until you populate it.

To populate your branch, first edit your client with ``p4 client`` and
make sure that the branch directory is mapped in your client. You might
need to add a ``View`` line like:

.. code:: programlisting

    //depot/projects/my-new-project/... //myclient/my-new-project/...

The next step is to run ``p4 integrate``, as described in the next
section.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------+-------------------------+-----------------------------------+
| `Prev <syncing.html>`__?   | ?                       | ?\ `Next <Integrations.html>`__   |
+----------------------------+-------------------------+-----------------------------------+
| 4.?Syncing?                | `Home <index.html>`__   | ?6.?Integrations                  |
+----------------------------+-------------------------+-----------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
