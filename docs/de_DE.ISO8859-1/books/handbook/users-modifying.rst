========================
14.6. Accounts ver?ndern
========================

.. raw:: html

   <div class="navheader">

14.6. Accounts ver?ndern
`Zur?ck <users-user.html>`__?
Kapitel 14. Benutzer und grundlegende Account-Verwaltung
?\ `Weiter <users-limiting.html>`__

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

14.6. Accounts ver?ndern
------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Unter UNIX? gibt es verschiedene Kommandos, um Accounts zu ver?ndern.
Die gebr?uchlichsten Kommandos sind unten, gefolgt von einer
detaillierten Beschreibung, zusammengefasst.

.. raw:: html

   <div class="informaltable">

+-------------------------------------------------------------------------------+---------------------------------------------------------------------------------------+
| Kommando                                                                      | Zusammenfassung                                                                       |
+===============================================================================+=======================================================================================+
| `adduser(8) <http://www.FreeBSD.org/cgi/man.cgi?query=adduser&sektion=8>`__   | Das empfohlene Werkzeug, um neue Accounts zu erstellen.                               |
+-------------------------------------------------------------------------------+---------------------------------------------------------------------------------------+
| `rmuser(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rmuser&sektion=8>`__     | Das empfohlene Werkzeug, um Accounts zu l?schen.                                      |
+-------------------------------------------------------------------------------+---------------------------------------------------------------------------------------+
| `chpass(1) <http://www.FreeBSD.org/cgi/man.cgi?query=chpass&sektion=1>`__     | Ein flexibles Werkzeug, um Informationen in der Account-Datenbank zu ver?ndern.       |
+-------------------------------------------------------------------------------+---------------------------------------------------------------------------------------+
| `passwd(1) <http://www.FreeBSD.org/cgi/man.cgi?query=passwd&sektion=1>`__     | Ein einfaches Werkzeug, um Passw?rter von Accounts zu ?ndern.                         |
+-------------------------------------------------------------------------------+---------------------------------------------------------------------------------------+
| `pw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pw&sektion=8>`__             | Ein m?chtiges und flexibles Werkzeug um alle Informationen ?ber Accounts zu ?ndern.   |
+-------------------------------------------------------------------------------+---------------------------------------------------------------------------------------+

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

14.6.1. ``adduser``
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

