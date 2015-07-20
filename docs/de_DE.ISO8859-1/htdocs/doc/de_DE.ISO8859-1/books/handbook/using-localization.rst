=================================
25.3. Lokale Anpassungen benutzen
=================================

.. raw:: html

   <div class="navheader">

25.3. Lokale Anpassungen benutzen
`Zur?ck <l10n-basics.html>`__?
Kapitel 25. Lokalisierung – I18N/L10N einrichten und benutzen
?\ `Weiter <l10n-compiling.html>`__

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

25.3. Lokale Anpassungen benutzen
---------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In seiner ganzen Sch?nheit ist L10N nichts, was auf FreeBSD alleine
beschr?nkt ist, im Gegenteil, es ist eine Konvention, an die sich viele
Programme f?r verschiedene Betriebssysteme halten. Wir m?chten Sie
anregen, FreeBSD bei der Unterst?tzung dieser Konvention zu helfen.

Lokale Anpassungen werden durch die Angabe von drei Werten erreicht: dem
Sprachcode, dem L?ndercode und der Codierung. Die Zusammenfassung dieser
Werte wird „Locale“ genannt und sieht wie folgt aus:

.. code:: programlisting

    Sprachcode_L?ndercode.Codierung

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

25.3.1. Sprach- und L?ndercodes
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Um FreeBSD (oder ein anderes UNIX? System, das I18N unterst?tzt) an
lokale Gegebenheiten und Sprachen anzupassen, muss der Benutzer
herausfinden, welche Codes f?r sein Land und seine Sprache benutzt
werden. L?ndercodes geben den Anwendungen dabei vor, welche Variation
einer bestimmten Sprache zu benutzen ist. Eine Variation von Deutsch
w?re zum Beispiel de\_CH, das eine lokale Anpassung an das in der
Schweiz gesprochene Deutsch meint. Au?erdem benutzen Webbrowser,
SMTP/POP Server, Webserver usw. diese, um Entscheidungen ?ber die
Sprache zu f?llen. Im Folgenden sind einige Beispiele f?r Sprach- und
L?ndercodes aufgelistet:

.. raw:: html

   <div class="informaltable">

+-------------------------+----------------------------------------+
| Sprachcode/L?ndercode   | Beschreibung                           |
+=========================+========================================+
| en\_US                  | Englisch - USA                         |
+-------------------------+----------------------------------------+
| ru\_RU                  | Russisch f?r Russland                  |
+-------------------------+----------------------------------------+
| zh\_TW                  | Traditionelles Chinesisch f?r Taiwan   |
+-------------------------+----------------------------------------+

.. raw:: html

   </div>

Eine vollst?ndige Liste der verf?gbaren Lokalisierungen erhalten Sie
durch die Eingabe von:

.. code:: screen

    % locale -a

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

25.3.2. Codierungen
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Einige Sprachen benutzen Codierungen, die nicht dem 7-Bit breitem
ASCII-Standard entsprechen, wie 8-Bit Codierungen, Wide- oder Multibyte
Zeichen
(`multibyte(3) <http://www.FreeBSD.org/cgi/man.cgi?query=multibyte&sektion=3>`__
geht darauf n?her ein). ?ltere Anwendungen erkennen diese Zeichen nicht
und halten sie f?lschlicherweise f?r Steuerzeichen. Neuere Anwendungen
erkennen f?r gew?hnlich 8-Bit Zeichen. Es h?ngt allerdings von der
Implementierung ab, ob man eine Anwendung neu kompilieren muss, um in
den Genuss von lokalen Zeichens?tzen zu kommen, oder ob man es sie nur
nachtr?glich konfigurieren muss. Um es m?glich zu machen, Wide- oder
Multibyte-Zeichen einzugeben und zu verarbeiten, unterst?tzt die
`FreeBSD-Ports-Sammlung <../../../../de/ports/index.html>`__
verschiedene Sprachen f?r diverse Programme. Bitte konsultieren Sie die
I18N-Dokumentation des entsprechenden FreeBSD-Ports.

