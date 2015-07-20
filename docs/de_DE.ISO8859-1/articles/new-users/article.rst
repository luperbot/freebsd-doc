===============================================
Informationen f?r FreeBSD- und UNIX?-Einsteiger
===============================================

.. raw:: html

   <div class="article" lang="de" lang="de">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="authorgroup" xmlns="http://www.w3.org/1999/xhtml">

.. raw:: html

   <div class="author">

Annelise Anderson
~~~~~~~~~~~~~~~~~

.. raw:: html

   <div class="affiliation">

.. raw:: html

   <div class="address">

``<andrsn@andrsn.stanford.edu>``

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div>

Version: ` <https://svnweb.freebsd.org/changeset/doc/>`__

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="legalnotice" xmlns="http://www.w3.org/1999/xhtml">

FreeBSD ist ein eingetragenes Warenzeichen der FreeBSD Foundation.

IBM, AIX, OS/2, PowerPC, PS/2, S/390 und ThinkPad sind Warenzeichen der
International Business Machines Corporation in den Vereinigten Staaten,
anderen L?ndern oder beiden.

Microsoft, MS-DOS, Outlook, Windows, Windows Media und Windows NT sind
entweder eingetragene Warenzeichen oder Warenzeichen der Microsoft
Corporation in den Vereinigten Staaten und/oder in anderen L?ndern.

Netscape und Netscape Navigator sind eingetragene Warenzeichen der
Netscape Communications Corporation in den Vereinigten Staaten und in
anderen L?ndern.

Motif, OSF/1 und UNIX sind eingetragene Warenzeichen und IT DialTone und
The Open Group sind Warenzeichen der The Open Group in den Vereinigten
Staaten und in anderen L?ndern.

Viele Produktbezeichnungen von Herstellern und Verk?ufern sind
Warenzeichen. Soweit dem FreeBSD Project das Warenzeichen bekannt ist,
werden die in diesem Dokument vorkommenden Bezeichnungen mit dem Symbol
„™“ oder dem Symbol „?“ gekennzeichnet.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div>

Zuletzt bearbeitet am 1997-08-15 von .

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="abstract" xmlns="http://www.w3.org/1999/xhtml">

.. raw:: html

   <div class="abstract-title">

Zusammenfassung

.. raw:: html

   </div>

Wir gratulieren Ihnen zur Installation von FreeBSD! Diese Einf?hrung ist
f?r alle Personen gedacht, die FreeBSD und UNIX? noch nicht kennen, und
enth?lt daher auch einige grundlegende Informationen. Es wird davon
ausgegangen, dass Sie FreeBSD?2.0.5 oder neuer in der von FreeBSD.org
ver?ffentlichten Form installiert haben sowie ?ber gute Kenntnisse von
DOS/Windows? oder OS/2? verf?gen.

*?bersetzt von Fabio Tosques*.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Inhaltsverzeichnis

.. raw:: html

   </div>

`1. An- und Abmelden <#in-and-out>`__
`2. Einen neuen Benutzer anlegen, der ``root``-Rechte erlangen
kann <#adding-a-user>`__
`3. Sich im System umsehen <#looking-around>`__
`4. Hilfe und Informationen erhalten <#getting-help>`__
`5. Textdateien bearbeiten <#editing-text>`__
`6. Dateien mit Hilfe von DOS ausdrucken <#printing-files-from-dos>`__
`7. Weitere n?tzliche Befehle <#other-useful-commands>`__
`8. Die n?chsten Schritte <#next-steps>`__
`9. Die Arbeitsumgebung <#your-working-environment>`__
`10. Einige abschlie?ende Bemerkungen <#other>`__
`11. Kommentare <#comments-welcome>`__

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

1. An- und Abmelden
-------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Melden Sie sich (wenn ``login:`` am Bildschirm erscheint) als derjenige
Benutzer, den Sie w?hrend der Installation angelegt haben, oder als
``root`` an. (Die FreeBSD-Installationsroutine legt in jedem Fall einen
Benutzer ``root`` an; dieser darf auf dem System fast alles tun,
einschlie?lich dem L?schen von wichtigen Dateien. Seien Sie also
vorsichtig, wenn Sie sich als ``root`` anmelden.) Die Zeichen ``%`` und
``#`` stellen im folgenden die Eingabeaufforderung dar, wobei ``%`` f?r
den gew?hnlichen Benutzer und ``#`` f?r den Benutzer ``root`` steht.

Um sich abzumelden, geben Sie

.. raw:: html

   <div class="informalexample">

.. code:: screen

    # exit

.. raw:: html

   </div>

so oft wie n?tig ein (und zwar bis wieder ``login:`` erscheint). Dr?cken
Sie nach jedem Befehl die Enter-Taste und beachten Sie, dass UNIX?
zwischen Gro?- und Kleinschreibung unterscheidet – ``exit`` und ``EXIT``
sind also zwei verschiedene Befehle.

Um den Rechner herunterzufahren, geben Sie

.. raw:: html

   <div class="informalexample">

.. code:: screen

    # /sbin/shutdown -h now

.. raw:: html

   </div>

ein.

Um den Rechner neu zu starten, geben Sie

.. raw:: html

   <div class="informalexample">

.. code:: screen

    # /sbin/shutdown -r now

.. raw:: html

   </div>

ein, oder Sie rufen einfach

.. raw:: html

   <div class="informalexample">

.. code:: screen

    # /sbin/reboot

.. raw:: html

   </div>

auf.

