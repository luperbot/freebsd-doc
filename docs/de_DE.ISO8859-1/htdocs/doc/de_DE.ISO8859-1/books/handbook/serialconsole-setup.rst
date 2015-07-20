======================================
28.6. Einrichten der seriellen Konsole
======================================

.. raw:: html

   <div class="navheader">

28.6. Einrichten der seriellen Konsole
`Zur?ck <dialout.html>`__?
Kapitel 28. Serielle Daten?bertragung
?\ `Weiter <ppp-and-slip.html>`__

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

28.6. Einrichten der seriellen Konsole
--------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Beigesteuert von Kazutaka YOKOTA.

.. raw:: html

   </div>

.. raw:: html

   <div>

Auf Grundlage eines Dokuments von Bill Paul.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="warning" xmlns="">

Warnung:
~~~~~~~~

Mit FreeBSD?8.0 wurden die Ger?tedateien f?r serielle Ports von
``/dev/ttydN`` in ``/dev/ttyuN`` umbenannt. Setzen Sie noch FreeBSD?7.X
ein, m?ssen Sie die Befehle in den folgenden Abschnitten entsprechend
anpassen.

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

28.6.1. Einf?hrung
~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD kann ein System mit einem Dumb-Terminal (unintelligente
Datenstation) an einer seriellen Schnittstelle als Konsole booten. Diese
Konfiguration ist besonders n?tzlich f?r Systemadministratoren, die
FreeBSD auf Systemen ohne Tastatur oder Monitor installieren wollen, und
Entwickler, die den Kernel oder Ger?tetreiber debuggen.

Wie in `Kapitel?13, *FreeBSDs Bootvorgang* <boot.html>`__ beschrieben,
besitzt FreeBSD drei Bootphasen. Der Code f?r die ersten beiden
Bootphasen befindet sich im Bootsektor am Anfang der FreeBSD-Slice der
Bootplatte. Dieser Bootblock l?dt den Bootloader (``/boot/loader``) in
Phase drei.

Um eine serielle Konsole einzurichten, m?ssen Sie den Bootblock, den
Bootloader und den Kernel konfigurieren.

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

28.6.2. Serielle Konsole einrichten, Kurzfassung
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dieser Abschnitt fasst zusammen, wie Sie eine serielle Konsole
einrichten. Es wird vorausgesetzt, dass Sie die Voreinstellungen
verwenden und wissen, wie serielle Schnittstellen verbunden werden.

.. raw:: html

   <div class="procedure">

#. Verbinden Sie die serielle Konsole mit ``COM1`` sowie dem
   Kontrollterminal.

#. Um die Startmeldungen der seriellen Konsole zu sehen, geben Sie als
   ``root`` Folgendes ein:

   .. code:: screen

       # echo 'console="comconsole"' >> /boot/loader.conf

#. ?ndern Sie in ``/etc/ttys`` den Eintrag f?r ``ttyu0`` von ``off`` auf
   ``on``. Zus?tzlich sollten Sie den Wert ``dialup`` auf ``vt100``
   ?ndern. Nur so wird auf der seriellen Konsole eine
   Eingabeaufforderung mit einer Passwortabfrage aktiviert.

#. Starten Sie nun das System neu, damit die serielle Konsole aktiviert
   wird.

.. raw:: html

   </div>

Wenn Sie eine unterschiedliche Konfiguration ben?tigen, sollten Sie
`Abschnitt?28.6.3, „Konfiguration der
Konsole“ <serialconsole-setup.html#serialconsole-howto>`__ lesen.

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

28.6.3. Konfiguration der Konsole
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="procedure">

#. Bereiten Sie ein serielles Kabel vor.

   Sie ben?tigen entweder ein Nullmodemkabel oder ein serielles Standard
   Kabel mit einem Nullmodemkabel-Adapter. In `Abschnitt?28.2.2, „Kabel
   und Schnittstellen“ <serial.html#serial-cables-ports>`__ wurden
   serielle Kabel beschrieben.

