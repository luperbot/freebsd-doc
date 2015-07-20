========================================================
Uafh?ngig Verifikation af IPsec Funktionalitet i FreeBSD
========================================================

.. raw:: html

   <div class="article" lang="da" lang="da">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="author" xmlns="http://www.w3.org/1999/xhtml">

David Honig
~~~~~~~~~~~

.. raw:: html

   <div class="affiliation">

.. raw:: html

   <div class="address">

``<honig@sprynet.com>``

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div>

Revision: ` <https://svnweb.freebsd.org/changeset/doc/>`__

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="legalnotice" xmlns="http://www.w3.org/1999/xhtml">

FreeBSD is a registered trademark of the FreeBSD Foundation.

Motif, OSF/1, and UNIX are registered trademarks and IT DialTone and The
Open Group are trademarks of The Open Group in the United States and
other countries.

Many of the designations used by manufacturers and sellers to
distinguish their products are claimed as trademarks. Where those
designations appear in this document, and the FreeBSD Project was aware
of the trademark claim, the designations have been followed by the “™”
or the “?” symbol.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div>

3 Maj 1999 af .

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="abstract" xmlns="http://www.w3.org/1999/xhtml">

.. raw:: html

   <div class="abstract-title">

Resum?

.. raw:: html

   </div>

*Dansk version af Laust S. Jespersen ``<Laust@doc.freebsd.dk>``.*

Du installerede IPsec og det ser ud til at virke. Men hvordan ved du
det? Jeg beskriver en metode til eksperimentalt at verificere at IPsec
virker.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Indholdsfortegnelse

.. raw:: html

   </div>

`1. Problemet <#problem>`__
`2. L?sningen <#solution>`__
`3. Eksperimentet <#experiment>`__
`4. Undtagelse <#caveat>`__
`5. IPsec---Definition <#IPsec>`__
`6. Installering af IPsec <#ipsec-install>`__
`7. src/sys/i386/conf/KERNELNAME <#kernel>`__
`8. Maurers universelle statistiske test (for blok st?rrelse=8
bits) <#code>`__

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

1. Problemet
------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Lad os antage, at du har `installeret *IPsec* <#ipsec-install>`__.
Hvordan ved du at det `virker <#caveat>`__? Selvf?lgelig virker din
forbindelse ikke hvis den er miskonfigureret, og den vil virke n?r du
endelig laver det rigtigt.
`netstat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=netstat&sektion=1>`__
lister den. Men kan du verificere det uafh?ngigt?

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
algoritme. `Forneden angives kildekoden <#code>`__ til en variant der
m?ler successive (~kvart megabyte) store bidder af en fil.

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
interfacet til i din `kerne konfig fil <#kernel>`__.

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

#. Start nu med at `opfange pakker <#tcpdump>`__.

#. I det “sikre” vindue, k?res UNIX? kommandoen
   `yes(1) <http://www.FreeBSD.org/cgi/man.cgi?query=yes&sektion=1>`__,
   hvilket vil streame ``y`` karakteren. Stop dette efter et stykke tid.
   Skift til det usikre vindue, og gentag. Stop igen efter et stykke
   tid.

#. K?r nu `MUST <#code>`__ p? de opfangede pakker. Du skulle se noget
   lignende det f?lgende. Det vigtige at notere sig er, at den sikre
   forbindelse har 93% (6,7) af den ventede v?rdi (7.18), og den
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

   <div class="sect1">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4. Undtagelse
-------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dette eksperiment viser at, IPsec *kan* se ud til at distribuere payload
data *uniformt*, som kryptering skal. Men det eksperiment der er
beskrevet her *kan ikke* detektere mange mulige fejl i et system (ingen
af hvilke jeg har nogle beviser for). Disse inkluderer d?rlig n?gle
generering eller udveksling, data eller n?gler der kan ses af andre,
brug af svage algoritmer, kernel undergravning, osv. Stud?r kildekoden;
kend kildekoden.

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

