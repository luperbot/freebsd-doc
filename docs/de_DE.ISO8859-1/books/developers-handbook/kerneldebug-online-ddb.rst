=======================================
10.4. Online-Kernel-Fehlersuche mit DDB
=======================================

.. raw:: html

   <div class="navheader">

10.4. Online-Kernel-Fehlersuche mit DDB
`Zur?ck <kerneldebug-ddd.html>`__?
Kapitel 10. Kernel-Fehlersuche
?\ `Weiter <kerneldebug-online-gdb.html>`__

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

10.4. Online-Kernel-Fehlersuche mit DDB
---------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

W?hrend ``kgdb`` als Offline-Debugger eine Benutzerschnittstelle auf
h?chster Ebene bietet, gibt es einige Dinge, die es nicht kann. Die
wichtigsten sind das Setzen von Breakpoints und das Abarbeiten des
Kernel-Codes in Einzelschritten (Single-Stepping).

Falls Sie eine systemnahe Fehlersuche an Ihrem Kernel vorhaben, steht
Ihnen ein Online-Debugger mit dem Namen DDB zur Verf?gung. Er erlaubt
Ihnen das Setzen von Breakpoints, die Abarbeitung von Kernel-Funktionen
in Einzelschritten, das Untersuchen und Ver?ndern von Kernel-Variablen
usw. Jedoch hat er keinen Zugriff auf Kernel-Quelldateien, sondern kann
nur, im Gegensatz zu ``gdb``, welches auf die ganzen Informationen zur
Fehlersuche zur?ckgreifen kann, auf globale und statische Symbole
zugreifen.

Um DDB in Ihren Kernel einzubinden, f?gen Sie die Optionen

.. code:: programlisting

    options KDB

.. code:: programlisting

    options DDB

Ihrer Konfigurationsdatei hinzu und bauen Sie den Kernel neu. (Details
zur Konfiguration des FreeBSD-Kernels finden Sie im
`FreeBSD-Handbuch <../../../../doc/de_DE.ISO8859-1/books/handbook/index.html>`__).

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Falls Sie eine ?ltere Version des Boot-Blocks haben, k?nnte es sein,
dass Ihre Symbole zur Fehlersuche noch nicht einmal geladen werden.
Aktualisieren Sie den Boot-Block; aktuelle Versionen laden die
DDB-Symbole automatisch.

.. raw:: html

   </div>

Sobald Ihr Kernel mit DDB startet, gibt es mehrere Wege, um in DDB zu
gelangen. Der erste und fr?heste Weg ist, das Boot-Flag ``-d`` gleich an
der Boot-Eingabeaufforderung einzugeben. Der Kernel startet dann in den
Debug-Modus und betritt DDB noch vor jedweder Ger?tesuche. Somit k?nnen
Sie Funktionen zur Ger?tesuche/-bereitstellung auf Fehler untersuchen.
FreeBSD-CURRENT-Benutzer m?ssen die sechste Option im Boot-Men?
ausw?hlen, um an eine Eingabeaufforderung zu gelangen.

Das zweite Szenario ist der Gang in den Debugger, sobald das System
schon gestartet ist. Es gibt zwei einfache Wege dies zu erreichen. Falls
Sie von der Eingabeaufforderung aus in den Debugger gelangen m?chten,
geben Sie einfach folgenden Befehl ab:

.. code:: screen

    # sysctl debug.kdb.enter=1

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Um eine schnelle Panic zu erzwingen, geben Sie das folgende Kommando
ein:

.. code:: screen

    # sysctl debug.kdb.panic=1

.. raw:: html

   </div>

