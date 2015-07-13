==============================
7.3.?Filesystem I/O—struct buf
==============================

.. raw:: html

   <div class="navheader">

7.3.?Filesystem I/O—\ ``struct buf``
`Prev <vm-cache.html>`__?
Chapter?7.?Virtual Memory System
?\ `Next <vm-pagetables.html>`__

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

7.3.?Filesystem I/O—\ ``struct buf``
------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

vnode-backed VM objects, such as file-backed objects, generally need to
maintain their own clean/dirty info independent from the VM system's
idea of clean/dirty. For example, when the VM system decides to
synchronize a physical page to its backing store, the VM system needs to
mark the page clean before the page is actually written to its backing
store. Additionally, filesystems need to be able to map portions of a
file or file metadata into KVM in order to operate on it.

The entities used to manage this are known as filesystem buffers,
``struct buf``'s, or ``bp``'s. When a filesystem needs to operate on a
portion of a VM object, it typically maps part of the object into a
struct buf and the maps the pages in the struct buf into KVM. In the
same manner, disk I/O is typically issued by mapping portions of objects
into buffer structures and then issuing the I/O on the buffer
structures. The underlying vm\_page\_t's are typically busied for the
duration of the I/O. Filesystem buffers also have their own notion of
being busy, which is useful to filesystem driver code which would rather
operate on filesystem buffers instead of hard VM pages.

FreeBSD reserves a limited amount of KVM to hold mappings from struct
bufs, but it should be made clear that this KVM is used solely to hold
mappings and does not limit the ability to cache data. Physical data
caching is strictly a function of ``vm_page_t``'s, not filesystem
buffers. However, since filesystem buffers are used to placehold I/O,
they do inherently limit the amount of concurrent I/O possible. However,
as there are usually a few thousand filesystem buffers available, this
is not usually a problem.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------------------+-------------------------+------------------------------------------------------------+
| `Prev <vm-cache.html>`__?                          | `Up <vm.html>`__        | ?\ `Next <vm-pagetables.html>`__                           |
+----------------------------------------------------+-------------------------+------------------------------------------------------------+
| 7.2.?The Unified Buffer Cache—\ ``vm_object_t``?   | `Home <index.html>`__   | ?7.4.?Mapping Page Tables—\ ``vm_map_t,     vm_entry_t``   |
+----------------------------------------------------+-------------------------+------------------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
