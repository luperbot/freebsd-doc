=====================
23.4. Datenintegrit?t
=====================

.. raw:: html

   <div class="navheader">

23.4. Datenintegrit?t
`Zur?ck <vinum-access-bottlenecks.html>`__?
Kapitel 23. Der Vinum Volume Manager
?\ `Weiter <vinum-objects.html>`__

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

23.4. Datenintegrit?t
---------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das dritte Problem, welches aktuelle Platten haben, ist ihre
Unzuverl?ssigkeit. Obwohl sich die Zuverl?ssigkeit von Festplatten in
den letzten Jahren stark verbessert hat, handelt es sich bei ihnen nach
wie vor um die Komponente eines Servers, die am ehesten ausf?llt. F?llt
eine Festplatte aus, k?nnen die Folgen katastrophal sein: Es kann Tage
dauern, bis eine Platte ersetzt und alle Daten wiederhergestellt sind.

Die traditionelle Art, dieses Problem anzugehen, war es, Daten zu
*spiegeln*, also zwei Kopien der Daten auf getrennten Platten zu
verwahren. Diese Technik wird auch als RAID Level 1 oder RAID-1
bezeichnet. Jeder Schreibzugriff findet auf beiden Datentr?gern statt.
Ein Lesezugriff kann daher von beiden Laufwerken erfolgen, sodass beim
Ausfall eines Laufwerks die Daten immer noch auf dem anderen Laufwerk
verf?gbar sind.

Spiegeln verursacht allerdings zwei Probleme:

.. raw:: html

   <div class="itemizedlist">

-  Es verursacht h?here Kosten, da doppelt so viel Plattenspeicher wie
   bei einer nicht-redundanten L?sung ben?tigt wird.

-  Die Gesamtleistung des Systems sinkt, da Schreibzugriffe auf beiden
   Laufwerken ausgef?hrt werden m?ssen, daher wird im Vergleich zu einem
   nicht gespiegelten Datentr?ger die doppelte Bandbreite ben?tigt.
   Lesezugriffe hingegen sind davon nicht betroffen, es sieht sogar so
   aus, als w?rden diese schneller ausgef?hrt.

.. raw:: html

   </div>

Eine alternative L?sung ist *Parity*, das in den RAID-Leveln 2, 3, 4 und
5 implementiert ist. Von diesen ist RAID-5 der interessanteste. So wie
in VINUM implementiert, ist es eine Variante einer gestripten Anordung,
welche einen Block jedes Stripes als Parit?tsblock f?r einen der anderen
Bl?cke verwendet. Wie in RAID-5 vorgeschrieben, ist die Position dieses
Parit?tsblockes auf jedem Stripe unterschiedlich. Die Nummern in den
Datenbl?cken geben die relativen Blocknummern an.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 23.3. RAID-5 Aufbau

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|RAID-5 Aufbau|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

| 

Im Vergleich zur Spiegelung hat RAID-5 den Vorteil, dass es signifikant
weniger Speicherplatz ben?tigt. Lesezugriffe sind vergleichbar schnell
mit jenen bei einem Striped-Aufbau, aber Schreibzugriffe sind deutlich
langsamer (etwa 25% der Lesegeschwindigkeit). Wenn eine Platte ausf?llt,
kann das Array in einem "schwachen" Modus weiterarbeiten: Ein
Lesezugriff auf eine der ?brigen erreichbaren Platten wird normal
ausgef?hrt, ein Lesezugriff auf die ausgefallene Platte muss aber
zun?chst mit dem zugeh?rigen Block aller verbleibender Platten
r?ckberechnet werden.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------------+------------------------------------+--------------------------------------+
| `Zur?ck <vinum-access-bottlenecks.html>`__?   | `Nach oben <vinum-vinum.html>`__   | ?\ `Weiter <vinum-objects.html>`__   |
+-----------------------------------------------+------------------------------------+--------------------------------------+
| 23.3. M?gliche Engp?sse?                      | `Zum Anfang <index.html>`__        | ?23.5. Vinum-Objekte                 |
+-----------------------------------------------+------------------------------------+--------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.

.. |RAID-5 Aufbau| image:: vinum/vinum-raid5-org.png
