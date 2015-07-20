===========================================
30.5. Wechseln des Mail?bertragungs-Agenten
===========================================

.. raw:: html

   <div class="navheader">

30.5. Wechseln des Mail?bertragungs-Agenten
`Zur?ck <sendmail.html>`__?
Kapitel 30. Elektronische Post (E-Mail)
?\ `Weiter <mail-trouble.html>`__

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

30.5. Wechseln des Mail?bertragungs-Agenten
-------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Geschrieben von Andrew Boothman.

.. raw:: html

   </div>

.. raw:: html

   <div>

Informationen entnommen aus E-Mails geschrieben von Gregory Neil
Shapiro.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wie bereits erw?hnt, ist bei FreeBSD sendmail schon als Ihr
Mail?bertragungs-Agent installiert. Deswegen ist es standardm??ig f?r
Ihre aus- und eingehenden E-Mails verantwortlich.

Jedoch wollen einige Systemadministratoren den MTA ihres Systems
wechseln, was eine Reihe von Gr?nden haben kann. Diese Gr?nde reichen
von einfach einen anderen MTA ausprobieren wollen bis hin dazu eine
bestimmte Besonderheit zu ben?tigen oder ein Paket, welches auf einen
anderen Mailer angewiesen ist. Gl?cklicherweise macht FreeBSD das
Wechseln einfach, egal aus welchem Grund.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

30.5.1. Installieren eines neuen MTA
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Sie haben eine gro?e Auswahl an verf?gbaren MTA-Programmen. Ein guter
Startpunkt ist die `FreeBSD-Ports-Sammlung <ports.html>`__, wo Sie viele
finden werden. Selbstverst?ndlich steht es Ihnen frei, jeden MTA von
?berall her zu verwenden, solange Sie ihn unter FreeBSD zum Laufen
bekommen.

Fangen Sie an, indem Sie Ihren neuen MTA installieren. Sobald er
installiert ist, gibt er Ihnen die Chance zu entscheiden ob er wirklich
Ihren Bed?rfnissen gen?gt. Zus?tzlich gibt er Ihnen die M?glichkeit die
neue Software zu konfigurieren, bevor sie den Job von sendmail
?bernimmt. Dabei sollten Sie sicherstellen, dass beim Installieren der
neuen Software keine Versuche unternommen werden, System-Programme wie
``/usr/bin/sendmail`` zu ?berschreiben. Ansonsten wurde Ihre neue
E-Mail-Software in den Dienst gestellt, bevor Sie sie konfiguriert
haben.

F?r Informationen ?ber die Konfiguration des von Ihnen gew?hlten MTAs
sehen Sie bitte in der dazugeh?rigen Dokumentation nach.

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

30.5.2. Ausschalten von sendmail
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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

Wenn Sie die Sendefunktion von sendmail deaktivieren, m?ssen Sie f?r den
E-Mail-Versand ein alternatives System installieren. Tun Sie dies nicht,
sind Systemfunktionen wie
`periodic(8) <http://www.FreeBSD.org/cgi/man.cgi?query=periodic&sektion=8>`__
nicht mehr in der Lage, ihre Resulate und Meldungen als E-Mail zu
versenden. Aber auch viele andere Teile Ihres Systems erwarten, dass Sie
?ber ein sendmail-kompatibles System verf?gen. Sind Programme auf (die
von Ihnen deaktivierten) sendmail-Bin?rdateien angewiesen, landen deren
E-Mails ansonsten in einer inaktiven sendmail-Warteschlange und k?nnen
nicht ausgeliefert werden.

.. raw:: html

   </div>

Um sendmail komplett zu deaktivieren (also inklusive der Funktion zum
Versand von E-Mails), f?gen Sie die Zeile

.. code:: programlisting

    sendmail_enable="NO"
    sendmail_submit_enable="NO"
    sendmail_outbound_enable="NO"
    sendmail_msp_queue_enable="NO"

in ``/etc/rc.conf`` ein.

Wenn Sie lediglich die Funktion zum Empfang von E-Mails durch sendmail
deaktivieren wollen, sollten Sie folgenden Eintrag in ``/etc/rc.conf``
einf?gen:

.. code:: programlisting

    sendmail_enable="NO"

Weitere Informationen zu den Startoptionen von sendmail finden Sie in
der Manualpage
`rc.sendmail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.sendmail&sektion=8>`__.

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

