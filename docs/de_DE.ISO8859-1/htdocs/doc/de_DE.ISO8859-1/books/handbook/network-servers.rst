==========================
Kapitel 31. Netzwerkserver
==========================

.. raw:: html

   <div class="navheader">

Kapitel 31. Netzwerkserver
`Zur?ck <mail-procmail.html>`__?
Teil?IV.?Netzwerke
?\ `Weiter <network-inetd.html>`__

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

Kapitel 31. Netzwerkserver
--------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

?berarbeitet von Murray Stokely.

.. raw:: html

   </div>

.. raw:: html

   <div>

?bersetzt von Johann Kois.

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

31.1. ?bersicht
---------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dieses Kapitel beschreibt einige der h?ufiger verwendeten
Netzwerkdienste auf UNIX?-Systemen. Beschrieben werden Installation und
Konfiguration sowie Test und Wartung verschiedener Netzwerkdienste.
Zus?tzlich sind im ganzen Kapitel Beispielkonfigurationsdateien
vorhanden, von denen Sie sicherlich profitieren werden.

Nachdem Sie dieses Kapitel gelesen haben, werden Sie

.. raw:: html

   <div class="itemizedlist">

-  Den inetd-Daemon konfigurieren k?nnen.

-  Wissen, wie man ein Netzwerkdateisystem einrichtet.

-  Einen *Network Information Server* einrichten k?nnen, um damit
   Benutzerkonten im Netzwerk zu verteilen.

-  Rechner durch Nutzung von DHCP automatisch f?r ein Netzwerk
   konfigurieren k?nnen.

-  In der Lage sein, einen *Domain Name Server* einzurichten.

-  Den Apache HTTP-Server konfigurieren k?nnen.

-  Wissen, wie man einen *File Transfer Protocol* (FTP)-Server
   einrichtet.

-  Mit Samba einen Datei- und Druckserver f?r Windows?-Clients
   konfigurieren k?nnen.

-  Unter Nutzung des NTP-Protokolls Datum und Uhrzeit synchronisieren
   sowie einen Zeitserver installieren k?nnen.

-  Wissen, wie man den Standard-Protokollierungsdienst, ``syslogd``,
   konfiguriert, um Protokolle von anderen Hosts zu akzeptieren.

.. raw:: html

   </div>

Bevor Sie dieses Kapitel lesen, sollten Sie

.. raw:: html

   <div class="itemizedlist">

-  Die Grundlagen der ``/etc/rc``-Skripte verstanden haben.

-  Mit der grundlegenden Netzwerkterminologie vertraut sein.

-  Wissen, wie man zus?tzliche Softwarepakete von Drittherstellern
   installiert (`Kapitel?5, *Installieren von Anwendungen: Pakete und
   Ports* <ports.html>`__).

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------+----------------------------------------------+--------------------------------------+
| `Zur?ck <mail-procmail.html>`__?       | `Nach oben <network-communication.html>`__   | ?\ `Weiter <network-inetd.html>`__   |
+----------------------------------------+----------------------------------------------+--------------------------------------+
| 30.14. E-Mails mit procmail filtern?   | `Zum Anfang <index.html>`__                  | ?31.2. Der inetd „Super-Server“      |
+----------------------------------------+----------------------------------------------+--------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
