=============================
13.2. Das Problem des Bootens
=============================

.. raw:: html

   <div class="navheader">

13.2. Das Problem des Bootens
`Zur?ck <boot.html>`__?
Kapitel 13. FreeBSDs Bootvorgang
?\ `Weiter <boot-blocks.html>`__

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

13.2. Das Problem des Bootens
-----------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn der Computer eingeschaltet wird und das Betriebssystem gestartet
werden soll, entsteht ein interessantes Dilemma, denn der Computer wei?
per Definition nicht, wie er irgendetwas tut, bis das Betriebssystem
gestartet wurde. Das schlie?t das Starten von Programmen, die sich auf
der Festplatte befinden, ein. Wenn nun der Computer kein Programm von
der Festplatte starten kann, sich das Betriebssystem aber dummerweise
genau dort befindet, wie wird es dann gestartet?

Dieses Problem ?hnelt einer Geschichte des Barons von M?nchhausen. Dort
war eine Person in einen Sumpf gefallen und hat sich selbst an den
Riemen seiner Stiefel (engl. *bootstrap*) herausgezogen. In den jungen
Jahren des Computerzeitalters wurde mit dem Begriff Bootstrap dann die
Technik das Betriebssystem zu laden bezeichnet und wurde hinterher mit
booten abgek?rzt.

Auf x86-Plattformen ist das BIOS (Basic Input/Output System) daf?r
verantwortlich, das Betriebssystem zu laden. Dazu liest das BIOS den
Master Bootsektor (MBR; Master Boot Record) aus, der sich an einer
bestimmten Stelle auf der Festplatte/Diskette befinden muss. Das BIOS
kann den MBR selbstst?ndig laden und ausf?hren und geht davon aus, dass
dieser die restlichen Dinge, die f?r das Laden des Betriebssystems
notwendig sind, selbst oder mit Hilfe des BIOS erledigen kann.

Der Code innerhalb des MBRs wird f?r gew?hnlich als *Boot-Manager*
bezeichnet, insbesondere, wenn eine Interaktion mit dem Anwender
stattfindet. Ist dies der Fall, verwaltet der Boot-Manager zus?tzlichen
Code im ersten *Track* der Platte oder in Dateisystemen anderer
Betriebssysteme. (Boot-Manager werden manchmal auch als *Boot Loader*
bezeichnet, unter FreeBSD wird dieser Begriff aber f?r eine sp?tere
Phase des Systemstarts verwendet.) Zu den bekanntesten Boot-Managern
geh?ren boot0 (der auch als Boot Easy bekannte Standard-Boot-Manager von
FreeBSD), Grub, GAG, sowie LILO. (Von diesen Boot-Managern hat nur boot0
innerhalb des MBRs Platz.)

Falls nur ein Betriebssystem installiert ist, ist der Standard MBR
ausreichend. Dieser MBR sucht nach dem ersten bootbaren Slice (das dabei
als *active* gekennzeichnet ist) auf dem Laufwerk und f?hrt den dort
vorhandenen Code aus, um das restliche Betriebssystem zu laden. Der von
`fdisk(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fdisk&sektion=8>`__
in der Voreinstellung installierte MBR ist ein solcher MBR und basiert
auf ``/boot/mbr``.

Falls mehrere Betriebssysteme installiert sind, sollte man einen anderen
Boot-Manager installieren, der eine Liste der verf?gbaren
Betriebssysteme anzeigt und einen w?hlen l?sst, welches man booten
m?chte. Der n?chste Abschnitt beschreibt zwei Boot-Manager mit diesen
F?higkeiten.

Das restliche FreeBSD-Bootstrap-System ist in drei Phasen unterteilt.
Die erste Phase wird vom MBR durchgef?hrt, der gerade genug
Funktionalit?t besitzt um den Computer in einen bestimmten Status zu
verhelfen und die zweite Phase zu starten. Die zweite Phase f?hrt ein
wenig mehr Operationen durch und startet schlie?lich die dritte Phase,
die das Laden des Betriebssystems abschlie?t. Der ganze Prozess wird in
drei Phasen durchgef?hrt, weil der PC Standard die Gr??e der Programme,
die in Phase eins und zwei ausgef?hrt werden, limitiert. Durch das
Verketten der durchzuf?hrenden Aufgaben wird es FreeBSD m?glich, ein
sehr flexibles Ladeprogramm zu besitzen.

Als n?chstes wird der Kernel gestartet, der zun?chst nach Ger?ten sucht
und sie f?r den Gebrauch initialisiert. Nach dem Booten des Kernels
?bergibt dieser die Kontrolle an den Benutzer Prozess
`init(8) <http://www.FreeBSD.org/cgi/man.cgi?query=init&sektion=8>`__,
der erst sicherstellt, dass alle Laufwerke benutzbar sind und die
Ressourcen Konfiguration auf Benutzer Ebene startet. Diese wiederum
mountet Dateisysteme, macht die Netzwerkkarten f?r die Kommunikation mit
dem Netzwerk bereit und startet generell alle Prozesse, die auf einem
FreeBSD-System normalerweise beim Hochfahren gestartet werden.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------+-------------------------------+---------------------------------------+
| `Zur?ck <boot.html>`__?             | `Nach oben <boot.html>`__     | ?\ `Weiter <boot-blocks.html>`__      |
+-------------------------------------+-------------------------------+---------------------------------------+
| Kapitel 13. FreeBSDs Bootvorgang?   | `Zum Anfang <index.html>`__   | ?13.3. Boot-Manager und Boot-Phasen   |
+-------------------------------------+-------------------------------+---------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
