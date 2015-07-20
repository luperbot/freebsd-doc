=========================================================
12.7. Benutzen Sie die exec-Anweisung in Wrapper-Skripten
=========================================================

.. raw:: html

   <div class="navheader">

12.7. Benutzen Sie die ``exec``-Anweisung in Wrapper-Skripten
`Zur?ck <dads-after-port-mk.html>`__?
Kapitel 12. Was man machen respektive vermeiden sollte
?\ `Weiter <dads-rational.html>`__

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

12.7. Benutzen Sie die ``exec``-Anweisung in Wrapper-Skripten
-------------------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Falls der Port ein Shellskript installiert, dessen Zweck es ist ein
anderes Programm zu starten, und falls das Starten des Programmes die
letzte Aktion des Skripts ist, sollten Sie sicherstellen, dass Sie die
Funktion ``exec`` daf?r benutzen; zum Beispiel:

.. code:: programlisting

    #!/bin/sh
    exec %%LOCALBASE%%/bin/java -jar %%DATADIR%%/foo.jar "$@"

Die Funktion ``exec`` ersetzt den Shell-Prozess mit dem angegebenen
Programm. Falls ``exec`` ausgelassen wird, verbleibt der Shell-Prozess
im Speicher w?hrend das Programm ausgef?hrt wird und verbraucht unn?tig
Systemressourcen.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------------------------------+-------------------------------------+--------------------------------------+
| `Zur?ck <dads-after-port-mk.html>`__?                         | `Nach oben <porting-dads.html>`__   | ?\ `Weiter <dads-rational.html>`__   |
+---------------------------------------------------------------+-------------------------------------+--------------------------------------+
| 12.6. Etwas hinter die ``bsd.port.mk``-Anweisung schreiben?   | `Zum Anfang <index.html>`__         | ?12.8. Aufgaben vern?nftig l?sen     |
+---------------------------------------------------------------+-------------------------------------+--------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
