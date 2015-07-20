===========================
15.3. Absichern von FreeBSD
===========================

.. raw:: html

   <div class="navheader">

15.3. Absichern von FreeBSD
`Zur?ck <security-intro.html>`__?
Kapitel 15. Sicherheit
?\ `Weiter <crypt.html>`__

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

15.3. Absichern von FreeBSD
---------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Kommandos und Protokolle:
~~~~~~~~~~~~~~~~~~~~~~~~~

In diesem Abschnitt werden Anwendungen fett gekennzeichnet, spezifische
Kommandos werden in einer ``Fixschrift`` dargestellt und Protokolle
verwenden die normale Schriftart. Diese typographische Konvention hilft,
Begriffe wie ssh zu unterscheiden, die sowohl Protokoll als auch
Kommando sein k?nnen.

.. raw:: html

   </div>

Die folgenden Abschnitte behandeln die im `letzten
Abschnitt <security-intro.html>`__ erw?hnten Methoden Ihr FreeBSD-System
zu sichern.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

15.3.1. Absichern von ``root`` und Accounts
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Zuallererst, k?mmern Sie sich nicht um die Absicherung von Accounts,
wenn Sie ``root`` noch nicht abgesichert haben. Auf den meisten Systemen
ist ``root`` ein Passwort zugewiesen. Sie sollten *immer* davon
ausgehen, dass dieses Passwort kompromittiert ist. Das hei?t nicht, dass
Sie das Passwort entfernen sollten, da es meist f?r den Konsolenzugriff
notwendig ist. Vielmehr hei?t es, dass Sie das Passwort nicht au?erhalb
der Konsole, auch nicht zusammen mit
`su(1) <http://www.FreeBSD.org/cgi/man.cgi?query=su&sektion=1>`__,
verwenden sollten. Stellen Sie sicher, dass Ihre PTYs in ``ttys`` als
unsicher markiert sind und damit Anmeldungen von ``root`` mit ``telnet``
oder ``rlogin`` verboten sind. Wenn Sie andere Anwendungen wie SSH zum
Anmelden benutzen, vergewissern Sie sich, dass dort ebenfalls
Anmeldungen als ``root`` verboten sind. F?r SSH editieren Sie
``/etc/ssh/sshd_config`` und ?berpr?fen, dass ``PermitRootLogin`` auf
``no`` gesetzt ist. Beachten Sie jede Zugriffsmethode – Dienste wie FTP
werden oft vergessen. Nur an der Systemkonsole sollte ein direktes
Anmelden als ``root`` m?glich sein.

Nat?rlich m?ssen Sie als Systemadministrator ``root``-Zugriff erlangen
k?nnen. Dieser sollte aber durch zus?tzliche Passw?rter gesch?tzt sein.
Ein Weg, Zugang zu ``root`` zu erm?glichen, ist es, berechtigte
Mitarbeiter in ``/etc/group`` in die Gruppe ``wheel`` aufzunehmen. Die
Personen, die Mitglieder in der Gruppe ``wheel`` sind, k?nnen mit ``su``
zu ``root`` wechseln. Ihre Mitarbeiter sollten niemals die Gruppe
``wheel`` als prim?re Gruppe in ``/etc/passwd`` besitzen. Mitarbeiter
sollten der Gruppe ``staff`` angeh?ren und ?ber ``/etc/group`` in
``wheel`` aufgenommen werden. Es sollten auch nur die Mitarbeiter, die
wirklich ``root`` Zugriff ben?tigen in ``wheel`` aufgenommen werden. Mit
anderen Authentifizierungsmethoden m?ssen Sie niemanden in ``wheel``
aufnehmen. Wenn Sie z.B. Kerberos benutzen, wechseln Sie mit
`ksu(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ksu&sektion=1>`__ zu
``root`` und der Zugriff wird mit der Datei ``.k5login`` geregelt. Dies
ist vielleicht eine bessere L?sung, da es der ``wheel``-Mechanismus
einem Angreifer immer noch m?glich macht, den ``root``-Account zu
knacken, nachdem er einen Mitarbeiter-Account geknackt hat. Obwohl der
``wheel``-Mechanismus besser als gar nichts ist, ist er nicht unbedingt
die sicherste L?sung.

Um ein Konto komplett zu sperren, verwenden Sie den Befehl
`pw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pw&sektion=8>`__:

.. code:: screen

    #pw lock staff

Danach ist es diesem Benutzer nicht mehr m?glich (auch nicht mit
`ssh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh&sektion=1>`__),
sich anzumelden.

Eine weitere M?glichkeit, bestimmte Benutzer zu sperren, ist es, das
verschl?sselte Passwort durch das Zeichen „``*``“ zu ersetzen. Da ein
verschl?sseltes Passwort niemals diesem Zeichen entsprechen kann, kann
sich der betroffene Benutzer ebenfalls nicht mehr anmelden.
Beispielsweise m?sste dazu das Konto

.. code:: programlisting

    foobar:R9DT/Fa1/LV9U:1000:1000::0:0:Foo Bar:/home/foobar:/usr/local/bin/tcsh

