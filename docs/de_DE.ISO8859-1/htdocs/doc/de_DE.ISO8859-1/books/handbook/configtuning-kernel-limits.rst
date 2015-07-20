======================================
12.14. Einstellungen von Kernel Limits
======================================

.. raw:: html

   <div class="navheader">

12.14. Einstellungen von Kernel Limits
`Zur?ck <configtuning-disk.html>`__?
Kapitel 12. Konfiguration und Tuning
?\ `Weiter <adding-swap-space.html>`__

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

12.14. Einstellungen von Kernel Limits
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

12.14.1. Datei und Proze? Limits
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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

12.14.1.1. ``kern.maxfiles``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Abh?ngig von den Anforderungen Ihres Systems kann ``kern.maxfiles``
erh?ht oder erniedrigt werden. Die Variable legt die maximale Anzahl von
Dateideskriptoren auf Ihrem System fest. Wenn die Dateideskriptoren
aufgebraucht sind, werden Sie die Meldung file: table is full wiederholt
im Puffer f?r Systemmeldungen sehen. Den Inhalt des Puffers k?nnen Sie
sich mit ``dmesg`` anzeigen lassen.

Jede offene Datei, jedes Socket und jede FIFO verbraucht einen
Dateideskriptor. Auf „dicken“ Produktionsservern k?nnen leicht Tausende
Dateideskriptoren ben?tigt werden, abh?ngig von der Art und Anzahl der
gleichzeitig laufenden Dienste.

In ?lteren FreeBSD-Versionen wurde die Voreinstellung von
``kern.maxfile`` aus der Kernelkonfigurationsoption ``maxusers``
bestimmt. ``kern.maxfiles`` w?chst proportional mit dem Wert von
``maxusers``. Wenn Sie einen angepassten Kernel kompilieren, empfiehlt
es sich diese Option entsprechend der maximalen Benutzerzahl Ihres
Systems einzustellen. Obwohl auf einer Produktionsmaschine vielleicht
nicht 256 Benutzer gleichzeitig angemeldet sind, k?nnen die ben?tigten
Ressourcen ?hnlich denen eines gro?en Webservers sein.

Die Variable ``kern.maxusers`` wird beim Systemstart automatisch aus dem
zur Verf?gung stehenden Hauptspeicher bestimmt. Im laufenden Betrieb
kann dieser Wert aus der (nur lesbaren) sysctl-Variable
``kern.maxusers`` ermittelt werden. Falls ein System f?r diese Variable
einen anderen Wert ben?tigt, kann der Wert ?ber den Loader angepasst
werden. H?ufig verwendete Werte sind dabei 64, 128, sowie 256. Es ist
empfehlenswert, die Anzahl der Dateideskriptoren nicht auf einen Wert
gr??er 256 zu setzen, es sei denn, Sie ben?tigen wirklich eine riesige
Anzahl von ihnen. Viele der von ``kern.maxusers`` auf einen Standardwert
gesetzten Parameter k?nnen beim Systemstart oder im laufenden Betrieb in
``/boot/loader.conf`` (sehen Sie sich dazu auch
`loader.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=loader.conf&sektion=5>`__
sowie ``/boot/defaults/loader.conf`` an) an Ihre Bed?rfnisse angepasst
werden, so wie es bereits an anderer Stelle dieses Dokuments beschrieben
ist.

?ltere FreeBSD-Versionen setzen diesen Wert selbst, wenn Sie in der
Konfigurationsdatei den Wert ``0`` `:sup:`[5]` <#ftn.idp76756944>`__
angeben. Wenn Sie den Wert selbst bestimmen wollen, sollten Sie
``maxusers`` mindestens auf ``4`` setzen. Dies gilt insbesondere dann,
wenn Sie beabsichtigen, das X?Window-System zu benutzen oder Software zu
kompilieren. Der Grund daf?r ist, dass der wichtigste Wert, der durch
``maxusers`` bestimmt wird, die maximale Anzahl an Prozessen ist, die
auf ``20 + 16 * maxusers`` gesetzt wird. Wenn Sie also ``maxusers`` auf
1 setzen, k?nnen gleichzeitig nur 36 Prozesse laufen, von denen ungef?hr
18 schon beim Booten des Systems gestartet werden. Dazu kommen nochmals
etwa 15 Prozesse beim Start des X?Window-Systems. Selbst eine einfache
Aufgabe wie das Lesen einer Manualpage ben?tigt neun Prozesse zum
Filtern, Dekomprimieren und Betrachten der Datei. F?r die meisten
Benutzer sollte es ausreichen, ``maxusers`` auf 64 zu setzen, womit 1044
gleichzeitige Prozesse zur Verf?gung stehen. Wenn Sie allerdings den
gef?rchteten Fehler proc table full beim Start eines Programms oder auf
einem Server mit einer gro?en Benutzerzahl (wie ``ftp.FreeBSD.org``)
sehen, dann sollten Sie den Wert nochmals erh?hen und den Kernel neu
bauen.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Die Anzahl der Benutzer, die sich auf einem Rechner anmelden kann, wird
durch ``maxusers`` *nicht* begrenzt. Der Wert dieser Variablen legt
neben der m?glichen Anzahl der Prozesse eines Benutzers weitere
sinnvolle Gr??en f?r bestimmte Systemtabellen fest.

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

