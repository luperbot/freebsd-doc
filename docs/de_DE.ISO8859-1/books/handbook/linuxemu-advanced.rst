===========================
11.7. Weiterf?hrende Themen
===========================

.. raw:: html

   <div class="navheader">

11.7. Weiterf?hrende Themen
`Zur?ck <linuxemu-oracle.html>`__?
Kapitel 11. Linux-Bin?rkompatibilit?t
?\ `Weiter <system-administration.html>`__

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

11.7. Weiterf?hrende Themen
---------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn Sie sich fragen, wie die Linux-Bin?rkompatibilit?t unter FreeBSD
realisiert wurde, sollten Sie diesen Abschnitt lesen. Der Gro?teil der
folgenden Informationen stammt aus einer E-Mail, die von Terry Lambert
(``<tlambert@primenet.com>``) an die FreeBSD-Chat-Mailingliste
(``<freebsd-chat@FreeBSD.org>``) geschrieben wurde (Message ID:
``<199906020108.SAA07001@usr09.primenet.com>``).

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

11.7.1. Wie funktioniert es?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD verf?gt ?ber eine „execution class loader“ genannte Abstraktion.
Dabei handelt es sich um einen Eingriff in den
`execve(2) <http://www.FreeBSD.org/cgi/man.cgi?query=execve&sektion=2>`__
Systemaufruf.

FreeBSD verf?gt ?ber eine Liste von Ladern, anstelle eines einzigen, auf
``#!`` zur?ckgreifenden Laders, um Shell-Interpreter oder Shell-Skripte
auszuf?hren.

Historisch gesehen untersuchte der einzige, auf UNIX-Plattformen
vorhandene Lader die "magische Zahl" (in der Regel die ersten 4 oder
8?Bytes der Datei), um festzustellen, ob der Bin?rtyp dem System bekannt
war. War dies der Fall, wurde der Bin?rlader aufgerufen.

Wenn es sich nicht um den zum System geh?rigen Bin?rtyp handelte, gab
`execve(2) <http://www.FreeBSD.org/cgi/man.cgi?query=execve&sektion=2>`__
einen Fehler zur?ck, und die Shell versuchte stattdessen, die Datei als
Shell-Befehl auszuf?hren.

Dabei wurde als Standardeinstellung „was auch immer die aktuelle Shell
ist“ festgelegt.

Sp?ter wurde ein Hack in
`sh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sh&sektion=1>`__
eingef?gt, der die zwei ersten Zeichen untersuchte. Wenn diese ``:\n``
entsprachen, wurde stattdessen die
`csh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=csh&sektion=1>`__-Shell
aufgerufen (wir glauben, dass dies zuerst von SCO umgesetzt wurde).

FreeBSD versucht heute eine Liste von Ladern, unter denen sich ein
allgemeiner Lader f?r Interpreter befindet. Der auszuf?hrende
Interpreter wird im ersten, durch Leerzeichen getrennten Feld, der
``#!``-Zeile angegeben. L?sst sich der Interpreter nicht ermitteln, wird
auf ``/bin/sh`` zur?ckgegriffen.

F?r die Linux ABI-Unterst?tzung erkennt FreeBSD die magische Zahl als
ELF-Bin?rdatei (Zu diesem Zeitpunkt wird nicht zwischen FreeBSD,
Solaris™, Linux oder anderen Systemen unterschieden, die ?ber
ELF-Bin?rdateien verf?gen.).

Der ELF-Lader sucht nach einer speziellen *Kennzeichnung*, die aus einem
Kommentarabschnitt in der ELF-Datei besteht, und die in SVR4/Solaris™
ELF Bin?rdateien nicht vorhanden ist.

Damit Linux-Bin?rdateien (unter FreeBSD) funktionieren, m?ssen sie als
`` Linux`` *gekennzeichnet* werden, und zwar durch
`brandelf(1) <http://www.FreeBSD.org/cgi/man.cgi?query=brandelf&sektion=1>`__:

.. code:: screen

    # brandelf -t Linux file

Nachdem dies geschehen ist, erkennt der ELF-Lader die
``Linux``-Kennzeichnung der Datei.

Wenn der ELF-Lader die ``Linux``-Kennzeichnung sieht, wird ein Zeiger in
der ``proc``-Struktur ersetzt. Alle Systemaufrufe werden durch diesen
Zeiger indiziert (in einem traditionellen UNIX? System w?re das ein
``sysent[]``-Strukturfeld, das die Systemaufrufe enth?lt). Der Prozess
wird weiterhin speziell gekennzeichnet, so dass der Trap-vector im
Signal-trampoline-code eine spezielle Behandlung erf?hrt und das
Linux-Kernelmodul verschiedene kleinere Korrekturen vornehmen kann.

