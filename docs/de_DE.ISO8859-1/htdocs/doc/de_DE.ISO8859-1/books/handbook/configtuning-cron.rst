================================
12.6. Programme mit cron starten
================================

.. raw:: html

   <div class="navheader">

12.6. Programme mit ``cron`` starten
`Zur?ck <configtuning-starting-services.html>`__?
Kapitel 12. Konfiguration und Tuning
?\ `Weiter <configtuning-rcd.html>`__

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

12.6. Programme mit ``cron`` starten
------------------------------------

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

Ein sehr n?tzliches Werkzeug von FreeBSD ist
`cron(8) <http://www.FreeBSD.org/cgi/man.cgi?query=cron&sektion=8>`__.
``cron`` l?uft im Hintergrund und ?berpr?ft fortlaufend die Datei
``/etc/crontab``. Beim Start sucht ``cron`` neue ``crontab``-Dateien im
Verzeichnis ``/var/cron/tabs``. In den ``crontab``-Dateien wird
festgelegt, welche Programme zu welchem Zeitpunkt laufen sollen.

Das Werkzeug ``cron`` verwendet zwei verschiedene Konfigurationsdateien:
die System-\ ``crontab`` und die Benutzer-\ ``crontab``\ s. Der einzige
Unterschied zwischen beiden Formaten ist das sechste Feld. In der
System-\ ``crontab`` gibt das sechste Feld den Benutzer an, mit dem
``cron`` das Kommando ausf?hren wird. In einer Benutzer-\ ``crontab``
werden alle Kommandos unter dem Benutzer ausgef?hrt, welcher die
``crontab`` erstellt hat. Hier ist das sechste Feld das letzte Feld.
Dies ist ein wichtiges Sicherheitsmerkmal. Das letzte Feld bezeichnet
immer das Kommando, das ausgef?hrt werden soll.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Benutzer k?nnen mit Benutzer-\ ``crontabs`` ohne ``root``-Rechte Befehle
terminieren. Die Kommandos in Benutzer-\ ``crontabs`` laufen unter dem
Benutzer, der die ``crontab`` erstellt hat.

Der Benutzer ``root`` kann, wie jeder andere Benutzer, eine
Benutzer-\ ``crontab`` besitzen. Die Benutzer-\ ``crontab`` von ``root``
ist nicht mit ``/etc/crontab``, der System-\ ``crontab``, zu
verwechseln. Da die System-\ ``crontab`` die angegebenen Kommandos
effektiv als ``root``-Benutzer aufruft, besteht normalerweise keine
Notwendigkeit eine eigene Benutzer-\ ``crontab`` f?r ``root`` zu
erstellen.

.. raw:: html

   </div>

Der folgende Auszug aus der System-\ ``crontab`` ``/etc/crontab`` zeigt
den Aufbau einer ``crontab``-Datei:

.. code:: programlisting

    # /etc/crontab - root's crontab for FreeBSD
    #
    # $FreeBSD: src/etc/crontab,v 1.32 2002/11/22 16:13:39 tom Exp $
    # 
    #
    SHELL=/bin/sh
    PATH=/etc:/bin:/sbin:/usr/bin:/usr/sbin 
    HOME=/var/log
    #
    #
    #minute hour    mday    month   wday    who command 
    #
    #
    */5 *   *   *   *   root    /usr/libexec/atrun 

.. raw:: html

   <div class="calloutlist">

