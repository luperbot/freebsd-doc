=================
3.?Data Integrity
=================

.. raw:: html

   <div class="navheader">

3.?Data Integrity
`Prev <vinum-access-bottlenecks.html>`__?
?
?\ `Next <vinum-objects.html>`__

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

3.?Data Integrity
-----------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The final problem with disks is that they are unreliable. Although
reliability has increased tremendously over the last few years, disk
drives are still the most likely core component of a server to fail.
When they do, the results can be catastrophic and replacing a failed
disk drive and restoring data can result in server downtime.

One approach to this problem is *mirroring*, or RAID-1, which keeps two
copies of the data on different physical hardware. Any write to the
volume writes to both disks; a read can be satisfied from either, so if
one drive fails, the data is still available on the other drive.

Mirroring has two problems:

.. raw:: html

   <div class="itemizedlist">

-  It requires twice as much disk storage as a non-redundant solution.

-  Writes must be performed to both drives, so they take up twice the
   bandwidth of a non-mirrored volume. Reads do not suffer from a
   performance penalty and can even be faster.

.. raw:: html

   </div>

An alternative solution is *parity*, implemented in RAID levels 2, 3, 4
and 5. Of these, RAID-5 is the most interesting. As implemented in
``vinum``, it is a variant on a striped organization which dedicates one
block of each stripe to parity one of the other blocks. As implemented
by ``vinum``, a RAID-5 plex is similar to a striped plex, except that it
implements RAID-5 by including a parity block in each stripe. As
required by RAID-5, the location of this parity block changes from one
stripe to the next. The numbers in the data blocks indicate the relative
block numbers.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?3.?RAID-5 Organization

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|RAID-5 Organization|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

| 

Compared to mirroring, RAID-5 has the advantage of requiring
significantly less storage space. Read access is similar to that of
striped organizations, but write access is significantly slower,
approximately 25% of the read performance. If one drive fails, the array
can continue to operate in degraded mode where a read from one of the
remaining accessible drives continues normally, but a read from the
failed drive is recalculated from the corresponding block from all the
remaining drives.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------------+-------------------------+------------------------------------+
| `Prev <vinum-access-bottlenecks.html>`__?   | ?                       | ?\ `Next <vinum-objects.html>`__   |
+---------------------------------------------+-------------------------+------------------------------------+
| 2.?Access Bottlenecks?                      | `Home <index.html>`__   | ?4.?\ ``vinum`` Objects            |
+---------------------------------------------+-------------------------+------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.

.. |RAID-5 Organization| image:: vinum-raid5-org.png
