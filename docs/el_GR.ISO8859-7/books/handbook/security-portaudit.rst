=============================================
15.13. Monitoring Third Party Security Issues
=============================================

.. raw:: html

   <div class="navheader">

15.13. Monitoring Third Party Security Issues
`????? <fs-acl.html>`__?
???????? 15. ????????
?\ `??????? <security-advisories.html>`__

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

15.13. Monitoring Third Party Security Issues
---------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Contributed by Tom Rhodes.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In recent years, the security world has made many improvements to how
vulnerability assessment is handled. The threat of system intrusion
increases as third party utilities are installed and configured for
virtually any operating system available today.

Vulnerability assessment is a key factor in security, and while FreeBSD
releases advisories for the base system, doing so for every third party
utility is beyond the FreeBSD Project's capability. There is a way to
mitigate third party vulnerabilities and warn administrators of known
security issues. A FreeBSD add on utility known as Portaudit exists
solely for this purpose.

The
`ports-mgmt/portaudit <http://www.freebsd.org/cgi/url.cgi?ports/ports-mgmt/portaudit/pkg-descr>`__
port polls a database, updated and maintained by the FreeBSD Security
Team and ports developers, for known security issues.

To begin using Portaudit, one must install it from the Ports Collection:

.. code:: screen

    # cd /usr/ports/ports-mgmt/portaudit && make install clean

During the install process, the configuration files for
`periodic(8) <http://www.FreeBSD.org/cgi/man.cgi?query=periodic&sektion=8>`__
will be updated, permitting Portaudit output in the daily security runs.
Ensure the daily security run emails, which are sent to ``root``'s email
account, are being read. No more configuration will be required here.

After installation, an administrator can update the database and view
known vulnerabilities in installed packages by invoking the following
command:

.. code:: screen

    # portaudit -Fda

.. raw:: html

   <div class="note" xmlns="">

????????:
~~~~~~~~~

The database will automatically be updated during the
`periodic(8) <http://www.FreeBSD.org/cgi/man.cgi?query=periodic&sektion=8>`__
run; thus, the previous command is completely optional. It is only
required for the following examples.

.. raw:: html

   </div>

To audit the third party utilities installed as part of the Ports
Collection at anytime, an administrator need only run the following
command:

.. code:: screen

    # portaudit -a

Portaudit will produce something like this for vulnerable packages:

.. code:: programlisting

    Affected package: cups-base-1.1.22.0_1
    Type of problem: cups-base -- HPGL buffer overflow vulnerability.
    Reference: <http://www.FreeBSD.org/ports/portaudit/40a3bca2-6809-11d9-a9e7-0001020eed82.html>

    1 problem(s) in your installed packages found.

    You are advised to update or deinstall the affected package(s) immediately.

By pointing a web browser to the URL shown, an administrator may obtain
more information about the vulnerability in question. This will include
versions affected, by FreeBSD Port version, along with other web sites
which may contain security advisories.

In short, Portaudit is a powerful utility and extremely useful when
coupled with the Portupgrade port.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------------+----------------------------+---------------------------------------------+
| `????? <fs-acl.html>`__?                   | `???? <security.html>`__   | ?\ `??????? <security-advisories.html>`__   |
+--------------------------------------------+----------------------------+---------------------------------------------+
| 15.12. File System Access Control Lists?   | `???? <index.html>`__      | ?15.14. FreeBSD Security Advisories         |
+--------------------------------------------+----------------------------+---------------------------------------------+

.. raw:: html

   </div>

???? ?? ???????, ??? ???? ???????, ?????? ?? ?????? ???
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| ??? ????????? ??????? ?? ?? FreeBSD, ???????? ???
  `?????????? <http://www.FreeBSD.org/docs.html>`__ ???? ??
  ?????????????? ?? ??? <questions@FreeBSD.org\ >.
|  ??? ????????? ??????? ?? ???? ??? ??????????, ??????? e-mail ????
  <doc@FreeBSD.org\ >.
