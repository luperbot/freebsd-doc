===================================
29.4. Probleme bei PPP-Verbindungen
===================================

.. raw:: html

   <div class="navheader">

29.4. Probleme bei PPP-Verbindungen
`Zur?ck <ppp.html>`__?
Kapitel 29. PPP und SLIP
?\ `Weiter <pppoe.html>`__

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

29.4. Probleme bei PPP-Verbindungen
-----------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Beigetragen von Tom Rhodes.

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

Mit FreeBSD?8.0 wurde der
`sio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sio&sektion=4>`__-Treiber
durch den Treiber
`uart(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uart&sektion=4>`__
ersetzt. Parallel dazu wurden auch die entsprechenden Ger?tedateien f?r
die seriellen Ports umbenannt: ``/dev/cuadN`` wurde zu ``/dev/cuauN``,
``/dev/ttydN`` zu ``/dev/ttyuN``. Verwenden Sie noch FreeBSD?7.X, m?ssen
Sie dies beim Lesen der folgenden Abschnitte ber?cksichtigen.

.. raw:: html

   </div>

Dieser Abschnitt behandelt Probleme, die auftauchen k?nnen, wenn PPP
?ber ein Modem verwendet wird. Sie m?ssen beispielsweise genau die
Eingabeaufforderung des Systems kennen, in das Sie sich einw?hlen.
Einige ISPs verwenden ``ssword`` andere verwenden ``password``; wenn das
Einwahlskript falsch ist, scheitert die Anmeldung. ?blicherweise suchen
Sie nach Fehlern der PPP-Verbindung indem Sie sich manuell verbinden.
Wie das genau geht, wird im Folgenden gezeigt.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

29.4.1. Ger?tedateien ?berpr?fen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn Sie einen eigenen Kernel verwenden, stellen Sie sicher, dass die
folgende Zeile in der Kernelkonfigurationsdatei vorhanden ist:

.. code:: programlisting

    device   uart

Das ``uart``-Ger?t ist bereits im ``GENERIC``-Kernel vorhanden, deshalb
sind in diesem Fall keine zus?tzlichen Schritte vonn?ten. Kontrollieren
Sie die Ausgabe von ``dmesg``:

.. code:: screen

    # dmesg | grep uart

In der Ausgabe sollten die entsprechenden ``uart``-Ger?te,
beispielsweise ``uart1`` (``COM2``), angezeigt werden. Wird ein
passendes Ger?t angezeigt, brauchen Sie keinen neuen Kernel zu
erstellen. Wenn Ihr Modem an ``uart1`` angeschlossen ist (in DOS ist
dieser Anschluss als ``COM2`` bekannt), ist ``/dev/cuau1`` die
dazugeh?rende Ger?tedatei.

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

29.4.2. Manuelle Verbindungen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Ein Verbindungsaufbau zum Internet durch manuelle Steuerung von ``ppp``
geht schnell, ist einfach und stellt einen guten Weg dar, eine
Verbindung auf Fehler hin zu ?berpr?fen oder einfach Informationen
dar?ber zu sammeln, wie Ihr ISP Verbindungen handhabt. Lassen Sie uns
PPP von der Kommandozeile aus starten. Beachten Sie, dass in allen
Beispielen *example* der Hostname der Maschine ist, auf der PPP l?uft.
Sie starten ``ppp``, indem Sie einfach ``ppp`` eingeben:

.. code:: screen

    # ppp

Wir haben ``ppp`` nun gestartet.

.. code:: screen

    ppp ON example> set device /dev/cuau1

Wir geben das Device an, an das unser Modem angeschlossen ist. In diesem
Fall ist es ``cuau1``.

.. code:: screen

    ppp ON example> set speed 115200

Wir geben die Verbindungsgeschwindigkeit an. Im Beispiel verwenden wir
115200?kbps

.. code:: screen

    ppp ON example> enable dns

Wir weisen ``ppp`` an, unseren Resolver zu konfigurieren und in der
Datei ``/etc/resolv.conf`` Eintr?ge f?r den Nameserver hinzuzuf?gen.
Falls ``ppp`` unseren Hostnamen nicht bestimmen kann, geben wir diesen
sp?ter manuell an.

.. code:: screen

    ppp ON example> term

