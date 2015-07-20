================================
6.4. Benutzung von GNU autotools
================================

.. raw:: html

   <div class="navheader">

6.4. Benutzung von GNU autotools
`Zur?ck <building.html>`__?
Kapitel 6. Besonderheiten
?\ `Weiter <using-gettext.html>`__

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

6.4. Benutzung von GNU autotools
--------------------------------

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

6.4.1. Einf?hrung
~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die verschiedenen GNU autotools stellen einen Abstraktionsmechanismus
bereit f?r das Kompilieren von Software f?r eine Vielfalt von
Betriebssystemen und Maschinenarchitekturen. Innerhalb der
Ports-Sammlung kann ein einzelner Port diese Werkzeuge mit Hilfe eines
einfachen Konstrukts benutzen:

.. code:: programlisting

    USE_AUTOTOOLS= tool:version[:operation] ...

Als dies geschrieben wurde konnte *``tool``* eins von ``libtool``,
``libltdl``, ``autoconf``, ``autoheader``, ``automake`` oder ``aclocal``
sein.

*``version``* gibt die einzelne Werkzeug-Revision an, die benutzt werden
soll (siehe ``devel/{automake,autoconf,libtool}[0-9]+`` f?r m?gliche
Versionen).

*``operation``* ist eine optionale Angabe, die modifiziert, wie das
Werkzeug benutzt wird.

Es k?nnen auch mehrere Werkzeuge angegeben werden?–?entweder durch
Angabe aller in einer einzigen Zeile oder durch Benutzung des ``+=``
Makefile-Konstrukts.

Schliesslich gibt es das spezielle Tool, genannt ``autotools``, das der
Einfachheit dient indem es von alle verf?gbaren Versionen der Autotools
abh?ngt, was sinnvoll f?r Cross-Development ist. Dies kann auch erreicht
werden, indem man den Port ``devel/autotools`` installiert.

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

6.4.2. ``libtool``
~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Shared-Libraries, die das GNU Build-System benutzen, verwenden
normalerweise ``libtool``, um die Kompilierung und Installation solcher
Bibliotheken anzupassen. Die ?bliche Praxis ist, eine Kopie von
``libtool``, die mit dem Quelltext geliefert wird, zu benutzen. Falls
Sie ein externes ``libtool`` ben?tigen, k?nnen Sie die Version, die von
der Ports-Sammlung bereitgestellt wird, benutzen:

.. code:: programlisting

    USE_AUTOTOOLS= libtool:version[:env]

Ohne zus?tzliche Angaben sagt ``libtool:version         `` dem
Build-System, dass es das Konfigurationsskript mit der auf dem System
installierten Kopie von ``libtool`` patchen soll. Die Variable
``GNU_CONFIGURE`` ist impliziert. Au?erdem werden einige make–?und
shell-Variablen zur weiteren Benutzung durch den Port gesetzt. F?r
Genaueres siehe ``bsd.autotools.mk``.

Mit der Angabe ``:env`` wird nur die Umgebung vorbereitet.

Schlie?lich k?nnen optional ``LIBTOOLFLAGS`` und ``LIBTOOLFILES``
gesetzt werden, um die h?ufigsten Argumente und durch ``libtool``
gepatchten Dateien au?er Kraft zu setzen. Die meisten Ports werden das
aber nicht brauchen. F?r Weiteres siehe ``bsd.autotools.mk``.

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

6.4.3. ``libltdl``
~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Einige Ports benutzen das ``libltdl``-Bibliothekspaket, welches Teil der
``libtool``-Suite ist. Der Gebrauch dieser Bibliothek macht nicht
automatisch den Gebrauch von ``libtool`` selbst n?tig, deshalb wird ein
separates Konstrukt zur Verf?gung gestellt.

.. code:: programlisting

    USE_AUTOTOOLS= libltdl:version

Im Moment sorgt dies nur f?r eine ``LIB_DEPENDS``-Abh?ngigkeit von dem
entsprechenden ``libltdl``-Port und wird zur Vereinfachung zur Verf?gung
gestellt, um Abh?ngigkeiten von den Autotools-Ports ausserhalb des
``USE_AUTOTOOLS``-Systems zu eliminieren. Es gibt keine weiteren Angaben
f?r dieses Werkzeug.

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

6.4.4. ``autoconf`` und ``autoheader``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Manche Ports enthalten kein Konfigurationsskript, sondern eine
autoconf-Vorlage in der ``configure.ac``-Datei. Sie k?nnen die folgenden
Zuweisungen benutzen, um ``autoconf`` das Konfigurationsskript erzeugen
zu lassen, und auch ``autoheader`` Header-Vorlagen zur Benutzung durch
das Konfigurationsskript erzeugen zu lassen.

.. code:: programlisting

    USE_AUTOTOOLS=    autoconf:version[:env]

und

.. code:: programlisting

    USE_AUTOTOOLS=    autoheader:version

welches auch die Benutzung von ``autoconf:version         `` impliziert.

?hnlich wie bei ``libtool``, bereitet die Angabe des optionalen ``:env``
nur die Umgebung f?r weitere Benutzung vor. Ohne dieses wird der Port
auch gepatched und erneut konfiguriert.

Die zus?tzlichen optionalen Variablen ``AUTOCONF_ARGS`` und
``AUTOHEADER_ARGS`` k?nnen durch das ``Makefile`` des Ports ausser Kraft
gesetzt werden, wenn erforderlich. Wie bei den ``libtool``-?quivalenten
werden die meisten Ports dies aber nicht ben?tigen.

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

6.4.5. ``automake`` und ``aclocal``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Manche Pakete enthalten nur ``Makefile.am``-Dateien. Diese m?ssen durch
``automake`` in ``Makefile.in``-Dateien konvertiert und dann durch
``configure`` weiterbearbeitet werden, um schlie?lich ein ``Makefile``
zu erzeugen.

?hnliches gilt f?r Pakete, die gelegentlich keine ``aclocal.m4``-Dateien
mitliefern, welche ebenfalls zum Erstellen der Software ben?tigt werden.
Diese k?nnen durch ``aclocal`` erzeugt werden, welches ``configure.ac``
oder ``configure.in`` durchsucht.

``aclocal`` hat eine ?hnliche Beziehung zu ``automake`` wie
``autoheader`` zu ``autoconf``?–?beschrieben im vorherigen Abschnitt.
``aclocal`` impliziert die Benutzung von ``automake``, also haben wir:

.. code:: programlisting

    USE_AUTOTOOLS=    automake:version[:env]

und

.. code:: programlisting

    USE_AUTOTOOLS=    aclocal:version

was auch die Benutzung von ``         automake:version`` impliziert.

?hnlich wie bei ``libtool`` und ``autoconf``, bereitet die optionale
Angabe ``:env`` nur die Umgebung zur weiteren Benutzung vor. Ohne sie
wird der Port erneut konfiguriert.

Wie schon ``autoconf`` und ``autoheader``, hat sowohl ``automake`` als
auch ``aclocal`` eine optionale Argument-Variable ``AUTOMAKE_ARGS`` bzw.
``ACLOCAL_ARGS``, die durch das ``Makefile`` des Ports, falls n?tig,
au?er Kraft gesetzt werden kann.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------+--------------------------------+---------------------------------------+
| `Zur?ck <building.html>`__?   | `Nach oben <special.html>`__   | ?\ `Weiter <using-gettext.html>`__    |
+-------------------------------+--------------------------------+---------------------------------------+
| 6.3. Build-Mechanismen?       | `Zum Anfang <index.html>`__    | ?6.5. Benutzung von GNU ``gettext``   |
+-------------------------------+--------------------------------+---------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
