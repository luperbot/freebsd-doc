=========================
10.3. Grund-Konfiguration
=========================

.. raw:: html

   <div class="navheader">

10.3. Grund-Konfiguration
`Zur?ck <printing-intro-spooler.html>`__?
Kapitel 10. Drucken
?\ `Weiter <printing-advanced.html>`__

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

10.3. Grund-Konfiguration
-------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Um einen Drucker mit dem LPD-Drucksystem benutzen zu k?nnen, m?ssen Sie
sowohl Ihren Drucker und die Drucker-Schnittstelle als auch das
LPD-Drucksystem konfigurieren. Dieser Abschnitt beschreibt zwei
Konfigurationen:

.. raw:: html

   <div class="itemizedlist">

-  Abschnitt `Einfache
   Drucker-Konfiguration <printing-intro-setup.html#printing-simple>`__
   beschreibt, wie Sie einen Drucker an Ihren Computer anschlie?en und
   LPD so konfigurieren, dass Sie Textdateien zum Drucker senden k?nnen.

-  Abschnitt `Erweiterte
   Drucker-Konfiguration <printing-advanced.html>`__ beschreibt, wie Sie
   mit speziellen Dateiformaten umgehen k?nnen, wie Sie Deckbl?tter
   drucken k?nnen, wie Sie den Zugriff auf Drucker einschr?nken k?nnen,
   und wie Sie Verrechnungsdaten aufzeichnen k?nnen.

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

10.3.1. Einfache Drucker-Konfiguration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dieser Abschnitt beschreibt, wie Sie die LPD-Software konfigurieren, um
Ihren Drucker zu benutzen. Diese Grundlagen werden erkl?rt:

.. raw:: html

   <div class="itemizedlist">

-  Abschnitt
   `Hardware-Konfiguration <printing-intro-setup.html#printing-hardware>`__
   erl?utert, wie Sie Ihren Drucker an Ihren Computer anschlie?en
   k?nnen.

-  Abschnitt
   `Software-Konfiguration <printing-intro-setup.html#printing-software>`__
   erkl?rt, wie Sie die LPD-Konfigurationsdatei (``/etc/printcap``)
   anpassen.

.. raw:: html

   </div>

Wenn Sie einen Drucker einrichten m?chten, der ?ber das Netzwerk
angeschlossen ist (anstatt ?ber die serielle oder parallele
Schnittstelle), lesen Sie bitte Abschnitt `Drucker mit direkter
TCP-Schnittstelle <printing-advanced.html#printing-advanced-network-net-if>`__.

Obwohl dieser Abschnitt „Grund-Konfiguration“ hei?t, ist die
Konfiguration relativ komplex. Es ist vergleichsweise schwierig, einen
Drucker mit Ihrem Computer und dem LPD-Drucksystem zu verbinden. Die
weiteren Optionen, wie Kopfzeilen oder Deckbl?tter, sind einfach zu
konfigurieren, sobald die Grund-Konfiguration erfolgreich abgeschlossen
ist.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

10.3.1.1. Hardware-Konfiguration
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dieser Abschnitt beschreibt, ?ber welche Schnittstellen Sie einen
Drucker mit Ihrem Computer verbinden k?nnen. Er behandelt sowohl die
Schnittstellen und Kabel, als auch die Kerneloptionen, die Sie
ben?tigen, um FreeBSD mit Ihrem Drucker kommunizieren zu lassen.

Wenn Sie Ihren Drucker bereits erfolgreich mit einem anderen
Betriebssystem auf Ihrem PC eingesetzt haben, k?nnen Sie wahrscheinlich
mit dem Abschnitt
`Software-Konfiguration <printing-intro-setup.html#printing-software>`__
fortfahren.

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

10.3.1.1.1. Schnittstellen und Kabel
''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Praktisch alle Drucker unterst?tzen mindestens eine dieser
Schnittstellen:

.. raw:: html

   <div class="itemizedlist">

-  *Seriell* angeschlossene Drucker werden ?ber eine serielle
   Schnittstelle (auch RS-232 oder COM-Schnittstelle genannt) mit Ihrem
   Computer verbunden. Diese Schnittstelle wird von vielen
   unterschiedlichen Systemen verwendet. Serielle Kabel sind leicht
   erh?ltlich und k?nnen auch einfach selbst hergestellt werden. Einige
   Drucker erfordern m?glicherweise ein spezielles Kabel oder besondere
   Kommunikationseinstellungen. Die meisten seriellen Schnittstellen von
   PCs besitzen eine maximale Daten?bertragungsrate von 115200?bps; zum
   Ausdruck gro?er Grafiken sind serielle Drucker daher ungeeignet.

-  *Parallel* angeschlossene Drucker werden ?ber eine parallele
   Schnittstelle mit Ihrem Computer verbunden. Diese Schnittstelle wird
   haupts?chlich von PCs und Workstations benutzt. Die Schnittstelle
   bietet eine h?here Daten?bertragungsrate als serielle Schnittstellen.
   Kabel sind leicht erh?ltlich, sind aber vergleichsweise schwer selbst
   herzustellen. ?blicherweise brauchen keine Kommunikationsparameter
   festgelegt zu werden; dies macht die Einrichtung sehr einfach.

   Die parallele Schnittstelle wird auch als „Centronics“-Schnittstelle
   bezeichnet, nach dem Namen des Steckverbinders, der hier h?ufig zum
   Einsatz kommt.

-  USB-Schnittstelle (Universal Serial Bus) bieten noch h?here
   Geschwindigkeiten als parallele Schnittstellen oder serielle
   RS-232-Schnittstellen. USB-Kabel sind einfach und billig. Zum Drucken
   ist die USB-Schnittstelle besser geeignet als serielle oder parallele
   Schnittstellen, auf vielen UNIX? Systemen werden USB-Schnittstellen
   jedoch nur unzureichend unterst?tzt. Um Probleme zu vermeiden,
   sollten Sie sich einen Drucker anschaffen, der sowohl eine
   USB-Schnittstelle als auch eine parallele Schnittstelle besitzt
   (viele Drucker besitzen heute beide Schnittstellen).

.. raw:: html

   </div>

