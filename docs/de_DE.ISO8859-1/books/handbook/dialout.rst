=============================
28.5. Verbindungen nach Au?en
=============================

.. raw:: html

   <div class="navheader">

28.5. Verbindungen nach Au?en
`Zur?ck <dialup.html>`__?
Kapitel 28. Serielle Daten?bertragung
?\ `Weiter <serialconsole-setup.html>`__

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

28.5. Verbindungen nach Au?en
-----------------------------

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

Mit FreeBSD?8.0 wurden die Ger?tedateien f?r serielle Ports von
``/dev/ttydN`` in ``/dev/ttyuN`` umbenannt. Setzen Sie noch FreeBSD?7.X
ein, m?ssen Sie die Befehle in den folgenden Abschnitten entsprechend
anpassen.

.. raw:: html

   </div>

Die folgenden Ratschl?ge beschreiben, wie Sie mit einem Modem eine
Verbindung zu einem anderen Computer herstellen. Dies k?nnen Sie nutzen,
um sich auf einem entfernten Computer anzumelden, oder um eine
Verbindung zu einem BBS (Bulletin Board System) herzustellen.

Weiterhin ist diese Art von Verbindungen n?tzlich, wenn mal Ihr PPP
nicht funktioniert. Wenn Sie zum Beispiel eine Datei mit FTP ?bertragen
wollen und das ?ber PPP gerade nicht m?glich ist, melden Sie sich auf
dem entfernten Rechner an und f?hren dort die FTP-Sitzung durch. Die
Dateien k?nnen Sie danach mit zmodem auf den lokalen Rechner ?bertragen.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

28.5.1. Mein Hayes Modem wird nicht unterst?tzt – was kann ich tun?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Eigentlich ist die Onlinehilfe f?r ``tip`` nicht mehr aktuell. Es gibt
einen eingebauten, allgemeinen Hayes W?hler. Verwenden Sie einfach
``at=hayes`` in ``/etc/remote``.

Der Hayes-Treiber ist nicht schlau genug, um ein paar der erweiterten
Funktionen von neueren Modems zu erkennen – Nachrichten wie ``BUSY``,
``NO DIALTONE`` oder ``CONNECT 115200`` verwirren ihn nur. Sie sollten
diese Nachrichten mit Hilfe von ``ATX0&W`` abschalten, wenn Sie ``tip``
benutzen.

Der Anwahl-Timeout von ``tip`` betr?gt 60 Sekunden. Ihr Modem sollte
weniger verwenden, oder ``tip`` denkt, dass ein Kommunikationsfehler
vorliegt. Versuchen Sie es mit ``ATS7=45&W``.

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

28.5.2. Wie soll ich die AT-Befehle eingeben?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Erstellen Sie einen so genannten ``direct`` Eintrag in ``/etc/remote``.
Wenn Ihr Modem zum Beispiel an der ersten seriellen Schnittstelle,
``/dev/cuad0``, angeschlossen ist, dann f?gen Sie die folgende Zeile
hinzu:

.. code:: programlisting

    cuad0:dv=/dev/cuad0:br#19200:pa=none

Verwenden Sie die h?chste bps-Rate, die Ihr Modem in der br F?higkeit
unterst?tzt. Geben Sie dann ``tip     cuad0`` ein und Sie sind mit Ihrem
Modem verbunden.

Oder benutzen Sie ``cu`` als ``root`` mit dem folgenden Befehl:

.. code:: screen

    # cu -lline -sspeed

*``line``* steht f?r die serielle Schnittstelle (``/dev/cuad0``) und
*``speed``* f?r die Geschwindigkeit (``57600``). Wenn Sie mit dem
Eingeben der AT Befehle fertig sind, beenden Sie mit ``~.``.

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

28.5.3. Wieso funktioniert das ``@`` Zeichen f?r die pn F?higkeit nicht?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das ``@`` Zeichen in der Telefonnummerf?higkeit sagt ``tip``, dass es in
der Datei ``/etc/phones`` nach einer Nummer suchen soll. Aber ``@`` ist
auch ein spezielles Zeichen in den Dateien, in denen F?higkeiten
beschrieben werden, wie ``/etc/remote``. Schreiben Sie es mit einem
Backslash:

.. code:: programlisting

    pn=\@

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

28.5.4. Wie kann ich von der Kommandozeile eine Telefonnummer w?hlen?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Stellen Sie einen allgemeinen Eintrag in ``/etc/remote``. Zum Beispiel:

.. code:: programlisting

    tip115200|Dial any phone number at 115200 bps:\
            :dv=/dev/cuad0:br#115200:at=hayes:pa=none:du:
    tip57600|Dial any phone number at 57600 bps:\
            :dv=/dev/cuad0:br#57600:at=hayes:pa=none:du:

Mit dem folgenden Befehl k?nnen Sie dann w?hlen:

.. code:: screen

    # tip -115200 5551234

Sollten Sie ``cu`` gegen?ber ``tip`` bevorzugen, verwenden Sie einen
allgemeinen cu-Eintrag:

.. code:: programlisting

    cu115200|Use cu to dial any number at 115200bps:\
            :dv=/dev/cuad1:br#57600:at=hayes:pa=none:du:

und benutzen zum W?hlen das Kommando:

.. code:: screen

    # cu 5551234 -s 115200

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

28.5.5. Muss ich dabei jedes Mal die bps-Rate angeben?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Schreiben Sie einen ``tip1200``- oder einen ``cu1200``-Eintrag, aber
geben Sie auch die bps-Rate an, die Ihr Modem wirklich unterst?tzt.
Leider denkt
`tip(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tip&sektion=1>`__,
dass 1200?bps ein guter Standardwert ist und deswegen sucht es nach
einem ``tip1200``-Eintrag. Nat?rlich m?ssen Sie nicht 1200?bps benutzen.

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

28.5.6. Wie kann ich m?glichst komfortabel ?ber einen Terminal-Server auf verschiedene Rechner zugreifen?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Sie m?ssen nicht warten bis Sie verbunden sind, und jedes Mal
``CONNECT Rechner`` eingeben, benutzen Sie ``tip``\ s ``cm``-F?higkeit.
Sie k?nnen diese Eintr?ge in ``/etc/remote`` verwenden:

.. code:: programlisting

    pain|pain.deep13.com|Forrester's machine:\
            :cm=CONNECT pain\n:tc=deep13:
    muffin|muffin.deep13.com|Frank's machine:\
            :cm=CONNECT muffin\n:tc=deep13:
    deep13:Gizmonics Institute terminal server:\
            :dv=/dev/cuad2:br#38400:at=hayes:du:pa=none:pn=5551234:

Mit den Befehlen ``tip pain`` oder ``tip         muffin`` k?nnen Sie
eine Verbindungen zu den Rechnern ``pain`` oder ``muffin`` herstellen;
mit ``tip deep13`` verbinden Sie sich mit dem Terminalserver.

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

28.5.7. Kann ``tip`` mehr als eine Verbindung f?r jede Seite ausprobieren?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das ist oft ein Problem, wenn eine Universit?t mehrere Telefonleitungen
hat und viele tausend Studenten diese benutzen wollen.

Erstellen Sie einen Eintrag f?r Ihre Universit?t in ``/etc/remote`` und
benutzen Sie ``@`` f?r die ``pn``-F?higkeit:

.. code:: programlisting

    big-university:\
            :pn=\@:tc=dialout
    dialout:\
            :dv=/dev/cuad3:br#9600:at=courier:du:pa=none:

Listen Sie die Telefonnummern der Universit?t in ``/etc/phones`` auf:

.. code:: programlisting

    big-university 5551111
    big-university 5551112
    big-university 5551113
    big-university 5551114

``tip`` probiert jede der Nummern in der aufgelisteten Reihenfolge und
gibt dann auf. M?chten Sie, dass ``tip`` beim Versuchen eine Verbindung
herzustellen nicht aufgibt, lassen Sie es in einer while-Schleife
laufen.

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

28.5.8. Warum muss ich zweimal **Ctrl**+**P** tippen, um ein **Ctrl**+**P** zu senden?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

