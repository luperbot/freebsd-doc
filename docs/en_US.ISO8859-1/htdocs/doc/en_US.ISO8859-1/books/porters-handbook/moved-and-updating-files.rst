========================
10.2.?UPDATING and MOVED
========================

.. raw:: html

   <div class="navheader">

10.2.?\ ``UPDATING`` and ``MOVED``
`Prev <port-upgrading.html>`__?
Chapter?10.?Upgrading a Port
?\ `Next <security.html>`__

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

10.2.?\ ``UPDATING`` and ``MOVED``
----------------------------------

.. raw:: html

   </div>

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

10.2.1.?\ ``/usr/ports/UPDATING``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If upgrading the port requires special steps like changing configuration
files or running a specific program, it must be documented in this file.
The format of an entry in this file is as follows:

.. code:: programlisting

    YYYYMMDD:
      AFFECTS: users of portcategory/portname
      AUTHOR: Your name <Your email address>

      Special instructions

.. raw:: html

   <div class="tip" xmlns="">

Tip:
~~~~

When including exact portmaster, portupgrade, and/or pkg instructions,
please make sure to get the shell escaping right. For example, do *not*
use:

.. code:: screen

    # pkg delete -g -f docbook-xml* docbook-sk* docbook[2345]??-* docbook-4*

As shown, the command will only work with bourne shells. Instead, use
the form shown below, which will work with both bourne shell and
c-shell:

.. code:: screen

    # pkg delete -g -f docbook-xml\* docbook-sk\* docbook\[2345\]\?\?-\* docbook-4\*

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

It is recommended that the AFFECTS line contains a glob matching all the
ports affected by the entry so that automated tools can parse it as
easily as possible. If an update concerns all the existing BIND 9
versions the ``AFFECTS`` content must be ``users of dns/bind9*``, it
must *not* be ``users of BIND       9``

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

10.2.2.?\ ``/usr/ports/MOVED``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This file is used to list moved or removed ports. Each line in the file
is made up of the name of the port, where the port was moved, when, and
why. If the port was removed, the section detailing where it was moved
can be left blank. Each section must be separated by the ``|`` (pipe)
character, like so:

.. code:: programlisting

    old name|new name (blank for deleted)|date of move|reason

The date must be entered in the form ``YYYY-MM-DD``. New entries are
added to the top of the file to keep it in reverse chronological order,
with the last entry first.

If a port was removed but has since been restored, delete the line in
this file that states that it was removed.

If a port was renamed and then renamed back to its original name, add a
new one with the intermediate name to the old name, and remove the old
entry as to not create a loop.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Any changes must be validated with ``Tools/scripts/MOVEDlint.awk``.

If using a ports directory other than ``/usr/ports``, use:

.. raw:: html

   <div class="informalexample" xmlns="http://www.w3.org/1999/xhtml">

.. code:: screen

    % cd /home/user/ports
    % env PORTSDIR=$PWD Tools/scripts/MOVEDlint.awk

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

+-----------------------------------+--------------------------------+-------------------------------+
| `Prev <port-upgrading.html>`__?   | `Up <port-upgrading.html>`__   | ?\ `Next <security.html>`__   |
+-----------------------------------+--------------------------------+-------------------------------+
| Chapter?10.?Upgrading a Port?     | `Home <index.html>`__          | ?Chapter?11.?Security         |
+-----------------------------------+--------------------------------+-------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
