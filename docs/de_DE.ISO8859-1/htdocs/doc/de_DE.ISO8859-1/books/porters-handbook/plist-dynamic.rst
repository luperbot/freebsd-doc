=========================================
7.4. Dynamische oder statische Paketliste
=========================================

.. raw:: html

   <div class="navheader">

7.4. Dynamische oder statische Paketliste
`Zur?ck <plist-config.html>`__?
Kapitel 7. Fortgeschrittene ``pkg-plist``-Methoden
?\ `Weiter <plist-autoplist.html>`__

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

7.4. Dynamische oder statische Paketliste
-----------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Eine *statische Paketliste* ist eine Paketliste, die in der
Ports-Sammlung, entweder in Form der ``pkg-plist`` (mit oder ohne der
Ersetzung von Variablen) oder durch ``PLIST_FILES`` und ``PLIST_DIRS``
im ``Makefile`` eingebettet, verf?gbar ist. Selbst wenn der Inhalt durch
ein Werkzeug oder ein Target im Makefile automatisch erzeugt wird,
*bevor* die Datei von einem Committer in die Ports-Sammlung aufgenommen
wird, so ist dies immer noch eine statische Liste, da es m?glich ist den
Dateiinhalt zu betrachten ohne ein Distfile Herunterladen oder
Kompilieren zu m?ssen.

Eine *dynamische Paketliste* ist eine Paketliste, die beim Kompilieren
des Ports erstellt wird, abh?ngig davon, welche Dateien und
Verzeichnisse installiert werden. Es ist nicht m?glich diese Liste zu
betrachten, bevor der Quelltext heruntergeladen und kompiliert oder
nachdem ein ``make clean`` ausgef?hrt wurde.

Der Einsatz dynamischer Paketlisten ist zwar nicht untersagt, aber Sie
sollten, wann immer das m?glich ist, statische Paketlisten verwenden, da
die Nutzer dann
`grep(1) <http://www.FreeBSD.org/cgi/man.cgi?query=grep&sektion=1>`__
auf alle verf?gbaren Ports anwenden k?nnen, um z.B. herauszufinden, von
welchem eine bestimmte Datei installiert wurde. Dynamische Paketlisten
sollten f?r komplexe Ports verwendet werden, bei denen sich die Liste
abh?ngig von den gew?hlten Funktionen sehr stark ?ndern kann (wodurch
die Pflege von statischen Listen unm?glich wird), oder Ports, welche die
Paketliste abh?ngig von den Versionen verwendeter Abh?ngigkeiten
ver?ndern (z.B. Ports, die Ihre Dokumentation mit Javadoc erzeugen).

Maintainer, die dynamische Paketlisten bevorzugen, werden dazu
aufgefordert, neue Targets zu Ihren Ports hinzuzuf?gen, welche die
``pkg-plist``-Datei erzeugen, sodass Benutzer den Inhalt ?berpr?fen
k?nnen.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------+-------------------------------+---------------------------------------------------+
| `Zur?ck <plist-config.html>`__?   | `Nach oben <plist.html>`__    | ?\ `Weiter <plist-autoplist.html>`__              |
+-----------------------------------+-------------------------------+---------------------------------------------------+
| 7.3. Konfigurationsdateien?       | `Zum Anfang <index.html>`__   | ?7.5. Automatisiertes Erstellen von Paketlisten   |
+-----------------------------------+-------------------------------+---------------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
