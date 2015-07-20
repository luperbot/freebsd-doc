=================================
30.3. Elektronische Post benutzen
=================================

.. raw:: html

   <div class="navheader">

30.3. Elektronische Post benutzen
`Zur?ck <mail-synopsis.html>`__?
Kapitel 30. Elektronische Post (E-Mail)
?\ `Weiter <sendmail.html>`__

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

30.3. Elektronische Post benutzen
---------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

F?nf gr??ere Teile sind am E-Mail-Austausch beteiligt: `Das
Benutzerprogramm <mail-using.html#mail-mua>`__, `der
Server-D?mon <mail-using.html#mail-mta>`__,
`DNS <mail-using.html#mail-dns>`__, `ein entferntes oder lokales
Postfach <mail-using.html#mail-receive>`__ und nat?rlich `der
E-Mail-Server <mail-using.html#mail-host>`__ selbst.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

30.3.1. Das Benutzerprogramm
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das beinhaltet Kommandozeilenprogramme wie mutt, alpine, elm, mail und
Programme mit grafischer Benutzeroberfl?che, wie balsa und xfmail um
einige zu nennen, und „aufw?ndigere“, wie WWW-Browser. Diese Programme
geben die E-Mail-Transaktionen an den lokalen
`„E-Mail-Server“ <mail-using.html#mail-host>`__, weiter, entweder ?ber
einen der verf?gbaren `Server-D?monen <mail-using.html#mail-mta>`__ oder
eine TCP-Verbindung.

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

30.3.2. E-Mail-Server D?mon
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD enth?lt standardm??ig sendmail; es lassen sich aber auch andere
E-Mail-Server D?monen betreiben, beispielsweise

.. raw:: html

   <div class="itemizedlist">

-  exim,

-  postfix oder

-  qmail.

.. raw:: html

   </div>

Der Server-D?mon hat ?blicherweise zwei Funktionen: Er k?mmert sich um
das Empfangen von eingehenden E-Mails und stellt ausgehende E-Mails zu.
Es ist *nicht* Aufgabe des D?mons, E-Mails ?ber POP oder IMAP bereit zu
stellen, noch Zugriffe auf das lokale Postfach ``mbox`` oder
Verzeichnisse mit Postf?chern zu gew?hren. Daf?r ben?tigen Sie einen
zus?tzlichen `D?mon <mail-using.html#mail-receive>`__.

.. raw:: html

   <div class="warning" xmlns="">

Warnung:
~~~~~~~~

Alte Versionen von sendmail enthalten schwerwiegende Sicherheitsl?cher,
die einem Angreifer Zugriff auf Ihren Rechner verschaffen k?nnen. Um
Sicherheitsprobleme zu umgehen, sollten Sie eine aktuelle
sendmail-Version benutzen. Sie k?nnen auch einen anderen MTA aus der
`FreeBSD Ports-Sammlung <ports.html>`__ benutzen.

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

30.3.3. E-Mail und DNS
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das Domain Name System (DNS) und sein D?mon ``named`` spielen eine gro?e
Rolle in der Auslieferung von E-Mails. Um E-Mails auszuliefern, fragt
der Mail-Server-D?mon im DNS den Rechner ab, der E-Mails f?r das
Zielsystem entgegennimmt. Der gleiche Vorgang l?uft ab, wenn eine E-Mail
von einem entfernten Server auf Ihrem Mail-Server zugestellt wird.

Im DNS werden Rechnernamen auf IP-Adressen abgebildet. Daneben werden
spezielle Informationen f?r das Mail-System gespeichert, die
*MX-Eintr?ge* (*MX record*) genannt werden. Der MX-Eintrag (von *Mail
eXchanger*) gibt an, welcher Rechner oder welche Rechner E-Mails f?r
eine Domain annehmen. Existiert kein MX-Record f?r einen Rechner oder
dessen Domain, werden E-Mails direkt an den Rechner zugestellt,
vorausgesetzt der Rechner besitzt einen A-Eintrag, der den Rechnernamen
auf seine IP-Adresse abbildet.

Mit dem Kommando
`host(1) <http://www.FreeBSD.org/cgi/man.cgi?query=host&sektion=1>`__
k?nnen Sie die MX-Eintr?ge f?r eine Domain abfragen:

.. code:: screen

    % host -t mx FreeBSD.org
    FreeBSD.org mail is handled (pri=10) by mx1.FreeBSD.org

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

