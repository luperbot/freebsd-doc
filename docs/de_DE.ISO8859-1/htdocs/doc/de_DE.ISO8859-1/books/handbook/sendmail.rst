============================
30.4. sendmail-Konfiguration
============================

.. raw:: html

   <div class="navheader">

30.4. sendmail-Konfiguration
`Zur?ck <mail-using.html>`__?
Kapitel 30. Elektronische Post (E-Mail)
?\ `Weiter <mail-changingmta.html>`__

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

30.4. sendmail-Konfiguration
----------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Beigesteuert von Christopher Shumway.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

`sendmail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sendmail&sektion=8>`__
ist das standardm??ig in FreeBSD installierte Mail?bertragungsprogramm
(MTA). Die Aufgabe von sendmail ist es, E-Mails von
E-Mail-Benutzerprogrammen (MUA) anzunehmen und diese zu den
entsprechenden Mailern zu liefern, die in der Konfigurationsdatei
definiert sind. sendmail kann auch Netzwerkverbindungen annehmen und
E-Mails zu lokalen *Mailboxen* `:sup:`[18]` <#ftn.idp88509904>`__ oder
anderen Programmen liefern.

sendmail benutzt folgende Konfigurationsdateien:

.. raw:: html

   <div class="informaltable">

+----------------------------------+------------------------------------------------------------------+
| Dateiname                        | Funktion                                                         |
+==================================+==================================================================+
| ``/etc/mail/access``             | Datenbank, in der Zugriffsrechte auf sendmail verwaltet werden   |
+----------------------------------+------------------------------------------------------------------+
| ``/etc/mail/aliases``            | Mailbox Aliase                                                   |
+----------------------------------+------------------------------------------------------------------+
| ``/etc/mail/local-host-names``   | Liste der Rechner f?r die sendmail E-Mails akzeptiert            |
+----------------------------------+------------------------------------------------------------------+
| ``/etc/mail/mailer.conf``        | Mailer Programmkonfiguration                                     |
+----------------------------------+------------------------------------------------------------------+
| ``/etc/mail/mailertable``        | Mailer Versand-Zuordnungstabelle                                 |
+----------------------------------+------------------------------------------------------------------+
| ``/etc/mail/sendmail.cf``        | Hauptkonfigurationsdatei f?r sendmail                            |
+----------------------------------+------------------------------------------------------------------+
| ``/etc/mail/virtusertable``      | Virtuelle Benutzer und Dom?nen-Tabellen                          |
+----------------------------------+------------------------------------------------------------------+

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

30.4.1. ``/etc/mail/access``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Zugriffsdatenbank bestimmt, welche(r) Rechner oder IP-Adresse(n)
Zugriff auf den lokalen E-Mail-Server haben und welche Art von Zugriff
ihnen gestattet wird. Rechner k?nnen als ``OK``, ``REJECT`` oder
``RELAY`` eingetragen oder einfach an sendmails Fehlerbehandlungsroutine
mit einem angegebenen Mailer-Fehler ?bergeben werden. Rechner, die als
``OK`` eingetragen sind, was die Grundeinstellung ist, sind berechtigt
E-Mails zu diesem Rechner zu schicken, solange die endg?ltige
Zieladresse der lokale Rechner ist. Verbindungen von Rechnern, die als
``REJECT`` aufgelistet sind, werden abgelehnt. Rechnern mit gesetzter
``RELAY``-Option f?r ihren Rechnernamen wird erlaubt Post f?r jede
Zieladresse durch diesen Mail-Server zu senden.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel 30.1. Konfigurieren der sendmail Zugriffsdatenbank

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    cyberspammer.com                550 We do not accept mail from spammers
    FREE.STEALTH.MAILER@            550 We do not accept mail from spammers
    another.source.of.spam          REJECT
    okay.cyberspammer.com           OK
    128.32                          RELAY

.. raw:: html

   </div>

.. raw:: html

   </div>

In diesem Beispiel haben wir f?nf Eintr?ge. E-Mail-Versender, die mit
der linken Spalte der Tabelle ?bereinstimmen, sind betroffen von der
Aktion in der rechten Spalte. Die ersten beiden Beispiele ?bergeben
einen Fehlercode an sendmails Fehlerbehandlungsroutine. Die Nachricht
wird an den entfernten Rechner gesendet, wenn eine Nachricht mit der
linken Spalte der Tabelle ?bereinstimmt. Der n?chste Eintrag lehnt Post
von einem bestimmten Rechner des Internets ab
(``another.source.of.spam``). Der n?chste Eintrag akzeptiert
E-Mail-Verbindungen des Rechners ``okay.cyberspammer.com``, der exakter
angegeben wurde als ``cyberspammer.com`` in der Zeile dar?ber. Genauere
?bereinstimmungen haben den Vorrang vor weniger genauen. Der letzte
Eintrag erlaubt die Weiterleitung von elektronischer Post von Rechnern
mit einer IP-Adresse die mit ``128.32`` beginnt. Diese Rechner w?rden
E-Mails durch diesen E-Mail-Server senden k?nnen, die f?r andere
E-Mail-Server bestimmt sind.

Wenn diese Datei ge?ndert wird, m?ssen Sie ``make`` in ``/etc/mail``
ausf?hren um die Datenbank zu aktualisieren.

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

30.4.2. ``/etc/mail/aliases``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Alias-Datenbank enth?lt eine Liste der virtuellen Mailboxen, die in
andere Benutzer, Dateien, Programme oder andere Aliase expandiert
werden. Hier sind ein paar Beispiele, die in ``/etc/mail/aliases``
benutzt werden k?nnen:

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel 30.2. E-Mail Aliases

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    root: localuser
    ftp-bugs: joe,eric,paul
    bit.bucket:  /dev/null
    procmail: "|/usr/local/bin/procmail"

