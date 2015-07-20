===================================
30.14. E-Mails mit procmail filtern
===================================

.. raw:: html

   <div class="navheader">

30.14. E-Mails mit procmail filtern
`Zur?ck <mail-fetchmail.html>`__?
Kapitel 30. Elektronische Post (E-Mail)
?\ `Weiter <network-servers.html>`__

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

30.14. E-Mails mit procmail filtern
-----------------------------------

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

Mit procmail l?sst sich eingehende E-Mail sehr gut filtern. Benutzer
k?nnen Regeln f?r eingehende E-Mails definieren, die E-Mails zu anderen
Postf?chern oder anderen E-Mail-Adressen umleiten. procmail befindet
sich im Port
`mail/procmail <http://www.freebsd.org/cgi/url.cgi?ports/mail/procmail/pkg-descr>`__.
procmail kann leicht in die meisten MTAs integriert werden. Lesen Sie
dazu bitte die Dokumentation des verwendeten MTAs. Alternativ kann
procmail in das E-Mail-System eingebunden werden, indem die nachstehende
Zeile in die Datei ``.forward`` im Heimatverzeichnis eines Benutzers
eingef?gt wird:

.. code:: programlisting

    "|exec /usr/local/bin/procmail || exit 75"

Im Folgenden zeigen wir einige einfache procmail-Regeln und beschreiben
kurz den Zweck der Zweck der Regeln. Die Regeln m?ssen in die Datei
``.procmailrc`` im Heimatverzeichnis des Benutzers eingef?gt werden.

Den Gro?teil dieser Regeln finden Sie auch in der Hilfeseite
`procmailex(5) <http://www.FreeBSD.org/cgi/man.cgi?query=procmailex&sektion=5>`__.

Alle E-Mail von ``<user@example.com>`` an die externe Adresse
``<goodmail@example2.com>`` weiterleiten:

.. code:: programlisting

    :0
    * ^From.*user@example.com
    ! goodmail@example2.com

Alle Nachrichten, die k?rzer als 1000?Bytes sind, an
``<goodmail@example2.com>`` weiterleiten:

.. code:: programlisting

    :0
    * < 1000
    ! goodmail@example2.com

Jede E-Mail, die an ``<alternate@example.com>`` geschickt wurde, im
Postfach ``alternate`` speichern:

.. code:: programlisting

    :0
    * ^TOalternate@example.com
    alternate

Jede E-Mail, die im Betreff ``Spam`` enth?lt, nach ``/dev/null``
schieben:

.. code:: programlisting

    :0
    ^Subject:.*Spam
    /dev/null

Zuletzt ein n?tzliches Rezept, das eingehende E-Mails von den
``FreeBSD.org``-Mailinglisten in ein separates Postfach f?r jede Liste
einsortiert:

.. code:: programlisting

    :0
    * ^Sender:.owner-freebsd-\/[^@]+@FreeBSD.ORG
    {
        LISTNAME=${MATCH}
        :0
        * LISTNAME??^\/[^@]+
        FreeBSD-${MATCH}
    }

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------+-------------------------------+----------------------------------------+
| `Zur?ck <mail-fetchmail.html>`__?       | `Nach oben <mail.html>`__     | ?\ `Weiter <network-servers.html>`__   |
+-----------------------------------------+-------------------------------+----------------------------------------+
| 30.13. E-Mails mit fetchmail abholen?   | `Zum Anfang <index.html>`__   | ?Kapitel 31. Netzwerkserver            |
+-----------------------------------------+-------------------------------+----------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
