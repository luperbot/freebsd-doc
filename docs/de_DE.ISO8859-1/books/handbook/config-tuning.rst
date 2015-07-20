====================================
Kapitel 12. Konfiguration und Tuning
====================================

.. raw:: html

   <div class="navheader">

Kapitel 12. Konfiguration und Tuning
`Zur?ck <system-administration.html>`__?
Teil?III.?Systemadministration
?\ `Weiter <configtuning-initial.html>`__

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

Kapitel 12. Konfiguration und Tuning
------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Geschrieben von Chern Lee.

.. raw:: html

   </div>

.. raw:: html

   <div>

Nach einem Tutorium von Mike Smith.

.. raw:: html

   </div>

.. raw:: html

   <div>

Basiert ebenfalls auf tuning(7) von Matt Dillon.

.. raw:: html

   </div>

.. raw:: html

   <div>

?bersetzt von Martin Heinen.

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

`12.1. ?bersicht <config-tuning.html#config-synopsis>`__
`12.2. Vorbereitende Konfiguration <configtuning-initial.html>`__
`12.3. Basiskonfiguration <configtuning-core-configuration.html>`__
`12.4. Konfiguration von Anwendungen <configtuning-appconfig.html>`__
`12.5. Start von Diensten <configtuning-starting-services.html>`__
`12.6. Programme mit ``cron`` starten <configtuning-cron.html>`__
`12.7. Das rc-System f?r Systemdienste <configtuning-rcd.html>`__
`12.8. Einrichten von Netzwerkkarten <config-network-setup.html>`__
`12.9. Virtual Hosts <configtuning-virtual-hosts.html>`__
`12.10. Konfiguration des syslogd Servers <configtuning-syslog.html>`__
`12.11. Konfigurationsdateien <configtuning-configfiles.html>`__
`12.12. Einstellungen mit sysctl(8) <configtuning-sysctl.html>`__
`12.13. Tuning von Laufwerken <configtuning-disk.html>`__
`12.14. Einstellungen von Kernel
Limits <configtuning-kernel-limits.html>`__
`12.15. Hinzuf?gen von Swap-Bereichen <adding-swap-space.html>`__
`12.16. Energie- und Ressourcenverwaltung <acpi-overview.html>`__
`12.17. ACPI-Fehlersuche <ACPI-debug.html>`__

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

12.1. ?bersicht
---------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Ein korrekt konfiguriertes System kann die Arbeit, die bei der
zuk?nftigen Pflege und bei Migrationen des Systems entsteht, erheblich
reduzieren. Dieses Kapitel beschreibt die Konfiguration von FreeBSD
sowie Ma?nahmen zur Leistungssteigerung von FreeBSD-Systemen.

Nachdem Sie dieses Kapitel durchgearbeitet haben, werden Sie Folgendes
wissen:

.. raw:: html

   <div class="itemizedlist">

-  Wie Sie effizient Dateisysteme und Swap-Partitionen auf Ihrer
   Festplatte einrichten.

-  Die Grundlagen der Konfiguration mit ``rc.conf`` und des Systems zum
   Starten von Anwendungen in ``/usr/local/etc/rc.d``.

-  Wie Sie Netzwerkkarten konfigurieren und testen.

-  Wie Sie virtuelle Hosts und Netzwerkger?te konfigurieren.

-  Wie Sie die verschiedenen Konfigurationsdateien in ``/etc`` benutzen.

-  Wie Sie mit ``sysctl``-Variablen FreeBSD einstellen k?nnen.

-  Wie Sie die Platten-Performance einstellen und Kernel-Parameter
   modifizieren k?nnen.

.. raw:: html

   </div>

Bevor Sie dieses Kapitel lesen, sollten Sie

.. raw:: html

   <div class="itemizedlist">

-  die Grundlagen von UNIX? und FreeBSD (`Kapitel?4, *Grundlagen des
   UNIX Betriebssystems* <basics.html>`__) verstehen.

-  Damit vertraut sein, wie Sie einen Kernel konfigurieren und
   kompilieren (`Kapitel?9, *Konfiguration des
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

+--------------------------------------------+----------------------------------------------+---------------------------------------------+
| `Zur?ck <system-administration.html>`__?   | `Nach oben <system-administration.html>`__   | ?\ `Weiter <configtuning-initial.html>`__   |
+--------------------------------------------+----------------------------------------------+---------------------------------------------+
| Teil?III.?Systemadministration?            | `Zum Anfang <index.html>`__                  | ?12.2. Vorbereitende Konfiguration          |
+--------------------------------------------+----------------------------------------------+---------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
