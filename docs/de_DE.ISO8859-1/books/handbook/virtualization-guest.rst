=====================================
24.2. FreeBSD als Gast-Betriebssystem
=====================================

.. raw:: html

   <div class="navheader">

24.2. FreeBSD als Gast-Betriebssystem
`Zur?ck <virtualization.html>`__?
Kapitel 24. Virtualisierung
?\ `Weiter <virtualization-host.html>`__

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

24.2. FreeBSD als Gast-Betriebssystem
-------------------------------------

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

24.2.1. Parallels unter MacOS?X
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Parallels Desktop f?r Mac? ist ein kommerzielles Softwareprodukt,
welches f?r Intel?-basierende Apple? Mac?-Computer mit Mac?OS??X?10.4.6
oder h?her verf?gbar ist. FreeBSD wird von diesem Softwarepaket als
Gast-Betriebssystem vollst?ndig unterst?tzt. Nach der Installation von
Parallels auf Mac?OS??X konfigurieren Sie als erstes eine virtuelle
Maschine, in der Sie danach das gew?nschte Gast-Betriebssystem (in
unserem Fall FreeBSD) installieren.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

24.2.1.1. Installation von FreeBSD unter Parallels/Mac?OS??X
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Der erste Schritt bei der Installation von FreeBSD unter
Parallels/Mac?OS??X ist es, eine virtuelle Maschine zu konfigurieren, in
der Sie FreeBSD installieren k?nnen. Dazu w?hlen Sie bei der Frage nach
dem Guest OS Type FreeBSD aus:

.. raw:: html

   <div class="mediaobject">

|image0|

.. raw:: html

   </div>

Danach legen Sie geeignete Gr??en f?r Festplatten- und Arbeitsspeicher
f?r die zu erstellende FreeBSD-Instanz fest. 4?GB Plattenplatz sowie
512?MB RAM sind in der Regel f?r die Arbeit unter Parallels ausreichend:

.. raw:: html

   <div class="mediaobject">

|image1|

.. raw:: html

   </div>

.. raw:: html

   <div class="mediaobject">

|image2|

.. raw:: html

   </div>

.. raw:: html

   <div class="mediaobject">

|image3|

.. raw:: html

   </div>

.. raw:: html

   <div class="mediaobject">

|image4|

.. raw:: html

   </div>

W?hlen Sie den gew?nschten Netzwerktyp aus und konfigurieren Sie Ihre
Netzwerkverbindung:

.. raw:: html

   <div class="mediaobject">

|image5|

.. raw:: html

   </div>

.. raw:: html

   <div class="mediaobject">

|image6|

.. raw:: html

   </div>

Speichern Sie Ihre Eingaben, um die Konfiguration abzuschlie?en:

.. raw:: html

   <div class="mediaobject">

|image7|

.. raw:: html

   </div>

.. raw:: html

   <div class="mediaobject">

|image8|

.. raw:: html

   </div>

Nachdem Sie die virtuelle Maschine erstellt haben, installieren Sie im
n?chsten Schritt FreeBSD in dieser virtuellen Maschine. Dazu verwenden
Sie am besten eine offizielle FreeBSD-CDROM oder Sie laden von einem
offiziellen FTP-Server ein ISO-Abbild auf Ihren Mac? herunter. Danach
klicken Sie auf das Laufwerksymbol in der rechten unteren Ecke des
Parallels-Fensters, um ihr virtuelles Laufwerk mit dem ISO-Abbild oder
mit dem physikalischen CD-ROM-Laufwerk ihres Computers zu verkn?pfen.

.. raw:: html

   <div class="mediaobject">

|image9|

.. raw:: html

   </div>

Nachdem Sie diese Verkn?pfung hergestellt haben, starten sie die
virtuelle FreeBSD-Maschine neu, indem Sie wie gewohnt auf das Symbol
"Neustarten" klicken. Parallels startet nun ein Spezial-BIOS, das zuerst
pr?ft, ob Sie eine CD-ROM eingelegt haben (genau so, wie es auch ein
echtes BIOS machen w?rde).

