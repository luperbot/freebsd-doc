============================
7. Weitere n?tzliche Befehle
============================

.. raw:: html

   <div class="navheader">

7. Weitere n?tzliche Befehle
`Zur?ck <printing-files-from-dos.html>`__?
?
?\ `Weiter <next-steps.html>`__

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

7. Weitere n?tzliche Befehle
----------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="variablelist">

``df``
    zeigt den freien Speicherplatz und eingeh?ngte (*gemountete*)
    Partitionen an.

``ps aux``
    zeigt laufende Prozesse an. ``ps ax`` schr?nkt diese Ausgabe etwas
    ein.

``rm       dateiname``
    l?scht *``dateiname``*.

``rm -R       dir``
    l?scht das Verzeichnis *``dir``* und alle Unterverzeichnisse —
    Vorsicht!

``ls -R``
    listet Dateien im aktuellen Verzeichnis und allen
    Unterverzeichnissen auf. Die Variante ``ls -AFR > where.txt`` kann
    dazu verwendet werden, um eine Liste aller Dateien unter ``/`` und
    (separat) unter ``/usr`` zu erhalten. Allerdings gibt es bessere
    M?glichkeiten, bestimmte Dateien zu finden.

``passwd``
    zum ?ndern des Passworts eines Benutzers (oder von ``root``).

``man hier``
    die Manualpage des UNIX?-Dateisystems.

.. raw:: html

   </div>

Nutzen Sie ``find``, um unter ``/usr`` oder anderen Verzeichnissen nach
``dateiname`` zu suchen:

.. raw:: html

   <div class="informalexample">

.. code:: screen

    % find /usr -name "dateiname>"

.. raw:: html

   </div>

Als Platzhalter k?nnen Sie bei *``"dateiname``*" einen ``*`` verwenden.
(*``dateiname``* muss dabei in Hochkommata stehen.) Weisen Sie ``find``
an, in ``/`` statt in ``/usr`` zu suchen, werden alle eingeh?ngten
Dateisysteme durchsucht, CD-ROM und DOS-Partitionen eingeschlossen.

Ein ausgezeichnetes Buch, in dem s?mtliche UNIX?-Befehle beschrieben
werden, ist *Unix for the Impatient* von Abrahams & Larson (2nd ed.,
Addison-Wesley, 1996). Auch im Internet finden Sie viele Informationen
zu UNIX?.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------------+-------------------------------+-----------------------------------+
| `Zur?ck <printing-files-from-dos.html>`__?   | ?                             | ?\ `Weiter <next-steps.html>`__   |
+----------------------------------------------+-------------------------------+-----------------------------------+
| 6. Dateien mit Hilfe von DOS ausdrucken?     | `Zum Anfang <index.html>`__   | ?8. Die n?chsten Schritte         |
+----------------------------------------------+-------------------------------+-----------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
