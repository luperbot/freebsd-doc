====================================
15.3.?Creating and Controlling Jails
====================================

.. raw:: html

   <div class="navheader">

15.3.?Creating and Controlling Jails
`Prev <jails-terms.html>`__?
Chapter?15.?Jails
?\ `Next <jails-tuning.html>`__

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

15.3.?Creating and Controlling Jails
------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Some administrators divide jails into the following two types:
“complete” jails, which resemble a real FreeBSD system, and “service”
jails, dedicated to one application or service, possibly running with
privileges. This is only a conceptual division and the process of
building a jail is not affected by it. When creating a “complete” jail
there are two options for the source of the userland: use prebuilt
binaries (such as those supplied on an install media) or build from
source.

To install the userland from installation media, first create the root
directory for the jail. This can be done by setting the ``DESTDIR``
variable to the proper location.

Start a shell and define ``DESTDIR``:

.. code:: screen

    # sh
    # export DESTDIR=/here/is/the/jail

Mount the install media as covered in
`mdconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mdconfig&sektion=8>`__
when using the install ISO:

.. code:: screen

    # mount -t cd9660 /dev/`mdconfig -f cdimage.iso` /mnt

Extract the binaries from the tarballs on the install media into the
declared destination. Minimally, only the base set needs to be
extracted, but a complete install can be performed when preferred.

To install just the base system, run the next command when using
FreeBSD?9.x or newer:

.. code:: screen

    # tar -xf /mnt/usr/freebsd_dist/base.txz -C $DESTDIR

On FreeBSD 8.x systems, use this command instead:

.. code:: screen

    # /mnt/8.4-RELEASE/base/install.sh

To install everything except the kernel, issue one of these commands:

When using FreeBSD?9.x and newer:

.. code:: screen

    # for sets in BASE PORTS; do tar -xf /mnt/FREEBSD_INSTALL/USR/FREEBSD_DIST/$sets.TXZ -C $DESTDIR ; done

When using FreeBSD?8.x:

.. code:: screen

    # cd /mnt/8.4-RELEASE; for dir in base catpages dict doc games info manpages ports; do (cd $dir; ./install.sh) ; done

The
`jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8>`__
manual page explains the procedure for building a jail:

.. code:: screen

    # setenv D /here/is/the/jail
    # mkdir -p $D      
    # cd /usr/src
    # make buildworld  
    # make installworld DESTDIR=$D  
    # make distribution DESTDIR=$D  
    # mount -t devfs devfs $D/dev   

.. raw:: html

   <div class="calloutlist">

+--------------------------------------+--------------------------------------+
| `|1| <#jailpath>`__                  | Selecting a location for a jail is   |
|                                      | the best starting point. This is     |
|                                      | where the jail will physically       |
|                                      | reside within the file system of the |
|                                      | jail's host. A good choice can be    |
|                                      | ``/usr/jail/jailname``, where        |
|                                      | *``jailname``* is the hostname       |
|                                      | identifying the jail. The ``/usr/``  |
|                                      | file system usually has enough space |
|                                      | for the jail file system, which for  |
|                                      | “complete” jails is, essentially, a  |
|                                      | replication of every file present in |
|                                      | a default installation of the        |
|                                      | FreeBSD base system.                 |
+--------------------------------------+--------------------------------------+
| `|2| <#jailbuildworld>`__            | If you have already rebuilt your     |
|                                      | userland using ``make world`` or     |
|                                      | ``make buildworld``, you can skip    |
|                                      | this step and install your existing  |
|                                      | userland into the new jail.          |
+--------------------------------------+--------------------------------------+
| `|3| <#jailinstallworld>`__          | This command will populate the       |
|                                      | directory subtree chosen as jail's   |
|                                      | physical location on the file system |
|                                      | with the necessary binaries,         |
|                                      | libraries, manual pages and so on.   |
+--------------------------------------+--------------------------------------+
| `|4| <#jaildistrib>`__               | The ``distribution`` target for make |
|                                      | installs every needed configuration  |
|                                      | file. In simple words, it installs   |
|                                      | every installable file of            |
|                                      | ``/usr/src/etc/`` to the ``/etc``    |
|                                      | directory of the jail environment:   |
|                                      | ``$D/etc/``.                         |
+--------------------------------------+--------------------------------------+
| `|5| <#jaildevfs>`__                 | Mounting the                         |
|                                      | `devfs(8) <http://www.FreeBSD.org/cg |
|                                      | i/man.cgi?query=devfs&sektion=8>`__  |
|                                      | file system inside a jail is not     |
|                                      | required. On the other hand, any, or |
|                                      | almost any application requires      |
|                                      | access to at least one device,       |
|                                      | depending on the purpose of the      |
|                                      | given application. It is very        |
|                                      | important to control access to       |
|                                      | devices from inside a jail, as       |
|                                      | improper settings could permit an    |
|                                      | attacker to do nasty things in the   |
|                                      | jail. Control over                   |
|                                      | `devfs(8) <http://www.FreeBSD.org/cg |
|                                      | i/man.cgi?query=devfs&sektion=8>`__  |
|                                      | is managed through rulesets which    |
|                                      | are described in the                 |
|                                      | `devfs(8) <http://www.FreeBSD.org/cg |
|                                      | i/man.cgi?query=devfs&sektion=8>`__  |
|                                      | and                                  |
|                                      | `devfs.conf(5) <http://www.FreeBSD.o |
|                                      | rg/cgi/man.cgi?query=devfs.conf&sekt |
|                                      | ion=5>`__                            |
|                                      | manual pages.                        |
+--------------------------------------+--------------------------------------+

