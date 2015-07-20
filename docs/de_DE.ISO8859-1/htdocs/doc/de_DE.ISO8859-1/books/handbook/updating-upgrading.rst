=================================
Kapitel 26. FreeBSD aktualisieren
=================================

.. raw:: html

   <div class="navheader">

Kapitel 26. FreeBSD aktualisieren
`Zur?ck <lang-setup.html>`__?
Teil?III.?Systemadministration
?\ `Weiter <updating-upgrading-freebsdupdate.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="chapter">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

Kapitel 26. FreeBSD aktualisieren
---------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Umstrukturiert und aktualisiert von Jim Mock.

.. raw:: html

   </div>

.. raw:: html

   <div>

Im Original von Jordan Hubbard, Poul-Henning Kamp, John Polstra und Nik
Clayton.

.. raw:: html

   </div>

.. raw:: html

   <div>

?bersetzt von Martin Heinen.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Inhaltsverzeichnis

.. raw:: html

   </div>

`26.1.
?bersicht <updating-upgrading.html#updating-upgrading-synopsis>`__
`26.2. FreeBSD-Update <updating-upgrading-freebsdupdate.html>`__
`26.3. Portsnap: Ein Werkzeug zur Aktualisierung der
Ports-Sammlung <updating-upgrading-portsnap.html>`__
`26.4. Aktualisieren der
Dokumentationssammlung <updating-upgrading-documentation.html>`__
`26.5. Einem Entwicklungszweig folgen <current-stable.html>`__
`26.6. Synchronisation der Quellen <synching.html>`__
`26.7. Das komplette Basissystem neu bauen <makeworld.html>`__
`26.8. Veraltete Dateien, Verzeichnisse und Bibliotheken
l?schen <make-delete-old.html>`__
`26.9. Installation mehrerer Maschinen <small-lan.html>`__

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

26.1. ?bersicht
---------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD wird zwischen einzelnen Releases st?ndig weiter entwickelt.
Manche Leute bevorzugen die offiziellen Release-Versionen, w?hrend
andere wiederum lieber auf dem aktuellen Stand der Entwicklung bleiben
m?chten. Wie dem auch sei, sogar offizielle Release-Versionen werden oft
mit Sicherheitsaktualisierungen und anderen kritischen
Fehlerbereinigungen versorgt. Unabh?ngig von der eingesetzten Version
bringt FreeBSD alle n?tigen Werkzeuge mit, um ihr System aktuell zu
halten und es innerhalb verschiedener Versionen zu aktualisieren. Dieses
Kapitel hilft Ihnen bei der Entscheidung, ob Sie mit dem
Entwicklungssystem Schritt halten oder ein Release verwenden wollen. Die
zugrundeliegenden Werkzeuge um Ihr System aktuell zu halten werden
ebenfalls vorgestellt.

Nachdem Sie dieses Kapitel gelesen haben, werden Sie

.. raw:: html

   <div class="itemizedlist">

-  wissen, welche Werkzeuge verwendet werden k?nnen, um das System und
   die Port-Sammlung zu aktualisieren.

-  wissen, wie Sie Ihr System mit freebsd-update, CVSup, CVS oder CTM
   aktualisieren.

-  wissen, wie man das aktuell installierte System mit einer
   urspr?nglichen Version vergleicht.

-  wissen, wie Sie ihre Dokumentation mit CVSup oder
   Dokumentations-Ports aktuell halten k?nnen.

-  den Unterschied zwischen den beiden Entwicklungszweigen
   FreeBSD-STABLE und FreeBSD-CURRENT kennen.

-  Wissen, wie Sie das komplette Basissystem mit
   ``make       buildworld`` neu bauen und installieren.

.. raw:: html

   </div>

Bevor Sie dieses Kapitel lesen, sollten Sie

.. raw:: html

   <div class="itemizedlist">

-  Ihr Netzwerk richtig konfiguriert haben (`Kapitel?33, *Weiterf?hrende
   Netzwerkthemen* <advanced-networking.html>`__) und

-  wissen, wie Sie Software Dritter installieren (`Kapitel?5,
   *Installieren von Anwendungen: Pakete und Ports* <ports.html>`__).

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Im gesamten Kapitel wird der Befehl ``cvsup`` verwendet, um die FreeBSD
Quellen zu beziehen und zu aktualisieren. Um es zu verwenden, ben?tigen
Sie einen Port oder ein Paket wie
`net/cvsup <http://www.freebsd.org/cgi/url.cgi?ports/net/cvsup/pkg-descr>`__
(falls Sie den graphischen ``cvsup``-Client nicht ben?tigen, k?nnen Sie
auch nur den Port ``net/cvsup-without-gui`` installieren). Alternativ
k?nnen Sie auch
`csup(1) <http://www.FreeBSD.org/cgi/man.cgi?query=csup&sektion=1>`__
verwenden, das bereits Teil des Basissystems ist.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------------+----------------------------------------------+---------------------------------------------------------+
| `Zur?ck <lang-setup.html>`__?                | `Nach oben <system-administration.html>`__   | ?\ `Weiter <updating-upgrading-freebsdupdate.html>`__   |
+----------------------------------------------+----------------------------------------------+---------------------------------------------------------+
| 25.5. Lokalisierung f?r einzelne Sprachen?   | `Zum Anfang <index.html>`__                  | ?26.2. FreeBSD-Update                                   |
+----------------------------------------------+----------------------------------------------+---------------------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