Im Allgemeinen versenden parallele Schnittstellen Daten nur in eine
Richtung (vom Computer zum Drucker), serielle Schnittstellen und
USB-Schnittstellen versenden Daten in beide Richtungen. Moderne
parallele Schnittstellen (EPP and ECP) ?bertragen Daten bi-direktional
nach dem Standard IEEE?1284.

Ein Drucker kann auf zwei Arten bi-direktional angesprochen werden. Die
erste Methode benutzt einen Druckertreiber, der die
herstellerspezifische Sprache des Druckers beherrscht. Diese Methode
wird oft mit Tintenstrahl-Druckern eingesetzt und dazu benutzt, den
F?llstand der Tintenpatronen und andere Status-Informationen auszugeben.
Die zweite Methode wird benutzt, wenn der Drucker PostScript?
beherrscht.

Da ein PostScript?-Druckauftrag ein komplettes Programm ist, kann es
auch Daten an den Computer zur?ckliefern, ohne ?berhaupt eine Seite
Papier zu bedrucken. Auf diesem Wege werden auch Probleme wie z.B. ein
Papierstau vom Drucker an den Computer ?bermittelt. Dar?berhinaus ist
dies die effektivste Methode, um die tats?chlich gedruckte Anzahl an
Seiten vom Drucker abzufragen: ein PostScript?-Programm ermittelt
jeweils vor und direkt nach einem Druckauftrag den Seitenz?hler des
Druckers, und vergleicht die beiden Z?hlerwerte.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

10.3.1.1.2. Parallele Schnittstellen
''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Um einen Drucker mit paralleler Schnittstelle an Ihren Computer
anzuschlie?en, verbinden Sie den Drucker mit einer parallelen
Schnittstelle Ihres Computers. Die Dokumentation zu Ihrem Drucker oder
Computer sollte Ihnen hier weiterhelfen.

Notieren Sie sich, mit welcher parallelen Schnittstelle des Computers
Sie den Drucker verbunden haben. Die meisten Computer haben lediglich
eine parallele Schnittstelle. Der FreeBSD-Ger?tename der ersten
Schnittstelle lautet ``ppc0``, der der zweiten ``ppc1``, und so weiter.
Der Ger?tename f?r den Drucker an der ersten parallelen Schnittstelle
folgt dem selben Schema und lautet ``/dev/lpt0``, usw.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

