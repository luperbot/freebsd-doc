=======================
10.7. Problembehandlung
=======================

.. raw:: html

   <div class="navheader">

10.7. Problembehandlung
`Zur?ck <printing-lpd-alternatives.html>`__?
Kapitel 10. Drucken
?\ `Weiter <linuxemu.html>`__

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

10.7. Problembehandlung
-----------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn Sie eine einfache Testseite mit
`lptest(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lptest&sektion=1>`__
gedruckt haben, k?nnte eines der folgenden Probleme aufgetreten sein:

.. raw:: html

   <div class="variablelist">

Der Druck hat erst mit einer gewissen Verz?gerung geklappt oder das
bedruckte Blatt verblieb im Drucker, so als w?re der Druckvorgang noch
nicht abgeschlossen.
    Die Testseite wurde zwar gedruckt, danach tat sich allerdings nichts
    mehr. Vielleicht mussten Sie sogar eine Taste Ihres Druckers, etwa
    PRINT REMAINING oder FORM FEED dr?cken, damit der Druckvorgang
    fortgesetzt wurde.

    Wenn das der Fall ist, hat der Drucker vermutlich vor dem
    eigentlichen Drucken gewartet, ob noch weitere Daten f?r Ihren
    Druckauftrag gesendet werden. Um dieses Problem zu beheben, k?nnen
    Sie den Textfilter anweisen, ein *Form Feed* -Zeichen (oder ein
    anderes entsprechendes Zeichen) an den Drucker zu senden. Dies
    reicht f?r gew?hnlich aus, um den Drucker zum Druck des noch im
    internen Puffer verbliebenen Textes zu bewegen. Dadurch kann auch
    sichergestellt werden, dass jeder neue Druckauftrag auf einer neuen
    Seite beginnt.

    Der folgende Ersatz f?r das Shell-Skript
    ``/usr/local/libexec/if-simple`` gibt ein „Form Feed“ aus, nachdem
    der Auftrag an den Drucker geschickt wurde:

    .. code:: programlisting

        #!/bin/sh
        #
        # if-simple - Einfacher Eingabefilter f?r lpd
        # Installiert unter /usr/local/libexec/if-simple
        #
        # Kopiert stdin einfach nach stdout. Ignoriert alle Filter-Argumente.
        # Schreibt ein Form-Feed-Zeichen (\f) nach dem Ende des Druckauftrages.

        /bin/cat && printf "\f" && exit 0
        exit 2

