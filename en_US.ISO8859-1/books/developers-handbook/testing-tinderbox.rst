=================================
6.2.?The FreeBSD Source Tinderbox
=================================

.. raw:: html

   <div class="navheader">

6.2.?The FreeBSD Source Tinderbox
`Prev <testing.html>`__?
Chapter?6.?Regression and Performance Testing
?\ `Next <ipc.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="section">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.2.?The FreeBSD Source Tinderbox
---------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The source Tinderbox consists of:

.. raw:: html

   <div class="itemizedlist">

-  A build script, ``tinderbox``, that automates checking out a specific
   version of the FreeBSD source tree and building it.

-  A supervisor script, ``tbmaster``, that monitors individual Tinderbox
   instances, logs their output, and emails failure notices.

-  A CGI script named ``index.cgi`` that reads a set of tbmaster logs
   and presents an easy-to-read HTML summary of them.

-  A set of build servers that continually test the tip of the most
   important FreeBSD code branches.

-  A webserver that keeps a complete set of Tinderbox logs and displays
   an up-to-date summary.

.. raw:: html

   </div>

The scripts are maintained and were developed by Dag-Erling C. Sm?rgrav
``<des@FreeBSD.org>``, and are now written in Perl, a move on from their
original incarnation as shell scripts. All scripts and configuration
files are kept in
`/projects/tinderbox/ <http://www.freebsd.org/cgi/cvsweb.cgi/projects/tinderbox/>`__.

For more information about the tinderbox and tbmaster scripts at this
stage, see their respective man pages: tinderbox(1) and tbmaster(1).

.. raw:: html

   <div class="section">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.2.1.?The ``index.cgi`` Script
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The ``index.cgi`` script generates the HTML summary of tinderbox and
tbmaster logs. Although originally intended to be used as a CGI script,
as indicated by its name, this script can also be run from the command
line or from a
`cron(8) <http://www.FreeBSD.org/cgi/man.cgi?query=cron&sektion=8>`__
job, in which case it will look for logs in the directory where the
script is located. It will automatically detect context, generating HTTP
headers when it is run as a CGI script. It conforms to XHTML standards
and is styled using CSS.

The script starts in the ``main()`` block by attempting to verify that
it is running on the official Tinderbox website. If it is not, a page
indicating it is not an official website is produced, and a URL to the
official site is provided.

Next, it scans the log directory to get an inventory of configurations,
branches and architectures for which log files exist, to avoid
hard-coding a list into the script and potentially ending up with blank
rows or columns. This information is derived from the names of the log
files matching the following pattern:

.. code:: programlisting

    tinderbox-$config-$branch-$arch-$machine.{brief,full}

The configurations used on the official Tinderbox build servers are
named for the branches they build. For example, the ``releng_8``
configuration is used to build ``RELENG_8`` as well as all
still-supported release branches.

Once all of this startup procedure has been successfully completed,
``do_config()`` is called for each configuration.

The ``do_config()`` function generates HTML for a single Tinderbox
configuration.

It works by first generating a header row, then iterating over each
branch build with the specified configuration, producing a single row of
results for each in the following manner:

.. raw:: html

   <div class="itemizedlist">

-  For each item:

   .. raw:: html

      <div class="itemizedlist">

   -  For each machine within that architecture:

      .. raw:: html

         <div class="itemizedlist">

      -  If a brief log file exists, then:

         .. raw:: html

            <div class="itemizedlist">

         -  Call ``success()`` to determine the outcome of the build.

         -  Output the modification size.

         -  Output the size of the brief log file with a link to the log
            file itself.

         -  If a full log file also exists, then:

            .. raw:: html

               <div class="itemizedlist">

            -  Output the size of the full log file with a link to the
               log file itself.

            .. raw:: html

               </div>

         .. raw:: html

            </div>

      -  Otherwise:

         .. raw:: html

            <div class="itemizedlist">

         -  No output.

         .. raw:: html

            </div>

      .. raw:: html

         </div>

   .. raw:: html

      </div>

