========================
6.11. Benutzung von Java
========================

.. raw:: html

   <div class="navheader">

6.11. Benutzung von Java
`Zur?ck <using-kde.html>`__?
Kapitel 6. Besonderheiten
?\ `Weiter <using-php.html>`__

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

6.11. Benutzung von Java
------------------------

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

6.11.1. Variablen-Definitionen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn Ihr Port ein Java™ Development Kit (JDK™) ben?tigt, entweder zum
Bauen, zur Laufzeit oder sogar, um das Distfile auszupacken, dann
sollten Sie ``USE_JAVA`` setzen.

Es gibt mehrere JDKs in der Ports-Sammlung–?von verschiedenen Anbietern
und in verschiedenen Versionen. Wenn Ihr Port eine bestimmte dieser
Versionen ben?tigt, k?nnen Sie definieren welche. Die aktuelle Version
ist
`java/jdk16 <http://www.freebsd.org/cgi/url.cgi?ports/java/jdk16/pkg-descr>`__.

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Tabelle 6.14. Variablen, die von Ports, die Java benutzen, gesetzt
werden m?ssen

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+--------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Variable           | Bedeutung                                                                                                                                                                                              |
+====================+========================================================================================================================================================================================================+
| ``USE_JAVA``       | Sollte definiert sein, damit die ?brigen Variablen irgendeinen Effekt haben.                                                                                                                           |
+--------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``JAVA_VERSION``   | Durch Leerzeichen getrennte Liste von geeigneten Java-Versionen f?r den Port. Ein optionales ``"+"`` erm?glicht die Angabe eines Bereiches von Versionen (m?gliche Werte: ``1.5[+] 1.6[+] 1.7[+]``).   |
+--------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``JAVA_OS``        | Durch Leerzeichen getrennte Liste von geeigneten JDK-Port-Betriebssystemen f?r den Port. (erlaubte Werte: ``native linux``).                                                                           |
+--------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``JAVA_VENDOR``    | Durch Leerzeichen getrennte Liste von geeigneten JDK-Port-Anbietern f?r den Port. (erlaubte Werte: ``freebsd bsdjava sun openjdk``).                                                                   |
+--------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``JAVA_BUILD``     | Bedeutet, falls gesetzt, dass der ausgew?hlte JDK-Port zu den Build-Abh?ngigkeiten des Ports hinzugef?gt werden soll.                                                                                  |
+--------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``JAVA_RUN``       | Bedeutet, falls gesetzt, dass der ausgew?hlte JDK-Port zu den Laufzeit-Abh?ngigkeiten des Ports hinzugef?gt werden soll.                                                                               |
+--------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``JAVA_EXTRACT``   | Bedeutet, falls gesetzt, dass der ausgew?hlte JDK-Port zu den Extract-Abh?ngigkeiten des Ports hinzugef?gt werden soll.                                                                                |
+--------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

