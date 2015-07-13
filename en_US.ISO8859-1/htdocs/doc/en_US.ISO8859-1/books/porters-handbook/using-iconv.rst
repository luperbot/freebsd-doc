=================
6.22.?Using iconv
=================

.. raw:: html

   <div class="navheader">

6.22.?Using ``iconv``
`Prev <using-lua.html>`__?
Chapter?6.?Special Considerations
?\ `Next <using-xfce.html>`__

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

6.22.?Using ``iconv``
---------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

After 2013-10-08
(`254273 <https://svnweb.freebsd.org/changeset/base/254273>`__),
FreeBSD? 10-CURRENT and newer versions have a native ``iconv`` in the
operating system. On earlier versions,
`converters/libiconv <http://www.freebsd.org/cgi/url.cgi?ports/converters/libiconv/pkg-descr>`__
was used as a dependency.

For software that needs ``iconv``, define ``USES=iconv``. FreeBSD
versions before 10-CURRENT on 2013-08-13
(`254273 <https://svnweb.freebsd.org/changeset/base/254273>`__) do not
have a native ``iconv``. On these earlier versions, a dependency on
`converters/libiconv <http://www.freebsd.org/cgi/url.cgi?ports/converters/libiconv/pkg-descr>`__
will be added automatically.

When a port defines ``USES=iconv``, these variables will be available:

.. raw:: html

   <div class="informaltable">

+----------------------------+---------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------+
| Variable name              | Purpose                                                                               | Value before FreeBSD?10-CURRENT `254273 <https://svnweb.freebsd.org/changeset/base/254273>`__ (2013-08-13)   | Value after FreeBSD?10-CURRENT `254273 <https://svnweb.freebsd.org/changeset/base/254273>`__ (2013-08-13)   |
+============================+=======================================================================================+==============================================================================================================+=============================================================================================================+
| ``ICONV_CMD``              | Directory where the ``iconv`` binary resides                                          | ``${LOCALBASE}/bin/iconv``                                                                                   | ``/usr/bin/iconv``                                                                                          |
+----------------------------+---------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------+
| ``ICONV_LIB``              | ``ld`` argument to link to ``libiconv`` (if needed)                                   | ``-liconv``                                                                                                  | (empty)                                                                                                     |
+----------------------------+---------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------+
| ``ICONV_PREFIX``           | Directory where the ``iconv`` implementation resides (useful for configure scripts)   | ``${LOCALBASE}``                                                                                             | ``/usr``                                                                                                    |
+----------------------------+---------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------+
| ``ICONV_CONFIGURE_ARG``    | Preconstructed configure argument for configure scripts                               | ``--with-libiconv-prefix=${LOCALBASE}``                                                                      | (empty)                                                                                                     |
+----------------------------+---------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------+
| ``ICONV_CONFIGURE_BASE``   | Preconstructed configure argument for configure scripts                               | ``--with-libiconv=${LOCALBASE}``                                                                             | (empty)                                                                                                     |
+----------------------------+---------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

These two examples automatically populate the variables with the correct
value for systems using
`converters/libiconv <http://www.freebsd.org/cgi/url.cgi?ports/converters/libiconv/pkg-descr>`__
or the native ``iconv`` respectively:

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?6.14.?Simple ``iconv`` Usage

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    USES=        iconv
    LDFLAGS+=   -L${LOCALBASE}/lib ${ICONV_LIB}

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?6.15.?\ ``iconv`` Usage with ``configure``

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    USES=     iconv
    CONFIGURE_ARGS+=${ICONV_CONFIGURE_ARG}

.. raw:: html

   </div>

.. raw:: html

   </div>

As shown above, ``ICONV_LIB`` is empty when a native ``iconv`` is
present. This can be used to detect the native ``iconv`` and respond
appropriately.

Sometimes a program has an ``ld`` argument or search path hardcoded in a
``Makefile`` or configure script. This approach can be used to solve
that problem:

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?6.16.?Fixing Hardcoded ``-liconv``

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    USES=      iconv

    post-patch:
        @${REINPLACE_CMD} -e 's/-liconv/${ICONV_LIB}/' ${WRKSRC}/Makefile

.. raw:: html

   </div>

.. raw:: html

   </div>

In some cases it is necessary to set alternate values or perform
operations depending on whether there is a native ``iconv``.
``bsd.port.pre.mk`` must be included before testing the value of
``ICONV_LIB``:

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?6.17.?Checking for Native ``iconv`` Availability

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    USES=       iconv

    .include <bsd.port.pre.mk>

    post-patch:
    .if empty(ICONV_LIB)
        # native iconv detected
        @${REINPLACE_CMD} -e 's|iconv||' ${WRKSRC}/Config.sh
    .endif

    .include <bsd.port.post.mk>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------+-------------------------+---------------------------------+
| `Prev <using-lua.html>`__?   | `Up <special.html>`__   | ?\ `Next <using-xfce.html>`__   |
+------------------------------+-------------------------+---------------------------------+
| 6.21.?Using Lua?             | `Home <index.html>`__   | ?6.23.?Using Xfce               |
+------------------------------+-------------------------+---------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
