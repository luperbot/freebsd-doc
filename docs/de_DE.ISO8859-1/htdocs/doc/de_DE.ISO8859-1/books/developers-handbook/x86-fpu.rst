========================
11.13. Die FPU verwenden
========================

.. raw:: html

   <div class="navheader">

11.13. Die FPU verwenden
`Zur?ck <x86-one-pointed-mind.html>`__?
Kapitel 11. x86-Assembler-Programmierung
?\ `Weiter <x86-caveats.html>`__

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

11.13. Die FPU verwenden
------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

?bersetzt von Fabian Borschel.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Seltsamerweise erw?hnt die meiste Literatur zu Assemblersprachen nicht
einmal die Existenz der FPU, oder *floating point unit*
(Flie?komma-Recheneinheit), geschweige denn, da? auf die Programmierung
mit dieser eingegangen wird.

Dabei kann die Assemblerprogrammierung gerade bei hoch optimiertem
FPU-Code, der *nur* mit einer Assemblersprache realisiert werden kann,
ihre gro?e St?rke ausspielen.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

11.13.1. Organisation der FPU
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die FPU besteht aus 8 80–bit Flie?komma-Registern. Diese sind in Form
eines Stacks organisiert—Sie k?nnen einen Wert durch den Befehl ``push``
auf dem TOS (*top of stack*) ablegen, oder durch ``pop`` von diesem
holen.

Da also die Befehle ``push`` und ``pop`` schon verwendet werden, kann es
keine op-Codes in Assemblersprache mit diesen Namen geben.

Sie k?nnen mit einen Wert auf dem TOS ablegen, indem Sie ``fld``,
``fild``, und ``fbld`` verwenden. Mit weiteren op-Codes lassen sich
*Konstanten*—wie z.B. *Pi*—auf dem TOS ablegen.

Analog dazu k?nnen Sie einen Wert holen, indem Sie ``fst``, ``fstp``,
``fist``, ``fistp``, und ``fbstp`` verwenden. Eigentlich holen (``pop``)
nur die op-Codes, die auf *p* enden, einen Wert, w?hrend die anderen den
Wert irgendwo speichern (``store``) ohne ihn vom TOS zu entfernen.

Daten k?nnen zwischen dem TOS und dem Hauptspeicher als 32–bit, 64–bit
oder 80–bit *real*, oder als 16–bit, 32–bit oder 64–bit *Integer*, oder
als 80–bit *packed decimal* ?bertragen werden.

Das 80–bit *packed decimal*-Format ist ein Spezialfall des *binary coded
decimal*-Formates, welches ?blicherweise bei der Konvertierung zwischen
der ASCII- und FPU-Darstellung von Daten verwendet wird. Dieses erlaubt
die Verwendung von 18 signifikanten Stellen.

Unabh?ngig davon, wie Daten im Speicher dargestellt werden, speichert
die FPU ihre Daten immer im 80–bit *real*-Format in den Registern.

Ihre interne Genauigkeit betr?gt mindestens 19 Dezimalstellen. Selbst
wenn wir also Ergebnisse im ASCII-Format mit voller 18–stelliger
Genauigkeit darstellen lassen, werden immer noch korrekte Werte
angezeigt.

Des weiteren k?nnen mathematische Operationen auf dem TOS ausgef?hrt
werden: Wir k?nnen dessen *Sinus* berechnen, wir k?nnen ihn *skalieren*
(z.B. k?nnen wir ihn mit dem Faktor 2 Multiplizieren oder Dividieren),
wir k?nnen dessen *Logarithmus* zur Basis 2 nehmen, und viele weitere
Dinge.

Wir k?nnen auch FPU-Register *multiplizieren*, *dividieren*, *addieren*
und *subtrahieren*, sogar einzelne Register mit sich selbst.

Der offizielle Intel op-Code f?r den TOS ist ``st`` und f?r die
*Register* ``st(0)``– ``st(7)``. ``st`` und ``st(0)`` beziehen sich
dabei auf das gleiche Register.

Aus welchen Gr?nden auch immer hat sich der Originalautor von nasm daf?r
entschieden, andere op-Codes zu verwenden, n?mlich ``st0``– ``st7``. Mit
anderen Worten, es gibt keine Klammern, und der TOS ist immer ``st0``,
niemals einfach nur ``st``.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

11.13.1.1. Das Packed Decimal-Format
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das *packed decimal*-Format verwendet 10 Bytes (80 Bits) zur Darstellung
von 18 Ziffern. Die so dargestellte Zahl ist immer ein *Integer*.

.. raw:: html

   <div class="tip" xmlns="">

Tipp:
~~~~~

Sie k?nnen durch Multiplikation des TOS mit Potenzen von 10 die
einzelnen Dezimalstellen verschieben.

.. raw:: html

   </div>

Das h?chste Bit des h?chsten Bytes (Byte 9) ist das *Vorzeichenbit*:
Wenn es gesetzt ist, ist die Zahl *negativ*, ansonsten *positiv*. Die
restlichen Bits dieses Bytes werden nicht verwendet bzw. ignoriert.

Die restlichen 9 Bytes enthalten die 18 Ziffern der gespeicherten Zahl:
2 Ziffern pro Byte.

Die *signifikantere Ziffer* wird in der *oberen H?lfte* (4 Bits) eines
Bytes gespeichert, die andere in der *unteren H?lfte*.

Vielleicht w?rden Sie jetzt annehmen, das ``-1234567`` auf die folgende
Art im Speicher abgelegt wird (in hexadezimaler Notation):

.. code:: programlisting

    80 00 00 00 00 00 01 23 45 67

Dem ist aber nicht so! Bei Intel werden alle Daten im
*little–endian*-Format gespeichert, auch das *packed decimal*-Format.

Dies bedeutet, da? ``-1234567`` wie folgt gespeichert wird:

.. code:: programlisting

    67 45 23 01 00 00 00 00 00 80

Erinnern Sie sich an diesen Umstand, bevor Sie sich aus lauter
Verzweiflung die Haare ausrei?en.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Das lesenswerte Buch—falls Sie es finden k?nnen—ist Richard Startz'
`8087/80287/80387 for the IBM PC &
Compatibles <http://www.int80h.org/cgi-bin/isbn?isbn=013246604X>`__.
Obwohl es anscheinend die Speicherung der *packed decimal* im
little–endian-Format f?r gegeben annimmt. Ich mache keine Witze ?ber
meine Verzweiflung, als ich den Fehler im unten stehenden Filter gesucht
habe, *bevor* mir einfiel, da? ich einfach mal versuchen sollte, das
little–endian-Format, selbst f?r diesen Typ von Daten, anzuwenden.

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

11.13.2. Ausflug in die Lochblendenphotographie
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Um sinnvolle Programme zu schreiben, m?ssen wir nicht nur unsere
Programmierwerkzeuge beherrschen, sondern auch das Umfeld, f?r das die
Programme gedacht sind.

Unser n?chster Filter wird uns dabei helfen, wann immer wir wollen, eine
*Lochkamera* zu bauen. Wir brauchen also etwas Hintergrundwissen ?ber
die *Lochblendenphotographie*, bevor wir weiter machen k?nnen.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

11.13.2.1. Die Kamera
^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die einfachste Form, eine Kamera zu beschreiben, ist die eines
abgeschlossenen, lichtundurchl?ssigen Raumes, in dessen Abdeckung sich
ein kleines Loch befindet.

Die Abdeckung ist normalerweise fest (z.B. eine Schachtel), manchmal
jedoch auch flexibel (z.B. ein Balgen). Innerhalb der Kamera ist es sehr
dunkel. Nur durch ein kleines Loch kann Licht von einem einzigen Punkt
aus in den Raum eindringen (in manchen F?llen sind es mehrere L?cher).
Diese Lichtstrahlen kommen von einem Bild, einer Darstellung von dem was
sich au?erhalb der Kamera, vor dem kleinen Loch, befindet.

Wenn ein lichtempfindliches Material (wie z.B. ein Film) in der Kamera
angebracht wird, so kann dieses das Bild einfangen.

Das Loch enth?lt h?ufig eine *Linse*, oder etwas linsenartiges, h?ufig
auch einfach *Objektiv* genannt.

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

11.13.2.2. Die Lochblende
^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Streng genommen ist die Linse nicht notwendig: Die urspr?nglichen
Kameras verwendeten keine Linse, sondern eine *Lochblende*. Selbst
heutzutage werden noch *Lochblenden* verwendet, zum einen, um die
Funktionsweise einer Kamera zu erlernen, und zum anderen, um eine
spezielle Art von Bildern zu erzeugen.

Das Bild, das von einer *Lochblende* erzeugt wird, ist ?berall scharf.
Oder unscharf. Es gibt eine ideale Gr??e f?r eine Lochblende: Wenn sie
gr??er oder kleiner ist, verliert das Bild seine Sch?rfe.

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

11.13.2.3. Brennweite
^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dieser ideale Lochblendendurchmesser ist eine Funktion der Quadratwurzel
der *Brennweite*, welche dem Abstand der Lochblende von dem Film
entspricht.

.. code:: programlisting

         D = PC * sqrt(FL)

Hier ist ``D`` der ideale Durchmesser der Lochblende, ``FL`` die
Brennweite und ``PC`` eine Konstante der Brennweite. Nach Jay Bender hat
die Konstante den Wert ``0.04``, nach Kenneth Connors ``0.037``. Andere
Leute haben andere Werte vorgeschlagen. Des weiteren gelten diese Werte
nur f?r Tageslicht: Andere Arten von Licht ben?tigen andere konstante
Werte, welche nur durch Experimente bestimmt werden k?nnen.

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

