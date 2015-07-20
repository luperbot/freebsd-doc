=====================================
12.7. Das rc-System f?r Systemdienste
=====================================

.. raw:: html

   <div class="navheader">

12.7. Das rc-System f?r Systemdienste
`Zur?ck <configtuning-cron.html>`__?
Kapitel 12. Konfiguration und Tuning
?\ `Weiter <config-network-setup.html>`__

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

12.7. Das rc-System f?r Systemdienste
-------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Beigetragen von Tom Rhodes.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

2002 wurde das rc.d-System von NetBSD zum Start von Systemdiensten in
FreeBSD integriert. Die zu diesem System geh?renden Dateien sind im
Verzeichnis ``/etc/rc.d`` abgelegt. Die Skripten in diesem Verzeichnis
akzeptieren die Optionen ``start``, ``stop`` und ``restart``.
Beispielsweise kann
`sshd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sshd&sektion=8>`__
mit dem nachstehenden Kommando neu gestartet werden:

.. code:: screen

    # /etc/rc.d/sshd restart

Analog k?nnen Sie andere Dienste starten und stoppen. Normalerweise
werden die Dienste beim Systemstart ?ber Eintr?ge in der Datei
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5>`__
automatisch gestartet. Der Network Address Translation D?mon wird zum
Beispiel mit dem folgenden Eintrag in ``/etc/rc.conf`` aktiviert:

.. code:: programlisting

    natd_enable="YES"

Wenn dort bereits die Zeile ``natd_enable="NO"`` existiert, ?ndern Sie
einfach ``NO`` in ``YES``. Die rc-Skripten starten, wie unten
beschrieben, auch abh?ngige Dienste.

Da das rcNG-System prim?r zum automatischen Starten und Stoppen von
Systemdiensten dient, funktionieren die Optionen ``start``, ``stop`` und
``restart`` nur, wenn die entsprechenden Variablen in ``/etc/rc.conf``
gesetzt sind. Beispielsweise funktioniert das Kommando ``sshd restart``
nur dann, wenn in ``/etc/rc.conf`` die Variable ``sshd_enable`` auf
``YES`` gesetzt wurde. Wenn Sie die Optionen ``start``, ``stop`` oder
``restart`` unabh?ngig von den Einstellungen in ``/etc/rc.conf``
benutzen wollen, m?ssen Sie den Optionen mit dem Pr?fix „one“ verwenden.
Um beispielsweise ``sshd`` unabh?ngig von den Einstellungen in
``/etc/rc.conf`` neu zu starten, benutzen Sie das nachstehende Kommando:

.. code:: screen

    # /etc/rc.d/sshd onerestart

Ob ein Dienst in ``/etc/rc.conf`` aktiviert ist, k?nnen Sie leicht
herausfinden, indem Sie das entsprechende ``rc.d``-Skript mit der Option
``rcvar`` aufrufen. Ein Administrator kann beispielsweise wie folgt
pr?fen, ob der ``sshd``-Dienst in ``/etc/rc.conf`` aktiviert ist:

.. code:: screen

    # /etc/rc.d/sshd rcvar
    # sshd
    $sshd_enable=YES

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Die zweite Zeile (``# sshd``) wird von ``sshd`` ausgegeben; sie
kennzeichnet nicht die Eingabeaufforderung von ``root``.

.. raw:: html

   </div>

Ob ein Dienst l?uft, kann mit der Option ``status`` abgefragt werden.
Das folgende Kommando ?berpr?ft, ob der ``sshd`` auch wirklich gestartet
wurde:

.. code:: screen

    # /etc/rc.d/sshd status
    sshd is running as pid 433.

Einige Dienste k?nnen ?ber die Option ``reload`` neu initialisiert
werden. Dazu wird dem Dienst ?ber ein Signal mitgeteilt, dass er seine
Konfigurationsdateien neu einlesen soll. Oft wird dazu das Signal
``SIGHUP`` verwendet. Beachten Sie aber, dass nicht alle Dienste diese
Option unterst?tzen.

Die meisten Systemdienste werden beim Systemstart vom rc.d-System
gestartet. Zum Beispiel aktiviert das Skript ``bgfsck`` die Pr?fung von
Dateisystemen im Hintergrund. Das Skript gibt die folgende Meldung aus,
wenn es gestartet wird:

.. code:: screen

    Starting background file system checks in 60 seconds.

Viele Systemdienste h?ngen von anderen Diensten ab. NIS und andere
RPC-basierende Systeme h?ngen beispielsweise von dem ``rpcbind``-Dienst
(portmapper) ab. Im Kopf der Startskripten befinden sich die
Informationen ?ber Abh?ngigkeiten von anderen Diensten und weitere
Metadaten.Mithilfe dieser Daten bestimmt das Programm
`rcorder(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rcorder&sektion=8>`__
beim Systemstart die Startreihenfolge der Dienste.

Folgende Schl?sselw?rter m?ssen im Kopf aller Startskripten verwendet
werden (da sie von
`rc.subr(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.subr&sektion=8>`__
zum „Aktivieren“ des Startskripts ben?tigt werden:

.. raw:: html

   <div class="itemizedlist">

-  ``PROVIDE``: Gibt die Namen der Dienste an, die mit dieser Datei zur
   Verf?gung gestellt werden.

.. raw:: html

   </div>

Die folgenden Schl?sselw?rter k?nnen im Kopf des Startskripts angegeben
werden. Sie sind zwar nicht unbedingt notwendig, sind aber hilfreich
beim Umgang mit
`rcorder(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rcorder&sektion=8>`__:

.. raw:: html

   <div class="itemizedlist">

-  ``REQUIRE``: Gibt die Namen der Dienste an, von denen dieser Dienst
   abh?ngt. Diese Datei wird *nach* den angegebenen Diensten ausgef?hrt.

-  ``BEFORE``: Z?hlt Dienste auf, die auf diesen Dienst angewiesen sind.
   Diese Datei wird *vor* den angegebenen Diensten ausgef?hrt.

.. raw:: html

   </div>

Durch das Verwenden dieser Schl?sselw?rter kann ein Administrator die
Startreihenfolge von Systemdiensten feingranuliert steuern, ohne mit den
Schwierigkeiten des „runlevel“-Systems anderer UNIX? Systeme k?mpfen zu
m?ssen.

Weitere Informationen ?ber das ``rc.d``-System finden sich in den
Manualpages zu
`rc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc&sektion=8>`__ sowie
`rc.subr(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.subr&sektion=8>`__.
Wenn Sie Ihre eigenen ``rc.d``-Skripte schreiben wollen, sollten Sie den
Artikel `Practical rc.d scripting in
BSD <../../../../doc/en_US.ISO8859-1/articles/rc-scripting>`__ lesen.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------+--------------------------------------+---------------------------------------------+
| `Zur?ck <configtuning-cron.html>`__?    | `Nach oben <config-tuning.html>`__   | ?\ `Weiter <config-network-setup.html>`__   |
+-----------------------------------------+--------------------------------------+---------------------------------------------+
| 12.6. Programme mit ``cron`` starten?   | `Zum Anfang <index.html>`__          | ?12.8. Einrichten von Netzwerkkarten        |
+-----------------------------------------+--------------------------------------+---------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
