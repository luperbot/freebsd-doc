===========================
2.2. Hardware-Anforderungen
===========================

.. raw:: html

   <div class="navheader">

2.2. Hardware-Anforderungen
`Zur?ck <install.html>`__?
Kapitel 2. FreeBSD?8.\ *``X``* (und ?lter) installieren
?\ `Weiter <install-pre.html>`__

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

2.2. Hardware-Anforderungen
---------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

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

2.2.1. Minimalkonfiguration
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die zur Installation von FreeBSD erforderliche Minimalkonfiguration
h?ngt von der zu installierenden FreeBSD-Version sowie von der
Hardware-Architektur ab.

Informationen zur jeweiligen Minimalkonfiguration finden Sie in den
folgenden Abschnitten dieses Kapitels. Je nachdem, wie Sie FreeBSD
installieren, ben?tigen Sie eventuell auch ein Diskettenlaufwerk, ein
unterst?tztes CD-ROM-Laufwerk, oder auch eine Netzwerkkarte.
`Abschnitt?2.3.7, „Das Startmedium
vorbereiten“ <install-pre.html#install-boot-media>`__ des Handbuchs
enth?lt weitere Informationen zu den verschiedenen Installationsarten.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.2.1.1. Die FreeBSD/i386- und FreeBSD/pc98-Architekturen
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Sowohl FreeBSD/i386 als auch FreeBSD/pc98 ben?tigen jeweils mindestens
einen 486-Prozessor sowie mindestens 24?MB RAM. Au?erdem ben?tigen Sie
f?r eine Minimalinstallation mindestens 150?MB freien Platz auf Ihrer
Festplatte.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

In den meisten derartigen Konfigurationen ist es besser, f?r mehr RAM
und mehr Plattenplatz zu sorgen, statt einen schnelleren Prozessor
einzubauen.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.2.1.2. Die FreeBSD/amd64-Architektur
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Es gibt zwei Klassen von Prozessoren, auf denen Sie FreeBSD/amd64
ausf?hren k?nnen. Die erste Klasse bilden die AMD64-Prozessoren (zu
denen AMD?Athlon?64-, AMD?Athlon?64-FX-, oder AMD?Opteron-Prozessoren
geh?ren).

Die zweite Klasse von Prozessoren, auf denen Sie diese FreeBSD/amd64
einsetzen k?nnen, ist die Intel? EM64T-Architektur. Prozessoren dieser
Klasse sind beispielsweise Intel??Core™?2 Duo-, Quad-, und
Extreme-Prozessoren sowie die Intel??Xeon™-Prozessorreihen 3000, 5000,
und 7000.

Wenn Sie einen auf dem Chipsatz nVidia nForce3 Pro-150 basierenden
Rechner haben, *m?ssen* Sie im BIOS das IO-APIC deaktivieren. Erlaubt
ihr BIOS dies nicht, m?ssen Sie stattdessen ACPI deaktivieren. Der Grund
daf?r sind Fehler im Pro-150-Chipsatz, die bis jetzt nicht behoben
werden konnten.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.2.1.3. Die FreeBSD/sparc64-Architektur
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Um FreeBSD/sparc64 zu installieren, ben?tigen Sie eine unterst?tzte
Plattform (lesen Sie dazu auch `Abschnitt?2.2.2, „Unterst?tzte
Hardware“ <install-hardware.html#install-hardware-supported>`__ des
Handbuchs).

Sie ben?tigen au?erdem eine seperate Festplatte, wenn Sie
FreeBSD/sparc64 installieren wollen, da es derzeit leider noch nicht
m?glich ist, die Platte mit einem weiteren Betriebssystem zu teilen.

.. raw:: html

   </div>

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

2.2.2. Unterst?tzte Hardware
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Hardware-Notes, die mit jedem FreeBSD-Release ausgeliefert werden,
enthalten eine Liste lauff?higer Hardware. Die Hardware-Notes befinden
sich ?blicherweise in der Datei ``HARDWARE.TXT`` im Wurzelverzeichnis
der Distribution (CD-ROM oder FTP). Sie k?nnen die Hardware-Notes
au?erdem im Dokumentationsmen? von sysinstall oder auf der Webseite
`Release Information <../../../../de/releases/index.html>`__ lesen.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------------------------+--------------------------------+------------------------------------+
| `Zur?ck <install.html>`__?                                 | `Nach oben <install.html>`__   | ?\ `Weiter <install-pre.html>`__   |
+------------------------------------------------------------+--------------------------------+------------------------------------+
| Kapitel 2. FreeBSD?8.\ *``X``* (und ?lter) installieren?   | `Zum Anfang <index.html>`__    | ?2.3. Vor der Installation         |
+------------------------------------------------------------+--------------------------------+------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
