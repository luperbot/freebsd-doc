============================================
10.6. Fehlersuche bei einem Konsolen-Treiber
============================================

.. raw:: html

   <div class="navheader">

10.6. Fehlersuche bei einem Konsolen-Treiber
`Zur?ck <kerneldebug-online-gdb.html>`__?
Kapitel 10. Kernel-Fehlersuche
?\ `Weiter <kerneldebug-deadlocks.html>`__

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

10.6. Fehlersuche bei einem Konsolen-Treiber
--------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Da Sie nunmal einen Konsolen-Treiber ben?tigen, um DDB zu starten, ist
alles ein wenig komplizierter, sobald der Konsolen-Treiber selbst
versagt. Sie erinnern sich vielleicht an die Benutzung einer seriellen
Konsole (entweder durch Ver?ndern des Boot-Blocks oder Eingabe von
``-h`` an der ``Boot:``-Eingabeaufforderung) und das Anschlie?en eines
Standard-Terminals an Ihren ersten seriellen Port. DDB funktioniert auf
jedem konfigurierten Konsolen-Treiber, auch auf einer seriellen Konsole.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------------------------------------+------------------------------------+----------------------------------------------+
| `Zur?ck <kerneldebug-online-gdb.html>`__?                              | `Nach oben <kerneldebug.html>`__   | ?\ `Weiter <kerneldebug-deadlocks.html>`__   |
+------------------------------------------------------------------------+------------------------------------+----------------------------------------------+
| 10.5. Online-Kernel-Fehlersuche mit GDB auf einem entfernten System?   | `Zum Anfang <index.html>`__        | ?10.7. Fehlersuche bei Deadlocks             |
+------------------------------------------------------------------------+------------------------------------+----------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
