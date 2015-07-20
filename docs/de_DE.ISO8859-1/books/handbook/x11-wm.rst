==========================
6.7. Grafische Oberfl?chen
==========================

.. raw:: html

   <div class="navheader">

6.7. Grafische Oberfl?chen
`Zur?ck <x-xdm.html>`__?
Kapitel 6. Das X-Window-System
?\ `Weiter <common-tasks.html>`__

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

6.7. Grafische Oberfl?chen
--------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Beigetragen von Valentino Vaschetto.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dieser Abschnitt beschreibt verschiedene grafische Oberfl?chen, die es
f?r X unter FreeBSD gibt. Eine Oberfl?che (*desktop environment*) kann
alles von einem einfachen Window-Manager bis hin zu kompletten
Anwendungen wie KDE oder GNOME sein.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.7.1. GNOME
~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

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

6.7.1.1. ?ber GNOME
^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

GNOME ist eine benutzerfreundliche Oberfl?che, mit der Rechner leicht
benutzt und konfiguriert werden k?nnen. GNOME besitzt eine Leiste, mit
der Anwendungen gestartet werden und die Statusinformationen anzeigen
kann. Programme und Daten k?nnen auf der Oberfl?che abgelegt werden und
Standardwerkzeuge stehen zur Verf?gung. Es gibt Konventionen, die es
Anwendungen leicht machen, zusammenzuarbeiten und ein konsistentes
Erscheinungsbild garantieren. Benutzer anderer Betriebssysteme oder
anderer Arbeitsumgebungen sollten mit der leistungsf?higen grafischen
Oberfl?che von GNOME sehr gut zurechtkommen. Auf der Webseite `FreeBSD
GNOME Project <http://www.FreeBSD.org/gnome>`__ finden Sie weitere
Informationen ?ber GNOME auf FreeBSD. Zus?tzlich finden Sie dort
umfassende FAQs zur Installation, Konfiguration und zum Betrieb von
GNOME.

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

6.7.1.2. GNOME installieren
^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Am einfachsten installieren Sie GNOME als Paket oder ?ber die
Ports-Sammlung.

Wenn Sie das GNOME-Paket ?ber das Netz installieren wollen, setzen Sie
den nachstehenden Befehl ab:

.. code:: screen

    # pkg_add -r gnome2

Wenn Sie den Quellcode von GNOME ?bersetzen wollen, benutzen Sie die
Ports-Sammlung:

.. code:: screen

    # cd /usr/ports/x11/gnome2
    # make install clean

Damit GNOME korrekt funktioniert, muss das ``/proc``-Dateisystem
eingeh?ngt sein. F?gen Sie daher die folgende Zeile in ``/etc/fstab``
ein, damit
`procfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=procfs&sektion=5>`__
beim Systemstart automatisch eingeh?ngt wird:

.. code:: programlisting

    proc           /proc       procfs  rw  0   0

Nachdem GNOME installiert ist, muss der X-Server GNOME anstelle eines
Window-Managers starten.

Der einfachste Weg, GNOME zu starten, ist GDM, der GNOME Display
Manager. GDM wird zwar als Teil des GNOME-Desktops installiert, ist aber
in der Voreinstellung deaktiviert. Um GDM zu aktivieren, f?gen Sie
folgende Zeile in ``/etc/rc.conf`` ein:

.. code:: programlisting

    gdm_enable="YES"

Nach einem Systemneustart wird GDM ab sofort automatisch gestartet.

In der Regel ist es ratsam, alle GNOME-Dienste beim Start von GDM zu
aktivieren. Um dies zu erreichen, f?gen Sie die folgende Zeile in
``/etc/rc.conf`` ein:

.. code:: programlisting

    gnome_enable="YES"

GNOME kann auch von der Kommandozeile gestartet werden, wenn Sie eine
entsprechend konfigurierte ``.xinitrc`` in Ihrem Heimatverzeichnis
besitzen. Existiert eine solche Version, ersetzen Sie den Aufruf des
Window-Managers durch /usr/local/bin/gnome-session. Wenn ``.xinitrc``
nicht gesondert angepasst wurde, reicht es, den nachstehenden Befehl
abzusetzen:

.. code:: screen

    % echo "/usr/local/bin/gnome-session" > ~/.xinitrc

Rufen Sie danach ``startx`` auf, um die GNOME Oberfl?che zu starten.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Wenn Sie einen ?lteren Display-Manager wie XDM verwenden, m?ssen Sie
anders vorgehen. Legen Sie eine ausf?hrbare ``.xsession`` an, die das
Kommando zum Start von GNOME enth?lt. Ersetzen Sie dazu den Start des
Window-Managers durch /usr/local/bin/gnome-session:

.. code:: screen

    % echo "#!/bin/sh" > ~/.xsession
    % echo "/usr/local/bin/gnome-session" >> ~/.xsession
    % chmod +x ~/.xsession

.. raw:: html

   </div>

Sie k?nnen den Display-Manager auch so konfigurieren, dass der
Window-Manager beim Anmelden gew?hlt werden kann. Im Abschnitt `Details
zu KDE <x11-wm.html#x11-wm-kde-details>`__ wird das f?r KDM, den
Display-Manager von KDE erkl?rt.

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

6.7.2. KDE
~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

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

6.7.2.1. ?ber KDE
^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

KDE ist eine moderne, leicht zu benutzende Oberfl?che, die unter anderem
Folgendes bietet:

.. raw:: html

   <div class="itemizedlist">

-  eine sch?ne und moderne Oberfl?che,

-  eine Oberfl?che, die v?llig netzwerktransparent ist,

-  ein integriertes Hilfesystem, das bequem und konsistent
   Hilfestellungen bez?glich der Bedienung der KDE-Oberfl?che und ihrer
   Anwendungen gibt,

-  ein konstantes Erscheinungsbild (*look and feel*) aller
   KDE-Anwendungen,

-  einheitliche Men?s, Werkzeugleisten, Tastenkombinationen und
   Farbschemata,

-  Internationalisierung: KDE ist in mehr als 55 Sprachen erh?ltlich,

-  durch Dialoge gesteuerte zentrale Konfiguration der Oberfl?che,

-  viele n?tzliche KDE-Anwendungen.

.. raw:: html

   </div>

In KDE ist mit Konqueror auch ein Webbrowser enthalten, der sich
durchaus mit anderen Webbrowsern auf UNIX?-Systemen messen kann. Weitere
Informationen ?ber KDE erhalten Sie auf den
`KDE-Webseiten <http://www.kde.de/>`__. Auf der Webseite `KDE/FreeBSD
Initiative <http://freebsd.kde.org/>`__ finden Sie weitere
FreeBSD-spezifische Informationen ?ber KDE.

Es sind zwei Versionen von KDE unter FreeBSD verf?gbar. Version 3 ist
schon seit einiger Zeit erh?ltlich und immer noch ?ber die
Ports-Sammlung verf?gbar, obwohl es nicht mehr gepflegt wird und
teilweise kaputt ist. Version 4 wird punktuell aktualisiert und ist die
Standardauswahl f?r KDE Benutzer. Beide Versionen k?nnen sogar
gleichzeitig installiert werden.

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

6.7.2.2. KDE installieren
^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Am einfachsten installieren Sie KDE, wie jede andere grafische
Oberfl?che auch, als Paket oder ?ber die Ports-Sammlung.

Um KDE 3 ?ber das Netz zu installieren, setzen Sie den nachstehenden
Befehl ab:

.. code:: screen

    # pkg_add -r kde

Um KDE 4 ?ber das Netzwerk zu installieren, geben Sie folgendes ein:

.. code:: screen

    # pkg_add -r kde4

`pkg\_add(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_add&sektion=1>`__
installiert automatisch die neuste Version einer Anwendung.

Benutzen Sie die Ports-Sammlung, wenn Sie den Quellcode von KDE 3
?bersetzen wollen:

.. code:: screen

    # cd /usr/ports/x11/kde3
    # make install clean

Um KDE 4 aus dem Quellcode zu ?bersetzen, geben Sie folgendes ein:

.. code:: screen

    # cd /usr/ports/x11/kde4
    # make install clean

Nachdem KDE installiert ist, muss der X-Server KDE anstelle eines
Window-Managers starten. Legen Sie dazu die Datei ``.xinitrc`` an:

F?r KDE 3:

.. code:: screen

    % echo "exec startkde" > ~/.xinitrc

F?r KDE 4:

.. code:: screen

    % echo "exec /usr/local/kde4/bin/startkde" > ~/.xinitrc

Wenn das X-Window-System danach mit ``startx`` gestartet wird, erscheint
die KDE-Oberfl?che.

Wird ein Display-Manager wie XDM benutzt, muss ``.xsession`` angepasst
werden. Eine Anleitung f?r KDM folgt gleich in diesem Kapitel.

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

6.7.3. Details zu KDE
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn KDE erst einmal installiert ist, erschlie?en sich die meisten
Sachen durch das Hilfesystem oder durch Ausprobieren. Benutzer von
Windows oder Mac?OS? werden sich sehr schnell zurecht finden.

