======================================================
5. Systemstrategien f?r kleine und Nur-Lese-Umgebungen
======================================================

.. raw:: html

   <div class="navheader">

5. Systemstrategien f?r kleine und Nur-Lese-Umgebungen
`Zur?ck <ar01s04.html>`__?
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

5. Systemstrategien f?r kleine und Nur-Lese-Umgebungen
------------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In `Abschnitt?3, „Die ``rc``-Subsysteme und nur-Lese
Dateisysteme“ <ro-fs.html>`__ wurde darauf hingewiesen, dass das
``/var``-Dateisystem von ``/etc/rc.d/var`` konstruiert wurde und die
Pr?senz eines Nur-Lese-Wurzeldateisystems Probleme mit vielen in FreeBSD
gebr?chlichen Softwarepaketen verursacht. In diesem Artikel werden
Vorschl?ge f?r das erfolgreiche Betreiben von cron, syslog,
Installationen von Ports und dem Apache-Webserver unterbreitet.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.1. cron
~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

W?hrend des Bootvorgangs wird ``/var`` von ``/etc/rc.d/var`` anhand der
Liste aus ``/etc/mtree/BSD.var.dist`` gef?llt, damit ``cron``,
``cron/tabs``, ``at`` und ein paar weitere Standardverzeichnisse
erstellt werden.

Jedoch l?st das noch nicht das Problem, Crontabs ?ber Neustarts des
Systems hinaus zu erhalten. Wenn das System neu gestartet wird,
verschwindet das ``/var``-Dateiystem, welches sich im Hauptspeicher
befunden hat und jegliche Crontabs, die Sie hatten werden ebenfalls
verschwinden. Aus diesem Grund besteht eine L?sung darin, Crontabs f?r
diejenigen Benutzer zu erstellen, die diese auch ben?tigen. Dazu sollte
das ``/``-Dateisystem lesend und schreibend eingeh?ngt und diese
Crontabs an einen sicheren Ort kopiert werden, wie beispielsweise
``/etc/tabs``. F?gen Sie dann eine Zeile an das Ende der Datei
``/etc/rc.initdiskless`` hinzu, die diese Crontabs in ``/var/cron/tabs``
kopiert, nachdem dieses Verzeichnis w?hrend der Systeminitialisierung
erstellt wurde. Sie werden auch eine Zeile hinzuf?gen m?ssen, welche die
Besitzer und Berechtigungen auf diesen Verzeichnissen, die Sie erstellen
und den dazugeh?rigen Dateien, die Sie mittels ``/etc/rc.initdiskless``
kopieren, setzen.

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

5.2. syslog
~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Datei ``syslog.conf`` spezifiziert den Ort von bestimmten
Logdateien, welche in ``/var/log`` existieren. Diese Dateien werden
nicht von ``/etc/rc.d/var`` w?hrend der Systeminitialisierung erstellt.
Aus diesem Grund m?ssen Sie irgendwo in ``/etc/rc.d/var`` nach dem
Abschnitt, der die Verzeichnisse in ``/var`` erstellt, eine Zeile
?hnlich der folgenden hinzuf?gen:

.. code:: screen

    # touch /var/log/security /var/log/maillog /var/log/cron /var/log/messages
    # chmod 0644 /var/log/*

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

5.3. Installation von Ports
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Bevor die notwendigen ?nderungen erk?rt werden, einen Ports-Baum zu
verwenden, ist es notwendig, Sie an die Nur-Lese-Besonderheit Ihres
Dateisystems auf dem Flash-Medium zu erinnern. Da dieses nur lesend
verf?gbar ist, m?ssen Sie es vor?bergehend mit Schreibrechten
ausstatten, indem Sie die mount-Syntax, wie in `Abschnitt?3, „Die
``rc``-Subsysteme und nur-Lese Dateisysteme“ <ro-fs.html>`__ dargestellt
wird, verwenden. Sie sollten immer diese Dateisysteme erneut mit
nur-Lese-Rechten einh?ngen wenn Sie damit fertig sind - unn?tige
Schreibvorg?nge auf dem Flash-Medium kann dessen Lebenszeit erheblich
verk?rzen.

