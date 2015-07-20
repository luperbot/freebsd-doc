=========================
17.13. Das MAC Modul Biba
=========================

.. raw:: html

   <div class="navheader">

17.13. Das MAC Modul Biba
`Zur?ck <mac-mls.html>`__?
Kapitel 17. Verbindliche Zugriffskontrolle
?\ `Weiter <mac-lomac.html>`__

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

17.13. Das MAC Modul Biba
-------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Modulname: ``mac_biba.ko``

Parameter f?r die Kernelkonfiguration: ``options MAC_BIBA``

Bootparameter: ``mac_biba_load="YES"``

Das Modul
`mac\_biba(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_biba&sektion=4>`__
l?dt die MAC Biba Richtlinie. Diese ?hnelt stark der MLS Richtlinie, nur
das die Regeln f?r den Informationsflu? ein wenig vertauscht sind. Es
wird in diesem Fall der absteigende Flu? sicherheitskritischer
Information geregelt, w?hrend die MLS Richtlinie den aufsteigenden Flu?
regelt. In gewissen Sinne treffen dieses und das vorangegangene
Unterkapitel also auf beide Richtlinien zu.

In einer Biba-Umgebung wird jedem Subjekt und jedem Objekt ein
„Integrit?ts“-Label zugeordnet. Diese Labels sind in hierarchischen
Klassen und nicht-hierarchischen Komponenten geordnet. Je h?her die
Klasse, um so h?her die Integrit?t.

Die unterst?tzten Labels hei?en ``biba/low``, ``biba/equal`` und
``biba/high``. Sie werden im Folgenden erkl?rt:

.. raw:: html

   <div class="itemizedlist">

-  ``biba/low`` ist die niedrigste Stufe der Integrit?t, die einem
   Objekt verliehen werden kann. Wenn sie einem Objekt oder Subjekt
   zugeordnet wird, kann dieses auf Objekte oder Subjekte, die biba/high
   markiert wurden, zwar lesend zugreifen, nicht jedoch schreibend.

-  Das Label ``biba/equal`` ist, wie der aufmerksame Leser sicherlich
   schon ahnt, f?r die Ausnahmen dieser Richtlinie gedacht und sollte
   nur diesen Ausnahmen entsprechenden Objekten verliehen werden.

-  ``biba/high`` markierte Subjekte und Objekte k?nnen Objekte
   niedrigerer Stufe schreiben , nicht jedoch lesen. Es wird empfohlen,
   dass dieses Label an Objekte vergeben wird, die sich auf Integrit?t
   des gesamten Systems auswirken.

.. raw:: html

   </div>

Biba stellt bereit:

.. raw:: html

   <div class="itemizedlist">

-  Hierarchische Integrit?tsstufen mit einem Satz nichthierarchischer
   Integrit?tskategorien;

-  Festgeschriebene Regeln: kein „Write-Up“, kein „Read-Down“ (der
   Gegensatz zu MLS - ein Subjekt erh?lt schreibenden Zugriff auf
   Objekte gleicher oder geringerer Stufe, aber nicht bei h?herer, und
   lesenden Zugriff bei gleicher Stufe oder h?erer, aber nicht bei
   niedrigerer);

-  Integrit?t (es wird die Echtheit der Daten gew?hrleistet, indem
   unangemessene Ver?nderungen verhindert werden);

-  Eine Abstufung der Gew?hrleistung (im Gegensatz zu MLS, bei der eine
   Abstufung der Vertraulichkeit vorgenommen wird).

.. raw:: html

   </div>

Folgende ``sysctl`` Parameter werden zur Nutzung der Biba-Richtlinie
angeboten:

.. raw:: html

   <div class="itemizedlist">

-  ``security.mac.biba.enabled`` zum Aktivieren/Deaktivieren der
   Richtlinie auf dem Zielsystem.

-  ``security.mac.biba.ptys_equal`` wird verwendet, um die
   Biba-Richtlinie auf der
   `pty(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pty&sektion=4>`__-Schnittstelle
   zu deaktivieren.

