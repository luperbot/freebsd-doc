===========================
14.7. Benutzer einschr?nken
===========================

.. raw:: html

   <div class="navheader">

14.7. Benutzer einschr?nken
`Zur?ck <users-modifying.html>`__?
Kapitel 14. Benutzer und grundlegende Account-Verwaltung
?\ `Weiter <users-groups.html>`__

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

14.7. Benutzer einschr?nken
---------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn ein System von mehreren Benutzern verwendet wird, ist es vielleicht
notwendig, den Gebrauch des Systems zu beschr?nken. FreeBSD bietet dem
Systemadministrator mehrere M?glichkeiten die System-Ressourcen, die ein
einzelner Benutzer verwenden kann, einzuschr?nken. Diese Limitierungen
sind in zwei Kategorien eingeteilt: Festplattenkontingente und andere
Ressourcenbeschr?nkungen.

Festplatten-Kontingente schr?nken den Plattenplatz, der einem Benutzer
zur Verf?gung steht, ein. Sie bieten zudem, ohne aufw?ndige Berechnung,
einen schnellen ?berblick ?ber den verbrauchten Plattenplatz.
Kontingente werden in `Abschnitt?19.15,
„Dateisystem-Quotas“ <quotas.html>`__ diskutiert.

Die Login-Klassen werden in ``/etc/login.conf`` definiert. Auf die
pr?zisen Semantiken gehen wir hier nicht weiter ein, sie k?nnen jedoch
in
`login.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=login.conf&sektion=5>`__
nachgelesen werden. Es ist ausreichend zu sagen, dass jeder Benutzer
einer Login-Klasse zugewiesen wird (standardm??ig ``default``) und dass
jede Login-Klasse mit einem Satz von Login-F?higkeiten verbunden ist.
Eine Login-F?higkeit ist ein ``Name=Wert       `` Paar, in dem
*``Name``* die F?higkeit bezeichnet und *``Wert``* ein willk?rlicher
Text ist, der je nach *``Name       ``* entsprechend verarbeitet wird.
Login-Klassen und -F?higkeiten zu definieren, ist fast schon
selbsterkl?rend und wird auch in
`login.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=login.conf&sektion=5>`__
beschrieben.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Das System verwendet die Datei ``/etc/login.conf`` normalerweise nicht
direkt, sondern nur ?ber die Datenbank ``/etc/login.conf.db``, da diese
eine schnellere Abfrage erlaubt. Der nachstehende Befehl erzeugt die
Datenbank ``/etc/login.conf.db`` aus der Datei ``/etc/login.conf``:

.. code:: screen

    # cap_mkdb /etc/login.conf

.. raw:: html

   </div>

Ressourcenbeschr?nkungen unterscheiden sich von normalen
Login-F?higkeiten zweifach. Erstens gibt es f?r jede Beschr?nkung ein
aktuelles und ein maximales Limit. Das aktuelle Limit kann vom Benutzer
oder einer Anwendung beliebig bis zum maximalen Limit ver?ndert werden.
Letzteres kann der Benutzer nur heruntersetzen. Zweitens gelten die
meisten Ressourcenbeschr?nkungen f?r jeden vom Benutzer gestarteten
Prozess, nicht f?r den Benutzer selbst. Beachten Sie jedoch, dass diese
Unterschiede durch das spezifische Einlesen der Limits und nicht durch
das System der Login-F?higkeiten entstehen (das hei?t,
Ressourcenbeschr?nkungen sind *keine* Login-F?higkeiten).

Hier befinden sich die am h?ufigsten benutzten Ressourcenbeschr?nkungen
(der Rest kann zusammen mit den anderen Login-F?higkeiten in
`login.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=login.conf&sektion=5>`__
gefunden werden):

.. raw:: html

   <div class="variablelist">

