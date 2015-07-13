=============
6.?Conclusion
=============

.. raw:: html

   <div class="navheader">

6.?Conclusion
`Prev <mi.html>`__?
?
?\ `Next <literatures.html>`__

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

6.?Conclusion
-------------

.. raw:: html

   </div>

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

6.1.?Results
~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

As of April 2007 the Linux? emulation layer is capable of emulating the
Linux??2.6.16 kernel quite well. The remaining problems concern futexes,
unfinished \*at family of syscalls, problematic signals delivery,
missing ``epoll`` and ``inotify`` and probably some bugs we have not
discovered yet. Despite this we are capable of running basically all the
Linux? programs included in FreeBSD Ports?Collection with Fedora?Core?4
at 2.6.16 and there are some rudimentary reports of success with
Fedora?Core?6 at 2.6.16. The Fedora?Core?6 linux\_base was recently
committed enabling some further testing of the emulation layer and
giving us some more hints where we should put our effort in implementing
missing stuff.

We are able to run the most used applications like
`www/linux-firefox <http://www.freebsd.org/cgi/url.cgi?ports/www/linux-firefox/pkg-descr>`__,
`www/linux-opera <http://www.freebsd.org/cgi/url.cgi?ports/www/linux-opera/pkg-descr>`__,
`net-im/skype <http://www.freebsd.org/cgi/url.cgi?ports/net-im/skype/pkg-descr>`__
and some games from the Ports?Collection. Some of the programs exhibit
bad behaviour under 2.6 emulation but this is currently under
investigation and hopefully will be fixed soon. The only big application
that is known not to work is the Linux? Java™ Development Kit and this
is because of the requirement of ``epoll`` facility which is not
directly related to the Linux? kernel 2.6.

We hope to enable 2.6.16 emulation by default some time after FreeBSD
7.0 is released at least to expose the 2.6 emulation parts for some
wider testing. Once this is done we can switch to Fedora?Core?6
linux\_base, which is the ultimate plan.

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

6.2.?Future work
~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Future work should focus on fixing the remaining issues with futexes,
implement the rest of the \*at family of syscalls, fix the signal
delivery and possibly implement the ``epoll`` and ``inotify``
facilities.

We hope to be able to run the most important programs flawlessly soon,
so we will be able to switch to the 2.6 emulation by default and make
the Fedora?Core?6 the default linux\_base because our currently used
Fedora?Core?4 is not supported any more.

The other possible goal is to share our code with NetBSD and
DragonflyBSD. NetBSD has some support for 2.6 emulation but its far from
finished and not really tested. DragonflyBSD has expressed some interest
in porting the 2.6 improvements.

Generally, as Linux? develops we would like to keep up with their
development, implementing newly added syscalls. Splice comes to mind
first. Some already implemented syscalls are also heavily crippled, for
example ``mremap`` and others. Some performance improvements can also be
made, finer grained locking and others.

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

6.3.?Team
~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

I cooperated on this project with (in alphabetical order):

.. raw:: html

   <div class="itemizedlist">

-  John Baldwin ``<jhb@FreeBSD.org>``

-  Konstantin Belousov ``<kib@FreeBSD.org>``

-  Emmanuel Dreyfus

-  Scot Hetzel

-  Jung-uk Kim ``<jkim@FreeBSD.org>``

-  Alexander Leidinger ``<netchild@FreeBSD.org>``

-  Suleiman Souhlal ``<ssouhlal@FreeBSD.org>``

-  Li Xiao

-  David Xu ``<davidxu@FreeBSD.org>``

.. raw:: html

   </div>

I would like to thank all those people for their advice, code reviews
and general support.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------+-------------------------+----------------------------------+
| `Prev <mi.html>`__?                   | ?                       | ?\ `Next <literatures.html>`__   |
+---------------------------------------+-------------------------+----------------------------------+
| 5.?Linux? emulation layer -MI part?   | `Home <index.html>`__   | ?7.?Literatures                  |
+---------------------------------------+-------------------------+----------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
