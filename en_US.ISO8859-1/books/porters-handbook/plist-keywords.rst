=========================================
7.6.?Expanding Package List with Keywords
=========================================

.. raw:: html

   <div class="navheader">

7.6.?Expanding Package List with Keywords
`Prev <plist-autoplist.html>`__?
Chapter?7.?Advanced ``pkg-plist`` Practices
?\ `Next <pkg-files.html>`__

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

7.6.?Expanding Package List with Keywords
-----------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

All keywords can also take optional arguments in parentheses. The
arguments are owner, group, and mode. This argument is used on the file
or directory referenced. To change the owner, group, and mode of a
configuration file, use:

.. code:: programlisting

    @sample(games,games,640) etc/config.sample

The arguments are optional. If only the group and mode need to be
changed, use:

.. code:: programlisting

    @sample(,games,660) etc/config.sample

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

7.6.1.?\ ``@desktop-file-utils``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Will run ``update-desktop-database -q`` after installation and
deinstallation.

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

7.6.2.?\ ``@fcfontsdir`` *``directory``*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Add a ``@dir`` entry for the directory passed as an argument, and run
``fc-cache       -s``, ``mkfontscale`` and ``mkfontdir`` on that
directory after installation and deinstallation. Additionally, on
deinstallation, it removes the ``fonts.scale`` and ``fonts.dir`` cache
files if they are empty.

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

7.6.3.?\ ``@glib-schemas``
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Runs ``glib-compile-schemas`` on installation and deinstallation.

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

7.6.4.?\ ``@info`` *``file``*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Add the file passed as argument to the plist, and updates the info
document index on installation and deinstallation. Additionally, it
removes the index if empty on deinstallation. This should never be used
manually, but always through ``INFO``. See `Section?5.11, “Info
Files” <makefile-info.html>`__ for more information.

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

7.6.5.?\ ``@kld`` *``directory``*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Runs ``kldxref`` on the directory on installation and deinstallation.
Additionally, on deinstallation, it will remove the directory if empty.

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

7.6.6.?\ ``@rmtry`` *``file``*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Will remove the file on deinstallation, and not give an error if the
file is not there.

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

7.6.7.?\ ``@sample`` *``file``*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Add the file passed as argument to the plist.

On installation, check for a “real” file with just the base name (the
name without the ``.sample`` extension). If the real file is not found,
copy the sample file to the base file name. On deinstallation, remove
the configuration file if it has not been modified. See `Section?7.3,
“Configuration Files” <plist-config.html>`__ for more information.

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

7.6.8.?\ ``@shared-mime-info`` *``directory``*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Runs ``update-mime-database`` on the directory on installation and
deinstallation.

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

7.6.9.?\ ``@shell`` *``file``*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Add the file passed as argument to the plist.

On installation, add the full path to *``file``* to ``/etc/shells``,
while making sure it is not added twice. On deinstallation, remove it
from ``/etc/shells``.

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

7.6.10.?Base Keywords
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

There are a few keywords that are hardcoded, and documented in
`pkg-create(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg-create&sektion=8>`__.
For the sake of completeness, they are also documented here.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

7.6.10.1.?\ ``@`` [*``file``*\ ]
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The empty keyword is a placeholder to use when the file's owner, group,
or mode need to be changed. For example, to set the group of the file to
``games`` and add the setgid bit, add:

.. code:: programlisting

    @(,games,2755) sbin/daemon

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

7.6.10.2.?\ ``@cwd`` [*``directory``*\ ] (Deprecated)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Set the internal directory pointer to point to directory. All subsequent
filenames are assumed relative to this directory.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

7.6.10.3.?\ ``@exec`` *``command``*
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Execute *``command``* as part of the unpacking process. If command
contains any of these sequences somewhere in it, they are expanded
inline. For these examples, assume that ``@cwd`` is set to
``/usr/local`` and the last extracted file was ``bin/emacs``.

.. raw:: html

   <div class="variablelist">

``%F``
    Expand to the last filename extracted (as specified). In the example
    case ``bin/emacs``.

``%D``
    Expand to the current directory prefix, as set with ``@cwd``. In the
    example case ``/usr/local``.

``%B``
    Expand to the basename of the fully qualified filename, that is, the
    current directory prefix plus the last filespec, minus the trailing
    filename. In the example case, that would be ``/usr/local/bin``.

``%f``
    Expand to the filename part of the fully qualified name, or the
    converse of ``%B``. In the example case, ``emacs``.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

7.6.10.4.?\ ``@unexec`` *``command``*
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Execute *``command``* as part of the deinstallation process. Expansion
of special ``%`` sequences is the same as for ``@exec``. This command is
not executed during the package add, as ``@exec`` is, but rather when
the package is deleted. This is useful for deleting links and other
ancillary files that were created as a result of adding the package, but
not directly known to the package's table of contents (and hence not
automatically removable).

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

7.6.10.5.?\ ``@mode`` *``mode``*
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Set default permission for all subsequently extracted files to
*``mode``*. Format is the same as that used by
`chmod(1) <http://www.FreeBSD.org/cgi/man.cgi?query=chmod&sektion=1>`__.
Use without an arg to set back to default permissions (mode of the file
while being packed).

.. raw:: html

   <div class="important" xmlns="">

Important:
~~~~~~~~~~

This must be a numeric mode, like ``644``, ``4755``, or ``600``. It
cannnot be a relative mode like ``u+s``.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

