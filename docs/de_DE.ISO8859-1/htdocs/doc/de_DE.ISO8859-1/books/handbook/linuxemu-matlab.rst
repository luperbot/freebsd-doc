==========================
11.5. MATLAB? installieren
==========================

.. raw:: html

   <div class="navheader">

11.5. MATLAB? installieren
`Zur?ck <linuxemu-maple.html>`__?
Kapitel 11. Linux-Bin?rkompatibilit?t
?\ `Weiter <linuxemu-oracle.html>`__

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

11.5. MATLAB? installieren
--------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Beigesteuert von Dan Pelleg.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Im Folgenden wird die Installation der Linux-Anwendung MATLAB?
Version?6.5 auf FreeBSD beschrieben. Mit Ausnahme der Java Virtual
Machine™ (siehe `Abschnitt?11.5.3, „Einrichten der
Java™-Laufzeitumgebung“ <linuxemu-matlab.html#matlab-jre>`__) l?uft die
Anwendung auch ganz gut.

Die Linux-Version von MATLAB? k?nnen Sie direkt bei `The
MathWorks <http://www.mathworks.com>`__ bestellen. Vergewissern Sie
sich, dass Sie die Lizenz-Datei oder eine Anleitung zum Erstellen der
Lizenz-Datei erhalten haben. Wenn Sie mit MathWorks in Kontakt stehen,
weisen Sie bitte auf die fehlende FreeBSD-Version der Software hin.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

11.5.1. Das MATLAB?-Installationsskript
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Um MATLAB? zu installieren, gehen Sie wie folgt vor:

.. raw:: html

   <div class="procedure">

#. H?ngen Sie die Installations-CD ein und wechseln Sie zu ``root``, wie
   im Installations-Skript gefordert. Starten Sie die Installation mit
   dem folgenden Kommando:

   .. code:: screen

       # /compat/linux/bin/sh /cdrom/install

   .. raw:: html

      <div class="tip" xmlns="">

   Tipp:
   ~~~~~

   Die Installation erfordert eine graphische Benutzeroberfl?che. Wenn
   Sie die Fehlermeldung erhalten, dass das Display nicht ge?ffnet
   werden konnte, f?hren Sie das folgende Kommando aus:

   .. code:: screen

       # setenv HOME ~USER

   F?r *``USER``* setzen Sie den Benutzer ein, von dem aus Sie ``root``
   geworden sind.

   .. raw:: html

      </div>

#. Beantworten Sie die Frage nach dem MATLAB?-Root-Verzeichnis mit:
   **``/compat/linux/usr/local/matlab``**.

   .. raw:: html

      <div class="tip" xmlns="">

   Tipp:
   ~~~~~

   Den langen Pfad werden Sie noch ?fter brauchen. Die Tipparbeit k?nnen
   Sie sich mit dem folgenden Befehl erleichtern:

   .. code:: screen

       # set MATLAB=/compat/linux/usr/local/matlab

   .. raw:: html

      </div>

#. Editieren Sie die Lizenz-Datei entsprechend der Anweisung, die Sie
   beim Erwerb der Lizenz erhalten haben.

   .. raw:: html

      <div class="tip" xmlns="">

   Tipp:
   ~~~~~

   Sie k?nnen die Datei schon vorher mit Ihrem Lieblingseditor
   bearbeiten. Kopieren Sie die Lizenz-Datei nach
   ``$MATLAB/license.dat`` bevor das Installationsprogramm Sie
   auffordert, die Datei zu editieren.

   .. raw:: html

      </div>

#. Schlie?en Sie die Installation ab.

.. raw:: html

   </div>

Die MATLAB?-Installation ist jetzt abgeschlossen. Die folgenden Schritte
passen MATLAB? an FreeBSD an.

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

11.5.2. Den Lizenzmanager starten
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="procedure">

#. Erstellen Sie symbolische Links zu den Startskripten des
   Lizenzmanagers:

   .. code:: screen

       # ln -s $MATLAB/etc/lmboot /usr/local/etc/lmboot_TMW
       # ln -s $MATLAB/etc/lmdown /usr/local/etc/lmdown_TMW

