=========================
6.18. wxWidgets verwenden
=========================

.. raw:: html

   <div class="navheader">

6.18. wxWidgets verwenden
`Zur?ck <using-sdl.html>`__?
Kapitel 6. Besonderheiten
?\ `Weiter <using-lua.html>`__

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

6.18. wxWidgets verwenden
-------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dieser Abschnitt beschreibt den Status der wxWidgets-Bibliotheken in den
Ports und deren Einbindung in das Ports-System.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.18.1. Einf?hrung
~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Es gibt viele Probleme bei der gleichzeitigen Verwendung
unterschiedlicher Versionen von wxWidgets-Bibliotheken (Dateien
unterschiedlicher wxWidgets-Versionen haben denselben Dateinamen). In
den Ports wurde das Problem dadurch gel?st, dass jede Version unter
einem eigenen Namen installiert wird, der die Versionsnummer als Suffix
beinhaltet.

Der offensichtliche Nachteil dabei ist, dass jede Anwendung so ver?ndert
werden muss, dass sie die erwartete Version vorfindet. Die meisten
solcher Anwendungen benutzen das ``wx-config``-Skript, um die ben?tigten
Compiler- und Linkerflags zu erhalten. Dieses Skript hat f?r jede
verf?gbare Version einen anderen Namen. Die meisten Anwendungen beachten
eine Umgebungsvariable oder ein Argument beim ``configure``-Skript, um
das gew?nschte ``wx-config``-Skript festzulegen. Ansonsten m?ssen sie
gepatcht werden.

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

6.18.2. Auswahl der Version
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Um festzulegen, welche Version der wxWidgets verwendet werden soll, gibt
es zwei Variablen (falls nur eine der beiden definiert wird, so wird die
andere auf einen Standardwert gesetzt):

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Tabelle 6.24. Variablen, um die wxWidgets-Version festzulegen

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+------------------+----------------------------------------------------------+------------------------------+
| Variable         | Beschreibung                                             | Standardwert                 |
+==================+==========================================================+==============================+
| ``USE_WX``       | Liste der Versionen, die der Port verwenden kann         | Alle verf?gbaren Versionen   |
+------------------+----------------------------------------------------------+------------------------------+
| ``USE_WX_NOT``   | Liste der Versionen, die der Port nicht verwenden kann   | Nichts                       |
+------------------+----------------------------------------------------------+------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

Es folgt eine Liste an m?glichen wxWidgets-Versionen und deren
zugeh?riger Port:

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Tabelle 6.25. Verf?gbare wxWidgets-Versionen

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+-----------+------------------------------------------------------------------------------------------------------+
| Version   | Port                                                                                                 |
+===========+======================================================================================================+
| ``2.4``   | `x11-toolkits/wxgtk24 <http://www.freebsd.org/cgi/url.cgi?ports/x11-toolkits/wxgtk24/pkg-descr>`__   |
+-----------+------------------------------------------------------------------------------------------------------+
| ``2.6``   | `x11-toolkits/wxgtk26 <http://www.freebsd.org/cgi/url.cgi?ports/x11-toolkits/wxgtk26/pkg-descr>`__   |
+-----------+------------------------------------------------------------------------------------------------------+
| ``2.8``   | `x11-toolkits/wxgtk28 <http://www.freebsd.org/cgi/url.cgi?ports/x11-toolkits/wxgtk28/pkg-descr>`__   |
+-----------+------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Ab Version ``2.5`` werden auch Versionen in Unicode unterst?tzt und ?ber
einen Unterport mit dem Suffix ``-unicode`` installiert. Dies kann aber
auch ?ber Variablen gehandhabt werden (siehe `Abschnitt?6.18.4,
„Unicode“ <using-wx.html#wx-unicode>`__).

.. raw:: html

   </div>

