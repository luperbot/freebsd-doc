=============================
4.4. Fehlerbehebung (Patches)
=============================

.. raw:: html

   <div class="navheader">

4.4. Fehlerbehebung (Patches)
`Zur?ck <slow-modifying.html>`__?
Kapitel 4. Einen Port in aller Ruhe erstellen
?\ `Weiter <slow-configure.html>`__

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

4.4. Fehlerbehebung (Patches)
-----------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Bei der Vorbereitung eines Ports k?nnen die Dateien, die hinzugef?gt
oder ver?ndert wurden, mittels
`diff(1) <http://www.FreeBSD.org/cgi/man.cgi?query=diff&sektion=1>`__
abgefangen werden, um Sie sp?ter an
`patch(1) <http://www.FreeBSD.org/cgi/man.cgi?query=patch&sektion=1>`__
zu ?bergeben. Jeder Patch, der dem Quelltext ?bergeben werden soll,
sollte in einer Datei ``patch-*`` abgelegt werden, wobei *``*``* dem
Pfadnamen der zu korrigierenden Datei entspricht, wie er auch in
``patch-Imakefile`` oder im ``patch-src-config.h`` erscheint. Diese
Dateien sollten in ``PATCHDIR`` (normalerweise ``files``) abgelegt sein,
von wo sie automatisch ?bernommen werden. Alle Patches m?ssen sich
relativ zur ``WRKSRC``-Variable (normalerweise dem Verzeichnis, in dem
sich der Quelltext des Ports entpackt und wo auch der Bau stattfindet)
befinden.

Um Korrekturen und Updates zu vereinfachen, sollte es vermieden werden,
mehr als einen Patch f?r eine Datei zu nutzen (z.B. ``patch-file`` und
``patch-file2``, welche beide ``WRKSRC/foobar.c`` ver?ndern). Beachten
Sie, dass, falls der Pfad einer zu korrigierenden Datei einen
Unterstrich (``_``) enth?lt, der Patch stattdessen zwei Unterstriche im
Namen haben muss. Zum Beispiel muss der Patch, der eine Datei namens
``src/freeglut_joystick.c`` korrigieren soll,
``patch-src-freeglut__joystick.c`` genannt werden.

F?r die Benennung der Patches sollten nur die Zeichen
``[-+._a-zA-Z0-9]`` genutzt werden. Bitte verwenden Sie keine weiteren
Zeichen als die angegebenen. Die Namensvergabe sollte nicht ``patch-aa``
oder ``patch-ab`` etc. entsprechen, erw?hnen Sie immer den Pfad und
Dateinamen.

RCS-Zeichenketten sollten vermieden werden, da CVS diese verst?mmeln
w?rde, sobald wir diese Dateien in die Ports-Sammlung einpflegen. Wenn
wir die Dateien wieder abrufen w?ren diese ver?ndert und der Patch w?rde
fehlschlagen. RCS-Zeichenketten sind in Dollar-Zeichen (``$``)
eingef?gte Zeichen und beginnen ?blicherweise mit ``$Id`` oder ``$RCS``.

Die Option rekursiv (``-r``) zu nutzen
`diff(1) <http://www.FreeBSD.org/cgi/man.cgi?query=diff&sektion=1>`__,
um Patches zu erstellen, ist zul?ssig, jedoch sollte der Patch
anschlie?end gepr?ft werden, um Unn?tiges aus dem Patch zu entfernen. Im
Einzelnen bedeutet dies, dass Diffs zwischen zwei Backup-Dateien,
``Makefile``\ s oder wenn der Port ``Imake`` oder GNU ``configure`` usw.
nutzt, ?berfl?ssig sind und entfernt werden sollten. Falls es es
notwendig war, ``configure.in`` zu bearbeiten und es soll ``autoconf``
zum Neuerstellen von ``configure`` genutzt werden, sollten die Diffs aus
``configure`` nicht genutzt werden (diese werden oft einige tausend
Zeilen gro?!);?–?hier sollte ``USE_AUTOTOOLS=autoconf:261`` definiert
und das Diff aus ``configure.in`` genutzt werden.

