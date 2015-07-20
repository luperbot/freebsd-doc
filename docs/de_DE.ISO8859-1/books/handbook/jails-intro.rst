================
16.3. Einf?hrung
================

.. raw:: html

   <div class="navheader">

16.3. Einf?hrung
`Zur?ck <jails-terms.html>`__?
Kapitel 16. Jails
?\ `Weiter <jails-build.html>`__

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

16.3. Einf?hrung
----------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Da die Systemadministration oft eine schwierige Aufgabe ist, wurden
viele m?chtige Werkzeuge entwickelt, die Administratoren bei
Installation, Konfiguration und Wartung ihrer Systeme unterst?tzen
sollen. Eine wichtige Aufgabe eines Administrators ist es, Systeme so
abzusichern, dass es im regul?ren Betrieb zu keinen Sicherheitsverst??en
kommt.

Eines der Werkzeuge, mit dem die Sicherheit eines FreeBSD-Systems
verbessert werden kann, sind Jails. Jails wurden schon in FreeBSD?4.X
von Poul-Henning Kamp eingef?hrt, wurden jedoch mit FreeBSD?5.X stark
verbessert, sodass sie inzwischen zu einem m?chtigen und flexiblen
Subsystem herangereift sind. Trotzdem geht die Entwicklung nach wie vor
weiter. Wichtige Ziele sind derzeit: Bessere Zweckm??igkeit, Leistung,
Ausfallsicherheit und allgemeine Sicherheit.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

16.3.1. Was ist eine Jail?
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

BSD-?hnliche Betriebssysteme besitzen seit den Zeiten von 4.2BSD
`chroot(2) <http://www.FreeBSD.org/cgi/man.cgi?query=chroot&sektion=2>`__.
Das Werkzeug
`chroot(2) <http://www.FreeBSD.org/cgi/man.cgi?query=chroot&sektion=2>`__
kann dazu benutzt werden, das root-Verzeichnis einer Reihe von Prozessen
zu ?ndern, um so eine seperate sichere Umgebung (abgeschnitten vom Rest
des Systems) zu schaffen. Prozesse, die in einer chroot-Umgebung
erstellt wurden, k?nnen nicht auf Dateien oder Ressourcen zugreifen, die
sich ausserhalb der Umgebung befinden. Dadurch ist es einem
kompromittierten Dienst nicht m?glich, das gesamte System zu
kompromittieren.
`chroot(8) <http://www.FreeBSD.org/cgi/man.cgi?query=chroot&sektion=8>`__
eignet sich f?r einfache Aufgaben, die keine flexiblen, komplexen oder
fortgeschrittenen Funktionen ben?tigen. Obwohl seit der Entwicklung des
chroot-Konzepts zahlreiche Sicherheitsl?cher geschlossen wurden, die es
einem Prozess erlauben konnten, aus einer Jail auszubrechen, war seit
langer Zeit klar, dass
`chroot(2) <http://www.FreeBSD.org/cgi/man.cgi?query=chroot&sektion=2>`__
nicht die ideale L?sung ist, einen Dienst sicher zu machen.

Dies ist einer der Hauptgr?nde, warum *Jails* entwickelt wurden.

Jails setzen auf dem traditionellen
`chroot(2) <http://www.FreeBSD.org/cgi/man.cgi?query=chroot&sektion=2>`__-Konzept
auf und verbessern es auf unterschiedlichste Art und Weise. In einer
traditionellen
`chroot(2) <http://www.FreeBSD.org/cgi/man.cgi?query=chroot&sektion=2>`__-Umgebung
sind Prozesse auf den Bereich des Dateisystems beschr?nkt, auf den sie
zugreifen k?nnen. Der Rest der Systemressourcen (wie zum Beispiel eine
Reihe von Systembenutzern, die laufenden Prozesse oder das
Netzwerk-Subsystem) teilen sich die chroot-Prozesse mit dem Host-System.
Jails dehnen dieses Modell nicht nur auf die Virtualisierung des
Zugriffs auf das Dateisystem, sondern auch auf eine Reihe von Benutzern,
das Netzwerk-Subsystem des FreeBSD-Kernels und weitere Bereiche aus.
Eine ausf?hrlichere ?bersicht der ausgefeilten Bedienelemente zur
Konfiguration einer Jail-Umgebung finden Sie im Abschnitt
`Abschnitt?16.5, „Feinabstimmung und
Administration“ <jails-tuning.html>`__ des Handbuchs.

Eine Jail zeichnet sich durch folgende Merkmale aus:

.. raw:: html

   <div class="itemizedlist">

-  Einen Unterverzeichnisbaum, der die Jail enth?lt. Einem Prozess, der
   innerhalb der Jail l?uft, ist es nicht mehr m?glich, aus diesem
   auszubrechen. Von der traditionellen
   `chroot(2) <http://www.FreeBSD.org/cgi/man.cgi?query=chroot&sektion=2>`__-Umgebung
   bekannte Sicherheitsprobleme existieren bei FreeBSD-Jails nicht mehr.

-  Einen Hostname, der innerhalb der Jail verwendet wird. Jails werden
   vor allem dazu verwendet, Netzwerkdienste anzubieten, daher ist es
   f?r Systemadministratoren von gro?em Nutzen, dass jede Jail einen
   beschreibenden Hostname haben kann.

-  Eine IP Adresse, die der Jail zugewiesen wird und nicht ver?ndert
   werden kann, solange das Jail l?uft. Die IP-Adresse einer Jails ist
   ?blicherweise ein Adress-Alias auf eine existierende
   Netzwerkschnittstelle. Dies ist jedoch nicht zwingend erforderlich.

-  Einen Befehl (genauer den Pfad einer ausf?hrbaren Datei) der
   innerhalb der Jail ausgef?hrt werden soll. Dieser Pfad wird relativ
   zum root-Verzeichnis einer Jail-Umgebung angegeben und kann sehr
   unterschiedlich aussehen (je nachdem, wie die Jail-Umgebung
   konfiguriert wurde).

.. raw:: html

   </div>

Unabh?ngig davon k?nnen Jails eine Reihe eigener Benutzer und einen
eigenen Benutzer ``root`` haben. Selbstverst?ndlich sind die Rechte des
Benutzers ``root`` nur auf die Jail-Umgebung beschr?nkt. Aus der Sicht
des Host-Systems ist der Benutzer ``root`` der Jail-Umgebung kein
allm?chtiger Benutzer, da der Benutzer ``root`` der Jail-Umgebung nicht
dazu berechtigt ist, kritische Operationen am System ausserhalb der
angebundenen
`jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8>`__-Umgebung
durchzuf?hren. Weitere Informationen ?ber die Einsatzm?glichkeiten und
Beschr?nkungen des Benutzers ``root`` werden im Abschnitt
`Abschnitt?16.5, „Feinabstimmung und
Administration“ <jails-tuning.html>`__ des Handbuchs besprochen.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------+-------------------------------+-----------------------------------------------+
| `Zur?ck <jails-terms.html>`__?   | `Nach oben <jails.html>`__    | ?\ `Weiter <jails-build.html>`__              |
+----------------------------------+-------------------------------+-----------------------------------------------+
| 16.2. Jails - Definitionen?      | `Zum Anfang <index.html>`__   | ?16.4. Einrichtung und Verwaltung von Jails   |
+----------------------------------+-------------------------------+-----------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
