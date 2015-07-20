===========================
30.7. Weiterf?hrende Themen
===========================

.. raw:: html

   <div class="navheader">

30.7. Weiterf?hrende Themen
`Zur?ck <mail-trouble.html>`__?
Kapitel 30. Elektronische Post (E-Mail)
?\ `Weiter <SMTP-UUCP.html>`__

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

30.7. Weiterf?hrende Themen
---------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die folgenden Abschnitte behandeln kompliziertere Themen wie
E-Mail-Konfiguration und das Einrichten von E-Mail f?r Ihre ganze
Dom?ne.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

30.7.1. Grundlegende Konfiguration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Mit der Software im Auslieferungszustand sollten Sie f?hig sein, E-Mails
an externe Rechner zu senden, solange Sie ``/etc/resolv.conf``
eingerichtet haben oder Ihren eigenen Name Server laufen lassen. Wenn
Sie die E-Mails f?r Ihren Rechner zu einem anderen Rechner geliefert
haben wollen, gibt es zwei Methoden:

.. raw:: html

   <div class="itemizedlist">

-  Betreiben Sie Ihren eigenen Name Server und haben Sie Ihre eigene
   Dom?ne, zum Beispiel ``FreeBSD.org``.

-  Lassen Sie sich E-Mails direkt zu Ihrem Rechner liefern. Dies
   geschieht indem E-Mails direkt zu dem aktuellen DNS Namen Ihrer
   Maschine geliefert werden. Zum Beispiel ``example.FreeBSD.org``.

.. raw:: html

   </div>

Ungeachtet welche Methode Sie ausw?hlen, um E-Mails direkt zu Ihrem
Rechner geliefert zu bekommen, ben?tigen Sie eine permanente (statische)
IP-Adresse (keine dynamische PPP-Anwahl). Wenn Sie sich hinter einer
Firewall befinden, muss diese den SMTP-Verkehr an Sie weiterleiten.
Wollen Sie E-Mails an Ihrem Rechner selbst empfangen, m?ssen Sie eines
der folgenden Dinge sicherstellen:

.. raw:: html

   <div class="itemizedlist">

-  Vergewissern Sie sich, dass der MX-Eintrag in Ihrem DNS zu der
   IP-Adresse Ihres Rechners zeigt.

-  Stellen Sie sicher, dass sich f?r Ihren Rechner kein MX-Eintrag im
   DNS befindet.

.. raw:: html

   </div>

Jede der erw?hnten Konfigurationsm?glichkeiten erlaubt Ihnen, E-Mails
direkt auf Ihrem Rechner zu empfangen.

Versuchen Sie das:

.. code:: screen

    # hostname
    example.FreeBSD.org
    # host example.FreeBSD.org
    example.FreeBSD.org has address 204.216.27.XX

Wenn Sie diese Ausgabe erhalten, sollten direkt an
``<yourlogin@example.FreeBSD.org>`` geschickte E-Mails ohne Probleme
funktionieren.

Sehen Sie stattdessen etwas wie dies:

.. code:: screen

    # host example.FreeBSD.org
    example.FreeBSD.org has address 204.216.27.XX
    example.FreeBSD.org mail is handled (pri=10) by hub.FreeBSD.org

So wird jede an Ihren Rechner (``example.FreeBSD.org``) gesandte E-Mail
auf ``hub`` unter dem gleichen Benutzernamen gesammelt anstatt direkt zu
Ihrem Rechner geschickt zu werden.

Die obige Information wird von Ihrem DNS-Server verwaltet. Der
DNS-Eintrag, der die E-Mail Routen-Information enth?lt, ist der **M*ail
e*X*change* Eintrag. Existiert kein MX-Eintrag, werden E-Mails direkt
anhand der IP-Adresse geliefert.

Der MX-Eintrag f?r ``freefall.FreeBSD.org`` sah einmal so aus:

.. code:: programlisting

    freefall        MX  30  mail.crl.net
    freefall        MX  40  agora.rdrop.com
    freefall        MX  10  freefall.FreeBSD.org
    freefall        MX  20  who.cdrom.com

Wie Sie sehen k?nnen, hatte ``freefall`` viele MX-Eintr?ge. Die kleinste
MX-Nummer ist der Rechner, der die E-Mails letztendlich bekommt, wobei
die anderen tempor?r E-Mails in Warteschlangen einreihen w?hrend
``freefall`` besch?ftigt oder unerreichbar ist.

