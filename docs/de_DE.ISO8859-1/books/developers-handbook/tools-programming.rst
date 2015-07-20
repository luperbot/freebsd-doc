=====================================
2.3. Einf?hrung in die Programmierung
=====================================

.. raw:: html

   <div class="navheader">

2.3. Einf?hrung in die Programmierung
`Zur?ck <tools-intro.html>`__?
Kapitel 2. Werkzeuge zur Programmierung
?\ `Weiter <tools-compiling.html>`__

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

2.3. Einf?hrung in die Programmierung
-------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Ein Programm ist eine Zusammenstellung von Anweisungen, die den Computer
auffordern verschiedenste Dinge zu tun. Dieser Abschnitt gibt ihnen
einen ?berblick ?ber die beiden wesentlichen Methoden diese Anweisungen
oder „Befehle“, wie man diese Anweisungen ?blicherweise nennt, zu geben.
Die eine Methode nutzt einen *Interpreter*, die andere einen *Compiler*.
Da menschliche Sprachen f?r einen Computer nicht unmissverst?ndlich
sind, werden diese Befehle in einer Sprache geschrieben die speziell f?r
diesen Zweck gedacht ist.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.3.1. Interpreter
~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Mit einem Interpreter ist die Sprache vielmehr eine Umgebung, in der Sie
ein Kommando an der Kommandozeile eingeben welches dann von der Umgebung
ausgef?hrt wird. F?r kompliziertere Programme k?nnen Sie die Befehle in
eine Datei schreiben und den Interpreter dazu bringen diese Datei zu
laden und die enthaltenen Befehle auszuf?hren. Falls etwas schief geht
werden viele Interpreter Sie an einen Debugger weiterleiten.

Der Vorteil hierbei ist, das Sie das Ergebnis ihres Befehls direkt sehen
und Fehler sofort korrigiert werden k?nnen. Der gr??te Nachteil bei
dieser Methode entsteht, wenn Sie ihr Programm mit jemandem teilen
wollen. Diese Person muss den selben Interpreter nutzen wie Sie es tun
und Sie muss wissen wie dieser zu bedienen ist. Zudem werden Benutzer es
nicht begr??en sich in einem Debugger wiederzufinden, wenn Sie einmal
die falsche Taste dr?cken! Bei einem Blick auf die Leistungsf?higkeit
brauchen Interpreter oftmals viel Speicher und erzeugen den Code nicht
so effizient wie Compiler.

Meiner Meinung nach sind interpretierte Sprachen der beste Anfang, wenn
Sie bisher noch nicht programmiert haben. Diese Art von Umgebung findet
man typischerweise bei Sprachen wie Lisp, Smalltalk, Perl und Basic. Man
k?nnte auch sagen, dass die UNIX? Shell (``sh``, ``csh``) f?r sich
bereits einen Interpreter darstellt und viele Leute schreiben
tats?chlich Shell „Scripten“ um sich bei einigen „Haushaltsaufgaben“ auf
ihren Maschinen helfen zu lassen. Tats?chlich war es ein wesentlicher
Teil der originalen UNIX? Philosophie eine gro?e Zahl an kleinen
Hilfsprogrammen zur Verf?gung zu stellen, welche mittels eines
Shellskripts miteinander kombiniert werden um bestimmte Aufgaben zu
?bernehmen.

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

2.3.2. F?r FreeBSD verf?gbare Interpreter
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Im folgenden eine Liste der ?ber die FreeBSD Ports-Sammlung verf?gbaren
Interpreter einschlie?lich einer kurzen Er?rterung der popul?ren
interpretierten Sprachen.

Anleitungen wie man Anwendungen aus der Ports-Sammlung erh?lt und
installiert k?nnen Sie dem Kapitel `Benutzen der
Ports-Sammlung <../../../../doc/de_DE.ISO8859-1/books/handbook/ports-using.html>`__
aus dem FreeBSD Handbuch entnehmen.

.. raw:: html

   <div class="variablelist">

BASIC
    Kurz f?r Beginner's All-purpose Symbolic Instruction Code.
    Entwickelt in den 50er Jahren um Studenten in Programmierung zu
    unterrichten, wurde BASIC in den 80er Jahren mit jedem anst?ndigen
    Personal Computer ausgeliefert und war f?r viele Programmierer die
    erste Programmiersprache. BASIC ist auch die Grundlage f?r Visual
    Basic.

    Der Bywater Basic Interpreter findet sich in der Ports-Sammlung
    unter
    `lang/bwbasic <http://www.freebsd.org/cgi/url.cgi?ports/lang/bwbasic/pkg-descr>`__
    und Phil Cockroft's Basic Interpreter (auch bekannt als Rabbit
    Basic) findet sich unter
    `lang/pbasic <http://www.freebsd.org/cgi/url.cgi?ports/lang/pbasic/pkg-descr>`__.