#. Trennen Sie die Tastatur vom Computer.

   Die meisten PC Systeme suchen beim Power On Self Test (POST) nach
   einer Tastatur und geben eine Fehlermeldung aus, wenn sie keine
   finden. Einige Maschinen werden sich sogar weigern, ohne Tastatur zu
   booten.

   Wenn Ihr Rechner trotz einer Fehlermeldung normal weiterbootet,
   brauchen Sie weiter nichts zu tun. Beispielsweise geben einige
   Maschinen mit einem Phoenix BIOS nur Keyboard failed aus und booten
   dann normal weiter.

   Wenn Ihr System ohne Tastatur nicht booten will, m?ssen Sie das BIOS
   so konfigurieren, das es diesen Fehler ignoriert (wenn das m?glich
   ist). Das Handbuch zu Ihrem Motherboard sollte beschreiben, wie das
   zu bewerkstelligen ist.

   .. raw:: html

      <div class="tip" xmlns="">

   Tipp:
   ~~~~~

   Selbst wenn Sie im BIOS „Not installed“ f?r die Tastatur einstellen,
   k?nnen Sie eine Tastatur angeschlossen haben und diese auch weiterhin
   benutzen, da sie mit dieser Anweisung das BIOS lediglich anweisen,
   nach dem Einschalten des Rechners nicht nach einer Tastatur zu suchen
   und den Rechner ohne entsprechende Fehlermeldung zu starten. Wenn die
   oben beschriebene Option nicht im BIOS vorhanden ist, halten Sie
   stattdessen Ausschau nach einer „Halt on Error“ Option. Sie k?nnen
   den gleichen Effekt wie oben erzielen, wenn Sie diese Option auf „All
   but Keyboard“ oder sogar „No Errors“ setzen.

   .. raw:: html

      </div>

   .. raw:: html

      <div class="note" xmlns="">

   Anmerkung:
   ~~~~~~~~~~

   Wenn Ihr System ?ber eine PS/2? Maus verf?gt, m?ssen Sie diese
   wahrscheinlich auch abziehen. Da sich die PS/2? Maus und die Tastatur
   einige Hardwarekomponenten teilen, kann das dazu f?hren, dass die
   Hardwareerkennung f?lschlicherweise eine Tastatur findet, wenn eine
   PS/2? Maus angeschlossen ist. Gateway 2000 Pentium 90?MHz Systemen
   wird dieses Verhalten nachgesagt. Normalerweise ist das kein Problem,
   da eine Maus ohne Tastatur sowieso nicht sinnvoll einsetzbar ist.

   .. raw:: html

      </div>

#. Schlie?en Sie einen Dumb-Terminal an ``COM1`` (``sio0``) an.

   Wenn Sie keinen Dumb-Terminal besitzen, k?nnen Sie einen alten PC/XT
   mit einem Terminalemulator oder die serielle Schnittstelle eines
   anderen UNIX? Rechners benutzen. Sie ben?tigen auf jeden Fall eine
   freie erste serielle Schnittstelle (``COM1``). Zurzeit ist es nicht
   m?glich, in den Bootbl?cken eine andere Schnittstelle zu
   konfigurieren, ohne diese neu zu kompilieren. Wenn Sie ``COM1``
   bereits f?r ein anderes Ger?t benutzen, m?ssen Sie dieses Ger?t
   tempor?r entfernen und einen neuen Bootblock sowie Kernel
   installieren, wenn Ihr FreeBSD erst einmal installiert ist. Auf einem
   Server sollte ``COM1`` ohnehin verf?gbar sein. Wenn Sie die
   Schnittstelle f?r ein anderes Ger?t benutzen und Sie dieses nicht auf
   ``COM2`` (``sio1``) legen k?nnen, sollten Sie sich nicht an erster
   Stelle mit dem Aufsetzen einer seriellen Konsole besch?ftigen.