7.6.10.6.?\ ``@owner`` *``user``*
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Set default ownership for all subsequent files to *``user``*. Use
without an argument to set back to default ownership (``root``).

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

7.6.10.7.?\ ``@group`` *``group``*
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Set default group ownership for all subsequent files to *``group``*. Use
without an arg to set back to default group ownership (``wheel``).

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

7.6.10.8.?\ ``@comment`` *``string``*
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This line is ignored when packing.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

7.6.10.9.?\ ``@dir`` *``directory``*
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Declare directory name. By default, directories created under ``PREFIX``
by a package installation are automatically removed. Use this when an
empty directory under ``PREFIX`` needs to be created, or when the
directory needs to have non default owner, group, or mode. Directories
outside of ``PREFIX`` need to be registered. For example,
``/var/db/${PORTNAME}`` needs to have a ``@dir`` entry whereas
``${PREFIX}/share/${PORTNAME}`` does not if it contains files or uses
the default owner, group, and mode.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

7.6.10.10.?\ ``@dirrm`` *``directory``* (Deprecated)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Declare directory name to be deleted at deinstall time. By default,
directories created under ``PREFIX`` by a package installation are
deleted when the package is deinstalled.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

7.6.10.11.?\ ``@dirrmtry`` *``directory``* (Deprecated)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Declare directory name to be removed, as for ``@dirrm``, but does not
issue a warning if the directory cannot be removed.

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

7.6.11.?Creating New Keywords
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Package list files can be extended by keywords that are defined in the
``${PORTSDIR}/Keywords`` directory. The settings for each keyword are
stored in a UCL file named ``keyword``.ucl. The file must contain at
least one of the next sections:

.. raw:: html

   <div class="variablelist">

``attributes``
    Changes the owner, group, or mode used by the keyword. Contains an
    associative array where the possible keys are ``owner``, ``group``,
    and ``mode``. The values are, respectively, a user name, a group
    name, and a file mode. For example:

    .. code:: programlisting

        attributes: { owner: "games", group: "games", mode: 0555 }

``action``
    Defines what happens to the keyword's parameter. Contains an array
    where the possible values are:

    .. raw:: html

       <div class="variablelist">

    ``setprefix``
        Set the prefix for the next plist entries.

    ``dir``
        Register a directory to be created on install and removed on
        deinstall.

    ``dirrm``
        Register a directory to be deleted on deinstall. Deprecated.

    ``dirrmtry``
        Register a directory to try and deleted on deinstall.
        Deprecated.

    ``file``
        Register a file.

    ``setmode``
        Set the mode for the next plist entries.

    ``setowner``
        Set the owner for the next plist entries.

    ``setgroup``
        Set the group for the next plist entries.

    ``comment``
        Does not do anything, equivalent to not entering an ``action``
        section.

    ``ignore_next``
        Ignore the next entry in the plist.

    .. raw:: html

       </div>

``pre-install``, ``post-install``, ``pre-deinstall``,
``post-deinstall``, ``pre-upgrade``, ``post-upgrade``
    These keywords contains a
    `sh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sh&sektion=1>`__
    script to be executed before or after installation, deinstallation,
    or upgrade of the package. In addition to the usual ``@exec``
    ``%foo`` placeholders described in `Section?7.6.10.3, “\ ``@exec``
    *``command``*\ ” <plist-keywords.html#plist-keywords-base-exec>`__,
    there is a new one, ``%@``, which represents the argument of the
    keyword.

.. raw:: html

   </div>

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?7.1.?Example of a ``@dirrmtryecho`` Keyword

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

This keyword does two things, it adds a ``@dirrmtry         directory``
line to the packing list, and echoes the fact that the directory is
removed when deinstalling the package.

.. code:: programlisting

    actions: [dirrmtry]
    post-deinstall: <<EOD
      echo "Directory %D/%@ removed."
    EOD

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?7.2.?Real Life Example, How ``@sample`` is Implemented

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

This keyword does three things, it adds the *``filename``* passed as an
argument to ``@sample`` to the packing list, it adds to the
``post-install`` script instructions to copy the sample to the actual
configuration file if it does not already exist, and it adds to the
``post-deinstall`` instructions to remove the configuration file if it
has not been modified.

.. code:: programlisting

    actions: [file]
    post-install: <<EOD
      case "%@" in
      /*) sample_file="%@" ;;
      *) sample_file="%D/%@" ;;
      esac
      target_file="${sample_file%.sample}"
      if ! [ -f "${target_file}" ]; then
        /bin/cp -p "${sample_file}" "${target_file}"
      fi
    EOD
    pre-deinstall: <<EOD
      case "%@" in
      /*) sample_file="%@" ;;
      *) sample_file="%D/%@" ;;
      esac
      target_file="${sample_file%.sample}"
      if cmp -s "${target_file}" "${sample_file}"; then
        rm -f "${target_file}"
      else
        echo "You may need to manually remove ${target_file} if it's no longer needed."
      fi
    EOD

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------+-------------------------+--------------------------------+
| `Prev <plist-autoplist.html>`__?        | `Up <plist.html>`__     | ?\ `Next <pkg-files.html>`__   |
+-----------------------------------------+-------------------------+--------------------------------+
| 7.5.?Automated Package List Creation?   | `Home <index.html>`__   | ?Chapter?8.?\ ``pkg-*``        |
+-----------------------------------------+-------------------------+--------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
