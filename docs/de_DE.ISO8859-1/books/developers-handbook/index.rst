============================
FreeBSD Developers' Handbook
============================

.. raw:: html

   <div class="navheader">

FreeBSD Developers' Handbook
?
?
?\ `Weiter <Basics.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="book" lang="de" lang="de">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="author" xmlns="http://www.w3.org/1999/xhtml">

The FreeBSD Documentation Project
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div>

Version: ` <https://svnweb.freebsd.org/changeset/doc/>`__

.. raw:: html

   </div>

.. raw:: html

   <div>

Copyright ? 2000-2010 The FreeBSD Documentation Project

.. raw:: html

   </div>

.. raw:: html

   <div>

Copyright ? 2008-2010 The FreeBSD German Documentation Project

.. raw:: html

   </div>

.. raw:: html

   <div>

`Rechtlicher Hinweis <legalnotice.html>`__

.. raw:: html

   </div>

.. raw:: html

   <div>

`Rechtlicher Hinweis <trademarks.html>`__

.. raw:: html

   </div>

.. raw:: html

   <div>

Zuletzt bearbeitet am August 2000 von .

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="abstract" xmlns="http://www.w3.org/1999/xhtml">

.. raw:: html

   <div class="abstract-title">

Zusammenfassung

.. raw:: html

   </div>

Willkommen zum Entwickler-Handbuch. Dieses Handbuch ist *jederzeit unter
Bearbeitung* und das Ergebnis der Arbeit vieler Einzelpersonen. Dies
kann dazu f?hren, dass bestimmte Bereiche nicht mehr aktuell sind und
auf den neuesten Stand gebracht werden m?ssen. Bei Unklarheiten
empfiehlt es sich daher stets, auch die `englische
Originalversion <../../../../doc/en_US.ISO8859-1/books/developers-handbook/index.html>`__
des Handbuchs zu lesen.

Wenn Sie bei der ?bersetzung dieses Handbuchs mithelfen m?chten, senden
Sie bitte eine E-Mail an die Mailingliste 'FreeBSD German Documentation
Project' ``<de-bsd-translators@de.FreeBSD.org>``.

