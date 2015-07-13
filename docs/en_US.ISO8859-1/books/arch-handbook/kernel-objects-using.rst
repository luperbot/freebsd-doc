===============
3.3.?Using Kobj
===============

.. raw:: html

   <div class="navheader">

3.3.?Using Kobj
`Prev <kernel-objects-operation.html>`__?
Chapter?3.?Kernel Objects
?\ `Next <jail.html>`__

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

3.3.?Using Kobj
---------------

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

3.3.1.?Structures
~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. code:: programlisting

    struct kobj_method

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

3.3.2.?Functions
~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. code:: programlisting

    void kobj_class_compile(kobj_class_t cls);
    void kobj_class_compile_static(kobj_class_t cls, kobj_ops_t ops);
    void kobj_class_free(kobj_class_t cls);
    kobj_t kobj_create(kobj_class_t cls, struct malloc_type *mtype, int mflags);
    void kobj_init(kobj_t obj, kobj_class_t cls);
    void kobj_delete(kobj_t obj, struct malloc_type *mtype);

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

3.3.3.?Macros
~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. code:: programlisting

    KOBJ_CLASS_FIELDS
    KOBJ_FIELDS
    DEFINE_CLASS(name, methods, size)
    KOBJMETHOD(NAME, FUNC)

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

3.3.4.?Headers
~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. code:: programlisting

    <sys/param.h>
    <sys/kobj.h>

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

3.3.5.?Creating an Interface Template
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The first step in using Kobj is to create an Interface. Creating the
interface involves creating a template that the script
``src/sys/kern/makeobjops.pl`` can use to generate the header and code
for the method declarations and method lookup functions.

Within this template the following keywords are used: ``#include``,
``INTERFACE``, ``CODE``, ``METHOD``, ``STATICMETHOD``, and ``DEFAULT``.

The ``#include`` statement and what follows it is copied verbatim to the
head of the generated code file.

For example:

.. code:: programlisting

    #include <sys/foo.h>

The ``INTERFACE`` keyword is used to define the interface name. This
name is concatenated with each method name as [interface name]\_[method
name]. Its syntax is INTERFACE [interface name];.

For example:

.. code:: programlisting

    INTERFACE foo;

The ``CODE`` keyword copies its arguments verbatim into the code file.
Its syntax is ``CODE { [whatever] };``

For example:

.. code:: programlisting

    CODE {
        struct foo * foo_alloc_null(struct bar *)
        {
            return NULL;
    }
    };

The ``METHOD`` keyword describes a method. Its syntax is
``METHOD [return type] [method name] { [object [,       arguments]] };``

For example:

.. code:: programlisting

    METHOD int bar {
        struct object *;
        struct foo *;
        struct bar;
    };

The ``DEFAULT`` keyword may follow the ``METHOD`` keyword. It extends
the ``METHOD`` key word to include the default function for method. The
extended syntax is
``METHOD [return type] [method name] {         [object; [other arguments]] }DEFAULT [default         function];``

For example:

.. code:: programlisting

    METHOD int bar {
        struct object *;
        struct foo *;
        int bar;
    } DEFAULT foo_hack;

The ``STATICMETHOD`` keyword is used like the ``METHOD`` keyword except
the kobj data is not at the head of the object structure so casting to
kobj\_t would be incorrect. Instead ``STATICMETHOD`` relies on the Kobj
data being referenced as 'ops'. This is also useful for calling methods
directly out of a class's method table.

Other complete examples:

.. code:: programlisting

    src/sys/kern/bus_if.m
    src/sys/kern/device_if.m

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

3.3.6.?Creating a Class
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The second step in using Kobj is to create a class. A class consists of
a name, a table of methods, and the size of objects if Kobj's object
handling facilities are used. To create the class use the macro
``DEFINE_CLASS()``. To create the method table create an array of
kobj\_method\_t terminated by a NULL entry. Each non-NULL entry may be
created using the macro ``KOBJMETHOD()``.

For example:

.. code:: programlisting

    DEFINE_CLASS(fooclass, foomethods, sizeof(struct foodata));

    kobj_method_t foomethods[] = {
        KOBJMETHOD(bar_doo, foo_doo),
        KOBJMETHOD(bar_foo, foo_foo),
        { NULL, NULL}
    };

The class must be “compiled”. Depending on the state of the system at
the time that the class is to be initialized a statically allocated
cache, “ops table” have to be used. This can be accomplished by
declaring a ``struct kobj_ops`` and using
``kobj_class_compile_static();`` otherwise, ``kobj_class_compile()``
should be used.

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

3.3.7.?Creating an Object
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The third step in using Kobj involves how to define the object. Kobj
object creation routines assume that Kobj data is at the head of an
object. If this in not appropriate you will have to allocate the object
yourself and then use ``kobj_init()`` on the Kobj portion of it;
otherwise, you may use ``kobj_create()`` to allocate and initialize the
Kobj portion of the object automatically. ``kobj_init()`` may also be
used to change the class that an object uses.

To integrate Kobj into the object you should use the macro KOBJ\_FIELDS.

For example

.. code:: programlisting

    struct foo_data {
        KOBJ_FIELDS;
        foo_foo;
        foo_bar;
    };

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

3.3.8.?Calling Methods
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The last step in using Kobj is to simply use the generated functions to
use the desired method within the object's class. This is as simple as
using the interface name and the method name with a few modifications.
The interface name should be concatenated with the method name using a
'\_' between them, all in upper case.

For example, if the interface name was foo and the method was bar then
the call would be:

.. code:: programlisting

    [return value = ] FOO_BAR(object [, other parameters]);

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

3.3.9.?Cleaning Up
~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

When an object allocated through ``kobj_create()`` is no longer needed
``kobj_delete()`` may be called on it, and when a class is no longer
being used ``kobj_class_free()`` may be called on it.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------------+--------------------------------+----------------------------------+
| `Prev <kernel-objects-operation.html>`__?   | `Up <kernel-objects.html>`__   | ?\ `Next <jail.html>`__          |
+---------------------------------------------+--------------------------------+----------------------------------+
| 3.2.?Kobj Operation?                        | `Home <index.html>`__          | ?Chapter?4.?The Jail Subsystem   |
+---------------------------------------------+--------------------------------+----------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
