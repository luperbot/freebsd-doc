==============================
5.4. Benutzen des Paketsystems
==============================

.. raw:: html

   <div class="navheader">

5.4. Benutzen des Paketsystems
`Zur?ck <ports-finding-applications.html>`__?
Kapitel 5. Installieren von Anwendungen: Pakete und Ports
?\ `Weiter <ports-using.html>`__

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

5.4. Benutzen des Paketsystems
------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Beigesteuert von Chern Lee.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Es gibt viele unterschiedliche Werkzeuge um Pakete in FreeBSD zu
verwalten:

.. raw:: html

   <div class="itemizedlist">

-  Auf einem laufenden System kann ``sysinstall`` benutzt werden, um
   Pakete zu installieren, zu l?schen und verf?gbare und installierte
   anzuzeigen. Weitere Informationen finden Sie unter
   `Abschnitt?2.10.11, „Pakete
   installieren“ <install-post.html#packages>`__.

-  Die Paketverwaltungswerkzeuge der Kommandozeile sind die Themen von
   diesem Kapitel.

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

5.4.1. Installieren eines Pakets
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Mit
`pkg\_add(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_add&sektion=1>`__
k?nnen Sie ein FreeBSD-Paket von einer lokalen Datei oder ?ber das
Netzwerk installieren.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel 5.1. Download vor Installation eines Pakets

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    # ftp -a ftp2.FreeBSD.org
    Connected to ftp2.FreeBSD.org.
    220 ftp2.FreeBSD.org FTP server (Version 6.00LS) ready.
    331 Guest login ok, send your email address as password.
    230-
    230-     This machine is in Vienna, VA, USA, hosted by Verio.
    230-         Questions? E-mail freebsd@vienna.verio.net.
    230-
    230-
    230 Guest login ok, access restrictions apply.
    Remote system type is UNIX.
    Using binary mode to transfer files.
    ftp> cd /pub/FreeBSD/ports/packages/sysutils/
    250 CWD command successful.
    ftp> get lsof-4.56.4.tgz
    local: lsof-4.56.4.tgz remote: lsof-4.56.4.tgz
    200 PORT command successful.
    150 Opening BINARY mode data connection for 'lsof-4.56.4.tgz' (92375 bytes).
    100% |**************************************************| 92375       00:00 ETA
    226 Transfer complete.
    92375 bytes received in 5.60 seconds (16.11 KB/s)
    ftp> exit
    # pkg_add lsof-4.56.4.tgz

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn Sie die Pakete nicht lokal vorliegen haben (zum Beispiel auf den
FreeBSD-CD-ROMs), ist es wahrscheinlich einfacher den Schalter ``-r``
von
`pkg\_add(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_add&sektion=1>`__
zu verwenden. Das Werkzeug bestimmt dann automatisch das n?tige
Objektformat und die richtige Version des Pakets, l?dt dieses dann von
einem FTP-Server und installiert das Paket.

.. code:: screen

    # pkg_add -r lsof

Das obige Beispiel w?rde ohne weitere Interaktion das richtige Paket
herunterladen und installieren. Pakete werden vom FreeBSD-Hauptserver
heruntergeladen. Wenn Sie anderen Server verwenden m?chten, geben Sie
den Server in der Umgebungsvariablen ``PACKAGESITE`` an. Die Dateien
werden mit
`fetch(3) <http://www.FreeBSD.org/cgi/man.cgi?query=fetch&sektion=3>`__,
das Umgebungsvariablen wie ``FTP_PASSIVE_MODE``, ``FTP_PROXY`` und
``FTP_PASSWORD`` ber?cksichtigt, heruntergeladen. Wenn Sie durch eine
Firewall gesch?tzt werden, m?ssen Sie vielleicht eine oder mehrere
dieser Umgebungsvariablen setzen oder einen FTP oder HTTP Proxy
verwenden. Eine Liste der unterst?tzten Umgebungsvariablen finden Sie in
`fetch(3) <http://www.FreeBSD.org/cgi/man.cgi?query=fetch&sektion=3>`__.
Beachten Sie, dass im obigen Beispiel ``lsof`` anstelle von
``lsof-4.56.4`` verwendet wird. Wenn Sie
`pkg\_add(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_add&sektion=1>`__
zum Herunterladen eines Pakets verwenden, darf die Versionsnummer des
Pakets nicht angegeben werden, da automatisch die neuste Version der
Anwendung geholt wird.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Unter FreeBSD-CURRENT oder FreeBSD-STABLE holt
`pkg\_add(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_add&sektion=1>`__
die neuste Version einer Anwendung, unter einer Release holt
`pkg\_add(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_add&sektion=1>`__
die Version der Anwendung, die im Release enthalten ist. Sie k?nnen dies
?ndern, indem Sie die Umgebungsvariable ``PACKAGESITE`` ?berschreiben.
Wenn Sie bespielsweise FreeBSD?8.1-RELEASE installiert haben, versucht
`pkg\_add(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_add&sektion=1>`__
in der Voreinstellung die Pakete von
``ftp://ftp.freebsd.org/pub/FreeBSD/ports/i386/packages-8.1-release/Latest/``
zu laden. Wollen Sie
`pkg\_add(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_add&sektion=1>`__
dazu zwingen, nur FreeBSD?8-STABLE-Pakete herunterzuladen, setzen Sie
die Umgebungsvariable ``PACKAGESITE`` auf
``ftp://ftp.freebsd.org/pub/FreeBSD/ports/i386/packages-8-stable/Latest/``.

