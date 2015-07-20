======================================
19.16. Highly Available Storage (HAST)
======================================

.. raw:: html

   <div class="navheader">

19.16. Highly Available Storage (HAST)
`????? <swap-encrypting.html>`__?
???????? 19. ???????????? ????
?\ `??????? <GEOM.html>`__

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

19.16. Highly Available Storage (HAST)
--------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Contributed by Daniel Gerzo.

.. raw:: html

   </div>

.. raw:: html

   <div>

With inputs from Freddie Cash, Pawel Jakub Dawidek, Michael W. Lucas ???
Viktor Petersson.

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

19.16.1. Synopsis
~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

High availability is one of the main requirements in serious business
applications and highly-available storage is a key component in such
environments. Highly Available STorage, or HAST\ *Highly Available
STorage*, was developed by Pawel Jakub Dawidek ``<pjd@FreeBSD.org>`` as
a framework which allows transparent storage of the same data across
several physically separated machines connected by a TCP/IP network.
HAST can be understood as a network-based RAID1 (mirror), and is similar
to the DRBD(R) storage system known from the GNU/Linux(R) platform. In
combination with other high-availability features of FreeBSD like CARP,
HAST makes it possible to build a highly-available storage cluster that
is resistant to hardware failures.

After reading this section, you will know:

.. raw:: html

   <div class="itemizedlist">

-  What HAST is, how it works and which features it provides.

-  How to set up and use HAST on FreeBSD.

-  How to integrate CARP and
   `devd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=devd&sektion=8>`__
   to build a robust storage system.

.. raw:: html

   </div>

Before reading this section, you should:

.. raw:: html

   <div class="itemizedlist">

-  Understand UNIX(R) and `FreeBSD basics <basics.html>`__.

-  Know how to `configure <config-tuning.html>`__ network interfaces and
   other core FreeBSD subsystems.

-  Have a good understanding of `FreeBSD
   networking <network-communication.html>`__.

.. raw:: html

   </div>

The HAST project was sponsored by The FreeBSD Foundation with support
from `OMCnet Internet Service GmbH <http://www.omc.net/>`__ and `TransIP
BV <http://www.transip.nl/>`__.

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

19.16.2. HAST Features
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The main features of the HAST system are:

.. raw:: html

   <div class="itemizedlist">

-  Can be used to mask I/O errors on local hard drives.

-  File system agnostic as it works with any file system supported by
   FreeBSD.

-  Efficient and quick resynchronization, synchronizing only blocks that
   were modified during the downtime of a node.

-  Can be used in an already deployed environment to add additional
   redundancy.

-  Together with CARP, Heartbeat, or other tools, it can be used to
   build a robust and durable storage system.

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

19.16.3. HAST Operation
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

As HAST provides a synchronous block-level replication of any storage
media to several machines, it requires at least two physical machines:
the ``primary``, also known as the ``master`` node, and the
``secondary`` or ``slave`` node. These two machines together are
referred to as a cluster.

.. raw:: html

   <div class="note" xmlns="">

????????:
~~~~~~~~~

HAST is currently limited to two cluster nodes in total.

.. raw:: html

   </div>

Since HAST works in a primary-secondary configuration, it allows only
one of the cluster nodes to be active at any given time. The ``primary``
node, also called ``active``, is the one which will handle all the I/O
requests to HAST-managed devices. The ``secondary`` node is
automatically synchronized from the ``primary`` node.

The physical components of the HAST system are:

.. raw:: html

   <div class="itemizedlist">

-  local disk on primary node, and

-  disk on remote, secondary node.

.. raw:: html

   </div>

HAST operates synchronously on a block level, making it transparent to
file systems and applications. HAST provides regular GEOM providers in
``/dev/hast/`` for use by other tools or applications, thus there is no
difference between using HAST-provided devices and raw disks or
partitions.

Each write, delete, or flush operation is sent to the local disk and to
the remote disk over TCP/IP. Each read operation is served from the
local disk, unless the local disk is not up-to-date or an I/O error
occurs. In such case, the read operation is sent to the secondary node.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

19.16.3.1. Synchronization and Replication Modes
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

HAST tries to provide fast failure recovery. For this reason, it is very
important to reduce synchronization time after a node's outage. To
provide fast synchronization, HAST manages an on-disk bitmap of dirty
extents and only synchronizes those during a regular synchronization,
with an exception of the initial sync.

There are many ways to handle synchronization. HAST implements several
replication modes to handle different synchronization methods:

.. raw:: html

   <div class="itemizedlist">

-  *memsync*: report write operation as completed when the local write
   operation is finished and when the remote node acknowledges data
   arrival, but before actually storing the data. The data on the remote
   node will be stored directly after sending the acknowledgement. This
   mode is intended to reduce latency, but still provides very good
   reliability.

-  *fullsync*: report write operation as completed when local write
   completes and when remote write completes. This is the safest and the
   slowest replication mode. This mode is the default.

-  *async*: report write operation as completed when local write
   completes. This is the fastest and the most dangerous replication
   mode. It should be used when replicating to a distant node where
   latency is too high for other modes.

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

19.16.4. HAST Configuration
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

HAST requires ``GEOM_GATE`` support which is not present in the default
``GENERIC`` kernel. However, the ``geom_gate.ko`` loadable module is
available in the default FreeBSD installation. Alternatively, to build
``GEOM_GATE`` support into the kernel statically, add this line to the
custom kernel configuration file:

.. code:: programlisting

    options    GEOM_GATE

The HAST framework consists of several parts from the operating system's
point of view:

.. raw:: html

   <div class="itemizedlist">

-  the
   `hastd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=hastd&sektion=8>`__
   daemon responsible for data synchronization,

-  the
   `hastctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=hastctl&sektion=8>`__
   userland management utility,

-  and the
   `hast.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=hast.conf&sektion=5>`__
   configuration file.

.. raw:: html

   </div>

The following example describes how to configure two nodes in
``master``-``slave`` / ``primary``-``secondary`` operation using HAST to
replicate the data between the two. The nodes will be called ``hasta``
with an IP address of *``172.16.0.1``* and ``hastb`` with an IP of
address *``172.16.0.2``*. Both nodes will have a dedicated hard drive
``/dev/ad6`` of the same size for HAST operation. The HAST pool,
sometimes also referred to as a resource or the GEOM provider in
``/dev/hast/``, will be called ``test``.

Configuration of HAST is done using ``/etc/hast.conf``. This file should
be the same on both nodes. The simplest configuration possible is:

.. code:: programlisting

    resource test {
        on hasta {
            local /dev/ad6
            remote 172.16.0.2
        }
        on hastb {
            local /dev/ad6
            remote 172.16.0.1
        }
    }

For more advanced configuration, refer to
`hast.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=hast.conf&sektion=5>`__.

.. raw:: html

   <div class="tip" xmlns="">

????????:
~~~~~~~~~

It is also possible to use host names in the ``remote`` statements. In
such a case, make sure that these hosts are resolvable and are defined
in ``/etc/hosts`` or in the local DNS.

.. raw:: html

   </div>

Now that the configuration exists on both nodes, the HAST pool can be
created. Run these commands on both nodes to place the initial metadata
onto the local disk and to start
`hastd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=hastd&sektion=8>`__:

.. code:: screen

    # hastctl create test
    # service hastd onestart

.. raw:: html

   <div class="note" xmlns="">

????????:
~~~~~~~~~

It is *not* possible to use GEOM providers with an existing file system
or to convert an existing storage to a HAST-managed pool. This procedure
needs to store some metadata on the provider and there will not be
enough required space available on an existing provider.

.. raw:: html

   </div>

A HAST node's ``primary`` or ``secondary`` role is selected by an
administrator, or software like Heartbeat, using
`hastctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=hastctl&sektion=8>`__.
On the primary node, ``hasta``, issue this command:

.. code:: screen

    # hastctl role primary test

Similarly, run this command on the secondary node, ``hastb``:

.. code:: screen

    # hastctl role secondary test

.. raw:: html

   <div class="caution" xmlns="">

???????:
~~~~~~~~

When the nodes are unable to communicate with each other, and both are
configured as primary nodes, the condition is called ``split-brain``. To
troubleshoot this situation, follow the steps described in
`??????19.16.5.2, ?Recovering from the Split-brain
Condition? <disks-hast.html#disks-hast-sb>`__.

.. raw:: html

   </div>

Verify the result by running
`hastctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=hastctl&sektion=8>`__
on each node:

.. code:: screen

    # hastctl status test

The important text is the ``status`` line, which should say ``complete``
on each of the nodes. If it says ``degraded``, something went wrong. At
this point, the synchronization between the nodes has already started.
The synchronization completes when ``hastctl status`` reports 0 bytes of
``dirty`` extents.

