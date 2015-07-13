==========
3.?Clients
==========

.. raw:: html

   <div class="navheader">

3.?Clients
`Prev <start.html>`__?
?
?\ `Next <syncing.html>`__

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

3.?Clients
----------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Perforce provides access to the repository and tracks state on a
per-client basis. In Perforce terms, a client is a specification that
maps files and directories from the repository to the local machine.
Each user can have multiple clients, and each client can access
different or overlapping parts of the repository. The client also
specifies the root directory of the file tree that it maps, and it
specifies the machine that the tree lives on. Thus, working on multiple
machines requires that multiple clients be used.

Clients may be accessed via ``p4 client``. Running this command with no
arguments will bring up a client template in an editor, allowing you to
create a new client for your work. The important fields in this template
are explained below:

.. raw:: html

   <div class="variablelist">

``Client:``
    This is the name of the client spec. It can be anything you want,
    but it must be unique within the Perforce server. A naming
    convention that is commonly used is
    ``username``\ \_\ *``machinename``*, which makes it easy to identify
    clients when browsing them. A default name will be filled in that is
    just the machine name.

``Description:``
    This can contain a simple text description to help identify the
    client.

``Root:``
    This is the local directory that will serve as the root directory of
    all the files in the client mapping. This should be a unique
    location in your filesystem that does not overlap with other files
    or Perforce clients.

``Options:``
    Most of the default options are fine, though it is usually a good
    idea to make sure that the ``compress`` and ``rmdir`` options are
    present and do not have a ``no`` prefix on them. Details about each
    option are in the Perforce docs.

``LineEnd:``
    This handles CR-LF conversions and should be left to the default
    unless you have special needs for it.

``View:``
    This is where the server-to-local file mappings go. The default is

    .. code:: programlisting

        //depot/... //client/...

    This will map the entire Perforce repository to the ``Root``
    directory of your client. *DO NOT USE THIS DEFAULT!* The FreeBSD
    repo is huge, and trying to map and sync it all will take an
    enormous amount of resources. Instead, only map the section of the
    repo that you intend to work on. For example, there is the smpng
    project tree at ``//depot/projects/smpng``. A mapping for this might
    look like:

    .. code:: programlisting

        //depot/projects/smpng/... //client/...

    The ``...`` should be taken literally. It is a Perforce idiom for
    saying “this directory and all files and directories below it.”

    A Perforce “view” can contain multiple mappings. Say you want to map
    in both the SMPng tree and the NFS tree. Your View might look like:

    .. code:: programlisting

        //depot/projects/smpng/... //client/smpng/...
              //depot/projects/nfs/... //client/nfs/...

    Remember that the *``client``* is the name of the client that was
    specified in the ``Client`` section, but in the ``View`` it also
    resolves to the directory that was specified in the ``Root``
    section.

    Also note that the same file or directory cannot be mapped multiple
    times in a single view. The following is illegal and will produce
    undefined results:

    .. code:: programlisting

        //depot/projects/smpng/... //client/smpng-foo/...
              //depot/projects/smpng/... //client/smpng-bar/...

    Views are a tricky part of the learning experience with Perforce, so
    do not be afraid to ask questions.

.. raw:: html

   </div>

Existing clients can be listed via ``p4     clients``. They can be
viewed without being modified via ``p4 client -o     clientname``.

Whenever you are interacting with files in Perforce, the ``P4CLIENT``
environment variable must be set to the name of the client that you are
using, like so:

.. code:: screen

    % export P4CLIENT=myclientname

Note that client mappings in the repository are not exclusive; multiple
clients can map in the same part of the repository. This allows multiple
people to access and modify the same parts of the repository, allowing a
team of people to work together on the same code.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------+-------------------------+------------------------------+
| `Prev <start.html>`__?   | ?                       | ?\ `Next <syncing.html>`__   |
+--------------------------+-------------------------+------------------------------+
| 2.?Getting Started?      | `Home <index.html>`__   | ?4.?Syncing                  |
+--------------------------+-------------------------+------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