Sie k?nnen nat?rlich auch den Rechner mit **Strg**+**Alt**+**Entf** neu
starten. Warten Sie danach, bis der Neustart erfolgt ist. Diese
Tastenkombination ist in neueren FreeBSD-Versionen mit ``/sbin/reboot``
identisch und viel besser als das Dr?cken des Reset-Knopfes. Sie wollen
das System ja sicher nicht noch einmal neu installieren, oder?

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

2. Einen neuen Benutzer anlegen, der ``root``-Rechte erlangen kann
------------------------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Falls Sie w?hrend der Installation des Systems keine Benutzer angelegt
haben und noch als ``root`` angemeldet sind, sollten Sie mit

.. raw:: html

   <div class="informalexample">

.. code:: screen

    # adduser

.. raw:: html

   </div>

einen neuen Benutzer anlegen.

Wenn Sie ``adduser`` das erste Mal ausf?hren, werden Sie gefragt, ob Sie
einige Standardeinstellungen abspeichern m?chten. Vielleicht m?chten Sie
`csh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=csh&sektion=1>`__
statt `sh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sh&sektion=1>`__
als Default-Shell ausw?hlen (falls ``sh`` als Default-Shell angeboten
wird). Diese Standardeinstellungen sind in ``/etc/adduser.conf``
gespeichert und k?nnen von Ihnen ver?ndert werden.

Angenommen, Sie m?chten den Benutzer ``jack`` mit dem vollst?ndigen
Namen *Jack Benimble* anlegen. Weisen Sie ``jack`` auf jeden Fall ein
Passwort zu (auch Kinder, die auf der Tastatur spielen, k?nnen ein
Problem darstellen). Wenn Sie gefragt werden, ob ``jack`` Mitglied in
anderen Gruppen sein soll, geben Sie ``wheel`` ein.

.. raw:: html

   <div class="informalexample">

.. code:: screen

    Login group is ``jack''. Invite jack into other groups: wheel

.. raw:: html

   </div>

Dadurch k?nnen Sie sich als ``jack`` anmelden, und mit
`su(1) <http://www.FreeBSD.org/cgi/man.cgi?query=su&sektion=1>`__
``root``-Rechte erlangen. Dann werden Sie nie wieder daf?r kritisiert
werden, dass Sie sich als ``root`` am System anmelden.

Das Programm ``adduser`` kann jederzeit mit **Strg**+**C** beendet
werden. Am Schlu? haben Sie die M?glichkeit, die Einstellungen f?r den
neuen Benutzer nochmals zu kontrollieren oder diese mit **n** zu
verwerfen. Sie sollten noch einen zweiten Benutzer anlegen, damit Sie
auch dann auf Ihr System zugreifen k?nnen, wenn Sie die Anmeldedaten von
``jack`` bearbeitet und dabei einen Fehler gemacht haben.

Haben Sie alle Benutzer angelegt, geben Sie ``exit`` ein, damit Sie sich
als ``jack`` anmelden k?nnen. Es ist generell sinnvoll, wann immer
m?glich, als gew?hnlicher Benutzer und nicht als der allm?chtige
Benutzer ``root`` zu arbeiten.

Falls Sie schon einen Benutzer angelegt haben und diesem die M?glichkeit
einr?umen wollen, mit ``su`` ``root``-Rechte zu erlangen, k?nnen Sie
sich als ``root`` anmelden und die Datei ``/etc/group`` anpassen. F?gen
Sie in der ersten Zeile (der Gruppe ``wheel``) den Benutzer ``jack``
ein. Sie sollten auch den Umgang mit dem Texteditor
`vi(1) <http://www.FreeBSD.org/cgi/man.cgi?query=vi&sektion=1>`__
erlernen. Alternativ k?nnen Sie auch den einfacher zu bedienenden
Texteditor
`ee(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ee&sektion=1>`__
verwenden, der auf aktuellen FreeBSD-Systemen automatisch installiert
wird.

Mit ``rmuser`` k?nnen Sie einen Benutzer l?schen.

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

3. Sich im System umsehen
-------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Nachdem wir uns als gew?hnlicher Benutzer angemeldet haben, sehen wir
uns nun im System um und testen einige Befehle, die uns den Zugriff auf
die Hilfefunktion erm?glichen sowie einige Informationen ?ber unser
System liefern.

.. raw:: html

   <div class="variablelist">

``id``
    Sagt uns, wer wir sind!

``pwd``
    Zeigt uns, wo wir uns befinden, gibt also das aktuelle Verzeichnis
    (*working directory*) aus.

``ls``
    Listet die Dateien im aktuellen Verzeichnis auf.

``ls -F``
    Listet Dateien im aktuellen Verzeichnis auf und kennzeichnet
    ausf?hrbare Dateien mit einem ``*``, Verzeichnisse mit einem ``/``,
    sowie symbolische Links mit ``@``.

``ls -l``
    Listet Dateiem im Langformat auf, dabei werden Gr??e, Datum und
    Rechte angezeigt.

``ls -a``
    Listet auch versteckte Dateien auf (so genannte „dot“-Dateien).
    Falls Sie als ``root`` angemeldet sind, werden die „dot“-Dateien
    auch ohne die Option ``-a`` angezeigt.

``cd``
    Wechselt das Verzeichnis. ``cd         ..`` wechselt in der
    Verzeichnishierarchie eine Stufe nach oben (beachten Sie das
    Leerzeichen nach ``cd``!). ``cd /usr/local`` wechselt dorthin.
    ``cd ~`` wechselt wechselt in des Heimatverzeichnis des angemeldeten
    Benutzers, in unserem Fall nach ``/usr/home/jack``. Geben Sie
    ``cd /cdrom``, gefolgt von ``ls``, ein, um herauszufinden, ob Ihr
    CD-ROM-Laufwerk eingebunden ist und funktioniert.

