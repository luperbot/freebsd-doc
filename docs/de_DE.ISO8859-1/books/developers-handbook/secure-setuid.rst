==================
3.4. SetUID-Themen
==================

.. raw:: html

   <div class="navheader">

3.4. SetUID-Themen
`Zur?ck <secure-bufferov.html>`__?
Kapitel 3. Sicheres Programmieren
?\ `Weiter <secure-chroot.html>`__

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

3.4. SetUID-Themen
------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Es gibt zu jedem Prozess mindestens sechs verschiedene IDs, die diesem
zugeordnet sind. Deshalb m?ssen Sie sehr vorsichtig mit den
Zugriffsrechten sein, die Ihr Prozess zu jedem Zeitpunkt besitzt.
Konkret bedeutet dass, das alle seteuid-Anwendungen ihre Privilegien
abgeben sollten, sobald sie diese nicht mehr ben?tigen.

Die reale Benutzer-ID kann nur von einem Superuser-Prozess ge?ndert
werden. Das Programm login setzt sie, wenn sich ein Benutzer am System
anmeldet, und sie wird nur selten ge?ndert.

Die effektive Benutzer-ID wird von der Funktion ``exec()`` gesetzt, wenn
ein Programm das seteuid-Bit gesetzt hat. Eine Anwendung kann
``seteuid()`` jederzeit aufrufen, um die effektive Benutzer-ID entweder
auf die reale Benutzer-ID oder die gespeicherte set-user-ID zu setzen.
Wenn eine der ``exec()``-Funktionen die effektive Benutzer-ID setzt,
wird der vorherige Wert als gespeicherte set-user-ID abgelegt.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+-------------------------------+---------------------------------------------------+
| `Zur?ck <secure-bufferov.html>`__?   | `Nach oben <secure.html>`__   | ?\ `Weiter <secure-chroot.html>`__                |
+--------------------------------------+-------------------------------+---------------------------------------------------+
| 3.3. Puffer-?berl?ufe?               | `Zum Anfang <index.html>`__   | ?3.5. Die Umgebung ihrer Programme einschr?nken   |
+--------------------------------------+-------------------------------+---------------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
