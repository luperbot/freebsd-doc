====================================
4.6. Handhabung von Benutzereingaben
====================================

.. raw:: html

   <div class="navheader">

4.6. Handhabung von Benutzereingaben
`Zur?ck <slow-configure.html>`__?
Kapitel 4. Einen Port in aller Ruhe erstellen
?\ `Weiter <makefile.html>`__

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

4.6. Handhabung von Benutzereingaben
------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Sollte der Port Eingaben vom Benutzer ben?tigen, muss ``IS_INTERACTIVE``
im ``Makefile`` des Ports gesetzt werden. Dies erlaubt „overnight
builds“ Ihren Port zu ?berspringen, falls der Nutzer die Variable
``BATCH`` setzt (setzt der Nutzer hingegen die Variable ``INTERACTIVE``,
werden *nur* Ports gebaut, die Interaktion vom Nutzer erwarten). Dies
erspart den Rechnern, welche kontinuierlich Ports bauen, eine Menge Zeit
(siehe unten).

Zudem ist es empfohlen, falls sinnvolle Vorgaben f?r interaktive
Optionen gesetzt sind, die ``PACKAGE_BUILDING``-Variable zu pr?fen und
das interaktive Skript abzuschalten. Dies macht es uns m?glich, Pakete
f?r CDROMs und FTP-Server zu bauen.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------+-------------------------------+----------------------------------------------+
| `Zur?ck <slow-configure.html>`__?   | `Nach oben <slow.html>`__     | ?\ `Weiter <makefile.html>`__                |
+-------------------------------------+-------------------------------+----------------------------------------------+
| 4.5. Konfigurieren?                 | `Zum Anfang <index.html>`__   | ?Kapitel 5. Die Konfiguration des Makefile   |
+-------------------------------------+-------------------------------+----------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