11.13.2.4. Der f–Wert
^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Der f–Wert ist eine sehr n?tzliche Gr??e, die angibt, wieviel Licht den
Film erreicht. Ein Belichtungsmesser kann dies messen, um z.B. f?r einen
Film mit einer Empfindlichkeit von f5.6 eine Belichtungsdauer von 1/1000
Sekunden auszurechnen.

Es spielt keine Rolle, ob es eine 35–mm- oder eine 6x9cm-Kamera ist,
usw. Solange wir den f–Wert kennen, k?nnen wir die ben?tigte
Belichtungszeit berechnen.

Der f–Wert l??t sich einfach wie folgt berechnen:

.. code:: programlisting

        F = FL / D

Mit anderen Worten, der f–Wert ergibt sich aus der Brennweite (FL),
dividiert durch den Durchmesser (D) der Lochblende. Ein gro?er f–Wert
impliziert also entweder eine kleine Lochblende, oder eine gro?e
Brennweite, oder beides. Je gr??er also der f–Wert ist, um so l?nger mu?
die Belichtungszeit sein.

Des weiteren sind der Lochblendendurchmesser und die Brennweite
eindimensionale Me?gr??en, w?hrend der Film und die Lochblende an sich
zweidimensionale Objekte darstellen. Das bedeutet, wenn man f?r einen
f–Wert ``A`` eine Belichtungsdauer ``t`` bestimmt hat, dann ergibt sich
daraus f?r einen f–Wert ``B`` eine Belichtungszeit von:

.. code:: programlisting

        t * (B / A)?

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

11.13.2.5. Normalisierte f–Werte
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

W?hrend heutige moderne Kameras den Durchmesser der Lochblende, und
damit deren f–Wert, weich und schrittweise ver?ndern k?nnen, war dies
fr?her nicht der Fall.

Um unterschiedliche f–Werte einstellen zu k?nnen, besa?en Kameras
typischerweise eine Metallplatte mit L?chern unterschiedlichen
Durchmessers als Lochblende.

Die Durchmesser wurden entsprechend obiger Formel gew?hlt, da? der
resultierende f–Wert ein fester Standardwert war, der f?r alle Kameras
verwendet wurde. Z.B. hat eine sehr alte Kodak Duaflex IV Kamera in
meinem Besitz drei solche L?cher f?r die f–Werte 8, 11 und 16.

Eine neuere Kamera k?nnte f–Werte wie 2.8, 4, 5.6, 8, 11, 16, 22, und 32
(und weitere) besitzen. Diese Werte wurden nicht zuf?llig ausgew?hlt:
Sie sind alle vielfache der Quadratwurzel aus 2, wobei manche Werte
gerundet wurden.

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

11.13.2.6. Der f–Stopp
^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Eine typische Kamera ist so konzipiert, da? die Nummernscheibe bei den
normalisierten f–Werten einrastet. Die Nummernscheibe *stoppt* an diesen
Positionen. Daher werden diese Positionen auch f–Stopps genannt.

Da die f–Werte bei jedem Stopp vielfache der Quadratwurzel aus 2 sind,
verdoppelt die Drehung der Nummernscheibe um einen Stopp die f?r die
gleiche Belichtung ben?tigte Lichtmenge. Eine Drehung um 2 Stopps
vervierfacht die ben?tigte Belichtungszeit. Eine Drehung um 3 Stopps
verachtfacht sie, etc.

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

11.13.3. Entwurf der Lochblenden-Software
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wir k?nnen jetzt festlegen, was genau unsere Lochblenden-Software tun
soll.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

11.13.3.1. Verarbeitung der Programmeingaben
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Da der Hauptzweck des Programms darin besteht, uns beim Entwurf einer
funktionierenden Lochkamera zu helfen, wird die *Brennweite* die
Programmeingabe sein. Dies ist etwas, das wir ohne zus?tzliche Programme
feststellen k?nnen: Die geeignete Brennweite ergibt sich aus der Gr??e
des Films und der Art des Fotos, ob dieses ein "normales" Bild, ein
Weitwinkelbild oder ein Telebild sein soll.

Die meisten bisher geschriebenen Programme arbeiteten mit einzelnen
Zeichen, oder Bytes, als Eingabe: Das hex-Programm konvertierte einzelne
Bytes in hexadezimale Werte, das csv-Programm lie? entweder einzelne
Zeichen unver?ndert, l?schte oder ver?nderte sie, etc.

Das Programm ftuc verwendete einen Zustandsautomaten, um h?chstens zwei
gleichzeitig eingegebene Bytes zu verarbeiten.

Das pinhole-Programm dagegen kann nicht nur mit einzelnen Zeichen
arbeiten, sondern mu? mit gr??eren syntaktischen Einheiten zurrecht
kommen.

Wenn wir z.B. m?chten, da? unser Programm den Lochblendendurchmesser
(und weitere Werte, die wir sp?ter noch diskutieren werden) f?r die
Brennweiten ``100 mm``, ``150 mm`` und ``210 mm`` berechnet, wollen wir
etwa folgendes eingeben:

.. code:: screen

    100, 150, 210

Unser Programm mu? mit der gleichzeitigen Eingabe von mehr als nur einem
einzelnen Byte zurecht kommen. Wenn es eine ``1`` erkennt, mu? es
wissen, da? dies die erste Stelle einer dezimalen Zahl ist. Wenn es eine
``0``, gefolgt von einer weiteren ``0`` sieht, mu? es wissen, da? dies
zwei unterschiedliche Stellen mit der gleichen Zahl sind.

Wenn es auf das erste Komma trifft, mu? es wissen, da? die folgenden
Stellen nicht mehr zur ersten Zahl geh?ren. Es mu? die Stellen der
ersten Zahl in den Wert ``100`` konvertieren k?nnen. Und die Stellen der
zweiten Zahl m?ssen in den Wert ``150`` konvertiert werden. Und die
Stellen der dritten Zahl m?ssen in den Wert ``210`` konvertiert werden.

Wir m?ssen festlegen, welche Trennsymbole zul?ssig sind: Sollen die
Eingabewerte durch Kommas voneinander getrennt werden? Wenn ja, wie
sollen zwei Zahlen behandelt werden, die durch ein anderes Zeichen
getrennt sind?

Ich pers?nlich mag es einfach. Entweder etwas ist eine Zahl, dann wird
es verarbeitet, oder es ist keine Zahl, dann wird es verworfen. Ich mag
es nicht, wenn sich der Computer bei der *offensichtlichen* Eingabe
eines zus?tzlichen Zeichens beschwert. Duh!

Zus?tzlich erlaubt es mir, die Monotonie des Tippens zu durchbrechen,
und eine Anfrage anstelle einer simplen Zahl zu stellen:

.. code:: screen

    Was ist der beste Lochblendendurchmesser
          bei einer Brennweite von 150?

Es gibt keinen Grund daf?r, die Ausgabe mehrerer Fehlermeldungen
aufzuteilen:

.. code:: screen

    Syntax error: Was
    Syntax error: ist
    Syntax error: der
    Syntax error: beste

Et cetera, et cetera, et cetera.

Zweitens mag ich das ``#``-Zeichen, um Kommentare zu markieren, die ab
dem Zeichen bis zum Ende der jeweiligen Zeile gehen. Dies verlangt nicht
viel Programmieraufwand, und erm?glicht es mir, Eingabedateien f?r meine
Programme als ausf?hrbare Skripte zu handhaben.

In unserem Fall m?ssen wir auch entscheiden, in welchen Einheiten die
Dateneingabe erfolgen soll: Wir w?hlen *Millimeter*, da die meisten
Photographen die Brennweite in dieser Einheit messen.

Letztendlich m?ssen wir noch entscheiden, ob wir die Verwendung des
dezimalen Punktes erlauben (in diesem Fall m?ssen wir ber?cksichtigen,
da? in vielen L?ndern der Welt das dezimale *Komma* verwendet wird).

In unserem Fall w?rde das Zulassen eines dezimalen Punktes/Kommas zu
einer f?lschlicherweise angenommenen, h?heren Genauigkeit f?hren: Der
Unterschied zwischen den Brennweiten ``50`` und ``51`` ist fast nicht
wahrnehmbar. Die Zulassung von Eingaben wie ``50.5`` ist also keine gute
Idee. Beachten Sie bitte, das dies meine Meinung ist. In diesem Fall bin
ich der Autor des Programmes. Bei Ihren eigenen Programmen m?ssen Sie
selbst solche Entscheidungen treffen.

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

11.13.3.2. Optionen anbieten
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das wichtigste, was wir zum Bau einer Lochkamera wissen m?ssen, ist der
Durchmesser der Lochblende. Da wir scharfe Bilder schie?en wollen,
werden wir obige Formel f?r die Berechnung des korrekten Durchmessers zu
gegebener Brennweite verwenden. Da Experten mehrere Werte f?r die
``PC``-Konstante anbieten, m?ssen wir uns hier f?r einen Wert
entscheiden.

In der Programmierung unter UNIX? ist es ?blich, zwei Hauptvarianten
anzubieten, um Parameter an Programme zu ?bergeben, und des weiteren
eine Standardeinstellung f?r den Fall zu haben, das der Benutzer gar
keine Parameter angibt.

Warum zwei Varianten, Parameter anzugeben?

Ein Grund ist, eine (relativ) *feste* Einstellung anzubieten, die
automatisch bei jedem Programmaufruf verwendet wird, ohne das wir diese
Einstellung immer und immer wieder mit angeben m?ssen.

