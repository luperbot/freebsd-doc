====================
Chapter?10.?Printing
====================

.. raw:: html

   <div class="navheader">

Chapter?10.?Printing
`Prev <kernelconfig-trouble.html>`__?
Part?II.?Common Tasks
?\ `Next <printing-connections.html>`__

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

Chapter?10.?Printing
--------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Originally contributed by Warren Block.

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

`10.1. Quick Start <printing.html#printing-quick-start>`__
`10.2. Printer Connections <printing-connections.html>`__
`10.3. Common Page Description Languages <printing-pdls.html>`__
`10.4. Direct Printing <printing-direct.html>`__
`10.5. LPD (Line Printer Daemon) <printing-lpd.html>`__
`10.6. Other Printing Systems <printing-other.html>`__

.. raw:: html

   </div>

Putting information on paper is a vital function, despite many attempts
to eliminate it. Printing has two basic components. The data must be
delivered to the printer, and must be in a form that the printer can
understand.

.. raw:: html

   <div class="sect1">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

10.1.?Quick Start
-----------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Basic printing can be set up quickly. The printer must be capable of
printing plain ASCII text. For printing to other types of files, see
`Section?10.5.3, “Filters” <printing-lpd.html#printing-lpd-filters>`__.

.. raw:: html

   <div class="procedure">

#. Create a directory to store files while they are being printed:

   .. code:: screen

       # mkdir -p /var/spool/lpd/lp
       # chown daemon:daemon /var/spool/lpd/lp
       # chmod 770 /var/spool/lpd/lp

#. As ``root``, create ``/etc/printcap`` with these contents:

   .. code:: programlisting

       lp:\
           :lp=/dev/unlpt0:\  
           :sh:\
           :mx#0:\
           :sd=/var/spool/lpd/lp:\
           :lf=/var/log/lpd-errs:

   .. raw:: html

      <div class="calloutlist">

   +--------------------------------------+--------------------------------------+
   | `|1| <#printing-qs-co-printcap>`__   | This line is for a printer connected |
   |                                      | to a USB port.                       |
   |                                      |                                      |
   |                                      | For a printer connected to a         |
   |                                      | parallel or “printer” port, use:     |
   |                                      |                                      |
   |                                      | .. code:: programlisting             |
   |                                      |                                      |
   |                                      |     :lp=/dev/lpt0:\                  |
   |                                      |                                      |
   |                                      | For a printer connected directly to  |
   |                                      | a network, use:                      |
   |                                      |                                      |
   |                                      | .. code:: programlisting             |
   |                                      |                                      |
   |                                      |     :lp=:rm=network-printer-name:rp= |
   |                                      | raw:\                                |
   |                                      |                                      |
   |                                      | Replace *``network-printer-name``*   |
   |                                      | with the DNS host name of the        |
   |                                      | network printer.                     |
   +--------------------------------------+--------------------------------------+

   .. raw:: html

      </div>

#. Enable ``lpd`` by editing ``/etc/rc.conf``, adding this line:

   .. code:: programlisting

       lpd_enable="YES"

   Start the service:

   .. code:: screen

       # service lpd start
       Starting lpd.

#. Print a test:

   .. code:: screen

       # printf "1. This printer can print.\n2. This is the second line.\n" | lpr

   .. raw:: html

      <div class="tip" xmlns="">

   Tip:
   ~~~~

   If both lines do not start at the left border, but “stairstep”
   instead, see `Section?10.5.3.1, “Preventing Stairstepping on Plain
   Text Printers” <printing-lpd.html#printing-lpd-filters-stairstep>`__.

   .. raw:: html

      </div>

   Text files can now be printed with ``lpr``. Give the filename on the
   command line, or pipe output directly into ``lpr``.

   .. code:: screen

       % lpr textfile.txt
       % ls -lh | lpr

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------+------------------------------+-------------------------------------------+
| `Prev <kernelconfig-trouble.html>`__?   | `Up <common-tasks.html>`__   | ?\ `Next <printing-connections.html>`__   |
+-----------------------------------------+------------------------------+-------------------------------------------+
| 9.6.?If Something Goes Wrong?           | `Home <index.html>`__        | ?10.2.?Printer Connections                |
+-----------------------------------------+------------------------------+-------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.

.. |1| image:: ./imagelib/callouts/1.png
