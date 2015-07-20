=================
15.6. TCP-Wrapper
=================

.. raw:: html

   <div class="navheader">

15.6. TCP-Wrapper
`Zur?ck <one-time-passwords.html>`__?
Kapitel 15. Sicherheit
?\ `Weiter <kerberos5.html>`__

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

15.6. TCP-Wrapper
-----------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Beigetragen von Tom Rhodes.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wahrscheinlich hat jeder, der
`inetd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=inetd&sektion=8>`__
kennt, schon mal von den TCP-Wrappern geh?rt. Die wenigsten erkennen den
vollen Nutzen der TCP-Wrapper in einer Netzumgebung. Es scheint, dass
die meisten Leute Netzverbindungen mit einer Firewall absichern wollen.
Auch wenn eine Firewall ein m?chtiges Instrument ist, gibt es Sachen,
die eine Firewall nicht kann. Eine Firewall kann beispielsweise keine
Nachricht an den Verbindungsursprung senden. Genau das und mehr k?nnen
aber die TCP-Wrapper. Im Folgenden werden die Funktionen der TCP-Wrapper
und Beispiele f?r deren Konfiguration vorgestellt.

Die TCP-Wrapper erweitern die Steuerungsm?glichkeiten, die inetd ?ber
die Dienste unter seiner Kontrolle hat. Beispielsweise k?nnen
Verbindungen protokolliert, Nachrichten zur?ckgesandt oder nur interne
Verbindungen angenommen werden. Die TCP-Wrapper bieten nicht nur eine
weitere Sicherheitsschicht, die teilweise auch von Firewalls geboten
wird, sie bieten dar?ber hinaus Funktionen zur Steuerung von
Verbindungen, die eine Firewall nicht bietet.

Die erweiterten Funktionen der TCP-Wrapper sind kein Firewall-Ersatz.
Sie sollten zusammen mit einer Firewall und anderen
Sicherheitsvorkehrungen eingesetzt werden. Die TCP-Wrapper sind eine
weitere Sicherheitsschicht zum Schutz eines Systems.

Da die Wrapper die Funktion von inetd erweitern, wird im Folgenden
vorausgesetzt, dass Sie den Abschnitt ?ber die
`inetd-Konfiguration <network-inetd.html>`__ schon gelesen haben.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Streng genommen handelt es sich bei den von
`inetd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=inetd&sektion=8>`__
gestarteten Programmen nicht um „Daemonen“. Da sich diese Bezeichnung
aber eingeb?rgert hat, wird sie auch in diesem Abschnitt verwendet.

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

15.6.1. TCP-Wrapper einrichten
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Um die TCP-Wrapper unter FreeBSD zu benutzen, muss nur der inetd aus
``rc.conf`` mit den voreingestellten Optionen ``-Ww`` gestartet werden.
Die Konfigurationsdatei ``/etc/hosts.allow`` darf keine Fehler
enthalten; falls doch, werden die Fehler mit
`syslogd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=syslogd&sektion=8>`__
protokolliert.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Im Gegensatz zu anderen Implementationen der TCP-Wrapper wird vom
Gebrauch der Datei ``hosts.deny`` abgeraten. Die Konfiguration sollte
sich vollst?ndig in der Datei ``/etc/hosts.allow`` befinden.

.. raw:: html

   </div>

In der einfachsten Konfiguration werden Dienste abh?ngig vom Inhalt der
Datei ``/etc/hosts.allow`` erlaubt oder gesperrt. Unter FreeBSD wird in
der Voreinstellung jeder von inetd gestartete Dienst erlaubt. Sehen wir
uns zun?chst die Grundkonfiguration an.

Eine Konfigurationszeile ist wie folgt aufgebaut:
``Dienst : Adresse : Aktion``. ``Dienst`` ist der von inetd gestartete
Dienst (auch Daemon genannt). Die ``Adresse`` kann ein g?ltiger
Rechnername, eine IP-Adresse oder eine IPv6-Adresse in Klammern
(``[``?\ ``]``) sein. Der Wert ``allow`` im Feld ``Aktion`` erlaubt
Zugriffe, der Wert ``deny`` verbietet Zugriffe. Die Zeilen in
``hosts.allow`` werden f?r jede Verbindung der Reihe nach abgearbeitet.
Trifft eine Zeile auf eine Verbindung zu, wird die entsprechende Aktion
ausgef?hrt und die Abarbeitung ist beendet.

Es gibt noch weitere Konfigurationsoptionen, die gleich erl?utert
werden. Das bisher Gesagte reicht, um eine einfache Regel aufzustellen.
Wenn Sie einkommende POP3-Verbindungen f?r den Dienst
`mail/qpopper <http://www.freebsd.org/cgi/url.cgi?ports/mail/qpopper/pkg-descr>`__
erlauben wollen, erweitern Sie ``hosts.allow`` um die nachstehende
Zeile:

.. code:: programlisting

    # This line is required for POP3 connections:
    qpopper : ALL : allow

Nachdem Sie die Zeile hinzugef?gt haben, muss der inetd neu gestartet
werden. Sie k?nnen dazu das Kommando
`kill(1) <http://www.FreeBSD.org/cgi/man.cgi?query=kill&sektion=1>`__
verwenden oder ``/etc/rc.d/inetd restart`` ausf?hren.

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

