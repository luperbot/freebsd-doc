=================
17.3. Erl?uterung
=================

.. raw:: html

   <div class="navheader">

17.3. Erl?uterung
`Zur?ck <mac-inline-glossary.html>`__?
Kapitel 17. Verbindliche Zugriffskontrolle
?\ `Weiter <mac-understandlabel.html>`__

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

17.3. Erl?uterung
-----------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Mit all diesen neuen Begriffen im Kopf k?nnen wir nun ?berlegen, wie die
M?glichkeiten der verbindlichen Zugriffskontrolle (MAC) die Sicherheit
eines Betriebssystems als Ganzes erweitern. Die verschiedenen Module,
die durch die MAC bereitgestellt werden, k?nnen verwendet werden, um das
Netzwerk oder Dateisysteme zu sch?tzen, Nutzern den Zugang zu bestimmten
Ports oder Sockets zu verbieten und vieles mehr. Die vielleicht beste
Weise, die Module zu verwenden, ist, sie miteinander zu kombinieren,
indem mehrere Sicherheitsrichtlinienmodule gleichzeitig eine
mehrschichtige Sicherheitsumgebung schaffen. Das ist etwas anderes als
singul?re Richtlinien wie zum Beispiel die Firewall, die typischerweise
Elemente eines Systems stabilisiert, das nur f?r einen speziellen Zweck
verwendet wird. Der Verwaltungsmehraufwand ist jedoch von Nachteil, zum
Beispiel durch die Verwendung von mehreren Labels oder dem eigenh?ndigen
Erlauben von Netzwerkzugriffen f?r jeden einzelnen Nutzer.

Solche Nachteile sind allerdings gering im Vergleich zum bleibenden
Effekt der erstellten Struktur. Die M?glichkeit zum Beispiel, f?r
konkrete Anwendungen genau die passenden Richtlinien auszuw?hlen und
einzurichten, senkt gleichzeitig die Arbeitskosten. Wenn man unn?tige
Richtlinien aussortiert, kann man die Gesamtleistung des Systems genauso
steigern wie auch eine h?here Anpassungsf?higkeit gew?hrleisten. Eine
gute Umsetzung der MAC beinhaltet eine Pr?fung der gesamten
Sicherheitsanforderungen und einen wirksamen Einsatz der verschiedenen
Module.

Ein System, auf dem eine MAC verwendet wird, mu? zumindest garantieren,
dass einem Nutzer nicht gestattet wird, Sicherheitsmerkmale nach eigenem
Ermessen zu ver?ndern; dass Arbeitswerkzeuge, Programme und Skripte,
innerhalb der Beschr?nkungen arbeiten k?nnen, welche die Zugriffsregeln
der ausgew?hlten Module dem System auferlegen; und dass die volle
Kontrolle ?ber die Regeln der MAC beim Administrator ist und bleibt.

Es ist die einsame Pflicht des zust?ndigen Administrators, die richtigen
Module sorgf?ltig auszuw?hlen. Einige Umgebungen k?nnten eine
Beschr?nkung der Zugriffe ?ber die Netzwerkschnittstellen ben?tigen -
hier w?ren die Module
`mac\_portacl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_portacl&sektion=4>`__,
`mac\_ifoff(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_ifoff&sektion=4>`__
und sogar
`mac\_biba(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_biba&sektion=4>`__
ein guter Anfang. In anderen F?llen mu? man sehr strenge Vertraulichkeit
von Dateisystemobjekten gew?hrleisten - daf?r k?nnte man
`mac\_bsdextended(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_bsdextended&sektion=4>`__
oder
`mac\_mls(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_mls&sektion=4>`__
einsetzen.

Die Entscheidung, welche Richtlinien angewandt werden, kann auch anhand
der Netzwerk-Konfiguration getroffen werden. Nur bestimmten Benutzern
soll erlaubt werden, via
`ssh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh&sektion=1>`__ auf
das Netzwerk oder Internet zuzugreifen -
`mac\_portacl(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_portacl&sektion=4>`__
w?re eine gute Wahl. Aber f?r was entscheidet man sich im Falle eines
Dateisystems? Soll der Zugriff auf bestimmte Verzeichnisse von
spezifischen Nutzern oder Nutzergruppen separiert werden? Oder wollen
wir den Zugriff durch Nutzer oder Programme auf spezielle Dateien
einschr?nken, indem wir gewisse Objekte als geheim einstufen?

Der Zugriff auf Objekte kann einigen vertraulichen Nutzern gestattet
werden, anderen wiederum verwehrt. Als Beispiel sei hierzu ein gro?es
Entwicklerteam angef?hrt, das in kleine Gruppen von Mitarbeitern
aufgeteilt wurde. Die Entwickler von Projekt A d?rfen nicht auf Objekte
zugreifen, die von den Entwicklern von Projekt B geschrieben wurden. Sie
m?ssen aber trotzdem auf Objekte zugreifen k?nnen, die von einem dritten
Entwicklerteam geschaffen wurden - alles in allem eine verzwickte
Situation. Wenn man die verschiedenen Module der MAC richtig verwendet,
k?nnen Anwender in solche Gruppen getrennt und ihnen der Zugriff zu den
gew?nschten Systemobjekten gestattet werden - ohne Angst haben zu
m?ssen, dass Informationen in die falschen H?nde geraten.

So hat jedes Modul, das eine Sicherheitsrichtlinie verf?gbar macht,
einen eigenen Weg, die Sicherheit des Systems zu verst?rken. Die Auswahl
der Module sollte auf einem gut durchdachten Sicherheitskonzept gr?nden.
In vielen F?llen mu? das gesamte Konzept eines Systems ?berarbeitet und
neu eingepflegt werden. Ein guter ?berblick ?ber die M?glichkeiten der
verschiedenen von der MAC angebotenen Module hilft einem Administrator,
die besten Richtlinien f?r seine spezielle Situation auszuw?hlen.

Im FreeBSD-Standardkernel ist die Option zur Verwendung der MAC nicht
enthalten. Daher mu? die Zeile

.. code:: programlisting

    options      MAC

der Kernelkonfiguration hinzugef?gt und der Kernel neu ?bersetzt und
installiert werden.

.. raw:: html

   <div class="caution" xmlns="">

Achtung:
~~~~~~~~

Verschiedenen Anleitungen f?r die MAC empfehlen, die einzelnen Module
direkt in den Kernel einzuarbeiten. Dabei ist es jedoch m?glich, das
System aus dem Netzwerk auszusperren oder gar schlimmeres. Die Arbeit
mit der MAC ist ?hnlich der Arbeit mit einer Firewall - man mu?, wenn
man sich nicht selbst aus dem System aussperren will, genau aufpassen.
Man sollte sich eine M?glichkeit zurechtlegen, wie man eine
Implementation einer MAC r?ckg?ngig machen kann - genauso wie eine
Ferninstallation ?ber das Netzwerk nur mit ?u?erster Vorsicht
vorgenommen werden sollte. Es wird daher empfohlen, die Module nicht in
den Kernel einzubinden, sondern sie beim Systemstart via
``/boot/loader.conf`` zu laden.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------+-------------------------------+--------------------------------------------+
| `Zur?ck <mac-inline-glossary.html>`__?   | `Nach oben <mac.html>`__      | ?\ `Weiter <mac-understandlabel.html>`__   |
+------------------------------------------+-------------------------------+--------------------------------------------+
| 17.2. Schl?sselbegriffe?                 | `Zum Anfang <index.html>`__   | ?17.4. MAC Labels verstehen                |
+------------------------------------------+-------------------------------+--------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
