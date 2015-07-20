==========================
11.14. Vorsichtsmassnahmen
==========================

.. raw:: html

   <div class="navheader">

11.14. Vorsichtsmassnahmen
`Zur?ck <x86-fpu.html>`__?
Kapitel 11. x86-Assembler-Programmierung
?\ `Weiter <x86-acknowledgements.html>`__

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

11.14. Vorsichtsmassnahmen
--------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

?bersetzt von Daniel Seuffert.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Assembler-Programmierer, die aufwuchsen mit MS-DOS? und windows Windows?
neigen oft dazu Shotcuts zu verwenden. Das Lesen der Tastatur-Scancodes
und das direkte Schreiben in den Grafikspeicher sind zwei klassische
Beispiele von Gewohnheiten, die unter MS-DOS? nicht verp?nt sind, aber
nicht als richtig angesehen werden.

Warum dies? Sowohl das PC-BIOS als auch MS-DOS? sind notorisch langsam
bei der Ausf?hrung dieser Operationen.

Sie m?gen versucht sein ?hnliche Angewohnheiten in der UNIX?-Umgebung
fortzuf?hren. Zum Beispiel habe ich eine Webseite gesehen, welche
erkl?rt, wie man auf einem beliebten UNIX?-Ableger die
Tastatur-Scancodes verwendet.

Das ist generell eine *sehr schlechte Idee* in einer UNIX?-Umgebung!
Lassen Sie mich erkl?ren warum.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

11.14.1. UNIX? ist gesch?tzt
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Zum Einen mag es schlicht nicht m?glich sein. UNIX? l?uft im Protected
Mode. Nur der Kernel und Ger?tetreiber d?rfen direkt auf die Hardware
zugreifen. Unter Umst?nden erlaubt es Ihnen ein bestimmter UNIX?-Ableger
Tastatur-Scancodes auszulesen, aber ein wirkliches UNIX?-Betriebssystem
wird dies zu verhindern wissen. Und falls eine Version es Ihnen erlaubt
wird es eine andere nicht tun, daher kann eine sorgf?ltig erstellte
Software ?ber Nacht zu einem ?berkommenen Dinosaurier werden.

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

11.14.2. UNIX? ist eine Abstraktion
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Aber es gibt einen viel wichtigeren Grund, weshalb Sie nicht versuchen
sollten, die Hardware direkt anzusprechen (nat?rlich nicht, wenn Sie
einen Ger?tetreiber schreiben), selbst auf den UNIX?-?hnlichen Systemen,
die es Ihnen erlauben:

*UNIX? ist eine Abstraktion!*

Es gibt einen wichtigen Unterschied in der Design-Philosophie zwischen
MS-DOS? und UNIX?. MS-DOS? wurde entworfen als Einzelnutzer-System. Es
l?uft auf einem Rechner mit einer direkt angeschlossenen Tastatur und
einem direkt angeschlossenem Bildschirm. Die Eingaben des Nutzers kommen
nahezu immer von dieser Tastatur. Die Ausgabe Ihres Programmes erscheint
fast immer auf diesem Bildschirm.

Dies ist NIEMALS garantiert unter UNIX?. Es ist sehr verbreitet f?r ein
UNIX?, da? der Nutzer seine Aus- und Eingaben kanalisiert und umleitet:

.. code:: screen

    % program1 | program2 | program3 > file1

Falls Sie eine Anwendung program2 geschrieben haben, kommt ihre Eingabe
nicht von der Tastatur, sondern von der Ausgabe von program1.
Gleichermassen geht Ihre Ausgabe nicht auf den Bildschirm, sondern wird
zur Eingabe f?r program3, dessen Ausgabe wiederum in ``file1`` endet.

Aber es gibt noch mehr! Selbst wenn Sie sichergestellt haben, da? Ihre
Eingabe und Ausgabe zum Terminal kommt bzw. gelangt, dann ist immer noch
nicht garantiert, da? ihr Terminal ein PC ist: Es mag seinen
Grafikspeicher nicht dort haben, wo Sie ihn erwarten, oder die Tastatur
k?nnte keine PC-?hnlichen Scancodes erzeugen k?nnen. Es mag ein
Macintosh? oder irgendein anderer Rechner sein.

Sie m?gen nun den Kopf sch?tteln: Mein Programm ist in PC-Assembler
geschrieben, wie kann es auf einem Macintosh? laufen? Aber ich habe
nicht gesagt, da? Ihr Programm auf Macintosh? l?uft, nur sein Terminal
mag ein Macintosh? sein.

Unter UNIX? mu? der Terminal nicht direkt am Rechner angeschlossen sein,
auf dem die Software l?uft, er kann sogar auf einem anderen Kontinent
sein oder sogar auf einem anderen Planeten. Es ist nicht ungew?hnlich,
da? ein Macintosh?-Nutzer in Australien sich auf ein UNIX?-System in
Nordamerika (oder sonstwo) mittels telnet verbindet. Die Software l?uft
auf einem Rechner w?hrend das Terminal sich auf einem anderen Rechner
befindet: Falls Sie versuchen sollten die Scancodes auszulesen werden
Sie die falschen Eingaben erhalten!

Das Gleiche gilt f?r jede andere Hardware: Eine Datei, welche Sie
einlesen, mag auf einem Laufwerk sein, auf das Sie keinen direkten
Zugriff haben. Eine Kamera, deren Bilder Sie auslesen, befindet sich
m?glicherweise in einem Space Shuttle, durch Satelliten mit Ihnen
verbunden.

Das sind die Gr?nde, weshalb Sie niemals unter UNIX? Annahmen treffen
d?rfen, woher Ihre Daten kommen oder gehen. Lassen Sie immer das System
den physischen Zugriff auf die Hardware regeln.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Das sind Vorsichtsmassnahmen, keine absoluten Regeln. Ausnahmen sind
m?glich. Wenn zum Beispiel ein Texteditor bestimmt hat, da? er auf einer
lokalen Maschine l?uft, dann mag er die Tastatur-Scancodes direkt
auslesen, um eine bessere Kontrolle zu gew?hrleisten. Ich erw?hne diese
Vorsichtsmassnahmen nicht, um Ihnen zu sagen, was sie tun oder lassen
sollen, ich will Ihnen nur bewusst machen, da? es bestimmte Fallstricke
gibt, die Sie erwarten, wenn Sie soeben ihn UNIX? von MS-DOS? angelangt
sind. Kreative Menschen brechen oft Regeln und das ist in Ordnung,
solange sie wissen welche Regeln und warum.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------+-------------------------------+---------------------------------------------+
| `Zur?ck <x86-fpu.html>`__?   | `Nach oben <x86.html>`__      | ?\ `Weiter <x86-acknowledgements.html>`__   |
+------------------------------+-------------------------------+---------------------------------------------+
| 11.13. Die FPU verwenden?    | `Zum Anfang <index.html>`__   | ?11.15. Danksagungen                        |
+------------------------------+-------------------------------+---------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
