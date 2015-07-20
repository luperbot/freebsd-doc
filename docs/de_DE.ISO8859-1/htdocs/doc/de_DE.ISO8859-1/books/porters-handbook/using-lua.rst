========================
6.19. Verwendung von Lua
========================

.. raw:: html

   <div class="navheader">

6.19. Verwendung von Lua
`Zur?ck <using-wx.html>`__?
Kapitel 6. Besonderheiten
?\ `Weiter <using-xfce.html>`__

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

6.19. Verwendung von Lua
------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dieser Abschnitt beschreibt den Status der Lua-Bibliotheken in den Ports
und deren Einbindung in das Ports System.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.19.1. Einf?hrung
~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Es gibt viele Probleme bei der gleichzeitigen Verwendung
unterschiedlicher Versionen von Lua-Bibliotheken (Dateien
unterschiedlicher Versionen haben denselben Dateinamen). In den Ports
wurde das Problem gel?st, indem jede Version unter einem eigenen Namen
mit der Versionsnummer als Suffix installiert wird.

Der offensichtliche Nachteil dabei ist, dass jede Anwendung so ver?ndert
werden muss, dass sie die erwartete Version vorfindet. Dies kann jedoch
durch zus?tzliche Flags f?r Compiler und Linker gel?st werden.

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

6.19.2. Auswahl der Version
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Um festzulegen, welche Version von Lua verwendet werden soll, gibt es
zwei Variablen (falls nur eine der beiden definiert ist, so wird die
andere auf einen Standardwert gesetzt):

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Tabelle 6.34. Variablen, um die Lua-Version festzulegen

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+-------------------+----------------------------------------------------------+------------------------------+
| Variable          | Beschreibung                                             | Standardwert                 |
+===================+==========================================================+==============================+
| ``USE_LUA``       | Liste der Versionen, welche der Port verwenden kann      | Alle verf?gbaren Versionen   |
+-------------------+----------------------------------------------------------+------------------------------+
| ``USE_LUA_NOT``   | Liste der Versionen, die der Port nicht verwenden kann   | Nichts                       |
+-------------------+----------------------------------------------------------+------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

Es folgt eine Liste an m?glichen Lua-Versionen und deren zugeh?riger
Port:

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Tabelle 6.35. Verf?gbare Lua-Versionen

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+-----------+----------------------------------------------------------------------------------+
| Version   | Port                                                                             |
+===========+==================================================================================+
| ``4.0``   | `lang/lua4 <http://www.freebsd.org/cgi/url.cgi?ports/lang/lua4/pkg-descr>`__     |
+-----------+----------------------------------------------------------------------------------+
| ``5.0``   | `lang/lua50 <http://www.freebsd.org/cgi/url.cgi?ports/lang/lua50/pkg-descr>`__   |
+-----------+----------------------------------------------------------------------------------+
| ``5.1``   | `lang/lua <http://www.freebsd.org/cgi/url.cgi?ports/lang/lua/pkg-descr>`__       |
+-----------+----------------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Variablen in `Tabelle?6.34, „Variablen, um die Lua-Version
festzulegen“ <using-lua.html#lua-ver-sel-table>`__ k?nnen auf einen oder
mehrere (durch Leerzeichen getrennt) der folgenden Werte gesetzt werden:

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Tabelle 6.36. Spezifikationen der Lua-Versionen

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+----------------------------------------------+---------------+
| Beschreibung                                 | Beispiel      |
+==============================================+===============+
| Spezielle Version                            | ``4.0``       |
+----------------------------------------------+---------------+
| Aufsteigende Versionen                       | ``5.0+``      |
+----------------------------------------------+---------------+
| Absteigende Versionen                        | ``5.0-``      |
+----------------------------------------------+---------------+
| Versionenintervall (muss aufsteigend sein)   | ``5.0-5.1``   |
+----------------------------------------------+---------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

