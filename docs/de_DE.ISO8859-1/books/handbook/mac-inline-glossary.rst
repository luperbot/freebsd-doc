=======================
17.2. Schl?sselbegriffe
=======================

.. raw:: html

   <div class="navheader">

17.2. Schl?sselbegriffe
`Zur?ck <mac.html>`__?
Kapitel 17. Verbindliche Zugriffskontrolle
?\ `Weiter <mac-initial.html>`__

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

17.2. Schl?sselbegriffe
-----------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Bevor Sie weiterlesen, m?ssen noch einige Schl?sselbegriffe gekl?rt
werden. Dadurch soll jegliche auftretende Verwirrung von vornherein
beseitigt und die pl?tzliche Einf?hrung neuer Begriffe und Informationen
vermieden werden.

.. raw:: html

   <div class="itemizedlist">

-  *Verbund*: Ein Verbund ist ist ein Satz von Programmen und Daten, die
   speziell und zusammen abgeschottet wurden, um Nutzern Zugriff auf
   diese ausgewiesenen Systembereiche zu gew?hren. Man kann sagen, ein
   solcher Verbund ist eine Gruppierung, ?hnlich einer Arbeitsgruppe,
   einer Abteilung, einem Projekt oder einem Thema. Durch die Nutzung
   von Verb?nden (*compartments*) kann man Sicherheitsrichtlinien
   erstellen, die alles notwendige Wissen und alle Werkzeuge
   zusammenfassen.

-  *Hochwassermarkierung*: Eine solche Richtlinie erlaubt die Erh?hung
   der Sicherheitsstufe in Abh?ngigkeit der Klassifikation der gesuchten
   bzw. bereitzustellenden Information. Normalerweise wird nach
   Abschluss des Prozesses die urspr?ngliche Sicherheitsstufe wieder
   hergestellt. Derzeit enth?lt die MAC Grundstruktur keine M?glichkeit,
   eine solche Richtlinie umzusetzen, der Vollst?ndigkeit halber ist die
   Definition hier jedoch aufgef?hrt.

-  *Integrit?t*: Das Schl?sselkonzept zur Klassifizierung der
   Vertraulichkeit von Daten nennt man Integrit?t. Je weiter die
   Integrit?t erh?ht wird, umso mehr kann man den entsprechenden Daten
   vertrauen.

-  *Label*: Ein Label ist ein Sicherheitsmerkmal, welches mit Dateien,
   Verzeichnissen oder anderen Elementen im System verbunden wird. Man
   sollte es wie einen Vertraulichkeitsstempel auffassen, der Dateien
   angeh?rt wie beispielsweise die Zugriffszeit, das Erstellungsdatum
   oder auch der Name; sobald Dateien derart gekennzeichnet werden,
   bezeichnen diese Label die sicherheitsrelevanten Eigenschaften.
   Zugriff ist nur noch dann m?glich, wenn das zugreifende Subjekt eine
   korrespondierende Kennzeichnung tr?gt. Die Bedeutung und Verarbeitung
   der Label-Werte ist von der Einrichtung der Richtlinie abh?ngig:
   W?hrend einige Richtlinien das Label zum Kennzeichnen der
   Vertraulichkeit oder Geheimhaltungsstufe eines Objekts nutzen, k?nnen
   andere Richtlinien an derselben Stelle Zugriffsregeln festschreiben.

-  *Level*: Eine erh?hte oder verminderte Einstellung eines
   Sicherheitsmerkmals. Wenn das Level erh?ht wird, wird auch die
   ensprechende Sicherheitsstufe angehoben.

-  *Niedrigwassermarkierung*: Eine solche Richtlinie erlaubt das
   Herabstufen des Sicherheitslevels, um weniger sensible Daten
   verf?gbar zu machen. In die meisten F?llen wird das urspr?ngliche
   Sicherheitslevel des Nutzers wiederhergestellt, sobald der Vorgang
   abgeschlossen ist. Das einzige Modul in FreeBSD, welches von dieser
   Richtlinie Gebrauch macht, ist
   `mac\_lomac(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_lomac&sektion=4>`__.

