================
14.2. Einf?hrung
================

.. raw:: html

   <div class="navheader">

14.2. Einf?hrung
`Zur?ck <users.html>`__?
Kapitel 14. Benutzer und grundlegende Account-Verwaltung
?\ `Weiter <users-superuser.html>`__

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

14.2. Einf?hrung
----------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Jeder Zugriff auf das System geschieht ?ber Accounts und alle Prozesse
werden von Benutzern gestartet, also sind Benutzer- und
Account-Verwaltung von wesentlicher Bedeutung in FreeBSD-Systemen.

Mit jedem Account eines FreeBSD-Systems sind bestimmte Informationen
verkn?pft, die diesen Account identifizieren.

.. raw:: html

   <div class="variablelist">

Loginnamen
    Den Loginnamen geben Sie bei der Anmeldung ein, wenn Sie dazu mit
    ``login:`` aufgefordert werden. Loginnamen m?ssen auf dem System
    eindeutig sein, das hei?t auf einem System kann es nicht zwei
    Accounts mit demselben Loginnamen geben. In
    `passwd(5) <http://www.FreeBSD.org/cgi/man.cgi?query=passwd&sektion=5>`__
    wird beschrieben, wie ein g?ltiger Loginname gebildet wird.
    Normalerweise sollten Sie Namen verwenden, die aus Kleinbuchstaben
    bestehen und bis zu acht Zeichen lang sind.

Passwort
    Mit jedem Account ist ein Passwort verkn?pft. Wenn das Passwort leer
    ist, wird es bei der Anmeldung nicht abgefragt. Das ist allerdings
    nicht zu empfehlen, daher sollte jeder Account ein Passwort
    besitzen.

User ID (UID)
    Die UID ist ?blicherweise eine Zahl zwischen 0 und
    65535`:sup:`[7]` <#ftn.users-largeuidgid>`__, die einen Account
    eindeutig identifiziert. Intern verwendet FreeBSD nur die UID,
    Loginnamen werden zuerst in eine UID umgewandelt, mit der das System
    dann weiter arbeitet. Das bedeutet, dass Sie Accounts mit
    unterschiedlichen Loginnamen aber gleicher UID einrichten k?nnen.
    Vom Standpunkt des Systems handelt es sich dabei um denselben
    Account. In der Praxis werden Sie diese Eigenschaft des Systems
    wahrscheinlich nicht benutzen.

Group ID (GID)
    Die GID ist ?blicherweise eine Zahl zwischen 0 und
    65536\ `:sup:`[7]` <users-introduction.html#ftn.users-largeuidgid>`__,
    die eine Gruppe eindeutig identifiziert. Mit Gruppen kann der
    Zugriff auf Ressourcen ?ber die GID anstelle der UID geregelt
    werden. Einige Konfigurationsdateien werden durch diesen Mechanismus
    deutlich kleiner. Ein Account kann mehreren Gruppen zugeh?ren.

Login-Klasse
    Login-Klassen erweitern das Gruppenkonzept. Sie erh?hen die
    Flexibilit?t des Systems in der Handhabung der verschiedenen
    Accounts.

G?ltigkeit von Passw?rtern
    Ein regelm??iges ?ndern des Passworts wird in der Voreinstellung von
    FreeBSD nicht erzwungen. Sie k?nnen allerdings einen Passwortwechsel
    nach einer gewissen Zeit auf Basis einzelner Accounts erzwingen.

Verfallszeit eines Accounts
    In der Voreinstellung verfallen unter FreeBSD keine Accounts. Wenn
    Sie Accounts einrichten, die nur f?r eine bestimmte Zeit g?ltig sein
    sollen, beispielsweise Accounts f?r Teilnehmer eines Praktikums,
    k?nnen Sie angeben, wie lange der Account g?ltig sein soll. Nachdem
    die angegebene Zeitspanne verstrichen ist, kann dieser Account nicht
    mehr zum Anmelden verwendet werden, obwohl alle Verzeichnisse und
    Dateien, die diesem Account geh?ren, noch vorhanden sind.

vollst?ndiger Benutzername
    FreeBSD identifiziert einen Account eindeutig ?ber den Loginnamen,
    der aber keine ?hnlichkeit mit dem richtigen Namen des Benutzers
    haben muss. Der vollst?ndige Benutzername kann daher beim Einrichten
    eines Accounts angegeben werden.

Heimatverzeichnis
    Das Heimatverzeichnis gibt den vollst?ndigen Pfad zu dem Verzeichnis
    an, in dem sich der Benutzer nach erfolgreicher Anmeldung befindet.
    Es ist ?blich, alle Heimatverzeichnisse unter ``/home/Loginname``
    oder ``/usr/home/Loginname`` anzulegen. Im Heimatverzeichnis oder in
    dort angelegten Verzeichnissen werden die Dateien eines Benutzers
    gespeichert.

Login-Shell
    Grunds?tzlich ist die Schnittstelle zum System eine Shell, von denen
    es viele unterschiedliche gibt. Die bevorzugte Shell eines Benutzers
    kann seinem Account zugeordnet werden.

.. raw:: html

   </div>

Es gibt drei Haupttypen von Accounts: Der
`Superuser <users-superuser.html>`__,
`Systembenutzer <users-system.html>`__ und
`Benutzer-Accounts <users-user.html>`__. Der Superuser-Account,
normalerweise ``root`` genannt, wird benutzt, um das System ohne
Beschr?nkungen auf Privilegien zu verwalten. Systembenutzer starten
Dienste. Abschlie?end werden Benutzer-Accounts von echten Menschen
genutzt, die sich einloggen, Mails lesen und so weiter.

.. raw:: html

   <div class="footnotes">

--------------

.. raw:: html

   <div id="ftn.users-largeuidgid" class="footnote">

`:sup:`[7]` <#users-largeuidgid>`__\ F?r UIDs und GIDs k?nnen Zahlen bis
einschlie?lich 4294967295 verwendet werden. Allerdings k?nnen solche IDs
erhebliche Probleme mit Anwendungen verursachen, die Annahmen ?ber den
Wertebereich der IDs treffen.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------------------------------+-------------------------------+----------------------------------------+
| `Zur?ck <users.html>`__?                                    | `Nach oben <users.html>`__    | ?\ `Weiter <users-superuser.html>`__   |
+-------------------------------------------------------------+-------------------------------+----------------------------------------+
| Kapitel 14. Benutzer und grundlegende Account-Verwaltung?   | `Zum Anfang <index.html>`__   | ?14.3. Der Superuser-Account           |
+-------------------------------------------------------------+-------------------------------+----------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
