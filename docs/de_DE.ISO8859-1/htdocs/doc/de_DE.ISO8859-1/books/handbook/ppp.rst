================
29.3. Kernel-PPP
================

.. raw:: html

   <div class="navheader">

29.3. Kernel-PPP
`Zur?ck <userppp.html>`__?
Kapitel 29. PPP und SLIP
?\ `Weiter <ppp-troubleshoot.html>`__

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

29.3. Kernel-PPP
----------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Teile wurden urspr?nglich beigetragen von Gennady B. Sorokopud und
Robert Huff.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="warning" xmlns="">

Warnung:
~~~~~~~~

Der folgende Abschnitt ist ausschlie?lich f?r FreeBSD?7.X relevant und
g?ltig.

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

29.3.1. Einrichtung von Kernel-PPP
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Bevor Sie PPP auf Ihrem Computer einrichten, sollten Sie daf?r sorgen,
dass ``pppd`` im Verzeichnis ``/usr/sbin`` vorhanden ist und
``/etc/ppp`` existiert.

``pppd`` kann auf zweierlei Weise arbeiten:

.. raw:: html

   <div class="orderedlist">

#. Als „Client“ – Sie m?chten Ihren Rechner mit einem Netz verbinden,
   indem Sie eine serielle PPP-Verbindung aufbauen.

#. Als „Server“ – Ihr Rechner ist in ein Netzwerk eingebunden und stellt
   die PPP-Verbindung f?r andere Rechner im Netzwerk her.

.. raw:: html

   </div>

In beiden F?llen werden Sie eine Datei mit den ben?tigten Optionen
erstellen m?ssen (``/etc/ppp/options`` oder, wenn mehr als ein Benutzer
PPP verwendet, ``~/.ppprc``).

Sie ben?tigen au?erdem eine Software (vorzugsweise
`comms/kermit <http://www.freebsd.org/cgi/url.cgi?ports/comms/kermit/pkg-descr>`__),
mit der Sie seriell per Modem w?hlen und eine Verbindung zu dem
entfernten Host aufbauen k?nnen.

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

29.3.2. Verwendung von ``pppd`` als Client
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div>

Basierend auf Informationen von Trev Roydhouse.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die folgende Datei ``/etc/ppp/options`` kann f?r einen Verbindungsaufbau
mit PPP zu einem Cisco Terminalserver verwendet werden.

.. code:: programlisting

    crtscts         # enable hardware flow control
    modem           # modem control line
    noipdefault     # remote PPP server must supply your IP address
                    # if the remote host does not send your IP during IPCP
                    # negotiation, remove this option
    passive         # wait for LCP packets
    domain ppp.foo.com      # put your domain name here

    :remote_ip      # put the IP of remote PPP host here
                    # it will be used to route packets via PPP link
                    # if you didn't specified the noipdefault option
                    # change this line to local_ip:remote_ip

    defaultroute    # put this if you want that PPP server will be your
                    # default router

Um eine Verbindung herzustellen, sollten Sie:

.. raw:: html

   <div class="procedure">

#. Mit Kermit (oder einem anderen Modemprogramm) den entfernten Host
   anw?hlen und Ihren Benutzernamen sowie Ihr Passwort (oder was sonst
   n?tig ist, um PPP auf dem entfernten Host zu aktivieren) eingeben.

#. Kermit beenden (ohne die Verbindung abzubrechen).

#. Folgendes eingeben:

   .. code:: screen

       # /usr/sbin/pppd /dev/tty01 19200

   Achten Sie darauf, dass sie eine geeignete Geschwindigkeit w?hlen und
   das richtige Device verwenden.

.. raw:: html

   </div>

Nun ist Ihr Computer mit Hilfe von PPP verbunden. Wenn die Verbindung
nicht funktionieren sollte, k?nnen Sie die Option ``debug`` in die Datei
``/etc/ppp/options`` eintragen und die Ausgaben auf der Konsole
beobachten, um die Fehler zu finden.

Das folgende Skript ``/etc/ppp/pppup`` f?hrt alle 3 Schritte automatisch
aus:

.. code:: programlisting

    #!/bin/sh
    pgrep -l pppd
    pid=`pgrep pppd`
    if [ "X${pid}" != "X" ] ; then
            echo 'killing pppd, PID=' ${pid}
            kill ${pid}
    fi
    pgrep -l kermit
    pid=`pgrep kermit`
    if [ "X${pid}" != "X" ] ; then
            echo 'killing kermit, PID=' ${pid}
            kill -9 ${pid}
    fi

    ifconfig ppp0 down
    ifconfig ppp0 delete

    kermit -y /etc/ppp/kermit.dial
    pppd /dev/tty01 19200

``/etc/ppp/kermit.dial`` ist ein Kermit-Skript das den Einw?hlvorgang
und alle notwendigen Autorisationen auf dem entfernten Host durchf?hrt
(ein Beispiel f?r ein solches Skript ist im Anhang zu diesem Dokument zu
finden).

Verwenden Sie das folgende Skript ``/etc/ppp/pppdown``, um die
PPP-Verbindung abzubrechen:

.. code:: programlisting

    #!/bin/sh
    pid=`pgrep pppd`
    if [ X${pid} != "X" ] ; then
            echo 'killing pppd, PID=' ${pid}
            kill -TERM ${pid}
    fi

    pgrep -l kermit
    pid=`pgrep kermit`
    if [ "X${pid}" != "X" ] ; then
            echo 'killing kermit, PID=' ${pid}
            kill -9 ${pid}
    fi

    /sbin/ifconfig ppp0 down
    /sbin/ifconfig ppp0 delete
    kermit -y /etc/ppp/kermit.hup
    /etc/ppp/ppptest

Pr?fen Sie, ob pppd immer noch l?uft, indem Sie ``/usr/etc/ppp/ppptest``
ausf?hren. Dieses Skript sollte folgenderma?en aussehen:

.. code:: programlisting

    #!/bin/sh
    pid=`pgrep pppd`
    if [ X${pid} != "X" ] ; then
            echo 'pppd running: PID=' ${pid-NONE}
    else
            echo 'No pppd running.'
    fi
    set -x
    netstat -n -I ppp0
    ifconfig ppp0

Um die Modemverbindung abzubrechen, k?nnen Sie das Skript
``/etc/ppp/kermit.hup`` verwenden, das Folgendes enthalten sollte:

.. code:: programlisting

    set line /dev/tty01    ; put your modem device here
    set speed 19200
    set file type binary
    set file names literal
    set win 8
    set rec pack 1024
    set send pack 1024
    set block 3
    set term bytesize 8
    set command bytesize 8
    set flow none

    pau 1
    out +++
    inp 5 OK
    out ATH0\13
    echo \13
    exit

Hier ist eine alternative Methode, bei der ``chat`` an Stelle von Kermit
eingesetzt wird:

Die folgenden beiden Dateien reichen aus, um eine Verbindung ?ber
``pppd`` herzustellen.

``/etc/ppp/options``:

.. code:: programlisting

    /dev/cuad1 115200

    crtscts     # enable hardware flow control
    modem       # modem control line
    connect "/usr/bin/chat -f /etc/ppp/login.chat.script"
    noipdefault # remote PPP serve must supply your IP address
                # if the remote host doesn't send your IP during
                    # IPCP negotiation, remove this option
    passive         # wait for LCP packets
    domain <your.domain>  # put your domain name here

    :       # put the IP of remote PPP host here
                # it will be used to route packets via PPP link
                    # if you didn't specified the noipdefault option
                    # change this line to local_ip:remote_ip;

    defaultroute    # put this if you want that PPP server will be
                # your default router

``/etc/ppp/login.chat.script``:

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Die folgenden Angaben sollten in einer Zeile stehen.

.. raw:: html

   </div>

.. code:: programlisting

    ABORT BUSY ABORT 'NO CARRIER' "" AT OK ATDTphone.number
      CONNECT "" TIMEOUT 10 ogin:-\\r-ogin: login-id
      TIMEOUT 5 sword: password

Wenn diese Dateien richtig installiert und modifiziert sind, m?ssen Sie
``pppd``, nur noch wie folgt starten:

.. code:: screen

    # pppd

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

29.3.3. Verwendung von ``pppd`` als Server
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``/etc/ppp/options`` sollte etwa Folgendes enthalten:

.. code:: programlisting

    crtscts                         # Hardware flow control
    netmask 255.255.255.0           # netmask (not required)
    192.114.208.20:192.114.208.165  # IP's of local and remote hosts
                                    # local ip must be different from one
                                    # you assigned to the Ethernet (or other)
                                    # interface on your machine.
                                    # remote IP is IP address that will be
                                    # assigned to the remote machine
    domain ppp.foo.com              # your domain
    passive                         # wait for LCP
    modem                           # modem line

Das folgende Skript ``/etc/ppp/pppserv`` l?sst pppd als Server zu
arbeiten:

.. code:: programlisting

    #!/bin/sh
    pgrep -l pppd
    pid=`pgrep pppd`
    if [ "X${pid}" != "X" ] ; then
            echo 'killing pppd, PID=' ${pid}
            kill ${pid}
    fi
    pgrep -l kermit
    pid=`pgrep kermit`
    if [ "X${pid}" != "X" ] ; then
            echo 'killing kermit, PID=' ${pid}
            kill -9 ${pid}
    fi

    # reset ppp interface
    ifconfig ppp0 down
    ifconfig ppp0 delete

    # enable autoanswer mode
    kermit -y /etc/ppp/kermit.ans

    # run ppp
    pppd /dev/tty01 19200

Verwenden Sie das Skript\ ``/etc/ppp/pppservdown``, um den Server zu
beenden:

.. code:: programlisting

    #!/bin/sh
    pgrep -l pppd
    pid=`pgrep pppd`
    if [ "X${pid}" != "X" ] ; then
            echo 'killing pppd, PID=' ${pid}
            kill ${pid}
    fi
    pgrep -l kermit
    pid=`pgrep kermit`
    if [ "X${pid}" != "X" ] ; then
            echo 'killing kermit, PID=' ${pid}
            kill -9 ${pid}
    fi
    ifconfig ppp0 down
    ifconfig ppp0 delete

    kermit -y /etc/ppp/kermit.noans

