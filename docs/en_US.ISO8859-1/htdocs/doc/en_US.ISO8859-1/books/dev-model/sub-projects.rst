=======================
Chapter?8.?Sub-projects
=======================

.. raw:: html

   <div class="navheader">

Chapter?8.?Sub-projects
`Prev <tool-ssh2.html>`__?
?
?\ `Next <sub-project-documentation.html>`__

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

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Table of Contents

.. raw:: html

   </div>

`8.1. The Ports Subproject <sub-projects.html#sub-project-ports>`__
`8.2. The FreeBSD Documentation
Project <sub-project-documentation.html>`__

.. raw:: html

   </div>

Sub-projects are formed to reduce the amount of communication needed to
coordinate the group of developers. When a problem area is sufficiently
isolated, most communication would be within the group focusing on the
problem, requiring less communication with the groups they communicate
with than were the group not isolated.

.. raw:: html

   <div class="section">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

8.1.?The Ports Subproject
-------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A “port” is a set of meta-data and patches that are needed to fetch,
compile and install correctly an external piece of software on a FreeBSD
system. The amount of ports have grown at a tremendous rate, as shown by
the following figure.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?8.1.?Number of ports added between 1996 and 2005

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Number of ports added between 1996 and 2005|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

| 

`Figure?8.1, “Number of ports added between 1996 and
2005” <sub-projects.html#fig-ports>`__ is taken from `the FreeBSD web
site <http://www.freebsd.org/ports/growth/status.png>`__. It shows the
number of ports available to FreeBSD in the period 1995 to 2005. It
looks like the curve has first grown exponentionally, and then since the
middle of 2001 grown linearly.

As the external software described by the port often is under continued
development, the amount of work required to maintain the ports is
already large, and increasing. This has led to the ports part of the
FreeBSD project gaining a more empowered structure, and is more and more
becoming a sub-project of the FreeBSD project.

Ports has its own core team with the `Ports
Manager <official-hats.html#role-ports-manager>`__ as its leader, and
this team can appoint committers without FreeBSD Core's approval. Unlike
in the FreeBSD Project, where a lot of maintenance frequently is
rewarded with a commit bit, the ports sub-project contains many active
maintainers that are not committers.

Unlike the main project, the ports tree is not branched. Every release
of FreeBSD follows the current ports collection and has thus available
updated information on where to find programs and how to build them.
This, however, means that a port that makes dependencies on the system
may need to have variations depending on what version of FreeBSD it runs
on.

With an unbranched ports repository it is not possible to guarantee that
any port will run on anything other than -CURRENT and -STABLE, in
particular older, minor releases. There is neither the infrastructure
nor volunteer time needed to guarantee this.

For efficiency of communication, teams depending on Ports, such as the
release engineering team, have their own ports liaisons.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------+-------------------------+------------------------------------------------+
| `Prev <tool-ssh2.html>`__?   | ?                       | ?\ `Next <sub-project-documentation.html>`__   |
+------------------------------+-------------------------+------------------------------------------------+
| 7.6.?Secure Shell?           | `Home <index.html>`__   | ?8.2.?The FreeBSD Documentation Project        |
+------------------------------+-------------------------+------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.

.. |Number of ports added between 1996 and 2005| image:: portsstatus.png
