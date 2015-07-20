=================================
18.4. Die Konfiguration des Audit
=================================

.. raw:: html

   <div class="navheader">

18.4. Die Konfiguration des Audit
`Zur?ck <audit-install.html>`__?
Kapitel 18. Security Event Auditing
?\ `Weiter <audit-administration.html>`__

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

18.4. Die Konfiguration des Audit
---------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Alle Konfigurationsdateien f?r das Sicherheits-Audit finden sich unter
``/etc/security``. Die folgenden Dateien m?ssen vorhanden sein, bevor
der Audit-Daemon gestartet wird:

.. raw:: html

   <div class="itemizedlist">

-  ``audit_class``?–?Enth?lt die Definitionen der Audit-Klassen.

-  ``audit_control``?–?Steuert Teile des Audit-Subsystems wie
   Audit-Klassen, minimaler Plattenplatz auf dem Audit-Log-Datentr?ger,
   maximale Gr??e des Audit-Pfades usw.

-  ``audit_event``?–?W?rtliche Namen und Beschreibungen von
   System-Audit-Ereignissen sowie eine Liste, welche Klassen welches
   Ereignis aufzeichnen.

-  ``audit_user``?–?Benutzerspezifische Audit-Erfordernisse, welche mit
   den globalen Vorgaben bei der Anmeldung kombiniert werden.

-  ``audit_warn``?–?Ein anpassbares Shell-Skript, welches von auditd
   benutzt wird, um Warnhinweise in aussergew?hnlichen Situationen zu
   erzeugen, z.B. wenn der Platz f?r die Audit-Datens?tze knapp wird
   oder wenn die Datei des Audit-Pfades rotiert wurde.

.. raw:: html

   </div>

.. raw:: html

   <div class="warning" xmlns="">

Warnung:
~~~~~~~~

Audit-Konfigurationsdateien sollten vorsichtig gewartet und bearbeitet
werden, da Fehler in der Konfiguration zu falscher Aufzeichnung von
Ereignissen f?hren k?nnten.

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

18.4.1. Ereignis-Auswahlausdr?cke
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Auswahlausdr?cke werden an einigen Stellen der Audit-Konfiguration
ben?tzt, um zu bestimmen, welche Ereignisse auditiert werden sollen. Die
Ausdr?cke enthalten eine Liste der Ereignisklassen, welche verglichen
werden sollen, jede mit einem Pr?fix, welches anzeigt, ob verglichene
Datens?tze akzeptiert oder ignoriert werden sollen und optional, um
anzuzeigen, ob der Eintrag beabsichtigt, erfolgreiche oder
fehlgeschlagene Operationen zu vergleichen. Auswahlausdr?cke werden von
links nach rechts ausgewertet und zwei Ausdr?cke werden durch
Aneinanderh?ngen miteinander kombiniert.

Die folgende Liste enth?lt die Standard-Ereignisklassen f?r das Audit
und ist in ``audit_class`` festgehalten:

.. raw:: html

   <div class="itemizedlist">

-  ``all``?–?*all*?–?Vergleiche alle Ereignisklassen.

-  ``ad``?–?*administrative*?–?Administrative Aktionen ausgef?hrt auf
   dem System als Ganzes.

-  ``ap``?–?*application*?–?Aktionen definiert f?r Applikationen.

-  ``cl``?–?*file close*?–?Audit-Aufrufe f?r den Systemaufruf ``close``.

-  ``ex``?–?*exec*?–?Ausf?hrung des Audit-Programms. Auditierung von
   Befehlszeilen-Argumenten und Umgebungsvariablen wird gesteuert durch
   `audit\_control(5) <http://www.FreeBSD.org/cgi/man.cgi?query=audit_control&sektion=5>`__
   mittels der ``argv`` und ``envv``-Parametergem?ss der
   ``Richtlinien``-Einstellungen.

-  ``fa``?–?*file attribute access*?–?Auditierung des Zugriffs auf
   Objektattribute wie
   `stat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=stat&sektion=1>`__,
   `pathconf(2) <http://www.FreeBSD.org/cgi/man.cgi?query=pathconf&sektion=2>`__
   und ?hnlichen Ereignissen.

-  ``fc``?–?*file create*?–?Audit-Ereignisse, bei denen eine Datei als
   Ergebnis angelegt wird.

-  ``fd``?–?*file delete*?–?Audit-Ereignisse, bei denen Dateil?schungen
   vorkommen.