.. raw:: html

   <div class="mediaobject">

|image10|

.. raw:: html

   </div>

In unserem Fall findet das BIOS ein FreeBSD-Installationsmedium und
beginnt daher eine normale Installation mit sysinstall (wie in
`Kapitel?2, *FreeBSD?8.\ *``X``* (und ?lter)
installieren* <install.html>`__ des Handbuchs beschreiben).

.. raw:: html

   <div class="mediaobject">

|image11|

.. raw:: html

   </div>

Nachdem die Installation abgeschlossen ist, k?nnen Sie die virtuelle
Maschine starten.

.. raw:: html

   <div class="mediaobject">

|image12|

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

24.2.1.2. FreeBSD f?r den Einsatz unter Parallels/Mac?OS??X optimieren
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Nachdem Sie FreeBSD erfolgreich unter Mac?OS??X mit Parallels
installiert haben, sollten Sie ihr virtuelles FreeBSD-System f?r
virtualisierte Operationen optimieren:

.. raw:: html

   <div class="procedure">

#. **Setzen der Bootloader-Variablen**

   Die wichtigste ?nderung ist es, die Variable ``kern.hz`` zu
   verkleinern, um so die CPU-Auslastung in der Parallels-Umgebung zu
   verringern.

   .. code:: programlisting

       kern.hz=100

   Ohne diese Einstellung kann ein unbesch?ftigtes FreeBSD unter
   Parallels trotzdem rund 15 Prozent der CPU-Leistung eines Single
   Prozessor iMac?'s verbrauchen. Nach dieser ?nderung reduziert sich
   dieser Wert auf etwa 5 Prozent.

#. **Erstellen einer neuen Kernelkonfigurationsdatei**

   Sie k?nnen alle SCSI-, FireWire- und USB-Laufwerks-Treiber entfernen.
   Parallels stellt einen virtuellen Netzwerkadapter bereit, der den
   `ed(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ed&sektion=4>`__-Treiber
   verwendet. Daher k?nnen alle Netzwerkger?te bis auf
   `ed(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ed&sektion=4>`__ und
   `miibus(4) <http://www.FreeBSD.org/cgi/man.cgi?query=miibus&sektion=4>`__
   aus dem Kernel entfernt werden.

#. **Netzwerkbetrieb einrichten**

   Die einfachste Netzwerkkonfiguration ist der Einsatz von DHCP, um
   Ihre virtuelle Maschine mit dem gleichen lokalen Netzwerk, in dem
   sich der Host-Mac? befindet, zu verbinden. Dazu f?gen Sie die Zeile
   ``ifconfig_ed0="DHCP"`` in die Datei ``/etc/rc.conf`` ein. Weitere
   Informationen zur Konfiguration des Netzwerks unter FreeBSD finden
   Sie im `Kapitel?33, *Weiterf?hrende
   Netzwerkthemen* <advanced-networking.html>`__ des Handbuchs.

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

24.2.2. Virtual PC unter Windows?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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

Virtual PC f?r Windows? wird von Microsoft? kostenlos zum Download
angeboten. Die Systemanforderungen f?r dieses Programm finden Sie
`hier <http://www.microsoft.com/windows/downloads/virtualpc/sysreq.mspx>`__.
Nachdem Sie Virtual PC unter Microsoft??Windows? installiert haben,
m?ssen Sie eine virtuelle Maschine konfigurieren und das gew?nschte
Betriebssystem installieren.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

24.2.2.1. FreeBSD in Virtual PC/Microsoft??Windows? installieren
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Der erste Schritt zur Installation von FreeBSD in
Microsoft??Windows?/Virtual PC ist es, eine neue virtuelle Maschine zu
erstellen, in die Sie FreeBSD installieren k?nnen. Dazu w?hlen Sie die
Option Create a virtual machine, wenn Sie danach gefragt werden:

.. raw:: html

   <div class="mediaobject">

|image13|

.. raw:: html

   </div>

.. raw:: html

   <div class="mediaobject">

|image14|

.. raw:: html

   </div>

Bei der Frage nach dem Operating system w?hlen Sie Other:

.. raw:: html

   <div class="mediaobject">

|image15|

.. raw:: html

   </div>

Danach m?ssen Sie den von Ihnen gew?schten Plattenplatz sowie die Gr??e
des Hauptspeichers angeben. 4?GB Plattenplatz sowie 512?MB RAM sollten
f?r die Installation von FreeBSD in Virtual PC ausreichend sein:

.. raw:: html

   <div class="mediaobject">

|image16|

.. raw:: html

   </div>

.. raw:: html

   <div class="mediaobject">

|image17|

.. raw:: html

   </div>

Speichern Sie Ihre Eingaben und beenden Sie die Konfiguration:

.. raw:: html

   <div class="mediaobject">

|image18|

.. raw:: html

   </div>

W?hlen Sie nun die f?r FreeBSD erstellte virtuelle Maschine aus und
klicken Sie auf Settings, um das Netzwerk zu konfigurieren:

.. raw:: html

   <div class="mediaobject">

|image19|

.. raw:: html

   </div>

.. raw:: html

   <div class="mediaobject">

|image20|

.. raw:: html

   </div>

Nun k?nnen Sie FreeBSD installieren. Dazu verwenden Sie am besten eine
offizielle FreeBSD-CD-ROM oder ein ISO-Image, das Sie von einem
offiziellen FreeBSD-FTP-Server heruntergeladen haben. Wenn Sie ein
ISO-Image auf Ihrer Festplatte gespeichert haben, oder eine
FreeBSD-CD-ROM in Ihr CD-Laufwerk eingelegt haben, doppelklicken Sie auf
die virtuelle Maschine, die Sie f?r FreeBSD angelegt haben. Danach
klicken Sie auf CD und w?hlen die Option Capture ISO Image... im Virtual
PC-Fenster. Danach k?nnen Sie im folgenden Fenster das CD-Laufwerk mit
Ihrem physikalischen CD-Laufwerk oder mit dem ISO-Image verkn?pfen.

.. raw:: html

   <div class="mediaobject">

|image21|

.. raw:: html

   </div>

.. raw:: html

   <div class="mediaobject">

|image22|

.. raw:: html

   </div>

Danach starten Sie die virtuelle Maschine neu, indem Sie zuerst auf
Action und danach auf Reset klicken. Virtual PC startet Ihre virtuelle
Maschine nun neu und pr?ft zuerst, ob die virtuelle Maschine ?ber ein
CD-Laufwerk verf?gt.

.. raw:: html

   <div class="mediaobject">

|image23|

.. raw:: html

   </div>

Da dies hier der Fall ist, beginnt nun eine normale, auf sysinstall
basierende Installation, die in `Kapitel?2, *FreeBSD?8.\ *``X``* (und
?lter) installieren* <install.html>`__ beschrieben wird. Sie k?nnen
FreeBSD nun installieren. Verzichten Sie an dieser Stelle aber unbedingt
auf die X11-Konfiguration.

.. raw:: html

   <div class="mediaobject">

|image24|

.. raw:: html

   </div>

Nachdem die Installation abgeschlossen ist, entfernen Sie die CD-ROM aus
dem Laufwerk (oder l?sen die Verkn?pfung zum ISO-Image). Danach starten
Sie die virtuelle Maschine neu, um FreeBSD zu starten.

.. raw:: html

   <div class="mediaobject">

|image25|

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

24.2.2.2. FreeBSD in Microsoft??Windows?/Virtual PC konfigurieren
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Nachdem Sie FreeBSD auf Ihrem Microsoft??Windows?-System erfolgreich
unter Virtual PC installiert haben, sollten Sie ihr virtuelles FreeBSD
noch anpassen, um eine optimale Funktion zu gew?hrleisten.