#. Stellen Sie sicher, dass Ihre Kernelkonfiguration die richtigen
   Optionen f?r ``COM1`` (``sio0``) enth?lt.

   Relevante Optionen sind:

   .. raw:: html

      <div class="variablelist">

   ``0x10``
       Aktiviert die Konsolenunterst?tzung f?r dieses Ger?t. Zurzeit
       kann nur ein Ger?t die Konsolenunterst?tzung aktiviert haben. Das
       erste, in der Konfigurationsdatei aufgef?hrte Ger?t, mit dieser
       Option, verf?gt ?ber eine aktivierte Konsolenunterst?tzung.
       Beachten Sie, dass diese Option alleine nicht ausreicht, um die
       serielle Konsole zu aktivieren. Setzen Sie entweder noch die
       nachfolgend diskutierte Option oder verwenden Sie beim Booten,
       wie unten beschrieben, den Schalter ``-h``.

   ``0x20``
       Das erste Ger?t in der Kernelkonfigurationsdatei mit dieser
       Option wird, unabh?ngig von dem unten diskutierten Schalter
       ``-h``, zur Konsole. Die Option ``0x20`` muss zusammen mit
       ``0x10`` verwendet werden.

   ``0x40``
       Reserviert dieses Ger?t und sperrt es f?r normale Zugriffe. Sie
       sollten diese Option nicht auf dem Ger?t setzen, das Sie als
       serielle Konsole verwenden wollen. Der Zweck dieser Option ist
       es, dieses Ger?t f?r das Remote-Debuggen zu reservieren. Das
       `FreeBSD Developers'
       Handbook <../../../../doc/en_US.ISO8859-1/books/developers-handbook/index.html>`__
       enth?lt dazu weitere Informationen.

   .. raw:: html

      </div>

   Beispiel:

   .. code:: programlisting

       device sio0 at isa? port IO_COM1 tty flags 0x10 irq 4

   Weitere Einzelheiten entnehmen Sie bitte
   `sio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sio&sektion=4>`__.

   Wenn diese Optionen nicht gesetzt sind, m?ssen Sie auf einer anderen
   Konsole beim Booten UserConfig starten oder den Kernel neu
   kompilieren.

#. Erstellen Sie ``boot.config`` im Rootverzeichnis der ``a``-Partition
   des Bootlaufwerks.

   Der Code des Bootblocks entnimmt dieser Datei, wie Sie Ihr System
   booten m?chten. Um die serielle Konsole zu aktivieren, m?ssen Sie
   hier eine oder mehrere Optionen (alle in derselben Zeile) angeben.
   Die folgenden Optionen stehen zur Auswahl der Konsole zur Verf?gung:

   .. raw:: html

      <div class="variablelist">

   ``-h``
       Schaltet zwischen der internen und der seriellen Konsole um. Wenn
       Sie beispielsweise von der internen Konsole (Bildschirm) booten,
       weist ``-h`` den Bootloader und den Kernel an, die serielle
       Schnittstelle als Konsole zu nehmen. Wenn die Konsole normal auf
       der seriellen Schnittstelle liegt, w?hlen Sie mit ``-h`` den
       Bildschirm aus.

   ``-D``
       Schaltet zwischen Einzelkonsole und Dual-Konsole um. Die
       Einzelkonsole ist entweder die interne Konsole (der Bildschirm)
       oder die serielle Schnittstelle, je nach dem Stand von ``-h``. Im
       Dual-Konsolen Betrieb ist die Konsole, unabh?ngig von ``-h``,
       gleichzeitig der Bildschirm und die serielle Schnittstelle. Dies
       trifft aber nur zu, wenn der Bootblock ausgef?hrt wird. Sobald
       der Bootloader ausgef?hrt wird, wird die durch ``-h`` gegebene
       Konsole die alleinige Konsole.

   ``-P``
       Veranlasst den Bootblock nach einer Tastatur zu suchen. Wenn
       keine Tastatur gefunden wird, werden ``-D`` und ``-h``
       automatisch gesetzt.

       .. raw:: html

          <div class="note" xmlns="">

       Anmerkung:
       ~~~~~~~~~~

       Wegen Platzbeschr?nkungen in den Bootbl?cken kann ``-P`` nur
       erweiterte Tastaturen erkennen. Tastaturen mit weniger als 101
       Tasten (und ohne F11 und F12 Tasten) werden wahrscheinlich, wie
       vielleicht auch die Tastaturen einiger Laptops, nicht erkannt.
       Wenn dies bei Ihrem System der Fall ist, k?nnen Sie ``-P`` nicht
       verwenden, da es leider noch keine Umgehung f?r dieses Problem
       gibt.

       .. raw:: html

          </div>

   .. raw:: html

      </div>

   Benutzen Sie also entweder ``-P``, um die Konsole automatisch zu
   setzen, oder ``-h``, um die serielle Konsole zu verwenden.

   In ``boot.config`` k?nnen Sie auch andere, in
   `boot(8) <http://www.FreeBSD.org/cgi/man.cgi?query=boot&sektion=8>`__
   beschriebene Optionen, aufnehmen.

   Mit Ausnahme von ``-P`` werden die Optionen an den Bootloader
   (``/boot/loader``) weitergegeben. Der Bootloader untersucht dann
   einzig ``-h`` um festzustellen, welches Ger?t die Konsole wird. Wenn
   Sie also nur ``-D`` angegeben haben, k?nnen Sie die serielle
   Schnittstelle nur als Konsole verwenden w?hrend der Bootblock
   ausgef?hrt wird. Danach wird der Bootloader, da ja ``-h`` fehlt, den
   Bildschirm zur Konsole machen.

