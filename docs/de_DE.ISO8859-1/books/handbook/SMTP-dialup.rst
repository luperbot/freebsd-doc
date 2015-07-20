=======================================
30.10. E-Mail ?ber Einwahl-Verbindungen
=======================================

.. raw:: html

   <div class="navheader">

30.10. E-Mail ?ber Einwahl-Verbindungen
`Zur?ck <outgoing-only.html>`__?
Kapitel 30. Elektronische Post (E-Mail)
?\ `Weiter <SMTP-Auth.html>`__

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

30.10. E-Mail ?ber Einwahl-Verbindungen
---------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn Sie eine feste IP-Adresse haben, m?ssen Sie die
Standardeinstellungen wahrscheinlich gar nicht ?ndern. Stellen Sie Ihren
Hostnamen entsprechend Ihrem zugeordneten Internetnamen ein und sendmail
?bernimmt das ?brige.

Wenn Sie eine dynamische IP-Adresse haben und eine PPP-W?hlverbindung
zum Internet benutzen, besitzen Sie wahrscheinlich eine Mailbox auf dem
Mailserver Ihres ISPs. Lassen Sie uns annehmen, die Dom?ne ihres ISPs
sei ``example.net`` und Ihr Benutzername ``user``; au?erdem nehmen wir
an, dass Sie Ihre Maschine ``bsd.home`` genannt haben und, dass Ihr ISP
ihnen gesagt hat, dass Sie ``relay.example.net`` als Mail-Relayhost
benutzen k?nnen.

Um Mails aus Ihrer Mailbox abzuholen, m?ssen Sie ein gesondertes
Programm installieren; fetchmail ist eine gute Wahl, weil es viele
verschiedene Protokolle unterst?tzt. Das Programm k?nnen Sie als Paket
oder von der Ports-Sammlung
(`mail/fetchmail <http://www.freebsd.org/cgi/url.cgi?ports/mail/fetchmail/pkg-descr>`__)
installieren. F?r gew?hnlich wird von Ihrem ISP POP zur Verf?gung
gestellt. Falls Sie sich daf?r entschieden haben, User-PPP zu benutzen,
k?nnen Sie durch folgenden Eintrag in der Datei ``/etc/ppp/ppp.linkup``
Ihre Mails automatisch abholen lassen, wenn eine Verbindung zum Netz
aufgebaut wird:

.. code:: programlisting

    MYADDR:
    !bg su user -c fetchmail

Falls Sie (wie unten gezeigt) sendmail benutzen, um Mails an
nicht-lokale Benutzer zu versenden, f?gen Sie den Befehl

.. code:: programlisting

    !bg su user -c "sendmail -q"

nach dem oben gezeigten Eintrag ein. Das veranlasst sendmail, Ihre
ausgehenden Mails zu verarbeiten, sobald eine Verbindung zum Internet
aufgebaut wird.

Nehmen wir an, dass auf ``bsd.home`` ein Benutzer ``user`` existiert.
Erstellen Sie auf ``bsd.home`` im Heimatverzeichnis von ``user`` die
Datei ``.fetchmailrc``:

.. code:: programlisting

    poll example.net protocol pop3 fetchall pass MySecret;

Diese Datei sollte f?r niemandem au?er ``user`` lesbar sein, weil sie
das Passwort ``MySecret`` enth?lt.

Um Mails mit dem richtigen ``from:``-Header zu versenden, m?ssen Sie
sendmail mitteilen, dass es ``<user@example.net>`` und nicht
``<user@bsd.home>`` benutzen soll. Eventuell m?chten Sie auch, dass
sendmail alle Mails ?ber ``relay.example.net`` versendet, um eine
schnellere ?bertragung von Mails zu gew?hrleisten.

Die folgende ``.mc``-Datei sollte ausreichen:

.. code:: programlisting

    VERSIONID(`bsd.home.mc version 1.0')
    OSTYPE(bsd4.4)dnl
    FEATURE(nouucp)dnl
    MAILER(local)dnl
    MAILER(smtp)dnl
    Cwlocalhost
    Cwbsd.home
    MASQUERADE_AS(`example.net')dnl
    FEATURE(allmasquerade)dnl
    FEATURE(masquerade_envelope)dnl
    FEATURE(nocanonify)dnl
    FEATURE(nodns)dnl
    define(`SMART_HOST', `relay.example.net')
    Dmbsd.home
    define(`confDOMAIN_NAME',`bsd.home')dnl
    define(`confDELIVERY_MODE',`deferred')dnl

Im vorherigen Abschnitt finden Sie Details dazu, wie Sie aus dieser
``.mc``-Datei eine Datei ``sendmail.cf`` erstellen k?nnen. Vergessen Sie
auch nicht, sendmail neu zu starten, nachdem Sie ``sendmail.cf``
ver?ndert haben.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------------------------+-------------------------------+----------------------------------+
| `Zur?ck <outgoing-only.html>`__?                      | `Nach oben <mail.html>`__     | ?\ `Weiter <SMTP-Auth.html>`__   |
+-------------------------------------------------------+-------------------------------+----------------------------------+
| 30.9. Ausgehende E-Mail ?ber einen Relay versenden?   | `Zum Anfang <index.html>`__   | ?30.11. SMTP-Authentifizierung   |
+-------------------------------------------------------+-------------------------------+----------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
