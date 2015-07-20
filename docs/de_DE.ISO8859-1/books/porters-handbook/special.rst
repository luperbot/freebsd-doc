=========================
Kapitel 6. Besonderheiten
=========================

.. raw:: html

   <div class="navheader">

Kapitel 6. Besonderheiten
`Zur?ck <install.html>`__?
?
?\ `Weiter <porting-restrictions.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="chapter">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Inhaltsverzeichnis

.. raw:: html

   </div>

`6.1. Shared-Libraries <special.html#porting-shlibs>`__
`6.2. Ports mit beschr?nkter Verbreitung <porting-restrictions.html>`__
`6.3. Build-Mechanismen <building.html>`__
`6.4. Benutzung von GNU autotools <using-autotools.html>`__
`6.5. Benutzung von GNU ``gettext`` <using-gettext.html>`__
`6.6. Die Benutzung von ``perl`` <using-perl.html>`__
`6.7. Benutzung von X11 <using-x11.html>`__
`6.8. Benutzung von GNOME <using-gnome.html>`__
`6.9. Benutzung von Qt <using-qt.html>`__
`6.10. Benutzung von KDE <using-kde.html>`__
`6.11. Benutzung von Java <using-java.html>`__
`6.12. Webanwendungen, Apache und PHP <using-php.html>`__
`6.13. Python benutzen <using-python.html>`__
`6.14. Benutzung von Tcl/Tk <using-tcl.html>`__
`6.15. Emacs benutzen <using-emacs.html>`__
`6.16. Ruby benutzen <using-ruby.html>`__
`6.17. SDL verwenden <using-sdl.html>`__
`6.18. wxWidgets verwenden <using-wx.html>`__
`6.19. Verwendung von Lua <using-lua.html>`__
`6.20. Xfce verwenden <using-xfce.html>`__
`6.21. Mozilla verwenden <using-mozilla.html>`__
`6.22. Benutzung von Datenbanken <using-databases.html>`__
`6.23. Starten und Anhalten von Diensten (rc
Skripten) <rc-scripts.html>`__
`6.24. Hinzuf?gen von Benutzern und Gruppen <users-and-groups.html>`__
`6.25. Von Kernelquellen abh?ngige Ports <ch06s25.html>`__

.. raw:: html

   </div>

Es gibt einige Dinge mehr, die zu beachten sind, wenn man einen Port
erstellt. Dieser Abschnitt erkl?rt die wichtigsten.

.. raw:: html

   <div class="sect1">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.1. Shared-Libraries
---------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn Ihr Port eine oder mehrere Shared-Libraries installiert, dann
definieren Sie bitte eine ``USE_LDCONFIG`` make-Variable, die
``bsd.port.mk`` anweisen wird, ``${LDCONFIG} -m`` auf das Verzeichnis,
in das die neue Library installiert wird (normalerweise ``PREFIX/lib``),
w?hrend des ``post-install``-Targets anzuwenden, um sie im
Shared-Library-Cache zu registrieren. Diese Variable, wenn definiert,
wird auch daf?r sorgen, dass ein entsprechendes
``@exec /sbin/ldconfig -m`` und ``@unexec /sbin/ldconfig -R``-Paar zu
Ihrer ``pkg-plist``-Datei hinzugef?gt wird, sodass ein Benutzer, der das
Paket installiert, die Bibliothek danach sofort benutzen kann und das
System nach deren Deinstallation nicht glaubt, die Bibliothek w?re noch
da.

.. code:: programlisting

    USE_LDCONFIG= yes

Wenn n?tig, k?nnen Sie das Standardverzeichnis au?er Kraft setzen, indem
Sie den ``USE_LDCONFIG`` Wert auf eine Liste von Verzeichnissen setzen,
in die Shared Libraries installiert werden sollen. Wenn Ihr Port z.B.
diese Bibliotheken nach ``PREFIX/lib/foo`` und ``PREFIX/lib/bar``
installiert, k?nnten Sie folgendes in Ihrem ``Makefile`` benutzen:

.. code:: programlisting

    USE_LDCONFIG= ${PREFIX}/lib/foo ${PREFIX}/lib/bar

Bitte ?berpr?fen Sie dies genau. Oft ist das ?berhaupt nicht n?tig oder
kann durch ``-rpath`` oder das Setzen von ``LD_RUN_PATH`` w?hrend des
Linkens umgangen werden (s.
`lang/moscow\_ml <http://www.freebsd.org/cgi/url.cgi?ports/lang/moscow_ml/pkg-descr>`__
f?r ein Beispiel), oder durch einen Shell-Wrapper, der
``LD_LIBRARY_PATH`` setzt, bevor er die Bin?rdatei ausf?hrt, wie es
`www/seamonkey <http://www.freebsd.org/cgi/url.cgi?ports/www/seamonkey/pkg-descr>`__
tut.

Wenn Sie 32-Bit Libraries auf 64-Bit Systemen installieren, benutzen Sie
stattdessen ``USE_LDCONFIG32``.

Versuchen Sie Shared-Library-Versionsnummern im ``libfoo.so.0`` Format
zu halten. Unser Runtime-Linker k?mmert sich nur um die Major (erste)
Nummer.

Wenn sich die Major-Library-Versionsnummer w?hrend der Aktualisierung zu
einer neuen Portversion erh?ht, sollte auch die ``PORTREVISION`` aller
Ports, die die Shared-Library linken, erh?ht werden, damit diese mit der
neuen Version der Bibliothek neu kompiliert werden.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------+-------------------------------+---------------------------------------------+
| `Zur?ck <install.html>`__?        | ?                             | ?\ `Weiter <porting-restrictions.html>`__   |
+-----------------------------------+-------------------------------+---------------------------------------------+
| 5.14. Installation von Dateien?   | `Zum Anfang <index.html>`__   | ?6.2. Ports mit beschr?nkter Verbreitung    |
+-----------------------------------+-------------------------------+---------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