wie folgt abge?ndert werden:

.. code:: programlisting

    foobar:*:1000:1000::0:0:Foo Bar:/home/foobar:/usr/local/bin/tcsh

Durch diese ?nderung wird der Benutzer ``foobar`` daran gehindert, sich
auf konventionellem Wege am System anzumelden. Diese Ma?nahmen greifen
allerdings nicht, wenn das betroffene System auch eine Anmeldung ?ber
Kerberos oder
`ssh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh&sektion=1>`__
erlaubt.

Diese Sicherheitsmechanismen setzen voraus, dass Sie sich von einer
restriktiven Maschine auf einer weniger restriktiven Maschine anmelden.
Wenn zum Beispiel auf Ihrem Hauptrechner alle m?glichen Arten von
Servern laufen, so sollten auf Ihrer Workstation keine Server laufen. Um
Ihre Workstation vern?nftig abzusichern, sollten auf Ihr so wenig Server
wie m?glich bis hin zu keinem Server laufen. Sie sollten zudem ?ber
einen Bildschirmschoner verf?gen, der mit einem Passwort gesichert ist.
Nat?rlich kann ein Angreifer, der physikalischen Zugang zu einer
Maschine hat, jede Art von Sicherheitsmechanismen umgehen. Dieses
Problem sollten Sie daher auch in Ihren ?berlegungen ber?cksichtigen.
Beachten Sie dabei aber, dass der Gro?teil der Einbr?che ?ber das
Netzwerk erfolgt und die Einbrecher keinen Zugang zu der Maschine
besitzen.

Mit Kerberos k?nnen Sie das Passwort eines Mitarbeiters an einer Stelle
?ndern und alle Maschinen, auf denen der Mitarbeiter einen Account hat,
beachten die ?nderung sofort. Wird der Account eines Mitarbeiters einmal
kompromittiert, so sollte die F?higkeit, das Passwort mit einem Schlag
auf allen Maschinen zu ?ndern, nicht untersch?tzt werden. Mit einzelnen
Passw?rtern wird es schwierig, das Passwort auf N Maschinen zu ?ndern.
Mit Kerberos k?nnen Sie auch Beschr?nkungen f?r Passw?rter festlegen:
Nicht nur das Ticket kann nach einiger Zeit ung?ltig werden, Sie k?nnen
auch festlegen, dass ein Benutzer nach einer bestimmten Zeit, z.B. nach
einem Monat, das Passwort wechseln muss.

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

15.3.2. Absichern von unter ``root`` laufenden Servern und SUID/SGID Programmen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Ein kluger Systemadministrator l?sst nur die Dienste, die er wirklich
braucht, laufen; nicht mehr und auch nicht weniger. Beachten Sie, dass
Server von Dritten die fehleranf?lligsten sind. Wenn Sie z.B. eine alte
Version von imapd oder popper laufen lassen, ist das so, als w?rden Sie
der ganzen Welt freien Zugang zu ``root`` geben. Lassen Sie keine Server
laufen, die Sie vorher nicht genau ?berpr?ft haben. Viele Server m?ssen
nicht unter ``root`` laufen, zum Beispiel k?nnen ntalk, comsat und
finger in speziellen *Sandk?sten* unter einem Benutzer laufen. Ein
Sandkasten ist keine perfekte L?sung, wenn Sie nicht eine Menge Arbeit
in die Konfiguration investieren, doch bew?hrt sich hier das Prinzip,
die Sicherheit in Schichten aufzubauen. Wenn es einem Angreifer gelingt,
in einen Server, der in einem Sandkasten l?uft, einzubrechen, dann muss
er immer noch aus dem Sandkasten selber ausbrechen. Je mehr Schichten
der Angreifer zu durchbrechen hat, desto kleiner sind seine Aussichten
auf Erfolg. In der Vergangenheit wurden praktisch in jedem Server, der
unter ``root`` l?uft, L?cken gefunden, die zu einem ``root`` Zugriff
f?hrten. Dies betrifft selbst die grundlegenden Systemdienste. Wenn Sie
eine Maschine betreiben, auf der man sich nur mit SSH anmelden kann,
dann stellen Sie die Dienste telnetd, rshd oder rlogind ab!

In der Voreinstellung laufen unter FreeBSD ntalkd, comsat und finger nun
in einem Sandkasten. Ein weiteres Programm, das in einem Sandkasten
laufen sollte, ist
`named(8) <http://www.FreeBSD.org/cgi/man.cgi?query=named&sektion=8>`__.
In ``/etc/defaults/rc.conf`` sind die notwendigen Argumente, um named in
einem Sandkasten laufen zu lassen, in kommentierter Form schon
enthalten. Abh?ngig davon, ob Sie ein neues System installieren oder ein
altes System aktualisieren, sind die hierf?r ben?tigten Benutzer noch
nicht installiert. Ein kluger Systemadministrator sollte immer nach
M?glichkeiten suchen, Server in einem Sandkasten laufen zu lassen.