**Ctrl**+**P** ist das voreingestellte Zeichen, mit dem eine ?bertragung
erzwungen werden kann und wird benutzt, um ``tip`` zu sagen, dass das
n?chste Zeichen direkt gesendet werden soll und nicht als Fluchtzeichen
interpretiert werden soll. Mit Hilfe der Fluchtsequenz ``~s``, mit der
man Variablen setzen kann, k?nnen Sie jedes andere Zeichen als
„force“-Zeichen definieren.

Geben Sie ``~sforce=Zeichen`` gefolgt von **Enter** ein. F?r
*``Zeichen``* k?nnen Sie ein beliebiges einzelnes Zeichen einsetzen.
Wenn Sie *``Zeichen``* weglassen, ist das „force“-Zeichen „nul“, das Sie
mit **Ctrl**+**2** oder **Ctrl**+**Leertaste** eingeben k?nnen. Ein
guter Wert f?r *``Zeichen``* ist **Shift**+**Ctrl**+**6**, welches nur
auf wenigen Terminal Servern benutzt wird.

Sie k?nnen das „force“-Zeichen auch bestimmen, indem Sie in
``$HOME/.tiprc`` das Folgende einstellen:

.. code:: programlisting

    force=single-char

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

28.5.9. Warum ist auf einmal alles was ich schreibe in GROSSBUCHSTABEN??
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Sie m?ssen **Ctrl**+**A**, eingegeben haben, das „raise“-Zeichen von
``tip``, das speziell f?r Leute mit defekten caps-lock Tasten
eingerichtet wurde. Benutzen Sie ``~s`` wie oben und setzen Sie die
Variable ``raisechar`` auf etwas, das Ihnen angemessen erscheint.
Tats?chlich kann die Variable auf das gleiche Zeichen wie das
„force“-Zeichen gesetzt werden, wenn Sie diese F?higkeiten niemals
benutzen wollen.

Hier ist ein Muster der ``.tiprc`` Datei, perfekt f?r Emacs Benutzer,
die oft **Ctrl**+**2** und **Ctrl**+**A** tippen m?ssen:

.. code:: programlisting

    force=^^
    raisechar=^^

Geben Sie f?r ``^^`` **Shift**+**Ctrl**+**6** ein.

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

28.5.10. Wie kann ich Dateien mit ``tip`` ?bertragen?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn Sie mit einem anderen UNIX? System kommunizieren, k?nnen Sie mit
``~p`` (put) und ``~t`` (take) Dateien senden und empfangen. Diese
Befehle lassen ``cat`` und ``echo`` auf dem entfernten System laufen, um
Dateien zu empfangen und zu senden. Die Syntax ist:

.. raw:: html

   <div class="cmdsynopsis">

``~p`` local-file [remote-file]

.. raw:: html

   </div>

.. raw:: html

   <div class="cmdsynopsis">

``~t`` remote-file [local-file]

.. raw:: html

   </div>

Es gibt keine Fehlerkontrolle, deshalb sollten Sie besser ein anderes
Protokoll, wie zmodem, benutzen.

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

28.5.11. Wie kann ich zmodem mit ``tip`` laufen lassen?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Um Dateien zu empfangen, starten Sie das Programm zum Senden auf dem
entfernten Computer. Geben Sie dann ``~C rz`` ein, um die Dateien lokal
zu empfangen.

Um Dateien zu senden, starten Sie das Programm zum Empfangen auf dem
entfernten Computer. Geben Sie dann ``~C sz Dateien`` ein, um Dateien
auf das entfernte System zu senden.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------+------------------------------------+--------------------------------------------+
| `Zur?ck <dialup.html>`__?    | `Nach oben <serialcomms.html>`__   | ?\ `Weiter <serialconsole-setup.html>`__   |
+------------------------------+------------------------------------+--------------------------------------------+
| 28.4. Einw?hlverbindungen?   | `Zum Anfang <index.html>`__        | ?28.6. Einrichten der seriellen Konsole    |
+------------------------------+------------------------------------+--------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