.. raw:: html

   </div>

The ``success()`` function mentioned above scans a brief log file for
the string “tinderbox run completed” in order to determine whether the
build was successful.

Configurations and branches are sorted according to their branch rank.
This is computed as follows:

.. raw:: html

   <div class="itemizedlist">

-  ``HEAD`` and ``CURRENT`` have rank 9999.

-  ``RELENG_x`` has rank *``xx``*\ 99.

-  ``RELENG_x``\ \_\ *``y``* has rank *``xxyy``*.

.. raw:: html

   </div>

This means that ``HEAD`` always ranks highest, and ``RELENG`` branches
are ranked in numerical order, with each ``STABLE`` branch ranking
higher than the release branches forked off of it. For instance, for
FreeBSD?8, the order from highest to lowest would be:

.. raw:: html

   <div class="itemizedlist">

-  ``RELENG_8`` (branch rank 899).

-  ``RELENG_8_3`` (branch rank 803).

-  ``RELENG_8_2`` (branch rank 802).

-  ``RELENG_8_1`` (branch rank 801).

-  ``RELENG_8_0`` (branch rank 800).

.. raw:: html

   </div>

The colors that Tinderbox uses for each cell in the table are defined by
CSS. Successful builds are displayed with green text; unsuccessful
builds are displayed with red text. The color fades as time passes since
the corresponding build, with every half an hour bringing the color
closer to grey.

.. raw:: html

   </div>

.. raw:: html

   <div class="section">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.2.2.?Official Build Servers
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The official Tinderbox build servers are hosted by `Sentex Data
Communications <http://www.sentex.ca>`__, who also host the `FreeBSD
Netperf
Cluster <http://www.freebsd.org/projects/netperf/cluster.html>`__.

Three build servers currently exist:

*freebsd-current.sentex.ca* builds:

.. raw:: html

   <div class="itemizedlist">

-  ``HEAD`` for amd64, arm, i386, i386/pc98, ia64, mips, powerpc,
   powerpc64, and sparc64.

-  ``RELENG_9`` and supported 9.\ *``X``* branches for amd64, arm, i386,
   i386/pc98, ia64, mips, powerpc, powerpc64, and sparc64.

.. raw:: html

   </div>

*freebsd-stable.sentex.ca* builds:

.. raw:: html

   <div class="itemizedlist">

-  ``RELENG_8`` and supported 8.\ *``X``* branches for amd64, i386,
   i386/pc98, ia64, mips, powerpc and sparc64.

.. raw:: html

   </div>

*freebsd-legacy.sentex.ca* builds:

.. raw:: html

   <div class="itemizedlist">

-  ``RELENG_7`` and supported 7.\ *``X``* branches for amd64, i386,
   i386/pc98, ia64, powerpc, and sparc64.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="section">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.2.3.?Official Summary Site
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Summaries and logs from the official build servers are available online
at http://tinderbox.FreeBSD.org, hosted by Dag-Erling C. Sm?rgrav
``<des@FreeBSD.org>`` and set up as follows:

.. raw:: html

   <div class="itemizedlist">

-  A
   `cron(8) <http://www.FreeBSD.org/cgi/man.cgi?query=cron&sektion=8>`__
   job checks the build servers at regular intervals and downloads any
   new log files using
   `rsync(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rsync&sektion=1>`__.

-  Apache is set up to use ``index.cgi`` as ``DirectoryIndex``.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------------------+-------------------------+----------------------------------------+
| `Prev <testing.html>`__?                         | `Up <testing.html>`__   | ?\ `Next <ipc.html>`__                 |
+--------------------------------------------------+-------------------------+----------------------------------------+
| Chapter?6.?Regression and Performance Testing?   | `Home <index.html>`__   | ?Part?II.?Interprocess Communication   |
+--------------------------------------------------+-------------------------+----------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
