==========================
17.4. MAC Labels verstehen
==========================

.. raw:: html

   <div class="navheader">

17.4. MAC Labels verstehen
`Zur?ck <mac-initial.html>`__?
Kapitel 17. Verbindliche Zugriffskontrolle
?\ `Weiter <mac-planning.html>`__

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

17.4. MAC Labels verstehen
--------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

MAC Label sind Sicherheitsmerkmale, die, wenn sie zum Einsatz kommen,
allen Subjekten und Objekten im System zugeordnet werden.

Wenn ein Administrator ein solches Merkmal bzw. Attribut setzen will,
mu? er/sie verstehen k?nnen, was da genau passiert. Die Attribute, die
im speziellen Fall zu vergeben sind, h?ngen vom geladenen Modul und den
darin jeweils implementierten Richtlinien ab. Jedes dieser
Richtlinienmodule setzt die Arbeit mit seinen entsprechenden Attributen
in individueller Weise um. Falls der Nutzer nicht versteht, was er da
konfiguriert, oder auch, was seine Konfiguration f?r
Begleiterscheinungen mit sich bringt, ergibt sich meist als Resultat ein
unerwartetes, ja sogar unerw?nschtes Verhalten des gesamten Systems.

Ein Label, einem Objekt verliehen, wird verwendet, um anhand einer
Richtlinie eine sicherheitsrelevante Entscheidung ?ber Zugriffsrechte zu
f?llen. In einigen Richtlinien enth?lt bereits das Label selbst alle
daf?r n?tigen Informationen. Andere Richtlinien verwenden diese
Informationen, um zun?chst ein komplexes Regelwerk abzuarbeiten.

Wenn man zum Beispiel einer Datei das Attribut ``biba/low`` zuordnet,
wird dieses durch das Biba Sicherheitsrichtlinienmodul, und zwar mit dem
Wert „low“, verarbeitet.

Einige der Richtlinienmodule, die die M?glichkeit zum Vergeben von
Labels unter FreeBSD unterst?tzen, bieten drei vordefinierte Labels an.
Dieses nennen sich „high“, „low“ und „equal“. Obwohl die verschiedenen
Module die Zugriffskontrolle auf verschiedene Weisen regeln, kann man
sich sicher sein, das das „low“-Label der untersten, unsichersten
Einstellung entspricht, das „equal“-Label die Verwendung des Moduls f?r
das jeweilige Objekt oder Subjekt deaktiviert - und das „high“-Label die
h?chstm?gliche Einstellung erzwingt. Im Speziellen gilt diese Aussage
f?r die Richtlinien(-module) MLS und Biba.

In den meisten Umgebungen, sogenannten Single Label Environments, wird
Objekten nur ein einzelnes Label zugewiesen. Dadurch wird nur ein
Regelsatz f?r die Zugriffskontrolle auf das gesamte System verwendet -
und das ist meistens auch tats?chlich ausreichend. Es gibt wenige F?lle,
in denen mehrere Labels auf Dateisystemobjekte oder -subjekte verwendet
werden. In einem solchen Fall mu? das Dateisystem mit der
`tunefs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=tunefs&sektion=8>`__-Option
``multilabel`` angepa?t werden, da ``single label`` die
Standardeinstellung ist.

Bei der Verwendung von Biba oder MLS kann man numerische Labels
vergeben, die genau das Level angeben, an welcher Stelle in der
Hierarchie das Subjekt oder Objekt einzuordnen ist. Dieses numerische
Level wird verwendet, um Informationen in verschiedene Gruppen
aufzuteilen oder zu sortieren - damit zum Beispiel nur Subjekte, die zu
einer gewissen Vertraulichkeitsstufe geh?ren, Zugang zu einer Gruppe von
Objekten erhalten.

In den meisten F?llen wird ein Administrator nur ein einzelnes Label f?r
das gesamte Dateisystem verwenden.

