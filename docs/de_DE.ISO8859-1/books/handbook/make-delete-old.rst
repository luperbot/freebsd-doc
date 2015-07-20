===============================================================
26.8. Veraltete Dateien, Verzeichnisse und Bibliotheken l?schen
===============================================================

.. raw:: html

   <div class="navheader">

26.8. Veraltete Dateien, Verzeichnisse und Bibliotheken l?schen
`Zur?ck <makeworld.html>`__?
Kapitel 26. FreeBSD aktualisieren
?\ `Weiter <small-lan.html>`__

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

26.8. Veraltete Dateien, Verzeichnisse und Bibliotheken l?schen
---------------------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Basiert auf Notizen von Anton Shterenlikht.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Aufgrund der st?ndigen Weiterentwicklung von FreeBSD kann es dazu
kommen, dass Dateien (und deren Inhalte) obsolet werden, weil deren
Funktionalit?t entweder in anderen Dateien implementiert wurde, sich die
Versionsnummer der Bibliothek ge?ndert hat oder deren Funktion nicht
mehr ben?tigt wird. Dies kann sowohl Dateien und Verzeichnis, aber auch
Bibliotheken betreffen. Diese veralteten Dateien sollten daher entfernt
werden, bevor Sie Ihr System aktualisieren. Der Vorteil f?r den Benutzer
ist darin zu sehen, dass dessen System (sowie dessen Backup) von nicht
mehr ben?tigten Dateien gereinigt wird. Falls die obsolete Bibliothek
Sicherheits- oder Stabilit?tsprobleme aufweist, sollte das System
ebenfalls aktualisiert werden, um Ihr System sicher zu halten und/oder
durch die fehlerhafte Bibliothek verursachte Systemabst?rze zu
vermeiden. Veraltete Dateien, Verzeichnisse und Bibliotheken sind in der
Datei ``/usr/src/ObsoleteFiles.inc`` aufgelistet. Die folgenden
Anweisungen sollen Ihnen dabei helfen, diese Dateien w?hrend der
Systemaktualisierung zu entfernen.

Im Folgenden wird angenommen, dass Sie den Anweisungen von
`Abschnitt?26.7.1, „Richtig
aktualisieren“ <makeworld.html#canonical-build>`__ folgen. Nachdem Sie
``make installworld`` sowie ``mergemaster`` erfolgreich ausgef?hrt
haben, sollten Sie Ihr System auf veraltete Dateien und Bibliotheken hin
?berpr?fen:

.. code:: screen

    # cd /usr/src
    # make check-old

Werden dabei veraltete Dateien gefunden, k?nnen diese im n?chsten
Schritt entfernt werden:

.. code:: screen

    # make delete-old

.. raw:: html

   <div class="tip" xmlns="">

Tipp:
~~~~~

Weitere interessante Targets finden sich in der Datei
``/usr/src/Makefile``.

.. raw:: html

   </div>

Bei jeder Datei wird nachgefragt, ob Sie diese wirklich l?schen wollen.
Es ist aber auch m?glich, alle Dateien automatisch l?schen zu lassen.
Dies erreichen Sie, indem Sie die Umgebungsvariable
``BATCH_DELETE_OLD_FILES`` entsprechend setzen:

.. code:: screen

    # make -DBATCH_DELETE_OLD_FILES delete-old

Alternativ k?nnen Sie auch den folgenden Befehl einsetzen (und jeweils
die Antwort ``yes`` an die einzelnen Abfragen weiterreichen):

.. code:: screen

    # yes | make delete-old

.. raw:: html

   <div class="warning" xmlns="">

Warnung:
~~~~~~~~

Das L?schen veralteter Dateien kann dazu f?hren, dass Programme, die auf
diese Dateien angewiesen sind, nicht mehr funktionieren. Dies gilt
insbesondere f?r veraltete Bibliotheken. In den meisten F?llen ist es
dann notwendig, Programme, Ports und Bibliotheken, welche die veraltete
Bibliothek verwenden, neu zu bauen, bevor Sie den Befehl
``make       delete-old-libs`` ausf?hren.

.. raw:: html

   </div>

Die Ports-Sammlung enth?lt Werkzeuge, die Ihnen beim Pr?fen von
Bibliothek-Abh?ngigkeiten helfen k?nnen:
`sysutils/libchk <http://www.freebsd.org/cgi/url.cgi?ports/sysutils/libchk/pkg-descr>`__
sowie
`sysutils/bsdadminscripts <http://www.freebsd.org/cgi/url.cgi?ports/sysutils/bsdadminscripts/pkg-descr>`__.

Veraltete Bibliotheken k?nnen zu Konflikten mit neueren Bibliotheken
f?hren und beispielsweise folgende Meldungen verursachen:

.. code:: screen

    /usr/bin/ld: warning: libz.so.4, needed by /usr/local/lib/libtiff.so, may conflict with libz.so.5
    /usr/bin/ld: warning: librpcsvc.so.4, needed by /usr/local/lib/libXext.so, may conflict with librpcsvc.so.5

Um diese Probleme zu l?sen, m?ssen Sie zuerst herausfinden, welcher Port
die Bibliothek installiert hat:

.. code:: screen

    # pkg_info -W  /usr/local/lib/libtiff.so
    /usr/local/lib/libtiff.so was installed by package tiff-3.9.4
    # pkg_info -W /usr/local/lib/libXext.so
    /usr/local/lib/libXext.so was installed by package libXext-1.1.1,1

Danach deinstallieren Sie den Port und bauen ihn neu, um ihn danach
erneut zu installieren. Dieser Vorgang kann durch den Einsatz der
Werkzeuge
`ports-mgmt/portmaster <http://www.freebsd.org/cgi/url.cgi?ports/ports-mgmt/portmaster/pkg-descr>`__
oder
`ports-mgmt/portupgrade <http://www.freebsd.org/cgi/url.cgi?ports/ports-mgmt/portupgrade/pkg-descr>`__
automatisiert werden. Nachdem Sie alle Ports erfolgreich neu gebaut
haben (und Sie daher keine veralteten Bibliotheken mehr verwenden)
k?nnen Sie die veralteten Bibliotheken endg?ltig entfernen:

.. code:: screen

    # make delete-old-libs

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------------+-------------------------------------------+------------------------------------------+
| `Zur?ck <makeworld.html>`__?                 | `Nach oben <updating-upgrading.html>`__   | ?\ `Weiter <small-lan.html>`__           |
+----------------------------------------------+-------------------------------------------+------------------------------------------+
| 26.7. Das komplette Basissystem neu bauen?   | `Zum Anfang <index.html>`__               | ?26.9. Installation mehrerer Maschinen   |
+----------------------------------------------+-------------------------------------------+------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