Einige Server wie sendmail, popper, imapd und ftpd werden normalerweise
nicht in Sandk?sten betrieben. Zu einigen Servern gibt es Alternativen,
aber diese wollen Sie vielleicht wegen der zus?tzlich n?tigen Arbeit
nicht installieren (ein weiteres Beispiel f?r den Widerspruch zwischen
Sicherheit und Benutzerfreundlichkeit). In diesem Fall m?ssen Sie die
Server unter ``root`` laufen lassen und auf die eingebauten Mechanismen
vertrauen, Einbr?che zu entdecken.

Weitere potentielle L?cher, die zu einem ``root``-Zugriff f?hren k?nnen,
sind die auf dem System installierten SUID- und SGID-Programme. Die
meisten dieser Programme wie rlogin stehen in ``/bin``, ``/sbin``,
``/usr/bin``, oder ``/usr/sbin``. Obwohl nichts 100% sicher ist, k?nnen
Sie davon ausgehen, dass die SUID- und SGID-Programme des Basissystems
ausreichend sicher sind. Allerdings werden ab und an in diesen
Programmen L?cher gefunden. 1998 wurde in ``Xlib`` ein Loch gefunden,
das xterm, der normal mit SUID installiert wird, verwundbar machte. Es
ist besser auf der sicheren Seite zu sein, als sich sp?ter zu beklagen,
darum wird ein kluger Systemadministrator den Zugriff auf SUID-Programme
mit einer Gruppe, auf die nur Mitarbeiter zugreifen k?nnen, beschr?nken.
SUID-Programme, die niemand benutzt, sollten mit ``chmod 000``
deaktiviert werden. Zum Beispiel braucht ein Server ohne Bildschirm kein
xterm Programm. SGID-Programme sind vergleichbar gef?hrlich. Wenn ein
Einbrecher Zugriff auf SGID-\ ``kmem`` Programm erh?lt, kann er
vielleicht ``/dev/kmem`` und damit die verschl?sselte Passwortdatei
lesen. Dies kompromittiert unter Umst?nden jeden Account, der mit einem
Passwort gesch?tzt ist. Alternativ kann ein Einbrecher, der in die
Gruppe ``kmem`` eingebrochen ist, die Tastendr?cke auf PTYs verfolgen.
Dies schlie?t auch PTYs mit ein, auf denen sich ein Benutzer mit
sicheren Methoden anmeldet. Ein Einbrecher, der Zugriff auf die ``tty``
Gruppe hat, kann auf fast jeden Terminal anderer Benutzer schreiben.
Wenn der Benutzer einen Terminal-Emulator benutzt, der ?ber eine
Tastatur-Simulation verf?gt, k?nnte der Angreifer Daten generieren, die
den Terminal veranlassen, ein Kommando unter diesem Benutzer laufen zu
lassen.

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

15.3.3. Absichern von Accounts
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Accounts sind f?r gew?hnlich sehr schwierig abzusichern. W?hrend Sie
drakonische Beschr?nkungen f?r Ihre Mitarbeiter einrichten und deren
Passw?rter als ung?ltig markieren k?nnen, werden Sie das vielleicht bei
den normalen Accounts nicht durchsetzen. Wenn Sie ?ber ausreichend Macht
verf?gen, gelingt es Ihnen vielleicht doch, ansonsten m?ssen Sie diese
Accounts aufmerksam ?berwachen. Wegen der zus?tzlichen
Administrationsarbeit und der n?tigen technischen Unterst?tzung ist die
Verwendung von SSH und Kerberos mit normalen Accounts erschwert, obwohl
das nat?rlich sicherer als die Verwendung von verschl?sselten
Passw?rtern ist.

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

15.3.4. Absichern der Passwort-Datei
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Der einzig sichere Weg ist, so viele Accounts wie m?glich als ung?ltig
zu markieren und SSH oder Kerberos zu benutzen, um auf sie zuzugreifen.
Obwohl die Datei ``/etc/spwd.db``, die die verschl?sselten Passw?rter
enth?lt, nur von ``root`` gelesen werden kann, mag ein Angreifer
lesenden Zugriff auf diese Datei erlangen, ohne die F?higkeit sie auch
zu beschreiben.

Ihre ?berwachungsskripten sollten ?nderungen an der Passwort-Datei
melden (siehe `?berpr?fen der Integrit?t von
Dateien <securing-freebsd.html#security-integrity>`__ weiter unten).

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

15.3.5. Absichern des Kernels, der Ger?te und von Dateisystemen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn ein Angreifer ``root``-Zugriff erlangt, kann er so ziemlich alles
mit Ihrem System anstellen, doch sollten Sie es ihm nicht zu leicht
machen. Die meisten modernen Kernel haben zum Beispiel einen
Ger?tetreiber, der es erlaubt, Pakete abzuh?ren. Unter FreeBSD wird das
Ger?t ``bpf`` genannt. F?r gew?hnlich wird ein Angreifer versuchen,
dieses Ger?t zu nutzen, um Pakete abzuh?ren. Sie sollten ihm diese
Gelegenheit nicht geben und auf den meisten Systemen ist das Ger?t
``bpf`` nicht n?tig.

