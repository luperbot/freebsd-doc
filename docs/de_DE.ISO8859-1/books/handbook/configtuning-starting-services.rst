========================
12.5. Start von Diensten
========================

.. raw:: html

   <div class="navheader">

12.5. Start von Diensten
`Zur?ck <configtuning-appconfig.html>`__?
Kapitel 12. Konfiguration und Tuning
?\ `Weiter <configtuning-cron.html>`__

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

12.5. Start von Diensten
------------------------

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

Viele Benutzer installieren Software Dritter auf FreeBSD mithilfe der
Ports-Sammlung. H?ufig soll die Software bei einem Systemstart
mitgestartet werden. Beispielsweise sollen die Dienste
`mail/postfix <http://www.freebsd.org/cgi/url.cgi?ports/mail/postfix/pkg-descr>`__
oder
`www/apache22 <http://www.freebsd.org/cgi/url.cgi?ports/www/apache22/pkg-descr>`__
nach einem Systemstart laufen. Dieser Abschnitt stellt die
Startprozeduren f?r Software Dritter vor.

Unter FreeBSD werden die meisten der im System enthaltenen Dienste wie
`cron(8) <http://www.FreeBSD.org/cgi/man.cgi?query=cron&sektion=8>`__
mithilfe von Systemskripten gestartet. Diese Skripten sind abh?ngig von
der FreeBSD- oder Hersteller-Version. Allerdings kann ein Dienst mit
einfachen Skripten gestartet werden.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

12.5.1. Dienste ?ber das ``rc.d``-System starten
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Mit ``rc.d`` l?sst sich der Start von Anwendungen besser steuern als mit
den vorher besprochenen Startskripten. Mit den im Abschnitt
`rc.d <configtuning-rcd.html>`__ besprochenen Schl?sselw?rtern k?nnen
Anwendungen in einer bestimmten Reihenfolge (zum Beispiel nach DNS)
gestartet werden und Optionen k?nnen in ``rc.conf`` statt fest im
Startskript der Anwendung festgelegt werden. Ein einfaches Startskript
sieht wie folgt aus:

.. code:: programlisting

    #!/bin/sh
    #
    # PROVIDE: utility
    # REQUIRE: DAEMON
    # KEYWORD: shutdown

    . /etc/rc.subr

    name=utility
    rcvar=utility_enable

    command="/usr/local/sbin/utility"

    load_rc_config $name

    #
    # DO NOT CHANGE THESE DEFAULT VALUES HERE
    # SET THEM IN THE /etc/rc.conf FILE
    #
    utility_enable=${utility_enable-"NO"}
    pidfile=${utility_pidfile-"/var/run/utility.pid"}

    run_rc_command "$1"

Dieses Skript stellt sicher, dass utility nach den
``DAEMON``-Pseudodiensten gestartet wird. Es stellt auch eine Methode
bereit, die Prozess-ID (PID) der Anwendung in einer Datei zu speichern.

In ``/etc/rc.conf`` k?nnte f?r diese Anwendung die folgende Zeile
stehen:

.. code:: programlisting

    utility_enable="YES"

Die Methode erleichtert den Umgang mit Kommandozeilenargumenten, bindet
Funktionen aus ``/etc/rc.subr`` ein, ist kompatibel zum Werkzeug
`rcorder(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rcorder&sektion=8>`__
und l?sst sich ?ber ``rc.conf`` leichter konfigurieren.

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

12.5.2. Andere Arten, um Dienste zu starten
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dienste wie POP3 oder IMAP k?nnen ?ber
`inetd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=inetd&sektion=8>`__
gestartet werden. Nach der Installation der Anwendung aus der
Ports-Sammlung muss eine Konfigurationszeile in ``/etc/inetd.conf``
hinzugef?gt oder in der aktuellen Konfiguration durch Entfernen der
Kommentare aktiviert werden. Der Abschnitt `Abschnitt?31.2, „Der inetd
„Super-Server““ <network-inetd.html>`__ beschreibt den inetd und dessen
Konfiguration.

Systemdienste k?nnen auch mit
`cron(8) <http://www.FreeBSD.org/cgi/man.cgi?query=cron&sektion=8>`__
gestartet werden. Dieser Ansatz hat einige Vorteile; nicht zuletzt, weil
`cron(8) <http://www.FreeBSD.org/cgi/man.cgi?query=cron&sektion=8>`__
die Prozesse unter dem Eigent?mer der ``crontab`` startet, ist es
m?glich, dass Dienste von nicht-\ ``root`` Benutzern gestartet und
gepflegt werden k?nnen.

Dies nutzt eine Eigenschaft von
`cron(8) <http://www.FreeBSD.org/cgi/man.cgi?query=cron&sektion=8>`__:
F?r die Zeitangabe kann ``@reboot`` eingesetzt werden. Damit wird das
Kommando gestartet, wenn
`cron(8) <http://www.FreeBSD.org/cgi/man.cgi?query=cron&sektion=8>`__
kurz nach dem Systemboot gestartet wird.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------------+--------------------------------------+------------------------------------------+
| `Zur?ck <configtuning-appconfig.html>`__?   | `Nach oben <config-tuning.html>`__   | ?\ `Weiter <configtuning-cron.html>`__   |
+---------------------------------------------+--------------------------------------+------------------------------------------+
| 12.4. Konfiguration von Anwendungen?        | `Zum Anfang <index.html>`__          | ?12.6. Programme mit ``cron`` starten    |
+---------------------------------------------+--------------------------------------+------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
