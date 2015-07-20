===================================
Kapitel 18. Security Event Auditing
===================================

.. raw:: html

   <div class="navheader">

Kapitel 18. Security Event Auditing
`Zur?ck <mac-troubleshoot.html>`__?
Teil?III.?Systemadministration
?\ `Weiter <audit-inline-glossary.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="chapter">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

Kapitel 18. Security Event Auditing
-----------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Geschrieben von Tom Rhodes und Robert Watson.

.. raw:: html

   </div>

.. raw:: html

   <div>

?bersetzt von Daniel Seuffert.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Inhaltsverzeichnis

.. raw:: html

   </div>

`18.1. Einleitung <audit.html#audit-synopsis>`__
`18.2. Schl?sselbegriffe <audit-inline-glossary.html>`__
`18.3. Installation der Audit-Unterst?tzung <audit-install.html>`__
`18.4. Die Konfiguration des Audit <audit-config.html>`__
`18.5. Administration des
Audit-Subsystems <audit-administration.html>`__

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

18.1. Einleitung
----------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das FreeBSD-Betriebssystem unterst?tzt ein feingranuliertes
Sicherheits-Auditing. Ereignis-Auditing erlaubt die zuverl?ssige,
feingranulierte und konfigurierbare Aufzeichnung einer Vielzahl von
sicherheitsrelevanten Systemereignissen einschliesslich
Benutzereingaben, Konfigurations?nderungen sowie Datei- und
Netzwerkzugriffen. Diese Log-Datens?tze k?nnen unsch?tzbar wertvoll sein
f?r direkte System?berwachung, Einbruchserkennung und
Post-Mortem-Analyse. FreeBSD implementiert Sun™s ?ffentlich zug?ngliche
BSM API und Dateiformat. Die FreeBSD-Implementierung kann mit den
Audit-Implementierungen von Sun™ Solaris™ und Apple? Mac?OS? X
zusammenarbeiten.

Dieses Kapitel konzentriert sich auf die Installation und Konfiguration
des Ereignis-Auditings. Es erkl?rt Audit-Richtlinien und stellt ein
Beispiel einer Audit-Konfiguration vor.

Nach dem Lesen dieses Kapitels werden Sie Folgendes wissen:

.. raw:: html

   <div class="itemizedlist">

-  Was Ereignis-Auditing ist und wie es arbeitet.

-  Wie man Ereignis-Auditing in FreeBSD f?r Benutzer und Prozesse
   konfiguriert.

-  Wie man den Audit-Pfad mittels Audit-Reduktion und
   Revisionswerkzeugen ?berpr?ft.

.. raw:: html

   </div>

Vor dem Lesen dieses Kapitels sollten Sie:

.. raw:: html

   <div class="itemizedlist">

-  Sowohl UNIX? als auch FreeBSD-Basismechanismen beherrschen
   (`Kapitel?4, *Grundlagen des UNIX Betriebssystems* <basics.html>`__).

-  Mit den grundlegenden Mechanismen der Kernel-Konfiguration und
   -Kompilierung vertraut sein (`Kapitel?9, *Konfiguration des
   FreeBSD-Kernels* <kernelconfig.html>`__).

-  Mit den Ma?nahmen zur Sicherung von FreeBSD vertraut sein
   (`Kapitel?15, *Sicherheit* <security.html>`__).

.. raw:: html

   </div>

.. raw:: html

   <div class="warning" xmlns="">

Warnung:
~~~~~~~~

Die Audit-Funktionalit?t in FreeBSD besitzt die Einschr?nkungen, dass
zur Zeit nicht alle sicherheitsrelevanten System-Ereignisse auditierbar
sind und dass einige Anmelde-Mechanismen, wie z.B. X11-basierte
Bildschirm-Manager und Daemonen von Drittanbietern, das Auditing f?r
Benutzeranmeldungen nicht korrekt konfigurieren.

Das Sicherheits-Auditing ist in der Lage, sehr detaillierte Log-Dateien
von Systemaktivit?ten zu erzeugen. Auf einem ausgelasteten System kann
die Pfad-Datei sehr gro? werden, wenn sie f?r hohe Aufl?sung
konfiguriert ist, und im Extremfall pro Woche um mehrere Gigabyte
anwachsen. Administratoren sollten daher den ben?tigten Plattenplatz in
Verbindung mit umfangreichen Audit-Konfigurationen ber?cksichtigen. So
kann es w?nschenswert sein, ein eigenes Dateisystem f?r ``/var/audit``
einzusetzen, damit andere Dateisysteme nicht betoffen sind, wenn das
Dateisystem des Audit voll l?uft.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------+----------------------------------------------+----------------------------------------------+
| `Zur?ck <mac-troubleshoot.html>`__?   | `Nach oben <system-administration.html>`__   | ?\ `Weiter <audit-inline-glossary.html>`__   |
+---------------------------------------+----------------------------------------------+----------------------------------------------+
| 17.17. Fehler im MAC beheben?         | `Zum Anfang <index.html>`__                  | ?18.2. Schl?sselbegriffe                     |
+---------------------------------------+----------------------------------------------+----------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