``view           Dateiname``
    Zeigt den Inhalt von *``Dateiname``* auf dem Bildschirm an. Falls
    der Inhalt der Datei zu lang ist, und Sie nur das Ende sehen,
    aktivieren Sie die **Rollen**-Taste und dr?cken dann die **Bild
    hoch**-Taste, um nach oben zu scrollen. Sie k?nnen die
    **Rollen**-Taste auch bei Manualpages verwenden. Dr?cken Sie die
    **Rollen**-Taste nochmals, um das Scrollen zu beenden. Sie sollten
    sich auch einige der versteckten Dateien in Ihrem Heimatverzeichnis
    mit ``cat`` ansehen: ``cat             .cshrc``,
    ``cat             .login``, ``cat             .profile``.

.. raw:: html

   </div>

In ``.cshrc`` sind einige n?tzliche Aliase f?r den Befehl ``ls``
definiert. Dort k?nnen Sie auch zus?tzliche Aliase definieren. Um diese
Aliase allen Benutzern zur Verf?gung zu stellen, m?ssen Sie diese in
``/etc/csh.cshrc``, der systemweiten Konfigurationsdatei von ``csh``,
eintragen.

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

4. Hilfe und Informationen erhalten
-----------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Im folgenden Abschnitt erhalten Sie einige Tipps zur Verwendung der
Hilfefunktion. *``Text``* steht dabei f?r etwas, das Sie eingeben m?ssen
— meistens einen Befehl oder einen Dateinamen.

.. raw:: html

   <div class="variablelist">

``apropos             text``
    Jeder Eintrag, der die Zeichenkette *``text``* in der
    whatis-Datenbank enth?lt, wird aufgelistet.

``man             text``
    Die Manualpage von *``text``*. Manualpages sind die
    Hauptinformationsquelle f?r UNIX?-Systeme. ``man ls`` zeigt alle
    M?glichkeiten, wie ``ls`` verwendet werden kann. Dr?cken Sie
    **Enter** um weiterzubl?ttern, **Strg**+**B**, um eine Seite zur?ck
    zu bl?ttern, **Strg**+**F**, um eine Seite vorw?rts zu bl?ttern oder
    **Strg**+**C** zum Beenden.

``which             text``
    Sagt Ihnen, in welchem Verzeichnis der Befehl *``text``* im Pfad des
    Benutzers gefunden wird.

``locate             text``
    Alle Verzeichnisse, welche die Zeichenkette *``text``* enthalten,
    werden ausgegeben.

``whatis             text``
    Gibt aus, wof?r das Kommando *``text``* steht und welche
    Handbuchseite(n) es daf?r gibt. ``whatis *`` liefert Ihnen
    Informationen zu allen ausf?hrbaren Dateien des aktuellen
    Verzeichnisses.

``whereis             text``
    Gibt den absoluten Pfad der Datei *``text``* aus.

.. raw:: html

   </div>

Rufen Sie nun ``whatis`` mit einigen n?tzlichen Befehlen wie ``cat``,
``more``, ``grep``, ``mv``, ``find``, ``tar``, ``chmod``, ``chown``,
``date``, und ``script`` auf. ``more`` funktioniert genau so wie unter
DOS und zeigt den Inhalt der Datei seitenweise an. ``ls -l | more``
entspricht daher ``more Dateiname``. Das ``*``-Zeichen dient als
Platzhalter, ``ls w*`` zeigt daher alle Dateien an, die mit ``w``
beginnen.

Funktioniert der eine oder andere Aufruf bei Ihnen nicht? Sowohl
`locate(1) <http://www.FreeBSD.org/cgi/man.cgi?query=locate&sektion=1>`__,
als auch
`whatis(1) <http://www.FreeBSD.org/cgi/man.cgi?query=whatis&sektion=1>`__
sind von einer Datenbank abh?ngig, die w?chentlich aktualisiert wird.
Falls Ihr Rechner nicht st?ndig l?uft, k?nnen Sie die t?glichen,
w?chentlichen und monatlichen Aktualisierungen auch manuell starten.
Melden Sie sich dazu als ``root`` an. Warten Sie jeweils auf das Ende
eines Befehls, bevor Sie den n?chsten Befehl eingeben.

.. raw:: html

   <div class="informalexample">

.. code:: screen

    # periodic daily
    output omitted
    # periodic weekly
    output omitted
    # periodic monthly
    output omitted

.. raw:: html

   </div>

Diese Befehle sind zwar Teil der Systemverwaltung, als alleiniger
Benutzer eines UNIX?-Systems sind Sie aber auch der Administrator des
Systems. Sie m?ssen sich nur als ``root`` anmelden, wenn Sie das System
verwalten m?chten. Eine Information, die leider in vielen dicken B?chern
?ber UNIX? vergessen wird, die sich lieber den Pulldown-Men?s und
Window-Managern widmen. Empfehlenswerte B?cher zur
UNIX?-Systemadministration sind das *UNIX System Administration
Handbook* von Evi Nemeth et.al. (Prentice-Hall, 1995, ISBN 0-13-15051-7,
die zweite Ausgabe hat ein rotes Cover), oder *Essential System
Administration* von ?leen Frisch (O'Reilly & Associates, 2002, ISBN
0-596-00343-9).

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

