=============
2.6. Debuggen
=============

.. raw:: html

   <div class="navheader">

2.6. Debuggen
`Zur?ck <tools-make.html>`__?
Kapitel 2. Werkzeuge zur Programmierung
?\ `Weiter <emacs.html>`__

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

2.6. Debuggen
-------------

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

2.6.1. Der Debugger
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Der Debugger bei FreeBSD hei?t ``gdb`` (GNU debugger). Sie k?nnen Ihn
durch die Eingabe von

.. code:: screen

    % gdb progname

starten, wobei viele Leute ihn vorzugsweise innerhalb von Emacs
aufrufen. Sie erreichen dies durch die Eingabe von:

.. code:: screen

    M-x gdb RET progname RET

Die Verwendung eines Debuggers erlaubt Ihnen Ihr Programm unter
kontrollierteren Bedingungen ausf?hren zu k?nnen. Typischerweise k?nnen
Sie so Zeile f?r Zeile durch Ihr Programm gehen, die Werte von Variablen
untersuchen, diese ver?ndern, dem Debugger sagen er soll das Programm
bis zu einem bestimmten Punkt ausf?hren und dann anhalten, und so weiter
und so fort. Sie k?nnen damit sogar ein schon laufendes Programm
untersuchen, oder eine Datei mit einem Kernspeicherabbild laden um
herauszufinden, warum das Programm abgest?rzt ist. Es ist sogar m?glich
damit den Kernel zu debuggen, wobei dies etwas trickreicher als bei den
Benutzeranwendungen ist, welche wir in diesem Abschnitt behandeln
werden.

Der ``gdb`` besitzt eine recht gute Online-Hilfe, sowie einen Satz von
Info-Seiten, weshalb sich dieser Abschnitt auf ein paar grundlegende
Befehle beschr?nken wird.

Falls Sie den textbasierten Kommandozeilen-Stil absto?end finden gibt es
ein graphisches Front-End daf?r
(`devel/xxgdb <http://www.freebsd.org/cgi/url.cgi?ports/devel/xxgdb/pkg-descr>`__)
in der Ports-Sammlung.

Dieser Abschnitt ist als Einf?hrung in die Verwendung des ``gdb``
gedacht und beinhaltet nicht spezielle Themen wie das Debuggen des
Kernels.

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

2.6.2. Ein Programm im Debugger ausf?hren
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Sie m?ssen das Programm mit der Option ``-g`` kompiliert haben um den
``gdb`` effektiv einsetzen zu k?nnen. Es geht auch ohne diese Option,
allerdings werden Sie dann nur den Namen der Funktion sehen, in der Sie
sich gerade befinden, anstatt direkt den zugeh?rigen Quelltext. Falls
Sie eine Meldung wie die folgende sehen:

.. code:: screen

    … (no debugging symbols found) …

wenn der ``gdb`` gestartet wird, dann wissen Sie, da? das Programm nicht
mit der Option ``-g`` kompiliert wurde.

Geben Sie in der Eingabeaufforderung des ``gdb`` **``break main``** ein.
Dies weist den Debugger an, dass Sie nicht daran interessiert sind, den
einleitenden Schritten beim Programmstart zuzusehen und dass am Anfang
Ihres Codes die Ausf?hrung beginnen soll. Geben Sie nun **``run``** ein,
um das Programm zu starten - es wird starten und beim Aufruf von
``main()`` vom Debugger angehalten werden. (Falls Sie sich jemals
gewundert haben von welcher Stelle ``main()`` aufgerufen wird, dann
wissen Sie es jetzt!).

Sie k?nnen nun Schritt f?r Schritt durch Ihr Programm gehen, indem Sie
``n`` dr?cken. Wenn Sie zu einem Funktionsaufruf kommen k?nnen Sie diese
Funktion durch dr?cken von ``s`` betreten. Sobald Sie sich in einem
Funktionsaufruf befinden k?nnen Sie diesen durch dr?cken von ``f``
wieder verlassen. Sie k?nnen auch ``up`` und ``down`` verwenden, um sich
schnell den Aufrufer einer Funktion anzusehen.

Hier ist ein einfaches Beispiel, wie man mit Hilfe des ``gdb`` einen
Fehler in einem Programm findet. Dies ist unser eigenes Programm (mit
einem absichtlich eingebauten Fehler):