Die feste Einstellung kann in einer Konfigurationsdatei gespeichert
sein, typischerweise im Heimatverzeichnis des Benutzers. Die Datei hat
?blicherweise denselben Namen wie das zugeh?rige Programm, beginnt
jedoch mit einem Punkt. H?ufig wird *"rc"* dem Dateinamen hinzugef?gt.
Unsere Konfigurationsdatei k?nnte also ``~/.pinhole`` oder
``~/.pinholerc`` hei?en. (Die Zeichenfolge ``~/`` steht f?r das
Heimatverzeichnis des aktuellen Benutzers.)

Konfigurationsdateien werden h?ufig von Programmen verwendet, die viele
konfigurierbare Parameter besitzen. Programme, die nur eine (oder
wenige) Parameter anbieten, verwenden h?ufig eine andere Methode: Sie
erwarten die Parameter in einer *Umgebungsvariablen*. In unserem Fall
k?nnten wir eine Umgebungsvariable mit dem Namen ``PINHOLE`` benutzen.

Normalerweise verwendet ein Programm entweder die eine, oder die andere
der beiden obigen Methoden. Ansonsten k?nnte ein Programm verwirrt
werden, wenn eine Konfigurationsdatei das eine sagt, die
Umgebungsvariable jedoch etwas anderes.

Da wir nur *einen* Parameter unterst?tzen m?ssen, verwenden wir die
zweite Methode, und benutzen eine Umgebungsvariable mit dem Namen
``PINHOLE``.

Der andere Weg erlaubt uns, *ad hoc* Entscheidungen zu treffen: *"Obwohl
ich normalerweise einen Wert von 0.039 verwende, will ich dieses eine
Mal einen Wert von 0.03872 anwenden."* Mit anderen Worten, dies erlaubt
uns, die Standardeinstellung au?er Kraft zu setzen.

Diese Art der Auswahl wird h?ufig ?ber Kommandozeilenparameter gemacht.

Schlie?lich braucht ein Programm *immer* eine *Standardeinstellung*. Der
Benutzer k?nnte keine Parameter angeben. Vielleicht wei? er auch gar
nicht, was er einstellen sollte. Vielleicht will er es "einfach nur
ausprobieren". Vorzugsweise wird die Standardeinstellung eine sein, die
die meisten Benutzer sowieso w?hlen w?rden. Somit m?ssen diese keine
zus?tzlichen Parameter angeben, bzw. k?nnen die Standardeinstellung ohne
zus?tzlichen Aufwand benutzen.

Bei diesem System k?nnte das Programm widerspr?chliche Optionen
vorfinden, und auf die folgende Weise reagieren:

.. raw:: html

   <div class="procedure">

#. Wenn es eine *ad hoc*-Einstellung vorfindet (z.B. ein
   Kommandozeilenparameter), dann sollte es diese Einstellung annehmen.
   Es mu? alle vorher festgelegten sowie die standardm??ige Einstellung
   ignorieren.

#. *Andererseits*, wenn es eine festgelegte Option (z.B. eine
   Umgebungsvariable) vorfindet, dann sollte es diese akzeptieren und
   die Standardeinstellung ignorieren.

#. *Ansonsten* sollte es die Standardeinstellung verwenden.

.. raw:: html

   </div>

Wir m?ssen auch entscheiden, welches *Format* unsere ``PC``-Option haben
soll.

Auf den ersten Blick scheint es einleuchtend, das Format
``PINHOLE=0.04`` f?r die Umgebungsvariable, und *``-p0.04``* f?r die
Kommandozeile zu verwenden.

Dies zuzulassen w?re eigentlich eine Sicherheitsl?cke. Die
``PC``-Konstante ist eine sehr kleine Zahl. Daher w?rden wir unsere
Anwendung mit verschiedenen, kleinen Werten f?r ``PC`` testen. Aber was
w?rde passieren, wenn jemand das Programm mit einem sehr gro?en Wert
aufrufen w?rde?

Es k?nnte abst?rzen, weil wir das Programm nicht f?r den Umgang mit
gro?en Werten entworfen haben.

Oder wir investieren noch weiter Zeit in das Programm, so da? dieses
dann auch mit gro?en Zahlen umgehen kann. Wir k?nnten dies machen, wenn
wir kommerzielle Software f?r computertechnisch unerfahrene Benutzer
schreiben w?rden.

Oder wir k?nnten auch sagen *"Pech gehabt! Der Benutzer sollte es besser
wissen."*

Oder wir k?nnten es f?r den Benutzer unm?glich machen, gro?e Zahlen
einzugeben. Dies ist die Variante, die wir verwenden werden: Wir nehmen
einen *impliziten 0.*-Pr?fix an.

Mit anderen Worten, wenn der Benutzer den Wert ``0.04`` angeben will, so
mu? er entweder *``-p04``* als Parameter angeben, oder ``PINHOLE=04``
als Variable in seiner Umgebung definieren. Falls der Benutzer
*``-p9999999``* angibt, so wird dies als ``0.9999999``
interpretiert—zwar immer noch sinnlos, aber zumindest sicher.

Zweitens werden viele Benutzer einfach die Konstanten von Bender oder
Connors benutzen wollen. Um es diesen Benutzern einfacher zu machen,
werden wir *``-b``* als *``-p04``*, und *``-c``* als *``-p037``*
interpretieren.

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

11.13.3.3. Die Ausgabe
^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wir m?ssen festlegen, was und in welchem Format unsere Anwendung Daten
ausgeben soll.

Da wir als Eingabe beliebig viele Brennweiten erlauben, macht es Sinn,
die Ergebnisse in Form einer traditionellen Datenbank–Ausgabe
darzustellen, bei der zeilenweise zu jeder Brennweite der zugeh?rige
berechnete Wert, getrennt durch ein ``tab``-Zeichen, ausgegeben wird.

Optional sollten wir dem Benutzer die M?glichkeit geben, die Ausgabe in
dem schon beschriebenen CSV-Format festzulegen. In diesem Fall werden
wir zu Beginn der Ausgabe eine Zeile einf?gen, in der die Beschreibungen
der einzelnen Felder, durch Kommas getrennt, aufgelistet werden, gefolgt
von der Ausgabe der Daten wie schon beschrieben, wobei das
``tab``-Zeichen durch ein ``Komma`` ersetzt wird.

Wir brauchen eine Kommandozeilenoption f?r das CSV-Format. Wir k?nnen
nicht *``-c``* verwenden, da diese Option bereits f?r *verwende Connors
Konstante* steht. Aus irgendeinem seltsamen Grund bezeichnen viele
Webseiten CSV-Dateien als *"Excel Kalkulationstabelle"* (obwohl das
CSV-Format ?lter ist als Excel). Wir werden daher *``-e``* als Schalter
f?r die Ausgabe im CSV-Format verwenden.

Jede Zeile der Ausgabe wird mit einer Brennweite beginnen. Dies mag auf
den ersten Blick ?berfl?ssig erscheinen, besonders im interaktiven
Modus: Der Benutzer gibt einen Wert f?r die Brennweite ein, und das
Programm wiederholt diesen.

Der Benutzer kann jedoch auch mehrere Brennweiten in einer Zeile
angeben. Die Eingabe kann auch aus einer Datei, oder aus der Ausgabe
eines anderen Programmes, kommen. In diesen F?llen sieht der Benutzer
die Eingabewerte ?berhaupt nicht.

Ebenso kann die Ausgabe in eine Datei umgelenkt werden, was wir sp?ter
noch untersuchen werden, oder sie k?nnte an einen Drucker geschickt
werden, oder auch als Eingabe f?r ein weiteres Programm dienen.

Es macht also wohl Sinn, jede Zeile mit einer durch den Benutzer
eingegebenen Brennweite beginnen zu lassen.

Halt! Nicht, wie der Benutzer die Daten eingegeben hat. Was passiert,
wenn der Benutzer etwas wie folgt eingibt:

.. code:: screen

    00000000150

Offensichtlich m?ssen wir die f?hrenden Nullen vorher abschneiden.

Wir m?ssen also die Eingabe des Benutzers sorgf?ltig pr?fen, diese dann
in der FPU in die bin?re Form konvertieren, und dann von dort aus
ausgeben.

Aber...

Was ist, wenn der Benutzer etwas wie folgt eingibt:

.. code:: screen

    17459765723452353453534535353530530534563507309676764423

Ha! Das packed decimal-Format der FPU erlaubt uns die Eingabe einer
18–stelligen Zahl. Aber der Benutzer hat mehr als 18 Stellen eingegeben.
Wie gehen wir damit um?

Wir *k?nnten* unser Programm so modifizieren, da? es die ersten 18
Stellen liest, der FPU ?bergibt, dann weitere 18 Stellen liest, den
Inhalt des TOS mit einem Vielfachen von 10, entsprechend der Anzahl der
zus?tzlichen Stellen multipliziert, und dann beide Werte mittels ``add``
zusammen addiert.

Ja, wir k?nnten das machen. Aber in *diesem* Programm w?re es unn?tig
(in einem anderen w?re es vielleicht der richtige Weg): Selbst der
Erdumfang in Millimetern ergibt nur eine Zahl mit 11 Stellen.
Offensichtlich k?nnen wir keine Kamera dieser Gr??e bauen (jedenfalls
jetzt noch nicht).

Wenn der Benutzer also eine so gro?e Zahl eingibt, ist er entweder
gelangweilt, oder er testet uns, oder er versucht, in das System
einzudringen, oder er spielt— indem er irgendetwas anderes macht als
eine Lochkamera zu entwerfen.