5. Textdateien bearbeiten
-------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Um Ihr System konfigurieren zu k?nnen, m?ssen Sie h?ufig Textdateien
bearbeiten. Die meisten Konfigurationsdateien befinden sich im
Verzeichnis ``/etc``. Um diese editieren zu k?nnen, m?ssen Sie mit
``su`` zu ``root`` werden. Sie k?nnen den einfachen Editor ``ee``
verwenden, auf lange Sicht lohnt es sich aber, die Bedienung von ``vi``
zu erlernen. Falls Sie die Systemquellen installiert haben, befindet
sich unter ``/usr/src/contrib/nvi/docs/tutorial`` ein ausgezeichnetes
Tutorial zu ``vi``.

Bevor Sie eine Datei bearbeiten, sollten Sie eine Sicherheitskopie der
Datei anlegen. Wenn Sie beispielsweise ``/etc/rc.conf`` bearbeiten
m?chten, wechseln Sie mit ``cd /etc`` nach ``/etc`` und geben Folgendes
ein:

.. raw:: html

   <div class="informalexample">

.. code:: screen

    # cp rc.conf rc.conf.orig

.. raw:: html

   </div>

Dadurch wird eine Kopie von ``rc.conf`` mit dem Namen ``rc.conf.orig``
angelegt, mit der Sie notfalls das Original wiederherstellen k?nnen,
indem Sie ``etc.conf.orig`` nach ``etc.conf`` kopieren. Noch besser ist
es, die Datei zuerst zu verschieben (umzubenennen) und dann zu kopieren:

.. raw:: html

   <div class="informalexample">

.. code:: screen

    # mv rc.conf rc.conf.orig
    # cp rc.conf.orig rc.conf

.. raw:: html

   </div>

weil bei der Verwendung von ``mv`` das Datum und der Besitzer der Datei
erhalten bleiben. Danach k?nnen Sie die Datei ``rc.conf`` bearbeiten.
M?chten Sie die Originaldatei wiederherstellen, geben Sie
**``mv rc.conf rc.conf.myedit``** (falls Sie die bearbeitete Version
erhalten m?chten), gefolgt von:

.. raw:: html

   <div class="informalexample">

.. code:: screen

    # mv rc.conf.orig rc.conf

.. raw:: html

   </div>

ein, um den Originalzustand wiederherzustellen.

Um eine Datei zu bearbeiten, geben Sie

.. raw:: html

   <div class="informalexample">

.. code:: screen

    # vi filename

.. raw:: html

   </div>

ein.

Innerhalb des Textes k?nnen Sie sich mit den Pfeiltasten bewegen. Mit
der **Esc**-Taste wechselt ``vi`` in den Kommandomodus. Einige der
wichtigsten Kommandos sind:

.. raw:: html

   <div class="variablelist">

``x``
    l?scht den Buchstaben links vom Cursor

``dd``
    l?scht die komplette Zeile, auch wenn diese am Bildschirm
    umgebrochen wird.

``i``
    f?gt Text an der Cursorposition ein.

``a``
    f?gt Text rechts vom Cursor ein.

.. raw:: html

   </div>

Nachdem Sie ``i`` oder ``a`` eingegeben haben, k?nnen Sie also die Datei
bearbeiten. Mit ``Esc`` kommen Sie wieder in den Kommandomodus, wo Sie
beispielsweise

.. raw:: html

   <div class="variablelist">

``:w``
    eingeben, um Ihre ?nderungen zu speichern und mit ``vi``
    weiterarbeiten k?nnen.

``:wq``
    Speichern und Beenden.

``:q!``
    Beenden, ohne die ?nderungen zu speichern.

``/text``
    bewegt den Cursor an die Stelle des ersten Vorkommens von
    *``text``*; ``/Enter`` (die Enter-Taste) findet dann das n?chste
    Vorkommen von *``text``*.

``G``
    bewegt den Cursor ans Ende der Datei.

``nG``
    bewegt den Cursor in die Zeile *``n``* der Datei, wobei *``n``* f?r
    eine Zahl steht.

**Ctrl**+**L**
    zeichnet den Bildschirm neu.

**Ctrl**+**b** und **Ctrl**+**f**
    eine Bildschirmseite zur?ck oder vorw?rts gehen, analog zu ``more``
    und ``view``.

.. raw:: html

   </div>

Am besten sammeln Sie praktische Erfahrungen mit ``vi`` in Ihrem
Heimatverzeichnis, indem Sie eine Datei anlegen und danach bearbeiten,
die Datei speichern und wieder aufrufen. ``vi`` birgt wirklich einige
?berraschungen, da es sich um ein komplexes Programm handelt. Manchmal
werden Sie versehentlich ein Kommando ausf?hren, das etwas anderes tut,
als Sie erwarten. (``vi`` ist viel leistungsf?higer als der DOS-Editor
EDIT. Rufen Sie doch einmal das Kommando ``:r`` auf.) Dr?cken Sie die
**Esc**-Taste ruhig ?fter als einmal, um sicher zu gehen, dass Sie sich
im Kommandomodus befinden und arbeiten Sie in diesem Modus weiter, falls
Probleme auftreten. Speichern Sie die Datei immer wieder mit ``:w``, und
geben Sie ``:q!`` ein, um von vorne zu beginnen (genauer gesagt, vom
letzten ``:w``-Kommando), falls dies n?tig sein sollte.

Danach k?nnen Sie mit ``cd`` nach ``/etc`` wechseln, mit ``su`` zu
``root`` werden, und mit ``vi`` ``/etc/group`` bearbeiten und einen
Benutzer zur Gruppe ``wheel`` hinzuf?gen, damit dieser mit ``su``
``root``-Rechte erlangen kann. F?gen Sie daf?r einfach ein Komma und den
Login-Namen des Benutzers an das Ende der ersten Zeile an, dr?cken Sie
**Esc** und ``:wq`` (um die Datei zu speichern und den ``vi`` zu
verlassen). Sehr effizient, nicht wahr? (Sie haben hoffentlich kein
Leerzeichen nach dem Komma eingef?gt?)

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

