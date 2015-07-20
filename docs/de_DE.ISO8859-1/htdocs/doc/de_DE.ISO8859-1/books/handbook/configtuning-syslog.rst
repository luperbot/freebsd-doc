========================================
12.10. Konfiguration des syslogd Servers
========================================

.. raw:: html

   <div class="navheader">

12.10. Konfiguration des syslogd Servers
`Zur?ck <configtuning-virtual-hosts.html>`__?
Kapitel 12. Konfiguration und Tuning
?\ `Weiter <configtuning-configfiles.html>`__

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

12.10. Konfiguration des syslogd Servers
----------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Beigetragen von Niclas Zeising.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das Aufzeichnen von Log-Meldungen ist ein wichtiger Aspekt der
Systemadministration. Es wird nicht nur verwendet um Hard- und
Softwarefehler ausfindig zu machen, auch zur ?berwachung der Sicherheit
und der Reaktion bei einem Zwischenfall spielen diese Aufzeichnungen
eine wichtige Rolle. Systemdienste ohne kontrollierendes Terminal senden
Meldungen in der Regel an einen Log-Server, oder schreiben sie in eine
Logdatei.

Dieser Abschnitt beschreibt die Konfiguration und Verwendung des FreeBSD
`syslogd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=syslogd&sektion=8>`__
Servers, und diskutiert auch die Log-Rotation und das Management von
Logdateien mit
`newsyslog(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newsyslog&sektion=8>`__.
Der Fokus wird hierbei auf die Einrichtung und Benutzung eines
``syslogd`` auf dem lokalen Rechner gelegt. F?r erweiterte Einstellungen
und die Verwendung eines separaten Log-Servers lesen Sie bitte
`Abschnitt?31.11, „Protokollierung von anderen Hosts mittels
``syslogd``\ “ <network-syslogd.html>`__.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