10.3.1.1.3. Serielle Schnittstellen
'''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Um einen Drucker mit serieller Schnittstelle an Ihren Computer
anzuschlie?en, verbinden Sie den Drucker mit einer seriellen
Schnittstelle Ihres Computers. Die Dokumentation zu Ihrem Drucker oder
Computer sollte Ihnen hier weiterhelfen.

Sollten Sie sich nicht sicher sein, welches das „richtige Kabel“ ist,
k?nnen Sie eine dieser Alternativen ausprobieren:

.. raw:: html

   <div class="itemizedlist">

-  Ein *Modemkabel* verbindet alle Anschl?sse an einem Ende des Kabels
   eins-zu-eins mit den Anschl?ssen am anderen Ende des Kabels. Ein
   solches Kabel wird auch als (engl.) „DTE-to-DCE-“ oder
   „DEE-zu-D?E-“Kabel bezeichnet.

-  Ein *Nullmodemkabel* verbindet einige Signale eins-zu-eins, andere
   ?ber Kreuz (z.B. Sende- und Empfangsleitung), und verbindet einige
   weitere direkt im Stecker miteinander. Ein solches Kabel wird auch
   als (engl.) „DTE-to-DTE-“ oder „DEE-zu-DEE-“Kabel bezeichnet.

-  Ein *Serielles Druckerkabel* schlie?lich, das f?r einige spezielle
   Drucker ben?tigt wird, verbindet zus?tzliche Signale miteinander,
   anstatt sie im Stecker zur?ckzuf?hren.

.. raw:: html

   </div>

Sie sollten auch die Kommunikationsparameter am Drucker einstellen;
?blicherweise gibt es dazu DIP-Schalter, oder eine Option in der
Men?f?hrung am Drucker. W?hlen Sie die h?chste *Bitrate* (auch als
``bps`` Bits pro Sekunde oder *Baudrate* bezeichnet), die sowohl Ihr
Drucker als auch Ihr Computer unterst?tzen. W?hlen Sie 7 oder 8 Bits,
gerade, ungerade oder keine Parit?t, und ein oder zwei Stoppbits. W?hlen
Sie die Art der Flusssteuerung: keine, XON/XOFF (auch als „in-band-“
oder „Software“-Flusssteuerung bezeichnet), oder Hardware. Notieren Sie
sich diese Einstellungen, damit Sie sie sp?ter bei der
Software-Konfiguration zur Verf?gung haben.

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

10.3.1.2. Software-Konfiguration
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dieser Abschnitt beschreibt die notwendigen Konfigurationsschritte,
damit Sie mit dem FreeBSD-LPD-System drucken k?nnen.

Diese Schritte m?ssen Sie ausf?hren:

.. raw:: html

   <div class="procedure">

#. Konfigurieren Sie Ihren Kernel, soweit notwendig, um die
   Schnittstelle benutzen zu k?nnen, an die Ihr Drucker angeschlossen
   ist. Abschnitt
   `Kernel-Konfiguration <printing-intro-setup.html#printing-kernel>`__
   erkl?rt, welche Optionen Sie ben?tigen.

#. Konfigurieren Sie die Kommunikationseinstellungen f?r die parallele
   Schnittstelle, sofern Sie sie benutzen. Abschnitt
   `Kommunikationseinstellungen f?r die parallele
   Schnittstelle <printing-intro-setup.html#printing-parallel-port-mode>`__
   enth?lt die Details.

#. Pr?fen Sie, ob Sie Daten an den Drucker senden k?nnen. Abschnitt
   `Pr?fen der
   Drucker-Kommunikation <printing-intro-setup.html#printing-testing>`__
   f?hrt eine Reihe von M?glichkeiten auf.

#. Konfigurieren Sie LPD f?r Ihren Drucker, indem Sie die
   Konfigurationsdatei ``/etc/printcap`` anpassen. Details dazu finden
   Sie im Abschnitt `LPD aktivieren: die
   ``/etc/printcap``-Datei <printing-intro-setup.html#printing-printcap>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

10.3.1.2.1. Kernel-Konfiguration
''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Der Betriebssystem-Kernel ist f?r eine bestimmte Kombination aus Ger?ten
kompiliert. Dies schlie?t Ihre seriellen oder parallelen Schnittstellen
mit ein. Dementsprechend kann es notwendig sein, die Kernelkonfiguration
um weitere Schnittstellen zu erweitern.

So k?nnen Sie pr?fen, ob Ihr Kernel die serielle Schnittstelle
unterst?tzt, an die Sie den Drucker angeschlossen haben:

.. code:: screen

    # grep sioN /var/run/dmesg.boot

Ersetzen Sie *``N``* durch die Nummer der seriellen Schnittstelle,
beginnend bei Null. Wenn Sie eine Ausgabe ?hnlich der folgenden
erhalten, unterst?tzt ihr Kernel diese Schnittstelle:

.. code:: screen

    sio2 at port 0x3e8-0x3ef irq 5 on isa
    sio2: type 16550A

Erhalten Sie keine Ausgabe, oder eine Fehlermeldung, wird die
Schnittstelle nicht korrekt unterst?tzt.

So k?nnen Sie pr?fen, ob Ihr Kernel die parallele Schnittstelle
unterst?tzt, an die Sie den Drucker angeschlossen haben:

.. code:: screen

    # grep ppcN /var/run/dmesg.boot

Ersetzen Sie *``N``* durch die Nummer der parallelen Schnittstelle,
beginnend bei Null. Wenn Sie eine Ausgabe ?hnlich der folgenden
erhalten, unterst?tzt ihr Kernel diese Schnittstelle:

.. code:: screen

    ppc0: <Parallel port> at port 0x378-0x37f irq 7 on isa0
    ppc0: SMC-like chipset (ECP/EPP/PS2/NIBBLE) in COMPATIBLE mode
    ppc0: FIFO with 16/16/8 bytes threshold

Erhalten Sie keine Ausgabe, oder eine Fehlermeldung, wird die
Schnittstelle nicht korrekt unterst?tzt.

Gegebenenfalls m?ssen Sie Ihren Kernel umkonfigurieren und neu
kompilieren, damit die von Ihnen gew?hlte Schnittstelle unterst?tzt
wird.

Um Unterst?tzung f?r eine serielle Schnittstelle hinzuzuf?gen, lesen Sie
bitte Kapitel `Konfiguration des FreeBSD Kernels <kernelconfig.html>`__.
Um eine parallele Schnittstelle hinzuzuf?gen, lesen Sie bitte ebenfalls
jenes Kapitel als auch den folgenden Abschnitt
`Kommunikationseinstellungen f?r die parallele
Schnittstelle <printing-intro-setup.html#printing-parallel-port-mode>`__.

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

10.3.1.3. Kommunikationseinstellungen f?r die parallele Schnittstelle
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn Sie die parallele Schnittstelle zur Kommunikation mit Ihrem Drucker
benutzen, haben Sie die Wahl zwischen Interrupt-gesteuerter oder
Polling-Daten?bertragung. Der generische Druckerger?tetreiber
`lpt(4) <http://www.FreeBSD.org/cgi/man.cgi?query=lpt&sektion=4>`__ in
FreeBSD benutzt das
`ppbus(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ppbus&sektion=4>`__-System,
das die parallele Schnittstelle mithilfe des
`ppc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ppc&sektion=4>`__-Treibers
steuert.

.. raw:: html

   <div class="itemizedlist">

-  Die *Interrupt-gesteuerte* Daten?bertragung ist die Voreinstellung im
   GENERIC-Kernel. Der Treiber benutzt eine IRQ-Leitung, um zu erfahren,
   wann der Drucker weitere Daten empfangen kann.

-  Bei der *Polling-Methode* pr?ft der Treiber in regelm??igen
   Abst?nden, ob weitere Daten ?bertragen werden k?nnen.

.. raw:: html

   </div>

Die Interrupt-gesteuerte Methode ist ?berlicherweise schneller und
verbraucht weniger Rechenzeit als die Polling-Methode, es wird jedoch
eine eigene IRQ-Leitung f?r die Schnittstelle ben?tigt. Dar?berhinaus
kann es mit einigen Druckermodellen zu Problemen kommen, wenn die
Interrupt-gesteuerte ?bertragung zum Einsatz kommt.

Die k?nnen die Kommunikationseinstellung entweder in der
Kernel-Konfiguration w?hlen, oder mittels des
`lptcontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=lptcontrol&sektion=8>`__-Programms
zur Laufzeit einstellen.

*So legen Sie die Kommunikationseinstellung in der Kernel-Konfiguration
fest:*

.. raw:: html

   <div class="procedure">

#. ?ndern Sie Ihre Kernel-Konfigurationsdatei. Finden Sie die Zeile, die
   mit ``device         ppc0`` beginnt. Wenn Sie die zweite parallele
   Schnittstelle konfigurieren m?chten, suchen Sie nach ``device ppc1``,
   f?r die dritte Schnittstelle ``ppc2``, usw.

   .. raw:: html

      <div class="itemizedlist">

   -  Um die Interrupt-Steuerung zu aktivieren, passen Sie die folgende
      Zeile an:

      .. code:: programlisting

          hint.ppc.0.irq="N"

      Ersetzen Sie *``N``* durch die Nummer der IRQ-Leitung, die dieser
      parallelen Schnittstelle zugewiesen ist. Stellen Sie sicher, dass
      Ihre Kernel-Konfigurationsdatei den
      `ppc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ppc&sektion=4>`__-Treiber
      enth?lt:

      .. code:: screen

          device ppc

   -  Wenn Sie den Polling-Modus verwenden m?chten, entfernen Sie die
      folgende Zeile aus ``/boot/device.hints``:

      .. code:: programlisting

          hint.ppc.0.irq="N"

      Sollte der Treiber die Schnittstelle dennoch im Interrupt-Modus
      betreiben, k?nnte dies an der Aktivierung durch das
      `acpi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=acpi&sektion=4>`__-System
      in FreeBSD liegen. Bitte pr?fen Sie die ACPI- und die
      BIOS-Konfiguration.

   .. raw:: html

      </div>

#. Wenn Sie Ihre Kernel-Konfigurationsdatei angepasst haben, kompilieren
   und installieren Sie nun einen neuen Kernel. Das Kapitel
   `Konfiguration des FreeBSD-Kernels <kernelconfig.html>`__ enth?lt
   weitere Details dazu.

.. raw:: html

   </div>

*So k?nnen Sie die Kommunikationseinstellung
mit*\ `lptcontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=lptcontrol&sektion=8>`__
*?ndern:*

.. raw:: html

   <div class="procedure">

#. Um die Interrupt-Steuerung f?r die Schnittstelle *``N``* zu
   aktivieren, geben Sie ein:

   .. code:: screen

       # lptcontrol -i -d /dev/lptN

#. Um den Polling-Modus f?r die Schnittstelle *``N``* zu aktivieren,
   geben Sie ein:

   .. code:: screen

       # lptcontrol -p -d /dev/lptN

.. raw:: html

   </div>

Sie k?nnen diesen Befehl in ``/etc/rc.local`` aufnehmen, damit er bei
jedem Systemstart automatisch ausgef?hrt wird.
`lptcontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=lptcontrol&sektion=8>`__
enth?lt weitere Informationen.

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

10.3.1.4. Kommunikation mit den Drucker pr?fen
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Bevor Sie mit der Konfiguration des LPD-Drucksystems fortfahren, sollten
Sie sicherstellen, das Sie erfolgreich Daten an Ihren Drucker senden
k?nnen. Es ist deutlich einfacher, Kommunikations- und
Konfigurationsprobleme unabh?ngig voneinander zu l?sen.

Der Drucker kann mit einem Probeausdruck getestet werden. F?r alle
Drucker, die normalen Text unmittelbar drucken k?nnen, bietet sich das
Programm
`lptest(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lptest&sektion=1>`__
an: es produziert alle 96 druckbaren ASCII-Zeichen auf 96 Zeilen.

F?r einen PostScript?-Drucker (oder andere Drucker, die eine
Seitenbeschreibungssprache verwenden) muss ein passendes Programm an den
Drucker gesendet werden, z.B. dieses:

.. code:: programlisting

    %!PS
    100 100 moveto 300 300 lineto stroke
    310 310 moveto /Helvetica findfont 12 scalefont setfont
    (Funktioniert dieser Drucker?) show
    showpage

Sie k?nnen dieses ProstScript-Programm in einer Datei speichern, und mit
den Beispielen in den folgenden Abschnitt verwenden.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Nicht alle Drucker, die eine Seitenbeschreibungssprache verwenden,
ben?tigen ein Test-Programm: z.B. HPs PCL (das auch in vielen
kompatiblen Druckern zum Einsatz zu kommt), versteht normalen Text.
Besondere Escape-Sequenzen werden benutzt, um die erweiterten
M?glichkeiten aufzurufen. PostScript?-Drucker k?nnen in der Regel keinen
normalen Text direkt verarbeiten, weil sie ein PostScript?-Programm
erwarten, das eine Seite produziert.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

10.3.1.4.1. Einen Paralleldrucker pr?fen
''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dieser Abschnitt f?hrt vor, wie Sie die Kommunikation mit Ihrem Drucker
?ber die parallele Schnittstelle pr?fen k?nnen.

*So testen Sie einen Drucker an einer parallelen Schnittstelle:*

.. raw:: html

   <div class="procedure">

#. Werden Sie ``root`` mithilfe des
   `su(1) <http://www.FreeBSD.org/cgi/man.cgi?query=su&sektion=1>`__-Befehls.

#. Senden Sie Testdaten an den Drucker.

   .. raw:: html

      <div class="itemizedlist">

   -  Wenn Ihr Drucker reinen Text direkt drucken kann, verwenden Sie
      `lptest(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lptest&sektion=1>`__:

      .. code:: screen

          # lptest > /dev/lptN

      Ersetzen Sie *``N``* durch die Nummer der parallelen
      Schnittstelle, an die der Drucker angeschlossen ist (angefangen
      bei Null).

   -  Wenn Ihr Drucker PostScript? (oder eine andere
      Seitenbeschreibungssprache) versteht, senden Sie ein passendes
      Testprogramm an den Drucker. Geben Sie folgenden Befehl ein:

      .. code:: screen

          # cat file > /dev/lptN

      Ersetzen Sie *``N``* durch die Nummer der parallelen
      Schnittstelle, an die der Drucker angeschlossen ist (angefangen
      bei Null). Geben Sie nun das Testprogramm ein, Zeile f?r Zeile.
      Kontrollieren Sie jede Zeile, bevor Sie die Eingabetaste dr?cken:
      Sie k?nnen die Zeile sp?ter nicht mehr ?ndern. Zum Schluss tippen
      Sie **Ctrl**+**D**. Wenn Sie ein anderes Zeichen nutzen, um das
      Ende der Datei anzuzeigen, m?ssen Sie nat?rlich die entsprechende
      Tastenkombination f?r dieses Zeichen bet?tigen.

      Sie k?nnen das Testprogramm auch in einer Datei speichern, und
      dann diesen Befehl aufrufen:

      .. code:: screen

          # cat Testprogramm > /dev/lptN

      Ersetzen Sie *``Testprogramm``* durch den Dateinamen, unter dem
      Sie das Testprogramm gespeichert haben.

   .. raw:: html

      </div>

.. raw:: html

   </div>

Der Drucker sollte einige Zeilen oder eine Seite drucken. Machen Sie
sich keine Sorgen ?ber falsche Formatierungen: die
Software-Konfiguration enth?lt Informationen zum Umformatieren von
Druckauftr?gen.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

10.3.1.4.2. Einen seriellen Drucker pr?fen
''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dieser Abschnitt f?hrt vor, wie Sie die Kommunikation mit Ihrem Drucker
?ber die parallele Schnittstelle pr?fen k?nnen.

*So testen Sie einen Drucker an einer seriellen Schnittstelle:*

.. raw:: html

   <div class="procedure">

#. Werden Sie ``root`` mithilfe des
   `su(1) <http://www.FreeBSD.org/cgi/man.cgi?query=su&sektion=1>`__-Befehls.

#. ?ndern Sie die Datei ``/etc/remote``. F?gen Sie den folgenden Eintrag
   hinzu:

   .. code:: programlisting

       printer:dv=/dev/port:br#bps-rate:pa=parity

   Ersetzen Sie *``Ger?t``* durch den Ger?tenamen der seriellen
   Schnittstelle (``ttyu0`` f?r die erste, ``ttyu1`` f?r die zweite,
   usw.), *``Baudrate``* ist die Geschwindigkeit und *``Parit?t``* die
   Parit?t (``even`` f?r gerade, ``odd`` f?r ungerade oder ``none`` f?r
   keine), die Sie am Drucker eingestellt haben.

   Hier ein Beispieleintrag f?r einen Drucker, der ?ber die dritte
   serielle Schnittstelle angeschlossen ist, mit 19.200?Baud
   kommuniziert und keine Parit?t verwendet:

   .. code:: programlisting

       printer:dv=/dev/ttyu2:br#19200:pa=none

#. Verbinden Sie sich mit dem Drucker ?ber den Befehl
   `tip(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tip&sektion=1>`__:

   .. code:: screen

       # tip printer

   Kommt es hierbei zu einer Fehlermeldung, ?ndern Sie den Eintrag in
   ``/dev/cuaaN`` und verwenden Sie ``/dev/cuaaN`` statt ``/dev/ttyuN``.

#. Senden Sie Testdaten an den Drucker.

   .. raw:: html

      <div class="itemizedlist">

   -  Wenn Ihr Drucker reinen Text direkt drucken kann, verwenden Sie
      `lptest(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lptest&sektion=1>`__:

      .. code:: screen

          % $lptest

   -  Wenn Ihr Drucker PostScript? (oder eine andere
      Seitenbeschreibungssprache) versteht, senden Sie ein passendes
      Testprogramm an den Drucker. Geben Sie das Testprogramm ein, Zeile
      f?r Zeile. Kontrollieren Sie jede Zeile, bevor Sie die
      Eingabetaste dr?cken: Sie k?nnen die Zeile sp?ter nicht mehr
      ?ndern. Zum Schluss tippen Sie ``Control-D``.

      Sie k?nnen das Testprogramm auch in einer Datei speichern, und
      dann diesen Befehl aufrufen:

      .. code:: screen

          % >Testprogramm

      Ersetzen Sie *``Testprogramm``* durch den Dateinamen, unter dem
      Sie das Testprogramm gespeichert haben. Nachdem
      `tip(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tip&sektion=1>`__
      die Datei gesendet hat, tippen Sie ``Control-D``.

   .. raw:: html

      </div>

.. raw:: html

   </div>

Der Drucker sollte einige Zeilen oder eine Seite drucken. Machen Sie
sich keine Sorgen ?ber falsche Formatierungen: die
Software-Konfiguration enth?lt Informationen zum Umformatieren von
Druckauftr?gen.

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

10.3.1.5. LPD aktivieren: die ``/etc/printcap``-Datei
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Nachdem Sie Ihren Drucker angeschlossen haben, Ihren Kernel richtig
konfiguriert haben und erfolgreich einen Testausdruck produziert haben,
k?nnen Sie nun das LPD-System konfigurieren.

Sie konfigurieren LPD, indem Sie die Datei ``/etc/printcap`` anpassen.
Da LPD die Datei jedes Mal liest, wenn eine Aktion durchgef?hrt wird,
werden ?nderungen an der Konfiguration sofort aktiv.

Die
`printcap(5) <http://www.FreeBSD.org/cgi/man.cgi?query=printcap&sektion=5>`__-Datei
ist einfach aufgebaut. Sie k?nnen ``/etc/printcap`` mit Ihrem
bevorzugten Texteditor bearbeiten. Sie verwendet dasselbe Format wie
auch ``/usr/share/misc/termcap`` oder ``/etc/remote``. Informationen zum
Format finden Sie in
`cgetent(3) <http://www.FreeBSD.org/cgi/man.cgi?query=cgetent&sektion=3>`__.

Die Grund-Konfiguration des LPD-Systems beinhaltet diese Schritte:

.. raw:: html

   <div class="procedure">

#. W?hlen Sie einen Namen (und einige praktische Abk?rzungen) f?r die
   Druckerwarteschlage, und tragen Sie ihn in die
   ``/etc/printcap``-Datei ein. Abschnitt `Einen Namen
   w?hlen <printing-intro-setup.html#printing-naming>`__ enth?lt weitere
   Informationen.

#. Schalten Sie den Druck von Deckbl?ttern aus (dies ist standardm??ig
   eingeschaltet), indem Sie das Attribut ``sh`` setzen. Abschnitt `Den
   Druck von Deckbl?ttern
   ausschalten <printing-intro-setup.html#printing-no-header-pages>`__
   erkl?rt, wie Sie dies tun k?nnen.

#. Legen Sie ein Pufferverzeichnis f?r die Warteschlange an, und geben
   Sie den Pfad mittels des ``sd``-Attributs an: siehe Abschnitt `Das
   Pufferverzeichnis
   anlegen <printing-intro-setup.html#printing-spooldir>`__.

#. Geben Sie den Ger?tenamen f?r Ihren Drucker mittels des
   ``lp``-Attributs an: siehe Abschnitt `Festlegen der
   Drucker-Ger?tedatei <printing-intro-setup.html#printing-device>`__.
   Ist Ihr Drucker ?ber eine serielle Schnittstelle angeschlossen,
   benutzen Sie das Attribut ``ms#``, wie dies in Abschnitt `Festlegen
   der
   Kommunikationsparameter <printing-intro-setup.html#printing-commparam>`__
   beschrieben ist.

#. Installieren Sie einen Filter f?r reinen Text: siehe Abschnitt `Den
   Textfilter
   installieren <printing-intro-setup.html#printing-textfilter>`__.

#. Testen Sie die Konfiguration, indem Sie etwas mit dem
   `lpr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lpr&sektion=1>`__-Befehl
   drucken. Die Abschnitte `Die Konfiguration
   testen <printing-intro-setup.html#printing-trying>`__ und
   `Fehlersuche und Problembehebung <printing-troubleshooting.html>`__
   enthalten weitere Informationen.

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Drucker, die eine Seitenbeschreibungssprache wie PostScript? verwenden,
k?nnen keinen reinen Text drucken. Es wird deshalb angenommen, dass Sie
nur solche Dateien drucken, die Ihr Drucker verarbeiten kann.

.. raw:: html

   </div>

Viele Anwender erwarten, dass sie normalen Text auf allen Druckern
drucken k?nnen. Viele Programme, die mit LPD zusammenarbeiten, gehen
ebenfalls von dieser Annahme aus. Wenn Sie einen PostScript?-Drucker
installieren, und Sie sowohl PostScript?- als auch Textdateien drucken
m?chten, sollten Sie einen weiteren Konfigurationsschritt ausf?hren und
einen Text-zu-PostScript?-Filter installieren. Der Abschnitt `Drucken
von reinen Textdateien auf einem
PostScript?-Drucker <printing-advanced.html#printing-advanced-if-conversion>`__
erkl?rt, wie Sie dies tun k?nnen.

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

10.3.1.5.1. Einen Namen w?hlen
''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Der erste einfache Schritt ist, einen Namen f?r Ihren Drucker zu w?hlen.
Sie k?nnen diesen Namen frei w?hlen, Sie sollten allerdings keine
Sonderzeichen oder Umlaute verwenden. Sie k?nnen mehrere Alias-Namen
vergeben.

Ein Drucker in ``/etc/printcap`` sollte den Alias ``lp`` haben. Dieser
Name wird standardm??ig von allen Druckbefehlen verwendet, wenn auf der
Befehlszeile oder in der ``PRINTER``-Umgebungsvariablen kein anderer
Drucker angegeben ist.

Ebenso ist es ?blich, eine ausf?hrliche Beschreibung des Druckermodells
als letzten Alias-Namen zu verwenden.

Sobald Sie einen Namen und einige einfache Alias-Namen ausgew?hlt haben,
tragen Sie sie in die Datei ``/etc/printcap`` ein. Beginnen Sie die
Zeile mit dem Namen des Druckers und f?gen Sie alle Alias-Namen an.
Trennen Sie die Namen durch den senkrechten Strich ``|``. F?gen Sie an
das Ende der Zeile einen Doppelpunkt ``:`` an.

Das folgende Beispiel definiert zwei Drucker, einen Diablo 630
Zeilendrucker, und einen Panasonic KX-P4455 PostScript?-Laserdrucker:

.. code:: programlisting

    #
    #  /etc/printcap for host rose
    #
    rattan|line|diablo|lp|Diablo 630 Line Printer:

    bamboo|ps|PS|S|panasonic|Panasonic KX-P4455 PostScript v51.4:

Der erste Drucker hat den Namen ``rattan``, und hat die Alias-Namen
``line``, ``diablo``, ``lp`` und ``Diablo 630 Line         Printer``. Da
er den Alias-Namen ``lp`` tr?gt, wird er standardm??ig von den
Druckprogrammen verwendet. Der zweite Drucker hei?t ``bamboo``, und hat
die Alias-Namen ``ps``, ``PS``, ``S``, ``panasonic`` und
``Panasonic KX-P4455 PostScript         v51.4``.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

10.3.1.5.2. Keine Deckbl?tter drucken
'''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Standardm??ig druckt das LPD-System ein *Deckblatt* vor jedem
Druckauftrag, die den Namen des Druckauftrags, den Benutzer und den
Computer angibt. W?hrend der Einrichtung des Systems und beim Testen
st?rt das Deckblatt allerdings, weshalb Sie sie zun?chst deaktivieren
sollten.

