===========================
6.6. Die Benutzung von perl
===========================

.. raw:: html

   <div class="navheader">

6.6. Die Benutzung von ``perl``
`Zur?ck <using-gettext.html>`__?
Kapitel 6. Besonderheiten
?\ `Weiter <using-x11.html>`__

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

6.6. Die Benutzung von ``perl``
-------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn ``MASTER_SITES`` auf ``MASTER_SITE_PERL_CPAN`` gesetzt ist, dann
ist der bevorzugte Wert von ``MASTER_SITE_SUBDIR`` der Top-Level-Name
der Hierarchie. Zum Beispiel ist der empfohlene Wert f?r
``p5-Module-Name``-``Module``. Die Top-Level-Hierarchie kann unter
`cpan.org <http://cpan.org/modules/by-module/>`__ angeschaut werden.
Dies sorgt daf?r, dass der Port weiter funktioniert, wenn sich der Autor
des Moduls ?ndert.

Die Ausnahme dieser Regel ist, dass das entsprechende Verzeichnis selber
oder das Distfile in diesem Verzeichnis nicht existiert. In solchen
F?llen ist die Benutzung der Id des Autors als ``MASTER_SITE_SUBDIR``
erlaubt.

Jede der Einstellungen unten kann sowohl auf ``YES`` als auch auf eine
Versionszeichenkette wie ``5.8.0+`` gesetzt werden. Wenn ``YES`` benutzt
wird, bedeutet das, dass der Port mit jeder der unterst?tzten
Perl-Versionen funktioniert. Falls ein Port nur mit einer bestimmten
Perl-Version funktioniert, kann darauf mit einer Versionszeichenkette
hingewiesen werden, die entweder eine Mindest- (z.B. ``5.7.3+``),
Maximal- (z.B. ``5.8.0-``) oder Absolutversion (z.B. ``5.8.3``)
festlegt.

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Tabelle 6.4. Variablen f?r Ports, die ``perl`` benutzen

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+-----------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Variable              | Bedeutung                                                                                                                                                                                                      |
+=======================+================================================================================================================================================================================================================+
| ``USE_PERL5``         | Bedeutet, dass der Port ``perl 5`` zum Erstellen und zum Ausf?hren benutzt.                                                                                                                                    |
+-----------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``USE_PERL5_BUILD``   | Bedeutet, dass der Port ``perl 5`` zum Erstellen benutzt.                                                                                                                                                      |
+-----------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``USE_PERL5_RUN``     | Bedeutet, dass der Port ``perl 5`` zur Laufzeit benutzt.                                                                                                                                                       |
+-----------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``PERL``              | Der gesamte Pfad zu ``perl 5``?–?entweder im Basissystem oder nachinstalliert ?ber einen Port?–?ohne die Versionsnummer. Benutzen Sie diese Variable, wenn Sie „ ``#!``“-Zeilen in Skripten ersetzen m?ssen.   |
+-----------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``PERL_CONFIGURE``    | Perls MakeMaker f?r die Konfiguration benutzen. Dies impliziert ``USE_PERL5``.                                                                                                                                 |
+-----------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``PERL_MODBUILD``     | Module::Build f?r configure, build und install benutzen. Dies impliziert ``PERL_CONFIGURE``.                                                                                                                   |
+-----------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

+-------------------------+-----------------------------------------------------------------------------------------------------------------+
| Nur lesbare Variablen   | Bedeutung                                                                                                       |
+=========================+=================================================================================================================+
| ``PERL_VERSION``        | Die volle Version des installierten ``perl`` (z.B. ``5.8.9``).                                                  |
+-------------------------+-----------------------------------------------------------------------------------------------------------------+
| ``PERL_LEVEL``          | Die installierte ``perl``-Version als ein Integer der Form ``MNNNPP`` (z.B. ``500809``).                        |
+-------------------------+-----------------------------------------------------------------------------------------------------------------+
| ``PERL_ARCH``           | Wo ``perl`` architektur abh?ngige Bibliotheken ablegt. Vorgabe ist ``${ARCH}-freebsd``.                         |
+-------------------------+-----------------------------------------------------------------------------------------------------------------+
| ``PERL_PORT``           | Name des ``perl``-Ports, der installiert ist (z.B. ``perl5``).                                                  |
+-------------------------+-----------------------------------------------------------------------------------------------------------------+
| ``SITE_PERL``           | Verzeichnis, in das die Site-spezifischen ``perl``-Pakete kommen. Dieser Wert wird zu PLIST\_SUB hinzugef?gt.   |
+-------------------------+-----------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Ports von Perl-Modulen, die keine offizielle Webseite haben, sollen in
der WWW-Zeile ihrer ``pkg-descr``-Datei auf ``cpan.org`` verlinken. Die
bevorzugte URL-Form ist
``         http://search.cpan.org/dist/Module-Name/`` (inklusive des
Slash am Ende).

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------+--------------------------------+----------------------------------+
| `Zur?ck <using-gettext.html>`__?      | `Nach oben <special.html>`__   | ?\ `Weiter <using-x11.html>`__   |
+---------------------------------------+--------------------------------+----------------------------------+
| 6.5. Benutzung von GNU ``gettext``?   | `Zum Anfang <index.html>`__    | ?6.7. Benutzung von X11          |
+---------------------------------------+--------------------------------+----------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