Zus?tzlich sollte man unn?tige Markup-?nderungen in Patches/?nderungen
m?glichst vermeiden. In der Open Source-Welt teilen sich Projekte h?ufig
gro?e Teile des Quellcodes. Allerdings verwenden die einzelnen Projekte
oft unterschiedliche Programmierstile und Vorgaben f?r Einr?ckungen.
Wenn man also einen funktionierenden Teil einer Funktion aus einem
Projekt verwendet, um ein ?hnliches Problem in einem anderen Projekt zu
l?sen, sollte man besonders vorsichtig sein, weil sich ansonsten die
CVS-?nderungseintr?ge mit ?berfl?ssigen Eintr?gen f?llen, die nur das
Markup des Quellcodes betreffen, ohne dass sich an der Funktion des
eigentlichen Quellcode etwas ?ndert („withspace-only changes“). Solche
?nderungen vergr??ern nicht nur das CVS-Repository, sondern erschweren
es auch die Ursache f?r eventuell auftretende Probleme zu finden.

War es notwendig eine Datei zu entfernen, wird dies besser mittels des
``post-extract``-Targets als ?ber den Patch selbst realisiert.

Ein einfacher Austausch kann direkt ?ber das ``Makefile`` des Ports
umgesetzt werden, indem der in-place-Modus von
`sed(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sed&sektion=1>`__
genutzt wird. Dies ist sehr hilfreich, wenn variable Werte korrigiert
werden sollen. Beispiel:

.. code:: programlisting

    post-patch:
          @${REINPLACE_CMD} -e 's|for Linux|for FreeBSD|g' ${WRKSRC}/README
          @${REINPLACE_CMD} -e 's|-pthread|${PTHREAD_LIBS}|' ${WRKSRC}/configure
          

Relativ h?ufig ergibt sich die Situation, in der die portierte Software
die CR/LF-Konventionen f?r Zeilenenden nutzt (dies ist bei unter
Windows? entwickelter Software h?ufig der Fall). Dies kann bei weiteren
Patches Probleme (Compiler-Warnungen, Fehlermeldungen bei der Ausf?hrung
von Skripten wie z.B. ``/bin/sh^M`` not found) und anderes ergeben. Um
schnell alle Dateien von CR/LF nach LF zu konvertieren, kann
``USE_DOS2UNIX=yes`` in das ``Makefile`` des Ports geschrieben werden.
Hierzu kann eine Liste der zu konvertierenden Dateien erstellt werden:

.. code:: programlisting

    USE_DOS2UNIX=    util.c util.h

Sollen Gruppen von Dateien ?ber verschiedene Unterverzeichnisse
konvertiert werden, kann ``DOS2UNIX_REGEX`` genutzt werden, dessen
Argumente ``find``-kompatible, regul?re Ausdr?cke sind. Mehr zur
Formatierung findet sich in
`re\_format(7) <http://www.FreeBSD.org/cgi/man.cgi?query=re_format&sektion=7>`__.
Diese Option ist beim Konvertieren aller Dateien mit definierter Endung,
z.B. aller Dateien im Quellcode, wobei bin?re Dateien unber?hrt bleiben,
sinnvoll:

.. code:: programlisting

    USE_DOS2UNIX=    yes
          DOS2UNIX_REGEX=  .*\.(c|cpp|h)

Wenn Sie einen Patch zu einer bereits existierenden Datei erstellen
wollen, k?nnen Sie von ihr eine Kopie mit der Endung ``.orig`` erstellen
und anschlie?end die Originaldatei bearbeiten. Das make-Ziel
``makepatch`` f?hrt dann zu einer entsprechenden Patch-Datei im
Verzeichnis ``files`` des Ports.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------+-------------------------------+---------------------------------------+
| `Zur?ck <slow-modifying.html>`__?   | `Nach oben <slow.html>`__     | ?\ `Weiter <slow-configure.html>`__   |
+-------------------------------------+-------------------------------+---------------------------------------+
| 4.3. Den Port bearbeiten?           | `Zum Anfang <index.html>`__   | ?4.5. Konfigurieren                   |
+-------------------------------------+-------------------------------+---------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
