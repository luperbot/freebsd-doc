=====================
6.9. Benutzung von Qt
=====================

.. raw:: html

   <div class="navheader">

6.9. Benutzung von Qt
`Zur?ck <using-gnome.html>`__?
Kapitel 6. Besonderheiten
?\ `Weiter <using-kde.html>`__

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

6.9. Benutzung von Qt
---------------------

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

6.9.1. Ports, die Qt ben?tigen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Tabelle 6.7. Variablen f?r Ports, die Qt ben?tigen

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+---------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``USE_QT_VER``      | Der Port benutzt das Qt-Toolkit. M?gliche Werte sind ``3`` und ``4``; diese spezifizieren die Major Version von Qt, die benutzt werden soll. Entsprechende Parameter werden an das ``configure``-Skript und ``make`` ?bergeben.   |
+---------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``QT_PREFIX``       | Enth?lt den Pfad, wohin Qt installiert ist (nur lesbare Variable).                                                                                                                                                                |
+---------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``MOC``             | Enth?lt den Pfad von ``moc`` (nur lesbare Variable). Voreingestellt entsprechend des ``USE_QT_VER``-Werts.                                                                                                                        |
+---------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``QTCPPFLAGS``      | Zus?tzliche Compiler-Flags, die ?ber ``CONFIGURE_ENV`` an das Qt-Toolkit ?bergeben werden. Voreingestellt entsprechend des ``USE_QT_VER``-Wertes.                                                                                 |
+---------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``QTCFGLIBS``       | Zus?tzliche Bibliotheken, die ?ber ``CONFIGURE_ENV`` f?r das Qt-Toolkit gelinkt werden sollen. Voreingestellt entsprechend des ``USE_QT_VER``-Wertes.                                                                             |
+---------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``QTNONSTANDARD``   | ?nderungen von ``CONFIGURE_ENV``, ``CONFIGURE_ARGS`` und ``MAKE_ENV`` sollen unterdr?ckt werden.                                                                                                                                  |
+---------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Tabelle 6.8. Zus?tzliche Variablen f?r Ports, die Qt 4.xi benutzen

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+---------------------+-----------------------------------------------------------------------------------------------------------------------------------------+
| ``QT_COMPONENTS``   | Spezifiziert Tool–?und Bibliothek-Abh?ngigkeiten f?r Qt4. Siehe unten f?r Details.                                                      |
+---------------------+-----------------------------------------------------------------------------------------------------------------------------------------+
| ``UIC``             | Enth?lt den Pfad von ``uic`` (nur lesbare Variable). Voreingestellt entsprechend des ``USE_QT_VER``-Wertes.                             |
+---------------------+-----------------------------------------------------------------------------------------------------------------------------------------+
| ``QMAKE``           | Enth?lt den Pfad von ``qmake`` (nur lesbare Variable). Voreingestellt entsprechend des ``USE_QT_VER``-Wertes.                           |
+---------------------+-----------------------------------------------------------------------------------------------------------------------------------------+
| ``QMAKESPEC``       | Enth?lt den Pfad der Konfigurationsdatei f?r ``qmake`` (nur lesbare Variable). Voreingestellt entsprechend des ``USE_QT_VER``-Wertes.   |
+---------------------+-----------------------------------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn ``USE_QT_VER`` gesetzt ist, werden dem ``configure``-Skript einige
n?tzliche Einstellungen ?bergeben:

.. code:: programlisting

    CONFIGURE_ARGS+= --with-qt-includes=${QT_PREFIX}/include \
                 --with-qt-libraries=${QT_PREFIX}/lib \
                 --with-extra-libs=${LOCALBASE}/lib \
                 --with-extra-includes=${LOCALBASE}/include
    CONFIGURE_ENV+=  MOC="${MOC}" CPPFLAGS="${CPPFLAGS} ${QTCPPFLAGS}" LIBS="${QTCFGLIBS}" \
                 QTDIR="${QT_PREFIX}" KDEDIR="${KDE_PREFIX}"

Wenn ``USE_QT_VER`` auf ``4`` gesetzt ist, werden auch die folgenden
Einstellungen ?bergeben:

.. code:: programlisting

    CONFIGURE_ENV+= UIC="${UIC}" QMAKE="${QMAKE}" QMAKESPEC="${QMAKESPEC}"
    MAKE_ENV+=      QMAKESPEC="${QMAKESPEC}"

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

6.9.2. Komponentenauswahl (nur bei Qt 4.x)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn ``USE_QT_VER`` auf 4 gesetzt ist, k?nnen individuelle Qt4-Tool- und
Bibliotheksabh?ngigkeiten in der Variable ``QT_COMPONENTS`` angegeben
werden. An jede Komponente kann ``_build`` oder ``_run`` als Suffix
angeh?ngt werden, was eine Abh?ngigkeit zur Build- bzw. Laufzeit angibt.
Ohne Suffix gilt die Abh?ngigkeit sowohl zur Build- als auch zur
Laufzeit. Bibliothekskomponenten sollten normalerweise ohne Suffix
angegeben werden, Tool-Komponenten mit ``_build`` und Plugin-Komponenten
mit ``_run``. Die gebr?uchlichsten Komponenten werden im Folgenden
angegeben (alle verf?gbaren Komponenten sind in ``_QT_COMPONENTS_ALL``
in ``/usr/ports/Mk/bsd.qt.mk`` aufgelistet):

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Tabelle 6.9. Verf?gbare Qt4-Bibliothekskomponenten

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+------------------+-----------------------------------------------------------------------------------------------------+
| Name             | Beschreibung                                                                                        |
+==================+=====================================================================================================+
| ``corelib``      | Kern-Bibliothek (kann weggelassen werden–?es sei denn, der Port benutzt nichts au?er ``corelib``)   |
+------------------+-----------------------------------------------------------------------------------------------------+
| ``gui``          | Graphische Benutzeroberfl?chen-Bibliothek                                                           |
+------------------+-----------------------------------------------------------------------------------------------------+
| ``network``      | Netzwerk-Bibliothek                                                                                 |
+------------------+-----------------------------------------------------------------------------------------------------+
| ``opengl``       | OpenGL-Bibliothek                                                                                   |
+------------------+-----------------------------------------------------------------------------------------------------+
| ``qt3support``   | Qt3-Kompatibilit?ts-Bibliothek                                                                      |
+------------------+-----------------------------------------------------------------------------------------------------+
| ``qtestlib``     | Modultest-Bibliothek                                                                                |
+------------------+-----------------------------------------------------------------------------------------------------+
| ``script``       | Skript-Bibliothek                                                                                   |
+------------------+-----------------------------------------------------------------------------------------------------+
| ``sql``          | SQL-Bibliothek                                                                                      |
+------------------+-----------------------------------------------------------------------------------------------------+
| ``xml``          | XML-Bibliothek                                                                                      |
+------------------+-----------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

Sie k?nnen herausfinden, welche Bibliotheken die Applikation ben?tigt,
indem Sie nach erfolgreicher Kompilierung ``ldd`` auf die
Hauptbin?rdatei anwenden.

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Tabelle 6.10. Verf?gbare Qt4-Tool-Komponenten

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+-------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Name        | Beschreibung                                                                                                                                                              |
+=============+===========================================================================================================================================================================+
| ``moc``     | meta object compiler (wird zum Build fast jeder Qt-Applikation ben?tigt)                                                                                                  |
+-------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``qmake``   | Makefile-Generator / Build-Werkzeug                                                                                                                                       |
+-------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``rcc``     | Resource-Compiler (wird ben?tigt, falls die Applikation ``*.rc`` oder ``*.qrc`` Dateien enth?lt)                                                                          |
+-------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``uic``     | User-Interface-Compiler (wird ben?tigt, falls die Applikation von Qt-Designer erzeugte ``*.ui`` Dateien enth?lt - gilt f?r praktisch jede Qt-Applikation mit einer GUI)   |
+-------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Tabelle 6.11. Verf?gbare Qt4-Plugin-Komponenten

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+--------------------+----------------------------------------------------------------------------------------------+
| Name               | Beschreibung                                                                                 |
+====================+==============================================================================================+
| ``iconengines``    | SVG-Icon-Engine Plugin (wenn die Applikation SVG-Icons mitliefert)                           |
+--------------------+----------------------------------------------------------------------------------------------+
| ``imageformats``   | Bildformatplugins f?r GIF, JPEG, MNG und SVG (wenn die Applikation Bilddateien mitliefert)   |
+--------------------+----------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel 6.3. Qt4-Komponenten ausw?hlen

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