``coredumpsize``
    Das Limit der Gr??e einer core-Datei, die von einem Programm
    generiert wird, unterliegt aus offensichtlichen Gr?nden anderen
    Limits der Festplattenbenutzung (zum Beispiel ``filesize`` oder
    Festplattenkontingenten). Es wird aber trotzdem oft als weniger
    harte Methode zur Kontrolle des Festplattenplatz-Verbrauchs
    verwendet: Da Benutzer die core-Dateien nicht selbst erstellen, und
    sie oft nicht l?schen, kann sie diese Option davor retten, dass
    ihnen kein Festplattenspeicher mehr zur Verf?gung steht, sollte ein
    gro?es Programm, wie emacs, abst?rzen.

``cputime``
    Die maximale Rechenzeit, die ein Prozess eines Benutzers verbrauchen
    darf. ?berschreitet der Prozess diesen Wert, wird er vom Kernel
    beendet.

    .. raw:: html

       <div class="note" xmlns="">

    Anmerkung:
    ~~~~~~~~~~

    Die Rechen*zeit* wird limitiert, nicht die prozentuale
    Prozessorenbenutzung, wie es in einigen Feldern in
    `top(1) <http://www.FreeBSD.org/cgi/man.cgi?query=top&sektion=1>`__
    und
    `ps(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ps&sektion=1>`__
    dargestellt wird. Letzteres war zu der Zeit, als dies hier
    geschrieben wurde nicht m?glich und w?rde eher nutzlos sein: Ein
    Compiler – ein wahrscheinlich legitimer Vorgang – kann leicht fast
    100% des Prozessors in Anspruch nehmen.

    .. raw:: html

       </div>

``filesize``
    Hiermit l?sst sich die maximale Gr??e einer Datei bestimmen, die der
    Benutzer besitzen darf. Im Gegensatz zu
    `Festplattenkontingenten <quotas.html>`__ ist diese Beschr?nkung nur
    f?r jede einzelne Datei g?ltig und nicht f?r den Platz, den alle
    Dateien eines Benutzers verwenden.

``maxproc``
    Das ist die maximale Anzahl von Prozessen, die ein Benutzer starten
    darf, und beinhaltet sowohl Vordergrund- als auch
    Hintergrundprozesse. Nat?rlich darf dieser Wert nicht h?her sein als
    das System-Limit, das in ``kern.maxproc`` angegeben ist. Vergessen
    Sie auch nicht, dass ein zu kleiner Wert den Benutzer in seiner
    Produktivit?t einschr?nken k?nnte; es ist oft n?tzlich, mehrfach
    eingeloggt zu sein, oder *Pipelines*
    `:sup:`[8]` <#ftn.idp77991248>`__ zu verwenden. Ein paar Aufgaben,
    wie die Kompilierung eines gro?en Programms, starten mehrere
    Prozesse (zum Beispiel
    `make(1) <http://www.FreeBSD.org/cgi/man.cgi?query=make&sektion=1>`__,
    `cc(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cc&sektion=1>`__
    und andere).

``memorylocked``
    Dieses Limit gibt an, wie viel virtueller Speicher von einem Prozess
    maximal im Arbeitsspeicher festgesetzt werden kann. (siehe auch
    `mlock(2) <http://www.FreeBSD.org/cgi/man.cgi?query=mlock&sektion=2>`__).
    Ein paar systemkritische Programme, wie
    `amd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=amd&sektion=8>`__,
    verhindern damit einen Systemzusammenbruch, der auftreten k?nnte,
    wenn sie aus dem Speicher genommen werden.

``memoryuse``
    Bezeichnet den maximalen Speicher, den ein Prozess benutzen darf und
    beinhaltet sowohl Arbeitsspeicher-, als auch Swap- Benutzung. Es ist
    kein all?bergreifendes Limit f?r den Speicherverbrauch, aber ein
    guter Anfang.

