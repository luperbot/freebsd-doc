=================================
Chapter?26.?Serial Communications
=================================

.. raw:: html

   <div class="navheader">

Chapter?26.?Serial Communications
`Prev <network-communication.html>`__?
Part?IV.?Network Communication
?\ `Next <serial.html>`__

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

Chapter?26.?Serial Communications
---------------------------------

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

`26.1. Synopsis <serialcomms.html#serial-synopsis>`__
`26.2. Serial Terminology and Hardware <serial.html>`__
`26.3. Terminals <term.html>`__
`26.4. Dial-in Service <dialup.html>`__
`26.5. Dial-out Service <dialout.html>`__
`26.6. Setting Up the Serial Console <serialconsole-setup.html>`__

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

26.1.?Synopsis
--------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

UNIX? has always had support for serial communications as the very first
UNIX? machines relied on serial lines for user input and output. Things
have changed a lot from the days when the average terminal consisted of
a 10-character-per-second serial printer and a keyboard. This chapter
covers some of the ways serial communications can be used on FreeBSD.

After reading this chapter, you will know:

.. raw:: html

   <div class="itemizedlist">

-  How to connect terminals to a FreeBSD system.

-  How to use a modem to dial out to remote hosts.

-  How to allow remote users to login to a FreeBSD system with a modem.

-  How to boot a FreeBSD system from a serial console.

.. raw:: html

   </div>

Before reading this chapter, you should:

.. raw:: html

   <div class="itemizedlist">

-  Know how to `configure and install a custom
   kernel <kernelconfig.html>`__.

-  Understand `FreeBSD permissions and processes <basics.html>`__.

-  Have access to the technical manual for the serial hardware to be
   used with FreeBSD.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------+---------------------------------------+------------------------------------------+
| `Prev <network-communication.html>`__?   | `Up <network-communication.html>`__   | ?\ `Next <serial.html>`__                |
+------------------------------------------+---------------------------------------+------------------------------------------+
| Part?IV.?Network Communication?          | `Home <index.html>`__                 | ?26.2.?Serial Terminology and Hardware   |
+------------------------------------------+---------------------------------------+------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
