=================================
4.2.?Getting the Original Sources
=================================

.. raw:: html

   <div class="navheader">

4.2.?Getting the Original Sources
`Prev <slow-porting.html>`__?
Chapter?4.?Slow Porting
?\ `Next <slow-modifying.html>`__

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

4.2.?Getting the Original Sources
---------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Get the original sources (normally) as a compressed tarball
(``foo.tar.gz`` or ``foo``.tar.bz2) and copy it into ``DISTDIR``. Always
use *mainstream* sources when and where possible.

Set the variable ``MASTER_SITES`` to reflect where the original tarball
resides. Shorthand definitions exist for most mainstream sites in
``bsd.sites.mk``. Please use these sites—and the associated
definitions—if at all possible, to help avoid the problem of having the
same information repeated over again many times in the source base. As
these sites tend to change over time, this becomes a maintenance
nightmare for everyone involved. See `Section?5.4.2,
“\ ``MASTER_SITES``\ ” <makefile-distfiles.html#makefile-master_sites>`__
for details.

If there is no FTP/HTTP site that is well-connected to the net, or can
only find sites that have irritatingly non-standard formats, put a copy
on a reliable FTP or HTTP server (for example, a home page).

If a convenient and reliable place to put the distfile cannot be found,
we can “house” it ourselves on ``ftp.FreeBSD.org``; however, this is the
least-preferred solution. The distfile must be placed into
``~/public_distfiles/`` of someone's ``freefall`` account. Ask the
person who commits the port to do this. This person will also set
``MASTER_SITES`` to ``LOCAL/username`` where ``username`` is their
FreeBSD cluster login.

If the port's distfile changes all the time without any kind of version
update by the author, consider putting the distfile on a home page and
listing it as the first ``MASTER_SITES``. Try to talk the port author
out of doing this; it really does help to establish some kind of source
code control. Hosting a specific version will prevent users from getting
checksum mismatch errors, and also reduce the workload of maintainers of
our FTP site. Also, if there is only one master site for the port, it is
recommended to house a backup on a home page and list it as the second
``MASTER_SITES``.

If the port requires some additional \`patches' that are available on
the Internet, fetch them too and put them in ``DISTDIR``. Do not worry
if they come from a site other than where the main source tarball comes,
we have a way to handle these situations (see the description of
`PATCHFILES <makefile-distfiles.html#porting-patchfiles>`__ below).

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------+------------------------------+-------------------------------------+
| `Prev <slow-porting.html>`__?   | `Up <slow-porting.html>`__   | ?\ `Next <slow-modifying.html>`__   |
+---------------------------------+------------------------------+-------------------------------------+
| Chapter?4.?Slow Porting?        | `Home <index.html>`__        | ?4.3.?Modifying the Port            |
+---------------------------------+------------------------------+-------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