-  ``fm``?–?*file attribute modify*?–?Audit-Ereignisse, bei welchen
   Dateiattribute ge?ndert werden, wie
   `chown(8) <http://www.FreeBSD.org/cgi/man.cgi?query=chown&sektion=8>`__,
   `chflags(1) <http://www.FreeBSD.org/cgi/man.cgi?query=chflags&sektion=1>`__,
   `flock(2) <http://www.FreeBSD.org/cgi/man.cgi?query=flock&sektion=2>`__
   etc.

-  ``fr``?–?*file read*?–?Audit-Ereignisse, bei denen Daten gelesen oder
   Dateien zum lesen ge?ffnet werden usw.

-  ``fw``?–?*file write*?–?Audit-Ereignisse, bei welchen Daten
   geschrieben oder Dateien geschrieben oder ver?ndert werden usw.

-  ``io``?–?*ioctl*?–?Nutzung des Systemaufrufes
   `ioctl(2) <http://www.FreeBSD.org/cgi/man.cgi?query=ioctl&sektion=2>`__
   durch Audit.

-  ``ip``?–?*ipc*?–?Auditierung verschiedener Formen von
   Inter-Prozess-Kommunikation einschliesslich POSIX-Pipes und System V
   IPC-Operationen.

-  ``lo``?–?*login\_logout*?–?Audit-Ereignisse betreffend
   `login(1) <http://www.FreeBSD.org/cgi/man.cgi?query=login&sektion=1>`__
   und
   `logout(1) <http://www.FreeBSD.org/cgi/man.cgi?query=logout&sektion=1>`__,
   welche auf dem System auftreten.

-  ``na``?–?*non attributable*?–?Auditierung nicht-attributierbarer
   Ereignisse (Ereignisse, die nicht auf einen bestimmten Benutzer
   zur?ckgef?hrt werden k?nnen).

-  ``no``?–?*invalid class*?–?Kein Abgleich von Audit-Ereignissen.

-  ``nt``?–?*network*?–?Audit-Ereignisse in Zusammenhang mit
   Netzwerkaktivit?ten wie z.B.
   `connect(2) <http://www.FreeBSD.org/cgi/man.cgi?query=connect&sektion=2>`__
   und
   `accept(2) <http://www.FreeBSD.org/cgi/man.cgi?query=accept&sektion=2>`__.

-  ``ot``?–?*other*?–?Auditierung verschiedener Ereignisse.

-  ``pc``?–?*process*?–?Auditierung von Prozess-Operationen wie
   `exec(3) <http://www.FreeBSD.org/cgi/man.cgi?query=exec&sektion=3>`__
   und
   `exit(3) <http://www.FreeBSD.org/cgi/man.cgi?query=exit&sektion=3>`__.

.. raw:: html

   </div>

Diese Ereignisklassen k?nnen angepasst werden durch Modifizierung der
Konfigurationsdateien ``audit_class`` und ``audit_event``.

Jede Audit-Klasse in dieser Liste ist kombiniert mit einem Pr?fix,
welches anzeigt, ob erfolgreiche/gescheiterte Operationen abgebildet
werden, und ob der Eintrag den Abgleich hinzuf?gt oder entfernt f?r die
Klasse und den Typ.

.. raw:: html

   <div class="itemizedlist">

-  (none) Kein Pr?fix, sowohl erfolgreiche als auch gescheiterte
   Vorkommen eines Ereignisses werden auditiert.

-  ``+`` Auditiere nur erfolgreiche Ereignisse in dieser Klasse.

-  ``-`` Auditiere nur gescheiterte Operationen in dieser Klasse.

-  ``^`` Auditiere weder erfolgreiche noch gescheiterte Ereignisse in
   dieser Klasse.

-  ``^+`` Auditiere keine erfolgreichen Ereignisse in dieser Klasse.

-  ``^-`` Auditiere keine gescheiterten Ereignisse in dieser Klasse.

.. raw:: html

   </div>

Das folgende Beispiel einer Auswahl-Zeichenkette w?hlt erfolgreiche und
gescheiterte Anmelde/Abmelde-Ereignisse aus, aber nur erfolgreich
beendete Ausf?hrungs-Ereignisse:

.. code:: programlisting

    lo,+ex

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

18.4.2. Konfigurationsdateien
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In den meisten F?llen m?ssen Administratoren nur zwei Dateien ?ndern,
wenn sie das Audit-System konfigurieren: ``audit_control`` und
``audit_user``. Die erste Datei steuert systemweite Audit-Eigenschaften
und -Richtlinien; die zweite Datei kann f?r die Feinanpassung der
Auditierung von Benutzern verwendet werden.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

18.4.2.1. Die ``audit_control``-Datei
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die ``audit_control``-Datei legt eine Anzahl Vorgabewerte fest:

.. code:: programlisting

    dir:/var/audit
    flags:lo
    minfree:20
    naflags:lo
    policy:cnt
    filesz:0