-  ``security.mac.biba.revocation_enabled`` erzwingt das Zur?cksetzen
   des Labels, falls dieses zeitweise ge?ndert wurde um ein Subjekt zu
   dominieren.

.. raw:: html

   </div>

Um Einstellungen der Biba Richtlinie f?r Systemobjekte zu ver?ndern
werden die Befehle ``setfmac`` und ``getfmac`` verwendet:

.. code:: screen

    # setfmac biba/low test
    # getfmac test
    test: biba/low

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

17.13.1. Verbindliche Integrit?t in der Planungsphase
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Integrit?t garantiert, im Unterschied zu Sensitivit?t, dass
Informationen nur durch vertraute Parteien ver?ndert werden k?nnen. Dies
schlie?t Informationen ein, die zwischen Subjekten ausgetauscht werden,
zwischen Objekt, oder auch zwischen den beiden. Durch Integrit?t wird
gesichert, das Nutzer nur Informationen ver?ndern, oder gar nur lesen
k?nnen, die sie explizit ben?tigen.

Das Modul
`mac\_biba(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_biba&sektion=4>`__
er?ffnet einem Administrator die M?glichkeit zu bestimmen, welche
Dateien oder Programme ein Nutzer oder eine Nutzergruppe sehen bzw.
aufrufen darf. Gleichzeitig kann er zusichern, dass dieselben Programme
und Dateien frei von Bedrohungen sind und das System die Echtheit
gew?hrleistet - f?r diesen Nutzer oder die Nutzergruppe.

W?hrend der anf?nglichen Phase der Planung mu? der Administrator
vorbereitet sein, Nutzer in Klassen, Stufen und Bereiche einzuteilen.
Der Zugriff auf Dateien und insbesondere auch Programme wird verhindert
sowohl vor als auch nachdem sie gestartet wurden. Das System selbst
erh?lt als Voreinstellung das Label ``biba/high`` sobald das Modul
aktiviert wird?- und es liegt allein am Administrator, die verschiedenen
Klassen und Stufen f?r die einzelnen Nutzer zu konfigurieren. Anstatt
mit Freigaben zu arbeiten, wie weiter oben gezeigt wurde, k?nnte man
auch ?berbegriffe f?r Projekte oder Systemkomponenten entwerfen. Zum
Beispiel, ausschlie?lich Entwicklern den Vollzugriff auf Quellcode,
Compiler und Entwicklungswerkzeuge gew?hren, w?hrend man andere Nutzer
in Kategorien wie Tester, Designer oder einfach nur „allgemeiner Nutzer“
zusammenfa?t, die f?r diese Bereiche lediglich lesenden Zugriff erhalten
sollen.

Mit seinem urspr?nglichen Sicherheits-Standpunkt ist ein Subjekt
niedrigerer Integrit?t unf?hig, ein Subjekt h?herer Integrit?t zu
ver?ndern. Ein Subjekt h?herer Integrit?t kann ein Subjekt niedrigerer
Integrit?t weder beobachten noch lesen. Wenn man ein Label f?r die
niedrigstm?gliche Klasse erstellt, kann man diese allen Subjekten
verwehren. Einige weitsichtig eingerichtete Umgebungen, die diese
Richtlinie verwenden, sind eingeschr?nkte Webserver, Entwicklungs- oder
Test-Rechner oder Quellcode-Sammlungen. Wenig sinnvoll ist diese
Richtlinie auf einer Arbeitsstation, oder auf Rechnern die als Router
oder Firewall verwendet werden.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------------+-------------------------------+----------------------------------+
| `Zur?ck <mac-mls.html>`__?                   | `Nach oben <mac.html>`__      | ?\ `Weiter <mac-lomac.html>`__   |
+----------------------------------------------+-------------------------------+----------------------------------+
| 17.12. Das MAC Modul Multi-Level Security?   | `Zum Anfang <index.html>`__   | ?17.14. Das MAC Modul LOMAC      |
+----------------------------------------------+-------------------------------+----------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
