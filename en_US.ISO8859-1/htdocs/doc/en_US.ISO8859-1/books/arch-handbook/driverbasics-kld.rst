=========================================
9.2.?Dynamic Kernel Linker Facility - KLD
=========================================

.. raw:: html

   <div class="navheader">

9.2.?Dynamic Kernel Linker Facility - KLD
`Prev <driverbasics.html>`__?
Chapter?9.?Writing FreeBSD Device Drivers
?\ `Next <driverbasics-char.html>`__

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

9.2.?Dynamic Kernel Linker Facility - KLD
-----------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The kld interface allows system administrators to dynamically add and
remove functionality from a running system. This allows device driver
writers to load their new changes into a running kernel without
constantly rebooting to test changes.

The kld interface is used through:

.. raw:: html

   <div class="itemizedlist">

-  ``kldload`` - loads a new kernel module
-  ``kldunload`` - unloads a kernel module
-  ``kldstat`` - lists loaded modules

.. raw:: html

   </div>

Skeleton Layout of a kernel module

.. code:: programlisting

    /*
     * KLD Skeleton
     * Inspired by Andrew Reiter's Daemonnews article
     */

    #include <sys/types.h>
    #include <sys/module.h>
    #include <sys/systm.h>  /* uprintf */
    #include <sys/errno.h>
    #include <sys/param.h>  /* defines used in kernel.h */
    #include <sys/kernel.h> /* types used in module initialization */

    /*
     * Load handler that deals with the loading and unloading of a KLD.
     */

    static int
    skel_loader(struct module *m, int what, void *arg)
    {
      int err = 0;

      switch (what) {
      case MOD_LOAD:                /* kldload */
        uprintf("Skeleton KLD loaded.\n");
        break;
      case MOD_UNLOAD:
        uprintf("Skeleton KLD unloaded.\n");
        break;
      default:
        err = EOPNOTSUPP;
        break;
      }
      return(err);
    }

    /* Declare this module to the rest of the kernel */

    static moduledata_t skel_mod = {
      "skel",
      skel_loader,
      NULL
    };

    DECLARE_MODULE(skeleton, skel_mod, SI_SUB_KLD, SI_ORDER_ANY);

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

9.2.1.?Makefile
~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD provides a system makefile to simplify compiling a kernel
module.

.. code:: programlisting

    SRCS=skeleton.c
    KMOD=skeleton

    .include <bsd.kmod.mk>

Running ``make`` with this makefile will create a file ``skeleton.ko``
that can be loaded into the kernel by typing:

.. code:: screen

    # kldload -v ./skeleton.ko

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------------+------------------------------+----------------------------------------+
| `Prev <driverbasics.html>`__?                | `Up <driverbasics.html>`__   | ?\ `Next <driverbasics-char.html>`__   |
+----------------------------------------------+------------------------------+----------------------------------------+
| Chapter?9.?Writing FreeBSD Device Drivers?   | `Home <index.html>`__        | ?9.3.?Character Devices                |
+----------------------------------------------+------------------------------+----------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
