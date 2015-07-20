======================================
4. Konfiguration: Installation & Setup
======================================

.. raw:: html

   <div class="navheader">

4. Konfiguration: Installation & Setup
`Zur?ck <prerequisites.html>`__?
?
?\ `Weiter <build.html>`__

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

4. Konfiguration: Installation & Setup
--------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Laden Sie
die\ `freebsd-update-server <http://svnweb.freebsd.org/base/user/cperciva/freebsd-update-build/>`__
Software durch die Installation von
`devel/subversion <http://www.freebsd.org/cgi/url.cgi?ports/devel/subversion%20/pkg-descr>`__,
und starten Sie:

.. code:: screen

    % svn co http://svn.freebsd.org/base/user/cperciva/freebsd-update-build freebsd-update-server

Passen Sie ``scripts/build.conf`` an Ihre Bed?rfnisse an. Diese Datei
wird bei jedem Bau mit einbezogen.

Hier ist die Standardeinstellung f?r ``build.conf``, welche Sie f?r Ihre
Umgebung anpassen sollten.

.. raw:: html

   <div class="informalexample">

.. code:: programlisting


    # Main configuration file for FreeBSD Update builds.  The
    # release-specific configuration data is lower down in
    # the scripts tree.

    # Location from which to fetch releases
    export FTP=ftp://ftp2.freebsd.org/pub/FreeBSD/releases

    # Host platform
    export HOSTPLATFORM=`uname -m`

    # Host name to use inside jails
    export BUILDHOSTNAME=${HOSTPLATFORM}-builder.daemonology.net

    # Location of SSH key
    export SSHKEY=/root/.ssh/id_dsa

    # SSH account into which files are uploaded
    MASTERACCT=builder@wadham.daemonology.net

    # Directory into which files are uploaded
    MASTERDIR=update-master.freebsd.org

.. raw:: html

   </div>

Parameter, die zu ber?cksichtigen sind:

.. raw:: html

   <div class="calloutlist">

+--------------------------------------+--------------------------------------+
| `|1| <#ftp-id>`__                    | Dies ist der Ort, von dem die ISO    |
|                                      | Abbilder (?ber die ``fetchiso()`` in |
|                                      | ``scripts/build.subr``)              |
|                                      | heruntergeladen werden. Der Ort ist  |
|                                      | nicht auf FTP URIs beschr?nkt. Jedes |
|                                      | URI-Schema, welches von              |
|                                      | `fetch(1) <http://www.FreeBSD.org/cg |
|                                      | i/man.cgi?query=fetch&sektion=1>`__  |
|                                      | unterst?tzt wird, sollte hier gut    |
|                                      | funktionieren.                       |
|                                      |                                      |
|                                      | Anpassungen am ``fetchiso()`` Code   |
|                                      | k?nnen Sie vornehmen, indem Sie das  |
|                                      | Standardskript ``build.subr`` in den |
|                                      | Release- und                         |
|                                      | Architektur-spezifischen Bereich in  |
|                                      | ``scripts/RELEASE/ARCHITECTURE/build |
|                                      | .subr``                              |
|                                      | kopieren und dort lokale ?nderungen  |
|                                      | vornehmen.                           |
+--------------------------------------+--------------------------------------+
| `|2| <#buildhost-id>`__              | Der Name des Build-Hosts. Auf        |
|                                      | aktualisierten Systemen k?nnen Sie   |
|                                      | diese Information wie folgt          |
|                                      | ausgeben:                            |
|                                      |                                      |
|                                      | .. code:: screen                     |
|                                      |                                      |
|                                      |     % uname -v                       |
+--------------------------------------+--------------------------------------+
| `|3| <#sshkey-id>`__                 | Der SSH Schl?ssel f?r das Hochladen  |
|                                      | der Dateien auf den Update Server.   |
|                                      | Ein Schl?sselpaar kann durch die     |
|                                      | Eingabe von ``ssh-keygen -t dsa``    |
|                                      | erstellt werden. Dieser Parameter    |
|                                      | ist jedoch optional; Standard        |
|                                      | Password Authentifizierung wird als  |
|                                      | Fallback-Methode benutzt wenn        |
|                                      | ``SSHKEY`` nicht definiert ist.      |
|                                      |                                      |
|                                      | Die                                  |
|                                      | `ssh-keygen(1) <http://www.FreeBSD.o |
|                                      | rg/cgi/man.cgi?query=ssh-keygen&sekt |
|                                      | ion=1>`__                            |
|                                      | Manualpage enth?lt detaillierte      |
|                                      | Informationen zu SSH und die         |
|                                      | entsprechenden Schritte zur          |
|                                      | Erstellung und Verwendung von        |
|                                      | Schl?sseln.                          |
+--------------------------------------+--------------------------------------+
| `|4| <#mstacct-id>`__                | Benutzerkonto zum Hochladen von      |
|                                      | Dateien auf den Update-Server.       |
+--------------------------------------+--------------------------------------+
| `|5| <#mstdir-id>`__                 | Verzeichnis auf dem Update-Server,   |
|                                      | in welches die Dateien hochgeladen   |
|                                      | werden.                              |
+--------------------------------------+--------------------------------------+

