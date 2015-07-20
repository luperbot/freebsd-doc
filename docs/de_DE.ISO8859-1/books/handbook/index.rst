====================
Das FreeBSD-Handbuch
====================

.. raw:: html

   <div class="navheader">

Das FreeBSD-Handbuch
?
?
?\ `Weiter <book-preface.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="book" lang="de" lang="de">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="author" xmlns="http://www.w3.org/1999/xhtml">

The FreeBSD German Documentation Project
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div>

Version: ` <https://svnweb.freebsd.org/changeset/doc/>`__

.. raw:: html

   </div>

.. raw:: html

   <div>

Copyright ? 1995-2014 The FreeBSD German Documentation Project

.. raw:: html

   </div>

.. raw:: html

   <div>

`Rechtlicher Hinweis <legalnotice.html>`__

.. raw:: html

   </div>

.. raw:: html

   <div>

`Rechtlicher Hinweis <trademarks.html>`__

.. raw:: html

   </div>

.. raw:: html

   <div>

Zuletzt bearbeitet am von .

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="abstract" xmlns="http://www.w3.org/1999/xhtml">

.. raw:: html

   <div class="abstract-title">

Zusammenfassung

.. raw:: html

   </div>

Willkommen bei FreeBSD! Dieses Handbuch beschreibt die Installation und
den t?glichen Umgang mit *FreeBSD 8.4-RELEASE*, *9.3-RELEASE* und
*FreeBSD 10.1-RELEASE*. Das Handbuch ist *jederzeit unter Bearbeitung*
und das Ergebnis der Arbeit vieler Einzelpersonen. Dies kann dazu
f?hren, dass bestimmte Bereiche nicht mehr aktuell sind und auf den
neuesten Stand gebracht werden m?ssen. Bei Unklarheiten empfiehlt es
sich daher stets, die `englische
Originalversion <../../../../doc/en_US.ISO8859-1/books/handbook/index.html>`__
des Handbuchs zu lesen.

Wenn Sie bei der ?bersetzung des Handbuchs mithelfen m?chten, senden Sie
bitte eine E-Mail an die Mailingliste 'FreeBSD German Documentation
Project' ``<de-bsd-translators@de.FreeBSD.org>``.

