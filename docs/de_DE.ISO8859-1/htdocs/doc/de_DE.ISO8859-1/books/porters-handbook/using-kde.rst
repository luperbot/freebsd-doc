=======================
6.10. Benutzung von KDE
=======================

.. raw:: html

   <div class="navheader">

6.10. Benutzung von KDE
`Zur?ck <using-qt.html>`__?
Kapitel 6. Besonderheiten
?\ `Weiter <using-java.html>`__

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

6.10. Benutzung von KDE
-----------------------

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

6.10.1. Variablen-Definitionen (KDE 3)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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

Tabelle 6.12. Variablen f?r Ports, die KDE 3 benutzen

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+-----------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``USE_KDELIBS_VER``   | Der Port benutzt KDE-Bibliotheken. Die Variable spezifiziert die Major Version von KDE, die benutzt werden soll, und impliziert ``USE_QT_VER`` der entsprechenden Version. Der einzig m?gliche Wert ist ``3``.   |
+-----------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``USE_KDEBASE_VER``   | Der Port benutzt die KDE-Base. Die Variable spezifiziert die Major Version von KDE, die benutzt werden soll, und impliziert ``USE_QT_VER`` der entsprechenden Version. Der einzig m?gliche Wert ist ``3``.       |
+-----------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

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

6.10.2. Variablen-Definitionen (KDE 4)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Falls Ihre Anwendung von KDE 4 abh?ngt, weisen Sie ``USE_KDE4`` eine
Liste mit ben?tigten Komponenten zu. Die am h?ufigsten gebrauchten sind
unten aufgelistet (``_USE_KDE4_ALL`` in ``/usr/ports/Mk/bsd.kde4.mk``
enth?lt stets die aktuelle Liste):

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Tabelle 6.13. Verf?gbare KDE 4-Komponenten

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+-----------------+-----------------------------------------------------------------------------------------------------------+
| Name            | Beschreibung                                                                                              |
+=================+===========================================================================================================+
| ``akonadi``     | Personal Information Management (PIM)-Speicherdienst                                                      |
+-----------------+-----------------------------------------------------------------------------------------------------------+
| ``automoc4``    | L?sst den Port das Bauwerkzeug automoc4 verwenden.                                                        |
+-----------------+-----------------------------------------------------------------------------------------------------------+
| ``kdebase``     | Grundlegende KDE-Anwendungen (Konqueror, Dolphin, Konsole)                                                |
+-----------------+-----------------------------------------------------------------------------------------------------------+
| ``kdeexp``      | Experimentelle KDE-Bibliotheken (mit einer API, die als non-stable eingestuft ist)                        |
+-----------------+-----------------------------------------------------------------------------------------------------------+
| ``kdehier``     | Stellt allgemeine KDE-Verzeichnisse bereit                                                                |
+-----------------+-----------------------------------------------------------------------------------------------------------+
| ``kdelibs``     | Die grundlegenden KDE-Bibliotheken                                                                        |
+-----------------+-----------------------------------------------------------------------------------------------------------+
| ``kdeprefix``   | Falls in der Liste vorhanden, wird der Port unter ``${KDE4_PREFIX}`` statt ``${LOCALBASE}`` installiert   |
+-----------------+-----------------------------------------------------------------------------------------------------------+
| ``pimlibs``     | PIM-Bibliotheken                                                                                          |
+-----------------+-----------------------------------------------------------------------------------------------------------+
| ``workspace``   | Anwendungen und Bibliotheken, welche die Desktopumgebung gestalten (Plasma, KWin)                         |
+-----------------+-----------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

KDE 4-Ports werden unter ``${KDE4_PREFIX}``, zur Zeit
``/usr/local/kde4``, installiert, um Konflikte mit KDE 3-Ports zu
verhindern. Dies wird durch Auflisten der Komponente ``kdeprefix``
erreicht, welche die standardm??ig gesetzte Variable ``PREFIX``
?berschreibt. Die Ports ?bernehmen jedoch, jeden ?ber die
Umgebungsvariable ``MAKEFLAGS`` oder make-Parameter festgelegten Wert
f?r ``PREFIX``.

Es k?nnte bei der Installation von KDE 4-Ports zu Konflikten mit KDE
3-Ports kommen, sodass diese bei aktivierter ``kdeprefix``-Komponente
unter ``${KDE4_PREFIX}`` installiert werden. Der Standardwert von
``KDE4_PREFIX`` ist zur Zeit ``/usr/local/kde4``. Es ist auch m?glich,
KDE 4-Ports unter einem angepassten ``PREFIX`` zu installieren. Wenn
``PREFIX`` als ``MAKEFLAGS``-Umgebungsvariable oder als make-Parameter
gesetzt wird, ?berschreibt dies den von ``kdeprefix`` festgelegten Wert.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel 6.4. ``USE_KDE4``-Beispiel

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Dies ist ein einfaches Beispiel f?r einen KDE 4-Port. ``USE_CMAKE``
weist den Port an, CMake, ein unter KDE 4-Projekten weit verbreitetes
Konfigurationswerkzeug, zu verwenden. ``USE_KDE4`` legt die Abh?ngigkeit
von KDE-Bibliotheken und die Verwendung von automoc4 w?hrend der
Kompilierung fest. Mit Hilfe des configure-Protokolls k?nnen die
KDE-Komponenten und andere Abh?ngigkeiten festgestellt werden.
``USE_KDE4`` impliziert ``USE_QT_VER`` nicht. Falls der Port Qt
4-Komponenten ben?tigt, sollten ``USE_QT_VER`` gesetzt und verlangte
Komponenten festgelegt werden.

.. code:: programlisting

    USE_CMAKE=     yes
    USE_KDE4=      automoc4 kdelibs kdeprefix
    USE_QT_VER=    4
    QT_COMPONENTS= qmake_build moc_build rcc_build uic_build

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

+-------------------------------+--------------------------------+-----------------------------------+
| `Zur?ck <using-qt.html>`__?   | `Nach oben <special.html>`__   | ?\ `Weiter <using-java.html>`__   |
+-------------------------------+--------------------------------+-----------------------------------+
| 6.9. Benutzung von Qt?        | `Zum Anfang <index.html>`__    | ?6.11. Benutzung von Java         |
+-------------------------------+--------------------------------+-----------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
