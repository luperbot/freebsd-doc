=========================
17.9. Das MAC Modul ifoff
=========================

.. raw:: html

   <div class="navheader">

17.9. Das MAC Modul ifoff
`Zur?ck <mac-bsdextended.html>`__?
Kapitel 17. Verbindliche Zugriffskontrolle
?\ `Weiter <mac-portacl.html>`__

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

17.9. Das MAC Modul ifoff
-------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Modulname: ``mac_ifoff.ko``

Parameter f?r die Kernelkonfiguration: ``options MAC_IFOFF``

Bootparameter: ``mac_ifoff_load="YES"``

Das Modul
`mac\_ifoff(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_ifoff&sektion=4>`__
ist einzig dazu da, Netzwerkschnittstellen im laufenden Betrieb zu
deaktivieren oder zu verhindern, das Netzwerkschnittstellen w?hrend der
Bootphase gestartet werden. Dieses Modul ben?tigt f?r seinen Betrieb
weder Labels, die auf dem System eingerichtet werden m?ssen, noch hat es
Abh?ngigkeiten zu anderen MAC Modulen.

Der gr??te Teil der Kontrolle geschieht ?ber die im folgenden
aufgelisteten ``sysctl``-Parameter:

.. raw:: html

   <div class="itemizedlist">

-  ``security.mac.ifoff.lo_enabled`` schaltet den gesamten
   Netzwerkverkehr auf der Loopback-Schnittstelle
   `lo(4) <http://www.FreeBSD.org/cgi/man.cgi?query=lo&sektion=4>`__ an
   bzw. aus.

-  ``security.mac.ifoff.bpfrecv_enabled`` macht das Gleiche f?r den
   Berkeley Paket Filter
   `bpf(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bpf&sektion=4>`__.

-  ``security.mac.ifoff.other_enabled`` schaltet den Verkehr f?r alle
   anderen Netzwerkschnittstellen.

.. raw:: html

   </div>

Die wahrscheinlich h?ufigste Nutzung von
`mac\_ifoff(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_ifoff&sektion=4>`__
ist die ?berwachung des Netzwerks in einer Umgebung, in der kein
Netzwerkverkehr w?hrend des Bootvorgangs erlaubt werden soll. Eine
andere m?gliche Anwendung w?re ein Script, das mit Hilfe von
`security/aide <http://www.freebsd.org/cgi/url.cgi?ports/security/aide/pkg-descr>`__
automatisch alle Schnittstellen blockiert, sobald Dateien in gesch?tzten
Verzeichnissen angelegt oder ver?ndert werden.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+-------------------------------+------------------------------------+
| `Zur?ck <mac-bsdextended.html>`__?   | `Nach oben <mac.html>`__      | ?\ `Weiter <mac-portacl.html>`__   |
+--------------------------------------+-------------------------------+------------------------------------+
| 17.8. Das MAC Modul bsdextended?     | `Zum Anfang <index.html>`__   | ?17.10. Das MAC Modul portacl      |
+--------------------------------------+-------------------------------+------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
