===================
4.3. Zugriffsrechte
===================

.. raw:: html

   <div class="navheader">

4.3. Zugriffsrechte
`Zur?ck <consoles.html>`__?
Kapitel 4. Grundlagen des UNIX Betriebssystems
?\ `Weiter <dirstructure.html>`__

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

4.3. Zugriffsrechte
-------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD, das ein direkter Abk?mmling von BSD UNIX? ist, st?tzt sich auf
mehrere Grundkonzepte von UNIX? Systemen. Das erste und ausgepr?gteste:
FreeBSD ist ein Mehrbenutzer-Betriebssystem. Das System erm?glicht, dass
mehrere Benutzer gleichzeitig an v?llig verschiedenen und unabh?ngigen
Aufgaben arbeiten k?nnen. Es ist verantwortlich f?r eine gerechte Auf-
und Zuteilung von Nachfragen nach Hardware- und Peripherieger?ten,
Speicher und CPU-Zeit unter den Benutzern.

Da das System mehrere Benutzer unterst?tzt, hat alles, was das System
verwaltet, einen Satz von Rechten, die bestimmen, wer die jeweilige
Ressource lesen, schreiben oder ausf?hren darf. Diese Zugriffsrechte
stehen in drei Achtergruppen, die in drei Teile unterteilt sind: einen
f?r den Besitzer der Datei, einen f?r die Gruppe, zu der die Datei
geh?rt und einen f?r alle anderen. Die numerische Darstellung sieht wie
folgt aus:

.. raw:: html

   <div class="informaltable">

+--------+----------------------------------------------+-----------------------------+
| Wert   | Zugriffsrechte                               | Auflistung im Verzeichnis   |
+========+==============================================+=============================+
| 0      | Kein Lesen, Kein Schreiben, Kein Ausf?hren   | ``---``                     |
+--------+----------------------------------------------+-----------------------------+
| 1      | Kein Lesen, Kein Schreiben, Ausf?hren        | ``--x``                     |
+--------+----------------------------------------------+-----------------------------+
| 2      | Kein Lesen, Schreiben, Kein Ausf?hren        | ``-w-``                     |
+--------+----------------------------------------------+-----------------------------+
| 3      | Kein Lesen, Schreiben, Ausf?hren             | ``-wx``                     |
+--------+----------------------------------------------+-----------------------------+
| 4      | Lesen, Kein Schreiben, Kein Ausf?hren        | ``r--``                     |
+--------+----------------------------------------------+-----------------------------+
| 5      | Lesen, Kein Schreiben, Ausf?hren             | ``r-x``                     |
+--------+----------------------------------------------+-----------------------------+
| 6      | Lesen, Schreiben, Kein Ausf?hren             | ``rw-``                     |
+--------+----------------------------------------------+-----------------------------+
| 7      | Lesen, Schreiben, Ausf?hren                  | ``rwx``                     |
+--------+----------------------------------------------+-----------------------------+

.. raw:: html

   </div>

Sie k?nnen ``-l`` auf der Kommandozeile von
`ls(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ls&sektion=1>`__
angeben, um eine ausf?hrliche Verzeichnisauflistung zu sehen, die in
einer Spalte die Zugriffsrechte f?r den Besitzer, die Gruppe und alle
anderen enth?lt. Die Ausgabe von ``ls -l`` k?nnte wie folgt aussehen:

.. code:: screen

    % ls -l
    total 530
    -rw-r--r--  1 root  wheel     512 Sep  5 12:31 myfile
    -rw-r--r--  1 root  wheel     512 Sep  5 12:31 otherfile
    -rw-r--r--  1 root  wheel    7680 Sep  5 12:31 email.txt
    ...

Die erste Spalte der Ausgabe enth?lt die Zugriffsrechte:

.. code:: screen

    -rw-r--r--

Das erste Zeichen von links ist ein Symbol, welches angibt, ob es sich
um eine normale Datei, ein Verzeichnis, ein zeichenorientiertes Ger?t,
ein Socket oder irgendeine andere Pseudo-Datei handelt. In diesem
Beispiel zeigt ``-`` eine normale Datei an. Die n?chsten drei Zeichen,
dargestellt als ``rw-``, ergeben die Rechte f?r den Datei-Besitzer. Die
drei Zeichen danach ``r--`` die Rechte der Gruppe, zu der die Datei
geh?rt. Die letzten drei Zeichen, ``r--``, geben die Rechte f?r den Rest
der Welt an. Ein Minus bedeutet, dass das Recht nicht gegeben ist. In
diesem Fall sind die Zugriffsrechte also: der Eigent?mer kann die Datei
lesen und schreiben, die Gruppe kann lesen und alle anderen k?nnen auch
nur lesen. Entsprechend obiger Tabelle w?ren die Zugriffsrechte f?r
diese Datei ``644``, worin jede Ziffer die drei Teile der Zugriffsrechte
dieser Datei verk?rpert.