#. Booten Sie die Maschine.

   Wenn Sie das FreeBSD-System starten, werden die Bootbl?cke den Inhalt
   von ``/boot.config`` auf der Konsole ausgeben:

   .. code:: screen

       /boot.config: -P
       Keyboard: no

   Die zweite Zeile sehen Sie nur, wenn Sie in ``/boot.config`` ``-P``
   angegeben haben. Sie zeigt an, ob eine Tastatur angeschlossen ist
   oder nicht. Die Meldungen gehen je nach den Einstellungen in
   ``/boot.config`` auf die interne Konsole, die serielle Konsole, oder
   beide Konsolen.

   .. raw:: html

      <div class="informaltable">

   +-------------------------+------------------------------------------+
   | Optionen                | Meldungen erscheinen auf                 |
   +=========================+==========================================+
   | keine                   | der internen Konsole                     |
   +-------------------------+------------------------------------------+
   | ``-h``                  | der seriellen Konsole                    |
   +-------------------------+------------------------------------------+
   | ``-D``                  | der seriellen und der internen Konsole   |
   +-------------------------+------------------------------------------+
   | ``-Dh``                 | der seriellen und der internen Konsole   |
   +-------------------------+------------------------------------------+
   | ``-P``, mit Tastatur    | der internen Konsole                     |
   +-------------------------+------------------------------------------+
   | ``-P``, ohne Tastatur   | der seriellen Konsole                    |
   +-------------------------+------------------------------------------+

   .. raw:: html

      </div>

   Nach den oben gezeigten Meldungen gibt es eine kleine Verz?gerung
   bevor die Bootbl?cke den Bootloader laden und weitere Meldungen auf
   der Konsole erscheinen. Sie k?nnen die Ausf?hrung der Bootbl?cke
   unterbrechen, um zu ?berpr?fen, ob auch alles richtig aufgesetzt ist,
   brauchen das aber unter normalen Umst?nden nicht zu tun.

   Dr?cken Sie eine Taste au?er **Enter** um den Bootvorgang zu
   unterbrechen. Sie erhalten dann ein Prompt, an dem Sie weitere
   Eingaben t?tigen k?nnen:

   .. code:: screen

       >> FreeBSD/i386 BOOT
       Default: 0:ad(0,a)/boot/loader
       boot:

   Je nach Inhalt von ``/boot.config`` erscheint das Prompt auf der
   seriellen Konsole, der internen Konsole oder beiden Konsolen. Wenn
   die Meldung auf der richtigen Konsole erscheint, dr?cken Sie
   **Enter** um fortzufahren.

   Wenn Sie das Prompt auf der seriellen Konsole erwartet haben, dort
   aber nichts sehen, liegt ein Fehler in Ihren Einstellungen vor. Als
   Umgehung geben Sie an der momentanen Konsole ``-h`` ein, um den
   Bootblock und den Bootloader auf die serielle Konsole umzustellen.
   F?hren Sie dann den Bootvorgang mit **Enter** weiter und wenn das
   System gebootet hat, k?nnen Sie die fehlerhaften Einstellungen
   korrigieren.

.. raw:: html

   </div>

Nachdem der Bootloader geladen wurde und Sie sich in der dritten
Bootphase befinden, k?nnen Sie immer noch zwischen der internen und der
seriellen Konsole ausw?hlen. Setzen Sie dazu, wie in `Abschnitt?28.6.6,
„Die Konsole im Bootloader
?ndern“ <serialconsole-setup.html#serialconsole-loader>`__ beschrieben,
die entsprechenden Variablen des Bootloaders.

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

28.6.4. Zusammenfassung
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die folgende ?bersicht zeigt, welche Konsole, abh?ngig von den
getroffenen Einstellungen, ausgew?hlt wird.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