Um den Druck von Deckbl?ttern zu deaktivieren, f?gen Sie das Attribut
``sh`` zur Druckerdefinition in ``/etc/printcap`` hinzu. Hier ein
Beispiel:

.. code:: programlisting

    #
    #  /etc/printcap for host rose - no header pages anywhere
    #
    rattan|line|diablo|lp|Diablo 630 Line Printer:\
            :sh:

    bamboo|ps|PS|S|panasonic|Panasonic KX-P4455 PostScript v51.4:\
            :sh:

Beachten Sie die korrekte Formatierung: die beiden Definitionen beginnen
auf einer Zeile; weitere Zeilen der Definition sind mit einem
``Tab``-Zeichen einger?ckt, und alle Zeilen einer Definition, bis auf
die letzte, enden mit dem Backslash ``\``.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

10.3.1.5.3. Das Pufferverzeichnis anlegen
'''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Der n?chste Schritt ist, das *Pufferverzeichnis* anzulegen. In diesem
Verzeichnis werden Druckauftr?ge zwischengespeichert, w?hrend sie
gedruckt werden. Gleichzeitig werden hier auch einige Verwaltungsdateien
des Systems abgelegt.

Da sich die Dateien in diesem Verzeichnis h?ufig ?ndern, ist es ?blich,
das Verzeichnis unter ``/var/spool`` anzulegen. Es ist nicht notwendig,
Sicherungskopien der Dateien herzustellen; das Verzeichnis kann
n?tigenfalls leicht mit
`mkdir(1) <http://www.FreeBSD.org/cgi/man.cgi?query=mkdir&sektion=1>`__
wieder angelegt werden.

Es ist auch ?blich, dem Verzeichnis denselben Namen wie dem Drucker zu
geben:

.. code:: screen

    # mkdir /var/spool/printer-name

Wenn Sie viele Drucker verwenden, ist es am besten, wenn Sie f?r die
Pufferverzeichnisse ein eigenes Unterverzeichnis in ``/var/spool``
anlegen, wie dies hier f?r die beiden Beispieldrucker ``rattan`` und
``bamboo`` gezeigt wird:

.. code:: screen

    # mkdir /var/spool/lpd
    # mkdir /var/spool/lpd/rattan
    # mkdir /var/spool/lpd/bamboo

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Um zu verhindern, dass alle Benutzer den Inhalt aller Druckauftr?ge
einsehen k?nnen, sollten Sie die Rechte auf den Pufferverzeichnissen
einschr?nken. Die Verzeichnisse sollten dem Benutzer ``daemon`` und der
Gruppe ``daemon`` geh?ren, und auch nur vom Benutzer und der Gruppe
les-, schreib- und durchsuchbar sein. F?r unsere Beispieldrucker:

.. code:: screen

    # chown daemon:daemon /var/spool/lpd/rattan
    # chown daemon:daemon /var/spool/lpd/bamboo
    # chmod 770 /var/spool/lpd/rattan
    # chmod 770 /var/spool/lpd/bamboo

.. raw:: html

   </div>

Schlie?lich m?ssen Sie dem LPD-System noch mitteilen, wo Sie die
Pufferverzeichnisse angelegt haben. Dazu geben Sie in der Definition das
Attribut ``sd`` an:

.. code:: programlisting

    #
    #  /etc/printcap for host rose - added spooling directories
    #
    rattan|line|diablo|lp|Diablo 630 Line Printer:\
            :sh:sd=/var/spool/lpd/rattan:

    bamboo|ps|PS|S|panasonic|Panasonic KX-P4455 PostScript v51.4:\
            :sh:sd=/var/spool/lpd/bamboo:

Beachten Sie, dass der Druckername in der ersten Spalte beginnt, und
dass alle Folgezeilen mit einem ``Tab`` einger?ckt sind.

Wenn Sie das ``sd``-Attribut nicht angeben, verwendet das System
``/var/spool/lpd`` als Verzeichnis.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

10.3.1.5.4. Festlegen der Drucker-Ger?tedatei
'''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Nachdem Sie die korrekte Ger?tedatei f?r die Schnittstelle im Abschnitt
`Hardware-Konfiguration <printing-intro-setup.html#printing-hardware>`__
identifiziert und angelegt haben, m?ssen Sie dem LPD-System mitteilen,
welche Ger?tedatei im Verzeichnis ``/dev`` es f?r die Daten?bertragung
zum Drucker verwenden soll.