.. raw:: html

   <div class="procedure">

#. **Setzen der Bootloader-Variablen**

   Die wichtigste ?nderung ist es, die Variable ``kern.hz`` zu
   verkleinern, um so die CPU-Auslastung in der Virtual PC-Umgebung zu
   verringern. Dazu f?gen Sie die folgende Zeile in die Datei
   ``/boot/loader.conf`` ein:

   .. code:: programlisting

       kern.hz=100

   Ohne diese Einstellung kann ein unbesch?ftigtes FreeBSD unter Virutal
   PC trotzdem rund 40 Prozent der CPU-Leistung eines
   Ein-Prozessor-Systems verbrauchen. Nach dieser ?nderung reduziert
   sich dieser Wert auf etwa 5 Prozent.

#. **Erstellen einer neuen Kernelkonfigurationsdatei**

   Sie k?nnen alle SCSI-, FireWire- und USB-Laufwerks-Treiber entfernen.
   Virtual PC stellt einen virtuellen Netzwerkadapter bereit, der den
   `de(4) <http://www.FreeBSD.org/cgi/man.cgi?query=de&sektion=4>`__-Treiber
   verwendet. Daher k?nnen alle Netzwerkger?te bis auf
   `de(4) <http://www.FreeBSD.org/cgi/man.cgi?query=de&sektion=4>`__ und
   `miibus(4) <http://www.FreeBSD.org/cgi/man.cgi?query=miibus&sektion=4>`__
   aus dem Kernel entfernt werden.

#. **Das Netzwerk einrichten**

   Die einfachste Netzwerkkonfiguration ist der Einsatz von DHCP, um
   Ihre virtuelle Maschine mit dem gleichen lokalen Netzwerk, in dem
   sich Ihr Host-Microsoft??Windows? befindet, zu verbinden. Dazu f?gen
   Sie die Zeile ``ifconfig_de0="DHCP"`` in die Datei ``/etc/rc.conf``
   ein. Weitere Informationen zur Konfiguration des Netzwerks unter
   FreeBSD finden Sie im `Kapitel?33, *Weiterf?hrende
   Netzwerkthemen* <advanced-networking.html>`__ des Handbuchs.

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

24.2.3. VMware unter MacOS
~~~~~~~~~~~~~~~~~~~~~~~~~~

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

VMware Fusion f?r Mac? ist ein kommerzielles Programm, das f?r Intel?
basierte Apple? Mac?-Computer mit Mac?OS? 10.4.9 oder neuer erh?ltlich
ist. FreeBSD wird von diesem Produkt vollst?ndig als Gast-Betriebssystem
unterst?tzt. Nachdem Sie VMware Fusion unter Mac?OS? X installiert
haben, k?nnen Sie das gew?nschte Gastbetriebssystem (in unserem Fall
FreeBSD) installieren.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

24.2.3.1. FreeBSD in VMware/Mac?OS? X installieren
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Zuerst m?ssen Sie VMware Fusion starten, um eine virtuelle Maschine zu
erstellen. Dazu w?hlen Sie die Option "New":

.. raw:: html

   <div class="mediaobject">

|image26|

.. raw:: html

   </div>

Dadurch wird ein Assistent gestartet, der Ihnen bei der Erzeugung einer
neuen virtuellen Maschine behilflich ist. Clicken Sie auf "Continue", um
den Prozess zu starten:

.. raw:: html

   <div class="mediaobject">

|image27|

.. raw:: html

   </div>

W?hlen Sie Other als das Operating System, danach FreeBSD oder FreeBSD
64-bit, je nach dem, welche Version Sie installieren wollen, wenn Sie
nach der zu installierenden Version gefragt werden:

.. raw:: html

   <div class="mediaobject">

|image28|

.. raw:: html

   </div>

Vergeben Sie einen Namen f?r virtuelle Maschine an und legen Sie den
Speicherort fest:

.. raw:: html

   <div class="mediaobject">

|image29|

.. raw:: html

   </div>

Legen Sie die Gr??e Ihrer virtuellen Festplatte fest:

.. raw:: html

   <div class="mediaobject">

|image30|

.. raw:: html

   </div>

Nachdem Sie auf "Finish" geklickt haben, wird die virtuelle Maschine
gestartet:

.. raw:: html

   <div class="mediaobject">

|image31|

.. raw:: html

   </div>

Nun k?nnen Sie FreeBSD wie gewohnt installieren (lesen Sie dazu auch
`Kapitel?2, *FreeBSD?8.\ *``X``* (und ?lter)
installieren* <install.html>`__ des Handbuchs):

.. raw:: html

   <div class="mediaobject">

|image32|

.. raw:: html

   </div>

Nachdem die Installation abgeschlossen ist, k?nnen Sie noch verschiedene
Parameter der virtuellen Maschine, etwa den Speicherverbrauch,
konfigurieren:

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Die Hardware der virtuellen Maschine kann nicht ge?ndert werden, solange
die virtuelle Maschine l?uft.

.. raw:: html

   </div>

.. raw:: html

   <div class="mediaobject">

|image33|

.. raw:: html

   </div>

Die Anzahl der CPUs der virtuellen Maschine:

.. raw:: html

   <div class="mediaobject">

|image34|

.. raw:: html

   </div>

Den Status des CD-Laufwerks. Sie k?nnen das CD-Laufwerk von der
virtuellen Maschine l?sen, wenn Sie es nicht ben?tigen.

.. raw:: html

   <div class="mediaobject">

|image35|

.. raw:: html

   </div>

Zuletzt sollten Sie noch festlegen, wie sich die virtuelle Maschine mit
dem Netzwerk verbinden soll. Sollen neben dem Gastsystem auch andere
Rechner auf Ihre virtuelle Maschine zugreifen k?nnen, m?ssen Sie die
Option Connect directly to the physical network (Bridged) w?hlen. Ist
dies nicht der Fall, sollten Sie die Option Share the host's internet
connection (NAT) w?hlen. In dieser Einstellung kann die virtuelle
Maschine zwar auf auf das Internet zugreifen, andere Rechner d?rfen aber
nicht auf die virtuelle Maschine zugreifen.

.. raw:: html

   <div class="mediaobject">

|image36|

.. raw:: html

   </div>

Nachdem Sie die Konfiguration abgeschlossen haben, k?nnen Sie FreeBSD
starten.

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

24.2.3.2. FreeBSD unter Mac?OS? X/VMware konfigurieren
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Nachdem Sie FreeeBSD erfolgreich unter VMware f?r Mac?OS??X installiert
haben, sollten Sie ihr virtuelles FreeBSD noch anpassen, um eine
optimale Funktion zu gew?hrleisten.

.. raw:: html

   <div class="procedure">

#. Die wichtigste ?nderung ist es, die Variable ``kern.hz`` zu
   verkleinern, um so die CPU-Auslastung in der VMware-Umgebung zu
   verringern.

   .. code:: programlisting

       kern.hz=100

   Ohne diese Einstellung kann ein unbesch?ftigtes FreeBSD unter VMware
   trotzdem rund 15 Prozent der CPU-Leistung eines Single Prozessor
   iMac?'s verbrauchen. Nach dieser ?nderung reduziert sich dieser Wert
   auf etwa 5 Prozent.

#. **Erstellen einer neuen Kernelkonfigurationsdatei**

   Sie k?nnen alle FireWire- und USB-Laufwerks-Treiber entfernen. VMware
   stellt einen virtuellen Netzwerkadapter bereit, der den
   `em(4) <http://www.FreeBSD.org/cgi/man.cgi?query=em&sektion=4>`__-Treiber
   verwendet. Daher k?nnen alle Netzwerkger?te bis auf
   `em(4) <http://www.FreeBSD.org/cgi/man.cgi?query=em&sektion=4>`__ und
   `miibus(4) <http://www.FreeBSD.org/cgi/man.cgi?query=miibus&sektion=4>`__
   aus dem Kernel entfernt werden.

