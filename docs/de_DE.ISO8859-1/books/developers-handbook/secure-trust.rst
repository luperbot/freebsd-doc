==============
3.6. Vertrauen
==============

.. raw:: html

   <div class="navheader">

3.6. Vertrauen
`Zur?ck <secure-chroot.html>`__?
Kapitel 3. Sicheres Programmieren
?\ `Weiter <secure-race-conditions.html>`__

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

3.6. Vertrauen
--------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Eine Anwendung sollte niemals davon ausgehen, dass irgendetwas in der
Nutzerumgebung vern?nftig ist. Das beinhaltet (ist aber sicher nicht
darauf beschr?nkt): Nutzereingaben, Signale, Umgebungsvariablen,
Ressourcen, IPC, mmaps, das Arbeitsverzeichnis im Dateisystem,
Dateideskriptoren, die Anzahl ge?ffneter Dateien, etc..

Sie sollten niemals annehmen, dass Sie jede Art von inkorrekten Eingaben
abfangen k?nnen, die ein Nutzer machen kann. Stattdessen sollte Ihre
Anwendung positive Filterung verwenden, um nur eine bestimmte Teilmenge
an Eingaben zuzulassen, die Sie f?r sicher halten. Ungeeignete
Daten?berpr?fung ist die Ursache vieler Exploits, besonders f?r
CGI-Skripte im Internet. Bei Dateinamen m?ssen Sie besonders vorsichtig
sein, wenn es sich um Pfade ("../", "/"), symbolische Verkn?pfungen und
Shell-Escape-Sequenzen handelt.

Perl bietet eine wirklich coole Funktion, den sogenannten "Taint"-Modus,
der verwendet werden kann, um zu verhindern, dass Skripte Daten, die von
au?erhalb des Programmes stammen, auf unsichere Art und Weise verwenden.
Dieser Modus ?berpr?ft Kommandozeilenargumente, Umgebungsvariablen,
Lokalisierungsinformationen, die Ergebnisse von Systemaufrufen
(``readdir()``, ``readlink()``, ``getpwxxx()``) und alle Dateieingaben.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------------------+-------------------------------+-----------------------------------------------+
| `Zur?ck <secure-chroot.html>`__?                  | `Nach oben <secure.html>`__   | ?\ `Weiter <secure-race-conditions.html>`__   |
+---------------------------------------------------+-------------------------------+-----------------------------------------------+
| 3.5. Die Umgebung ihrer Programme einschr?nken?   | `Zum Anfang <index.html>`__   | ?3.7. Race-Conditions                         |
+---------------------------------------------------+-------------------------------+-----------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