30.5.3. Starten Ihres neuen MTA beim Hochfahren des Systems
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Der neue MTA kann beim Hochfahren durch das Hinzuf?gen einer
Konfigurationszeile in der ``/etc/rc.conf`` gestartet werden, wie das
folgende Beispiel f?r Postfix zeigt:

.. code:: screen

    # echo 'postfix_enable=„YES“' >> /etc/rc.conf

Der MTA wird jetzt automatisch beim Hochfahren des Systems gestartet.

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

30.5.4. Ersetzen von sendmail als Standard-Mailer des Systems
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das Programm sendmail ist so allgegenw?rtig als Standard-Software auf
UNIX? Systemen, dass einige Programme einfach annehmen es sei bereits
installiert und konfiguriert. Aus diesem Grund stellen viele alternative
MTAs ihre eigenen kompatiblen Implementierung der sendmail
Kommandozeilen-Schnittstelle zur Verf?gung. Das vereinfacht ihre
Verwendung als „drop-in“ Ersatz f?r sendmail.

Folglich werden Sie, wenn Sie einen alternativen Mailer benutzen,
sicherstellen m?ssen, dass ein Programm, das versucht sendmails
Standard-Dateien wie ``/usr/bin/sendmail`` auszuf?hren, stattdessen Ihr
gew?hltes Mail?bertragungsprogramm ausf?hrt. Zum Gl?ck stellt FreeBSD
das
`mailwrapper(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mailwrapper&sektion=8>`__-System
zur Verf?gung, das diese Arbeit f?r Sie erledigt.

Wenn sendmail arbeitet wie es installiert wurde, werden Sie in
``/etc/mail/mailer.conf`` etwas wie das Folgende vorfinden:

.. code:: programlisting

    sendmail  /usr/libexec/sendmail/sendmail
    send-mail   /usr/libexec/sendmail/sendmail
    mailq       /usr/libexec/sendmail/sendmail
    newaliases  /usr/libexec/sendmail/sendmail
    hoststat    /usr/libexec/sendmail/sendmail
    purgestat   /usr/libexec/sendmail/sendmail

Das bedeutet, dass wenn eines der gew?hnlichen Kommandos (wie zum
Beispiel ``/usr/bin/sendmail`` selbst) ausgef?hrt wird, das System
tats?chlich eine Kopie des mailwrapper mit dem Namen ``sendmail``
startet, die ``mailer.conf`` ?berpr?ft und
``/usr/libexec/sendmail/sendmail`` ausf?hrt. Mit diesem System lassen
sich die Programme, die f?r die sendmail-Funktionen gestartet werden,
leicht ?ndern.

Daher k?nnten Sie, wenn Sie wollten, dass
``/usr/local/supermailer/bin/sendmail-compat`` anstelle von sendmail
ausgef?hrt wird, ``/etc/mailer.conf`` wie folgt ab?ndern:

.. code:: programlisting

    sendmail  /usr/local/supermailer/bin/sendmail-compat
    send-mail   /usr/local/supermailer/bin/sendmail-compat
    mailq       /usr/local/supermailer/bin/mailq-compat
    newaliases  /usr/local/supermailer/bin/newaliases-compat
    hoststat    /usr/local/supermailer/bin/hoststat-compat
    purgestat   /usr/local/supermailer/bin/purgestat-compat

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

30.5.5. Fertigstellen
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Sobald Sie alles Ihren W?nschen entsprechend konfiguriert haben, sollten
Sie entweder die sendmail Prozesse beenden, die Sie nicht mehr
ben?tigen, und die zu Ihrer neuen Software zugeh?rigen Prozesse starten,
oder einfach das System neustarten. Das Neustarten des Systems gibt
Ihnen auch die Gelegenheit sicherzustellen, dass Sie Ihr System korrekt
konfiguriert haben, um Ihren neuen MTA automatisch beim Hochfahren zu
starten.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------+-------------------------------+-------------------------------------+
| `Zur?ck <sendmail.html>`__?     | `Nach oben <mail.html>`__     | ?\ `Weiter <mail-trouble.html>`__   |
+---------------------------------+-------------------------------+-------------------------------------+
| 30.4. sendmail-Konfiguration?   | `Zum Anfang <index.html>`__   | ?30.6. Fehlerbehebung               |
+---------------------------------+-------------------------------+-------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
