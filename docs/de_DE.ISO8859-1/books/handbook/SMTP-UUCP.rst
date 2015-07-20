====================
30.8. SMTP ?ber UUCP
====================

.. raw:: html

   <div class="navheader">

30.8. SMTP ?ber UUCP
`Zur?ck <mail-advanced.html>`__?
Kapitel 30. Elektronische Post (E-Mail)
?\ `Weiter <outgoing-only.html>`__

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

30.8. SMTP ?ber UUCP
--------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die sendmail-Konfigurationsdatei, die mit FreeBSD ausgeliefert wird, ist
f?r Systeme geeignet, die direkt ans Internet angeschlossen sind.
Systeme, die ihre E-Mails per UUCP austauschen wollen, m?ssen eine
andere Konfigurationsdatei installieren.

Die manuelle Bearbeitung von ``/etc/mail/sendmail.cf`` ist nur etwas f?r
Puristen. Sendmail Version?8 bietet die neue M?glichkeit der Generierung
von Konfigurationsdateien ?ber eine Vorverarbeitung mit
`m4(1) <http://www.FreeBSD.org/cgi/man.cgi?query=m4&sektion=1>`__, wobei
die tats?chliche, h?ndische Konfiguration auf einer h?heren
Abstraktionsstufe stattfindet. Sie sollten die Konfigurationsdateien
unter ``/usr/src/usr.sbin/sendmail/cf`` benutzen. Die Datei ``README``
im Verzeichnis ``cf`` kann zur grundlegenden Einf?hrung in die
`m4(1) <http://www.FreeBSD.org/cgi/man.cgi?query=m4&sektion=1>`__-Konfiguration
dienen.

Zur Zustellung ?ber UUCP sind Sie am besten damit beraten, die
``mailertable``-Datenbank zu benutzen. Mit dieser Datenbank ermittelt
sendmail mit welchem Protokoll und wohin eine E-Mail zugestellt werden
soll.

Zun?chst m?ssen Sie Ihre ``.mc``-Datei erstellen. Das Verzeichnis
``/usr/share/sendmail/cf/cf`` ist die Basis f?r diese Dateien. Sehen Sie
sich um, es gibt bereits einige Beispiele. Wenn Sie Ihre Datei
``foo.mc`` genannt haben, m?ssen Sie die folgenden Befehle ausf?hren, um
sie in eine g?ltige ``sendmail.cf`` umzuwandeln:

.. code:: screen

    # cd /etc/mail
    # make foo.cf
    # cp foo.cf /etc/mail/sendmail.cf

Eine typische ``.mc``-Datei k?nnte so aussehen:

.. code:: programlisting

    VERSIONID(`Your version number')
    OSTYPE(bsd4.4)

    FEATURE(accept_unresolvable_domains)
    FEATURE(nocanonify)
    FEATURE(mailertable, `hash -o /etc/mail/mailertable')

    define(`UUCP_RELAY', your.uucp.relay)
    define(`UUCP_MAX_SIZE', 200000)
    define(`confDONT_PROBE_INTERFACES')

    MAILER(local)
    MAILER(smtp)
    MAILER(uucp)

    Cw    your.alias.host.name
    Cw    youruucpnodename.UUCP

Die Einstellungen ``accept_unresolvable_domains``, ``nocanonify`` und
``confDONT_PROBE_INTERFACES`` werden die Benutzung von DNS bei der
Zustellung von Mails verhindern. Die Klausel ``UUCP_RELAY`` wird aus
seltsamen Gr?nden ben?tigt – fragen Sie nicht, warum. Setzen Sie dort
einfach den Namen eines Hosts ein, der in der Lage ist, Adressen mit der
Pseudodom?ne .UUCP zu behandeln; wahrscheinlich werden Sie dort den
Relayhost Ihres ISP eintragen.

Wenn Sie soweit sind, m?ssen Sie die Datei ``/etc/mail/mailertable``
erzeugen. Hierzu wieder ein typisches Beispiel:

.. code:: programlisting

    #
    # makemap hash /etc/mail/mailertable.db < /etc/mail/mailertable
    #
    .  uucp-dom:your.uucp.relay

Ein komplexeres Beispiel k?nnte wie folgt aussehen:

.. code:: programlisting

    #
    # makemap hash /etc/mail/mailertable.db < /etc/mail/mailertable
    #
    horus.interface-business.de   uucp-dom:horus
    .interface-business.de        uucp-dom:if-bus
    interface-business.de         uucp-dom:if-bus
    .heep.sax.de                  smtp8:%1
    horus.UUCP                    uucp-dom:horus
    if-bus.UUCP                   uucp-dom:if-bus
    .                             uucp-dom:

Die ersten drei Zeilen behandeln spezielle F?lle, in denen an Dom?nen
adressierte E-Mails nicht ?ber die Standard-Route versendet werden
sollen, sondern zu einem UUCP-Nachbarn, um den Zustellweg „abzuk?rzen“.
Die n?chsten Zeilen behandeln E-Mails an Rechner in der lokalen Domain.
Diese Mails k?nnen direkt per SMTP zugestellt werden. Schlie?lich werden
die UUCP-Nachbarn in der Notation mit der Pseudodom?ne .UUCP aufgef?hrt,
um die Standardregeln mit ``uucp-neighbour!recipient`` zu ?berschreiben.
Die letzte Zeile besteht stets aus einem einzelnen Punkt, der als Ihr
Universalgateway in die Welt dient. Alle Knoten hinter dem Schl?sselwort
``uucp-dom:`` m?ssen g?ltige UUCP-Nachbarn sein, was Sie mit dem Befehl
``uuname`` ?berpr?fen k?nnen.

Als Erinnerung daran, dass diese Datei in eine DBM-Datenbankdatei
konvertiert werden muss, bevor sie benutzt werden kann, sollte der
Befehl hierzu als Kommentar am Anfang der ``mailertable`` plaziert
werden. Sie m?ssen den Befehl jedes Mal ausf?hren, wenn Sie die
``mailertable`` ge?ndert haben.

Abschlie?ender Hinweis: Wenn Sie unsicher sind, ob bestimmte Zustellwege
funktionieren, erinnern Sie sich an die Option ``-bt`` von sendmail. Sie
startet sendmail im *Adress-Testmodus*; geben Sie einfach ``3,0``,
gefolgt von der Adresse, f?r die Sie den Zustellweg testen m?chten, ein.
Die letzte Zeile nennt Ihnen den benutzten Mailagenten, den Zielhost,
mit dem dieser Agent aufgerufen wird und die (m?glicherweise ?bersetzte)
Adresse. Verlassen Sie diesen Modus, indem Sie **Ctrl**+**D** eingeben.

.. code:: screen

    % sendmail -bt
    ADDRESS TEST MODE (ruleset 3 NOT automatically invoked)
    Enter <ruleset> <address>
    > 3,0 foo@example.com
    canonify           input: foo @ example . com
    ...
    parse            returns: $# uucp-dom $@ your.uucp.relay $: foo < @ example . com . >
    > ^D

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------+-------------------------------+-------------------------------------------------------+
| `Zur?ck <mail-advanced.html>`__?   | `Nach oben <mail.html>`__     | ?\ `Weiter <outgoing-only.html>`__                    |
+------------------------------------+-------------------------------+-------------------------------------------------------+
| 30.7. Weiterf?hrende Themen?       | `Zum Anfang <index.html>`__   | ?30.9. Ausgehende E-Mail ?ber einen Relay versenden   |
+------------------------------------+-------------------------------+-------------------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