28.6.4.1. Fall 1: Option 0x10 f?r ``sio0``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. code:: programlisting

    device sio0 at isa? port IO_COM1 tty flags 0x10 irq 4

.. raw:: html

   <div class="informaltable">

+--------------------------------+------------------------------+-------------------------+---------------------+
| Optionen in ``/boot.config``   | Konsole in den Bootbl?cken   | Konsole im Bootloader   | Konsole im Kernel   |
+================================+==============================+=========================+=====================+
| keine                          | interne                      | interne                 | interne             |
+--------------------------------+------------------------------+-------------------------+---------------------+
| ``-h``                         | serielle                     | serielle                | serielle            |
+--------------------------------+------------------------------+-------------------------+---------------------+
| ``-D``                         | serielle und interne         | interne                 | interne             |
+--------------------------------+------------------------------+-------------------------+---------------------+
| ``-Dh``                        | serielle und interne         | serielle                | serielle            |
+--------------------------------+------------------------------+-------------------------+---------------------+
| ``-P``, mit Tastatur           | interne                      | interne                 | interne             |
+--------------------------------+------------------------------+-------------------------+---------------------+
| ``-P``, ohne Tastatur          | serielle und interne         | serielle                | serielle            |
+--------------------------------+------------------------------+-------------------------+---------------------+

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

28.6.4.2. Fall 2: Option 0x30 f?r ``sio0``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. code:: programlisting

    device sio0 at isa? port IO_COM1 tty flags 0x30 irq 4

.. raw:: html

   <div class="informaltable">

+--------------------------------+------------------------------+-------------------------+---------------------+
| Optionen in ``/boot.config``   | Konsole in den Bootbl?cken   | Konsole im Bootloader   | Konsole im Kernel   |
+================================+==============================+=========================+=====================+
| keine                          | interne                      | interne                 | serielle            |
+--------------------------------+------------------------------+-------------------------+---------------------+
| ``-h``                         | serielle                     | serielle                | serielle            |
+--------------------------------+------------------------------+-------------------------+---------------------+
| ``-D``                         | serielle und interne         | interne                 | serielle            |
+--------------------------------+------------------------------+-------------------------+---------------------+
| ``-Dh``                        | serielle und interne         | serielle                | serielle            |
+--------------------------------+------------------------------+-------------------------+---------------------+
| ``-P``, mit Tastatur           | interne                      | interne                 | serielle            |
+--------------------------------+------------------------------+-------------------------+---------------------+
| ``-P``, ohne Tastatur          | serielle und interne         | serielle                | serielle            |
+--------------------------------+------------------------------+-------------------------+---------------------+

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

28.6.5. Hinweise zur seriellen Konsole
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

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

28.6.5.1. Verwenden einer h?heren Geschwindigkeit
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Vorgabewerte f?r die Kommunikationsparameter der seriellen
Schnittstelle sind: 9600?baud, 8?Bit, keine Parit?t und ein Stopp-Bit.
Wenn Sie die Standardgeschwindigkeit ?ndern wollen, haben Sie folgende
M?glichkeiten:

.. raw:: html

   <div class="itemizedlist">

-  Geben Sie die neue Konsolengeschwindigkeit mit
   ``BOOT_COMCONSOLE_SPEED`` an und kompilieren Sie die Bootbl?cke neu.
   Ausf?hrliche Informationen zum Bau und zur Installation von neuen
   Bootbl?cken finden Sie im `Abschnitt?28.6.5.2, „Eine andere
   Schnittstelle als ``sio0``
   benutzen“ <serialconsole-setup.html#serialconsole-com2>`__ des
   Handbuchs.

   Wenn die serielle Konsole nicht mit der Option ``-h`` gestartet wird,
   oder wenn die verwendete serielle Konsole sich von der von den
   Bootbl?cken verwendeten unterscheidet, m?sssen Sie zus?tzlich die
   folgende Option in Ihre Kernelkonfigurationsdatei aufnehmen und den
   Kernel neu bauen:

   .. code:: programlisting

       options CONSPEED=19200

-  Verwenden Sie die Option ``-S``, um den Kernel zu booten. Die Option
   ``-S`` kann auch in die Datei ``/boot.config`` aufgenommen werden.
   Eine Beschreibung dieses Vorgangs sowie eine Auflistung der von
   ``/boot.config`` unterst?tzten Optionen finden Sie in der Manualpage
   `boot(8) <http://www.FreeBSD.org/cgi/man.cgi?query=boot&sektion=8>`__.

