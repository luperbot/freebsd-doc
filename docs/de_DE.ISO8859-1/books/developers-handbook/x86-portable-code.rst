=============================
11.5. Portablen Code erzeugen
=============================

.. raw:: html

   <div class="navheader">

11.5. Portablen Code erzeugen
`Zur?ck <x86-return-values.html>`__?
Kapitel 11. x86-Assembler-Programmierung
?\ `Weiter <x86-first-program.html>`__

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

11.5. Portablen Code erzeugen
-----------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

?bersetzt von Hagen K?hl.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Portabilit?t ist im Allgemeinen keine St?rke der
Assembler-Programmierung. Dennoch ist es, besonders mit nasm, m?glich
Assembler-Programme f?r verschiedene Plattformen zu schreiben. Ich
selbst habe bereits Assembler-Bibliotheken geschrieben die auf so
unterschiedlichen Systemen wie Windows? und FreeBSD ?bersetzt werden
k?nnen.

Das ist um so besser m?glich, wenn Ihr Code auf zwei Plattformen laufen
soll , die, obwohl sie verschieden sind, auf ?hnlichen Architekturen
basieren.

Beispielsweise ist FreeBSD ein UNIX?, w?hrend Linux UNIX?-artig ist. Ich
habe bisher nur drei Unterschiede zwischen beiden (aus Sicht eines
Assembler-Programmierers) erw?hnt: Die Aufruf-Konvention, die
Funktionsnummern und die Art der ?bergabe von R?ckgabewerten.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

11.5.1. Mit Funktionsnummern umgehen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In vielen F?llen sind die Funktionsnummern die selben. Allerdings kann
man auch wenn sie es nicht sind leicht mit diesem Problem umgehen:
Anstatt die Nummern in Ihrem Code zu verwenden, benutzen Sie Konstanten,
die Sie abh?ngig von der Zielarchitektur unterschiedlich definieren:

.. code:: programlisting

    %ifdef   LINUX
    %define SYS_execve  11
    %else
    %define SYS_execve  59
    %endif

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

11.5.2. Umgang mit Konventionen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Sowohl die Aufrufkonvention, als auch die R?ckgabewerte (das ``errno``
Problem) kann man mit Hilfe von Makros l?sen:

.. code:: programlisting

    %ifdef   LINUX

    %macro  system  0
        call    kernel
    %endmacro

    align 4
    kernel:
        push    ebx
        push    ecx
        push    edx
        push    esi
        push    edi
        push    ebp

        mov ebx, [esp+32]
        mov ecx, [esp+36]
        mov edx, [esp+40]
        mov esi, [esp+44]
        mov ebp, [esp+48]
        int 80h

        pop ebp
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx

        or  eax, eax
        js  .errno
        clc
        ret

    .errno:
        neg eax
        stc
        ret

    %else

    %macro  system  0
        int 80h
    %endmacro

    %endif

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

11.5.3. Umgang mit anderen Portabilit?tsangelegenheiten
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die oben genannte L?sung funktioniert in den meisten F?llen, wenn man
Code schreibt, der zwischen FreeBSD und Linux portierbar sein soll.
Allerdings sind die Unterschiede bei einigen Kernel-Diensten
tiefgreifender.

In diesem F?llen m?ssen Sie zwei verschiedene Handler f?r diese
Systemaufrufe schreiben und bedingte Assemblierung benutzen, um diese zu
?bersetzen. Gl?cklicherweise wird der gr??te Teil Ihres Codes nicht den
Kernel aufrufen und Sie werden deshalb nur wenige solcher bedingten
Abschnitte ben?tigen.

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

11.5.4. Eine Bibliothek benutzen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Sie k?nnen Portabilit?tsprobleme im Hauptteil ihres Codes komplett
vermeiden, indem Sie eine Bibliothek f?r Systemaufrufe schreiben.
Erstellen Sie eine Bibliothek f?r FreeBSD, eine f?r Linux und weitere
f?r andere Betriebssysteme.

Schreiben Sie in ihrer Bibliothek eine gesonderte Funktion (oder
Prozedur, falls Sie die traditionelle Assembler-Terminologie bevorzugen)
f?r jeden Systemaufruf. Verwenden Sie dabei die C-Aufrufkonvention um
Parameter zu ?bergeben, aber verwenden Sie weiterhin ``EAX``, f?r die
Aufrufnummer. In diesem Fall kann ihre FreeBSD-Bibliothek sehr einfach
sein, da viele scheinbar unterschiedliche Funktionen als Label f?r
denselben Code implementiert sein k?nnen:

.. code:: programlisting

    sys.open:
    sys.close:
    [etc...]
        int 80h
        ret

