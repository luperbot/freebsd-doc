===========================
17.14. Nagios in a MAC Jail
===========================

.. raw:: html

   <div class="navheader">

17.14. Nagios in a MAC Jail
`????? <mac-lomac.html>`__?
???????? 17. ???????????? ??????? ?????????
?\ `??????? <mac-userlocked.html>`__

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

17.14. Nagios in a MAC Jail
---------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The following demonstration will implement a secure environment using
various MAC modules with properly configured policies. This is only a
test and should not be considered the complete answer to everyone's
security woes. Just implementing a policy and ignoring it never works
and could be disastrous in a production environment.

Before beginning this process, the ``multilabel`` option must be set on
each file system as stated at the beginning of this chapter. Not doing
so will result in errors. While at it, ensure that the
`net-mngt/nagios-plugins <http://www.freebsd.org/cgi/url.cgi?ports/net-mngt/nagios-plugins/pkg-descr>`__,
`net-mngt/nagios <http://www.freebsd.org/cgi/url.cgi?ports/net-mngt/nagios/pkg-descr>`__,
and
`www/apache13 <http://www.freebsd.org/cgi/url.cgi?ports/www/apache13/pkg-descr>`__
ports are all installed, configured, and working correctly.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

17.14.1. Create an insecure User Class
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Begin the procedure by adding the following user class to the
``/etc/login.conf`` file:

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

And adding the following line to the default user class:

.. code:: programlisting

    :label=biba/high:

Once this is completed, the following command must be issued to rebuild
the database:

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

17.14.2. Boot Configuration
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Do not reboot yet, just add the following lines to ``/boot/loader.conf``
so the required modules will load during system initialization:

.. code:: programlisting

    mac_biba_load="YES"
    mac_seeotheruids_load="YES"

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

17.14.3. Configure Users
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Set the ``root`` user to the default class using:

.. code:: screen

    # pw usermod root -L default

All user accounts that are not ``root`` or system users will now require
a login class. The login class is required otherwise users will be
refused access to common commands such as
`vi(1) <http://www.FreeBSD.org/cgi/man.cgi?query=vi&sektion=1>`__. The
following ``sh`` script should do the trick:

.. code:: screen

    # for x in `awk -F: '($3 >= 1001) && ($3 != 65534) { print $1 }' \
        /etc/passwd`; do pw usermod $x -L default; done;

Drop the ``nagios`` and ``www`` users into the insecure class:

.. code:: screen

    # pw usermod nagios -L insecure

.. code:: screen

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

17.14.4. Create the Contexts File
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A contexts file should now be created; the following example file should
be placed in ``/etc/policy.contexts``.

.. code:: programlisting

    # This is the default BIBA policy for this system.

    # System:
    /var/run                        biba/equal
    /var/run/*                      biba/equal

    /dev                            biba/equal
    /dev/*                          biba/equal

    /var                biba/equal
    /var/spool                      biba/equal
    /var/spool/*                    biba/equal

    /var/log                        biba/equal
    /var/log/*                      biba/equal

    /tmp                biba/equal
    /tmp/*              biba/equal
    /var/tmp            biba/equal
    /var/tmp/*          biba/equal

    /var/spool/mqueue       biba/equal
    /var/spool/clientmqueue     biba/equal

    # For Nagios:
    /usr/local/etc/nagios
    /usr/local/etc/nagios/*         biba/10

    /var/spool/nagios               biba/10
    /var/spool/nagios/*             biba/10

    # For apache
    /usr/local/etc/apache           biba/10
    /usr/local/etc/apache/*         biba/10

This policy will enforce security by setting restrictions on the flow of
information. In this specific configuration, users, ``root`` and others,
should never be allowed to access Nagios. Configuration files and
processes that are a part of Nagios will be completely self contained or
jailed.

This file may now be read into our system by issuing the following
command:

.. code:: screen

    # setfsmac -ef /etc/policy.contexts /
    # setfsmac -ef /etc/policy.contexts /

.. raw:: html

   <div class="note" xmlns="">

????????:
~~~~~~~~~

The above file system layout may be different depending on environment;
however, it must be run on every single file system.

.. raw:: html

   </div>

The ``/etc/mac.conf`` file requires the following modifications in the
main section:

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

17.14.5. Enable Networking
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Add the following line to ``/boot/loader.conf``:

.. code:: programlisting

    security.mac.biba.trust_all_interfaces=1

And the following to the network card configuration stored in
``rc.conf``. If the primary Internet configuration is done via DHCP,
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

17.14.6. Testing the Configuration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Ensure that the web server and Nagios will not be started on system
initialization, and reboot. Ensure the ``root`` user cannot access any
of the files in the Nagios configuration directory. If ``root`` can
issue an
`ls(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ls&sektion=1>`__
command on ``/var/spool/nagios``, then something is wrong. Otherwise a
?permission denied? error should be returned.

If all seems well, Nagios, Apache, and Sendmail can now be started in a
way fitting of the security policy. The following commands will make
this happen:

.. code:: screen

    # cd /etc/mail && make stop && \
    setpmac biba/equal make start && setpmac biba/10\(10-10\) apachectl start && \
    setpmac biba/10\(10-10\) /usr/local/etc/rc.d/nagios.sh forcestart

Double check to ensure that everything is working properly. If not,
check the log files or error messages. Use the
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
utility to disable the
`mac\_biba(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_biba&sektion=4>`__
security policy module enforcement and try starting everything again,
like normal.

.. raw:: html

   <div class="note" xmlns="">

????????:
~~~~~~~~~

The ``root`` user can change the security enforcement and edit the
configuration files without fear. The following command will permit the
degradation of the security policy to a lower grade for a newly spawned
shell:

.. code:: screen

    # setpmac biba/10 csh

To block this from happening, force the user into a range via
`login.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=login.conf&sektion=5>`__.
If
`setpmac(8) <http://www.FreeBSD.org/cgi/man.cgi?query=setpmac&sektion=8>`__
attempts to run a command outside of the compartment's range, an error
will be returned and the command will not be executed. In this case,
setting root to ``biba/high(high-high)``.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------+-------------------------+----------------------------------------+
| `????? <mac-lomac.html>`__?    | `???? <mac.html>`__     | ?\ `??????? <mac-userlocked.html>`__   |
+--------------------------------+-------------------------+----------------------------------------+
| 17.13. The MAC LOMAC Module?   | `???? <index.html>`__   | ?17.15. User Lock Down                 |
+--------------------------------+-------------------------+----------------------------------------+

.. raw:: html

   </div>

???? ?? ???????, ??? ???? ???????, ?????? ?? ?????? ???
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| ??? ????????? ??????? ?? ?? FreeBSD, ???????? ???
  `?????????? <http://www.FreeBSD.org/docs.html>`__ ???? ??
  ?????????????? ?? ??? <questions@FreeBSD.org\ >.
|  ??? ????????? ??????? ?? ???? ??? ??????????, ??????? e-mail ????
  <doc@FreeBSD.org\ >.
