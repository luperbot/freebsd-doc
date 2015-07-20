====================================
6.12. Webanwendungen, Apache und PHP
====================================

.. raw:: html

   <div class="navheader">

6.12. Webanwendungen, Apache und PHP
`Zur?ck <using-java.html>`__?
Kapitel 6. Besonderheiten
?\ `Weiter <using-python.html>`__

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

6.12. Webanwendungen, Apache und PHP
------------------------------------

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

6.12.1. Apache
~~~~~~~~~~~~~~

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

Tabelle 6.17. Variablen f?r Ports, die Apache verwenden

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``USE_APACHE``         | Der Port ben?tigt Apache. M?gliche Werte: ``yes`` (beliebige Version), ``1.3``, ``2.0``, ``2.2``, ``2.0+``, etc.?–?Standard ist Version ``1.3``.                                                            |
+------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``WITH_APACHE2``       | Der Port ben?tigt Apache 2.0. Ist diese Variable nicht gesetzt, so ben?tigt der Port Apache 1.3. Diese Variable ist veraltet und sollte nicht mehr verwendet werden.                                        |
+------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``APXS``               | Vollst?ndiger Pfad zu der ``apxs`` Bin?rdatei. Die Variable kann neu gesetzt werden.                                                                                                                        |
+------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``HTTPD``              | Vollst?ndiger Pfad zu der ``httpd`` Bin?rdatei. Die Variable kann neu gesetzt werden.                                                                                                                       |
+------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``APACHE_VERSION``     | Beinhaltet die Versionsnummer des aktuell installierten Apache (nur lesbare Variable). Diese Variable ist nach Einbinden der Datei ``bsd.port.pre.mk`` verf?gbar. M?gliche Werte: ``13``, ``20``, ``22``.   |
+------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``APACHEMODDIR``       | Verzeichnis der Apache-Module. Diese Variable wird automatisch in pkg-plist ersetzt.                                                                                                                        |
+------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``APACHEINCLUDEDIR``   | Verzeichnis der Apache Header-Dateien. Diese Variable wird automatisch in pkg-plist ersetzt.                                                                                                                |
+------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``APACHEETCDIR``       | Verzeichnis der Apache-Konfigurationsdateien. Diese Variable wird automatisch in pkg-plist ersetzt.                                                                                                         |
+------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Tabelle 6.18. N?tzliche Variablen f?r Ports von Apache-Modulen

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+---------------------+----------------------------------------------------------------------------------------------------------------+
| ``MODULENAME``      | Name des Moduls. Standardwert ist ``PORTNAME``. Beispiel: ``mod_hello``                                        |
+---------------------+----------------------------------------------------------------------------------------------------------------+
| ``SHORTMODNAME``    | Der gek?rzte Name des Moduls. Standardm??ig wird der Wert von ``MODULENAME`` ?bernommen. Beispiel: ``hello``   |
+---------------------+----------------------------------------------------------------------------------------------------------------+
| ``AP_FAST_BUILD``   | Verwende ``apxs`` zum Kompilieren und Installieren des Moduls.                                                 |
+---------------------+----------------------------------------------------------------------------------------------------------------+
| ``AP_GENPLIST``     | Eine ``pkg-plist`` wird automatisch erzeugt.                                                                   |
+---------------------+----------------------------------------------------------------------------------------------------------------+
| ``AP_INC``          | Verzeichnis f?r zus?tzliche Header-Dateien, die beim Kompilieren mitverwendet werden.                          |
+---------------------+----------------------------------------------------------------------------------------------------------------+
| ``AP_LIB``          | Verzeichnis f?r zus?tzliche Bibliothek-Dateien, welche beim Kompilieren mitverwendet werden.                   |
+---------------------+----------------------------------------------------------------------------------------------------------------+
| ``AP_EXTRAS``       | Zus?tzliche Flags f?r ``apxs``.                                                                                |
+---------------------+----------------------------------------------------------------------------------------------------------------+

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

6.12.2. Webanwendungen
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Webanwendungen sollten nach ``       PREFIX/www/programmname       ``
installiert werden. Der Einfachheit halber ist dieser Pfad sowohl im
``Makefile`` als auch in ``pkg-plist`` als ``WWWDIR`` verf?gbar. Der
relative Pfad ``PREFIX`` ist hingegen im ``Makefile`` durch die Variable
``WWWDIR_REL`` festgelegt.

Der Benutzername und die Benutzergruppe, mit deren Rechte Webanwendungen
laufen, sind in ``WWWOWN`` und ``WWWGRP`` festgelegt. Standardwert ist
bei beiden ``www``. Falls ein Port mit anderen Rechten gestartet werden
soll, so sollte die Anweisung ``WWWOWN?= myuser`` verwendet werden. Dies
vereinfacht dem Benutzer eine Anpassung dieser Werte.

