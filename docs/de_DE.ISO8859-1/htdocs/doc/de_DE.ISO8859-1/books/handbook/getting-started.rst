======================
Teil?I.?Erste Schritte
======================

.. raw:: html

   <div class="navheader">

Teil?I.?Erste Schritte
`Zur?ck <book-preface.html>`__?
?
?\ `Weiter <introduction.html>`__

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

Dieser Teil des FreeBSD-Handbuchs richtet sich an Benutzer und
Administratoren f?r die FreeBSD neu ist. Diese Kapitel

.. raw:: html

   <div class="itemizedlist">

-  geben Ihnen eine Einf?hrung in FreeBSD,

-  geleiten Sie durch den Installationsprozess,

-  erkl?ren Ihnen die Grundlagen von UNIX? Systemen,

-  zeigen Ihnen, wie Sie die F?lle der erh?ltlichen Anwendungen Dritter
   installieren und

-  f?hren Sie in X, der Benutzeroberfl?che von UNIX? Systemen ein. Es
   wird gezeigt, wie Sie den Desktop konfigurieren, um effektiver
   arbeiten zu k?nnen.

.. raw:: html

   </div>

Wir haben uns bem?ht, Referenzen auf weiter vorne liegende Textteile auf
ein Minimum zu beschr?nken, so dass Sie diesen Teil des Handbuchs ohne
viel Bl?ttern durcharbeiten k?nnen.

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Inhaltsverzeichnis

.. raw:: html

   </div>

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

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------+-------------------------------+-------------------------------------+
| `Zur?ck <book-preface.html>`__?   | ?                             | ?\ `Weiter <introduction.html>`__   |
+-----------------------------------+-------------------------------+-------------------------------------+
| Vorwort?                          | `Zum Anfang <index.html>`__   | ?Kapitel 1. Einleitung              |
+-----------------------------------+-------------------------------+-------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
