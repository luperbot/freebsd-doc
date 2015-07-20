=================================
26.6. Synchronisation der Quellen
=================================

.. raw:: html

   <div class="navheader">

26.6. Synchronisation der Quellen
`Zur?ck <current-stable.html>`__?
Kapitel 26. FreeBSD aktualisieren
?\ `Weiter <makeworld.html>`__

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

26.6. Synchronisation der Quellen
---------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Sie k?nnen eine Internet-Verbindung (oder E-Mail) dazu nutzen, Teile von
FreeBSD, wie die Quellen zu einzelnen Projekten, oder das Gesamtsystem,
aktuell zu halten. Dazu bieten wir die Dienste
`AnonymousCVS <anoncvs.html>`__, `CVSup <cvsup.html>`__ und
`CTM <ctm.html>`__ an.

.. raw:: html

   <div class="warning" xmlns="">

Warnung:
~~~~~~~~

Obwohl es m?glich ist, nur Teile des Quellbaums zu aktualisieren, ist
die einzige unterst?tze Migrationsprozedur, den kompletten Quellbaum zu
aktualisieren und alles, das hei?t das Userland (z.B. alle Programme in
``/bin`` und ``/sbin``) und die Kernelquellen, neu zu ?bersetzen. Wenn
Sie nur einen Teil der Quellen, zum Beispiel nur den Kernel oder nur die
Programme aus dem Userland, aktualisieren, werden Sie oft Probleme
haben, die von ?bersetzungsfehlern ?ber Kernel-Panics bis hin zu
Besch?digungen Ihrer Daten reichen k?nnen.

.. raw:: html

   </div>

Anonymous CVS und CVSup benutzen die *Pull*-Methode
`:sup:`[16]` <#ftn.idp85593040>`__, um die Quellen zu aktualisieren. Im
Fall von CVSup ruft der Benutzer oder ein ``cron``-Skript ``cvsup`` auf,
das wiederum mit einem ``cvsupd`` Server interagiert, um Ihre Quellen zu
aktualisieren. Mit beiden Methoden erhalten Sie aktuelle Updates zu
einem genau von Ihnen bestimmten Zeitpunkt. Sie k?nnen die Prozedur auf
bestimmte Dateien oder Verzeichnisse einschr?nken, so dass Sie nur die
Updates bekommen, die f?r Sie von Interesse sind. Die Updates werden zur
Laufzeit, abh?ngig von den Sachen, die Sie schon haben und den Sachen,
die Sie haben wollen, auf dem Server generiert. Anonymous CVS ist eine
Erweiterung von CVS, die es Ihnen erlaubt, ?nderungen direkt aus einem
entfernten CVS-Repository zu ziehen. Anonymous CVS ist leichter zu
handhaben als CVSup, doch ist letzteres sehr viel effizienter.

Im Gegensatz dazu vergleicht CTM Ihre Quellen nicht mit denen auf einem
Server. Stattdessen l?uft auf dem Server ein Skript, das ?nderungen an
Dateien gegen?ber seinem vorigen Lauf bemerkt, die ?nderungen
komprimiert, mit einer Sequenznummer versieht und f?r das Verschicken
per E-Mail kodiert (es werden nur druckbare ASCII-Zeichen verwendet).
Wenn Sie diese „CTM-Deltas“ erhalten haben, k?nnen Sie sie mit
`ctm\_rmail(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ctm_rmail&sektion=1>`__
benutzen, welches die Deltas dekodiert, verifiziert und dann die
?nderungen an Ihren Quellen vornimmt. Dieses Verfahren ist viel
effizienter als CVSup und erzeugt auch weniger Last auf unseren Servern,
da es die *Push*-Methode `:sup:`[17]` <#ftn.idp85601360>`__ verwendet.

Es gibt nat?rlich noch weitere Unterschiede, die Sie beachten sollten.
Wenn Sie unabsichtlich Teile Ihres Archivs l?schen, wird das von CVSup
wie Anonymous CVS erkannt und repariert. Wenn sich fehlerhafte Dateien
in Ihrem Quellbaum befinden, l?schen Sie diese einfach und
synchronisieren erneut. CTM leistet das nicht, wenn Sie Teile des
Quellbaums gel?scht haben und keine Sicherung besitzen, m?ssen Sie von
neuem, das hei?t vom letzten „Basis-Delta“, starten und die ?nderungen
wieder mit CTM nachziehen.

.. raw:: html

   <div class="footnotes">

--------------

.. raw:: html

   <div id="ftn.idp85593040" class="footnote">

`:sup:`[16]` <#idp85593040>`__\ Von engl. *to pull* = *ziehen*. Der
Client holt sich bei dieser Methode die Dateien ab.

.. raw:: html

   </div>

.. raw:: html

   <div id="ftn.idp85601360" class="footnote">

`:sup:`[17]` <#idp85601360>`__\ Von engl. *to push* = *schieben*. Der
Server schickt dem Client die Dateien.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------+-------------------------------------------+----------------------------------------------+
| `Zur?ck <current-stable.html>`__?       | `Nach oben <updating-upgrading.html>`__   | ?\ `Weiter <makeworld.html>`__               |
+-----------------------------------------+-------------------------------------------+----------------------------------------------+
| 26.5. Einem Entwicklungszweig folgen?   | `Zum Anfang <index.html>`__               | ?26.7. Das komplette Basissystem neu bauen   |
+-----------------------------------------+-------------------------------------------+----------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
