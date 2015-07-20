=========================================
17.5. Planning the Security Configuration
=========================================

.. raw:: html

   <div class="navheader">

17.5. Planning the Security Configuration
`????? <mac-understandlabel.html>`__?
???????? 17. ???????????? ??????? ?????????
?\ `??????? <mac-modules.html>`__

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

17.5. Planning the Security Configuration
-----------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Whenever a new technology is implemented, a planning phase is always a
good idea. During the planning stages, an administrator should in
general look at the ?big picture?, trying to keep in view at least the
following:

.. raw:: html

   <div class="itemizedlist">

-  The implementation requirements;

-  The implementation goals;

.. raw:: html

   </div>

For MAC installations, these include:

.. raw:: html

   <div class="itemizedlist">

-  How to classify information and resources available on the target
   systems.

-  What sorts of information or resources to restrict access to along
   with the type of restrictions that should be applied.

-  Which MAC module or modules will be required to achieve this goal.

.. raw:: html

   </div>

It is always possible to reconfigure and change the system resources and
security settings, it is quite often very inconvenient to search through
the system and fix existing files and user accounts. Planning helps to
ensure a trouble-free and efficient trusted system implementation. A
trial run of the trusted system, including the configuration, is often
vital and definitely beneficial *before* a MAC implementation is used on
production systems. The idea of just letting loose on a system with MAC
is like setting up for failure.

Different environments may have explicit needs and requirements.
Establishing an in depth and complete security profile will decrease the
need of changes once the system goes live. As such, the future sections
will cover the different modules available to administrators; describe
their use and configuration; and in some cases provide insight on what
situations they would be most suitable for. For instance, a web server
might roll out the
`mac\_biba(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_biba&sektion=4>`__
and
`mac\_bsdextended(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_bsdextended&sektion=4>`__
policies. In other cases, a machine with very few local users, the
`mac\_partition(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_partition&sektion=4>`__
might be a good choice.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------+-------------------------+-------------------------------------+
| `????? <mac-understandlabel.html>`__?   | `???? <mac.html>`__     | ?\ `??????? <mac-modules.html>`__   |
+-----------------------------------------+-------------------------+-------------------------------------+
| 17.4. Understanding MAC Labels?         | `???? <index.html>`__   | ?17.6. Module Configuration         |
+-----------------------------------------+-------------------------+-------------------------------------+

.. raw:: html

   </div>

???? ?? ???????, ??? ???? ???????, ?????? ?? ?????? ???
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| ??? ????????? ??????? ?? ?? FreeBSD, ???????? ???
  `?????????? <http://www.FreeBSD.org/docs.html>`__ ???? ??
  ?????????????? ?? ??? <questions@FreeBSD.org\ >.
|  ??? ????????? ??????? ?? ???? ??? ??????????, ??????? e-mail ????
  <doc@FreeBSD.org\ >.