Was werden wir tun?

Wir werden ihn ohrfeigen, gewisserma?en:

.. code:: screen

    17459765723452353453534535353530530534563507309676764423    ??? ??? ??? ??? ???

Um dies zu erreichen, werden wir einfach alle f?hrenden Nullen
ignorieren. Sobald wir eine Ziffer gefunden haben, die nicht Null ist,
initialisieren wir einen Z?hler mit ``0`` und beginnen mit drei
Schritten:

.. raw:: html

   <div class="procedure">

#. Sende die Ziffer an die Ausgabe.

#. F?ge die Ziffer einem Puffer hinzu, welchen wir sp?ter benutzen
   werden, um den packed decimal-Wert zu erzeugen, den wir an die FPU
   schicken k?nnen.

#. Erh?he den Z?hler um eins.

.. raw:: html

   </div>

W?hrend wir diese drei Schritte wiederholen, m?ssen wir auf zwei
Bedingungen achten:

.. raw:: html

   <div class="itemizedlist">

-  Wenn der Z?hler den Wert 18 ?bersteigt, h?ren wir auf, Ziffern dem
   Puffer hinzuzuf?gen. Wir lesen weiterhin Ziffern und senden sie an
   die Ausgabe.

-  Wenn, bzw. *falls*, das n?chste Eingabezeichen keine Zahl ist, sind
   wir mit der Bearbeitung der Eingabe erst einmal fertig.

   ?brigends k?nnen wir einfach Zeichen, die keine Ziffern sind,
   verwerfen, solange sie kein ``#``-Zeichen sind, welches wir an den
   Eingabestrom zur?ckgeben m?ssen. Dieses Zeichen markiert den Beginn
   eines Kommentars. An dieser Stelle mu? die Erzeugung der Ausgabe
   fertig sein, und wir m?ssen mit der Suche nach weiteren Eingabedaten
   fortfahren.

.. raw:: html

   </div>

Es bleibt immer noch eine M?glichkeit unber?cksichtigt: Wenn der
Benutzer eine Null (oder mehrere) eingibt, werden wir niemals eine von
Null verschiedene Zahl vorfinden.

Wir k?nnen solch einen Fall immer anhand des Z?hlerstandes feststellen,
welcher dann immer bei ``0`` bleibt. In diesem Fall m?ssen wir einfach
eine ``0`` an die Ausgabe senden, und anschlie?end dem Benutzer erneut
eine "Ohrfeige" verpassen:

.. code:: screen

    0    ??? ??? ??? ??? ???

Sobald wir die Brennweite ausgegeben, und die G?ltigkeit dieser Eingabe
verifiziert haben, (gr??er als ``0`` und kleiner als 18 Zahlen) k?nnen
wir den Durchmesser der Lochblende berechnen.

Es ist kein Zufall, da? *Lochblende* das Wort *Loch* enth?lt. In der Tat
ist eine Lochblende buchst?blich eine *Loch Blende*, also eine Blende,
in die mit einer Nadel vorsichtig ein kleines Loch gestochen wird.

Daher ist eine typische Lochblende sehr klein. Unsere Formel liefert uns
das Ergebnis in Millimetern. Wir werden dieses mit ``1000``
multiplizieren, so da? die Ausgabe in ``Mikrometern`` erfolgt.

An dieser Stelle m?ssen wir auf eine weitere Falle achten: *Zu hohe
Genauigkeit.*

Ja, die FPU wurde f?r mathematische Berechnungen mit hoher Genauigkeit
entworfen. Unsere Berechnungen hier erfordern jedoch keine solche
mathematische Genauigkeit. Wir haben es hier mit Physik zu tun (Optik,
um genau zu sein).

Angenommen, wir wollten aus eine Lastkraftwagen eine Lochkamera bauen
(wir w?ren dabei nicht die ersten, die das versuchen w?rden!).
Angenommen, die L?nge des Laderaumes betr?gt ``12`` Meter lang, so da?
wir eine Brennweite von ``12000`` h?tten. Verwenden wir Benders
Konstante, so erhalten wir durch Multiplizieren von ``0.04`` mit der
Quadratwurzel aus ``12000`` einen Wert von ``4.381780460`` Millimetern,
oder ``4381.780460`` Micrometern.

So oder so ist das Rechenergebnis absurd pr?zise. Unser Lastkraftwagen
ist nicht *genau* ``12000`` Millimeter lang. Wir haben diese L?nge nicht
mit einer so hohen Genauigkeit gemessen, weswegen es falsch w?re zu
behaupten, unser Lochblendendurchmesser m?sse exakt ``4.381780460``
Millimeter sein. Es reicht vollkommen aus, wenn der Durchmesser ``4.4``
Millimeter betr?gt.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Ich habe in obigem Beispiel das Rechenergebnis "nur" auf 10 Stellen
genau angegeben. Stellen Sie sich vor, wie absurd es w?re, die vollen
uns zur Verf?gung stehenden, 18 Stellen anzugeben!

.. raw:: html

   </div>

Wir m?ssen also die Anzahl der signifikanten Stellen beschr?nken. Eine
M?glichkeit w?re, die Mikrometer durch eine ganze Zahl darzustellen.
Unser Lastkraftwaren w?rde dann eine Lochblende mit einem Durchmesser
von ``4382`` Mikrometern ben?tigen. Betrachten wir diesen Wert, dann
stellen wir fest, das ``4400`` Mikrometer, oder ``4.4`` Millimeter,
immer noch genau genug ist.

Zus?tzlich k?nnen wir noch, unabh?ngig von der Gr??e eines
Rechenergebnisses, festlegen, da? wir nur vier signifikante Stellen
anzeigen wollen (oder weniger). Leider bietet uns die FPU nicht die
M?glichkeit, das Ergebnis automatisch bis auf eine bestimmte Stelle zu
runden (sie sieht die Daten ja nicht als Zahlen, sondern als bin?re
Daten an).

Wir m?ssen also selber einen Algorithmus entwerfen, um die Anzahl der
signifikanten Stellen zu reduzieren.

Hier ist meiner (ich denke er ist peinlich—wenn Ihnen ein besserer
Algorithmus einf?llt, verraten sie ihn mir *bitte*):

.. raw:: html

   <div class="procedure">

#. Initialisiere einen Z?hler mit ``0``.

#. Solange die Zahl gr??er oder gleich ``10000`` ist, dividiere die Zahl
   durch ``10``, und erh?he den Z?hler um eins.

#. Gebe das Ergebnis aus.

#. Solange der Z?hler gr??er als ``0`` ist, gebe eine ``0`` aus, und
   reduziere den Z?hler um eins.

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Der Wert ``10000`` ist nur f?r den Fall, da? Sie *vier* signifikante
Stellen haben wollen. F?r eine andere Anzahl signifikanter Stellen
m?ssen Sie den Wert ``10000`` mit ``10``, hoch der Anzahl der
gew?nschten signifikanten Stellen, ersetzen.

.. raw:: html

   </div>

Wir k?nnen so den Lochblendendurchmesser, auf vier signifikante Stellen
gerundet, ausgeben.

An dieser Stellen kennen wir nun die *Brennweite* und den
*Lochblendendurchmesser*. Wir haben also jetzt genug Informationen, um
den *f–Wert* zu bestimmen.

Wir werden den f–Wert, auf vier signifikante Stellen gerundet, ausgeben.
Es k?nnte passieren, da? diese vier Stellen recht wenig aussagen. Um die
Aussagekraft des f–Wertes zu erh?hen, k?nnten wir den n?chstliegenden,
*normalisierten f–Wert* bestimmen, also z.B. das n?chstliegende
Vielfache der Quadratwurzel aus 2.

Wir erreichen dies, indem wir den aktuellen f–Wert mit sich selbst
multiplizieren, so da? wir dessen Quadrat (``square``) erhalten.
Anschlie?end berechnen wir den Logarithmus zur Basis 2 von dieser Zahl.
Dies ist sehr viel einfacher, als direkt den Logarithmus zur Basis der
Quadratwurzel aus 2 zu berechnen! Wir runden dann das Ergebnis auf die
n?chstliegende ganze Zahl. Genau genommen k?nnen wir mit Hilfe der FPU
diese Berechnung beschleunigen: Wir k?nnen den op-Code ``fscale``
verwenden, um eine Zahl um 1 zu "skalieren", was dasselbe ist, wie eine
Zahl mittels ``shift`` um eine Stelle nach links zu verschieben. Am Ende
berechnen wir noch die Quadratwurzel aus allem, und erhalten dann den
n?chstliegenden, normalisierten f–Wert.

Wenn das alles jetzt viel zu kompliziert wirkt—oder viel zu
aufwendig—wird es vielleicht klarer, wenn man den Code selber
betrachtet. Wir ben?tigen insgesamt 9 op-Codes:

.. code:: programlisting

    fmul    st0, st0
        fld1
        fld     st1
        fyl2x
        frndint
        fld1
        fscale
        fsqrt
        fstp    st1

Die erste Zeile, ``fmul st0, st0``, quadriert den Inhalt des TOS (Top Of
Stack, was dasselbe ist wie ``st``, von nasm auch ``st0`` genannt). Die
Funktion ``fld1`` f?gt eine ``1`` dem TOS hinzu.

Die n?chste Zeile, ``fld       st1``, legt das Quadrat auf dem TOS ab.
An diesem Punkt befindet sich das Quadrat sowohl in ``st`` als auch in
``st(2)`` (es wird sich gleich zeigen, warum wir eine zweite Kopie auf
dem Stack lassen.) ``st(1)`` enth?lt die ``1``.

