==========================================
18.3. Installation der Audit-Unterst?tzung
==========================================

.. raw:: html

   <div class="navheader">

18.3. Installation der Audit-Unterst?tzung
`Zur?ck <audit-inline-glossary.html>`__?
Kapitel 18. Security Event Auditing
?\ `Weiter <audit-config.html>`__

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

18.3. Installation der Audit-Unterst?tzung
------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Unterst?tzung des Ereignis-Auditings f?r den Benutzerbereich wird
bereits als Teil des Basissystems installiert. Die Audit-Unterst?tzung
ist bereits im FreeBSD-Standardkernel enthalten, jedoch m?ssen Sie die
folgende Zeile explizit in Ihre Kernelkonfigurationsdatei aufnehmen und
den Kernel neu bauen:

.. code:: programlisting

    options AUDIT

Bauen und installieren Sie den Kernel wie in `Kapitel?9, *Konfiguration
des FreeBSD-Kernels* <kernelconfig.html>`__ beschrieben ist.

Nachdem der Kernel mit Audit-Unterst?tzung gebaut und installiert ist
und das System neu gestartet wurde, aktivieren Sie den Audit-Daemon
durch das Einf?gen der folgenden Zeile in die Datei
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5>`__:

.. code:: programlisting

    auditd_enable="YES"

Die Audit-Unterst?tzung kann nun durch einen Neustart des Systems oder
durch das manuelle Starten des Audit-Daemon aktiviert werden:

.. code:: programlisting

    service auditd start

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------------+-------------------------------+--------------------------------------+
| `Zur?ck <audit-inline-glossary.html>`__?   | `Nach oben <audit.html>`__    | ?\ `Weiter <audit-config.html>`__    |
+--------------------------------------------+-------------------------------+--------------------------------------+
| 18.2. Schl?sselbegriffe?                   | `Zum Anfang <index.html>`__   | ?18.4. Die Konfiguration des Audit   |
+--------------------------------------------+-------------------------------+--------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
