==========================
17.14. Das MAC Modul LOMAC
==========================

.. raw:: html

   <div class="navheader">

17.14. Das MAC Modul LOMAC
`Zur?ck <mac-biba.html>`__?
Kapitel 17. Verbindliche Zugriffskontrolle
?\ `Weiter <mac-implementing.html>`__

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

17.14. Das MAC Modul LOMAC
--------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Modulname: ``mac_lomac.ko``

Parameter f?r die Kernelkonfiguration: ``options MAC_LOMAC``

Bootparameter: ``mac_lomac_load="YES"``

Anders als die Biba Richtlinie erlaubt die
`mac\_lomac(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_lomac&sektion=4>`__
Richtlinie den Zugriff auf Objekte niedrigerer Integrit?t nur, nachdem
das Integrit?tslevel gesenkt wurde. Dadurch wird eine St?rung
derIntegrit?tsregeln verhindert.

Die MAC Version der „Low-Watermark“ Richtlinie, die nicht mit der
?lteren
`lomac(4) <http://www.FreeBSD.org/cgi/man.cgi?query=lomac&sektion=4>`__-Implementierung
verwechselt werden darf, arbeitet fast genauso wie Biba. Anders ist,
dass hier „schwebende“ Label verwendet werden, die ein Herunterstufen
von Subjekten durch Hilfsverb?nde erm?glichen. Dieser zweite Verbund
wird in der Form ``[auxgrade]`` angegeben und sollte in etwa aussehen
wie ``lomac/10[2]``, wobei die Ziffer zwei (2) hier den Hilfsverbund
abbildet.

Die MAC Richtlinie `` LOMAC`` beruht auf einer durchg?ngigen
Etikettierung aller Systemobjekte mit Integrit?tslabeln, die Subjekten
das Lesen von Objekten niedriger Integrit?t gestatten und dann das Label
des Subjektes herunterstufen - um zuk?nftige Schreibvorg?nge auf Objekte
hoher Integrit?t zu unterbinden. Dies ist die Funktion der Option
``[auxgrade]``, die eben vorgestellt wurde. Durch sie erh?lt diese
Richtlinie eine bessere Kompatibilit?t und die Initialisierung ist
weniger aufw?ndig als bei der Richtlinie Biba.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

17.14.1. Beispiele
~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wie schon bei den Richtlinien Biba und MLS werden die Befehle
``setfmac`` und ``setpmac`` verwendet, um die Labels an den
Systemobjekten zu setzen:

.. code:: screen

    # setfmac /usr/home/trhodes lomac/high[low]
    # getfmac /usr/home/trhodes lomac/high[low]

Beachten Sie, dass hier der Hilfswert auf ``low`` gesetzt wurde - dieses
Leistungsmerkmal ist nur in der MAC ``LOMAC`` Richtlinie enthalten.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------+-------------------------------+------------------------------------------------+
| `Zur?ck <mac-biba.html>`__?   | `Nach oben <mac.html>`__      | ?\ `Weiter <mac-implementing.html>`__          |
+-------------------------------+-------------------------------+------------------------------------------------+
| 17.13. Das MAC Modul Biba?    | `Zum Anfang <index.html>`__   | ?17.15. Beispiel 1: Nagios in einer MAC Jail   |
+-------------------------------+-------------------------------+------------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