6. Dateien mit Hilfe von DOS ausdrucken
---------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Bis zu diesem Zeitpunkt haben Sie wahrscheinlich noch keinen Drucker
eingerichtet, daher zeigen wir Ihnen, wie man eine Datei aus einer
Manualpage erzeugt, diese auf eine Diskette kopiert und dann unter DOS
ausdruckt. M?chten Sie etwa nachlesen, wie Sie Dateirechte ver?ndern
k?nnen (was sehr wichtig ist), rufen Sie mit ``man chmod`` die
entsprechende Manualpage auf. Der Befehl

.. raw:: html

   <div class="informalexample">

.. code:: screen

    % man chmod | col -b > chmod.txt

.. raw:: html

   </div>

entfernt alle Formatierungen und leitet die Ausgabe der Manualpage nach
``chmod.txt`` um, statt diese auf dem Bildschirm anzuzeigen. Legen Sie
danach eine DOS-formatierte Diskette in Ihr Diskettenlaufwerk ``a`` ein
und geben Sie ``su`` ein, um zu ``root`` zu werden. Tippen Sie nun

.. raw:: html

   <div class="informalexample">

.. code:: screen

    # /sbin/mount -t msdosfs /dev/fd0 /mnt

.. raw:: html

   </div>

ein, um das Diskettenlaufwerk unter ``/mnt`` einzuh?ngen.

Da Sie ab nun keine ``root``-Rechte mehr ben?tigen, werden Sie durch die
Eingabe von ``exit`` wieder zu ``jack`` und wechseln dann in das
Verzeichnis, in dem sich ``chmod.txt`` befindet, und kopieren diese
Datei mit

.. raw:: html

   <div class="informalexample">

.. code:: screen

    % cp chmod.txt /mnt

.. raw:: html

   </div>

auf Ihre Diskette. Zeigen Sie mit ``ls /mnt`` den Inhalt von ``/mnt``
an. Als Ergebnis sollten Sie ``chmod.txt`` erhalten.

Leiten Sie nun die Ausgabe von ``/sbin/dmesg`` in eine Datei um, indem
Sie

.. raw:: html

   <div class="informalexample">

.. code:: screen

    % /sbin/dmesg > dmesg.txt

.. raw:: html

   </div>

eingeben und diese Datei ebenfalls auf die Diskette kopieren. Mit
``/sbin/dmesg`` k?nnen Sie alle w?hrend des Systemstarts angezeigten
Meldungen ausgeben. Es ist wichtig, dass Sie diese Meldungen verstehen,
da hier angezeigt wird, welche Hardware von FreeBSD beim Systemstart
gefunden wurde. Falls Sie Fragen auf der Mailingliste 'Fragen und
Antworten zu FreeBSD' ``<de-bsd-questions@de.FreeBSD.org>`` oder im
USENET stellen (etwa „FreeBSD erkennt mein Bandlaufwerk nicht, was soll
ich tun?“), wird man Sie fragen, was ``dmesg`` ausgibt.

Anschlie?end k?nnen Sie das Diskettenlaufwerk wieder aus dem
Verzeichnisbaum aush?ngen (unmounten), um die Diskette zu entfernen.
Dies funktioniert nat?rlich nur als ``root``:

.. raw:: html

   <div class="informalexample">

.. code:: screen

    # /sbin/umount /mnt

.. raw:: html

   </div>

Danach starten Sie DOS (Windows?). Kopieren Sie die Dateien in ein
Verzeichnis. Nun ?ffnen Sie die Dateien mit DOS EDIT, Windows? Notepad,
Wordpad oder einem anderen Schreibprogramm, speichern die Datei, falls
Sie kleinere ?nderungen vornehmen wollen, und drucken die Datei unter
DOS oder Windows aus. Manualpages werden unter DOS am besten mit
``print`` ausgedruckt.

Um Ihren Drucker unter FreeBSD einzurichten, muss ein entsprechender
Eintrag in ``/etc/printcap`` und ein Spool-Verzeichnis unter
``/var/spool/output`` angelegt werden. Falls der Drucker an lpt0
(entspricht LPT1 unter DOS) angeschlossen ist, m?ssen Sie wahrscheinlich
nur nach ``/var/spool/output`` wechseln und (als ``root``) das
Verzeichnis ``lpd`` mit ``mkdir lpd`` anlegen, falls es nicht schon
vorhanden ist. Danach sollte sich der Drucker, wenn er eingeschaltet
ist, beim Booten melden und ``lp`` oder ``lpr`` sollte eine Datei zum
Drucker schicken und ausdrucken. Ob die Datei schlie?lich ausgedruckt
wird, h?ngt von der Konfiguration des Druckers ab, die im `FreeBSD
Handbuch <../../../../doc/de_DE.ISO8859-1/books/handbook/index.html>`__
ausf?hrlich beschrieben ist.

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

7. Weitere n?tzliche Befehle
----------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="variablelist">

``df``
    zeigt den freien Speicherplatz und eingeh?ngte (*gemountete*)
    Partitionen an.

``ps aux``
    zeigt laufende Prozesse an. ``ps ax`` schr?nkt diese Ausgabe etwas
    ein.

``rm       dateiname``
    l?scht *``dateiname``*.

``rm -R       dir``
    l?scht das Verzeichnis *``dir``* und alle Unterverzeichnisse —
    Vorsicht!

