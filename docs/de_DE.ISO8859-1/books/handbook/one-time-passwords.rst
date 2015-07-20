======================
15.5. Einmalpassw?rter
======================

.. raw:: html

   <div class="navheader">

15.5. Einmalpassw?rter
`Zur?ck <crypt.html>`__?
Kapitel 15. Sicherheit
?\ `Weiter <tcpwrappers.html>`__

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

15.5. Einmalpassw?rter
----------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In der Voreinstellung unterst?tzt FreeBSD OPIE (*One-time Passwords in
Everything*), das in der Regel MD5-Hash-Funktionen einsetzt.

Im Folgenden werden drei verschiedene Passw?rter verwendet. Das erste
ist Ihr normales System- oder Kerberos-Passwort und wird im Folgenden
„System-Passwort“ genannt. Das zweite ist das Einmalpasswort, das bei
OPIE von ``opiekey`` generiert und von ``opiepasswd`` und dem
Login-Programm akzeptiert wird. Im Folgenden wird es „Einmalpasswort“
genannt. Das dritte Passwort ist das geheime Passwort, das Sie mit
``opiekey`` (manchmal auch mit ``opiepasswd``) zum Erstellen der
Einmalpassw?rter verwenden. Dieses Passwort werden wir im Folgenden
„geheimes Passwort“ oder schlicht „Passwort“ nennen.

Das geheime Passwort steht in keiner Beziehung zu Ihrem System-Passwort,
beide k?nnen gleich sein, obwohl das nicht empfohlen wird. Die geheimen
Passw?rter von OPIE sind nicht auf eine L?nge von 8?Zeichen, wie alte
UNIX? Passw?rter`:sup:`[10]` <#ftn.idp78462544>`__, beschr?nkt. Sie
k?nnen so lang sein, wie Sie wollen. Gebr?uchlich sind Passw?rter, die
sich aus sechs bis sieben W?rtern zusammensetzen. Das OPIE-System
arbeitet gr??tenteils unabh?ngig von den auf UNIX?-Systemen verwendeten
Passwort-Mechanismen.

Neben dem Passwort gibt es noch zwei Werte, die f?r OPIE wichtig sind.
Der erste ist der „Initialwert“ (engl. *seed* oder *key*), der aus zwei
Buchstaben und f?nf Ziffern besteht. Der zweite Wert ist der
„Iterationsz?hler“, eine Zahl zwischen 1 und 100. OPIE generiert das
Einmalpasswort, indem es den Initialwert und das geheime Passwort
aneinander h?ngt und dann die MD5-Hash-Funktion so oft, wie durch den
Iterationsz?hler gegeben, anwendet. Das Ergebnis wird in sechs englische
W?rter umgewandelt, die Ihr Einmalpasswort sind. Das
Authentifizierungssystem (meistens PAM) merkt sich das zuletzt benutzte
Einmalpasswort und Sie sind authentisiert, wenn die Hash-Funktion des
Passworts dem vorigen Passwort entspricht. Da nicht umkehrbare
Hash-Funktionen benutzt werden, ist es unm?glich, aus einem bekannten
Passwort weitere g?ltige Einmalpassw?rter zu berechnen. Der
Iterationsz?hler wird nach jeder erfolgreichen Anmeldung um eins
verringert und stellt so die Synchronisation zwischen Benutzer und
Login-Programm sicher. Wenn der Iterationsz?hler den Wert 1 erreicht,
muss OPIE neu initialisiert werden.

In jedem System werden mehrere Programme verwendet, die weiter unten
beschrieben werden. ``opiekey`` verlangt einen Iterationsz?hler, einen
Initialwert und ein geheimes Passwort. Daraus generiert es ein
Einmalpasswort oder eine Liste von Einmalpassw?rtern. ``opiepasswd``
wird dazu benutzt, um OPIE zu initialisieren. Mit diesem Programm k?nnen
Passw?rter, Iterationsz?hler oder Initialwerte ge?ndert werden. Als
Parameter verlangt es entweder ein geheimes Passwort oder einen
Iterationsz?hler oder einen Initialwert und ein Einmalpasswort.
``opieinfo`` hingegen gibt den momentanen Iterationsz?hler und
Initialwert eines Benutzers aus. Diese werden aus der Datei
``/etc/opiekeys`` ermittelt.