Lisp
    Diese Sprache wurde in den sp?ten 50er Jahren als Alternative zu
    den, zu dieser Zeit popul?ren, „zahlenverarbeitenden“ Sprachen
    entwickelt. Anstelle auf Zahlen basiert Lisp auf Listen; tats?chlich
    ist der Name Lisp eine Kurzform f?r „List Processing“ (Listen
    abarbeiten). Sehr popul?r f? AI (Artificial Intelligence/ k?nstliche
    Intelligez) (Fach-) Kreisen.

    Lisp ist eine extrem kraftvolle und durchdachte Sprache, kann aber
    auch recht gro? und unhandlich sein.

    Zahlreiche Ausformungen von Lisp, die auf UNIX? Systemen laufen sind
    ?ber die Ports-Sammlung verf?gbar. GNU Common Lisp befindet sich in
    `lang/gcl <http://www.freebsd.org/cgi/url.cgi?ports/lang/gcl/pkg-descr>`__.
    CLISP von Bruno Haible und Michael Stoll ist in
    `lang/clisp <http://www.freebsd.org/cgi/url.cgi?ports/lang/clisp/pkg-descr>`__
    zu finden. F?r CMUCL, welches auch einen hoch-optimierten Compiler
    enth?lt, oder einfachere Ausformungen wie SLisp, das die meisten
    g?ngigen Lisp Konstrukte in wenigen hundert Zeilen C Code enth?lt
    sind in
    `lang/cmucl <http://www.freebsd.org/cgi/url.cgi?ports/lang/cmucl/pkg-descr>`__
    und
    `lang/slisp <http://www.freebsd.org/cgi/url.cgi?ports/lang/slisp/pkg-descr>`__
    ebenfalls enthalten.

Perl
    Unter Systemadministratoren zum Schreiben von Skripten sehr beliebt;
    wird h?ufig auch auf World Wide Web Servern verwendet, um
    CGI-Skripte zu schreiben.

    Perl ist in der Ports-Sammlung unter
    `lang/perl5.8 <http://www.freebsd.org/cgi/url.cgi?ports/lang/perl5.8/pkg-descr>`__
    f?r alle FreeBSD-Versionen verf?gbar, und wird im Basissystem von
    4.x als ``/usr/bin/perl`` installiert.

Scheme
    Ein Dialekt von Lisp, der kompakter und sauberer als Common Lisp
    ist. Dieser Dialekt ist an Universit?ten sehr beliebt, da er zum
    einen f?r den Unterricht im Grundstudium einfach genug ist, und zum
    anderen ein ausreichend hohes Abstraktionsniveau f?r den Einsatz in
    der Forschung bietet.

    Scheme ist in der Ports-Sammlung in Form des Elk Scheme Interpreters
    als
    `lang/elk <http://www.freebsd.org/cgi/url.cgi?ports/lang/elk/pkg-descr>`__
    verf?gbar. Den MIT Scheme Interpreter findet man unter
    `lang/mit-scheme <http://www.freebsd.org/cgi/url.cgi?ports/lang/mit-scheme/pkg-descr>`__,
    und den SCM Scheme Interpreter unter
    `lang/scm <http://www.freebsd.org/cgi/url.cgi?ports/lang/scm/pkg-descr>`__.

Icon
    Icon ist eine Hochsprache mit ausgereiften M?glichkeiten zur
    Verarbeitung von Zeichenketten und Strukturen. Die unter FreeBSD
    verf?gbare Version von Icon steht in der Ports-Sammlung unter
    `lang/icon <http://www.freebsd.org/cgi/url.cgi?ports/lang/icon/pkg-descr>`__
    zur Verf?gung.

Logo
    Logo ist eine leicht zu erlernende Programmiersprache, welche in
    vielen Kursen als einf?hrende Programmiersprache gew?hlt wird. Sie
    ist ein ideales Arbeitswerkzeug beim Unterricht mit jungen Menschen,
    da mit ihr die Erstellung komplizierter geometrischer Oberfl?chen
    selbst f?r kleine Kinder einfach ist.

    Die f?r FreeBSD aktuellste, verf?gbare Version findet man in der
    Ports-Sammlung unter
    `lang/logo <http://www.freebsd.org/cgi/url.cgi?ports/lang/logo/pkg-descr>`__.

Python
    Python ist eine objektorientierte, interpretierte
    Programmiersprache. Die Verfechter von Python argumentieren, da? sie
    eine der besten Programmiersprachen f?r Programmieranf?nger sei, da
    sie einfach zu erlernen ist, und anderen popul?ren interpretierten
    Programmiersprachen, welche zur Entwicklung gro?er und komplexer
    Anwendungen verwendet werden, in nichts nachsteht (Perl und Tcl sind
    zwei solcher bekannten Programmiersprachen).

    Die aktuellste Version von Python ist in der Ports-Sammlung unter
    `lang/python <http://www.freebsd.org/cgi/url.cgi?ports/lang/python/pkg-descr>`__
    verf?gbar.

Ruby
    Ruby ist eine interpretierte und rein objektorientierte
    Programmiersprache. Sie wurde wegen ihrer leicht verst?ndlichen
    Syntax, ihrer Flexibilit?t und der M?glichkeit, gro?e und komplexe
    Programme einfach zu entwickeln und zu pflegen, popul?r.

    Ruby ist in der Ports-Sammlung unter
    `lang/ruby18 <http://www.freebsd.org/cgi/url.cgi?ports/lang/ruby18/pkg-descr>`__
    verf?gbar.

