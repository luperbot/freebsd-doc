=======================
4.?Where to mirror from
=======================

.. raw:: html

   <div class="navheader">

4.?Where to mirror from
`Prev <mirror-howto.html>`__?
?
?\ `Next <mirror-official.html>`__

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

4.?Where to mirror from
-----------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This is an important issue. So this section will spend some effort to
explain the backgrounds. We will say this several times: under no
circumstances should you mirror from ``ftp.FreeBSD.org``.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.1.?A few words about the organization
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Mirrors are organized by country. All official mirrors have a DNS entry
of the form ``ftpN.CC.FreeBSD.org``. *CC* (i.e. country code) is the
*top level domain* (TLD) of the country where this mirror is located.
*N* is a number, telling that the host would be the *Nth* mirror in that
country. (Same applies to ``wwwN.CC.FreeBSD.org``, etc.) There are
mirrors with no *CC* part. These are the mirror sites that are very well
connected and allow a large number of concurrent users.
``ftp.FreeBSD.org`` is actually two machines, one currently located in
Denmark and the other in the United States. It is *NOT* a master site
and should never be used to mirror from. Lots of online documentation
leads “interactive”users to ``ftp.FreeBSD.org`` so automated mirroring
systems should find a different machine to mirror from.

Additionally there exists a hierarchy of mirrors, which is described in
terms of *tiers*. The master sites are not referred to but can be
described as *Tier-0*. Mirrors that mirror from these sites can be
considered *Tier-1*, mirrors of *Tier-1*-mirrors, are *Tier-2*, etc.
Official sites are encouraged to be of a low *tier*, but the lower the
tier the higher the requirements in terms as described in `Section?2,
“Requirements for FreeBSD mirrors” <mirror-requirements.html>`__. Also
access to low-tier-mirrors may be restricted, and access to master sites
is definitely restricted. The *tier*-hierarchy is not reflected by DNS
and generally not documented anywhere except for the master sites.
However, official mirrors with low numbers like 1-4, are usually
*Tier-1* (this is just a rough hint, and there is no rule).

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

4.2.?Ok, but where should I get the stuff now?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Under no circumstances should you mirror from ``ftp.FreeBSD.org``. The
short answer is: from the site that is closest to you in Internet terms,
or gives you the fastest access.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.2.1.?I just want to mirror from somewhere!
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If you have no special intentions or requirements, the statement in
`Section?4.2, “Ok, but where should I get the stuff
now?” <mirror-where.html#mirror-where-where>`__ applies. This means:

.. raw:: html

   <div class="procedure">

#. Check for those which provide fastest access (number of hops,
   round-trip-times) and offer the services you intend to use (like
   rsync).

#. Contact the administrators of your chosen site stating your request,
   and asking about their terms and policies.

#. Set up your mirror as described above.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.2.2.?I am an official mirror, what is the right site for me?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In general the description in `Section?4.2.1, “I just want to mirror
from somewhere!” <mirror-where.html#mirror-where-simple>`__ still
applies. Of course you may want to put some weight on the fact that your
upstream should be of a low tier. There are some other considerations
about *official* mirrors that are described in `Section?5, “Official
Mirrors” <mirror-official.html>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.2.3.?I want to access the master sites!
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If you have good reasons and good prerequisites, you may want and get
access to one of the master sites. Access to these sites is generally
restricted, and there are special policies for access. If you are
already an *official* mirror, this certainly helps you getting access.
In any other case make sure your country really needs another mirror. If
it already has three or more, ask the “zone administrator”
(``<hostmaster@CC.FreeBSD.org>``) or `FreeBSD mirror sites mailing
lists <http://lists.FreeBSD.org/mailman/listinfo/freebsd-hubs>`__ first.

Whoever helped you become, an *official* should have helped you gain
access to an appropriate upstream host, either one of the master sites
or a suitable Tier-1 site. If not, you can send email to
``<mirror-admin@FreeBSD.org>`` to request help with that.

There is one master site for the FTP fileset.

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.2.3.1.?ftp-master.FreeBSD.org
'''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This is the master site for the FTP fileset.

``ftp-master.FreeBSD.org`` provides rsync access, in addition to FTP.
Refer to `Section?3.1, “Mirroring the FTP
site” <mirror-howto.html#mirror-ftp-rsync>`__.

Mirrors are also encouraged to allow rsync access for the FTP contents,
since they are *Tier-1*-mirrors.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------+-------------------------+--------------------------------------+
| `Prev <mirror-howto.html>`__?   | ?                       | ?\ `Next <mirror-official.html>`__   |
+---------------------------------+-------------------------+--------------------------------------+
| 3.?How to Mirror FreeBSD?       | `Home <index.html>`__   | ?5.?Official Mirrors                 |
+---------------------------------+-------------------------+--------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
