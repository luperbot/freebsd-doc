===========
8.6. MythTV
===========

.. raw:: html

   <div class="navheader">

8.6. MythTV
`Zur?ck <tvcard.html>`__?
Kapitel 8. Multimedia
?\ `Weiter <scanners.html>`__

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

8.6. MythTV
-----------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

MythTV ist ein Open Source PVR-Softwareprojekt.

Es ist in der Linux?-Welt als komplexe Anwendung mit vielen
Abh?ngigkeiten bekannt und deshalb schwierig zu installieren. Das
FreeBSD Portssystem vereinfacht diesen Prozess sehr stark, jedoch m?ssen
manche Komponenten manuell eingerichtet werden. Dieser Abschnitt soll
dazu dienen, bei der Einrichtung von MythTV zu helfen.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

8.6.1. Hardware
~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

MythTV wurde entwickelt, um V4L zu verwenden, so dass auf
Videoeingabeger?te wie Kodierer und Empf?nger zugegriffen werden kann.
Aktuell funktioniert MythTV am besten mit USB DVB-S/C/T Karten, die von
`multimedia/webcamd <http://www.freebsd.org/cgi/url.cgi?ports/multimedia/webcamd/pkg-descr>`__
unterst?tzt werden, weil webcamd eine V4L-Anwendung zur Verf?gung
stellt, die als Benutzerprogramm l?ft. Jede DVB-Karte, welche von
webcamd unterst?tzt wird, sollte mit MythTV funktionieren, jedoch gibt
es eine Liste von Karten, die
`hier <http://wiki.freebsd.org/WebcamCompat>`__ abgerufen werden kann.
Es existieren auch Treiber f?r Hauppauge-Karten in den folgenden
Paketen:
`multimedia/pvr250 <http://www.freebsd.org/cgi/url.cgi?ports/multimedia/pvr250/pkg-descr>`__
und
`multimedia/pvrxxx <http://www.freebsd.org/cgi/url.cgi?ports/multimedia/pvrxxx/pkg-descr>`__,
allerdings liefern diese nur eine Treiberschnittstelle, die nicht dem
Standard entspricht und die nicht mit MythTV-Versionen gr?sser als 0.23
funktionieren.

`HTPC <http://wiki.freebsd.org/HTPC>`__ enth?lt eine Liste von allen
verf?gbaren DVB-Treibern.

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

8.6.2. Abh?ngigkeiten
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Da MythTV flexibel und modular aufgebaut ist, ist der Benutzer in der
Lage, das Frontend und Backend auf unterschiedlichen Rechnern laufen zu
lassen.

F?r das Frontend wird
`multimedia/mythtv-frontend <http://www.freebsd.org/cgi/url.cgi?ports/multimedia/mythtv-frontend/pkg-descr>`__,
sowie ein X-Server ben?tigt, welcher in
`x11/xorg <http://www.freebsd.org/cgi/url.cgi?ports/x11/xorg/pkg-descr>`__
zu finden ist. Idealerweise besitzt der Frontend-Computer auch eine
Videokarte, die XvMC unterst?tzt, sowie optional eine LIRC-kompatible
Fernbedienung.

F?r das Backend wird
`multimedia/mythtv <http://www.freebsd.org/cgi/url.cgi?ports/multimedia/mythtv/pkg-descr>`__
ben?tigt, ebenso wie eine MySQL™-Datenbank, sowie zus?tzlich einen
Empf?nger und Speicherplatz f?r Aufzeichnungen. Das MySQL™-Paket sollte
automatisch als Abh?ngigkeit mitinstalliert werden, wenn
`multimedia/mythtv <http://www.freebsd.org/cgi/url.cgi?ports/multimedia/mythtv/pkg-descr>`__
gebaut wird.

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

8.6.3. MythTV einrichten
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Um MythTV zu installieren, befolgen Sie die hier aufgef?hrten Schritte.
Zuerst installieren Sie MythTV aus der Ports-Sammlung:

.. code:: screen

    # cd /usr/ports/multimedia/mythtv
    # make install

Richten Sie anschliessend die MythTV-Datenbank ein:

.. code:: screen

    # mysql -uroot -p < /usr/local/share/mythtv/database/mc.sql

Konfigurieren Sie dann das Backend:

.. code:: screen

    # mythtv-setup

Zum Schluss starten Sie das Backend:

.. code:: screen

    # echo 'mythbackend_enable="YES"' >> /etc/rc.conf
    # service mythbackend start

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------+-----------------------------------+---------------------------------+
| `Zur?ck <tvcard.html>`__?    | `Nach oben <multimedia.html>`__   | ?\ `Weiter <scanners.html>`__   |
+------------------------------+-----------------------------------+---------------------------------+
| 8.5. TV-Karten einrichten?   | `Zum Anfang <index.html>`__       | ?8.7. Scanner                   |
+------------------------------+-----------------------------------+---------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