.. raw:: html

   </div>

Once a jail is installed, it can be started by using the
`jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8>`__
utility. The
`jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8>`__
utility takes four mandatory arguments which are described in the
`Section?15.1, “Synopsis” <jails.html#jails-synopsis>`__. Other
arguments may be specified too, e.g., to run the jailed process with the
credentials of a specific user. The ``command`` argument depends on the
type of the jail; for a *virtual system*, ``/etc/rc`` is a good choice,
since it will replicate the startup sequence of a real FreeBSD system.
For a *service* jail, it depends on the service or application that will
run within the jail.

Jails are often started at boot time and the FreeBSD ``rc`` mechanism
provides an easy way to do this.

.. raw:: html

   <div class="procedure">

#. A list of the jails which are enabled to start at boot time should be
   added to the
   `rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5>`__
   file:

   .. code:: programlisting

       jail_enable="YES"   # Set to NO to disable starting of any jails
       jail_list="www"     # Space separated list of names of jails

   .. raw:: html

      <div class="note" xmlns="">

   Note:
   ~~~~~

   Jail names in ``jail_list`` should contain alphanumeric characters
   only.

   .. raw:: html

      </div>

#. For each jail listed in ``jail_list``, a group of
   `rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5>`__
   settings, which describe the particular jail, should be added:

   .. code:: programlisting

       jail_www_rootdir="/usr/jail/www"     # jail's root directory
       jail_www_hostname="www.example.org"  # jail's hostname
       jail_www_ip="192.168.0.10"           # jail's IP address
       jail_www_devfs_enable="YES"          # mount devfs in the jail

   The default startup of jails configured in
   `rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5>`__,
   will run the ``/etc/rc`` script of the jail, which assumes the jail
   is a complete virtual system. For service jails, the default startup
   command of the jail should be changed, by setting the
   ``jail_jailname``\ \_exec\_start option appropriately.

   .. raw:: html

      <div class="note" xmlns="">

   Note:
   ~~~~~

   For a full list of available options, please see the
   `rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5>`__
   manual page.

   .. raw:: html

      </div>

.. raw:: html

   </div>

`service(8) <http://www.FreeBSD.org/cgi/man.cgi?query=service&sektion=8>`__
can be used to start or stop a jail by hand, if an entry for it exists
in ``rc.conf``:

.. code:: screen

    # service jail start www
    # service jail stop www

Jails can be shut down with
`jexec(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jexec&sektion=8>`__.
Use `jls(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jls&sektion=8>`__
to identify the jail's ``JID``, then use
`jexec(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jexec&sektion=8>`__
to run the shutdown script in that jail.

.. code:: screen

    # jls
       JID  IP Address      Hostname                      Path
         3  192.168.0.10    www                           /usr/jail/www
    # jexec 3 /etc/rc.shutdown

More information about this can be found in the
`jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8>`__
manual page.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------+-------------------------+-----------------------------------------+
| `Prev <jails-terms.html>`__?    | `Up <jails.html>`__     | ?\ `Next <jails-tuning.html>`__         |
+---------------------------------+-------------------------+-----------------------------------------+
| 15.2.?Terms Related to Jails?   | `Home <index.html>`__   | ?15.4.?Fine Tuning and Administration   |
+---------------------------------+-------------------------+-----------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.

.. |1| image:: ./imagelib/callouts/1.png
.. |2| image:: ./imagelib/callouts/2.png
.. |3| image:: ./imagelib/callouts/3.png
.. |4| image:: ./imagelib/callouts/4.png
.. |5| image:: ./imagelib/callouts/5.png