The next step is to create a filesystem on the ``/dev/hast/test`` GEOM
provider and mount it. This must be done on the ``primary`` node, as
``/dev/hast/test`` appears only on the ``primary`` node. Creating the
filesystem can take a few minutes, depending on the size of the hard
drive:

.. code:: screen

    # newfs -U /dev/hast/test
    # mkdir /hast/test
    # mount /dev/hast/test /hast/test

Once the HAST framework is configured properly, the final step is to
make sure that HAST is started automatically during system boot. Add
this line to ``/etc/rc.conf``:

.. code:: programlisting

    hastd_enable="YES"

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

19.16.4.1. Failover Configuration
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The goal of this example is to build a robust storage system which is
resistant to the failure of any given node. The scenario is that a
``primary`` node of the cluster fails. If this happens, the
``secondary`` node is there to take over seamlessly, check and mount the
file system, and continue to work without missing a single bit of data.

To accomplish this task, another FreeBSD feature, CARP, provides for
automatic failover on the IP layer. CARP (Common Address Redundancy
Protocol) allows multiple hosts on the same network segment to share an
IP address. Set up CARP on both nodes of the cluster according to the
documentation available in `??????31.12, ?Common Access Redundancy
Protocol (CARP)? <carp.html>`__. After setup, each node will have its
own ``carp0`` interface with a shared IP address of *``172.16.0.254``*.
The primary HAST node of the cluster must be the master CARP node.

The HAST pool created in the previous section is now ready to be
exported to the other hosts on the network. This can be accomplished by
exporting it through NFS or Samba, using the shared IP address
*``172.16.0.254``*. The only problem which remains unresolved is an
automatic failover should the primary node fail.

In the event of CARP interfaces going up or down, the FreeBSD operating
system generates a
`devd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=devd&sektion=8>`__
event, making it possible to watch for state changes on the CARP
interfaces. A state change on the CARP interface is an indication that
one of the nodes failed or came back online. These state change events
make it possible to run a script which will automatically handle the
HAST failover.

To be able to catch state changes on the CARP interfaces, add this
configuration to ``/etc/devd.conf`` on each node:

.. code:: programlisting

    notify 30 {
        match "system" "IFNET";
        match "subsystem" "carp0";
        match "type" "LINK_UP";
        action "/usr/local/sbin/carp-hast-switch master";
    };

    notify 30 {
        match "system" "IFNET";
        match "subsystem" "carp0";
        match "type" "LINK_DOWN";
        action "/usr/local/sbin/carp-hast-switch slave";
    };

Restart
`devd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=devd&sektion=8>`__ on
both nodes to put the new configuration into effect:

.. code:: screen

    # service devd restart

When the ``carp0`` interface state changes by going up or down , the
system generates a notification, allowing the
`devd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=devd&sektion=8>`__
subsystem to run an arbitrary script, in this case
``/usr/local/sbin/carp-hast-switch``. This script handles the automatic
failover. For further clarification about the above
`devd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=devd&sektion=8>`__
configuration, refer to
`devd.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=devd.conf&sektion=5>`__.

An example of such a script could be:

.. code:: programlisting

    #!/bin/sh

    # Original script by Freddie Cash <fjwcash@gmail.com>
    # Modified by Michael W. Lucas <mwlucas@BlackHelicopters.org>
    # and Viktor Petersson <vpetersson@wireload.net>

    # The names of the HAST resources, as listed in /etc/hast.conf
    resources="test"

    # delay in mounting HAST resource after becoming master
    # make your best guess
    delay=3

    # logging
    log="local0.debug"
    name="carp-hast"

    # end of user configurable stuff

    case "$1" in
        master)
            logger -p $log -t $name "Switching to primary provider for ${resources}."
            sleep ${delay}

            # Wait for any "hastd secondary" processes to stop
            for disk in ${resources}; do
                while $( pgrep -lf "hastd: ${disk} \(secondary\)" > /dev/null 2>&1 ); do
                    sleep 1
                done

                # Switch role for each disk
                hastctl role primary ${disk}
                if [ $? -ne 0 ]; then
                    logger -p $log -t $name "Unable to change role to primary for resource ${disk}."
                    exit 1
                fi
            done

            # Wait for the /dev/hast/* devices to appear
            for disk in ${resources}; do
                for I in $( jot 60 ); do
                    [ -c "/dev/hast/${disk}" ] && break
                    sleep 0.5
                done

                if [ ! -c "/dev/hast/${disk}" ]; then
                    logger -p $log -t $name "GEOM provider /dev/hast/${disk} did not appear."
                    exit 1
                fi
            done

            logger -p $log -t $name "Role for HAST resources ${resources} switched to primary."


            logger -p $log -t $name "Mounting disks."
            for disk in ${resources}; do
                mkdir -p /hast/${disk}
                fsck -p -y -t ufs /dev/hast/${disk}
                mount /dev/hast/${disk} /hast/${disk}
            done

        ;;

        slave)
            logger -p $log -t $name "Switching to secondary provider for ${resources}."

            # Switch roles for the HAST resources
            for disk in ${resources}; do
                if ! mount | grep -q "^/dev/hast/${disk} on "
                then
                else
                    umount -f /hast/${disk}
                fi
                sleep $delay
                hastctl role secondary ${disk} 2>&1
                if [ $? -ne 0 ]; then
                    logger -p $log -t $name "Unable to switch role to secondary for resource ${disk}."
                    exit 1
                fi
                logger -p $log -t $name "Role switched to secondary for resource ${disk}."
            done
        ;;
    esac

