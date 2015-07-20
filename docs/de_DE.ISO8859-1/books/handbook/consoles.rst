=====================================
4.2. Virtuelle Konsolen und Terminals
=====================================

.. raw:: html

   <div class="navheader">

4.2. Virtuelle Konsolen und Terminals
`Zur?ck <basics.html>`__?
Kapitel 4. Grundlagen des UNIX Betriebssystems
?\ `Weiter <permissions.html>`__

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

4.2. Virtuelle Konsolen und Terminals
-------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Sie k?nnen FreeBSD mit einem Terminal benutzen, der nur Text darstellen
kann. Wenn Sie FreeBSD auf diese Weise benutzen, stehen Ihnen alle
M?glichkeiten eines UNIX? Betriebssystems zur Verf?gung. Dieser
Abschnitt beschreibt was Terminals und Konsolen sind und wie sie unter
FreeBSD eingesetzt werden.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.2.1. Die Konsole
~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn Ihr FreeBSD-System ohne eine graphische Benutzeroberfl?che startet,
wird am Ende des Systemstarts, nachdem die Startskripten gelaufen sind,
ein Anmeldeprompt ausgegeben. Die letzten Startmeldungen sollten ?hnlich
wie die Folgenden aussehen:

.. code:: screen

    Additional ABI support:.
    Local package initialization:.
    Additional TCP options:.

    Fri Sep 20 13:01:06 EEST 2002

    FreeBSD/i386 (pc3.example.org) (ttyv0)

    login:

Beachten Sie die letzten beiden Zeilen der Ausgabe, die vorletzte
lautet:

.. code:: programlisting

    FreeBSD/i386 (pc3.example.org) (ttyv0)

Diese Zeile enth?lt einige Informationen ?ber das gerade gestartete
System. Die Ausgabe stammt von der FreeBSD-Konsole einer Maschine mit
einem Intel oder Intel-kompatiblen Prozessor der
x86-Architektur`:sup:`[1]` <#ftn.idp69935056>`__. Der Name des Systems
(jedes UNIX? System besitzt einen Namen) ist ``pc3.example.org`` und die
Ausgabe stammt von der Systemkonsole, dem Terminal ``ttyv0``.

Das Ende der Ausgabe ist immer die Aufforderung zur Eingabe eines
Benutzernamens:

.. code:: programlisting

    login:

Der Anmeldevorgang wird im n?chsten Abschnitt erl?utert.

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

4.2.2. Der Anmeldevorgang
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD ist ein Mehrbenutzersystem, das Multitasking unterst?tzt. Das
hei?t mehrere Benutzer k?nnen gleichzeitig viele Programme auf einem
System laufen lassen.

Jedes Mehrbenutzersystem muss die Benutzer voneinander unterscheiden
k?nnen. Bei FreeBSD und allen anderen UNIX?-artigen Betriebssystemen
wird dies dadurch erreicht, dass sich die Benutzer anmelden m?ssen,
bevor sie Programme laufen lassen k?nnen. Jeder Benutzer besitzt einen
eindeutigen Namen (den Account) und ein dazugeh?rendes Passwort, die
beide bei der Anmeldung abgefragt werden.

Nachdem FreeBSD gestartet ist und die
Startskripten`:sup:`[2]` <#ftn.idp69942224>`__, gelaufen sind, erscheint
eine Aufforderung zur Eingabe des Benutzernamens:

.. code:: screen

    login:

Wenn Ihr Benutzername beispielsweise ``john`` ist, geben Sie jetzt
``john`` gefolgt von **Enter** ein. Sie sollten dann eine Aufforderung
zur Eingabe des Passworts erhalten:

.. code:: screen

    login: john
    Password:

Geben Sie jetzt das Passwort von ``john`` gefolgt von **Enter** ein. Das
Passwort wird aus Sicherheitsgr?nden nicht auf dem Bildschirm angezeigt.

Wenn Sie das richtige Passwort eingegeben haben, sind Sie am System
angemeldet und k?nnen nun alle verf?gbaren Kommandos absetzen.

Anmgemeldet sind Sie, wenn Sie die Tagesmeldungen (*message of today*)
gefolgt von einer Eingabeaufforderung (dem Zeichen ``#``, ``$`` oder
``%``) gesehen haben.

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

