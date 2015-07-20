=============================================
23.9. Vinum f?r das Root-Dateisystem benutzen
=============================================

.. raw:: html

   <div class="navheader">

23.9. Vinum f?r das Root-Dateisystem benutzen
`Zur?ck <vinum-config.html>`__?
Kapitel 23. Der Vinum Volume Manager
?\ `Weiter <virtualization.html>`__

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

23.9. Vinum f?r das Root-Dateisystem benutzen
---------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Auf einem System, das mit Hilfe von Vinum vollgespiegelte Dateisysteme
hat, ist es w?nschenswert, auch das Root-Dateisystem zu spiegeln. Solch
eine Konfiguration ist allerdings weniger trivial als das Spiegeln eines
gew?hnlichen Dateisystems, weil:

.. raw:: html

   <div class="itemizedlist">

-  Das Root-Dateisystem in einer sehr fr?hen Phase des Bootvorgangs
   verf?gbar sein muss, und damit auch die Vinum-Infrastruktur.

-  Das Volume, welches das Root-Dateisystem enth?lt, auch den Bootstrap
   und den Kernel enth?lt, die wiederum nur mit den systemeigenen Tools
   (zum Beispiel dem BIOS bei handels?blichen PCs) gelesen werden k?nnen
   und meist nicht dazu gebracht werden k?nnen, Vinum zu verstehen.

.. raw:: html

   </div>

Im folgenden Abschnitt wird der Begriff „Root-Volume“ benutzt, um das
Vinum-Volume zu beschreiben, welches das Root-Dateisystem enth?lt. Es
ist eine gute Idee, f?r dieses Volume den Namen ``"root"`` zu benutzen,
aber es ist in keiner Weise technisch n?tig (Das folgende Beispiel geht
allerdings davon aus, dass dies der Fall ist.).

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

23.9.1. Vinum f?r das Root-Dateisystem rechtzeitig starten
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Damit dies gelingt, m?ssen Sie folgende Aufgaben erledigen:

.. raw:: html

   <div class="itemizedlist">

-  Vinum muss zum Zeitpunkt des Bootvorganges im Kernel zur Verf?gung
   stehen. Deswegen ist die Methode zum Start von Vinum, die in
   `Abschnitt?23.8.1.1, „Automatische
   Inbetriebnahme“ <vinum-config.html#vinum-rc-startup>`__ beschrieben
   wird, f?r diese Aufgabe nicht geeignet. Also muss auch der
   ``start_vinum``-Parameter eigentlich *nicht* gesetzt werden, wenn man
   das folgende Setup einrichtet. Die erste M?glichkeit w?re es, Vinum
   statisch in den Kernel zu kompilieren, so dass es st?ndig verf?gbar
   ist, was aber in der Regel nicht erw?nscht ist. Ebenso gibt es die
   M?glichkeit ``/boot/loader`` (`Abschnitt?13.3.3, „Phase drei,
   ``/boot/loader``\ “ <boot-blocks.html#boot-loader>`__) das
   Vinum-Kernelmodul fr?h genug laden zu lassen (und zwar noch bevor der
   Kernel gestartet wird). Dies kann bewerkstelligt werden, indem die
   Zeile

   .. code:: programlisting

       geom_vinum_load="YES"

   in die Datei ``/boot/loader.conf`` eingetragen wird.

-  F?r *Gvinum* ist das oben beschriebene Prozedere alles, was Sie tun
   m?ssen, da der gesamte Startvorgang automatisch erledigt wird, sobald
   das Kernelmodul geladen wurde.

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

23.9.2. Ein Vinum-basiertes Root-Volume dem Bootstrap verf?gbar machen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Da der aktuelle FreeBSD-Bootstrap nur 7,5 KB Code enth?lt und schon ohne
Vinum die Aufgabe hat, bestimmte Dateien (wie ``/boot/loader``) von
einem UFS-Dateisystem zu lesen, ist es schier unm?glich, ihm auch noch
die Interna von Vinum beizubringen, damit er die
Vinum-Konfigurationsdaten auslesen und die Elemente eines Boot-Volumes
selbst herausfinden k?nnte. Daher sind ein paar Tricks n?tig, um dem
Bootstrap-Code die Illusion einer Standard-\ ``"a"``-Partition mit einem
Root-Dateisystem vorzugaukeln.

Damit dies ?berhaupt m?glich wird, m?ssen die folgenden Bedingungen f?r
das Root-Dateisystem erf?llt sein:

.. raw:: html

   <div class="itemizedlist">

-  Das Root-Volume darf weder gestriped noch RAID-5 sein.

-  Das Root-Volume darf nicht mehr als eine konkatenierte Subdisk pro
   Plexus enthalten.