+--------------------------------------+--------------------------------------+
| `|1| <#co-comments>`__               | Das Zeichen ``#`` am Zeilenanfang    |
|                                      | leitet, wie in den meisten           |
|                                      | Konfigurationsdateien, einen         |
|                                      | Kommentar ein. Benutzen Sie          |
|                                      | Kommentare, um die Funktion eines    |
|                                      | Eintrags zu erl?utern. Kommentare    |
|                                      | m?ssen in einer extra Zeile stehen.  |
|                                      | Sie k?nnen nicht in derselben Zeile  |
|                                      | wie ein Kommando stehen, da sie      |
|                                      | sonst Teil des Kommandos w?ren.      |
|                                      | Leerzeilen in dieser Datei werden    |
|                                      | ignoriert.                           |
+--------------------------------------+--------------------------------------+
| `|2| <#co-env>`__                    | Umgebungsvariablen werden mit dem    |
|                                      | Gleichheits-Zeichen (``=``)          |
|                                      | festgelegt. Im Beispiel werden die   |
|                                      | Variablen ``SHELL``, ``PATH`` und    |
|                                      | ``HOME`` definiert. Wenn die         |
|                                      | Variable ``SHELL`` nicht definiert   |
|                                      | wird, benutzt ``cron`` die Shell     |
|                                      | ``sh``. Wird die Variable ``PATH``   |
|                                      | nicht gesetzt, m?ssen alle           |
|                                      | Pfadangaben absolut sein, da es      |
|                                      | keinen Vorgabewert f?r ``PATH``      |
|                                      | gibt. Der Vorgabewert f?r ``HOME``   |
|                                      | ist das Heimatverzeichnis des        |
|                                      | Accounts, dem die ``crontab``        |
|                                      | geh?rt.                              |
+--------------------------------------+--------------------------------------+
| `|3| <#co-field-descr>`__            | In dieser Zeile werden sieben Felder |
|                                      | beschrieben: ``minute``, ``hour``,   |
|                                      | ``mday``, ``month``, ``wday``,       |
|                                      | ``who`` und ``command``. Die ersten  |
|                                      | Felder legen den Zeitpunkt fest, an  |
|                                      | dem ein Kommando laufen soll. Das    |
|                                      | Feld ``minute`` legt die Minute      |
|                                      | fest, das Feld ``hour`` die Stunde,  |
|                                      | das Feld ``mday`` den Tag des        |
|                                      | Monats. Im Feld ``month`` wird der   |
|                                      | Monat und im Feld ``wday`` der       |
|                                      | Wochentag festgelegt. Alle Felder    |
|                                      | m?ssen numerische Werte enthalten    |
|                                      | und die Zeitangaben sind im          |
|                                      | 24-Stunden-Format. Das Feld ``who``  |
|                                      | gibt es nur in der Datei             |
|                                      | ``/etc/crontab`` und gibt den        |
|                                      | Account an, unter dem das Kommando   |
|                                      | laufen soll. Im letzten Feld wird    |
|                                      | schlie?lich das auszuf?hrende        |
|                                      | Kommando angegeben.                  |
+--------------------------------------+--------------------------------------+
| `|4| <#co-main>`__                   | Diese Zeile definiert die Zeitpunkte |
|                                      | an denen ``atrun`` laufen soll.      |
|                                      | Beachten Sie die Zeichenfolge        |
|                                      | ``*/5`` gefolgt von mehreren         |
|                                      | ``*``-Zeichen. Das Zeichen ``*`` ist |
|                                      | ein Platzhalter und steht f?r *jede* |
|                                      | m?gliche Zeit. Diese Zeile f?hrt     |
|                                      | ``atrun`` unter dem ``root``-Account |
|                                      | alle f?nf Minuten aus. Mehr ?ber     |
|                                      | ``atrun`` erfahren Sie in der        |
|                                      | Manualpage                           |
|                                      | `atrun(8) <http://www.FreeBSD.org/cg |
|                                      | i/man.cgi?query=atrun&sektion=8>`__. |
|                                      |                                      |
|                                      | Bei den Kommandos k?nnen beliebige   |
|                                      | Optionen angegeben werden. Wenn das  |
|                                      | Kommando zu lang ist und auf der     |
|                                      | n?chsten Zeile fortgesetzt werden    |
|                                      | soll, muss am Ende der Zeile das     |
|                                      | Fortsetzungszeichen (``\``)          |
|                                      | angegeben werden.                    |
+--------------------------------------+--------------------------------------+

.. raw:: html

   </div>

Bis auf das sechste Feld, das den Account angibt, sieht jede ``crontab``
so wie das Beispiel aus. Das sechste Feld existiert nur in der
Systemdatei ``crontab``. In den restlichen ``crontab``-Dateien fehlt
dieses Feld.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

12.6.1. ``crontab`` installieren
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="important" xmlns="">

Wichtig:
~~~~~~~~

Die nachstehende Prozedur gilt nur f?r Benutzer-\ ``crontabs``. Die
System-\ ``crontab`` k?nnen Sie einfach mit Ihrem Lieblingseditor
editieren. Das Werkzeug ``cron`` bemerkt, dass sich die Datei ge?ndert
hat und wird die neue Version benutzen. Lesen Sie bitte auch die FAQ zur
Meldung `root: not
found <../../../../doc/de_DE.ISO8859-1/books/faq/admin.html#ROOT-NOT-FOUND-CRON-ERRORS>`__.

.. raw:: html

   </div>

Eine Benutzer-\ ``crontab``, beispielsweise die Datei ``crontab``,
k?nnen Sie mit jedem Editor erstellen. Die Benutzer-\ ``crontab``
installieren Sie mit dem nachstehenden Befehl:

.. code:: screen

    # crontab crontab

Das Argument zum Befehl ``crontab`` ist die vorher erstellte Datei
``crontab``.

Der Befehl ``crontab -l`` zeigt die installierte ``crontab``-Datei an.

Benutzer, die eine eigene ``crontab``-Datei ohne Vorlage erstellen
wollen, k?nnen den Befehl ``crontab -e`` verwenden. Dieser Befehl ruft
einen Editor auf und installiert beim Verlassen des Editors die
``crontab``-Datei.

Wollen Sie die installierte Benutzer-\ ``crontab`` entfernen, rufen Sie
den Befehl ``crontab`` mit der Option ``-r`` auf.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------------------+--------------------------------------+------------------------------------------+
| `Zur?ck <configtuning-starting-services.html>`__?   | `Nach oben <config-tuning.html>`__   | ?\ `Weiter <configtuning-rcd.html>`__    |
+-----------------------------------------------------+--------------------------------------+------------------------------------------+
| 12.5. Start von Diensten?                           | `Zum Anfang <index.html>`__          | ?12.7. Das rc-System f?r Systemdienste   |
+-----------------------------------------------------+--------------------------------------+------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.

.. |1| image:: ./imagelib/callouts/1.png
.. |2| image:: ./imagelib/callouts/2.png
.. |3| image:: ./imagelib/callouts/3.png
.. |4| image:: ./imagelib/callouts/4.png
