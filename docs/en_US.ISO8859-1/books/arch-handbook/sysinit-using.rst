==================
5.3.?Using SYSINIT
==================

.. raw:: html

   <div class="navheader">

5.3.?Using SYSINIT
`Prev <sysinit-operation.html>`__?
Chapter?5.?The SYSINIT Framework
?\ `Next <mac.html>`__

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

5.3.?Using SYSINIT
------------------

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

5.3.1.?Interface
~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

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

5.3.1.1.?Headers
^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. code:: programlisting

    <sys/kernel.h>

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

5.3.1.2.?Macros
^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. code:: programlisting

    SYSINIT(uniquifier, subsystem, order, func, ident)
    SYSUNINIT(uniquifier, subsystem, order, func, ident)

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

5.3.2.?Startup
~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The ``SYSINIT()`` macro creates the necessary SYSINIT data in SYSINIT's
startup data set for SYSINIT to sort and dispatch a function at system
startup and module load. ``SYSINIT()`` takes a uniquifier that SYSINIT
uses to identify the particular function dispatch data, the subsystem
order, the subsystem element order, the function to call, and the data
to pass the function. All functions must take a constant pointer
argument.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?5.1.?Example of a ``SYSINIT()``

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    #include <sys/kernel.h>

    void foo_null(void *unused)
    {
            foo_doo();
    }
    SYSINIT(foo, SI_SUB_FOO, SI_ORDER_FOO, foo_null, NULL);

    struct foo foo_voodoo = {
            FOO_VOODOO;
    }

    void foo_arg(void *vdata)
    {
            struct foo *foo = (struct foo *)vdata;
            foo_data(foo);
    }
    SYSINIT(bar, SI_SUB_FOO, SI_ORDER_FOO, foo_arg, &foo_voodoo);
        

.. raw:: html

   </div>

.. raw:: html

   </div>

Note that ``SI_SUB_FOO`` and ``SI_ORDER_FOO`` need to be in the
``sysinit_sub_id`` and ``sysinit_elem_order`` enum's as mentioned above.
Either use existing ones or add your own to the enum's. You can also use
math for fine-tuning the order a SYSINIT will run in. This example shows
a SYSINIT that needs to be run just barely before the SYSINIT's that
handle tuning kernel parameters.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?5.2.?Example of Adjusting ``SYSINIT()`` Order

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    static void
    mptable_register(void *dummy __unused)
    {

        apic_register_enumerator(&mptable_enumerator);
    }

    SYSINIT(mptable_register, SI_SUB_TUNABLES - 1, SI_ORDER_FIRST,
        mptable_register, NULL);

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

5.3.3.?Shutdown
~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The ``SYSUNINIT()`` macro behaves similarly to the ``SYSINIT()`` macro
except that it adds the SYSINIT data to SYSINIT's shutdown data set.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?5.3.?Example of a ``SYSUNINIT()``

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    #include <sys/kernel.h>

    void foo_cleanup(void *unused)
    {
            foo_kill();
    }
    SYSUNINIT(foobar, SI_SUB_FOO, SI_ORDER_FOO, foo_cleanup, NULL);

    struct foo_stack foo_stack = {
            FOO_STACK_VOODOO;
    }

    void foo_flush(void *vdata)
    {
    }
    SYSUNINIT(barfoo, SI_SUB_FOO, SI_ORDER_FOO, foo_flush, &foo_stack);
        

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

+--------------------------------------+-------------------------+--------------------------------------------+
| `Prev <sysinit-operation.html>`__?   | `Up <sysinit.html>`__   | ?\ `Next <mac.html>`__                     |
+--------------------------------------+-------------------------+--------------------------------------------+
| 5.2.?SYSINIT Operation?              | `Home <index.html>`__   | ?Chapter?6.?The TrustedBSD MAC Framework   |
+--------------------------------------+-------------------------+--------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
