================
1.7.?boot2 Stage
================

.. raw:: html

   <div class="navheader">

1.7.?boot2 Stage
`Prev <btx-server.html>`__?
Chapter?1.?Bootstrapping and Kernel Initialization
?\ `Next <boot-loader.html>`__

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

1.7.?boot2 Stage
----------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``boot2`` defines an important structure, ``struct bootinfo``. This
structure is initialized by ``boot2`` and passed to the loader, and then
further to the kernel. Some nodes of this structures are set by
``boot2``, the rest by the loader. This structure, among other
information, contains the kernel filename, BIOS harddisk geometry, BIOS
drive number for boot device, physical memory available, ``envp``
pointer etc. The definition for it is:

.. code:: programlisting

    /usr/include/machine/bootinfo.h:
    struct bootinfo {
        u_int32_t   bi_version;
        u_int32_t   bi_kernelname;      /* represents a char * */
        u_int32_t   bi_nfs_diskless;    /* struct nfs_diskless * */
                    /* End of fields that are always present. */
    #define bi_endcommon    bi_n_bios_used
        u_int32_t   bi_n_bios_used;
        u_int32_t   bi_bios_geom[N_BIOS_GEOM];
        u_int32_t   bi_size;
        u_int8_t    bi_memsizes_valid;
        u_int8_t    bi_bios_dev;        /* bootdev BIOS unit number */
        u_int8_t    bi_pad[2];
        u_int32_t   bi_basemem;
        u_int32_t   bi_extmem;
        u_int32_t   bi_symtab;      /* struct symtab * */
        u_int32_t   bi_esymtab;     /* struct symtab * */
                    /* Items below only from advanced bootloader */
        u_int32_t   bi_kernend;     /* end of kernel space */
        u_int32_t   bi_envp;        /* environment */
        u_int32_t   bi_modulep;     /* preloaded modules */
    };

``boot2`` enters into an infinite loop waiting for user input, then
calls ``load()``. If the user does not press anything, the loop breaks
by a timeout, so ``load()`` will load the default file
(``/boot/loader``). Functions ``ino_t lookup(char *filename)`` and
``int xfsread(ino_t inode, void *buf, size_t       nbyte)`` are used to
read the content of a file into memory. ``/boot/loader`` is an ELF
binary, but where the ELF header is prepended with ``a.out``'s
``struct       exec`` structure. ``load()`` scans the loader's ELF
header, loading the content of ``/boot/loader`` into memory, and passing
the execution to the loader's entry:

.. code:: programlisting

    sys/boot/i386/boot2/boot2.c:
        __exec((caddr_t)addr, RB_BOOTINFO | (opts & RBX_MASK),
           MAKEBOOTDEV(dev_maj[dsk.type], 0, dsk.slice, dsk.unit, dsk.part),
           0, 0, 0, VTOP(&bootinfo));

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------+-------------------------+----------------------------------+
| `Prev <btx-server.html>`__?   | `Up <boot.html>`__      | ?\ `Next <boot-loader.html>`__   |
+-------------------------------+-------------------------+----------------------------------+
| 1.6.?The BTX Server?          | `Home <index.html>`__   | ?1.8.?loader Stage               |
+-------------------------------+-------------------------+----------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
