=====================================
2.12. Anspruchsvollere Installationen
=====================================

.. raw:: html

   <div class="navheader">

2.12. Anspruchsvollere Installationen
`Zur?ck <install-trouble.html>`__?
Kapitel 2. FreeBSD?8.\ *``X``* (und ?lter) installieren
?\ `Weiter <install-diff-media.html>`__

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

2.12. Anspruchsvollere Installationen
-------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Beigetragen von Valentino Vaschetto.

.. raw:: html

   </div>

.. raw:: html

   <div>

Aktualisiert von Marc Fonvieille.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dieser Abschnitt beschreibt die Installation von FreeBSD in besonderen
Situationen.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.12.1. FreeBSD auf einem System ohne Monitor oder Tastatur installieren
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Diese Methode wird als „headless install“ (kopflose Installation)
bezeichnet, da die Maschine, auf die FreeBSD installiert werden soll,
entweder keinen Monitor angeschlossen hat oder ?ber keine VGA-Karte
verf?gt. Wie kann FreeBSD dennoch installiert werden? Eben mithilfe
einer seriellen Konsole. Im Wesentlichen ist eine serielle Konsole eine
andere Maschine, die Ein- und Ausgaben f?r eine andere Maschine
bereitstellt. Um ?ber eine serielle Konsole zu installieren, erstellen
Sie zun?chst (wie in `Abschnitt?2.3.7, „Das Startmedium
vorbereiten“ <install-pre.html#install-boot-media>`__ beschrieben) einen
bootbaren USB-Stick oder laden Sie das passende CD-ISO-Abbild herunter.

Um von diesen Medien in eine serielle Konsole booten zu k?nnen, m?ssen
Sie die folgenden Schritte durchf?hren (bei Verwendung einer Boot-CD
kann der erste Schritt entfallen):

.. raw:: html

   <div class="procedure">

#. **Den USB-Stick f?r eine serielle Konsole anpassen**

   Wenn Sie ein System mit den frisch erstellten USB-Stick starten,
   l?uft der normale FreeBSD-Installationsprozess an. Diese Installation
   soll aber ?ber die serielle Konsole gesteuert werden. Daher m?ssen
   Sie den USB-Stick mit dem Befehl
   `mount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount&sektion=8>`__
   in den Verzeichnisbaum einh?ngen:

   .. code:: screen

       # mount /dev/da0a /mnt

   .. raw:: html

      <div class="note" xmlns="">

   Anmerkung:
   ~~~~~~~~~~

   Passen Sie den Mountpunkt und die Ger?tedatei falls n?tig an Ihre
   Gegebenheiten an.

   .. raw:: html

      </div>

   Nachdem Sie den USB-Stick eingeh?ngt haben, m?ssen Sie ihn
   rekonfigurieren, damit er in eine serielle Konsole startet. Dazu
   nehmen Sie in die Datei ``loader.conf`` des USB-Sticks eine Zeile
   auf, die die serielle Konsole als Systemkonsole festlegt:

   .. code:: screen

       # echo 'console="comconsole"' >> /mnt/boot/loader.conf

   Damit ist Ihr USB-Stick f?r die Installation vorbereitet. Sie k?nnen
   ihn daher wieder aus dem Dateisystem aush?ngen:

   .. code:: screen

       # umount /mnt

   Entfernen Sie nun den USB-Stick und machen Sie direkt mit Schritt 3
   weiter.