.. code:: programlisting

    #include <stdio.h>

    int bazz(int anint);

    main() {
        int i;

        printf("This is my program\n");
        bazz(i);
        return 0;
    }

    int bazz(int anint) {
        printf("You gave me %d\n", anint);
        return anint;
    }

Dieses Programm setzt i auf den Wert ``5`` und ?bergibt dies einer
Funktion ``bazz()``, welche den Wert ausgibt, den Sie von uns erhalten
hat.

Wenn wir das Programm kompilieren und ausf?hren erhalten wir

.. code:: screen

    % cc -g -o temp temp.c
    % ./temp
    This is my program
    anint = 4231

Das ist nicht was wir erwartet hatten! Es ist Zeit, da? wir sehen was
hier passiert!

.. code:: screen

    % gdb temp
    GDB is free software and you are welcome to distribute copies of it
     under certain conditions; type "show copying" to see the conditions.
    There is absolutely no warranty for GDB; type "show warranty" for details.
    GDB 4.13 (i386-unknown-freebsd), Copyright 1994 Free Software Foundation, Inc.
    (gdb) break main                Skip the set-up code
    Breakpoint 1 at 0x160f: file temp.c, line 9.    gdb puts breakpoint at main()
    (gdb) run                   Run as far as main()
    Starting program: /home/james/tmp/temp      Program starts running

    Breakpoint 1, main () at temp.c:9       gdb stops at main()
    (gdb) n                     Go to next line
    This is my program              Program prints out
    (gdb) s                     step into bazz()
    bazz (anint=4231) at temp.c:17          gdb displays stack frame
    (gdb)

Halt mal! Wieso hat denn anint den Wert ``4231``? Haben wir dieser
Variablen nicht in ``main()`` den Wert ``5`` zugewiesen? Gehen wir mal
zur?ck zu ``main()`` und schauen dort nach.

.. code:: screen

    (gdb) up                 Move up call stack
    #1  0x1625 in main () at temp.c:11      gdb displays stack frame
    (gdb) p i                   Show us the value of i
    $1 = 4231                   gdb displays 4231

Oh! Anscheinend haben wir vergessen i zu initialisieren. Wir wollten
eigentlich