Auch wenn Sie ``bpf`` nicht verwenden, m?ssen Sie sich immer noch um
``/dev/mem`` und ``/dev/kmem`` sorgen. Au?erdem kann der Angreifer immer
noch auf die rohen Ger?te (*raw devices*) schreiben. Weiterhin gibt es
ein Programm zum Nachladen von Modulen in den Kernel:
`kldload(8) <http://www.FreeBSD.org/cgi/man.cgi?query=kldload&sektion=8>`__.
Ein unternehmungslustiger Angreifer kann dies benutzen, um sein eigenes
``bpf`` oder ein anderes zum Abh?ren geeignetes Ger?t in den laufenden
Kernel einzubringen. Um dieses Problem zu vermeiden, m?ssen Sie den
Kernel auf einem h?heren Sicherheitslevel laufen lassen, mindestens auf
securelevel 1.

Das Securelevel des Kernels kann auf verschiedene Wege gesetzt werden.
Der einfachste Weg ist das erh?hen des Securelevel des laufenden Kernels
durch ein ``sysctl`` der ``kern.securelevel`` Kernel Variablen:

.. code:: screen

    # sysctl kern.securelevel=1

Standardm?ssig bootet der FreeBSD Kernel mit einem Securelevel von -1.
Der Securelevel wird solange bei -1 bleiben, bis er entweder durch den
Administrator oder von
`init(8) <http://www.FreeBSD.org/cgi/man.cgi?query=init&sektion=8>`__
durch einen Eintrag im Startup Script ver?ndert wird. Der Securelevel
kann w?hrend des Systemstarts durch das Setzen der Variable
``kern_securelevel_enable`` auf ``YES`` und der Wert der Variable
``kern_securelevel`` auf den gew?nschten Securelevel in der
``/etc/rc.conf`` erh?ht werden.

Der Standard Securelevel von einem FreeBSD-System direkt nach dem Start
ist -1. Dies wird „insecure mode“ genannt, da zum Beispiel
unver?ndeliche Dateiflags abgeschaltet werden k?nnten, von allen Ger?ten
gelesen und auf alle geschrieben werden kann.

Sobald der Securelevel auf den Wert 1 oder h?her gesetzt ist, werden die
append-only und die unver?nderlichen Dateien gesch?tzt, die Flags k?nnen
nicht abgeschaltet werden und der Zugriff auf raw Devices ist verboten.
H?here Levels verbieten mehr Aktionen. F?r einen vollst?ndige Liste
aller Securelevels, lesen Sie bitte die
`security(7) <http://www.FreeBSD.org/cgi/man.cgi?query=security&sektion=7>`__
Manual Seite (oder die Manual Seite von
`init(8) <http://www.FreeBSD.org/cgi/man.cgi?query=init&sektion=8>`__
f?r ?ltere Releases als FreeBSD 7.0).

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Das Erh?hen des Securelevels auf 1 oder h?her kann einige Probleme mit
X11 verursachen (Zugriff auf ``/dev/io`` wird geblockt), ebenso die
Installation von FreeBSD aus den Quellen (der ``installworld`` Teil muss
zeitweilig die append-only und die unver?nderlichen Flags einiger
Dateien zur?cksetzen), und auch noch in einigen anderen F?llen. Manchmal
kann es, wie bei X11, durch das sehr fr?he Starten von
`xdm(1) <http://www.FreeBSD.org/cgi/man.cgi?query=xdm&sektion=1>`__ im
Boot Prozess m?glich sein, dies zu umgehen, wenn der Securelevel noch
niedrig genug ist. Workarounds wie dieser sind nicht f?r alle
Securelevels und f?r alle Einschr?nkungen, die sie schaffen, m?glich.
Ein bisschen Vorausplanung ist eine gute Idee. Das Verst?ndnis f?r die
Beschr?nkungen, die durch jedes Securelevel verursacht werden, ist
wichtig, da sie die einfache Benutzung des Systems verschlechtern. Es
vereinfacht auch die Wahl einer Standardeinstellung und sch?tzt vor
?berraschungen.

.. raw:: html

   </div>

Wenn das Securelevel des Kernel auf einen Wert von 1 oder h?her gesetzt
ist, kann es sinnvoll sein das ``schg`` Flag auf kritische Startdateien,
Verzeichnisse und Scripte (z.B. alles was l?uft bis zu dem Punkt auf dem
das Securelevel gesetzt ist) zu setzen. Dies k?nnte etwas ?bertrieben
sein, und auch das Upgrade des Systems ist sehr viel schwerer, wenn es
auf einem hohen Securelevel l?uft. Ein strengerer Kompromiss ist es, das
System auf einem h?heren Securelevel laufen zu lassen, aber keine
``schg`` Flags f?r alle Systemdateien und Verzeichnisse zu setzen. Eine
andere M?glichkeit ist es, einfach die Verzeichnisse ``/`` und ``/usr``
read-only zu mounten. Es sei darauf hingewiesen, dass Sie nicht vor
lauter ?berlegen das Wichtigste, n?mlich die Entdeckung eines
Eindringens, vergessen.

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