Geben Sie die Ger?tedatei durch das Attribut ``lp`` in ``/etc/printcap``
an.

Wenn ``rattan`` an die erste parallele Schnittstelle angeschlossen ist,
und ``bamboo`` an die sechste serielle, dann sieht ``/etc/printcap`` so
aus:

.. code:: programlisting

    #
    #  /etc/printcap for host rose - identified what devices to use
    #
    rattan|line|diablo|lp|Diablo 630 Line Printer:\
            :sh:sd=/var/spool/lpd/rattan:\
            :lp=/dev/lpt0:

    bamboo|ps|PS|S|panasonic|Panasonic KX-P4455 PostScript v51.4:\
            sh:sd=/var/spool/lpd/bamboo:\
            :lp=/dev/ttyu5:

Wenn Sie ``lp`` nicht angeben, versucht LPD die Ger?tedatei ``/dev/lp``
zu verwenden. ``/dev/lp`` ist zurzeit in FreeBSD nicht definiert.

Wenn Ihr Drucker ?ber eine parallele Schnittstelle angeschlossen ist,
k?nnen Sie mit dem Abschnitt `Den Textfilter
installieren <printing-intro-setup.html#printing-textfilter>`__
fortfahren. Verwenden Sie eine serielle Schnittstelle, beachten Sie
bitte den folgenden Abschnitt.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