*Moment mal, dass ist doch dasselbe wie DAC! Ich dachte, MAC w?rde die
Kontrolle strengstens an den Administrator binden!* Diese Aussage h?lt
immer noch stand? - ``root`` ist derjenige, der die Kontrolle aus?bt und
die Richtlinie konfiguriert, so dass Nutzer in die entsprechenden,
angemessenen Kategorien / Zugriffsklassen eingeordnet werden. Nunja,
einige Module schr?nken ``root`` selbst ein. Die Kontrolle ?ber Objekte
wird dann einer Gruppe zugewiesen, jedoch hat ``root`` die M?glichkeit,
die Einstellungen jederzeit zu widerrufen oder zu ?ndern. Dies ist das
Hierarchie/Freigabe-Modell, das durch Richtlinien wie MLS oder Biba
bereitgestellt wird.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

17.4.1. Konfigurieren der Labels
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Gewisserma?en alle Aspekte der Labelkonfiguration werden durch Werkzeuge
das Basissystems umgesetzt. Die entsprechenden Kommandos bieten eine
einfache Schnittstelle zum Konfigurieren, Manipulieren und auch
Verifizieren der gekennzeichneten Objekte.

Mit den beiden Kommandos
`setfmac(8) <http://www.FreeBSD.org/cgi/man.cgi?query=setfmac&sektion=8>`__
und
`setpmac(8) <http://www.FreeBSD.org/cgi/man.cgi?query=setpmac&sektion=8>`__
kann man eigentlich schon alles machen. Das Kommando ``setfmac`` wird
verwendet, um ein MAC-Label auf einem Systemobjekt zu setzen,
``setpmac`` hingegen zum Setzen von Labels auf Systemsubjekte. Als
Beispiel soll hier dienen:

.. code:: screen

    # setfmac biba/high test

Wenn bei der Ausf?hrung dieses Kommandos keine Fehler aufgetreten sind,
gelangt man zur Eingabeaufforderung zur?ck. Nur wenn ein Fehler
auftritt, verhalten sich diese Kommandos nicht still, ganz wie auch die
Kommandos
`chmod(1) <http://www.FreeBSD.org/cgi/man.cgi?query=chmod&sektion=1>`__
und
`chown(8) <http://www.FreeBSD.org/cgi/man.cgi?query=chown&sektion=8>`__.
In einigen F?llen wird dieser Fehler Permission denied lauten und
gew?hnlich dann auftreten, wenn ein Label an einem Objekt angebracht
oder ver?ndert werden soll, das bereits (Zugriffs-)Beschr?nkungen
unterliegt.`:sup:`[11]` <#ftn.idp79845968>`__ Der Systemadministrator
kann so eine Situation mit Hilfe der folgenden Kommandos ?berwinden:

.. code:: screen

    # setfmac biba/high test
    Permission denied
    # setpmac biba/low setfmac biba/high test
    # getfmac test
    test: biba/high

Wie wir hier sehen, kann ``setpmac`` verwendet werden, um die vorhandene
Einstellungen zu umgehen, indem dem gestarteten Proze? ein anderes,
valides Label zugeordnet wird. Das Werkzeug ``getpmac`` wird
normalerweise auf gerade laufende Prozesse angewendet. ?hnlich sendmail:
Als Argument wird statt eines Kommandos eine eine Proze?-ID ?bergeben,
es verbirgt sich doch dieselbe Logik dahinter. Wenn ein Nutzer versucht,
eine Datei zu ver?ndern, auf die er keinen Zugriff hat, entsprechend der
Regeln eines geladenen Richtlinienmoduls, wird der Fehler Operation not
permitted durch die Funktion ``mac_set_link`` angezeigt.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

17.4.1.1. ?bliche Typen von Labeln
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn man die Module
`mac\_biba(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_biba&sektion=4>`__,
`mac\_mls(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_mls&sektion=4>`__
und
`mac\_lomac(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_lomac&sektion=4>`__
verwendet, hat man die M?glichkeit, einfache Label zu vergeben. Diese
nennen sich ``high``, ``low`` und ``equal``. Es folgt eine kurze
Beschreibung, was diese Labels bedeuten:

.. raw:: html

   <div class="itemizedlist">

-  Das Label ``low`` ist definitionsgem?? das niedrigeste Label, das
   einem Objekt oder Subjekt verliehen werden kann. Wird es gesetzt,
   kann die entsprechende Entit?t nicht mehr auf Entit?ten zugreifen,
   die das Label ``high`` tragen.