15.3.6. ?berpr?fen der Integrit?t von Dateien
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Sie k?nnen die Systemkonfiguration und die Dateien nur so weit sch?tzen,
wie es die Benutzbarkeit des Systems nicht einschr?nkt. Wenn Sie zum
Beispiel mit ``chflags`` die Option ``schg`` auf die meisten Dateien in
``/`` und ``/usr`` setzen, kann das Ihre Arbeit mehr behindern als
n?tzen. Die Ma?nahme sch?tzt zwar die Dateien, schlie?t aber auch eine
M?glichkeit, Ver?nderungen zu entdecken, aus. Die letzte Schicht des
Sicherheitsmodells – das Aufdecken von Einbr?chen – ist sicherlich die
wichtigste. Alle Sicherheitsma?nahmen sind nichts wert, oder wiegen Sie
in falscher Sicherheit, wenn Sie nicht in der Lage sind, einen m?glichen
Einbruch zu entdecken. Die H?lfte der Sicherheitsma?nahmen hat die
Aufgabe, einen Einbruch zu verlangsamen, um es zu erm?glichen, den
Einbrecher auf frischer Tat zu ertappen.

Der beste Weg, einen Einbruch zu entdecken, ist es, nach ver?nderten,
fehlenden oder unerwarteten Dateien zu suchen. Der wiederum beste Weg,
nach ver?nderten Dateien zu suchen, ist es, die Suche von einem anderen
(oft zentralen) besonders gesch?tzten System durchzuf?hren. Es ist
wichtig, dass Ihre Sicherheits?berpr?fungen vor einem Angreifer
verborgen bleiben und daher sind sie auf einem besonders gesch?tzten
System gut aufgehoben. Um dies optimal auszunutzen, m?ssen Sie dem
besonders gesch?tzten System Zugriffsrechte auf die zu sch?tzenden
Systeme geben. Sie k?nnen die Dateisysteme der zu sch?tzenden Systeme
schreibgesch?tzt f?r das besonders gesch?tzte System exportieren, oder
Sie k?nnen der besonders gesch?tzten Maschine SSH auf die anderen
Maschinen erlauben, indem Sie SSH-Schl?sselpaare installieren. Mit
Ausnahme des verursachten Netzwerkverkehrs ist die NFS-Methode die am
wenigsten sichtbare. Sie erlaubt es Ihnen, nahezu unentdeckt die
Dateisysteme der Clients zu beobachten. Wenn Ihr besonders gesch?tztes
System mit den Clients ?ber einen Switch verbunden ist, ist die
NFS-Methode oft das Mittel der Wahl. Wenn das besonders gesch?tzte
System allerdings mit einem Hub verbunden ist, oder der Zugriff ?ber
mehrere Router geschieht, ist die NFS-Methode aus der Netzwerksicht zu
unsicher. In einem solchen Fall ist SSH besser geeignet, auch wenn es
deutliche Spuren hinterl?sst.

Wenn das besonders gesch?tzte System lesenden Zugriff auf die Clients
hat, m?ssen Sie Skripten schreiben, die die ?berwachung durchf?hren.
Wenn Sie die NFS-Methode verwenden, k?nnen Sie dazu einfache
Systemwerkzeuge wie
`find(1) <http://www.FreeBSD.org/cgi/man.cgi?query=find&sektion=1>`__
und `md5(1) <http://www.FreeBSD.org/cgi/man.cgi?query=md5&sektion=1>`__
benutzen. Am besten berechnen Sie einmal am Tag MD5-Pr?fsummen der
Dateien, Konfigurationsdateien in ``/etc`` und ``/usr/local/etc``
sollten ?fter ?berpr?ft werden. Wenn Unstimmigkeiten zwischen den auf
der besonders gesch?tzten Maschine gehaltenen MD5-Pr?fsummen und den
ermittelten Pr?fsummen festgestellt werden, sollte Ihr System einen
Systemadministrator benachrichtigen, der den Unstimmigkeiten dann
nachgehen sollte. Ein gutes Skript ?berpr?ft das System auch auf
verd?chtige SUID-Programme sowie gel?schte oder neue Dateien in ``/``
und ``/usr``.

Wenn Sie SSH anstelle von NFS benutzen, wird das Erstellen der Skripten
schwieriger. Sie m?ssen die Skripten und die Programme wie ``find`` mit
``scp`` auf den Client kopieren. Damit machen Sie die ?berpr?fung f?r
einen Angreifer sichtbar. Au?erdem kann der SSH-Client auf dem
Zielsystem schon kompromittiert sein. Zusammenfassend kann der Einsatz
von SSH n?tig sein, wenn Sie ?ber ungesicherte Verbindungen arbeiten,
aber der Umgang mit dieser Methode ist auch sehr viel schwieriger.

Ein gutes Sicherheitsskript wird auch Dateien von Benutzern, die den
Zugriff auf ein System erm?glichen, wie ``.rhosts``, ``.shosts``,
``.ssh/authorized_keys`` usw., auf Ver?nderungen untersuchen, die ?ber
die M?glichkeiten einer ?berpr?fung mit ``MD5`` (die ja nur
Ver?nderungen erkennen kann) hinausgehen.

