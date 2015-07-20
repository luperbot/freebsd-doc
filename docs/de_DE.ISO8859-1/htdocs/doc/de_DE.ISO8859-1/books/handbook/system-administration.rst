==============================
Teil?III.?Systemadministration
==============================

.. raw:: html

   <div class="navheader">

Teil?III.?Systemadministration
`Zur?ck <linuxemu-advanced.html>`__?
?
?\ `Weiter <config-tuning.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="part">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="partintro">

.. raw:: html

   <div xmlns="">

.. raw:: html

   </div>

Die restlichen Kapitel behandeln alle Aspekte der FreeBSD
Systemadministration. Am Anfang jedes Kapitels finden Sie eine
Zusammenfassung, die beschreibt, was Sie nach dem Durcharbeiten des
Kapitels gelernt haben. Weiterhin werden die Voraussetzungen
beschrieben, die f?r das Durcharbeiten des Kapitels erforderlich sind.

Diese Kapitel sollten Sie lesen, wenn Sie die Informationen darin
ben?tigen. Sie brauchen Sie nicht in einer bestimmten Reihenfolge zu
lesen, noch m?ssen Sie die Kapitel lesen, bevor Sie anfangen, FreeBSD zu
benutzen.

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Inhaltsverzeichnis

.. raw:: html

   </div>

`12. Konfiguration und Tuning <config-tuning.html>`__
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
`13. FreeBSDs Bootvorgang <boot.html>`__
`13.1. ?bersicht <boot.html#boot-synopsis>`__
`13.2. Das Problem des Bootens <boot-introduction.html>`__
`13.3. Boot-Manager und Boot-Phasen <boot-blocks.html>`__
`13.4. Kernel Interaktion w?hrend des
Bootprozesses <boot-kernel.html>`__
`13.5. Konfiguration von Ger?ten <device-hints.html>`__
`13.6. Init: Initialisierung der Prozess-Kontrolle <boot-init.html>`__
`13.7. Der Shutdown-Vorgang <boot-shutdown.html>`__
`14. Benutzer und grundlegende Account-Verwaltung <users.html>`__
`14.1. ?bersicht <users.html#users-synopsis>`__
`14.2. Einf?hrung <users-introduction.html>`__
`14.3. Der Superuser-Account <users-superuser.html>`__
`14.4. System-Accounts <users-system.html>`__
`14.5. Benutzer-Accounts <users-user.html>`__
`14.6. Accounts ver?ndern <users-modifying.html>`__
`14.7. Benutzer einschr?nken <users-limiting.html>`__
`14.8. Gruppen <users-groups.html>`__
`15. Sicherheit <security.html>`__
`15.1. ?bersicht <security.html#security-synopsis>`__
`15.2. Einf?hrung <security-intro.html>`__
`15.3. Absichern von FreeBSD <securing-freebsd.html>`__
`15.4. DES, Blowfish, MD5, und Crypt <crypt.html>`__
`15.5. Einmalpassw?rter <one-time-passwords.html>`__
`15.6. TCP-Wrapper <tcpwrappers.html>`__
`15.7. Kerberos5 <kerberos5.html>`__
`15.8. OpenSSL <openssl.html>`__
`15.9. VPNs mit IPsec <ipsec.html>`__
`15.10. OpenSSH <openssh.html>`__
`15.11. Zugriffskontrolllisten f?r Dateisysteme <fs-acl.html>`__
`15.12. Sicherheitsprobleme in Software Dritter
?berwachen <security-portaudit.html>`__
`15.13. FreeBSD Sicherheitshinweise <security-advisories.html>`__
`15.14. Prozess-?berwachung <security-accounting.html>`__
`16. Jails <jails.html>`__
`16.1. ?bersicht <jails.html#jails-synopsis>`__
`16.2. Jails - Definitionen <jails-terms.html>`__
`16.3. Einf?hrung <jails-intro.html>`__
`16.4. Einrichtung und Verwaltung von Jails <jails-build.html>`__
`16.5. Feinabstimmung und Administration <jails-tuning.html>`__
`16.6. Anwendung von Jails <jails-application.html>`__
`17. Verbindliche Zugriffskontrolle <mac.html>`__
`17.1. ?bersicht <mac.html#mac-synopsis>`__
`17.2. Schl?sselbegriffe <mac-inline-glossary.html>`__
`17.3. Erl?uterung <mac-initial.html>`__
`17.4. MAC Labels verstehen <mac-understandlabel.html>`__
`17.5. Planung eines Sicherheitsmodells <mac-planning.html>`__
`17.6. Modulkonfiguration <mac-modules.html>`__
`17.7. Das MAC Modul seeotheruids <mac-seeotheruids.html>`__
`17.8. Das MAC Modul bsdextended <mac-bsdextended.html>`__
`17.9. Das MAC Modul ifoff <mac-ifoff.html>`__
`17.10. Das MAC Modul portacl <mac-portacl.html>`__
`17.11. Das MAC Modul partition <mac-partition.html>`__
`17.12. Das MAC Modul Multi-Level Security <mac-mls.html>`__
`17.13. Das MAC Modul Biba <mac-biba.html>`__
`17.14. Das MAC Modul LOMAC <mac-lomac.html>`__
`17.15. Beispiel 1: Nagios in einer MAC Jail <mac-implementing.html>`__
`17.16. Beispiel 2: User Lock Down <mac-userlocked.html>`__
`17.17. Fehler im MAC beheben <mac-troubleshoot.html>`__
`18. Security Event Auditing <audit.html>`__
`18.1. Einleitung <audit.html#audit-synopsis>`__
`18.2. Schl?sselbegriffe <audit-inline-glossary.html>`__
`18.3. Installation der Audit-Unterst?tzung <audit-install.html>`__
`18.4. Die Konfiguration des Audit <audit-config.html>`__
`18.5. Administration des
Audit-Subsystems <audit-administration.html>`__
`19. Speichermedien <disks.html>`__
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
`20. GEOM: Modulares Framework zur Plattentransformation <GEOM.html>`__
`20.1. ?bersicht <GEOM.html#geom-synopsis>`__
`20.2. Einf?hrung in GEOM <GEOM-intro.html>`__
`20.3. RAID0 - Striping <GEOM-striping.html>`__
`20.4. RAID1 - Spiegelung <GEOM-mirror.html>`__
`20.5. GEOM Gate Netzwerkger?te <geom-ggate.html>`__
`20.6. Das Labeln von Laufwerken <geom-glabel.html>`__
`20.7. UFS Journaling in GEOM <geom-gjournal.html>`__
`21. Das Z-Dateisystem (ZFS) <zfs.html>`__
`21.1. Was ZFS anders macht <zfs.html#zfs-differences>`__
`21.2. Schnellstartanleitung <zfs-quickstart.html>`__
`21.3. ``zpool`` Administration <zfs-zpool.html>`__
`21.4. ``zfs`` Administration <zfs-zfs.html>`__
`21.5. Delegierbare Administration <zfs-zfs-allow.html>`__
`21.6. Themen f?r Fortgeschrittene <zfs-advanced.html>`__
`21.7. Zus?tzliche Informationen <zfs-links.html>`__
`21.8. ZFS-Eigenschaften und Terminologie <zfs-term.html>`__
`22. Dateisystemunterst?tzung <filesystems.html>`__
`22.1. ?bersicht <filesystems.html#filesystems-synopsis>`__
`22.2. Linux? Dateisysteme <filesystems-linux.html>`__
`23. Der Vinum Volume Manager <vinum-vinum.html>`__
`23.1. ?bersicht <vinum-vinum.html#vinum-synopsis>`__
`23.2. Ihre Platten sind zu klein. <vinum-intro.html>`__
`23.3. M?gliche Engp?sse <vinum-access-bottlenecks.html>`__
`23.4. Datenintegrit?t <vinum-data-integrity.html>`__
`23.5. Vinum-Objekte <vinum-objects.html>`__
`23.6. Einige Beispiele <vinum-examples.html>`__
`23.7. Objektbenennung <vinum-object-naming.html>`__
`23.8. Vinum konfigurieren <vinum-config.html>`__
`23.9. Vinum f?r das Root-Dateisystem benutzen <vinum-root.html>`__
`24. Virtualisierung <virtualization.html>`__
`24.1. ?bersicht <virtualization.html#virtualization-synopsis>`__
`24.2. FreeBSD als Gast-Betriebssystem <virtualization-guest.html>`__
`24.3. FreeBSD als Host-Betriebssystem <virtualization-host.html>`__
`25. Lokalisierung – I18N/L10N einrichten und benutzen <l10n.html>`__
`25.1. ?bersicht <l10n.html#l10n-synopsis>`__
`25.2. Grundlagen <l10n-basics.html>`__
`25.3. Lokale Anpassungen benutzen <using-localization.html>`__
`25.4. I18N-Programme ?bersetzen <l10n-compiling.html>`__
`25.5. Lokalisierung f?r einzelne Sprachen <lang-setup.html>`__
`26. FreeBSD aktualisieren <updating-upgrading.html>`__
`26.1.
?bersicht <updating-upgrading.html#updating-upgrading-synopsis>`__
`26.2. FreeBSD-Update <updating-upgrading-freebsdupdate.html>`__
`26.3. Portsnap: Ein Werkzeug zur Aktualisierung der
Ports-Sammlung <updating-upgrading-portsnap.html>`__
`26.4. Aktualisieren der
Dokumentationssammlung <updating-upgrading-documentation.html>`__
`26.5. Einem Entwicklungszweig folgen <current-stable.html>`__
`26.6. Synchronisation der Quellen <synching.html>`__
`26.7. Das komplette Basissystem neu bauen <makeworld.html>`__
`26.8. Veraltete Dateien, Verzeichnisse und Bibliotheken
l?schen <make-delete-old.html>`__
`26.9. Installation mehrerer Maschinen <small-lan.html>`__
`27. DTrace <dtrace.html>`__
`27.1. ?berblick <dtrace.html#dtrace-synopsis>`__
`27.2. Unterschiede in der
Implementierung <dtrace-implementation.html>`__
`27.3. Die DTrace Unterst?tzung aktivieren <dtrace-enable.html>`__
`27.4. DTrace verwenden <dtrace-using.html>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------+-------------------------------+-----------------------------------------+
| `Zur?ck <linuxemu-advanced.html>`__?   | ?                             | ?\ `Weiter <config-tuning.html>`__      |
+----------------------------------------+-------------------------------+-----------------------------------------+
| 11.7. Weiterf?hrende Themen?           | `Zum Anfang <index.html>`__   | ?Kapitel 12. Konfiguration und Tuning   |
+----------------------------------------+-------------------------------+-----------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