``ls -R``
    listet Dateien im aktuellen Verzeichnis und allen
    Unterverzeichnissen auf. Die Variante ``ls -AFR > where.txt`` kann
    dazu verwendet werden, um eine Liste aller Dateien unter ``/`` und
    (separat) unter ``/usr`` zu erhalten. Allerdings gibt es bessere
    M?glichkeiten, bestimmte Dateien zu finden.

``passwd``
    zum ?ndern des Passworts eines Benutzers (oder von ``root``).

``man hier``
    die Manualpage des UNIX?-Dateisystems.

.. raw:: html

   </div>

Nutzen Sie ``find``, um unter ``/usr`` oder anderen Verzeichnissen nach
``dateiname`` zu suchen:

.. raw:: html

   <div class="informalexample">

.. code:: screen

    % find /usr -name "dateiname>"

.. raw:: html

   </div>

Als Platzhalter k?nnen Sie bei *``"dateiname``*" einen ``*`` verwenden.
(*``dateiname``* muss dabei in Hochkommata stehen.) Weisen Sie ``find``
an, in ``/`` statt in ``/usr`` zu suchen, werden alle eingeh?ngten
Dateisysteme durchsucht, CD-ROM und DOS-Partitionen eingeschlossen.

Ein ausgezeichnetes Buch, in dem s?mtliche UNIX?-Befehle beschrieben
werden, ist *Unix for the Impatient* von Abrahams & Larson (2nd ed.,
Addison-Wesley, 1996). Auch im Internet finden Sie viele Informationen
zu UNIX?.

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

8. Die n?chsten Schritte
------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Sie sollten nun alle wichtigen Werkzeuge kennen, um sich auf Ihrem
System zurechtzufinden, Dateien zu editieren und alles am Laufen zu
halten. Viele n?tzliche Informationen finden sich im FreeBSD-Handbuch
(das vielleicht schon auf Ihrer Festplatte ist) und auf der `FreeBSD
Webseite <http://www.FreeBSD.org/index.html>`__. Viele Softwarepakte und
Ports sind sowohl auf der FreeBSD-CD-ROM als auch auf der Webseite
verf?gbar. Im Handbuch finden Sie Hinweise, wie Sie mit diesen arbeiten
k?nnen. Pakete installieren Sie mit
``pkg_add /cdrom/packages/All/Paketname``, wobei *``Paketname``* f?r den
Dateinamen des Paketes steht. Auf der CD-ROM finden Sie auch eine Liste
der Pakete und Ports inklusive einer kurzen Beschreibung. Lesen Sie dazu
``cdrom/packages/index``, ``cdrom/packages/index.txt`` sowie
``cdrom/ports/index``. Eine ausf?hrliche Beschreibung den jeweiligen
Ports finden Sie in ``/cdrom/ports/*/*/pkg-descr``, wobei die
``*``-Zeichen f?r die Kategorie und das Unterverzeichnis des jeweiligen
Programms stehen.

Falls Ihnen die Beschreibung zur Installation von Ports von der CD-ROM
im Handbuch zu kompliziert erscheint (mit Programmen wie ``lndir`` und
anderen), finden Sie hier eine alternative Beschreibung, die in der
Regel problemlos funktioniert:

Suchen Sie zuerst den Port, den Sie installieren m?chten, etwa
``kermit``. Auf der CD-ROM sollte daf?r ein entsprechendes Verzeichnis
vorhanden sein. Kopieren Sie dieses Unterverzeichnis nach ``/usr/local``
(ein guter Platz f?r Programme, die hinzugef?gt werden und allen
Benutzern zug?nglich sein sollen):

.. raw:: html

   <div class="informalexample">

.. code:: screen

    # cp -R /cdrom/ports/comm/kermit /usr/local

.. raw:: html

   </div>

Danach wird das Verzeichnis ``/usr/local/kermit`` angelegt, in dem sich
alle Dateien des Unterverzeichnisses ``kermit`` der CD-ROM finden.

Danach legen Sie mit ``mkdir`` das Verzeichnis ``/usr/ports/distfiles``
an, falls dieses noch nicht existiert. Suchen Sie dann in
``/cdrom/ports/distfiles`` nach der Datei, die dem Namen des Ports
gleicht, den Sie installieren m?chten. Kopieren Sie diese Datei nach
``/usr/ports/distfiles``. Unter neueren Versionen k?nnen Sie diesen
Schritt ?berspringen, da FreeBSD dies automatisch erledigt.

Wechseln Sie nun mit ``cd`` nach ``/usr/local/kermit``. In diesem
Verzeichnis befindet sich bereits ein ``Makefile``. Geben Sie hier
Folgendes ein:

.. raw:: html

   <div class="informalexample">

.. code:: screen

    # make all install

.. raw:: html

   </div>

