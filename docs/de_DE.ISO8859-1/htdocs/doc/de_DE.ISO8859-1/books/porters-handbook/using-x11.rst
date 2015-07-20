======================
6.7. Benutzung von X11
======================

.. raw:: html

   <div class="navheader">

6.7. Benutzung von X11
`Zur?ck <using-perl.html>`__?
Kapitel 6. Besonderheiten
?\ `Weiter <using-gnome.html>`__

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

6.7. Benutzung von X11
----------------------

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

6.7.1. X.Org-Komponenten
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die X11-Implementierung, welche die Ports-Sammlung bereitstellt, ist
X.Org. Wenn Ihre Applikation von X-Komponenten abh?ngt, listen Sie die
ben?tigten Komponenten in ``USE_XORG`` auf. Als dies geschrieben wurde,
wurden die folgenden Komponenten bereitgestellt:

``bigreqsproto compositeproto damageproto dmx         dmxproto evieproto fixesproto fontcacheproto fontenc         fontsproto fontutil glproto ice inputproto kbproto libfs         oldx printproto randrproto recordproto renderproto         resourceproto scrnsaverproto sm trapproto videoproto x11         xau xaw xaw6 xaw7 xaw8 xbitmaps xcmiscproto xcomposite         xcursor xdamage xdmcp xevie xext xextproto         xf86bigfontproto xf86dgaproto xf86driproto xf86miscproto         xf86rushproto xf86vidmodeproto xfixes xfont xfontcache xft         xi xinerama xineramaproto xkbfile xkbui xmu xmuu         xorg-server xp xpm xprintapputil xprintutil xpr oto         xproxymngproto xrandr xrender xres xscrnsaver xt xtrans         xtrap xtst xv xvmc xxf86dga xxf86misc         xxf86vm``.

Die aktuelle Liste finden Sie immer in ``/usr/ports/Mk/bsd.xorg.mk``.

Das Mesa Projekt ist ein Versuch, eine freie OpenGL Implementierung
bereitzustellen. Sie k?nnen eine Abh?ngigkeit von verschiedenen
Komponenten diese Projektes in der Variable ``USE_GL`` spezifizieren.
ouml;gliche Optionen sind: ``glut,         glu, glw, glew, gl`` und
``linux``. F?r Abw?rtskompatibilit?t gilt der Wert ``yes`` als ``glu``.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel 6.1. Beispiel f?r USE\_XORG

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    USE_XORG=   xrender xft xkbfile xt xaw
    USE_GL=     glu

.. raw:: html

   </div>

.. raw:: html

   </div>