Anderenfalls k?nnen Sie ein Tastenk?rzel auf der Tastatur benutzen, wenn
Sie an der Systemkonsole sind. Die Voreinstellung f?r die
break-to-debugger-Sequenz ist **Ctrl**+**Alt**+**ESC**. In syscons kann
diese Sequenz auf eine andere Tastenkombination gelegt werden (remap)
und manche der verf?gbaren Tastaturlayouts tun dies, stellen Sie also
sicher, dass Sie die richtige Sequenz kennen, die benutzt werden soll.
F?r serielle Konsolen ist eine Option vorhanden, die die Benutzung einer
Unterbrechung der seriellen Verbindung (BREAK) auf der Kommandozeile
erlaubt, um in DDB zu gelangen (``options       BREAK_TO_DEBUGGER`` in
der Kernel-Konfigurationsdatei). Dies ist jedoch nicht der Standard, da
viele serielle Adapter in Verwendung sind, die grundlos eine
BREAK-Bedingung erzeugen, zum Beispiel bei Ziehen des Kabels.

Die dritte M?glichkeit ist, dass jede Panic-Bedingung in DDB springt,
falls der Kernel hierf?r konfiguriert ist. Aus diesem Grund ist es nicht
sinnvoll einen Kernel mit DDB f?r ein unbeaufsichtigtes System zu
konfigurieren.

Um die unbeaufsichtigte Funktionsweise zu erreichen f?gen Sie:

.. code:: programlisting

    options KDB_UNATTENDED

der Kernel-Konfigurationsdatei hinzu und bauen/installieren Sie den
Kernel neu.

Die DDB-Befehle ?hneln grob einigen ``gdb``-Befehlen. Das Erste, das Sie
vermutlich tun m?ssen, ist einen Breakpoint zu setzen:

.. code:: screen

    break function-name address

Zahlen werden standardm??ig hexadezimal angegeben, aber um sie von
Symbolnamen zu unterscheiden, muss Zahlen, die mit den Buchstaben
``a-f`` beginnen, ``0x`` vorangehen (dies ist f?r andere Zahlen
beliebig). Einfache Ausdr?cke sind erlaubt, zum Beispiel:
``function-name + 0x103``.

Um den Debugger zu verlassen und mit der Abarbeitung fortzufahren, geben
Sie ein:

.. code:: screen

    continue

Um eine Stack-Ablaufverfolgung zu erhalten, benutzen Sie:

.. code:: screen

    trace

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Beachten Sie, dass wenn Sie DDB mittels einer Schnelltaste betreten, der
Kernel zurzeit einen Interrupt bereitstellt, sodass die
Stack-Ablaufverfolgung Ihnen nicht viel n?tzen k?nnte.

.. raw:: html

   </div>

Falls Sie einen Breakpoint entfernen m?chten, benutzen Sie

.. code:: screen

    del
    del address-expression

Die erste Form wird direkt, nachdem ein Breakpoint anschlug, angenommen
und entfernt den aktuellen Breakpoint. Die zweite kann jeden Breakpoint
l?schen, aber Sie m?ssen die genaue Adresse angeben; diese kann bezogen
werden durch:

.. code:: screen

    show b

oder:

.. code:: screen

    show break

Um den Kernel in Einzelschritten auszuf?hren, probieren Sie:

.. code:: screen

    s

Dies springt in Funktionen, aber Sie k?nnen DDB veranlassen, diese
schrittweise zu verfolgen, bis die passende R?ckkehranweisung
(Return-Statement) erreicht ist. Nutzen Sie hierzu:

.. code:: screen

    n

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Dies ist nicht das gleiche wie die ``next``-Anweisung von ``gdb``; es
ist wie ``gdb``\ s ``finish``. Mehrmaliges Dr?cken von **n** f?hrt zu
einer Fortsetzung.

.. raw:: html

   </div>

Um Daten aus dem Speicher zu untersuchen, benutzen Sie (zum Beispiel):

.. code:: screen

    x/wx 0xf0133fe0,40
    x/hd db_symtab_space
    x/bc termbuf,10
    x/s stringbuf

f?r Word/Halfword/Byte-Zugriff und
Hexadezimal/Dezimal/Character/String-Ausgabe. Die Zahl nach dem Komma
ist der Objektz?hler. Um die n?chsten 0x10 Objekte anzuzeigen benutzen
Sie einfach:

.. code:: screen

    x ,10

Gleicherma?en benutzen Sie

.. code:: screen

    x/ia foofunc,10

