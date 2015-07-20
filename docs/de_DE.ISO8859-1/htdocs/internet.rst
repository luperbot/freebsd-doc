============================
FreeBSDs Netzwerkf?higkeiten
============================

.. raw:: html

   <div id="containerwrap">

.. raw:: html

   <div id="container">

`Skip site navigation <#content>`__ (1) `Skip section
navigation <#contentwrap>`__ (2)

.. raw:: html

   <div id="headercontainer">

.. raw:: html

   <div id="header">

Header und Logo
---------------

.. raw:: html

   <div id="headerlogoleft">

|FreeBSD|

.. raw:: html

   </div>

.. raw:: html

   <div id="headerlogoright">

Externe Links
-------------

.. raw:: html

   <div id="searchnav">

.. raw:: html

   </div>

.. raw:: html

   <div id="search">

.. raw:: html

   <div>

Suche
-----

.. raw:: html

   <div>

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div id="menu">

-  `Startseite <./>`__

-  `?ber FreeBSD <./about.html>`__

   -  `F?r Einsteiger <./projects/newbies.html>`__
   -  `Eigenschaften <./features.html>`__
   -  `Advocacy <./../advocacy/>`__
   -  `Marketing <./../marketing/>`__
   -  `Privacy Policy <./../privacy.html>`__

-  `Bezugsquellen <./where.html>`__

   -  `Release Information <./releases/>`__
   -  `Release Engineering <./../releng/>`__

-  `Dokumentation <./docs.html>`__

   -  `FAQ <./../doc/de_DE.ISO8859-1/books/faq/>`__
   -  `Handbuch <./../doc/de_DE.ISO8859-1/books/handbook/>`__
   -  `Porter-Handbuch <./../doc/de_DE.ISO8859-1/books/porters-handbook>`__
   -  `Entwickler-Handbuch <./../doc/de_DE.ISO8859-1/books/developers-handbook>`__
   -  `Manualpages <//www.FreeBSD.org/cgi/man.cgi>`__

-  `Community <./community.html>`__

   -  `Mailinglisten <./community/mailinglists.html>`__
   -  `Forum <http://forums.freebsd.org>`__
   -  `User Groups <./../usergroups.html>`__
   -  `Events <./../events/events.html>`__

-  `Entwicklung <./../projects/index.html>`__

   -  `Projektideen <http://wiki.FreeBSD.org/IdeasPage>`__
   -  `SVN-Repository <http://svnweb.FreeBSD.org>`__
   -  `Perforce-Repository <http://p4web.FreeBSD.org>`__

-  `Hilfe <./support.html>`__

   -  `Kommerzieller Support <./../commercial/commercial.html>`__
   -  `Sicherheit <./../security/>`__
   -  `Problemberichte <//www.FreeBSD.org/cgi/query-pr-summary.cgi>`__
   -  `Problembericht erstellen <./send-pr.html>`__

-  `Foundation <http://www.freebsdfoundation.org/>`__

   -  `Geldspende <http://www.freebsdfoundation.org/donate/>`__
   -  `Hardwarespende <./../donations/>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div id="content">

.. raw:: html

   <div id="sidewrap">

.. raw:: html

   <div id="sidenav">

Navigation-Men?
---------------

-  `?ber FreeBSD <./about.html>`__
-  `Eigenschaften <./features.html>`__
-  `Anwendungen <./applications.html>`__
-  `Netzwerkfunktionen <./internet.html>`__
-  `FreeBSD bewerben <./../advocacy/>`__
-  `Marketing <./../marketing/>`__
-  `Administration <./administration.html>`__
-  `Neuigkeiten <./news/newsflash.html>`__
-  `Veranstaltungen <./../events/events.html>`__
-  `Aus der Presse <./news/press.html>`__
-  `Multimedia <./../multimedia/multimedia.html>`__
-  `Kunst <./art.html>`__
-  `Logo <./logo.html>`__
-  `Spenden <./../donations/>`__
-  `Rechtliches <./../copyright/>`__
-  `Privacy Policy <./../privacy.html>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div id="contentwrap">

FreeBSDs Netzwerkf?higkeiten
============================

FreeBSD wurde f?r das Internet entworfen
----------------------------------------

FreeBSD enth?lt nach Meinung Vieler die *Referenz*-Implementierung der
TCP/IP Software, n?mlich den 4.4BSD Protokoll-Stack. Daher ist FreeBSD
geradezu f?r Netzwerk-Anwendungen und das Internet geschaffen.

FreeBSD unterst?tzt die Standard-TCP/IP Protokolle.
---------------------------------------------------

Wie die meisten UNIX? Systeme erlaubt FreeBSD Ihnen,

-  Dateisysteme mit NFS gemeinsam zu nutzen.
-  Netzwerkinformationen mit NIS zu verteilen.
-  sich in entfernte Rechner einzuloggen ("Remote login").
-  mit SNMP entfernte Rechner zu konfigurieren und zu administrieren.
-  Dateien via FTP bereitzustellen.
-  Internet Hostnamen mit DNS/BIND aufzul?sen.
-  Pakete zwischen verschiedenen Netzwerk-Interfaces zu routen,
   einschlie?lich PPP und SLIP.
