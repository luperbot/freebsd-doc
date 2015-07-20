==============================================
3. Die rc-Subsysteme und nur-Lese Dateisysteme
==============================================

.. raw:: html

   <div class="navheader">

3. Die ``rc``-Subsysteme und nur-Lese Dateisysteme
`Zur?ck <kernel.html>`__?
?
?\ `Weiter <ar01s04.html>`__

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

3. Die ``rc``-Subsysteme und nur-Lese Dateisysteme
--------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Initialisierung nach dem Bootvorgang eines eingebetteten
FreeBSD-Systems wird von ``/etc/rc.initdiskless`` kontrolliert.

``/etc/rc.d/var`` h?ngt ``/var`` als RAM-Disk ein, erstellt eine
konfigurierbare Liste von Verzeichnissen in ``/var`` mittels des
`mkdir(1) <http://www.FreeBSD.org/cgi/man.cgi?query=mkdir&sektion=1>`__-Kommandos
und ?ndert die Attribute von ein paar dieser Verzeichnisse. Bei der
Ausf?hrung von ``/etc/rc.d/var`` kommt eine andere ``rc.conf``-Variable
ins Spiel: ``varsize``. Die Datei ``/etc/rc.d/var`` erstellt eine
``/var``-Partition basierend auf dem Wert dieser Variable in
``rc.conf``:

.. code:: programlisting

    varsize=8192

Standardm?ssig wird dieser Wert in Sektoren angegeben.

Der Fakt, dass es sich bei ``/var`` um ein nur-Lese Dateisystem handelt,
ist eine wichtige Unterscheidung, da die ``/``-Partition (und jede
andere Partition, die Sie auf Ihrem Flash-Medium haben) nur lesend
eingeh?ngt wird. Erinnern Sie sich, dass in `Abschnitt?1, „Solid State
Festplattenger?te“ <index.html#intro>`__ die Beschr?nkungen von
Flash-Speichern erl?utert wurden, speziell deren begrenzte Kapazit?t zum
Schreiben. Die Notwendigkeit, Dateisysteme auf Flash-Speichern nur
lesend einzubinden und keine Swap-Dateien zu verwenden, kann nicht oft
genug erw?hnt werden. Eine Swap-Datei auf einem ausgelasteten System
kann in weniger als einem Jahr den gesamten Flash-Speicher aufbrauchen.
H?ufige Protokollierung oder das Erstellen und L?schen von tempor?ren
Dateien kann das gleiche verursachen. Aus diesem Grund sollten Sie
zus?tzlich zum entfernen des ``swap``-Eintrags aus ihrer
``/etc/fstab``-Datei auch noch die Optionsfelder f?r jedes Dateisystem
auf ``ro`` wie folgt stellen:

.. code:: programlisting

    # Device                Mountpoint      FStype  Options         Dump    Pass#
    /dev/ad0s1a             /               ufs     ro              1       1

Ein paar Anwendungen im normalen System werden sofort nach dieser
?nderung ausfallen. Beispielsweise wird Cron nicht richtig
funktionieren, aufgrund von fehlenden Cron-Tabellen in ``/var`` die von
``/etc/rc.d/var`` erstellt wurden. Syslog und DHCP werden ebenfalls
Probleme durch das nur-Lese Dateisystem und fehlende Elemente im
Verzeichnis ``/var`` verursachen, die ``/etc/rc.d/var`` erstellt hat.
Diese Probleme sind jedoch nur vor?bergehend und werden zusammen mit
L?sungen zur Ausf?hrung von anderen gebr?uchlichen Softwarepaketen in
`Abschnitt?5, „Systemstrategien f?r kleine und
Nur-Lese-Umgebungen“ <strategies.html>`__ angesprochen.

Eine wichtige Sache, an die man sich erinnern sollte, ist, dass ein
Dateisystem, welches als nur lesend in ``/etc/fstab`` eingebunden wurde,
jederzeit als schreibend durch das folgende Kommando eingeh?ngt werden
kann:

.. code:: screen

    # /sbin/mount -uw partition

und auch wieder zur?ck auf nur lesend durch den Befehl:

.. code:: screen

    # /sbin/mount -ur partition

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------+-------------------------------+---------------------------------------------------+
| `Zur?ck <kernel.html>`__?   | ?                             | ?\ `Weiter <ar01s04.html>`__                      |
+-----------------------------+-------------------------------+---------------------------------------------------+
| 2. Kerneloptionen?          | `Zum Anfang <index.html>`__   | ?4. Ein Dateisystem von Grund auf neu erstellen   |
+-----------------------------+-------------------------------+---------------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