Wir wechseln in den „Terminal“-Modus, um das Modem manuell kontrollieren
zu k?nnen.

.. code:: programlisting

    deflink: Entering terminal mode on /dev/cuau1
    type '~h' for help

.. code:: screen

    at
    OK
    atdt123456789

Sie verwenden ``at`` zur Initialisierung Ihres Modems und dann ``atdt``
sowie die Nummer Ihres ISP, um den Einw?hlprozess zu starten.

.. code:: screen

    CONNECT

Dies ist die Best?tigung, dass eine Verbindung aufgebaut wurde. Falls
wir Verbindungsprobleme bekommen, die nicht mit der Hardware
zusammenh?ngen, werden wir an dieser Stelle ansetzen m?ssen, um eine
L?sung zu finden.

.. code:: screen

    ISP Login:myusername

Hier werden Sie nach einem Benutzernamen gefragt. Geben Sie am Prompt
den Namen ein, den Ihnen Ihr ISP zur Verf?gung gestellt hat.

.. code:: screen

    ISP Pass:mypassword

An dieser Stelle m?ssen Sie das Passwort angeben, das Ihnen von Ihrem
ISP vorgegeben wurde. Das Passwort wird, analog dem normalen
Anmeldevorgang, nicht angezeigt.

.. code:: screen

    Shell or PPP:ppp

Abh?ngig von Ihrem ISP, kann es sein, dass dieser Prompt bei Ihnen gar
nicht erscheint. Wir werden hier gefragt, ob wir eine Shell beim
Provider verwenden oder ``ppp`` starten wollen. Weil wir eine
Internetverbindung aufbauen wollen, haben wir uns in diesem Beispiel f?r
``ppp`` entschieden.

.. code:: screen

    Ppp ON example>

Beachten Sie, dass sich in diesem Beispiel das erste ``p`` in einen
Gro?buchstaben verwandelt hat. Dies zeigt, dass wir erfolgreich eine
Verbindung zu unserem ISP hergestellt haben.

.. code:: screen

    PPp ON example>

An dieser Stelle haben wir uns erfolgreich bei unserem ISP
authentifiziert und warten darauf, dass uns eine IP-Adresse zugewiesen
wird.

.. code:: screen

    PPP ON example>

Wir haben uns mit der Gegenstelle auf eine IP-Adresse geeinigt und den
Verbindungsaufbau erfolgreich abgeschlossen

.. code:: screen

    PPP ON example> add default HISADDR

Hier geben wir unsere Standardroute an. Weil zu diesem Zeitpunkt unsere
einzige Verbindung zu unserer Gegenstelle besteht, m?ssen wir dies tun,
bevor wir Kontakt zu unserer Umwelt aufnehmen k?nnen. Falls dies
aufgrund bestehender Routen nicht funktionieren sollte, k?nnen Sie ein
Ausrufungszeichen ``!`` vor ``add`` setzen. Sie k?nnen diese
Standardroute aber auch vor dem eigentlichen Verbindungsaufbau angeben
und PPP wird entsprechend eine neue Route aushandeln.

Wenn alles gut ging, sollten wir nun eine aktive Internetverbindung
haben, die wir mit **Ctrl**+**z** in den Hintergrund schicken k?nnen
Wenn sie feststellen, dass ``PPP`` wieder zu ``ppp`` wird, ist die
Verbindung abgebrochen. Es ist gut dies zu wissen, weil dadurch der
Verbindungsstatus angezeigt wird. Gro?e ``P``\ s zeigen an, dass wir
eine Verbindung zum ISP haben und kleine ``p``\ s zeigen an, dass wir
aus irgendeinem Grund die Verbindung verloren haben. ``ppp`` hat nur
diese beiden Zust?nde.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

29.4.2.1. Fehlersuche
^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn sie einen Direktanschluss haben und keine Verbindung aufbauen
k?nnen, schalten Sie die Hardware-Flusssteuerung CTS/RTS aus, indem Sie
die Option ``set ctsrts off`` verwenden. Dies ist zumeist dann der Fall,
wenn Sie mit einem PPP-f?higen Terminalserver verbunden sind. Hier
bleibt PPP bei dem Versuch h?ngen, Daten ?ber Ihre Nachrichtenverbindung
zu schicken, weil auf ein CTS-Signal (Clear-to-Send) gewartet wird, das
nie kommt. Wenn Sie diese Option jedoch gebrauchen, sollten Sie auch die
Option ``set accmap`` verwenden, die erforderlich sein kann, um
bestimmte Hardware zu kontrollieren, die auf die ?bertragung bestimmter
Zeichen zwischen den Kommunikations-Endpunkten (zumeist XON/XOFF)
angewiesen ist. Die Manual-Seite
`ppp(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ppp&sektion=8>`__
bietet mehr Informationen zu dieser Option und ihrer Verwendung.

