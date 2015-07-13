=================
3.?The Experiment
=================

.. raw:: html

   <div class="navheader">

3.?The Experiment
`Prev <solution.html>`__?
?
?\ `Next <caveat.html>`__

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

3.?The Experiment
-----------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Here is the experiment:

.. raw:: html

   <div class="procedure">

#. Open a window to an IPsec host and another window to an insecure
   host.

#. Now start `capturing packets <solution.html#tcpdump>`__.

#. In the “secure” window, run the UNIX? command
   `yes(1) <http://www.FreeBSD.org/cgi/man.cgi?query=yes&sektion=1>`__,
   which will stream the ``y`` character. After a while, stop this.
   Switch to the insecure window, and repeat. After a while, stop.

#. Now run `MUST <code.html>`__ on the captured packets. You should see
   something like the following. The important thing to note is that the
   secure connection has 93% (6.7) of the expected value (7.18), and the
   “normal” connection has 29% (2.1) of the expected value.

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

+-----------------------------+-------------------------+-----------------------------+
| `Prev <solution.html>`__?   | ?                       | ?\ `Next <caveat.html>`__   |
+-----------------------------+-------------------------+-----------------------------+
| 2.?The Solution?            | `Home <index.html>`__   | ?4.?Caveat                  |
+-----------------------------+-------------------------+-----------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