12.14.1.2. ``kern.ipc.somaxconn``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Variable ``kern.ipc.somaxconn`` beschr?nkt die Gr??e der
Warteschlange (*Listen-Queue*) f?r neue TCP-Verbindungen. Der
Vorgabewert von ``128`` ist normalerweise zu klein, um neue Verbindungen
auf einem stark ausgelasteten Webserver zuverl?ssig zu handhaben. Auf
solchen Servern sollte der Wert auf ``1024`` oder h?her gesetzt werden.
Ein Dienst (z.B.
`sendmail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sendmail&sektion=8>`__,
oder Apache) kann die Gr??e der Queue selbst einschr?nken. Oft gibt es
die M?glichkeit, die Gr??e der Listen-Queue in einer Konfigurationsdatei
einzustellen. Eine gro?e Listen-Queue ?bersteht vielleicht auch einen
Denial of Service Angriff (DoS).

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

12.14.2. Netzwerk Limits
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Kerneloption ``NMBCLUSTERS`` schreibt die Anzahl der Netzwerkpuffer
(Mbufs) fest, die das System besitzt. Eine zu geringe Anzahl Mbufs auf
einem Server mit viel Netzwerkverkehr verringert die Leistung von
FreeBSD. Jeder Mbuf-Cluster nimmt ungef?hr 2?kB Speicher in Anspruch, so
dass ein Wert von 1024 insgesamt 2?Megabyte Speicher f?r Netzwerkpuffer
im System reserviert. Wie viele Cluster ben?tigt werden, l?sst sich
durch eine einfache Berechnung herausfinden. Wenn Sie einen Webserver
besitzen, der maximal 1000 gleichzeitige Verbindungen servieren soll und
jede der Verbindungen je einen 16?kB gro?en Puffer zum Senden und
Empfangen braucht, brauchen Sie ungef?hr 32?MB Speicher f?r
Netzwerkpuffer. Als Daumenregel verdoppeln Sie diese Zahl, so dass sich
f?r ``NMBCLUSTERS`` der Wert 2x32?MB?/?2?kB?= 32768 ergibt. F?r
Maschinen mit viel Speicher sollten Werte zwischen 4096 und 32768
genommen werden. Sie k?nnen diesen Wert nicht willk?rlich erh?hen, da
dies bereits zu einem Absturz beim Systemstart f?hren kann. Mit der
Option ``-m`` von
`netstat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=netstat&sektion=1>`__
k?nnen Sie den Gebrauch der Netzwerkpuffer kontrollieren.

Die Netzwerkpuffer k?nnen beim Systemstart mit der Loader-Variablen
``kern.ipc.nmbclusters`` eingestellt werden. Nur auf ?lteren
FreeBSD-Systemen m?ssen Sie die Kerneloption ``NMBCLUSTERS`` verwenden.

Die Anzahl der
`sendfile(2) <http://www.FreeBSD.org/cgi/man.cgi?query=sendfile&sektion=2>`__
Puffer muss auf ausgelasteten Servern, die den Systemaufruf
`sendfile(2) <http://www.FreeBSD.org/cgi/man.cgi?query=sendfile&sektion=2>`__
oft verwenden, vielleicht erh?ht werden. Dazu k?nnen Sie die
Kerneloption ``NSFBUFS`` verwenden oder die Anzahl der Puffer in
``/boot/loader.conf`` (siehe
`loader(8) <http://www.FreeBSD.org/cgi/man.cgi?query=loader&sektion=8>`__)
setzen. Die Puffer sollten erh?ht werden, wenn Sie Prozesse im Zustand
``sfbufa`` sehen. Die schreibgesch?tzte sysctl-Variable
``kern.ipc.nsfbufs`` zeigt die Anzahl eingerichteten Puffer im Kernel.
Der Wert dieser Variablen wird normalerweise von ``kern.maxusers``
bestimmt. Manchmal muss die Pufferanzahl jedoch manuell eingestellt
werden.

