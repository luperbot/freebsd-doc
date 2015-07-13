===============
2.?The Solution
===============

.. raw:: html

   <div class="navheader">

2.?The Solution
`Prev <index.html>`__?
?
?\ `Next <experiment.html>`__

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

2.?The Solution
---------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

First, some crypto-relevant info theory:

.. raw:: html

   <div class="orderedlist">

#. Encrypted data is uniformly distributed, i.e., has maximal entropy
   per symbol;

#. Raw, uncompressed data is typically redundant, i.e., has sub-maximal
   entropy.

.. raw:: html

   </div>

Suppose you could measure the entropy of the data to- and from- your
network interface. Then you could see the difference between unencrypted
data and encrypted data. This would be true even if some of the data in
“encrypted mode” was not encrypted---as the outermost IP header must be
if the packet is to be routable.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.1.?MUST
~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Ueli Maurer's “Universal Statistical Test for Random Bit
Generators”(`MUST <http://www.geocities.com/SiliconValley/Code/4704/universal.pdf>`__)
quickly measures the entropy of a sample. It uses a compression-like
algorithm. `The code is given below <code.html>`__ for a variant which
measures successive (~quarter megabyte) chunks of a file.

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

2.2.?Tcpdump
~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

We also need a way to capture the raw network data. A program called
`tcpdump(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tcpdump&sektion=1>`__
lets you do this, if you have enabled the *Berkeley Packet Filter*
interface in your `kernel's config file <kernel.html>`__.

The command:

.. code:: screen

    tcpdump -c 4000 -s 10000 -w dumpfile.bin

will capture 4000 raw packets to *``dumpfile.bin``*. Up to 10,000 bytes
per packet will be captured in this example.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------------------------------+-------------------------+---------------------------------+
| `Prev <index.html>`__?                                        | ?                       | ?\ `Next <experiment.html>`__   |
+---------------------------------------------------------------+-------------------------+---------------------------------+
| Independent Verification of IPsec Functionality in FreeBSD?   | `Home <index.html>`__   | ?3.?The Experiment              |
+---------------------------------------------------------------+-------------------------+---------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