Um besonders n?tzlich zu sein, sollten stellvertretende MX-Seiten nicht
dieselben Internet-Verbindungen wie Ihre eigene verwenden. F?r Ihren
Internet-Dienstleister oder andere sollte es kein Problem darstellen,
Ihnen diesen Dienst zur Verf?gung zu stellen.

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

30.7.2. E-Mails f?r Ihre Dom?ne
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Um einen „E-Mail-Server“ (auch bekannt als Mail-Server) einzurichten,
ben?tigen Sie eine Umlenkung jeglicher E-Mails zu Ihm, die an die
verschiedenen Workstations gesendet werden. Im Grunde wollen Sie jede an
Ihre Dom?ne gesendete E-Mail abfangen (in diesem Fall
``*.FreeBSD.org``), damit Ihre Benutzer E-Mails mittels POP oder direkt
auf dem Server ?berpr?fen k?nnen.

Am einfachsten ist es, wenn Accounts mit gleichen *Benutzernamen* auf
beiden Maschinen existieren. Verwenden Sie
`adduser(8) <http://www.FreeBSD.org/cgi/man.cgi?query=adduser&sektion=8>`__,
um dies zu erreichen.

Der E-Mail-Server, den Sie verwenden wollen, muss als f?r den
E-Mail-Austausch zust?ndiger Rechner auf jeder Workstation im Netzwerk
gekennzeichnet werden. Dies wird in der DNS-Konfiguration so ausgef?hrt:

.. code:: programlisting

    example.FreeBSD.org  A   204.216.27.XX       ; Workstation
                MX  10 hub.FreeBSD.org  ; Mailhost

Diese Einstellung wird E-Mail f?r die Workstations zu dem E-Mail-Server
leiten, wo auch immer der A-Eintrag hinzeigt. Die E-Mails werden zum
MX-Rechner gesandt.

Sofern Sie nicht einen DNS-Server laufen haben, k?nnen Sie diese
Einstellung nicht selbst vornehmen. Ist es Ihnen nicht m?glich einen
eigenen DNS-Server laufen zu lassen, reden Sie mit Ihren
Internet-Dienstleister oder wer auch immer Ihre DNS-Verwaltung
?bernimmt.

Wenn Sie ein virtuelles E-Mail System anbieten, werden die folgenden
Informationen n?tzlich sein. F?r ein Beispiel nehmen wir an, Sie haben
einen Kunden mit einer eigenen Dom?ne, in diesem Fall ``customer1.org``
und Sie wollen jegliche E-Mails f?r ``customer1.org`` zu Ihrem
E-Mail-Server gesendet haben, der ``mail.myhost.com`` hei?t. Der Eintrag
in Ihrem DNS sollte wie folgender aussehen:

.. code:: programlisting

    customer1.org        MX  10  mail.myhost.com
          

Sie ben?tigen *keinen* A-Eintrag, wenn Sie f?r die Domain nur E-Mails
verwalten wollen.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Bedenken Sie, dass das Pingen von ``customer1.org`` nicht m?glich ist,
solange kein A-Eintrag f?r diese Dom?ne existiert.

.. raw:: html

   </div>

Jetzt m?ssen Sie nur noch sendmail auf Ihrem Mailrechner mitteilen, f?r
welche Dom?nen und/oder Rechnernamen es Mails akzeptieren soll. Es gibt
einige Wege wie dies geschehen kann. Die Folgenden funktionieren alle
gleicherma?en:

.. raw:: html

   <div class="itemizedlist">

-  F?gen Sie die Rechnernamen zu Ihrer ``/etc/sendmail.cw`` Datei hinzu,
   wenn Sie ``FEATURE(use_cw_file)`` verwenden. Ab sendmail?8.10 hei?t
   diese Datei ``/etc/mail/local-host-names``.

-  Tragen Sie eine Zeile mit dem Inhalt ``Cwyour.host.com`` in Ihre
   ``/etc/sendmail.cf`` Datei (beziehungsweise ``/etc/mail/sendmail.cf``
   ab sendmail?8.10) ein.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------+-------------------------------+----------------------------------+
| `Zur?ck <mail-trouble.html>`__?   | `Nach oben <mail.html>`__     | ?\ `Weiter <SMTP-UUCP.html>`__   |
+-----------------------------------+-------------------------------+----------------------------------+
| 30.6. Fehlerbehebung?             | `Zum Anfang <index.html>`__   | ?30.8. SMTP ?ber UUCP            |
+-----------------------------------+-------------------------------+----------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
