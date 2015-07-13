===============
5.5.?MAINTAINER
===============

.. raw:: html

   <div class="navheader">

5.5.?\ ``MAINTAINER``
`Prev <makefile-distfiles.html>`__?
Chapter?5.?Configuring the Makefile
?\ `Next <makefile-comment.html>`__

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

5.5.?\ ``MAINTAINER``
---------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Set your mail-address here. Please. *:-)*

Only a single address without the comment part is allowed as a
``MAINTAINER`` value. The format used is ``user@hostname.domain``.
Please do not include any descriptive text such as a real name in this
entry. That merely confuses the Ports infrastructure and most tools
using it.

The maintainer is responsible for keeping the port up to date and making
sure that it works correctly. For a detailed description of the
responsibilities of a port maintainer, refer to `The challenge for port
maintainers <../../../../doc/en_US.ISO8859-1/articles/contributing-ports/maintain-port.html>`__.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

A maintainer volunteers to keep a port in good working order.
Maintainers have the primary responsibility for their ports, but not
exclusive ownership. Ports exist for the benefit of the community and,
in reality, belong to the community. What this means is that people
other than the maintainer can make changes to a port. Large changes to
the Ports Collection might require changes to many ports. The FreeBSD
Ports Management Team or members of other teams might modify ports to
fix dependency issues or other problems, like a version bump for a
shared library update.

Some types of fixes have “blanket approval” from the Ports Management
Team ``<portmgr@FreeBSD.org>``, allowing any committer to fix those
categories of problems on any port. These fixes do not need approval
from the maintainer. Blanket approval does not apply to ports that are
maintained by teams like ``<autotools@FreeBSD.org>``,
``<x11@FreeBSD.org>``, ``<gnome@FreeBSD.org>``, or
``<kde@FreeBSD.org>``. These teams use external repositories and can
have work that would conflict with changes that would normally fall
under blanket approval.

Blanket approval for most ports applies to these types of fixes:

.. raw:: html

   <div class="itemizedlist" xmlns="http://www.w3.org/1999/xhtml">

-  Most infrastructure changes to a port (that is, modernizing, but not
   changing the functionality). For example, converting to staging,
   ``USE_GMAKE`` to ``USES=gmake``, the new ``LIB_DEPENDS`` format...

-  Trivial and *tested* build and runtime fixes.

.. raw:: html

   </div>

.. raw:: html

   </div>

Other changes to the port will be sent to the maintainer for review and
approval before being committed. If the maintainer does not respond to
an update request after two weeks (excluding major public holidays),
then that is considered a maintainer timeout, and the update may be made
without explicit maintainer approval. If the maintainer does not respond
within three months, or if there have been three consecutive timeouts,
then that maintainer is considered absent without leave, and can be
replaced as the maintainer of the particular port in question.
Exceptions to this are anything maintained by the Ports Management Team
``<portmgr@FreeBSD.org>``, or the Security Officer Team
``<security-officer@FreeBSD.org>``. No unauthorized commits may ever be
made to ports maintained by those groups.

We reserve the right to modify the maintainer's submission to better
match existing policies and style of the Ports Collection without
explicit blessing from the submitter or the maintainer. Also, large
infrastructural changes can result in a port being modified without the
maintainer's consent. These kinds of changes will never affect the
port's functionality.

The Ports Management Team ``<portmgr@FreeBSD.org>`` reserves the right
to revoke or override anyone's maintainership for any reason, and the
Security Officer Team ``<security-officer@FreeBSD.org>`` reserves the
right to revoke or override maintainership for security reasons.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------+---------------------------+---------------------------------------+
| `Prev <makefile-distfiles.html>`__?   | `Up <makefiles.html>`__   | ?\ `Next <makefile-comment.html>`__   |
+---------------------------------------+---------------------------+---------------------------------------+
| 5.4.?The Distribution Files?          | `Home <index.html>`__     | ?5.6.?\ ``COMMENT``                   |
+---------------------------------------+---------------------------+---------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