12.10.1. Verwendung von syslogd
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In der Standardkonfiguration von FreeBSD wird
`syslogd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=syslogd&sektion=8>`__
beim Booten automatisch gestartet. Dieses Verhalten wird ?ber die
Variable ``syslogd_enable`` in ``/etc/rc.conf`` gesteuert. Dazu gibt es
noch zahlreiche Argumente, die das Verhalten von
`syslogd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=syslogd&sektion=8>`__
beeinflussen. Benutzen Sie zum ver?ndern dieser Argumente
``syslogd_flags`` in ``/etc/rc.conf``. Lesen Sie
`syslogd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=syslogd&sektion=8>`__
f?r weitere Informationen ?ber die Argumente, und
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5>`__,
`Abschnitt?12.3,
„Basiskonfiguration“ <configtuning-core-configuration.html>`__ und
`Abschnitt?12.7, „Das rc-System f?r
Systemdienste“ <configtuning-rcd.html>`__ wenn Sie mehr ?ber
``/etc/rc.conf`` und das
`rc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc&sektion=8>`__-Subsystem
wissen m?chten.

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

12.10.2. Konfiguration von syslogd
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Konfigurationsdatei ``/etc/syslog.conf`` steuert, was
`syslogd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=syslogd&sektion=8>`__
mit Log-Meldungen macht, sobald sie empfangen werden. Es gibt
verschiedene Parameter, die das Verhalten bei eingehenden Ereignissen
kontrollieren. Zu den grundlegenden geh?ren *facility* und *level*.
*facility* beschreibt das Subsystem, welches das Ereignis generiert hat.
Beispielsweise der Kernel, oder ein Daemon. *level* hingegen beschreibt
den Schweregrad des aufgetretenen Ereignisses. Dies macht es m?glich,
Meldungen in verschiedenen Logdateien zu protokollieren, oder Meldungen
zu verwerfen, je nach Konfiguration von *facility* und *level*.
Ebenfalls besteht die M?glichkeit auf Meldungen zu reagieren, die von
einer bestimmten Anwendung stammen, oder von einem spezifischen Host
erzeugt wurden.

Die Konfiguration von
`syslogd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=syslogd&sektion=8>`__
ist recht einfach. In der Konfigurationsdatei wird pro Zeile eine Aktion
definiert und die Syntax besteht aus einem Auswahlfeld, gefolgt von
einem Aktionsfeld. Die Syntax f?r das Auswahlfeld ist
*``facility.level``*. Dies entspricht Log-Meldungen von *``facility``*
mit einem Level von *``level``* oder h?her. Um noch pr?ziser festzulegen
was protokolliert wird, kann dem Level optional ein Vergleichsflag
vorangestellt werden. Mehrere Auswahlen k?nnen, durch Semikolon (``;``)
getrennt, f?r die gleiche Aktion verwendet werden. ``*`` w?hlt dabei
alles aus. Das Aktionsfeld definiert, wohin die Log-Meldungen gesendet
werden, beispielsweise in eine Datei oder zu einem entfernten
Log-Server. Als Beispiel dient hier ``/etc/syslog.conf`` aus FreeBSD:

.. code:: programlisting

    # $FreeBSD$
    #
    #       Spaces ARE valid field separators in this file. However,
    #       other *nix-like systems still insist on using tabs as field
    #       separators. If you are sharing this file between systems, you$
    #       may want to use only tabs as field separators here.
    #       Consult the syslog.conf(5) manpage.
    *.err;kern.warning;auth.notice;mail.crit                /dev/console 
    *.notice;authpriv.none;kern.debug;lpr.info;mail.crit;news.err   /var/log/messages
    security.*                                      /var/log/security
    auth.info;authpriv.info                         /var/log/auth.log
    mail.info                                       /var/log/maillog 
    lpr.info                                        /var/log/lpd-errs
    ftp.info                                        /var/log/xferlog
    cron.*                                          /var/log/cron
    !-devd
    *.=debug                                        /var/log/debug.log 
    *.emerg                                         *
    # uncomment this to log all writes to /dev/console to /var/log/console.log
    #console.info                                   /var/log/console.log
    # uncomment this to enable logging of all log messages to /var/log/all.log
    # touch /var/log/all.log and chmod it to mode 600 before it will work
    #*.*                                            /var/log/all.log
    # uncomment this to enable logging to a remote loghost named loghost
    #*.*                                            @loghost
    # uncomment these if you're running inn
    # news.crit                                     /var/log/news/news.crit
    # news.err                                      /var/log/news/news.err
    # news.notice                                   /var/log/news/news.notice
    # Uncomment this if you wish to see messages produced by devd
    # !devd
    # *.>=info
    !ppp 
    *.*                                             /var/log/ppp.log
    !*

.. raw:: html

   <div class="calloutlist">

+--------------------------------------+--------------------------------------+
| `|1| <#co-syslog-many-match>`__      | Selektiert alle Meldungen vom Level  |
|                                      | ``err``, sowie ``kern.warning``,     |
|                                      | ``auth.notice`` und ``mail.crit``    |
|                                      | und schickt diese zur Konsole        |
|                                      | (``/dev/console``).                  |
+--------------------------------------+--------------------------------------+
| `|2| <#co-syslog-one-match>`__       | Selektiert alle Meldungen von        |
|                                      | ``mail`` ab dem Level ``info`` oder  |
|                                      | h?her und schreibt diese in          |
|                                      | ``/var/log/maillog``.                |
+--------------------------------------+--------------------------------------+
| `|3| <#co-syslog-comparison>`__      | Diese Zeile benutzt das              |
|                                      | Vergleichsflag ``=``, um nur         |
|                                      | Meldungen vom Level ``debug`` zu     |
|                                      | selektieren und schreibt diese in    |
|                                      | ``/var/log/debug.log``.              |
+--------------------------------------+--------------------------------------+
| `|4| <#co-syslog-prog-spec>`__       | Hier ist ein Beispiel f?r die        |
|                                      | Nutzung einer                        |
|                                      | *Programmspezifikation*. Die         |
|                                      | nachfolgenden Regeln sind dann nur   |
|                                      | f?r Programme g?ltig, welche der     |
|                                      | Programmspezifikation stehen. In     |
|                                      | diesem Fall landen alle Meldungen    |
|                                      | von ``ppp`` (und keinem anderen      |
|                                      | Programm) in ``/var/log/ppp.log``.   |
+--------------------------------------+--------------------------------------+

.. raw:: html

   </div>

