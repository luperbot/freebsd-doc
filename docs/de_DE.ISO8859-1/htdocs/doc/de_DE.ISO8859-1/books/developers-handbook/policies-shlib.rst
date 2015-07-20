=====================
5.5. Shared-Libraries
=====================

.. raw:: html

   <div class="navheader">

5.5. Shared-Libraries
`Zur?ck <policies-encumbered.html>`__?
Kapitel 5. Vorgaben und Richtlinien f?r das Quelltextverzeichnis
?\ `Weiter <testing.html>`__

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

5.5. Shared-Libraries
---------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Beigesteuert von Satoshi Asami, Peter Wemm und David O'Brien.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Sollten Sie die Unterst?tzung f?r Shared-Libraries bei einem Port oder
einem St?ck Software, das dies nicht hat, hinzuf?gen, sollten die
Versionsnummern dessen Regeln folgen. Im Allgemeinen hat die sich daraus
resultierende Nummer nichts mit der Release-Version der Software zu tun.

Die drei Grunds?tze zum Erstellen von Shared-Libraries sind:

.. raw:: html

   <div class="itemizedlist">

-  Sie beginnen mit ``1.0``.

-  Gibt es eine ?nderung, die abw?rtskompatibel ist, so springen Sie zur
   n?chsten Minor-Version (beachten Sie, dass ELF-Systeme die
   Minor-Version ignorieren).

-  Gibt es eine inkompatible ?nderung, so springen Sie bitte zur
   n?chsten Major-Version.

.. raw:: html

   </div>

Zum Beispiel wird beim Hinzuf?gen von Funktionen und oder
Fehlerbehebungen zur n?chsten Minor-Version gesprungen, beim L?schen
einer Funktion, ?ndern von Funktionsaufrufen usw. ?ndert sich die
Major-Version.

Bleiben Sie bei Versionsnummern in der Form major.minor
(*``x``*.\ *``y``*). Unser dynamischer Linker a.out kann mit
Versionsnummern in der Form *``x``*.\ *``y``*.\ *``z``* nicht gut
umgehen. Jede Versionsnummer nach dem *``y``* (die dritte Zahl) wird
v?llig ignoriert, wenn Versionsnummern der Shared-Libraries verglichen
werden, um zu bestimmen, mit welcher Bibliothek eine Anwendung verlinkt
wird. Sind zwei Shared-Libraries vorhanden, die sich nur in der
„micro“-Revision unterscheiden, so wird ``ld.so`` zu der h?heren
verlinken. Dies bedeutet, dass wenn Sie mit ``libfoo.so.3.3.3``
verlinken, der Linker nur ``3.3`` in den Header aufnimmt und alles
linkt, was mit *``libfoo.so.3``*
.\ *``(irgendetwas       >= 3)``*.\ *``(h?chste       verf?gbare Nummer)``*
beginnt.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

``ld.so`` wird immer die h?chste „Minor“-Revision benutzen.
Beispielsweise wird es die ``libc.so.2.2`` bevorzugen gegen?ber der
``libc.so.2.0``, auch dann, wenn das Programm urspr?nglich mit
``libc.so.2.0`` verlinkt war.

.. raw:: html

   </div>

Unser dynamischer ELF-Linker kann keine Minor-Versionen handhaben.
Dennoch sollten die Major- und Minor-Versionen genutzt werden, da unsere
``Makefile``\ s „das Richtige machen“ bezogen auf den Systemtyp.

F?r nicht-Port-Bibliotheken lautet die Richtlinie, die
Shared-Library-Versionsnummer nur einmal zwischen den Releases zu
?ndern. Weiterhin ist es vorgeschrieben, die Major-Version der
Shared-Libraries nur bei Major-OS-Releases zu ?ndern (beispielsweise von
6.0 auf 7.0). Wenn Sie also eine ?nderung an einer Systembibliothek
vornehmen, die eine neue Versionsnummer ben?tigt, ?berpr?fen Sie die
Commit-Logs des ``Makefile``\ s. Es liegt in der Verantwortung des
Committers, dass sich eine erste solche ?nderung seit dem letzten
Release in der aktualisierten Versionsnummer der Shared-Library im
``Makefile`` ?u?ert, folgende ?nderungen werden nicht ber?cksichtigt.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------+---------------------------------+--------------------------------------------------+
| `Zur?ck <policies-encumbered.html>`__?   | `Nach oben <policies.html>`__   | ?\ `Weiter <testing.html>`__                     |
+------------------------------------------+---------------------------------+--------------------------------------------------+
| 5.4. Belastende Dateien?                 | `Zum Anfang <index.html>`__     | ?Kapitel 6. Regressions- und Performance-Tests   |
+------------------------------------------+---------------------------------+--------------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
