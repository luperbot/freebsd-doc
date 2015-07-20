===============================
20.6. Das Labeln von Laufwerken
===============================

.. raw:: html

   <div class="navheader">

20.6. Das Labeln von Laufwerken
`Zur?ck <geom-ggate.html>`__?
Kapitel 20. GEOM: Modulares Framework zur Plattentransformation
?\ `Weiter <geom-gjournal.html>`__

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

20.6. Das Labeln von Laufwerken
-------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

W?hrend der Initialisierung des Systems legt der FreeBSD-Kernel f?r
jedes gefundene Ger?t Knotenpunkte an. Diese Methode f?r die ?berpr?fung
auf vorhandene Ger?te wirft einige Fragen auf. Was passiert
beispielsweise, wenn ein neues USB-Laufwerk hinzugef?gt wird? Es ist
sehr wahrscheinlich, dass ein Flash-Speicher-Ger?t den Ger?tenamen
``da0`` erh?lt, w?hrend gleichzeitig das bisherige ``da0`` zu ``da1``
wird. Dies verursacht Probleme beim Einh?ngen von Dateisystemen, wenn
diese in der ``/etc/fstab`` aufgef?hrt sind und schlussendlich mag das
auch dazu f?hren, dass das System nicht mehr startet.

Eine L?sung f?r dieses Problem ist das Aneinanderketten der SCSI-Ger?te,
damit ein neues Ger?t, welches der SCSI-Karte hinzugef?gt wird,
unbenutzte Ger?tenummern erh?lt. Aber was geschieht, wenn ein USB-Ger?t
m?glicherweise die prim?re SCSI-Platte ersetzt? Dies kann passieren,
weil USB-Ger?te normalerweise vor der SCSI-Karte gepr?ft werden. Eine
L?sung ist das Hinzuf?gen dieser Ger?te, nachdem das System gestartet
ist. Eine andere L?sung k?nnte sein, nur ein einzelnes ATA-Laufwerk zu
nutzen und die SCSI-Ger?te niemals in der ``/etc/fstab`` aufzuf?hren.

Es gibt allerdings eine bessere L?sung. Durch Verwendung des
``glabel``-Dienstprogramms kann ein Administrator oder Benutzer seine
Laufwerke mit Labeln versehen und diese in der ``/etc/fstab`` nutzen. Da
``glabel`` seine Label im letzten Sektor jedes vorhandenen Datentr?gers
speichert, wird das Label persistent bleiben (auch ?ber Neustarts
hinweg). Durch Nutzung dieses Labels als Ger?t kann das Dateisystem
immer gemountet sein, unabh?ngig davon, durch welchen Ger?te-Knotenpunkt
auf ihn zugegriffen wird.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Der Label muss permanent (dauerhaft) sein. Man kann das Dienstprogramm
``glabel`` nutzen, um sowohl transiniente als auch permanente Label zu
erzeugen. Aber nur permanente (persistente) Label bleiben konsistent
?ber Neustarts hinweg. Lesen Sie die
`glabel(8) <http://www.FreeBSD.org/cgi/man.cgi?query=glabel&sektion=8>`__-Manualpage
f?r weitere Unterschiede zwischen den Label-Typen.

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

20.6.1. Label-Typen und Beispiele
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Es gibt zwei Arten von Labeln: generische Label und Dateisystem-Label.
Label k?nnen dauerhaft (permanent) oder tempor?r sein. Permanente Label
k?nnen mit
`tunefs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=tunefs&sektion=8>`__
oder
`newfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newfs&sektion=8>`__
in einem speziellen spezielles Verzeichnis in ``/dev`` erzeugt werden,
welches entsprechend der Dateisystem-Art benannt wird.
UFS2-Dateisystem-Label werden zum Beispiel im Verzeichnis ``/dev/ufs``
angelegt. Permanente Label k?nnen au?erdem durch den Befehl
``glabel label`` erzeugt werden. Diese Label sind dann allerdings nicht
dateisystemspezisch und werden im Unterverzeichnis ``/dev/label``
erzeugt.

