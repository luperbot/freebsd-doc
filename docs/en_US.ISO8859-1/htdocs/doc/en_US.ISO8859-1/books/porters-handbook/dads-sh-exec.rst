===============================================
12.6.?Use the exec Statement in Wrapper Scripts
===============================================

.. raw:: html

   <div class="navheader">

12.6.?Use the ``exec`` Statement in Wrapper Scripts
`Prev <dads-after-port-mk.html>`__?
Chapter?12.?Dos and Don'ts
?\ `Next <dads-rational.html>`__

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

12.6.?Use the ``exec`` Statement in Wrapper Scripts
---------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If the port installs a shell script whose purpose is to launch another
program, and if launching that program is the last action performed by
the script, make sure to launch the program using the ``exec``
statement, for instance:

.. code:: programlisting

    #!/bin/sh
    exec %%LOCALBASE%%/bin/java -jar %%DATADIR%%/foo.jar "$@"

The ``exec`` statement replaces the shell process with the specified
program. If ``exec`` is omitted, the shell process remains in memory
while the program is executing, and needlessly consumes system
resources.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------------------+------------------------------+------------------------------------+
| `Prev <dads-after-port-mk.html>`__?              | `Up <porting-dads.html>`__   | ?\ `Next <dads-rational.html>`__   |
+--------------------------------------------------+------------------------------+------------------------------------+
| 12.5.?Writing Something After ``bsd.port.mk``?   | `Home <index.html>`__        | ?12.7.?Do Things Rationally        |
+--------------------------------------------------+------------------------------+------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
