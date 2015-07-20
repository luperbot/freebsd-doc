==================================================
30.9. Ausgehende E-Mail ?ber einen Relay versenden
==================================================

.. raw:: html

   <div class="navheader">

30.9. Ausgehende E-Mail ?ber einen Relay versenden
`Zur?ck <SMTP-UUCP.html>`__?
Kapitel 30. Elektronische Post (E-Mail)
?\ `Weiter <SMTP-dialup.html>`__

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

30.9. Ausgehende E-Mail ?ber einen Relay versenden
--------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Beigetragen von Bill Moran.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In vielen F?llen wollen Sie E-Mail nur ?ber einen Relay verschicken. Zum
Beispiel:

.. raw:: html

   <div class="itemizedlist">

-  Sie wollen von Ihrem Arbeitsplatz Programme wie
   `send-pr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=send-pr&sektion=1>`__
   benutzen. Dazu soll der Relay Ihres ISPs verwendet werden.

-  Ein Server, der E-Mails nicht selbst verarbeitet, soll alle E-Mails
   zu einem Relay schicken.

.. raw:: html

   </div>

So ziemlich jeder MTA kann diese Aufgaben erf?llen. Leider ist es oft
schwierig, einen vollwertigen MTA so zu konfigurieren, dass er lediglich
ausgehende E-Mails weiterleitet. Es ist ?bertrieben, Programme wie
sendmail und postfix nur f?r diesen Zweck einzusetzen.

Weiterhin kann es sein, dass die Bestimmungen Ihres Internetzugangs es
verbieten, einen eigenen Mail-Server zu betreiben.

Um die hier beschriebenen Anforderungen zu erf?llen, installieren Sie
einfach den Port
`mail/ssmtp <http://www.freebsd.org/cgi/url.cgi?ports/mail/ssmtp/pkg-descr>`__.
F?hren Sie dazu als ``root`` die nachstehenden Befehle aus:

.. code:: screen

    # cd /usr/ports/mail/ssmtp
    # make install replace clean

Nach der Installation konfigurieren Sie
`mail/ssmtp <http://www.freebsd.org/cgi/url.cgi?ports/mail/ssmtp/pkg-descr>`__
mit den folgenden vier Zeilen in ``/usr/local/etc/ssmtp/ssmtp.conf``:

.. code:: programlisting

    root=yourrealemail@example.com
    mailhub=mail.example.com
    rewriteDomain=example.com
    hostname=_HOSTNAME_

Stellen Sie sicher, dass Sie eine g?ltige E-Mail-Adresse f?r ``root``
verwenden. Geben Sie f?r ``mail.example.com`` den Mail-Relay Ihres ISPs
an (einige ISPs nennen den Relay „Postausgangsserver“ oder
„SMTP-Server“).

Deaktivieren Sie sendmail indem Sie in ``/etc/rc.conf``
``sendmail_enable="NONE"`` angeben.

`mail/ssmtp <http://www.freebsd.org/cgi/url.cgi?ports/mail/ssmtp/pkg-descr>`__
verf?gt ?ber weitere Optionen. Die Musterkonfiguration in
``/usr/local/etc/ssmtp`` oder die Hilfeseite von ssmtp enthalten weitere
Beispiele.

Wenn Sie ssmtp wie hier beschrieben eingerichtet haben, funktionieren
Anwendungen, die E-Mails von Ihrem Rechner verschicken. Sie versto?en
damit auch nicht gegen Bestimmungen Ihres ISPs und laufen nicht in
Gefahr, dass Ihr Rechner zum Versenden von Spams missbraucht wird.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------+-------------------------------+--------------------------------------------+
| `Zur?ck <SMTP-UUCP.html>`__?   | `Nach oben <mail.html>`__     | ?\ `Weiter <SMTP-dialup.html>`__           |
+--------------------------------+-------------------------------+--------------------------------------------+
| 30.8. SMTP ?ber UUCP?          | `Zum Anfang <index.html>`__   | ?30.10. E-Mail ?ber Einwahl-Verbindungen   |
+--------------------------------+-------------------------------+--------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