Dieses Beispiel zeigt, dass es jede Menge Level und Subsysteme gibt. Die
Level, beginnend mit den h?chst kritischen, hin zu den weniger
kritischen, sind: ``emerg``, ``alert``, ``crit``, ``err``, ``warning``,
``notice``, ``info`` und ``debug``.

Die *facilities*, in beliebiger Reihenfolge, sind: ``auth``,
``authpriv``, ``console``, ``cron``, ``daemon``, ``ftp``, ``kern``,
``lpr``, ``mail``, ``mark``, ``news``, ``security``, ``syslog``,
``user``, ``uucp``, sowie ``local0`` bis ``local7``. Beachten Sie, dass
andere Betriebssysteme hiervon abweichende *facilities* haben k?nnen.

Mit diesem Wissen ist es nun einfach, eine weitere Zeile in
``/etc/syslog.conf`` hinzuzuf?gen, welche alle Meldungen von den
unterschiedlichsten D?monen mit einem Level von ``notice`` und h?her in
``/var/log/daemon.log``. F?gen Sie einfach folgendes hinzu:

.. code:: programlisting

    daemon.notice                                        /var/log/daemon.log

F?r weitere Informationen zu verschiedenen Level und *faclilities*,
lesen Sie
`syslog(3) <http://www.FreeBSD.org/cgi/man.cgi?query=syslog&sektion=3>`__
und
`syslogd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=syslogd&sektion=8>`__.
Weitere Informationen zu ``syslog.conf``, dessen Syntax und erweiterten
Anwendungsbeispielen, finden Sie in
`syslog.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=syslog.conf&sektion=5>`__
und `Abschnitt?31.11, „Protokollierung von anderen Hosts mittels
``syslogd``\ “ <network-syslogd.html>`__.

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

12.10.3. Log-Management und Rotation mit newsyslog
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In der Regel wachsen Log-Dateien schnell und ihre Anzahl steigt
kontinuierlich. Dies f?hrt dazu, dass sich sehr viele Dateien mit
Informationen anh?ufen die Sie nicht umgehend ben?tigen, au?erdem
verbraucht die Speicherung von Log-Dateien nat?rlich auch
Festplattenplatz. Um diesen Effekt zu mildern, kommt das Log-Management
ins Spiel. FreeBSD verwendet
`newsyslog(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newsyslog&sektion=8>`__,
f?r die Verwaltung von Log-Dateien. Dieses Programm wird verwendet, um
in regelm??igen Abst?nden Dateien zu rotieren und zu komprimieren, sowie
gegebenenfalls fehlende Log-Dateien zu erstellen und Programme zu
benachrichtigen, wenn Log-Dateien verschoben wurden. Dabei m?ssen die
Log-Dateien nicht unbedingt von syslog stammen,
`newsyslog(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newsyslog&sektion=8>`__
ist auch in der Lage, Nachrichten von anderen Programmen zu verarbeiten.
Es sei noch angemerkt, dass
`newsyslog(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newsyslog&sektion=8>`__
normalerweise von
`cron(8) <http://www.FreeBSD.org/cgi/man.cgi?query=cron&sektion=8>`__
aufgerufen wird und kein Systemd?mon ist. In der Standardkonfiguration
wird dieser Job jede Stunde ausgef?hrt.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

12.10.3.1. Konfiguration von newsyslog
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Um zu wissen, welche Ma?nahmen zu ergreifen sind, liest
`newsyslog(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newsyslog&sektion=8>`__
seine Konfigurationsdatei, standardm??ig ``/etc/newsyslog.conf``. Diese
Konfigurationsdatei enth?lt eine Zeile f?r jede Datei, die von
`newsyslog(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newsyslog&sektion=8>`__
verwaltet wird. Jede Zeile enth?lt Informationen ?ber den Besitzer der
Datei, die Dateiberechtigungen und wann die Datei rotiert wird. Zudem
noch optionale *Flags*, welche die Log-Rotation beeinflussen (bspw.
Komprimierung) und Programme, denen ein Signal geschickt wird, wenn
Log-Dateien rotiert werden. Als Beispiel folgt hier die
Standardkonfiguration in FreeBSD:

.. code:: programlisting

    # configuration file for newsyslog
    # $FreeBSD$
    #
    # Entries which do not specify the '/pid_file' field will cause the
    # syslogd process to be signalled when that log file is rotated.  This
    # action is only appropriate for log files which are written to by the
    # syslogd process (ie, files listed in /etc/syslog.conf).  If there
    # is no process which needs to be signalled when a given log file is
    # rotated, then the entry for that file should include the 'N' flag.
    #
    # The 'flags' field is one or more of the letters: BCDGJNUXZ or a '-'.
    #
    # Note: some sites will want to select more restrictive protections than the
    # defaults.  In particular, it may be desirable to switch many of the 644
    # entries to 640 or 600.  For example, some sites will consider the
    # contents of maillog, messages, and lpd-errs to be confidential.  In the
    # future, these defaults may change to more conservative ones.
    #
    # logfilename          [owner:group]    mode count size when  flags [/pid_file] [sig_num]
    /var/log/all.log                        600  7     *    @T00  J
    /var/log/amd.log                        644  7     100  *     J
    /var/log/auth.log                       600  7     100  @0101T JC
    /var/log/console.log                    600  5     100  *     J
    /var/log/cron                           600  3     100  *     JC
    /var/log/daily.log                      640  7     *    @T00  JN
    /var/log/debug.log                      600  7     100  *     JC
    /var/log/kerberos.log                   600  7     100  *     J
    /var/log/lpd-errs                       644  7     100  *     JC
    /var/log/maillog                        640  7     *    @T00  JC
    /var/log/messages                       644  5     100  @0101T JC
    /var/log/monthly.log                    640  12    *    $M1D0 JN
    /var/log/pflog                          600  3     100  *     JB    /var/run/pflogd.pid
    /var/log/ppp.log        root:network    640  3     100  *     JC
    /var/log/devd.log                       644  3     100  *     JC
    /var/log/security                       600  10    100  *     JC
    /var/log/sendmail.st                    640  10    *    168   B
    /var/log/utx.log                        644  3     *    @01T05 B
    /var/log/weekly.log                     640  5     1    $W6D0 JN
    /var/log/xferlog                        600  7     100  *     JC

Jede Zeile beginnt mit dem Namen der Datei, die rotiert werden soll,
optional gefolgt von Besitzer und Gruppe f?r rotierende, als auch f?r
neu erstellte Dateien. Das n?chste Feld, ``mode``, definiert die
Zugriffsrechte der Datei. ``count`` gibt an, wie viele rotierte Dateien
aufbewahrt werden sollen. Anhand der ``size``- und ``when``-*Flags*
erkennt ``newsyslog``, wann die Datei rotiert werden muss. Eine
Log-Datei wird rotiert, wenn ihre Gr??e den Wert von ``size``
?berschreitet, oder wenn die Zeit im ``when``-Feld abgelaufen ist. Ein
``*`` bedeutet, dass dieses Feld ignoriert wird. Das *``flags``*-Feld
gibt
`newsyslog(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newsyslog&sektion=8>`__
weitere Instruktionen, zum Beispiel wie eine Datei zu rotieren ist, oder
eine Datei zu erstellen falls diese nicht existiert. Die letzten beiden
Felder sind optional und bestimmen die PID-Datei sowie eine
Signalnummer, die zu diesem Prozess geschickt wird, wenn die Datei
rotiert wird. Weitere Informationen zu allen Feldern, g?ltigen *flags*
und wie Sie die Rotationszeit angeben k?nnen, finden Sie in
`syslog.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=syslog.conf&sektion=5>`__.
Denken Sie daran, dass ``newsyslog`` von ``cron`` aufgerufen wird und
somit Dateien auch nur dann rotiert, wenn es von
`cron(8) <http://www.FreeBSD.org/cgi/man.cgi?query=cron&sektion=8>`__
aufgerufen wird, und nicht h?ufiger.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------------------+--------------------------------------+-------------------------------------------------+
| `Zur?ck <configtuning-virtual-hosts.html>`__?   | `Nach oben <config-tuning.html>`__   | ?\ `Weiter <configtuning-configfiles.html>`__   |
+-------------------------------------------------+--------------------------------------+-------------------------------------------------+
| 12.9. Virtual Hosts?                            | `Zum Anfang <index.html>`__          | ?12.11. Konfigurationsdateien                   |
+-------------------------------------------------+--------------------------------------+-------------------------------------------------+

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
