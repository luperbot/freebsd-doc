============================
12.11. Konfigurationsdateien
============================

.. raw:: html

   <div class="navheader">

12.11. Konfigurationsdateien
`Zur?ck <configtuning-syslog.html>`__?
Kapitel 12. Konfiguration und Tuning
?\ `Weiter <configtuning-sysctl.html>`__

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

12.11. Konfigurationsdateien
----------------------------

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

12.11.1. ``/etc`` Layout
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Konfigurationsdateien finden sich in einigen Verzeichnissen unter
anderem in:

.. raw:: html

   <div class="informaltable">

+---------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``/etc``                  | Enth?lt generelle Konfigurationsinformationen, die Daten hier sind systemspezifisch.                                                                                                                  |
+---------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``/etc/defaults``         | Default Versionen der Konfigurationsdateien.                                                                                                                                                          |
+---------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``/etc/mail``             | Enth?lt die `sendmail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sendmail&sektion=8>`__ Konfiguration und weitere MTA Konfigurationsdateien.                                                        |
+---------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``/etc/ppp``              | Hier findet sich die Konfiguration f?r die User- und Kernel-ppp Programme.                                                                                                                            |
+---------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``/etc/namedb``           | Das Vorgabeverzeichnis, in dem Daten von `named(8) <http://www.FreeBSD.org/cgi/man.cgi?query=named&sektion=8>`__ gehalten werden. Normalerweise werden hier ``named.conf`` und Zonendaten abgelegt.   |
+---------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``/usr/local/etc``        | Installierte Anwendungen legen hier ihre Konfigurationsdateien ab. Dieses Verzeichnis kann Unterverzeichnisse f?r bestimmte Anwendungen enthalten.                                                    |
+---------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``/usr/local/etc/rc.d``   | Ort f?r Start- und Stopskripten installierter Anwendungen.                                                                                                                                            |
+---------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``/var/db``               | Automatisch generierte systemspezifische Datenbanken, wie die Paket-Datenbank oder die ``locate``-Datenbank.                                                                                          |
+---------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

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

12.11.2. Hostnamen
~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

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

12.11.2.1. ``/etc/resolv.conf``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wie der FreeBSD-Resolver auf das Internet Domain Name System (DNS)
zugreift, wird in ``/etc/resolv.conf`` festgelegt.

Die gebr?uchlichsten Eintr?ge in ``/etc/resolv.conf`` sind:

.. raw:: html

   <div class="informaltable">

+------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``nameserver``   | Die IP-Adresse eines Nameservers, den der Resolver abfragen soll. Bis zu drei Server werden in der Reihenfolge, in der sie aufgez?hlt sind, abgefragt.   |
+------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``search``       | Suchliste mit Domain-Namen zum Aufl?sen von Hostnamen. Die Liste wird normalerweise durch den Domain-Teil des lokalen Hostnamens festgelegt.             |
+------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``domain``       | Der lokale Domain-Name.                                                                                                                                  |
+------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

Beispiel f?r eine typische ``resolv.conf``:

.. code:: programlisting

    search example.com
    nameserver 147.11.1.11
    nameserver 147.11.100.30

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Nur eine der Anweisungen ``search`` oder ``domain`` sollte benutzt
werden.

.. raw:: html

   </div>

Wenn Sie DHCP benutzen, ?berschreibt
`dhclient(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dhclient&sektion=8>`__
f?r gew?hnlich ``resolv.conf`` mit den Informationen vom DHCP-Server.

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

12.11.2.2. ``/etc/hosts``
^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``/etc/hosts`` ist eine einfache textbasierte Datenbank, die aus alten
Internetzeiten stammt. Zusammen mit DNS und NIS stellt sie eine
Abbildung zwischen Namen und IP-Adressen zur Verf?gung. Anstatt
`named(8) <http://www.FreeBSD.org/cgi/man.cgi?query=named&sektion=8>`__
zu konfigurieren, k?nnen hier lokale Rechner, die ?ber ein LAN verbunden
sind, eingetragen werden. Lokale Eintr?ge f?r gebr?uchliche
Internet-Adressen in ``/etc/hosts`` verhindern die Abfrage eines
externen Servers und beschleunigen die Namensaufl?sung.

.. code:: programlisting

    # $FreeBSD$
    #
    #
    # Host Database
    #
    # This file should contain the addresses and aliases for local hosts that
    # share this file.  Replace 'my.domain' below with the domainname of your
    # machine.
    #
    # In the presence of the domain name service or NIS, this file may
    # not be consulted at all; see /etc/nsswitch.conf for the resolution order.
    #
    #
    ::1         localhost localhost.my.domain
    127.0.0.1       localhost localhost.my.domain
    #
    # Imaginary network.
    #10.0.0.2       myname.my.domain myname
    #10.0.0.3       myfriend.my.domain myfriend
    #
    # According to RFC 1918, you can use the following IP networks for
    # private nets which will never be connected to the Internet:
    #
    #   10.0.0.0    -   10.255.255.255
    #   172.16.0.0  -   172.31.255.255
    #   192.168.0.0 -   192.168.255.255
    #
    # In case you want to be able to connect to the Internet, you need
    # real official assigned numbers.  Do not try to invent your own network
    # numbers but instead get one from your network provider (if any) or
    # from your regional registry (ARIN, APNIC, LACNIC, RIPE NCC, or AfriNIC.)
    #

``/etc/hosts`` hat ein einfaches Format:

.. code:: programlisting

    [Internet Adresse] [Offizieller Hostname] [Alias1] [Alias2] ...

Zum Beispiel:

.. code:: programlisting

    10.0.0.1 myRealHostname.example.com myRealHostname foobar1 foobar2

Weitere Informationen entnehmen Sie bitte
`hosts(5) <http://www.FreeBSD.org/cgi/man.cgi?query=hosts&sektion=5>`__.

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

12.11.3. ``sysctl.conf``
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``sysctl.conf`` sieht ?hnlich wie ``rc.conf`` aus. Werte werden in der
Form ``Variable=Wert`` gesetzt. Die angegebenen Werte werden gesetzt,
nachdem sich das System bereits im Mehrbenutzermodus befindet.
Allerdings lassen sich im Mehrbenutzermodus nicht alle Werte setzen.

Um das Protokollieren von fatalen Signalen abzustellen und Benutzer
daran zu hindern, von anderen Benutzern gestartete Prozesse zu sehen,
k?nnen Sie in der Datei ``sysctl.conf`` die folgenden Variablen setzen:

.. code:: programlisting

    # Do not log fatal signal exits (e.g. sig 11)
    kern.logsigexit=0

    # Prevent users from seeing information about processes that
    # are being run under another UID.
    security.bsd.see_other_uids=0

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------------+--------------------------------------+--------------------------------------------+
| `Zur?ck <configtuning-syslog.html>`__?      | `Nach oben <config-tuning.html>`__   | ?\ `Weiter <configtuning-sysctl.html>`__   |
+---------------------------------------------+--------------------------------------+--------------------------------------------+
| 12.10. Konfiguration des syslogd Servers?   | `Zum Anfang <index.html>`__          | ?12.12. Einstellungen mit sysctl(8)        |
+---------------------------------------------+--------------------------------------+--------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