Falls die Webanwendung nicht explizit Apache ben?tigt, so sollte dieser
auch nicht als Abh?ngigkeit des Ports aufgef?hrt werden. Dadurch bleibt
es dem Benutzer ?berlassen Apache oder einen anderen Webserver zu
verwenden.

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

6.12.3. PHP
~~~~~~~~~~~

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

Tabelle 6.19. Variablen f?r Ports, die PHP verwenden

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+-----------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``USE_PHP``           | Der Port ben?tigt PHP. Der Wert ``yes`` bewirkt eine Abh?ngigkeit des Ports von PHP. Es kann auch eine Liste der ben?tigten PHP-Erweiterungen angegeben werden. Beispiel: ``pcre xml gettext``   |
+-----------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``DEFAULT_PHP_VER``   | Legt die Version von PHP fest, die standardm??ig installiert wird, falls noch kein PHP vorhanden ist. Standardwert ist ``4``. M?gliche Werte sind: ``4``,\ ``5``                                 |
+-----------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``IGNORE_WITH_PHP``   | Der Port funktioniert nicht mit der angegebenen Version von PHP. M?gliche Werte: ``4``, ``5``                                                                                                    |
+-----------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``USE_PHPIZE``        | Der Port wird als PHP-Erweiterung gebaut.                                                                                                                                                        |
+-----------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``USE_PHPEXT``        | Der Port wird wie eine PHP-Erweiterung behandelt?–?Installation und Eintragung in die PHP-Registry f?r Erweiterungen.                                                                            |
+-----------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``USE_PHP_BUILD``     | Setzt PHP als build-Anh?ngigkeit.                                                                                                                                                                |
+-----------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``WANT_PHP_CLI``      | Ben?tigt die Kommandozeilen-Version von PHP.                                                                                                                                                     |
+-----------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``WANT_PHP_CGI``      | Ben?tigt die CGI-Version von PHP.                                                                                                                                                                |
+-----------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``WANT_PHP_MOD``      | Ben?tigt das Apache-Modul von PHP.                                                                                                                                                               |
+-----------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``WANT_PHP_SCR``      | Ben?tigt die Kommandozeilen- oder die CGI-Version von PHP.                                                                                                                                       |
+-----------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``WANT_PHP_WEB``      | Ben?tigt das Apache-Modul oder die CGI-Version von PHP.                                                                                                                                          |
+-----------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

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

6.12.4. PEAR Module
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das Portieren von PEAR-Modulen ist sehr einfach.

Mit Hilfe der Variablen ``FILES``, ``TESTS``, ``DATA``, ``SQLS``,
``SCRIPTFILES``, ``DOCS`` und ``EXAMPLES`` k?nnen die zu installierenden
Dateien angegeben werden. Alle aufgef?hrten Dateien werden automatisch
in die jeweiligen Verzeichnisse installiert und der Datei ``pkg-plist``
hinzugef?gt.

Die Datei ``       ${PORTSDIR}/devel/pear/bsd.pear.mk`` muss am Ende des
``Makefile``\ s eingebunden werden.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel 6.5. Beispiel eines Makefiles f?r eine PEAR Klasse

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    PORTNAME=       Date
    PORTVERSION=    1.4.3
    CATEGORIES=     devel www pear

    MAINTAINER=     example@domain.com
    COMMENT=        PEAR Date and Time Zone Classes

    BUILD_DEPENDS=  ${PEARDIR}/PEAR.php:${PORTSDIR}/devel/pear-PEAR
    RUN_DEPENDS=    ${BUILD_DEPENDS}

    FILES=          Date.php Date/Calc.php Date/Human.php Date/Span.php     \
                Date/TimeZone.php
    TESTS=          test_calc.php test_date_methods_span.php testunit.php   \
                testunit_date.php testunit_date_span.php wknotest.txt   \
                bug674.php bug727_1.php bug727_2.php bug727_3.php       \
                bug727_4.php bug967.php weeksinmonth_4_monday.txt       \
                weeksinmonth_4_sunday.txt weeksinmonth_rdm_monday.txt   \
                weeksinmonth_rdm_sunday.txt
    DOCS=           TODO
    _DOCSDIR=       .

    .include <bsd.port.pre.mk>
    .include "${PORTSDIR}/devel/pear/bsd.pear.mk"
    .include <bsd.port.post.mk>

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

+---------------------------------+--------------------------------+-------------------------------------+
| `Zur?ck <using-java.html>`__?   | `Nach oben <special.html>`__   | ?\ `Weiter <using-python.html>`__   |
+---------------------------------+--------------------------------+-------------------------------------+
| 6.11. Benutzung von Java?       | `Zum Anfang <index.html>`__    | ?6.13. Python benutzen              |
+---------------------------------+--------------------------------+-------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
