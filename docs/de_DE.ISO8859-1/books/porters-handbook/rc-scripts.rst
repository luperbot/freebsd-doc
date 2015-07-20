=====================================================
6.23. Starten und Anhalten von Diensten (rc Skripten)
=====================================================

.. raw:: html

   <div class="navheader">

6.23. Starten und Anhalten von Diensten (rc Skripten)
`Zur?ck <using-databases.html>`__?
Kapitel 6. Besonderheiten
?\ `Weiter <users-and-groups.html>`__

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

6.23. Starten und Anhalten von Diensten (rc Skripten)
-----------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``rc.d``-Skripten werden zum Starten von Diensten w?hrend des
Systemstarts verwendet und um den Administratoren einen Standardweg zum
Anhalten und Starten von Diensten zu bieten. Ports halten sich an dieses
systemweite ``rc.d``-Framework. Details zu deren Benutzung k?nnen im
`rc.d Kapitel des
Handbuchs <../../../../doc/de_DE.ISO8859-1/books/handbook/configtuning-rcd.html>`__
nachgelesen werden. Ausf?hrliche Beschreibungen der verf?gbaren Befehle
stehen in
`rc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc&sektion=8>`__ und
`rc.subr(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.subr&sektion=8>`__.
Desweiteren gibt es `einen
Artikel <../../../../doc/en_US.ISO8859-1/articles/rc-scripting>`__ zu
praktischen Aspekten bez?glich ``rc.d``-Skripten.

Ein oder mehrere ``rc.d``-Skripten k?nnen installiert werden mittels:

.. code:: programlisting

    USE_RC_SUBR=    doormand

Skripten m?ssen im Unterverzeichnis ``files`` abgelegt und jeder
Skript-Datei muss ein ``.in``-Suffix hinzugef?gt werden. Standardm??ige
``SUB_LIST``-Ersetzungen werden f?r diese Dateien unterst?tzt. Die
Verwendung von ``%%PREFIX%%`` und ``%%LOCALBASE%%`` wird dringend
empfohlen. N?heres zu ``SUB_LIST`` kann im `zugeh?rigen
Kapitel <using-sub-files.html>`__ nachgelesen werden.

F?r FreeBSD-Versionen, die ?lter als 6.1-RELEASE sind, ist die
Integration mittels
`rcorder(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rcorder&sektion=8>`__
m?glich, indem ``USE_RCORDER`` anstatt ``USE_RC_SUBR`` verwendet wird.
Die Verwendung dieser Methode ist jedoch nur notwendig, wenn der Port in
die Verzeichnisstruktur des Basissystems installiert werden kann oder
der Dienst vor den ``FILESYSTEMS``-Skripten in ``rc.d`` des Basissystems
gestartet sein muss.

Seit FreeBSD?6.1-RELEASE sind lokale ``rc.d``-Skripten (inklusive der
durch Ports installierten) im allgemeinen
`rcorder(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rcorder&sektion=8>`__
des Basissystems.

Beispiel eines einfachen ``rc.d``-Skripts:

.. code:: programlisting

    #!/bin/sh

    # $FreeBSD$
    #
    # PROVIDE: doormand
    # REQUIRE: LOGIN
    # KEYWORD: shutdown
    #
    # Add the following lines to /etc/rc.conf.local or /etc/rc.conf
    # to enable this service:
    #
    # doormand_enable (bool):    Set to NO by default.
    #                Set it to YES to enable doormand.
    # doormand_config (path):    Set to %%PREFIX%%/etc/doormand/doormand.cf
    #                by default.
    #

    . /etc/rc.subr

    name="doormand"
    rcvar=${name}_enable

    command=%%PREFIX%%/sbin/${name}
    pidfile=/var/run/${name}.pid

    load_rc_config $name

    : ${doormand_enable="NO"}
    : ${doormand_config="%%PREFIX%%/etc/doormand/doormand.cf"}

    command_args="-p $pidfile -f $doormand_config"

    run_rc_command "$1"

Solange kein guter Grund daf?r besteht, einen Dienst fr?her starten zu
lassen, sollten alle Ports-Skripten

.. code:: programlisting

    REQUIRE: LOGIN

verwenden. Falls der Port von einem bestimmten Benutzer (au?er root)
ausgef?hrt wird, ist dies zwingend.

.. code:: programlisting

    KEYWORD: shutdown

ist im Skript oben deswegen vorhanden, weil der frei erfundene
Beispiel-Port einen Dienst startet und dieser beim Herunterfahren des
Systems sauber beendet werden sollte. Startete das Skript keinen
persistenten Dienst, w?re dies nicht notwendig.

F?r die Wertzuweisung von Variablen sollte "=" anstatt ":=" verwendet
werden, da bei Ersterem nur auf einen Standardwert gesetzt wird, wenn
die Variable vorher noch nicht gesetzt war, und bei Letzterem dieser
gesetzt wird, auch wenn der Wert vorher Null gewesen ist. Ein Benutzer
kann durchaus einen Ausdruck wie

.. code:: programlisting

    doormand_flags=""

in seiner ``rc.conf.local``-Datei stehen haben, und eine
Variablenzuweisung mittels ":=" w?rde in diesem Fall die
Benutzerdefinition ?berschreiben.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Es sollten keine weiteren Skripten mit der ``.sh``-Endung hinzugef?gt
werden. Irgendwann wird es ein Massenumbenennen aller Skripten im
Repository geben, die immer noch diese Endung haben.

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

6.23.1. Anhalten und Deinstallieren von Diensten
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Es ist m?glich, dass ein Dienst w?hrend der Deinstallation automatisch
angehalten wird. Es wird empfohlen dieses Verhalten nur zu
implementieren, wenn es unbedingt erforderlich ist zuerst den Dienst
anzuhalten und dann die Dateien zu entfernen. Normalerweise sollte es
dem Administrator ?berlassen werden, ob ein Dienst durch Deinstallieren
angehalten werden soll. Dies betrifft auch den Vorgang des
Aktualisierens.

Der Datei ``pkg-plist`` sollte eine Zeile wie folgt zugef?gt werden:

.. code:: programlisting

    @stopdaemon doormand

Das Argument muss dabei mit dem Inhalt der ``USE_RC_SUBR``-Variablen
?bereinstimmen.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+--------------------------------+-----------------------------------------------+
| `Zur?ck <using-databases.html>`__?   | `Nach oben <special.html>`__   | ?\ `Weiter <users-and-groups.html>`__         |
+--------------------------------------+--------------------------------+-----------------------------------------------+
| 6.22. Benutzung von Datenbanken?     | `Zum Anfang <index.html>`__    | ?6.24. Hinzuf?gen von Benutzern und Gruppen   |
+--------------------------------------+--------------------------------+-----------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
