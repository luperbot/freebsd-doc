======================================
10.6. Alternativen zum LPD-Drucksystem
======================================

.. raw:: html

   <div class="navheader">

10.6. Alternativen zum LPD-Drucksystem
`Zur?ck <printing-using.html>`__?
Kapitel 10. Drucken
?\ `Weiter <printing-troubleshooting.html>`__

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

10.6. Alternativen zum LPD-Drucksystem
--------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn Sie dieses Kapitel bis hierher gelesen haben, wissen Sie so gut wie
alles ?ber LPD, das Standarddrucksystem von FreeBSD. Wahrscheinlich sind
Ihnen bereits einige Unzul?nglichkeiten dieses Systems aufgefallen, und
Sie fragen sich nun, welche anderen Drucksysteme es f?r FreeBSD gibt.

.. raw:: html

   <div class="variablelist">

LPRng
    LPRng steht f?r „LPR: the Next Generation“. Dabei handelt es sich um
    eine von Grund auf neu geschriebene Version von PLP. LPRng wurde von
    Patrick Powell und Justin Mason, dem Hauptmaintainer von PLP,
    entwickelt. Die offizielle Webseite von LPRng ist unter
    ``http://www.lprng.org/`` zu finden.

CUPS
    CUPS, das *Common UNIX Printing System*, stellt eine portable
    Abstraktionsschicht dar, die das Drucken auf allen UNIX?-artigen
    Betriebsystemen erm?glicht. CUPS wurde von Easy Software entwickelt,
    um UNIX?-Herstellern und -Benutzern eine einheitliche Standardl?sung
    f?r den Druck von Dokumenten zu bieten.

    CUPS verwendet das Internet Printing Protocol (IPP), um
    Druckauftr?ge und -warteschlangen zu verwalten. Zus?tzlich werden
    die Protokolle *Line Printer Daemon* (LPD), *Server Message Block*
    (SMB), und *AppSocket/JetDirect*), unterst?tzt, wenn auch nur mit
    eingeschr?nkter Funktionalit?t. Ausserdem erm?glicht CUPS das
    Auffinden von Netzwerkdruckern sowie die Verwendung auf *PostScript
    Printer Description* (PPD) basierender Druckoptionen.

    Die offizielle Webseite von CUPS ist ``http://www.cups.org/``.

HPLIP
    HPLIP, das HP Linux? Imaging and Printing System, ist eine von HP
    entwickelte Sammlung von Programmen, die Unterst?tzung f?r das
    drucken, scannen und faxen bei HP-Ger?ten bieten. Diese
    Programm-Sammlung verwendet CUPS als Grundlage f?r einige seiner
    Druck-Eigenschaften.

    Die Hauptseite f?r HPLIP ist
    ``http://hplipopensource.com/hplip-web/index.html``.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------+---------------------------------+-------------------------------------------------+
| `Zur?ck <printing-using.html>`__?   | `Nach oben <printing.html>`__   | ?\ `Weiter <printing-troubleshooting.html>`__   |
+-------------------------------------+---------------------------------+-------------------------------------------------+
| 10.5. Drucker verwenden?            | `Zum Anfang <index.html>`__     | ?10.7. Problembehandlung                        |
+-------------------------------------+---------------------------------+-------------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
