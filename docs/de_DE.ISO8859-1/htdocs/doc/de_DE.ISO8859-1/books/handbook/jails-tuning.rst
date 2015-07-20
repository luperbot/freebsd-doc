=======================================
16.5. Feinabstimmung und Administration
=======================================

.. raw:: html

   <div class="navheader">

16.5. Feinabstimmung und Administration
`Zur?ck <jails-build.html>`__?
Kapitel 16. Jails
?\ `Weiter <jails-application.html>`__

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

16.5. Feinabstimmung und Administration
---------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Es gibt verschiedene Optionen, die f?r jede Jail gesetzt werden k?nnen
und verschiedene Wege, ein FreeBSD-Host-System mit Jails zu kombinieren.
Dieser Abschnitt zeigt Ihnen:

.. raw:: html

   <div class="itemizedlist">

-  Einige zur Verf?gung stehende Optionen zur Abstimmung des Verhaltens
   und der Sicherheitseinstellungen, die mit einer Jail-Installation
   ausgef?hrt werden k?nnen.

-  Einige der Anwendungsprogramme f?r das Jail-Management, die ?ber die
   FreeBSD Ports-Sammlung verf?gbar sind und genutzt werden k?nnen, um
   Jail-basierte L?sungen allumfassend umzusetzen.

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

16.5.1. Systemwerkzeuge zur Feinabstimmung von Jails in FreeBSD
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Feinabstimmung einer Jail-Konfiguration erfolgt zum Gro?teil durch
das Setzen von
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__-Variablen.
Es gibt einen speziellen sysctl-Zweig, der als Basis f?r die
Organisation aller relevanten Optionen dient: Die
``security.jail.*``-Hierarchie der FreeBSD-Kerneloptionen. Die folgende
Liste enth?lt alle jail-bezogenen sysctls (inklusiver ihrer
Voreinstellungen). Die Namen sollten selbsterkl?rend sein, f?r
weitergehende Informationen lesen Sie bitte die Manualpages
`jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8>`__
und
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__.

.. raw:: html

   <div class="itemizedlist">

-  ``security.jail.set_hostname_allowed:          1``

-  ``security.jail.socket_unixiproute_only:          1``

-  ``security.jail.sysvipc_allowed:          0``

-  ``security.jail.enforce_statfs:          2``

-  ``security.jail.allow_raw_sockets:          0``

-  ``security.jail.chflags_allowed:         0``

-  ``security.jail.jailed: 0``

.. raw:: html

   </div>

Diese Variablen k?nnen vom Administrator des *Host-Systems* genutzt
werden, um Beschr?nkungen hinzuzuf?gen oder aufzuheben, die dem Benutzer
``root`` als Vorgabe auferlegt sind. Beachten Sie, dass es einige
Beschr?nkungen gibt, die nicht ver?ndert werden k?nnen. Der Benutzer
``root`` darf innheralb der
`jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8>`__
keine Dateisysteme mounten und unmounten. Ebenso ist es ihm untersagt,
das
`devfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=devfs&sektion=8>`__-Regelwerk
zu laden oder zu entladen. Er darf weder Firewallregeln setzen, noch
administrative Aufgaben erledigen, die Modifikationen am Kernel selbst
erfordern (wie bespielsweise das Setzen des ``Securelevels`` des Kernel.

Das FreeBSD-Basissystem enth?lt einen Basissatz an Werkzeugen, um
Informationen ?ber aktive Jails zu erlangen und einer Jail
administrative Befehle zuzuordnen. Die Befehle
`jls(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jls&sektion=8>`__ und
`jexec(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jexec&sektion=8>`__
sind Teil des FreeBSD-Basissystems und k?nnen f?r folgende Aufgaben
verwendet werden:

.. raw:: html

   <div class="itemizedlist">

-  Das Anzeigen einer Liste der aktiven Jails und ihrer zugeh?rigen Jail
   Identifier (JID), ihrer IP-Addresse, ihres Hostnames und ihres
   Pfades.

-  Das Herstellen einer Verbindung mit einer laufenden Jail, das Starten
   eines Befehls aus dem gastgebenen System heraus oder das Ausf?hren
   einer administrativen Aufgabe innerhalb der Jail selbst. Dies ist
   insbesondere dann n?tzlich, wenn der Benutzer ``root`` die Jail
   sauber herunterfahren m?chte.
   `jexec(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jexec&sektion=8>`__
   kann auch zum Starten einer Shell innerhalb der Jail genutzt werden,
   um adminstrative Aufgaben durchzuf?hren:

   .. code:: screen

       # jexec 1 tcsh

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

16.5.2. High-Level-Werkzeuge zur Jail-Administration in der FreeBSD Ports-Sammlung
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Unter den zahlreichen Fremdwerkzeugen f?r die Administration von Jails
sind die
`sysutils/jailutils <http://www.freebsd.org/cgi/url.cgi?ports/sysutils/jailutils/pkg-descr>`__
die vollst?ndigsten und brauchbarsten. Dabei handelt es sich um eine
Sammlung kleiner Anwendungen, die das
`jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8>`__-Management
vereinfachen. Weitere Informationen zu diesen Werkzeugen finden Sie auf
den entsprechenden Internetseiten.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------------+-------------------------------+------------------------------------------+
| `Zur?ck <jails-build.html>`__?                | `Nach oben <jails.html>`__    | ?\ `Weiter <jails-application.html>`__   |
+-----------------------------------------------+-------------------------------+------------------------------------------+
| 16.4. Einrichtung und Verwaltung von Jails?   | `Zum Anfang <index.html>`__   | ?16.6. Anwendung von Jails               |
+-----------------------------------------------+-------------------------------+------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