Ein tempor?res Label verschwindet mit dem n?chsten Systemstart. Diese
Label werden im Verzeichnis ``/dev/label`` erzeugt und sind ideal f?r
Testzwecke. Ein tempor?res Label kann durch den Befehl ``glabel create``
erzeugt werden. Weitere Informationen finden sich in der Manualpage
`glabel(8) <http://www.FreeBSD.org/cgi/man.cgi?query=glabel&sektion=8>`__.

Um ein permanentes Label auf einem UFS2-Dateisystem ohne L?schung von
Daten zu erzeugen, kann man folgenden Befehl verwenden:

.. code:: screen

    # tunefs -L home /dev/da3

.. raw:: html

   <div class="warning" xmlns="">

Warnung:
~~~~~~~~

Wenn das Dateisystem voll ist, kann dies zu Datenkorruption f?hren; aber
egal wie, falls das Dateisystem voll ist, sollte das Hauptziel die
Entfernung ungen?tzter Dateien und nicht das Hinzuf?gen von Labeln sein.

.. raw:: html

   </div>

Ein Label sollte nun in ``/dev/ufs`` vorhanden sein, der zu
``/etc/fstab`` hinzugef?gt wird:

.. code:: programlisting

    /dev/ufs/home      /home            ufs     rw              2      2

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Das Dateisystem darf nicht gemountet sein beim Versuch, ``tunefs``
auszuf?hren.

.. raw:: html

   </div>

Nun kann das Dateisystem wie ?blich gemountet werden:

.. code:: screen

    # mount /home

Von nun an kann der Ger?te-Knotenpunkt sich ohne negative Effekte auf
das System ?ndern, solange das Kernelmodul ``geom_label.ko`` beim
Systemstart mittels ``/boot/loader.conf`` geladen wird oder die
``GEOM_LABEL``-Kernel-Option aktiv ist.

Dateisysteme k?nnen auch mit einem Standard-Label erzeugt werden
(mittels des Flags ``-L`` in ``newfs``). Lesen Sie bitte die Manualpage
von
`newfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newfs&sektion=8>`__
f?r weitere Informationen.

Der folgende Befehl kann genutzt werden, um das Label zu beseitigen:

.. code:: screen

    # glabel destroy home

Das folgende Beispiel zeigt Ihnen, wie Sie Label f?r die Partitionen
einer Bootplatte erzeugen.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel 20.1. Die Partitionen einer Bootplatte labeln

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Durch das Erstellen von permanenten Labeln f?r die Partitionen einer
Bootplatte sollte das System selbst dann noch normal starten k?nnen,
wenn Sie die Platte an einen anderen Controller anschlie?en oder in ein
anderes System installieren. In diesem Beispiel nehmen wir an, dass nur
eine einzige ATA-Platte verwendet wird, die Ihr System derzeit als
``ad0`` erkennt. Weiters nehmen wir an, dass Sie das
Standard-Partionierungsschema von FreeBSD vewendet haben und Ihre Platte
daher die Dateisysteme ``/``, ``/var``, ``/usr`` sowie ``/tmp``
aufweist. Zus?tzlich wurde eine Swap-Partition angelegt.

Starten Sie das System neu. Am
`loader(8) <http://www.FreeBSD.org/cgi/man.cgi?query=loader&sektion=8>`__-Prompt
dr?cken Sie die Taste **4**, um in den Single-User-Modus zu gelangen.
Dort f?hren Sie die folgenden Befehle aus:

.. code:: screen

    # glabel label rootfs /dev/ad0s1a
    GEOM_LABEL: Label for provider /dev/ad0s1a is label/rootfs
    # glabel label var /dev/ad0s1d
    GEOM_LABEL: Label for provider /dev/ad0s1d is label/var
    # glabel label usr /dev/ad0s1f
    GEOM_LABEL: Label for provider /dev/ad0s1f is label/usr
    # glabel label tmp /dev/ad0s1e
    GEOM_LABEL: Label for provider /dev/ad0s1e is label/tmp
    # glabel label swap /dev/ad0s1b
    GEOM_LABEL: Label for provider /dev/ad0s1b is label/swap
    # exit