Desweiteren gibt es Variablen, ?ber die eine bevorzugte Version
festgelegt werden kann. Die Versionen k?nnen als Liste angegeben werden,
wobei die Reihenfolge der Priorisierung entspricht.

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Tabelle 6.37. Variablen zur Festlegung der bevorzugten Lua-Version

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+--------------------+----------------+
| Name               | Bestimmt f?r   |
+====================+================+
| ``WANT_LUA_VER``   | den Port       |
+--------------------+----------------+
| ``WITH_LUA_VER``   | den Benutzer   |
+--------------------+----------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel 6.9. Auswahl der Lua-Version

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Der folgende Ausschnitt entspricht einem Port, der Lua in den Versionen
``5.0`` oder ``5.1`` verwenden kann und standardm??ig ``5.0`` verwendet.
Diese Einstellung kann durch die benutzerdefinierte Variable
``WITH_LUA_VER`` ?berschrieben werden.

.. code:: programlisting

    USE_LUA=      5.0-5.1
    WANT_LUA_VER= 5.0

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

6.19.3. Komponentenauswahl
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Desweiteren gibt es Anwendungen, die nicht direkt Lua-Bibliotheken sind,
aber trotzdem mit diesen zusammenh?ngen. Diese Anwendungen k?nnen ?ber
die Variable ``LUA_COMPS`` festgelegt werden. Die folgenden Komponenten
sind verf?gbar:

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Tabelle 6.38. Verf?gbare Lua-Komponenten

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+-------------+---------------------------------------------------+---------------------------+
| Name        | Beschreibung                                      | Versionseinschr?nkungen   |
+=============+===================================================+===========================+
| ``lua``     | Hauptbibliothek                                   | Keine                     |
+-------------+---------------------------------------------------+---------------------------+
| ``tolua``   | Bibliothek f?r die Unterst?tzung von C/C++-Code   | ``4.0-5.0``               |
+-------------+---------------------------------------------------+---------------------------+
| ``ruby``    | Ruby-Bindungen                                    | ``4.0-5.0``               |
+-------------+---------------------------------------------------+---------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Es gibt weitere Komponenten, die jedoch Module f?r den Interpreter sind
und nicht von Anwendungen benutzt werden (nur von anderen Modulen).

.. raw:: html

   </div>

Der Typ der Abh?ngigkeit kann f?r jede Komponente durch Hinzuf?gen eines
Suffix (durch Strichpunkt getrennt) festgelegt werden. Falls der Typ
nicht angegeben wird, wird ein Standardwert verwendet (siehe
`Tabelle?6.40, „Standardtypen f?r
Lua-Abh?ngigkeiten“ <using-lua.html#lua-def-dep-types>`__). Die
folgenden Typen sind verf?gbar:

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Tabelle 6.39. Verf?gbare Typen von Lua-Abh?ngigkeiten

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+-------------+--------------------------------------------------------------------------------------+
| Name        | Beschreibung                                                                         |
+=============+======================================================================================+
| ``build``   | Komponente wird zum Bau ben?tigt?–??quivalent zu ``BUILD_DEPENDS``                   |
+-------------+--------------------------------------------------------------------------------------+
| ``run``     | Komponente wird zum Ausf?hren ben?tigt?–??quivalent zu ``RUN_DEPENDS``               |
+-------------+--------------------------------------------------------------------------------------+
| ``lib``     | Komponente wird zum Bau und zum Ausf?hren ben?tigt?–??quivalent zu ``LIB_DEPENDS``   |
+-------------+--------------------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Standardwerte f?r die einzelnen Komponenten sind in der folgenden
Tabelle aufgef?hrt:

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Tabelle 6.40. Standardtypen f?r Lua-Abh?ngigkeiten

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+--------------+-----------------------------------------------------------------------+
| Komponente   | Typ der Abh?ngigkeit                                                  |
+==============+=======================================================================+
| ``lua``      | ``lib`` f?r ``4.0-5.0`` (shared) und ``build`` f?r ``5.1`` (static)   |
+--------------+-----------------------------------------------------------------------+
| ``tolua``    | ``build`` (static)                                                    |
+--------------+-----------------------------------------------------------------------+
| ``ruby``     | ``lib`` (shared)                                                      |
+--------------+-----------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel 6.10. Auswahl von Lua-Komponenten

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Der folgende Ausschnitt entspricht einem Port, welcher die Lua-Version
``4.0`` und die zugeh?rigen Ruby-Bindungen verwendet.

