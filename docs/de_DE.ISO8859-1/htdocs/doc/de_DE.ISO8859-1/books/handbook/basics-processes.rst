=============
4.7. Prozesse
=============

.. raw:: html

   <div class="navheader">

4.7. Prozesse
`Zur?ck <mount-unmount.html>`__?
Kapitel 4. Grundlagen des UNIX Betriebssystems
?\ `Weiter <basics-daemons.html>`__

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

4.7. Prozesse
-------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Da FreeBSD ein Multitasking-Betriebssystem ist, sieht es so aus, als ob
mehrere Prozesse zur gleichen Zeit laufen. Jedes Programm, das zu
irgendeiner Zeit l?uft, wird *Prozess* genannt. Jedes Kommando startet
mindestens einen Prozess. Einige Systemprozesse laufen st?ndig und
stellen die Funktion des Systems sicher.

Jeder Prozess wird durch eine eindeutige Nummer identifiziert, die
*Prozess-ID* oder *PID* genannt wird. Prozesse haben ebenso wie Dateien
einen Besitzer und eine Gruppe, die festlegen, welche Dateien und Ger?te
der Prozess benutzen kann. Dabei finden die vorher beschriebenen
Zugriffsrechte Anwendung. Die meisten Prozesse haben auch einen
Elternprozess, der sie gestartet hat. Wenn Sie in der Shell Kommandos
eingeben, dann ist die Shell ein Prozess und jedes Kommando, das Sie
starten, ist auch ein Prozess. Jeder Prozess, den Sie auf diese Weise
starten, besitzt den Shell-Prozess als Elternprozess. Die Ausnahme
hiervon ist ein spezieller Prozess, der
`init(8) <http://www.FreeBSD.org/cgi/man.cgi?query=init&sektion=8>`__
hei?t. ``init`` ist immer der erste Prozess und hat somit die PID 1.
``init`` wird vom Kernel beim Booten von FreeBSD gestartet.

Die Kommandos
`ps(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ps&sektion=1>`__ und
`top(1) <http://www.FreeBSD.org/cgi/man.cgi?query=top&sektion=1>`__ sind
besonders n?tzlich, um sich die Prozesse auf einem System anzusehen.
``ps`` zeigt eine statische Liste der laufenden Prozesse und kann deren
PID, Speicherverbrauch und die Kommandozeile, mit der sie gestartet
wurden und vieles mehr anzeigen. ``top`` zeigt alle laufenden Prozesse
an und aktualisiert die Anzeige, so dass Sie Ihrem Computer bei der
Arbeit zuschauen k?nnen.

Normal zeigt Ihnen ``ps`` nur die laufenden Prozesse, die Ihnen geh?ren.
Zum Beispiel:

.. code:: screen

    % ps
      PID  TT  STAT      TIME COMMAND
      298  p0  Ss     0:01.10 tcsh
     7078  p0  S      2:40.88 xemacs mdoc.xsl (xemacs-21.1.14)
    37393  p0  I      0:03.11 xemacs freebsd.dsl (xemacs-21.1.14)
    48630  p0  S      2:50.89 /usr/local/lib/netscape-linux/navigator-linux-4.77.bi
    48730  p0  IW     0:00.00 (dns helper) (navigator-linux-)
    72210  p0  R+     0:00.00 ps
      390  p1  Is     0:01.14 tcsh
     7059  p2  Is+    1:36.18 /usr/local/bin/mutt -y
     6688  p3  IWs    0:00.00 tcsh
    10735  p4  IWs    0:00.00 tcsh
    20256  p5  IWs    0:00.00 tcsh
      262  v0  IWs    0:00.00 -tcsh (tcsh)
      270  v0  IW+    0:00.00 /bin/sh /usr/X11R6/bin/startx -- -bpp 16
      280  v0  IW+    0:00.00 xinit /home/nik/.xinitrc -- -bpp 16
      284  v0  IW     0:00.00 /bin/sh /home/nik/.xinitrc
      285  v0  S      0:38.45 /usr/X11R6/bin/sawfish

Wie Sie sehen, gibt
`ps(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ps&sektion=1>`__
mehrere Spalten aus. In der ``PID`` Spalte findet sich die vorher
besprochene Prozess-ID. PIDs werden von 1 beginnend bis 99999 zugewiesen
und fangen wieder von vorne an, wenn die Grenze ?berschritten wird. Ist
eine PID bereits vergeben, wird diese allerdings nicht erneut vergeben.
Die Spalte ``TT`` zeigt den Terminal, auf dem das Programm l?uft.
``STAT`` zeigt den Status des Programms an und kann f?r die Zwecke
dieser Diskussion ebenso wie ``TT`` ignoriert werden. ``TIME`` gibt die
Zeit an, die das Programm auf der CPU gelaufen ist – dies ist nicht
unbedingt die Zeit, die seit dem Start des Programms vergangen ist, da
die meisten Programme haupts?chlich auf bestimmte Dinge warten, bevor
sie wirklich CPU-Zeit verbrauchen. Unter der Spalte ``COMMAND`` finden
Sie schlie?lich die Kommandozeile, mit der das Programm gestartet wurde.

