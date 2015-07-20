======================================
2.7. Den Installationsumfang bestimmen
======================================

.. raw:: html

   <div class="navheader">

2.7. Den Installationsumfang bestimmen
`Zur?ck <install-steps.html>`__?
Kapitel 2. FreeBSD?8.\ *``X``* (und ?lter) installieren
?\ `Weiter <install-media.html>`__

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

2.7. Den Installationsumfang bestimmen
--------------------------------------

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

2.7.1. Die Distribution ausw?hlen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Welche Software Sie installieren, h?ngt haupts?chlich vom Zweck des
Rechners und dem zur Verf?gung stehenden Plattenplatz ab. Die
vorgegebenen Distributionen reichen von der minimalen Installation bis
hin zu einer kompletten Installation. Anf?nger sollten eine der
vorgegebenen Distributionen ausw?hlen, erfahrene Benutzer k?nnen die zu
installierende Distribution anpassen.

Die Taste **F1** f?hrt zu einem Hilfebildschirm, der die Distributionen
und deren Inhalte beschreibt. Dr?cken Sie **Enter**, um die Hilfe zu
verlassen und zur Auswahl der Distribution zur?ckzukehren.

Wenn Sie eine graphische Benutzeroberfl?che installieren wollen, m?ssen
Sie die Konfiguration des X-Servers und die Auswahl der
Benutzeroberfl?che nach erfolgreicher Installation durchf?hren. Die
Installation und Konfiguration des X-Servers wird in `Kapitel?6, *Das
X-Window-System* <x11.html>`__ besprochen.

Wenn Sie einen angepassten Kernel erstellen wollen, w?hlen Sie eine
Distribution aus, die den Quellcode (*source code*) enth?lt. Warum und
wie Sie einen angepassten Kernel erstellen, erfahren Sie in `Kapitel?9,
*Konfiguration des FreeBSD-Kernels* <kernelconfig.html>`__.

Nat?rlich ist das flexibelste System das, auf dem alles installiert ist.
Wenn das System ?ber ausreichend Plattenplatz verf?gt, w?hlen Sie mit
den Pfeiltasten die Option All aus (siehe `Abbildung?2.25, „Die
Distribution ausw?hlen“ <install-choosing.html#distribution-set1>`__)
und dr?cken die Taste **Enter**. Wenn Sie Bedenken haben, dass der
Plattenplatz nicht ausreicht, w?hlen Sie eine Distribution, die weniger
Software enth?lt. Machen Sie sich keine unn?tigen Sorgen um die richtige
Distribution, ausgelassene Distribution k?nnen sp?ter nachinstalliert
werden.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 2.25. Die Distribution ausw?hlen

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Die Distribution ausw?hlen|

.. raw:: html

   </div>

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

2.7.2. Die Ports-Sammlung installieren
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Nach der Auswahl der Distribution haben Sie Gelegenheit, die
FreeBSD-Ports-Sammlung zu installieren. Mit der Ports-Sammlung l?sst
sich Software Dritter auf einfache Art und Weise installieren. Der
Quellcode der zu installierenden Software ist nicht in der
Ports-Sammlung enthalten. Stattdessen enth?lt die Ports-Sammlung
Dateien, die den Installationsprozess (herunterladen, ?bersetzen und
installieren) automatisieren. Die Ports-Sammlung wird in `Kapitel?5,
*Installieren von Anwendungen: Pakete und Ports* <ports.html>`__
besprochen.

Der Installationsprozess pr?ft nicht, ob ausreichend Platz f?r die
Ports-Sammlung vorhanden ist. W?hlen Sie die Ports-Sammlung bitte nur
aus, wenn das System ?ber ausreichenden Platz verf?gt. In FreeBSD?10.1
nimmt die Ports-Sammlung ungef?hr 500?MB Plattenplatz in Anspruch.
Neuere Versionen von FreeBSD ben?tigen mit Sicherheit noch mehr Platz.

.. code:: screen

                             User Confirmation Requested
     Would you like to install the FreeBSD ports collection?

     This will give you ready access to over 24,000 ported software packages,
     at a cost of around 500?MB of disk space when "clean" and possibly much
     more than that if a lot of the distribution tarballs are loaded
     (unless you have the extra CDs from a FreeBSD CD/DVD distribution
     available and can mount it on /cdrom, in which case this is far less
     of a problem).

     The ports collection is a very valuable resource and well worth having
     on your /usr partition, so it is advisable to say Yes to this option.

     For more information on the ports collection & the latest ports,
     visit:
         http://www.FreeBSD.org/ports

                                  [ Yes ]     No

W?hlen Sie mit den Pfeiltasten [?Yes?] aus, um die Ports-Sammlung zu
installieren. W?hlen Sie [?No?] aus, um die Ports-Sammlung auszulassen.
Dr?cken Sie danach die Taste **Enter**, es erscheint wieder das
Distributionsmen?.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 2.26. Die Distributionen best?tigen

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Die Distributionen best?tigen|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn Sie mit den ausgew?hlten Optionen zufrieden sind, w?hlen Sie mit
den Pfeiltasten Exit aus (stellen Sie sicher, dass [?OK?] aktiv ist) und
dr?cken Sie die Taste **Enter**.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------------+--------------------------------+-------------------------------------------+
| `Zur?ck <install-steps.html>`__?               | `Nach oben <install.html>`__   | ?\ `Weiter <install-media.html>`__        |
+------------------------------------------------+--------------------------------+-------------------------------------------+
| 2.6. Plattenplatz f?r FreeBSD bereitstellen?   | `Zum Anfang <index.html>`__    | ?2.8. Das Installationsmedium ausw?hlen   |
+------------------------------------------------+--------------------------------+-------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.

.. |Die Distribution ausw?hlen| image:: install/dist-set.png
.. |Die Distributionen best?tigen| image:: install/dist-set2.png
