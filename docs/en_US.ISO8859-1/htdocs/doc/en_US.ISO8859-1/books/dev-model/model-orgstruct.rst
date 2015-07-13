===================================
Chapter?3.?Organisational structure
===================================

.. raw:: html

   <div class="navheader">

Chapter?3.?Organisational structure
`Prev <ref-freebsd.html>`__?
?
?\ `Next <methodology-model.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="chapter">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

While no-one takes ownership of FreeBSD, the FreeBSD organisation is
divided into core, committers and contributors and is part of the
FreeBSD community that lives around it.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?3.1.?The FreeBSD Project's structure

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|The FreeBSD Project's structure|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

| 

Number of committers has been determined by going through CVS logs from
January 1st, 2004 to December 31st, 2004 and contributors by going
through the list of contributions and problem reports.

The main resource in the FreeBSD community is its developers: the
committers and contributors. It is with their contributions that the
project can move forward. Regular developers are referred to as
contributors. As by January 1st, 2003, there are an estimated 5500
contributors on the project.

Committers are developers with the privilege of being able to commit
changes. These are usually the most active developers who are willing to
spend their time not only integrating their own code but integrating
code submitted by the developers who do not have this privilege. They
are also the developers who elect the core team, and they have access to
closed discussions.

The project can be grouped into four distinct separate parts, and most
developers will focus their involvement in one part of FreeBSD. The four
parts are kernel development, userland development, ports and
documentation. When referring to the base system, both kernel and
userland is meant.

This split changes our triangle to look like this:

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?3.2.?The FreeBSD Project's structure with committers in
categories

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|The FreeBSD Project's structure with committers in categories|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

| 

Number of committers per area has been determined by going through CVS
logs from January 1st, 2004 to December 31st, 2004. Note that many
committers work in multiple areas, making the total number higher than
the real number of committers. The total number of committers at that
time was 269.

Committers fall into three groups: committers who are only concerned
with one area of the project (for instance file systems), committers who
are involved only with one sub-project and committers who commit to
different parts of the code, including sub-projects. Because some
committers work on different parts, the total number in the committers
section of the triangle is higher than in the above triangle.

The kernel is the main building block of FreeBSD. While the userland
applications are protected against faults in other userland
applications, the entire system is vulnerable to errors in the kernel.
This, combined with the vast amount of dependencies in the kernel and
that it is not easy to see all the consequences of a kernel change,
demands developers with a relative full understanding of the kernel.
Multiple development efforts in the kernel also requires a closer
coordination than userland applications do.

The core utilities, known as userland, provide the interface that
identifies FreeBSD, both user interface, shared libraries and external
interfaces to connecting clients. Currently, 162 people are involved in
userland development and maintenance, many being maintainers for their
own part of the code. Maintainership will be discussed in the
`Maintainership <sect-hats.html#role-maintainer>`__ section.

Documentation is handled by `The FreeBSD Documentation
Project <sub-project-documentation.html>`__ and includes all documents
surrounding the FreeBSD project, including the web pages. There were
during 2004 101 people making commits to the FreeBSD Documentation
Project.

Ports is the collection of meta-data that is needed to make software
packages build correctly on FreeBSD. An example of a port is the port
for the web-browser Mozilla. It contains information about where to
fetch the source, what patches to apply and how, and how the package
should be installed on the system. This allows automated tools to fetch,
build and install the package. As of this writing, there are more than
12600 ports available. `:sup:`[2]` <#ftn.idp63820112>`__ , ranging from
web servers to games, programming languages and most of the application
types that are in use on modern computers. Ports will be discussed
further in the section `The Ports
Subproject <sub-projects.html#sub-project-ports>`__.

.. raw:: html

   <div class="footnotes">

--------------

.. raw:: html

   <div id="ftn.idp63820112" class="footnote">

`:sup:`[2]` <#idp63820112>`__ Statistics are generated by counting the
number of entries in the file fetched by portsdb by April 1st, 2005.
portsdb is a part of the port sysutils/portupgrade.

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
| `Prev <ref-freebsd.html>`__?   | ?                       | ?\ `Next <methodology-model.html>`__   |
+--------------------------------+-------------------------+----------------------------------------+
| 2.5.?FreeBSD?                  | `Home <index.html>`__   | ?Chapter?4.?Methodology model          |
+--------------------------------+-------------------------+----------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.

.. |The FreeBSD Project's structure| image:: orghierarchy.png
.. |The FreeBSD Project's structure with committers in categories| image:: orghierarchy2.png