`adduser(8) <http://www.FreeBSD.org/cgi/man.cgi?query=adduser&sektion=8>`__
ist ein einfaches Programm um neue Benutzer hinzuzuf?gen. Es erstellt
``passwd`` und ``group`` Eintr?ge f?r den Benutzer, genauso wie ein home
Verzeichnis, kopiert ein paar vorgegebene Dotfiles aus
``/usr/share/skel`` und kann optional dem Benutzer eine
,,Willkommen\`\`-Nachricht zuschicken.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel 14.1. Einen Benutzer unter FreeBSD anlegen

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    # adduser
    Username: jru
    Full name: J. Random User
    Uid (Leave empty for default):
    Login group [jru]:
    Login group is jru. Invite jru into other groups? []: wheel
    Login class [default]:
    Shell (sh csh tcsh zsh nologin) [sh]: zsh
    Home directory [/home/jru]:
    Home directory permissions (Leave empty for default):
    Use password-based authentication? [yes]:
    Use an empty password? (yes/no) [no]:
    Use a random password? (yes/no) [no]:
    Enter password:
    Enter password again:
    Lock out the account after creation? [no]:
    Username   : jru
    Password   : ****
    Full Name  : J. Random User
    Uid        : 1001
    Class      :
    Groups     : jru wheel
    Home       : /home/jru
    Shell      : /usr/local/bin/zsh
    Locked     : no
    OK? (yes/no): yes
    adduser: INFO: Successfully added (jru) to the user database.
    Add another user? (yes/no): no
    Goodbye!
    #

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Wenn Sie das Passwort eingeben, werden weder Passwort noch Sternchen
angezeigt. Passen Sie auf, dass Sie das Passwort korrekt eingeben.

.. raw:: html

   </div>

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

14.6.2. ``rmuser``
~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Benutzen Sie
`rmuser(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rmuser&sektion=8>`__,
um einen Account vollst?ndig aus dem System zu entfernen.
`rmuser(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rmuser&sektion=8>`__
f?hrt die folgenden Schritte durch:

.. raw:: html

   <div class="procedure">

#. Entfernt den
   `crontab(1) <http://www.FreeBSD.org/cgi/man.cgi?query=crontab&sektion=1>`__
   Eintrag des Benutzers (wenn dieser existiert).

#. Entfernt alle
   `at(1) <http://www.FreeBSD.org/cgi/man.cgi?query=at&sektion=1>`__
   jobs, die dem Benutzer geh?ren.

#. Schlie?t alle Prozesse des Benutzers.

#. Entfernt den Benutzer aus der lokalen Passwort-Datei des Systems.

#. Entfernt das Heimatverzeichnis des Benutzers (falls es dem Benutzer
   geh?rt).

#. Entfernt eingegangene E-Mails des Benutzers aus ``/var/mail``.

#. Entfernt alle Dateien des Benutzers aus tempor?ren
   Dateispeicherbereichen wie ``/tmp``.

#. Entfernt den Loginnamen von allen Gruppen, zu denen er geh?rt, aus
   ``/etc/group``.

   .. raw:: html

      <div class="note" xmlns="">

   Anmerkung:
   ~~~~~~~~~~

   Wenn eine Gruppe leer wird und der Gruppenname mit dem Loginnamen
   identisch ist, wird die Gruppe entfernt; das erg?nzt sich mit den
   einzelnen Benutzer-Gruppen, die von
   `adduser(8) <http://www.FreeBSD.org/cgi/man.cgi?query=adduser&sektion=8>`__
   f?r jeden neuen Benutzer erstellt werden.

   .. raw:: html

      </div>

.. raw:: html

   </div>

Der Superuser-Account kann nicht mit
`rmuser(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rmuser&sektion=8>`__
entfernt werden, da dies in den meisten F?llen das System unbrauchbar
macht.

Als Vorgabe wird ein interaktiver Modus benutzt, der sicherzustellen
versucht, dass Sie wissen, was Sie tun.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel 14.2. Interaktives L?schen von Account mit ``rmuser``

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    # rmuser jru
    Matching password entry:
    jru:*:1001:1001::0:0:J. Random User:/home/jru:/usr/local/bin/zsh
    Is this the entry you wish to remove? y
    Remove user's home directory (/home/jru)? y
    Updating password file, updating databases, done.
    Updating group file: trusted (removing group jru -- personal group is empty) done.
    Removing user's incoming mail file /var/mail/jru: done.
    Removing files belonging to jru from /tmp: done.
    Removing files belonging to jru from /var/tmp: done.
    Removing files belonging to jru from /var/tmp/vi.recover: done.
    #

.. raw:: html

   </div>

.. raw:: html

   </div>

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

14.6.3. ``chpass``
~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

`chpass(1) <http://www.FreeBSD.org/cgi/man.cgi?query=chpass&sektion=1>`__
?ndert Informationen der Benutzerdatenbank wie Passw?rter, Shells und
pers?nliche Informationen.

Nur Systemadministratoren, mit Superuser-Rechten, k?nnen die
Informationen und Passw?rter der anderen Benutzer mit
`chpass(1) <http://www.FreeBSD.org/cgi/man.cgi?query=chpass&sektion=1>`__
ver?ndern.

Werden keine Optionen neben dem optionalen Loginnamen angegeben, zeigt
`chpass(1) <http://www.FreeBSD.org/cgi/man.cgi?query=chpass&sektion=1>`__
einen Editor mit Account-Informationen an und aktualisiert die
Account-Datenbank, wenn dieser verlassen wird.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Unter FreeBSD wird nach dem Verlassen des Editors nach dem Passwort
gefragt, es sei denn, man ist als Superuser angemeldet.

.. raw:: html

   </div>

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel 14.3. Interaktives ``chpass`` des Superusers

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    #Changing user database information for jru.
    Login: jru
    Password: *
    Uid [#]: 1001
    Gid [# or name]: 1001
    Change [month day year]:
    Expire [month day year]:
    Class:
    Home directory: /home/jru
    Shell: /usr/local/bin/zsh
    Full Name: J. Random User
    Office Location:
    Office Phone:
    Home Phone:
    Other information:

.. raw:: html

   </div>

.. raw:: html

   </div>

Der normale Benutzer kann nur einen kleinen Teil dieser Informationen
ver?ndern und nat?rlich nur die Daten des eigenen Accounts.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel 14.4. Interaktives ``chpass`` eines normalen Benutzers

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    #Changing user database information for jru.
    Shell: /usr/local/bin/tcsh
    Full Name: J. Random User
    Office Location:
    Office Phone:
    Home Phone:
    Other information:

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

`chfn(1) <http://www.FreeBSD.org/cgi/man.cgi?query=chfn&sektion=1>`__
und
`chsh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=chsh&sektion=1>`__
sind nur Verweise auf
`chpass(1) <http://www.FreeBSD.org/cgi/man.cgi?query=chpass&sektion=1>`__
genauso wie
`ypchpass(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ypchpass&sektion=1>`__,
`ypchfn(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ypchfn&sektion=1>`__
und
`ypchsh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ypchsh&sektion=1>`__.
NIS wird automatisch unterst?tzt, deswegen ist es nicht notwendig das
``yp`` vor dem Kommando einzugeben. NIS wird sp?ter in `Kapitel?31,
*Netzwerkserver* <network-servers.html>`__ besprochen.

.. raw:: html

   </div>

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

14.6.4. passwd
~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

`passwd(1) <http://www.FreeBSD.org/cgi/man.cgi?query=passwd&sektion=1>`__
ist der ?bliche Weg, Ihr eigenes Passwort als Benutzer zu ?ndern oder
das Passwort eines anderen Benutzers als Superuser.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Um unberechtigte ?nderungen zu verhindern, muss bei einem
Passwortwechsel zuerst das urspr?ngliche Passwort eingegeben werden.

.. raw:: html

   </div>

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel 14.5. Wechseln des Passworts

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    % passwd
    Changing local password for jru.
    Old password:
    New password:
    Retype new password:
    passwd: updating the database...
    passwd: done

    # passwd jru
    Changing local password for jru.
    New password:
    Retype new password:
    passwd: updating the database...
    passwd: done

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel 14.6. Als Superuser das Passwort eines anderen Accounts
ver?ndern

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    # passwd jru
    Changing local password for jru.
    New password:
    Retype new password:
    passwd: updating the database...
    passwd: done

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Wie bei
`chpass(1) <http://www.FreeBSD.org/cgi/man.cgi?query=chpass&sektion=1>`__
ist
`yppasswd(1) <http://www.FreeBSD.org/cgi/man.cgi?query=yppasswd&sektion=1>`__
nur ein Verweis auf
`passwd(1) <http://www.FreeBSD.org/cgi/man.cgi?query=passwd&sektion=1>`__.
NIS wird von jedem dieser Kommandos unterst?tzt.

.. raw:: html

   </div>

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

14.6.5. ``pw``
~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

`pw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pw&sektion=8>`__ ist
ein Kommandozeilenprogramm, mit dem man Accounts und Gruppen erstellen,
entfernen, ver?ndern und anzeigen kann. Dieses Kommando dient als
Schnittstelle zu den Benutzer- und Gruppendateien des Systems.
`pw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pw&sektion=8>`__
besitzt eine Reihe m?chtiger Kommandozeilenschalter, die es f?r die
Benutzung in Shell-Skripten geeignet machen, doch finden neue Benutzer
die Bedienung des Kommandos komplizierter, als die der anderen hier
vorgestellten Kommandos.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------+-------------------------------+---------------------------------------+
| `Zur?ck <users-user.html>`__?   | `Nach oben <users.html>`__    | ?\ `Weiter <users-limiting.html>`__   |
+---------------------------------+-------------------------------+---------------------------------------+
| 14.5. Benutzer-Accounts?        | `Zum Anfang <index.html>`__   | ?14.7. Benutzer einschr?nken          |
+---------------------------------+-------------------------------+---------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