-  *Multilabel*: Die Eigenschaft ``multilabel`` ist eine
   Dateisystemoption, die entweder im Einzelbenutzermodus mit Hilfe des
   Werkzeugs
   `tunefs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=tunefs&sektion=8>`__,
   w?hrend des Bootvorgangs in der Datei
   `fstab(5) <http://www.FreeBSD.org/cgi/man.cgi?query=fstab&sektion=5>`__
   oder aber beim Erstellen einen neues Dateisystems aktiviert werden
   kann. Diese Option erlaubt einem Administrator, verschiedenen
   Objekten unterschiedliche Labels zuzuordnen - kann jedoch nur
   zusammen mit Modulen angewendet werden, die auch tats?chlich mit
   Labels arbeiten.

-  *Objekt*: Ein Objekt oder auch Systemobjekt ist theoretisch eine
   Einheit, durch welche Information flie?t, und zwar unter der Lenkung
   eines *Subjektes*. Praktisch schliesst diese Definition
   Verzeichnisse, Dateien, Felder, Bildschirme, Tastaturen, Speicher,
   Bandlaufwerke, Drucker und jegliche anderen Datenspeicher- oder
   -verarbeitungsger?te ein. Im Prinzip ist ein Objekt ein
   Datenkontainer oder eine Systemressource - Zugriff auf ein *Objekt*
   bedeutet, auf Daten zuzugreifen.

-  *Richtlinie*: Eine Sammlung von Regeln, die definiert, wie
   Zielvorgaben umgesetzt werden, nennt man Richtlinie. Eine
   *Richtlinie* dokumentiert normalerweise, wie mit bestimmten Elementen
   umgegangen wird. Dieses Kapitel fa?t den Begriff in diesem Kontext
   als *Sicherheitsrichtlinie* auf; als eine Sammlung von Regeln, die
   den Flu? von Daten und Informationen kontrolliert und die
   gleichzeitig definiert, wer auf diese Daten und Informationen
   zugreifen darf.

-  *Anf?lligkeit*: Dieser Begriff wird normalerweise verwendet, wenn man
   ?ber MLS (Multi Level Security) spricht. Das Anf?lligkeits-Level
   beschreibt, wie wichtig oder geheim die Daten sein sollen. Um so
   h?her das Anf?lligkeits-Level, um so wichtiger die Geheimhaltung bzw.
   Vertraulichkeit der Daten.

-  *Einzel-Label*: Von einem Einzel-Label spricht man, wenn f?r ein
   ganzes Dateisystem lediglich ein einziges Label verwendet wird, um
   Zugriffskontrolle ?ber den gesamten Datenfluss zu erzwingen. Sobald
   diese Option verwendet wird - und das ist zu jeder Zeit, wenn die
   Option ``multilabel`` nicht explizit gesetzt wurde - sind alle
   Dateien und Verzeichnisse mit dem gleichen Label gekennzeichnet.

-  *Subjekt*: Ein Subjekt ist jedwede Einheit, die Information in Fluss
   zwischen Objekten bringt: Zum Beispiel ein Nutzer, ein
   Nutzerprozessor, ein Systemproze? usw. In FreeBSD handelt es sich
   meistens um einen Thread, der als Proze? im Namen eines Nutzers
   arbeitet.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------------+-------------------------------+------------------------------------+
| `Zur?ck <mac.html>`__?                        | `Nach oben <mac.html>`__      | ?\ `Weiter <mac-initial.html>`__   |
+-----------------------------------------------+-------------------------------+------------------------------------+
| Kapitel 17. Verbindliche Zugriffskontrolle?   | `Zum Anfang <index.html>`__   | ?17.3. Erl?uterung                 |
+-----------------------------------------------+-------------------------------+------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
