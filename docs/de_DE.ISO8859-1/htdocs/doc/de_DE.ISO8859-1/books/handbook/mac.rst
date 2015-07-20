==========================================
Kapitel 17. Verbindliche Zugriffskontrolle
==========================================

.. raw:: html

   <div class="navheader">

Kapitel 17. Verbindliche Zugriffskontrolle
`Zur?ck <jails-application.html>`__?
Teil?III.?Systemadministration
?\ `Weiter <mac-inline-glossary.html>`__

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

Kapitel 17. Verbindliche Zugriffskontrolle
------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Written by Tom Rhodes.

.. raw:: html

   </div>

.. raw:: html

   <div>

?bersetzt von Benjamin Lukas.

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

17.1. ?bersicht
---------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In FreeBSD?5.X wurden neue Sicherheits-Erweiterungen verf?gbar, die aus
dem TrustedBSD-Projekt ?bernommen wurden und auf dem Entwurf POSIX?.1e
basieren. Die beiden bedeutendsten neuen Sicherheits-Mechanismen sind
Berechtigungslisten (Access Control Lists, ACL) und die verbindliche
Zugriffskontrolle (Mandatory Access Control, MAC). Durch die MAC k?nnen
Module geladen werden, die neue Sicherheitsrichtlinien bereitstellen.
Mit Hilfe einiger Module kann beispielsweise ein eng umgrenzter Bereich
des Betriebssystems gesichert werden, indem die Sicherheitsfunktionen
spezieller Dienste unterst?tzt bzw. verst?rkt werden. Andere Module
wiederum betreffen in ihrer Funktion das gesamte System - alle
vorhandenen Subjekte und Objekte. Das "Verbindliche" in der Namensgebung
erw?chst aus dem Fakt, dass die Kontrolle allein Administratoren und dem
System obliegt und nicht dem Ermessen der Nutzer, wie es mit Hilfe der
benutzerbestimmbaren Zugriffskontrolle (Discrectionary Access Control /
DAC), dem Zugriffstandard f?r Dateien, gar der System V IPC in FreeBSD,
normalerweise umgesetzt wird.

Dieses Kapitel wird sich auf die Grundstruktur der Verbindlichen
Zugriffskontrolle und eine Auswahl der Module, die verschiedenste
Sicherheitsfunktionen zur Verf?gung stellen, konzentrieren.

Beim Durcharbeiten dieses Kapitels erfahren Sie:

.. raw:: html

   <div class="itemizedlist">

-  Welche MAC Module f?r Sicherheitsrichtlinien derzeit in FreeBSD
   eingebettet sind und wie die entsprechenden Mechanismen
   funktionieren.

-  Was die einzelnen MAC Module an Funktionen realisieren und auch, was
   der Unterschied zwischen einer Richtlinie, die *mit* Labels arbeitet,
   und einer, die *ohne* Labels arbeitet, ist.

-  Wie Sie die MAC in ein System einbetten und effizient einrichten.

-  Wie die verschiedenen Richtlinienmodule einer MAC konfiguriert
   werden.

-  Wie mit einer MAC und den gezeigten Beispielen eine sicherere
   Umgebung erstellt werden kann.

-  Wie die Konfiguration einer MAC auf korrekte Einrichtung getestet
   wird.

.. raw:: html

   </div>

Vor dem Lesen dieses Kapitels sollten Sie bereits:

.. raw:: html

   <div class="itemizedlist">

-  Grundz?ge von UNIX? und FreeBSD verstanden haben. (`Kapitel?4,
   *Grundlagen des UNIX Betriebssystems* <basics.html>`__).

-  Mit den Grundz?gen der Kernelkonfiguration und -kompilierung vertraut
   sein (`Kapitel?9, *Konfiguration des
   FreeBSD-Kernels* <kernelconfig.html>`__).

-  Einige Vorkenntnisse ?ber Sicherheitskonzepte im Allgemeinen und
   deren Umsetzung in FreeBSD im Besonderen mitbringen (`Kapitel?15,
   *Sicherheit* <security.html>`__).

.. raw:: html

   </div>

.. raw:: html

   <div class="warning" xmlns="">

Warnung:
~~~~~~~~

Der unsachgem??e Gebrauch der in diesem Kapitel enthaltenen
Informationen kann den Verlust des Systemzugriffs, ?rger mit Nutzern
oder die Unf?higkeit, grundlegende Funktionen des X-Windows-Systems zu
nutzen, verursachen. Wichtiger noch ist, dass man sich nicht allein auf
die MAC verlassen sollte, um ein System zu sichern. Die MAC verbessert
und erg?nzt lediglich die schon existierenden Sicherheits-Richtlinien -
ohne eine gr?ndliche und fundierte Sicherheitspraxis und regelm??ige
Sicherheitspr?fungen wird Ihr System nie vollst?ndig sicher sein.

Au?erdem sollte angemerkt werden, dass die Beispiele in diesem Kapitel
auch genau dasselbe sein sollen, n?mlich Beispiele. Es wird nicht
empfohlen, diese bestimmten Beispiele auf einem Arbeitssystem
umzusetzen. Das Einarbeiten der verschiedenen Sicherheitsmodule
erfordert eine Menge Denkarbeit und viele Tests. Jemand, der nicht
versteht, wie diese Module funktionieren, kann sich schnell darin
wiederfinden, dass er (oder sie) das ganze System durchforsten und viele
Dateien und Verzeichnisse neu konfigurieren mu?.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

17.1.1. Was in diesem Kapitel nicht behandelt wird
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dieses Kapitel behandelt einen gro?en Teil sicherheitsrelevanter Themen,
bezogen auf die Verbindliche Zugriffskontrolle (MAC). Die gegenw?rtige
Entwicklung neuer MAC Module ist nicht abgedeckt. Einige weitere Module,
die im MAC Framework enthalten sind, haben besondere Charakteristika,
die zum Testen und Entwickeln neuer Module gedacht sind. Dies sind unter
anderem
`mac\_test(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_test&sektion=4>`__,
`mac\_stub(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_stub&sektion=4>`__
und
`mac\_none(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_none&sektion=4>`__.
F?r weitere Informationen zu diesen Modulen und den entsprechend
angebotenen Funktionen lesen Sie bitte die Manpages.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------+----------------------------------------------+--------------------------------------------+
| `Zur?ck <jails-application.html>`__?   | `Nach oben <system-administration.html>`__   | ?\ `Weiter <mac-inline-glossary.html>`__   |
+----------------------------------------+----------------------------------------------+--------------------------------------------+
| 16.6. Anwendung von Jails?             | `Zum Anfang <index.html>`__                  | ?17.2. Schl?sselbegriffe                   |
+----------------------------------------+----------------------------------------------+--------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
