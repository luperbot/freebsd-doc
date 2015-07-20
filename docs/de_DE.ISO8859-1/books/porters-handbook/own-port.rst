=====================================
Kapitel 2. Einen neuen Port erstellen
=====================================

.. raw:: html

   <div class="navheader">

Kapitel 2. Einen neuen Port erstellen
`Zur?ck <why-port.html>`__?
?
?\ `Weiter <quick-porting.html>`__

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

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Sie sind also daran interessiert, einen neuen Port zu erstellen oder
einen vorhandenen zu aktualisieren? Gro?artig!

Die folgenden Kapitel beinhalten einige Richtlinien, um einen neuen Port
f?r FreeBSD zu erstellen. Wenn Sie einen vorhandenen Port auf den
neuesten Stand bringen wollen, sollten Sie mit `Kapitel?10, *Einen
existierenden Port aktualisieren* <port-upgrading.html>`__ fortfahren.

Wenn Ihnen dieses Dokument nicht detailliert genug ist, sollten Sie
einen Blick in ``/usr/ports/Mk/bsd.port.mk`` werfen. Das Makefile jedes
Ports bindet diese Datei ein. Auch wenn Sie nicht t?glich mit Makefiles
arbeiten, sollten Sie gut damit zurecht kommen, da die Datei gut
dokumentiert ist und Sie eine Menge Wissen daraus erlangen k?nnen.
Zus?tzlich k?nnen Sie speziellere Fragen an die `FreeBSD
ports <http://lists.FreeBSD.org/mailman/listinfo/freebsd-ports>`__-Mailingliste
stellen.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Nur ein Bruchteil der Variablen (``VAR``), die von Ihnen gesetzt werden
k?nnen, finden hier Erw?hnung. Die meisten von ihnen (wenn nicht sogar
alle) sind am Anfang von ``/usr/ports/Mk/bsd.port.mk`` erl?utert.
Beachten Sie bitte, dass diese Datei eine nicht standardkonforme
Tabulator-Einstellung verwendet. Emacs und Vim sollten diese Einstellung
jedoch automatisch beim ?ffnen der Datei setzen. Sowohl
`vi(1) <http://www.FreeBSD.org/cgi/man.cgi?query=vi&sektion=1>`__ als
auch `ex(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ex&sektion=1>`__
k?nnen mit dem Befehl ``:set tabstop=4`` dazu gebracht werden, die Datei
richtig anzuzeigen, wenn sie ge?ffnet wird.

.. raw:: html

   </div>

Sind Sie auf der Suche nach einer neuen Aufgabe? Dann sehen Sie sich
bitte die `Ports-Wunschliste <http://wiki.freebsd.org/WantedPorts>`__ an
und pr?fen Sie, ob Sie an einem dieser Ports arbeiten k?nnen.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------+-------------------------------+------------------------------------------+
| `Zur?ck <why-port.html>`__?   | ?                             | ?\ `Weiter <quick-porting.html>`__       |
+-------------------------------+-------------------------------+------------------------------------------+
| Kapitel 1. Einf?hrung?        | `Zum Anfang <index.html>`__   | ?Kapitel 3. Einen neuen Port erstellen   |
+-------------------------------+-------------------------------+------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
