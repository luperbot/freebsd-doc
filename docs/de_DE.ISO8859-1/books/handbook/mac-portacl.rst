============================
17.10. Das MAC Modul portacl
============================

.. raw:: html

   <div class="navheader">

17.10. Das MAC Modul portacl
`Zur?ck <mac-ifoff.html>`__?
Kapitel 17. Verbindliche Zugriffskontrolle
?\ `Weiter <mac-partition.html>`__

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

17.10. Das MAC Modul portacl
----------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Modulname: ``mac_portacl.ko``

Parameter f?r die Kernelkonfiguration: ``options MAC_PORTACL``

Bootparameter: ``mac_portacl_load="YES"``

Mit Hilfe des Moduls
`mac\_portacl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_portacl&sektion=4>`__
k?nnen die Anbindungen an die lokalen TCP und UDP Ports durch eine
Vielzahl von ``sysctl`` Variablen beschr?nkt werden. Genauer gesagt
erm?glicht
`mac\_portacl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_portacl&sektion=4>`__
Nutzern ohne ``root``-Rechten den Zugriff auf zu bestimmende
privilegierte Ports, also denen innerhalb der ersten 1024.

Sobald das Modul geladen wurde, ist die Richtlinie f?r alle Sockets
verf?gbar. Die folgenden Variablen k?nnen f?r die Konfiguration
verwendet werden:

.. raw:: html

   <div class="itemizedlist">

-  ``security.mac.portacl.enabled`` schaltet die Anwendung der
   Richtlinie ein oder aus.

-  ``security.mac.portacl.port_high`` gibt den h?chsten Port an, der von
   der Richtlinie
   `mac\_portacl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_portacl&sektion=4>`__
   betroffen sein soll.

-  ``security.mac.portacl.suser_exempt`` nimmt, wenn es einen Wert
   ungleich Null zugewiesen bekommt, ``root`` von der Richtlinie aus.

-  ``security.mac.portacl.rules`` enth?lt als Wert die eigentliche
   ``mac_portacl`` Richtlinie.

.. raw:: html

   </div>

Die eigentliche Konfiguration der ``mac_portacl`` Richtlinie wird der
``sysctl``-Variablen ``security.mac.portacl.rules`` als Zeichenkette der
Form ``rule[,rule,...]`` ?bergeben. Jede einzelne Regel hat die Form
``idtype:id:protocol:port``. Der Parameter *``idtype``* ist entweder
``uid`` oder ``gid`` und wird verwendet, um den Parameter *``id``* als
Nutzer-ID oder Gruppen-ID zu kennzeichnen. Der Parameter *``protocol``*
gibt an, ob die Regel ?r TCP oder UDP gelten soll (indem man den Wert
auf ``tcp`` oder ``udp`` setzt). Und der letzte Parameter, *``port``*,
enth?lt die Nummer des Ports, auf den der angegebene Nutzer bzw. die
angegebene Gruppe Zugriff erhalten soll.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Da der Regelsatz direkt vom Kernel ausgewertet wird, k?nnen nur
Zahlenwerte ?bergeben werden. Das hei?t, Namen von Nutzern, Gruppen oder
Dienstnamen aus der Datei ``/etc/services`` funktionieren nicht.

.. raw:: html

   </div>

Auf UNIX?-artigen Betriebssystemen sind die Ports kleiner 1024
privilegierten Prozessen vorbehalten, m?ssen also mit als/von ``root``
gestartet werden und weiterhin laufen. Damit
`mac\_portacl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_portacl&sektion=4>`__
die Vergabe von Ports kleiner als 1024 an nicht privilegierte Prozesse
?bernehmen kann, mu? die UNIX? Standardeinstellung deaktiviert werden.
Dazu ?ndert man die
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
Variablen ``net.inet.ip.portrange.reservedlow`` und
``net.inet.ip.portrange.reservedhigh`` auf den Wert „0“.

Weiterf?hrende Informationen entnehmen Sie bitte den unten aufgef?hrten
Beispielen oder der Man-Page
`mac\_portacl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_portacl&sektion=4>`__!

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

17.10.1. Beispiele
~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die folgenden Beispiele sollten ein wenig Licht in die obige Diskussion
bringen:

.. code:: screen

    # sysctl security.mac.portacl.port_high=1023
    # sysctl net.inet.ip.portrange.reservedlow=0 net.inet.ip.portrange.reservedhigh=0

Zun?chst bestimmen wir, dass
`mac\_portacl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_portacl&sektion=4>`__
f?r alle privilegierten Ports gelten soll und deaktivieren die normale
UNIX?-Beschr?nkung.

.. code:: screen

    # sysctl security.mac.portacl.suser_exempt=1

Da ``root`` von dieser Richtlinie nicht beeintr?chtigt werden soll,
setzen wir hier ``security.mac.portacl.suser_exempt`` auf einen Wert
ungleich Null. Das Modul
`mac\_portacl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_portacl&sektion=4>`__
ist nun so eingerichtet, wie es UNIX?-artige Betriebssysteme normal
ebenfalls tun.

.. code:: screen

    # sysctl security.mac.portacl.rules=uid:80:tcp:80

Nun erlauben wir dem Nutzer mit der UID 80, normalerweise dem Nutzer
``www``, den Port 80 zu verwenden. Dadurch kann der Nutzer ``www`` einen
Webserver betreiben, ohne daf?r mit ``root``-Privilegien ausgestattet zu
sein.

.. code:: screen

    # sysctl security.mac.portacl.rules=uid:1001:tcp:110,uid:1001:tcp:995

Hier wird dem Nutzer mit der UID 1001 erlaubt, die TCP Ports 110
(„pop3“) und 995 („pop3s“) zu verwenden. Dadurch kann dieser Nutzer
einen Server starten, der Verbindungen an diesen beiden Ports annehmen
kann.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------+-------------------------------+--------------------------------------+
| `Zur?ck <mac-ifoff.html>`__?   | `Nach oben <mac.html>`__      | ?\ `Weiter <mac-partition.html>`__   |
+--------------------------------+-------------------------------+--------------------------------------+
| 17.9. Das MAC Modul ifoff?     | `Zum Anfang <index.html>`__   | ?17.11. Das MAC Modul partition      |
+--------------------------------+-------------------------------+--------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