-  Das Label ``equal`` wird Entit?ten verliehen, die von der Richtlinie
   ausgenommen sein sollen.

-  Das Label ``high`` verleiht einer Entit?t die h?chstm?gliche
   Einstellung.

.. raw:: html

   </div>

Unter Beachtung jedes einzelnen Richtlinienmoduls moduliert und
beschr?nkt jede dieser Einstellungen den Informationsflu?
unterschiedlich. Genaue Erkl?rungen zu den Charakteristika der einfachen
Labels in den verschiedenen Modulen finden sich im entsprechenden
Unterabschnitt dieses Kapitels oder in den Manpages.

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

17.4.1.1.1. Fortgeschrittene Label-Konfiguration
''''''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Numerische klassifizierte Labels werden verwendet in der Form
``Klasse:Verbund+Verbund``. Demnach ist das Label

.. code:: programlisting

    biba/10:2+3+6(5:2+3-15:2+3+4+5+6)

folgenderma?en zu lesen:

„Biba Policy Label“/„effektive Klasse 10“ :„Verbund 2,3 und 6“:
(„Low-Klasse 5:...“- „High-Klasse 15:...“)

In diesem Beispiel ist die erstgenannte Klasse als „effektive Klasse“ zu
bezeichnen. Ihr werden die „effektiven Verb?nde“ zugeordnet. Die zweite
Klasse ist die „Low“-Klasse und die letzte die „high“-Klasse. Die
allermeisten Konfigurationen kommen ohne die Verwendungen von solchen
Klassen aus, nichtsdestotrotz kann man sie f?r erweiterte
Konfigurationen verwenden.

Sobald sie auf *Systemsubjekte* angewendet werden, haben diese eine
gegenw?rtige Klasse/Verbund- Konfiguration und diese mu? im definierten
Rahmen gegebenenfalls angepa?t (erh?ht oder gesenkt) werden. Im
Gegensatz dazu haben *Systemobjekte* alle eingestellten (effektive,
High- und Low-Klasse) gleichzeitig. Dies ist notwendig, damit auf Sie
von den *Systemsubjekten* in den verschiedenen Klassen gleichzeitig
zugegriffen werden kann.

Die Klasse und und die Verb?nde in einem Subjekt-Objekt-Paar werden zum
Erstellen einer sogenannten Dominanz-Relation verwendet, in welcher
entweder das Subjekt das Objekt, das Objekt das Subjekt, keines das
andere dominiert oder sich beide gegenseitig dominieren. Der Fall, dass
sich beide dominieren, tritt dann ein, wenn die beiden Labels gleich
sind. Wegen der Natur des Informationsflusses in Biba kann man einem
Nutzer Rechte f?r einen Reihe von Abteilungen zuordnen, die zum Beispiel
mit entsprechenden Projekten korrespondieren. Genauso k?nnen aber auch
Objekten mehrere Abteilungen zugeordnet sein. Die Nutzer m?ssen
eventuell ihre gegenw?rtigen Rechte mithilfe von ``su`` or ``setpmac``
anpassen um auf Objekte in einer Abteilung zuzugreifen, zu der sie laut
ihrer effektiven Klasse nicht berechtigt sind.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

17.4.1.2. Nutzer- und Label-Einstellungen
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Nutzer selbst brauchen Labels damit ihre Dateien und Prozesse korrekt
mit der Sicherheitsrichtlinie zusammenarbeitet, die f?r das System
definiert wurde. Diese werden in der Datei ``login.conf`` durch die
Verwendung von Login- Klassen zugeordnet. Jedes Richtlinienmodul, das
Label verwendet, arbeitet mit diesen Login-Klassen.

Beispielhaft wird der folgende Eintrag, der f?r jede Richtlinie eine
Einstellung enth?lt, gezeigt:

.. code:: programlisting

    default:\
    :copyright=/etc/COPYRIGHT:\
    :welcome=/etc/motd:\
    :setenv=MAIL=/var/mail/$,BLOCKSIZE=K:\
    :path=~/bin:/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin:\
    :manpath=/usr/share/man /usr/local/man:\
    :nologin=/usr/sbin/nologin:\
    :cputime=1h30m:\
    :datasize=8M:\
    :vmemoryuse=100M:\
    :stacksize=2M:\
    :memorylocked=4M:\
    :memoryuse=8M:\
    :filesize=8M:\
    :coredumpsize=8M:\
    :openfiles=24:\
    :maxproc=32:\
    :priority=0:\
    :requirehome:\
    :passwordtime=91d:\
    :umask=022:\
    :ignoretime@:\
    :label=partition/13,mls/5,biba/10(5-15),lomac/10[2]:

Die Label-Option in der letzten Zeile legt fest, welches Standard-Label
f?r einen Nutzer erzwungen wird. Nutzern darf niemals gestattet werden,
diese Werte selbst zu ver?ndern, demnach haben Nutzer in dieser
Beziehung auch keine Wahlfreiheit. In einer richtigen Konfiguration
jedoch wird kein Administrator alle Richtlinienmodule aktivieren wollen.
Es wird an dieser Stelle ausdr?cklich empfohlen, dieses Kapitel zu Ende
zu lesen, bevor irgendein Teil dieser Konfiguration ausprobiert wird.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Nutzer k?nnen ihr eigenes Label nach dem Loginvorgang durchaus ?ndern.
Jedoch kann diese ?nderung nur unter den Auflagen der gerade g?ltigen
Richtlinie geschehen. Im Beispiel oben wird f?r die Biba-Richtlinie eine
minimale Proze?integrit?t von 5, eine maximale von 15 angegeben, aber
die Voreinstellung des tats?chlichen Labels ist 10. Der Nutzerproze?
l?uft also mit einer Integrit?t von 10 bis das Label ver?ndert wird, zum
Beispiel durch eine Anwendung des Kommandos ``setpmac``, welches jedoch
auf den Bereich eingeschr?nkt wird, der zum Zeitpunkt des Logins
angegeben wurde, in diesem Fall von 5 bis 15.

.. raw:: html

   </div>

Nach einer ?nderung der Datei ``login.conf`` mu? in jedem Fall die
Bef?higungsdatenbank mit dem Kommando ``cap_mkdb`` neu erstellt werden?-
und das gilt f?r alle im weiteren Verlauf gezeigten Beispiele und
Diskussionspunkte.

Es ist n?tzlich anzumerken, dass viele Einsatzorte eine gro?e Anzahl von
Nutzern haben, die wiederum viele verschiedenen Nutzerklassen angeh?ren
sollen. Hier ist eine Menge Planungsarbeit notwendig, da die Verwaltung
sehr un?bersichtlich und schwierig ist.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

17.4.1.3. Netzwerkschnittstellen und die zugeh?rigen Label
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Labels k?nnen auch, wenn man sie an Netzwerkschittstellen vergibt,
helfen, den Datenflu? durch das Netzwerk zu kontrollieren. Das
funktioniert in allen F?llen genau so wie mit Objekten. Nutzer, die in
der Biba-Richtlinie das Label ``high`` tragen, d?rfen nicht auf
Schnittstellen zugreifen, die ``low`` markiert sind usw.

Die Option ``maclabel`` wird via ``ifconfig`` ?bergeben. Zum Beispiel

.. code:: screen

    # ifconfig bge0 maclabel biba/equal

belegt die Schnittstelle
`bge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bge&sektion=4>`__ mit
dem MAC Label ``biba/equal``. Wenn eine komplexe Einstellung wie
``biba/high(low-high)`` verwendet wird, mu? das gesamte Label in
Anf?hrungszeichen geschrieben werden, da sonst eine Fehlermeldung
zur?ckgegeben wird.

Jedes Richtlinienmodul, das die Vergabe von Labels unterst?tzt, stellt
einen Parameter bereit, mit dem das MAC Label f?r Netzwerkschnittstellen
deaktiviert werden kann. Das Label der Netzwerkschnittstelle auf
``equal`` zu setzen, f?hrt zum selben Ergebnis. Beachten Sie die Ausgabe
von ``sysctl``, die Manpages der verschiedenen Richtlinien oder eben die
Informationen, die im weiteren Verlauf dieses Kapitels angeboten werden,
um mehr zu diesen Parametern zu erfahren.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