Die aktuelle Version des Handbuchs ist immer auf dem
`FreeBSD-Webserver <http://www.FreeBSD.org/>`__ verf?gbar und kann in
verschiedenen Formaten und in komprimierter Form vom `FreeBSD
FTP-Server <ftp://ftp.FreeBSD.org/pub/FreeBSD/doc>`__ oder einem der
vielen `Spiegel <mirrors-ftp.html>`__ herunter geladen werden (?ltere
Versionen finden Sie hingegen unter ``http://docs.FreeBSD.org/doc/``).
Vielleicht m?chten Sie das Handbuch aber auch
`durchsuchen <../../../../search/index.html>`__.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Inhaltsverzeichnis

.. raw:: html

   </div>

`Vorwort <book-preface.html>`__
`I. Erste Schritte <getting-started.html>`__
`1. Einleitung <introduction.html>`__
`1.1. ?berblick <introduction.html#introduction-synopsis>`__
`1.2. Willkommen zu FreeBSD <nutshell.html>`__
`1.3. ?ber das FreeBSD Projekt <history.html>`__
`2. FreeBSD?8.\ *``X``* (und ?lter) installieren <install.html>`__
`2.1. ?bersicht <install.html#install-synopsis>`__
`2.2. Hardware-Anforderungen <install-hardware.html>`__
`2.3. Vor der Installation <install-pre.html>`__
`2.4. Die Installation starten <install-start.html>`__
`2.5. Das Werkzeug sysinstall <using-sysinstall.html>`__
`2.6. Plattenplatz f?r FreeBSD bereitstellen <install-steps.html>`__
`2.7. Den Installationsumfang bestimmen <install-choosing.html>`__
`2.8. Das Installationsmedium ausw?hlen <install-media.html>`__
`2.9. Die Installation festschreiben <install-final-warning.html>`__
`2.10. Arbeiten nach der Installation <install-post.html>`__
`2.11. Fehlersuche <install-trouble.html>`__
`2.12. Anspruchsvollere Installationen <install-advanced.html>`__
`2.13. Eigene Installationsmedien
herstellen <install-diff-media.html>`__
`3. FreeBSD?9.\ *``x``* (und neuer) installieren <bsdinstall.html>`__
`3.1. ?bersicht <bsdinstall.html#bsdinstall-synopsis>`__
`3.2. Hardware-Anforderungen <bsdinstall-hardware.html>`__
`3.3. Vor der Installation <bsdinstall-pre.html>`__
`3.4. Die Installation starten <bsdinstall-start.html>`__
`3.5. Das bsdinstall-Werkzeug <using-bsdinstall.html>`__
`3.6. Installation aus dem Netzwerk <bsdinstall-netinstall.html>`__
`3.7. Plattenplatz bereitstellen <bsdinstall-partitioning.html>`__
`3.8. Die Installation festschreiben <bsdinstall-final-warning.html>`__
`3.9. Arbeiten nach der Installation <bsdinstall-post.html>`__
`3.10. Fehlerbehebung <bsdinstall-install-trouble.html>`__
`4. Grundlagen des UNIX Betriebssystems <basics.html>`__
`4.1. ?bersicht <basics.html#basics-synopsis>`__
`4.2. Virtuelle Konsolen und Terminals <consoles.html>`__
`4.3. Zugriffsrechte <permissions.html>`__
`4.4. Verzeichnis-Strukturen <dirstructure.html>`__
`4.5. Festplatten, Slices und Partitionen <disk-organization.html>`__
`4.6. Anh?ngen und Abh?ngen von Dateisystemen <mount-unmount.html>`__
`4.7. Prozesse <basics-processes.html>`__
`4.8. D?monen, Signale und Stoppen von
Prozessen <basics-daemons.html>`__
`4.9. Shells <shells.html>`__
`4.10. Text-Editoren <editors.html>`__
`4.11. Ger?te und Ger?tedateien <basics-devices.html>`__
`4.12. Bin?rformate <binary-formats.html>`__
`4.13. Weitere Informationen <basics-more-information.html>`__
`5. Installieren von Anwendungen: Pakete und Ports <ports.html>`__
`5.1. ?bersicht <ports.html#ports-synopsis>`__
`5.2. Installation von Software <ports-overview.html>`__
`5.3. Suchen einer Anwendung <ports-finding-applications.html>`__
`5.4. Benutzen des Paketsystems <packages-using.html>`__
`5.5. Benutzen der Ports-Sammlung <ports-using.html>`__
`5.6. Nach der Installation <ports-nextsteps.html>`__
`5.7. Kaputte Ports <ports-broken.html>`__
`6. Das X-Window-System <x11.html>`__
`6.1. ?bersicht <x11.html#x11-synopsis>`__
`6.2. X-Grundlagen <x-understanding.html>`__
`6.3. X11 installieren <x-install.html>`__
`6.4. X11 konfigurieren <x-config.html>`__
`6.5. Schriftarten in X11 benutzen <x-fonts.html>`__
`6.6. Der X-Display-Manager <x-xdm.html>`__
`6.7. Grafische Oberfl?chen <x11-wm.html>`__
`II. Oft benutzte Funktionen <common-tasks.html>`__
`7. Desktop-Anwendungen <desktop.html>`__
`7.1. ?bersicht <desktop.html#desktop-synopsis>`__
`7.2. Browser <desktop-browsers.html>`__
`7.3. B?roanwendungen <desktop-productivity.html>`__
`7.4. Anzeigen von Dokumenten <desktop-viewers.html>`__
`7.5. Finanzsoftware <desktop-finance.html>`__
`7.6. Zusammenfassung <desktop-summary.html>`__
`8. Multimedia <multimedia.html>`__
`8.1. ?bersicht <multimedia.html#multimedia-synopsis>`__
`8.2. Soundkarten einrichten <sound-setup.html>`__
`8.3. MP3-Audio <sound-mp3.html>`__
`8.4. Videos wiedergeben <video-playback.html>`__
`8.5. TV-Karten einrichten <tvcard.html>`__
`8.6. MythTV <mythtv.html>`__
`8.7. Scanner <scanners.html>`__
`9. Konfiguration des FreeBSD-Kernels <kernelconfig.html>`__
`9.1. ?bersicht <kernelconfig.html#kernelconfig-synopsis>`__
`9.2. Wieso einen eigenen Kernel
bauen? <kernelconfig-custom-kernel.html>`__
`9.3. Informationen ?ber die vorhandene Hardware
beschaffen <kernelconfig-devices.html>`__
`9.4. Kerneltreiber, Subsysteme und
Module <kernelconfig-modules.html>`__
`9.5. Erstellen und Installation eines angepassten
Kernels <kernelconfig-building.html>`__
`9.6. Die Kernelkonfigurationsdatei <kernelconfig-config.html>`__
`9.7. Wenn etwas schiefgeht <kernelconfig-trouble.html>`__
`10. Drucken <printing.html>`__
`10.1. ?bersicht <printing.html#printing-synopsis>`__
`10.2. Einf?hrung <printing-intro-spooler.html>`__
`10.3. Grund-Konfiguration <printing-intro-setup.html>`__
`10.4. Erweiterte Drucker-Konfiguration <printing-advanced.html>`__
`10.5. Drucker verwenden <printing-using.html>`__
`10.6. Alternativen zum
LPD-Drucksystem <printing-lpd-alternatives.html>`__
`10.7. Problembehandlung <printing-troubleshooting.html>`__
`11. Linux-Bin?rkompatibilit?t <linuxemu.html>`__
`11.1. ?bersicht <linuxemu.html#linuxemu-synopsis>`__
`11.2. Installation <linuxemu-lbc-install.html>`__
`11.3. Mathematica? installieren <linuxemu-mathematica.html>`__
`11.4. Maple™ installieren <linuxemu-maple.html>`__
`11.5. MATLAB? installieren <linuxemu-matlab.html>`__
`11.6. Oracle? installieren <linuxemu-oracle.html>`__
`11.7. Weiterf?hrende Themen <linuxemu-advanced.html>`__
`III. Systemadministration <system-administration.html>`__
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
`IV. Netzwerke <network-communication.html>`__
`28. Serielle Daten?bertragung <serialcomms.html>`__
`28.1. ?bersicht <serialcomms.html#serial-synopsis>`__
`28.2. Einf?hrung <serial.html>`__
`28.3. Terminals <term.html>`__
`28.4. Einw?hlverbindungen <dialup.html>`__
`28.5. Verbindungen nach Au?en <dialout.html>`__
`28.6. Einrichten der seriellen Konsole <serialconsole-setup.html>`__
`29. PPP und SLIP <ppp-and-slip.html>`__
`29.1. ?bersicht <ppp-and-slip.html#ppp-and-slip-synopsis>`__
`29.2. User-PPP <userppp.html>`__
`29.3. Kernel-PPP <ppp.html>`__
`29.4. Probleme bei PPP-Verbindungen <ppp-troubleshoot.html>`__
`29.5. PPP over Ethernet (PPPoE) <pppoe.html>`__
`29.6. PPP over ATM (PPPoA) <pppoa.html>`__
`29.7. SLIP <slip.html>`__
`30. Elektronische Post (E-Mail) <mail.html>`__
`30.1. Terminologie <mail.html#mail-de-term>`__
`30.2. ?bersicht <mail-synopsis.html>`__
`30.3. Elektronische Post benutzen <mail-using.html>`__
`30.4. sendmail-Konfiguration <sendmail.html>`__
`30.5. Wechseln des Mail?bertragungs-Agenten <mail-changingmta.html>`__
`30.6. Fehlerbehebung <mail-trouble.html>`__
`30.7. Weiterf?hrende Themen <mail-advanced.html>`__
`30.8. SMTP ?ber UUCP <SMTP-UUCP.html>`__
`30.9. Ausgehende E-Mail ?ber einen Relay
versenden <outgoing-only.html>`__
`30.10. E-Mail ?ber Einwahl-Verbindungen <SMTP-dialup.html>`__
`30.11. SMTP-Authentifizierung <SMTP-Auth.html>`__
`30.12. E-Mail-Programme <mail-agents.html>`__
`30.13. E-Mails mit fetchmail abholen <mail-fetchmail.html>`__
`30.14. E-Mails mit procmail filtern <mail-procmail.html>`__
`31. Netzwerkserver <network-servers.html>`__
`31.1. ?bersicht <network-servers.html#network-servers-synopsis>`__
`31.2. Der inetd „Super-Server“ <network-inetd.html>`__
`31.3. NFS – Network File System <network-nfs.html>`__
`31.4. NIS/YP – Network Information Service <network-nis.html>`__
`31.5. Automatische Netzwerkkonfiguration mit
DHCP <network-dhcp.html>`__
`31.6. DNS – Domain Name Service <network-dns.html>`__
`31.7. Der Apache HTTP-Server <network-apache.html>`__
`31.8. FTP – File Transfer Protocol <network-ftp.html>`__
`31.9. Mit Samba einen Datei- und Druckserver f?r
Microsoft??Windows?-Clients einrichten <network-samba.html>`__
`31.10. Die Uhrzeit mit NTP synchronisieren <network-ntp.html>`__
`31.11. Protokollierung von anderen Hosts mittels
``syslogd`` <network-syslogd.html>`__
`32. Firewalls <firewalls.html>`__
`32.1. Einf?hrung <firewalls.html#firewalls-intro>`__
`32.2. Firewallkonzepte <firewalls-concepts.html>`__
`32.3. Firewallpakete <firewalls-apps.html>`__
`32.4. Paket Filter (PF) von OpenBSD und ALTQ <firewalls-pf.html>`__
`32.5. Die IPFILTER-Firewall (IPF) <firewalls-ipf.html>`__
`32.6. IPFW <firewalls-ipfw.html>`__
`33. Weiterf?hrende Netzwerkthemen <advanced-networking.html>`__
`33.1.
?bersicht <advanced-networking.html#advanced-networking-synopsis>`__
`33.2. Gateways und Routen <network-routing.html>`__
`33.3. Drahtlose Netzwerke <network-wireless.html>`__
`33.4. USB Tethering <network-usb-tethering.html>`__
`33.5. Bluetooth <network-bluetooth.html>`__
`33.6. LAN-Kopplung mit einer Bridge <network-bridging.html>`__
`33.7. Link-Aggregation und Failover <network-aggregation.html>`__
`33.8. Plattenloser Betrieb mit PXE <network-diskless.html>`__
`33.9. ISDN – dienstintegrierendes digitales
Netzwerk <network-isdn.html>`__
`33.10. IPv6 – Internet Protocol Version 6 <network-ipv6.html>`__
`33.11. CARP - Common Address Redundancy Protocol <carp.html>`__
`V. Anhang <appendices.html>`__
`A. Bezugsquellen f?r FreeBSD <mirrors.html>`__
`A.1. CD-ROM und DVD Verleger <mirrors.html#mirrors-cdrom>`__
`A.2. FTP-Server <mirrors-ftp.html>`__
`A.3. BitTorrent <mirrors-bittorrent.html>`__
`A.4. Anonymous CVS (veraltet) <anoncvs.html>`__
`A.5. CTM <ctm.html>`__
`A.6. Benutzen von Subversion <svn.html>`__
`A.7. Subversion Mirror Sites <svn-mirrors.html>`__
`A.8. Benutzen von CVSup (veraltet) <cvsup.html>`__
`A.9. CVS-Tags <cvs-tags.html>`__
`A.10. rsync-Server <mirrors-rsync.html>`__
`B. Bibliografie <bibliography.html>`__
`B.1. B?cher und Magazine speziell f?r
FreeBSD <bibliography.html#bibliography-freebsd>`__
`B.2. Handb?cher <bibliography-userguides.html>`__
`B.3. Administrations-Anleitungen <bibliography-adminguides.html>`__
`B.4. Programmierhandb?cher <bibliography-programmers.html>`__
`B.5. Betriebssystem-Interna <bibliography-osinternals.html>`__
`B.6. Sicherheits-Anleitung <bibliography-security.html>`__
`B.7. Hardware-Anleitung <bibliography-hardware.html>`__
`B.8. UNIX? Geschichte <bibliography-history.html>`__
`B.9. Magazine und Journale <bibliography-journals.html>`__
`C. Ressourcen im Internet <eresources.html>`__
`C.1. Mailinglisten <eresources.html#eresources-mail>`__
`C.2. Usenet-News <eresources-news.html>`__
`C.3. World Wide Web Server <eresources-web.html>`__
`C.4. E-Mail Adressen <eresources-email.html>`__
`D. PGP Schl?ssel <pgpkeys.html>`__
`D.1. Ansprechpartner <pgpkeys.html#pgpkeys-officers>`__
`D.2. Mitglieder des Core Teams <pgpkeys-core.html>`__
`D.3. Entwickler <pgpkeys-developers.html>`__
`FreeBSD Glossar <freebsd-glossary.html>`__
`Stichwortverzeichnis <ix01.html>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="list-of-figures">

.. raw:: html

   <div class="toc-title">

Abbildungsverzeichnis

.. raw:: html

   </div>

2.1. `FreeBSD Boot Loader Menu <install-start.html#boot-loader-menu>`__
2.2. `Ausgabe der
Ger?teerkennung <install-start.html#install-dev-probe>`__
2.3. `Ihr Land ausw?hlen <install-start.html#config-country>`__
2.4. `Die Tastaturbelegung
ausw?hlen <install-start.html#config-keymap>`__
2.5. `Die Gebrauchsanweisung von sysinstall
ausw?hlen <using-sysinstall.html#sysinstall-main3>`__
2.6. `Die Dokumentation abrufen <using-sysinstall.html#main-doc>`__
2.7. `Das Dokumentationsmen? von
sysinstall <using-sysinstall.html#docmenu1>`__
2.8. `Das Hauptmen? von
sysinstall <using-sysinstall.html#sysinstall-keymap>`__
2.9. `Sysinstall Keymap
Menu <using-sysinstall.html#sysinstall-keymap-menu>`__
2.10. `Das Hauptmen? von
sysinstall <using-sysinstall.html#sysinstall-options>`__
2.11. `Optionen von sysinstall <using-sysinstall.html#options>`__
2.12. `Die Standard-Installation
starten <using-sysinstall.html#sysinstall-standard>`__
2.13. `Ein Laufwerk f?r Fdisk
aussuchen <install-steps.html#sysinstall-fdisk-drive1>`__
2.14. `Typischer Fdisk-Bildschirm vor dem
Editieren <install-steps.html#sysinstall-fdisk1>`__
2.15. `Eine Partition ?ber die gesamte
Platte <install-steps.html#sysinstall-fdisk2>`__
2.16. `Sysinstall
Boot-Manager-Men? <install-steps.html#sysinstall-bootmgr>`__
2.17. `Die Laufwerksauswahl
verlassen <install-steps.html#sysinstall-fdisk-drive2>`__
2.18. `Sysinstall
Disklabel-Editor <install-steps.html#sysinstall-label>`__
2.19. `Sysinstall Disklabel-Editor mit automatischen
Vorgaben <install-steps.html#sysinstall-label2>`__
2.20. `Die Gr??e einer Partition
festlegen <install-steps.html#sysinstall-label-add>`__
2.21. `Die Gr??e einer Partition
?ndern <install-steps.html#sysinstall-label-add2>`__
2.22. `Den Partitionstyp
festlegen <install-steps.html#sysinstall-label-type>`__
2.23. `Den Mountpoint
festlegen <install-steps.html#sysinstall-label-mount>`__
2.24. `Sysinstall
Disklabel-Editor <install-steps.html#sysinstall-label4>`__
2.25. `Die Distribution
ausw?hlen <install-choosing.html#distribution-set1>`__
2.26. `Die Distributionen
best?tigen <install-choosing.html#distribution-set2>`__
2.27. `Das Installationsmedium
ausw?hlen <install-media.html#choose-media>`__
2.28. `Eine Netzwerkkarte ausw?hlen <install-post.html#ed-config1>`__
2.29. `Die Netzwerkkarte ed0
konfigurieren <install-post.html#ed-config2>`__
2.30. ```inetd.conf`` editieren <install-post.html#inetd-edit>`__
2.31. `Anonymous-FTP konfigurieren <install-post.html#anon-ftp2>`__
2.32. `Begr??ungsmeldung des FTP-Servers
editieren <install-post.html#anon-ftp4>`__
2.33. ```exports`` editieren <install-post.html#nfs-server-edit>`__
2.34. `Merkmale der Systemkonsole <install-post.html#saver-options>`__
2.35. `Bildschirmschoner ausw?hlen <install-post.html#saver-select>`__
2.36. `Den Bildschirmschoner
einstellen <install-post.html#saver-timeout>`__
2.37. `Die Konfiguration der Systemkonsole
verlassen <install-post.html#saver-exit>`__
2.38. `Das Gebiet ausw?hlen <install-post.html#set-timezone-region>`__
2.39. `Das Land ausw?hlen <install-post.html#set-timezone-country>`__
2.40. `Die Zeitzone
ausw?hlen <install-post.html#set-timezone-locality>`__
2.41. `Das Mausprotokoll festlegen <install-post.html#mouse-protocol>`__
2.42. `Das Mausprotokoll
festlegen <install-post.html#set-mouse-protocol>`__
2.43. `Den Mausport einstellen <install-post.html#config-mouse-port>`__
2.44. `Den Mausport einstellen <install-post.html#set-mouse-port>`__
2.45. `Den Mouse-Daemon aktivieren <install-post.html#test-daemon>`__
2.46. `Den Mouse-Daemon testen <install-post.html#test-mouse-daemon>`__
2.47. `Die Paketkategorie
aussuchen <install-post.html#package-category>`__
2.48. `Pakete ausw?hlen <install-post.html#package-select>`__
2.49. `Pakete installieren <install-post.html#package-install>`__
2.50. `Paketinstallation
best?tigen <install-post.html#package-install-confirm>`__
2.51. `Benutzerkonto ausw?hlen <install-post.html#add-user2>`__
2.52. `Benutzerkonto anlegen <install-post.html#add-user3>`__
2.53. `Benutzermen? verlassen <install-post.html#add-user4>`__
2.54. `Die Installation beenden <install-post.html#final-main>`__
2.55. `Netzwerkdienste – obere
H?lfte <install-post.html#network-configuration>`__
2.56. `Den MTA festlegen <install-post.html#mta-selection>`__
2.57. `Ntpdate konfigurieren <install-post.html#Ntpdate-config>`__
2.58. `Netzwerkdienste – untere
H?lfte <install-post.html#Network-configuration-cont>`__
3.1. `Das FreeBSD-Bootloader
Men? <bsdinstall-start.html#bsdinstall-boot-loader-menu>`__
3.2. `Typical Device Probe
Results <bsdinstall-start.html#bsdinstall-dev-probe>`__
3.3. `Auswahl der Verwendung des
Installationsmediums <bsdinstall-start.html#bsdinstall-choose-mode>`__
3.4. `Tastaturbelegung
festlegen <using-bsdinstall.html#bsdinstall-keymap-select-default>`__
3.5.
`Tastaturauswahlbildschirm <using-bsdinstall.html#bsdinstall-config-keymap>`__
3.6. `Festlegen des
Rechnernamens <using-bsdinstall.html#bsdinstall-config-hostname>`__
3.7. `Komponenten f?r die Installation
ausw?hlen <using-bsdinstall.html#bsdinstall-config-components>`__
3.8. `Installation ?ber das
Netzwerk <bsdinstall-netinstall.html#bsdinstall-netinstall-notify>`__
3.9. `Einen Spiegelserver
w?hlen <bsdinstall-netinstall.html#bsdinstall-netinstall-mirror>`__
3.10. `Gef?hrte oder manuelle Partitionierung
ausw?hlen <bsdinstall-partitioning.html#bsdinstall-part-guided-manual>`__
3.11. `Aus mehreren Platten eine
ausw?hlen <bsdinstall-partitioning.html#bsdinstall-part-guided-disk>`__
3.12. `Auswahl der gesamten Platte oder einer
Partition <bsdinstall-partitioning.html#bsdinstall-part-entire-part>`__
3.13. `?berpr?fen der erstellen
Partitionen <bsdinstall-partitioning.html#bsdinstall-part-review>`__
3.14. `Partitionen manuell
erstellen <bsdinstall-partitioning.html#bsdinstall-part-manual-create>`__
3.15. `Partitionen manuell
anlegen <bsdinstall-partitioning.html#bsdinstall-part-manual-partscheme>`__
3.16. `Partitionen manuell
erzeugen <bsdinstall-partitioning.html#bsdinstall-part-manual-addpart>`__
3.17. `Letzte
Best?tigung <bsdinstall-final-warning.html#bsdinstall-final-confirmation>`__
3.18. `Herunterladen der
Distributionsdateien <bsdinstall-final-warning.html#bsdinstall-distfile-fetching>`__
3.19. `?berpr?fen der
Distributionsdateien <bsdinstall-final-warning.html#bsdinstall-distfile-verify>`__
3.20. `Entpacken der
Distributionsdateien <bsdinstall-final-warning.html#bsdinstall-distfile-extract>`__
3.21. `Das ``root``-Passwort
setzen <bsdinstall-post.html#bsdinstall-post-set-root-passwd>`__
3.22. `Eine zu konfigurierende Netzwerkschnittstelle
ausw?hlen <bsdinstall-post.html#bsdinstall-configure-net-interface>`__
3.23. `Nach drahtlosen Access Points
scannen <bsdinstall-post.html#bsdinstall-wireless-scan>`__
3.24. `Ein drahtloses Netzwerk
ausw?hlen <bsdinstall-post.html#bsdinstall-wireless-accesspoints>`__
3.25. `Verbindungsaufbau mit
WPA2 <bsdinstall-post.html#bsdinstall-wireless-wpa2>`__
3.26. `Auswahl von
IPv4 <bsdinstall-post.html#bsdinstall-configure-net-ipv4>`__
3.27. `Ausw?hlen der IPv4-Konfiguration ?ber
DHCP <bsdinstall-post.html#bsdinstall-net-ipv4-dhcp>`__
3.28. `Statische
IPv4-Konfiguration <bsdinstall-post.html#bsdinstall-net-ipv4-static>`__
3.29. `Auswahl von IPv6 <bsdinstall-post.html#bsdinstall-net-ipv6>`__
3.30. `Auswahl der IPv6
SLAAC-Konfiguration <bsdinstall-post.html#bsdinstall-net-ipv6-slaac>`__
3.31. `Statische
IPv6-Konfiguration <bsdinstall-post.html#bsdinstall-net-ipv6-static>`__
3.32.
`DNS-Konfiguration <bsdinstall-post.html#bsdinstall-net-dns-config>`__
3.33. `Lokale oder
UTC-Zeit <bsdinstall-post.html#bsdinstall-local-utc>`__
3.34. `Das Gebiet
ausw?hlen <bsdinstall-post.html#bsdinstall-timezone-region>`__
3.35. `Das Land
ausw?hlen <bsdinstall-post.html#bsdinstall-timezone-country>`__
3.36. `W?hlen einer
Zeitzone <bsdinstall-post.html#bsdinstall-timezone-zone>`__
3.37. `Best?tigen der
Zeitzone <bsdinstall-post.html#bsdinstall-timezone-confirmation>`__
3.38. `Auswahl zus?tzlicher
Dienste <bsdinstall-post.html#bsdinstall-config-serv>`__
3.39. `Aktivierung der
Absturzaufzeichnung <bsdinstall-post.html#bsdinstall-config-crashdump>`__
3.40. `Benutzerkonten
hinzuf?gen <bsdinstall-post.html#bsdinstall-add-user1>`__
3.41. `Benutzerinformationen
eingeben <bsdinstall-post.html#bsdinstall-add-user2>`__
3.42. `Verlassen der Benutzer- und
Gruppenverwaltung <bsdinstall-post.html#bsdinstall-add-user3>`__
3.43. `Letzte Schritte der
Konfiguration <bsdinstall-post.html#bsdinstall-final-config>`__
3.44. `Manuelle
Konfiguration <bsdinstall-post.html#bsdinstall-final-modification-shell>`__
3.45. `Die Installation
vervollst?ndigen <bsdinstall-post.html#bsdinstall-final-main>`__
23.1. `Konkatenierte
Anordnung <vinum-access-bottlenecks.html#vinum-concat>`__
23.2.
`Striped-Anordnung <vinum-access-bottlenecks.html#vinum-striped>`__
23.3. `RAID-5 Aufbau <vinum-data-integrity.html#vinum-raid5-org>`__
23.4. `Ein einfaches
Vinum-Volume <vinum-examples.html#vinum-simple-vol>`__
23.5. `Ein gespiegeltes Vinum
Volume <vinum-examples.html#vinum-mirrored-vol>`__
23.6. `Ein Striped Vinum
Volume <vinum-examples.html#vinum-striped-vol>`__
23.7. `Ein gespiegeltes, Striped Vinum
Volume <vinum-examples.html#vinum-raid10-vol>`__
33.1. `PXE-Bootvorgang mit NFS Root
Mount <network-diskless.html#idp93358416>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="list-of-tables">

.. raw:: html

   <div class="toc-title">

Tabellenverzeichnis

.. raw:: html

   </div>

2.1. `Ger?tekonfiguration <install-pre.html#idp67635920>`__
2.2. `Partitionen auf dem ersten
Laufwerk <install-steps.html#idp68111184>`__
2.3. `Partitionen auf weiteren
Laufwerken <install-steps.html#idp68134096>`__
2.4. `FreeBSD?7.\ *``X``* und 8.\ *``X``*
ISO-Abbilder <install-diff-media.html#idp68976464>`__
3.1.
`Partitionierungsschemas <bsdinstall-partitioning.html#idp69513936>`__
4.1. `Laufwerk-Codes <disk-organization.html#basics-dev-codes>`__
19.1. `Namenskonventionen von physikalischen
Laufwerken <disks-naming.html#disk-naming-physical-table>`__
23.1. `Vinum-Plexus - Aufbau <vinum-objects.html#vinum-comparison>`__
28.1. `Nullmodemkabel vom Typ
DB-25-zu-DB-25 <serial.html#idp86396880>`__
28.2. `Nullmodemkabel vom Typ DB-9-zu-DB-9 <serial.html#idp86431824>`__
28.3. `Nullmodemkabel vom Typ DB-9-zu-DB-25 <serial.html#idp86462160>`__
28.4. `Signalnamen <dialup.html#serialcomms-signal-names>`__
33.1. `Reservierte IPv6-Adressen <network-ipv6.html#idp93534288>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="list-of-examples">

.. raw:: html

   <div class="toc-title">

Liste der Beispiele

.. raw:: html

   </div>

2.1. `Eine bestehende Partition
verwenden <install-pre.html#idp67709904>`__
2.2. `Eine bestehende Partition
verkleinern <install-pre.html#idp67718480>`__
3.1. `Eine existierende Partition
ver?ndern <bsdinstall-pre.html#idp69224016>`__
3.2. `Verkleinern einer bestehenden
Partition <bsdinstall-pre.html#idp69233104>`__
3.3. `Ein traditionelles, partitioniertes Dateisystem
erstellen <bsdinstall-partitioning.html#bsdinstall-part-manual-splitfs>`__
4.1. `Namen von Platten, Slices und
Partitionen <disk-organization.html#basics-disk-slice-part>`__
4.2. `Aufteilung einer
Festplatte <disk-organization.html#basics-concept-disk-model>`__
5.1. `Download vor Installation eines
Pakets <packages-using.html#idp71033552>`__
12.1. `Erstellen einer
Swap-Datei <adding-swap-space.html#idp76897104>`__
13.1. ```boot0``-Screenshot <boot-blocks.html#boot-boot0-example>`__
13.2. ```boot2``-Screenshot <boot-blocks.html#boot-boot2-example>`__
13.3. `Auf insecure gesetzte Konsole in
``/etc/ttys`` <boot-init.html#boot-insecure-console>`__
14.1. `Einen Benutzer unter FreeBSD
anlegen <users-modifying.html#idp77829200>`__
14.2. `Interaktives L?schen von Account mit
``rmuser`` <users-modifying.html#idp77860048>`__
14.3. `Interaktives ``chpass`` des
Superusers <users-modifying.html#idp77869136>`__
14.4. `Interaktives ``chpass`` eines normalen
Benutzers <users-modifying.html#idp77899856>`__
14.5. `Wechseln des Passworts <users-modifying.html#idp77920336>`__
14.6. `Als Superuser das Passwort eines anderen Accounts
ver?ndern <users-modifying.html#idp77927248>`__
14.7. `Setzen der Mitgliederliste einer Gruppe mit
pw(8) <users-groups.html#idp78052432>`__
14.8. `Ein Gruppenmitglied mit ``pw``
hinzuf?gen <users-groups.html#idp78058576>`__
14.9. `Hinzuf?gen eines neuen Gruppenmitglieds mittels
pw(8) <users-groups.html#idp78065872>`__
14.10. `Mit ``id`` die Gruppenzugeh?rigkeit
bestimmen <users-groups.html#idp78069968>`__
15.1. `Mit SSH einen sicheren Tunnel f?r SMTP
erstellen <openssh.html#idp79167824>`__
19.1. ```dump`` mit ssh benutzen <backup-basics.html#idp81622096>`__
19.2. ```dump`` ?ber ssh mit gesetzter ``RSH``
benutzen <backup-basics.html#idp81629776>`__
19.3. `Einh?ngen eines existierenden Abbildes unter
FreeBSD <disks-virtual.html#idp81761232>`__
19.4. `Erstellen eines dateibasierten Laufwerks mit
``mdconfig`` <disks-virtual.html#idp81764944>`__
19.5. `Mit ``mdmfs`` ein dateibasiertes Dateisystem
erstellen <disks-virtual.html#idp81787088>`__
19.6. `Erstellen eines speicherbasierten Laufwerks mit
``mdconfig`` <disks-virtual.html#idp81800912>`__
19.7. `Erstellen eines speicherbasierten Laufwerks mit
``mdmfs`` <disks-virtual.html#idp81805264>`__
20.1. `Die Partitionen einer Bootplatte
labeln <geom-glabel.html#idp82649808>`__
28.1. `Eintr?ge in ``/etc/ttys`` hinzuf?gen <term.html#ex-etc-ttys>`__
30.1. `Konfigurieren der sendmail
Zugriffsdatenbank <sendmail.html#idp88640208>`__
30.2. `E-Mail Aliases <sendmail.html#idp88647248>`__
30.3. `Beispiel einer virtuellen Dom?nen
Zuordnung <sendmail.html#idp88683984>`__
31.1. `Die inetd-Konfiguration neu
einlesen <network-inetd.html#network-inetd-reread>`__
31.2. `Ein exportiertes Dateisystem mit amd in den Verzeichnisbaum
einh?ngen <network-nfs.html#idp89521104>`__
31.3. `Django mit Apache2, mod\_python3, und PostgreSQL
installieren <network-apache.html#network-www-django-install>`__
31.4. `Apache-Konfiguration f?r
Django/mod\_python <network-apache.html#network-www-django-apache-config>`__
33.1. `LACP Aggregation mit einem Switch von
Cisco? <network-aggregation.html#networking-lacp-aggregation-cisco>`__
33.2. `Ausfallsicherer
Modus <network-aggregation.html#networking-lagg-failover>`__
33.3. `Failover Modus zwischen Ethernet- und
Wireless-Schnittstellen <network-aggregation.html#networking-lagg-wired-and-wireless>`__
33.4. `Kleines Netzwerk (Privatnetz) <network-isdn.html#idp93477584>`__
33.5. `Gro?es Netzwerk (Firmennetz) <network-isdn.html#idp93487440>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----+-----+-------------------------------------+
| ?   | ?   | ?\ `Weiter <book-preface.html>`__   |
+-----+-----+-------------------------------------+
| ?   | ?   | ?Vorwort                            |
+-----+-----+-------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