W?hrend der Installation wird sich der Port alle gepackten Dateien via
FTP holen, die zur Installation ben?tigt werden, aber nicht auf der
CD-ROM oder unter ``/usr/ports/distfiles`` vorhanden sind. Falls Sie
noch keine Internetverbindung haben und die ben?tigten Dateien nicht in
``/cdrom/ports/distfiles`` vorhanden sind, m?ssen Sie sich die Dateien
?ber einem anderen Rechner besorgen und manuell nach
``/usr/ports/distfiles`` kopieren (entweder ?ber eine Diskette oder
durch das Einh?ngen einer DOS-Partition. Sehen Sie im ``Makefile`` (mit
``cat``, ``more`` oder ``view``) nach, wo die Dateien zu finden sind
(meist auf der Hauptseite des Programms) und besorgen Sie sich die
Datei. Laden Sie die Datei unter DOS herunter, wird der Dateiname
m?glicherweise gek?rzt. In diesem Fall m?ssen Sie, nachdem die Datei
nach ``/usr/ports/distfiles`` kopiert wurde, den urspr?nglichen Namen
mit ``mv`` wiederherstellen, damit die Datei von der
Installationsroutine gefunden werden kann. Laden Sie die Datei mit FTP
herunter, m?ssen Sie den Bin?r-Modus verwenden. Nun wechseln Sie zur?ck
nach ``/usr/local/kermit`` (hier befindet sich ja das zur Installation
n?tige ``Makefile``) und installieren das Programm mit
``make all install``.

Beim Installieren von Ports oder Paketen kann es auch passieren, dass
andere Programme ben?tigt werden. Falls die Installation beispielsweise
mit can't find unzip oder einer ?hnlichen Meldung abbricht, m?ssen Sie
zuerst das unzip-Paket oder den entsprechende Port installieren, bevor
Sie mit der Installation fortfahren k?nnen.

Ist die Installation abgeschlossen, geben Sie ``rehash`` ein, damit
FreeBSD den Pfad neu einliest und wei?, wo welche Programme zu finden
sind. (Falls beim Ausf?hren von ``whereis`` oder ``which`` viele
Fehlermeldungen wie path not found auftreten, m?ssen Sie die
Pfad-Anweisungen in Ihrer ``.cshrc`` im Heimatverzeichnis erweitern. Die
Pfad-Anweisung tut unter UNIX? dasselbe wie unter DOS. Das aktuelle
Verzeichnis ist allerdings aus Sicherheitsgr?nden nicht im
voreingestellten Ausf?hrungspfad enthalten. Befindet sich die
auszuf?hrende Datei im aktuellen Verzeichnis, muss ``./`` vor dem Befehl
eingegeben werden, (wobei nach dem Slash kein Leerzeichen stehen darf),
damit die Datei ausgef?hrt wird.)

Vielleicht m?chten Sie auch die neueste Version des Netscape?-Browsers
(zu finden auf der `FTP-Seite <ftp://ftp.netscape.com/>`__ von
Netscape?) installieren, von der es auch eine FreeBSD-Version gibt. Dazu
m?ssen Sie allerdings das X Window-System installiert haben. Nach dem
Herunterladen verwenden Sie ``gunzip dateiname`` und
``tar xvf dateiname``, um die Datei zu entpacken. Danach kopieren Sie
die Bin?rdatei nach ``/usr/local/bin`` oder ein anderes Verzeichnis
Ihres Pfades, und geben abschlie?end ``rehash`` ein. F?gen Sie dann in
``/etc/csh.cshrc``, der systemweiten Konfigurationsdatei von ``csh``,
folgende Zeilen ein:

.. raw:: html

   <div class="informalexample">

.. code:: programlisting

    setenv XKEYSYMDB /usr/X11R6/lib/X11/XKeysymDB
    setenv XNLSPATH /usr/X11R6/lib/X11/nls

.. raw:: html

   </div>

Dabei wird davon ausgegangen, dass ``XKeysymDB`` und das Verzeichnis
``nls`` sich unter ``/usr/X11R6/lib/X11`` befinden. Ist dies auf Ihrem
System nicht der Fall, m?ssen Sie diese finden und dorthin kopieren.

Falls Sie Netscape? schon als Port von der CD-ROM oder ?ber FTP
installiert haben, achten Sie unbedingt darauf, nicht versehentlich
``/usr/local/bin/netscape`` durch die neue Bin?rdatei zu ersetzen, da es
sich bei dieser Datei nur um ein Shell-Skript handelt, das die
Umgebungsvariablen f?r Sie setzt. Nennen Sie die neue Bin?rdatei
stattdessen besser ``netscape.bin`` und ersetzen Sie die alte Version
``/usr/local/netscape/netscape``.

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

9. Die Arbeitsumgebung
----------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Shell ist das wichtigste Programm Ihrer Arbeitsumgebung. Unter DOS
hei?t die Shell command.com. Die Shell interpretiert die Befehle, die
Sie auf der Kommandozeile eingeben und kommuniziert so mit dem Rest des
Betriebssystems. Sie k?nnen auch Shellskripte schreiben, die den
DOS-Batchdateien ?hnlich sind. Es handelt sich dabei um eine Folge von
Befehlen, die hintereinander ausgef?hrt werden.

Zwei Shells werden von FreeBSD automatisch installiert: ``csh`` und
``sh``. ``csh`` ist f?r die Arbeit auf der Kommandozeile komfortabler,
Skripten sollten allerdings f?r ``sh`` (oder f?r ``bash``) geschrieben
werden. Mit ``echo $SHELL`` k?nnen Sie herausfinden, welche Shell
benutzt wird.

Die ``csh``-Shell ist zwar nicht schlecht, aber die ``tcsh``-Shell kann
alles, was die ``csh`` kann und einiges mehr. Sie erlaubt es Ihnen,
ausgef?hrte Befehle mit den Pfeiltasten wieder aufzurufen und diese
sogar zu ver?ndern. Dateinamen oder Befehle k?nnen mit der
Tabulator-Taste automatisch vervollst?ndigt werden (``csh`` nutzt daf?r
**ESC**) und mit ``cd -`` k?nnen Sie schnell in das zuletzt verwendete
Verzeichnis wechseln. Auch der Prompt l?sst sich unter der
``tcsh``-Shell wesentlich einfacher anpassen. All diese Eigenschaften
erleichtern den Umgang mit dem Betriebssystem.

Wollen Sie eine neue Shell installieren, gehen Sie wie folgt vor:

.. raw:: html

   <div class="procedure">

#. Installieren Sie die Shell als Port oder Paket genau so, wie Sie
   jedes andere Programm als Port oder Paket installieren w?rden. Rufen
   Sie dann ``rehash`` sowie ``which tcsh`` auf (wir nehmen hier an,
   dass Sie ``tcsh`` installieren wollen), um sicher zu gehen, dass
   alles korrekt installiert wurde.

#. Als ``root`` editieren Sie nun ``/etc/shells``, und f?gen eine Zeile
   f?r die neue Shell ein, in unserem Fall also ``/usr/local/bin/tcsh``.
   Danach speichern Sie die Datei (Einige Ports erledigen diesen Schritt
   automatisch f?r Sie.).

#. Nutzen Sie ``chsh``, um ``tcsh`` dauerhaft als Ihre Shell zu
   definieren. Alternativ geben Sie einfach ``tcsh`` ein, ohne sich neu
   am System anzumelden.

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Bei fr?heren Versionen von FreeBSD und einigen anderen Versionen von
UNIX? traten Probleme auf, wenn ``root`` eine andere Shell als ``sh``
oder ``csh`` zugewiesen wurde; sie hatten dann keine funktionierende
Shell, wenn das System im Single-User-Modus ausgef?hrt wurde. Die L?sung
besteht darin, ``su -m`` einzugeben, um ``root`` zu werden, weil damit
``root`` die ``tcsh`` zugewiesen wird, da diese Shell Teil der Umgebung
ist. Dies kann auch fest als Alias in ``.tcshrc`` eingetragen werden:

.. code:: programlisting

    alias su su -m

.. raw:: html

   </div>

Wenn ``tcsh`` startet, werden ``/etc/csh.cshrc`` und ``/etc/csh.login``
eingelesen (analog zur ``csh``). Ebenfalls eingelesen werden ``.login``
und ``.cshrc`` des Heimatverzeichnisses, falls ``.tcshrc`` nicht
gefunden wurde. Sie k?nnen auch einfach ``.cshrc`` nach ``.tcshrc``
kopieren.

Da ``tcsh`` nun installiert ist, kann der Prompt angepasst werden.
Details dazu finden Sie in
`tcsh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tcsh&sektion=1>`__.
Die hier vorgeschlagene Zeile k?nnen Sie in Ihre ``.tcshrc`` eintragen.
Dadurch wird angezeigt, wie viele Befehle bereits eingegeben wurden.
Au?erdem erhalten Sie die aktuelle Uhrzeit sowie das aktuelle
Arbeitsverzeichnis. F?r den gew?hnlichen Benutzer wird ein ``>`` und f?r
``root`` ein ``#`` ausgegeben. Dabei handelt es sich um die
Standardeinstellung von ``tcsh``:

set prompt = "%h %t %~ %# "

Diese Zeile sollte an derselben Stelle eingef?gt werden, wie die
vorhandene "set prompt" Zeile oder nach "if($?prompt) then".
Kommentieren Sie die alte Zeile aus, damit diese notfalls wieder benutzt
werden kann. Vergessen Sie auch auf keinen Fall die Leerzeichen und
Hochkommata. ``.tcshrc`` wird neu eingelesen, wenn Sie
``source .tcshrc`` eingeben.

Eine Liste aller Umgebungsvariablen erhalten Sie, wenn Sie am Prompt
``env`` eingeben. Sie sehen dann den Default-Editor, -Pager,
-Terminaltyp und viele andere Umgebungsvariablen. Falls Sie sich von
einem entfernten Rechner anmelden und ein Programm nicht starten k?nnen,
weil das Terminal dazu nicht in der Lage ist, kann die Eingabe von
``setenv TERM vt100`` sehr hilfreich sein.

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

10. Einige abschlie?ende Bemerkungen
------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Als ``root`` k?nnen Sie das CD-ROM-Laufwerk mit ``/sbin/umount /cdrom``
abh?ngen, eine andere CD-ROM einlegen und mit
``/sbin/mount_cd9660 /dev/cd0a     /cdrom`` wieder einh?ngen (falls cd0a
der Devicename Ihres CD-ROM-Laufwerkes ist). Bei neueren
FreeBSD-Versionen muss daf?r nur ``/sbin/mount /cdrom`` eingegeben
werden.

Das Live-Filesystem (die zweite FreeBSD-CD-ROM) kann hilfreich sein,
wenn auf Ihrem System nur begrenzt Speicherplatz vorhanden ist. Was
genau auf dieser Live-CD enthalten ist, variiert von Ausgabe zu Ausgabe.
Vielleicht k?nnen verschiedene Spiele von CD-ROM gespielt werden. Dazu
muss aber auch ``lndir`` vorhanden sein, damit diese Programme wissen,
wo sie die von ihnen ben?tigten Dateien finden, da sich diese unter
``/cdrom`` und nicht unter ``/usr`` und den entsprechenden
Unterverzeichnissen befinden, wie es diese Programme erwarten. Lesen Sie
dazu auch
`lndir(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lndir&sektion=1>`__.

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

11. Kommentare
--------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Falls Sie diese einf?hrende Anleitung benutzen, w?rde es mich
interessieren, ob Dinge schlecht erkl?rt sind, was noch erg?nzt werden
sollte, und ob Ihnen diese Einf?hrung geholfen hat. Ich danke Eugene W.
Stark, Informatikprofessor am SUNY-Stony Brook, sowie John Fieber f?r
ihre hilfreichen Kommentare.

Annelise Anderson, ``<andrsn@andrsn.stanford.edu>``

.. raw:: html

   </div>

.. raw:: html

   </div>