.. raw:: html

   </div>

Pakete werden im ``.tgz``- und ``.tbz``-Format ausgeliefert. Sie finden
Sie unter ``ftp://ftp.FreeBSD.org/pub/FreeBSD/ports/packages/`` oder auf
der FreeBSD-CD-ROM-Distribution. Jede CD der FreeBSD Distribution (oder
des PowerPaks) enth?lt Pakete im Verzeichnis ``/packages``. Die Struktur
des Paketbaums entspricht dem ``/usr/ports`` Baum. Jede Kategorie
besitzt ein eigenes Verzeichnis und alle Pakete befinden sich im
Verzeichnis ``All``.

Die Verzeichnisstruktur des Paketbaums ist ein Abbild der Ports, da
beide Systeme eng zusammenarbeiten.

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

5.4.2. Verwalten von Paketen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

`pkg\_info(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_info&sektion=1>`__
zeigt alle installierten Pakete und deren Beschreibung an.

.. code:: screen

    # pkg_info
    cvsup-16.1          A general network file distribution system optimized for CV
    docbook-1.2         Meta-port for the different versions of the DocBook DTD
    ...

`pkg\_version(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_version&sektion=1>`__
vergleicht die Version installierter Pakete mit der Version aus der
Ports-Sammlung.

.. code:: screen

    # pkg_version
    cvsup                       =
    docbook                     =
    ...

Die Symbole in der zweiten Spalte zeigen das Alter des Pakets im
Vergleich zu der lokalen Version aus der Ports-Sammlung an.

.. raw:: html

   <div class="informaltable">

+----------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Symbol   | Bedeutung                                                                                                                                                                                                                                               |
+==========+=========================================================================================================================================================================================================================================================+
| =        | Die Version des installierten Paketes stimmt mit der Version aus der lokalen Ports-Sammlung ?berein.                                                                                                                                                    |
+----------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| <        | Die installierte Version ist ?lter als die der verf?gbaren Version aus der Ports-Sammlung.                                                                                                                                                              |
+----------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| >        | Die installierte Version ist neuer als die aus der Ports-Sammlung (Eventuell ist die lokale Ports-Sammlung veraltet).                                                                                                                                   |
+----------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ?        | Das installierte Paket konnte in der Ports-Sammlung nicht gefunden werden. Das kann dadurch hervorgerufen werden, dass ein installierter Port aus der Ports-Sammlung entfernt wurde oder einen neuen Namen erhalten hat.                                |
+----------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| \*       | In der Ports-Sammlung befinden sich mehrere Versionen der Anwendung.                                                                                                                                                                                    |
+----------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| !        | Das installierte Paket ist zwar im Index enthalten, aus irgendeinem Grund war ``pkg_version`` aber dennoch nicht in der Lage, die Versionsnummer des installierten Pakets mit der Versionsnummer des entsprechenden Eintrags im Index zu vergleichen.   |
+----------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

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

5.4.3. Entfernen eines Pakets
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Um ein zuvor installiertes Paket zu entfernen, benutzen Sie das Werkzeug
`pkg\_delete(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_delete&sektion=1>`__.

.. code:: screen

    # pkg_delete xchat-1.7.1

Beachten Sie, dass
`pkg\_delete(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_delete&sektion=1>`__
die vollst?ndige Bezeichnung des Pakets ben?tigt (also Paketname *und*
Versionsnummer). Die Eingabe von *``xchat``* (anstelle von
*``xchat-1.7.1``*) ist daher nicht ausreichend. Zwar k?nnen Sie die
Versionsnummer eines installierten Pakets mit
`pkg\_version(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_version&sektion=1>`__
herausfinden, es ist aber auch m?glich, ein Paket zu deinstallieren,
ohne die exakte Versionsnummer zu kennen, wenn Sie Wildcards einsetzen:

.. code:: screen

    # pkg_delete xchat\*

In diesem Beispiel werden alle Pakete gel?scht, deren Name mit ``xchat``
beginnt.

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

5.4.4. Verschiedenes
~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Informationen ?ber alle installierte Pakete werden in ``/var/db/pkg``
abgelegt. Das Verzeichnis enth?lt Dateien, in denen sich die
Beschreibungen der Pakete und Listen von Dateien, die zu einem Paket
geh?ren, befinden.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------------------+-------------------------------+-------------------------------------+
| `Zur?ck <ports-finding-applications.html>`__?   | `Nach oben <ports.html>`__    | ?\ `Weiter <ports-using.html>`__    |
+-------------------------------------------------+-------------------------------+-------------------------------------+
| 5.3. Suchen einer Anwendung?                    | `Zum Anfang <index.html>`__   | ?5.5. Benutzen der Ports-Sammlung   |
+-------------------------------------------------+-------------------------------+-------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
