========
7. Tipps
========

.. raw:: html

   <div class="navheader">

7. Tipps
`Zur?ck <patch.html>`__?
?
?

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

7. Tipps
--------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="itemizedlist">

-  Wenn Sie ein selbst erstelltes Release ?ber die native
   ``make release``
   `Prozedur <../../../../doc/de_DE.ISO8859-1/articles/releng/release-build.html>`__
   bauen, wir der freebsd-update-server Code Ihr Release unterst?tzen.
   Als Beispiel k?nnen Sie ein Release ohne Ports oder Dokumentation
   bauen, indem Sie betreffende Funktionalit?t der Subroutinen
   `` findextradocs         ()``, ``addextradocs ()`` entfernen und eine
   Ver?nderung des Download-Verzeichnisses in ``fetchiso ()``, in
   ``scripts/build.subr``. Als letzten Schritt ?ndern Sie den
   `sha256(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sha256&sektion=1>`__
   Hash in ``build.conf`` f?r Ihr jeweiliges Release und Architektur
   damit Sie bereit sind, Ihr benutzerdefiniertes Release zu bauen.

   .. code:: screen

       # Compare ${WORKDIR}/release and ${WORKDIR}/$1, identify which parts
           # of the world|doc subcomponent are missing from the latter, and
           # build a tarball out of them.
           findextradocs () {
           }

           # Add extra docs to ${WORKDIR}/$1
           addextradocs () {
           }
           

-  Durch das Hinzuf?gen von ``-j         NUMMER`` zu den ``buildworld``
   und ``obj`` Zielen in ``scripts/build.subr`` kann die Verarbeitung,
   abh?ngig von der eingesetzten Hardware, beschleunigt werden. Die
   Benutzung dieser Optionen auf andere Ziele wird jedoch nicht
   empfohlen, da sie den Bau unzuverl?ssig machen k?nnen.

   .. code:: screen

                      # Build the world
                  log "Building world"
                  cd /usr/src &&
                  make -j 2 ${COMPATFLAGS} buildworld 2>&1

               # Distribute the world
                  log "Distributing world"
                  cd /usr/src/release &&
                  make -j 2 obj &&
                  make ${COMPATFLAGS} release.1 release.2 2>&1

-  Erstellen Sie einen geeigneten
   `DNS <../../../../doc/de_DE.ISO8859-1/books/handbook/network-dns.html>`__
   SRV Datensatz f?r den Update-Server, und f?gen Sie weitere Server mit
   verschiedenen Gewichtungen hinzu. Sie k?nnen diese M?glichkeit nutzen
   um Update-Mirror hinzuzuf?gen. Dieser Tipp ist jedoch nicht notwendig
   solange Sie keinen redundanten Service anbieten m?chten.

   .. code:: screen

        _http._tcp.update.myserver.com.                  IN SRV   0 2 80   host1.myserver.com.
                                        SRV   0 1 80   host2.myserver.com.
                                        SRV   0 0 80   host3.myserver.com.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+-------------------------------+-----+
| `Zur?ck <patch.html>`__?             | ?                             | ?   |
+--------------------------------------+-------------------------------+-----+
| 6. Eine Fehlerkorrektur erstellen?   | `Zum Anfang <index.html>`__   | ?   |
+--------------------------------------+-------------------------------+-----+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