.. raw:: html

   </div>

Beachten Sie, dass es m?glich und w?nschenswert ist, mehrere Plexus zu
haben, von denen jeder eine Kopie des Root-Dateisystems enth?lt. Der
Bootstrap-Prozess wird hingegen nur einen dieser Plexus benutzen, um den
Bootstrap und alle Dateien zu finden, bis der Kernel letztendlich das
Root-Dateisystem selbst laden wird. Jede einzelne Subdisk innerhalb
dieser Plexus wird dann ihre eigene Illusion der Partition ``"a"``
brauchen, damit das entsprechende Ger?t bootbar wird. Es ist nicht
unbedingt notwendig, dass sich jede dieser gef?lschten
``"a"``-Partitionen auf seinem Ger?t an einem Ort befindet, der um den
selben Wert verschoben ist wie auf den anderen Ger?ten, die Plexus des
Root-Dateisystems enthalten. Um Unklarheiten zu verhindern, ist es
jedoch eine gute Idee, die Vinum-Volumes so zu erstellen, dass die
gespiegelten Ger?te symmetrisch sind.

Damit diese ``"a"``-Partitionen eingerichtet werden k?nnen, muss f?r
alle Ger?te, die Teil des Root-Dateisystems sind, folgendes getan
werden:

.. raw:: html

   <div class="procedure">

#. Der Ort (Verschiebung vom Beginn des Ger?tes) und die Gr??e der
   Subdisk, die Teil des Root-Volumes ist, muss untersucht werden:

   .. code:: screen

       # gvinum l -rv root

   Beachten Sie, dass Vinum-Verschiebungen und -Gr??en in Bytes gemessen
   werden. Sie m?ssen deshalb durch 512 geteilt werden, um die
   Blockanzahl zu erhalten, wie sie das ``bsdlabel``-Kommando verwendet.

#. F?hren Sie den Befehl

   .. code:: screen

       # bsdlabel -e devname

   f?r jedes Ger?t, dass am Root-Volume beteiligt ist, aus.
   *``devname``* muss entweder der Name der Platte (wie ``da0``), im
   Falle einer Platte ohne Slice-Tabelle oder der Name des Slices (wie
   ``ad0s1``) sein.

   Wenn es schon eine ``"a"``-Partition auf dem Ger?t (in der Regel
   wahrscheinlich ein Pr?-Vinum-Root-Dateisystem) gibt, sollte diese
   umbenannt werden, damit sie weiterhin verf?gbar bleibt (nur f?r den
   Fall). Sie wird aber nicht l?nger benutzt, um das System zu starten.
   Beachten Sie aber, dass aktive Partitionen (wie ein gemountetes
   Root-Dateisystem) nicht umbenannt werden k?nnen, sodass Sie entweder
   von einem „Fixit“-Medium booten m?ssen, oder aber mittels eines
   zweistufigen Prozesses (sofern Sie in einer gespiegelten Umgebung
   arbeiten) zuerst die Platte ?ndern, von der gerade nicht gebootet
   wurde.

   Nun muss die Verschiebung der Vinum-Partition (sofern vorhanden) auf
   diesem Ger?t mit der Veschiebung der entsprechenden
   Root-Volume-Subdisk addiert werden. Das Resultat wird der
   ``"offset"``-Wert f?r die neue ``"a"``-Partition. Der ``"size"``-Wert
   f?r diese Partition kann entsprechend der Berechnung ermittelt
   werden. ``"fstype"`` sollte ``4.2BSD`` sein. Die ``"fsize"``-,
   ``"bsize"``-, und ``"cpg"``- Werte sollten entsprechend dem
   eigentlichen Dateisystem gew?hlt werden, obwohl sie in diesem Kontext
   ziemlich unwichtig sind.

   Auf diese Art und Weise wird eine neue Partition ``"a"`` etabliert,
   die die Vinum-Partition auf diesem Ger?t ?berschneidet. Beachte Sie,
   dass das ``bsdlabel``-Kommando diese ?berschneidung nur erlaubt, wenn
   die Partition richtig mit dem ``"vinum"``-fstype markiert ist.

#. Das ist alles. Auf jedem Ger?t befindet sich nun eine gef?lschte
   ``"a"``-Partition, die eine Kopie des Root-Volumes enth?lt. Es wird
   dringend empfohlen, das Resultat dieser Konfiguration zu ?berpr?fen:

   .. code:: screen

       # fsck -n /dev/devnamea

.. raw:: html

   </div>

