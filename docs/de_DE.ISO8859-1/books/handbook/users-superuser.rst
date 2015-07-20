===========================
14.3. Der Superuser-Account
===========================

.. raw:: html

   <div class="navheader">

14.3. Der Superuser-Account
`Zur?ck <users-introduction.html>`__?
Kapitel 14. Benutzer und grundlegende Account-Verwaltung
?\ `Weiter <users-system.html>`__

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

14.3. Der Superuser-Account
---------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Der Superuser-Account, normalerweise ``root`` genannt, ist
vorkonfiguriert und erleichtert die Systemverwaltung, sollte aber nicht
f?r allt?gliche Aufgaben wie das Verschicken und Empfangen von Mails,
Entdecken des Systems oder Programmierung benutzt werden.

Das ist so, da der Superuser im Gegensatz zu normalen Benutzer-Accounts
ohne Beschr?nkungen operiert und falsche Anwendung des
Superuser-Accounts in spektakul?ren Katastrophen resultieren kann.
Benutzer-Accounts sind nicht in der Lage, das System versehentlich zu
zerst?ren, deswegen ist es generell am besten normale Benutzer-Accounts
zu verwenden, solange man nicht haupts?chlich die extra Privilegien
ben?tigt.

Kommandos, die Sie als Superuser eingeben, sollten Sie immer doppelt und
dreifach ?berpr?fen, da ein zus?tzliches Leerzeichen oder ein fehlender
Buchstabe irreparablen Datenverlust bedeuten kann.

Das erste, das Sie tun sollten, nachdem Sie dieses Kapitel gelesen
haben, ist einen unprivilegierten Benutzer f?r Ihre eigene normale
Benutzung zu erstellen, wenn Sie das nicht bereits getan haben. Das
trifft immer zu, egal ob Sie ein Mehrbenutzersystem oder ein System
laufen haben, welches Sie alleine benutzen. Sp?ter in diesem Kapitel
besprechen wir, wie man zus?tzliche Accounts erstellt und wie man
zwischen dem normalen Benutzer und dem Superuser wechselt.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------+-------------------------------+-------------------------------------+
| `Zur?ck <users-introduction.html>`__?   | `Nach oben <users.html>`__    | ?\ `Weiter <users-system.html>`__   |
+-----------------------------------------+-------------------------------+-------------------------------------+
| 14.2. Einf?hrung?                       | `Zum Anfang <index.html>`__   | ?14.4. System-Accounts              |
+-----------------------------------------+-------------------------------+-------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
