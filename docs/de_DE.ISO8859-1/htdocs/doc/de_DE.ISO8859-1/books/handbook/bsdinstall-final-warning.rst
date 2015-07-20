===================================
3.8. Die Installation festschreiben
===================================

.. raw:: html

   <div class="navheader">

3.8. Die Installation festschreiben
`Zur?ck <bsdinstall-partitioning.html>`__?
Kapitel 3. FreeBSD?9.\ *``x``* (und neuer) installieren
?\ `Weiter <bsdinstall-post.html>`__

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

3.8. Die Installation festschreiben
-----------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dies ist die letzte Chance, die Installation abzubrechen, ohne
?nderungen an den Festplatten vorzunehmen.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 3.17. Letzte Best?tigung

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Letzte Best?tigung|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

W?hlen Sie [?Commit?] und dr?cken Sie **Enter**, um fortzufahren. Fall
noch ?nderungen zu machen sind, w?hlen Sie [?Back?], um zum
Partitionseditor zur?ck zu gelangen. Mittels [?Revert?&?Exit?] wird das
Installationsprogramm beendet, ohne ?nderungen an den Festplatten
durchzuf?hren.

Die Installationsdauer h?ngt von den gew?hlten Distributionen, dem
Installationsmedium und der Geschwindigkeit des Computers ab. Eine Reihe
von Nachrichten werden angezeigt, um den Fortschritt darzustellen.

Zuerst wird das Installationsprogramm die Partitionen auf die Platte
schreiben und den Befehl ``newfs`` ausf?hren, um die Partitionen zu
initialisieren.

Falls Sie eine Netzwerkinstallation vornehmen, wird bsdinstall dann mit
dem herunterladen der ben?tigten Distributionsdateien fortfahren.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 3.18. Herunterladen der Distributionsdateien

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Herunterladen der Distributionsdateien|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Als n?chstes wird die Integrit?t der Distributionsdateien ?berpr?ft, um
sicherzustellen, dass diese w?hrend des Ladevorgangs nicht besch?digt
oder unsauber vom Installationsmedium gelesen wurden.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 3.19. ?berpr?fen der Distributionsdateien

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|?berpr?fen der Distributionsdateien|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Zum Schluss werden die ?berpr?ften Distributionsdateien auf die
Festplatte entpackt.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 3.20. Entpacken der Distributionsdateien

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Entpacken der Distributionsdateien|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Sobald alle ben?tigten Distributionsdateien entpackt wurden, wird
bsdinstall direkt mit den Arbeiten nach der Installation fortsetzen
(siehe `Abschnitt?3.9, „Arbeiten nach der
Installation“ <bsdinstall-post.html>`__).

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------------+-----------------------------------+----------------------------------------+
| `Zur?ck <bsdinstall-partitioning.html>`__?   | `Nach oben <bsdinstall.html>`__   | ?\ `Weiter <bsdinstall-post.html>`__   |
+----------------------------------------------+-----------------------------------+----------------------------------------+
| 3.7. Plattenplatz bereitstellen?             | `Zum Anfang <index.html>`__       | ?3.9. Arbeiten nach der Installation   |
+----------------------------------------------+-----------------------------------+----------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.

.. |Letzte Best?tigung| image:: bsdinstall/bsdinstall-final-confirmation.png
.. |Herunterladen der Distributionsdateien| image:: bsdinstall/bsdinstall-distfile-fetching.png
.. |?berpr?fen der Distributionsdateien| image:: bsdinstall/bsdinstall-distfile-verifying.png
.. |Entpacken der Distributionsdateien| image:: bsdinstall/bsdinstall-distfile-extracting.png