4.2.3. Virtuelle Konsolen
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Da FreeBSD mehrere Programme gleichzeitig laufen lassen kann, ist eine
einzige Konsole, an der Kommandos abgesetzt werden k?nnen, zu wenig.
Abhilfe schaffen virtuelle Konsolen, die mehrere Konsolen zur Verf?gung
stellen.

Die Anzahl der virtuellen Konsolen unter FreeBSD k?nnen Sie einstellen.
Zwischen den einzelnen Konsolen k?nnen Sie mit speziellen
Tastenkombinationen wechseln. Jede Konsole verf?gt ?ber einen eigenen
Ausgabekanal und FreeBSD ordnet die Tastatureingaben und Monitorausgaben
der richtigen Konsole zu, wenn Sie zwischen den Konsolen wechseln.

Zum Umschalten der Konsolen stellt FreeBSD spezielle Tastenkombinationen
bereit`:sup:`[3]` <#ftn.idp69976144>`__. Benutzen Sie **Alt**+**F1**,
**Alt**+**F2** bis **Alt**+**F8**, um zwischen den verschiedenen
Konsolen umzuschalten.

Wenn Sie zu einer anderen Konsole wechseln, sichert FreeBSD den
Bildschirminhalt und gibt den Bildschirminhalt der neuen Konsole aus.
Dies erzeugt die Illusion mehrerer Bildschirme und Tastaturen, an denen
Sie Kommandos absetzen k?nnen. Wenn eine Konsole nicht sichtbar ist,
weil Sie auf eine andere Konsole gewechselt haben, laufen die dort
abgesetzten Kommandos weiter.

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

4.2.4. ``/etc/ttys``
~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In der Voreinstellung stehen unter FreeBSD acht virtuelle Konsolen zur
Verf?gung, deren Anzahl Sie leicht erh?hen oder verringern k?nnen. Die
Anzahl und Art der Konsolen wird in ``/etc/ttys`` eingestellt.

Jede Zeile in ``/etc/ttys``, die nicht mit ``#`` anf?ngt, konfiguriert
einen Terminal oder eine virtuelle Konsole. In der Voreinstellung werden
in dieser Datei neun virtuelle Konsolen definiert, von denen acht
aktiviert sind. Die Konsolen sind in den Zeilen, die mit ``ttyv``
beginnen, definiert:

.. code:: programlisting

    # name  getty                           type    status          comments
    #
    ttyv0   "/usr/libexec/getty Pc"         cons25  on  secure
    # Virtual terminals
    ttyv1   "/usr/libexec/getty Pc"         cons25  on  secure
    ttyv2   "/usr/libexec/getty Pc"         cons25  on  secure
    ttyv3   "/usr/libexec/getty Pc"         cons25  on  secure
    ttyv4   "/usr/libexec/getty Pc"         cons25  on  secure
    ttyv5   "/usr/libexec/getty Pc"         cons25  on  secure
    ttyv6   "/usr/libexec/getty Pc"         cons25  on  secure
    ttyv7   "/usr/libexec/getty Pc"         cons25  on  secure
    ttyv8   "/usr/X11R6/bin/xdm -nodaemon"  xterm   off secure

Die Hilfeseite
`ttys(5) <http://www.FreeBSD.org/cgi/man.cgi?query=ttys&sektion=5>`__
enth?lt eine ausf?hrliche Beschreibung der Spalten dieser Datei und der
Optionen, die Sie zum Konfigurieren der virtuellen Konsolen benutzen
k?nnen.

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

4.2.5. Die Konsole im Single-User-Modus
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Eine eingehende Beschreibung des Single-User-Modus finden Sie in
`Abschnitt?13.6.2, „Der Single-User
Modus“ <boot-init.html#boot-singleuser>`__. Im Single-User-Modus steht
Ihnen nur *eine* Konsole zur Verf?gung. Die Definition dieser Konsole
befindet sich ebenfalls in ``/etc/ttys``. Suchen Sie nach einer Zeile,
die mit ``console`` beginnt:

.. code:: programlisting

    # name  getty                           type    status          comments
    #
    # If console is marked "insecure", then init will ask for the root password
    # when going to single-user mode.
    console none                            unknown off secure

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

