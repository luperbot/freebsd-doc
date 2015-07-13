======================
6.7.?Using GNU gettext
======================

.. raw:: html

   <div class="navheader">

6.7.?Using GNU ``gettext``
`Prev <using-autotools.html>`__?
Chapter?6.?Special Considerations
?\ `Next <using-perl.html>`__

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

6.7.?Using GNU ``gettext``
--------------------------

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

6.7.1.?Basic Usage
~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If the port requires ``gettext``, set ``USES= gettext``, and the port
will inherit a dependency on ``libintl.so`` from
`devel/gettext <http://www.freebsd.org/cgi/url.cgi?ports/devel/gettext/pkg-descr>`__.
Other values for ``gettext`` usage are listed in
```USES=gettext`` <uses.html#uses-gettext>`__.

A rather common case is a port using ``gettext`` and ``configure``.
Generally, GNU ``configure`` should be able to locate ``gettext``
automatically.

.. code:: programlisting

    USES=  gettext
    GNU_CONFIGURE=  yes

If it ever fails to, hints at the location of ``gettext`` can be passed
in ``CPPFLAGS`` and ``LDFLAGS`` as follows:

.. code:: programlisting

    USES=   gettext
    CPPFLAGS+=  -I${LOCALBASE}/include
    LDFLAGS+=   -L${LOCALBASE}/lib

    GNU_CONFIGURE=  yes

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

6.7.2.?Optional Usage
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Some software products allow for disabling NLS. For example, through
passing ``--disable-nls`` to ``configure``. In that case, the port must
use ``gettext`` conditionally, depending on the status of the ``NLS``
option. For ports of low to medium complexity, use this idiom:

.. code:: programlisting

    GNU_CONFIGURE=       yes

    OPTIONS_DEFINE=     NLS
    OPTIONS_SUB=        yes

    NLS_USES=       gettext
    NLS_CONFIGURE_ENABLE=   nls

    .include <bsd.port.mk>

Or using the older way of using options:

.. code:: programlisting

    GNU_CONFIGURE=     yes

    OPTIONS_DEFINE=     NLS

    .include <bsd.port.options.mk>

    .if ${PORT_OPTIONS:MNLS}
    USES+=          gettext
    PLIST_SUB+=     NLS=""
    .else
    CONFIGURE_ARGS+=    --disable-nls
    PLIST_SUB+=     NLS="@comment "
    .endif

    .include <bsd.port.mk>

The next item on the to-do list is to arrange so that the message
catalog files are included in the packing list conditionally. The
``Makefile`` part of this task is already provided by the idiom. It is
explained in the section on `advanced ``pkg-plist``
practices <plist.html#plist-sub>`__. In a nutshell, each occurrence of
``%%NLS%%`` in ``pkg-plist`` will be replaced by “``@comment?``” if NLS
is disabled, or by a null string if NLS is enabled. Consequently, the
lines prefixed by ``%%NLS%%`` will become mere comments in the final
packing list if NLS is off; otherwise the prefix will be just left out.
Then insert ``%%NLS%%`` before each path to a message catalog file in
``pkg-plist``. For example:

.. code:: programlisting

    %%NLS%%share/locale/fr/LC_MESSAGES/foobar.mo
    %%NLS%%share/locale/no/LC_MESSAGES/foobar.mo

In high complexity cases, more advanced techniques may be needed, such
as `dynamic packing list generation <plist-dynamic.html>`__.

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

6.7.3.?Handling Message Catalog Directories
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

There is a point to note about installing message catalog files. The
target directories for them, which reside under
``LOCALBASE/share/locale``, must not be created and removed by a port.
The most popular languages have their respective directories listed in
``PORTSDIR/Templates/BSD.local.dist``. The directories for many other
languages are governed by the
`devel/gettext <http://www.freebsd.org/cgi/url.cgi?ports/devel/gettext/pkg-descr>`__
port. Consult its ``pkg-plist`` and see whether the port is going to
install a message catalog file for a unique language.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------+-------------------------+---------------------------------+
| `Prev <using-autotools.html>`__?   | `Up <special.html>`__   | ?\ `Next <using-perl.html>`__   |
+------------------------------------+-------------------------+---------------------------------+
| 6.6.?Using GNU Autotools?          | `Home <index.html>`__   | ?6.8.?Using Perl                |
+------------------------------------+-------------------------+---------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
