================
3. Eksperimentet
================

.. raw:: html

   <div class="navheader">

3. Eksperimentet
`forrige <solution.html>`__?
?
?\ `n?ste <caveat.html>`__

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

3. Eksperimentet
----------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Her er eksperimentet:

.. raw:: html

   <div class="procedure">

#. ?bn et vindue til en IPsec v?rt og et andet vindue til en usikker
   v?rt.

#. Start nu med at `opfange pakker <solution.html#tcpdump>`__.

#. I det “sikre” vindue, k?res UNIX? kommandoen
   `yes(1) <http://www.FreeBSD.org/cgi/man.cgi?query=yes&sektion=1>`__,
   hvilket vil streame ``y`` karakteren. Stop dette efter et stykke tid.
   Skift til det usikre vindue, og gentag. Stop igen efter et stykke
   tid.

#. K?r nu `MUST <code.html>`__ p? de opfangede pakker. Du skulle se
   noget lignende det f?lgende. Det vigtige at notere sig er, at den
   sikre forbindelse har 93% (6,7) af den ventede v?rdi (7.18), og den
   “normale” forbindelse har 29% (2.1) af den ventede v?rdi.

   .. code:: screen

       % tcpdump -c 4000 -s 10000 -w ipsecdemo.bin
       % uliscan ipsecdemo.bin

       Uliscan 21 Dec 98
       L=8 256 258560
       Measuring file ipsecdemo.bin
       Init done
       Expected value for L=8 is 7.1836656
       6.9396 --------------------------------------------------------
       6.6177 -----------------------------------------------------
       6.4100 ---------------------------------------------------
       2.1101 -----------------
       2.0838 -----------------
       2.0983 -----------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------+-------------------------+------------------------------+
| `forrige <solution.html>`__?   | ?                       | ?\ `n?ste <caveat.html>`__   |
+--------------------------------+-------------------------+------------------------------+
| 2. L?sningen?                  | `hjem <index.html>`__   | ?4. Undtagelse               |
+--------------------------------+-------------------------+------------------------------+

.. raw:: html

   </div>

Dette og andre dokumenter kan downloades fra
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| For sp?rgsm?l om FreeBSD, l?s
  `documentationen <http://www.FreeBSD.org/docs.html>`__ f?r du
  kontakter <questions@FreeBSD.org\ >.
|  For sp?rgsm?l ang?ende denne dokumentation, e-mail
  <doc@FreeBSD.org\ >.