In den meisten F?llen muss der Benutzer in die Dokumentation des
Programms schauen, um herauszufinden, wie man es entsprechend f?r die
eigene Sprache und den eigenen Zeichensatz konfiguriert, oder welche
Optionen beim ?bersetzen anzugeben sind.

Einige Dinge, die man im Hinterkopf behalten sollte, sind:

.. raw:: html

   <div class="itemizedlist">

-  Sprachbezogene C-char Zeichens?tze`:sup:`[14]` <#ftn.c-char>`__
   (siehe
   `multibyte(3) <http://www.FreeBSD.org/cgi/man.cgi?query=multibyte&sektion=3>`__),
   zum Beispiel ISO8859-1, ISO8859-15, KOI8-R, CP437.

-  Wide- oder Multibyte-Codierungen, zum Beispiel EUC, Big5.

.. raw:: html

   </div>

Eine aktuelle Liste der Zeichens?tze ist in der `IANA
Registry <http://www.iana.org/assignments/character-sets>`__. verf?gbar.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Ab FreeBSD?4.5 werden X11-kompatible Codierungen verwendet.

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

25.3.3. I18N-Anwendungen
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Im FreeBSD-Ports- und Paket-System werden I18N-Anwendungen mit einem
``I18N`` im Namen gekennzeichnet, damit man sie leicht identifizieren
kann. Trotzdem kann es vorkommen, dass die ben?tigte Sprache nicht immer
unterst?tzt wird.

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

25.3.4. Einstellen der Locale
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Zum Aktivieren der Lokalisierung reicht es, die Umgebungsvariable
``LANG`` in Ihrer Login-Shell auf den Wert der Locale zu setzen und die
Variable zu exportieren. Dies geschieht normalerweise in Ihrer
``~/.login_conf`` oder der Startdatei Ihrer Shell (``~/.profile``,
``~/.bashrc``, ``~/.cshrc``). Wenn ``LANG`` gesetzt ist, brauchen die
speziellen Variablen wie ``LC_CTYPE`` oder ``LC_CTIME`` in der Regel
nicht gesetzt zu werden. Sie sollten sprachbezogene
FreeBSD-Dokumentation zu Rate ziehen, wenn Sie mehr Informationen
w?nschen.

Setzen Sie die zwei folgenden Umgebungsvariablen in Ihren
Konfigurationsdateien:

.. raw:: html

   <div class="itemizedlist">

-  

   ``LANG`` f?r Funktionen der POSIX?
   `setlocale(3) <http://www.FreeBSD.org/cgi/man.cgi?query=setlocale&sektion=3>`__
   Familie

-  

   ``MM_CHARSET`` gibt den den MIME Zeichensatz von Anwendungen an

.. raw:: html

   </div>

Damit ist die Locale f?r die Shell, jede Anwendung und X11 eingestellt.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

25.3.4.1. Verfahren zum Einstellen der Locale
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Es gibt zwei Wege, die Locale zu setzen, die im Folgenden beschrieben
werden. Die erste und empfohlene Methode ist, die Umgebungsvariablen in
der `Login-Klasse <using-localization.html#login-class>`__ zu setzen,
die zweite ist, sie in den
`Startdateien <using-localization.html#startup-file>`__ der Shell zu
setzen.

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