Das Folgende ist eine Liste aller Variablen, die ein Port bekommt,
nachdem er ``USE_JAVA`` gesetzt hat:

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Tabelle 6.15. Bereitgestellte Variablen f?r Ports, die Java benutzen

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Variable                           | Wert                                                                                                                                                                                                            |
+====================================+=================================================================================================================================================================================================================+
| ``JAVA_PORT``                      | Der Name des JDK-Ports (z.B. ``'java/diablo-jdk16'``).                                                                                                                                                          |
+------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``JAVA_PORT_VERSION``              | Die volle Version des JDK Ports (z.B. ``'1.6.0'``). Wenn Sie nur die ersten beiden Stellen dieser Versionsnummer ben?tigen, benutzen Sie ``           ${JAVA_PORT_VERSION:C/^([0-9])\.([0-9])(.*)$/\1.\2/}``.   |
+------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``JAVA_PORT_OS``                   | Das vom JDK-Port benutzte Betriebssystem (z.B. ``'native'``).                                                                                                                                                   |
+------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``JAVA_PORT_VENDOR``               | Der Anbieter des JDK-Ports (z.B. ``'freebsd'``).                                                                                                                                                                |
+------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``JAVA_PORT_OS_DESCRIPTION``       | Beschreibung des vom JDK-Port benutzten Betriebssystems (z.B. ``'Native'``).                                                                                                                                    |
+------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``JAVA_PORT_VENDOR_DESCRIPTION``   | Beschreibung des Anbieters des JDK-Ports (z.B. ``'FreeBSD Foundation'``).                                                                                                                                       |
+------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``JAVA_HOME``                      | Pfad zum Installationsverzeichnis des JDK (z.B. ``'/usr/local/diablo-jdk1.6.0'``).                                                                                                                              |
+------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``JAVAC``                          | Pfad zum Java-Compiler, der benutzt werden soll (z.B. ``'/usr/local/diablo-jdk1.6.0/bin/javac'``.                                                                                                               |
+------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``JAR``                            | Pfad zum ``jar``-Werkzeug, das benutzt werden soll (z.B.'``'/usr/local/diablo-jdk1.6.0/bin/jar`` oder ``'/usr/local/bin/fastjar'``).                                                                            |
+------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``APPLETVIEWER``                   | Pfad zum ``appletviewer``-Werkzeug (z.B. ``'/usr/local/diablo-jdk1.6.0/bin/appletviewer'``).                                                                                                                    |
+------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``JAVA``                           | Pfad zur ``java`` Bin?rdatei. Benutzen Sie dies, um Java-Programme auszuf?hren (z.B.``'/usr/local/diablo-jdk1.6.0/bin/java'``).                                                                                 |
+------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``JAVADOC``                        | Pfad zum ``javadoc``-Werkzeug.                                                                                                                                                                                  |
+------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``JAVAH``                          | Pfad zum ``javah``-Programm.                                                                                                                                                                                    |
+------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``JAVAP``                          | Pfad zum ``javap``-Programm.                                                                                                                                                                                    |
+------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``JAVA_KEYTOOL``                   | Pfad zum ``keytool``-Werkzeug.                                                                                                                                                                                  |
+------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``JAVA_N2A``                       | Pfad zum ``native2ascii``-Werkzeug.                                                                                                                                                                             |
+------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``JAVA_POLICYTOOL``                | Pfad zum ``policytool`` Programm.                                                                                                                                                                               |
+------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``JAVA_SERIALVER``                 | Pfad zum ``serialver``-Werkzeug.                                                                                                                                                                                |
+------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``RMIC``                           | Pfad zum RMI Stub/Skeleton-Generator, ``rmic``.                                                                                                                                                                 |
+------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``RMIREGISTRY``                    | Pfad zum RMI Registry-Werkzeug, ``rmiregistry``.                                                                                                                                                                |
+------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``RMID``                           | Pfad zum RMI Daemon ``rmid``.                                                                                                                                                                                   |
+------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``JAVA_CLASSES``                   | Pfad zum Archiv, das die JDK-Klassendateien enth?lt, ``${JAVA_HOME}/jre/lib/rt.jar``.                                                                                                                           |
+------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

Sie k?nnen das ``java-debug`` make-Target benutzen, um Information zum
Debuggen Ihres Ports zu erhalten. Es wird die Werte vieler der
obenangegebenen Variablen anzeigen.

Zus?tzlich sind die folgenden Konstanten definiert, damit alle
Java-Ports auf eine konsistente Art installiert werden k?nnen:

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Tabelle 6.16. Konstanten, die f?r Ports, welche Java benutzen, definiert
sind

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+--------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------+
| Konstante          | Wert                                                                                                                                                   |
+====================+========================================================================================================================================================+
| ``JAVASHAREDIR``   | Das Basis-Verzeichnis f?r alles, was mit Java zusammenh?ngt. Standardm??ig ``${PREFIX}/share/java``.                                                   |
+--------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``JAVAJARDIR``     | Das Verzeichnis, wohin JAR-Dateien installiert werden sollen. Standardm??ig ``${JAVASHAREDIR}/classes``.                                               |
+--------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``JAVALIBDIR``     | Das Verzeichnis, in dem JAR-Dateien, die von anderen Ports installiert wurden, liegen. Standardm??ig ``           ${LOCALBASE}/share/java/classes``.   |
+--------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

Die entsprechenden Eintr?ge sind sowohl in ``PLIST_SUB`` (dokumentiert
in `Abschnitt?7.1, „?nderungen an ``pkg-plist`` mit Hilfe von
make-Variablen“ <plist.html#plist-sub>`__) als auch in ``SUB_LIST``
definiert.

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

6.11.2. Kompilieren mit Ant
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn der Port mit Apache Ant kompiliert werden soll, muss er ``USE_ANT``
setzen. Ant wird dann als das sub-make-Kommando betrachtet. Wenn kein
``do-build``-Target vom Port definiert ist, wird eine Standardvorgabe
benutzt, die einfach Ant entsprechend ``MAKE_ENV``, ``MAKE_ARGS`` und
``ALL_TARGET`` aufruft. Das ?hnelt dem ``USE_GMAKE``-Mechanismus, der in
`Abschnitt?6.3, „Build-Mechanismen“ <building.html>`__ dokumentiert ist.

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

6.11.3. Optimales Verfahren
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn Sie eine Java-Bibliothek portieren, sollte Ihr Port die
JAR-Datei(en) in ``${JAVAJARDIR}`` installieren, und alles andere unter
``${JAVASHAREDIR}/${PORTNAME}`` (ausgenommen die Dokumentation - siehe
unten). Um die Gr??e der Packlistendatei zu reduzieren, k?nnen die
JAR-Datei(en) direkt im ``Makefile`` angegeben werden. Benutzen Sie
einfach die folgende Anweisung (wobei ``myport.jar`` der Name der
JAR-Datei ist, die als Teil des Ports installiert wird):

.. code:: programlisting

    PLIST_FILES+= %%JAVAJARDIR%%/myport.jar

Beim Portieren einer Java-Applikation installiert der Port normalerweise
alles unter einem einzigen Verzeichnis (inklusive seiner
JAR-Abh?ngigkeiten). Die Benutzung von ``${JAVASHAREDIR}/${PORTNAME}``
wird in dieser Beziehung dringend empfohlen. Es liegt im
Entscheidungsbereich des Portierenden, ob der Port die zus?tzlichen
JAR-Abh?ngigkeiten unter diesem Verzeichnis installieren oder direkt die
schon installierten (aus ``${JAVAJARDIR}``) benutzen soll.

Unabh?ngig von der Art Ihres Ports (Bibliothek oder Applikation), sollte
die zus?tzliche Dokumentation an die `gleiche
Stelle <install.html#install-documentation>`__ installiert werden wie
bei jedem anderen Port auch. Das JavaDoc-Werkzeug ist daf?r bekannt
einen unterschiedlichen Satz von Dateien abh?ngig von der Version des
benutzten JDKs zu erstellen. F?r Ports, die nicht die Benutzung eines
bestimmten JDKs vorgeben, ist es deshalb eine komplexe Aufgabe die
Packliste (``pkg-plist``) festzulegen. Dies ist ein Grund, warum
dringend angeraten wird, das ``PORTDOCS``-Makro zu benutzen. Au?erdem,
selbst wenn Sie den Satz von Dateien, den ``javadoc`` erzeugen wird,
voraussagen k?nnen, die Gr??e der resultierenden ``pkg-plist``
bef?rwortet die Benutzung von ``PORTDOCS``.

Der Vorgabewert f?r ``DATADIR`` ist ``${PREFIX}/share/${PORTNAME}``. Es
ist eine gute Idee, ``DATADIR`` f?r Java-Ports stattdessen auf
``${JAVASHAREDIR}/${PORTNAME}`` zu setzen. In der Tat wird ``DATADIR``
automatisch zu ``PLIST_SUB`` (dokumentiert in `Abschnitt?7.1,
„?nderungen an ``pkg-plist`` mit Hilfe von
make-Variablen“ <plist.html#plist-sub>`__) hinzugef?gt, d.h. Sie k?nnen
``%%DATADIR%%`` direkt in ``pkg-plist`` benutzen.

Zu der Frage, ob Java-Ports aus dem Quelltext gebaut werden, oder direkt
bereitgestellte bin?re Distributionen benutzt werden sollten, gab es,
als dies geschrieben wurde, keine definierte Richtlinie. Allerdings
ermutigen Mitglieder des `FreeBSD
Java-Projekts <http://www.freebsd.org/java/>`__ Porter dazu, Ihre Ports
aus dem Quelltext kompilieren zu lassen, wann immer dies kein Problem
darstellt.

Alle Eigenschaften, die in diesem Abschnitt pr?sentiert wurden sind in
``bsd.java.mk`` implementiert. Sollten Sie jemals der Meinung sein, dass
Ihr Port ausgefeiltere Java-Unterst?tzung ben?tigt, schauen Sie bitte
erst in das `bsd.java.mk CVS
Log <http://www.freebsd.org/cgi/cvsweb.cgi/ports/Mk/bsd.java.mk>`__,
weil es normalerweise immer etwas Zeit braucht bis die neuesten
Eigenschaften dokumentiert sind. Wenn Sie glauben, dass der fehlende
Support auch f?r viele andere Java Ports n?tzlich sein k?nnte, wenden
Sie sich bitte an die `FreeBSD Java
Language <http://lists.FreeBSD.org/mailman/listinfo/freebsd-java>`__.

Obwohl es eine ``java``-Kategorie f?r Fehlerberichte gibt, bezieht sich
diese auf die JDK-Portierungsbem?hungen des FreeBSD Java-Projektes.
Deshalb sollten Sie Ihren Java-Port in der ``ports``-Kategorie
einreichen wie bei jeden anderen Port auch - es sei denn, die
Angelegenheit, die Sie zu kl?ren versuchen, steht in Zusammenhang
entweder mit einer JDK-Implementierung oder ``bsd.java.mk``.

Gleicherma?en gibt es eine definierte Richtlinie f?r die ``CATEGORIES``
eines Java-Ports, die in `Abschnitt?5.3,
„Kategorisierung“ <makefile-categories.html>`__ erkl?rt wird.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------+--------------------------------+-----------------------------------------+
| `Zur?ck <using-kde.html>`__?   | `Nach oben <special.html>`__   | ?\ `Weiter <using-php.html>`__          |
+--------------------------------+--------------------------------+-----------------------------------------+
| 6.10. Benutzung von KDE?       | `Zum Anfang <index.html>`__    | ?6.12. Webanwendungen, Apache und PHP   |
+--------------------------------+--------------------------------+-----------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