#. Erstellen Sie das Startskript ``/usr/local/etc/rc.d/flexlm``. Das
   folgende Beispiel ist eine ge?nderte Version des mitgelieferten
   Skripts ``$MATLAB/etc/rc.lm.glnx86``. Angepasst wurden die Pfade zu
   den Dateien und der Start des Lizenzmanagers unter der
   Linux-Emulation.

   .. code:: programlisting

       #!/bin/sh
       case "$1" in
         start)
               if [ -f /usr/local/etc/lmboot_TMW ]; then
                     /compat/linux/bin/sh /usr/local/etc/lmboot_TMW -u username && echo 'MATLAB_lmgrd'
               fi
               ;;
         stop)
           if [ -f /usr/local/etc/lmdown_TMW ]; then
                   /compat/linux/bin/sh /usr/local/etc/lmdown_TMW  > /dev/null 2>&1
           fi
               ;;
         *)
           echo "Usage: $0 {start|stop}"
           exit 1
           ;;
       esac

       exit 0

   .. raw:: html

      <div class="important" xmlns="">

   Wichtig:
   ~~~~~~~~

   Machen Sie Datei ausf?hrbar:

   .. code:: screen

       # chmod +x /usr/local/etc/rc.d/flexlm

   Ersetzen Sie im Skript *``username``* durch einen existierenden
   Benutzer Ihres Systems (bitte keinesfalls ``root``).

   .. raw:: html

      </div>

#. Starten Sie den Lizenzmanager:

   .. code:: screen

       # service flexlm start

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

11.5.3. Einrichten der Java™-Laufzeitumgebung
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Erstellen Sie einen symbolischen Link auf eine unter FreeBSD laufende
Java™-Laufzeitumgebung (JRE):

.. code:: screen

    # cd $MATLAB/sys/java/jre/glnx86/
    # unlink jre; ln -s ./jre1.1.8 ./jre

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

11.5.4. Ein MATLAB?-Startskript erstellen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="procedure">

#. Kopieren Sie das folgende Skript nach ``/usr/local/bin/matlab``:

   .. code:: programlisting

       #!/bin/sh
       /compat/linux/bin/sh /compat/linux/usr/local/matlab/bin/matlab "$@"

#. Machen Sie das Skript ausf?hrbar:

   .. code:: screen

       # chmod +x /usr/local/bin/matlab

.. raw:: html

   </div>

.. raw:: html

   <div class="tip" xmlns="">

Tipp:
~~~~~

Abh?ngig von der Version des Ports
`emulators/linux\_base <http://www.freebsd.org/cgi/url.cgi?ports/emulators/linux_base/pkg-descr>`__
kann das Skript auf Fehler laufen. Die Fehler k?nnen Sie vermeiden,
indem Sie die Datei ``/compat/linux/usr/local/matlab/bin/matlab``
editieren. ?ndern Sie die nachstehende Zeile

.. code:: programlisting

    if [ `expr "$lscmd" : '.*->.*'` -ne 0 ]; then

(mit Version?13.0.1 in der Zeile?410) in die folgende um:

.. code:: programlisting

    if test -L $newbase; then

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

11.5.5. Stopp-Skript f?r MATLAB? erstellen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das nachstehende Skript beendet MATLAB? ordnungsgem??.

.. raw:: html

   <div class="procedure">

#. Erstellen Sie die Datei ``$MATLAB/toolbox/local/finish.m`` mit dem
   nachstehenden Inhalt:

   .. code:: programlisting

       ! $MATLAB/bin/finish.sh

   .. raw:: html

      <div class="note" xmlns="">

   Anmerkung:
   ~~~~~~~~~~

   ?bernehmen Sie die Zeichenkette ``$MATLAB`` unver?ndert.

   .. raw:: html

      </div>

   .. raw:: html

      <div class="tip" xmlns="">

   Tipp:
   ~~~~~

   Im selben Verzeichnis befinden sich die Dateien ``finishsav.m`` und
   ``finishdlg.m``. Die Dateien sichern die Einstellungen der
   Arbeitsfl?che bevor MATLAB? beendet wird. Wenn Sie eine der beiden
   Dateien benutzen, f?gen Sie die obige Zeile unmittelbar nach dem
   ``save``-Kommando ein.

   .. raw:: html

      </div>

#. Erstellen Sie die Datei ``$MATLAB/bin/finish.sh`` mit nachstehendem
   Inhalt:

   .. code:: programlisting

       #!/compat/linux/bin/sh
       (sleep 5; killall -1 matlab_helper) &
       exit 0

#. Machen Sie die Datei ausf?hrbar:

   .. code:: screen

       # chmod +x $MATLAB/bin/finish.sh

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

11.5.6. MATLAB? benutzen
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Jetzt k?nnen Sie MATLAB? mit dem ``matlab`` starten.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------+---------------------------------+----------------------------------------+
| `Zur?ck <linuxemu-maple.html>`__?   | `Nach oben <linuxemu.html>`__   | ?\ `Weiter <linuxemu-oracle.html>`__   |
+-------------------------------------+---------------------------------+----------------------------------------+
| 11.4. Maple™ installieren?          | `Zum Anfang <index.html>`__     | ?11.6. Oracle? installieren            |
+-------------------------------------+---------------------------------+----------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
