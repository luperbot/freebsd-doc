=================================================
13.6. Init: Initialisierung der Prozess-Kontrolle
=================================================

.. raw:: html

   <div class="navheader">

13.6. Init: Initialisierung der Prozess-Kontrolle
`Zur?ck <device-hints.html>`__?
Kapitel 13. FreeBSDs Bootvorgang
?\ `Weiter <boot-shutdown.html>`__

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

13.6. Init: Initialisierung der Prozess-Kontrolle
-------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Nachdem der Kernel den Bootprozess abgeschlossen hat, ?bergibt er die
Kontrolle an den Benutzer-Prozess
`init(8) <http://www.FreeBSD.org/cgi/man.cgi?query=init&sektion=8>`__.
Dieses Programm befindet sich in ``/sbin/init``, oder dem Pfad, der
durch die Variable ``init_path`` im ``Loader`` spezifiziert wird.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

13.6.1. Der automatische Reboot-Vorgang
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Der automatische Reboot-Vorgang stellt sicher, dass alle Dateisysteme
des Systems konsistent sind. Falls dies nicht der Fall ist und die
Inkonsistenz nicht durch
`fsck(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck&sektion=8>`__
behebbar ist, schaltet
`init(8) <http://www.FreeBSD.org/cgi/man.cgi?query=init&sektion=8>`__
das System in den `Single-User
Modus <boot-init.html#boot-singleuser>`__, damit der Systemadministrator
sich des Problems annehmen kann.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

13.6.2. Der Single-User Modus
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das Schalten in diesen Modus kann erreicht werden durch `den
automatischen Reboot-Vorgang <boot-init.html#boot-autoreboot>`__, durch
das Booten mit der Option ``-s`` oder das Setzen der ``boot_single``
Variable in ``Loader``.

Weiterhin kann der Single-User Modus aus dem
`Mehrbenutzermodus <boot-init.html#boot-multiuser>`__ heraus durch den
Befehl
`shutdown(8) <http://www.FreeBSD.org/cgi/man.cgi?query=shutdown&sektion=8>`__
ohne die reboot (``-r``) oder halt (``-h``) Option erreicht werden.

Falls die System-Konsole (``console``) in ``/etc/ttys`` auf ``insecure``
(dt.: unsicher) gesetzt ist, fordert das System allerdings zur Eingabe
des Passworts von ``root`` auf, bevor es den Single-User Modus
aktiviert.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel 13.3. Auf insecure gesetzte Konsole in ``/etc/ttys``

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    # name  getty                           type    status          comments
    #
    # If console is marked "insecure", then init will ask for the root password
    # when going to single-user mode.
    console none                            unknown off insecure

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Eine Konsole sollte auf ``insecure`` gesetzt sein, wenn die
physikalische Sicherheit der Konsole nicht gegeben ist und
sichergestellt werden soll, dass nur Personen, die das Passwort von
``root`` kennen, den Single-User Modus benutzen k?nnen. Es bedeutet
nicht, dass die Konsole "unsicher" laufen wird. Daher sollte man
``insecure`` w?hlen, wenn man auf Sicherheit bedacht ist, nicht
``secure``.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

13.6.3. Mehrbenutzermodus
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Stellt
`init(8) <http://www.FreeBSD.org/cgi/man.cgi?query=init&sektion=8>`__
fest, dass das Dateisystem in Ordnung ist, oder der Benutzer den
`Single-User Modus <boot-init.html#boot-singleuser>`__ beendet, schaltet
das System in den Mehrbenutzermodus, in dem dann die Ressourcen
Konfiguration des Systems gestartet wird.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

13.6.3.1. Ressourcen Konfiguration, rc-Dateien
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das Ressourcen Konfigurationssystem (engl. *resource configuration*, rc)
liest seine Standardkonfiguration von ``/etc/defaults/rc.conf`` und
System-spezifische Details von ``/etc/rc.conf``. Dann mountet es die
Dateisysteme gem?? ``/etc/fstab``, startet die Netzwerkdienste, diverse
System Daemons und f?hrt schlie?lich die Start-Skripten der lokal
installierten Anwendungen aus.

Die `rc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc&sektion=8>`__
Handbuch Seite ist eine gute Quelle f?r Informationen ?ber das
Ressourcen Konfigurationssystem und ebenso ?ber die Skripte an sich.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------+-------------------------------+--------------------------------------+
| `Zur?ck <device-hints.html>`__?    | `Nach oben <boot.html>`__     | ?\ `Weiter <boot-shutdown.html>`__   |
+------------------------------------+-------------------------------+--------------------------------------+
| 13.5. Konfiguration von Ger?ten?   | `Zum Anfang <index.html>`__   | ?13.7. Der Shutdown-Vorgang          |
+------------------------------------+-------------------------------+--------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
