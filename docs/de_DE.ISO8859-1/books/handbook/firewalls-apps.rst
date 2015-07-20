====================
32.3. Firewallpakete
====================

.. raw:: html

   <div class="navheader">

32.3. Firewallpakete
`Zur?ck <firewalls-concepts.html>`__?
Kapitel 32. Firewalls
?\ `Weiter <firewalls-pf.html>`__

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

32.3. Firewallpakete
--------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das Basissystem von FreeBSD enth?lt bereits drei Firewallpakete:
*IPFILTER* (auch als IPF bekannt), *IPFIREWALL* (auch als IPFW
bezeichnet) sowie das von OpenBSD ?bernommene *PacketFilter* (das auch
als PF bezeichnet wird). Zus?tzlich verf?gt FreeBSD ?ber zwei eingebaute
Pakete f?r das sogenannte *traffic shaping* (dabei handelt es sich die
Steuerung des Bandbreitenverbrauchs):
`altq(4) <http://www.FreeBSD.org/cgi/man.cgi?query=altq&sektion=4>`__
sowie
`dummynet(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dummynet&sektion=4>`__.
Dummynet steht traditionell in enger Verbindung mit IPFW, w?hrend ALTQ
gemeinsam mit PF eingesetzt wird. Traffic Shaping f?r IPFILTER ist
derzeit mit IPFILTER f?r NAT sowie Filterung und mit IPFW und
`dummynet(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dummynet&sektion=4>`__
*oder* durch die Kombination von PF mit ALTQ m?glich. Gemeinsam ist
allen Firewallpaketen (IPF, IPFW sowie PF), dass sie Regeln einsetzen,
um den Transfer von Datenpaketen auf und von Ihrem System zu regeln.
Unterschiedlich sind aber die Art und Weise, wie dies realisiert wird.
Auch die f?r diese Regeln verwendete Syntax ist unterschiedlich.

FreeBSD ?berl?sst es dem Anwender, das Firewallsystem zu w?hlen, dass
seinen Anforderungen und Vorlieben am Besten entspricht. Keines der im
Basissystem enthaltenen Firewallpakete wird dabei als „das beste“
angesehen.

IPFILTER hat etwa den Vorteil, dass dessen zustandsabh?ngige Regeln
relativ einfach in einer NAT-Umgebung implementiert werden k?nnen.
Au?erdem verf?gt es ?ber einen eigenen FTP-Proxy, der die Erstellung von
sicheren Regeln f?r ausgehende FTP-Verbindungen vereinfacht.

Da alle Firewalls auf der Untersuchung der Werte ausgew?hlter
Kontrollfelder von Datenpaketen basieren, ist es f?r die Erstellung von
Firewallregeln notwendig, die Funktionsweise von TCP/IP zu verstehen.
Au?erdem muss man dazu wissen, was die Werte der einzelnen
Kontrollfelder bedeuten und wie diese w?hrend einer Verbindung
eingesetzt werden. Eine gute Erkl?rung dieser Thematik finden Sie unter
``http://www.ipprimer.com/overview.cfm``.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------+----------------------------------+-------------------------------------------------+
| `Zur?ck <firewalls-concepts.html>`__?   | `Nach oben <firewalls.html>`__   | ?\ `Weiter <firewalls-pf.html>`__               |
+-----------------------------------------+----------------------------------+-------------------------------------------------+
| 32.2. Firewallkonzepte?                 | `Zum Anfang <index.html>`__      | ?32.4. Paket Filter (PF) von OpenBSD und ALTQ   |
+-----------------------------------------+----------------------------------+-------------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
