===================
Kapitel 10. Drucken
===================

.. raw:: html

   <div class="navheader">

Kapitel 10. Drucken
`Zur?ck <kernelconfig-trouble.html>`__?
Teil?II.?Oft benutzte Funktionen
?\ `Weiter <printing-intro-spooler.html>`__

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

Kapitel 10. Drucken
-------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Beigetragen von Sean Kelly.

.. raw:: html

   </div>

.. raw:: html

   <div>

Restrukturiert und aktualisiert durch Jim Mock.

.. raw:: html

   </div>

.. raw:: html

   <div>

?bersetzt von Stefan Bethke.

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

Inhaltsverzeichnis

.. raw:: html

   </div>

`10.1. ?bersicht <printing.html#printing-synopsis>`__
`10.2. Einf?hrung <printing-intro-spooler.html>`__
`10.3. Grund-Konfiguration <printing-intro-setup.html>`__
`10.4. Erweiterte Drucker-Konfiguration <printing-advanced.html>`__
`10.5. Drucker verwenden <printing-using.html>`__
`10.6. Alternativen zum
LPD-Drucksystem <printing-lpd-alternatives.html>`__
`10.7. Problembehandlung <printing-troubleshooting.html>`__

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

10.1. ?bersicht
---------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Mit FreeBSD k?nnen Sie viele unterschiedliche Drucker benutzen, von den
?ltesten Nadeldruckern bis zu den neuesten Laserdruckern, und allen
m?glichen Ger?ten dazwischen. Auf diese Weise k?nnen Sie hochwertige
Ausdrucke mit Ihren Programmen erzeugen.

Sie k?nnen FreeBSD auch so konfigurieren, dass es Druckauftr?ge von
anderen Computern ?ber Ihr lokales Netzwerk entgegennimmt, seien es
Windows?-, Mac?OS?- oder andere FreeBSD-Computer. FreeBSD stellt sicher,
dass die Druckauftr?ge in der richtigen Reihenfolge bearbeitet werden
und kann optional ein Deckblatt mit dem Namen des Auftraggebers eines
Druckauftrags aufgeben. FreeBSD kann auch Statistiken ?ber die Computer
und Benutzer f?hren, die Ausdrucke in Auftrag geben.

In diesem Kapitel erfahren Sie, wie Sie:

.. raw:: html

   <div class="itemizedlist">

-  FreeBSD-Druckerwarteschlangen einrichten.

-  Druckfilter installieren, die Druckauftr?ge je nach Bedarf besonders
   behandeln und z.B. Dokumente automatisch in eine Form umwandeln, die
   Ihr Drucker versteht.

-  Druckauftr?ge mit einem Deckblatt versehen k?nnen.

-  Mit einem Drucker drucken k?nnen, der an einen anderen Computer
   angeschlossen ist.

-  Mit einem Drucker drucken k?nnen, der direkt an das Netzwerk
   angeschlossen ist.

-  die Gr??e von Druckauftr?gen beschr?nken k?nnen, oder bestimmte
   Benutzer von den Benutzung des Drucksystems ausschlie?en k?nnen.

-  Statistiken aufzeichnen und die Benutzung des Drucksystems nach
   Benutzern und Computern aufschl?sseln k?nnen.

-  Probleme beim Drucken diagnostizieren und beheben k?nnen.

.. raw:: html

   </div>

Bevor Sie dieses Kapitel lesen:

.. raw:: html

   <div class="itemizedlist">

-  Machen Sie sich mit der Konfiguration und Installation eines neuen
   Kernels vertraut (`Kapitel?9, *Konfiguration des
   FreeBSD-Kernels* <kernelconfig.html>`__).

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------------+-------------------------------------+-----------------------------------------------+
| `Zur?ck <kernelconfig-trouble.html>`__?   | `Nach oben <common-tasks.html>`__   | ?\ `Weiter <printing-intro-spooler.html>`__   |
+-------------------------------------------+-------------------------------------+-----------------------------------------------+
| 9.7. Wenn etwas schiefgeht?               | `Zum Anfang <index.html>`__         | ?10.2. Einf?hrung                             |
+-------------------------------------------+-------------------------------------+-----------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
