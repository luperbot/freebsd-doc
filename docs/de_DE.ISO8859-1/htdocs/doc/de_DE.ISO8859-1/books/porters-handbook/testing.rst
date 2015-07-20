============================
Kapitel 9. Ihren Port testen
============================

.. raw:: html

   <div class="navheader">

Kapitel 9. Ihren Port testen
`Zur?ck <using-sub-files.html>`__?
?
?\ `Weiter <testing-portlint.html>`__

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

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Inhaltsverzeichnis

.. raw:: html

   </div>

`9.1. ``make describe`` ausf?hren <testing.html#make-describe>`__
`9.2. Portlint <testing-portlint.html>`__
`9.3. Port Tools <testing-porttools.html>`__
`9.4. ``PREFIX`` und ``DESTDIR`` <porting-prefix.html>`__
`9.5. Die Tinderbox <testing-tinderbox.html>`__

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

9.1. ``make describe`` ausf?hren
--------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Einige der FreeBSD-Werkzeuge zur Pflege von Ports, wie zum Beispiel
`portupgrade(1) <http://www.FreeBSD.org/cgi/man.cgi?query=portupgrade&sektion=1>`__,
verwenden eine Datenbank names ``/usr/ports/INDEX``, welche
Eigenschaften, wie z.B. Port-Abh?ngigkeiten, verfolgt. ``INDEX`` wird
vom Makefile der h?chsten Ebene, ``ports/Makefile``, mittels
``make index`` erstellt, welches in das Unterverzeichnis jedes Ports
wechselt und dort ``make     describe`` ausf?hrt. Wenn also
``make     describe`` bei einem Port fehlschl?gt, kann ``INDEX`` nicht
generiert werden und schnell werden viele Leute dar?ber unzufrieden
sein.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Es ist wichtig diese Datei erzeugen zu k?nnen, unabh?ngig davon, welche
Optionen in ``make.conf`` vorhanden sind. Bitte vermeiden Sie es daher
beispielsweise ``.error``-Anweisungen zu benutzen, wenn zum Beispiel
eine Abh?ngigkeit nicht erf?llt wird (Lesen Sie dazu bitte
`Abschnitt?12.16, „Vermeiden Sie den Gebrauch des
``.error``-Konstruktes“ <dads-dot-error.html>`__).

.. raw:: html

   </div>

Wenn ``make describe`` eine Zeichenkette anstatt einer Fehlermeldung
erzeugt, sind Sie wahrscheinlich auf der sicheren Seite. Vergleichen Sie
die erzeugte Zeichenkette mit ``bsd.port.mk``, um mehr ?ber deren
Bedeutung zu erfahren.

Beachten Sie bitte au?erdem, dass die Benutzung einer aktuellen Version
von ``portlint`` (wie im n?chsten Abschnitt beschrieben) automatisch
``make describe`` startet.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------------------+-------------------------------+-----------------------------------------+
| `Zur?ck <using-sub-files.html>`__?                 | ?                             | ?\ `Weiter <testing-portlint.html>`__   |
+----------------------------------------------------+-------------------------------+-----------------------------------------+
| 8.6. Nutzung von ``SUB_FILES`` und ``SUB_LIST``?   | `Zum Anfang <index.html>`__   | ?9.2. Portlint                          |
+----------------------------------------------------+-------------------------------+-----------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