Tcl und Tk
    Tcl ist eine einbettbare, interpretierte Programmiersprache, welche
    aufgrund ihrer Portierbarkeit auf viele unterschiedliche Plattformen
    eine weite Verbreitung erfahren hat. Sie kann sowohl f?r die
    schnelle Entwicklung kleinerer Prototypen, als auch (in Verbindung
    mit Tk, einem GUI Toolkit) vollwertiger, ausgereifter Programme
    verwendet werden.

    Es sind mehrere Versionen von Tcl als Ports f?r FreeBSD verf?gbar.
    Die aktuellste Version, Tcl 8.5, ist unter
    `lang/tcl85 <http://www.freebsd.org/cgi/url.cgi?ports/lang/tcl85/pkg-descr>`__
    verf?gbar.

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

2.3.3. Compiler
~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Compiler sind eher anders. Zuerst schreibt man seinen Code unter
Verwendung eines Editors in eine Datei (oder mehrere Dateien).
Anschlie?end ruft man den Compiler auf um zu sehen, ob dieser das
Programm annimmt. Wenn das Programm nicht kompiliert werden konnte, mu?
man die Z?hne zusammenbeissen und wieder zum Editor zur?ckkehren; falls
das Programm kompiliert und eine ausf?hrbare Anwendung erzeugt wurde,
kann man diese ?ber eine Eingabeaufforderung oder ?ber einen Debugger
aufrufen um zu sehen, ob sie auch funktioniert.
`:sup:`[1]` <#ftn.idp64054864>`__

Offensichtlich ist diese Art der Programmierung nicht so direkt wie die
Verwendung eines Interpreters. Jedoch sind auf diese Weise viele Dinge
m?glich, die mit einem Interpreter nur sehr schwer oder ?berhaupt nicht
realisierbar w?ren, wie z.B. das Schreiben von Code, der sehr eng mit
dem Betriebsystem zusammen arbeitet—oder das Schreiben eines eigenen
Betriebsystems selbst! Des weiteren ist so das Erzeugen von sehr
effizientem Code m?glich, da sich der Compiler f?r die Optimierung Zeit
nehmen kann, was bei einem Interpreter inakzeptabel w?re. Ferner ist das
Verbreiten von Programmen, welche f?r einen Compiler geschrieben wurden,
einfacher als welche, die f?r einen Interpreter geschrieben wurden—man
muss in ersterem Fall nur die ausf?hrbare Datei verbreiten,
vorausgesetzt, da? das gleiche Betriebssystem verwendet wird.

Programmiersprachen, die kompiliert werden, sind unter anderem Pascal, C
und C++. C und C++ sind eher unbarmherzige Programmiersprachen und daher
eher f?r erfahrene Programmierer gedacht; Pascal auf der anderen Seite
wurde zu Ausbildungszwecken entworfen, und stellt daher eine
einsteigerfreundliche Programmiersprache dar. FreeBSD beinhaltet im
Basissystem keine Unterst?tzung f?r Pascal, stellt jedoch ?ber die
Ports-Sammlung den Free Pascal Compiler unter
`lang/fpc <http://www.freebsd.org/cgi/url.cgi?ports/lang/fpc/pkg-descr>`__
zur Verf?gung.

Da der editier-kompilier-ausf?hr-debug-Kreislauf unter Verwendung
mehrerer Programme eher m?hsam ist haben viele Hersteller von Compilern
integrierte Entwicklungsumgebungen (Integrated Development Environment;
auch kurz IDE) entwickelt. FreeBSD bietet zwar im Basissystem keine IDE
an, stellt jedoch ?ber die Ports-Sammlung IDEs wie
`devel/kdevelop <http://www.freebsd.org/cgi/url.cgi?ports/devel/kdevelop/pkg-descr>`__
oder Emacs zur Verf?gung, wobei letztere weit verbreitet ist. Die
Verwendung von Emacs als IDE wird unter `Abschnitt?2.7, „Emacs als
Entwicklungsumgebung verwenden“ <emacs.html>`__ diskutiert.

.. raw:: html

   </div>

.. raw:: html

   <div class="footnotes">

--------------

.. raw:: html

   <div id="ftn.idp64054864" class="footnote">

`:sup:`[1]` <#idp64054864>`__\ Wenn die Anwendung ?ber eine
Eingabeaufforderung gestartet wird k?nnte bei Auftreten eines
Programmfehlers dieses abgebrochen und ein Speicherabbild erzeugt
werden.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------+-------------------------------+----------------------------------------+
| `Zur?ck <tools-intro.html>`__?   | `Nach oben <tools.html>`__    | ?\ `Weiter <tools-compiling.html>`__   |
+----------------------------------+-------------------------------+----------------------------------------+
| 2.2. Zusammenfassung?            | `Zum Anfang <index.html>`__   | ?2.4. Kompilieren mit dem ``cc``       |
+----------------------------------+-------------------------------+----------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