Die aktuelle Version dieses Handbuchs ist immer auf dem
`FreeBSD-Webserver <http://www.FreeBSD.org/>`__ verf?gbar und kann in
verschiedenen Formaten und in komprimierter Form vom
`FreeBSD-FTP-Server <ftp://ftp.FreeBSD.org/pub/FreeBSD/doc>`__ oder
einem der zahlreichen
`Spiegel <../../../../doc/de_DE.ISO8859-1/books/handbook/mirrors-ftp.html>`__
heruntergeladen werden (?ltere Versionen finden Sie hingegen unter
``http://docs.FreeBSD.org/doc/``).

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Inhaltsverzeichnis

.. raw:: html

   </div>

`I. Grundlagen <Basics.html>`__
`1. Einf?hrung <introduction.html>`__
`1.1. Unter FreeBSD entwickeln <introduction.html#introduction-devel>`__
`1.2. Die Vision von BSD <introduction-bsdvision.html>`__
`1.3. Grundlegende Richtlinien <introduction-archguide.html>`__
`1.4. Der Aufbau von ``/usr/src`` <introduction-layout.html>`__
`2. Werkzeuge zur Programmierung <tools.html>`__
`2.1. ?berblick <tools.html#tools-synopsis>`__
`2.2. Zusammenfassung <tools-intro.html>`__
`2.3. Einf?hrung in die Programmierung <tools-programming.html>`__
`2.4. Kompilieren mit dem ``cc`` <tools-compiling.html>`__
`2.5. Make <tools-make.html>`__
`2.6. Debuggen <debugging.html>`__
`2.7. Emacs als Entwicklungsumgebung verwenden <emacs.html>`__
`2.8. Weiterf?hrende Literatur <tools-reading.html>`__
`3. Sicheres Programmieren <secure.html>`__
`3.1. Zusammenfassung <secure.html#secure-synopsis>`__
`3.2. Methoden des sicheren Entwurfs <secure-philosophy.html>`__
`3.3. Puffer-?berl?ufe <secure-bufferov.html>`__
`3.4. SetUID-Themen <secure-setuid.html>`__
`3.5. Die Umgebung ihrer Programme einschr?nken <secure-chroot.html>`__
`3.6. Vertrauen <secure-trust.html>`__
`3.7. Race-Conditions <secure-race-conditions.html>`__
`4. Lokalisierung und Internationalisierung - L10N und
I18N <l10n.html>`__
`4.1. I18N-konforme Anwendungen
programmieren <l10n.html#l10n-programming>`__
`4.2. Lokalisierte Nachrichten mit POSIX.1 Native Language Support
(NLS) <posix-nls.html>`__
`5. Vorgaben und Richtlinien f?r das
Quelltextverzeichnis <policies.html>`__
`5.1. Stil-Richtlinien <policies.html#policies-style>`__
`5.2. ``MAINTAINER`` eines Makefiles <policies-maintainer.html>`__
`5.3. Beigesteuerte Software <policies-contributed.html>`__
`5.4. Belastende Dateien <policies-encumbered.html>`__
`5.5. Shared-Libraries <policies-shlib.html>`__
`6. Regressions- und Performance-Tests <testing.html>`__
`6.1.
Mikro-Benchmark-Checkliste <testing.html#testing-micro-benchmark>`__
`II. Interprozess-Kommunikation <ipc.html>`__
`7. Sockets <sockets.html>`__
`8. IPv6 Internals <ipv6.html>`__
`8.1. IPv6/IPsec-Implementierung <ipv6.html#ipv6-implementation>`__
`III. Kernel <kernel.html>`__
`9. Einen FreeBSD-Kernel bauen und installieren <kernelbuild.html>`__
`9.1. Einen Kernel auf die „traditionelle“ Art und Weise
bauen <kernelbuild.html#kernelbuild-traditional>`__
`9.2. Einen Kernel auf die „neue“ Art und Weise
bauen <kernelbuild-new.html>`__
`10. Kernel-Fehlersuche <kerneldebug.html>`__
`10.1. Besorgen eines Speicherauszugs nach einem Kernel-Absturz
(Kernel-Crash-Dump) <kerneldebug.html#kerneldebug-obtain>`__
`10.2. Fehlersuche in einem Speicherauszug nach einem Kernel-Absturz mit
``kgdb`` <kerneldebug-gdb.html>`__
`10.3. Fehlersuche in einem Speicherauszug nach einem Absturz mit
DDD <kerneldebug-ddd.html>`__
`10.4. Online-Kernel-Fehlersuche mit
DDB <kerneldebug-online-ddb.html>`__
`10.5. Online-Kernel-Fehlersuche mit GDB auf einem entfernten
System <kerneldebug-online-gdb.html>`__
`10.6. Fehlersuche bei einem
Konsolen-Treiber <kerneldebug-console.html>`__
`10.7. Fehlersuche bei Deadlocks <kerneldebug-deadlocks.html>`__
`10.8. Glossar der Kernel-Optionen zur
Fehlersuche <kerneldebug-options.html>`__
`IV. Architekturen <architectures.html>`__
`11. x86-Assembler-Programmierung <x86.html>`__
`11.1. Synopsis <x86.html#x86-intro>`__
`11.2. Die Werkzeuge <x86-the-tools.html>`__
`11.3. Systemaufrufe <x86-system-calls.html>`__
`11.4. R?ckgabewerte <x86-return-values.html>`__
`11.5. Portablen Code erzeugen <x86-portable-code.html>`__
`11.6. Unser erstes Programm <x86-first-program.html>`__
`11.7. UNIX?-Filter schreiben <x86-unix-filters.html>`__
`11.8. Gepufferte Eingabe und Ausgabe <x86-buffered-io.html>`__
`11.9. Kommandozeilenparameter <x86-command-line.html>`__
`11.10. Die UNIX?-Umgebung <x86-environment.html>`__
`11.11. Arbeiten mit Dateien <x86-files.html>`__
`11.12. One-Pointed Mind <x86-one-pointed-mind.html>`__
`11.13. Die FPU verwenden <x86-fpu.html>`__
`11.14. Vorsichtsmassnahmen <x86-caveats.html>`__
`11.15. Danksagungen <x86-acknowledgements.html>`__
`V. Anhang <appendices.html>`__
`Literaturverzeichnis <bi01.html>`__
`Stichwortverzeichnis <ix01.html>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="list-of-examples">

.. raw:: html

   <div class="toc-title">

Liste der Beispiele

.. raw:: html

   </div>

2.1. `Eine einfache ``.emacs``-Datei <emacs.html#idp67566160>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----+-----+-------------------------------+
| ?   | ?   | ?\ `Weiter <Basics.html>`__   |
+-----+-----+-------------------------------+
| ?   | ?   | ?Teil?I.?Grundlagen           |
+-----+-----+-------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
