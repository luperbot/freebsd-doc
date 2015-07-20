=========================================
18.5. Administration des Audit-Subsystems
=========================================

.. raw:: html

   <div class="navheader">

18.5. Administration des Audit-Subsystems
`Zur?ck <audit-config.html>`__?
Kapitel 18. Security Event Auditing
?\ `Weiter <disks.html>`__

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

18.5. Administration des Audit-Subsystems
-----------------------------------------

.. raw:: html

   </div>

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

18.5.1. Audit-Pfade betrachten
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Audit-Pfade werden im bin?ren BSM-Format gespeichert, daher ben?tigen
Sie spezielle Werkzeuge, um derartige Dateien zu ?ndern oder Sie in
Textdateien zu konvertieren. Der Befehl
`praudit(1) <http://www.FreeBSD.org/cgi/man.cgi?query=praudit&sektion=1>`__
wandelt alle Pfad-Dateien in ein einfaches Textformat um. Der Befehl
`auditreduce(1) <http://www.FreeBSD.org/cgi/man.cgi?query=auditreduce&sektion=1>`__
kann genutzt werden, um die Pfad-Dateien f?r Analyse, Ausdruck,
Archivierung oder andere Zwecke zu reduzieren. Eine Reihe von
Auswahl-Parametern werden von
`auditreduce(1) <http://www.FreeBSD.org/cgi/man.cgi?query=auditreduce&sektion=1>`__
unterst?tzt, einschliesslich Ereignistyp, Ereignisklasse, Benutzer,
Datum oder Uhrzeit des Ereignisses und den Dateipfad oder das Objekt,
mit dem gearbeitet wurde.

Das Dienstprogramm
`praudit(1) <http://www.FreeBSD.org/cgi/man.cgi?query=praudit&sektion=1>`__
schreibt zum Beispiel den gesamten Inhalt einer angegebenen
Audit-Protokolldatei in eine simple Textdatei:

.. code:: screen

    # praudit /var/audit/AUDITFILE

``AUDITFILE`` ist hier die zu schreibende Protokolldatei.

Audit-Pfade bestehen aus einer Reihe von Datens?tzen, die wiederum aus
K?rzeln (token) gebildet werden, die von
`praudit(1) <http://www.FreeBSD.org/cgi/man.cgi?query=praudit&sektion=1>`__
fortlaufend zeilenweise ausgegeben werden. Jedes K?rzel ist von einem
bestimmten Typ, z.B. enth?lt ``header`` einen audit-Datensatz-Header
oder ``path`` enth?lt einen Dateipfad von einer Suche. Hier ein Beispiel
eines ``execve``-Ereignisses:

.. code:: programlisting

    header,133,10,execve(2),0,Mon Sep 25 15:58:03 2006, + 384 msec
    exec arg,finger,doug
    path,/usr/bin/finger
    attribute,555,root,wheel,90,24918,104944
    subject,robert,root,wheel,root,wheel,38439,38032,42086,128.232.9.100
    return,success,0
    trailer,133

Dieser Audit stellt einen erfolgreichen ``execve``-Aufruf dar, in
welchem der Befehl ``finger doug`` ausgef?hrt wurde. Das K?rzel des
Argumentes enth?lt die Befehlszeile, welche die Shell an den Kernel
weiterleitet. Das K?rzel ``path`` enth?lt den Pfad zur ausf?hrbaren
Datei (wie vom Kernel wahrgenommen). Das K?rzel ``attribute`` beschreibt
die Bin?rdatei (insbesondere den Datei-Modus, der genutzt werden kann,
um zu bestimmen, ob setuid auf die Applikation angewendet wurde). Das
K?rzel ``subject`` beschreibt den untergeordneten Prozess und speichert
daher in Aufeinanderfolge Audit-Benutzer-ID, effektive Benutzer-ID und
Gruppen-ID, wirkliche Benutzer-ID und Grppen-ID, Process-ID, Session-
ID, Port-ID und Anmelde-Adresse. Beachten Sie, dass Audit-Benutzer-ID
und wirkliche Benutzer-ID abweichen: Der Benutzer ``robert`` wurde zum
Benutzer ``root``, bevor er diesen Befehl ausf?hrte, aber er wird
auditiert mit dem urspr?nglich authentifizierten Benutzer. Schlie?lich
zeigt das K?rzel ``return`` die erfolgreiche Ausf?hrung an und
``trailer`` schlie?t den Datensatz ab.