Viele Ports definieren ``USE_XLIB``, was daf?r sorgt, dass der Port von
allen (rund 50) Bibliotheken abh?ngt. Diese Variable existiert, um
Abw?rtskompatibilit?t sicherzustellen (sie stammt noch aus der Zeit vor
dem modularem X.Org), und sollte bei neuen Ports nicht mehr benutzt
werden.

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Tabelle 6.5. Variablen f?r Ports, die X benutzen

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+--------------------+------------------------------------------------------------------------------------------------------------------------------------------------+
| ``USE_XLIB``       | Der Port benutzt die X-Bibliotheken. Soll nicht mehr verwendet werden - benutzen Sie stattdessen eine Liste von Komponenten in ``USE_XORG``.   |
+--------------------+------------------------------------------------------------------------------------------------------------------------------------------------+
| ``USE_X_PREFIX``   | Soll nicht mehr benutzt werden, ist jetzt ?quivalent zu ``USE_XLIB`` und kann einfach durch letzteres ersetzt werden.                          |
+--------------------+------------------------------------------------------------------------------------------------------------------------------------------------+
| ``USE_IMAKE``      | Der Port benutzt ``imake``. Impliziert ``USE_X_PREFIX``.                                                                                       |
+--------------------+------------------------------------------------------------------------------------------------------------------------------------------------+
| ``XMKMF``          | Ist auf den Pfad zu ``xmkmf`` gesetzt, wenn nicht in ``PATH``. Vorgabe ist ``xmkmf -a``.                                                       |
+--------------------+------------------------------------------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Tabelle 6.6. Variablen bei Abh?ngigkeit von einzelnen Teilen von X11

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+------------------------------+----------------------------------------------------------------------------------------------------------------+
| ``X_IMAKE_PORT``             | Ein Port, der ``imake`` und einige andere Werkzeuge, die zum Erstellen von X11 benutzt werden, bereitstellt.   |
+------------------------------+----------------------------------------------------------------------------------------------------------------+
| ``X_LIBRARIES_PORT``         | Ein Port, der die X11-Bibliotheken bereitstellt.                                                               |
+------------------------------+----------------------------------------------------------------------------------------------------------------+
| ``X_CLIENTS_PORT``           | Ein Port, der X11-Clients bereitstellt.                                                                        |
+------------------------------+----------------------------------------------------------------------------------------------------------------+
| ``X_SERVER_PORT``            | Ein Port, der den X11-Server bereitstellt.                                                                     |
+------------------------------+----------------------------------------------------------------------------------------------------------------+
| ``X_FONTSERVER_PORT``        | Ein Port, der den Fontserver bereitstellt.                                                                     |
+------------------------------+----------------------------------------------------------------------------------------------------------------+
| ``X_PRINTSERVER_PORT``       | Ein Port, der den Printserver bereitstellt.                                                                    |
+------------------------------+----------------------------------------------------------------------------------------------------------------+
| ``X_VFBSERVER_PORT``         | Ein Port, der den virtuellen Framebuffer-Server bereitstellt.                                                  |
+------------------------------+----------------------------------------------------------------------------------------------------------------+
| ``X_NESTSERVER_PORT``        | Ein Port, der einen nested X-Server bereitstellt.                                                              |
+------------------------------+----------------------------------------------------------------------------------------------------------------+
| ``X_FONTS_ENCODINGS_PORT``   | Ein Port, der Kodierungen f?r Schriftarten bereitstellt.                                                       |
+------------------------------+----------------------------------------------------------------------------------------------------------------+
| ``X_FONTS_MISC_PORT``        | Ein Port, der verschiedene Bitmap-Schriftarten bereitstellt.                                                   |
+------------------------------+----------------------------------------------------------------------------------------------------------------+
| ``X_FONTS_100DPI_PORT``      | Ein Port, der 100dpi Bitmap-Schriftarten bereitstellt.                                                         |
+------------------------------+----------------------------------------------------------------------------------------------------------------+
| ``X_FONTS_75DPI_PORT``       | Ein Port, der 75dpi Bitmap-Schriftarten bereitstellt.                                                          |
+------------------------------+----------------------------------------------------------------------------------------------------------------+
| ``X_FONTS_CYRILLIC_PORT``    | Ein Port, der kyrillische Bitmap-Schriftarten bereitstellt.                                                    |
+------------------------------+----------------------------------------------------------------------------------------------------------------+
| ``X_FONTS_TTF_PORT``         | Ein Port, der TrueType?-Schriftarten bereitstellt.                                                             |
+------------------------------+----------------------------------------------------------------------------------------------------------------+
| ``X_FONTS_TYPE1_PORT``       | Ein Port, der Type1-Schriftarten bereitstellt.                                                                 |
+------------------------------+----------------------------------------------------------------------------------------------------------------+
| ``X_MANUALS_PORT``           | Ein Port, der entwicklerorientierte Manualpages bereitstellt.                                                  |
+------------------------------+----------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel 6.2. Benutzung von X11-bezogenen Variablen in einem Port

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    # Port benutzt X11-Bibliotheken und h?ngt vom Font-Server sowie
    # von kyrillischen Schriftarten ab.
    RUN_DEPENDS=   ${LOCALBASE}/bin/xfs:${X_FONTSERVER_PORT} \
                   ${LOCALBASE}/lib/X11/fonts/cyrillic/crox1c.pcf.gz:${X_FONTS_CYRILLIC_PORT}

    USE_XORG=      x11 xpm

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

6.7.2. Ports, die Motif ben?tigen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn Ihr Port eine Motif-Bibliothek ben?tigt, definieren Sie
``USE_MOTIF`` im ``Makefile``. Die Standard-Motif-Implementierung ist
`x11-toolkits/open-motif <http://www.freebsd.org/cgi/url.cgi?ports/x11-toolkits/open-motif/pkg-descr>`__.
Benutzer k?nnen stattdessen
`x11-toolkits/lesstif <http://www.freebsd.org/cgi/url.cgi?ports/x11-toolkits/lesstif/pkg-descr>`__
w?hlen, indem Sie die ``WANT_LESSTIF``-Variable setzen.