Im Folgenden werden vier verschiedene T?tigkeiten beschrieben. Zuerst
wird erl?utert, wie ``opiepasswd`` ?ber eine gesicherte Verbindung
eingesetzt werden, um Einmalpassw?rter das erste Mal zu konfigurieren
oder das Passwort oder den Initialwert zu ?ndern. Als n?chstes wird
erkl?rt, wie ``opiepasswd`` ?ber eine nicht gesicherte Verbindung, oder
zusammen mit ``opiekey`` ?ber eine gesicherte Verbindung eingesetzt
werden, um dasselbe zu erreichen. Als drittes wird beschrieben, wie
``opiekey`` genutzt wird, um sich ?ber eine nicht gesicherte Verbindung
anzumelden. Die vierte T?tigkeit beschreibt, wie mit ``opiekey`` eine
Reihe von Schl?sseln generiert wird, die Sie sich aufschreiben oder
ausdrucken k?nnen, um sich von Orten anzumelden, die ?ber keine
gesicherten Verbindungen verf?gen.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

15.5.1. Einrichten ?ber eine gesicherte Verbindung
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Um OPIE erstmals zu initalisieren, rufen Sie ``opiepasswd`` auf:

.. code:: screen

    % opiepasswd -c
    [grimreaper] ~ $ opiepasswd -f -c
    Adding unfurl:
    Only use this method from the console; NEVER from remote. If you are using
    telnet, xterm, or a dial-in, type ^C now or exit with no password.
    Then run opiepasswd without the -c parameter.
    Using MD5 to compute responses.
    Enter new secret pass phrase:
    Again new secret pass phrase:

    ID unfurl OTP key is 499 to4268
    MOS MALL GOAT ARM AVID COED
          

Nach der Aufforderung ``Enter new secret pass phrase:`` oder
``Enter secret password:`` geben Sie bitte Ihr Passwort ein. Dies ist
nicht das Passwort, mit dem Sie sich anmelden, sondern es wird genutzt,
um das Einmalpasswort zu generieren. Die Zeile, die mit „ID“ anf?ngt,
enth?lt Ihren Login-Namen, den Iterationsz?hler und den Initialwert.
Diese Werte m?ssen Sie sich nicht behalten, da das System sie zeigen
wird, wenn Sie sich anmelden. In der letzten Zeile steht das
Einmalpasswort, das aus diesen Parametern und Ihrem geheimen Passwort
ermittelt wurde. Wenn sie sich jetzt wieder anmelden wollten, dann
m?ssten Sie dieses Passwort benutzen.

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

15.5.2. Einrichten ?ber eine nicht gesicherte Verbindung
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Um Einmalpassw?rter ?ber eine nicht gesicherte Verbindung einzurichten,
oder das geheime Passwort zu ?ndern, m?ssen Sie ?ber eine gesicherte
Verbindung zu einer Stelle verf?gen, an der Sie ``opiekey`` ausf?hren.
Dies kann etwa die Eingabeaufforderung auf einer Maschine, der Sie
vertrauen, sein. Zudem m?ssen Sie einen Iterationsz?hler vorgeben (100
ist ein guter Wert) und einen Initialwert w?hlen, wobei Sie auch einen
zuf?llig generierten benutzen k?nnen. Benutzen Sie ``opiepasswd`` ?ber
die ungesicherte Verbindung zu der Maschine, die Sie einrichten wollen:

.. code:: screen

    % opiepasswd

    Updating unfurl:
    You need the response from an OTP generator.
    Old secret pass phrase:
            otp-md5 498 to4268 ext
            Response: GAME GAG WELT OUT DOWN CHAT
    New secret pass phrase:
            otp-md5 499 to4269
            Response: LINE PAP MILK NELL BUOY TROY

    ID mark OTP key is 499 gr4269
    LINE PAP MILK NELL BUOY TROY

Dr?cken Sie **Return**, um die Vorgabe f?r den Initialwert zu
akzeptieren. Bevor Sie nun das Zugriffspasswort (engl. *access
password*) eingeben, rufen Sie ?ber die gesicherte Verbindung ``opikey``
mit denselben Parametern auf:

.. code:: screen

    % opiekey 498 to4268
    Using the MD5 algorithm to compute response.
    Reminder: Don't use opiekey from telnet or dial-in sessions.
    Enter secret pass phrase:
    GAME GAG WELT OUT DOWN CHAT

Gehen Sie nun zur?ck zu der nicht gesicherten Verbindung und geben dort
das eben generierte Einmalpasswort ein.

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

15.5.3. Erzeugen eines einzelnen Einmalpasswortes
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Nachdem Sie OPIE eingerichtet haben, werden Sie beim n?chsten Anmelden
wie folgt begr??t:

.. code:: screen

    % telnet example.com
    Trying 10.0.0.1...
    Connected to example.com
    Escape character is '^]'.

    FreeBSD/i386 (example.com) (ttypa)

    login: <username>
    otp-md5 498 gr4269 ext
    Password: 

Anmerkung: OPIE besitzt eine n?tzliche Eigenschaft, die hier nicht
gezeigt ist. Wenn Sie an der Eingabeaufforderung **Return** eingeben,
wird die echo-Funktion eingeschaltet, das hei?t Sie sehen, was Sie
tippen. Dies ist besonders n?tzlich, wenn Sie ein generiertes Passwort
von einem Ausdruck abtippen m?ssen.

