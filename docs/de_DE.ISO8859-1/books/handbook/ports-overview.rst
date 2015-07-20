==============================
5.2. Installation von Software
==============================

.. raw:: html

   <div class="navheader">

5.2. Installation von Software
`Zur?ck <ports.html>`__?
Kapitel 5. Installieren von Anwendungen: Pakete und Ports
?\ `Weiter <ports-finding-applications.html>`__

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

5.2. Installation von Software
------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn Sie schon einmal ein UNIX? System benutzt haben, werden Sie wissen,
dass zus?tzliche Software meist wie folgt installiert wird:

.. raw:: html

   <div class="procedure">

#. Download der Software, die als Quelltext oder im Bin?rformat
   vorliegen kann.

#. Auspacken der Software, die typischerweise ein mit
   `compress(1) <http://www.FreeBSD.org/cgi/man.cgi?query=compress&sektion=1>`__,
   `gzip(1) <http://www.FreeBSD.org/cgi/man.cgi?query=gzip&sektion=1>`__
   oder
   `bzip2(1) <http://www.FreeBSD.org/cgi/man.cgi?query=bzip2&sektion=1>`__
   komprimiertes Tar-Archiv enth?lt.

#. Durchsuchen der Dokumentation, die sich meist in Dateien wie
   ``INSTALL``, ``README`` oder mehreren Dateien im Verzeichnis ``doc/``
   befindet, nach Anweisungen, wie die Software zu installieren ist.

#. Kompilieren der Software wenn sie als Quelltext vorliegt. Dazu m?ssen
   Sie vielleicht das ``Makefile`` anpassen, oder ``configure`` laufen
   lassen, oder andere Arbeiten durchf?hren.

#. Testen und installieren der Software.

.. raw:: html

   </div>

Das beschreibt aber nur den optimalen Fall. Wenn Sie Software
installieren, die nicht speziell f?r FreeBSD geschrieben wurde, m?ssen
Sie vielleicht sogar den Quelltext anpassen, damit die Software
funktioniert.

Wenn Sie unbedingt wollen, k?nnen Sie mit FreeBSD Software nach der
„althergebrachten“ Methode installieren. Mit Paketen oder Ports bietet
Ihnen FreeBSD allerdings zwei Methoden an, die Ihnen sehr viel Zeit
sparen k?nnen. Zurzeit werden ?ber 24,000 Anwendungen Dritter ?ber diese
Methoden zur Verf?gung gestellt.

Das FreeBSD-Paket einer Anwendung besteht aus einer einzigen Datei, die
Sie sich herunterladen m?ssen. Das Paket enth?lt schon ?bersetzte
Kommandos der Anwendung, sowie zus?tzliche Konfigurationsdateien oder
Dokumentation. Zur Handhabung der Pakete stellt FreeBSD-Kommandos wie
`pkg\_add(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_add&sektion=1>`__,
`pkg\_delete(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_delete&sektion=1>`__
oder
`pkg\_info(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_info&sektion=1>`__
zur Verf?gung. Mit diesem System k?nnen neue Anwendungen mit einem
Kommando, ``pkg_add``, installiert werden.

Der FreeBSD-Port einer Anwendung ist eine Sammlung von Dateien, die das
Kompilieren der Quelltexte einer Anwendung automatisieren.

Die Dateien eines Ports f?hren f?r Sie alle oben aufgef?hrten Schritte
zum Installieren einer Anwendung durch. Mit einigen wenigen Kommandos
wird der Quellcode der Anwendung automatisch heruntergeladen,
ausgepackt, gepatcht, ?bersetzt und installiert.

Tats?chlich kann das Portsystem auch dazu benutzt werden, Pakete zu
generieren, die Sie mit den gleich beschriebenen Kommandos, wie
``pkg_add``, manipulieren k?nnen.

Pakete und Ports beachten Abh?ngigkeiten zwischen Anwendungen.
Angenommen, Sie wollen eine Anwendung installieren, die von einer
Bibliothek abh?ngt und die Anwendung wie die Bibliothek sind als Paket
oder Port f?r FreeBSD verf?gbar. Wenn Sie ``pkg_add`` oder das
Portsystem benutzen, um die Anwendung zu installieren, werden Sie
bemerken, dass die Bibliothek zuerst installiert wird, wenn sie nicht
schon vorher installiert war.

Sie werden sich fragen, warum FreeBSD-Pakete und -Ports unterst?tzt, wo
doch beide Methoden fast gleiches leisten. Beide Methoden haben ihre
St?rken und welche Sie einsetzen, h?ngt letztlich von Ihren Vorlieben
ab.

.. raw:: html

   <div class="itemizedlist">

.. raw:: html

   <div class="itemizedlist-title">

Vorteile von Paketen

.. raw:: html

   </div>