.. raw:: html

   <div class="important" xmlns="">

Wichtig:
~~~~~~~~

Auch wenn ein Socket nicht blockierend angelegt wurde, kann der Aufruf
von
`sendfile(2) <http://www.FreeBSD.org/cgi/man.cgi?query=sendfile&sektion=2>`__
blockieren, um auf freie ``struct sf_buf`` Puffer zu warten.

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

12.14.2.1. ``net.inet.ip.portrange.*``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die sysctl-Variable ``net.inet.ip.portrange.*`` legt die Portnummern f?r
TCP- und UDP-Sockets fest. Es gibt drei Bereiche: den niedrigen Bereich,
den normalen Bereich und den hohen Bereich. Die meisten Netzprogramme
benutzen den normalen Bereich. Dieser Bereich umfasst in der
Voreinstellung die Portnummern 500 bis 5000 und wird durch die Variablen
``net.inet.ip.portrange.first`` und ``net.inet.ip.portrange.last``
festgelegt. Die festgelegten Bereiche f?r Portnummern werden von
ausgehenden Verbindungen benutzt. Unter bestimmten Umst?nden,
beispielsweise auf stark ausgelasteten Proxy-Servern, sind alle
Portnummern f?r ausgehende Verbindungen belegt. Bereiche f?r Portnummern
spielen auf Servern keine Rolle, die haupts?chlich eingehende
Verbindungen verarbeiten (wie ein normaler Webserver) oder nur eine
begrenzte Anzahl ausgehender Verbindungen ?ffnen (beispielsweise ein
Mail-Relay). Wenn Sie keine freien Portnummern mehr haben, sollten Sie
die Variable ``net.inet.ip.portrange.last`` langsam erh?hen. Ein Wert
von ``10000``, ``20000`` oder ``30000`` ist angemessen. Beachten Sie
auch eine vorhandene Firewall, wenn Sie die Bereiche f?r Portnummern
?ndern. Einige Firewalls sperren gro?e Bereiche (normalerweise aus den
kleinen Portnummern) und erwarten, dass hohe Portnummern f?r ausgehende
Verbindungen verwendet werden. Daher kann es erforderlich sein, den Wert
von ``net.inet.ip.portrange.first`` zu erh?hen.

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

12.14.2.2. TCP Bandwidth Delay Product Begrenzung
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die TCP Bandwidth Delay Product Begrenzung gleicht TCP/Vegas von NetBSD.
Die Begrenzung wird aktiviert, indem Sie die sysctl-Variable
``net.inet.tcp.inflight.enable`` auf den Wert ``1`` setzen. Das System
wird dann versuchen, f?r jede Verbindung, das Produkt aus der
?bertragungsrate und der Verz?gerungszeit zu bestimmen. Dieses Produkt
begrenzt die Datenmenge, die f?r einen optimales Durchsatz
zwischengespeichert werden muss.

Diese Begrenzung ist n?tzlich, wenn Sie Daten ?ber Verbindungen mit
einem hohen Produkt aus ?bertragungsrate und Verz?gerungszeit wie
Modems, Gigabit-Ethernet oder schnellen WANs, zur Verf?gung stellen.
Insbesondere wirkt sich die Begrenzung aus, wenn die Verbindung die
TCP-Option *Window-scaling* verwendet oder gro?e Sende-Fenster (*send
window*) benutzt. Schalten Sie die Debug-Meldungen aus, wenn Sie die
Begrenzung aktiviert haben. Dazu setzen Sie die Variable
``net.inet.tcp.inflight.debug`` auf ``0``. Auf Produktions-Systemen
sollten Sie zudem die Variable ``net.inet.tcp.inflight.min`` mindestens
auf den Wert ``6144`` setzen. Allerdings kann ein zu hoher Wert,
abh?ngig von der Verbindung, die Begrenzungsfunktion unwirksam machen.
Die Begrenzung reduziert die Datenmenge in den Queues von Routern und
Switches, sowie die Datenmenge in der Queue der lokalen Netzwerkkarte.
Die Verz?gerungszeit (*Round Trip Time*) f?r interaktive Anwendungen
sinkt, da weniger Pakete zwischengespeichert werden. Dies gilt besonders
f?r Verbindungen ?ber langsame Modems. Die Begrenzung wirkt sich
allerdings nur auf das Versenden von Daten aus (Uploads, Server). Auf
den Empfang von Daten (Downloads) hat die Begrenzung keine Auswirkungen.