25.3.4.1.1. Lokalisierung in der Login-Klasse
'''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn Sie diese Methode verwenden, werden die Umgebungsvariablen f?r die
Locale und den MIME Zeichensatz einmal f?r alle Shells, anstatt einzeln
f?r jede Shell, gesetzt. Die Lokalisierung kann `von einem
Benutzer <using-localization.html#usr-setup>`__ selbst oder `von einem
Administrator <using-localization.html#adm-setup>`__ mit
Superuser-Rechten f?r alle eingestellt werden.

.. raw:: html

   <div class="sect5">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

25.3.4.1.1.1. Einrichten als Benutzer
                                     

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``.login_conf`` im Heimatverzeichnis eines Benutzers sollte mindestens
die folgenden Eintr?ge enthalten, damit beide Variablen f?r den Gebrauch
der Latin-1 Codierung gesetzt werden:

.. code:: programlisting

    me:\
        :charset=ISO-8859-1:\
        :lang=de_DE.ISO8859-1:

Damit traditionelles Chinesisch (BIG-5 Codierung) verwendet werden kann,
sind in ``.login_conf`` die nachstehenden Erg?nzungen vorzunehmen.
Einige Programme behandeln die Lokalisierung f?r Chinesisch, Japanisch
und Koreanisch falsch, daher m?ssen mehr Variablen als ?blich gesetzt
werden:

.. code:: programlisting

    #Users who do not wish to use monetary units or time formats
    #of Taiwan can manually change each variable
    me:\
        :lang=zh_TW.Big5:\
        :setenv=LC_ALL=zh_TW.Big5:\
        :setenv=LC_COLLATE=zh_TW.Big5:\
        :setenv=LC_CTYPE=zh_TW.Big5:\
        :setenv=LC_MESSAGES=zh_TW.Big5:\
        :setenv=LC_MONETARY=zh_TW.Big5:\
        :setenv=LC_NUMERIC=zh_TW.Big5:\
        :setenv=LC_TIME=zh_TW.Big5:\
        :charset=big5:\
        :xmodifiers="@im=gcin": #Set gcin as the XIM Input Server

Weitere Informationen entnehmen Sie bitte
`login.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=login.conf&sektion=5>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect5">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

25.3.4.1.1.2. Einrichten als Administrator
                                          

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Stellen Sie sicher, dass in der Login-Klasse der Benutzer in
``/etc/login.conf`` die richtige Sprache eingestellt ist. Die folgenden
Einstellungen m?ssen in ``/etc/login.conf`` vorgenommen werden:

.. code:: programlisting

    Sprache|Account-Typ-Beschreibung:\
        :charset=MIME_Zeichensatz:\
        :lang=Locale:\
        :tc=default:

Die f?r Latin-1 erforderlichen Eintr?ge sehen wie folgt aus:

.. code:: programlisting

    german|German Users Accounts:\
        :charset=ISO-8859-1:\
        :lang=de_DE.ISO8859-1:\
        :tc=default:

Bevor Sie die Login-Klasse eines Benutzers ?ndern, m?ssen Sie den
folgenden Befehl ausf?hren:

.. code:: screen

    # cap_mkdb /etc/login.conf

Erst danach werden Ihre ?nderungen in ``/etc/login.conf`` im System
sichtbar.

?ndern der Login-Klasse mit `vipw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=vipw&sektion=8>`__
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

Wenn Sie neue Accounts mit ``vipw`` anlegen, erstellen Sie Eintr?ge in
folgender Art:

.. code:: programlisting

    user:password:1111:11:Sprache:0:0:Benutzername:/home/user:/bin/sh

?ndern der Login-Klasse mit `adduser(8) <http://www.FreeBSD.org/cgi/man.cgi?query=adduser&sektion=8>`__
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

Wenn Sie neue Accounts mit ``adduser`` anlegen, stehen Ihnen die
folgenden M?glichkeiten zur Verf?gung:

.. raw:: html

   <div class="itemizedlist">

-  Geben Sie in ``/etc/adduser.conf`` mit
   ``defaultclass =           Sprache`` eine Sprache vor. In diesem Fall
   m?ssen Sie f?r Benutzer anderer Sprachen eine andere Login-Klasse
   angeben.

-  Geben Sie die Sprache jedes Mal ein, wenn Sie dazu von
   `adduser(8) <http://www.FreeBSD.org/cgi/man.cgi?query=adduser&sektion=8>`__
   aufgefordert werden:

   .. code:: screen

       Enter login class: default []: 

-  Sie k?nnen die Login-Klasse auch auf der Kommandozeile von
   `adduser(8) <http://www.FreeBSD.org/cgi/man.cgi?query=adduser&sektion=8>`__
   ?bergeben:

   .. code:: screen

       # adduser -class Sprache

.. raw:: html

   </div>

?ndern der Login-Klasse mit `pw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pw&sektion=8>`__
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

Wenn Sie neue Accounts mit
`pw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pw&sektion=8>`__
anlegen, benutzen Sie die folgende Kommandozeile:

.. code:: screen

    # pw useradd Account -L Sprache

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

25.3.4.1.2. Lokalisierung in den Startdateien der Shells
''''''''''''''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Da Sie jede Shell unterschiedlich einrichten m?ssen, sollten Sie diese
Methode nicht verwenden. Benutzen Sie stattdessen bitte
`Login-Klassen <using-localization.html#login-class>`__.

.. raw:: html

   </div>

Um die Locale und den MIME Zeichensatz anzugeben, setzen Sie die unten
aufgef?hrten Variablen in den Startdateien der Shells (``/etc/profile``
und ``/etc/csh.login``). In den folgenden Beispielen verwenden wir die
deutsche Sprache.

Einstellungen in ``/etc/profile``:

.. code:: programlisting

    LANG=de_DE.ISO8859-1; export LANG
    MM_CHARSET=ISO-8859-1; export MM_CHARSET

Einstellungen in ``/etc/csh.login``:

.. code:: programlisting

    setenv LANG de_DE.ISO8859-1
    setenv MM_CHARSET ISO-8859-1

Alternativ k?nnen Sie die Einstellungen in den Vorgabedateien der Shells
vornehmen. Die oben gezeigten Einstellungen aus ``/etc/profile`` tragen
Sie dann in ``/usr/share/skel/dot.profile`` und die Einstellungen aus
``/etc/csh.login`` in ``/usr/share/skel/dot.login`` ein.

Die Einstellungen f?r X11 in ``$HOME/.xinitrc`` sind von der verwendeten
Login-Shell abh?ngig. Mit Bourne Shells verwenden Sie den folgenden
Eintrag:

.. code:: programlisting

    LANG=de_DE.ISO8859-1; export LANG

Mit C-Shells verwenden Sie den nachstehenden Eintrag:

.. code:: programlisting

    setenv LANG de_DE.ISO8859-1

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

25.3.5. Einrichten der Konsole
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn Sie C-char
Zeichens?tze\ `:sup:`[14]` <using-localization.html#ftn.c-char>`__
verwenden, m?ssen Sie die richtigen Zeichens?tze f?r die gew?hlte
Sprache in ``/etc/rc.conf`` angeben:

.. code:: programlisting

    font8x16=Zeichensatz
    font8x14=Zeichensatz
    font8x8=Zeichensatz

Dabei ist *``Zeichensatz``* der Name der passenden Datei aus
``/usr/share/syscons/fonts`` ohne die Endung ``.fnt``.

Setzen Sie bei Bedarf die richtige Tasten- und Bildschirmzuordnung
(keymap und screenmap). Dies k?nnen Sie in ``sysinstall`` einstellen,
indem Sie Configure und dann Console w?hlen. Sie k?nnen die Zuordnungen
aber auch direkt in ``/etc/rc.conf`` angeben:

.. code:: programlisting

    scrnmap=screenmap_name
    keymap=keymap_name
    keychange="fkey_number sequence"

*``screenmap_name``* ist der Name einer Datei aus
``/usr/share/syscons/scrnmaps`` ohne die Endung ``.scm``. Eine
Bildschirmzuordnung und der zugeh?rige Zeichensatz verbreitert die
Zeichenmatrix von VGA Karten im Pseudographik Modus von 8?Bit auf 9?Bit.
Sie wird ben?tigt, wenn der Zeichensatz des Bildschirms 8?Bit verwendet.

Lesen Sie den n?chsten Absatz, wenn Sie in ``/etc/rc.conf`` den moused
D?mon mit der nachstehenden Anweisung aktiviert haben:

.. code:: programlisting

    moused_enable="YES"

Der Mauszeiger des
`syscons(4) <http://www.FreeBSD.org/cgi/man.cgi?query=syscons&sektion=4>`__
Treibers belegt in der Voreinstellung den Bereich von 0xd0 bis 0xd3 des
Zeichensatzes. Wenn dieser Bereich ebenfalls von der eingestellten
Sprache ben?tigt wird, m?ssen Sie den Mauszeiger verschieben. Dazu f?gen
Sie die folgende Zeile in Ihre Kernelkonfigurationsdatei ein:

.. code:: programlisting

    mousechar_start=3

*``keymap_name``* ist der Name einer Datei aus
``/usr/share/syscons/keymaps`` ohne die Endung ``.kbd``. Welche
Tastenzuordnung Sie benutzen m?ssen, k?nnen Sie ohne einen Neustart mit
`kbdmap(1) <http://www.FreeBSD.org/cgi/man.cgi?query=kbdmap&sektion=1>`__
ausprobieren.

Mit ``keychange`` k?nnen die Funktionstasten so programmiert werden,
dass Sie zu dem ausgesuchten Terminal passen. Die Sequenzen der
Funktionstasten k?nnen nicht in Tastenzuordnungen definiert werden.

Stellen Sie sicher, dass der richtige Terminaltyp f?r die ``ttyv*``
Konsolen in ``/etc/ttys`` angegeben ist. Momentan sind die folgenden
Terminaltypen definiert:

.. raw:: html

   <div class="informaltable">

+-----------------------------+----------------+
| Zeichensatz                 | Terminaltyp    |
+=============================+================+
| ISO8859-1 oder ISO8859-15   | ``cons25l1``   |
+-----------------------------+----------------+
| ISO8859-2                   | ``cons25l2``   |
+-----------------------------+----------------+
| ISO8859-7                   | ``cons25l7``   |
+-----------------------------+----------------+
| KOI8-R                      | ``cons25r``    |
+-----------------------------+----------------+
| KOI8-U                      | ``cons25u``    |
+-----------------------------+----------------+
| CP437 (VGA default)         | ``cons25``     |
+-----------------------------+----------------+
| US-ASCII                    | ``cons25w``    |
+-----------------------------+----------------+

.. raw:: html

   </div>

Mit Wide- oder Multibyte-Zeichens?tzen m?ssen Sie den richtigen Port aus
dem Verzeichnis ``/usr/ports/Sprache`` verwenden. Einige Ports
erscheinen als Konsolen werden aber vom System als serielle vtty's
betrachtet. Achten Sie daher darauf, dass Sie gen?gend vtty's f?r X11
und die Pseudo-seriellen Konsolen definiert haben. Nachstehend finden
Sie eine unvollst?ndige Liste der Ports, die eine andere Sprache als
Englisch auf der Konsole verwenden:

.. raw:: html

   <div class="informaltable">

+-------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Sprache                             | Port                                                                                                                                                                                                         |
+=====================================+==============================================================================================================================================================================================================+
| traditionelles Chinesisch (BIG-5)   | `chinese/big5con <http://www.freebsd.org/cgi/url.cgi?ports/chinese/big5con/pkg-descr>`__                                                                                                                     |
+-------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Japanisch                           | `japanese/kon2-16dot <http://www.freebsd.org/cgi/url.cgi?ports/japanese/kon2-16dot/pkg-descr>`__ oder `japanese/mule-freewnn <http://www.freebsd.org/cgi/url.cgi?ports/japanese/mule-freewnn/pkg-descr>`__   |
+-------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Koreanisch                          | `korean/han <http://www.freebsd.org/cgi/url.cgi?ports/korean/han/pkg-descr>`__                                                                                                                               |
+-------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

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

25.3.6. Einrichten von X11
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Obwohl X11 nicht Teil des FreeBSD Projects ist, stellen wir hier einige
Hinweise f?r FreeBSD-Benutzer zusammen. Weitere Details entnehmen Sie
bitte der `Xorg Website <http://www.x.org/>`__ oder der Dokumentation
Ihres X11 Servers.

Anwendungsspezifische I18N-Einstellungen (Zeichens?tze, Men?s, usw.)
k?nnen Sie in ``~/.Xresources`` vornehmen.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

25.3.6.1. Zeichens?tze
^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Installieren Sie den Xorg-Server
(`x11-servers/xorg-server <http://www.freebsd.org/cgi/url.cgi?ports/x11-servers/xorg-server/pkg-descr>`__)
und die TrueType? Zeichens?tze Ihrer Sprache. Wenn Sie die Locale
gesetzt haben, sollten die Men?s in Ihrer Sprache erscheinen.

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

25.3.6.2. Eingabe von nicht-englischen Zeichen
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das X11 Input Method (XIM) Protokoll ist ein neuer Standard f?r alle
X11-Clients. Jede X11-Anwendung sollte als XIM-Client, der Eingaben von
einem XIM-Server entgegen nimmt, implementiert sein. XIM-Server sind f?r
verschiedene Sprachen erh?ltlich.

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

25.3.7. Einrichten eines Druckers
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Drucker verf?gen normalerweise schon ?ber einige C-char
Zeichens?tze\ `:sup:`[14]` <using-localization.html#ftn.c-char>`__.
Wide- oder Multibyte-Zeichens?tze m?ssen gesondert eingerichtet werden.
Wir empfehlen Ihnen, dazu apsfilter zu benutzen. Weiterhin k?nnen Sie
mit sprachspezifischen Konvertern Ihre Dokumente auch in PostScript?
oder PDF umwandeln.

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

25.3.8. Kernel und Dateisysteme
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das FreeBSD-Dateisystem (FFS) unterst?tzt 8-Bit, so dass es mit C-char
Zeichens?tzen\ `:sup:`[14]` <using-localization.html#ftn.c-char>`__
(siehe
`multibyte(3) <http://www.FreeBSD.org/cgi/man.cgi?query=multibyte&sektion=3>`__)
verwendet werden kann. Der Zeichensatz wird allerdings nicht im
Dateisystem gespeichert, das hei?t es werden nur die 8-Bit Werte
gespeichert und die Codierung wird nicht ber?cksichtigt. Offiziell
werden Wide- oder Multibyte-Zeichens?tze noch nicht unterst?tzt, f?r
einige Zeichens?tze existieren Patche, die eine solche Unterst?tzung
aktivieren. Sie sind allerdings nicht im Quelltext enthalten, da sie nur
schwer pflegbare ?bergangsl?sungen sind. Die Patche und weitere
Informationen erhalten Sie auf den Webseiten der betreffenden Sprache.

Das MS-DOS? Dateisystem von FreeBSD kann von MS-DOS?- und
Unicode-Zeichens?tzen nach frei w?hlbaren FreeBSD Zeichens?tzen
konvertieren. Weitere Details entnehmen Sie bitte
`mount\_msdosfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount_msdosfs&sektion=8>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="footnotes">

--------------

.. raw:: html

   <div id="ftn.c-char" class="footnote">

`:sup:`[14]` <#c-char>`__\ Mit C-char Zeichens?tzen werden Zeichens?tze
bezeichnet, die zur Codierung den C-Datentyp ``char`` verwenden.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------+-------------------------------+---------------------------------------+
| `Zur?ck <l10n-basics.html>`__?   | `Nach oben <l10n.html>`__     | ?\ `Weiter <l10n-compiling.html>`__   |
+----------------------------------+-------------------------------+---------------------------------------+
| 25.2. Grundlagen?                | `Zum Anfang <index.html>`__   | ?25.4. I18N-Programme ?bersetzen      |
+----------------------------------+-------------------------------+---------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
