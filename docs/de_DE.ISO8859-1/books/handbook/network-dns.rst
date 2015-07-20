===============================
31.6. DNS – Domain Name Service
===============================

.. raw:: html

   <div class="navheader">

31.6. DNS – Domain Name Service
`Zur?ck <network-dhcp.html>`__?
Kapitel 31. Netzwerkserver
?\ `Weiter <network-apache.html>`__

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

31.6. DNS – Domain Name Service
-------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Beigetragen von Chern Lee, Tom Rhodes und Daniel Gerzo.

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

31.6.1. ?berblick
~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

DNS ist das f?r die Umwandlung von Rechnernamen in IP-Adressen
zust?ndige Protokoll. FreeBSD verwendet dazu BIND (Berkeley Internet
Name Domain), die am h?ufigsten verwendete Implementierung von DNS).
Eine Anfrage nach ``www.FreeBSD.org`` gibt die IP-Adresse des
FreeBSD-Webservers, eine Anfrage nach ``ftp.FreeBSD.org`` die IP-Adresse
des entsprechenden FTP-Servers zur?ck. Der umgekehrte Weg ist ebenso
m?glich, eine IP-Adresse kann also auch in ihren Rechnernamen aufgel?st
werden. Um eine DNS-Abfrage durchzuf?hren, muss auf dem jeweiligen
Rechner kein Nameserver installiert sein.

FreeBSD verwendet derzeit in der Voreinstellung BIND9 als
DNS-Serversoftware. Unsere Installation bietet Ihnen eine erh?hte
Sicherheit, ein neues Dateisystemlayout sowie eine automatisierte
`chroot(8) <http://www.FreeBSD.org/cgi/man.cgi?query=chroot&sektion=8>`__-Konfiguration.

Im Internet wird DNS durch ein komplexes System von autoritativen
Root-Nameservern, Top Level Domain-Servern (TLD) sowie anderen kleineren
Nameservern verwaltet, die individuelle Rechnerinformationen speichern
und untereinander abgleichen.