Die Variable ``net.inet.tcp.inflight.stab`` sollte *nicht* angepasst
werden. Der Vorgabewert der Variablen betr?gt ``20``, das hei?t es
werden maximal zwei Pakete zu dem Produkt aus ?bertragungsrate und
Verz?gerungszeit addiert. Dies stabilisiert den Algorithmus und
verbessert die Reaktionszeit auf Ver?nderungen. Bei langsamen
Verbindungen k?nnen sich aber die Laufzeiten der Pakete erh?hen (ohne
diesen Algorithmus w?ren sie allerdings noch h?her). In solchen F?llen
k?nnen Sie versuchen, den Wert der Variablen auf ``15``, ``10`` oder
``5`` herabzusetzten. Gleichzeitig m?ssen Sie vielleicht auch
``net.inet.tcp.inflight.min`` auf einen kleineren Wert (beispielsweise
``3500``) setzen. ?ndern Sie diese Variablen nur ab, wenn Sie keine
anderen M?glichkeiten mehr haben.

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

12.14.3. Virtueller Speicher (*Virtual Memory*)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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

12.14.3.1. ``kern.maxvnodes``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Ein vnode ist die interne Darstellung einer Datei oder eines
Verzeichnisses. Die Erh?hung der Anzahl der f?r das Betriebssystem
verf?gbaren vnodes verringert also die Schreib- und Lesezugriffe auf
Ihre Festplatte. vnodes werden im Normalfall vom Betriebssystem
automatisch vergeben und m?ssen nicht von Ihnen angepasst werden. In
einigen F?llen stellt der Zugriff auf eine Platte allerdings einen
Flaschenhals dar, daher sollten Sie in diesem Fall die Anzahl der
m?glichen vnodes erh?hen, um dieses Problem zu beheben. Beachten Sie
dabei aber die Gr??e des inaktiven und freien Hauptspeichers.

Um die Anzahl der derzeit verwendeten vnodes zu sehen, geben Sie
Folgendes ein:

.. code:: screen

    # sysctl vfs.numvnodes
    vfs.numvnodes: 91349

Die maximal m?gliche Anzahl der vnodes erhalten Sie durch die Eingabe
von:

.. code:: screen

    # sysctl kern.maxvnodes
    kern.maxvnodes: 100000

Wenn sich die Anzahl der genutzten vnodes dem maximal m?glichen Wert
n?hert, sollten Sie den Wert ``kern.maxvnodes`` zuerst um etwa 1.000
erh?hen. Beobachten Sie danach die Anzahl der vom System genutzten
``vfs.numvnodes``. N?hert sich der Wert wiederum dem definierten
Maximum, m?ssen Sie ``kern.maxvnodes`` nochmals erh?hen. Sie sollten nun
eine ?nderung Ihres Speicherverbrauches (etwa ?ber
`top(1) <http://www.FreeBSD.org/cgi/man.cgi?query=top&sektion=1>`__)
registrieren k?nnen und ?ber mehr aktiven Speicher verf?gen.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="footnotes">

--------------

.. raw:: html

   <div id="ftn.idp76756944" class="footnote">

`:sup:`[5]` <#idp76756944>`__\ Der verwendete Algorithmus setzt
``maxusers`` auf die Speichergr??e des Systems. Der minimale Wert
betr?gt dabei ``32``, das Maximum ist ``384``.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------+--------------------------------------+------------------------------------------+
| `Zur?ck <configtuning-disk.html>`__?   | `Nach oben <config-tuning.html>`__   | ?\ `Weiter <adding-swap-space.html>`__   |
+----------------------------------------+--------------------------------------+------------------------------------------+
| 12.13. Tuning von Laufwerken?          | `Zum Anfang <index.html>`__          | ?12.15. Hinzuf?gen von Swap-Bereichen    |
+----------------------------------------+--------------------------------------+------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
