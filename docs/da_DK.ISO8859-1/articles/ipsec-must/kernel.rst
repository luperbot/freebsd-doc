===============================
7. src/sys/i386/conf/KERNELNAME
===============================

.. raw:: html

   <div class="navheader">

7. src/sys/i386/conf/KERNELNAME
`forrige <ipsec-install.html>`__?
?
?\ `n?ste <code.html>`__

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

7. src/sys/i386/conf/KERNELNAME
-------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dette skal v?re til stede i kernel konfig filen for at v?re i stand til
at opfange netv?rksdata med
`tcpdump(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tcpdump&sektion=1>`__.
V?r sikker p? at k?re
`config(8) <http://www.FreeBSD.org/cgi/man.cgi?query=config&sektion=8>`__
efter at tilf?je dette, og genbygge og reinstallere.

.. code:: programlisting

    device   bpf

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------+-------------------------+------------------------------------------------------------------------+
| `forrige <ipsec-install.html>`__?   | ?                       | ?\ `n?ste <code.html>`__                                               |
+-------------------------------------+-------------------------+------------------------------------------------------------------------+
| 6. Installering af IPsec?           | `hjem <index.html>`__   | ?8. Maurers universelle statistiske test (for blok st?rrelse=8 bits)   |
+-------------------------------------+-------------------------+------------------------------------------------------------------------+

.. raw:: html

   </div>

Dette og andre dokumenter kan downloades fra
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| For sp?rgsm?l om FreeBSD, l?s
  `documentationen <http://www.FreeBSD.org/docs.html>`__ f?r du
  kontakter <questions@FreeBSD.org\ >.
|  For sp?rgsm?l ang?ende denne dokumentation, e-mail
  <doc@FreeBSD.org\ >.