10.3.1.5.5. Kommunikationsparameter festlegen
'''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

F?r seriell angeschlossene Drucker kann LPD die Geschwindigkeit, Parit?t
und weitere Kommunikationsparameter einstellen. Dies hat folgende
Vorteile:

.. raw:: html

   <div class="itemizedlist">

-  Sie k?nnen die Parameter einfach in ``/etc/printcap`` ?ndern, ohne
   das Ausgabe-Filterprogramm anpassen zu m?ssen.

-  Dasselbe Ausgabe-Filterprogramm kann f?r unterschiedliche Drucker
   verwendet werden, auch wenn diese unterschiedliche
   Kommunikationseinstellungen ben?tigen.

.. raw:: html

   </div>

Die folgenden Attribute legen die seriellen Kommunikationsparameter
fest:

.. raw:: html

   <div class="variablelist">

``br#Baudrate``
    Setzt die ?bertragungsgeschwindigkeit auf *``Baudrate``*.
    *``Baudrate``* kann ?blicherweise 50, 75, 110, 134.5, 150, 300, 600,
    1200, 1800, 2400, 4800, 9600, 19200, 38400, 57600, oder 115200 Bit
    pro Sekunde betragen.

``ms#stty-Modi``
    Setzt die Eigenschaften f?r das Ger?t, nachdem es ge?ffnet wurde.
    Die verf?gbaren Eigenschaften sind in
    `stty(1) <http://www.FreeBSD.org/cgi/man.cgi?query=stty&sektion=1>`__
    aufgef?hrt.

.. raw:: html

   </div>

Wenn LPD das mit ``lp`` angegebene Ger?t ?ffnet, setzt es die mit
``ms#`` angegebenen Eigenschaften. Von besonderem Interesse sind hier
die Modi ``parenb``, ``parodd``, ``cs5``, ``cs6``, ``cs7``, ``cs8``,
``cstopb``, ``crtscts`` und ``ixon``, die in der
`stty(1) <http://www.FreeBSD.org/cgi/man.cgi?query=stty&sektion=1>`__-Handbuchseite
erl?utert werden.

F?r den ?ber die sechste serielle Schnittstelle angeschlossenen
Laserdrucker betr?gt die Geschwindigkeit 38.400?Baud, und es werden
diese Kommunikationseinstellungen verwendet: keine Parit?t
(``-parenb``), 8-Bit-Zeichen (``cs8``), keine Modemsteuerung
(``clocal``) und Hardware-Flusssteuerung (``crtscts``):

.. code:: programlisting

    bamboo|ps|PS|S|panasonic|Panasonic KX-P4455 PostScript v51.4:\
            :sh:sd=/var/spool/lpd/bamboo:\
            :lp=/dev/ttyd5:ms#-parenb cs8 clocal crtscts:

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

10.3.1.5.6. Den Textfilter installieren
'''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Ein *Textfilter*, auch als *Eingangsfilter* bezeichnet, ist ein
Programm, das von LPD aufgerufen wird, wenn ein Druckauftrag verarbeitet
wird. Dabei wird die Standardeingabe des Programms mit der zu druckenden
Datei verbunden, und die Standardausgabe mit dem im ``lp``-Attribut
angegebenen Ger?t. Das Programm sollte nun die Datei einlesen, alle
?bersetzungen durchf?hren, die f?r den Drucker notwendig sind, und das
Ergebnis ?ber die Standardausgabe an den Drucker senden. Textfilter
werden im Abschnitt
`Filter <printing-advanced.html#printing-advanced-filters>`__ genauer
erl?utert.