Wenn Sie ein ?lteres Modem haben, ben?tigen Sie vielleicht die Option
``set parity even``. Standardm??ig wird keine Parit?t vorausgesetzt, sie
ist aber f?r die Fehlerpr?fung bei ?lteren Modems und bei bestimmten
ISPs erforderlich. Sie k?nnten diese Option f?r den ISP Compuserve
ben?tigen.

PPP kehrt m?glicherweise nicht in den Befehlsmodus zur?ck, was
normalerweise auf einen Fehler bei der Aushandlung hinweist, wobei der
ISP wartet, dass Ihre Seite den Aushandlungsprozess beginnt. Die Option
``~p`` erzwingt in diesem Fall den Beginn des Aushandlungsprozesses.

Wenn Sie nie einen Login-Prompt erhalten, m?ssen Sie statt des im
Beispiel gezeigten UNIX-Stils h?chst wahrscheinlich PAP oder CHAP f?r
die Authentifizierung verwenden. Um PAP oder CHAP zu verwenden, erg?nzen
Sie PPP einfach um folgende Optionen, bevor Sie in den Terminalmodus
wechseln:

.. code:: screen

    ppp ON example> set authname myusername

Hierbei sollte *``myusername``* durch den Benutzernamen ersetzt werden,
den Sie von Ihrem ISP bekommen haben.

.. code:: screen

    ppp ON example> set authkey mypassword

*``mypassword``* sollten Sie durch das Passwort ersetzen, das Ihnen Ihr
ISP gegeben hat.

Wenn die Verbindung aufgebaut wird, Sie aber keine Rechner unter ihrem
Dom?nen-Namen erreichen k?nnen, versuchen Sie, einen Rechner mit
`ping(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ping&sektion=8>`__
und seiner IP-Adresse zu erreichen. Wenn 100% der Pakete verloren gehen,
ist es sehr wahrscheinlich, dass Ihnen keine Standardroute zugewiesen
wurde. ?berpr?fen Sie, ob w?hrend des Verbindungsaufbaus die Option
``add default HISADDR`` gesetzt war. Wenn Sie zu einer entfernten
IP-Adresse eine Verbindung aufbauen k?nnen, ist es m?glich, dass die
Adresse eines Nameservers nicht in die Datei ``/etc/resolv.conf``
eingetragen wurde. Diese Datei sollte folgenderma?en aussehen:

.. code:: programlisting

    domain example.com
    nameserver x.x.x.x
    nameserver y.y.y.y

Dabei sollten *``x.x.x.x``* und *``y.y.y.y``* durch die IP-Adressen der
DNS-Server Ihres ISPs ersetzt werden. Diese Information ist Ihnen bei
Vertragsabschluss mitgeteilt worden. Wenn nicht, sollte ein Anruf bei
Ihrem ISP Abhilfe schaffen.

Mit
`syslog(3) <http://www.FreeBSD.org/cgi/man.cgi?query=syslog&sektion=3>`__
k?nnen Sie Ihre PPP-Verbindung protokollieren. F?gen Sie einfach die
folgende Zeile in ``/etc/syslog.conf`` ein:

.. code:: programlisting

    !ppp
    *.*     /var/log/ppp.log

In den meisten F?llen existiert diese Funktionalit?t bereits.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------+-------------------------------------+------------------------------------+
| `Zur?ck <ppp.html>`__?   | `Nach oben <ppp-and-slip.html>`__   | ?\ `Weiter <pppoe.html>`__         |
+--------------------------+-------------------------------------+------------------------------------+
| 29.3. Kernel-PPP?        | `Zum Anfang <index.html>`__         | ?29.5. PPP over Ethernet (PPPoE)   |
+--------------------------+-------------------------------------+------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