In a nutshell, the script takes these actions when a node becomes
``master`` / ``primary``:

.. raw:: html

   <div class="itemizedlist">

-  Promotes the HAST pools to primary on a given node.

-  Checks the file system under the HAST pool.

-  Mounts the pools at an appropriate place.

.. raw:: html

   </div>

When a node becomes ``backup`` / ``secondary``:

.. raw:: html

   <div class="itemizedlist">

-  Unmounts the HAST pools.

-  Degrades the HAST pools to secondary.

.. raw:: html

   </div>

.. raw:: html

   <div class="caution" xmlns="">

???????:
~~~~~~~~

Keep in mind that this is just an example script which serves as a proof
of concept. It does not handle all the possible scenarios and can be
extended or altered in any way, for example, to start/stop required
services.

.. raw:: html

   </div>

.. raw:: html

   <div class="tip" xmlns="">

????????:
~~~~~~~~~

For this example, a standard UFS file system was used. To reduce the
time needed for recovery, a journal-enabled UFS or ZFS file system can
be used instead.

.. raw:: html

   </div>

More detailed information with additional examples can be found in the
`HAST Wiki <http://wiki.FreeBSD.org/HAST>`__ page.

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

19.16.5. Troubleshooting
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

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

19.16.5.1. General Troubleshooting Tips
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

HAST should generally work without issues. However, as with any other
software product, there may be times when it does not work as supposed.
The sources of the problems may be different, but the rule of thumb is
to ensure that the time is synchronized between all nodes of the
cluster.

When troubleshooting HAST problems, the debugging level of
`hastd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=hastd&sektion=8>`__
should be increased by starting
`hastd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=hastd&sektion=8>`__
with ``-d``. This argument may be specified multiple times to further
increase the debugging level. A lot of useful information may be
obtained this way. Consider also using ``-F``, which starts
`hastd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=hastd&sektion=8>`__
in the foreground.

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

19.16.5.2. Recovering from the Split-brain Condition
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``Split-brain`` is when the nodes of the cluster are unable to
communicate with each other, and both are configured as primary. This is
a dangerous condition because it allows both nodes to make incompatible
changes to the data. This problem must be corrected manually by the
system administrator.

The administrator must decide which node has more important changes (or
merge them manually) and let HAST perform full synchronization of the
node which has the broken data. To do this, issue these commands on the
node which needs to be resynchronized:

.. code:: screen

    # hastctl role init <resource>
    # hastctl create <resource>
    # hastctl role secondary <resource>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------+-------------------------+----------------------------------------------------+
| `????? <swap-encrypting.html>`__?   | `???? <disks.html>`__   | ?\ `??????? <GEOM.html>`__                         |
+-------------------------------------+-------------------------+----------------------------------------------------+
| 19.15. Encrypting Swap Space?       | `???? <index.html>`__   | ????????? 20. GEOM: ?????????? ?????????? ??????   |
+-------------------------------------+-------------------------+----------------------------------------------------+

.. raw:: html

   </div>

???? ?? ???????, ??? ???? ???????, ?????? ?? ?????? ???
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| ??? ????????? ??????? ?? ?? FreeBSD, ???????? ???
  `?????????? <http://www.FreeBSD.org/docs.html>`__ ???? ??
  ?????????????? ?? ??? <questions@FreeBSD.org\ >.
|  ??? ????????? ??????? ?? ???? ??? ??????????, ??????? e-mail ????
  <doc@FreeBSD.org\ >.
