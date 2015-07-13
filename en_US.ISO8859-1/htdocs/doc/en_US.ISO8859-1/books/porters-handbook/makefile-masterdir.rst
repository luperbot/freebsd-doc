==============
5.9.?MASTERDIR
==============

.. raw:: html

   <div class="navheader">

5.9.?\ ``MASTERDIR``
`Prev <makefile-depend.html>`__?
Chapter?5.?Configuring the Makefile
?\ `Next <makefile-manpages.html>`__

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

5.9.?\ ``MASTERDIR``
--------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If the port needs to build slightly different versions of packages by
having a variable (for instance, resolution, or paper size) take
different values, create one subdirectory per package to make it easier
for users to see what to do, but try to share as many files as possible
between ports. Typically, by using variables cleverly, only a very short
``Makefile`` is needed in all but one of the directories. In the sole
``Makefile``, use ``MASTERDIR`` to specify the directory where the rest
of the files are. Also, use a variable as part of
```PKGNAMESUFFIX`` <makefile-naming.html#porting-pkgname>`__ so the
packages will have different names.

This will be best demonstrated by an example. This is part of
``japanese/xdvi300/Makefile``;

.. code:: programlisting

    PORTNAME=  xdvi
    PORTVERSION=    17
    PKGNAMEPREFIX=  ja-
    PKGNAMESUFFIX=  ${RESOLUTION}

    # default
    RESOLUTION?=    300
    .if ${RESOLUTION} != 118 && ${RESOLUTION} != 240 && \
        ${RESOLUTION} != 300 && ${RESOLUTION} != 400
    pre-everything::
        @${ECHO_MSG} "Error: invalid value for RESOLUTION: \"${RESOLUTION}\""
        @${ECHO_MSG} "Possible values are: 118, 240, 300 (default) and 400."
        @${FALSE}
    .endif

`japanese/xdvi300 <http://www.freebsd.org/cgi/url.cgi?ports/japanese/xdvi300/pkg-descr>`__
also has all the regular patches, package files, etc. Running ``make``
there, it will take the default value for the resolution (300) and build
the port normally.

As for other resolutions, this is the *entire* ``xdvi118/Makefile``:

.. code:: programlisting

    RESOLUTION=    118
    MASTERDIR=  ${.CURDIR}/../xdvi300

    .include "${MASTERDIR}/Makefile"

(``xdvi240/Makefile`` and ``xdvi400/Makefile`` are similar).
``MASTERDIR`` definition tells ``bsd.port.mk`` that the regular set of
subdirectories like ``FILESDIR`` and ``SCRIPTDIR`` are to be found under
``xdvi300``. The ``RESOLUTION=118`` line will override the
``RESOLUTION=300`` line in ``xdvi300/Makefile`` and the port will be
built with resolution set to 118.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------+---------------------------+----------------------------------------+
| `Prev <makefile-depend.html>`__?   | `Up <makefiles.html>`__   | ?\ `Next <makefile-manpages.html>`__   |
+------------------------------------+---------------------------+----------------------------------------+
| 5.8.?Dependencies?                 | `Home <index.html>`__     | ?5.10.?Man Pages                       |
+------------------------------------+---------------------------+----------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