.. code:: programlisting

    USE_LUA=      4.0
    LUA_COMPS=    lua ruby

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

6.19.4. Feststellen der installierten Version
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Um eine bereits installierte Version zu finden, muss ``WANT_LUA``
definiert werden. Falls diese Variable nicht auf eine bestimmte
Versionsnummer gesetzt wird, werden die Komponenten einen Suffix mit der
Versionsnummer tragen. Die Variable ``HAVE_LUA`` wird gesetzt, falls
eine installierte Version vorgefunden wurde.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel 6.11. Installierte Lua-Versionen und–?Komponenten feststellen

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Der folgende Ausschnitt kann in einem Port verwendet werden, der Lua
benutzt, falls es installiert ist oder eine Option daf?r ausgew?hlt
wurde.

.. code:: programlisting

    WANT_LUA=       yes

    .include <bsd.port.pre.mk>

    .if defined(WITH_LUA5) || ${HAVE_LUA:Mlua-5.[01]} != ""
    USE_LUA=        5.0-5.1
    CONFIGURE_ARGS+=--enable-lua5
    .endif

Der folgende Ausschnitt kann verwendet werden, um die Unterst?tzung f?r
tolua zus?tzlich zu der von Lua zu aktivieren (beide in Version 4.0),
wenn dies installiert ist oder die Option ausgew?hlt wurde.

.. code:: programlisting

    USE_LUA=        4.0
    LUA_COMPS=      lua
    WANT_LUA=       4.0

    .include <bsd.port.pre.mk>

    .if defined(WITH_TOLUA) || ${HAVE_LUA:Mtolua} != ""
    LUA_COMPS+=     tolua
    CONFIGURE_ARGS+=--enable-tolua
    .endif

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

6.19.5. Vordefinierte Variablen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die folgenden Variablen sind in den Ports verf?gbar (nachdem sie
entsprechend `Tabelle?6.34, „Variablen, um die Lua-Version
festzulegen“ <using-lua.html#lua-ver-sel-table>`__ definiert wurden).

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Tabelle 6.41. Vordefinierte Variablen f?r Ports, die Lua verwenden

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+-------------------------+----------------------------------------------------------------------------------------------------------------------+
| Name                    | Beschreibung                                                                                                         |
+=========================+======================================================================================================================+
| ``LUA_VER``             | Die Lua-Version, die verwendet wird (z.B. ``5.1``)                                                                   |
+-------------------------+----------------------------------------------------------------------------------------------------------------------+
| ``LUA_VER_SH``          | Die Hauptversion f?r shared-Lua-Bibliotheken (z.B. ``1``)                                                            |
+-------------------------+----------------------------------------------------------------------------------------------------------------------+
| ``LUA_VER_STR``         | Die Lua-Version ohne die Punkte (z.B. ``51``)                                                                        |
+-------------------------+----------------------------------------------------------------------------------------------------------------------+
| ``LUA_PREFIX``          | Der Pr?fix, unter dem Lua (und Komponenten) installiert ist                                                          |
+-------------------------+----------------------------------------------------------------------------------------------------------------------+
| ``LUA_SUBDIR``          | Das Verzeichnis unter ``${PREFIX}/bin``, ``${PREFIX}/share`` und ``${PREFIX}/lib``, in welchem Lua installiert ist   |
+-------------------------+----------------------------------------------------------------------------------------------------------------------+
| ``LUA_INCDIR``          | Das Verzeichnis, in dem Lua- und tolua-Header-Dateien installiert sind                                               |
+-------------------------+----------------------------------------------------------------------------------------------------------------------+
| ``LUA_LIBDIR``          | Das Verzeichnis, in dem Lua–?und tolua-Bibliotheken installiert sind                                                 |
+-------------------------+----------------------------------------------------------------------------------------------------------------------+
| ``LUA_MODLIBDIR``       | Das Verzeichnis, in dem Lua Modul-Bibliotheken (``.so``) installiert sind                                            |
+-------------------------+----------------------------------------------------------------------------------------------------------------------+
| ``LUA_MODSHAREDIR``     | Das Verzeichnis, in dem Lua-Module (``.lua``) installiert sind                                                       |
+-------------------------+----------------------------------------------------------------------------------------------------------------------+
| ``LUA_PKGNAMEPREFIX``   | Der Paketnamen-Pr?fix, der von Lua-Modulen verwendet wird                                                            |
+-------------------------+----------------------------------------------------------------------------------------------------------------------+
| ``LUA_CMD``             | Das Verzeichnis, in dem der Lua-Interpreter liegt                                                                    |
+-------------------------+----------------------------------------------------------------------------------------------------------------------+
| ``LUAC_CMD``            | Das Verzeichnis, in dem der Lua-Compiler liegt                                                                       |
+-------------------------+----------------------------------------------------------------------------------------------------------------------+
| ``TOLUA_CMD``           | Das Verzeichnis, in dem das tolua-Programm liegt                                                                     |
+-------------------------+----------------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel 6.12. Einem Port mitteilen, in welchem Verzeichnis Lua liegt

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Der folgende Ausschnitt zeigt, wie einem Port, welcher ein
configure-Skript verwendet, mitgeteilt werden kann, wo die
Lua-Header-Dateien und Bibliotheken liegen.