In der Zeile, die mit ``console`` beginnt, k?nnen Sie ``secure`` durch
``insecure`` ersetzen. Wenn Sie danach in den Single-User-Modus booten,
verlangt das System ebenfalls die Eingabe des ``root``-Passworts.

*Setzen Sie ``insecure`` nicht leichtfertig ein.* Wenn Sie das Passwort
von ``root`` vergessen, wird es schwierig, in den Single-User-Modus zu
gelangen, wenn Sie den FreeBSD-Boot-Prozess nicht genau verstehen.

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

4.2.6. Den Videomodus der Konsole anpassen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Der Standard-Videomodus der FreeBSD-Konsole kann auf jeden Modus
eingestellt werden, der von Ihrer Grafikkarte und Ihrem Monitor
unterst?tzt wird (beispielsweise 1024x768 oder 1280x1024). Wollen Sie
eine andere Einstellung verwenden, m?ssen Sie das ``VESA``-Modul laden:

.. code:: screen

    # kldload vesa

Um festzustellen welche Video-Modi von Ihrer Hardware unterst?tzt
werden, nutzen Sie das Werkzeug
`vidcontrol(1) <http://www.FreeBSD.org/cgi/man.cgi?query=vidcontrol&sektion=1>`__.
Um beispielsweise einer Liste aller unterst?tzten Modi zu erhalten,
verwenden Sie den folgenden Befehl:

.. code:: screen

    # vidcontrol -i mode

Als Ergebnis erhalten Sie eine Liste aller Videomodi, die von Ihrer
Hardware unterst?tzt werden. Sie w?hlen einen neuen Modus aus, indem Sie
den entsprechenden Wert (wiederum als Benutzer ``root``) an
`vidcontrol(1) <http://www.FreeBSD.org/cgi/man.cgi?query=vidcontrol&sektion=1>`__
?bergeben:

.. code:: screen

    # vidcontrol MODE_279

Um diese Einstellung dauerhaft zu speichern, m?ssen Sie die folgende
Zeile in die Datei ``/etc/rc.conf`` aufnehmen:

.. code:: programlisting

    allscreens_flags="MODE_279"

.. raw:: html

   </div>

.. raw:: html

   <div class="footnotes">

--------------

.. raw:: html

   <div id="ftn.idp69935056" class="footnote">

`:sup:`[1]` <#idp69935056>`__\ Genau das ist mit ``i386`` gemeint. Auch
wenn Ihr System keine Intel 386?CPU besitzt, wird ``i386`` ausgegeben.
Es wird immer die Architektur und nicht der Typ des Prozessors
ausgegeben.

.. raw:: html

   </div>

.. raw:: html

   <div id="ftn.idp69942224" class="footnote">

`:sup:`[2]` <#idp69942224>`__\ Startskripten sind Programme, die FreeBSD
automatisch bei jedem Startvorgang ausf?hrt. Der Zweck der Skripte
besteht darin, das System zu konfigurieren und n?tzliche Dienste im
Hintergrund zu starten.

.. raw:: html

   </div>

.. raw:: html

   <div id="ftn.idp69976144" class="footnote">

`:sup:`[3]` <#idp69976144>`__\ Eine recht technische und genaue
Beschreibung der FreeBSD-Konsole und der Tastatur-Treiber finden Sie in
den Hilfeseiten
`syscons(4) <http://www.FreeBSD.org/cgi/man.cgi?query=syscons&sektion=4>`__,
`atkbd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=atkbd&sektion=4>`__,
`vidcontrol(1) <http://www.FreeBSD.org/cgi/man.cgi?query=vidcontrol&sektion=1>`__
und
`kbdcontrol(1) <http://www.FreeBSD.org/cgi/man.cgi?query=kbdcontrol&sektion=1>`__.
Lesen Sie diese Seiten, wenn Sie an den Einzelheiten interessiert sind.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------------------+-------------------------------+------------------------------------+
| `Zur?ck <basics.html>`__?                         | `Nach oben <basics.html>`__   | ?\ `Weiter <permissions.html>`__   |
+---------------------------------------------------+-------------------------------+------------------------------------+
| Kapitel 4. Grundlagen des UNIX Betriebssystems?   | `Zum Anfang <index.html>`__   | ?4.3. Zugriffsrechte               |
+---------------------------------------------------+-------------------------------+------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
