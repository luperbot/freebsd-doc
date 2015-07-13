=====================
10.4.?Direct Printing
=====================

.. raw:: html

   <div class="navheader">

10.4.?Direct Printing
`Prev <printing-pdls.html>`__?
Chapter?10.?Printing
?\ `Next <printing-lpd.html>`__

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

10.4.?Direct Printing
---------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

For occasional printing, files can be sent directly to a printer device
without any setup. For example, a file called ``sample.txt`` can be sent
to a USB printer:

.. code:: screen

    # cp sample.txt /dev/unlpt0

Direct printing to network printers depends on the abilities of the
printer, but most accept print jobs on port 9100, and
`nc(1) <http://www.FreeBSD.org/cgi/man.cgi?query=nc&sektion=1>`__ can be
used with them. To print the same file to a printer with the DNS
hostname of *``netlaser``*:

.. code:: screen

    # nc netlaser 9100 < sample.txt

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------------+--------------------------+------------------------------------+
| `Prev <printing-pdls.html>`__?             | `Up <printing.html>`__   | ?\ `Next <printing-lpd.html>`__    |
+--------------------------------------------+--------------------------+------------------------------------+
| 10.3.?Common Page Description Languages?   | `Home <index.html>`__    | ?10.5.?LPD (Line Printer Daemon)   |
+--------------------------------------------+--------------------------+------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
