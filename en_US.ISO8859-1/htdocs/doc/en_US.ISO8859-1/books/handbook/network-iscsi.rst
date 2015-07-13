===============================================
29.12.?iSCSI Initiator and Target Configuration
===============================================

.. raw:: html

   <div class="navheader">

29.12.?iSCSI Initiator and Target Configuration
`Prev <network-ntp.html>`__?
Chapter?29.?Network Servers
?\ `Next <firewalls.html>`__

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

29.12.?iSCSI Initiator and Target Configuration
-----------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

iSCSI is a way to share storage over a network. Unlike NFS, which works
at the file system level, iSCSI works at the block device level.

In iSCSI terminology, the system that shares the storage is known as the
*target*. The storage can be a physical disk, or an area representing
multiple disks or a portion of a physical disk. For example, if the
disk(s) are formatted with ZFS, a zvol can be created to use as the
iSCSI storage.

The clients which access the iSCSI storage are called *initiators*. To
initiators, the storage available through iSCSI appears as a raw,
unformatted disk known as a LUN. Device nodes for the disk appear in
``/dev/`` and the device must be separately formatted and mounted.

Beginning with 10.0-RELEASE, FreeBSD provides a native, kernel-based
iSCSI target and initiator. This section describes how to configure a
FreeBSD system as a target or an initiator.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

29.12.1.?Configuring an iSCSI Target
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

The native iSCSI target is supported starting with FreeBSD 10.0-RELEASE.
To use iSCSI in older versions of FreeBSD, install a userspace target
from the Ports Collection, such as
`net/istgt <http://www.freebsd.org/cgi/url.cgi?ports/net/istgt/pkg-descr>`__.
This chapter only describes the native target.

.. raw:: html

   </div>

To configure an iSCSI target, create the ``/etc/ctl.conf`` configuration
file, add a line to ``/etc/rc.conf`` to make sure the
`ctld(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ctld&sektion=8>`__
daemon is automatically started at boot, and then start the daemon.

The following is an example of a simple ``/etc/ctl.conf`` configuration
file. Refer to
`ctl.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=ctl.conf&sektion=5>`__
for a more complete description of this file's available options.

.. code:: programlisting

    portal-group pg0 {
        discovery-auth-group no-authentication
        listen 0.0.0.0
        listen [::]
    }

    target iqn.2012-06.com.example:target0 {
        auth-group no-authentication
        portal-group pg0

        lun 0 {
            path /data/target0-0
            size 4G
        }
    }

The first entry defines the ``pg0`` portal group. Portal groups define
which network addresses the
`ctld(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ctld&sektion=8>`__
daemon will listen on. The ``discovery-auth-group no-authentication``
entry indicates that any initiator is allowed to perform iSCSI target
discovery without authentication. Lines three and four configure
`ctld(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ctld&sektion=8>`__ to
listen on all IPv4 (``listen 0.0.0.0``) and IPv6 (``listen [::]``)
addresses on the default port of 3260.

It is not necessary to define a portal group as there is a built-in
portal group called ``default``. In this case, the difference between
``default`` and ``pg0`` is that with ``default``, target discovery is
always denied, while with ``pg0``, it is always allowed.

The second entry defines a single target. Target has two possible
meanings: a machine serving iSCSI or a named group of LUNs. This example
uses the latter meaning, where ``iqn.2012-06.com.example:target0`` is
the target name. This target name is suitable for testing purposes. For
actual use, change ``com.example`` to the real domain name, reversed.
The ``2012-06`` represents the year and month of acquiring control of
that domain name, and ``target0`` can be any value. Any number of
targets can be defined in this configuration file.

The ``auth-group no-authentication`` line allows all initiators to
connect to the specified target and ``portal-group pg0`` makes the
target reachable through the ``pg0`` portal group.

The next section defines the LUN. To the initiator, each LUN will be
visible as a separate disk device. Multiple LUNs can be defined for each
target. Each LUN is identified by a number, where LUN 0 is mandatory.
The ``path /data/target0-0`` line defines the full path to a file or
zvol backing the LUN. That path must exist before starting
`ctld(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ctld&sektion=8>`__.
The second line is optional and specifies the size of the LUN.

Next, to make sure the
`ctld(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ctld&sektion=8>`__
daemon is started at boot, add this line to ``/etc/rc.conf``:

.. code:: programlisting

    ctld_enable="YES"

To start
`ctld(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ctld&sektion=8>`__
now, run this command:

.. code:: screen

    # service ctld start

As the
`ctld(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ctld&sektion=8>`__
daemon is started, it reads ``/etc/ctl.conf``. If this file is edited
after the daemon starts, use this command so that the changes take
effect immediately:

.. code:: screen

    # service ctld reload

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

29.12.1.1.?Authentication
^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The previous example is inherently insecure as it uses no
authentication, granting anyone full access to all targets. To require a
username and password to access targets, modify the configuration as
follows:

.. code:: programlisting

    auth-group ag0 {
        chap username1 secretsecret
        chap username2 anothersecret
    }

    portal-group pg0 {
        discovery-auth-group no-authentication
        listen 0.0.0.0
        listen [::]
    }

    target iqn.2012-06.com.example:target0 {
        auth-group ag0
        portal-group pg0
        lun 0 {
            path /data/target0-0
            size 4G
        }
    }