Wenn Sie ?ber gro?e Partitionen verf?gen, kann es zu lange dauern, jede
Datei zu ?berpr?fen. In diesem Fall sollten Sie beim Einh?ngen des
Dateisystems Optionen setzen, die das Ausf?hren von SUID-Programmen
verbieten.
`mount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount&sektion=8>`__
stellt dazu ``nosuid`` zur Verf?gung. Sie sollten diese Dateien aber
trotzdem mindestens einmal die Woche ?berpr?fen, da das Ziel dieser
Schicht das Aufdecken eines Einbruchs, auch wenn er nicht erfolgreich
war, ist.

Die Prozess?berwachung (siehe
`accton(8) <http://www.FreeBSD.org/cgi/man.cgi?query=accton&sektion=8>`__)
des Betriebssystems steht ein g?nstiges Werkzeug zur Verf?gung, dass
sich bei der Analyse eines Einbruchs als n?tzlich erweisen kann.
Insbesondere k?nnen Sie damit herausfinden, wie der Einbrecher in das
System eingedrungen ist, vorausgesetzt die Dateien der
Prozess?berwachung sind noch alle intakt.

Schlie?lich sollten die Sicherheitsskripten die Logdateien analysieren.
Dies sollte so sicher wie m?glich durchgef?hrt werden, n?tzlich ist das
Schreiben von Logdateien auf entfernte Systeme mit ``syslog``. Ein
Einbrecher wird versuchen, seine Spuren zu verwischen. Die Logdateien
sind wichtig f?r den Systemadministrator, da er aus ihnen den Zeitpunkt
und die Art des Einbruchs bestimmen kann. Eine M?glichkeit, die
Logdateien unver?ndert aufzuheben, ist es, die Systemkonsole auf einen
seriellen Port zu legen und die Informationen dort von einer gesicherten
Maschine auszulesen.

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

15.3.7. Paranoia
~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Es schadet nicht, ein bisschen paranoid zu sein. Grunds?tzlich darf ein
Systemadministrator jede Sicherheitsma?nahme treffen, die die
Bedienbarkeit des Systems nicht einschr?nkt. Er kann auch Ma?nahmen
treffen, die die Bedienbarkeit einschr?nken, wenn er diese vorher genau
durchdacht hat. Was noch wichtiger ist: Halten Sie sich nicht sklavisch
an dieses Dokument, sondern f?hren Sie eigene Ma?nahmen ein, um nicht
einem k?nftigen Angreifer, der auch Zugriff auf dieses Dokument hat,
alle Ihre Methoden zu verraten.

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

15.3.8. Denial-of-Service Angriffe
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dieser Abschnitt behandelt Denial-of-Service Angriffe (DoS). Ein
DoS-Angriff findet typischerweise auf der Paketebene statt. W?hrend Sie
nicht viel gegen moderne Angriffe mit falschen Paketen, die das Netzwerk
s?ttigen, ausrichten k?nnen, k?nnen Sie sehr wohl den Schaden begrenzen,
den solche Angriffe verursachen k?nnen und insbesondere einen kompletten
Serverausfall verhindern, indem Sie beispielsweise folgende Vorkehrungen
treffen:

.. raw:: html

   <div class="orderedlist">

#. Begrenzen von ``fork()`` Aufrufen.

#. Begrenzen von Sprungbrett-Angriffen (ICMP response Angriffen, ping zu
   Broadcast-Adressen usw.).

#. Kernel-Cache f?r Routen.

.. raw:: html

   </div>

Ein h?ufiger DoS-Angriff gegen forkende Server versucht den Server dazu
zu bringen, solange neue Prozesse zu starten, bis das System den ganzen
Speicher und alle Dateideskriptoren verbraucht hat, was dann zu einem
Ausfall des Servers f?hrt.
`inetd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=inetd&sektion=8>`__
besitzt einige Optionen, um diese Art von Angriffen zu begrenzen.
Beachten Sie bitte, dass es m?glich ist, einen Ausfall einer Maschine zu
verhindern, doch ist es generell nicht m?glich, den Ausfall eines
Dienstes bei dieser Art von Angriffen zu verhindern. Lesen Sie sich
bitte die Manualpages von inetd gut durch und achten Sie speziell auf
die Optionen ``-c``, ``-C`` und ``-R``. Angriffe mit gef?lschten
IP-Adressen umgehen ``-C``, so dass normalerweise eine Kombination der
Optionen benutzt werden muss. Manche Server, die nicht von inetd
gestartet werden, besitzen Optionen, um den Start ?ber ``fork()``
einzuschr?nken.

Sendmail besitzt die Option ``-OMaxDaemonChildren``, die besser als die
eingebauten Optionen zur Begrenzung der Systemauslastung funktioniert.
Sie sollten beim Start von sendmail ``MaxDaemonChildren`` so hoch
setzen, dass Sie die erwartete Auslastung gut abfangen k?nnen.
Allerdings sollten Sie den Wert nicht so hoch setzen, dass der Rechner
?ber seine eigenen F??e f?llt. Es ist auch klug, Sendmail im Queue-Modus
(``-ODeliveryMode=queued``) laufen zu lassen. Der D?mon
(``sendmail -bd``) sollte getrennt von den Queue-L?ufen
(``sendmail -q15m``) laufen. Wenn Sie trotzdem eine sofortige
Auslieferung der Post w?nschen, k?nnen Sie die Queue in einem geringeren
Intervall, etwa ``-q1m``, abarbeiten. Geben Sie f?r *dieses* Sendmail
aber einen vern?nftigen Wert f?r ``MaxDaemonChildren`` an, um Fehler zu
verhindern.

