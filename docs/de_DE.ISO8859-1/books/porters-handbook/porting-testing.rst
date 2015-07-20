====================
3.4. Den Port testen
====================

.. raw:: html

   <div class="navheader">

3.4. Den Port testen
`Zur?ck <porting-checksum.html>`__?
Kapitel 3. Einen neuen Port erstellen
?\ `Weiter <porting-portlint.html>`__

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

3.4. Den Port testen
--------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Sie sollten sicherstellen, dass die Port-Regeln genau das einhalten, was
Sie von ihnen erwarten, auch beim Erzeugen eines Pakets aus dem Port.
Dies sind die wichtigen Punkte, die Sie ?berpr?fen sollten.

.. raw:: html

   <div class="itemizedlist">

-  ``pkg-plist`` enth?lt nichts, das nicht von Ihrem Port installiert
   wurde.

-  ``pkg-plist`` enth?lt alles, was von Ihrem Port installiert wurde.

-  Ihr Port kann mit Hilfe von ``make reinstall`` mehrmals installiert
   werden.

-  Ihr Port `r?umt <plist-cleaning.html>`__ bei der Deinstallation
   hinter sich auf.

.. raw:: html

   </div>

.. raw:: html

   <div class="procedure">

.. raw:: html

   <div class="procedure-title">

Prozedur 3.1. Empfohlene Testreihenfolge

.. raw:: html

   </div>

#. ``make install``

#. ``make package``

#. ``make deinstall``

#. ``pkg_add Paket-Name         ``

#. ``make deinstall``

#. ``make reinstall``

#. ``make package``

.. raw:: html

   </div>

Stellen Sie bitte sicher, dass w?hrend ``make package`` und
``make deinstall`` keine Warnungen ausgegeben werden. Nach Schritt 3
?berpr?fen Sie bitte, ob alle neuen Verzeichnisse korrekt entfernt
wurden. Und versuchen Sie die Software nach Schritt 4 zu benutzen, um
sicherzustellen, dass sie korrekt funktioniert, wenn diese aus einem
Paket installiert wird.

Der gr?ndlichste Weg diese Schritte zu automatisieren ist eine Tinderbox
zu installieren. Diese verwaltet ``Jails``, in denen Sie alle oben
genannten Schritte durchf?hren k?nnen, ohne den Zustand Ihres laufenden
Systems zu ver?ndern. Mehr Informationen hierzu ent?lt
``ports/ports-mgmt/tinderbox``

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------+--------------------------------------+------------------------------------------------+
| `Zur?ck <porting-checksum.html>`__?   | `Nach oben <quick-porting.html>`__   | ?\ `Weiter <porting-portlint.html>`__          |
+---------------------------------------+--------------------------------------+------------------------------------------------+
| 3.3. Die Checksummendatei erzeugen?   | `Zum Anfang <index.html>`__          | ?3.5. Ihren Port mit ``portlint`` ?berpr?fen   |
+---------------------------------------+--------------------------------------+------------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
