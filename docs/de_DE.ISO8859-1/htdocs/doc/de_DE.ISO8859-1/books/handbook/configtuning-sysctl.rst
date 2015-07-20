==================================
12.12. Einstellungen mit sysctl(8)
==================================

.. raw:: html

   <div class="navheader">

12.12. Einstellungen mit sysctl(8)
`Zur?ck <configtuning-configfiles.html>`__?
Kapitel 12. Konfiguration und Tuning
?\ `Weiter <configtuning-disk.html>`__

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

12.12. Einstellungen mit `sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
--------------------------------------------------------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Mit
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
k?nnen Sie ?nderungen an einem laufenden FreeBSD-System vornehmen. Unter
anderem k?nnen Optionen des TCP/IP-Stacks oder des virtuellen
Speichermanagements ver?ndert werden. Unter der Hand eines erfahrenen
Systemadministrators kann dies die Systemperformance erheblich
verbessern. ?ber 500 Variablen k?nnen mit
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
gelesen und gesetzt werden.

Der Hauptzweck von
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
besteht darin, Systemeinstellungen zu lesen und zu ver?ndern.

Alle auslesbaren Variablen werden wie folgt angezeigt:

.. code:: screen

    % sysctl -a

Sie k?nnen auch eine spezielle Variable, z.B. ``kern.maxproc`` lesen:

.. code:: screen

    % sysctl kern.maxproc
    kern.maxproc: 1044

Um eine Variable zu setzen, benutzen Sie die Syntax *``Variable``*\ =
*``Wert``*:

.. code:: screen

    # sysctl kern.maxfiles=5000
    kern.maxfiles: 2088 -> 5000

Mit sysctl k?nnen Sie Strings, Zahlen oder Boolean-Werte setzen. Bei
Boolean-Werten setzen sie ``1`` f?r wahr und ``0`` f?r falsch.

Wenn Sie Variablen automatisch w?hrend des Systemstarts setzen wollen,
f?gen Sie die Variablen in ``/etc/sysctl.conf`` ein. Weiteres entnehmen
Sie bitte der Hilfeseite
`sysctl.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl.conf&sektion=5>`__
und dem `Abschnitt?12.11.3,
„\ ``sysctl.conf``\ “ <configtuning-configfiles.html#configtuning-sysctlconf>`__.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

12.12.1. Schreibgesch?tzte Variablen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div>

Contributed by Tom Rhodes.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Schreibgesch?tzte sysctl-Variablen k?nnen nur w?hrend des Systemstarts
ver?ndert werden.

Beispielsweise hat
`cardbus(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cardbus&sektion=4>`__
auf einigen Laptops Schwierigkeiten, Speicherbereiche zu erkennen. Es
treten dann Fehlermeldungen wie die folgende auf:

.. code:: screen

    cbb0: Could not map register memory
    device_probe_and_attach: cbb0 attach returned 12

Um dieses Problem zu l?sen, muss eine schreibgesch?tzte sysctl-Variable
ver?ndert werden. Eine OID kann in ``/boot/loader.conf`` ?berschrieben
werden. ``/boot/defaults/loader.conf`` enth?lt Vorgabewwerte f?r
sysctl-Variablen.

Das oben erw?hnte Problem wird durch die Angabe von
``hw.pci.allow_unsupported_io_range=1`` in ``/boot/loader.conf`` gel?st.
Danach sollte
`cardbus(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cardbus&sektion=4>`__
fehlerfrei funktionieren.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------------+--------------------------------------+------------------------------------------+
| `Zur?ck <configtuning-configfiles.html>`__?   | `Nach oben <config-tuning.html>`__   | ?\ `Weiter <configtuning-disk.html>`__   |
+-----------------------------------------------+--------------------------------------+------------------------------------------+
| 12.11. Konfigurationsdateien?                 | `Zum Anfang <index.html>`__          | ?12.13. Tuning von Laufwerken            |
+-----------------------------------------------+--------------------------------------+------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
