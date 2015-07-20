==========================
11.6. Oracle? installieren
==========================

.. raw:: html

   <div class="navheader">

11.6. Oracle? installieren
`Zur?ck <linuxemu-matlab.html>`__?
Kapitel 11. Linux-Bin?rkompatibilit?t
?\ `Weiter <linuxemu-advanced.html>`__

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

11.6. Oracle? installieren
--------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Beigetragen von Marcel Moolenaar.

.. raw:: html

   </div>

.. raw:: html

   </div>

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

11.6.1. ?bersicht
~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dieses Dokument beschreibt die Installation von Oracle? 8.0.5 und
Oracle? 8.0.5.1 Enterprise Edition f?r Linux auf einem FreeBSD-Rechner.

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

11.6.2. Installation der Linux-Umgebung
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Stellen Sie sicher, dass Sie sowohl
`emulators/linux\_base <http://www.freebsd.org/cgi/url.cgi?ports/emulators/linux_base/pkg-descr>`__
und
`devel/linux\_devtools <http://www.freebsd.org/cgi/url.cgi?ports/devel/linux_devtools/pkg-descr>`__
aus der Ports-Sammlung installiert haben. Wenn Sie mit diesen Ports
Schwierigkeiten haben, m?ssen Sie vielleicht ?ltere Versionen der
Linux-Umgebung aus der Ports-Sammlung installieren.

Wenn Sie den Intelligent-Agent verwenden wollen, m?ssen Sie zus?tzlich
das RedHat Tcl-Paket installieren: ``tcl-8.0.3-20.i386.rpm``. Zur
Installation von RPM-Paketen wir der Port
`archivers/rpm <http://www.freebsd.org/cgi/url.cgi?ports/archivers/rpm/pkg-descr>`__
ben?tigt. Ist der Port installiert, lassen sich RPM-Pakete anschlie?end
mit dem nachstehenden Befehl installieren:

.. code:: screen

    # rpm -i --ignoreos --root /compat/linux --dbpath /var/lib/rpm package

Die Installation der RPM-Pakete sollte ohne Fehlermeldung ablaufen.

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

11.6.3. Die Oracle?-Umgebung erzeugen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Bevor Sie Oracle? installieren k?nnen, m?ssen Sie eine entsprechende
Umgebung erzeugen. Dieses Dokument beschreibt nur, was Sie *im
Speziellen* tun m?ssen, um die Linux-Version von Oracle? unter FreeBSD
zu installieren, nicht aber, was bereits in der Installationsanleitung
von Oracle? beschrieben wird.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

11.6.3.1. Kernel-Tuning
^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wie in der Installationsanleitung von Oracle? beschrieben, m?ssen Sie
die maximale Shared-Memory Gr??e festlegen. Verwenden Sie ``SHMMAX``
nicht unter FreeBSD. ``SHMMAX`` wird lediglich aus ``SHMMAXPGS`` und
``PGSIZE`` berechnet. Definieren Sie stattdessen ``SHMMAXPGS``. Alle
anderen Optionen k?nnen wie in der Anleitung beschrieben verwendet
werden. Zum Beispiel:

.. code:: programlisting

    options SHMMAXPGS=10000
    options SHMMNI=100
    options SHMSEG=10
    options SEMMNS=200
    options SEMMNI=70
    options SEMMSL=61

Passen Sie diese Optionen entsprechend dem von Ihnen gew?nschten
Einsatzzweck von Oracle? an.

Stellen Sie au?erdem sicher, dass Sie folgende Optionen in Ihren Kernel
kompilieren:

.. code:: programlisting

    options SYSVSHM #SysV shared memory
    options SYSVSEM #SysV semaphores
    options SYSVMSG #SysV interprocess communication

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

11.6.3.2. Oracle?-Benutzer anlegen
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Legen Sie den Account ``oracle`` an. Der Account unterschiedet sich von
normalen Accounts dadurch, dass er eine Linux-Shell zugeordnet bekommen
muss. F?gen Sie ``/compat/linux/bin/bash`` in die Datei ``/etc/shells``
ein und setzen Sie die Shell f?r den ``oracle``-Account auf
``/compat/linux/bin/bash``.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

11.6.3.3. Umgebung
^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Neben den normalen Oracle?-Variablen, wie z.B. ``ORACLE_HOME`` und
``ORACLE_SID`` m?ssen Sie die folgenden Variablen setzen:

.. raw:: html

   <div class="informaltable">

+-----------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------+
| Variable              | Wert                                                                                                                                                  |
+=======================+=======================================================================================================================================================+
| ``LD_LIBRARY_PATH``   | ``$ORACLE_HOME/lib``                                                                                                                                  |
+-----------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``CLASSPATH``         | ``$ORACLE_HOME/jdbc/lib/classes111.zip``                                                                                                              |
+-----------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``PATH``              | ``/compat/linux/bin /compat/linux/sbin /compat/linux/usr/bin /compat/linux/usr/sbin /bin /sbin /usr/bin /usr/sbin /usr/local/bin $ORACLE_HOME/bin``   |
+-----------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

Es ist empfehlenswert, alle Variablen in der Datei ``.profile`` zu
setzen. Ein komplettes Beispiel sieht folgenderma?en aus:

.. code:: programlisting

    ORACLE_BASE=/oracle; export ORACLE_BASE
    ORACLE_HOME=/oracle; export ORACLE_HOME
    LD_LIBRARY_PATH=$ORACLE_HOME/lib
    export LD_LIBRARY_PATH
    ORACLE_SID=ORCL; export ORACLE_SID
    ORACLE_TERM=386x; export ORACLE_TERM
    CLASSPATH=$ORACLE_HOME/jdbc/lib/classes111.zip
    export CLASSPATH
    PATH=/compat/linux/bin:/compat/linux/sbin:/compat/linux/usr/bin
    PATH=$PATH:/compat/linux/usr/sbin:/bin:/sbin:/usr/bin:/usr/sbin
    PATH=$PATH:/usr/local/bin:$ORACLE_HOME/bin
    export PATH

.. raw:: html

   </div>

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

11.6.4. Oracle? installieren
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Auf Grund einer kleinen Unregelm??igkeit im Linux-Emulator m?ssen Sie
das Verzeichnis ``.oracle`` unter ``/var/tmp`` erzeugen, bevor Sie das
Installationsprogramm starten. Das Verzeichnis muss dem Account
``oracle`` geh?ren. Sie sollten Oracle? nun ohne Probleme installieren
k?nnen. Treten dennoch Probleme auf, ?berpr?fen Sie zuerst Ihre
Oracle?-Distribution und Ihre Konfiguration. Nachdem Sie Oracle?
erfolgreich installiert haben, installieren Sie die Patches wie in den
zwei folgenden Abschnitten beschrieben:

Ein h?ufiges Problem ist, dass der TCP Protokoll-Adapter nicht korrekt
installiert wird. Daraus folgt, dass Sie keine TCP-Listener starten
k?nnen. Dieses Problem kann durch folgende Schritte behoben werden:

.. code:: screen

    # cd $ORACLE_HOME/network/lib
    # make -f ins_network.mk ntcontab.o
    # cd $ORACLE_HOME/lib
    # ar r libnetwork.a ntcontab.o
    # cd $ORACLE_HOME/network/lib
    # make -f ins_network.mk install

Vergessen Sie nicht, ``root.sh`` nochmals auszuf?hren!

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

11.6.4.1. root.sh patchen
^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

W?hrend der Oracle?-Installation werden einige Aktionen, die als
``root`` ausgef?hrt werden m?ssen, in ein Shell-Skript mit dem Namen
``root.sh`` gespeichert. Dieses Skript befindet sich im Verzeichnis
``orainst``. Verwenden Sie folgenden Patch f?r ``root.sh``, damit es das
richtige ``chown`` Kommando verwendet, oder lassen Sie das Skript
alternativ unter einer Linux-Shell ablaufen:

.. code:: programlisting

    *** orainst/root.sh.orig Tue Oct 6 21:57:33 1998
    --- orainst/root.sh Mon Dec 28 15:58:53 1998
    ***************
    *** 31,37 ****
    # This is the default value for CHOWN
    # It will redefined later in this script for those ports
    # which have it conditionally defined in ss_install.h
    ! CHOWN=/bin/chown
    #
    # Define variables to be used in this script
    --- 31,37 ----
    # This is the default value for CHOWN
    # It will redefined later in this script for those ports
    # which have it conditionally defined in ss_install.h
    ! CHOWN=/usr/sbin/chown
    #
    # Define variables to be used in this script

Wenn Sie Oracle? nicht von CD-ROM installieren, k?nnen Sie Quelldatei
f?r ``root.sh`` ver?ndern. Sie hei?t ``rthd.sh`` und befindet sich im
``orainst``-Verzeichnis des Quellcodebaums.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

11.6.4.2. genclntsh patchen
^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das Skript ``genclntsh`` wird verwendet, um eine Shared-Library f?r
Clients zu erzeugen. Diese wird bei der Erzeugung der Demos verwendet.
Verwenden Sie folgenden Patch, um die Definition von ``PATH``
auszukommentieren:

.. code:: programlisting

    *** bin/genclntsh.orig Wed Sep 30 07:37:19 1998
    --- bin/genclntsh Tue Dec 22 15:36:49 1998
    ***************
    *** 32,38 ****
    #
    # Explicit path to ensure that we're using the correct commands
    #PATH=/usr/bin:/usr/ccs/bin export PATH
    ! PATH=/usr/local/bin:/bin:/usr/bin:/usr/X11R6/bin export PATH
    #
    # each product MUST provide a $PRODUCT/admin/shrept.lst
    --- 32,38 ----
    #
    # Explicit path to ensure that we're using the correct commands
    #PATH=/usr/bin:/usr/ccs/bin export PATH
    ! #PATH=/usr/local/bin:/bin:/usr/bin:/usr/X11R6/bin export PATH
    #
    # each product MUST provide a $PRODUCT/admin/shrept.lst

.. raw:: html

   </div>

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

11.6.5. Oracle? starten
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn Sie den Anweisungen gefolgt sind, sollten Sie nun in der Lage sein,
Oracle? zu starten, genau so, wie Sie dies auch unter Linux tun w?rden.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+---------------------------------+------------------------------------------+
| `Zur?ck <linuxemu-matlab.html>`__?   | `Nach oben <linuxemu.html>`__   | ?\ `Weiter <linuxemu-advanced.html>`__   |
+--------------------------------------+---------------------------------+------------------------------------------+
| 11.5. MATLAB? installieren?          | `Zum Anfang <index.html>`__     | ?11.7. Weiterf?hrende Themen             |
+--------------------------------------+---------------------------------+------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
