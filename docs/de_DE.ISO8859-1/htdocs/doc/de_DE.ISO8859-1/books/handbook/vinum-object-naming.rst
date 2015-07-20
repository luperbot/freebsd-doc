=====================
23.7. Objektbenennung
=====================

.. raw:: html

   <div class="navheader">

23.7. Objektbenennung
`Zur?ck <vinum-examples.html>`__?
Kapitel 23. Der Vinum Volume Manager
?\ `Weiter <vinum-config.html>`__

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

23.7. Objektbenennung
---------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wie oben beschrieben, weist Vinum den Plexus und Subdisks Standardnamen
zu, wenngleich diese ?berschrieben werden k?nnen. Das ?berschreiben
dieser Standardnamen wird allerdings nicht empfohlen. Erfahrungen mit
dem VERITAS Volume Manager (der eine willk?rliche Benennung von Objekten
erlaubt) haben gezeigt, dass diese Flexibilit?t keinen entscheidenden
Vorteil bringt und zudem Verwirrung stiften kann.

Namen d?rfen zwar alle nichtleeren Zeichen enthalten, es ist aber
sinnvoll, nur Buchstaben, Ziffern und den Unterstrich zu verwenden. Die
Namen von Volumes, Plexus und Subdisks k?nnen bis zu 64 Zeichen lang
sein, die Namen von Platten d?rfen hingegen nur bis zu 32 Zeichen lang
sein.

Vinum-Objekten werden Ger?tedateien in der ``/dev/gvinum``-Hierarchie
zugewiesen. Die weiter oben dargestellte Konfiguration w?rde Vinum dazu
veranlassen, die folgenden Ger?tedateien zu erstellen:

.. raw:: html

   <div class="itemizedlist">

-  Ger?te-Eintr?ge f?r jedes Volume. Dieses sind die Hauptger?te, die
   von Vinum benutzt werden. Somit w?rde die Konfiguration von oben
   folgende Ger?te beinhalten: ``/dev/gvinum/myvol``,
   ``/dev/gvinum/mirror``, ``/dev/gvinum/striped``,
   ``/dev/gvinum/raid5`` sowie ``/dev/gvinum/raid10``.

-  Alle Volumes bekommen direkte Eintr?ge unter ``/dev/gvinum/``.

-  Die Verzeichnisse ``/dev/gvinum/plex`` und ``/dev/gvinum/sd``, die
   Ger?tedateien f?r jeden Plexus sowie jede Subdisk enthalten.

.. raw:: html

   </div>

Stellen Sie sich folgende Konfigurationsdatei vor:

.. code:: programlisting

        drive drive1 device /dev/sd1h
        drive drive2 device /dev/sd2h
        drive drive3 device /dev/sd3h
        drive drive4 device /dev/sd4h
        volume s64 setupstate
          plex org striped 64k
            sd length 100m drive drive1
            sd length 100m drive drive2
            sd length 100m drive drive3
            sd length 100m drive drive4

Nach Abarbeitung dieser Datei erstellt
`gvinum(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gvinum&sektion=8>`__
die folgende Struktur unter ``/dev/gvinum``:

.. code:: programlisting

        drwxr-xr-x  2 root  wheel       512 Apr 13 16:46 plex
        crwxr-xr--  1 root  wheel   91,   2 Apr 13 16:46 s64
        drwxr-xr-x  2 root  wheel       512 Apr 13 16:46 sd

        /dev/vinum/plex:
        total 0
        crwxr-xr--  1 root  wheel   25, 0x10000002 Apr 13 16:46 s64.p0

        /dev/vinum/sd:
        total 0
        crwxr-xr--  1 root  wheel   91, 0x20000002 Apr 13 16:46 s64.p0.s0
        crwxr-xr--  1 root  wheel   91, 0x20100002 Apr 13 16:46 s64.p0.s1
        crwxr-xr--  1 root  wheel   91, 0x20200002 Apr 13 16:46 s64.p0.s2
        crwxr-xr--  1 root  wheel   91, 0x20300002 Apr 13 16:46 s64.p0.s3

Es wird empfohlen, f?r Plexus und Subdisks keine eigenen Namen zu
vergeben. Dies gilt aber nicht f?r Vinum-Platten. Durch die Benennung
von Vinum-Platten wird es erst m?glich, eine Platte an einen anderen Ort
zu verschieben und sie trotzdem noch automatisch erkennen zu lassen.
Plattennamen k?nnen bis zu 32 Zeichen lang sein.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

23.7.1. Dateisysteme erstellen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Volumes erscheinen (mit einer Ausnahme) dem System nicht anders als
Platten. Anders als UNIX?-Platten partitioniert Vinum seine Volumes
nicht, weshalb diese auch keine Partitionstabellen haben. Dies wiederum
hat Modifikationen an einigen Platten-Tools, insbesondere
`newfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newfs&sektion=8>`__,
n?tig gemacht, welche bis dahin den letzten Buchstaben eines
Vinum-Volume-Namen als Partitionsbezeichner identifiziert haben. Zum
Beispiel k?nnte eine Platte einen Namen wie ``/dev/ad0a`` oder
``/dev/da2h`` haben. Diese Namen bedeuten, dass es sich um die erste
Partition (``a``) der ersten (0) IDE-Platte (``ad``) und respektive die
achte Partition (``h``) der dritten (2) SCSI-Platte (``da``) handelt. Im
Vergleich dazu k?nnte ein Vinum-Volume beispielsweise
``/dev/gvinum/concat`` hei?en, ein Name, der in keiner Beziehung mit
einem Partitionsnamen steht.

Um nun ein Dateisystem auf diesem Volume anzulegen, benutzen Sie
`newfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newfs&sektion=8>`__:

.. code:: screen

    # newfs /dev/gvinum/concat

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------+------------------------------------+-------------------------------------+
| `Zur?ck <vinum-examples.html>`__?   | `Nach oben <vinum-vinum.html>`__   | ?\ `Weiter <vinum-config.html>`__   |
+-------------------------------------+------------------------------------+-------------------------------------+
| 23.6. Einige Beispiele?             | `Zum Anfang <index.html>`__        | ?23.8. Vinum konfigurieren          |
+-------------------------------------+------------------------------------+-------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
