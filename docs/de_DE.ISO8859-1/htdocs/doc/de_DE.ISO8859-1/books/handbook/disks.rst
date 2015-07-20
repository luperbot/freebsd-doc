==========================
Kapitel 19. Speichermedien
==========================

.. raw:: html

   <div class="navheader">

Kapitel 19. Speichermedien
`Zur?ck <audit-administration.html>`__?
Teil?III.?Systemadministration
?\ `Weiter <disks-naming.html>`__

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

Kapitel 19. Speichermedien
--------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

?bersetzt von Bernd Warken und Martin Heinen.

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

`19.1. ?bersicht <disks.html#disks-synopsis>`__
`19.2. Ger?tenamen <disks-naming.html>`__
`19.3. Hinzuf?gen von Laufwerken <disks-adding.html>`__
`19.4. RAID <raid.html>`__
`19.5. USB Speichermedien <usb-disks.html>`__
`19.6. CDs benutzen <creating-cds.html>`__
`19.7. DVDs benutzen <creating-dvds.html>`__
`19.8. Disketten benutzen <floppies.html>`__
`19.9. Bandmedien benutzen <backups-tapebackups.html>`__
`19.10. Was ist mit Backups auf
Disketten? <backups-floppybackups.html>`__
`19.11. Backup-Strategien <backup-strategies.html>`__
`19.12. Datensicherung <backup-basics.html>`__
`19.13. Netzwerk-, speicher- und dateibasierte
Dateisysteme <disks-virtual.html>`__
`19.14. Schnappsch?sse von Dateisystemen <snapshots.html>`__
`19.15. Dateisystem-Quotas <quotas.html>`__
`19.16. Partitionen verschl?sseln <disks-encrypting.html>`__
`19.17. Den Auslagerungsspeicher verschl?sseln <swap-encrypting.html>`__
`19.18. Highly Available Storage (HAST) <disks-hast.html>`__

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

19.1. ?bersicht
---------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dieses Kapitel behandelt die Benutzung von Laufwerken unter FreeBSD.
Laufwerke k?nnen speichergest?tzte Laufwerke, Netzwerklaufwerke oder
normale SCSI/IDE-Ger?te sein.

Nachdem Sie dieses Kapitel gelesen haben, werden Sie Folgendes wissen:

.. raw:: html

   <div class="itemizedlist">

-  Die Begriffe, die FreeBSD verwendet, um die Organisation der Daten
   auf einem physikalischen Laufwerk zu beschreiben (Partitionen und
   Slices).

-  Wie Sie ein weiteres Laufwerk zu Ihrem System hinzuf?gen.

-  Wie virtuelle Dateisysteme, zum Beispiel RAM-Disks, eingerichtet
   werden.

-  Wie Sie mit Quotas die Benutzung von Laufwerken einschr?nken k?nnen.

-  Wie Sie Partitionen verschl?sseln, um Ihre Daten zu sch?tzen.

-  Wie unter FreeBSD CDs und DVDs gebrannt werden.

-  Sie werden die Speichermedien, die Sie f?r Backups einsetzen k?nnen,
   kennen.

-  Wie Sie die unter FreeBSD erh?ltlichen Backup Programme benutzen.

-  Wie Sie ein Backup mit Disketten erstellen.

-  Was Dateisystem-Schnappsch?sse sind und wie sie eingesetzt werden.

.. raw:: html

   </div>

Bevor Sie dieses Kapitel lesen,

.. raw:: html

   <div class="itemizedlist">

-  sollten Sie einen einen FreeBSD-Kernel installieren k?nnen
   (`Kapitel?9, *Konfiguration des
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

+----------------------------------------------+----------------------------------------------+-------------------------------------+
| `Zur?ck <audit-administration.html>`__?      | `Nach oben <system-administration.html>`__   | ?\ `Weiter <disks-naming.html>`__   |
+----------------------------------------------+----------------------------------------------+-------------------------------------+
| 18.5. Administration des Audit-Subsystems?   | `Zum Anfang <index.html>`__                  | ?19.2. Ger?tenamen                  |
+----------------------------------------------+----------------------------------------------+-------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
