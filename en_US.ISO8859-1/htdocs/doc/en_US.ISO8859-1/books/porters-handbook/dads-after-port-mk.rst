=========================================
12.5.?Writing Something After bsd.port.mk
=========================================

.. raw:: html

   <div class="navheader">

12.5.?Writing Something After ``bsd.port.mk``
`Prev <porting-versions.html>`__?
Chapter?12.?Dos and Don'ts
?\ `Next <dads-sh-exec.html>`__

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

12.5.?Writing Something After ``bsd.port.mk``
---------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Do not write anything after the ``.include <bsd.port.mk>`` line. It
usually can be avoided by including ``bsd.port.pre.mk`` somewhere in the
middle of the ``Makefile`` and ``bsd.port.post.mk`` at the end.

.. raw:: html

   <div class="important" xmlns="">

Important:
~~~~~~~~~~

Include either the ``bsd.port.pre.mk``/``bsd.port.post.mk`` pair or
``bsd.port.mk`` only; do not mix these two usages.

.. raw:: html

   </div>

``bsd.port.pre.mk`` only defines a few variables, which can be used in
tests in the ``Makefile``, ``bsd.port.post.mk`` defines the rest.

Here are some important variables defined in ``bsd.port.pre.mk`` (this
is not the complete list, please read ``bsd.port.mk`` for the complete
list).

.. raw:: html

   <div class="informaltable">

+-----------------+-------------------------------------------------------------------------------------------------------+
| Variable        | Description                                                                                           |
+=================+=======================================================================================================+
| ``ARCH``        | The architecture as returned by ``uname         -m`` (for example, ``i386``)                          |
+-----------------+-------------------------------------------------------------------------------------------------------+
| ``OPSYS``       | The operating system type, as returned by ``uname -s`` (for example, ``FreeBSD``)                     |
+-----------------+-------------------------------------------------------------------------------------------------------+
| ``OSREL``       | The release version of the operating system (for example, ``2.1.5`` or ``2.2.7``)                     |
+-----------------+-------------------------------------------------------------------------------------------------------+
| ``OSVERSION``   | The numeric version of the operating system; the same as ```__FreeBSD_version`` <versions.html>`__.   |
+-----------------+-------------------------------------------------------------------------------------------------------+
| ``LOCALBASE``   | The base of the “local” tree (for example, ``/usr/local``)                                            |
+-----------------+-------------------------------------------------------------------------------------------------------+
| ``PREFIX``      | Where the port installs itself (see `more on ``PREFIX`` <porting-prefix.html>`__).                    |
+-----------------+-------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

When ``MASTERDIR`` is needed, always define it before including
``bsd.port.pre.mk``.

.. raw:: html

   </div>

Here are some examples of things that can be added after
``bsd.port.pre.mk``:

.. code:: programlisting

    # no need to compile lang/perl5 if perl5 is already in system
    .if ${OSVERSION} > 300003
    BROKEN= perl is in system
    .endif

Always use tab instead of spaces after ``BROKEN=``.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------------------------+------------------------------+--------------------------------------------------------+
| `Prev <porting-versions.html>`__?                          | `Up <porting-dads.html>`__   | ?\ `Next <dads-sh-exec.html>`__                        |
+------------------------------------------------------------+------------------------------+--------------------------------------------------------+
| 12.4.?Differentiating Operating Systems and OS Versions?   | `Home <index.html>`__        | ?12.6.?Use the ``exec`` Statement in Wrapper Scripts   |
+------------------------------------------------------------+------------------------------+--------------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