-  Aktivieren Sie die Option ``comconsole_speed`` in der Datei
   ``/boot/loader.conf``.

   Diese Option setzt voraus, dass auch die Optionen ``console``,
   ``boot_serial``, sowie ``boot_multicons`` in der Datei
   ``/boot/loader.conf`` gesetzt sind. Im Folgenden finden Sie ein
   Beispiel, in dem ``comconsole_speed`` verwendet wird, um die
   Geschwindigkeit der seriellen Konsole zu ?ndern:

   .. code:: programlisting

       boot_multicons="YES"
       boot_serial="YES"
       comconsole_speed="115200"
       console="comconsole,vidconsole"

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

28.6.5.2. Eine andere Schnittstelle als ``sio0`` benutzen
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn Sie, warum auch immer, ein anderes Ger?t als ``sio0`` f?r die
serielle Konsole einsetzen wollen, kompilieren Sie bitte die Bootbl?cke,
den Bootloader und den Kernel nach dem folgenden Verfahren neu.

.. raw:: html

   <div class="procedure">

#. Installieren Sie die Kernelquellen (siehe `Kapitel?26, *FreeBSD
   aktualisieren* <updating-upgrading.html>`__).

#. Setzen Sie in ``/etc/make.conf`` ``BOOT_COMCONSOLE_PORT`` auf die
   Adresse der Schnittstelle (0x3F8, 0x2F8, 0x3E8 oder 0x2E8), die Sie
   benutzen m?chten. Sie k?nnen nur ``sio0`` bis ``sio3`` (``COM1`` bis
   ``COM4``) benutzen, Multiportkarten k?nnen Sie nicht als Konsole
   benutzen. Interrupts m?ssen Sie hier nicht angeben.

#. Erstellen Sie eine angepasste Kernelkonfiguration und geben Sie dort
   die richtigen Optionen f?r die Schnittstelle, die Sie benutzen
   m?chten, an. Wenn Sie zum Beispiel ``sio1`` (``COM2``) zur Konsole
   machen wollen, geben Sie dort entweder

   .. code:: programlisting

       device sio1 at isa? port IO_COM2 tty flags 0x10 irq 3

   oder

   .. code:: programlisting

       device sio1 at isa? port IO_COM2 tty flags 0x30 irq 3

   an. Keine andere serielle Schnittstelle sollte als Konsole definiert
   werden.

#. ?bersetzen und installieren Sie die Bootbl?cke und den Bootloader:

   .. code:: screen

       # cd /sys/boot
       # make clean
       # make
       # make install

#. Bauen und installieren Sie einen neuen Kernel.

#. Schreiben Sie die Bootbl?cke mit
   `bsdlabel(8) <http://www.FreeBSD.org/cgi/man.cgi?query=bsdlabel&sektion=8>`__
   auf die Bootplatte und booten Sie den neuen Kernel.

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

28.6.5.3. DDB Debugger ?ber die serielle Schnittstelle
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn Sie den Kerneldebugger ?ber eine serielle Verbindung bedienen
m?chten (n?tzlich, kann aber gef?hrlich sein, wenn auf der Leitung
falsche BREAK-Signale generiert werden), sollten Sie einen Kernel mit
den folgenden Optionen erstellen:

.. code:: programlisting

    options BREAK_TO_DEBUGGER
    options DDB

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

28.6.5.4. Benutzung der seriellen Konsole zum Anmelden
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Da Sie schon die Bootmeldungen auf der Konsole verfolgen k?nnen und den
Kerneldebugger ?ber die Konsole bedienen k?nnen, wollen Sie sich
vielleicht auch an der Konsole anmelden.

?ffnen Sie ``/etc/ttys`` in einem Editor und suchen Sie nach den
folgenden Zeilen:

.. code:: programlisting

    ttyu0 "/usr/libexec/getty std.9600" unknown off secure
    ttyu1 "/usr/libexec/getty std.9600" unknown off secure
    ttyu2 "/usr/libexec/getty std.9600" unknown off secure
    ttyu3 "/usr/libexec/getty std.9600" unknown off secure

