=======================================================
12.4.?Differentiating Operating Systems and OS Versions
=======================================================

.. raw:: html

   <div class="navheader">

12.4.?Differentiating Operating Systems and OS Versions
`Prev <porting-wrkdirprefix.html>`__?
Chapter?12.?Dos and Don'ts
?\ `Next <dads-after-port-mk.html>`__

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

12.4.?Differentiating Operating Systems and OS Versions
-------------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Some code needs modifications or conditional compilation based upon what
version of FreeBSD Unix it is running under. The preferred way to tell
FreeBSD versions apart are the ``__FreeBSD_version`` and ``__FreeBSD__``
macros defined in
`sys/param.h <http://svnweb.freebsd.org/base/head/sys/sys/param.h?view=markup>`__.
If this file is not included add the code,

.. code:: programlisting

    #include <sys/param.h>

to the proper place in the ``.c`` file.

``__FreeBSD__`` is defined in all versions of FreeBSD as their major
version number. For example, in FreeBSD 9.x, ``__FreeBSD__`` is defined
to be ``9``.

.. code:: programlisting

    #if __FreeBSD__ >= 9
    #  if __FreeBSD_version >= 901000
         /* 9.1+ release specific code here */
    #  endif
    #endif

A complete list of ``__FreeBSD_version`` values is available in
`Chapter?16, *``__FreeBSD_version`` Values* <versions.html>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------+------------------------------+--------------------------------------------------+
| `Prev <porting-wrkdirprefix.html>`__?   | `Up <porting-dads.html>`__   | ?\ `Next <dads-after-port-mk.html>`__            |
+-----------------------------------------+------------------------------+--------------------------------------------------+
| 12.3.?\ ``WRKDIRPREFIX``?               | `Home <index.html>`__        | ?12.5.?Writing Something After ``bsd.port.mk``   |
+-----------------------------------------+------------------------------+--------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
