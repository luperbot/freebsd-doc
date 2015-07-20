================================================
6.2. Installieren der Webseiten auf Ihrem Server
================================================

.. raw:: html

   <div class="navheader">

6.2. Installieren der Webseiten auf Ihrem Server
`Zur?ck <the-website.html>`__?
Kapitel 6. Die Webseite
?\ `Weiter <the-website-env.html>`__

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

6.2. Installieren der Webseiten auf Ihrem Server
------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

F?hren Sie ``make install`` aus und setzen Sie die Variable ``DESTDIR``
auf das Verzeichnis, in das Sie die Webseiten installieren wollen. Die
daraus resultierenden Dateien werden unter ``$DESTDIR/data``
installiert, was als die document root ihres Webservers konfiguriert
sein sollte.

Die Installation der Webseiten wird als ``root`` ausgef?hrt, weil die
Berechtigungen des Webserver-Verzeichnisses den Schreibzugriff f?r
normale Benutzer verhindern. Im folgenden Beispiel wurden die Webseiten
durch den Benutzer ``jru`` in dessen Heimatverzeichnis, also unter
``/usr/home/jru/doc`` gebaut.

.. code:: screen

    # cd /home/jru/doc/en_US.ISO8859-1/htdocs
    # env DESTDIR=/usr/local/www make install

Veraltete (und nicht mehr verwendete) Dateien werden w?hrend der
Installation nicht automatisch entfernt. Der folgende Befehl findet (und
l?scht) alle Dateien im Installationsverzeichnis, die in den letzten
drei Tagen nicht aktualisiert wurden:

.. code:: screen

    # find /usr/local/www -ctime 3 -delete

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------+------------------------------------+----------------------------------------+
| `Zur?ck <the-website.html>`__?   | `Nach oben <the-website.html>`__   | ?\ `Weiter <the-website-env.html>`__   |
+----------------------------------+------------------------------------+----------------------------------------+
| Kapitel 6. Die Webseite?         | `Zum Anfang <index.html>`__        | ?6.3. Umgebungsvariablen               |
+----------------------------------+------------------------------------+----------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
