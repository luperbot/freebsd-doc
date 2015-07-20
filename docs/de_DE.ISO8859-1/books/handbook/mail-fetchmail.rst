====================================
30.13. E-Mails mit fetchmail abholen
====================================

.. raw:: html

   <div class="navheader">

30.13. E-Mails mit fetchmail abholen
`Zur?ck <mail-agents.html>`__?
Kapitel 30. Elektronische Post (E-Mail)
?\ `Weiter <mail-procmail.html>`__

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

30.13. E-Mails mit fetchmail abholen
------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Beigetragen von Marc Silver.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

fetchmail ist ein vollwertiger IMAP- und POP-Client. Mit fetchmail
k?nnen Benutzer E-Mails von entfernten IMAP- und POP-Servern in leichter
zug?ngliche lokale Postf?cher laden. fetchmail wird aus dem Port
`mail/fetchmail <http://www.freebsd.org/cgi/url.cgi?ports/mail/fetchmail/pkg-descr>`__
installiert. Das Programm bietet unter anderem folgende Funktionen:

.. raw:: html

   <div class="itemizedlist">

-  fetchmail beherrscht die Protokolle POP3, APOP, KPOP, IMAP, ETRN und
   ODMR.

-  E-Mails k?nnen mit SMTP weiterverarbeitet werden. Dadurch ist
   garantiert, dass Filter, Weiterleitungen und Aliase weiterhin
   funktionieren.

-  Das Programm kann als Dienst laufen und periodisch neue Nachrichten
   abrufen.

-  fetchmail kann mehrere Postf?cher abfragen und je nach Konfiguration
   die E-Mails an verschiedene lokale Benutzer zustellen.

.. raw:: html

   </div>

Wegen des Funktionsumfangs von fetchmail k?nnen hier nur grundlegende
Funktionen beschrieben werden. fetchmail ben?tigt die
Konfigurationsdatei ``.fetchmailrc``. In dieser Datei werden
Informationen ?ber Server wie auch Benutzerdaten und Passw?rter
hinterlegt. Wegen des kritischen Inhalts von ``.fetchmailrc`` sollte die
Datei nur lesbar f?r den Benutzer sein:

.. code:: screen

    % chmod 600 .fetchmailrc

Die folgende ``.fetchmailrc`` zeigt, wie das Postfach eines einzelnen
Benutzers mit POP heruntergeladen wird. fetchmail wird angewiesen, eine
Verbindung zu ``example.com`` herzustellen und sich dort als Benutzer
``joesoap`` mit dem Passwort ``XXX`` anzumelden. Das Beispiel setzt
voraus, dass es der Benutzer ``joesoap`` auch auf dem lokalen System
existiert.

.. code:: programlisting

    poll example.com protocol pop3 username "joesoap" password "XXX"

Im folgenden Beispiel werden mehrere POP- und IMAP-Server benutzt. Wo
notwendig, werden E-Mails auf andere lokale Konten umgeleitet:

.. code:: programlisting

    poll example.com proto pop3:
    user "joesoap", with password "XXX", is "jsoap" here;
    user "andrea", with password "XXXX";
    poll example2.net proto imap:
    user "john", with password "XXXXX", is "myth" here;

Sie k?nnen fetchmail als Dienst starten. Verwenden Sie dazu die
Kommandozeilenoption ``-d`` gefolgt von einer Zeitspanne in Sekunden,
die angibt, wie oft die Server aus der Datei ``.fetchmailrc`` abgefragt
werden sollen. Mit dem nachstehenden Befehl fragt fetchmail die Server
alle 600?Sekunden ab:

.. code:: screen

    % fetchmail -d 600

Mehr ?ber fetchmail erfahren Sie auf der Seite
``http://fetchmail.berlios.de/``.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------+-------------------------------+----------------------------------------+
| `Zur?ck <mail-agents.html>`__?   | `Nach oben <mail.html>`__     | ?\ `Weiter <mail-procmail.html>`__     |
+----------------------------------+-------------------------------+----------------------------------------+
| 30.12. E-Mail-Programme?         | `Zum Anfang <index.html>`__   | ?30.14. E-Mails mit procmail filtern   |
+----------------------------------+-------------------------------+----------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