5. IPsec---Definition
---------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Internet Protokol sikkerheds udvidelser til IPv4; kr?vet for IPv6. En
protokol til at forhandle kryptering og autentifikation p? IP
(v?rt-til-v?rt) niveau. SSL sikrer kun en applikationssocket; SSH sikrer
kun et login; PGP sikrer kun en specifik fil eller besked. IPsec
krypterer alting mellem to v?rter.

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

6. Installering af IPsec
------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

De fleste af de moderne versioner af FreeBSD har IPsec support i deres
base kildekode. S? du er sikkert n?dt til at inkludere ``IPSEC``
optionen i din kernel konfig og, efter genbygning og reinstallation af
kernel, konfigurere IPsec forbindelser ved hj?lp af
`setkey(8) <http://www.FreeBSD.org/cgi/man.cgi?query=setkey&sektion=8>`__
kommandoen.

En udf?rlig guide om at k?re IPsec p? FreeBSD er tilr?dighed i `FreeBSD
H?ndbogen <../../books/handbook/ipsec.html>`__.

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

   <div class="sect1">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

8. Maurers universelle statistiske test (for blok st?rrelse=8 bits)
-------------------------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Du kan finde samme kode p? `dette
link <http://www.geocities.com/SiliconValley/Code/4704/uliscanc.txt>`__.

.. code:: programlisting

    /*
      ULISCAN.c   ---blocksize of 8

      1 Oct 98
      1 Dec 98
      21 Dec 98       uliscan.c derived from ueli8.c

      This version has // comments removed for Sun cc

      This implements Ueli M Maurer's "Universal Statistical Test for Random
      Bit Generators" using L=8

      Accepts a filename on the command line; writes its results, with other
      info, to stdout.

      Handles input file exhaustion gracefully.

      Ref: J. Cryptology v 5 no 2, 1992 pp 89-105
      also on the web somewhere, which is where I found it.

      -David Honig
      honig@sprynet.com

      Usage:
      ULISCAN filename
      outputs to stdout
    */

    #define L 8
    #define V (1<<L)
    #define Q (10*V)
    #define K (100   *Q)
    #define MAXSAMP (Q + K)

    #include <stdio.h>
    #include <math.h>

    int main(argc, argv)
    int argc;
    char **argv;
    {
      FILE *fptr;
      int i,j;
      int b, c;
      int table[V];
      double sum = 0.0;
      int iproduct = 1;
      int run;

      extern double   log(/* double x */);

      printf("Uliscan 21 Dec 98 \nL=%d %d %d \n", L, V, MAXSAMP);

      if (argc < 2) {
        printf("Usage: Uliscan filename\n");
        exit(-1);
      } else {
        printf("Measuring file %s\n", argv[1]);
      }

      fptr = fopen(argv[1],"rb");

      if (fptr == NULL) {
        printf("Can't find %s\n", argv[1]);
        exit(-1);
      }

      for (i = 0; i < V; i++) {
        table[i] = 0;
      }

      for (i = 0; i < Q; i++) {
        b = fgetc(fptr);
        table[b] = i;
      }

      printf("Init done\n");

      printf("Expected value for L=8 is 7.1836656\n");

      run = 1;

      while (run) {
        sum = 0.0;
        iproduct = 1;

        if (run)
          for (i = Q; run && i < Q + K; i++) {
            j = i;
            b = fgetc(fptr);

            if (b < 0)
              run = 0;

            if (run) {
              if (table[b] > j)
                j += K;

              sum += log((double)(j-table[b]));

              table[b] = i;
            }
          }

        if (!run)
          printf("Premature end of file; read %d blocks.\n", i - Q);

        sum = (sum/((double)(i - Q))) /  log(2.0);
        printf("%4.4f ", sum);

        for (i = 0; i < (int)(sum*8.0 + 0.50); i++)
          printf("-");

        printf("\n");

        /* refill initial table */
        if (0) {
          for (i = 0; i < Q; i++) {
            b = fgetc(fptr);
            if (b < 0) {
              run = 0;
            } else {
              table[b] = i;
            }
          }
        }
      }
    }

.. raw:: html

   </div>

.. raw:: html

   </div>
