==========================
6.8.?Userland Architecture
==========================

.. raw:: html

   <div class="navheader">

6.8.?Userland Architecture
`Prev <mac-entry-point-reference.html>`__?
Chapter?6.?The TrustedBSD MAC Framework
?\ `Next <mac-conclusion.html>`__

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

6.8.?Userland Architecture
--------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The TrustedBSD MAC Framework includes a number of policy-agnostic
elements, including MAC library interfaces for abstractly managing
labels, modifications to the system credential management and login
libraries to support the assignment of MAC labels to users, and a set of
tools to monitor and modify labels on processes, files, and network
interfaces. More details on the user architecture will be added to this
section in the near future.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.8.1.?APIs for Policy-Agnostic Label Management
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The TrustedBSD MAC Framework provides a number of library and system
calls permitting applications to manage MAC labels on objects using a
policy-agnostic interface. This permits applications to manipulate
labels for a variety of policies without being written to support
specific policies. These interfaces are used by general-purpose tools
such as
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8>`__,
`ls(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ls&sektion=1>`__ and
`ps(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ps&sektion=1>`__ to
view labels on network interfaces, files, and processes. The APIs also
support MAC management tools including
`getfmac(8) <http://www.FreeBSD.org/cgi/man.cgi?query=getfmac&sektion=8>`__,
`getpmac(8) <http://www.FreeBSD.org/cgi/man.cgi?query=getpmac&sektion=8>`__,
`setfmac(8) <http://www.FreeBSD.org/cgi/man.cgi?query=setfmac&sektion=8>`__,
`setfsmac(8) <http://www.FreeBSD.org/cgi/man.cgi?query=setfsmac&sektion=8>`__,
and
`setpmac(8) <http://www.FreeBSD.org/cgi/man.cgi?query=setpmac&sektion=8>`__.
The MAC APIs are documented in
`mac(3) <http://www.FreeBSD.org/cgi/man.cgi?query=mac&sektion=3>`__.

Applications handle MAC labels in two forms: an internalized form used
to return and set labels on processes and objects (``mac_t``), and
externalized form based on C strings appropriate for storage in
configuration files, display to the user, or input from the user. Each
MAC label contains a number of elements, each consisting of a name and
value pair. Policy modules in the kernel bind to specific names and
interpret the values in policy-specific ways. In the externalized string
form, labels are represented by a comma-delimited list of name and value
pairs separated by the ``/`` character. Labels may be directly converted
to and from text using provided APIs; when retrieving labels from the
kernel, internalized label storage must first be prepared for the
desired label element set. Typically, this is done in one of two ways:
using
`mac\_prepare(3) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_prepare&sektion=3>`__
and an arbitrary list of desired label elements, or one of the variants
of the call that loads a default element set from the
`mac.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=mac.conf&sektion=5>`__
configuration file. Per-object defaults permit application writers to
usefully display labels associated with objects without being aware of
the policies present in the system.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Currently, direct manipulation of label elements other than by
conversion to a text string, string editing, and conversion back to an
internalized label is not supported by the MAC library. Such interfaces
may be added in the future if they prove necessary for application
writers.

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

6.8.2.?Binding of Labels to Users
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The standard user context management interface,
`setusercontext(3) <http://www.FreeBSD.org/cgi/man.cgi?query=setusercontext&sektion=3>`__,
has been modified to retrieve MAC labels associated with a user's class
from
`login.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=login.conf&sektion=5>`__.
These labels are then set along with other user context when either
``LOGIN_SETALL`` is specified, or when ``LOGIN_SETMAC`` is explicitly
specified.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

It is expected that, in a future version of FreeBSD, the MAC label
database will be separated from the ``login.conf`` user class
abstraction, and be maintained in a separate database. However, the
`setusercontext(3) <http://www.FreeBSD.org/cgi/man.cgi?query=setusercontext&sektion=3>`__
API should remain the same following such a change.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------------+-------------------------+-------------------------------------+
| `Prev <mac-entry-point-reference.html>`__?   | `Up <mac.html>`__       | ?\ `Next <mac-conclusion.html>`__   |
+----------------------------------------------+-------------------------+-------------------------------------+
| 6.7.?MAC Policy Entry Point Reference?       | `Home <index.html>`__   | ?6.9.?Conclusion                    |
+----------------------------------------------+-------------------------+-------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