-  Das komprimierte Paket einer Anwendung ist normalerweise kleiner als
   das komprimierte Archiv der Quelltexte.

-  Pakete m?ssen nicht mehr kompiliert werden. Dies ist ein Vorteil,
   wenn Sie gro?e Pakete, wie Mozilla, KDE oder GNOME auf langsamen
   Maschinen installieren.

-  Wenn Sie Pakete verwenden, brauchen Sie nicht zu verstehen, wie Sie
   Software unter FreeBSD kompilieren.

.. raw:: html

   </div>

.. raw:: html

   <div class="itemizedlist">

.. raw:: html

   <div class="itemizedlist-title">

Vorteile von Ports

.. raw:: html

   </div>

-  Da die Pakete auf m?glichst vielen System laufen sollen, werden
   Optionen beim ?bersetzen zur?ckhaltend gesetzt. Wenn Sie eine
   Anwendung ?ber die Ports installieren, k?nnen Sie die Angabe der
   Optionen optimieren. Zum Beispiel k?nnen Sie spezifischen Code f?r
   Pentium?4 oder Athlon Prozessoren erzeugen.

-  Die Eigenschaften einiger Anwendungen werden ?ber Optionen zum
   Zeitpunkt des ?bersetzens festgelegt. Apache kann zum Beispiel ?ber
   viele eingebaute Optionen konfiguriert werden. Wenn Sie das
   Portsystem benutzen, k?nnen Sie die Vorgaben f?r die Optionen
   ?berschreiben.

   F?r einige F?lle existieren verschiedene Pakete einer Anwendung, die
   beim ?bersetzen unterschiedlich konfiguriert wurden. F?r Ghostscript
   gibt es ein ``ghostscript``-Paket und ein
   ``ghostscript-nox11``-Paket, die sich durch die X11 Unterst?tzung
   unterscheiden. Diese grobe Unterscheidung ist mit dem Paketsystem
   m?glich, wird aber schnell unhandlich, wenn eine Anwendung mehr als
   ein oder zwei Optionen zum Zeitpunkt des ?bersetzens besitzt.

-  Die Lizenzbestimmungen mancher Software verbietet ein Verbreiten in
   bin?rer Form. Diese Software muss als Quelltext ausgeliefert werden.

-  Einige Leute trauen bin?ren Distributionen nicht. Wenn Sie den
   Quelltext besitzen, k?nnen Sie sich diesen (zumindest theoretisch)
   durchlesen und nach m?glichen Problemen durchsuchen.

-  Wenn Sie eigene Anpassungen besitzen, ben?tigen Sie den Quelltext, um
   diese anzuwenden.

-  Manch einer besitzt gerne den Quelltext, um ihn zu lesen, wenn es
   einmal langweilig ist, ihn zu hacken, oder sich einfach ein paar
   Sachen abzugucken (nat?rlich nur, wenn es die Lizenzbestimmungen
   erlauben).

.. raw:: html

   </div>

Wenn Sie ?ber aktualisierte Ports informiert sein wollen, lesen Sie
bitte die Mailinglisten `FreeBSD
ports <http://lists.FreeBSD.org/mailman/listinfo/freebsd-ports>`__ und
`FreeBSD ports
bugs <http://lists.FreeBSD.org/mailman/listinfo/freebsd-ports-bugs>`__.

.. raw:: html

   <div class="warning" xmlns="">

Warnung:
~~~~~~~~

Bevor Sie eine Anwendung installieren, sollten Sie auf der Seite
``http://vuxml.FreeBSD.org/`` ?ber m?gliche Sicherheitsprobleme mit der
Anwendung informieren.

Die Anwendung
`ports-mgmt/portaudit <http://www.freebsd.org/cgi/url.cgi?ports/ports-mgmt/portaudit/pkg-descr>`__
pr?ft automatisch alle installierten Anwendungen auf bekannte
Sicherheitsl?cher. Vor dem Bau eines Ports findet ebenfalls eine Pr?fung
statt. Installierte Pakete pr?fen Sie mit dem Kommando
``portaudit -F -a``.

.. raw:: html

   </div>

Der Rest dieses Kapitels beschreibt, wie Sie Software Dritter mit
Paketen oder Ports auf einem FreeBSD-System installieren und verwalten.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------------------------------+-------------------------------+---------------------------------------------------+
| `Zur?ck <ports.html>`__?                                     | `Nach oben <ports.html>`__    | ?\ `Weiter <ports-finding-applications.html>`__   |
+--------------------------------------------------------------+-------------------------------+---------------------------------------------------+
| Kapitel 5. Installieren von Anwendungen: Pakete und Ports?   | `Zum Anfang <index.html>`__   | ?5.3. Suchen einer Anwendung                      |
+--------------------------------------------------------------+-------------------------------+---------------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