Mit dem Kermit-Skript (``/etc/ppp/kermit.ans``) l?sst sich die Funktion
Ihres Modems, automatisch zu antworten, ein- bzw. ausschalten. Es sollte
folgenderma?en aussehen:

.. code:: programlisting

    set line /dev/tty01
    set speed 19200
    set file type binary
    set file names literal
    set win 8
    set rec pack 1024
    set send pack 1024
    set block 3
    set term bytesize 8
    set command bytesize 8
    set flow none

    pau 1
    out +++
    inp 5 OK
    out ATH0\13
    inp 5 OK
    echo \13
    out ATS0=1\13   ; change this to out ATS0=0\13 if you want to disable
                    ; autoanswer mode
    inp 5 OK
    echo \13
    exit

Ein Skript namens ``/etc/ppp/kermit.dial`` wird f?r die Einwahl und
Authentifizierung am entfernten Host verwendet. Sie m?ssen es noch an
Ihre lokalen Gegebenheiten anpassen. Geben Sie in diesem Skript Ihren
Benutzernamen und Ihr Passwort ein. In Abh?ngigkeit von der Reaktion
Ihres Modems und des entfernten Hosts, werden Sie auch noch die
``input`` Anweisungen ver?ndern m?ssen.

.. code:: programlisting

    ;
    ; put the com line attached to the modem here:
    ;
    set line /dev/tty01
    ;
    ; put the modem speed here:
    ;
    set speed 19200
    set file type binary            ; full 8 bit file xfer
    set file names literal
    set win 8
    set rec pack 1024
    set send pack 1024
    set block 3
    set term bytesize 8
    set command bytesize 8
    set flow none
    set modem hayes
    set dial hangup off
    set carrier auto                ; Then SET CARRIER if necessary,
    set dial display on             ; Then SET DIAL if necessary,
    set input echo on
    set input timeout proceed
    set input case ignore
    def \%x 0                       ; login prompt counter
    goto slhup

    :slcmd                          ; put the modem in command mode
    echo Put the modem in command mode.
    clear                           ; Clear unread characters from input buffer
    pause 1
    output +++                      ; hayes escape sequence
    input 1 OK\13\10                ; wait for OK
    if success goto slhup
    output \13
    pause 1
    output at\13
    input 1 OK\13\10
    if fail goto slcmd              ; if modem doesn't answer OK, try again

    :slhup                          ; hang up the phone
    clear                           ; Clear unread characters from input buffer
    pause 1
    echo Hanging up the phone.
    output ath0\13                  ; hayes command for on hook
    input 2 OK\13\10
    if fail goto slcmd              ; if no OK answer, put modem in command mode

    :sldial                         ; dial the number
    pause 1
    echo Dialing.
    output atdt9,550311\13\10               ; put phone number here
    assign \%x 0                    ; zero the time counter

    :look
    clear                           ; Clear unread characters from input buffer
    increment \%x                   ; Count the seconds
    input 1 {CONNECT }
    if success goto sllogin
    reinput 1 {NO CARRIER\13\10}
    if success goto sldial
    reinput 1 {NO DIALTONE\13\10}
    if success goto slnodial
    reinput 1 {\255}
    if success goto slhup
    reinput 1 {\127}
    if success goto slhup
    if < \%x 60 goto look
    else goto slhup

    :sllogin                        ; login
    assign \%x 0                    ; zero the time counter
    pause 1
    echo Looking for login prompt.

    :slloop
    increment \%x                   ; Count the seconds
    clear                           ; Clear unread characters from input buffer
    output \13
    ;
    ; put your expected login prompt here:
    ;
    input 1 {Username: }
    if success goto sluid
    reinput 1 {\255}
    if success goto slhup
    reinput 1 {\127}
    if success goto slhup
    if < \%x 10 goto slloop         ; try 10 times to get a login prompt
    else goto slhup                 ; hang up and start again if 10 failures

    :sluid
    ;
    ; put your userid here:
    ;
    output ppp-login\13
    input 1 {Password: }
    ;
    ; put your password here:
    ;
    output ppp-password\13
    input 1 {Entering SLIP mode.}
    echo
    quit

    :slnodial
    echo \7No dialtone.  Check the telephone line!\7
    exit 1

    ; local variables:
    ; mode: csh
    ; comment-start: "; "
    ; comment-start-skip: "; "
    ; end:

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------+-------------------------------------+-----------------------------------------+
| `Zur?ck <userppp.html>`__?   | `Nach oben <ppp-and-slip.html>`__   | ?\ `Weiter <ppp-troubleshoot.html>`__   |
+------------------------------+-------------------------------------+-----------------------------------------+
| 29.2. User-PPP?              | `Zum Anfang <index.html>`__         | ?29.4. Probleme bei PPP-Verbindungen    |
+------------------------------+-------------------------------------+-----------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