Im n?chsten Schritt, ``fyl2x``, wird der Logarithmus von ``st`` zur
Basis 2 berechnet, und anschlie?end mit ``st(1)`` multipliziert. Deshalb
haben wir vorher die ``1`` in ``st(1)`` abgelegt.

An dieser Stelle enth?lt ``st`` den gerade berechneten Logarithmus, und
``st(1)`` das Quadrat des aktuellen f–Wertes, den wir f?r sp?ter
gespeichert haben.

``frndint`` rundet den TOS zur n?chstliegenden ganzen Zahl. ``fld1``
legt eine ``1`` auf dem Stack ab. ``fscale`` shiftet die ``1`` auf dem
TOS um ``st(1)`` Stellen, wodurch im Endeffekt eine 2 in ``st(1)``
steht.

Schlie?lich berechnet ``fsqrt`` die Quadratwurzel des Rechenergebnisses,
also des n?chstliegenden, normalisierten f–Wertes.

Wir haben nun den n?chstliegenden, normalisierten f–Wert auf dem TOS
liegen, den auf den Logarithmus zur Basis 2 gerundeten, n?chstliegenden
ganzzahligen Wert in ``st(1)``, und das Quadrat des aktuellen f–Wertes
in ``st(2)``. Wir speichern den Wert f?r eine sp?tere Verwendung in
``st(2)``.

Aber wir brauchen den Inhalt von ``st(1)`` gar nicht mehr. Die letzte
Zeile, ``fstp st1``, platziert den Inhalt von ``st`` in ``st(1)``, und
erniedrigt den Stackpointer um eins. Dadurch ist der Inhalt von
``st(1)`` jetzt ``st``, der Inhalt von ``st(2)`` jetzt ``st(1)`` usw.
Der neue ``st`` speichert jetzt den normalisierten f–Wert. Der neue
``st(1)`` speichert das Quadrat des aktuellen f–Wertes f?r die Nachwelt.

Jetzt k?nnen wir den normalisierten f–Wert ausgeben. Da er normalisiert
ist, werden wir ihn nicht auf vier signifikante Stellen runden, sondern
stattdessen mit voller Genauigkeit ausgeben.

Der normalisierte f–Wert ist n?tzlich, solange er so klein ist, da? wir
ihn auf einem Photometer wiederfinden k?nnen. Ansonsten brauchen wir
eine andere Methode, um die ben?tigten Belichtungsdaten zu bestimmen.

Wir haben weiter oben eine Formel aufgestellt, ?ber die wir einen f–Wert
mit Hilfe eines anderen f–Wertes und den zugeh?rigen Belichtungsdaten
bestimmen k?nnen.

Jedes Photometer, das ich jemals gesehen habe, konnte die ben?tigte
Belichtungszeit f?r f5.6 berechnen. Wir werden daher einen *"f5.6
Multiplizierer"* berechnen, der uns den Faktor angibt, mit dem wir die
bei f5.6 gemessene Belichtungszeit f?r unsere Lochkamera multiplizieren
m?ssen.

Durch die Formel wissen wir, da? dieser Faktor durch Dividieren unseres
f–Wertes (der aktuelle Wert, nicht der normalisierte) durch ``5.6`` und
anschlie?endes Quadrieren, berechnen k?nnen.

Mathematisch ?quivalent dazu w?re, wenn wir das Quadrat unseres f–Wertes
durch das Quadrat von ``5.6`` dividieren w?rden.

Numerisch betrachtet wollen wir nicht zwei Zahlen quadrieren, wenn es
m?glich ist, nur eine Zahl zu quadrieren. Daher wirkt die erste Variante
auf den ersten Blick besser.

Aber...

``5.6`` ist eine *Konstante*. Wir m?ssen nicht wertvolle Rechenzeit der
FPU verschwenden. Es reicht aus, da? wir die Quadrate der einzelnen
f–Werte durch den konstanten Wert ``5.6?`` dividieren. Oder wir k?nnen
den jeweiligen f–Wert durch ``5.6`` dividieren, und dann das Ergebnis
quadrieren. Zwei M?glichkeiten, die gleich erscheinen.

Aber das sind sie nicht!

Erinnern wir uns an die Grundlagen der Photographie weiter oben, dann
wissen wir, da? sich die Konstante ``5.6`` aus dem 5-fachen der
Quadratwurzel aus 2 ergibt. Eine *irrationale* Zahl. Das Quadrat dieser
Zahl ist *exakt* ``32``.

``32`` ist nicht nur eine ganze Zahl, sondern auch ein Vielfaches von 2.
Wir brauchen also gar nicht das Quadrat eines f–Wertes durch ``32`` zu
teilen. Wir m?ssen lediglich mittels ``fscale`` den f–Wert um f?nf
Stellen nach rechts shiften. Aus Sicht der FPU m?ssen wir also
``fscale`` mit ``st(1)``, welcher gleich ``-5`` ist, auf den f–Wert
anwenden. Dies ist *sehr viel schneller* als die Division.

Jetzt wird es auch klar, warum wir das Quadrat des f–Wertes ganz oben
auf dem Stack der FPU gespeichert haben. Die Berechnung des f5.6
Multiplizierers ist die einfachste Berechnung des gesamten Programmes!
Wir werden das Ergebnis auf vier signifikante Stellen gerundet ausgeben.

Es gibt noch eine weitere n?tzliche Zahl, die wir berechnen k?nnen: Die
Anzahl der Stopps, die unser f–Wert von f5.6 entfernt ist. Dies k?nnte
hilfreich sein, wenn unser f–Wert au?erhalb des Me?bereiches unseres
Photometers liegt, wir aber eine Blende haben, bei der wir
unterschiedliche Geschwindigkeiten einstellen k?nnen, und diese Blende
Stopps benutzt.

Angenommen, unser f–Wert ist 5 Stopps von f5.6 entfernt, und unser
Photometer sagt uns, da? wir eine Belichtungszeit von 1/1000 Sek.
einstellen sollen. Dann k?nnen wir unsere Blende auf die Geschwindigkeit
1/1000 einstellen, und unsere Skala um 5 Stopps verschieben.

Diese Rechnung ist ebenfalls sehr einfach. Alles, was wir tun m?ssen,
ist, den Logarithmus des f5.6 Multiplizierers, den wir schon berechnet
haben (wobei wir dessen Wert vor der Rundung nehmen m?ssen) zur Basis 2
zu nehmen. Wir runden dann das Ergebnis zur n?chsten ganzen Zahl hin,
und geben dies aus. Wir m?ssen uns nicht darum k?mmern, ob wir mehr als
vier signifikante Stellen haben: Das Ergebnis besteht
h?chstwahrscheinlich nur aus einer oder zwei Stellen.

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

11.13.4. FPU Optimierungen
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In Assemblersprache k?nnen wir den Code f?r die FPU besser optimieren,
als in einer der Hochsprachen, inklusive C.

Sobald eine C-Funktion die Berechnung einer Flie?kommazahl durchf?hren
will, l?dt sie erst einmal alle ben?tigten Variablen und Konstanten in
die Register der FPU. Dann werden die Berechnungen durchgef?hrt, um das
korrekte Ergebnis zu erhalten. Gute C-Compiler k?nnen diesen Teil des
Codes sehr gut optimieren.

Das Ergebnis wird "zur?ckgegeben", indem dieses auf dem TOS abgelegt
wird. Vorher wird aufger?umt. S?mtliche Variablen und Konstanten, die
w?hrend der Berechnung verwendet wurden, werden dabei aus der FPU
entfernt.

Was wir im vorherigen Abschnitt selber getan haben, kann so nicht
durchgef?hrt werden: Wir haben das Quadrat des f–Wertes berechnet, und
das Ergebnis f?r eine weitere Berechnung mit einer anderen Funktion auf
dem Stack behalten.

Wir *wu?ten*, da? wir diesen Wert sp?ter noch einmal brauchen w?rden.
Wir wu?ten auch, da? auf dem Stack gen?gend Platz war (welcher nur Platz
f?r 8 Zahlen bietet), um den Wert dort zu speichern.

Ein C-Compiler kann nicht wissen, ob ein Wert auf dem Stack in naher
Zukunft noch einmal gebraucht wird.

Nat?rlich k?nnte der C-Programmierer dies wissen. Aber die einzige
M?glichkeit, die er hat, ist, den Wert im verf?gbaren Speicher zu
halten.

Das bedeutet zum einen, da? der Wert mit der FPU-internen, 80-stelligen
Genauigkeit in einer normalen C-Variable vom Typ *double* (64 Bit) oder
vom Typ *single* (32 Bit) gespeichert wird.

Dies bedeutet au?erdem, da? der Wert aus dem TOS in den Speicher
verschoben werden mu?, und sp?ter wieder zur?ck. Von allen Operationen
mit der FPU ist der Zugriff auf den Speicher die langsamste.

Wann immer also mit der FPU in einer Assemblersprache programmiert wird,
sollte nach M?glichkeiten gesucht werden, Zwischenergebnisse auf dem
Stack der FPU zu lassen.

Wir k?nnen mit dieser Idee noch einen Schritt weiter gehen! In unserem
Programm verwenden wir eine *Konstante* (die wir ``PC`` genannt haben).

Es ist unwichtig, wieviele Lochblendendurchmesser wir berechnen: 1, 10,
20, 1000, wir verwenden immer dieselbe Konstante. Daher k?nnen wir unser
Programm so optimieren, da? diese Konstante immer auf dem Stack belassen
wird.

