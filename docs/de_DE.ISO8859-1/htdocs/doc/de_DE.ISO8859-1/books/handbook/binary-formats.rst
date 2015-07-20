==================
4.12. Bin?rformate
==================

.. raw:: html

   <div class="navheader">

4.12. Bin?rformate
`Zur?ck <basics-devices.html>`__?
Kapitel 4. Grundlagen des UNIX Betriebssystems
?\ `Weiter <basics-more-information.html>`__

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

4.12. Bin?rformate
------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Um zu verstehen, warum FreeBSD das Format
`elf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=elf&sektion=5>`__
benutzt, m?ssen Sie zun?chst etwas ?ber die drei gegenw?rtig
„dominanten“ ausf?hrbaren Formate f?r UNIX? Systeme wissen:

.. raw:: html

   <div class="itemizedlist">

-  `a.out(5) <http://www.FreeBSD.org/cgi/man.cgi?query=a.out&sektion=5>`__

   Das ?lteste und „klassische“ Objektformat von UNIX? Systemen. Es
   benutzt einen kurzen, kompakten Header mit einer magischen Nummer am
   Anfang, die oft benutzt wird, um das Format zu charakterisieren
   (weitere Details finden Sie unter
   `a.out(5) <http://www.FreeBSD.org/cgi/man.cgi?query=a.out&sektion=5>`__).
   Es enth?lt drei geladene Segmente: .text, .data und .bss, sowie eine
   Symboltabelle und eine Stringtabelle.

-  COFF

   Das Objektformat von SVR3. Der Header enth?lt nun eine
   „Sectiontable“. Man kann also mit mehr als nur den Sections .text,
   .data und .bss arbeiten.

-  `elf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=elf&sektion=5>`__

   Der Nachfolger von COFF. Kennzeichnend sind mehrere Sections und
   m?gliche 32-Bit- oder 64-Bit-Werte. Ein wesentlicher Nachteil: ELF
   wurde auch unter der Annahme entworfen, dass es nur eine ABI
   (Application Binary Interface) pro Systemarchitektur geben wird.
   Tats?chlich ist diese Annahme falsch – nicht einmal f?r die
   kommerzielle SYSV-Welt (in der es mindestens drei ABIs gibt: SVR4,
   Solaris, SCO) trifft sie zu.

   FreeBSD versucht, dieses Problem zu umgehen, indem ein Werkzeug
   bereitgestellt wird, um ausf?hrbare Dateien im ELF-Format mit
   Informationen ?ber die ABI zu versehen, zu der sie passen. Weitere
   Informationen finden Sie in der Manualpage
   `brandelf(1) <http://www.FreeBSD.org/cgi/man.cgi?query=brandelf&sektion=1>`__.

.. raw:: html

   </div>

FreeBSD kommt aus dem „klassischen“ Lager und verwendete traditionell
das Format
`a.out(5) <http://www.FreeBSD.org/cgi/man.cgi?query=a.out&sektion=5>`__,
eine Technik, die bereits ?ber viele BSD-Releases hinweg eingesetzt und
gepr?ft worden ist. Obwohl es bereits seit einiger Zeit m?glich war, auf
einem FreeBSD-System auch Binaries (und Kernel) im ELF-Format zu
erstellen und auszuf?hren, widersetzte FreeBSD sich anfangs dem „Druck“,
auf ELF als Standardformat umzusteigen. Warum? Nun, als das Linux-Lager
die schmerzhafte Umstellung auf ELF durchf?hrte, ging es nicht so sehr
darum, dem ausf?hrbaren Format ``a.out`` zu entkommen, als dem
unflexiblen, auf Sprungtabellen basierten Mechanismus f?r
„Shared-Libraries“ der die Konstruktion von Shared-Libraries f?r
Hersteller und Entwickler gleicherma?en sehr kompliziert machte. Da die
verf?gbaren ELF-Werkzeuge eine L?sung f?r das Problem mit den
Shared-Libraries anboten und ohnehin generell als „ein Schritt vorw?rts“
angesehen wurden, wurde der Aufwand f?r die Umstellung als notwendig
akzeptiert und die Umstellung wurde durchgef?hrt. Unter FreeBSD ist der
Mechanismus von Shared-Libraries enger an den Stil des
Shared-Library-Mechanismus von Suns SunOS™ angelehnt und von daher sehr
einfach zu verwenden.

Ja, aber warum gibt es so viele unterschiedliche Formate?

In alter, grauer Vorzeit gab es simple Hardware. Diese simple Hardware
unterst?tzte ein einfaches, kleines System. ``a.out`` war absolut
passend f?r die Aufgabe, Binaries auf diesem simplen System (eine
PDP-11) darzustellen. Als UNIX? von diesem simplen System portiert
wurde, wurde auch das ``a.out``-Format beibehalten, weil es f?r die
fr?hen Portierungen auf Architekturen wie den Motorola 68000 und VAX
ausreichte.