Die Option ``dir`` wird genutzt, um eines oder mehrere Verzeichnisse
festzulegen, in welchen Audit-Protokolle gespeichert werden. Gibt es
mehrere Verzeichniseintr?ge, werden diese in der angegebenen Reihenfolge
genutzt, bis sie jeweils gef?llt sind. Es ist ?blich, Audit so zu
konfigurieren, dass die Audit-Logs auf einem dedizierten Dateisystem
abgelegt werden, um Wechselwirkungen zwischen dem Audit-Subsystem und
anderen Subsystemen zu verhindern, falls das Dateisystem voll l?uft.

Das ``flags``-Feld legt die systemweite Standard-Vorauswahl-Maske f?r
attributierbare (direkt einem Benutzer zuordenbare) Ereignisse fest. Im
obigen Beispiel werden alle gescheiterten und erfolgreichen Anmelde- und
Abmelde-Ereignisse f?r alle Benutzer aufgezeichnet.

Die Option ``minfree`` definiert den minimalen Prozentsatz an freiem
Plattenplatz f?r das Dateisystem, in welchem der Audit-Pfad
abgespeichert wird. Wenn diese Schwelle ?berschritten ist, wird ein
Warnhinweis erzeugt. Das obige Beispiel legt den minimalen freien Platz
auf zwanzig Prozent fest.

Die ``naflags``-Option bestimmt diejenigen Audit-Klassen, f?r die
nicht-attributierbare Ereignisse aufgezeichnet werden sollen
(beispielsweise Anmeldeprozesse und System-Daemonen.

Die Option ``policy`` legt eine durch Kommata getrennte Liste von
policy-Flags fest, welche verschiedene Aspekte des Audit-Verhaltens
steuern. Der vorgegebene Flag ``cnt`` zeigt an, dass das System trotz
eines Audit-Fehlers weiterlaufen soll (dieses Flag wird dringend
angeraten). Ein anderes, h?ufig genutztes Flag ist ``argv``, welches
dazu f?hrt, dass Befehlszeilen-Argumente f?r den Systemauruf
`execve(2) <http://www.FreeBSD.org/cgi/man.cgi?query=execve&sektion=2>`__
als Teil der Befehlsausf?hrung aufgezeichnet werden.

Die ``filesz``-Option spezifiziert die maximale Gr??e in Bytes, welche
eine Audit-Pfad-Datei wachsen darf, bevor sie automatisch beendet und
rotiert wird. Die Standardvorgabe ``0`` setzt die automatische
Log-Rotation ausser Kraft. Falls die angeforderte Dateigr??e gr??er Null
und gleichzeitig unterhalb des Minimums von 512K ist, dann wird die
Angabe verworfen und ein Log-Hinweis wird erzeugt.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

18.4.2.2. Die Datei ``audit_user``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die ``audit_user``-Datei erlaubt es dem Administrator, weitere
Audit-Erfordernisse f?r bestimmte Benutzer festzulegen. Jede Zeile
konfiguriert das Auditing f?r einen Benutzer ?ber zwei Felder: Das erste
Feld ist ``alwaysaudit``, welches eine Ansammlung von Ereignissen
vorgibt, welche immer f?r diesen Benutzer aufgezeichnet werden. Das
zweite Feld ``neveraudit`` legt eine Menge an Ereignissen fest, die
niemals f?r diesen Benutzer auditiert werden sollen.

Das folgende Beispiel einer ``audit_user``-Datei zeichnet
Anmelde/Abmelde-Ereignisse, erfolgreiche Befehlsausf?hrungen f?r den
Benutzer ``root``, Anlegen von Dateien und erfolgreiche
Befehlsausf?hrungen f?r den Benutzer ``www`` auf. Falls das Beispiel
zusammen mit der vorstehend als Beispiel gezeigten Datei
``audit_control`` benutzt wird, dann ist der Eintrag ``lo`` f?r ``root``
?berfl?ssig und Anmelde/Abmelde-Ereignisse werden f?r ``www`` ebenfalls
aufgezeichnet.

.. code:: programlisting

    root:lo,+ex:no
    www:fc,+ex:no

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------------+-------------------------------+----------------------------------------------+
| `Zur?ck <audit-install.html>`__?              | `Nach oben <audit.html>`__    | ?\ `Weiter <audit-administration.html>`__    |
+-----------------------------------------------+-------------------------------+----------------------------------------------+
| 18.3. Installation der Audit-Unterst?tzung?   | `Zum Anfang <index.html>`__   | ?18.5. Administration des Audit-Subsystems   |
+-----------------------------------------------+-------------------------------+----------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
