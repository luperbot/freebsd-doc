==================================
8.?Preferred License for New Files
==================================

.. raw:: html

   <div class="navheader">

8.?Preferred License for New Files
`Prev <commit-log-message.html>`__?
?
?\ `Next <tracking.license.grants.html>`__

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

8.?Preferred License for New Files
----------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Currently the FreeBSD Project suggests and uses the following text as
the preferred license scheme:

.. code:: programlisting

    /*-
     * Copyright (c) [year] [your name]
     * All rights reserved.
     *
     * Redistribution and use in source and binary forms, with or without
     * modification, are permitted provided that the following conditions
     * are met:
     * 1. Redistributions of source code must retain the above copyright
     *    notice, this list of conditions and the following disclaimer.
     * 2. Redistributions in binary form must reproduce the above copyright
     *    notice, this list of conditions and the following disclaimer in the
     *    documentation and/or other materials provided with the distribution.
     *
     * THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
     * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
     * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
     * ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
     * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
     * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
     * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
     * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
     * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
     * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
     * SUCH DAMAGE.
     *
     * [id for your version control system, if any]
     */

The FreeBSD project strongly discourages the so-called "advertising
clause" in new code. Due to the large number of contributors to the
FreeBSD project, complying with this clause for many commercial vendors
has become difficult. If you have code in the tree with the advertising
clause, please consider removing it. In fact, please consider using the
above license for your code.

The FreeBSD project discourages completely new licenses and variations
on the standard licenses. New licenses require the approval of the Core
Team ``<core@FreeBSD.org>`` to reside in the main repository. The more
different licenses that are used in the tree, the more problems that
this causes to those wishing to utilize this code, typically from
unintended consequences from a poorly worded license.

Project policy dictates that code under some non-BSD licenses must be
placed only in specific sections of the repository, and in some cases,
compilation must be conditional or even disabled by default. For
example, the GENERIC kernel must be compiled under only licenses
identical to or substantially similar to the BSD license. GPL, APSL,
CDDL, etc, licensed software must not be compiled into GENERIC.

Developers are reminded that in open source, getting "open" right is
just as important as getting "source" right, as improper handling of
intellectual property has serious consequences. Any questions or
concerns should immediately be brought to the attention of the core
team.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------+-------------------------+----------------------------------------------------------------+
| `Prev <commit-log-message.html>`__?   | ?                       | ?\ `Next <tracking.license.grants.html>`__                     |
+---------------------------------------+-------------------------+----------------------------------------------------------------+
| 7.?Commit Log Messages?               | `Home <index.html>`__   | ?9.?Keeping Track of Licenses Granted to the FreeBSD Project   |
+---------------------------------------+-------------------------+----------------------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