.. code:: programlisting

    …
    main() {
        int i;

        i = 5;
        printf("This is my program\n");
    …

schreiben, haben aber die Zeile mit ``i=5;`` vergessen. Da wir i nicht
initialisiert haben hatte diese Variable gerade den Wert, der in dem ihr
zugewiesenen Speicherbereich stand als wir das Programm gestartet haben,
welcher in diesem Fall ``4231`` war.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Der ``gdb`` zeigt jedes mal, wenn wir eine Funktion betreten oder
verlassen, den Inhalt des Stack-Rahmens an, selbst wenn wir uns mit
``up`` und ``down`` im Aufruf-Stack umher bewegen. Dabei wird der Name
der Funktion sowie der ?bergebenen Argumente angezeigt, was uns dabei
hilft, die ?bersicht zu behalten. (Der Stack ist ein Speicherbereich, in
dem ein Programm Informationen ?ber die an eine Funktion ?bergebenen
Argumente ablegt, sowie die R?cksprungadresse eines Funktionsaufrufes).

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

2.6.3. Eine Kernspeicherdatei untersuchen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Eine Kernspeicherdatei ist im Prinzip eine Datei, die den vollst?ndigen
Zustand eines Prozesses enth?lt, als dieses abgest?rzt ist. In „den
guten alten Zeiten“ mu?ten Programmierer hexadezimale Listen der
Kernspeicherdatei ausdrucken und ?ber Maschinencodehandb?chern
schwitzen, aber heutzutage ist das Leben etwas einfacher geworden.
Zuf?lligerweise wird die Kernspeicherdatei unter FreeBSD und anderen
4.4BSD-Systemen ``progname.core`` anstatt einfach nur ``core`` genannt,
um deutlich zu machen, zu welchem Programm eine Kernspeicherdatei
geh?rt.

Um eine Kernspeicherdatei zu untersuchen m?ssen Sie den ``gdb`` wie
gewohnt starten. An Stelle von ``break`` oder ``run`` m?ssen Sie das
Folgende eingeben

.. code:: screen

    (gdb) core progname.core

Wenn Sie sich nicht in demselben Verzeichnis befinden wie die
Kernspeicherdatei m?ssen Sie zuerst **``dir     /path/to/core/file``**
eingeben.

Sie sollten dann etwas wie folgt sehen:

.. code:: screen

    % gdb a.out
    GDB is free software and you are welcome to distribute copies of it
     under certain conditions; type "show copying" to see the conditions.
    There is absolutely no warranty for GDB; type "show warranty" for details.
    GDB 4.13 (i386-unknown-freebsd), Copyright 1994 Free Software Foundation, Inc.
    (gdb) core a.out.core
    Core was generated by `a.out'.
    Program terminated with signal 11, Segmentation fault.
    Cannot access memory at address 0x7020796d.
    #0  0x164a in bazz (anint=0x5) at temp.c:17
    (gdb)

In diesem Fall hie? das Programm ``a.out``, weshalb die
Kernspeicherdatei den Namen ``a.out.core`` tr?gt. Wie wir sehen k?nnen
st?rzte das Programm in einer Funktion namens ``bazz`` ab, als es
versuchte auf einen Speicherbereich zuzugreifen, der dem Programm nicht
zur Verf?gung stand.

Manchmal ist es ganz n?tzlich zu sehen, wie eine Funktion aufgerufen
wurde, da bei komplexen Programmen das eigentliche Problem schon sehr
viel weiter oben auf dem Aufruf-Stack aufgetreten sein k?nnte. Der
Befehl ``bt`` veranla?t den ``gdb`` dazu, einen Backtrace des
Aufruf-Stacks auszugeben:

.. code:: screen

    (gdb) bt
    #0  0x164a in bazz (anint=0x5) at temp.c:17
    #1  0xefbfd888 in end ()
    #2  0x162c in main () at temp.c:11
    (gdb)

Die Funktion ``end()`` wird aufgerufen, wenn ein Programm abst?rzt; in
diesem Fall wurde die Funktion ``bazz()`` aus der ``main()``-Funktion
heraus aufgerufen.

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

2.6.4. Ein bereits laufendes Programm untersuchen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Eine der tollsten Features des ``gdb`` ist die M?glichkeit, damit
bereits laufende Programme zu untersuchen. Dies bedeutet nat?rlich, da?
Sie die erforderlichen Rechte daf?r besitzen. Ein h?ufig auftretendes
Problem ist das Untersuchen eines Programmes, welches sich selber forkt.
Vielleicht will man den Kindprozess untersuchen, aber der Debugger
erlaubt einem nur den Zugriff auf den Elternprozess.

Was Sie an solch einer Stelle machen ist, Sie starten einen weiteren
``gdb``, ermitteln mit Hilfe von ``ps`` die Prozess-ID des
Kindprozesses, und geben

.. code:: screen

    (gdb) attach pid

im ``gdb`` ein, und k?nnen dann wie ?blich mit der Fehlersuche
fortfahren.

„Das ist zwar alles sehr sch?n,“ werden Sie jetzt vielleicht denken,
„aber in der Zeit, in der ich diese Schritte durchf?hre, ist der
Kindprozess schon l?ngst ?ber alle Berge“. F?rchtet euch nicht, edler
Leser, denn Ihr m??t wie folgt vorgehen (freundlicherweise zur Verf?gung
gestellt von den Info-Seite des ``gdb``):

.. code:: screen

    …
    if ((pid = fork()) < 0)      /* _Always_ check this */
        error();
    else if (pid == 0) {        /* child */
        int PauseMode = 1;

        while (PauseMode)
            sleep(10);  /* Wait until someone attaches to us */
        …
    } else {            /* parent */
        …

Alles was Sie jetzt noch tun m?ssen ist, sich an den Kindprozess
ranzuh?ngen, PauseMode auf ``0`` zu setzen und auf den ``sleep()``
Funktionsaufruf zu warten, um zur?ckzukehren!

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------+-------------------------------+--------------------------------------------------+
| `Zur?ck <tools-make.html>`__?   | `Nach oben <tools.html>`__    | ?\ `Weiter <emacs.html>`__                       |
+---------------------------------+-------------------------------+--------------------------------------------------+
| 2.5. Make?                      | `Zum Anfang <index.html>`__   | ?2.7. Emacs als Entwicklungsumgebung verwenden   |
+---------------------------------+-------------------------------+--------------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
