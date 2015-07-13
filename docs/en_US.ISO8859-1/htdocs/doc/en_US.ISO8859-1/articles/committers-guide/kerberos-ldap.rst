=====================================================
3.?Kerberos and LDAP web Password for FreeBSD Cluster
=====================================================

.. raw:: html

   <div class="navheader">

3.?Kerberos and LDAP web Password for FreeBSD Cluster
`Prev <pgpkeys.html>`__?
?
?\ `Next <committer.types.html>`__

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

3.?Kerberos and LDAP web Password for FreeBSD Cluster
-----------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The FreeBSD cluster requires a Kerberos password to access certain
services. The Kerberos password also serves as the LDAP web password,
since LDAP is proxying to Kerberos in the cluster. Some of the services
which require this include:

.. raw:: html

   <div class="itemizedlist">

-  `Bugzilla <https://bugs.freebsd.org/bugzilla>`__

-  `Jenkins <https://jenkins.freebsd.org>`__

.. raw:: html

   </div>

To reset a Kerberos password in the FreeBSD cluster using a random
password generator:

.. code:: screen

    % ssh kpasswd.freebsd.org

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

This must be done from a machine outside of the FreeBSD.org cluster.

.. raw:: html

   </div>

A Kerberos password can also be set manually by logging into
``freefall.FreeBSD.org`` and running:

.. code:: screen

    % kpasswd

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------+-------------------------+--------------------------------------+
| `Prev <pgpkeys.html>`__?       | ?                       | ?\ `Next <committer.types.html>`__   |
+--------------------------------+-------------------------+--------------------------------------+
| 2.?OpenPGP Keys for FreeBSD?   | `Home <index.html>`__   | ?4.?Commit Bit Types                 |
+--------------------------------+-------------------------+--------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