Am Anfang unseres Programmes berechnen wir die oben erw?hnte Konstante.
Wir m?ssen die Eingabe f?r jede Dezimalstelle der Konstanten durch
``10`` dividieren.

Multiplizieren geht sehr viel schneller als Dividieren. Wir teilen also
zu Beginn unseres Programmes ``1`` durch ``10``, um ``0.1`` zu erhalten,
was wir auf dem Stack speichern: Anstatt da? wir nun f?r jede einzelne
Dezimalstelle die Eingabe wieder durch ``10`` teilen, multiplizieren wir
sie stattdessen mit ``0.1``.

Auf diese Weise geben wir ``0.1`` nicht direkt ein, obwohl wir dies
k?nnten. Dies hat einen Grund: W?hrend ``0.1`` durch nur eine einzige
Dezimalstelle dargestellt werden kann, wissen wir nicht, wieviele
*bin?re* Stellen ben?tigt werden. Wir ?berlassen die Berechnung des
bin?ren Wertes daher der FPU, mit dessen eigener, hoher Genauigkeit.

Wir verwenden noch weitere Konstanten: Wir multiplizieren den
Lochblendendurchmesser mit ``1000``, um den Wert von Millimeter in
Micrometer zu konvertieren. Wir vergleichen Werte mit ``10000``, wenn
wir diese auf vier signifikante Stellen runden wollen. Wir behalten also
beide Konstanten, ``1000`` und ``10000``, auf dem Stack. Und
selbstverst?ndlich verwenden wir erneut die gespeicherte ``0.1``, um
Werte auf vier signifikante Stellen zu runden.

Zu guter letzt behalten wir ``-5`` noch auf dem Stack. Wir brauchen
diesen Wert, um das Quadrat des f–Wertes zu skalieren, anstatt diesen
durch ``32`` zu teilen. Es ist kein Zufall, da? wir diese Konstante als
letztes laden. Dadurch wird diese Zahl die oberste Konstante auf dem
Stack. Wenn sp?ter das Quadrat des f–Wertes skaliert werden mu?,
befindet sich die ``-5`` in ``st(1)``, also genau da, wo die Funktion
``fscale`` diesen Wert erwartet.

Es ist ?blich, einige Konstanten per Hand zu erzeugen, anstatt sie aus
dem Speicher zu laden. Genau das machen wir mit der ``-5``:

.. code:: programlisting

            fld1            ; TOS =  1
            fadd    st0, st0    ; TOS =  2
            fadd    st0, st0    ; TOS =  4
            fld1            ; TOS =  1
            faddp   st1, st0    ; TOS =  5
            fchs            ; TOS = -5

Wir k?nnen all diese Optimierungen in einer Regel zusammenfassen:
*Behalte wiederverwendbare Werte auf dem Stack!*

.. raw:: html

   <div class="tip" xmlns="">

Tipp:
~~~~~

*PostScript?* ist eine Stack-orientierte Programmiersprache. Es gibt
weit mehr B?cher ?ber PostScript?, als ?ber die Assemblersprache der
FPU: Werden Sie in PostScript? besser, dann werden Sie auch automatisch
in der Programmierung der FPU besser.

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

