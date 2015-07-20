========================
12.3. Basiskonfiguration
========================

.. raw:: html

   <div class="navheader">

12.3. Basiskonfiguration
`Zur?ck <configtuning-initial.html>`__?
Kapitel 12. Konfiguration und Tuning
?\ `Weiter <configtuning-appconfig.html>`__

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

12.3. Basiskonfiguration
------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Informationen zur Systemkonfiguration sind haupts?chlich in
``/etc/rc.conf``, die meist beim Start des Systems verwendet wird,
abgelegt. Der Name der Datei zeigt ihren Zweck an: Sie enth?lt die
Konfigurationen f?r die ``rc*`` Dateien.

In ``rc.conf`` werden die Vorgabewerte aus ``/etc/defaults/rc.conf``
?berschrieben. Die Vorgabedatei sollte nicht nach ``/etc`` kopiert
werden, da sie die Vorgabewerte und keine Beispiele enth?lt. Jede
systemspezifische ?nderung wird in ``rc.conf`` vorgenommen.

Um den administrativen Aufwand gering zu halten, existieren in
geclusterten Anwendungen mehrere Strategien, globale Konfigurationen von
systemspezifischen Konfigurationen zu trennen. Der empfohlene Weg h?lt
die globale Konfiguration in einer separaten Datei z.B.
``/etc/rc.conf.local``. Zum Beispiel so:

.. raw:: html

   <div class="itemizedlist">

-  ``/etc/rc.conf``:

   .. code:: programlisting

       sshd_enable="YES"
       keyrate="fast"
       defaultrouter="10.1.1.254"

-  ``/etc/rc.conf.local``:

   .. code:: programlisting

       hostname="node1.example.org"
       ifconfig_fxp0="inet 10.1.1.1/8"

.. raw:: html

   </div>

Die ``rc.conf`` Datei kann dann auf jedes System mit ``rsync`` oder
einem ?hnlichen Programm verteilt werden, w?hrend die ``rc.conf.local``
Datei dabei systemspezifisch bleibt.

Bei einem Upgrade des Systems mit
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8>`__
oder ``make world`` wird ``rc.conf`` nicht ?berschrieben, so dass die
Systemkonfiguration erhalten bleibt.

.. raw:: html

   <div class="tip" xmlns="">

Tipp:
~~~~~

Die Konfigurationsdatei ``/etc/rc.conf`` wird von
`sh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sh&sektion=1>`__
gelesen. Dies erlaubt es dem Systemadministrator, eine bestimmte Menge
an Logik dieser Datei hinzuzuf?gen, was dabei helfen kann, komplexe
Konfigurationsszenarien zu erstellen. Lesen Sie dazu
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5>`__,
um weitere Informationen zu diesem Thema zu erhalten.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------------+--------------------------------------+-----------------------------------------------+
| `Zur?ck <configtuning-initial.html>`__?   | `Nach oben <config-tuning.html>`__   | ?\ `Weiter <configtuning-appconfig.html>`__   |
+-------------------------------------------+--------------------------------------+-----------------------------------------------+
| 12.2. Vorbereitende Konfiguration?        | `Zum Anfang <index.html>`__          | ?12.4. Konfiguration von Anwendungen          |
+-------------------------------------------+--------------------------------------+-----------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
