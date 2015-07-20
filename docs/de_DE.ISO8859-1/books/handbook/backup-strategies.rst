========================
19.11. Backup-Strategien
========================

.. raw:: html

   <div class="navheader">

19.11. Backup-Strategien
`Zur?ck <backups-floppybackups.html>`__?
Kapitel 19. Speichermedien
?\ `Weiter <backup-basics.html>`__

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

19.11. Backup-Strategien
------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Beigetragen von Lowell Gilbert.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn Sie eine eigene Backup-Strategie planen, m?ssen Sie darauf achten,
dass jedes der folgenden Probleme von Ihrer Strategie abgedeckt wird:

.. raw:: html

   <div class="itemizedlist">

-  Plattendefekte.

-  Versehentliches L?schen von Dateien.

-  Eine nicht vorhersehbare Korrumpierung von Dateien.

-  Die vollst?ndige Zerst?rung Ihres Systems, etwa durch ein Feuer. Dazu
   geh?rt auch die Zerst?rung von Backups, die am gleichen Ort
   aufbewahrt werden.

.. raw:: html

   </div>

Es ist nicht nur m?glich, dass ein System f?r jedes dieser Probleme eine
eigene (oft v?llig unterschiedliche) Strategie ben?tigt. Es ist vielmehr
unwahrscheinlich (sieht man von Systemen ab, die keine wichtigen Daten
enthalten), dass eine Technik alle Problembereiche abdecken kann.

H?ufig verwendeten Techniken sind unter anderen:

.. raw:: html

   <div class="itemizedlist">

-  Die Archivierung des kompletten Systems auf externen Datentr?gern,
   die an einem gesonderten Ort aufbewahrt werden. Dieser Ansatz sch?tzt
   zwar vor allen oben angef?hrten Problemen, ist aber zeitaufw?ndig.
   Auch eine Wiederherstellung des Systems ist nicht ohne weiteres
   m?glich. Zwar k?nnen Sie Kopien Ihrer Backups auch vor Ort und/oder
   auf online zug?ngigen Systemen aufbewahren, was aber nichts daran
   ?ndert, dass eine Wiederherstellung, insbesondere f?r nicht
   privilegierte Benutzer, nach wie vor nicht ohne weiteres m?glich ist.

-  Dateisystem-Snapshots. Diese Technik hilft zwar nur gegen das
   versehentliche L?schen von Dateien, in einem solchen Fall ist sie
   aber *?u?erst* hilfreich. Vorteile dieser Technik sind au?erdem die
   leichte und schnelle Implementierung und Handhabung.

-  Das Erstellen von Kopien ganzer Dateisysteme und/oder Platten (etwa
   durch einen periodischen
   `rsync(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rsync&sektion=1>`__-Transfer
   des kompletten Systems). Diese Technik ist insbesondere in Netzwerken
   mit besonderen Anforderungen n?tzlich. Der Schutz vor Plattendefekten
   ist allerdings schlechter als beim Einsatz von RAID. Die F?higkeiten
   zur Wiederherstellung gel?schter Dateien sind mit denen von
   UFS-Snapshots vergleichbar. Ob diese Technik f?r Sie geeignet ist,
   h?ngt also letztlich von Ihren Anforderungen ab.

-  RAID. Minimiert oder vermeidet Ausfallzeiten, die durch einen
   Plattendefekt verursacht werden k?nnten. Zwar k?nnen Plattendefekte
   (aufgrund der h?heren Anzahl verwendeter Platten) h?ufiger auftreten,
   sie stellen aber dann kein so akutes Problem dar.

-  Das ?berpr?fen von Datei-Fingerprints durch
   `mtree(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mtree&sektion=8>`__.
   Dabei handelt es sich zwar um keine Backup-Technik im eigentlichen
   Sinne, Sie werden durch den Einsatz dieses Werkzeugs aber informiert,
   dass Sie auf Ihre Backups zur?ckgreifen m?ssen. Dies ist insbesondere
   beim Einsatz von Offline-Backups von gro?er Bedeutung. Daher sollte
   diese Technik regelm??ig eingesetzt werden.

.. raw:: html

   </div>

Es gibt noch zahlreiche weitere Techniken, von denen aber viele nur
Variationen der eben beschriebenen Techniken sind. Spezielle
Anforderungen erfordern dabei in der Regel auch spezielle
Backup-Techniken (so erfordert das Backup einer aktiven Datenbank in der
Regel ein auf die eingesetzte Datenbank-Software abgestimmtes
Verfahren). Entscheidend ist daher immer, gegen welche Gefahren Sie sich
sch?tzen und wie Sie diesen Schutz realisieren wollen.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------------+-------------------------------+--------------------------------------+
| `Zur?ck <backups-floppybackups.html>`__?     | `Nach oben <disks.html>`__    | ?\ `Weiter <backup-basics.html>`__   |
+----------------------------------------------+-------------------------------+--------------------------------------+
| 19.10. Was ist mit Backups auf Disketten??   | `Zum Anfang <index.html>`__   | ?19.12. Datensicherung               |
+----------------------------------------------+-------------------------------+--------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
