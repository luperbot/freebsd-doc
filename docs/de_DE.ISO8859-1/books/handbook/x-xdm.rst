==========================
6.6. Der X-Display-Manager
==========================

.. raw:: html

   <div class="navheader">

6.6. Der X-Display-Manager
`Zur?ck <x-fonts.html>`__?
Kapitel 6. Das X-Window-System
?\ `Weiter <x11-wm.html>`__

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

6.6. Der X-Display-Manager
--------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Beigetragen von Seth Kingsley.

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

6.6.1. Einf?hrung
~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Der *X-Display-Manager* (XDM), eine optionale Komponente des
X-Window-Systems, verwaltet Sitzungen. Er kann mit vielen Komponenten,
wie minimal ausgestatteten X-Terminals, Arbeitsplatz-Rechnern und
leistungsf?higen Netzwerkservern, nutzbringend eingesetzt werden. Da das
X-Window-System netzwerktransparent ist, gibt es zahlreiche
M?glichkeiten, X-Clients und X-Server auf unterschiedlichen Rechnern im
Netz laufen zu lassen. XDM stellt eine grafische Anmeldemaske zur
Verf?gung, in der Sie den Rechner, auf dem eine Sitzung laufen soll,
ausw?hlen k?nnen und in der Sie die n?tigen
Autorisierungs-Informationen, wie Benutzername und Passwort, eingeben
k?nnen.

Die Funktion des X-Display-Managers l?sst sich mit der von
`getty(8) <http://www.FreeBSD.org/cgi/man.cgi?query=getty&sektion=8>`__
(siehe `Abschnitt?28.3.2, „Konfiguration“ <term.html#term-config>`__)
vergleichen. Er meldet den Benutzer am ausgesuchten System an, startet
ein Programm (meist einen Window-Manager) und wartet darauf, dass dieses
Programm beendet wird, das hei?t der Benutzer die Sitzung beendet hat.
Nachdem die Sitzung beendet ist, zeigt XDM den grafischen
Anmeldebildschirm f?r den n?chsten Benutzer an.

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

6.6.2. XDM einrichten
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Um XDM verwenden zu k?nnen, installieren Sie den Port
`x11/xdm <http://www.freebsd.org/cgi/url.cgi?ports/x11/xdm/pkg-descr>`__
(dieser wird standardm?ssig nicht in aktuellen Xorg-Versionen
mitinstalliert). Der XDM-D?mon befindet sich dann in
``/usr/local/bin/xdm`` und kann jederzeit von ``root`` gestartet werden.
Er verwaltet dann den X-Bildschirm des lokalen Rechners. XDM l?sst sich
bequem mit einem Eintrag in ``/etc/ttys`` (siehe `Abschnitt?28.3.2.1,
„Hinzuf?gen eines Eintrags in
``/etc/ttys``\ “ <term.html#term-etcttys>`__) bei jedem Start des
Rechners aktivieren. In ``/etc/ttys`` sollte schon der nachstehende
Eintrag vorhanden sein:

.. code:: programlisting

    ttyv8   "/usr/local/bin/xdm -nodaemon"  xterm   off secure

In der Voreinstellung ist dieser Eintrag nicht aktiv. Um den Eintrag zu
aktivieren, ?ndern Sie den Wert in Feld?5 von ``off`` zu ``on`` und
starten Sie
`init(8) <http://www.FreeBSD.org/cgi/man.cgi?query=init&sektion=8>`__
entsprechend der Anleitung in `Abschnitt?28.3.2.2, „\ ``init`` zwingen,
``/etc/ttys`` erneut zu lesen“ <term.html#term-hup>`__ neu. Das erste
Feld gibt den Namen des Terminals an, auf dem das Programm l?uft. Im
Beispiel wird ``ttyv8`` verwendet, das hei?t XDM l?uft auf dem neunten
virtuellen Terminal.

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

6.6.3. XDM konfigurieren
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das Verhalten und Aussehen von XDM steuern Sie mit
Konfigurationsdateien, die im Verzeichnis ``/usr/local/lib/X11/xdm``
stehen. ?blicherweise finden Sie dort die folgenden Dateien vor:

.. raw:: html

   <div class="informaltable">

+------------------+------------------------------------------------------------------------+
| Datei            | Beschreibung                                                           |
+==================+========================================================================+
| ``Xaccess``      | Regelsatz, der zur Autorisierung von Clients benutzt wird.             |
+------------------+------------------------------------------------------------------------+
| ``Xresources``   | Vorgabewerte f?r X-Ressourcen.                                         |
+------------------+------------------------------------------------------------------------+
| ``Xservers``     | Liste mit lokalen und entfernten Bildschirmen, die verwaltet werden.   |
+------------------+------------------------------------------------------------------------+
| ``Xsession``     | Vorgabe f?r das Startskript der Sitzung.                               |
+------------------+------------------------------------------------------------------------+
| ``Xsetup_*``     | Skript, das dazu dient, Anwendungen vor der Anmeldung zu starten.      |
+------------------+------------------------------------------------------------------------+
| ``xdm-config``   | Konfiguration f?r alle auf der Maschine verwalteten Bildschirme.       |
+------------------+------------------------------------------------------------------------+
| ``xdm-errors``   | Fehlermeldungen des Servers.                                           |
+------------------+------------------------------------------------------------------------+
| ``xdm-pid``      | Die Prozess-ID des gerade laufenden XDM-Prozesses.                     |
+------------------+------------------------------------------------------------------------+

