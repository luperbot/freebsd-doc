==========================
13.7. Der Shutdown-Vorgang
==========================

.. raw:: html

   <div class="navheader">

13.7. Der Shutdown-Vorgang
`Zur?ck <boot-init.html>`__?
Kapitel 13. FreeBSDs Bootvorgang
?\ `Weiter <users.html>`__

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

13.7. Der Shutdown-Vorgang
--------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Im Falle eines regul?ren Herunterfahrens durch
`shutdown(8) <http://www.FreeBSD.org/cgi/man.cgi?query=shutdown&sektion=8>`__
f?hrt
`init(8) <http://www.FreeBSD.org/cgi/man.cgi?query=init&sektion=8>`__
``/etc/rc.shutdown`` aus, sendet dann s?mtlichen Prozessen ein ``TERM``
Signal und schlie?lich ein ``KILL`` Signal an alle Prozesse, die sich
nicht schnell genug beendet haben.

FreeBSD-Systeme, die Energieverwaltungsfunktionen unterst?tzen, k?nnen
Sie mit dem Kommando ``shutdown -p now`` ausschalten. Zum Neustart des
Systems benutzen Sie ``shutdown -r now``. Das Kommando
`shutdown(8) <http://www.FreeBSD.org/cgi/man.cgi?query=shutdown&sektion=8>`__
kann nur von ``root`` oder Mitgliedern der Gruppe ``operator`` benutzt
werden. Sie k?nnen auch die Kommandos
`halt(8) <http://www.FreeBSD.org/cgi/man.cgi?query=halt&sektion=8>`__
und
`reboot(8) <http://www.FreeBSD.org/cgi/man.cgi?query=reboot&sektion=8>`__
verwenden. Weitere Informationen finden Sie in den Hilfeseiten der drei
Kommandos.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Unter FreeBSD m?ssen Sie die
`acpi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=acpi&sektion=4>`__-Unterst?tzung
im Kernel aktivieren oder das Modul geladen haben, damit Sie die
Energieverwaltungsfunktionen benutzen k?nnen.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------------------+-------------------------------+-------------------------------------------------------------+
| `Zur?ck <boot-init.html>`__?                         | `Nach oben <boot.html>`__     | ?\ `Weiter <users.html>`__                                  |
+------------------------------------------------------+-------------------------------+-------------------------------------------------------------+
| 13.6. Init: Initialisierung der Prozess-Kontrolle?   | `Zum Anfang <index.html>`__   | ?Kapitel 14. Benutzer und grundlegende Account-Verwaltung   |
+------------------------------------------------------+-------------------------------+-------------------------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