Derzeit wird BIND vom Internet Systems Consortium
(``https://www.isc.org/``) verwaltet.

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

31.6.2. Begriffsbestimmungen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Um dieses Dokument besser verstehen zu k?nnen, m?ssen einige
DNS-spezifische Begriffe genauer definiert werden.

.. raw:: html

   <div class="informaltable">

+---------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Begriff             | Bedeutung                                                                                                                                                                                                                  |
+=====================+============================================================================================================================================================================================================================+
| Forward-DNS         | Rechnernamen in IP-Adressen umwandeln.                                                                                                                                                                                     |
+---------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Origin (Ursprung)   | Die in einer bestimmten Zonendatei beschriebene Dom?ne.                                                                                                                                                                    |
+---------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| named, BIND         | Gebr?uchliche Namen f?r das unter FreeBSD verwendete BIND-Nameserverpaket.                                                                                                                                                 |
+---------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Resolver            | Ein Systemprozess, durch den ein Rechner Zoneninformationen von einem Nameserver anfordert.                                                                                                                                |
+---------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Reverse-DNS         | die Umwandlung von IP-Adressen in Rechnernamen                                                                                                                                                                             |
+---------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Root-Zone           | Der Beginn der Internet-Zonenhierarchie. Alle Zonen befinden sich innerhalb der Root-Zone. Dies ist analog zu einem Dateisystem, in dem sich alle Dateien und Verzeichnisse innerhalb des Wurzelverzeichnisses befinden.   |
+---------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Zone                | Eine individuelle Dom?ne, Unterdom?ne, oder ein Teil von DNS, der von der gleichen Autorit?t verwaltet wird.                                                                                                               |
+---------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

Es folgen nun einige Zonenbeispiele:

.. raw:: html

   <div class="itemizedlist">

-  Innerhalb der Dokumentation wird die Root-Zone in der Regel mit ``.``
   bezeichnet.

-  ``org.`` ist eine Top level Domain (TLD) innerhalb der Root-Zone.

-  ``example.org.`` ist eine Zone innerhalb der ``org.``-TLD.

-  ``1.168.192.in-addr.arpa.`` ist die Zone mit allen IP-Adressen des
   ``192.168.1.*``-IP-Bereichs.

.. raw:: html

   </div>

Wie man an diesen Beispielen erkennen kann, befindet sich der
spezifischere Teil eines Rechnernamens auf der linken Seite der Adresse.
``example.org.`` beschreibt einen Rechner also genauer als ``org.``,
w?hrend ``org.`` genauer als die Root-Zone ist. Jeder Teil des
Rechnernamens hat ?hnlichkeiten mit einem Dateisystem, in dem etwa
``/dev`` dem Wurzelverzeichnis untergeordnet ist.

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

31.6.3. Gr?nde f?r die Verwendung eines Nameservers
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Es gibt zwei Arten von Nameservern: Autoritative Nameserver sowie
zwischenspeichernde (cachende, auch bekannt als aufl?sende) Nameserver.

Ein autoritativer Nameserver ist notwendig, wenn

.. raw:: html

   <div class="itemizedlist">

-  Sie anderen verbindliche DNS-Ausk?nfte erteilen wollen.

-  eine Domain, beispielsweise ``example.org``, registriert wird, und
   den zu dieser Domain geh?renden Rechnern IP-Adressen zugewiesen
   werden m?ssen.

-  ein IP-Adressblock reverse-DNS-Eintr?ge ben?tigt, um IP-Adressen in
   Rechnernamen aufl?sen zu k?nnen.

-  ein Backup-Nameserver (auch Slaveserver genannt) oder ein zweiter
   Nameserver auf Anfragen antworten soll.

.. raw:: html

   </div>

Ein cachender Nameserver ist notwendig, weil

.. raw:: html

   <div class="itemizedlist">

-  ein lokaler DNS-Server Daten zwischenspeichern und daher schneller
   auf Anfragen reagieren kann als ein entfernter Server.

.. raw:: html

   </div>

Wird nach ``www.FreeBSD.org`` gesucht, leitet der Resolver diese Anfrage
an den Nameserver des ISPs weiter und nimmt danach das Ergebnis der
Abfrage entgegen. Existiert ein lokaler, zwischenspeichernder
DNS-Server, muss dieser die Anfrage nur einmal nach au?en weitergeben.
F?r alle weiteren Anfragen ist dies nicht mehr n?tig, da diese
Information nun lokal gespeichert ist.

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

31.6.4. Wie funktioniert DNS?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Unter FreeBSD wird der BIND-Daemon als named bezeichnet.

.. raw:: html

   <div class="informaltable">

+-------------------------------------------------------------------------+--------------------------------------------------------------------------+
| Datei                                                                   | Beschreibung                                                             |
+=========================================================================+==========================================================================+
| named                                                                   | Der BIND-Daemon.                                                         |
+-------------------------------------------------------------------------+--------------------------------------------------------------------------+
| `rndc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rndc&sektion=8>`__   | Das Steuerprogramm f?r named.                                            |
+-------------------------------------------------------------------------+--------------------------------------------------------------------------+
| ``/etc/namedb``                                                         | Das Verzeichnis, in dem sich die Zoneninformationen f?r BIND befinden.   |
+-------------------------------------------------------------------------+--------------------------------------------------------------------------+
| ``/etc/namedb/named.conf``                                              | Die Konfigurationsdatei f?r named.                                       |
+-------------------------------------------------------------------------+--------------------------------------------------------------------------+

.. raw:: html

   </div>

Je nachdem, wie eine Zone auf dem Server konfiguriert wurde, finden sich
die zur Zone geh?rendenden Dateien in den Unterverzeichnissen
``master``, ``slave``, oder ``dynamic`` des Verzeichnisses
``/etc/namedb``. Diese Dateien enthalten die DNS-Informationen, die der
Nameserver f?r die Beantwortung von Anfragen ben?tigt.

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

31.6.5. BIND starten
~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Da BIND automatisch installiert wird, ist die Konfiguration relativ
einfach.

In der Voreinstellung wird ein in einer
`chroot(8) <http://www.FreeBSD.org/cgi/man.cgi?query=chroot&sektion=8>`__-Umgebung
betriebener named-Server zur einfachen Namensaufl?sung eingerichtet, der
nur im lokalen IPv4-Loopback-Adressbereich (127.0.0.1) lauscht. Um den
Server manuell zu starten, verwenden Sie den folgenden Befehl:

.. code:: screen

    # service named onestart

Um den named-Daemon beim Systemstart automatisch zu starten, f?gen Sie
folgende Zeile in ``/etc/rc.conf`` ein:

.. code:: programlisting

    named_enable="YES"

``/etc/namedb/named.conf`` bietet zahlreiche Konfigurationsoptionen, die
in diesem Dokument nicht alle beschrieben werden k?nnen. Wollen Sie die
Startoptionen von named unter FreeBSD anpassen, sollten Sie sich die
``named_*``-Flags in der Datei ``/etc/defaults/rc.conf`` sowie die
Manualpage zu
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5>`__
n?her ansehen. Zus?tzliche Informationen bietet Ihnen auch der Abschnitt
`Abschnitt?12.7, „Das rc-System f?r
Systemdienste“ <configtuning-rcd.html>`__ des Handbuchs.

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

31.6.6. Konfigurationsdateien
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Konfigurationsdateien von named finden sich unter ``/etc/namedb``
und m?ssen in der Regel an Ihre Bed?rfnisse angepasst werden. Es sei
denn, Sie ben?tigen nur einen einfachen Resolver. Ein Gro?teil der
Konfigurationsarbeiten erfolgt dabei in diesem Verzeichnis.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

31.6.6.1. ``/etc/namedb/named.conf``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. code:: programlisting

    // $FreeBSD$
    //
    // Refer to the named.conf(5) and named(8) man pages, and the documentation
    // in /usr/share/doc/bind9 for more details.
    //
    // If you are going to set up an authoritative server, make sure you
    // understand the hairy details of how DNS works.  Even with
    // simple mistakes, you can break connectivity for affected parties,
    // or cause huge amounts of useless Internet traffic.

    options {
    // All file and path names are relative to the chroot directory,
    // if any, and should be fully qualified.
        directory   "/etc/namedb/working";
        pid-file    "/var/run/named/pid";
        dump-file   "/var/dump/named_dump.db";
        statistics-file "/var/stats/named.stats";

    // If named is being used only as a local resolver, this is a safe default.
    // For named to be accessible to the network, comment this option, specify
    // the proper IP address, or delete this option.
        listen-on   { 127.0.0.1; };

    // If you have IPv6 enabled on this system, uncomment this option for
    // use as a local resolver.  To give access to the network, specify
    // an IPv6 address, or the keyword "any".
    //  listen-on-v6    { ::1; };

    // These zones are already covered by the empty zones listed below.
    // If you remove the related empty zones below, comment these lines out.
        disable-empty-zone "255.255.255.255.IN-ADDR.ARPA";
        disable-empty-zone "0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.IP6.ARPA";
        disable-empty-zone "1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.IP6.ARPA";

    // If you've got a DNS server around at your upstream provider, enter
    // its IP address here, and enable the line below.  This will make you
    // benefit from its cache, thus reduce overall DNS traffic in the Internet.
    /*
        forwarders {
            127.0.0.1;
        };
    */

    // If the 'forwarders' clause is not empty the default is to 'forward first'
    // which will fall back to sending a query from your local server if the name
    // servers in 'forwarders' do not have the answer.  Alternatively you can
    // force your name server to never initiate queries of its own by enabling the
    // following line:
    //  forward only;

    // If you wish to have forwarding configured automatically based on
    // the entries in /etc/resolv.conf, uncomment the following line and
    // set named_auto_forward=yes in /etc/rc.conf.  You can also enable
    // named_auto_forward_only (the effect of which is described above).
    //  include "/etc/namedb/auto_forward.conf";
            

Um vom Cache Ihres Internetproviders zu profitieren, k?nnen hier
``forwarders`` aktiviert werden. Normalerweise sucht ein Nameserver das
Internet rekursiv ab, bis er die gesuchte Antwort findet. Durch diese
Option wird stets der Nameserver Ihres Internetproviders zuerst
abgefragt, um von dessen Cache zu profitieren. Wenn es sich um einen
schnellen, viel benutzten Nameserver handelt, kann dies zu einer
Geschwindigkeitssteigerung f?hren.

.. raw:: html

   <div class="warning" xmlns="">

Warnung:
~~~~~~~~

``127.0.0.1`` funktioniert hier *nicht*. ?ndern Sie diese Adresse in
einen Nameserver Ihres Einwahlproviders.

.. raw:: html

   </div>

.. code:: programlisting

       /*
           Modern versions of BIND use a random UDP port for each outgoing
           query by default in order to dramatically reduce the possibility
           of cache poisoning.  All users are strongly encouraged to utilize
           this feature, and to configure their firewalls to accommodate it.

           AS A LAST RESORT in order to get around a restrictive firewall
           policy you can try enabling the option below.  Use of this option
           will significantly reduce your ability to withstand cache poisoning
           attacks, and should be avoided if at all possible.

           Replace NNNNN in the example with a number between 49160 and 65530.
        */
        // query-source address * port NNNNN;
    };

    // If you enable a local name server, don't forget to enter 127.0.0.1
    // first in your /etc/resolv.conf so this server will be queried.
    // Also, make sure to enable it in /etc/rc.conf.

    // The traditional root hints mechanism. Use this, OR the slave zones below.
    zone "." { type hint; file "/etc/namedb/named.root"; };

    /*  Slaving the following zones from the root name servers has some
        significant advantages:
        1. Faster local resolution for your users
        2. No spurious traffic will be sent from your network to the roots
        3. Greater resilience to any potential root server failure/DDoS

        On the other hand, this method requires more monitoring than the
        hints file to be sure that an unexpected failure mode has not
        incapacitated your server.  Name servers that are serving a lot
        of clients will benefit more from this approach than individual
        hosts.  Use with caution.

        To use this mechanism, uncomment the entries below, and comment
        the hint zone above.

        As documented at http://dns.icann.org/services/axfr/ these zones:
        "." (the root), ARPA, IN-ADDR.ARPA, IP6.ARPA, and ROOT-SERVERS.NET
        are availble for AXFR from these servers on IPv4 and IPv6:
        xfr.lax.dns.icann.org, xfr.cjr.dns.icann.org
    */
    /*
    zone "." {
        type slave;
        file "/etc/namedb/slave/root.slave";
        masters {
            192.5.5.241;    // F.ROOT-SERVERS.NET.
        };
        notify no;
    };
    zone "arpa" {
        type slave;
        file "/etc/namedb/slave/arpa.slave";
        masters {
            192.5.5.241;    // F.ROOT-SERVERS.NET.
        };
        notify no;
    };
    */

    /*  Serving the following zones locally will prevent any queries
        for these zones leaving your network and going to the root
        name servers.  This has two significant advantages:
        1. Faster local resolution for your users
        2. No spurious traffic will be sent from your network to the roots
    */
    // RFCs 1912 and 5735 (and BCP 32 for localhost)
    zone "localhost"        { type master; file "/etc/namedb/master/localhost-forward.db"; };
    zone "127.in-addr.arpa" { type master; file "/etc/namedb/master/localhost-reverse.db"; };
    zone "255.in-addr.arpa" { type master; file "/etc/namedb/master/empty.db"; };

    // RFC 1912-style zone for IPv6 localhost address
    zone "0.ip6.arpa"       { type master; file "/etc/namedb/master/localhost-reverse.db"; };

    // "This" Network (RFCs 1912 and 5735)
    zone "0.in-addr.arpa"   { type master; file "/etc/namedb/master/empty.db"; };

    // Private Use Networks (RFCs 1918 and 5735)
    zone "10.in-addr.arpa"     { type master; file "/etc/namedb/master/empty.db"; };
    zone "16.172.in-addr.arpa" { type master; file "/etc/namedb/master/empty.db"; };
    zone "17.172.in-addr.arpa" { type master; file "/etc/namedb/master/empty.db"; };
    zone "18.172.in-addr.arpa" { type master; file "/etc/namedb/master/empty.db"; };
    zone "19.172.in-addr.arpa" { type master; file "/etc/namedb/master/empty.db"; };
    zone "20.172.in-addr.arpa" { type master; file "/etc/namedb/master/empty.db"; };
    zone "21.172.in-addr.arpa" { type master; file "/etc/namedb/master/empty.db"; };
    zone "22.172.in-addr.arpa" { type master; file "/etc/namedb/master/empty.db"; };
    zone "23.172.in-addr.arpa" { type master; file "/etc/namedb/master/empty.db"; };
    zone "24.172.in-addr.arpa" { type master; file "/etc/namedb/master/empty.db"; };
    zone "25.172.in-addr.arpa" { type master; file "/etc/namedb/master/empty.db"; };
    zone "26.172.in-addr.arpa" { type master; file "/etc/namedb/master/empty.db"; };
    zone "27.172.in-addr.arpa" { type master; file "/etc/namedb/master/empty.db"; };
    zone "28.172.in-addr.arpa" { type master; file "/etc/namedb/master/empty.db"; };
    zone "29.172.in-addr.arpa" { type master; file "/etc/namedb/master/empty.db"; };
    zone "30.172.in-addr.arpa" { type master; file "/etc/namedb/master/empty.db"; };
    zone "31.172.in-addr.arpa" { type master; file "/etc/namedb/master/empty.db"; };
    zone "168.192.in-addr.arpa" { type master; file "/etc/namedb/master/empty.db"; };

    // Link-local/APIPA (RFCs 3927 and 5735)
    zone "254.169.in-addr.arpa" { type master; file "/etc/namedb/master/empty.db"; };

    // IETF protocol assignments (RFCs 5735 and 5736)
    zone "0.0.192.in-addr.arpa" { type master; file "/etc/namedb/master/empty.db"; };

    // TEST-NET-[1-3] for Documentation (RFCs 5735 and 5737)
    zone "2.0.192.in-addr.arpa" { type master; file "/etc/namedb/master/empty.db"; };
    zone "100.51.198.in-addr.arpa" { type master; file "/etc/namedb/master/empty.db"; };
    zone "113.0.203.in-addr.arpa" { type master; file "/etc/namedb/master/empty.db"; };

    // IPv6 Range for Documentation (RFC 3849)
    zone "8.b.d.0.1.0.0.2.ip6.arpa" { type master; file "/etc/namedb/master/empty.db"; };


    // Domain Names for Documentation and Testing (BCP 32)
    zone "test" { type master; file "/etc/namedb/master/empty.db"; };
    zone "example" { type master; file "/etc/namedb/master/empty.db"; };
    zone "invalid" { type master; file "/etc/namedb/master/empty.db"; };
    zone "example.com" { type master; file "/etc/namedb/master/empty.db"; };
    zone "example.net" { type master; file "/etc/namedb/master/empty.db"; };
    zone "example.org" { type master; file "/etc/namedb/master/empty.db"; };


    // Router Benchmark Testing (RFCs 2544 and 5735)
    zone "18.198.in-addr.arpa" { type master; file "/etc/namedb/master/empty.db"; };
    zone "19.198.in-addr.arpa" { type master; file "/etc/namedb/master/empty.db"; };

    // IANA Reserved - Old Class E Space (RFC 5735)
    zone "240.in-addr.arpa" { type master; file "/etc/namedb/master/empty.db"; };
    zone "241.in-addr.arpa" { type master; file "/etc/namedb/master/empty.db"; };
    zone "242.in-addr.arpa" { type master; file "/etc/namedb/master/empty.db"; };
    zone "243.in-addr.arpa" { type master; file "/etc/namedb/master/empty.db"; };
    zone "244.in-addr.arpa" { type master; file "/etc/namedb/master/empty.db"; };
    zone "245.in-addr.arpa" { type master; file "/etc/namedb/master/empty.db"; };
    zone "246.in-addr.arpa" { type master; file "/etc/namedb/master/empty.db"; };
    zone "247.in-addr.arpa" { type master; file "/etc/namedb/master/empty.db"; };
    zone "248.in-addr.arpa" { type master; file "/etc/namedb/master/empty.db"; };
    zone "249.in-addr.arpa" { type master; file "/etc/namedb/master/empty.db"; };
    zone "250.in-addr.arpa" { type master; file "/etc/namedb/master/empty.db"; };
    zone "251.in-addr.arpa" { type master; file "/etc/namedb/master/empty.db"; };
    zone "252.in-addr.arpa" { type master; file "/etc/namedb/master/empty.db"; };
    zone "253.in-addr.arpa" { type master; file "/etc/namedb/master/empty.db"; };
    zone "254.in-addr.arpa" { type master; file "/etc/namedb/master/empty.db"; };

    // IPv6 Unassigned Addresses (RFC 4291)
    zone "1.ip6.arpa"       { type master; file "/etc/namedb/master/empty.db"; };
    zone "3.ip6.arpa"       { type master; file "/etc/namedb/master/empty.db"; };
    zone "4.ip6.arpa"       { type master; file "/etc/namedb/master/empty.db"; };
    zone "5.ip6.arpa"       { type master; file "/etc/namedb/master/empty.db"; };
    zone "6.ip6.arpa"       { type master; file "/etc/namedb/master/empty.db"; };
    zone "7.ip6.arpa"       { type master; file "/etc/namedb/master/empty.db"; };
    zone "8.ip6.arpa"       { type master; file "/etc/namedb/master/empty.db"; };
    zone "9.ip6.arpa"       { type master; file "/etc/namedb/master/empty.db"; };
    zone "a.ip6.arpa"       { type master; file "/etc/namedb/master/empty.db"; };
    zone "b.ip6.arpa"       { type master; file "/etc/namedb/master/empty.db"; };
    zone "c.ip6.arpa"       { type master; file "/etc/namedb/master/empty.db"; };
    zone "d.ip6.arpa"       { type master; file "/etc/namedb/master/empty.db"; };
    zone "e.ip6.arpa"       { type master; file "/etc/namedb/master/empty.db"; };
    zone "0.f.ip6.arpa"     { type master; file "/etc/namedb/master/empty.db"; };
    zone "1.f.ip6.arpa"     { type master; file "/etc/namedb/master/empty.db"; };
    zone "2.f.ip6.arpa"     { type master; file "/etc/namedb/master/empty.db"; };
    zone "3.f.ip6.arpa"     { type master; file "/etc/namedb/master/empty.db"; };
    zone "4.f.ip6.arpa"     { type master; file "/etc/namedb/master/empty.db"; };
    zone "5.f.ip6.arpa"     { type master; file "/etc/namedb/master/empty.db"; };
    zone "6.f.ip6.arpa"     { type master; file "/etc/namedb/master/empty.db"; };
    zone "7.f.ip6.arpa"     { type master; file "/etc/namedb/master/empty.db"; };
    zone "8.f.ip6.arpa"     { type master; file "/etc/namedb/master/empty.db"; };
    zone "9.f.ip6.arpa"     { type master; file "/etc/namedb/master/empty.db"; };
    zone "a.f.ip6.arpa"     { type master; file "/etc/namedb/master/empty.db"; };
    zone "b.f.ip6.arpa"     { type master; file "/etc/namedb/master/empty.db"; };
    zone "0.e.f.ip6.arpa"       { type master; file "/etc/namedb/master/empty.db"; };
    zone "1.e.f.ip6.arpa"       { type master; file "/etc/namedb/master/empty.db"; };
    zone "2.e.f.ip6.arpa"       { type master; file "/etc/namedb/master/empty.db"; };
    zone "3.e.f.ip6.arpa"       { type master; file "/etc/namedb/master/empty.db"; };
    zone "4.e.f.ip6.arpa"       { type master; file "/etc/namedb/master/empty.db"; };
    zone "5.e.f.ip6.arpa"       { type master; file "/etc/namedb/master/empty.db"; };
    zone "6.e.f.ip6.arpa"       { type master; file "/etc/namedb/master/empty.db"; };
    zone "7.e.f.ip6.arpa"       { type master; file "/etc/namedb/master/empty.db"; };

    // IPv6 ULA (RFC 4193)
    zone "c.f.ip6.arpa"     { type master; file "/etc/namedb/master/empty.db"; };
    zone "d.f.ip6.arpa"     { type master; file "/etc/namedb/master/empty.db"; };

    // IPv6 Link Local (RFC 4291)
    zone "8.e.f.ip6.arpa"       { type master; file "/etc/namedb/master/empty.db"; };
    zone "9.e.f.ip6.arpa"       { type master; file "/etc/namedb/master/empty.db"; };
    zone "a.e.f.ip6.arpa"       { type master; file "/etc/namedb/master/empty.db"; };
    zone "b.e.f.ip6.arpa"       { type master; file "/etc/namedb/master/empty.db"; };

    // IPv6 Deprecated Site-Local Addresses (RFC 3879)
    zone "c.e.f.ip6.arpa"       { type master; file "/etc/namedb/master/empty.db"; };
    zone "d.e.f.ip6.arpa"       { type master; file "/etc/namedb/master/empty.db"; };
    zone "e.e.f.ip6.arpa"       { type master; file "/etc/namedb/master/empty.db"; };
    zone "f.e.f.ip6.arpa"       { type master; file "/etc/namedb/master/empty.db"; };

    // IP6.INT is Deprecated (RFC 4159)
    zone "ip6.int"          { type master; file "/etc/namedb/master/empty.db"; };

    // NB: Do not use the IP addresses below, they are faked, and only
    // serve demonstration/documentation purposes!
    //
    // Example slave zone config entries.  It can be convenient to become
    // a slave at least for the zone your own domain is in.  Ask
    // your network administrator for the IP address of the responsible
    // master name server.
    //
    // Do not forget to include the reverse lookup zone!
    // This is named after the first bytes of the IP address, in reverse
    // order, with ".IN-ADDR.ARPA" appended, or ".IP6.ARPA" for IPv6.
    //
    // Before starting to set up a master zone, make sure you fully
    // understand how DNS and BIND work.  There are sometimes
    // non-obvious pitfalls.  Setting up a slave zone is usually simpler.
    //
    // NB: Don't blindly enable the examples below. :-)  Use actual names
    // and addresses instead.

    /* An example dynamic zone
    key "exampleorgkey" {
        algorithm hmac-md5;
        secret "sf87HJqjkqh8ac87a02lla==";
    };
    zone "example.org" {
        type master;
        allow-update {
            key "exampleorgkey";
        };
        file "/etc/named/dynamic/example.org";
    };
    */

    /* Example of a slave reverse zone
    zone "1.168.192.in-addr.arpa" {
        type slave;
        file "/etc/namedb/slave/1.168.192.in-addr.arpa";
        masters {
            192.168.1.1;
        };
    };
    */

Hierbei handelt es sich um Slave-Eintr?ge f?r eine Reverse- und
Forward-DNS-Zone, die in der Datei ``named.conf`` definiert sind.

F?r jede neue Zone muss ein zus?tzlicher Eintrag in ``named.conf``
erstellt werden.

Ein einfacher Eintrag f?r eine Zone ``example.org`` k?nnte
beispielsweise so aussehen:

.. code:: programlisting

    zone "example.org" {
            type master;
            file "master/example.org";
    };      

Die Option ``type`` legt fest, dass es sich um eine Master-Zone handelt,
deren Zoneninformationen sich in der Datei
``/etc/namedb/master/example.org`` befinden. Diese Datei wird durch die
Option ``file`` festgelegt.

.. code:: programlisting

    zone "example.org" {
            type slave;
            file "slave/example.org";
    };      

Hier handelt es sich um einen Slaveserver, der seine Informationen vom
Masterserver der betreffenden Zone bezieht und diese in der angegebenen
Datei speichert. Wenn der Masterserver nicht erreichbar ist, verf?gt der
Slaveserver ?ber die transferierten Zoneninformationen und kann diese an
andere Rechner weitergeben.

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

31.6.6.2. Zonendateien
^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die in der Datei ``/etc/namedb/master/example.org`` definierte
Zonendatei f?r ``example.org`` k?nnte etwa so aussehen:

.. code:: programlisting

    $TTL 3600        ; 1 hour default TTL
    example.org.    IN      SOA      ns1.example.org. admin.example.org. (
                                    2006051501      ; Serial
                                    10800           ; Refresh
                                    3600            ; Retry
                                    604800          ; Expire
                                    300             ; Negative Response TTL
                            )

    ; DNS Servers
                    IN      NS      ns1.example.org.
                    IN      NS      ns2.example.org.

    ; MX Records
                    IN      MX 10   mx.example.org.
                    IN      MX 20   mail.example.org.

                    IN      A       192.168.1.1

    ; Machine Names
    localhost       IN      A       127.0.0.1
    ns1             IN      A       192.168.1.2
    ns2             IN      A       192.168.1.3
    mx              IN      A       192.168.1.4
    mail            IN      A       192.168.1.5

    ; Aliases
    www             IN      CNAME   example.org.

Beachten Sie, dass jeder mit einem „.“ endende Rechnername ein exakter
Rechnername ist, w?hrend sich alles ohne einen abschlie?enden „.“
relativ auf den Ursprung bezieht. ``ns1`` steht daher beispielsweise f?r
``ns1.example.org.``.

Eine Zonendatei hat folgenden Aufbau:

.. code:: programlisting

    recordname      IN recordtype   value

Die am h?ufigsten verwendeten DNS-Eintr?ge sind:

.. raw:: html

   <div class="variablelist">

SOA
    Start der Zonenautorit?t

NS
    Ein autoritativer Nameserver

A
    Eine Rechneradresse

CNAME
    Der kanonische Name eines Alias

MX
    Mail Exchanger

PTR
    Ein (bei Reverse-DNS verwendeter) Domain Name Pointer

.. raw:: html

   </div>

.. code:: programlisting

    example.org. IN SOA ns1.example.org. admin.example.org. (
                            2006051501      ; Serial
                            10800           ; Refresh after 3 hours
                            3600            ; Retry after 1 hour
                            604800          ; Expire after 1 week
                            300 )           ; Negative Response TTL

.. raw:: html

   <div class="variablelist">

``example.org.``
    Der Name der Dom?ne und damit der Ursprung dieser Zonendatei.

``ns1.example.org.``
    Der prim?re/autoritative Nameserver dieser Zone.

``admin.example.org.``
    Die f?r diese Zone verantwortliche Person. Das Zeichen „@“ wird
    dabei ersetzt (``<admin@example.org>`` wird also zu
    ``admin.example.org``).

``2006051501``
    Die Seriennummer der Datei. Sie muss stets inkrementiert werden,
    wenn die Zonendatei ge?ndert wird. Viele Administratoren bevorzugen
    ein ``JJJJMMTTRR``-Format, um die Seriennummer festzulegen.
    ``2006051501`` steht also f?r den 15.05.2006, die beiden letzten
    Stellen f?r die erste Modifikation der Zonendatei an diesem Tag. Die
    Seriennummer ist von gro?er Bedeutung, da Slaveserver daran eine
    aktualisierte Zonendatei erkennen k?nnen.

.. raw:: html

   </div>

.. code:: programlisting

          IN NS           ns1.example.org.

Ein NS-Eintrag. Jeder Nameserver, der f?r eine Zone verantwortlich ist,
muss ?ber einen solchen Eintrag verf?gen.

.. code:: programlisting

          localhost       IN      A       127.0.0.1
          ns1             IN      A       192.168.1.2
          ns2             IN      A       192.168.1.3
          mx              IN      A       192.168.1.4
          mail            IN      A       192.168.1.5

Der Eintrag ``A`` bezieht sich auf Rechnernamen. ``ns1.example.org``
w?rde also zu ``192.168.1.2`` aufgel?st werden.

.. code:: programlisting

          IN      A       192.168.1.1

Diese Zeile weist die IP-Adresse ``192.168.1.1`` dem aktuellen Ursprung,
in unserem Fall also ``example.org``, zu.

.. code:: programlisting

          www             IN CNAME        @

Der Eintrag f?r den kanonischen Namen wird dazu verwendet, Aliase f?r
einen Rechner zu vergeben. Im Beispiel ist ``www`` ein Alias f?r den
„Master“-Rechner, dessen Name dem Domainnamen ``example.org`` (oder
``192.168.1.1``) entspricht. CNAMEs k?nnen daher niemals gleichzeitig
mit einem anderen Eintrag f?r denselben Hostname eingerichtet werden.

.. code:: programlisting

          IN MX   10      mail.example.org.

Die Option MX legt fest, welcher Mailserver f?r eintreffende Mails der
Zone verantwortlich ist. ``mail.example.org`` ist der Rechnername des
Mailservers, der eine Priorit?t von 10 hat.

Es k?nnen auch mehrere Mailserver mit verschiedener Priorit?t (10, 20,
...) vorhanden sein. Ein Mailserver, der eine Mail an ``example.org``
verschicken will, verwendet zuerst den MX mit der h?chsten Priorit?t
(das hei?t den mit der niedrigsten Priorit?tsnummer), danach den mit der
n?chsth?heren Priorit?t. Und dies solange, bis die E-Mail zugestellt
werden kann.

F?r (bei Reverse-DNS verwendete) ``in-addr.arpa``-Zonendateien wird das
gleiche Format verwendet. Der einzige Unterschied besteht in der
Verwendung der Option PTR an Stelle der Optionen A und CNAME.

.. code:: programlisting

    $TTL 3600

    1.168.192.in-addr.arpa. IN SOA ns1.example.org. admin.example.org. (
                            2006051501      ; Serial
                            10800           ; Refresh
                            3600            ; Retry
                            604800          ; Expire
                            300 )           ; Negative Response TTL

            IN      NS      ns1.example.org.
            IN      NS      ns2.example.org.

    1       IN      PTR     example.org.
    2       IN      PTR     ns1.example.org.
    3       IN      PTR     ns2.example.org.
    4       IN      PTR     mx.example.org.
    5       IN      PTR     mail.example.org.

Durch diese Datei werden den Rechnernamen der fiktiven Dom?ne
IP-Adressen zugewiesen.

Beachten Sie bitte, dass es sich bei allen Namen auf der rechten Seite
eines PTR-Eintrags um absolute (*fully qualified*) Domainnamen handeln
muss, die mit „.“ enden.

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

31.6.7. Zwischenspeichernde (cachende) Nameserver
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Ein cachender Nameserver hat prim?r die Aufgabe, rekursive Abfragen
aufzul?sen. Er stellt lediglich eigene Anfragen und speichert deren
Ergebnisse ab.

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

31.6.8. DNSSEC
~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Domain Name System Security Extensions, oder kurz DNSSEC, ist eine
Sammlung von Spezifikationen, um aufl?sende Nameserver von gef?lschten
DNS-Daten, wie beispielsweise vorget?uschte DNS-Eintr?ge, zu sch?tzen.
Durch die Verwendung von digitalen Signaturen kann ein Resolver die
Integrit?t des Eintrages ?berpr?fen. Wichtig dabei ist, dass DNSSEC nur
die Integrit?t ?ber digital signierte Resource Records (RRe)
bereitstellt. Weder wird die Vertraulichkeit noch der Schutz vor
falschen Annahmen des Endbenutzers sichergestellt. Dies bedeutet, dass
es Leute nicht davor sch?tzen kann, zu ``example.net`` anstatt zu
``example.com`` zu gelangen. Das einzige, was DNSSEC tut, ist die
Authentifizierung, dass die Daten w?hrend der ?bertragung nicht
ver?ndert wurden. Die Sicherheit von DNS ist ein wichtiger Schritt in
der generellen Absicherung des Internets. F?r weitere, tiefergehende
Details ?ber die Funktionsweise von DNSSEC sind die dazugeh?rigen RFCs
ein guter Einstieg in die Thematik. Sehen Sie sich dazu die Liste in
`Abschnitt?31.6.10, „Weitere
Informationsquellen“ <network-dns.html#dns-read>`__ an.

Der folgende Abschnitt wird zeigen, wie man DNSSEC f?r einen
autoritativen DNS-Server und einen rekursiven (oder cachenden)
DNS-Server, der jeweils BIND 9 verwenden, einrichten kann. Obwohl alle
Versionen von BIND 9 DNSSEC unterst?tzen, ist es notwendig, mindestens
die Version 9.6.2 zu verwenden, um in der Lage zu sein, die signierten
Root-Zonen zu benutzen, wenn DNS-Abfragen gepr?ft werden. Der Grund
daf?r ist, dass fr?heren Versionen die Algorithmen fehlen, um die
?berpr?fung des Root-Zonenschl?ssels zu aktivieren. Es wird dringend
empfohlen, die letzte Version von BIND 9.7 oder h?her einzusetzen, um
von den Vorteilen der automatischen Schl?sselaktualisierung des
Root-Zonenschl?ssels Gebrauch zu machen, genauso wie andere
Eigenschaften, um automatisch Zonen signieren zu lassen und Signaturen
aktuell zu halten. Unterschiede zwischen den Versionen 9.6.2 und 9.7 und
h?her werden an den betreffenden Stellen angesprochen.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

31.6.8.1. Rekursive DNS-Server Konfiguration
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Aktivierung der DNSSEC-?berpr?fung von Anfragen, die von einem
rekursiven DNS-Server stammen, ben?tigt ein paar ?nderungen in der
``named.conf``. Bevor man jedoch diese ?nderungen durchf?hrt, muss der
Root-Zonenschl?ssel oder Vertrauensanker erworben werden. Momentan ist
der Root-Zonenschl?ssel nicht in einem Dateiformat verf?gbar, dass von
BIND benutzt werden kann, so dass dieser manuell in das richtige Format
konvertiert werden muss. Der Schl?ssel selbst kann durch Abfrage an die
Root-Zone erhalten werden, indem man dazu dig verwendet. Durch Aufruf
von

.. code:: screen

    % dig +multi +noall +answer DNSKEY . > root.dnskey

wird der Schl?ssel in ``root.dnskey`` abgelegt. Der Inhalt sollte so
?hnlich wie folgt aussehen:

.. code:: programlisting

    . 93910 IN DNSKEY 257 3 8 (
        AwEAAagAIKlVZrpC6Ia7gEzahOR+9W29euxhJhVVLOyQ
        bSEW0O8gcCjFFVQUTf6v58fLjwBd0YI0EzrAcQqBGCzh
        /RStIoO8g0NfnfL2MTJRkxoXbfDaUeVPQuYEhg37NZWA
        JQ9VnMVDxP/VHL496M/QZxkjf5/Efucp2gaDX6RS6CXp
        oY68LsvPVjR0ZSwzz1apAzvN9dlzEheX7ICJBBtuA6G3
        LQpzW5hOA2hzCTMjJPJ8LbqF6dsV6DoBQzgul0sGIcGO
        Yl7OyQdXfZ57relSQageu+ipAdTTJ25AsRTAoub8ONGc
        LmqrAmRLKBP1dfwhYB4N7knNnulqQxA+Uk1ihz0=
        ) ; key id = 19036
    . 93910 IN DNSKEY 256 3 8 (
        AwEAAcaGQEA+OJmOzfzVfoYN249JId7gx+OZMbxy69Hf
        UyuGBbRN0+HuTOpBxxBCkNOL+EJB9qJxt+0FEY6ZUVjE
        g58sRr4ZQ6Iu6b1xTBKgc193zUARk4mmQ/PPGxn7Cn5V
        EGJ/1h6dNaiXuRHwR+7oWh7DnzkIJChcTqlFrXDW3tjt
    ) ; key id = 34525

Seien Sie nicht alarmiert, wenn der von Ihnen bezogene Schl?ssel anders
als in diesem Beispiel aussieht. Diese k?nnten sich in der Zwischenzeit
ge?ndert haben. In dieser Ausgabe sind eigentlich zwei Schl?ssel
enthalten. Der erste Sch?ssel mit dem Wert 257 nach dem DNSKEY-Eintrag
ist derjenige, der ben?tigt wird. Der Wert zeigt an, dass es sich um
einen sicheren Einstiegspunkt (SEP), gemein auch als
Schl?sselsignierungsschl?ssel (KSK) bekannt, handelt. Der zweite
Sch?ssel mit dem Wert 256 ist der untergeordnete Schl?ssel, im
allgemeinen auch als Zonen-Signaturschl?ssel (ZSK) bezeichnet. Weitere
Schl?sselarten werden sp?ter in `Abschnitt?31.6.8.2, „Autoritative
DNS-Server Konfiguration“ <network-dns.html#dns-dnssec-auth>`__
erl?utert.

Nun muss der Schl?ssel verifiziert und so formatiert werden, dass BIND
diesen verwenden kann. Um den Schl?ssel zu verifizieren, erzeugen Sie
einen DS RR-Satz. Erstellen Sie eine Datei, welche die RRs enth?lt,
mittels

.. code:: screen

    % dnssec-dsfromkey -f root-dnskey . > root.ds

Diese Eintr?ge verwenden SHA-1 sowie SHA-256 und sollten ?hnlich zu
folgendem Beispiel aussehen, in dem der l?ngere, SHA-256, benutzt wird.

.. code:: programlisting

    . IN DS 19036 8 1 B256BD09DC8DD59F0E0F0D8541B8328DD986DF6E
    . IN DS 19036 8 2 49AAC11D7B6F6446702E54A1607371607A1A41855200FD2CE1CDDE32F24E8FB5

Der SHA-256 RR kann nun mit dem Abriss in
https://data.iana.org/root-anchors/root-anchors.xml verglichen werden.
Um absolut sicher zu sein, dass der Schl?ssel nicht zusammen mit den
XML-Daten ver?ndert wurde, kann die Datei mittels der PGP Signatur in
https://data.iana.org/root-anchors/root-anchors.asc ?berpr?ft werden.

Als n?chstes muss der Schl?ssel in das passende Format gebracht werden.
Dies unterscheidet sich ein bisschen von den BIND Versionen 9.6.2 und
9.7 und h?here. In Version 9.7 wurde die ?nterst?tzung zur automatischen
Verfolgung und notwendigen Aktualisierung von ?nderungen am Schl?ssel
eingebaut. Dies wird durch den Einsatz von ``managed-keys`` erreicht,
wie in dem Beispiel unten gezeigt ist. Wenn die ?ltere Version
eingesetzt wird, kann der Schl?ssel durch eine
``trusted-keys``-Anweisung eingebaut werden und die Aktualisierung muss
h?ndisch erfolgen. In BIND 9.6.2 sollte das Format folgendermassen
aussehen:

.. code:: programlisting

    trusted-keys {
        "." 257 3 8
        "AwEAAagAIKlVZrpC6Ia7gEzahOR+9W29euxhJhVVLOyQbSEW0O8gcCjF
        FVQUTf6v58fLjwBd0YI0EzrAcQqBGCzh/RStIoO8g0NfnfL2MTJRkxoX
        bfDaUeVPQuYEhg37NZWAJQ9VnMVDxP/VHL496M/QZxkjf5/Efucp2gaD
        X6RS6CXpoY68LsvPVjR0ZSwzz1apAzvN9dlzEheX7ICJBBtuA6G3LQpz
        W5hOA2hzCTMjJPJ8LbqF6dsV6DoBQzgul0sGIcGOYl7OyQdXfZ57relS
        Qageu+ipAdTTJ25AsRTAoub8ONGcLmqrAmRLKBP1dfwhYB4N7knNnulq
        QxA+Uk1ihz0=";
    };

In 9.7 wird das Format stattdessen wie folgt aussehen:

.. code:: programlisting

    managed-keys {
        "." initial-key 257 3 8
        "AwEAAagAIKlVZrpC6Ia7gEzahOR+9W29euxhJhVVLOyQbSEW0O8gcCjF
        FVQUTf6v58fLjwBd0YI0EzrAcQqBGCzh/RStIoO8g0NfnfL2MTJRkxoX
        bfDaUeVPQuYEhg37NZWAJQ9VnMVDxP/VHL496M/QZxkjf5/Efucp2gaD
        X6RS6CXpoY68LsvPVjR0ZSwzz1apAzvN9dlzEheX7ICJBBtuA6G3LQpz
        W5hOA2hzCTMjJPJ8LbqF6dsV6DoBQzgul0sGIcGOYl7OyQdXfZ57relS
        Qageu+ipAdTTJ25AsRTAoub8ONGcLmqrAmRLKBP1dfwhYB4N7knNnulq
        QxA+Uk1ihz0=";
    };

Der Root-Schl?ssel kann nun zu ``named.conf`` hinzugef?gt werden,
entweder direkt oder durch Inkludierung der Datei, die den Schl?ssel
enth?lt. Nachdem diese Schritte absolviert sind, muss BIND konfiguriert
werden, um DNSSEC-Validierung f?r Anfragen durchzuf?hren, indem
``named.conf`` bearbeitet und die folgende ``options``-Direktive
hinzugef?gt wird:

.. code:: programlisting

    dnssec-enable yes;
    dnssec-validation yes;

Um zu pr?fen, dass es tats?chlich funktioniert, benutzen Sie dig, um
eine Anfrage zu einer signierten Zone durch den Resolver, der gerade
konfiguriert wurde, zu stellen. Eine erfolgreiche Antwort wird den
``AD``-Eintrag aufweisen, um anzudeuten, dass die Daten authentisiert
sind. Eine Anfrage wie

.. code:: screen

    % dig @resolver +dnssec se ds 

sollte den DS RR f?r die ``.se``-Zone zur?ckgeben. In dem Abschnitt
``flags:`` sollte der ``AD``-Eintrag gesetzt sein, wie im folgenden zu
sehen ist:

.. code:: programlisting

    ...
    ;; flags: qr rd ra ad; QUERY: 1, ANSWER: 3, AUTHORITY: 0, ADDITIONAL: 1
    ...

Der Resolver ist nun in der Lage, Anfragen ans DNS zu authentisieren.

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

31.6.8.2. Autoritative DNS-Server Konfiguration
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Um einen autoritativen Nameserver dazu zu bringen, als eine
DNSSEC-signierte Zone zu fungieren, ist ein wenig mehr Aufwand n?tig.
Eine Zone ist durch kryptographische Schl?ssel signiert, die erzeugt
werden m?ssen. Es ist m?glich, nur einen Schl?ssel dazu zu verwenden.
Die vorgeschlagene Methode ist jedoch, einen starken, gut gesch?tzten
Schl?sselsignierungsschl?ssel (KSK) einzusetzen, der nicht oft
gewechselt wird und einen Zonensignierungsschl?ssel (ZSK), der ?fter
ausgewechselt wird. Informationen zu vorgeschlagenen Einsatzarten k?nnen
in `RFC 4641: DNSSEC Operational
Practices <http://tools.ietf.org/rfc/rfc4641.txt>`__ nachgelesen werden.
Einsatzszenarien, welche die Root-Zone betreffen, finden Sie in `DNSSEC
Practice Statement for the Root Zone KSK
operator <http://www.root-dnssec.org/wp-content/uploads/2010/06/icann-dps-00.txt>`__
sowie `DNSSEC Practice Statement for the Root Zone ZSK
operator <http://www.root-dnssec.org/wp-content/uploads/2010/06/vrsn-dps-00.txt>`__.
Der KSK wird dazu verwendet, um eine Kette von Autorit?t f?r die Daten,
die diese Validierung ben?tigen, zu erschaffen und wird als solche auch
als sicherer Einstiegspunkt (SEP)-Schl?ssel bezeichnet. Ein
Nachrichtenabriss dieses Schl?ssels, der auch Delegation Signer
(DS)-Eintrag genannt wird, muss in der Elternzone ver?ffentlicht werden,
um die Vertrauenskette herzustellen. Wie dies erreicht wird, h?ngt von
dem Besitzer der Elternzone ab. Der ZSK wird verwendet, um die Zone zu
signieren und muss nur dort ?ffentlich zug?nglich gemacht werden.

Um DNSSEC f?r die ``example.com``-Zone, welche in den vorherigen
Beispielen verwendet wird, zu aktivieren, muss als erster Schritt
dnssec-keygen benutzt werden, um das KSK und ZSK Schl?sselpaar zu
generieren. Dieses Schl?sselpaar kann unterschiedliche kryptographische
Algorithmen nutzen. Es wird empfohlen, RSA/SHA256 f?r die Schl?ssel zu
nutzen. Eine Schl?ssell?nge von 2048 Bits sollte gen?gen. Um den KSK f?r
``example.com`` zu generieren, geben Sie

.. code:: screen

    % dnssec-keygen -f KSK -a RSASHA256 -b 2048 -n ZONE example.com

ein und um den ZSK zu erzeugen, setzen Sie folgenden Befehl ab:

.. code:: screen

    % dnssec-keygen -a RSASHA256 -b 2048 -n ZONE example.com

dnssec-keygen gibt zwei Dateien aus, den ?ffentlichen und den privaten
Schl?ssel und zwar in Dateinamen, die ?hnlich lauten wie
``Kexample.com.+005+nnnnn.key`` (?ffentlich) und
``Kexample.com.+005+nnnnn.private`` (privat). Der ``nnnnn``-Teil des
Dateinamens ist eine f?nfstellige Schl?sselkennung. Passen Sie genau
auf, welche Kennung zu welchem Schl?ssel geh?rt. Das ist besonders
wichtig, wenn mehrere Schl?ssel in einer Zone vorliegen. Es ist auch
m?glich, die Schl?ssel umzubenennen. F?r jede KSK-Datei tun Sie
folgendes:

.. code:: screen

    % mv Kexample.com.+005+nnnnn.key Kexample.com.+005+nnnnn.KSK.key
    % mv Kexample.com.+005+nnnnn.private Kexample.com.+005+nnnnn.KSK.private

F?r die ZSK-Dateien ersetzen Sie ``KSK`` f?r ``ZSK`` wenn n?tig. Die
Dateien k?nnen nun in der Zonendatei inkludiert werden, indem die
``$include`` Anweisung verwendet wird. Es sollte folgendermassen
aussehen:

.. code:: programlisting

    $include Kexample.com.+005+nnnnn.KSK.key    ; KSK
    $include Kexample.com.+005+nnnnn.ZSK.key    ; ZSK

Schliesslich signieren Sie die Zone und weisen BIND an, die signierte
Zonendatei zu benutzen. Um eine Zone zu signieren, wird dnssec-signzone
eingesetzt. Der Befehl, um eine Zone ``example.com`` zu signieren, die
in ``example.com.db`` liegt, sollte wie folgt aussehen:

.. code:: screen

    % dnssec-signzone -o example.com -k Kexample.com.+005+nnnnn.KSK example.com.db Kexample.com.+005+nnnnn.ZSK.key

Der Schl?ssel, welcher mit dem Argument ``-k`` ?bergeben wird, ist der
KSK und die andere Schl?sseldatei ist der ZSK, welcher f?r die Signatur
benutzt werden soll. Es ist m?glich, mehr als einen KSK und ZSK
anzugeben, was das Ergebnis zur Folge hat, dass die Zone mit allen
?bergebenen Schl?sseln signiert wird. Dies kann dann ben?tigt werden, um
Zonendaten mit mehr als einem Algorithmus zur Signierung zu verwenden.
Die Ausgabe von dnssec-signzone ist eine Zonendatei mit allen signierten
RRs. Diese Ausgabe wird in einer Datei mit der Endung ``.signed``
abgelegt, wie beispielsweise ``example.com.db.signed``. Die DS-Eintr?ge
werden ebenfalls in eine separate Datei ``dsset-example.com``
geschrieben. Um diese signierte Zone zu verwenden, ?ndern Sie die
Zonendirektive in ``named.conf``, so dass ``example.com.db.signed``
benutzt wird. Standardm?ssig sind die Signaturen nur 30 Tage g?ltig, was
bedeutet, dass die Zone in etwa 15 Tagen erneut signiert werden muss, um
sicher zu stellen, dass Resolver keine Eintr?ge mit veralteten
Signaturen zwischenspeichern. Es ist m?glich, ein Skript und einen
cron-Job zu schreiben, um dies zu erledigen. Lesen Sie dazu die
relevanten Anleitungen, um Details zu erfahren.

Stellen Sie sicher, dass die privaten Schl?ssel vertraulich bleiben,
genau wie mit allen anderen kryptographischen Schl?sseln auch. Wenn ein
Schl?ssel ge?ndert wird, ist es gute Praxis den neuen Schl?ssel in die
Zone zu inkludieren, noch w?hrend der alte Schl?ssel noch zum signieren
eingesetzt wird, um dann auf den neuen Schl?ssel zum signieren zu
wechseln. Nachdem diese Schritte erfolgt sind, kann der alte Schl?ssel
aus der Zone entfernt werden. Wenn das nicht geschieht, k?nnen DNS-Daten
f?r einige Zeit nicht verf?gbar sein, bis der neue Schl?ssel durch die
DNS-Hierarchie propagiert wurde. F?r weitere Informationen bez?glich
Schl?ssel?bergabe und andere DNSSEC-Einsatzszenarien lesen Sie `RFC
4641: DNSSEC Operational
practices <http://www.ietf.org/rfc/rfc4641.txt>`__.

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

31.6.8.3. Automatisierung mittels BIND 9.7 oder h?her
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Beginnend mit der Version 9.7 von BIND wurde eine neue Eigenschaft
vorgestellt, die *Smart Signing* genannt wird. Diese zielt darauf ab,
das Schl?sselmanagement und den Signierungsprozess einfacher zu
gestalten und zu automatisieren. Durch ablegen der Schl?ssel in ein
Verzeichnis, genannt *key repository* und die Verwendung der neuen
Option ``auto-dnssec``, ist es m?glich eine dynamische Zone zu erzeugen,
welche dann erneut signiert wird, wenn dazu der Bedarf besteht. Um diese
Zone zu aktualisieren, benutzen Sie nsupdate mit der neuen Option
``-l``. Es hat also rndc die F?higkeit gewonnen, Zonen mit Schl?sseln im
Key Repository zu verwenden, indem die Option ``sign`` eingesetzt wird.
Um BIND anzuweisen, diese automatische Signierung und
Zonenaktualisierung f?r ``example.com`` zu nutzen, f?gen Sie die
folgenden Zeilen zur ``named.conf`` hinzu:

.. code:: programlisting

    zone example.com {
        type master;
        key-directory "/etc/named/keys";
        update-policy local;
        auto-dnssec maintain;
        file "/etc/named/dynamic/example.com.zone";
    };

Nachdem diese ?nderungen durchgef?hrt wurden, erzeugen Sie die Schl?ssel
f?r die Zone wie in `Abschnitt?31.6.8.2, „Autoritative DNS-Server
Konfiguration“ <network-dns.html#dns-dnssec-auth>`__ beschrieben wird,
legen diese Schl?ssel im Key Repository ab, dass als Argument
``key-directory`` in der Zonenkonfiguration steht und die Zone wird
automatisch signiert. Aktualisierungen f?r eine Zone, die auf diese Art
und Weise konfiguriert wurde, muss mittels nsupdate erfolgen, dass sich
um die erneute Signierung der Zone mit den hinzugef?gten Daten k?mmern
wird. F?r weitere Details, lesen Sie `Abschnitt?31.6.10, „Weitere
Informationsquellen“ <network-dns.html#dns-read>`__ und die
Dokumentation von BIND.

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

31.6.9. Sicherheit
~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Obwohl BIND die am meisten verwendete (und kontrollierte)
Implementierung von DNS darstellt, werden dennoch manchmal neue
Sicherheitsprobleme entdeckt.

Zwar startet FreeBSD named automatisch in einer
`chroot(8) <http://www.FreeBSD.org/cgi/man.cgi?query=chroot&sektion=8>`__-Umgebung,
es gibt aber noch weitere Sicherheitsmechanismen, mit denen Sie
potentielle DNS-Serviceattacken erschweren k?nnen.

Es ist daher eine gute Idee, die Sicherheitshinweise von
`CERT <http://www.cert.org/>`__ zu lesen sowie die Mailingliste `FreeBSD
security
notifications <http://lists.FreeBSD.org/mailman/listinfo/freebsd-security-notifications>`__
zu abonnieren, um sich ?ber Sicherheitsprobleme im Zusammenhang mit dem
Internet und FreeBSD zu informieren.

.. raw:: html

   <div class="tip" xmlns="">

Tipp:
~~~~~

Tritt ein Problem auf, kann es nie schaden, die Quellen zu aktualisieren
und named neu zu kompilieren.

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

31.6.10. Weitere Informationsquellen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Hilfeseiten zu BIND/named:
`rndc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rndc&sektion=8>`__
`named(8) <http://www.FreeBSD.org/cgi/man.cgi?query=named&sektion=8>`__
`named.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=named.conf&sektion=5>`__
`nsupdate(1) <http://www.FreeBSD.org/cgi/man.cgi?query=nsupdate&sektion=1>`__
`dnssec-signzone(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dnssec-signzone&sektion=8>`__
`dnssec-keygen(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dnssec-keygen&sektion=8>`__

.. raw:: html

   <div class="itemizedlist">

-  `Offizielle ISC-Seite zu BIND <https://www.isc.org/software/bind>`__

-  `Offizielles Forum zu ISC-
   BIND <https://www.isc.org/software/guild>`__

-  `O'Reilly DNS and BIND 5th
   Edition <http://www.oreilly.com/catalog/dns5/>`__

-  `Root DNSSEC <http://www.root-dnssec.org/documentation/>`__

-  `DNSSEC Vertrauensanker-Publikation f?r die
   Root-Zone <http://data.iana.org/root-anchors/draft-icann-dnssec-trust-anchor.html>`__

-  `RFC1034 - Domain Names - Concepts and
   Facilities <http://tools.ietf.org/html/rfc1034>`__

-  `RFC1035 - Domain Names - Implementation and
   Specification <http://tools.ietf.org/html/rfc1035>`__

-  `RFC4033 - DNS Security Introduction and
   Requirements <http://tools.ietf.org/html/rfc4033>`__

-  `RFC4034 - Resource Records for the DNS Security
   Extensions <http://tools.ietf.org/html/rfc4034>`__

-  `RFC4035 - Protocol Modifications for the DNS Security
   Extensions <http://tools.ietf.org/html/rfc4035>`__

-  `RFC4641 - DNSSEC Operational
   Practices <http://tools.ietf.org/html/rfc4641>`__

-  `RFC 5011 - Automated Updates of DNS Security (DNSSEC) Trust
   Anchors <http://tools.ietf.org/html/rfc5011>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------------------+----------------------------------------+---------------------------------------+
| `Zur?ck <network-dhcp.html>`__?                      | `Nach oben <network-servers.html>`__   | ?\ `Weiter <network-apache.html>`__   |
+------------------------------------------------------+----------------------------------------+---------------------------------------+
| 31.5. Automatische Netzwerkkonfiguration mit DHCP?   | `Zum Anfang <index.html>`__            | ?31.7. Der Apache HTTP-Server         |
+------------------------------------------------------+----------------------------------------+---------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