17.4.2. Single- oder Multilabel?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Als Standardeinstellung verwendet das System die Option
``single label``. Was bedeutet das f?r den Administrator? Es gibt einige
Unterschiede zwischen ``single         label`` und ``multilabel``. In
ihrer ureigenen Weise bieten beide Vor- und Nachteile bezogen auf die
Flexibilit?t bei der Modellierung der Systemsicherheit.

Die Option ``single label`` gibt jedem Subjekt oder Objekt genau ein
einziges Label, zum Beispiel ``biba/high``. Mit dieser Option hat man
einen geringeren Verwaltungsaufwand, aber die Flexibilit?t beim
Einsatzes von Richtlinien ist ebenso gering. Viele Administratoren
w?hlen daher auch die Option ``multilabel`` im Sicherheitsmodell, wenn
die Umst?nde es erfordern.

Die Option ``multilabel`` gestattet, jedem einzelnen Subjekt oder Objekt
seine eigenen unabh?ngigen Label zu zuzuordnen. Die Optionen
``multilabel`` und ``     singlelabel`` betreffen jedoch nur die
Richtlinien, die Labels als Leistungsmerkmal verwenden, einschlie?lich
der Richtlinien Biba, Lomac, MLS und SEBSD.

Wenn Richtlinien benutzt werden sollen, die ohne Labels auskommen, wird
die Option ``multilabel`` nicht ben?tigt. Dies betrifft die Richtlinien
``seeotheruids``, ``portacl`` und ``partition``.

Man sollte sich dessen bewu?t sein, dass die Verwendung der Option
``multilabel`` auf einer Partition und die Erstellung eines
Sicherheitsmodells auf der Basis der FreeBSD ``multilevel``
Funktionalit?t einen hohen Verwaltungsaufwand bedeutet, da alles im
Dateisystem ein Label bekommt. Jedes Verzeichnis, jede Datei und genauso
jede Schnittstelle.

Das folgende Kommando aktiviert ``multilabel`` f?r ein Dateisystem. Dies
funktioniert nur im Einzelbenutzermodus:

.. code:: screen

    # tunefs -l enable /

In einer Swap-Partition wird dies nicht ben?tigt.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Falls Sie Probleme beim Setzen der Option ``multilabel`` auf der
Root-Partition bemerken, lesen Sie bitte `Abschnitt?17.17, „Fehler im
MAC beheben“ <mac-troubleshoot.html>`__ dieses Kapitels.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="footnotes">

--------------

.. raw:: html

   <div id="ftn.idp79845968" class="footnote">

`:sup:`[11]` <#idp79845968>`__\ Andere Vorbedingungen f?hren nat?rlich
zu anderen Fehlern. Zum Beispiel wenn das Objekt nicht dem Nutzer
geh?rt, der das Label ?ndern m?chte, das Objekt vielleicht gar nicht
existiert oder es sich um ein nur lesbares Objekt handelt. Oder eine
verbindliche Richtlinie erlaubt dem Proze? die Ver?nderung des Labels
nicht, weil die Eigenschaften der Datei, die Eigenschaften des Prozesses
oder der Inhalt des neuen Labels nicht akzeptiert werden. Beispiel: Ein
Anwender mit geringer Vertraulichkeit versucht, das Label einer Datei
mit hoher Vertraulichkeit zu ?ndern. Oder er versucht, eine Datei mit
geringer Vertraulichkeit zu einer Datei mit hoher Vertraulichkeit zu
machen.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------+-------------------------------+-------------------------------------------+
| `Zur?ck <mac-initial.html>`__?   | `Nach oben <mac.html>`__      | ?\ `Weiter <mac-planning.html>`__         |
+----------------------------------+-------------------------------+-------------------------------------------+
| 17.3. Erl?uterung?               | `Zum Anfang <index.html>`__   | ?17.5. Planung eines Sicherheitsmodells   |
+----------------------------------+-------------------------------+-------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