Denken Sie stets daran, dass alle Dateien, die Kontrollinformationen
enthalten, nun relativ zum Root-Dateisystem innerhalb des Vinum-Volumes
sein m?ssen. Denn ein neu eingerichtetes Vinum-Root-Dateisystem ist
m?glicherweise inkompatibel zum gerade aktiven Root-Dateisystem. Deshalb
m?ssen insbesondere die Dateien ``/etc/fstab`` und ``/boot/loader.conf``
?berpr?ft werden.

Beim n?chsten Systemstart sollte der Bootstrap die ad?quaten
Kontrollinformationen des neuen Vinum-basierten Root-Dateisystems
automatisch herausfinden und entsprechend handeln. Am Ende des
Kernel-Initialisierungsprozesses (nachdem alle Ger?te angezeigt wurden)
erhalten Sie bei einer erfolgreichen Konfiguration eine Nachricht
?hnlich der folgenden:

.. code:: screen

    Mounting root from ufs:/dev/gvinum/root

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

23.9.3. Beispiel eines Vinum-basierten Root-Setups
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Nachdem das Vinum-Root-Volume eingerichtet wurde, k?nnte die Ausgabe von
``gvinum l -rv root`` bespielsweise so aussehen:

.. code:: screen

    ...
    Subdisk root.p0.s0:
            Size:        125829120 bytes (120 MB)
            State: up
            Plex root.p0 at offset 0 (0  B)
            Drive disk0 (/dev/da0h) at offset 135680 (132 kB)

    Subdisk root.p1.s0:
            Size:        125829120 bytes (120 MB)
            State: up
            Plex root.p1 at offset 0 (0  B)
            Drive disk1 (/dev/da1h) at offset 135680 (132 kB)
        

Wichtig ist hier insbesondere ist der Wert ``135680`` f?r die
Verschiebung (relativ zur Partition ``/dev/da0h``). Das entspricht beim
Einsatz von ``bsdlabel`` 265 512-Byte-Plattenbl?cken. Dieses Root-Volume
ist ebenso 245760 512-Byte-Bl?cke gro?. ``/dev/da1h`` enth?lt die zweite
Kopie dieses Root-Volumes und ist symmetrisch aufgebaut.

Das Bsdlabel f?r diese Ger?te k?nnte so aussehen:

.. code:: screen

    ...
    8 partitions:
    #        size   offset    fstype   [fsize bsize bps/cpg]
      a:   245760      281    4.2BSD     2048 16384     0   # (Cyl.    0*- 15*)
      c: 71771688        0    unused        0     0         # (Cyl.    0 - 4467*)
      h: 71771672       16     vinum                        # (Cyl.    0*- 4467*)
        

Wie man leicht feststellen kann, entspricht der Parameter ``"size"`` der
gef?lschten ``"a"``-Partition dem ausgewiesenen Wert von oben, w?hrend
der Parameter ``"offset"`` gleich der Summe der Verschiebung innerhalb
der Vinum-Partition ``"h"`` und der Verschiebung innerhalb des Ger?ts
(oder Slice) ist. Dies ist ein typischer Aufbau, der n?tig ist, um die
in `Abschnitt?23.9.4.3, „Nichts bootet, der Bootstrap h?ngt sich
auf“ <vinum-root.html#vinum-root-panic>`__ beschriebenen Probleme zu
vermeiden. Die gesamte Partition ``"a"`` befindet sich in ``"h"``, die
alle Vinum-Daten f?r dieses Ger?t enth?lt.

Beachten Sie, dass in dem oben beschriebenen Beispiel das gesamte Ger?t
Vinum gewidmet ist und keine Pr?-Vinum-Partition zur?ckgelassen wurde,
da es sich im Beispiel um eine neu eingerichtete Platte handelt, die nur
f?r die Vinum-Konfiguration bestimmt war.

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

23.9.4. Fehlerbehebung
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Der folgende Abschnitt beschreibt einige bekannte Probleme und
Fallstricke bei der Vinum-Konfiguration sowie deren Behebung.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

23.9.4.1. Der System-Bootstrap l?dt zwar, das System startet aber nicht.
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn aus irgendeinem Grund das System nicht mit dem Booten fortf?hrt,
kann man den Bootstrap w?hrend der 10-Sekunden-Warnung durch Dr?cken der
**Leertaste** unterbrechen. Die *loader*-Variablen (wie
``vinum.autostart``) k?nnen mittels des ``show``-Kommandos untersucht,
und mit ``set`` oder ``unset`` ge?ndert werden.

Wenn das einzige Problem das Fehlen des Vinum-Kernelmoduls in der Liste
der automatisch zu ladenden Module ist, hilft ein einfaches
``load geom_vinum``.

