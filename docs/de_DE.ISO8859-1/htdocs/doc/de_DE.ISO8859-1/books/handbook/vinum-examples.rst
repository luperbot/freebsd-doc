======================
23.6. Einige Beispiele
======================

.. raw:: html

   <div class="navheader">

23.6. Einige Beispiele
`Zur?ck <vinum-objects.html>`__?
Kapitel 23. Der Vinum Volume Manager
?\ `Weiter <vinum-object-naming.html>`__

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

23.6. Einige Beispiele
----------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Vinum verwaltet eine *Konfigurationsdatenbank* f?r alle einem
individuellen System bekannten Objekte. Zu Beginn erzeugt ein Benutzer
mit
`gvinum(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gvinum&sektion=8>`__
eine Konfigurationsdatenbank aus einer oder mehreren
Konfigurationsdateien. Vinum speichert danach eine Kopie der
Konfigurationsdatenbank in jedem von ihm kontrollierten Slice (von Vinum
als *Device* bezeichnet). Da die Datenbank bei jedem Statuswechsel
aktualisiert wird, kann nach einem Neustart der Status jedes
Vinum-Objekts exakt wiederhergestellt werden.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

23.6.1. Die Konfigurationsdatei
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Konfigurationsdatei beschreibt individuelle Vinum-Objekte. Die
Beschreibung eines einfachen Volumes k?nnte beispielsweise so aussehen:

.. code:: programlisting

        drive a device /dev/da3h
        volume myvol
          plex org concat
            sd length 512m drive a

Diese Datei beschreibt vier Vinum-Objekte:

.. raw:: html

   <div class="itemizedlist">

-  Die *drive*-Zeile beschreibt eine Plattenpartition (*drive*) sowie
   ihre Position in Bezug auf die darunter liegende Hardware. Die
   Partition hat dabei den symbolischen Namen *a*. Diese Trennung von
   symbolischen Namen und Ger?tenamen erlaubt es, die Position von
   Platten zu ?ndern, ohne dass es zu Problemen kommt.

-  Die *volume*-Zeile beschreibt ein Volume. Daf?r wird nur ein einziges
   Attribut, der Name des Volumes, ben?tigt. In unserem Fall hat das
   Volume den Namen *myvol*.

-  Die *plex*-Zeile definiert einen Plexus. Auch hier wird nur ein
   Parameter, und zwar die Art des Aufbau, ben?tigt (in unserem Fall
   *concat*). Es wird kein Name ben?tigt, das System generiert
   automatisch einen Namen aus dem Volume-Namen und dem Suffix *.p**x*
   wobei *x* die Nummer des Plexus innerhalb des Volumes angibt. So wird
   dieser Plexus den Namen *myvol.p0* erhalten.

-  Die *sd*-Zeile beschreibt eine Subdisk. Um eine Subdisk einzurichten,
   m?ssen Sie zumindest den Namen der Platte, auf der Sie die Subdisk
   anlegen wollen, sowie die Gr??e der Subdisk angeben. Analog zur
   Definition eines Plexus wird auch hier kein Name ben?tigt: Das System
   weist automatisch Namen zu, die aus dem Namen des Plexus und dem
   Suffix *.s**x* gebildet werden, wobei *x* die Nummer der Subdisk
   innerhalb des Plexus ist. Folglich gibt Vinum dieser Subdisk den
   Namen *myvol.p0.s0*.

.. raw:: html

   </div>

Nach dem Verarbeiten dieser Datei erzeugt
`gvinum(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gvinum&sektion=8>`__
die folgende Ausgabe:

.. code:: programlisting

          # gvinum -> create config1
          Configuration summary
          Drives:         1 (4 configured)
          Volumes:        1 (4 configured)
          Plexes:         1 (8 configured)
          Subdisks:       1 (16 configured)

        D a                     State: up       Device /dev/da3h        Avail: 2061/2573 MB (80%)

        V myvol                 State: up       Plexes:       1 Size:        512 MB

        P myvol.p0            C State: up       Subdisks:     1 Size:        512 MB

        S myvol.p0.s0           State: up       PO:        0  B Size:        512 MB

Diese Ausgabe entspricht dem verk?rzten Ausgabeformat von
`gvinum(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gvinum&sektion=8>`__
und wird in `Abbildung?23.4, „Ein einfaches
Vinum-Volume“ <vinum-examples.html#vinum-simple-vol>`__ grafisch
dargestellt.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 23.4. Ein einfaches Vinum-Volume

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Ein einfaches Vinum-Volume|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