`ps(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ps&sektion=1>`__
besitzt viele Optionen, um die angezeigten Informationen zu
beeinflussen. Eine n?tzliche Kombination ist ``auxww``. Mit ``a`` werden
Information ?ber alle laufenden Prozesse und nicht nur Ihrer eigenen
angezeigt. Der Name des Besitzers des Prozesses, sowie Informationen
?ber den Speicherverbrauch werden mit ``u`` angezeigt. ``x`` zeigt auch
D?monen-Prozesse an, und ``ww`` veranlasst
`ps(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ps&sektion=1>`__ die
komplette Kommandozeile f?r jeden Befehl anzuzeigen, anstatt sie
abzuschneiden, wenn sie zu lang f?r die Bildschirmausgabe wird.

Die Ausgabe von
`top(1) <http://www.FreeBSD.org/cgi/man.cgi?query=top&sektion=1>`__
sieht ?hnlich aus:

.. code:: screen

    % top
    last pid: 72257;  load averages:  0.13,  0.09,  0.03    up 0+13:38:33  22:39:10
    47 processes:  1 running, 46 sleeping
    CPU states: 12.6% user,  0.0% nice,  7.8% system,  0.0% interrupt, 79.7% idle
    Mem: 36M Active, 5256K Inact, 13M Wired, 6312K Cache, 15M Buf, 408K Free
    Swap: 256M Total, 38M Used, 217M Free, 15% Inuse

      PID USERNAME PRI NICE  SIZE    RES STATE    TIME   WCPU    CPU COMMAND
    72257 nik       28   0  1960K  1044K RUN      0:00 14.86%  1.42% top
     7078 nik        2   0 15280K 10960K select   2:54  0.88%  0.88% xemacs-21.1.14
      281 nik        2   0 18636K  7112K select   5:36  0.73%  0.73% XF86_SVGA
      296 nik        2   0  3240K  1644K select   0:12  0.05%  0.05% xterm
    48630 nik        2   0 29816K  9148K select   3:18  0.00%  0.00% navigator-linu
      175 root       2   0   924K   252K select   1:41  0.00%  0.00% syslogd
     7059 nik        2   0  7260K  4644K poll     1:38  0.00%  0.00% mutt
    ...

Die Ausgabe ist in zwei Abschnitte geteilt. In den ersten f?nf
Kopfzeilen finden sich die zuletzt zugeteilte PID, die Systemauslastung
(engl. *load average*), die Systemlaufzeit (die Zeit seit dem letzten
Reboot) und die momentane Zeit. Die weiteren Zahlen im Kopf beschreiben
wie viele Prozesse momentan laufen (im Beispiel 47), wie viel Speicher
und Swap verbraucht wurde und wie viel Zeit das System in den
verschiedenen CPU-Modi verbringt.

Darunter befinden sich einige Spalten mit ?hnlichen Informationen wie in
der Ausgabe von
`ps(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ps&sektion=1>`__. Wie
im vorigen Beispiel k?nnen Sie die PID, den Besitzer, die verbrauchte
CPU-Zeit und das Kommando erkennen.
`top(1) <http://www.FreeBSD.org/cgi/man.cgi?query=top&sektion=1>`__
zeigt auch den Speicherverbrauch des Prozesses an, der in zwei Spalten
aufgeteilt ist. Die erste Spalte gibt den gesamten Speicherverbrauch des
Prozesses an, in der zweiten Spalte wird der aktuelle Verbrauch
angegeben. Netscape? hat im gezeigten Beispiel insgesamt 30?MB Speicher
verbraucht. Momentan benutzt es allerdings nur 9?MB.

Die Anzeige wird von
`top(1) <http://www.FreeBSD.org/cgi/man.cgi?query=top&sektion=1>`__
automatisch alle zwei Sekunden aktualisiert. Der Zeitraum kann mit
``-s`` eingestellt werden.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------------------+-------------------------------+----------------------------------------------------+
| `Zur?ck <mount-unmount.html>`__?                | `Nach oben <basics.html>`__   | ?\ `Weiter <basics-daemons.html>`__                |
+-------------------------------------------------+-------------------------------+----------------------------------------------------+
| 4.6. Anh?ngen und Abh?ngen von Dateisystemen?   | `Zum Anfang <index.html>`__   | ?4.8. D?monen, Signale und Stoppen von Prozessen   |
+-------------------------------------------------+-------------------------------+----------------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