.. raw:: html

   </div>

Im Verzeichnis ``/usr/local/lib/X11/xdm`` befinden sich auch noch
Skripten und Programme, die zum Einrichten der XDM-Oberfl?che dienen.
Der Zweck dieser Dateien und der Umgang mit ihnen wird in der Hilfeseite
`xdm(1) <http://www.FreeBSD.org/cgi/man.cgi?query=xdm&sektion=1>`__
erkl?rt. Wir gehen im Folgenden nur kurz auf ein paar der Dateien ein.

Die vorgegebene Einstellung zeigt ein rechteckiges Anmeldefenster, in
dem der Rechnername in gro?er Schrift steht. Darunter befinden sich die
Eingabeaufforderungen ``Login:`` und ``Password:``. Mit dieser Maske
k?nnen Sie anfangen, wenn Sie das Erscheinungsbild von XDM ver?ndern
wollen.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.6.3.1. Xaccess
^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Verbindungen zu XDM werden ?ber das „X Display Manager Connection
Protocol“ (XDMCP) hergestellt. XDMCP-Verbindungen von entfernten
Maschinen werden ?ber den Regelsatz in ``Xaccess`` kontrolliert. Diese
Datei wird allerdings ignoriert, wenn in ``xdm-config`` keine
Verbindungen entfernter Maschinen erlaubt sind (dies ist auch die
Voreinstellung).

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

6.6.3.2. Xresources
^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In dieser Datei kann das Erscheinungsbild der Bildschirmauswahl und der
Anmeldemasken festgelegt werden. Das Format entspricht den Dateien im
Verzeichnis ``app-defaults``, die in der X11-Dokumentation beschrieben
sind.

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

6.6.3.3. Xservers
^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Diese Datei enth?lt eine Liste entfernter Maschinen, die in der
Bildschirmauswahl angeboten werden.

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

6.6.3.4. Xsession
^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dieses Skript wird vom XDM aufgerufen, nachdem sich ein Benutzer
erfolgreich angemeldet hat. ?blicherweise besitzt jeder Benutzer eine
angepasste Version dieses Skripts in ``~/.xsession``, das dann anstelle
von ``Xsession`` ausgef?hrt wird.

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

6.6.3.5. Xsetup\_\*
^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Diese Skripten werden automatisch ausgef?hrt bevor die Bildschirmauswahl
oder die Anmeldemasken angezeigt werden. F?r jeden lokalen Bildschirm
gibt es ein Skript, dessen Namen aus ``Xsetup_`` gefolgt von der
Bildschirmnummer gebildet wird (zum Beispiel ``Xsetup_0``).
Normalerweise werden damit ein oder zwei Programme, wie ``xconsole``, im
Hintergrund gestartet.

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

6.6.3.6. xdm-config
^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Diese Datei enth?lt Einstellungen, die f?r jeden verwalteten Bildschirm
zutreffen. Das Format entspricht dem der Dateien aus ``app-defaults``.

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

6.6.3.7. xdm-errors
^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Ausgaben jedes X-Servers, den XDM versucht zu starten, werden in
dieser Datei gesammelt. Wenn ein von XDM verwalteter Bildschirm aus
unbekannten Gr?nden h?ngen bleibt, sollten Sie in dieser Datei nach
Fehlermeldungen suchen. F?r jede Sitzung werden die Meldungen auch in
die Datei ``~/.xsession-errors`` des Benutzers geschrieben.

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

6.6.4. Einrichten eines Bildschirm-Servers auf dem Netzwerk
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Damit sich Clients mit dem Bildschirm-Server verbinden k?nnen, muss der
Zugriffsregelsatz editiert und der Listener aktiviert werden. Die
Vorgabewerte sind sehr restriktiv eingestellt. Damit XDM Verbindungen
annimmt, kommentieren Sie eine Zeile in der ``xdm-config`` Datei aus:

.. code:: programlisting

    ! SECURITY: do not listen for XDMCP or Chooser requests
    ! Comment out this line if you want to manage X terminals with xdm
    DisplayManager.requestPort:     0

Starten Sie danach XDM neu. Beachten Sie, dass Kommentare in den
Ressourcen-Konfigurationsdateien mit einem ``!`` anstelle des sonst
?blichen Zeichens ``#`` beginnen. Wenn Sie strengere Zugriffskontrollen
einrichten wollen, sehen Sie sich die Beispiele in ``Xaccess`` und die
Hilfeseite
`xdm(1) <http://www.FreeBSD.org/cgi/man.cgi?query=xdm&sektion=1>`__ an.

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

6.6.5. XDM ersetzen
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Es gibt mehrere Anwendungen, die XDM ersetzen k?nnen, zum Beispiel KDM,
der Teil von KDE ist und sp?ter in diesem Kapitel besprochen wird. KDM
ist ansprechender gestaltet und bietet neben einigen Schn?rkeln die
M?glichkeit, den zu verwendenden Window-Manager bei der Anmeldung
auszuw?hlen.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+-------------------------------+-------------------------------+
| `Zur?ck <x-fonts.html>`__?           | `Nach oben <x11.html>`__      | ?\ `Weiter <x11-wm.html>`__   |
+--------------------------------------+-------------------------------+-------------------------------+
| 6.5. Schriftarten in X11 benutzen?   | `Zum Anfang <index.html>`__   | ?6.7. Grafische Oberfl?chen   |
+--------------------------------------+-------------------------------+-------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