Die Variablen in `Tabelle?6.24, „Variablen, um die wxWidgets-Version
festzulegen“ <using-wx.html#wx-ver-sel-table>`__ k?nnen auf einen oder
mehrere (durch Leerzeichen getrennt) der folgenden Werte gesetzt werden:

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Tabelle 6.26. Spezifikationen der wxWidgets-Versionen

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+--------------------------------------------+---------------+
| Beschreibung                               | Beispiel      |
+============================================+===============+
| Einzelne Version                           | ``2.4``       |
+--------------------------------------------+---------------+
| Aufsteigende Versionsnummern               | ``2.4+``      |
+--------------------------------------------+---------------+
| Absteigende Versionsnummern                | ``2.6-``      |
+--------------------------------------------+---------------+
| Versionsinterval (muss aufsteigend sein)   | ``2.4-2.6``   |
+--------------------------------------------+---------------+

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

Tabelle 6.27. Variablen zur Festlegung der bevorzugten wxWidgets-Version

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+-------------------+----------------+
| Name              | Bestimmt f?r   |
+===================+================+
| ``WANT_WX_VER``   | den Port       |
+-------------------+----------------+
| ``WITH_WX_VER``   | den Benutzer   |
+-------------------+----------------+

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

6.18.3. Komponentenauswahl
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Desweiteren gibt es Anwendungen, die nicht direkt wxWidgets-Bibliotheken
sind, aber trotzdem mit diesen zusammenh?ngen. Diese Anwendungen k?nnen
?ber die Variable ``WX_COMPS`` festgelegt werden. Die folgenden
Komponenten sind verf?gbar:

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Tabelle 6.28. Verf?gbare wxWidgets-Komponenten

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+---------------+-------------------------------+--------------------------+
| Name          | Beschreibung                  | Versionsbeschr?nkungen   |
+===============+===============================+==========================+
| ``wx``        | Hauptbibliothek               | ``Nichts``               |
+---------------+-------------------------------+--------------------------+
| ``contrib``   | Beigesteuerte Bibliothek      | ``Nichts``               |
+---------------+-------------------------------+--------------------------+
| ``python``    | wxPython (Python-Bindungen)   | ``2.4-2.6``              |
+---------------+-------------------------------+--------------------------+
| ``mozilla``   | wxMozilla                     | ``2.4``                  |
+---------------+-------------------------------+--------------------------+
| ``svg``       | wxSVG                         | ``2.6``                  |
+---------------+-------------------------------+--------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

Der Typ der Abh?ngigkeit kann f?r jede Komponente durch hinzuf?gen eines
Suffix (durch Strichpunkt getrennt) festgelegt werden. Falls der Typ
nicht angegeben wird, wird ein Standardwert verwendet (siehe
`Tabelle?6.30, „Standardtypen der
wxWidgets-Abh?ngigkeiten“ <using-wx.html#wx-def-dep-types>`__). Die
folgenden Typen sind verf?gbar:

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Tabelle 6.29. Verf?gbare Typen von wxWidgets-Abh?ngigkeiten

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+-------------+----------------------------------------------------------------------------------+
| Name        | Beschreibung                                                                     |
+=============+==================================================================================+
| ``build``   | Komponente wird zum Bau ben?tigt?–??quivalent zu ``BUILD_DEPENDS``               |
+-------------+----------------------------------------------------------------------------------+
| ``run``     | Komponente wird zum Ausf?hren ben?tigt?–??quivalent zu ``RUN_DEPENDS``           |
+-------------+----------------------------------------------------------------------------------+
| ``lib``     | Komponente wird zum Bau und Ausf?hren ben?tigt?–??quivalent zu ``LIB_DEPENDS``   |
+-------------+----------------------------------------------------------------------------------+

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

Tabelle 6.30. Standardtypen der wxWidgets-Abh?ngigkeiten

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+---------------+------------------------+
| Komponente    | Typ der Abh?ngigkeit   |
+===============+========================+
| ``wx``        | ``lib``                |
+---------------+------------------------+
| ``contrib``   | ``lib``                |
+---------------+------------------------+
| ``python``    | ``run``                |
+---------------+------------------------+
| ``mozilla``   | ``lib``                |
+---------------+------------------------+
| ``svg``       | ``lib``                |
+---------------+------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel 6.6. Auswahl von wxWidgets-Komponenten

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Der folgende Ausschnitt entspricht einem Port, der die wxWidgets-Version
``2.4`` und die zugeh?rigen Bibliotheken verwendet.

