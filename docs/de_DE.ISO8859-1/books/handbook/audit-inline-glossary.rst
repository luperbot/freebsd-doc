=======================
18.2. Schl?sselbegriffe
=======================

.. raw:: html

   <div class="navheader">

18.2. Schl?sselbegriffe
`Zur?ck <audit.html>`__?
Kapitel 18. Security Event Auditing
?\ `Weiter <audit-install.html>`__

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

18.2. Schl?sselbegriffe
-----------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Vor dem Lesen dieses Kapitels m?ssen einige Audit-bezogene
Schl?sselbegriffe erl?utert werden:

.. raw:: html

   <div class="itemizedlist">

-  *event*: Ein auditierbares Ereignis ist ein Ereignis, das mit dem
   Audit-Subsystem aufgezeichnet werden kann. Beispiele f?r
   sicherheitsrelevante Systemereignisse sind etwa das Anlegen von
   Dateien, das Erstellen einer Netzwerkverbindung oder eine
   Benutzeranmeldung. Ereignisse sind entweder „attributierbar“, k?nnen
   also zu einen authentifizierten Benutzer zur?ckverfolgt werden, oder
   sind „nicht-attributierbar“, falls dies nicht m?glich ist.
   Nicht-attributierbare Ereignisse erfolgen daher vor der
   Authentifizierung im Anmeldeprozess (beispielsweise die Eingabe eines
   falschen Passworts).

-  *class*: Ereignisklassen sind benannte Zusammenstellungen von
   zusammengeh?renden Ereignissen und werden in Auswahl-Ausdr?cken
   benutzt. H?ufig genutzte Klassen von Ereignissen schlie?en „file
   creation“ (fc, Anlegen von Dateien), „exec“ (ex, Ausf?hrung) und
   „login\_logout“ (lo, Anmeldung-Abmeldung) ein.

-  *record*: Ein Datensatz ist ein Audit-Logeintrag, welcher ein
   Sicherheitsereignis enth?lt. Jeder Datensatz enth?lt einen
   Ereignistyp, Informationen ?ber den Gegenstand (Benutzer), welcher
   die Aktion durchf?hrt, Datums- und Zeitinformationen, Informationen
   ?ber jedes Objekt oder Argument sowie den Zustand hinsichtlich Erfolg
   oder Scheitern der Operation.

-  *trail*: Ein Audit-Pfad (audit trail) oder eine Log-Datei besteht aus
   einer Reihe von Audit-Datens?tzen, die Sicherheitsereignisse
   beschreiben. Normalerweise sind die Pfade in grober zeitlicher
   Reihenfolge bez?glich des Zeitpunktes, an welchem ein Ereignis
   beendet wurde. Nur authorisierte Prozesse d?rfen Datens?tze zum
   Audit-Pfad hinzuf?gen.

-  *selection expression*: Ein Auswahlausdruck ist eine Zeichenkette,
   welche eine Liste von Pr?fixen und Audit-Ereignisklassennamen
   enth?lt, um Ereignisse abzugleichen.

-  *preselection*: Die Vorauswahl ist der Prozess, durch den das System
   erkennt, welche Ereignisse von Interesse f?r den Administrator sind,
   um die Erzeugung von Datens?tze zu verhindern, welche nicht von
   Belang sind. Die Konfiguration der Vorauswahl benutzt eine Reihe von
   Auswahl-Ausdr?cken, um zu erkennen, welche Klassen von Ereignissen
   f?r welche Benutzer aufgezeichnet werden sollen sowie globale
   Einstellungen, welche sowohl auf authorisierte als auch
   unauthorisierte Prozesse angewendet werden.

-  *reduction*: Die Reduzierung ist der Prozess, durch den Datens?tze
   von bestehenden Audit-Pfaden ausgew?hlt werden f?r Speicherung,
   Ausdruck oder Analyse. Ebenso der Prozess, durch den unerw?nschte
   Datens?tze aus dem Audit-Pfad entfernt werden. Mittels Reduzierung
   k?nnen Administratoren Richtlinien f?r die Speicherung von
   Audit-Daten vorgeben. Zum Beispiel k?nnen ausf?hrliche Audit-Pfade
   f?r einen Monat gespeichert werden, um danach den Pfad f?r
   archivarische Zwecke auf die Anmeldeinformationen zu reduzieren.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------+-------------------------------+-----------------------------------------------+
| `Zur?ck <audit.html>`__?               | `Nach oben <audit.html>`__    | ?\ `Weiter <audit-install.html>`__            |
+----------------------------------------+-------------------------------+-----------------------------------------------+
| Kapitel 18. Security Event Auditing?   | `Zum Anfang <index.html>`__   | ?18.3. Installation der Audit-Unterst?tzung   |
+----------------------------------------+-------------------------------+-----------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
