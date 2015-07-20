=================================================
10.8. Glossar der Kernel-Optionen zur Fehlersuche
=================================================

.. raw:: html

   <div class="navheader">

10.8. Glossar der Kernel-Optionen zur Fehlersuche
`Zur?ck <kerneldebug-deadlocks.html>`__?
Kapitel 10. Kernel-Fehlersuche
?\ `Weiter <architectures.html>`__

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

10.8. Glossar der Kernel-Optionen zur Fehlersuche
-------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dieser Abschnitt bietet ein kurzes Glossar der zur Kompilierzeit
verf?gbaren Kernel-Optionen, die die Fehlersuche unterst?tzen:

.. raw:: html

   <div class="itemizedlist">

-  ``options KDB``: Kompiliert das Kernel-Debugger-Framework ein. Wird
   von ``options       DDB`` und ``options GDB`` ben?tigt. Kein oder nur
   geringer Leistungs-Overhead. Standardm??ig wird bei einer Panic der
   Debugger gestartet, anstatt automatisch neu zu starten.

-  ``options KDB_UNATTENDED``: Setzt den Standard des
   ``debug.debugger_on_panic``-sysctl-Werts auf 0, welcher regelt, ob
   der Debugger bei einer Panic gestartet wird. Solange ``options KDB``
   nicht in den Kernel einkompiliert ist, wird bei einer Panic
   automatisch neu gestartet; sobald es in den Kernel einkompiliert ist,
   wird standardm??ig der Debugger gestartet, solange
   ``options KDB_UNATTENDED`` nicht einkompiliert ist. Falls Sie den
   Kernel-Debugger in den Kernel einkompiliert lassen wollen, aber
   m?chten, dass das System neu startet, wenn Sie nicht zur Stelle sind,
   um den Debugger zur Diagnose zu benutzen, w?hlen Sie diese Option.

-  ``options KDB_TRACE``: Setzt den Standard des
   ``debug.trace_on_panic``-sysctl-Werts auf 1, welcher regelt, ob der
   Debugger bei einer Panic automatisch eine Stack-Ablaufverfolgung
   ausgibt. Besonders wenn der Kernel mit ``KDB_UNATTENDED`` l?uft, kann
   dies hilfreich sein, um grundlegende Informationen zur Fehlersuche
   auf der seriellen oder Firewire-Konsole zu erhalten, w?hrend immer
   noch zur Wiederherstellung neu gestartet wird.

-  ``options DDB``: Kompiliert die Unterst?tzung f?r den
   Konsolen-Debugger DDB ein. Dieser interaktive Debugger l?uft auf was
   auch immer die aktive Konsole des Systems auf niedrigster Ebene ist,
   dazu geh?ren die Video-, serielle und Firewire-Konsole. Er bietet
   grundlegende, eingebaute M?glichkeiten zur Fehlersuche wie zum
   Beispiel das Erstellen von Stack-Ablaufverfolgungen, das Auflisten
   von Prozessen und Threads, das Ablegen des Lock-, VM- und
   Dateisystemstatus und die Verwaltung des Kernel-Speichers. DDB
   ben?tigt keine Software, die auf einem zweiten System l?uft, oder die
   F?higkeit, einen Kernspeicherauszug oder Kernel-Symbole zur vollen
   Fehlersuche zu erzeugen und bietet detaillierte Fehlerdiagnose des
   Kernels zur Laufzeit. Viele Fehler k?nnen allein unter Benutzung der
   DDB-Ausgabe untersucht werden. Diese Option h?ngt von ``options KDB``
   ab.

-  ``options GDB``: Kompiliert die Unterst?tzung f?r den Debugger GDB
   ein, welcher von einem entfernten System aus ?ber ein serielles Kabel
   oder Firewire agieren kann. Wenn der Debugger gestartet ist, kann GDB
   dazu verwendet werden, um Struktur-Inhalte einzusehen,
   Stack-Ablaufverfolgungen zu erzeugen, usw. Bei manchem Kernel-Status
   ist der Zugriff ungeschickter als mit DDB, welcher dazu in der Lage
   ist, n?tzliche Zusammenfassungen des Kernel-Status automatisch zu
   erstellen wie zum Beispiel das automatische Abgehen der
   Lock-Fehlersuche oder der Strukturen zur Kernel-Speicher-Verwaltung,
   und es wird ein zweites System ben?tigt. Auf der anderen Seite
   verbindet GDB Informationen aus den Kernel-Quellen mit vollst?ndigen
   Symbolen zur Fehlersuche, erkennt komplette
   Datenstrukturdefinitionen, lokale Variablen und ist in Skripten
   einsetzbar. Diese Option h?ngt von ``options KDB`` ab, ist aber nicht
   zur Benutzung von GDB auf einem Kernel-Kernspeicherauszug n?tig.

-  ``options BREAK_TO_DEBUGGER``, ``options ALT_BREAK_TO_DEBUGGER``:
   Erlaubt ein Abbruch- oder Alternativ-Signal auf der Konsole, um in
   den Debugger zu gelangen. Falls sich das System ohne eine Panic
   aufh?ngt, ist dies ein n?tzlicher Weg, um den Debugger zu erreichen.
   Aufgrund der aktuellen Verriegelung durch den Kernel ist ein
   Abbruch-Signal, das auf einer seriellen Konsole erzeugt wurde,
   deutlich vertrauensw?rdiger beim Gelangen in den Debugger und wird
   allgemein empfohlen. Diese Option hat kaum oder keine Auswirkung auf
   den Durchsatz.