.. code:: programlisting

    USE_WX=       2.4
    WX_COMPS=     wx contrib

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

6.18.4. Unicode
~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die wxWidgets-Bibliotheken unterst?tzen Unicode seit der Version
``2.5``. In den Ports sind beide Versionen verf?gbar und k?nnen ?ber die
folgenden Variablen ausgew?hlt werden:

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Tabelle 6.31. Variablen, um Unicode in den wxWidgets-Versionen
auszuw?hlen

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+-----------------------+---------------------------------------------------------------------------------------------------------+----------------+
| Variable              | Beschreibung                                                                                            | Bestimmt f?r   |
+=======================+=========================================================================================================+================+
| ``WX_UNICODE``        | Der Port funktioniert *ausschlie?lich* mit der Unicode-Version                                          | den Port       |
+-----------------------+---------------------------------------------------------------------------------------------------------+----------------+
| ``WANT_UNICODE``      | Der Port funktioniert in beiden Versionen?–?bevorzugt wird jedoch Unicode                               | den Port       |
+-----------------------+---------------------------------------------------------------------------------------------------------+----------------+
| ``WITH_UNICODE``      | Der Port verwendet die Unicode-Version                                                                  | den Benutzer   |
+-----------------------+---------------------------------------------------------------------------------------------------------+----------------+
| ``WITHOUT_UNICODE``   | Der Port verwendet, falls unterst?tzt, die normale Version (falls ``WX_UNICODE`` nicht definiert ist)   | den Benutzer   |
+-----------------------+---------------------------------------------------------------------------------------------------------+----------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="warning" xmlns="">

Warnung:
~~~~~~~~

Die Variable ``WX_UNICODE`` darf nicht bei Ports benutzt werden, die
sowohl die Version mit als auch ohne Unterst?tzung f?r Unicode verwenden
k?nnen. Falls der Port standardm??ig Unterst?tzung f?r Unicode bieten
soll, verwenden Sie ``WANT_UNICODE`` stattdessen.

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

6.18.5. Feststellen der installierten Version
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Um eine bereits installierte Version zu finden, muss ``WANT_WX``
definiert werden. Falls diese Variable nicht auf eine bestimmte
Versionsnummer gesetzt wird, werden die Komponenten einen Suffix mit der
Versionsnummer tragen. Die Variable ``HAVE_WX`` wird gesetzt, falls eine
installierte Version vorgefunden wurde.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel 6.7. Installierte wxWidgets-Versionen und?–Komponenten
feststellen

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Der folgende Ausschnitt kann in einem Port verwendet werden, der
wxWidgets verwendet, falls es installiert ist, oder falls eine Option
daf?r ausgew?hlt wurde.

.. code:: programlisting

    WANT_WX=        yes

    .include <bsd.port.pre.mk>

    .if defined(WITH_WX) || ${HAVE_WX:Mwx-2.4} != ""
    USE_WX=         2.4
    CONFIGURE_ARGS+=--enable-wx
    .endif

Der folgende Ausschnitt kann verwendet werden, um die Unterst?tzung f?r
wxPython zus?tzlich zu der von wxWidgets zu aktivieren (beide in Version
``2.6``), wenn das installiert ist, oder die Option ausgew?hlt wurde.

.. code:: programlisting

    USE_WX=         2.6
    WX_COMPS=       wx
    WANT_WX=        2.6

    .include <bsd.port.pre.mk>

    .if defined(WITH_WXPYTHON) || ${HAVE_WX:Mpython} != ""
    WX_COMPS+=      python
    CONFIGURE_ARGS+=--enable-wxpython
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

