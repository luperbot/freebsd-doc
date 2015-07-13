=================
Chapter?8.?pkg-\*
=================

.. raw:: html

   <div class="navheader">

Chapter?8.?\ ``pkg-*``
`Prev <plist-keywords.html>`__?
?
?\ `Next <pkg-install.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="chapter">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Table of Contents

.. raw:: html

   </div>

`8.1. ``pkg-message`` <pkg-files.html#porting-message>`__
`8.2. ``pkg-install`` <pkg-install.html>`__
`8.3. ``pkg-deinstall`` <pkg-deinstall.html>`__
`8.4. Changing the Names of ``pkg-*`` <pkg-names.html>`__
`8.5. Making Use of ``SUB_FILES`` and
``SUB_LIST`` <using-sub-files.html>`__

.. raw:: html

   </div>

There are some tricks we have not mentioned yet about the ``pkg-*``
files that come in handy sometimes.

.. raw:: html

   <div class="sect1">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

8.1.?\ ``pkg-message``
----------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

To display a message when the package is installed, place the message in
``pkg-message``. This capability is often useful to display additional
installation steps to be taken after a ``pkg install`` or to display
licensing information.

When some lines about the build-time knobs or warnings have to be
displayed, use ``ECHO_MSG``. ``pkg-message`` is only for
post-installation steps. Likewise, the distinction between ``ECHO_MSG``
is for printing informational text to the screen and ``ECHO_CMD`` is for
command pipelining:

.. code:: programlisting

    update-etc-shells:
        @${ECHO_MSG} "updating /etc/shells"
        @${CP} /etc/shells /etc/shells.bak
        @( ${GREP} -v ${PREFIX}/bin/bash /etc/shells.bak; \
            ${ECHO_CMD} ${PREFIX}/bin/bash) >/etc/shells
        @${RM} /etc/shells.bak

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Do not add an entry for ``pkg-message`` in ``pkg-plist``.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------------+-------------------------+----------------------------------+
| `Prev <plist-keywords.html>`__?              | ?                       | ?\ `Next <pkg-install.html>`__   |
+----------------------------------------------+-------------------------+----------------------------------+
| 7.6.?Expanding Package List with Keywords?   | `Home <index.html>`__   | ?8.2.?\ ``pkg-install``          |
+----------------------------------------------+-------------------------+----------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