Syslogd kann direkt angegriffen werden. Daher empfehlen wir Ihnen
unbedingt die Option ``-s`` zu benutzen. Sollte das nicht m?glich sein,
benutzen Sie bitte ``-a``.

Vorsicht ist auch mit Diensten geboten, die automatisch eine
R?ckverbindung er?ffnen, wie der reverse-identd der TCP-Wrapper. Diese
Funktion der TCP-Wrapper sollten Sie normalerweise nicht benutzen.

Es empfiehlt sich sehr, interne Dienste vor externen Zugriffen durch
eine Firewall an der Grenze Ihres Netzwerks zu sch?tzen. Dahinter steckt
mehr die Idee, das Netzwerk vor ?berlastung durch Angriffe von au?en zu
sch?tzen, als interne Dienste vor einem ``root``-Zugriff aus dem Netz zu
sch?tzen. Konfigurieren Sie immer eine Firewall, die alle Zugriffe
blockiert, das hei?t blockieren Sie *alles* au?er den Ports A, B, C, D
und M-Z. Damit k?nnen Sie Zugriffe auf alle niedrigen Ports blockieren
und Zugriffe auf spezielle Dienste wie named, wenn Sie den prim?ren
Namensdienst f?r eine Zone anbieten, ntalkd oder sendmail erlauben. Wenn
Sie die Firewall so konfigurieren, das sie in der Voreinstellung alle
Zugriffe erlaubt, ist es sehr wahrscheinlich, dass Sie vergessen, eine
Reihe von Diensten zu blockieren bzw. einen internen Dienst einf?hren
und dann vergessen die Firewall zu aktualisieren. Sie k?nnen immer die
h?heren Portnummern ?ffnen, ohne die niedrigen Portnummern, die nur von
``root`` benutzt werden d?rfen, zu kompromittieren. Beachten Sie bitte
auch, dass es FreeBSD erlaubt, die Portnummern, die f?r dynamische
Verbindungen zur Verf?gung stehen, zu konfigurieren. Mit ``sysctl``
lassen sich verschiedene Bereiche der ``net.inet.ip.portrange``
Variablen setzen (eine Liste erhalten Sie mit
``sysctl -a | fgrep     portrange``). So k?nnen Sie zum Beispiel die
Portnummern 4000 bis 5000 f?r den normalen Bereich und die Nummern 49152
bis 65535 f?r den hohen Bereich vorsehen. Dies erleichtert Ihnen die
Konfiguration der Firewall, da Sie nun Zugriffe auf Ports unterhalb von
4000, mit Ausnahme der Dienste, die von au?en erreichbar sein sollen,
blockieren k?nnen.

Eine andere Form eines DoS-Angriffs nutzt einen Server als Sprungbrett,
der Server wird dabei so angegriffen, dass seine Antworten ihn selber,
das lokale Netzwerk oder einen anderen Server ?berlasten. Der am
h?ufigsten verwendete Angriff dieser Art ist der *ICMP ping broadcast
Angriff*. Der Angreifer f?lscht dazu ping-Pakete, die zu der
Broadcast-Adresse Ihres LANs gesendet werden, indem er darin als
Quelladresse die Adresse des Opfers einsetzt. Wenn die Router an der
Grenze Ihres Netzwerks ping-Pakete auf Broadcast-Adressen nicht
abwehren, wird Ihr LAN gen?gend Netzwerkverkehr generieren, um das Ziel
des Angriffs zu ?berlasten. Dies kann besonders effektiv sein, wenn der
Angreifer diese Methode mit mehreren Dutzend Broadcast-Adressen ?ber
mehrere Netzwerke einsetzt. Es wurden schon Broadcast-Angriffe mit ?ber
120?Megabit pro Sekunde gemessen. Ein zweiter Sprungbrett-Angriff wird
gegen das Fehlerbehandlungssystem von ICMP eingesetzt. Indem ein
Angreifer Pakete konstruiert, die eine ICMP-Fehlermeldung hervorrufen,
kann er das einkommende Netzwerk des Servers s?ttigen und diesen
wiederum veranlassen sein ausgehendes Netzwerk mit ICMP-Antworten zu
s?ttigen. Diese Art des Angriffs kann den kompletten Speicher des
Servers aufbrauchen und damit den Server stilllegen, insbesondere wenn
der Server nicht in der Lage ist, die generierten ICMP-Antworten schnell
genug abzuf?hren. Verwenden Sie die sysctl-Variable
``net.inet.icmp.icmplim``, um die Auswirkungen solcher Angriffe zu
begrenzen. Die letzte weit verbreitete Form von Sprungbrett-Angriffen
verwendet interne inetd-Dienste wie den UDP echo-Dienst. Der Angreifer
f?lscht dazu einfach ein UDP-Paket, indem er als Quellport den echo-Port
von Server A und als Zielport den echo-Port von Server B angibt, wobei
beide Server in Ihrem LAN stehen. Die beiden Server werden nun dieses
Paket zwischen sich hin und her schicken. Der Angreifer kann die beiden
Server und das LAN einfach damit ?berlasten, dass er mehrere Pakete
dieser Art generiert. ?hnliche Probleme gibt es mit dem internen
chargen-Port, daher sollten Sie die internen inetd-Testdienste
abstellen.