Das ist alles sch?n und gut, aber wie kontrolliert das System die Rechte
von Hardware-Ger?ten? FreeBSD behandelt die meisten Hardware-Ger?te als
Dateien, welche Programme ?ffnen, lesen und mit Daten beschreiben k?nnen
wie alle anderen Dateien auch. Diese Spezial-Dateien sind im Verzeichnis
``/dev`` gespeichert.

Verzeichnisse werden ebenfalls wie Dateien behandelt. Sie haben Lese-,
Schreib- und Ausf?hr-Rechte. Das Ausf?hrungs-Bit hat eine etwas andere
Bedeutung f?r ein Verzeichnis als f?r eine Datei. Die Ausf?hrbarkeit
eines Verzeichnisses bedeutet, dass in das Verzeichnis zum Beispiel mit
``cd`` gewechselt werden kann. Das bedeutet auch, dass in dem
Verzeichnis auf Dateien, deren Namen bekannt sind, zugegriffen werden
kann, vorausgesetzt die Zugriffsrechte der Dateien lassen dies zu.

Das Leserecht auf einem Verzeichnis erlaubt es, sich den Inhalt des
Verzeichnisses anzeigen zu lassen. Um eine Datei mit bekanntem Namen in
einem Verzeichnis zu l?schen, m?ssen auf dem Verzeichnis Schreib- *und*
Ausf?hr-Rechte gesetzt sein.

Es gibt noch mehr Rechte, aber die werden vor allem in speziellen
Umst?nden benutzt, wie zum Beispiel bei SetUID-Binaries und
Verzeichnissen mit gesetztem Sticky-Bit. Mehr ?ber Zugriffsrechte von
Dateien und wie sie gesetzt werden, finden Sie in
`chmod(1) <http://www.FreeBSD.org/cgi/man.cgi?query=chmod&sektion=1>`__.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.3.1. Symbolische Zugriffsrechte
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div>

Beigesteuert von Tom Rhodes.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Zugriffsrechte lassen sich auch ?ber Symbole anstelle von oktalen
Werten festlegen. Symbolische Zugriffsrechte werden in der Reihenfolge
*``Wer``*, *``Aktion``* und *``Berechtigung``* angegeben. Die folgenden
Symbole stehen zur Auswahl:

.. raw:: html

   <div class="informaltable">

+----------------------+----------+----------------------------------+
| Option               | Symbol   | Bedeutung                        |
+======================+==========+==================================+
| *``Wer``*            | u        | Benutzer (*user*)                |
+----------------------+----------+----------------------------------+
| *``Wer``*            | g        | Gruppe (*group*)                 |
+----------------------+----------+----------------------------------+
| *``Wer``*            | o        | Andere (*other*)                 |
+----------------------+----------+----------------------------------+
| *``Wer``*            | a        | Alle                             |
+----------------------+----------+----------------------------------+
| *``Aktion``*         | +        | Berechtigungen hinzuf?gen        |
+----------------------+----------+----------------------------------+
| *``Aktion``*         | -        | Berechtigungen entziehen         |
+----------------------+----------+----------------------------------+
| *``Aktion``*         | =        | Berechtigungen explizit setzen   |
+----------------------+----------+----------------------------------+
| *``Berechtigung``*   | r        | lesen (*read*)                   |
+----------------------+----------+----------------------------------+
| *``Berechtigung``*   | w        | schreiben (*write*)              |
+----------------------+----------+----------------------------------+
| *``Berechtigung``*   | x        | ausf?hren (*execute*)            |
+----------------------+----------+----------------------------------+
| *``Berechtigung``*   | t        | Sticky-Bit                       |
+----------------------+----------+----------------------------------+
| *``Berechtigung``*   | s        | Set-UID oder Set-GID             |
+----------------------+----------+----------------------------------+

.. raw:: html

   </div>

Symbolische Zugriffsrechte werden wie die numerischen mit dem Kommando
`chmod(1) <http://www.FreeBSD.org/cgi/man.cgi?query=chmod&sektion=1>`__
vergeben. Wenn Sie beispielsweise allen anderen Benutzern den Zugriff
auf die Datei *``FILE``* verbieten wollen, benutzen Sie den
nachstehenden Befehl:

.. code:: screen

    % chmod go= FILE

Wenn Sie mehr als eine ?nderung der Rechte einer Datei vornehmen wollen,
k?nnen Sie eine durch Kommata getrennte Liste der Rechte angeben. Das
folgende Beispiel entzieht der Gruppe und der Welt (den anderen) die
Schreibberechtigung auf die Datei *``FILE``* und f?gt dann f?r alle
Ausf?hrungsrechte hinzu:

.. code:: screen

    % chmod go-w,a+x FILE

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

4.3.2. FreeBSD Datei-Flags
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div>

Beigetragen von Tom Rhodes.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Zus?tzlich zu den vorhin diskutierten Zugriffsrechten unterst?tzt
FreeBSD auch die sogenannten „Datei-Flags“. Diese erh?hen die Sicherheit
Ihres Systems, indem sie eine verbesserte Kontrolle von Dateien
erlauben. Verzeichnisse werden allerdings nicht unterst?tzt.

Diese verbesserte Sicherheit f?hrt dazu, dass manche Dateien nicht
einmal von ``root`` gel?scht oder bearbeitet werden k?nnen.

Datei-Flags k?nnen ?ber
`chflags(1) <http://www.FreeBSD.org/cgi/man.cgi?query=chflags&sektion=1>`__
gesetzt oder gel?scht werden. Um beispielsweise die Datei ``file1`` mit
dem „unl?schbar“-Flag zu sichern, geben Sie folgenden Befehl ein:

.. code:: screen

    # chflags sunlink file1

Um dieses Flag wieder zu l?schen, geben Sie den Befehl erneut ein.
Allerdings setzen Sie ein „no“ vor ``sunlink``:

.. code:: screen

    # chflags nosunlink file1

Um die Flags dieser Datei anzuzeigen, verwenden Sie
`ls(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ls&sektion=1>`__
zusammen mit der Option ``-lo``:

.. code:: screen

    # ls -lo file1

Dadurch erhalten Sie eine Ausgabe ?hnlich der folgenden:

.. code:: programlisting

    -rw-r--r--  1 trhodes  trhodes  sunlnk 0 Mar  1 05:54 file1

Viele Flags k?nnen nur von ``root`` gesetzt oder gel?scht werden. Andere
wiederum k?nnen auch vom Eigent?mer der Datei gesetzt werden. Weitere
Informationen zu Datei-Flags finden sich in den Manualpages
`chflags(1) <http://www.FreeBSD.org/cgi/man.cgi?query=chflags&sektion=1>`__
und
`chflags(2) <http://www.FreeBSD.org/cgi/man.cgi?query=chflags&sektion=2>`__.

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

4.3.3. Die Berechtigungen ``setuid``, ``setgid``, und ``sticky``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div>

Beigetragen von Tom Rhodes.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Anders als die Berechtigungen, die bereits angesprochen wurden,
existieren drei weitere Einstellungen, ?ber die alle Administratoren
Bescheid wissen sollten. Dies sind die Berechtigungen ``setuid``,
``setgid`` und ``sticky``.

Diese Einstellungen sind wichtig f?r manche UNIX?-Operationen, da sie
Funktionalit?ten zur Verf?gung stellen, die normalerweise nicht an
gew?hnliche Anwender vergeben wird. Um diese zu verstehen, muss der
Unterschied zwischen der realen und der effektiven Benutzer-ID erw?hnt
werden.

Die reale Benutzer-ID ist die UID, welche den Prozess besitzt oder
gestartet hat. Die effektive UID ist diejenige, als die der Prozess
l?uft. Beispielsweise wird
`passwd(1) <http://www.FreeBSD.org/cgi/man.cgi?query=passwd&sektion=1>`__
mit der realen ID des Benutzers ausgef?hrt, der sein Passwort ?ndert. Um
jedoch die Passwortdatenbank zu bearbeiten, wird es effektiv als
``root``-Benutzer ausgef?hrt. Das erm?glicht es normalen Benutzern, ihr
Passwort zu ?ndern, ohne einen Permission Denied-Fehler angezeigt zu
bekommen.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Die ``nosuid``
`mount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount&sektion=8>`__-Option
wird daf?r sorgen, dass diese Anwendungen stillschweigend scheitern.
Genauer gesagt, sie werden nicht ausgef?hrt und der Anwender wird
dar?ber auch nicht informiert. Auf diese Option kann man sich nicht
vollst?ndig verlassen, da ein ``nosuid``-Wrapper in der Lage w?re, dies
zu umgehen, wie in der
`mount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount&sektion=8>`__
Manualpage zu lesen ist.

.. raw:: html

   </div>

Die setuid-Berechtigung kann durch das Voranstellen bei einer
Berechtigungsgruppe mit der Nummer Vier (4) gesetzt werden, wie im
folgenden Beispiel gezeigt wird:

.. code:: screen

    # chmod 4755 suidexample.sh

Die Berechtigungen auf der ``suidexample.sh``-Datei sollten jetzt wie
folgt aussehen:

.. code:: programlisting

    -rwsr-xr-x   1 trhodes  trhodes    63 Aug 29 06:36 suidexample.sh

In dem Beispiel sollte auffallen, dass ein ``s`` jetzt Teil der
Berechtigungen des Dateibesitzers geworden ist, welches das
Ausf?hren-Bit ersetzt. Dies erm?glicht es Werkzeugen mit erh?hten
Berechtigungen zu laufen, wie z.B. ``passwd``.

Um dies in Echtzeit zu beobachten, ?ffnen Sie zwei Terminals. Starten
Sie auf einem den ``passwd``-Prozess als normaler Benutzer. W?hrend es
auf die Passworteingabe wartet, ?berpr?fen Sie die Prozesstabelle und
sehen Sie sich die Informationen des ``passwd``-Kommandos an.

Im Terminal A:

.. code:: screen

    Changing local password for trhodes
    Old Password:

Im Terminal B:

.. code:: screen

    # ps aux | grep passwd

.. code:: screen

    trhodes  5232  0.0  0.2  3420  1608   0  R+    2:10AM   0:00.00 grep passwd
         root     5211  0.0  0.2  3620  1724   2  I+    2:09AM   0:00.01 passwd

Wie oben erw?hnt, wird ``passwd`` von einem normalen Benutzer
ausgef?hrt, benutzt aber die effektive UID von ``root``.

Die ``setgid``-Berechtigung f?hrt die gleiche Aktion wie die
``setuid``-Berechtigung durch, allerdings ver?ndert sie die
Gruppenberechtigungen. Wenn eine Anwendung oder ein Werkzeug mit dieser
Berechtigung ausgef?hrt wird, erh?lt es die Berechtigungen basierend auf
der Gruppe, welche die Datei besitzt und nicht die des Benutzers, der
den Prozess gestartet hat.

Um die ``setgid``-Berechtigung auf einer Datei zu setzen, geben Sie dem
``chmod``-Befehl eine f?hrende Zwei (2) mit, wie im folgenden gezeigt:

.. code:: screen

    # chmod 2755 sgidexample.sh

Die neue Einstellung kann wie zuvor betrachtet werden. Beachten Sie,
dass das ``s`` sich jetzt in dem Feld befindet, das f?r die
Berechtigungen der Gruppe bestimmt ist:

.. code:: screen

    -rwxr-sr-x   1 trhodes  trhodes    44 Aug 31 01:49 sgidexample.sh

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Obwohl es sich bei dem in diesen Beispielen gezeigten Shellskript um
eine ausf?hrbare Datei handelt, wird es nicht mit einer anderen EUID
oder effektiven Benutzer-ID ausgef?hrt. Das ist so, weil Shellskripte
keinen Zugriff auf
`setuid(2) <http://www.FreeBSD.org/cgi/man.cgi?query=setuid&sektion=2>`__-Systemaufrufe
erhalten.

.. raw:: html

   </div>

Diese beiden ersten angesprochenen Spezialberechtigungen (die ``setuid``
und ``setgid`` Berechtigungs-Bits) k?nnen die Systemsicherheit
verringern, da sie erh?hte Rechte erm?glichen. Es gibt noch ein drittes
Berechtigungs-Bit, das die Sicherheit eines Systems erh?hen kann: das
``sticky bit``.

Das ``sticky bit`` erlaubt, wenn es auf ein Verzeichnis angewendet wird,
nur dem Besitzer der Datei diese Dateien auch zu l?schen. Dieses Recht
ist n?tzlich, um die L?schung von Dateien in ?ffentlichen Verzeichnissen
durch Benutzer, denen diese Dateien nicht geh?ren, zu verhindern, wie
z.B. in ``/tmp``. Um diese Berechtigung anzuwenden, stellen Sie der
Berechtigung eine Eins (1) voran, beispielsweise so:

.. code:: screen

    # chmod 1777 /tmp

Den Effekt k?nnen Sie sich ansehen, indem Sie das Kommando ``ls``
ausf?hren:

.. code:: screen

    # ls -al / | grep tmp

.. code:: screen

    drwxrwxrwt  10 root  wheel         512 Aug 31 01:49 tmp

Das ``sticky bit`` kann anhand des ``t`` ganz am Ende der Berechtigungen
abgelesen werden.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------+-------------------------------+-------------------------------------+
| `Zur?ck <consoles.html>`__?              | `Nach oben <basics.html>`__   | ?\ `Weiter <dirstructure.html>`__   |
+------------------------------------------+-------------------------------+-------------------------------------+
| 4.2. Virtuelle Konsolen und Terminals?   | `Zum Anfang <index.html>`__   | ?4.4. Verzeichnis-Strukturen        |
+------------------------------------------+-------------------------------+-------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
