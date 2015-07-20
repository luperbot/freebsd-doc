============
2. L?sningen
============

.. raw:: html

   <div class="navheader">

2. L?sningen
`forrige <index.html>`__?
?
?\ `n?ste <experiment.html>`__

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

2. L?sningen
------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

F?rst, noget krypto-relevant teoretisk information:

.. raw:: html

   <div class="orderedlist">

#. krypterede data er uniformt distribueret, som f.eks. har maksimal
   entropi pr. symbol;

#. r?, ukomprimerede data er typisk redundant, f.eks., har sub-maksimal
   entropi.

.. raw:: html

   </div>

Hvis du kunne m?le entropien af dataene til og fra dit netv?rks
interface. S? kunne du se forskellen mellem ukrypterede og krypterede
data. Det ville v?re tilf?ldet selvom nogle af dataene i “krypteret
mode” ikke var krypterede, som f.eks. den yderste IP header skal v?re,
hvis pakken skal kunne routes.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.1. MUST
~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Ueli Maurers “Universal Statistical Test for Random Bit Generators”
(`MUST <http://www.geocities.com/SiliconValley/Code/4704/universal.pdf>`__)
m?ler hurtigt entropien af en stikpr?ve. Den bruger en kompressionsagtig
algoritme. `Forneden angives kildekoden <code.html>`__ til en variant
der m?ler successive (~kvart megabyte) store bidder af en fil.

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

2.2. Tcpdump
~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Vi har ogs? brug for en m?de at opsamle de r? netv?rksdata. Et program
kaldet
`tcpdump(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tcpdump&sektion=1>`__
lader dig g?re dette, hvis du har sl?et *Berkeley Packet Filter*
interfacet til i din `kerne konfig fil <kernel.html>`__.

Kommandoen

.. code:: screen

    tcpdump -c 4000 -s 10000 -w dumpfile.bin

vil opfange 4000 r? pakker til *``dumpfile.bin``*. Op til 10.000 bytes
per pakke bliver opfanget i dette eksempel.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------------------------------+-------------------------+----------------------------------+
| `forrige <index.html>`__?                                   | ?                       | ?\ `n?ste <experiment.html>`__   |
+-------------------------------------------------------------+-------------------------+----------------------------------+
| Uafh?ngig Verifikation af IPsec Funktionalitet i FreeBSD?   | `hjem <index.html>`__   | ?3. Eksperimentet                |
+-------------------------------------------------------------+-------------------------+----------------------------------+

.. raw:: html

   </div>

Dette og andre dokumenter kan downloades fra
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| For sp?rgsm?l om FreeBSD, l?s
  `documentationen <http://www.FreeBSD.org/docs.html>`__ f?r du
  kontakter <questions@FreeBSD.org\ >.
|  For sp?rgsm?l ang?ende denne dokumentation, e-mail
  <doc@FreeBSD.org\ >.