| 

Dieses und die folgenden Beispiele zeigen jeweils ein Volume, welches
die Plexus enth?lt, die wiederum die Subdisk enthalten. In diesem
trivialen Beispiel enth?lt das Volume nur einen Plexus, der wiederum nur
aus einer Subdisk besteht.

Eine solche Konfiguration h?tte allerdings keinen Vorteil gegen?ber
einer konventionellen Plattenpartion. Das Volume enth?lt nur einen
einzigen Plexus, daher gibt es keine redundante Datenspeicherung. Da der
Plexus au?erdem nur eine einzige Subdisk enth?lt, unterscheidet sich
auch die Speicherzuweisung nicht von der einer konventionellen
Plattenpartition. Die folgenden Abschnitte beschreiben daher
verschiedene interessantere Konfigurationen.

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

23.6.2. Verbesserte Ausfallsicherheit durch Spiegelung
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Ausfallsicherheit eines Volumes kann durch Spiegelung der Daten
erh?ht werden. Beim Anlegen eines gespiegelten Volumes ist es wichtig,
die Subdisks jedes Plexus auf verschiedene Platten zu verteilen, damit
ein Plattenausfall nicht beide Plexus unbrauchbar macht. Die folgende
Konfiguration spiegelt ein Volume:

.. code:: programlisting

        drive b device /dev/da4h
        volume mirror
          plex org concat
            sd length 512m drive a
          plex org concat
            sd length 512m drive b

Bei diesem Beispiel war es nicht n?tig, noch einmal eine Platte *a* zu
spezifizieren, da Vinum die ?bersicht ?ber alle Objekte und seine
Konfigurationsdatenbank beh?lt. Nach dem Abarbeiten dieser Definition
sieht die Konfiguration wie folgt aus:

.. code:: programlisting

        Drives:         2 (4 configured)
        Volumes:        2 (4 configured)
        Plexes:         3 (8 configured)
        Subdisks:       3 (16 configured)

        D a                     State: up       Device /dev/da3h        Avail: 1549/2573 MB (60%)
        D b                     State: up       Device /dev/da4h        Avail: 2061/2573 MB (80%)

        V myvol                 State: up       Plexes:       1 Size:        512 MB
        V mirror                State: up       Plexes:       2 Size:        512 MB

        P myvol.p0            C State: up       Subdisks:     1 Size:        512 MB
        P mirror.p0           C State: up       Subdisks:     1 Size:        512 MB
        P mirror.p1           C State: initializing     Subdisks:     1 Size:        512 MB

        S myvol.p0.s0           State: up       PO:        0  B Size:        512 MB
        S mirror.p0.s0          State: up       PO:        0  B Size:        512 MB
        S mirror.p1.s0          State: empty    PO:        0  B Size:        512 MB

`Abbildung?23.5, „Ein gespiegeltes Vinum
Volume“ <vinum-examples.html#vinum-mirrored-vol>`__ stellt diese
Struktur grafisch dar.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 23.5. Ein gespiegeltes Vinum Volume

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Ein gespiegeltes Vinum Volume|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

| 

In diesem Beispiel enth?lt jeder Plexus die vollen 512?MB des
Adressraumes. Wie im vorangegangenen Beispiel enth?lt jeder Plexus nur
eine Subdisk.

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

23.6.3. Die Leistung optimieren
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das gespiegelte Volume des letzten Beispieles ist resistenter gegen?ber
Fehlern als ein ungespiegeltes Volume, seine Leistung ist hingegen
schlechter, da jeder Schreibzugriff auf das Volume einen Schreibzugriff
auf beide Platten erfordert und damit mehr der insgesamt verf?gbaren
Datentransferrate ben?tigt. Steht also die optimale Leistung im
Vordergrund, muss anders vorgegangen werden: Statt alle Daten zu
spiegeln, werden die Daten ?ber so viele Platten wie m?glich gestriped.
Die folgende Konfiguration zeigt ein Volume mit einem ?ber vier Platten
hinwegreichenden Plexus:

.. code:: programlisting

        drive c device /dev/da5h
        drive d device /dev/da6h
        volume stripe
        plex org striped 512k
          sd length 128m drive a
          sd length 128m drive b
          sd length 128m drive c
          sd length 128m drive d

Wie zuvor ist es nicht n?tig, die Platten zu definieren, die Vinum schon
bekannt sind. Nach dem Abarbeiten dieser Definition sieht die
Konfiguration wie folgt aus:

.. code:: programlisting

        Drives:         4 (4 configured)
        Volumes:        3 (4 configured)
        Plexes:         4 (8 configured)
        Subdisks:       7 (16 configured)

        D a                     State: up       Device /dev/da3h        Avail: 1421/2573 MB (55%)
        D b                     State: up       Device /dev/da4h        Avail: 1933/2573 MB (75%)
        D c                     State: up       Device /dev/da5h        Avail: 2445/2573 MB (95%)
        D d                     State: up       Device /dev/da6h        Avail: 2445/2573 MB (95%)

        V myvol                 State: up       Plexes:       1 Size:        512 MB
        V mirror                State: up       Plexes:       2 Size:        512 MB
        V striped               State: up       Plexes:       1 Size:        512 MB

        P myvol.p0            C State: up       Subdisks:     1 Size:        512 MB
        P mirror.p0           C State: up       Subdisks:     1 Size:        512 MB
        P mirror.p1           C State: initializing     Subdisks:     1 Size:        512 MB
        P striped.p1            State: up       Subdisks:     1 Size:        512 MB

        S myvol.p0.s0           State: up       PO:        0  B Size:        512 MB
        S mirror.p0.s0          State: up       PO:        0  B Size:        512 MB
        S mirror.p1.s0          State: empty    PO:        0  B Size:        512 MB
        S striped.p0.s0         State: up       PO:        0  B Size:        128 MB
        S striped.p0.s1         State: up       PO:      512 kB Size:        128 MB
        S striped.p0.s2         State: up       PO:     1024 kB Size:        128 MB
        S striped.p0.s3         State: up       PO:     1536 kB Size:        128 MB

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 23.6. Ein Striped Vinum Volume

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Ein Striped Vinum Volume|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

| 

Dieses Volume wird in `Abbildung?23.6, „Ein Striped Vinum
Volume“ <vinum-examples.html#vinum-striped-vol>`__ dargestellt. Die
Schattierung der Stripes zeigt die Position innerhalb des
Plexus-Adressraumes an. Die hellsten Stripes kommen zuerst, die
dunkelsten zuletzt.

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

23.6.4. Ausfallsicherheit und Leistung
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Mit entsprechender Hardware ist es m?glich, Volumes zu bauen, welche
gegen?ber Standard-UNIX?-Partitionen beides, n?mlich erh?hte
Ausfallsicherheit und erh?hte Leistung, aufweisen k?nnen. Eine typische
Konfigurationsdatei k?nnte etwa so aussehen:

.. code:: programlisting

        volume raid10
          plex org striped 512k
            sd length 102480k drive a
            sd length 102480k drive b
            sd length 102480k drive c
            sd length 102480k drive d
            sd length 102480k drive e
          plex org striped 512k
            sd length 102480k drive c
            sd length 102480k drive d
            sd length 102480k drive e
            sd length 102480k drive a
            sd length 102480k drive b

Die Subdisks des zweiten Plexus sind gegen?ber denen des ersten Plexus
um zwei Platten verschoben. Dadurch wird sichergestellt, dass
Schreibzugriffe nicht auf den gleichen Subdisks auftreten, auch wenn
eine ?bertragung ?ber zwei Platten geht.

`Abbildung?23.7, „Ein gespiegeltes, Striped Vinum
Volume“ <vinum-examples.html#vinum-raid10-vol>`__ veranschaulicht die
Struktur dieses Volumes.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 23.7. Ein gespiegeltes, Striped Vinum Volume

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Ein gespiegeltes, Striped Vinum Volume|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

| 

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------+------------------------------------+--------------------------------------------+
| `Zur?ck <vinum-objects.html>`__?   | `Nach oben <vinum-vinum.html>`__   | ?\ `Weiter <vinum-object-naming.html>`__   |
+------------------------------------+------------------------------------+--------------------------------------------+
| 23.5. Vinum-Objekte?               | `Zum Anfang <index.html>`__        | ?23.7. Objektbenennung                     |
+------------------------------------+------------------------------------+--------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.

.. |Ein einfaches Vinum-Volume| image:: vinum/vinum-simple-vol.png
.. |Ein gespiegeltes Vinum Volume| image:: vinum/vinum-mirrored-vol.png
.. |Ein Striped Vinum Volume| image:: vinum/vinum-striped-vol.png
.. |Ein gespiegeltes, Striped Vinum Volume| image:: vinum/vinum-raid10-vol.png