Um es zu erm?glichen, in das Ports-Verzeichnis zu wechseln und
erfolgreich ``make`` ``install`` auszuf?hren, m?ssen wir ein
Paketverzeichnis auf einem Nicht-Hauptspeicherdateisystem erstellen,
welches die Pakete ?ber Neustarts hinweg im Auge beh?lt. Weil es sowieso
n?tig ist, Ihre Dateisysteme mit Lese-Schreibrechten f?r die
Installation eines Pakets einzuh?ngen, ist es sinnvoll anzunehmen, dass
ein Bereich Ihres Flash-Mediums ebenfalls f?r Paketinformationen, die
darauf abgespeichert werden, verwendet wird.

Erstellen Sie zuerst ein Verzeichnis f?r die Paketdatenbank.
Normalerweise ist dies ``/var/db/pkg``, jedoch k?nnen wir es dort nicht
unterbringen, da es jedesmal verschwinden wird, wenn das System neu
gestartet wird.

.. code:: screen

    # mkdir /etc/pkg

F?gen Sie nun eine Zeile in ``/etc/rc.d/var`` hinzu, welche das
``/etc/pkg``-Verzeichnis mit ``/var/db/pkg`` verkn?pft. Ein Beispiel:

.. code:: screen

    # ln -s /etc/pkg /var/db/pkg

Nun wird jedes Mal, wenn Sie Ihre Dateisysteme mit Lese-Schreibrechten
einbinden und ein Paket installieren, der Befehl ``make`` ``install``
funktionieren und Paketinformationen werden erfolgreich nach
``/etc/pkg`` geschrieben (da zu diesem Zeitpunkt das Dateisystem mit
Lese-Schreibrechten eingebunden ist), welche dann stets dem
Betriebssystem als ``/var/db/pkg`` zur Verf?gung stehen.

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

5.4. Apache Webserver
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Die Anweisungen in diesem Abschnitt sind nur notwendig, wenn Apache so
eingerichtet ist, dass dieser seine PID oder
Protokollierungsinformationen ausserhalb von ``/var`` ablegt.
Standardm?ssig bewahrt Apache seine PID-Datei in ``/var/run/httpd.pid``
und seine Protokolldateien in ``/var/log`` auf.

.. raw:: html

   </div>

Es wird nun davon ausgegangen, dass Apache seine Protokolldateien in
einem Verzeichnis namens ``apache_log_dir`` ausserhalb von ``/var``
speichert. Wenn dieses Verzeichnis auf einem nur-Lese-Dateisystem
existiert, wird Apache nicht in der Lage sein, Protokolldateien zu
speichern und wird vermutlich nicht richtig funktionieren. Wenn dies der
Fall ist, muss ein neues Verzeichnis zu der Liste der Verzeichnisse in
``/etc/rc.d/var`` hinzugef?gt werden, um dieses in ``/var`` zu erstellen
und um ``apache_log_dir`` nach ``/var/log/apache`` zu verkn?pfen. Es ist
auch n?tig, Berechtigungen und Besitzer auf diesem neuen Verzeichnis zu
setzen.

F?gen Sie zuerst das Verzeichnis ``log/apache`` zu der Liste von
Verzeichnissen hinzu, die in ``/etc/rc.d/var`` angelegt werden sollen.

Danach tragen Sie die folgenden Befehle in ``/etc/rc.d/var`` nach dem
Abschnitt zum Erstellen der Verzeichnisse ein:

.. code:: screen

    # chmod 0774 /var/log/apache
    # chown nobody:nobody /var/log/apache

Schliesslich l?schen Sie das bestehende ``apache_log_dir`` Verzeichnis
und ersetzen es mit einer Verkn?pfung:

.. code:: screen

    # rm -rf apache_log_dir
    # ln -s /var/log/apache apache_log_dir

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------------------+-------------------------------+-----+
| `Zur?ck <ar01s04.html>`__?                        | ?                             | ?   |
+---------------------------------------------------+-------------------------------+-----+
| 4. Ein Dateisystem von Grund auf neu erstellen?   | `Zum Anfang <index.html>`__   | ?   |
+---------------------------------------------------+-------------------------------+-----+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