Gef?lschte IP-Pakete k?nnen dazu benutzt werden, den Kernel-Cache f?r
Routen zu ?berlasten. Schauen Sie sich bitte die ``sysctl``-Parameter
``net.inet.ip.rtexpire``, ``rtminexpire`` und ``rtmaxcache`` an. Ein
Angriff der gef?lschte Pakete mit zuf?lligen Quelladressen einsetzt,
bewirkt, dass der Kernel eine Route im Route-Cache anlegt, die Sie sich
mit ``netstat -rna | fgrep W3`` ansehen k?nnen. Diese Routen verfallen
f?r gew?hnlich nach 1600 Sekunden. Wenn der Kernel feststellt, dass die
Routingtabelle im Cache zu gro? geworden ist, wird er dynamisch den Wert
von ``rtexpire`` verringern. Dieser Wert wird aber nie kleiner werden
als ``rtminexpire``. Daraus ergeben sich zwei Probleme:

.. raw:: html

   <div class="orderedlist">

#. Der Kernel reagiert nicht schnell genug, wenn ein Server mit einer
   niedrigen Grundlast pl?tzlich angegriffen wird.

#. ``rtminexpire`` ist nicht klein genug, um einen anhaltenden Angriff
   zu ?berstehen.

.. raw:: html

   </div>

Wenn Ihre Server ?ber eine T3 oder eine noch schnellere Leitung mit dem
Internet verbunden sind, ist es klug, mit
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
die Werte f?r ``rtexpire`` und ``rtminexpire`` h?ndisch zu setzen.
Setzen Sie bitte keinen der Werte auf Null, au?er Sie wollen die
Maschine zum Erliegen bringen. Ein Wert von 2?Sekunden f?r beide
Parameter sollte ausreichen, um die Routingtabelle vor einem Angriff zu
sch?tzen.

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

15.3.9. Anmerkungen zum Zugriff mit Kerberos und SSH
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Es gibt ein paar Punkte, die Sie beachten sollten, wenn Sie Kerberos
oder SSH einsetzen wollen. Kerberos?5 ist ein ausgezeichnetes
Authentifizierungsprotokoll. Leider gibt es Fehler in den f?r Kerberos
angepassten Versionen von telnet und rlogin, die sie ungeeignet f?r den
Umgang mit bin?ren Datenstr?men machen. Weiterhin verschl?sselt Kerberos
Ihre Sitzung nicht, wenn Sie nicht die ``-x`` Option verwenden, mit SSH
wird dagegen alles verschl?sselt.

Ein Problem mit SSH sind Weiterleitungen von Verbindungen. Wenn Sie von
einer sicheren Maschine, auf der sich Ihre Schl?ssel befinden, eine
Verbindung zu einer ungesicherten Maschine aufmachen, wird f?r die Dauer
der Sitzung ein Port f?r Weiterleitungen ge?ffnet. Ein Angreifer, der
auf der unsicheren Maschine Zugang zu ``root`` hat, kann diesen Port
benutzen, um Zugriff auf andere Maschinen zu erlangen, die mit Ihren
Schl?sseln zug?nglich sind.

Wir empfehlen Ihnen, f?r die Logins Ihrer Mitarbeiter immer SSH zusammen
mit Kerberos einzusetzen. Damit reduzieren Sie die Abh?ngigkeit von
potentiell gef?hrdeten Schl?sseln und sch?tzen gleichzeitig die
Passw?rter mit Kerberos. SSH-Schl?sselpaare sollten nur f?r
automatisierte Aufgaben von einem besonders gesicherten Server
eingesetzt werden (Kerberos kann f?r diese Art von Aufgaben nicht
eingesetzt werden). Weiterhin empfehlen wir Ihnen, das Weiterreichen von
Schl?sseln in der SSH-Konfiguration abzustellen bzw. die
``from=IP/DOMAIN`` Option in ``authorized_keys`` zu verwenden, die den
Schl?ssel nur von bestimmten Maschinen aus nutzbar macht.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------+---------------------------------+----------------------------------------+
| `Zur?ck <security-intro.html>`__?   | `Nach oben <security.html>`__   | ?\ `Weiter <crypt.html>`__             |
+-------------------------------------+---------------------------------+----------------------------------------+
| 15.2. Einf?hrung?                   | `Zum Anfang <index.html>`__     | ?15.4. DES, Blowfish, MD5, und Crypt   |
+-------------------------------------+---------------------------------+----------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
