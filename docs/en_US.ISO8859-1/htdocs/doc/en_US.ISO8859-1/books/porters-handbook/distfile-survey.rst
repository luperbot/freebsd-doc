===================================================
14.5.?Portscout: the FreeBSD Ports Distfile Scanner
===================================================

.. raw:: html

   <div class="navheader">

14.5.?Portscout: the FreeBSD Ports Distfile Scanner
`Prev <build-cluster.html>`__?
Chapter?14.?Keeping Up
?\ `Next <portsmon.html>`__

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

14.5.?Portscout: the FreeBSD Ports Distfile Scanner
---------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The build cluster is dedicated to building the latest release of each
port with distfiles that have already been fetched. However, as the
Internet continually changes, distfiles can quickly go missing.
`Portscout <http://portscout.FreeBSD.org>`__, the FreeBSD Ports distfile
scanner, attempts to query every download site for every port to find
out if each distfile is still available. Portscout can generate HTML
reports and send emails about newly available ports to those who request
them. Unless not otherwise subscribed, maintainers are asked to check
periodically for changes, either by hand or using the RSS feed.

Portscout's first page gives the email address of the port maintainer,
the number of ports the maintainer is responsible for, the number of
those ports with new distfiles, and the percentage of those ports that
are out-of-date. The search function allows for searching by email
address for a specific maintainer, and for selecting whether only
out-of-date ports are shown.

Upon clicking on a maintainer's email address, a list of all of their
ports is displayed, along with port category, current version number,
whether or not there is a new version, when the port was last updated,
and finally when it was last checked. A search function on this page
allows the user to search for a specific port.

Clicking on a port name in the list displays the
`FreshPorts <http://freshports.org>`__ port information.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------------+----------------------------+----------------------------------------------+
| `Prev <build-cluster.html>`__?             | `Up <keeping-up.html>`__   | ?\ `Next <portsmon.html>`__                  |
+--------------------------------------------+----------------------------+----------------------------------------------+
| 14.4.?The FreeBSD Port Building Cluster?   | `Home <index.html>`__      | ?14.6.?The FreeBSD Ports Monitoring System   |
+--------------------------------------------+----------------------------+----------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
