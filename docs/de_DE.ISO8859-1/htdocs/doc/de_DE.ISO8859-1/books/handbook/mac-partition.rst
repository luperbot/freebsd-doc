==============================
17.11. Das MAC Modul partition
==============================

.. raw:: html

   <div class="navheader">

17.11. Das MAC Modul partition
`Zur?ck <mac-portacl.html>`__?
Kapitel 17. Verbindliche Zugriffskontrolle
?\ `Weiter <mac-mls.html>`__

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

17.11. Das MAC Modul partition
------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Modulname: ``mac_partition.ko``

Parameter f?r die Kernelkonfiguration: ``options MAC_PARTITION``

Bootparameter ``mac_partition_load="YES"``

Die Richtlinie
`mac\_partition(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_partition&sektion=4>`__
setzt Prozesse in spezielle „Partitionen“, entsprechend dem zugewiesenen
MAC Label. Man kann sich das vorstellen wie eine spezielle Art
`jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8>`__,
auch wenn das noch kein wirklich guter Vergleich ist.

Es wird empfohlen, dieses Modul durch einen Eintrag in
`loader.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=loader.conf&sektion=5>`__
zu aktivieren, so dass die Richtlinie w?hrend des Bootvorganges
eingebunden wird.

Der Gro?teil der Konfiguration geschieht mit dem Kommando
`setpmac(8) <http://www.FreeBSD.org/cgi/man.cgi?query=setpmac&sektion=8>`__,
wie gleich erkl?rt wird. Au?erdem gibt es folgenden ``sysctl`` Parameter
f?r diese Richtlinie.

.. raw:: html

   <div class="itemizedlist">

-  ``security.mac.partition.enabled`` erzwingt die Verwendung von MAC
   Proze?-Partitionen.

.. raw:: html

   </div>

Sobald diese Richtlinie aktiv ist, sehen Nutzer nur noch ihre eigenen
Prozesse, und alle anderen Prozesse, die ebenfalls derselben
Proze?-Partition zugeordnet sind. Sie k?nnen jedoch nicht auf Prozesse
oder Werkzeuge au?erhalb des Anwendungsbereich dieser Partition
zugreifen. Das bedeutet unter anderem, das ein Nutzer, der einer Klasse
``insecure`` zugeordnet ist, nicht auf das Kommando ``top`` zugreifen
kann - wie auch auf viele anderen Befehle, die einen eigenen Proze?
erzeugen.

Um einen Befehl einer Proze?-Partition zuzuordnen, mu? dieser durch das
Kommando ``setpmac`` mit einem Label versehen werden:

.. code:: screen

    # setpmac partition/13 top

Diese Zeile f?gt das Kommando ``top`` dem Labelsatz f?r Nutzer der
Klasse ``insecure`` hinzu, sofern die Partition 13 mit der Klasse
``insecure`` ?bereinstimmt. Beachten Sie, dass alle Prozesse, die von
Nutzern dieser Klasse erzeugt werden, das Label ``partition/13``
erhalten, und dieses auch nicht durch den Nutzer ge?ndert werden kann.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

17.11.1. Beispiele
~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Der folgende Befehl listet die vergebenen Label f?r Proze?-Partitionen
und die laufenden Prozesse auf.

.. code:: screen

    # ps Zax

Das n?chste Kommando liefert das Label der Proze?-Partition eines
anderen Nutzers ``trhodes`` und dessen gegenw?rtig laufenden Prozesse
zur?ck.

.. code:: screen

    # ps -ZU trhodes

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Jeder Nutzer kann die Prozesse in der Proze?-Partition von ``root``
betrachten, solange nicht die Richtlinie
`mac\_seeotheruids(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_seeotheruids&sektion=4>`__
geladen wurde.

.. raw:: html

   </div>

Eine ausgefeilte Umsetzung dieser Richtlinie deaktiviert alle Dienste in
``/etc/rc.conf`` und startet diese dann sp?ter durch ein Skript, das
jedem Dienst das passende Label zuordnet.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Die folgenden Richtlinien verwenden Zahlenwerte anstatt der drei
Standardlabels. Diese Optionen, und ihre Grenzen, werden in den
zugeh?rigen Manpages genauer erkl?rt.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------+-------------------------------+----------------------------------------------+
| `Zur?ck <mac-portacl.html>`__?   | `Nach oben <mac.html>`__      | ?\ `Weiter <mac-mls.html>`__                 |
+----------------------------------+-------------------------------+----------------------------------------------+
| 17.10. Das MAC Modul portacl?    | `Zum Anfang <index.html>`__   | ?17.12. Das MAC Modul Multi-Level Security   |
+----------------------------------+-------------------------------+----------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