Die Variable ``MOTIFLIB`` wird von ``bsd.port.mk`` auf die entsprechende
Motif-Bibliothek gesetzt. Bitte patchen Sie den Quelltext Ihres Ports,
sodass er ?berall ``${MOTIFLIB}`` benutzt, wo die Motif-Bibliothek im
Original ``Makefile`` oder ``Imakefile`` referenziert wird.

Es gibt zwei verbreitete F?lle:

.. raw:: html

   <div class="itemizedlist">

-  Wenn sich der Port in seinem ``Makefile`` oder ``Imakefile`` auf die
   Motif-Bibliothek als ``-lXm`` bezieht, ersetzen Sie das einfach durch
   ``${MOTIFLIB}``.

-  Wenn der Port in seinem ``Imakefile`` ``XmClientLibs`` benutzt,
   ersetzen Sie das durch ``${MOTIFLIB}         ${XTOOLLIB} ${XLIB}``.

.. raw:: html

   </div>

Anmerkung: ``MOTIFLIB`` expandiert (normalerweise) zu
``-L/usr/X11R6/lib         -lXm`` oder
``/usr/X11R6/lib/libXm.a         `` - d.h. Sie m?ssen kein ``-L`` oder
``-l`` davor einf?gen.

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

6.7.3. X11 Schriftarten
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn Ihr Port Schriftarten f?r das X-Window-System installiert, legen
Sie diese nach ``         LOCALBASE/lib/X11/fonts/local``.

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

6.7.4. Erzeugen eines k?nstlichen ``DISPLAY`` durch Xvfb
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Manche Applikationen ben?tigen ein funktionierendes X11-Display, damit
die Kompilierung funktioniert. Das stellt f?r Systeme, die ohne Display
laufen, ein Problem dar. Wenn die folgende Variable benutzt wird,
startet die Bauumgebung den virtuellen Framebuffer-X-Server, und ein
funktionierendes ``DISPLAY`` wird dem Build ?bergeben.

.. code:: programlisting

    USE_DISPLAY=  yes

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

6.7.5. Desktop-Eintr?ge
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Desktop-Eintr?ge (`Freedesktop
Standard <http://standards.freedesktop.org/desktop-entry-spec/latest/>`__)
k?nnen in Ihrem Port einfach ?ber die ``DESKTOP_ENTRIES``-Variable
erzeugt werden. Diese Eintr?ge erscheinen dann im Applikationsmen? von
standardkonformen Desktop-Umgebungen wie GNOME oder KDE. Die
``.desktop``-Datei wird dann automatisch erzeugt, installiert und der
``pkg-plist`` hinzugef?gt. Die Syntax ist:

.. code:: programlisting

    DESKTOP_ENTRIES=  "NAME" "COMMENT" "ICON" "COMMAND" "CATEGORY" StartupNotify

Die Liste der m?glichen Kategorien ist auf der `Freedesktop
Webseite <http://standards.freedesktop.org/menu-spec/latest/apa.html>`__
abrufbar. ``StartupNotify`` zeigt an, ob die Applikation den Status in
Umgebungen, die Startup-Notifications kennen, l?schen wird.

Beispiel:

.. code:: programlisting

    DESKTOP_ENTRIES=  "ToME" "Roguelike game based on JRR Tolkien's work" \
                  "${DATADIR}/xtra/graf/tome-128.png" \
                  "tome -v -g" "Application;Game;RolePlaying;" \
                  false

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------+--------------------------------+------------------------------------+
| `Zur?ck <using-perl.html>`__?      | `Nach oben <special.html>`__   | ?\ `Weiter <using-gnome.html>`__   |
+------------------------------------+--------------------------------+------------------------------------+
| 6.6. Die Benutzung von ``perl``?   | `Zum Anfang <index.html>`__    | ?6.8. Benutzung von GNOME          |
+------------------------------------+--------------------------------+------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