Jetzt m?ssen Sie Ihr Einmalpasswort generieren, um der
Anmeldeaufforderung nachzukommen. Dies muss auf einem gesicherten System
geschehen, auf dem Sie oder ``opiekey`` ausf?hren k?nnen. Dieses
Programm gibt es ?brigens auch f?r DOS, Windows? und Mac?OS?. Es
ben?tigt den Iterationsz?hler sowie den Initialwert als Parameter, die
Sie mittels „cut-and-paste“ direkt von der Login-Aufforderung nehmen
k?nnen.

Auf dem sicheren System:

.. code:: screen

    % opiekey 498 to4268
    Using the MD5 algorithm to compute response.
    Reminder: Don't use opiekey from telnet or dial-in sessions.
    Enter secret pass phrase:
    GAME GAG WELT OUT DOWN CHAT

Mit dem jetzt generierten Einmalpasswort k?nnen Sie die Anmeldeprozedur
fortsetzen.

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

15.5.4. Erzeugen von mehreren Einmalpassw?rtern
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Manchmal m?ssen Sie sich an Orte begeben, an denen Sie keinen Zugriff
auf eine sichere Maschine oder eine sichere Verbindung haben. In diesem
Fall k?nnen Sie vorher mit ``opiekey`` einige Einmalpassw?rter
generieren, die Sie sich ausdrucken und mitnehmen k?nnen. Zum Beispiel:

.. code:: screen

    % opiekey -n 5 30 zz99999
    Using the MD5 algorithm to compute response.
    Reminder: Don't use opiekey from telnet or dial-in sessions.
    Enter secret pass phrase: <secret password>
    26: JOAN BORE FOSS DES NAY QUIT
    27: LATE BIAS SLAY FOLK MUCH TRIG
    28: SALT TIN ANTI LOON NEAL USE
    29: RIO ODIN GO BYE FURY TIC
    30: GREW JIVE SAN GIRD BOIL PHI

Mit ``-n 5`` fordern Sie f?nf Passw?rter der Reihe nach an. Der letzte
Iterationsz?hler wird durch ``30`` gegeben. Beachten Sie bitte, dass die
Passw?rter in der *umgekehrten* Reihenfolge, in der sie zu benutzen
sind, ausgeben werden. Wenn Sie wirklich paranoid sind, schreiben Sie
sich jetzt die Passw?rter auf, ansonsten drucken Sie sie mit ``lpr``
aus. Beachten Sie, dass jede Zeile den Iterationsz?hler und das
Einmalpasswort zeigt, trotzdem finden Sie es vielleicht hilfreich, eine
Zeile nach Gebrauch durchzustreichen.

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

15.5.5. Einschr?nken der Benutzung von System-Passw?rtern
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

OPIE kann die Verwendung von System-Passw?rtern abh?ngig von der
Quell-IP-Adresse einschr?nken. Die dazu n?tigen Einstellungen werden in
der Datei ``/etc/opieaccess`` vorgenommen, die bei der Installation des
Systems automatisch erzeugt wird. Weitere Informationen ?ber diese Datei
und Sicherheitshinweise zu ihrer Verwendung entnehmen Sie bitte der
Hilfeseite
`opieaccess(5) <http://www.FreeBSD.org/cgi/man.cgi?query=opieaccess&sektion=5>`__.

Die Datei ``opieaccess`` k?nnte beispielsweise die folgende Zeile
enthalten:

.. code:: programlisting

    permit 192.168.0.0 255.255.0.0

Diese Zeile erlaubt es Benutzern, die sich von einer der angegebenen
Quell-IP-Adressen anmelden, ihr System-Passwort zu verwenden. Beachten
Sie bitte, dass eine Quell-IP-Adresse leicht gef?lscht werden kann.

Findet sich in ``opieaccess`` kein passender Eintrag, muss die Anmeldung
mit OPIE erfolgen.

.. raw:: html

   </div>

.. raw:: html

   <div class="footnotes">

--------------

.. raw:: html

   <div id="ftn.idp78462544" class="footnote">

`:sup:`[10]` <#idp78462544>`__\ Unter FreeBSD darf das System-Passwort
maximal 128?Zeichen lang sein.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------+---------------------------------+------------------------------------+
| `Zur?ck <crypt.html>`__?               | `Nach oben <security.html>`__   | ?\ `Weiter <tcpwrappers.html>`__   |
+----------------------------------------+---------------------------------+------------------------------------+
| 15.4. DES, Blowfish, MD5, und Crypt?   | `Zum Anfang <index.html>`__     | ?15.6. TCP-Wrapper                 |
+----------------------------------------+---------------------------------+------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