#. **Die Installations-CD f?r eine serielle Konsole anpassen**

   Wenn Sie von dem soeben heruntergeladenen CD-ISO-Abbild (siehe
   `Abschnitt?2.13.1, „Eine Installations-CD-ROM
   erzeugen“ <install-diff-media.html#install-cdrom>`__) starten,
   gelangen Sie in den normalen Installationsmodus von FreeBSD. Da wir
   aber in eine serielle Konsole booten wollen, muss das CD-Image
   extrahiert, modifiziert und neu erzeugt werden, bevor Sie es auf eine
   CD-R brennen.

   Entpacken Sie alle Dateien des CD-ISO-Abbilds (beispielsweise
   ``FreeBSD-10.1-RELEASE-i386-disc1.iso``) auf dem System, auf das Sie
   das Abbild heruntergeladen haben unter Verwendung von
   `tar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tar&sektion=1>`__:

   .. code:: screen

       # mkdir /path/to/headless-iso
       # tar -C /path/to/headless-iso -pxvf FreeBSD-10.1-RELEASE-i386-disc1.iso

   Nun m?ssen Sie das entpackte ISO-Abbild rekonfigurieren, damit es
   k?nftig in eine serielle Konsole startet. Dazu nehmen Sie in die
   Datei ``loader.conf`` des entpackten ISO-Abbild eine Zeile auf, die
   die serielle Konsole als Systemkonsole festlegt:

   .. code:: screen

       # echo 'console="comconsole"' >> /path/to/headless-iso/boot/loader.conf

   Damit ist der Dateibaum des entpackten ISO-Abbilds f?r die
   Installation vorbereitet und Sie k?nnen ?ber den Befehl
   `mkisofs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mkisofs&sektion=8>`__
   (das Sie ?ber den Port
   `sysutils/cdrtools <http://www.freebsd.org/cgi/url.cgi?ports/sysutils/cdrtools/pkg-descr>`__
   installieren k?nnen) ein neues CD-ISO-Abbild erzeugen:

   .. code:: screen

       # mkisofs -v -b boot/cdboot -no-emul-boot -r -J -V "Headless_install" \
               -o Headless-FreeBSD-10.1-RELEASE-i386-disc1.iso /path/to/headless-iso

   Dieses rekonfigurierte ISO-Abbild brennen Sie nun mit dem
   Brennprogramm Ihrer Wahl auf eine CD-R.

#. **Das Nullmodemkabel anschlie?en**

   Sie m?ssen beide Maschinen mit einem
   `Nullmodemkabel <serial.html#term-cables-null>`__ verbinden.
   Schlie?en Sie das Nullmodemkabel an die seriellen Schnittstellen
   beider Maschinen an. *Sie k?nnen kein direktes serielles Kabel
   verwenden*, Nullmodemkabel besitzen gekreuzte Leitungen.

#. **Die Installation starten**

   Sie k?nnen die Installation jetzt starten. St?pseln Sie den
   vorbereiteten USB-Stick ein und starten Sie Ihren Computer.
   Alternativ starten Sie Ihren Computer und legen die vorbereitete
   Installations-CD ein.

#. **Die Verbindung mit der zur installierenden Maschine herstellen**

   Mit dem Kommando
   `cu(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cu&sektion=1>`__
   verbinden Sie sich mit der zu installierenden Maschine:

   .. code:: screen

       # cu -l /dev/cuau0

   Unter FreeBSD?7.X verwenden Sie hingegen den folgenden Befehl:

   .. code:: screen

       # cu -l /dev/cuad0

.. raw:: html

   </div>

Fertig! ?ber die ``cu``-Sitzung k?nnen Sie nun die zu installierende
Maschine steuern. Der Kernel wird automatisch geladen und Sie k?nnen
anschlie?end den Terminaltyp festlegen. W?hlen Sie die
``FreeBSD color console`` aus und fahren wie gewohnt mit der
Installation fort.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+--------------------------------+------------------------------------------------+
| `Zur?ck <install-trouble.html>`__?   | `Nach oben <install.html>`__   | ?\ `Weiter <install-diff-media.html>`__        |
+--------------------------------------+--------------------------------+------------------------------------------------+
| 2.11. Fehlersuche?                   | `Zum Anfang <index.html>`__    | ?2.13. Eigene Installationsmedien herstellen   |
+--------------------------------------+--------------------------------+------------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