.. raw:: html

   </div>

Die Standard ``build.conf``, die mit den freebsd-update-server Quellen
ausgeliefert wird ist geeignet um i386 Releases von FreeBSD zu bauen.
Als Beispiel f?r den Aufbau eines Update-Servers f?r andere
Architekturen beschreiben die folgenden Schritte die Konfiguration f?r
amd64:

.. raw:: html

   <div class="procedure">

#. Erstellen Sie eine Bau-Umgebung f?r amd64:

   .. raw:: html

      <div class="informalexample">

   .. code:: screen

       % mkdir -p /usr/local/freebsd-update-server/scripts/7.2-RELEASE/amd64

   .. raw:: html

      </div>

#. Installieren Sie eine ``build.conf`` in das neu erstellte
   Verzeichnis. Die Konfigurationsoptionen f?r FreeBSD 7.2-RELEASE auf
   amd64 sollten ?hnlich wie die folgenden sein:

   .. raw:: html

      <div class="informalexample">

   .. code:: programlisting

       # SHA256 hash of RELEASE disc1.iso image.
       export RELH=1ea1f6f652d7c5f5eab7ef9f8edbed50cb664b08ed761850f95f48e86cc71ef5

       # Components of the world, source, and kernels
       export WORLDPARTS="base catpages dict doc games info manpages proflibs lib32"
       export SOURCEPARTS="base bin contrib crypto etc games gnu include krb5  \
                       lib libexec release rescue sbin secure share sys tools  \
                       ubin usbin cddl"
       export KERNELPARTS="generic"

       # EOL date
       export EOL=1275289200

   .. raw:: html

      </div>

   .. raw:: html

      <div class="calloutlist">

   +--------------------------------------+--------------------------------------+
   | `|1| <#sha256-id>`__                 | Der                                  |
   |                                      | `sha256(1) <http://www.FreeBSD.org/c |
   |                                      | gi/man.cgi?query=sha256&sektion=1>`_ |
   |                                      | _                                    |
   |                                      | Fingerabdruck f?r die gew?nschte     |
   |                                      | Version wird innerhalb der           |
   |                                      | jeweiligen                           |
   |                                      | `Release-Ank?ndigung <../../../../re |
   |                                      | leases/>`__                          |
   |                                      | ver?ffentlicht.                      |
   +--------------------------------------+--------------------------------------+
   | `|2| <#eol-id>`__                    | Um die "End of Life" Nummer f?r die  |
   |                                      | ``build.conf``\ zu generieren,       |
   |                                      | beziehen Sie sich bitte auf          |
   |                                      | "Estimated EOL" auf der `FreeBSD     |
   |                                      | Security                             |
   |                                      | Webseite <../../../../security/secur |
   |                                      | ity.html>`__.                        |
   |                                      | Der Wert f?r ``EOL`` kann aus dem    |
   |                                      | Datum, das auf der Webseite          |
   |                                      | ver?ffentlicht ist, abgeleitet       |
   |                                      | werden. Benutzen Sie daf?r das       |
   |                                      | Werkzeug                             |
   |                                      | `date(1) <http://www.FreeBSD.org/cgi |
   |                                      | /man.cgi?query=date&sektion=1>`__.   |
   |                                      | Dazu ein Beispiel:                   |
   |                                      |                                      |
   |                                      | .. code:: screen                     |
   |                                      |                                      |
   |                                      |     % date -j -f '%Y%m%d-%H%M%S' '20 |
   |                                      | 090401-000000' '+%s'                 |
   +--------------------------------------+--------------------------------------+

   .. raw:: html

      </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------+-------------------------------+------------------------------+
| `Zur?ck <prerequisites.html>`__?   | ?                             | ?\ `Weiter <build.html>`__   |
+------------------------------------+-------------------------------+------------------------------+
| 3. Voraussetzungen?                | `Zum Anfang <index.html>`__   | ?5. Den Update Code bauen    |
+------------------------------------+-------------------------------+------------------------------+

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
