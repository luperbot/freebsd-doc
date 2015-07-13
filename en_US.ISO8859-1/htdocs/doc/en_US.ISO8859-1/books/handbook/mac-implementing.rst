==========================
16.7.?Nagios in a MAC Jail
==========================

.. raw:: html

   <div class="navheader">

16.7.?Nagios in a MAC Jail
`Prev <mac-userlocked.html>`__?
Chapter?16.?Mandatory Access Control
?\ `Next <mac-troubleshoot.html>`__

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

16.7.?Nagios in a MAC Jail
--------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This section demonstrates the steps that are needed to implement the
Nagios network monitoring system in a MAC environment. This is meant as
an example which still requires the administrator to test that the
implemented policy meets the security requirements of the network before
using in a production environment.

This example requires ``multilabel`` to be set on each file system. It
also assumes that
`net-mgmt/nagios-plugins <http://www.freebsd.org/cgi/url.cgi?ports/net-mgmt/nagios-plugins/pkg-descr>`__,
`net-mgmt/nagios <http://www.freebsd.org/cgi/url.cgi?ports/net-mgmt/nagios/pkg-descr>`__,
and
`www/apache22 <http://www.freebsd.org/cgi/url.cgi?ports/www/apache22/pkg-descr>`__
are all installed, configured, and working correctly before attempting
the integration into the MAC framework.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

16.7.1.?Create an Insecure User Class
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Begin the procedure by adding the following user class to
``/etc/login.conf``:

.. code:: programlisting

    insecure:\
    :copyright=/etc/COPYRIGHT:\
    :welcome=/etc/motd:\
    :setenv=MAIL=/var/mail/$,BLOCKSIZE=K:\
    :path=~/bin:/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin
    :manpath=/usr/share/man /usr/local/man:\
    :nologin=/usr/sbin/nologin:\
    :cputime=1h30m:\
    :datasize=8M:\
    :vmemoryuse=100M:\
    :stacksize=2M:\
    :memorylocked=4M:\
    :memoryuse=8M:\
    :filesize=8M:\
    :coredumpsize=8M:\
    :openfiles=24:\
    :maxproc=32:\
    :priority=0:\
    :requirehome:\
    :passwordtime=91d:\
    :umask=022:\
    :ignoretime@:\
    :label=biba/10(10-10):

Then, add the following line to the default user class section:

.. code:: programlisting

    :label=biba/high:

Save the edits and issue the following command to rebuild the database:

.. code:: screen

    # cap_mkdb /etc/login.conf

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

16.7.2.?Configure Users
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Set the ``root`` user to the default class using:

.. code:: screen

    # pw usermod root -L default

All user accounts that are not ``root`` will now require a login class.
The login class is required, otherwise users will be refused access to
common commands. The following ``sh`` script should do the trick:

.. code:: screen

    # for x in `awk -F: '($3 >= 1001) && ($3 != 65534) { print $1 }' \
        /etc/passwd`; do pw usermod $x -L default; done;

Next, drop the ``nagios`` and ``www`` accounts into the insecure class:

.. code:: screen

    # pw usermod nagios -L insecure
    # pw usermod www -L insecure

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

16.7.3.?Create the Contexts File
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A contexts file should now be created as ``/etc/policy.contexts``:

.. code:: programlisting

    # This is the default BIBA policy for this system.

    # System:
    /var/run(/.*)?          biba/equal

    /dev/(/.*)?         biba/equal

    /var                biba/equal
    /var/spool(/.*)?        biba/equal

    /var/log(/.*)?          biba/equal

    /tmp(/.*)?          biba/equal
    /var/tmp(/.*)?          biba/equal

    /var/spool/mqueue       biba/equal
    /var/spool/clientmqueue     biba/equal

    # For Nagios:
    /usr/local/etc/nagios(/.*)? biba/10

    /var/spool/nagios(/.*)?     biba/10

    # For apache
    /usr/local/etc/apache(/.*)? biba/10

This policy enforces security by setting restrictions on the flow of
information. In this specific configuration, users, including ``root``,
should never be allowed to access Nagios. Configuration files and
processes that are a part of Nagios will be completely self contained or
jailed.

This file will be read after running ``setfsmac`` on every file system.
This example sets the policy on the root file system:

.. code:: screen

    # setfsmac -ef /etc/policy.contexts /

Next, add these edits to the main section of ``/etc/mac.conf``:

.. code:: programlisting

    default_labels file ?biba
    default_labels ifnet ?biba
    default_labels process ?biba
    default_labels socket ?biba

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

16.7.4.?Loader Configuration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

To finish the configuration, add the following lines to
``/boot/loader.conf``:

.. code:: programlisting

    mac_biba_load="YES"
    mac_seeotheruids_load="YES"
    security.mac.biba.trust_all_interfaces=1

And the following line to the network card configuration stored in
``/etc/rc.conf``. If the primary network configuration is done via DHCP,
this may need to be configured manually after every system boot:

.. code:: programlisting

    maclabel biba/equal

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

16.7.5.?Testing the Configuration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

First, ensure that the web server and Nagios will not be started on
system initialization and reboot. Ensure that ``root`` cannot access any
of the files in the Nagios configuration directory. If ``root`` can list
the contents of ``/var/spool/nagios``, something is wrong. Instead, a
“permission denied” error should be returned.

If all seems well, Nagios, Apache, and Sendmail can now be started:

.. code:: screen

    # cd /etc/mail && make stop && \
    setpmac biba/equal make start && setpmac biba/10\(10-10\) apachectl start && \
    setpmac biba/10\(10-10\) /usr/local/etc/rc.d/nagios.sh forcestart

Double check to ensure that everything is working properly. If not,
check the log files for error messages. If needed, use
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
to disable the
`mac\_biba(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_biba&sektion=4>`__
security policy module and try starting everything again as usual.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

The ``root`` user can still change the security enforcement and edit its
configuration files. The following command will permit the degradation
of the security policy to a lower grade for a newly spawned shell:

.. code:: screen

    # setpmac biba/10 csh

To block this from happening, force the user into a range using
`login.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=login.conf&sektion=5>`__.
If
`setpmac(8) <http://www.FreeBSD.org/cgi/man.cgi?query=setpmac&sektion=8>`__
attempts to run a command outside of the compartment's range, an error
will be returned and the command will not be executed. In this case, set
root to ``biba/high(high-high)``.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------+-------------------------+--------------------------------------------+
| `Prev <mac-userlocked.html>`__?   | `Up <mac.html>`__       | ?\ `Next <mac-troubleshoot.html>`__        |
+-----------------------------------+-------------------------+--------------------------------------------+
| 16.6.?User Lock Down?             | `Home <index.html>`__   | ?16.8.?Troubleshooting the MAC Framework   |
+-----------------------------------+-------------------------+--------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
