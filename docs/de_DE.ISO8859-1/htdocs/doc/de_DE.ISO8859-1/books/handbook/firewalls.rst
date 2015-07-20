=====================
Kapitel 32. Firewalls
=====================

.. raw:: html

   <div class="navheader">

Kapitel 32. Firewalls
`Zur?ck <network-syslogd.html>`__?
Teil?IV.?Netzwerke
?\ `Weiter <firewalls-concepts.html>`__

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

Kapitel 32. Firewalls
---------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Beigetragen von Joseph J. Barbish.

.. raw:: html

   </div>

.. raw:: html

   <div>

Nach SGML konvertiert und aktualisiert von Brad Davis.

.. raw:: html

   </div>

.. raw:: html

   <div>

?bersetzt von Michael Bunzel, Johann Kois und Benjamin Lukas.

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

`32.1. Einf?hrung <firewalls.html#firewalls-intro>`__
`32.2. Firewallkonzepte <firewalls-concepts.html>`__
`32.3. Firewallpakete <firewalls-apps.html>`__
`32.4. Paket Filter (PF) von OpenBSD und ALTQ <firewalls-pf.html>`__
`32.5. Die IPFILTER-Firewall (IPF) <firewalls-ipf.html>`__
`32.6. IPFW <firewalls-ipfw.html>`__

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

32.1. Einf?hrung
----------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Firewalls erm?glichen es, den ein- und ausgehenden Netzwerkverkehr Ihres
Systems zu filtern. Dazu verwendet eine Firewall eine oder mehrere
Gruppen von „Regeln“, um ankommende Netzwerkpakete zu untersuchen und
entweder durchzulassen oder zu blockieren. Die Regeln einer Firewall
untersuchen charakteristische Eigenschaften von Datenpaketen, darunter
den Protokolltyp, die Quell- und Zieladresse sowie den Quell- und
Zielport.

Firewalls k?nnen die Sicherheit eines Rechners oder eines Netzwerks
erh?hen, indem sie folgende Aufgaben ?bernehmen:

.. raw:: html

   <div class="itemizedlist">

-  Den Schutz der Anwendungen, Dienste und Rechner Ihres internen
   Netzwerks vor unerw?nschtem Datenverkehr aus dem Internet.

-  Die Beschr?nkung des Zugriffs von Rechnern des internen Netzwerk auf
   Rechner oder Dienste des externen Internets.

-  Den Einsatz von Network Address Translation (NAT), die es Ihnen durch
   die Verwendung von privaten IP-Adressen erm?glicht, eine einzige
   gemeinsame Internetverbindung f?r mehrere Rechner zu nutzen (entweder
   ?ber eine einzige Adresse oder ?ber eine Gruppe von jeweils
   automatisch zugewiesenen ?ffentlichen IP-Adressen).

.. raw:: html

   </div>

Nachdem Sie dieses Kapitel gelesen haben, werden Sie:

.. raw:: html

   <div class="itemizedlist">

-  Wissen, wie man korrekte Paketfilterregeln erstellt.

-  Die Unterschiede zwischen den in FreeBSD eingebauten Firewalls
   kennen.

-  Wissen, wie man die PF-Firewall von OpenBSD konfiguriert und
   einsetzt.

-  IPFILTER konfigurieren und einsetzen k?nnen.

-  Wissen, wie man IPFW konfiguriert und einsetzt.

.. raw:: html

   </div>

Bevor Sie dieses Kapitel lesen, sollten Sie:

.. raw:: html

   <div class="itemizedlist">

-  Die grundlegenden Konzepte von FreeBSD und dem Internet verstehen.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------------------------------+----------------------------------------------+-------------------------------------------+
| `Zur?ck <network-syslogd.html>`__?                              | `Nach oben <network-communication.html>`__   | ?\ `Weiter <firewalls-concepts.html>`__   |
+-----------------------------------------------------------------+----------------------------------------------+-------------------------------------------+
| 31.11. Protokollierung von anderen Hosts mittels ``syslogd``?   | `Zum Anfang <index.html>`__                  | ?32.2. Firewallkonzepte                   |
+-----------------------------------------------------------------+----------------------------------------------+-------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