Das System startet daraufhin in den Multi-User-Modus. Nachdem der
Startvorgang abgeschlossen ist, editieren Sie die Datei ``/etc/fstab``
und ersetzen die konventionellen Ger?tedateien durch die entsprechenden
Label. Ihre modifizierte ``/etc/fstab`` sollte nun ?hnlich der folgenden
Ausgabe aussehen:

.. code:: programlisting

    # Device                Mountpoint      FStype  Options         Dump    Pass#
    /dev/label/swap         none            swap    sw              0       0
    /dev/label/rootfs       /               ufs     rw              1       1
    /dev/label/tmp          /tmp            ufs     rw              2       2
    /dev/label/usr          /usr            ufs     rw              2       2
    /dev/label/var          /var            ufs     rw              2       2

Starten Sie Ihr System neu. Traten keine Probleme auf, wird das System
normal hochfahren und Sie erhalten die folgende Ausgabe, wenn Sie den
Befehl ``mount`` ausf?hren:

.. code:: screen

    # mount
    /dev/label/rootfs on / (ufs, local)
    devfs on /dev (devfs, local)
    /dev/label/tmp on /tmp (ufs, local, soft-updates)
    /dev/label/usr on /usr (ufs, local, soft-updates)
    /dev/label/var on /var (ufs, local, soft-updates)

.. raw:: html

   </div>

.. raw:: html

   </div>

Beginnend mit FreeBSD?7.2, unterst?tzt
`glabel(8) <http://www.FreeBSD.org/cgi/man.cgi?query=glabel&sektion=8>`__
einen neuen Labeltyp f?r UFS-Dateisysteme. Dieser basiert auf der
eindeutigen Dateisystem-ID ``ufsid``. Derartige Label finden sich im
Verzeichnis ``/dev/ufsid`` und werden w?hrend des Systemstarts
automatisch erzeugt. Es ist m?glich, diese ``ufsid``-Label zum
automatischen Einh?ngen von Partitionen in der Datei ``/etc/fstab``
einzusetzen. Verwenden Sie den Befehl ``glabel status``, um eine Liste
aller Dateisysteme und ihrer ``ufsid``-Label zu erhalten:

.. code:: screen

    % glabel status
                      Name  Status  Components
    ufsid/486b6fc38d330916     N/A  ad4s1d
    ufsid/486b6fc16926168e     N/A  ad4s1f

In diesem Beispiel repr?sentiert ``ad4s1d`` das ``/var``-Dateisystem,
w?hrend ``ad4s1f`` dem ``/usr``-Dateisystem entspricht. Wenn Sie die
angegebenen ``ufsid``-Werte verwenden, k?nnen diese Dateisysteme durch
die folgenden Eintr?ge in der Datei ``/etc/fstab`` gemountet werden:

.. code:: programlisting

    /dev/ufsid/486b6fc38d330916        /var        ufs        rw        2      2
    /dev/ufsid/486b6fc16926168e        /usr        ufs        rw        2      2

Jede Partition, die ein ``ufsid``-Label aufweist, kann auf diese Art
gemountet werden. Dies hat den Vorteil, dass Sie keine permanenten Label
mehr anlegen m?ssen, wobei sich die Platten nach wie vor ?ber
ger?teunabh?ngige Namen ansprechen und mounten lassen.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------+-------------------------------+--------------------------------------+
| `Zur?ck <geom-ggate.html>`__?     | `Nach oben <GEOM.html>`__     | ?\ `Weiter <geom-gjournal.html>`__   |
+-----------------------------------+-------------------------------+--------------------------------------+
| 20.5. GEOM Gate Netzwerkger?te?   | `Zum Anfang <index.html>`__   | ?20.7. UFS Journaling in GEOM        |
+-----------------------------------+-------------------------------+--------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