Danach k?nnen Sie den Bootvorgang mit ``boot -as`` fortsetzen. Die
Optionen ``-as`` fordern den Kernel auf, nach dem zu mountenden
Root-Dateisystem zu fragen (``-a``), und den Bootvorgang im
Single-User-Modus (``-s``) zu beenden, in dem das Root-Dateisystem schon
schreibgesch?tzt gemountet ist. Auf diese Weise wird keine
Dateninkonsistenz zwischen den Plexus riskiert, auch wenn nur ein Plexus
eines Multi-Plexus-Volumes gemountet wurde.

Beim Prompt, das nach einem Root-Dateisystem fragt, kann jedes Ger?t
angegeben werden, dass ein g?ltiges Root-Dateisystem hat. Wenn
``/etc/fstab`` richtig konfiguriert wurde, sollte die Vorgabe etwas wie
``ufs:/dev/gvinum/root`` sein. Eine typische Alternative w?rde etwas wie
``ufs:da0d`` sein, welches eine hypothetische Partition sein k?nnte, die
ein Pre-Vinum-Root-Dateisystem enth?lt. Vorsicht sollte walten, wenn
eine der *alias* ``"a"``-Partitionen hier eingegeben wird, die
eigentlich Referenzen auf die Subdisks des Vinum-Root-Dateisystems sind,
da so nur ein St?ck eines gespiegelten Root-Ger?tes gemountet werden
w?rde. Wenn das Dateisystem sp?ter zum Lesen und Schreiben gemountet
werden soll, ist es n?tig, die anderen Plexus des Vinum-Root-Volumes zu
entfernen, weil diese Plexus andernfalls inkonsistente Daten enthalten
w?rden.

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

23.9.4.2. Nur der prim?re Bootstrap l?dt
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn das Laden von ``/boot/loader`` fehlschl?gt, aber der prim?re
Bootstrap dennoch l?dt (sichtbar an dem einzelnen Strich in der linken
Spalte des Bildschirms gleich nachdem der Bootprozess startet), kann man
versuchen, den prim?ren Bootstrap an diesem Punkt durch Benutzen der
**Leertaste** zu unterbrechen. Dies wird den Bootstrap in der zweiten
Phase stoppen (siehe dazu auch `Abschnitt?13.3.2, „Phase Eins,
``/boot/boot1`` und Phase Zwei,
``/boot/boot2``\ “ <boot-blocks.html#boot-boot1>`__). Hier kann nun der
Versuch unternommen werden, von einer anderen Partition zu booten, wie
beispielsweise dem vorhergehenden Root-Dateisystem, das von ``"a"``
verschoben wurde.

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

23.9.4.3. Nichts bootet, der Bootstrap h?ngt sich auf
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Diese Situation wird vorkommen, wenn der Bootstrap durch die
Vinum-Installation zerst?rt worden ist. Ungl?cklicherweise l?sst Vinum
am Anfang seiner Partition nur 4?KB frei und schreibt dahinter seine
Kopfinformationen. Allerdings ben?tigen Stufe-Eins- und -Zwei-Bootstraps
plus dem dazwischen eingebetteten *bsdlabel* momentan 8?KB. Demzufolge
wird die Vinum-Installation, wenn die Vinum-Partition mit der
Verschiebung 0 (innerhalb eines Slice oder einer Platte, die zum Start
bestimmt waren) eingerichtet wurde, den Bootstrap zerst?ren.

Analog wird eine anschlie?ende Reinstallation eines Bootstrap (zum
Beispiel durch Booten eines „Fixit“-Mediums) mit ``bsdlabel -B``, wie in
`Abschnitt?13.3.2, „Phase Eins, ``/boot/boot1`` und Phase Zwei,
``/boot/boot2``\ “ <boot-blocks.html#boot-boot1>`__ beschrieben, den
Vinum-Kopf zerst?ren und Vinum wird seine Platte(n) nicht mehr finden
k?nnen. Obwohl keine eigentlichen Vinum-Konfigurationsdaten oder Daten
in den Vinum-Volumes zerst?rt werden und es m?glich w?re, alle Daten
wiederherzustellen, indem die exakt gleichen Vinum-Konfigurationsdaten
noch einmal eingegeben werden, bleibt die Situation schwer zu
bereinigen, da es n?tig ist, die gesamte Vinum-Partition um mindestens
4?KB nach hinten zu verschieben, damit Bootstrap und Vinum-Kopf nicht
mehr kollidieren.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------+------------------------------------+---------------------------------------+
| `Zur?ck <vinum-config.html>`__?   | `Nach oben <vinum-vinum.html>`__   | ?\ `Weiter <virtualization.html>`__   |
+-----------------------------------+------------------------------------+---------------------------------------+
| 23.8. Vinum konfigurieren?        | `Zum Anfang <index.html>`__        | ?Kapitel 24. Virtualisierung          |
+-----------------------------------+------------------------------------+---------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