`praudit(1) <http://www.FreeBSD.org/cgi/man.cgi?query=praudit&sektion=1>`__
unterst?tzt auch die Ausgabe im XML-Format (die sie ?ber die Option
``-x`` ausw?hlen k?nnen).

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

18.5.2. Audit-Pfade reduzieren
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Da Audit-Protokolldateien sehr gro? sein k?nnen, wird ein Administrator
h?chstwahrscheinlich eine Auswahl an Datens?tzen verwenden, wie z.B.
alle Datens?tze zu einem bestimmten Benutzer:

.. code:: screen

    # auditreduce -u trhodes /var/audit/AUDITFILE | praudit

Dies wird alle Audit-Datens?tze des Benutzers ``trhodes`` ausw?hlen, die
in ``AUDITFILE`` gespeichert sind.

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

18.5.3. Delegation von Rechten f?r Audit-Reviews
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Mitglieder der Gruppe ``audit`` haben die Erlaubnis, Audit-Pfade in
``/var/audit`` zu lesen; standardm?ssig ist diese Gruppe leer, daher
kann nur der Benutzer ``root`` die Audit-Pfade lesen. Benutzer k?nnen
der Gruppe ``audit`` hinzugef?gt werden, um Rechte f?r Audit-Reviews zu
gew?hren. Da die F?higkeit, Inhalte von Audit-Protokolldateien zu
verfolgen, tiefgreifende Einblicke in das Verhalten von Benutzern und
Prozessen erlaubt, wird empfohlen, dass die Gew?hrung von Rechten f?r
Audit-Reviews mit Bedacht erfolgt.

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

18.5.4. Aktive ?berwachung mittles Audit-Pipes
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Audit-Pipes sind nachgebildete (geklonte) Pseudo-Ger?te im Dateisystem
des Ger?tes, welche es Applikationen erlauben, die laufenden
Audit-Datens?tze anzuzapfen. Dies ist vorrangig f?r Autoren von
Intrusion Detection Software und System?berwachungsprogrammen von
Bedeutung. Allerdings ist f?r den Administrator das Audit-Pipe-Ger?t ein
angenehmer Weg, aktive ?berwachung zu gestatten, ohne Gefahr von
Problemen durch Besitzerrechte der Audit-Pfad-Datei oder Unterbrechung
des Stroms von Ereignissen durch Log-Rotation. Um den laufenden
Audit-Ereignisstrom zu verfolgen, geben Sie bitte folgende Befehlszeile
ein:

.. code:: screen

    # praudit /dev/auditpipe

In der Voreinstellung kann nur der Benutzer ``root`` auf die
Audit-Pipe-Ger?te-Knotenpunkte zugreifen. Um sie allen Mitgliedern der
Gruppe ``audit`` zug?nglich zu machen, f?gen Sie eine ``devfs``-Regel in
``devfs.rules`` hinzu:

.. code:: programlisting

    add path 'auditpipe*' mode 0440 group audit

Lesen Sie
`devfs.rules(5) <http://www.FreeBSD.org/cgi/man.cgi?query=devfs.rules&sektion=5>`__
f?r weitere Informationen, wie das devfs-Dateisystem konfiguriert wird.

.. raw:: html

   <div class="warning" xmlns="">

Warnung:
~~~~~~~~

Es ist sehr leicht, R?ckmeldungszyklen von Audit-Ereignissen
hervorzurufen, in welcher das Betrachten des Resultates eines
Audit-Ereignisses in die Erzeugung von mehr Audit-Ereignissen m?ndet.
Wenn zum Beispiel der gesamte Netzwerk-I/O auditiert wird, w?hrend
`praudit(1) <http://www.FreeBSD.org/cgi/man.cgi?query=praudit&sektion=1>`__
in einer SSH-Sitzung gestartet wurde, dann wird ein kontinuierlicher,
m?chtiger Strom von Audit-Ereignissen erzeugt, da jedes ausgegebene
Ereignis wiederum neue Ereignisse erzeugt. Es ist anzuraten,
`praudit(1) <http://www.FreeBSD.org/cgi/man.cgi?query=praudit&sektion=1>`__
an einem Audit-Pipe-Ger?t nur von Sitzungen anzuwenden (ohne
feingranuliertes I/O-Auditing), um dies zu vermeiden.

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