um die ersten 0x10 Anweisungen aus ``foofunc`` zu zerlegen (disassemble)
und Sie zusammen mit ihrem Adressabstand (Offset) vom Anfang von
``foofunc`` auszugeben.

Um Speicher zu ver?ndern benutzen Sie den Schreibbefehl:

.. code:: screen

    w/b termbuf 0xa 0xb 0
    w/w 0xf0010030 0 0

Die Befehlsoption (``b``/``h``/``w``) legt die Gr??e der Daten fest, die
geschrieben werden sollen, der erste Ausdruck danach ist die Adresse,
wohin geschrieben werden soll, und der Rest wird als Daten verarbeitet,
die in aufeinander folgende Speicherstellen geschrieben werden.

Falls Sie die aktuellen Register wissen m?chten, benutzen Sie:

.. code:: screen

    show reg

Alternativ k?nnen Sie den Inhalt eines einzelnen Registers ausgeben mit
z.B.

.. code:: screen

    p $eax

und ihn bearbeiten mit:

.. code:: screen

    set $eax new-value

Sollten Sie irgendeine Kernel-Funktion aus DDB heraus aufrufen wollen,
geben Sie einfach ein:

.. code:: screen

    call func(arg1, arg2, ...)

Der R?ckgabewert wird ausgegeben.

F?r eine Zusammenfassung aller laufenden Prozesse im Stil von
`ps(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ps&sektion=1>`__
benutzen Sie:

.. code:: screen

    ps

Nun haben Sie herausgefunden, warum Ihr Kernel fehlschl?gt, und m?chten
neu starten. Denken Sie daran, dass, abh?ngig von der Schwere
vorhergehender St?rungen, nicht alle Teile des Kernels wie gewohnt
funktionieren k?nnten. F?hren Sie eine der folgenden Aktionen durch, um
Ihr System herunterzufahren und neu zu starten:

.. code:: screen

    panic

Dies wird Ihren Kernel dazu veranlassen abzust?rzen, einen
Speicherauszug abzulegen und neu zu starten, sodass Sie den
Kernspeicherauszug sp?ter auf h?herer Ebene mit ``gdb`` auswerten
k?nnen. Diesem Befehl muss normalerweise eine weitere
``continue``-Anweisung folgen.

.. code:: screen

    call boot(0)

D?rfte ein guter Weg sein, um das laufende System sauber
herunterzufahren, alle Festplatten mittels ``sync()`` zu schreiben und
schlie?lich, in manchen F?llen, neu zu starten. Solange die Festplatten-
und Dateisystemschnittstellen des Kernels nicht besch?digt sind, k?nnte
dies ein guter Weg f?r ein beinahe sauberes Abschalten sein.

.. code:: screen

    call cpu_reset()

Dies ist der letzte Ausweg aus der Katastrophe und kommt beinahe dem
Dr?cken des Ausschaltknopfes gleich.

Falls Sie eine kurze Zusammenfassung aller Befehle ben?tigen, geben Sie
einfach ein:

.. code:: screen

    help

Es ist strengstens empfohlen, eine ausgedruckte Version der
`ddb(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ddb&sektion=4>`__-Manualpage
w?hrend der Fehlersuche neben sich liegen zu haben. Denken Sie daran,
dass es schwer ist, die Online-Hilfe zu lesen, w?hrend der Ausf?hrung
des Kernels in Einzelschritten.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------------------------------------------+------------------------------------+------------------------------------------------------------------------+
| `Zur?ck <kerneldebug-ddd.html>`__?                                      | `Nach oben <kerneldebug.html>`__   | ?\ `Weiter <kerneldebug-online-gdb.html>`__                            |
+-------------------------------------------------------------------------+------------------------------------+------------------------------------------------------------------------+
| 10.3. Fehlersuche in einem Speicherauszug nach einem Absturz mit DDD?   | `Zum Anfang <index.html>`__        | ?10.5. Online-Kernel-Fehlersuche mit GDB auf einem entfernten System   |
+-------------------------------------------------------------------------+------------------------------------+------------------------------------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