-  IP Multicast Dienste ("MBONE") zu benutzen.

FreeBSD erlaubt es Ihnen, einen PC in einen World Wide Web Server oder
Usenet-News Server zu verwandeln. Mit SAMBA k?nnen Sie Dateisysteme und
Drucker mit Microsoft? Windows?-Rechnern gemeinsam benutzen und mit dem
enthaltenen PCNFS-Daemon, der Benutzer authentifiziert, unterst?tzen Sie
entfernte Rechner mit PC/NFS. Alles, was Sie hierf?r ben?tigen, ist
bereits in FreeBSD enthalten. FreeBSD unterst?tzt au?erdem Appletalk und
Novell Client/Server Netzwerke (mittels eines `optionalen, kommerziellen
Paketes <http://www.netcon.com/>`__), was es zu einer echten
"Intranet"-Netzwerkl?sung macht.

FreeBSD behandelt TCP-Erweiterungen wie die
`RFC-1323 <http://www.ietf.org/rfc/rfc1323.txt>`__-
Hochgeschwindigkeits-Erweiterung sowie SLIP und dial-on-demand PPP. Es
ist ein Betriebssystem f?r den Heimanwender gleicherma?en wie f?r den
Systemadministrator eines Unternehmens.

FreeBSDs Netzwerkimplementierung ist stabil und schnell.
--------------------------------------------------------

Wenn Sie einen Internet-Server ben?tigen, der zuverl?ssig ist und
gleichzeitig h?chste Geschwindigkeit unter Extremlast zeigen soll, dann
sollten Sie FreeBSD in Betracht ziehen. Hier ist nur eine kurze Liste
von Unternehmen, die FreeBSD jeden Tag benutzen:

-  Walnut Creek CD-ROM betrieb jahrelang einen der beliebtesten
   FTP-Server auf dem Internet (ftp.cdrom.com). Der Server, eine
   einzelne FreeBSD-Maschine, konnte 6000 gleichzeitige Verbindungen
   handhaben und ?bertrug jeden Monat mehr als 30?Terabytes Daten
   (Stand: Juni?1999; Ja – Terabytes) an mehr als 10?Millionen Menschen.
-  `Yahoo Inc. <http://www.yahoo.com/>`__ betreibt den besten Index des
   Internets und versorgt t?glich viele Surfer mit Informationen ?ber
   das World Wide Web. Yahoo verl?sst sich, genauso wie die Unternehmen,
   die bei Yahoo werben, auf FreeBSD, um stabile und schnelle Webserver
   zu betreiben.
-  `Netcraft <http://www.netcraft.com/>`__ untersucht Marktanteile von
   Webservern auf dem Internet. Die Webseiten des Unternehmens werden
   mit FreeBSD und Apache betrieben. Die Statistiken werden mithilfe von
   FreeBSD und Perl erhoben.

FreeBSD stellt eine ideale Plattform f?r die folgenden und andere
Internet-Dienste dar:

-  Unternehmens- oder weltweite WWW-Dienste.
-  Proxy WWW Dienste.
-  Anonyme FTP?Dienste.
-  Enterprise Datei-, Druck- und Mail-Dienste.

Die FreeBSD `Ports-Collection <./../ports/index.html>`__ ist eine
Sammlung von gebrauchsfertiger Software, die es Ihnen einfach macht,
einen eigenen Internetserver zu installieren.

Hohe Geschwindigkeit *und* Sicherheit.
--------------------------------------

Die FreeBSD-Entwickler legen genauso viel Wert auf Sicherheit wie auf
Geschwindigkeit. FreeBSD enth?lt Kernel-Unterst?tzung f?r IP-Firewalls
sowie andere Dienste, wie IP Proxy Gateways. Jeder Computer mit FreeBSD
kann als Netzwerk-Firewall dienen und den Webauftritt Ihres Unternehmens
gegen Attacken aus dem Internet sch?tzen.

Verschl?sselungs-Software, sichere Shells, Kerberos, end-to-end
Verschl?sselung und sichere RPC F?higkeiten sind ebenso verf?gbar
(allerdings unter Beachtung der Export-Restriktionen).

Weiterhin ist das FreeBSD-Team sehr aktiv, Sicherheitsl?cher zu finden
und zu beseitigen. F?r Sicherheits-Informationen und Bug reports gibt es
einen `security officer <mailto:security-officer@FreeBSD.org>`__, der in
Verbindung zum Computer Emergency Response Team
(`CERT <http://www.cert.org/>`__) steht.

Was Experten sagen: ...
-----------------------

*\`\`FreeBSD ... provides what is probably the most robust and capable
TCP/IP stack in existence ...''*

.. raw:: html

   <div align="right">

---Michael O'Brien, *SunExpert* August 1996 volume 7 number 8.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div id="footer">

`Sitemap <./../search/index-site.html>`__ \| `Legal
Notices <./../copyright/>`__ \| ? 1995–2015 The FreeBSD Project. Alle
Rechte vorbehalten.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. |FreeBSD| image:: ./../layout/images/logo-red.png
   :target: .