The ``auth-group`` section defines username and password pairs. An
initiator trying to connect to ``iqn.2012-06.com.example:target0`` must
first specify a defined username and secret. However, target discovery
is still permitted without authentication. To require target discovery
authentication, set ``discovery-auth-group`` to a defined ``auth-group``
name instead of ``no-authentication``.

It is common to define a single exported target for every initiator. As
a shorthand for the syntax above, the username and password can be
specified directly in the target entry:

.. code:: programlisting

    target iqn.2012-06.com.example:target0 {
        portal-group pg0
        chap username1 secretsecret

        lun 0 {
            path /data/target0-0
            size 4G
        }
    }

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

29.12.2.?Configuring an iSCSI Initiator
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

The iSCSI initiator described in this section is supported starting with
FreeBSD 10.0-RELEASE. To use the iSCSI initiator available in older
versions, refer to
`iscontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=iscontrol&sektion=8>`__.

.. raw:: html

   </div>

The iSCSI initiator requires that the
`iscsid(8) <http://www.FreeBSD.org/cgi/man.cgi?query=iscsid&sektion=8>`__
daemon is running. This daemon does not use a configuration file. To
start it automatically at boot, add this line to ``/etc/rc.conf``:

.. code:: programlisting

    iscsid_enable="YES"

To start
`iscsid(8) <http://www.FreeBSD.org/cgi/man.cgi?query=iscsid&sektion=8>`__
now, run this command:

.. code:: screen

    # service iscsid start

Connecting to a target can be done with or without an
``/etc/iscsi.conf`` configuration file. This section demonstrates both
types of connections.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

29.12.2.1.?Connecting to a Target Without a Configuration File
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

To connect an initiator to a single target, specify the IP address of
the portal and the name of the target:

.. code:: screen

    # iscsictl -A -p 10.10.10.10 -t iqn.2012-06.com.example:target0

To verify if the connection succeeded, run ``iscsictl`` without any
arguments. The output should look similar to this:

.. code:: programlisting

    Target name                                     Target portal   State
    iqn.2012-06.com.example:target0                 10.10.10.10     Connected: da0

In this example, the iSCSI session was successfully established, with
``/dev/da0`` representing the attached LUN. If the
``iqn.2012-06.com.example:target0`` target exports more than one LUN,
multiple device nodes will be shown in that section of the output:

.. code:: screen

    Connected: da0 da1 da2.

Any errors will be reported in the output, as well as the system logs.
For example, this message usually means that the
`iscsid(8) <http://www.FreeBSD.org/cgi/man.cgi?query=iscsid&sektion=8>`__
daemon is not running:

.. code:: programlisting

    Target name                                     Target portal   State
    iqn.2012-06.com.example:target0                 10.10.10.10     Waiting for iscsid(8)

The following message suggests a networking problem, such as a wrong IP
address or port:

.. code:: programlisting

    Target name                                     Target portal   State
    iqn.2012-06.com.example:target0                 10.10.10.11     Connection refused

This message means that the specified target name is wrong:

.. code:: programlisting

    Target name                                     Target portal   State
    iqn.2012-06.com.example:target0                 10.10.10.10     Not found

This message means that the target requires authentication:

.. code:: programlisting

    Target name                                     Target portal   State
    iqn.2012-06.com.example:target0                 10.10.10.10     Authentication failed

To specify a CHAP username and secret, use this syntax:

.. code:: screen

    # iscsictl -A -p 10.10.10.10 -t iqn.2012-06.com.example:target0 -u user -s secretsecret

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

29.12.2.2.?Connecting to a Target with a Configuration File
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

To connect using a configuration file, create ``/etc/iscsi.conf`` with
contents like this:

.. code:: programlisting

    t0 {
        TargetAddress   = 10.10.10.10
        TargetName      = iqn.2012-06.com.example:target0
        AuthMethod      = CHAP
        chapIName       = user
        chapSecret      = secretsecret
    }

The ``t0`` specifies a nickname for the configuration file section. It
will be used by the initiator to specify which configuration to use. The
other lines specify the parameters to use during connection. The
``TargetAddress`` and ``TargetName`` are mandatory, whereas the other
options are optional. In this example, the CHAP username and secret are
shown.

To connect to the defined target, specify the nickname:

.. code:: screen

    # iscsictl -An t0

Alternately, to connect to all targets defined in the configuration
file, use:

.. code:: screen

    # iscsictl -Aa

To make the initiator automatically connect to all targets in
``/etc/iscsi.conf``, add the following to ``/etc/rc.conf``:

.. code:: programlisting

    iscsictl_enable="YES"
    iscsictl_flags="-Aa"

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------+---------------------------------+--------------------------------+
| `Prev <network-ntp.html>`__?             | `Up <network-servers.html>`__   | ?\ `Next <firewalls.html>`__   |
+------------------------------------------+---------------------------------+--------------------------------+
| 29.11.?Clock Synchronization with NTP?   | `Home <index.html>`__           | ?Chapter?30.?Firewalls         |
+------------------------------------------+---------------------------------+--------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