-  ``options INVARIANTS``: Kompiliert eine gro?e Anzahl an
   Aussagepr?fungen und -tests (Assertion-Checks und -Tests) ein, welche
   st?ndig die Intaktheit der Kernel-Datenstrukturen und die Invarianten
   der Kernel-Algorithmen pr?fen. Diese Tests k?nnen aufwendig sein und
   sind deswegen nicht von Anfang an einkompiliert, aber helfen
   n?tzliches "fail stop"-Verhalten, wobei bestimmte Gruppen nicht
   erw?nschten Verhaltens den Debugger ?ffnen, bevor Besch?digungen an
   Kernel-Daten auftreten, bereitzustellen, welches es einfacher macht,
   diese auf Fehler hin zu untersuchen. Die Tests beinhalten S?ubern von
   Speicher und use-after-free-Pr?fungen, was eine der bedeutenderen
   Quellen von Overhead ist. Diese Option h?ngt von
   ``options INVARIANT_SUPPORT`` ab.

-  ``options INVARIANT_SUPPORT``: Viele der in ``options INVARIANTS``
   vorhandenen Tests ben?tigen ver?nderte Datenstrukturen und
   zus?tzliche Kernel-Symbole, die festgelegt werden m?ssen.

-  ``options WITNESS``: Diese Option aktiviert Verfolgung und Pr?fung
   von Lock-Anforderungen zur Laufzeit und ist als Werkzeug f?r die
   Deadlock-Diagnose von unsch?tzbarem Wert. WITNESS pflegt ein Diagramm
   mit erworbenen Lock-Antr?gen nach Typ geordnet und pr?ft bei jedem
   Erwerb nach Zyklen (implizit oder explizit). Falls ein Zyklus
   entdeckt wird, werden eine Warnung und eine Stack-Ablaufverfolgung
   erzeugt und als Hinweis, dass ein m?glicher Deadlock gefunden wurde,
   auf der Konsole ausgegeben. WITNESS wird ben?tigt, um die DDB-Befehle
   ``show       locks``, ``show witness`` und ``show alllocks`` benutzen
   zu k?nnen. Diese Debug-Option hat einen bedeutenden
   Leistung-Overhead, welcher ein ein wenig durch Benutzung von
   ``options       WITNESS_SKIPSPIN`` gemildert werden kann.
   Detaillierte Dokumentation kann in
   `witness(4) <http://www.FreeBSD.org/cgi/man.cgi?query=witness&sektion=4>`__
   gefunden werden.

-  ``options WITNESS_SKIPSPIN``: Deaktiviert die Pr?fung von
   Spinlock-Lock-Anforderungen mit WITNESS zur Laufzeit. Da Spinlocks am
   h?ufigsten im Scheduler angefordert werden und Scheduler-Ereignisse
   oft auftreten, kann diese Option Systeme, die mit WITNESS laufen,
   merklich beschleunigen. Diese Option h?ngt von
   ``options       WITNESS`` ab.

-  ``options WITNESS_KDB``: Setzt den Standard des
   ``debug.witness.kdb``-sysctl-Werts auf 1, was bewirkt, dass WITNESS
   den Debugger aufruft, sobald eine Lock-Anforderungsverletzung
   vorliegt, anstatt einfach nur eine Warnung auszugeben. Diese Option
   h?ngt von ``options WITNESS`` ab.

-  ``options SOCKBUF_DEBUG``: F?hrt umfassende Beschaffenheitspr?fungen
   in Socket-Puffern durch, was n?tzlich zur Fehlersuche bei
   Socket-Fehlern und Anzeichen f?r Ressourceblockaden (Race) in
   Protokollen und Ger?tetreibern, die mit Sockets arbeiten, sein kann.
   Diese Option hat bedeutende Auswirkung auf die Netzwerkleistung und
   kann die Zeitverh?ltnisse bei gegenseitiger Ressourceblockade in
   Ger?tetreibern ?ndern.

-  ``options DEBUG_VFS_LOCKS``: Verfolgt Lock-Anforderungs-Einzelheiten
   bei lockmgr/vnode-Locks, was die Menge der Informationen, die von
   ``show       lockdevnods`` in DDB angezeigt werden, vergr??ert. Diese
   Option hat messbare Auswirkung auf die Leistung.

-  ``options DEBUG_MEMGUARD``: Ein Ersatz f?r die
   Kernel-Speicher-Zuweisung durch
   `malloc(9) <http://www.FreeBSD.org/cgi/man.cgi?query=malloc&sektion=9>`__,
   die das VM-System benutzt, um Lese- und Schreibzugriffe auf
   zugewiesenen Speicher nach der Freigabe zu entdecken. Details k?nnen
   in
   `memguard(9) <http://www.FreeBSD.org/cgi/man.cgi?query=memguard&sektion=9>`__
   gefunden werden. Diese Option hat bedeutende Auswirkung auf die
   Leistung, aber kann sehr n?tzlich bei der Fehlersuche sein, wenn
   Kernel-Speicher-Besch?digungen durch Fehler verursacht werden.

-  ``options DIAGNOSTIC``: Aktiviert zus?tzliche, aufwendigere
   Diagnosetests analog zu ``options INVARIANTS``.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------------+------------------------------------+--------------------------------------+
| `Zur?ck <kerneldebug-deadlocks.html>`__?   | `Nach oben <kerneldebug.html>`__   | ?\ `Weiter <architectures.html>`__   |
+--------------------------------------------+------------------------------------+--------------------------------------+
| 10.7. Fehlersuche bei Deadlocks?           | `Zum Anfang <index.html>`__        | ?Teil?IV.?Architekturen              |
+--------------------------------------------+------------------------------------+--------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