.. code:: programlisting

    USE_LUA=        4.0
    GNU_CONFIGURE=  yes
    CONFIGURE_ENV=  CPPFLAGS="-I${LUA_INCDIR}" LDFLAGS="-L${LUA_LIBDIR}"

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

6.19.6. Verarbeitung in ``bsd.port.pre.mk``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Falls die Variablen gleich nach dem Einbinden von ``bsd.port.pre.mk``
benutzt werden sollen, so muss die Variable ``LUA_PREMK`` definiert
werden.

.. raw:: html

   <div class="important" xmlns="">

Wichtig:
~~~~~~~~

Falls ``LUA_PREMK`` definiert ist, so werden Version, Abh?ngigkeiten,
Komponenten und vordefinierte Variablen nicht ge?ndert, wenn die
Variablen des Lua-Ports *nach* dem Einbinden von ``bsd.port.pre.mk``
ge?ndert werden.

.. raw:: html

   </div>

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel 6.13. Verwendung von Lua-Variablen in Kommandos

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Der folgende Ausschnitt zeigt die Verwendung von ``LUA_PREMK`` durch
Ausf?hren des Lua-Interpreters, um die vollst?ndige Version als
Zeichenkette zu erhalten, diese dann einer Variablen zuzuweisen und die
Variable schlie?lich einem Programm zu ?bergeben.

.. code:: programlisting

    USE_LUA=        5.0
    LUA_PREMK=      yes

    .include <bsd.port.pre.mk>

    .if exists(${LUA_CMD})
    VER_STR!=       ${LUA_CMD} -v

    CFLAGS+=        -DLUA_VERSION_STRING="${VER_STR}"
    .endif

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Die Lua-Variablen k?nnen problemlos in Befehlen benutzt werden, falls
diese in Targets ohne gesetztes ``LUA_PREMK`` verwendet werden.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------+--------------------------------+-----------------------------------+
| `Zur?ck <using-wx.html>`__?   | `Nach oben <special.html>`__   | ?\ `Weiter <using-xfce.html>`__   |
+-------------------------------+--------------------------------+-----------------------------------+
| 6.18. wxWidgets verwenden?    | `Zum Anfang <index.html>`__    | ?6.20. Xfce verwenden             |
+-------------------------------+--------------------------------+-----------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