``openfiles``
    Mit diesem Limit l?sst sich die maximale Anzahl der von einem
    Prozess des Benutzers ge?ffneten Dateien festlegen. In FreeBSD
    werden Dateien auch verwendet, um Sockets und *IPC*-Kan?le
    `:sup:`[9]` <#ftn.idp78014928>`__ darzustellen. Setzen Sie es
    deshalb nicht zu niedrig. Das System-Limit ist im ``kern.maxfiles``
    `sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
    definiert.

``sbsize``
    Dieses Limit beschr?nkt den Netzwerk-Speicher, und damit die mbufs,
    die ein Benutzer verbrauchen darf. Es stammt aus einer Antwort auf
    einen DoS-Angriff, bei dem viele Netzwerk-Sockets ge?ffnet wurden,
    kann aber generell dazu benutzt werden Netzwerk-Verbindungen zu
    beschr?nken.

``stacksize``
    Das ist die maximale Gr??e, auf die der Stack eines Prozesses
    heranwachsen darf. Das allein ist nat?rlich nicht genug, um den
    Speicher zu beschr?nken, den ein Programm verwenden darf. Es sollte
    deshalb in Verbindung mit anderen Limits gesetzt werden.

.. raw:: html

   </div>

Beim Setzen von Ressourcenbeschr?nkungen sind noch andere Dinge zu
beachten. Nachfolgend ein paar generelle Tipps, Empfehlungen und
verschiedene Kommentare.

.. raw:: html

   <div class="itemizedlist">

-  Von ``/etc/rc`` beim Hochfahren des Systems gestartete Prozesse
   werden der ``daemon`` Login-Klasse zugewiesen.

-  Obwohl das mitgelieferte ``/etc/login.conf`` eine Quelle von
   vern?nftigen Limits darstellt, k?nnen nur Sie, der Administrator,
   wissen, was f?r Ihr System angebracht ist. Ein Limit zu hoch
   anzusetzen k?nnte Ihr System f?r Missbrauch ?ffnen, und ein zu
   niedriges Limit der Produktivit?t einen Riegel vorschieben.

-  Benutzer des X-Window Systems (X11) sollten wahrscheinlich mehr
   Ressourcen zugeteilt bekommen als andere Benutzer. X11 beansprucht
   selbst schon eine Menge Ressourcen, verleitet die Benutzer aber auch,
   mehrere Programme gleichzeitig laufen zu lassen.

-  Bedenken Sie, dass viele Limits f?r einzelne Prozesse gelten und
   nicht f?r den Benutzer selbst. Setzt man zum Beispiel ``openfiles``
   auf 50, kann jeder Prozess des Benutzers bis zu 50 Dateien ?ffnen.
   Dadurch ist die maximale Anzahl von Dateien, die von einem Benutzer
   ge?ffnet werden k?nnen, ``openfiles`` mal ``maxproc``. Das gilt auch
   f?r den Speicherverbrauch.

.. raw:: html

   </div>

Weitere Informationen ?ber Ressourcenbeschr?nkungen, Login-Klassen und
-F?higkeiten enthalten die Hilfeseiten
`cap\_mkdb(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cap_mkdb&sektion=1>`__,
`getrlimit(2) <http://www.FreeBSD.org/cgi/man.cgi?query=getrlimit&sektion=2>`__
und
`login.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=login.conf&sektion=5>`__.

.. raw:: html

   <div class="footnotes">

--------------

.. raw:: html

   <div id="ftn.idp77991248" class="footnote">

`:sup:`[8]` <#idp77991248>`__\ *Pipeline* = *Leitung*. Mit *Pipes* sind
Verbindungen zwischen zwei Sockets in meistens zwei verschiedenen
Prozessen gemeint.

.. raw:: html

   </div>

.. raw:: html

   <div id="ftn.idp78014928" class="footnote">

`:sup:`[9]` <#idp78014928>`__\ *IPC* steht f?r *Interprocess
Communication*.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+-------------------------------+-------------------------------------+
| `Zur?ck <users-modifying.html>`__?   | `Nach oben <users.html>`__    | ?\ `Weiter <users-groups.html>`__   |
+--------------------------------------+-------------------------------+-------------------------------------+
| 14.6. Accounts ver?ndern?            | `Zum Anfang <index.html>`__   | ?14.8. Gruppen                      |
+--------------------------------------+-------------------------------+-------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