Dann dachte sich ein schlauer Hardware-Ingenieur, dass, wenn er Software
zwingen k?nnte, einige Tricks anzustellen, es ihm m?glich w?re, ein paar
Gatter im Design zu sparen, und seinen CPU-Kern schneller zu machen.
Obgleich es dazu gebracht wurde, mit dieser neuen Art von Hardware
(heute als RISC bekannt) zu arbeiten, war ``a.out`` f?r diese Hardware
schlecht geeignet. Deshalb wurden viele neue Formate entwickelt, um eine
bessere Leistung auf dieser Hardware zu erreichen, als mit dem
begrenzten, simplen ``a.out``-Format. Dinge wie COFF, ECOFF und einige
andere obskure wurden erdacht und ihre Grenzen untersucht, bevor die
Dinge sich in Richtung ELF entwickelten.

Hinzu kam, dass die Gr??e von Programmen gewaltig wurde und Festplatten
sowie physikalischer Speicher immer noch relativ klein waren. Also wurde
das Konzept von Shared-Libraries geboren. Das VM-System wurde auch immer
fortgeschrittener. Obwohl bei jedem dieser Fortschritte das
``a.out``-Format benutzt worden ist, wurde sein Nutzen mit jedem neuen
Merkmal mehr und mehr gedehnt. Zus?tzlich wollte man Dinge dynamisch zur
Ausf?hrungszeit laden, oder Teile ihres Programms nach der
Initialisierung wegwerfen, um Hauptspeicher oder Swap-Speicher zu
sparen. Programmiersprachen wurden immer fortschrittlicher und man
wollte, dass Code automatisch vor der main-Funktion aufgerufen wird. Das
``a.out``-Format wurde oft ?berarbeitet, um alle diese Dinge zu
erm?glichen und sie funktionierten auch f?r einige Zeit. ``a.out``
konnte diese Probleme nicht ohne ein st?ndiges Ansteigen eines Overheads
im Code und in der Komplexit?t handhaben. Obwohl ELF viele dieser
Probleme l?ste, w?re es sehr aufw?ndig, ein System umzustellen, das im
Grunde genommen funktionierte. Also musste ELF warten, bis es
aufw?ndiger war, bei ``a.out`` zu bleiben, als zu ELF ?berzugehen.

Im Laufe der Zeit haben sich die Erstellungswerkzeuge, von denen FreeBSD
seine Erstellungswerkzeuge abgeleitet hat (speziell der Assembler und
der Loader), in zwei parallele Zweige entwickelt. Im FreeBSD-Zweig
wurden Shared-Libraries hinzugef?gt und einige Fehler behoben. Das
GNU-Team, das diese Programme urspr?nglich geschrieben hat, hat sie
umgeschrieben und eine simplere Unterst?tzung zur Erstellung von
Cross-Compilern durch beliebiges Einschalten verschiedener Formate usw.
hinzugef?gt. Viele Leute wollten Cross-Compiler f?r FreeBSD erstellen,
aber sie hatten kein Gl?ck, denn FreeBSD's ?ltere Sourcen f?r as und ld
waren hierzu nicht geeignet. Die neuen GNU-Werkzeuge (binutils)
unterst?tzen Cross-Compilierung, ELF, Shared-Libraries,
C++-Erweiterungen und mehr. Weiterhin geben viele Hersteller
ELF-Binaries heraus und es ist gut, wenn FreeBSD sie ausf?hren kann.

ELF ist ausdrucksf?higer als ``a.out`` und gestattet eine bessere
Erweiterbarkeit des Basissystems. Die ELF-Werkzeuge werden besser
gewartet und bieten Unterst?tzung von Cross-Compilierung, was f?r viele
Leute wichtig ist. ELF mag etwas langsamer sein, als ``a.out``, aber zu
versuchen, das zu messen, k?nnte schwierig werden. Es gibt unz?hlige
Details, in denen sich die beiden Formate unterscheiden, wie sie Pages
abbilden, Initialisierungscode handhaben usw. Keins davon ist sehr
wichtig, aber es sind Unterschiede. Irgendwann wird die Unterst?tzung
f?r Programme im ``a.out``-Format aus dem ``GENERIC``-Kernel entfernt
werden. Wenn es dann keinen oder kaum noch Bedarf f?r die Unterst?tzung
dieses Formates gibt, werden die entsprechenden Routinen ganz entfernt
werden.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------+-------------------------------+------------------------------------------------+
| `Zur?ck <basics-devices.html>`__?   | `Nach oben <basics.html>`__   | ?\ `Weiter <basics-more-information.html>`__   |
+-------------------------------------+-------------------------------+------------------------------------------------+
| 4.11. Ger?te und Ger?tedateien?     | `Zum Anfang <index.html>`__   | ?4.13. Weitere Informationen                   |
+-------------------------------------+-------------------------------+------------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