Ihre Linux-Bibliothek wird mehr verschiedene Funktionen ben?tigen, aber
auch hier k?nnen Sie Systemaufrufe, welche die Anzahl an Parametern
akzeptieren zusammenfassen:

.. code:: programlisting

    sys.exit:
    sys.close:
    [etc... one-parameter functions]
        push    ebx
        mov ebx, [esp+12]
        int 80h
        pop ebx
        jmp sys.return

    ...

    sys.return:
        or  eax, eax
        js  sys.err
        clc
        ret

    sys.err:
        neg eax
        stc
        ret

Der Bibliotheks-Ansatz mag auf den ersten Blick unbequem aussehen, weil
Sie eine weitere Datei erzeugen m?ssen von der Ihr Code abh?ngt. Aber er
hat viele Vorteile: Zum einen m?ssen Sie die Bibliothek nur einmal
schreiben und k?nnen sie dann in allen Ihren Programmen verwenden. Sie
k?nnen sie sogar von anderen Assembler-Programmierern verwenden lassen,
oder eine die von jemand anderem geschrieben wurde verwenden. Aber der
vielleicht gr??te Vorteil ist, dass Ihr Code sogar von anderen
Programmierer auf andere Systeme portiert werden kann, einfach indem man
eine neue Bibliothek schreibt, v?llig ohne ?nderungen an Ihrem Code.

Falls Ihnen der Gedanke eine Bibliothek zu nutzen nicht gef?llt, k?nnen
Sie zumindest all ihre Systemaufrufe in einer gesonderten
Assembler-Datei ablegen und diese mit Ihrem Hauptprogramm zusammen
binden. Auch hier m?ssen alle, die ihr Programm portieren, nur eine neue
Objekt-Datei erzeugen und an Ihr Hauptprogramm binden.

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

11.5.5. Eine Include-Datei verwenden
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn Sie ihre Software als (oder mit dem) Quelltext ausliefern, k?nnen
Sie Makros definieren und in einer getrennten Datei ablegen, die Sie
ihrem Code beilegen.

Porter Ihrer Software schreiben dann einfach eine neue Include-Datei. Es
ist keine Bibliothek oder eine externe Objekt-Datei n?tig und Ihr Code
ist portabel, ohne dass man ihn editieren muss.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Das ist der Ansatz den wir in diesem Kapitel verwenden werden. Wir
werden unsere Include-Datei ``system.inc`` nennen und jedesmal, wenn wir
einen neuen Systemaufruf verwenden, den entsprechenden Code dort
einf?gen.

.. raw:: html

   </div>

Wir k?nnen unsere ``system.inc`` beginnen indem wir die
Standard-Dateideskriptoren deklarieren:

.. code:: programlisting

    %define stdin   0
    %define stdout  1
    %define stderr  2

Als N?chstes erzeugen wir einen symbolischen Namen f?r jeden
Systemaufruf:

.. code:: programlisting

    %define  SYS_nosys   0
    %define SYS_exit    1
    %define SYS_fork    2
    %define SYS_read    3
    %define SYS_write   4
    ; [etc...]

Wir f?gen eine kleine, nicht globale Prozedur mit langem Namen ein,
damit wir den Namen nicht aus Versehen in unserem Code wiederverwenden:

.. code:: programlisting

    section    .text
    align 4
    access.the.bsd.kernel:
        int 80h
        ret

Wir erzeugen ein Makro, das ein Argument erwartet, die
Systemaufruf-Nummer:

.. code:: programlisting

    %macro  system  1
        mov eax, %1
        call    access.the.bsd.kernel
    %endmacro

Letztlich erzeugen wir Makros f?r jeden Systemaufruf. Diese Argumente
erwarten keine Argumente.

.. code:: programlisting

    %macro sys.exit    0
        system  SYS_exit
    %endmacro

    %macro  sys.fork    0
        system  SYS_fork
    %endmacro

    %macro  sys.read    0
        system  SYS_read
    %endmacro

    %macro  sys.write   0
        system  SYS_write
    %endmacro

    ; [etc...]

Fahren Sie fort, geben das in Ihren Editor ein und speichern es als
``system.inc``. Wenn wir Systemaufrufe besprechen, werden wir noch
Erg?nzungen in dieser Datei vornehmen.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------+-------------------------------+------------------------------------------+
| `Zur?ck <x86-return-values.html>`__?   | `Nach oben <x86.html>`__      | ?\ `Weiter <x86-first-program.html>`__   |
+----------------------------------------+-------------------------------+------------------------------------------+
| 11.4. R?ckgabewerte?                   | `Zum Anfang <index.html>`__   | ?11.6. Unser erstes Programm             |
+----------------------------------------+-------------------------------+------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