Der Drucker erzeugte einen „Treppeneffekt“ (*staircase effect*).
    Sie haben einen Ausdruck ?hnlich dem folgenden erhalten:

    .. code:: screen

        !"#$%&'()*+,-./01234
                        "#$%&'()*+,-./012345
                                         #$%&'()*+,-./0123456

    Sie sind zu einem weiteren Opfer des *Treppeneffekts* geworden.
    Verursacht wird dieser Effekt durch unterschiedliche Ansichten
    dar?ber, welche Zeichen den Beginn einer neuen Zeile anzeigen
    sollen. UNIX?-?hnliche Betriebssysteme verwenden daf?r ein einzelnes
    Zeichen: ASCII-Code 10, auch als *Line Feed* (LF) bekannt. MS-DOS?,
    OS/2? und andere Betriebssysteme verwenden stattdessen ein
    Zeichenpaar: ASCII-Code 10 *und* ASCII-Code 13, *Carriage Return*
    (CR). Viele Drucker verwenden in der Voreinstellung die Konvention
    von MS-DOS?, um Zeilenumbr?che darzustellen.

    Wenn Sie unter FreeBSD drucken, wird nur das Zeichen *Line Feed*
    verwendet. Der Drucker erkennt dieses Zeichen und erweitert den
    Druckbereich um eine Zeile, verbleibt zum Druck des n?chsten
    Zeichens aber in derselben horizontalen Position. Das ist der Grund
    f?r die Verwendung des *Carriage Return*: Es setzt die Position f?r
    das folgende Zeichen auf den linken Rand der Seite.

    FreeBSD erwartet von einem Drucker das folgende Verhalten:

    .. raw:: html

       <div class="informaltable">

    +-----------------------+--------------------------+
    | Drucker empf?ngt CR   | Drucker druckt CR        |
    +-----------------------+--------------------------+
    | Drucker empf?ngt LF   | Drucker druckt CR + LF   |
    +-----------------------+--------------------------+

    .. raw:: html

       </div>

    Es gibt mehrere M?glichkeiten, dieses Verhalten zu erreichen:

    .. raw:: html

       <div class="itemizedlist">

    -  Ver?ndern Sie die Konfiguration Ihres Druckers, um die
       Interpretation dieser Zeichen zu ver?ndern. Lesen Sie Ihr
       Druckerhandbuch, wenn Sie nicht wissen, was Sie dazu tun m?ssen.

       .. raw:: html

          <div class="note" xmlns="">

       Anmerkung:
       ~~~~~~~~~~

       Wenn Sie auf Ihrem Rechner neben FreeBSD noch andere
       Betriebssysteme verwenden, m?ssen Sie Ihren Drucker
       m?glicherweise anschlie?end *erneut konfigurieren*, damit die
       Zeichen CR und LF unter diesen Systemen korrekt interpretiert
       werden. Ist dies bei Ihnen der Fall, werden Sie wohl eine der
       folgenden L?sungen bevorzugen.

       .. raw:: html

          </div>

    -  Lassen Sie LF durch den Treiber der seriellen Schnittstelle
       automatisch in CR+LF konvertieren. Selbstverst?ndlich
       funktioniert dies nur mit Druckern, die an einer seriellen
       Schnittstelle angeschlossen sind. Um diese M?glichkeit zu nutzen,
       m?ssen Sie die ``ms#``-F?higkeit verwenden und in
       ``/etc/printcap`` den ``onlcr``-Modus f?r den Drucker aktivieren.

    -  Senden Sie eine *Escape-Sequenz* an den Drucker, damit das
       Zeichen LF zeitweilig anders behandelt wird. Suchen Sie im
       Handbuch Ihres Druckers nach den von Ihrem Drucker unterst?tzten
       Escape-Sequenzen. Wenn Sie eine entsprechenden Escape-Sequenz
       finden, m?ssen Sie den Textfilter so anpassen, dass zuerst die
       Escape-Sequenz und anschlie?end der Druckauftrag gesendet wird.

       Es folgt nun ein Bespieltextfilter f?r einen Drucker, der die
       Hewlett Packard PCL Escape-Sequenzen versteht. Dieser Filter
       veranlasst den Drucker, LF-Zeichen als Folgen von LF+CR
       aufzufassen. Anschlie?end wird der Druckauftrag gesendet. Als
       Abschluss wird ein *Form Feed* gesendet, um die letzte Seite des
       Druckauftrags auszuwerfen. Dieses Beispiel sollte mit nahezu
       allen Druckern von Hewlett Packard funktionieren.

       .. code:: programlisting

           #!/bin/sh
           #
           # hpif - Einfacher Text-Eingabefilter f?r lpd f?r auf HP-PCL basierende Drucker
           # Installiert unter /usr/local/libexec/hpif
           #
           # Kopiert stdin einfach nach stdout.  Ignoriert alle Filterargumente.
           # Weist den Drucker an LF als CR+LF zu interpretieren.
           # Wirft die Seite nach dem Drucken aus.

           printf "\033&k2G" && cat && printf "\033&l0H" && exit 0
           exit 2

       Das n?chste Beispiel aus ``/etc/printcap`` beschreibt den Rechner
       ``orchid``, an dessen Parallelport ein Drucker angeschlossen ist.
       Es handelt sich dabei um einen Hewlett Packard LaserJet?3Si, der
       den Namen ``teak`` verwendet. Als Textfilter wird das Skript aus
       dem letzten Beispiel verwendet:

       .. code:: programlisting

           #
           #  /etc/printcap f?r den Rechner orchid
           #
           teak|hp|laserjet|Hewlett Packard LaserJet 3Si:\
                   :lp=/dev/lpt0:sh:sd=/var/spool/lpd/teak:mx#0:\
                   :if=/usr/local/libexec/hpif:

    .. raw:: html

       </div>