Um einen einfachen Test durchzuf?hren, reicht ein kleines
Filterprogramm, dass schlicht ``/bin/cat`` aufruft, um die Daten
unver?ndert und den Drucker zu schicken. FreeBSD verf?gt ?ber das
Programm ``lpf``, das Unterstreichung und Fettdruck f?r solche Drucker
erm?glicht, die ansonsten dazu nicht in der Lage w?ren. Dar?berhinaus
gibt es viele andere Filter, die Sie einsetzen k?nnen. ``lpf`` wird im
Abschnitt `lpf: ein
Textfilter <printing-advanced.html#printing-advanced-lpf>`__ ausf?hrlich
beschrieben.

Legen Sie zun?chst das folgende Shell-Skript als
``/usr/local/libexec/if-simple`` mit Ihrem bevorzugten Texteditor an:

.. code:: programlisting

    #!/bin/sh
    #
    # if-simple - Simple text input filter for lpd
    # Installed in /usr/local/libexec/if-simple
    #
    # Simply copies stdin to stdout.  Ignores all filter arguments.

    /bin/cat && exit 0
    exit 2

Machen Sie die Datei ausf?hrbar:

.. code:: screen

    # chmod 555 /usr/local/libexec/if-simple

Konfigurieren Sie nun den Textfilter f?r Ihren Drucker in
``/etc/printcap``, indem Sie das ``if``-Attribut hinzuf?gen. Hier die
Konfiguration unserer beiden Beispieldrucker:

.. code:: programlisting

    #
    #  /etc/printcap for host rose - added text filter
    #
    rattan|line|diablo|lp|Diablo 630 Line Printer:\
            :sh:sd=/var/spool/lpd/rattan:\ :lp=/dev/lpt0:\
            :if=/usr/local/libexec/if-simple:

    bamboo|ps|PS|S|panasonic|Panasonic KX-P4455 PostScript v51.4:\
            :sh:sd=/var/spool/lpd/bamboo:\
            :lp=/dev/ttyu5:ms#-parenb cs8 clocal crtscts:\
            :if=/usr/local/libexec/if-simple:

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Das Shell-Skript ``if-simple`` steht im Verzeichnis
``/usr/share/examples/printing``.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

10.3.1.5.7. LPD aktivieren
''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

`lpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=lpd&sektion=8>`__ wird
von ``/etc/rc`` gestartet, wenn die
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5>`__-Variable
``lpd_enable`` auf ``YES`` gesetzt ist. F?gen Sie dazu diese Zeile in
``/etc/rc.conf`` hinzu:

.. code:: programlisting

    lpd_enable="YES"

Starten Sie Ihren Computer neu, oder starten Sie
`lpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=lpd&sektion=8>`__ von
Hand:

.. code:: screen

    # lpd

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

10.3.1.5.8. Die Konfiguration testen
''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Damit ist die einfache Konfiguration abgeschlossen. Noch muss die
Konfiguration aber getestet werden und etwaige Probleme m?ssen behoben
werden. Um die Konfiguration zu testen, sollten Sie einen Probeausdruck
mithilfe des Programms
`lpr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lpr&sektion=1>`__
produzieren.
`lpr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lpr&sektion=1>`__
?bergibt Druckauftr?ge an das LPD-System.

Sie k?nnen
`lpr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lpr&sektion=1>`__ mit
`lptest(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lptest&sektion=1>`__
kombinieren, um Testdaten zu drucken.
`lptest(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lptest&sektion=1>`__
wurde im Abschnitt `Kommunikation mit den Drucker
pr?fen <printing-intro-setup.html#printing-testing>`__ vorgestellt.

*So testen Sie die einfache LPD-Konfiguration:*

.. code:: screen

    # lptest 20 5 | lpr -PDruckername

Ersetzen Sie *``Druckername``* durch den Namen des Druckers, den Sie
testen m?chten. Wenn Sie den Standard-Drucker testen m?chten, rufen Sie
`lpr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lpr&sektion=1>`__ ohne
die Option ``-P`` auf. Wenn Sie einen Drucker testen m?chten, der nur
PostScript? versteht, m?ssen Sie ein PostScript?-Testprogramm an
`lpr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lpr&sektion=1>`__
?bergeben. Ein Testprogramm, das Sie in einer Datei gespeichert haben,
k?nnen Sie mit dem Befehl ``lpr Dateiname`` an das LPD-System ?bergeben.

Bei einem PostScript?-Drucker h?ngt das Ergebnis naturgem?? vom
Testprogramm ab. Wenn Sie
`lptest(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lptest&sektion=1>`__
verwenden, sollte das Ergebnis ungef?hr so aussehen:

.. code:: screen

    !"#$%&'()*+,-./01234
    "#$%&'()*+,-./012345
    #$%&'()*+,-./0123456
    $%&'()*+,-./01234567
    %&'()*+,-./012345678

Um sicherzustellen, dass alles richtig funktioniert, sollten Sie jetzt
ein gr??eres PostScript?-Programm senden. Mit
`lptest(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lptest&sektion=1>`__
k?nnen Sie gr??ere Datenmengen z.B. mit dem Befehl ``lptest 80 60``
erzeugen:
`lptest(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lptest&sektion=1>`__
produziert 60 Zeilen mit je 80 Zeichen.

Wenn Sie nicht erfolgreich drucken k?nnen, finden Sie im Abschnitt
`Fehlersuche und Problembehebung <printing-troubleshooting.html>`__
weitere Informationen.

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

+---------------------------------------------+---------------------------------+-------------------------------------------+
| `Zur?ck <printing-intro-spooler.html>`__?   | `Nach oben <printing.html>`__   | ?\ `Weiter <printing-advanced.html>`__    |
+---------------------------------------------+---------------------------------+-------------------------------------------+
| 10.2. Einf?hrung?                           | `Zum Anfang <index.html>`__     | ?10.4. Erweiterte Drucker-Konfiguration   |
+---------------------------------------------+---------------------------------+-------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