6.18.6. Vordefinierte Variablen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die folgenden Variablen sind in den Ports verf?gbar (nachdem sie
entsprechend `Tabelle?6.24, „Variablen, um die wxWidgets-Version
festzulegen“ <using-wx.html#wx-ver-sel-table>`__ definiert wurden).

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Tabelle 6.32. Vordefinierte Variablen f?r Ports, die wxWidgets verwenden

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+------------------+---------------------------------------------------------------------------------------------------------------------------------------+
| Name             | Beschreibung                                                                                                                          |
+==================+=======================================================================================================================================+
| ``WX_CONFIG``    | Pfad zum wxWidgets ``wx-config``-Skript (mit unterschiedlichem Namen)                                                                 |
+------------------+---------------------------------------------------------------------------------------------------------------------------------------+
| ``WXRC_CMD``     | Pfad zum wxWidgets ``wxrc``-Programm (mit unterschiedlichem Namen)                                                                    |
+------------------+---------------------------------------------------------------------------------------------------------------------------------------+
| ``WX_VERSION``   | Version der wxWidgets, die verwendet werden soll (z.B. ``2.6``)                                                                       |
+------------------+---------------------------------------------------------------------------------------------------------------------------------------+
| ``WX_UNICODE``   | Falls Unterst?tzung f?r Unicode nicht explizit definiert, jedoch verwendet wird, dann wird die Unterst?tzung automatisch aktiviert.   |
+------------------+---------------------------------------------------------------------------------------------------------------------------------------+

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

6.18.7. Verarbeitung in ``bsd.port.pre.mk``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Falls die Variablen gleich nach dem Importieren von ``bsd.port.pre.mk``
benutzt werden sollen, so muss die Variable ``WX_PREMK`` definiert
werden.

.. raw:: html

   <div class="important" xmlns="">

Wichtig:
~~~~~~~~

Falls ``WX_PREMK`` definiert ist, so werden Version, Abh?ngigkeiten,
Komponenten und vordefinierte Variablen nicht ge?ndert, wenn die
Variablen des wxWidgets-Ports *nach* dem Einbinden von
``bsd.port.pre.mk`` ge?ndert werden.

.. raw:: html

   </div>

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel 6.8. Verwendung von wxWidgets-Variablen in Kommandos

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Der folgende Ausschnitt zeigt die Verwendung von ``WX_PREMK`` durch
Ausf?hren des ``wx-config``-Skriptes, um die vollst?ndige Version als
Zeichenkette zu erhalten, diese dann einer Variablen zuzuweisen und die
Variable anschlie?end einem Programm zu ?bergeben.

.. code:: programlisting

    USE_WX=         2.4
    WX_PREMK=       yes

    .include <bsd.port.pre.mk>

    .if exists(${WX_CONFIG})
    VER_STR!=       ${WX_CONFIG} --release

    PLIST_SUB+=     VERSION="${VER_STR}"
    .endif

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Die wxWidgets-Variablen k?nnen problemlos in Kommandos benutzt werden,
falls diese in Targets ohne gesetztes ``WX_PREMK`` verwendet werden.

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

6.18.8. Weitere ``configure``-Argumente
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Einige GNU ``configure``-Skripte k?nnen wxWidgets nicht auffinden, falls
nur die Umgebungsvariable ``WX_CONFIG`` gesetzt ist, sondern ben?tigen
zus?tzliche Argumente. Daf?r kann die Variable ``WX_CONF_ARGS`` benutzt
werden.

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Tabelle 6.33. Zul?ssige Werte f?r ``WX_CONF_ARGS``

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+------------------+------------------------------------------------------------------------+
| M?glicher Wert   | Resultierendes Argument                                                |
+==================+========================================================================+
| ``absolute``     | ``--with-wx-config=${WX_CONFIG}``                                      |
+------------------+------------------------------------------------------------------------+
| ``relative``     | ``--with-wx=${LOCALBASE}           --with-wx-config=${WX_CONFIG:T}``   |
+------------------+------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------+--------------------------------+----------------------------------+
| `Zur?ck <using-sdl.html>`__?   | `Nach oben <special.html>`__   | ?\ `Weiter <using-lua.html>`__   |
+--------------------------------+--------------------------------+----------------------------------+
| 6.17. SDL verwenden?           | `Zum Anfang <index.html>`__    | ?6.19. Verwendung von Lua        |
+--------------------------------+--------------------------------+----------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
