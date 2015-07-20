==================================
3.3. Die Checksummendatei erzeugen
==================================

.. raw:: html

   <div class="navheader">

3.3. Die Checksummendatei erzeugen
`Zur?ck <porting-desc.html>`__?
Kapitel 3. Einen neuen Port erstellen
?\ `Weiter <porting-testing.html>`__

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

3.3. Die Checksummendatei erzeugen
----------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Geben Sie einfach ``make makesum`` ein. Die Regeln von Make sorgen
daf?r, dass die Datei ``distinfo`` automatisch erstellt wird.

Wenn sich die Checksumme einer heruntergeladenen Datei regelm??ig ?ndert
und Sie sicher sind, dass Sie der Quelle trauen k?nnen (weil sie z.B.
von einer Hersteller-CD oder t?glich erstellter Dokumentation stammt),
sollten Sie diese Dateien in der Variable ``IGNOREFILES`` angeben. Dann
wird die Checksumme f?r diese Datei bei ``make makesum`` nicht
berechnet, sondern auf ``IGNORE`` gesetzt.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------------+--------------------------------------+----------------------------------------+
| `Zur?ck <porting-desc.html>`__?            | `Nach oben <quick-porting.html>`__   | ?\ `Weiter <porting-testing.html>`__   |
+--------------------------------------------+--------------------------------------+----------------------------------------+
| 3.2. Die Beschreibungsdateien erstellen?   | `Zum Anfang <index.html>`__          | ?3.4. Den Port testen                  |
+--------------------------------------------+--------------------------------------+----------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