15.6.2. Erweiterte Konfiguration der TCP-Wrapper
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die TCP-Wrapper besitzen weitere Optionen, die bestimmen, wie
Verbindungen behandelt werden. In einigen F?llen ist es gut, wenn
bestimmten Rechnern oder Diensten eine Nachricht geschickt wird. In
anderen F?llen soll vielleicht der Verbindungsaufbau protokolliert oder
eine E-Mail an einen Administrator versandt werden. Oder ein Dienst soll
nur f?r das lokale Netz bereitstehen. Dies alles ist mit so genannten
Wildcards, Metazeichen und der Ausf?hrung externer Programme m?glich und
wird in den n?chsten zwei Abschnitten erl?utert.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

15.6.2.1. Externe Kommandos ausf?hren
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Stellen Sie sich vor, eine Verbindung soll verhindert werden und
gleichzeitig soll demjenigen, der die Verbindung aufgebaut hat, eine
Nachricht geschickt werden. Auf welche Art m?ssen die TCP-Wrapper
konfiguriert werden? Die Option ``twist`` f?hrt beim Verbindungsaufbau
ein Kommando aus. In der Datei ``hosts.allow`` ist ein Beispiel f?r
diese Option enthalten:

.. code:: programlisting

    # Alle anderen Dienste sind gesch?tzt
    ALL : ALL \
            : severity auth.info \
            : twist /bin/echo "You are not welcome to use %d from %h."

F?r jeden Dienst, der nicht vorher in der Datei ``hosts.allow``
konfiguriert wurde, wird die Meldung „You are not allowed to use
``daemon`` from ``hostname``.“ zur?ckgegegeben. Dies ist besonders
n?tzlich, wenn Sie die Gegenstelle sofort benachrichtigen wollen,
nachdem die Verbindung getrennt wurde. Beachten Sie, dass der Text der
Meldung in Anf?hrungszeichen (``"``) stehen *muss*, es gibt keine
Ausnahmen zu dieser Regel.

.. raw:: html

   <div class="warning" xmlns="">

Warnung:
~~~~~~~~

Ein so konfigurierter Server ist anf?llig f?r
Denial-of-Service-Angriffe. Ein Angreifer kann die gesperrten Dienste
mit Verbindungsanfragen ?berfluten.

.. raw:: html

   </div>

Um einem Denial-of-Service-Angriff zu entgehen, benutzen Sie die Option
``spawn``. Wie die Option ``twist`` verbietet die Option ``spawn`` die
Verbindung und f?hrt externe Kommandos aus. Allerdings sendet die Option
``spawn`` der Gegenstelle keine R?ckmeldung. Sehen Sie sich die
nachstehende Konfigurationsdatei an:

.. code:: programlisting

    # Verbindungen von example.com sind gesperrt:
    ALL : .example.com \
        : spawn (/bin/echo %a from %h attempted to access %d >> \
          /var/log/connections.log) \
        : deny

Damit sind Verbindungen von der Domain ``*.example.com`` gesperrt. Jeder
Verbindungsaufbau wird zudem in der Datei ``/var/log/connections.log``
protokolliert. Das Protokoll enth?lt den Rechnernamen, die IP-Adresse
und den Dienst, der angesprochen wurde.

In der Konfigurationsdatei wurde beispielsweise das Metazeichen ``%a``
verwendet. Es gibt weitere Metazeichen, die in der Hilfeseite
`hosts\_access(5) <http://www.FreeBSD.org/cgi/man.cgi?query=hosts_access&sektion=5>`__
beschrieben werden.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

15.6.2.2. Wildcards
^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Bisher verwendeten die Beispiele immer die Wildcard ``ALL``. Es gibt
andere Wildcards, welche die Funktionalit?t ein bisschen erweitern. Die
Wildcard ``ALL`` passt beispielsweise auf jeden Dienst, jede Domain oder
jede IP-Adresse. Eine andere Wildcard ist ``PARANOID``. Sie passt auf
jeden Rechner, dessen IP-Adresse m?glicherweise gef?lscht ist. Dies ist
dann der Fall, wenn der Verbindungsaufbau von einer IP-Adresse erfolgt,
die nicht zu dem ?bermittelten Rechnernamen passt. Das folgende Beispiel
sollte das ganze etwas klarer werden lassen:

.. code:: programlisting

    # Block possibly spoofed requests to sendmail:
    sendmail : PARANOID : deny

In diesem Beispiel werden alle Verbindungen zu ``sendmail`` verboten,
die von einer IP-Adresse ausgehen, die nicht zum Rechnernamen passt.

.. raw:: html

   <div class="caution" xmlns="">

Achtung:
~~~~~~~~

Die Wildcard ``PARANOID`` kann einen Dienst unbrauchbar machen, wenn der
Client oder der Server eine fehlerhafte DNS-Konfiguration besitzt. Seien
Sie daher besonders vorsichtig, wenn Sie diese Wildcard in Ihre
Konfiguration aufnehmen wollen.

.. raw:: html

   </div>

Weiteres ?ber Wildcards und deren Funktion lesen Sie bitte in der
Hilfeseite
`hosts\_access(5) <http://www.FreeBSD.org/cgi/man.cgi?query=hosts_access&sektion=5>`__
nach.

Damit die gezeigten Beispiele funktionieren, m?ssen Sie die erste
Konfigurationszeile in der Datei ``hosts.allow`` auskommentieren.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------+---------------------------------+----------------------------------+
| `Zur?ck <one-time-passwords.html>`__?   | `Nach oben <security.html>`__   | ?\ `Weiter <kerberos5.html>`__   |
+-----------------------------------------+---------------------------------+----------------------------------+
| 15.5. Einmalpassw?rter?                 | `Zum Anfang <index.html>`__     | ?15.7. Kerberos5                 |
+-----------------------------------------+---------------------------------+----------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