In diesem Beispiel benutzt die portierte Applikation die Qt4
GUI-Bibliothek, die Qt4-Core-Bibliothek, alle Qt4-Codeerzeugungstools
und Qt4's Makefile Generator. Da die GUI-Bibliothek eine Abh?ngigkeit
von der Core-Bibliothek impliziert, muss corelib nicht angegeben werden.
Die Qt4-Codeerzeugungstools moc, uic und rcc, sowie der Makefile
Generator qmake werden nur f?r den Build ben?tigt, deshalb bekommen die
den Suffix ``_build``:

.. code:: programlisting

    USE_QT_VER=    4
    QT_COMPONENTS= gui moc_build qmake_build rcc_build uic_build

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

6.9.3. Zus?tzliche Besonderheiten
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn die Applikation keine ``configure`` Datei, sondern eine ``.pro``
Datei hat, k?nnen Sie das Folgende benutzen:

.. code:: programlisting

    HAS_CONFIGURE=    yes

    do-configure:
        @cd ${WRKSRC} && ${SETENV} ${CONFIGURE_ENV} \
                ${QMAKE} -unix PREFIX=${PREFIX} texmaker.pro

Beachten Sie die ?hnlichkeit mit der ``qmake``-Zeile im mitgelieferten
``BUILD.sh``-Skript. Die ?bergabe von ``CONFIGURE_ENV`` stellt sicher,
dass ``qmake`` die ``QMAKESPEC``-Variable ?bergeben bekommt, ohne die es
nicht funktioniert. ``qmake`` erzeugt Standard-Makefiles, sodass es
nicht n?tig ist ein eigenes neues ``build``-Target zu schreiben.

Qt-Applikationen sind oft so geschrieben, dass sie plattform?bergreifend
sind, und oft ist X11/Unix nicht die Plattform, auf der sie entwickelt
werden. Das sorgt oft f?r bestimmte fehlende Kleinigkeiten wie z.B.:

.. raw:: html

   <div class="itemizedlist">

-  *Fehlende zus?tzliche Include-Pfade.* Viele Applikationen kommen mit
   System-Tray-Icon Support–?unterlassen es aber Includes oder
   Bibliotheken in den X11 Verzeichnissen zu suchen. Sie k?nnen
   ``qmake`` ?ber die Kommandozeile sagen, es soll Verzeichnisse zu den
   Include- und Bibliotheks-Suchpfaden hinzuf?gen - z.B.:

   .. code:: programlisting

       ${QMAKE} -unix PREFIX=${PREFIX} INCLUDEPATH+=${LOCALBASE}/include \
           LIBS+=-L${LOCALBASE}/lib sillyapp.pro

-  *Falsche Installations-Pfade.* Manchmal werden Daten wie Icons oder
   .desktop-Dateien per Vorgabe in Verzeichnisse installiert, die nicht
   von XDG-kompatiblen Applikationen durchsucht werden.
   `editors/texmaker <http://www.freebsd.org/cgi/url.cgi?ports/editors/texmaker/pkg-descr>`__
   ist hierf?r ein Beispiel–?siehe ``patch-texmaker.pro`` im
   ``files``-Verzeichnis dieses Ports als eine Vorlage, die zeigt, wie
   man dies direkt in der Qmake Projektdatei l?st.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------+--------------------------------+----------------------------------+
| `Zur?ck <using-gnome.html>`__?   | `Nach oben <special.html>`__   | ?\ `Weiter <using-kde.html>`__   |
+----------------------------------+--------------------------------+----------------------------------+
| 6.8. Benutzung von GNOME?        | `Zum Anfang <index.html>`__    | ?6.10. Benutzung von KDE         |
+----------------------------------+--------------------------------+----------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
