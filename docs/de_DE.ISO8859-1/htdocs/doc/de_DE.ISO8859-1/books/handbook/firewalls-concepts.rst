======================
32.2. Firewallkonzepte
======================

.. raw:: html

   <div class="navheader">

32.2. Firewallkonzepte
`Zur?ck <firewalls.html>`__?
Kapitel 32. Firewalls
?\ `Weiter <firewalls-apps.html>`__

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

32.2. Firewallkonzepte
----------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Es gibt zwei grundlegende Arten, Regelgruppen f?r Firewalls zu
erstellen: „einschlie?end“ (*inclusive firewall*) sowie „auschlie?end“
(*exclusive Firewall*). Eine auschlie?ende Firewall l?sst jeden
Datenverkehr durch, der nicht durch eine Regel ausgeschlossen wurde.
Eine einschlie?ende Firewall macht das genaue Gegenteil. Sie l?sst
Datenverkehr nur dann durch, wenn er einer der definierten Regeln
entspricht.

Eine inclusive Firewall bietet eine wesentlich bessere Kontrolle des
ausgehenden Verkehrs, macht sie zur besseren Wahl f?r Systeme, die
Services f?r das Internet anbieten. Sie kontrolliert auch den Verkehr
vom Internet zu ihrem privaten Netzwerk. Jeder Verkehr, der keiner Regel
entspricht wird geblockt und geloggt. Inclusive Firewalls sind generell
sicherer als exclusive Firewalls, da sie das Risiko, dass unerw?nschter
Verkehr hindurch geht, drastisch reduzieren.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Wenn nicht anders vermerkt, verwenden alle Konfigurationen und
Beispielregelsets dieses Kapitels inclusive Firewalls.

.. raw:: html

   </div>

Die Sicherheit einer Firewall kann durch den Einsatz einer
„zustandsabh?ngigen Firewall“ (*stateful firewall*) weiter erh?ht
werden. Dieser Typ einer Firewall ?berwacht alle durch die Firewall
gehenden offenen Verbindungen und erlaubt nur schon bestehenden Verkehr
oder Datenverkehr, der eine neue Verbindung ?ffnet. Der Nachteil einer
zustandsabh?ngigen Firewall ist allerdings, dass sie anf?llig f?r Denial
of Service (DoS) -Attacken ist, wenn sehr schnell sehr viele neue
Verbindungen erstellt werden. Bei den meisten Firewalls k?nnen Sie eine
Kombination aus zustandsabh?ngigem und nicht zustandsabh?ngigem
Verhalten verwenden, um eine f?r Ihre Bed?rfnisse optimale Firewall
einzurichten.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------+----------------------------------+---------------------------------------+
| `Zur?ck <firewalls.html>`__?   | `Nach oben <firewalls.html>`__   | ?\ `Weiter <firewalls-apps.html>`__   |
+--------------------------------+----------------------------------+---------------------------------------+
| Kapitel 32. Firewalls?         | `Zum Anfang <index.html>`__      | ?32.3. Firewallpakete                 |
+--------------------------------+----------------------------------+---------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