30.3.4. E-Mails empfangen
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Der E-Mail-Server empf?ngt alle E-Mails f?r Ihre Dom?ne. Er speichert
die E-Mails entweder im ``mbox``-Format (die Vorgabe) oder im
Maildir-Format. Die E-Mails k?nnen lokal mit Programmen wie
`mail(1) <http://www.FreeBSD.org/cgi/man.cgi?query=mail&sektion=1>`__
oder mutt gelesen werden. Mithilfe von Protokollen wie POP oder IMAP
k?nnen die E-Mails auch von entfernten Rechnern gelesen werden. Wenn Sie
die E-Mails direkt auf dem E-Mail-Server lesen m?chten, wird kein POP-
oder IMAP-Server gebraucht.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

30.3.4.1. Auf entfernte Postf?cher mit POP und IMAP zugreifen
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn Sie auf entfernte Postf?cher zugreifen wollen, ben?tigen Sie den
Zugang zu einem POP- oder IMAP-Server. Beide Protokolle bieten einen
einfachen Zugriff auf entfernte Postf?cher. IMAP besitzt allerdings
einige Vorteile, unter anderem:

.. raw:: html

   <div class="itemizedlist">

-  IMAP kann sowohl Nachrichten auf einem entfernten Server speichern
   als auch von dort abholen.

-  IMAP unterst?tzt gleichzeitig ablaufende Aktualisierungen.

-  Da es nicht gleich die komplette Nachricht herunterl?dt, ist IMAP
   ?ber langsame Verbindungen sehr n?tzlich. Weiterhin k?nnen E-Mails
   auf dem Server durchsucht werden, was den Datenverkehr zwischen
   Clients und dem Server minimiert.

.. raw:: html

   </div>

Wenn Sie einen POP- oder IMAP-Server installieren wollen, gehen Sie nach
den folgenden Schritten vor:

.. raw:: html

   <div class="procedure">

#. W?hlen Sie einen IMAP- oder POP-Server aus, der Ihre Anforderungen
   erf?llt. Die nachstehenden Server sind sehr bekannt:

   .. raw:: html

      <div class="itemizedlist">

   -  qpopper

   -  teapop

   -  imap-uw

   -  courier-imap

   -  dovecot

   .. raw:: html

      </div>

#. Installieren Sie den ausgew?hlten POP- oder IMAP-Daemon aus der
   Ports-Sammlung.

#. Wenn erforderlich, passen Sie die Datei ``/etc/inetd.conf`` an, um
   den POP- oder IMAP-Server zu starten.

.. raw:: html

   </div>

.. raw:: html

   <div class="warning" xmlns="">

Warnung:
~~~~~~~~

Beachten Sie, dass sowohl POP als auch IMAP Daten, wie den Benutzernamen
und das Passwort, im Klartext ?bertragen. Wenn Sie die mit diesen
Protokollen ?bertragenen Daten sch?tzen wollen, k?nnen Sie die Sitzung
mittels
`ssh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh&sektion=1>`__
tunneln oder SSL verwenden. Tunneln von Sitzungen wird in
`Abschnitt?15.10.8,
„SSH-Tunnel“ <openssh.html#security-ssh-tunneling>`__ beschrieben und
SSL wird in `Abschnitt?15.8, „OpenSSL“ <openssl.html>`__ dargestellt.

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

30.3.4.2. Auf lokale Postf?cher zugreifen
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Auf Postf?cher k?nnen Sie lokal mithilfe spezieller Benutzerprogramme,
die *Mail-User-Agents* (MUAs) genannt werden, zugreifen. Beispiele f?r
solche Programme sind mutt oder
`mail(1) <http://www.FreeBSD.org/cgi/man.cgi?query=mail&sektion=1>`__.

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

30.3.5. Der E-Mail-Server
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

„E-Mail-Server“ wird der Rechner genannt, welcher f?r die Zustellung und
das Empfangen von E-Mails auf Ihrem Rechner oder vielleicht Ihrem
Netzwerk zust?ndig ist.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------+-------------------------------+---------------------------------+
| `Zur?ck <mail-synopsis.html>`__?   | `Nach oben <mail.html>`__     | ?\ `Weiter <sendmail.html>`__   |
+------------------------------------+-------------------------------+---------------------------------+
| 30.2. ?bersicht?                   | `Zum Anfang <index.html>`__   | ?30.4. sendmail-Konfiguration   |
+------------------------------------+-------------------------------+---------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