18.5.5. Rotation von Audit-Pfad-Dateien
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Audit-Pfade werden nur vom Kernel geschrieben und nur vom Audit-Daemon
`auditd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=auditd&sektion=8>`__
verwaltet. Administratoren sollten nicht versuchen,
`newsyslog.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=newsyslog.conf&sektion=5>`__
oder andere Werkzeuge zu benutzen, um Audit-Protokolldateien direkt zu
rotieren. Stattdessen sollte das
`audit(8) <http://www.FreeBSD.org/cgi/man.cgi?query=audit&sektion=8>`__
Management-Werkzeug benutzt werden, um die Auditierung zu beenden, das
Audit-System neu zu konfigurieren und eine Log-Rotation durchzuf?hren.
Der folgende Befehl veranlasst den Audit-Daemon, eine neue
Protokolldatei anzulegen und dem Kernel zu signalisieren, die neue Datei
zu nutzen. Die alte Datei wird beendet und umbenannt. Ab diesem
Zeitpunkt kann sie vom Administrator bearbeitet werden.

.. code:: screen

    # audit -n

.. raw:: html

   <div class="warning" xmlns="">

Warnung:
~~~~~~~~

Falls der
`auditd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=auditd&sektion=8>`__-Daemon
gegenw?rtig nicht l?uft, wird dieser Befehl scheitern und eine
Fehlermeldung wird ausgegeben.

.. raw:: html

   </div>

Das Hinzuf?gen der folgenden Zeile in ``/etc/crontab`` wird die
Log-Rotation alle zw?lf Stunden durch
`cron(8) <http://www.FreeBSD.org/cgi/man.cgi?query=cron&sektion=8>`__
erzwingen:

.. code:: programlisting

    0     */12       *       *       *       root    /usr/sbin/audit -n

Die ?nderung wird wirksam, sobald Sie die neue ``/etc/crontab``
gespeichert haben.

Die automatische Rotation der Audit-Pfad-Datei in Abh?ngigkeit von der
Dateigr??e ist m?glich durch die Angabe der Option ``filesz`` in
`audit\_control(5) <http://www.FreeBSD.org/cgi/man.cgi?query=audit_control&sektion=5>`__.
Dieser Vorgang ist im Abschnitt Konfigurationsdateien dieses Kapitels
beschrieben.

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

18.5.6. Komprimierung von Audit-Pfaden
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Da Audit-Pfad-Dateien sehr gro? werden k?nnen, ist es oft w?nschenswert,
Pfade zu komprimieren oder anderweitig zu archivieren, sobald sie vom
Audit-Daemon geschlossen wurden. Das Skript ``audit_warn`` kann genutzt
werden, um angepasste Aktionen f?r eine Vielzahl von audit-bezogenen
Ereignissen auszuf?hren, einschliesslich der sauberen Beendigung von
Audit-Pfaden, wenn diese geschlossen werden. Zum Beispiel kann man die
folgenden Zeilen in das ``audit_warn``-Skript aufnehmen, um Audit-Pfade
beim Beenden zu komprimieren:

.. code:: programlisting

    #
    # Compress audit trail files on close.
    #
    if [ "$1" = closefile ]; then
            gzip -9 $2
    fi

Andere Archivierungsaktivit?ten k?nnen das Kopieren zu einem zentralen
Server, die L?schung der alten Pfad-Dateien oder die Reduzierung des
alten Audit-Pfades durch Entfernung nicht ben?tigter Datens?tze
einschliessen. Das Skript wird nur dann ausgef?hrt, wenn die
Audit-Pfad-Dateien sauber beendet wurden, daher wird es nicht auf Pfaden
laufen, welche durch ein unsauberes Herunterfahren des Systems nicht
beendet wurden.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+-------------------------------+-------------------------------+
| `Zur?ck <audit-config.html>`__?      | `Nach oben <audit.html>`__    | ?\ `Weiter <disks.html>`__    |
+--------------------------------------+-------------------------------+-------------------------------+
| 18.4. Die Konfiguration des Audit?   | `Zum Anfang <index.html>`__   | ?Kapitel 19. Speichermedien   |
+--------------------------------------+-------------------------------+-------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