11.13.5. pinhole—Der Code
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. code:: programlisting

    ;;;;;;; pinhole.asm ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;
    ; Find various parameters of a pinhole camera construction and use
    ;
    ; Started:   9-Jun-2001
    ; Updated:  10-Jun-2001
    ;
    ; Copyright (c) 2001 G. Adam Stanislav
    ; All rights reserved.
    ;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    %include    'system.inc'

    %define BUFSIZE 2048

    section .data
    align 4
    ten dd  10
    thousand    dd  1000
    tthou   dd  10000
    fd.in   dd  stdin
    fd.out  dd  stdout
    envar   db  'PINHOLE='  ; Exactly 8 bytes, or 2 dwords long
    pinhole db  '04,',      ; Bender's constant (0.04)
    connors db  '037', 0Ah  ; Connors' constant
    usg db  'Usage: pinhole [-b] [-c] [-e] [-p <value>] [-o <outfile>] [-i <infile>]', 0Ah
    usglen  equ $-usg
    iemsg   db  "pinhole: Can't open input file", 0Ah
    iemlen  equ $-iemsg
    oemsg   db  "pinhole: Can't create output file", 0Ah
    oemlen  equ $-oemsg
    pinmsg  db  "pinhole: The PINHOLE constant must not be 0", 0Ah
    pinlen  equ $-pinmsg
    toobig  db  "pinhole: The PINHOLE constant may not exceed 18 decimal places", 0Ah
    biglen  equ $-toobig
    huhmsg  db  9, '???'
    separ   db  9, '???'
    sep2    db  9, '???'
    sep3    db  9, '???'
    sep4    db  9, '???', 0Ah
    huhlen  equ $-huhmsg
    header  db  'focal length in millimeters,pinhole diameter in microns,'
        db  'F-number,normalized F-number,F-5.6 multiplier,stops '
        db  'from F-5.6', 0Ah
    headlen equ $-header

    section .bss
    ibuffer resb    BUFSIZE
    obuffer resb    BUFSIZE
    dbuffer resb    20      ; decimal input buffer
    bbuffer resb    10      ; BCD buffer

    section .text
    align 4
    huh:
        call    write
        push    dword huhlen
        push    dword huhmsg
        push    dword [fd.out]
        sys.write
        add esp, byte 12
        ret

    align 4
    perr:
        push    dword pinlen
        push    dword pinmsg
        push    dword stderr
        sys.write
        push    dword 4     ; return failure
        sys.exit

    align 4
    consttoobig:
        push    dword biglen
        push    dword toobig
        push    dword stderr
        sys.write
        push    dword 5     ; return failure
        sys.exit

    align 4
    ierr:
        push    dword iemlen
        push    dword iemsg
        push    dword stderr
        sys.write
        push    dword 1     ; return failure
        sys.exit

    align 4
    oerr:
        push    dword oemlen
        push    dword oemsg
        push    dword stderr
        sys.write
        push    dword 2
        sys.exit

    align 4
    usage:
        push    dword usglen
        push    dword usg
        push    dword stderr
        sys.write
        push    dword 3
        sys.exit

    align 4
    global  _start
    _start:
        add esp, byte 8 ; discard argc and argv[0]
        sub esi, esi

    .arg:
        pop ecx
        or  ecx, ecx
        je  near .getenv        ; no more arguments

        ; ECX contains the pointer to an argument
        cmp byte [ecx], '-'
        jne usage

        inc ecx
        mov ax, [ecx]
        inc ecx

    .o:
        cmp al, 'o'
        jne .i

        ; Make sure we are not asked for the output file twice
        cmp dword [fd.out], stdout
        jne usage

        ; Find the path to output file - it is either at [ECX+1],
        ; i.e., -ofile --
        ; or in the next argument,
        ; i.e., -o file

        or  ah, ah
        jne .openoutput
        pop ecx
        jecxz   usage

    .openoutput:
        push    dword 420   ; file mode (644 octal)
        push    dword 0200h | 0400h | 01h
        ; O_CREAT | O_TRUNC | O_WRONLY
        push    ecx
        sys.open
        jc  near oerr

        add esp, byte 12
        mov [fd.out], eax
        jmp short .arg

    .i:
        cmp al, 'i'
        jne .p

        ; Make sure we are not asked twice
        cmp dword [fd.in], stdin
        jne near usage

        ; Find the path to the input file
        or  ah, ah
        jne .openinput
        pop ecx
        or  ecx, ecx
        je near usage

    .openinput:
        push    dword 0     ; O_RDONLY
        push    ecx
        sys.open
        jc  near ierr       ; open failed

        add esp, byte 8
        mov [fd.in], eax
        jmp .arg

    .p:
        cmp al, 'p'
        jne .c
        or  ah, ah
        jne .pcheck

        pop ecx
        or  ecx, ecx
        je  near usage

        mov ah, [ecx]

    .pcheck:
        cmp ah, '0'
        jl  near usage
        cmp ah, '9'
        ja  near usage
        mov esi, ecx
        jmp .arg

    .c:
        cmp al, 'c'
        jne .b
        or  ah, ah
        jne near usage
        mov esi, connors
        jmp .arg

    .b:
        cmp al, 'b'
        jne .e
        or  ah, ah
        jne near usage
        mov esi, pinhole
        jmp .arg

    .e:
        cmp al, 'e'
        jne near usage
        or  ah, ah
        jne near usage
        mov al, ','
        mov [huhmsg], al
        mov [separ], al
        mov [sep2], al
        mov [sep3], al
        mov [sep4], al
        jmp .arg

    align 4
    .getenv:
        ; If ESI = 0, we did not have a -p argument,
        ; and need to check the environment for "PINHOLE="
        or  esi, esi
        jne .init

        sub ecx, ecx

    .nextenv:
        pop esi
        or  esi, esi
        je  .default    ; no PINHOLE envar found

        ; check if this envar starts with 'PINHOLE='
        mov edi, envar
        mov cl, 2       ; 'PINHOLE=' is 2 dwords long
    rep cmpsd
        jne .nextenv

        ; Check if it is followed by a digit
        mov al, [esi]
        cmp al, '0'
        jl  .default
        cmp al, '9'
        jbe .init
        ; fall through

    align 4
    .default:
        ; We got here because we had no -p argument,
        ; and did not find the PINHOLE envar.
        mov esi, pinhole
        ; fall through

    align 4
    .init:
        sub eax, eax
        sub ebx, ebx
        sub ecx, ecx
        sub edx, edx
        mov edi, dbuffer+1
        mov byte [dbuffer], '0'

        ; Convert the pinhole constant to real
    .constloop:
        lodsb
        cmp al, '9'
        ja  .setconst
        cmp al, '0'
        je  .processconst
        jb  .setconst

        inc dl

    .processconst:
        inc cl
        cmp cl, 18
        ja  near consttoobig
        stosb
        jmp short .constloop

    align 4
    .setconst:
        or  dl, dl
        je  near perr

        finit
        fild    dword [tthou]

        fld1
        fild    dword [ten]
        fdivp   st1, st0

        fild    dword [thousand]
        mov edi, obuffer

        mov ebp, ecx
        call    bcdload

    .constdiv:
        fmul    st0, st2
        loop    .constdiv

        fld1
        fadd    st0, st0
        fadd    st0, st0
        fld1
        faddp   st1, st0
        fchs

        ; If we are creating a CSV file,
        ; print header
        cmp byte [separ], ','
        jne .bigloop

        push    dword headlen
        push    dword header
        push    dword [fd.out]
        sys.write

    .bigloop:
        call    getchar
        jc  near done

        ; Skip to the end of the line if you got '#'
        cmp al, '#'
        jne .num
        call    skiptoeol
        jmp short .bigloop

    .num:
        ; See if you got a number
        cmp al, '0'
        jl  .bigloop
        cmp al, '9'
        ja  .bigloop

        ; Yes, we have a number
        sub ebp, ebp
        sub edx, edx

    .number:
        cmp al, '0'
        je  .number0
        mov dl, 1

    .number0:
        or  dl, dl      ; Skip leading 0's
        je  .nextnumber
        push    eax
        call    putchar
        pop eax
        inc ebp
        cmp ebp, 19
        jae .nextnumber
        mov [dbuffer+ebp], al

    .nextnumber:
        call    getchar
        jc  .work
        cmp al, '#'
        je  .ungetc
        cmp al, '0'
        jl  .work
        cmp al, '9'
        ja  .work
        jmp short .number

    .ungetc:
        dec esi
        inc ebx

    .work:
        ; Now, do all the work
        or  dl, dl
        je  near .work0

        cmp ebp, 19
        jae near .toobig

        call    bcdload

        ; Calculate pinhole diameter

        fld st0 ; save it
        fsqrt
        fmul    st0, st3
        fld st0
        fmul    st5
        sub ebp, ebp

        ; Round off to 4 significant digits
    .diameter:
        fcom    st0, st7
        fstsw   ax
        sahf
        jb  .printdiameter
        fmul    st0, st6
        inc ebp
        jmp short .diameter

    .printdiameter:
        call    printnumber ; pinhole diameter

        ; Calculate F-number

        fdivp   st1, st0
        fld st0

        sub ebp, ebp

    .fnumber:
        fcom    st0, st6
        fstsw   ax
        sahf
        jb  .printfnumber
        fmul    st0, st5
        inc ebp
        jmp short .fnumber

    .printfnumber:
        call    printnumber ; F number

        ; Calculate normalized F-number
        fmul    st0, st0
        fld1
        fld st1
        fyl2x
        frndint
        fld1
        fscale
        fsqrt
        fstp    st1

        sub ebp, ebp
        call    printnumber

        ; Calculate time multiplier from F-5.6

        fscale
        fld st0

        ; Round off to 4 significant digits
    .fmul:
        fcom    st0, st6
        fstsw   ax
        sahf

        jb  .printfmul
        inc ebp
        fmul    st0, st5
        jmp short .fmul

    .printfmul:
        call    printnumber ; F multiplier

        ; Calculate F-stops from 5.6

        fld1
        fxch    st1
        fyl2x

        sub ebp, ebp
        call    printnumber

        mov al, 0Ah
        call    putchar
        jmp .bigloop

    .work0:
        mov al, '0'
        call    putchar

    align 4
    .toobig:
        call    huh
        jmp .bigloop

    align 4
    done:
        call    write       ; flush output buffer

        ; close files
        push    dword [fd.in]
        sys.close

        push    dword [fd.out]
        sys.close

        finit

        ; return success
        push    dword 0
        sys.exit

    align 4
    skiptoeol:
        ; Keep reading until you come to cr, lf, or eof
        call    getchar
        jc  done
        cmp al, 0Ah
        jne .cr
        ret

    .cr:
        cmp al, 0Dh
        jne skiptoeol
        ret

    align 4
    getchar:
        or  ebx, ebx
        jne .fetch

        call    read

    .fetch:
        lodsb
        dec ebx
        clc
        ret

    read:
        jecxz   .read
        call    write

    .read:
        push    dword BUFSIZE
        mov esi, ibuffer
        push    esi
        push    dword [fd.in]
        sys.read
        add esp, byte 12
        mov ebx, eax
        or  eax, eax
        je  .empty
        sub eax, eax
        ret

    align 4
    .empty:
        add esp, byte 4
        stc
        ret

    align 4
    putchar:
        stosb
        inc ecx
        cmp ecx, BUFSIZE
        je  write
        ret

    align 4
    write:
        jecxz   .ret    ; nothing to write
        sub edi, ecx    ; start of buffer
        push    ecx
        push    edi
        push    dword [fd.out]
        sys.write
        add esp, byte 12
        sub eax, eax
        sub ecx, ecx    ; buffer is empty now
    .ret:
        ret

    align 4
    bcdload:
        ; EBP contains the number of chars in dbuffer
        push    ecx
        push    esi
        push    edi

        lea ecx, [ebp+1]
        lea esi, [dbuffer+ebp-1]
        shr ecx, 1

        std

        mov edi, bbuffer
        sub eax, eax
        mov [edi], eax
        mov [edi+4], eax
        mov [edi+2], ax

    .loop:
        lodsw
        sub ax, 3030h
        shl al, 4
        or  al, ah
        mov [edi], al
        inc edi
        loop    .loop

        fbld    [bbuffer]

        cld
        pop edi
        pop esi
        pop ecx
        sub eax, eax
        ret

    align 4
    printnumber:
        push    ebp
        mov al, [separ]
        call    putchar

        ; Print the integer at the TOS
        mov ebp, bbuffer+9
        fbstp   [bbuffer]

        ; Check the sign
        mov al, [ebp]
        dec ebp
        or  al, al
        jns .leading

        ; We got a negative number (should never happen)
        mov al, '-'
        call    putchar

    .leading:
        ; Skip leading zeros
        mov al, [ebp]
        dec ebp
        or  al, al
        jne .first
        cmp ebp, bbuffer
        jae .leading

        ; We are here because the result was 0.
        ; Print '0' and return
        mov al, '0'
        jmp putchar

    .first:
        ; We have found the first non-zero.
        ; But it is still packed
        test    al, 0F0h
        jz  .second
        push    eax
        shr al, 4
        add al, '0'
        call    putchar
        pop eax
        and al, 0Fh

    .second:
        add al, '0'
        call    putchar

    .next:
        cmp ebp, bbuffer
        jb  .done

        mov al, [ebp]
        push    eax
        shr al, 4
        add al, '0'
        call    putchar
        pop eax
        and al, 0Fh
        add al, '0'
        call    putchar

        dec ebp
        jmp short .next

    .done:
        pop ebp
        or  ebp, ebp
        je  .ret

    .zeros:
        mov al, '0'
        call    putchar
        dec ebp
        jne .zeros

    .ret:
        ret

Der Code folgt demselben Aufbau wie alle anderen Filter, die wir bisher
gesehen haben, bis auf eine Kleinigkeit:

.. raw:: html

   <div class="blockquote">

    Wir nehmen nun nicht mehr an, da? das Ende der Eingabe auch das Ende
    der n?tigen Arbeit bedeutet, etwas, das wir f?r *zeichenbasierte*
    Filter automatisch angenommen haben.

    Dieser Filter verarbeitet keine Zeichen. Er verarbeitet eine
    *Sprache* (obgleich eine sehr einfache, die nur aus Zahlen besteht).

    Wenn keine weiteren Eingaben vorliegen, kann das zwei Ursachen
    haben:

    .. raw:: html

       <div class="itemizedlist">

    -  Wir sind fertig und k?nnen aufh?ren. Dies ist dasselbe wie
       vorher.

    -  Das Zeichen, das wir eingelesen haben, war eine Zahl. Wir haben
       diese am Ende unseres ASCII –zu–float Kovertierungspuffers
       gespeichert. Wir m?ssen nun den gesamten Pufferinhalt in eine
       Zahl konvertieren, und die letzte Zeile unserer Ausgabe ausgeben.

    .. raw:: html

       </div>

    Aus diesem Grund haben wir unsere ``getchar       ``- und
    ``read``-Routinen so angepa?t, da? sie das ``carry flag`` *clear*
    immer dann zur?ckgeben, wenn wir ein weiteres Zeichen aus der
    Eingabe lesen, und das ``carry flag`` *set* immer dann zur?ckgeben,
    wenn es keine weiteren Eingabedaten gibt.

    Selbstverst?ndlich verwenden wir auch hier die Magie der
    Assemblersprache! Schauen Sie sich ``getchar`` n?her an. Dieses gibt
    *immer* das ``carry flag`` *clear* zur?ck.

    Dennoch basiert der Hauptteil unseres Programmes auf dem
    ``carry flag``, um diesem eine Beendigung mitzuteilen—und es
    funktioniert.

    Die Magie passiert in ``read``. Wann immer weitere Eingaben durch
    das System zur Verf?gung stehen, ruft diese Funktion ``getchar``
    auf, welche ein weiteres Zeichen aus dem Eingabepuffer einliest, und
    anschlie?end das ``carry flag`` *clear*t.

    Wenn aber ``read`` keine weiteren Eingaben von dem System bekommt,
    ruft dieses *nicht* ``getchar`` auf. Stattdessen addiert der op-Code
    ``add esp, byte 4`` ``4`` zu ``ESP`` hinzu, *setzt* das
    ``carry flag``, und springt zur?ck.

    Wo springt diese Funktion hin? Wann immer ein Programm den op-Code
    ``call`` verwendet, ``push``\ t der Mikroprozessor die
    R?cksprungandresse, d.h. er speichert diese ganz oben auf dem Stack
    (nicht auf dem Stack der FPU, sondern auf dem Systemstack, der sich
    im Hauptspeicher befindet). Wenn ein Programm den op-Code ``ret``
    verwendet, ``pop``\ t der Mikroprozessor den R?ckgabewert von dem
    Stack, und springt zu der Adresse, die dort gespeichert wurde.

    Da wir aber ``4`` zu ``ESP`` hinzuaddiert haben (welches das
    Register der Stackzeiger ist), haben wir effektiv dem Mikroprzessor
    eine kleine *Amnesie* verpa?t: Dieser erinnert sich nun nicht mehr
    daran, da? ``getchar`` durch ``read`` aufgerufen wurde.

    Und da ``getchar`` nichts vor dem Aufruf von ``read`` auf dem Stack
    abgelegt hat, enth?lt der Anfang des Stacks nun die
    R?cksprungadresse von der Funktion, die ``getchar`` aufgerufen hat.
    Soweit es den Aufrufer betrifft, hat dieser ``getchar``
    ge\ ``call``\ t, welche mit einem gesetzten ``carry flag``
    ``ret``\ urned.

