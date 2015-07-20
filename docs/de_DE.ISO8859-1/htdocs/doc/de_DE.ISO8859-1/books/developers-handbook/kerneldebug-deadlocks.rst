===============================
10.7. Fehlersuche bei Deadlocks
===============================

.. raw:: html

   <div class="navheader">

10.7. Fehlersuche bei Deadlocks
`Zur?ck <kerneldebug-console.html>`__?
Kapitel 10. Kernel-Fehlersuche
?\ `Weiter <kerneldebug-options.html>`__

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

10.7. Fehlersuche bei Deadlocks
-------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Sie erleben vielleicht mal sogenannte Deadlocks, wobei ein System
aufh?rt, n?tzliche Arbeit zu machen. Um in einer solchen Situation einen
hilfreichen Fehlerbericht zu liefern, benutzen Sie
`ddb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ddb&sektion=4>`__, wie
oben beschrieben. H?ngen Sie die Ausgabe von ``ps`` und ``trace`` f?r
verd?chtige Prozesse an den Bericht an.

Falls m?glich, versuchen Sie, weitere Untersuchungen anzustellen. Der
Empfang der Ausgaben unten ist besonders dann n?tzlich, wenn Sie den
Ausl?ser f?r die Blockade des Systems auf VFS-Ebene vermuten. F?gen Sie
die folgenden Optionen

.. code:: programlisting

    makeoptions       DEBUG=-g
        options     INVARIANTS
        options     INVARIANT_SUPPORT
        options     WITNESS
        options     DEBUG_LOCKS
        options     DEBUG_VFS_LOCKS
        options     DIAGNOSTIC

der Kernel-Konfigurationsdatei hinzu. Wenn die Blockade ausgel?st wird,
stellen Sie, zus?tzlich der Ausgabe vom ``ps``-Befehl, die Informationen
aus ``show pcpu``, ``show allpcpu``, ``show locks``, ``show alllocks``,
``show lockedvnods`` und ``alltrace`` bereit.

Um aussagekr?ftige Zur?ckverfolgungen von in Threads aufgeteilten
Prozesse zu erhalten, benutzen Sie ``thread thread-id``, um zum
Thread-Stack zu wechseln und eine Zur?ckverfolgung mit ``where``
anzustellen.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------------------+------------------------------------+------------------------------------------------------+
| `Zur?ck <kerneldebug-console.html>`__?          | `Nach oben <kerneldebug.html>`__   | ?\ `Weiter <kerneldebug-options.html>`__             |
+-------------------------------------------------+------------------------------------+------------------------------------------------------+
| 10.6. Fehlersuche bei einem Konsolen-Treiber?   | `Zum Anfang <index.html>`__        | ?10.8. Glossar der Kernel-Optionen zur Fehlersuche   |
+-------------------------------------------------+------------------------------------+------------------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
