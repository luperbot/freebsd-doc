===============
30.2. ?bersicht
===============

.. raw:: html

   <div class="navheader">

30.2. ?bersicht
`Zur?ck <mail.html>`__?
Kapitel 30. Elektronische Post (E-Mail)
?\ `Weiter <mail-using.html>`__

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

30.2. ?bersicht
---------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

„Elektronische Post“, besser bekannt als E-Mail, ist eine der am weit
verbreitetsten Formen der Kommunikation heutzutage. Dieses Kapitel
bietet eine grundlegende Einf?hrung in das Betreiben eines
E-Mail-Servers unter FreeBSD. Ebenfalls wird der Versand und Empfang von
E-Mails unter FreeBSD behandelt. Das Kapitel ist jedoch keine komplette
Referenz und es werden viele wichtige ?berlegungen au?er Acht gelassen.
Wenn Sie das Thema detaillierter betrachten m?chten, werden Sie bei
einem der exzellenten B?cher f?ndig, die in `Anhang?B,
*Bibliografie* <bibliography.html>`__ aufgelistet sind.

Dieses Kapitel behandelt die folgenden Punkte:

.. raw:: html

   <div class="itemizedlist">

-  Welche Software-Komponenten beim Senden und Empfangen von
   elektronischer Post involviert sind.

-  Wo sich grundlegende sendmail Konfigurationsdateien in FreeBSD
   befinden.

-  Den Unterschied zwischen entfernten und lokalen Postf?chern.

-  Wie man Versender von Massennachrichten daran hindern kann, Ihren
   E-Mail-Server illegalerweise als Weiterleitung zu verwenden.

-  Wie man den Standard-Mailer des Systems, sendmail, ersetzt.

-  Wie man oft auftretende E-Mail-Server Probleme behebt.

-  Wie E-Mails mit UUCP verschickt werden.

-  Wie E-Mails ?ber einen Relay verschickt werden.

-  Wie E-Mails ?ber eine Einwahlverbindung gehandhabt werden.

-  Wie Sie die SMTP-Authentifizierung einrichten.

-  Den Empfang und den Versand von E-Mails mithilfe von Programmen wie
   mutt.

-  Wie E-Mails von einem entfernten Server mit POP oder IMAP abgeholt
   werden.

-  Wie eingehende E-Mail automatisch gefiltert wird.

.. raw:: html

   </div>

Bevor Sie dieses Kapitel lesen, sollten Sie:

.. raw:: html

   <div class="itemizedlist">

-  Ihre Netzwerk-Verbindung richtig einrichten. (`Kapitel?33,
   *Weiterf?hrende Netzwerkthemen* <advanced-networking.html>`__).

-  Die DNS-Information f?r Ihren E-Mail-Server einstellen (`Kapitel?31,
   *Netzwerkserver* <network-servers.html>`__).

-  Wissen, wie man zus?tzliche Dritthersteller-Software installiert
   (`Kapitel?5, *Installieren von Anwendungen: Pakete und
   Ports* <ports.html>`__).

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------------+-------------------------------+--------------------------------------+
| `Zur?ck <mail.html>`__?                    | `Nach oben <mail.html>`__     | ?\ `Weiter <mail-using.html>`__      |
+--------------------------------------------+-------------------------------+--------------------------------------+
| Kapitel 30. Elektronische Post (E-Mail)?   | `Zum Anfang <index.html>`__   | ?30.3. Elektronische Post benutzen   |
+--------------------------------------------+-------------------------------+--------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
