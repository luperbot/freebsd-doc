==========================================
16.4. Einrichtung und Verwaltung von Jails
==========================================

.. raw:: html

   <div class="navheader">

16.4. Einrichtung und Verwaltung von Jails
`Zur?ck <jails-intro.html>`__?
Kapitel 16. Jails
?\ `Weiter <jails-tuning.html>`__

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

16.4. Einrichtung und Verwaltung von Jails
------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Einige Administratoren unterscheiden zwei verschiedene Jail-Arten:
„Komplette“ Jails, die ein echtes FreeBSD darstellen und Jails f?r einen
bestimmten „Dienst“, die nur einer bestimmten Anwendung oder einem
Dienst (der m?glicherweise mit besonderen Privilegien laufen soll)
gewidmet sind. Dies ist aber nur eine konzeptuelle Unterscheidung, die
Einrichtung einer Jail bleibt davon g?nzlich unber?hrt.

.. code:: screen

    # setenv D /hier/ist/die/jail
    # mkdir -p $D 
    # cd /usr/src
    # make buildworld 
    # make installworld DESTDIR=$D 
    # make distribution DESTDIR=$D 
    # mount -t devfs devfs $D/dev 

.. raw:: html

   <div class="calloutlist">

+--------------------------------------+--------------------------------------+
| `|1| <#jailpath>`__                  | Das Festlegen des Installationsorts  |
|                                      | f?r das Jail eignet sich am besten   |
|                                      | als Startpunkt. Hier wird sich die   |
|                                      | Jail innerhalb des Host-Dateisystems |
|                                      | befinden. Eine gute M?glichkeit w?re |
|                                      | etwa ``/usr/jail/name_der_jail``,    |
|                                      | wobei *``name_der_jail``* den        |
|                                      | Hostname darstellt, ?ber den die     |
|                                      | Jail identifiziert werden soll. Das  |
|                                      | Dateisystem unterhalb von ``/usr/``  |
|                                      | stellt normalerweise aussreichend    |
|                                      | Platz f?r eine Jail zur Verf?gung    |
|                                      | (bedenken Sie, dass eine „komplette“ |
|                                      | Jail ein Replikat einer jeden Datei  |
|                                      | der Standardinstallation des         |
|                                      | FreeBSD-Basissystems enth?lt.        |
+--------------------------------------+--------------------------------------+
| `|2| <#jailbuildworld>`__            | Wenn Sie bereits ihre                |
|                                      | Systemanwendungen mittels            |
|                                      | ``make world`` oder                  |
|                                      | ``make buildworld`` neu erstellt     |
|                                      | haben, k?nnen Sie diesen Schritt     |
|                                      | ?berspringen und die                 |
|                                      | Systemanwendungen in die neue Jail   |
|                                      | installieren.                        |
+--------------------------------------+--------------------------------------+
| `|3| <#jailinstallworld>`__          | Dieser Befehl wird den               |
|                                      | Verzeichnisbaum mit allen            |
|                                      | notwendigen Bin?rdateien,            |
|                                      | Bibliotheken, Manualpages usw.       |
|                                      | erstellen.                           |
+--------------------------------------+--------------------------------------+
| `|4| <#jaildistrib>`__               | Der ``distribution``-Befehl l?sst    |
|                                      | make alle ben?tigten                 |
|                                      | Konfigurationsdateien installieren,  |
|                                      | es werden also alle installierbaren  |
|                                      | Dateien aus ``/usr/src/etc/`` in das |
|                                      | Verzeichnis ``/etc`` der Jail        |
|                                      | installiert (also nach ``$D/etc/``). |
+--------------------------------------+--------------------------------------+
| `|5| <#jaildevfs>`__                 | Das Einh?ngen des                    |
|                                      | `devfs(8) <http://www.FreeBSD.org/cg |
|                                      | i/man.cgi?query=devfs&sektion=8>`__- |
|                                      | Dateisystems                         |
|                                      | innerhalb der Jail ist nicht         |
|                                      | unbedingt notwendig. Allerdings      |
|                                      | ben?tigt fast jede Anwendung Zugriff |
|                                      | auf wenigstens ein Ger?t. Es ist     |
|                                      | daher sehr wichtig, den Zugriff auf  |
|                                      | Devices aus der Jail heraus zu       |
|                                      | kontrollieren, da unsaubere          |
|                                      | Einstellungen es einem Angreifer     |
|                                      | erlauben k?nnten, in das System      |
|                                      | einzudringen. Die Kontrolle ?ber     |
|                                      | `devfs(8) <http://www.FreeBSD.org/cg |
|                                      | i/man.cgi?query=devfs&sektion=8>`__  |
|                                      | erfolgt durch die in den Manualpages |
|                                      | `devfs(8) <http://www.FreeBSD.org/cg |
|                                      | i/man.cgi?query=devfs&sektion=8>`__  |
|                                      | und                                  |
|                                      | `devfs.conf(5) <http://www.FreeBSD.o |
|                                      | rg/cgi/man.cgi?query=devfs.conf&sekt |
|                                      | ion=5>`__                            |
|                                      | beschriebenen Regeln.                |
+--------------------------------------+--------------------------------------+

.. raw:: html

   </div>

Ist eine Jail einmal erst erstellt, kann sie durch
`jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8>`__
gestartet werden.
`jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8>`__
ben?tigt zwingend mindestens vier Argumente, die im Abschnitt
`Abschnitt?16.3.1, „Was ist eine Jail?“ <jails-intro.html#jails-what>`__
des Handbuchs beschrieben sind. Weitere Argumente sind m?glich, um
beispielsweise die Jail mit den Berechtigungen eines bestimmten
Benutzers laufen zu lassen. Das Argument ``command`` h?ngt vom Typ der
Jail ab; f?r ein *virtuelles System* ist ``/etc/rc`` eine gute Wahl, da
dies dem Startvorgang eines echten FreeBSD-Systems entspricht. Bei einer
*Service*-Jail h?ngt dieses von der Art des Dienstes ab, der in der Jail
laufen soll.

Jails werden h?ufig mit dem Betriebssystem gestartet, da der
``rc``-Mechanismus von FreeBSD daf?r eine einfach zu realisierende
M?glichkeit bietet.

.. raw:: html

   <div class="procedure">

#. Eine Liste der Jails, die mit dem Betriebssystem gestartet werden
   sollen, wird in die Datei
   `rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5>`__
   geschrieben:

   .. code:: programlisting

       jail_enable="YES"   # Set to NO to disable starting of any jails
       jail_list="www"     # Space separated list of names of jails

   .. raw:: html

      <div class="note" xmlns="">

   Anmerkung:
   ~~~~~~~~~~

   Die Namen der Jails in der ``jail_list`` sollten nur alphanumerische
   Zeichen enthalten.

   .. raw:: html

      </div>

#. F?r jede Jail in der ``jail_list`` sollten in
   `rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5>`__
   einige Einstellungen vorgenommen werden:

   .. code:: programlisting

       jail_www_rootdir="/usr/jail/www"     # jail's root directory
       jail_www_hostname="www.example.org"  # jail's hostname
       jail_www_ip="192.168.0.10"           # jail's IP address
       jail_www_devfs_enable="YES"          # mount devfs in the jail
       jail_www_devfs_ruleset="www_ruleset" # devfs ruleset to apply to jail

   Beim Start einer in
   `rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5>`__
   konfigurierten Jail wird das ``/etc/rc``-Skript der Jail (das
   "annimmt", dass es sich in einem kompletten System befindet)
   aufgerufen. F?r Service-Jails sollten die Startskripte der Jail durch
   das Setzen der Option ``jail_jailname``\ \_exec\_start entsprechend
   angepasst werden.

   .. raw:: html

      <div class="note" xmlns="">

   Anmerkung:
   ~~~~~~~~~~

   Eine vollst?ndige Liste der Optionen findet sich in der Manualpage zu
   `rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5>`__.

   .. raw:: html

      </div>

.. raw:: html

   </div>

Das ``/etc/rc.d/jail``-Skript kann zum manuellen Starten und Stoppen der
Jail genutzt werden, wenn ein Eintrag in ``rc.conf`` angelegt wurde:

.. code:: screen

    # /etc/rc.d/jail start www
    # /etc/rc.d/jail stop www

Es gibt momentan keinen sauberen Weg, eine
`jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8>`__ zu
stoppen. Dies liegt daran, dass die Kommandos zum sauberen
Herunterfahren eines Systems innerhalb einer Jail nicht ausgef?hrt
werden k?nnen. Der beste Weg eine Jail zu beenden ist es daher,
innerhalb der Jail den folgenden Befehl auszuf?hren (alternativ k?nnen
Sie auch
`jexec(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jexec&sektion=8>`__
von au?erhalb der Jail aufrufen):

.. code:: screen

    # sh /etc/rc.shutdown

Weitere Informationen zu diesem Thema finden Sie in der Manualpage
`jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------+-------------------------------+--------------------------------------------+
| `Zur?ck <jails-intro.html>`__?   | `Nach oben <jails.html>`__    | ?\ `Weiter <jails-tuning.html>`__          |
+----------------------------------+-------------------------------+--------------------------------------------+
| 16.3. Einf?hrung?                | `Zum Anfang <index.html>`__   | ?16.5. Feinabstimmung und Administration   |
+----------------------------------+-------------------------------+--------------------------------------------+

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
.. |5| image:: ./imagelib/callouts/5.png