Der Linux-Systemaufrufvektor enth?lt neben anderen Dingen eine Liste der
``sysent[]``-Eintr?ge, deren Adressen sich im Kernelmodul befinden.

Wenn ein Linux-Programm einen Systemaufruf ausf?hrt, dereferenziert die
Trap-Behandlungsroutine den Zeiger auf die Eintrittspunkte f?r die
Systemaufrufe und erh?lt damit die Linux-Eintrittspunkte und nicht die
FreeBSD-Eintrittspunkte.

Zus?tzlich *ver?ndert* der Linuxmodus die Systempfade dynamisch;
genauso, wie dies die Option ``union`` beim Einbinden von Dateisystemen
macht (Achtung: *nicht* das Dateisystem unionfs!). Zuerst wird die Datei
im Verzeichnis ``/compat/linux/Originalpfad`` gesucht, *danach*, wenn
sie dort nicht gefunden wurde, wird sie im FreeBSD-Verzeichnis
``/Originalpfad`` gesucht. Dadurch wird sichergestellt, dass
Bin?rdateien, die zur Ausf?hrung andere Bin?rdateien ben?tigen,
ausgef?hrt werden k?nnen (so dass alle Linux-Werkzeuge unter der ABI
laufen). Dies bedeutet auch, dass Linux-Bin?rdateien
FreeBSD-Bin?rdateien laden und ausf?hren k?nnen, wenn keine passenden
Linux-Bin?rdateien vorhanden sind. Ein in ``/compat/linux`` plaziertes
`uname(1) <http://www.FreeBSD.org/cgi/man.cgi?query=uname&sektion=1>`__
kann damit Linux-Programmen vorgaukeln, dass sie auf einem Linux-System
laufen.

Im Endeffekt gibt es einen Linux-Kernel innerhalb des FreeBSD-Kernels.
Die Sprungtabellen f?r Linux- beziehungsweise FreeBSD-Systemaufrufe
verweisen allerdings auf dieselben Funktionen, die Kerneldienste wie
Dateisystemoperationen, Operationen f?r den virtuellen Speicher,
Signal?bermittlung und System?V?IPC bereitstellen, Der einzige
Unterschied ist, dass Bin?rdateien unter FreeBSD
FreeBSD-*glue*-Funktionen verwenden. Linux-Bin?rdateien hingegen
verwenden die Linux-*glue*-Funktionen. Die meisten ?lteren
Betriebssysteme hatten ihre eigenen *glue*-Funktionen: Funktionsadressen
in einem globalen, statischen ``sysent[]`` Strukturfeld an Stelle von
Funktionsadressen, die durch einen dynamisch initialisierten Zeiger aus
der ``proc`` Struktur, die den Aufruf gemacht hatte, dereferenziert
wurden.

Welche ist die echte FreeBSD-ABI? Das spielt keine Rolle. Grunds?tzlich
ist der einzige Unterschied (zurzeit ist das so; dies k?nnte sich in
zuk?nftigen Versionen leicht ?ndern und wird sich wahrscheinlich auch
?ndern), dass die FreeBSD-*glue*-Funktionen statisch in den Kernel
gelinkt sind, und dass die Linux-*glue*-Funktionen statisch gelinkt oder
?ber ein Modul eingebunden werden k?nnen.

Ja, aber ist das wirkliche eine Emulation? Nein. Es ist eine
Implementierung eines ABIs, keine Emulation. Es ist kein Emulator (oder
Simulator, um der n?chsten Frage zuvorzukommen) beteiligt.

Warum wird es manchmal „Linux-Emulation“ genannt? Um es schwerer zu
machen, FreeBSD zu verkaufen. Wirklich, das kommt daher, weil dies zu
einer Zeit implemtiert wurde, in der es kein anderes Wort (als
Emulation) gab, das beschrieb, was vor sich ging. Wenn der Kernel nicht
entsprechend konfiguriert wurde oder das Modul geladen wurde, war es
falsch zu behaupten, FreeBSD w?rde Linux-Bin?rprogramme ausf?hren. Man
ben?tigte ein Wort, das beschrieb, was da geladen wurde – daher „Der
Linux-Emulator“.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+---------------------------------+----------------------------------------------+
| `Zur?ck <linuxemu-oracle.html>`__?   | `Nach oben <linuxemu.html>`__   | ?\ `Weiter <system-administration.html>`__   |
+--------------------------------------+---------------------------------+----------------------------------------------+
| 11.6. Oracle? installieren?          | `Zum Anfang <index.html>`__     | ?Teil?III.?Systemadministration              |
+--------------------------------------+---------------------------------+----------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
