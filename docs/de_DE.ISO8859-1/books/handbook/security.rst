======================
Kapitel 15. Sicherheit
======================

.. raw:: html

   <div class="navheader">

Kapitel 15. Sicherheit
`Zur?ck <users-groups.html>`__?
Teil?III.?Systemadministration
?\ `Weiter <security-intro.html>`__

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

Kapitel 15. Sicherheit
----------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Viel von diesem Kapitel stammt aus der security(7) Manualpage von
Matthew Dillon.

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

15.1. ?bersicht
---------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dieses Kapitel bietet eine Einf?hrung in die Konzepte der
Systemsicherheit. Neben einigen Daumenregeln werden weiterf?hrende
Themen wie S/Key, OpenSSL und Kerberos diskutiert. Die meisten der hier
besprochenen Punkte treffen sowohl auf die Systemsicherheit sowie die
Internetsicherheit zu. Das Internet hat aufgeh?rt ein „friedlicher“ Ort
zu sein, an dem Sie nur nette Leute finden werden. Es ist unumg?nglich,
dass Sie Ihre Daten, Ihr geistiges Eigentum, Ihre Zeit und vieles mehr
vor dem Zugriff von Hackern sch?tzen.

FreeBSD besitzt eine Reihe von Werkzeugen und Mechanismen, um die
Integrit?t und die Sicherheit Ihrer Systeme und Netzwerke zu
gew?hrleisten.

Nachdem Sie dieses Kapitel durchgearbeitet haben, werden Sie:

.. raw:: html

   <div class="itemizedlist">

-  Grundlegende auf FreeBSD bezogene Sicherheitsaspekte kennen.

-  Die verschiedenen Verschl?sselungsmechanismen von FreeBSD, wie DES
   oder MD5, kennen.

-  Wissen, wie Sie ein Einmalpassw?rter zur Authentifizierung verwenden.

-  TCP-Wrapper f?r inetd einrichten k?nnen.

-  Wissen, wie Sie Kerberos5 unter FreeBSD einrichten.

-  Firewalls mit IPFW erstellen k?nnen.

-  Wissen, wie Sie IPsec konfigurieren und ein VPN zwischen
   FreeBSD/Windows? Systemen einrichten,

-  OpenSSH, FreeBSDs Implementierung von SSH, konfigurieren und benutzen
   k?nnen.

-  Portaudit anwenden k?nnen, um Softwarepakete Dritter, die Sie ?ber
   die Ports-Sammlung installieren, auf bekannte Sicherheitsl?cken hin
   zu ?berpr?fen.

-  Mit FreeBSD-Sicherheitshinweisen umgehen k?nnen.

-  Eine Vorstellung davon haben, was Prozess?berwachung (*Process
   Accounting*) ist und wie Sie diese Funktion unter FreeBSD aktivieren
   k?nnen.

.. raw:: html

   </div>

Bevor Sie dieses Kapitel lesen, sollten Sie

.. raw:: html

   <div class="itemizedlist">

-  Grundlegende Konzepte von FreeBSD und dem Internet verstehen.

.. raw:: html

   </div>

Dieses Buch behandelt weitere Sicherheitsthemen. Beispielsweise werden
vorgeschriebene Zugriffskontrollen in `Kapitel?17, *Verbindliche
Zugriffskontrolle* <mac.html>`__ und Firewalls in `Kapitel?32,
*Firewalls* <firewalls.html>`__ besprochen.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------+----------------------------------------------+---------------------------------------+
| `Zur?ck <users-groups.html>`__?   | `Nach oben <system-administration.html>`__   | ?\ `Weiter <security-intro.html>`__   |
+-----------------------------------+----------------------------------------------+---------------------------------------+
| 14.8. Gruppen?                    | `Zum Anfang <index.html>`__                  | ?15.2. Einf?hrung                     |
+-----------------------------------+----------------------------------------------+---------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
