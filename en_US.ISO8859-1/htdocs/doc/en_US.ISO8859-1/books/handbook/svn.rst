=====================
A.4.?Using Subversion
=====================

.. raw:: html

   <div class="navheader">

A.4.?Using Subversion
`Prev <ctm.html>`__?
Appendix?A.?Obtaining FreeBSD
?\ `Next <mirrors-rsync.html>`__

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

A.4.?Using Subversion
---------------------

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

A.4.1.?Introduction
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

As of July 2012, FreeBSD uses Subversion as the primary version control
system for storing all of FreeBSD's source code, documentation, and the
Ports Collection.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Subversion is generally a developer tool. Most users should use
``freebsd-update`` (`Section?24.2, “FreeBSD
Update” <updating-upgrading-freebsdupdate.html>`__) to update the
FreeBSD base system, and ``portsnap`` (`Section?5.5, “Using the Ports
Collection” <ports-using.html>`__) to update the FreeBSD Ports
Collection.

.. raw:: html

   </div>

This chapter demonstrates how to install Subversion on a FreeBSD system
and then use it to create a local copy of a FreeBSD repository. It
includes a list of the available FreeBSD Subversion mirrors and
resources to additional information on how to use Subversion.

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

A.4.2.?Installation
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Subversion must be installed before it can be used to check out the
contents of any of the repositories. If a copy of the ports tree is
already present, one can install Subversion like this:

.. code:: screen

    # cd /usr/ports/devel/subversion
    # make install clean

If the ports tree is not available, Subversion can be installed as a
package:

.. code:: screen

    # pkg install devel/subversion

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

A.4.3.?Running Subversion
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The ``svn`` command is used to fetch a clean copy of the sources into a
local directory. The files in this directory are called a *local working
copy*.

.. raw:: html

   <div class="warning" xmlns="">

Warning:
~~~~~~~~

*Move or delete the local directory before using ``checkout``.*

Checkout over an existing non-\ ``svn`` directory can cause conflicts
between the existing files and those brought in from the repository.

.. raw:: html

   </div>

Subversion uses URLs to designate a repository, taking the form of
*``protocol://hostname/path``*. Mirrors may support different protocols
as specified below. The first component of the path is the FreeBSD
repository to access. There are three different repositories, ``base``
for the FreeBSD base system source code, ``ports`` for the Ports
Collection, and ``doc`` for documentation. For example, the URL
``svn://svn0.us-east.FreeBSD.org/ports/head/`` specifies the main branch
of the ports repository on the ``svn0.us-east.FreeBSD.org`` mirror,
using the ``svn`` protocol.

A checkout from a given repository is performed with a command like
this:

.. code:: screen

    # svn checkout svn-mirror/repository/branch lwcdir

where:

.. raw:: html

   <div class="itemizedlist">

-  *``svn-mirror``* is a URL for one of the `Subversion mirror
   sites <svn.html#svn-mirrors>`__.

-  *``repository``* is one of the Project repositories, i.e., ``base``,
   ``ports``, or ``doc``.

-  *``branch``* depends on the repository used. ``ports`` and ``doc``
   are mostly updated in the ``head`` branch, while ``base`` maintains
   the latest version of -CURRENT under ``head`` and the respective
   latest versions of the -STABLE branches under ``stable/8`` (for
   8.\ *``x``*), ``stable/9`` (9.*``x``*) and ``stable/10``
   (10.*``x``*).

-  *``lwcdir``* is the target directory where the contents of the
   specified branch should be placed. This is usually ``/usr/ports`` for
   ``ports``, ``/usr/src`` for ``base``, and ``/usr/doc`` for ``doc``.

.. raw:: html

   </div>

This example checks out the Ports Collection from the western US
repository using the HTTPS protocol, placing the local working copy in
``/usr/ports``. If ``/usr/ports`` is already present but was not created
by ``svn``, remember to rename or delete it before the checkout.

.. code:: screen

    # svn checkout https://svn0.us-west.FreeBSD.org/ports/head /usr/ports

Because the initial checkout has to download the full branch of the
remote repository, it can take a while. Please be patient.

After the initial checkout, the local working copy can be updated by
running:

.. code:: screen

    # svn update lwcdir

To update ``/usr/ports`` created in the example above, use:

.. code:: screen

    # svn update /usr/ports

The update is much quicker than a checkout, only transferring files that
have changed.

An alternate way of updating the local working copy after checkout is
provided by the ``Makefile`` in the ``/usr/ports``, ``/usr/src``, and
``/usr/doc`` directories. Set ``SVN_UPDATE`` and use the ``update``
target. For example, to update ``/usr/src``:

.. code:: screen

    # cd /usr/src
    # make update SVN_UPDATE=yes

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

A.4.4.?Subversion Mirror Sites
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

All mirrors carry all repositories.

The master FreeBSD Subversion server, ``svn.FreeBSD.org``, is publicly
accessible, read-only. That may change in the future, so users are
encouraged to use one of the official mirrors. To view the FreeBSD
Subversion repositories through a browser, use
http://svnweb.FreeBSD.org/.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

