==================================================
13.4. Kernel Interaktion w?hrend des Bootprozesses
==================================================

.. raw:: html

   <div class="navheader">

13.4. Kernel Interaktion w?hrend des Bootprozesses
`Zur?ck <boot-blocks.html>`__?
Kapitel 13. FreeBSDs Bootvorgang
?\ `Weiter <device-hints.html>`__

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

13.4. Kernel Interaktion w?hrend des Bootprozesses
--------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn der Kernel einmal geladen ist, entweder durch den
`Loader <boot-blocks.html#boot-loader>`__ (die Standardmethode) oder
durch `boot2 <boot-blocks.html#boot-boot1>`__ (den Loader umgehend),
verh?lt sich gem?? seiner Boot-Flags, falls es welche gibt.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

13.4.1. Kernel Boot-Flags
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Es folgt eine Auflistung der gebr?uchlichsten Boot-Flags:

.. raw:: html

   <div class="variablelist">

``-a``
    Bewirkt, dass der Benutzer w?hrend der Kernel-Initialisierung
    gefragt wird, welches Ger?t als Root-Dateisystem gemounted werden
    soll.

``-C``
    Es wird von CD-ROM gebootet.

``-c``
    UserConfig, das Boot-Zeit Konfigurationsprogramm, wird gestartet.

``-s``
    Bewirkt den Start des Single-User Modus.

``-v``
    Zeigt mehr Informationen w?hrend des Starten des Kernels an.

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Andere Boot-Flags sind in der Hilfeseite
`boot(8) <http://www.FreeBSD.org/cgi/man.cgi?query=boot&sektion=8>`__
erl?utert.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------+-------------------------------+-------------------------------------+
| `Zur?ck <boot-blocks.html>`__?        | `Nach oben <boot.html>`__     | ?\ `Weiter <device-hints.html>`__   |
+---------------------------------------+-------------------------------+-------------------------------------+
| 13.3. Boot-Manager und Boot-Phasen?   | `Zum Anfang <index.html>`__   | ?13.5. Konfiguration von Ger?ten    |
+---------------------------------------+-------------------------------+-------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
