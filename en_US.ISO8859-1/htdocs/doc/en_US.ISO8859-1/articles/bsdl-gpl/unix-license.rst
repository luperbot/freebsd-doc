========================================
3.?Unix from a BSD Licensing Perspective
========================================

.. raw:: html

   <div class="navheader">

3.?Unix from a BSD Licensing Perspective
`Prev <history.html>`__?
?
?\ `Next <current-bsdl.html>`__

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

3.?Unix from a BSD Licensing Perspective
----------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

AT&T, who owned the original Unix implementation, was a publicly
regulated monopoly tied up in anti-trust court; it was legally unable to
sell a product into the software market. It was, however, able to
provide it to academic institutions for the price of media.

Universities rapidly adopted Unix after an OS conference publicized its
availability. It was extremely helpful that Unix ran on the PDP-11, a
very affordable 16-bit computer, and was coded in a high-level language
that was demonstrably good for systems programming. The DEC PDP-11 had,
in effect, an open hardware interface designed to make it easy for
customers to write their own OS, which was common. As DEC founder Ken
Olsen famously proclaimed, “software comes from heaven when you have
good hardware”.

Unix author Ken Thompson returned to his alma mater, University of
California Berkeley (UCB), in 1975 and taught the kernel line-by-line.
This ultimately resulted in an evolving system known as BSD (Berkeley
Standard Distribution). UCB converted Unix to 32-bits, added virtual
memory, and implemented the version of the TCP/IP stack upon which the
Internet was essentially built. UCB made BSD available for the cost of
media, under what became known as “the BSD license”. A customer
purchased Unix from AT&T and then ordered a BSD tape from UCB.

In the mid-1980s a government anti-trust case against ATT ended with the
break-up of ATT. ATT still owned Unix and was now able to sell it. ATT
embarked on an aggressive licensing effort and most commercial Unixes of
the day became ATT-derived.

In the early 1990's ATT sued UCB over license violations related to BSD.
UCB discovered that ATT had incorporated, without acknowledgment or
payment, many improvements due to BSD into ATT's products, and a lengthy
court case, primarily between ATT and UCB, ensued. During this period
some UCB programmers embarked on a project to rewrite any ATT code
associated with BSD. This project resulted in a system called BSD
4.4-lite (lite because it was not a complete system; it lacked 6 key ATT
files).

A lengthy series of articles published slightly later in Dr. Dobbs
magazine described a BSD-derived 386 PC version of Unix, with
BSD-licensed replacement files for the 6 missing 4.4 lite files. This
system, named 386BSD, was due to ex-UCB programmer William Jolitz. It
became the original basis of all the PC BSDs in use today.

In the mid 1990s, Novell purchased ATT's Unix rights and a (then secret)
agreement was reached to terminate the lawsuit. UCB soon terminated its
support for BSD.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+-------------------------+-----------------------------------------------------+
| `Prev <history.html>`__?             | ?                       | ?\ `Next <current-bsdl.html>`__                     |
+--------------------------------------+-------------------------+-----------------------------------------------------+
| 2.?Very Brief Open Source History?   | `Home <index.html>`__   | ?4.?The Current State of FreeBSD and BSD Licenses   |
+--------------------------------------+-------------------------+-----------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
