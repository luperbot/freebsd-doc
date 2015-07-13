=====================
5.3.?Finding Software
=====================

.. raw:: html

   <div class="navheader">

5.3.?Finding Software
`Prev <ports-overview.html>`__?
Chapter?5.?Installing Applications: Packages and Ports
?\ `Next <pkgng-intro.html>`__

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

5.3.?Finding Software
---------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD's list of available applications is growing all the time. There
are a number of ways to find software to install:

.. raw:: html

   <div class="itemizedlist">

-  The FreeBSD web site maintains an up-to-date searchable list of all
   the available applications, at
   `http://www.FreeBSD.org/ports/ <../../../../ports/index.html>`__. The
   ports can be searched by application name or by software category.

-  

   Dan Langille maintains
   `FreshPorts.org <http://www.FreshPorts.org/>`__ which provides a
   comprehensive search utility and also tracks changes to the
   applications in the Ports Collection. Registered users can create a
   customized watch list in order to receive an automated email when
   their watched ports are updated.

-  

   If finding a particular application becomes challenging, try
   searching a site like
   `SourceForge.net <http://www.sourceforge.net/>`__ or
   `GitHub.com <http://www.github.com/>`__ then check back at the
   `FreeBSD site <../../../../ports/index.html>`__ to see if the
   application has been ported.

-  

   To search the binary package repository for an application:

   .. code:: screen

       # pkg search subversion
       git-subversion-1.9.2
       java-subversion-1.8.8_2
       p5-subversion-1.8.8_2
       py27-hgsubversion-1.6
       py27-subversion-1.8.8_2
       ruby-subversion-1.8.8_2
       subversion-1.8.8_2
       subversion-book-4515
       subversion-static-1.8.8_2
       subversion16-1.6.23_4
       subversion17-1.7.16_2

   Package names include the version number and in case of ports based
   on python, the version number of the version of python the package
   was built with. Some ports also have multiple versions available. In
   case of subversion there are different versions available, as well as
   different compile options. In this case, the staticly linked version
   of subversion. When indicating which package to install, it is best
   to specify the application by the port origin, which is the path in
   the ports tree. Repeat the ``pkg search`` with ``-o`` to list the
   origin of each package:

   .. code:: screen

       # pkg search -o subversion
       devel/git-subversion
       java/java-subversion
       devel/p5-subversion
       devel/py-hgsubversion
       devel/py-subversion
       devel/ruby-subversion
       devel/subversion16
       devel/subversion17
       devel/subversion
       devel/subversion-book
       devel/subversion-static

   Searching by shell globs, regular expressions, exact match, by
   description, or any other field in the repository database is also
   supported by ``pkg search``. After installing
   `ports-mgmt/pkg <http://www.freebsd.org/cgi/url.cgi?ports/ports-mgmt/pkg/pkg-descr>`__
   or
   `ports-mgmt/pkg-devel <http://www.freebsd.org/cgi/url.cgi?ports/ports-mgmt/pkg-devel/pkg-descr>`__,
   see
   `pkg-search(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg-search&sektion=8>`__
   for more details.

-  If the Ports Collection is already installed, there are several
   methods to query the local version of the ports tree. To find out
   which category a port is in, type ``whereis file``, where *``file``*
   is the program to be installed:

   .. code:: screen

       # whereis lsof
       lsof: /usr/ports/sysutils/lsof

   Alternately, an
   `echo(1) <http://www.FreeBSD.org/cgi/man.cgi?query=echo&sektion=1>`__
   statement can be used:

   .. code:: screen

       # echo /usr/ports/*/*lsof*
       /usr/ports/sysutils/lsof

   Note that this will also return any matched files downloaded into the
   ``/usr/ports/distfiles`` directory.

-  Another way to find software is by using the Ports Collection's
   built-in search mechanism. To use the search feature, cd to
   ``/usr/ports`` then run ``make         search name=program-name``
   where *``program-name``* is the name of the software. For example, to
   search for ``lsof``:

   .. code:: screen

       # cd /usr/ports
       # make search name=lsof
       Port:   lsof-4.88.d,8
       Path:   /usr/ports/sysutils/lsof
       Info:   Lists information about open files (similar to fstat(1))
       Maint:  ler@lerctr.org
       Index:  sysutils
       B-deps:
       R-deps: 

   .. raw:: html

      <div class="tip" xmlns="">

   Tip:
   ~~~~

   The built-in search mechanism uses a file of index information. If a
   message indicates that the ``INDEX`` is required, run
   ``make fetchindex`` to download the current index file. With the
   ``INDEX`` present, ``make search`` will be able to perform the
   requested search.

   .. raw:: html

      </div>

   The “Path:” line indicates where to find the port.

   To receive less information, use the ``quicksearch`` feature:

   .. code:: screen

       # cd /usr/ports
       # make quicksearch name=lsof
       Port:   lsof-4.88.d,8
       Path:   /usr/ports/sysutils/lsof
       Info:   Lists information about open files (similar to fstat(1))

   For more in-depth searching, use ``make search       key=string`` or
   ``make quicksearch       key=string``, where *``string``* is some
   text to search for. The text can be in comments, descriptions, or
   dependencies in order to find ports which relate to a particular
   subject when the name of the program is unknown.

   When using ``search`` or ``quicksearch``, the search string is
   case-insensitive. Searching for “LSOF” will yield the same results as
   searching for “lsof”.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------------+-------------------------+-------------------------------------------------+
| `Prev <ports-overview.html>`__?           | `Up <ports.html>`__     | ?\ `Next <pkgng-intro.html>`__                  |
+-------------------------------------------+-------------------------+-------------------------------------------------+
| 5.2.?Overview of Software Installation?   | `Home <index.html>`__   | ?5.4.?Using pkg for Binary Package Management   |
+-------------------------------------------+-------------------------+-------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