Alle Zeilen wurden in die gleiche Zeile gedruckt.
    Der Drucker hat niemals eine neue Zeile begonnen. Alle Zeilen des
    Textes wurden in eine einzige Zeile gedruckt.

    Dieses Problem ist das „Gegenteil“ des oben beschriebenen
    Treppeneffekts und kommt wesentlich seltener vor. Die von FreeBSD
    zum Abschluss einer Zeile benutzten LF-Zeichen werden als CR-Zeichen
    interpretiert. Dadurch wird die Druckposition zwar auf den linken
    Rand der Seite, aber nicht um eine Zeile nach unten gesetzt.

    Konfigurieren Sie Ihren Drucker, um die folgende Interpretation der
    Zeichen LF und CR zu erzwingen:

    .. raw:: html

       <div class="informaltable">

    +--------------------+------------------+
    | Drucker empf?ngt   | Drucker druckt   |
    +====================+==================+
    | CR                 | CR               |
    +--------------------+------------------+
    | LF                 | CR + LF          |
    +--------------------+------------------+

    .. raw:: html

       </div>

Manche Zeichen wurden nicht gedruckt.
    Der Drucker hat in jeder Zeile einige Zeichen nicht gedruckt.
    Vielleicht ist das Problem auch w?hrend des Druckens schlimmer
    geworden, und der Drucker hat immer mehr Zeichen nicht gedruckt.

    Dieses Problem entsteht, weil der Drucker mit der Geschwindigkeit,
    mit der die Daten ?ber die serielle Schnittstelle (an einer
    parallelen Schnittstelle sollte das Problem nicht auftreten)
    eintreffen, nicht mithalten kann. Es gibt zwei M?glichkeiten, dieses
    Problem zu l?sen:

    .. raw:: html

       <div class="itemizedlist">

    -  Wenn der Drucker die Flusskontrolle mit XON/XOFF unterst?tzt,
       k?nnen Sie in der ``ms#``-F?higkeit den ``ixon``-Modus
       aktivieren.

    -  Unterst?tzt der Drucker die Anfrage zum Senden/L?schen des
       Sende-Hardware-Handshakes (allgemein bekannt als ``RTS/CTS``,
       dann sollten Sie den ``crtscts``-Modus in der ``ms#``-F?higkeit
       aktivieren. Stellen Sie aber sicher, dass das verwendete
       Druckerkabel auch f?r die Hardware-Flusskontrolle geeignet ist.

    .. raw:: html

       </div>

Es wurden nur wirre Zeichen gedruckt.
    Anstelle des gew?nschten Textes wurden nur zuf?llige Zeichen
    gedruckt.

    Dieses Problem wird ebenfalls durch falsche Konfigurationsparameter
    im Zusammenhang mit einem seriellen Drucker verursacht.
    Kontrollieren Sie die bps-Rate in der ``br``-F?higkeit und die
    Parit?tseinstellung (*Parity*) in der ``ms#``-F?higkeit. ?berpr?fen
    Sie au?erdem, ob der Drucker auch tats?chlich die gleichen
    Einstellungen verwendet, die in ``/etc/printcap`` definiert wurden.

Der Drucker hat ?berhaupt nicht reagiert.
    Wenn gar nichts passiert ist, dann liegt das vermutlich an FreeBSD
    und nicht am Drucker. Aktivieren Sie die Protokollierung
    (``lf``-F?higkeit) f?r den entsprechenden Drucker in der Datei
    ``/etc/printcap``. Es folgt nun ein Beispieleintrag f?r den Drucker
    ``rattan``, bei dem die ``lf``-F?higkeit aktiviert wurde.

    .. code:: programlisting

        rattan|line|diablo|lp|Diablo 630 Line Printer:\
                :sh:sd=/var/spool/lpd/rattan:\
                :lp=/dev/lpt0:\
                :if=/usr/local/libexec/if-simple:\
                :lf=/var/log/rattan.log

    Versuchen Sie jetzt noch einmal zu drucken. ?berpr?fen Sie die
    Protokolldatei (in unserem Beispiel ``/var/log/rattan.log``) auf
    etwaige Fehlermeldungen. Versuchen Sie aufgrund dieser Meldungen,
    das Problem zu beheben.

    Wenn Sie keine Protokolldatei festlegen, verwendet LPD in der
    Voreinstellung ``/dev/console`` f?r die Ausgabe der Fehlermeldungen.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------------+---------------------------------+------------------------------------------+
| `Zur?ck <printing-lpd-alternatives.html>`__?   | `Nach oben <printing.html>`__   | ?\ `Weiter <linuxemu.html>`__            |
+------------------------------------------------+---------------------------------+------------------------------------------+
| 10.6. Alternativen zum LPD-Drucksystem?        | `Zum Anfang <index.html>`__     | ?Kapitel 11. Linux-Bin?rkompatibilit?t   |
+------------------------------------------------+---------------------------------+------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