Die beste Referenz f?r KDE ist die Online-Dokumentation. KDE besitzt
einen eigenen Webbrowser, sehr viele n?tzliche Anwendungen und
ausf?hrliche Dokumentation. Der Rest dieses Abschnitts besch?ftigt sich
daher mit Dingen, die schlecht durch einfaches Ausprobieren erlernbar
sind.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.7.3.1. Der KDE-Display-Manager
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Der Administrator eines Mehrbenutzersystems will den Benutzern
vielleicht eine grafische Anmeldung wie mit `XDM <x-xdm.html>`__
erm?glichen. KDE besitzt mit KDM einen alternativen Display-Manager, der
sch?ner aussieht und auch ?ber mehr Optionen verf?gt. Insbesondere
k?nnen sich die Benutzer die Oberfl?che f?r die Sitzung (beispielsweise
KDE oder GNOME) aussuchen.

Die Art und Weise, wie KDM aktiviert wird, h?ngt dabei von der von Ihnen
eingesetzten KDE-Version ab.

F?r KDE 3 m?ssen die ``ttyv8``-Zeile in ``/etc/ttys`` wie folgt
anpassen:

.. code:: programlisting

    ttyv8 "/usr/local/bin/kdm -nodaemon" xterm on secure

Verwenden Sie hingegen KDE 4, m?ssen Sie folgende Zeilen in
``/etc/rc.conf`` aufnehmen:

.. code:: programlisting

    kdm4_enable="YES"

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

6.7.4. Xfce
~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

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

6.7.4.1. ?ber Xfce
^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Xfce ist eine grafische Oberfl?che, die auf den GTK+-Bibliotheken, die
auch von GNOME benutzt werden, beruht. Die Oberfl?che ist allerdings
weniger aufw?ndig und f?r diejenigen gedacht, die eine schlichte und
effiziente Oberfl?che wollen, die dennoch einfach zu benutzen und zu
konfigurieren ist. Die Oberfl?che sieht ?hnlich wie CDE aus, das in
kommerziellen UNIX? Systemen verwendet wird. Einige Merkmale von Xfce
sind:

.. raw:: html

   <div class="itemizedlist">

-  eine schlichte einfach zu benutzende Oberfl?che,

-  vollst?ndig mit Mausoperationen konfigurierbar, Unterst?tzung von
   *drag and drop*,

-  ?hnliche Hauptleiste wie CDE, die Men?s enth?lt und ?ber die
   Anwendungen gestartet werden k?nnen,

-  integrierter Window-Manager, Datei-Manager und Sound-Manager,
   GNOME-compliance-Modul,

-  mit *Themes* anpassbar (da GTK+ benutzt wird),

-  schnell, leicht und effizient: ideal f?r ?ltere oder langsamere
   Maschinen oder Maschinen mit wenig Speicher.

.. raw:: html

   </div>

Weitere Information ?ber Xfce erhalten Sie auf der
`Xfce-Webseite <http://www.xfce.org/>`__.

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

6.7.4.2. Xfce installieren
^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das Xfce-Paket installieren Sie mit dem nachstehenden Kommando:

.. code:: screen

    # pkg_add -r xfce4

Mit der Ports-Sammlung k?nnen Sie auch den Quellcode ?bersetzen:

.. code:: screen

    # cd /usr/ports/x11-wm/xfce4
    # make install clean

Damit beim n?chsten Start des X-Servers Xfce benutzt wird, setzen Sie
das folgende Kommando ab:

.. code:: screen

    % echo "/usr/local/bin/startxfce4" > ~/.xinitrc

Wenn Sie einen Display-Manager benutzen, erstellen Sie die Datei
``.xsession``, wie im `GNOME Abschnitt <x11-wm.html#x11-wm-gnome>`__
beschrieben. Verwenden Sie jetzt allerdings das Kommando
``/usr/local/bin/startxfce4``. Sie k?nnen auch den Display-Manager wie
im `kdm Abschnitt <x11-wm.html#x11-wm-kde-kdm>`__ beschrieben, so
konfigurieren, dass die Oberfl?che f?r die Sitzung ausgew?hlt werden
kann.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------+-------------------------------+-------------------------------------+
| `Zur?ck <x-xdm.html>`__?      | `Nach oben <x11.html>`__      | ?\ `Weiter <common-tasks.html>`__   |
+-------------------------------+-------------------------------+-------------------------------------+
| 6.6. Der X-Display-Manager?   | `Zum Anfang <index.html>`__   | ?Teil?II.?Oft benutzte Funktionen   |
+-------------------------------+-------------------------------+-------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
