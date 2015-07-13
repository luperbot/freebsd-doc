=================================================
3.?Packages and Ports: Adding Software in FreeBSD
=================================================

.. raw:: html

   <div class="navheader">

3.?Packages and Ports: Adding Software in FreeBSD
`Prev <shells.html>`__?
?
?\ `Next <startup.html>`__

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

3.?Packages and Ports: Adding Software in FreeBSD
-------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD provides two methods for installing applications: binary
packages and compiled ports. Each method has its own benefits:

.. raw:: html

   <div class="itemizedlist">

.. raw:: html

   <div class="itemizedlist-title">

Binary Packages

.. raw:: html

   </div>

-  Faster installation as compared to compiling large applications.
-  Does not require an understanding of how to compile software.
-  No need to install a compiler.

.. raw:: html

   </div>

.. raw:: html

   <div class="itemizedlist">

.. raw:: html

   <div class="itemizedlist-title">

Ports

.. raw:: html

   </div>

-  Ability to customize installation options.
-  Custom patches can be applied.

.. raw:: html

   </div>

If an application installation does not require any customization,
installing the package is sufficient. Compile the port instead whenever
an application requires customization of the default options. If needed,
a custom package can be compiled from ports using ``make`` ``package``.

A complete list of all available ports and packages can be found
`here <http://www.freebsd.org/ports/master-index.html>`__.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.1.?Packages
~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Packages are pre-compiled applications, the FreeBSD equivalents of
``.deb`` files on Debian/Ubuntu based systems and ``.rpm`` files on
Red?Hat/Fedora based systems. Packages are installed using ``pkg``. For
example, the following command installs Apache 2.4:

.. code:: screen

    # pkg install apache24

For more information on packages refer to section 5.4 of the FreeBSD
Handbook: `Using pkgng for Binary Package
Management <../../../../doc/en_US.ISO8859-1/books/handbook/pkgng-intro.html>`__.

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

3.2.?Ports
~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The FreeBSD Ports Collection is a framework of ``Makefiles`` and patches
specifically customized for installing applications from source on
FreeBSD. When installing a port, the system will fetch the source code,
apply any required patches, compile the code, and install the
application and any required dependencies.

The Ports Collection, sometimes referred to as the ports tree, can be
installed to ``/usr/ports`` using
`portsnap(8) <http://www.FreeBSD.org/cgi/man.cgi?query=portsnap&sektion=8>`__.
Detailed instructions for installing the Ports Collection can be found
in `section
5.5 <../../../../doc/en_US.ISO8859-1/books/handbook/ports-using.html>`__
of the FreeBSD Handbook.

To compile a port, change to the port's directory and start the build
process. The following example installs Apache 2.4 from the Ports
Collection:

.. code:: screen

    # cd /usr/ports/www/apache24
    # make install clean

A benefit of using ports to install software is the ability to customize
the installation options. This example specifies that the mod\_ldap
module should also be installed:

.. code:: screen

    # cd /usr/ports/www/apache24
    # make WITH_LDAP="YES" install clean

Refer to `Using the Ports
Collection <../../../../doc/en_US.ISO8859-1/books/handbook/ports-using.html>`__
for more information.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------+-------------------------+------------------------------+
| `Prev <shells.html>`__?   | ?                       | ?\ `Next <startup.html>`__   |
+---------------------------+-------------------------+------------------------------+
| 2.?Default Shell?         | `Home <index.html>`__   | ?4.?System Startup           |
+---------------------------+-------------------------+------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