#. **Netzwerkbetrieb einrichten**

   Die einfachste Netzwerkkonfiguration ist der Einsatz von DHCP, um
   Ihre virtuelle Maschine mit dem gleichen lokalen Netzwerk, in dem
   sich der Host-Mac? befindet, zu verbinden. Dazu f?gen Sie die Zeile
   ``ifconfig_em0="DHCP"`` in die Datei ``/etc/rc.conf`` ein. Weitere
   Informationen zur Konfiguration des Netzwerks unter FreeBSD finden
   Sie im `Kapitel?33, *Weiterf?hrende
   Netzwerkthemen* <advanced-networking.html>`__ des Handbuchs.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------+---------------------------------------+--------------------------------------------+
| `Zur?ck <virtualization.html>`__?   | `Nach oben <virtualization.html>`__   | ?\ `Weiter <virtualization-host.html>`__   |
+-------------------------------------+---------------------------------------+--------------------------------------------+
| Kapitel 24. Virtualisierung?        | `Zum Anfang <index.html>`__           | ?24.3. FreeBSD als Host-Betriebssystem     |
+-------------------------------------+---------------------------------------+--------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.

.. |image0| image:: virtualization/parallels-freebsd1.png
.. |image1| image:: virtualization/parallels-freebsd2.png
.. |image2| image:: virtualization/parallels-freebsd3.png
.. |image3| image:: virtualization/parallels-freebsd4.png
.. |image4| image:: virtualization/parallels-freebsd5.png
.. |image5| image:: virtualization/parallels-freebsd6.png
.. |image6| image:: virtualization/parallels-freebsd7.png
.. |image7| image:: virtualization/parallels-freebsd8.png
.. |image8| image:: virtualization/parallels-freebsd9.png
.. |image9| image:: virtualization/parallels-freebsd11.png
.. |image10| image:: virtualization/parallels-freebsd10.png
.. |image11| image:: virtualization/parallels-freebsd12.png
.. |image12| image:: virtualization/parallels-freebsd13.png
.. |image13| image:: virtualization/virtualpc-freebsd1.png
.. |image14| image:: virtualization/virtualpc-freebsd2.png
.. |image15| image:: virtualization/virtualpc-freebsd3.png
.. |image16| image:: virtualization/virtualpc-freebsd4.png
.. |image17| image:: virtualization/virtualpc-freebsd5.png
.. |image18| image:: virtualization/virtualpc-freebsd6.png
.. |image19| image:: virtualization/virtualpc-freebsd7.png
.. |image20| image:: virtualization/virtualpc-freebsd8.png
.. |image21| image:: virtualization/virtualpc-freebsd9.png
.. |image22| image:: virtualization/virtualpc-freebsd10.png
.. |image23| image:: virtualization/virtualpc-freebsd11.png
.. |image24| image:: virtualization/virtualpc-freebsd12.png
.. |image25| image:: virtualization/virtualpc-freebsd13.png
.. |image26| image:: virtualization/vmware-freebsd01.png
.. |image27| image:: virtualization/vmware-freebsd02.png
.. |image28| image:: virtualization/vmware-freebsd03.png
.. |image29| image:: virtualization/vmware-freebsd04.png
.. |image30| image:: virtualization/vmware-freebsd06.png
.. |image31| image:: virtualization/vmware-freebsd07.png
.. |image32| image:: virtualization/vmware-freebsd08.png
.. |image33| image:: virtualization/vmware-freebsd09.png
.. |image34| image:: virtualization/vmware-freebsd10.png
.. |image35| image:: virtualization/vmware-freebsd11.png
.. |image36| image:: virtualization/vmware-freebsd12.png