The FreeBSD Subversion mirror network is still in its early days, and
will likely change. Do not count on this list of mirrors being static.
In particular, the SSL certificates of the servers will likely change at
some point.

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+--------------------------------+--------------------------------------------------------------------------------------------------------------------------+-------------------+------------------------------------------------------------------------+
| Name                           | Protocols                                                                                                                | Location          | SSL Fingerprint                                                        |
+================================+==========================================================================================================================+===================+========================================================================+
| ``svn0.us-west.FreeBSD.org``   | ``svn``, ```http`` <http://svn0.us-west.FreeBSD.org/>`__, ```https`` <https://svn0.us-west.FreeBSD.org/>`__              | USA, California   | SHA1 ``1C:BD:85:95:11:9F:EB:75:A5:4B:C8:A3:FE:08:E4:02:73:06:1E:61``   |
+--------------------------------+--------------------------------------------------------------------------------------------------------------------------+-------------------+------------------------------------------------------------------------+
| ``svn0.us-east.FreeBSD.org``   | ``svn``, ```http`` <http://svn0.us-east.FreeBSD.org/>`__, ```https`` <https://svn0.us-east.FreeBSD.org/>`__, ``rsync``   | USA, New Jersey   | SHA1 ``1C:BD:85:95:11:9F:EB:75:A5:4B:C8:A3:FE:08:E4:02:73:06:1E:61``   |
+--------------------------------+--------------------------------------------------------------------------------------------------------------------------+-------------------+------------------------------------------------------------------------+
| ``svn0.eu.FreeBSD.org``        | ``svn``, ```http`` <http://svn0.eu.FreeBSD.org/>`__, ```https`` <https://svn0.eu.FreeBSD.org/>`__, ``rsync``             | Europe, UK        | SHA1 ``98:22:1F:B0:CF:20:ED:3F:5D:05:38:AB:50:F1:47:53:3C:6B:14:6A``   |
+--------------------------------+--------------------------------------------------------------------------------------------------------------------------+-------------------+------------------------------------------------------------------------+
| ``svn0.ru.FreeBSD.org``        | ``svn``, ```http`` <http://svn0.ru.FreeBSD.org/>`__, ```https`` <https://svn0.ru.FreeBSD.org/>`__, ``rsync``             | Russia, Moscow    | SHA1 ``F6:44:AA:B9:03:89:0E:3E:8C:4D:4D:14:F0:27:E6:C7:C1:8B:17:C5``   |
+--------------------------------+--------------------------------------------------------------------------------------------------------------------------+-------------------+------------------------------------------------------------------------+

.. raw:: html

   </div>

HTTPS is the preferred protocol, providing protection against another
computer pretending to be the FreeBSD mirror (commonly known as a “man
in the middle” attack) or otherwise trying to send bad content to the
end user.

On the first connection to an HTTPS mirror, the user will be asked to
verify the server *fingerprint*:

.. code:: screen

    Error validating server certificate for 'https://svn0.us-west.freebsd.org:443':
     - The certificate is not issued by a trusted authority. Use the
       fingerprint to validate the certificate manually!
     - The certificate hostname does not match.
    Certificate information:
     - Hostname: svnmir.ysv.FreeBSD.org
     - Valid: from Jul 29 22:01:21 2013 GMT until Dec 13 22:01:21 2040 GMT
     - Issuer: clusteradm, FreeBSD.org, (null), CA, US (clusteradm@FreeBSD.org)
     - Fingerprint: 1C:BD:85:95:11:9F:EB:75:A5:4B:C8:A3:FE:08:E4:02:73:06:1E:61
    (R)eject, accept (t)emporarily or accept (p)ermanently?

Compare the fingerprint shown to those listed in the table above. If the
fingerprint matches, the server security certificate can be accepted
temporarily or permanently. A temporary certificate will expire after a
single session with the server, and the verification step will be
repeated on the next connection. Accepting the certificate permanently
will store the authentication credentials in ``~/.subversion/auth/`` and
the user will not be asked to verify the fingerprint again until the
certificate expires.

If ``https`` cannot be used due to firewall or other problems, ``svn``
is the next choice, with slightly faster transfers. When neither can be
used, use ``http``.

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

A.4.5.?For More Information
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

For other information about using Subversion, please see the “Subversion
Book”, titled `Version Control with
Subversion <http://svnbook.red-bean.com/>`__, or the `Subversion
Documentation <http://subversion.apache.org/docs/>`__.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------+-------------------------+------------------------------------+
| `Prev <ctm.html>`__?   | `Up <mirrors.html>`__   | ?\ `Next <mirrors-rsync.html>`__   |
+------------------------+-------------------------+------------------------------------+
| A.3.?Using CTM?        | `Home <index.html>`__   | ?A.5.?Using rsync                  |
+------------------------+-------------------------+------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
