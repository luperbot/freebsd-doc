======================================
4.?Configuration: Installation & Setup
======================================

.. raw:: html

   <div class="navheader">

4.?Configuration: Installation & Setup
`Prev <prerequisites.html>`__?
?
?\ `Next <build.html>`__

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

4.?Configuration: Installation & Setup
--------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Download the
`freebsd-update-server <http://svnweb.freebsd.org/base/user/cperciva/freebsd-update-build/>`__
software by installing
`devel/subversion <http://www.freebsd.org/cgi/url.cgi?ports/devel/subversion/pkg-descr>`__,
and execute:

.. code:: screen

    % svn co
        http://svn.freebsd.org/base/user/cperciva/freebsd-update-build
        freebsd-update-server

Update ``scripts/build.conf`` appropriately. It is sourced during all
build operations.

Here is the default ``build.conf``, which should be modified to suit
your environment.

.. raw:: html

   <div class="informalexample">

.. code:: programlisting

    # Main configuration file for FreeBSD Update builds.  The
    # release-specific configuration data is lower down in
    # the scripts tree.

    # Location from which to fetch releases
    export FTP=ftp://ftp2.freebsd.org/pub/FreeBSD/releases

    # Host platform
    export HOSTPLATFORM=`uname -m`

    # Host name to use inside jails
    export BUILDHOSTNAME=${HOSTPLATFORM}-builder.daemonology.net

    # Location of SSH key
    export SSHKEY=/root/.ssh/id_dsa

    # SSH account into which files are uploaded
    MASTERACCT=builder@wadham.daemonology.net

    # Directory into which files are uploaded
    MASTERDIR=update-master.freebsd.org

.. raw:: html

   </div>

Parameters for consideration would be:

.. raw:: html

   <div class="calloutlist">

+--------------------------------------+--------------------------------------+
| `|1| <#ftp-id>`__                    | This is the location where ISO       |
|                                      | images are downloaded from (by the   |
|                                      | ``fetchiso()`` subroutine of         |
|                                      | ``scripts/build.subr``). The         |
|                                      | location configured is not limited   |
|                                      | to FTP URIs. Any URI scheme          |
|                                      | supported by standard                |
|                                      | `fetch(1) <http://www.FreeBSD.org/cg |
|                                      | i/man.cgi?query=fetch&sektion=1>`__  |
|                                      | utility should work fine.            |
|                                      |                                      |
|                                      | Customizations to the ``fetchiso()`` |
|                                      | code can be installed by copying the |
|                                      | default ``build.subr`` script to the |
|                                      | release and architecture-specific    |
|                                      | area at                              |
|                                      | ``scripts/RELEASE/ARCHITECTURE/build |
|                                      | .subr``                              |
|                                      | and applying local changes.          |
+--------------------------------------+--------------------------------------+
| `|2| <#buildhost-id>`__              | The name of the build host. This     |
|                                      | information will be displayed on     |
|                                      | updated systems when issuing:        |
|                                      |                                      |
|                                      | .. code:: screen                     |
|                                      |                                      |
|                                      |     % uname -v                       |
+--------------------------------------+--------------------------------------+
| `|3| <#sshkey-id>`__                 | The SSH key for uploading files to   |
|                                      | the update server. A key pair can be |
|                                      | created by typing                    |
|                                      | ``ssh-keygen -t dsa``. This          |
|                                      | parameter is optional; standard      |
|                                      | password authentication will be used |
|                                      | as a fallback authentication method  |
|                                      | when ``SSHKEY`` is not defined.      |
|                                      |                                      |
|                                      | The                                  |
|                                      | `ssh-keygen(1) <http://www.FreeBSD.o |
|                                      | rg/cgi/man.cgi?query=ssh-keygen&sekt |
|                                      | ion=1>`__                            |
|                                      | manual page has more detailed        |
|                                      | information about SSH and the        |
|                                      | appropriate steps for creating and   |
|                                      | using one.                           |
+--------------------------------------+--------------------------------------+
| `|4| <#mstacct-id>`__                | Account for uploading files to the   |
|                                      | update server.                       |
+--------------------------------------+--------------------------------------+
| `|5| <#mstdir-id>`__                 | Directory on the update server where |
|                                      | files are uploaded to.               |
+--------------------------------------+--------------------------------------+

.. raw:: html

   </div>

The default ``build.conf`` shipped with the freebsd-update-server
sources is suitable for building i386 releases of FreeBSD. As an example
of building an update server for other architectures, the following
steps outline the configuration changes needed for amd64:

.. raw:: html

   <div class="procedure">

#. Create a build environment for amd64:

   .. raw:: html

      <div class="informalexample">

   .. code:: screen

       % mkdir -p /usr/local/freebsd-update-server/scripts/7.2-RELEASE/amd64

   .. raw:: html

      </div>

#. Install a ``build.conf`` in the newly created build directory. The
   build configuration options for FreeBSD 7.2-RELEASE on amd64 should
   be similar to:

   .. raw:: html

      <div class="informalexample">

   .. code:: programlisting

       # SHA256 hash of RELEASE disc1.iso image.
       export RELH=1ea1f6f652d7c5f5eab7ef9f8edbed50cb664b08ed761850f95f48e86cc71ef5

       # Components of the world, source, and kernels
       export WORLDPARTS="base catpages dict doc games info manpages proflibs lib32"
       export SOURCEPARTS="base bin contrib crypto etc games gnu include krb5  \
                       lib libexec release rescue sbin secure share sys tools  \
                       ubin usbin cddl"
       export KERNELPARTS="generic"

       # EOL date
       export EOL=1275289200

   .. raw:: html

      </div>

   .. raw:: html

      <div class="calloutlist">

   +--------------------------------------+--------------------------------------+
   | `|1| <#sha256-id>`__                 | The                                  |
   |                                      | `sha256(1) <http://www.FreeBSD.org/c |
   |                                      | gi/man.cgi?query=sha256&sektion=1>`_ |
   |                                      | _                                    |
   |                                      | hash key for the desired release, is |
   |                                      | published within the respective      |
   |                                      | `release                             |
   |                                      | announcement <../../../../releases/> |
   |                                      | `__.                                 |
   +--------------------------------------+--------------------------------------+
   | `|2| <#eol-id>`__                    | To generate the "End of Life" number |
   |                                      | for ``build.conf``, refer to the     |
   |                                      | "Estimated EOL" posted on the        |
   |                                      | `FreeBSD Security                    |
   |                                      | Website <../../../../security/securi |
   |                                      | ty.html>`__.                         |
   |                                      | The value of ``EOL`` can be derived  |
   |                                      | from the date listed on the web      |
   |                                      | site, using the                      |
   |                                      | `date(1) <http://www.FreeBSD.org/cgi |
   |                                      | /man.cgi?query=date&sektion=1>`__    |
   |                                      | utility, for example:                |
   |                                      |                                      |
   |                                      | .. code:: screen                     |
   |                                      |                                      |
   |                                      |     % date -j -f '%Y%m%d-%H%M%S' '20 |
   |                                      | 090401-000000' '+%s'                 |
   +--------------------------------------+--------------------------------------+

   .. raw:: html

      </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------+-------------------------+----------------------------+
| `Prev <prerequisites.html>`__?   | ?                       | ?\ `Next <build.html>`__   |
+----------------------------------+-------------------------+----------------------------+
| 3.?Prerequisites?                | `Home <index.html>`__   | ?5.?Building Update Code   |
+----------------------------------+-------------------------+----------------------------+

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