.. raw:: html

   </div>

Des weiteren wird die Routine ``bcdload`` bei einem klitzekleinen
Problem zwischen der Big–Endian- und Little–Endian-Codierung aufgerufen.

Diese konvertiert die Textrepr?sentation einer Zahl in eine andere
Textrepr?sentation: Der Text wird in der Big–Endian-Codierung
gespeichert, die *packed decimal*-Darstellung jedoch in der
Little–Endian-Codierung.

Um dieses Problem zu l?sen haben wir vorher den op-Code ``std``
verwendet. Wir machen diesen Aufruf sp?ter mittels ``cld`` wieder
r?ckg?ngig: Es ist sehr wichtig, da? wir keine Funktion mittels ``call``
aufrufen, die von einer Standardeinstellung des *Richtungsflags*
abh?ngig ist, w?hrend ``std`` ausgef?hrt wird.

Alles weitere in dem Programm sollte leicht zu verstehen sein,
vorausgesetzt, da? Sie das gesamte vorherige Kapitel gelesen haben.

Es ist ein klassisches Beispiel f?r das Sprichwort, da? das
Programmieren eine Menge Denkarbeit, und nur ein wenig Programmcode
ben?tigt. Sobald wir uns ?ber jedes Detail im klaren sind, steht der
Code fast schon da.

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

11.13.6. Das Programm pinhole verwenden
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Da wir uns bei dem Programm daf?r entschieden haben, alle Eingaben, die
keine Zahlen sind, zu ignorieren (selbst die in Kommentaren), k?nnen wir
jegliche *textbasierten Eingaben* verarbeiten. Wir *m?ssen* dies nicht
tun, wir *k?nnten* aber.

Meiner bescheidenen Meinung nach wird ein Programm durch die
M?glichkeit, anstatt einer strikten Eingabesyntax textbasierte Anfragen
stellen zu k?nnen, sehr viel benutzerfreundlicher.

Angenommen, wir wollten eine Lochkamera f?r einen 4x5 Zoll Film bauen.
Die standardm??ige Brennweite f?r diesen Film ist ungef?hr 150mm. Wir
wollen diesen Wert *optimieren*, so da? der Lochblendendurchmesser eine
m?glichst runde Zahl ergibt. Lassen Sie uns weiter annehmen, da? wir
zwar sehr gut mit Kameras umgehen k?nnen, daf?r aber nicht so gut mit
Computern. Anstatt das wir nun eine Reihe von Zahlen eingeben, wollen
wir lieber ein paar *Fragen* stellen.

Unsere Sitzung k?nnte wie folgt aussehen:

.. code:: screen

    % pinhole

    Computer,

    Wie gro? m??te meine Lochblende bei einer Brennweite
    von 150 sein?
    150 490 306 362 2930    12
    Hmmm... Und bei 160?
    160 506 316 362 3125    12
    La? uns bitte 155 nehmen.
    155 498 311 362 3027    12
    Ah, la? uns 157 probieren...
    157 501 313 362 3066    12
    156?
    156 500 312 362 3047    12
    Das ist es! Perfekt! Vielen Dank!
    ^D

Wir haben herausgefunden, da? der Lochblendendurchmesser bei einer
Brennweite von 150 mm 490 Mikrometer, oder 0.49 mm ergeben w?rde. Bei
einer fast identischen Brennweite von 156 mm w?rden wir einen
Durchmesser von genau einem halben Millimeter bekommen.

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

11.13.7. Skripte schreiben
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Da wir uns daf?r entschieden haben, das Zeichen ``#`` als den Anfang
eines Kommentares zu interpretieren, k?nnen wir unser pinhole-Programm
auch als *Skriptsprache* verwenden.

Sie haben vielleicht schon einmal shell*-Skripte* gesehen, die mit
folgenden Zeichen begonnen haben:

.. code:: programlisting

    #! /bin/sh

...oder...

.. code:: programlisting

    #!/bin/sh

... da das Leerzeichen hinter dem ``#!`` optional ist.

Wann immer UNIX? eine Datei ausf?hren soll, die mit einem ``#!``
beginnt, wird angenommen, das die Datei ein Skript ist. Es f?gt den
Befehl an das Ende der ersten Zeile an, und versucht dann, dieses
auszuf?hren.

Angenommen, wir haben unser Programm pinhole unter /usr/local/bin/
installiert, dann k?nnen wir nun Skripte schreiben, um unterschiedliche
Lochblendendurchmesser f?r mehrere Brennweiten zu berechnen, die
normalerweise mit 120er Filmen verwendet werden.

Das Skript k?nnte wie folgt aussehen:

.. code:: programlisting

    #! /usr/local/bin/pinhole -b -i
    # Find the best pinhole diameter
    # for the 120 film

    ### Standard
    80

    ### Wide angle
    30, 40, 50, 60, 70

    ### Telephoto
    100, 120, 140

Da ein 120er Film ein Film mittlerer Gr??e ist, k?nnten wir die Datei
medium nennen.

Wir k?nnen die Datei ausf?hrbar machen und dann aufrufen, als w?re es
ein Programm:

.. code:: screen

    % chmod 755 medium
    % ./medium

UNIX? wird den letzten Befehl wie folgt interpretieren:

.. code:: screen

    % /usr/local/bin/pinhole -b -i ./medium

Es wird den Befehl ausf?hren und folgendes ausgeben:

.. code:: screen

    80 358 224 256 1562    11
    30  219 137 128 586 9
    40  253 158 181 781 10
    50  283 177 181 977 10
    60  310 194 181 1172    10
    70  335 209 181 1367    10
    100 400 250 256 1953    11
    120 438 274 256 2344    11
    140 473 296 256 2734    11

Lassen Sie uns nun das folgende eingeben:

.. code:: screen

    % ./medium -c

UNIX? wird dieses wie folgt behandeln:

.. code:: screen

    % /usr/local/bin/pinhole -b -i ./medium -c

Dadurch erh?lt das Programm zwei widerspr?chliche Optionen: *``-b``* und
*``-c``* (Verwende Benders Konstante und verwende Connors Konstante).
Wir haben unser Programm so geschrieben, da? sp?ter eingelesene Optionen
die vorheringen ?berschreiben—unser Programm wird also Connors Konstante
f?r die Berechnungen verwenden:

.. code:: screen

    80 331 242 256 1826    11
    30  203 148 128 685 9
    40  234 171 181 913 10
    50  262 191 181 1141    10
    60  287 209 181 1370    10
    70  310 226 256 1598    11
    100 370 270 256 2283    11
    120 405 296 256 2739    11
    140 438 320 362 3196    12

Wir entscheiden uns am Ende doch f?r Benders Konstante. Wir wollen die
Ergebnisse im CSV-Format in einer Datei speichern:

.. code:: screen

    % ./medium -b -e > bender
    % cat bender
    focal length in millimeters,pinhole diameter in microns,F-number,normalized F-number,F-5.6 multiplier,stops from F-5.6
    80,358,224,256,1562,11
    30,219,137,128,586,9
    40,253,158,181,781,10
    50,283,177,181,977,10
    60,310,194,181,1172,10
    70,335,209,181,1367,10
    100,400,250,256,1953,11
    120,438,274,256,2344,11
    140,473,296,256,2734,11
    %

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------------+-------------------------------+------------------------------------+
| `Zur?ck <x86-one-pointed-mind.html>`__?   | `Nach oben <x86.html>`__      | ?\ `Weiter <x86-caveats.html>`__   |
+-------------------------------------------+-------------------------------+------------------------------------+
| 11.12. One-Pointed Mind?                  | `Zum Anfang <index.html>`__   | ?11.14. Vorsichtsmassnahmen        |
+-------------------------------------------+-------------------------------+------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