.. raw:: html

   </div>

.. raw:: html

   </div>

Das Dateiformat ist simpel; Der Name der Mailbox auf der linken Seite
des Doppelpunkts wird mit den Zielen auf der rechten Seite ersetzt. Das
erste Beispiel ersetzt die Mailbox ``root`` mit der Mailbox
``localuser``, die dann wieder in der Alias-Datenbank gesucht wird. Wird
kein passender Eintrag gefunden, wird die Nachricht zum lokalen Benutzer
``localuser`` geliefert. Das n?chste Beispiel zeigt eine
E-Mail-Verteilerliste. E-Mails an die Mailbox ``ftp-bugs`` werden zu den
drei lokalen Mailboxen ``joe``, ``eric`` und ``paul`` gesendet. Eine
lokale Mailbox kann auch als ``<user@example.com>`` angegeben werden.
Das n?chste Beispiel zeigt das Schreiben von E-Mails in eine Datei, in
diesem Fall ``/dev/null``. Das letzte Beispiel verdeutlicht das Senden
von E-Mails an ein Programm, in diesem Fall wird die Nachricht in die
Standardeingabe von ``/usr/local/bin/procmail`` mittels einer UNIX Pipe
geschrieben.

Wenn diese Datei ge?ndert wird, m?ssen Sie ``make`` in ``/etc/mail``
ausf?hren um die ?nderungen in die Datenbank zu ?bernehmen.

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

30.4.3. ``/etc/mail/local-host-names``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das ist die Liste der Rechnernamen, die
`sendmail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sendmail&sektion=8>`__
als lokalen Rechnernamen akzeptiert. Setzen Sie alle Dom?nen oder
Rechner, f?r die sendmail Mail empfangen soll, in diese Datei. Wenn
dieser Mail-Server zum Beispiel E-Mails f?r die Dom?ne example.com und
den Rechner ``mail.example.com`` annehmen soll, k?nnte seine
``local-host-names`` Datei so aussehen:

.. code:: programlisting

    example.com
    mail.example.com

Wird diese Datei ge?ndert, muss
`sendmail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sendmail&sektion=8>`__
neu gestartet werden, damit es die Neuerungen einliest.

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

30.4.4. ``/etc/mail/sendmail.cf``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Hauptkonfigurations-Datei von sendmail (``sendmail.cf``)
kontrolliert das allgemeine Verhalten von sendmail, einschlie?lich allem
vom Umschreiben von E-Mail Adressen bis hin zum ?bertragen von
Ablehnungsnachrichten an entfernte E-Mail-Server. Mit solch einer
mannigfaltigen Rolle ist die Konfigurationsdatei nat?rlich ziemlich
komplex und ihre Einzelheiten k?nnen in diesem Kapitel nicht besprochen
werden. Gl?cklicherweise muss diese Datei selten f?r Standard
E-Mail-Server ge?ndert werden.

Die sendmail Hauptkonfigurationsdatei kann mit
`m4(1) <http://www.FreeBSD.org/cgi/man.cgi?query=m4&sektion=1>`__ Makros
erstellt werden, die Eigenschaften und Verhalten von sendmail
definieren. Einige der Details finden Sie in
``/usr/src/contrib/sendmail/cf/README``.

Wenn ?nderungen an dieser Datei vorgenommen werden, muss sendmail neu
gestartet werden, damit die ?nderungen Wirkung zeigen.

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

30.4.5. ``/etc/mail/virtusertable``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Datei ``virtusertable`` ordnet Adressen f?r virtuelle Dom?nen und
Mailboxen reellen Mailboxen zu. Diese Mailboxen k?nnen lokal, auf
entfernten Systemen, Aliase in ``/etc/mail/aliases`` oder eine Datei
sein.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel 30.3. Beispiel einer virtuellen Dom?nen Zuordnung

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    root@example.com                root
    postmaster@example.com          postmaster@noc.example.net
    @example.com                    joe

.. raw:: html

   </div>

.. raw:: html

   </div>

In dem obigen Beispiel haben wir einen Eintrag f?r die Dom?ne
``example.com``. Diese Datei wird nach dem ersten ?bereinstimmenden
Eintrag durchsucht. Die erste Zeile ordnet ``<root@example.com>`` der
lokalen Mailbox ``root`` zu. Der n?chste Eintrag ordnet
``<postmaster@example.com>`` der Mailbox ``postmaster`` auf dem Rechner
``noc.example.net`` zu. Zuletzt, wenn keine ?bereinstimmung von
``example.com`` gefunden wurde, wird der letzte Eintrag verglichen, der
mit jeder Mail-Nachricht ?bereinstimmt, die an jemanden bei
``example.com`` adressiert wurde. Diese werden der lokalen Mailbox joe
zugeordnet.

.. raw:: html

   </div>

.. raw:: html

   <div class="footnotes">

--------------

.. raw:: html

   <div id="ftn.idp88509904" class="footnote">

`:sup:`[18]` <#idp88509904>`__\ Mailbox = Post- beziehungsweise
Briefkasten

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+-------------------------------+------------------------------------------------+
| `Zur?ck <mail-using.html>`__?        | `Nach oben <mail.html>`__     | ?\ `Weiter <mail-changingmta.html>`__          |
+--------------------------------------+-------------------------------+------------------------------------------------+
| 30.3. Elektronische Post benutzen?   | `Zum Anfang <index.html>`__   | ?30.5. Wechseln des Mail?bertragungs-Agenten   |
+--------------------------------------+-------------------------------+------------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
