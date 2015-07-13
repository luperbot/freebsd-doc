=============================================
14.10.?Monitoring Third Party Security Issues
=============================================

.. raw:: html

   <div class="navheader">

14.10.?Monitoring Third Party Security Issues
`Prev <fs-acl.html>`__?
Chapter?14.?Security
?\ `Next <security-advisories.html>`__

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

14.10.?Monitoring Third Party Security Issues
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

Vulnerability assessment is a key factor in security. While FreeBSD
releases advisories for the base system, doing so for every third party
utility is beyond the FreeBSD Project's capability. There is a way to
mitigate third party vulnerabilities and warn administrators of known
security issues. A FreeBSD add on utility known as pkg includes options
explicitly for this purpose.

pkg polls a database for security issues. The database is updated and
maintained by the FreeBSD Security Team and ports developers.

Please refer to
`instructions <../../../../doc/en_US.ISO8859-1/books/handbook/pkgng-intro.html>`__
for installing pkg.

Installation provides
`periodic(8) <http://www.FreeBSD.org/cgi/man.cgi?query=periodic&sektion=8>`__
configuration files for maintaining the pkg audit database, and provides
a programmatic method of keeping it updated. This functionality is
enabled if ``daily_status_security_pkgaudit_enable`` is set to ``YES``
in
`periodic.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=periodic.conf&sektion=5>`__.
Ensure that daily security run emails, which are sent to ``root``'s
email account, are being read.

After installation, and to audit third party utilities as part of the
Ports Collection at any time, an administrator may choose to update the
database and view known vulnerabilities of installed packages by
invoking:

.. code:: screen

    # pkg audit -F

pkg displays messages any published vulnerabilities in installed
packages:

.. code:: programlisting

    Affected package: cups-base-1.1.22.0_1
    Type of problem: cups-base -- HPGL buffer overflow vulnerability.
    Reference: <http://www.FreeBSD.org/ports/portaudit/40a3bca2-6809-11d9-a9e7-0001020eed82.html>

    1 problem(s) in your installed packages found.

    You are advised to update or deinstall the affected package(s) immediately.

By pointing a web browser to the displayed URL, an administrator may
obtain more information about the vulnerability. This will include the
versions affected, by FreeBSD port version, along with other web sites
which may contain security advisories.

pkg is a powerful utility and is extremely useful when coupled with
`ports-mgmt/portmaster <http://www.freebsd.org/cgi/url.cgi?ports/ports-mgmt/portmaster/pkg-descr>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------+--------------------------+------------------------------------------+
| `Prev <fs-acl.html>`__?       | `Up <security.html>`__   | ?\ `Next <security-advisories.html>`__   |
+-------------------------------+--------------------------+------------------------------------------+
| 14.9.?Access Control Lists?   | `Home <index.html>`__    | ?14.11.?FreeBSD Security Advisories      |
+-------------------------------+--------------------------+------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