``ttyu0`` bis ``ttyu3`` entsprechen ``COM1`` bis ``COM4``. ?ndern Sie
f?r die entsprechende Schnittstelle ``off`` zu ``on``. Wenn Sie auch die
Geschwindigkeit der seriellen Schnittstelle ge?ndert haben, m?ssen Sie
``std.9600`` auf die momentane Geschwindigkeit, zum Beispiel
``std.19200``, anpassen.

Sie sollten auch den Terminaltyp von ``unknown`` auf den tats?chlich
verwendeten Terminal setzen.

Damit die ?nderungen an der Datei wirksam werden, m?ssen Sie noch
``kill -HUP 1`` absetzen.

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

28.6.6. Die Konsole im Bootloader ?ndern
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In den vorigen Abschnitten wurde beschrieben, wie Sie die serielle
Konsole durch ?nderungen im Bootblock aktivieren. Dieser Abschnitt zeigt
Ihnen, wie Sie mit Kommandos und Umgebungsvariablen die Konsole im
Bootloader definieren. Da der Bootloader die dritte Phase im Bootvorgang
ist und nach den Bootbl?cken ausgef?hrt wird, ?berschreiben seine
Einstellungen die des Bootblocks.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

28.6.6.1. Festlegen der Konsole
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Mit einer einzigen Zeile in ``/boot/loader.conf`` k?nnen Sie den
Bootloader und den Kernel anweisen, die serielle Schnittstelle zur
Konsole zu machen:

.. code:: programlisting

    console="comconsole"

Unabh?ngig von den Einstellungen im Bootblock legt dies die Konsole
fest.

Die obige Zeile sollte die erste Zeile in ``/boot/loader.conf`` sein, so
dass Sie die Bootmeldungen so fr?h wie m?glich auf der Konsole sehen.

Analog k?nnen Sie die interne Konsole verwenden:

.. code:: programlisting

    console="vidconsole"

Wenn Sie ``console`` nicht setzen, bestimmt der Bootloader (und damit
auch der Kernel) die Konsole ?ber die ``-h`` Option des Bootblocks.

Sie k?nnen die Bootkonsole in ``/boot/loader.conf.local`` oder
``/boot/loader.conf`` angeben.

Weitere Informationen erhalten Sie in
`loader.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=loader.conf&sektion=5>`__.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Momentan gibt es im Bootloader nichts vergleichbares zu ``-P`` im
Bootblock. Damit kann die Konsole nicht automatisch ?ber das
Vorhandensein einer Tastatur festgelegt werden.

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

28.6.6.2. Eine andere Schnittstelle als ``sio0`` benutzen
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Sie m?ssen den Bootloader neu kompilieren, wenn Sie eine andere
Schnittstelle als ``sio0`` benutzen wollen. Folgen Sie der Anleitung aus
`Abschnitt?28.6.5.2, „Eine andere Schnittstelle als ``sio0``
benutzen“ <serialconsole-setup.html#serialconsole-com2>`__.

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

28.6.7. Vorbehalte
~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Hinter dem ganzen steckt die Idee, Server ohne Hardware f?r Grafik und
ohne Tastatur zu betreiben. Obwohl es die meisten Systeme erlauben, ohne
Tastatur zu booten, gibt es leider nur wenige Systeme, die ohne eine
Grafikkarte booten. Maschinen mit einem AMI BIOS k?nnen ohne Grafik
booten, indem Sie den Grafikadapter im CMOS-Setup auf ``Not installed``
setzen.

Viele Maschinen unterst?tzen diese Option allerdings nicht. Damit diese
Maschinen booten, m?ssen sie ?ber eine Grafikkarte, auch wenn es nur
eine alte Monochromkarte ist, verf?gen. Allerdings brauchen Sie keinen
Monitor an die Karte anzuschlie?en. Sie k?nnen nat?rlich auch versuchen,
auf diesen Maschinen ein AMI BIOS zu installieren.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------+------------------------------------+-------------------------------------+
| `Zur?ck <dialout.html>`__?       | `Nach oben <serialcomms.html>`__   | ?\ `Weiter <ppp-and-slip.html>`__   |
+----------------------------------+------------------------------------+-------------------------------------+
| 28.5. Verbindungen nach Au?en?   | `Zum Anfang <index.html>`__        | ?Kapitel 29. PPP und SLIP           |
+----------------------------------+------------------------------------+-------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
