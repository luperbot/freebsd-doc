=============================
5.4. Die Distributionsdateien
=============================

.. raw:: html

   <div class="navheader">

5.4. Die Distributionsdateien
`Zur?ck <makefile-categories.html>`__?
Kapitel 5. Die Konfiguration des Makefile
?\ `Weiter <makefile-maintainer.html>`__

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

5.4. Die Distributionsdateien
-----------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Der zweite Teil des ``Makefile`` beschreibt die Dateien, welche
heruntergeladen werden m?ssen, um den Port zu bauen und wo diese Dateien
zu finden sind.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.4.1. ``DISTVERSION/DISTNAME``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``DISTNAME`` ist der Name der Applikation wie er von den Autoren
vergeben wurde. ``DISTNAME`` hat als Vorgabe
``${PORTNAME}-${PORTVERSION}`` also ?berschreiben Sie diese Vorgabe nur,
wenn es notwendig ist. ``DISTNAME`` wird nur an zwei Stellen genutzt.
Erstens: (``DISTFILES``) hat als Vorgabe
``${DISTNAME}``\ ``${EXTRACT_SUFX}``. Zweitens: Die Distributionsdatei
soll in einem Unterverzeichnis namens ``WRKSRC`` extrahiert werden,
dessen Vorgabe ``work/${DISTNAME}`` ist.

Manche Drittanbieter-Namen, welche nicht in das Schema
``${PORTNAME}-${PORTVERSION}`` passen, k?nnen durch Setzen von
``DISTVERSION`` automatisch behandelt werden. ``PORTVERSION`` und
``DISTNAME`` werden automatisch abgeleitet, k?nnen aber nat?rlich
manuell ?berschrieben werden. Die folgende Tabelle f?hrt einige
Beispiele auf:

.. raw:: html

   <div class="informaltable">

+-------------------+-------------------+
| ``DISTVERSION``   | ``PORTVERSION``   |
+===================+===================+
| 0.7.1d            | 0.7.1.d           |
+-------------------+-------------------+
| 10Alpha3          | 10.a3             |
+-------------------+-------------------+
| 3Beta7-pre2       | 3.b7.p2           |
+-------------------+-------------------+
| 8:f\_17           | 8f.17             |
+-------------------+-------------------+

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

``PKGNAMEPREFIX`` und ``PKGNAMESUFFIX`` beeinflussen ``DISTNAME`` nicht.
Beachten Sie bitte auch, dass Sie ``DISTNAME`` unver?ndert lassen
sollten, falls ``WRKSRC`` denselben Wert hat wie
``work/${PORTNAME}-${PORTVERSION}`` und gleichzeitig dass Archiv des
originalen Quelltextes anders benannt ist als
``${PORTNAME}-${PORTVERSION}${EXTRACT_SUFX}``. Es ist einfacher
``DISTFILES`` zu definieren, als ``DISTNAME`` und ``WRKSRC`` (und
m?glicherweise ``EXTRACT_SUFX``) zu setzen.

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

5.4.2. ``MASTER_SITES``
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dokumentieren Sie das Verzeichnis der FTP/HTTP-URL, welche auf den
originalen Tarball zeigt, in der Variable ``MASTER_SITES``. Bitte
vergessen Sie niemals den Schr?gstrich (``/``) am Ende!

Die ``make``-Makros werden versuchen, diese Festlegung f?r die
Aufbereitung der Distributionsdateien mittels ``FETCH`` zu benutzen,
falls sie diese nicht schon auf dem System finden.

Es wird empfohlen, mehrere Webseiten in dieser Liste aufzuf?hren,
vorzugsweise auf verschiedenen Kontinenten. Dies ist ein Schutz gegen
Probleme bei gr??eren Ausf?llen im Internet. Wir planen sogar
Unterst?tzung einzubauen, die automatisch einen Server in der N?he zum
Herunterladen bestimmt. Die Verf?gbarkeit von vielen Webseiten wird
dieses Vorhaben betr?chtlich erleichtern.

Falls der originale Tarball Teil eines popul?ren Archivs ist, wie
SourceForge, GNU oder Perl CPAN, k?nnen Sie m?glicherweise auf diese
Seiten in einer einfachen und kompakten Form mittels ``MASTER_SITE_*``
(d.h., ``MASTER_SITE_SOURCEFORGE``,, ``MASTER_SITE_GNU`` und
``MASTER_SITE_PERL_CPAN``) referenzieren. Setzen Sie einfach
``MASTER_SITES`` auf eine dieser Variablen und ``MASTER_SITE_SUBDIR``
auf den Pfad innerhalb des Archivs. Hier ist ein Beispiel:

.. code:: programlisting

    MASTER_SITES=         ${MASTER_SITE_GNU}
    MASTER_SITE_SUBDIR=   make

Oder verwenden Sie ein kondensiertes Format:

.. code:: programlisting

    MASTER_SITES=   GNU/make

Diese Variablen werden in ``/usr/ports/Mk/bsd.sites.mk`` definiert. Es
werden st?ndig neue Eintr?ge hinzugef?gt, daher stellen Sie bitte
unbedingt sicher, dass Sie die neueste Version verwenden, bevor Sie
einen Port einschicken.

F?r beliebte Seiten existieren sogenannte *magic*-Makros, die eine
bestimmte Verzeichnisstruktur erstellen. Um eines dieser Makros zu
verwenden, geben Sie dessen Abk?rzung an und Ihr System wird versuchen,
das korrekte Unterverzeichnis automatisch zu bestimmen.

.. code:: programlisting

    MASTER_SITES=    SF

Ist das Ergebnis nicht korrekt, k?nnen Sie diesen Wert auch
?berschreiben.

.. code:: programlisting

    MASTER_SITES= SF/stardict/WyabdcRealPeopleTTS/${PORTVERSION}

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Tabelle 5.1. Beliebte magic ``MASTER_SITES``-Makros

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+----------------------+--------------------------------------------------------------------------------------+
| Makro                | Erwartetes Unterverzeichnis                                                          |
+======================+======================================================================================+
| ``APACHE_JAKARTA``   | ``/dist/jakarta/${PORTNAME:S,-,,/,}/source``                                         |
+----------------------+--------------------------------------------------------------------------------------+
| ``BERLIOS``          | ``/${PORTNAME:L}``                                                                   |
+----------------------+--------------------------------------------------------------------------------------+
| ``CHEESESHOP``       | ``/packages/source/source/${DISTNAME:C/(.).*/\1/}/${DISTNAME:C/(.*)-[0-9].*/\1/}``   |
+----------------------+--------------------------------------------------------------------------------------+
| ``DEBIAN``           | ``/debian/pool/main/${PORTNAME:C/^((lib)?.).*$/\1/}/${PORTNAME}``                    |
+----------------------+--------------------------------------------------------------------------------------+
| ``GCC``              | ``/pub/gcc/releases/${DISTNAME}``                                                    |
+----------------------+--------------------------------------------------------------------------------------+
| ``GNOME``            | ``/pub/GNOME/sources/${PORTNAME}/${PORTVERSION:C/^([0-9]+\.[0-9]+).*/\1/}``          |
+----------------------+--------------------------------------------------------------------------------------+
| ``GNU``              | ``/gnu/${PORTNAME}``                                                                 |
+----------------------+--------------------------------------------------------------------------------------+
| ``MOZDEV``           | ``/pub/mozdev/${PORTNAME:L}``                                                        |
+----------------------+--------------------------------------------------------------------------------------+
| ``PERL_CPAN``        | ``/pub/CPAN/modules/by-module/${PORTNAME:C/-.*//}``                                  |
+----------------------+--------------------------------------------------------------------------------------+
| ``PYTHON``           | ``/ftp/python/${PYTHON_PORTVERSION:C/rc[0-9]//}``                                    |
+----------------------+--------------------------------------------------------------------------------------+
| ``RUBYFORGE``        | ``/${PORTNAME:L}``                                                                   |
+----------------------+--------------------------------------------------------------------------------------+
| ``SAVANNAH``         | ``/${PORTNAME:L}``                                                                   |
+----------------------+--------------------------------------------------------------------------------------+
| ``SF``               | ``/project/${PORTNAME:L}/${PORTNAME:L}/${PORTVERSION}``                              |
+----------------------+--------------------------------------------------------------------------------------+

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

5.4.3. ``EXTRACT_SUFX``
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Falls Sie eine Distributionsdatei haben, die ein eigent?mliches Suffix
nutzt, um die Art der Kompression anzuzeigen, dann setzen Sie
``EXTRACT_SUFX``.

Ist die Distributionsdatei zum Beispiel im Stil von ``foo.tgz`` anstatt
des normalen ``foo.tar.gz`` benannt, w?rden Sie schreiben:

.. code:: programlisting

    DISTNAME=      foo
    EXTRACT_SUFX=  .tgz

Falls erforderlich, setzen die Variablen ``USE_BZIP2`` und ``USE_ZIP``
automatisch ``EXTRACT_SUFX`` auf ``.tar.bz2`` oder ``.zip``. Falls keine
der beiden gesetzt ist, dann verwendet ``EXTRACT_SUFX`` die Vorgabe
``.tar.gz``.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Sie m?ssen niemals beide Variablen ``EXTRACT_SUFX`` und ``DISTFILES``
setzen.

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

5.4.4. ``DISTFILES``
~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Manchmal haben die zu ladenden Dateien keinerlei ?hnlichkeit mit dem
Namen des Ports. Es k?nnte z.B. ``source.tar.gz`` oder ?hnlich hei?en.
In anderen F?llen k?nnte der Quelltext in mehreren Archiven sein und
alle m?ssen heruntergeladen werden.

Falls dies der Fall ist, setzen Sie ``DISTFILES`` als eine durch
Leerzeichen getrennte Liste aller Dateien, die geladen werden m?ssen.

.. code:: programlisting

    DISTFILES=     source1.tar.gz source2.tar.gz

Wenn nicht ausdr?cklich gesetzt, verwendet ``DISTFILES`` als Vorgabe
``${DISTNAME}${EXTRACT_SUFX}``.

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

5.4.5. ``EXTRACT_ONLY``
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Falls nur einige der ``DISTFILES`` extrahiert werden m?ssen (z.B. eine
Datei ist der Quelltext und eine andere ist ein unkomprimiertes
Dokument), dann listen Sie die zu extrahierenden Dateien in
``EXTRACT_ONLY`` auf.

.. code:: programlisting

    DISTFILES=     source.tar.gz manual.html
    EXTRACT_ONLY=  source.tar.gz

Falls *keine* der ``DISTFILES`` unkomprimiert sein sollte, dann setzen
Sie ``EXTRACT_ONLY`` auf einen leeren String.

.. code:: programlisting

    EXTRACT_ONLY=

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

5.4.6. ``PATCHFILES``
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Falls Ihr Port zus?tzliche Patches ben?tigt, welche per FTP oder HTTP
verf?gbar sind, dann setzen Sie ``PATCHFILES`` auf den Namen der Dateien
und ``PATCH_SITES`` auf die URL des Verzeichnisses, das diese Patches
enth?lt (das Format ist das gleiche wie ``MASTER_SITES``).

Falls ein Patch wegen einiger zus?tzlicher Pfadnamen nicht relativ zum
Anfang des Quelltextbaumes (d.h., ``WRKSRC``) liegt, dann setzen Sie
bitte ``PATCH_DIST_STRIP`` entsprechend. Wenn z.B. alle Pfadnamen in
diesem Patch ein zus?tzliches ``foozolix-1.0/`` vor ihren Dateinamen
aufweisen, dann setzen Sie bitte ``PATCH_DIST_STRIP=-p1``.

K?mmern Sie sich nicht darum, ob die Patches komprimiert sind. Sie
werden automatisch dekomprimiert, wenn die Dateinamen auf ``.gz`` oder
``.Z`` enden.

Falls der Patch zusammen mit anderen Dateien in einem gezippten Tarball
verteilt wird (z.B. mit Dokumentation), dann k?nnen Sie nicht
``PATCHFILES`` verwenden. In diesem Fall f?gen Sie den Namen und den Ort
dieses Tarballs zu ``DISTFILES`` und ``MASTER_SITES``. Benutzen Sie dann
die ``EXTRA_PATCHES``-Variable, um auf diese Dateien zu zeigen und
``bsd.port.mk`` wird automatisch diese Dateien nutzen. Kopieren Sie
*niemals* Patch-Dateien in das ``PATCHDIR``-Verzeichnis, weil es
m?glicherweise nicht beschreibbar ist.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Der Tarball wird zusammen mit dem anderen Quelltext extrahiert werden.
Eine ausdr?ckliche Dekomprimierung eines mit gzip oder compress
erzeugten Tarball ist nicht notwendig. Sollten Sie dies dennoch
vorgeben, so beachten Sie bitte peinlich genau, dass Sie nichts
?berschreiben, was bereits im Verzeichnis vorhanden ist. Vergessen Sie
auch nicht den kopierten Patch im Target von ``pre-clean`` zu entfernen.

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

5.4.7. Verschiedene Distributionsdateien oder Patches von verschiedenen Seiten und Verzeichnissen (``MASTER_SITES:n``)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

(Betrachten Sie es als in irgendeiner Form „fortgeschrittenes Thema“.
Neulinge sollten m?glicherweise diesen Abschnitt beim ersten Lesen
?berspringen).

Dieser Abschnitt stellt Informationen ?ber die Mechanismen zum
Herunterladen von Dateien zur Verf?gung und behandelt die Variablen
``MASTER_SITES:n`` und ``MASTER_SITES_NN``. Wir beziehen uns im weiteren
Text auf diese Variablen als ``MASTER_SITES:n``.

Etwas Hintergrundinformation zu Beginn: OpenBSD verf?gt ?ber eine sehr
elegante Option innerhalb der Variablen ``DISTFILES`` und
``PATCHFILES``. Sowohl Dateien als auch Patches k?nnen mit angeh?ngten
``:n``-Bezeichnern versehen werden wobei ``n`` in beiden F?llen
``[0-9]`` sein kann und eine Gruppenzugeh?rigkeit anzeigt. Ein Beispiel
hierf?r ist:

.. code:: programlisting

    DISTFILES=      alpha:0 beta:1

In OpenBSD wird die Datei ``alpha`` mit der Variable ``MASTER_SITES0``
verkn?pft anstatt dem in FreeBSD gebr?uchlichen ``MASTER_SITES`` und
``beta`` mit ``MASTER_SITES1``.

Das ist eine sehr interessante M?glichkeit, die endlose Suche nach der
richtigen Download-Seite zu verk?rzen.

Stellen Sie sich zwei Dateien in ``DISTFILES`` und 20 Webseiten in der
Variable ``MASTER_SITES`` vor. Alle Seiten sind erschreckend langsam,
``beta`` findet sich auf allen Seiten in ``MASTER_SITES`` und ``alpha``
kann nur auf der zwanzigsten Seite gefunden werden. W?re es nicht reine
Verschwendung, wenn der Maintainer alle Seiten zuvor ?berpr?fen m?sste?
Kein guter Start f?r das wundervolle Wochenende!

?bertragen Sie diesen Umstand auf noch mehr ``DISTFILES`` und mehr
``MASTER_SITES``. Ganz sicher w?rde unser „distfiles survey master“ die
Erleichterung sehr zu sch?tzen wissen, die eine solche Verringerung der
Netzwerkbelastung bringen w?rde.

In den n?chsten Abschnitten sehen Sie die Implementierung dieser Idee
durch FreeBSD. Dabei wurde das Konzept von OpenBSD ein wenig verbessert.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.4.7.1. Prinzipielle Information
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dieser Abschnitt informiert Sie, wie Sie schnell ein fein granuliertes
Herunterladen von vielen Dateien und Fehlerbereinigungen von
verschiedenen Webseiten und Unterverzeichnissen bewerkstelligen. Wir
beschreiben hier den Fall der vereinfachten Nutzung von
``MASTER_SITES:n``. Das ist f?r die meisten Szenarien ausreichend. Falls
Sie weitere Informationen ben?tigen, sollten Sie den n?chsten Abschnitt
lesen.

Einige Programme bestehen aus mehreren Dateien, welche von verschiedenen
Webseiten heruntergeladen werden m?ssen. Zum Beispiel besteht
Ghostscript aus dem Kern des Programms und einer gro?en Zahl von
Treiberdateien, die vom Drucker des Benutzers abh?ngen. Einige dieser
Treiberdateien werden mit der Kernapplikation mitgeliefert aber viele
m?ssen von verschiedenen Webseiten heruntergeladen werden.

Um das zu unterst?tzen, muss jeder Eintrag in ``DISTFILES`` mit einem
Komma und einem „tag name“ abgeschlossen werden. Jeder in
``MASTER_SITES`` aufgef?hrte Webseite folgt ein Komma und eine Marke
(tag), die anzeigt, welche Datei von dieser Webseite heruntergeladen
werden kann.

Stellen Sie sich bitte eine Applikation vor, deren Quelltext in zwei
Teile aufgeteilt ist, ``source1.tar.gz`` und ``source2.tar.gz``, welche
von zwei verschiedenen Webseiten heruntergeladen werden m?ssen. Das
``Makefile`` des Port w?rde Zeilen enthalten wie in `Beispiel?5.1,
„Vereinfachtes Beispiel f?r den Gebrauch von ``MASTER_SITES:n`` mit
einer Datei pro
Webseite“ <makefile-distfiles.html#ports-master-sites-n-example-simple-use-one-file-per-site>`__.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel 5.1. Vereinfachtes Beispiel f?r den Gebrauch von
``MASTER_SITES:n`` mit einer Datei pro Webseite

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    MASTER_SITES=   ftp://ftp.example1.com/:source1 \
        ftp://ftp.example2.com/:source2
    DISTFILES=      source1.tar.gz:source1 \
        source2.tar.gz:source2

.. raw:: html

   </div>

.. raw:: html

   </div>

Verschiedene Dateien k?nnen die gleiche Marke aufweisen. Ausgehend vom
vorherigen Beispiel nehmen wir an, dass es noch eine dritte Datei gibt
(``source3.tar.gz``), welche von ``ftp.example2.com`` heruntergeladen
werden soll. Das ``Makefile`` w?rde dann aussehen wie `Beispiel?5.2,
„Vereinfachtes Beispiel f?r den Gebrauch von ``MASTER_SITES:n`` mit mehr
als einer Datei pro
Webseite“ <makefile-distfiles.html#ports-master-sites-n-example-simple-use-more-than-one-file-per-site>`__.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel 5.2. Vereinfachtes Beispiel f?r den Gebrauch von
``MASTER_SITES:n`` mit mehr als einer Datei pro Webseite

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    MASTER_SITES=   ftp://ftp.example1.com/:source1 \
        ftp://ftp.example2.com/:source2
    DISTFILES=      source1.tar.gz:source1 \
        source2.tar.gz:source2 \
        source3.tar.gz:source2

.. raw:: html

   </div>

.. raw:: html

   </div>

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

5.4.7.2. Ausf?hrliche Information
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In Ordnung, das vorherige Beispiel reicht nicht f?r Ihre Bed?rfnisse? In
diesem Abschnitt werden wir im Detail erkl?ren, wie der fein granulierte
Mechanismus zum Herunterladen (``MASTER_SITES:n``) funktioniert und wie
Sie Ihre Ports modifizieren, um ihn zu nutzen.

.. raw:: html

   <div class="orderedlist">

#. Elemente k?nnen nachstehend bezeichnet werden mit ``:n`` wobei
   *``n``* in diesem Falle ``[^:,]+`` ist. Das hei?t *``n``* k?nnte
   theoretisch jede alphanumerische Zeichenkette sein, aber wir
   beschr?nken sie auf ``[a-zA-Z_][0-9a-zA-Z_]+`` f?r diesen Moment.

   Zudem ist die Zeichenkette case sensitive; d.h. ``n`` unterscheidet
   sich von ``N``.

   Allerdings d?rfen die folgenden W?rter nicht gebraucht werden, da sie
   spezielle Bedeutungen haben: ``default``, ``all`` und ``ALL`` (diese
   W?rter werden intern genutzt in Punkt
   `ii <makefile-distfiles.html#porting-master-sites-n-what-changes-in-port-targets>`__).
   Ausserdem ist ``DEFAULT`` ein reserviertes Wort (beachten Sie
   `3 <makefile-distfiles.html#porting-master-sites-n-DEFAULT-group>`__).

#. Elemente mit angeh?ngtem ``:n`` geh?ren zur Gruppe ``n``, ``:m``
   geh?rt zur Gruppe ``m`` und so weiter.

#. Elemente ohne Anh?ngsel sind gruppenlos, d.h. sie geh?ren alle zu der
   speziellen Gruppe ``DEFAULT``. Falls sie an irgendeinem Element
   ``DEFAULT`` h?ngen, ist dies ?berfl?ssig, es sei denn Sie wollen,
   dass ein Element sowohl zu ``DEFAULT`` als auch anderen Gruppen
   gleichzeitig geh?rt (beachten Sie
   `5 <makefile-distfiles.html#porting-master-sites-n-comma-operator>`__).

   Die folgenden Beispiele sind gleichwertig, aber das erste Beispiel
   ist vorzuziehen:

   .. code:: programlisting

       MASTER_SITES=   alpha

       MASTER_SITES=   alpha:DEFAULT

#. Gruppen sind nicht ausschliessend, d.h. ein Element kann mehreren
   Gruppen gleichzeitig angeh?ren und eine Gruppe wiederum kann entweder
   mehrere Elemente oder ?berhaupt keine aufweisen. Wiederholte Elemente
   sind schlicht nur wiederholte Elemente.

#. Wenn Sie wollen, dass ein Element gleichzeitig zu mehreren Gruppen
   geh?rt, dann k?nnen Sie diese durch ein Komma (``,``) trennen.

   Anstatt jedes Mal ein anderes Anh?ngsel zu verwenden und
   Wiederholungen aufzuf?hren, k?nnen Sie mehrere Gruppen auf einmal in
   einem einzigen Anh?ngsel bestimmen. Zum Beispiel markiert ``:m,n,o``
   ein Element, welches zu den Gruppen ``m``, ``n`` und ``o`` geh?rt.

   Alle folgenden Beispiele sind gleichwertig, aber das erste Beispiel
   ist vorzuziehen:

   .. code:: programlisting

       MASTER_SITES=   alpha alpha:SOME_SITE

       MASTER_SITES=   alpha:DEFAULT alpha:SOME_SITE

       MASTER_SITES=   alpha:SOME_SITE,DEFAULT

       MASTER_SITES=   alpha:DEFAULT,SOME_SITE

#. Alle Webseiten in einer Gruppe werden gem?? ``MASTER_SORT_AWK``
   sortiert. Alle Gruppen innerhalb von ``MASTER_SITES`` und
   ``PATCH_SITES`` werden genauso sortiert.

#. Gruppensemantik kann benutzt werden in den folgenden Variablen:
   ``MASTER_SITES``, ``PATCH_SITES``, ``MASTER_SITE_SUBDIR``,
   ``PATCH_SITE_SUBDIR``, ``DISTFILES`` und ``PATCHFILES`` entsprechend
   der folgenden Syntax:

   .. raw:: html

      <div class="orderedlist">

   #. Elemente mit ``MASTER_SITES``, ``PATCH_SITES``,
      ``MASTER_SITE_SUBDIR`` und ``PATCH_SITE_SUBDIR`` m?ssen mit einem
      Schr?gstrich beendet werden ( ``/``). Falls Elemente zu
      irgendwelchen Gruppen geh?ren, muss ``:n`` direkt nach dem Trenner
      ``/`` stehen. Der ``MASTER_SITES:n``-Mechanismus verl?sst sich auf
      das Vorhandensein des Trennzeichens ``/``, um verwirrende Elemente
      zu vermeiden in denen ``:n`` ein zul?ssiger Bestandteil des
      Elementes ist und das Auftreten von ``:n`` die Gruppe ``n``
      anzeigt. Aus Kompatibilit?tsgr?nden (da der ``/``-Trenner sowohl
      in ``MASTER_SITE_SUBDIR`` als auch ``PATCH_SITE_SUBDIR``-Elementen
      nicht erforderlich ist) wird, falls das auf das Anh?ngsel folgende
      n?chste Zeichen kein ``/`` ist, auch ``:n`` als g?ltiger Teil des
      Elementes behandelt anstatt als Gruppenzusatz, selbst wenn ein
      Element ein angeh?ngtes ``:n`` aufweist. Beachten Sie sowohl
      `Beispiel?5.3, „Ausf?hrliches Beispiel von ``MASTER_SITES:n`` in
      ``MASTER_SITE_SUBDIR``\ “ <makefile-distfiles.html#ports-master-sites-n-example-detailed-use-master-site-subdir>`__
      als auch `Beispiel?5.4, „Ausf?hrliches Beispiel von
      ``MASTER_SITES:n`` mit Komma-Operator, mehreren Dateien, mehreren
      Webseiten und mehreren
      Unterverzeichnissen“ <makefile-distfiles.html#ports-master-sites-n-example-detailed-use-complete-example-master-sites>`__.

      .. raw:: html

         <div class="example">

      .. raw:: html

         <div class="example-title">

      Beispiel 5.3. Ausf?hrliches Beispiel von ``MASTER_SITES:n`` in
      ``MASTER_SITE_SUBDIR``

      .. raw:: html

         </div>

      .. raw:: html

         <div class="example-contents">

      .. code:: programlisting

          MASTER_SITE_SUBDIR=     old:n new/:NEW

      .. raw:: html

         <div class="itemizedlist">

      -  Verzeichnisse innerhalb der Gruppe ``DEFAULT`` -> old:n

      -  Verzeichnisse innerhalb der Gruppe ``NEW`` -> new

      .. raw:: html

         </div>

      .. raw:: html

         </div>

      .. raw:: html

         </div>

      | 

      .. raw:: html

         <div class="example">

      .. raw:: html

         <div class="example-title">

      Beispiel 5.4. Ausf?hrliches Beispiel von ``MASTER_SITES:n`` mit
      Komma-Operator, mehreren Dateien, mehreren Webseiten und mehreren
      Unterverzeichnissen

      .. raw:: html

         </div>

      .. raw:: html

         <div class="example-contents">

      .. code:: programlisting

          MASTER_SITES=   http://site1/%SUBDIR%/ http://site2/:DEFAULT \
              http://site3/:group3 http://site4/:group4 \
              http://site5/:group5 http://site6/:group6 \
              http://site7/:DEFAULT,group6 \
              http://site8/%SUBDIR%/:group6,group7 \
              http://site9/:group8
          DISTFILES=      file1 file2:DEFAULT file3:group3 \
              file4:group4,group5,group6 file5:grouping \
              file6:group7
          MASTER_SITE_SUBDIR=     directory-trial:1 directory-n/:groupn \
                  directory-one/:group6,DEFAULT \
                  directory

      Das vorstehende Beispiel f?hrt zu einem fein granulierten
      Herunterladen. Die Webseiten werden in der exakten Reihenfolge
      ihrer Nutzung aufgelistet.

      .. raw:: html

         <div class="itemizedlist">

      -  ``file1`` wird heruntergeladen von

         .. raw:: html

            <div class="itemizedlist">

         -  ``MASTER_SITE_OVERRIDE``

         -  http://site1/directory-trial:1/

         -  http://site1/directory-one/

         -  http://site1/directory/

         -  http://site2/

         -  http://site7/

         -  ``MASTER_SITE_BACKUP``

         .. raw:: html

            </div>

      -  ``file2`` wird genauso heruntergeladen wie ``file1``, da sie
         zur gleichen Gruppe geh?ren

         .. raw:: html

            <div class="itemizedlist">

         -  ``MASTER_SITE_OVERRIDE``

         -  http://site1/directory-trial:1/

         -  http://site1/directory-one/

         -  http://site1/directory/

         -  http://site2/

         -  http://site7/

         -  ``MASTER_SITE_BACKUP``

         .. raw:: html

            </div>

      -  ``file3`` wird heruntergeladen von

         .. raw:: html

            <div class="itemizedlist">

         -  ``MASTER_SITE_OVERRIDE``

         -  http://site3/

         -  ``MASTER_SITE_BACKUP``

         .. raw:: html

            </div>

      -  ``file4`` wird heruntergeladen von

         .. raw:: html

            <div class="itemizedlist">

         -  ``MASTER_SITE_OVERRIDE``

         -  http://site4/

         -  http://site5/

         -  http://site6/

         -  http://site7/

         -  http://site8/directory-one/

         -  ``MASTER_SITE_BACKUP``

         .. raw:: html

            </div>

      -  ``file5`` wird heruntergeladen von

         .. raw:: html

            <div class="itemizedlist">

         -  ``MASTER_SITE_OVERRIDE``

         -  ``MASTER_SITE_BACKUP``

         .. raw:: html

            </div>

      -  ``file6`` wird heruntergeladen von

         .. raw:: html

            <div class="itemizedlist">

         -  ``MASTER_SITE_OVERRIDE``

         -  http://site8/

         -  ``MASTER_SITE_BACKUP``

         .. raw:: html

            </div>

      .. raw:: html

         </div>

      .. raw:: html

         </div>

      .. raw:: html

         </div>

      | 

   .. raw:: html

      </div>

#. Wie gruppiere ich eine der speziellen Variablen aus ``bsd.sites.mk``,
   d.h. ``MASTER_SITE_SOURCEFORGE``?

   Lesen Sie `Beispiel?5.5, „Ausf?hrliches Beispiel von
   ``MASTER_SITES:n`` mit
   ``MASTER_SITE_SOURCEFORGE``\ “ <makefile-distfiles.html#ports-master-sites-n-example-detailed-use-master-site-sourceforge>`__.

   .. raw:: html

      <div class="example">

   .. raw:: html

      <div class="example-title">

   Beispiel 5.5. Ausf?hrliches Beispiel von ``MASTER_SITES:n`` mit
   ``MASTER_SITE_SOURCEFORGE``

   .. raw:: html

      </div>

   .. raw:: html

      <div class="example-contents">

   .. code:: programlisting

       MASTER_SITES=   http://site1/ ${MASTER_SITE_SOURCEFORGE:S/$/:sourceforge,TEST/}
       DISTFILES=      something.tar.gz:sourceforge

   .. raw:: html

      </div>

   .. raw:: html

      </div>

   | 

   ``something.tar.gz`` wird von allen Webseiten innerhalb von
   ``MASTER_SITE_SOURCEFORGE`` heruntergeladen.

#. Wie nutze ich dies mit ``PATCH*``-Variablen.

   In allen Beispielen wurden ``MASTER*``-Variablen genutzt, aber sie
   funktionieren exakt genauso mit ``PATCH*``-Variablen, wie Sie an
   `Beispiel?5.6, „Vereinfachte Nutzung von ``MASTER_SITES:n`` mit
   ``PATCH_SITES``.“ <makefile-distfiles.html#ports-master-sites-n-example-detailed-use-patch-sites>`__.
   sehen k?nnen.

   .. raw:: html

      <div class="example">

   .. raw:: html

      <div class="example-title">

   Beispiel 5.6. Vereinfachte Nutzung von ``MASTER_SITES:n`` mit
   ``PATCH_SITES``.

   .. raw:: html

      </div>

   .. raw:: html

      <div class="example-contents">

   .. code:: programlisting

       PATCH_SITES=    http://site1/ http://site2/:test
       PATCHFILES=     patch1:test

   .. raw:: html

      </div>

   .. raw:: html

      </div>

   | 

.. raw:: html

   </div>

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

5.4.7.3. Was ?ndert sich f?r die Ports? Was ?ndert sich nicht?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="orderedlist">

#. Alle bestehenden Ports bleiben gleich. Der Code f?r
   ``MASTER_SITES:n`` wird nur aktiviert, falls es Elemente mit
   angeh?ngtem ``:n`` entsprechend den zuvor erw?hnten Syntax-Regeln wie
   in
   `7 <makefile-distfiles.html#porting-master-sites-n-group-semantics>`__
   gezeigt gibt.

#. Das Target des Port bleibt gleich: ``checksum``, ``makesum``,
   ``patch``, ``configure``, ``build`` etc. Mit der offensichtlichen
   Ausnahme von ``do-fetch``, ``fetch-list``, ``master-sites`` und
   ``patch-sites``.

   .. raw:: html

      <div class="itemizedlist">

   -  ``do-fetch``: nutzt die neue Gruppierung ``DISTFILES`` und
      ``PATCHFILES`` mit ihren darauf zutreffenden Gruppenelementen in
      ``MASTER_SITES`` und ``PATCH_SITES`` welche zutreffende
      Gruppenelemente sowohl in ``MASTER_SITE_SUBDIR`` als auch
      ``PATCH_SITE_SUBDIR`` aufweisen. Sehen Sie hierzu `Beispiel?5.4,
      „Ausf?hrliches Beispiel von ``MASTER_SITES:n`` mit Komma-Operator,
      mehreren Dateien, mehreren Webseiten und mehreren
      Unterverzeichnissen“ <makefile-distfiles.html#ports-master-sites-n-example-detailed-use-complete-example-master-sites>`__.

   -  ``fetch-list``: arbeitet wie das alte ``fetch-list`` mit der
      Ausnahme, dass es nur wie ``do-fetch`` gruppiert.

   -  ``master-sites`` und ``patch-sites``: (inkompatibel zu ?lteren
      Versionen) geben nur die Elemente der Gruppe ``DEFAULT`` zur?ck.
      Beziehungsweise sie f?hren genau genommen die Targets von
      ``master-sites-default`` und ``patch-sites-default`` aus.

      Weiterhin ist der Gebrauch des Target entweder von
      ``master-sites-all`` oder ``patch-sites-all`` der direkten
      ?berpr?fung von ``MASTER_SITES`` oder ``PATCH_SITES`` vorzuziehen.
      Zudem ist nicht garantiert, dass das direkte ?berpr?fen in
      zuk?nftigen Versionen funktionieren wird. Sehen Sie
      `B <makefile-distfiles.html#porting-master-sites-n-new-port-targets-master-sites-all>`__
      f?r weitere Informationen zu diesen neuen Port-Targets.

   .. raw:: html

      </div>

#. Neue Port-Targets

   .. raw:: html

      <div class="orderedlist">

   #. Es gibt ``master-sites-n`` und ``patch-sites-n``-Targets, welche
      die Elemente der jeweiligen Gruppe *``n``* innerhalb von
      ``MASTER_SITES`` und ``PATCH_SITES`` auflisten. Beispielweise
      werden sowohl ``master-sites-DEFAULT`` als auch
      ``patch-sites-DEFAULT`` die Elemente der Gruppe ``DEFAULT``,
      ``master-sites-test`` und ``patch-sites-test`` der Gruppe ``test``
      usw. zur?ckgeben.

   #. Es gibt das neue Target ``master-sites-all`` und
      ``patch-sites-all``, welche die Arbeit der alten Targets
      ``master-sites`` und ``patch-sites`` ?bernehmen. Sie geben die
      Elemente aller Gruppen zur?ck,als w?rden sie zur gleichen Gruppe
      geh?ren - mit dem Vorbehalt, dass sie so viele
      ``MASTER_SITE_BACKUP`` und ``MASTER_SITE_OVERRIDE`` auflisten wie
      Gruppen mittels ``DISTFILES`` oder ``PATCHFILES`` definiert sind.
      Das gleiche gilt entsprechend f?r ``master-sites-all`` und
      ``patch-sites-all``.

   .. raw:: html

      </div>

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

5.4.8. ``DIST_SUBDIR``
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Verhindern Sie, dass Ihr Port das Verzeichnis ``/usr/ports/distfiles``
in Unordnung bringt. Falls Ihr Port eine ganze Reihe von Dateien
herunterladen muss oder eine Datei enth?lt, die einen Namen hat, der
m?glicherweise mit anderen Ports in Konflikt stehen k?nnte
(d.h.``Makefile``), dann setzen Sie die Variable ``DIST_SUBDIR`` auf den
Namen des Ports (``${PORTNAME}`` oder ``${PKGNAMEPREFIX}${PORTNAME}``
sollte hervorragend funktionieren). Dies wird ``DISTDIR`` von der
Vorgabe ``/usr/ports/distfiles`` auf
``/usr/ports/distfiles/DIST_SUBDIR       `` ?ndern und stellt
tats?chlich alle f?r Ihren Port ben?tigten Dateien in dieses
Unterverzeichnis.

Es wird zus?tzlich nach dem Unterverzeichnis mit dem gleichen Namen auf
der Sicherung der Hauptseite auf ``ftp.FreeBSD.org`` suchen (das
ausdr?ckliche Setzen von ``DISTDIR`` in Ihrem ``Makefile`` wird dies
nicht gew?hrleisten, also nutzen Sie bitte ``DIST_SUBDIR``).

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Dies hat keine Auswirkungen auf die Variable ``MASTER_SITES``, die Sie
in Ihrem ``Makefile`` definieren.

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

5.4.9. ``ALWAYS_KEEP_DISTFILES``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Falls Ihr Port bin?re Distfiles benutzt und eine Lizenz aufweist, die
verlangt, dass das der Quelltext in Form bin?rer Pakete verteilt werden
muss, z.B. GPL, dann wird ``ALWAYS_KEEP_DISTFILES`` den FreeBSD Build
Cluster anweisen eine Kopie der Dateien in ``DISTFILES`` vorzuhalten.
Nutzer dieser Ports ben?tigen generell diese Dateien nicht, daher ist es
ein gutes Konzept, nur dann die Distfiles zu ``DISTFILES`` hinzuzuf?gen,
wenn ``PACKAGE_BUILDING`` definiert ist.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel 5.7. Nutzung von ``ALWAYS_KEEP_DISTFILES``.

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    .if defined(PACKAGE_BUILDING)
    DISTFILES+=             foo.tar.gz
    ALWAYS_KEEP_DISTFILES=  yes
    .endif

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn Sie zus?tzliche Dateien zu ``DISTFILES`` hinzuf?gen, dann beachten
Sie bitte, dass Sie diese auch in ``distinfo`` auff?hren. Zudem werden
die zus?tzlichen Dateien normalerweise ebenso in ``WRKDIR`` extrahiert,
was f?r einige Ports zu unbeabsichtigten Seiteneffekten f?hren mag und
spezielle Behandlung erfordert.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------+---------------------------------+--------------------------------------------+
| `Zur?ck <makefile-categories.html>`__?   | `Nach oben <makefile.html>`__   | ?\ `Weiter <makefile-maintainer.html>`__   |
+------------------------------------------+---------------------------------+--------------------------------------------+
| 5.3. Kategorisierung?                    | `Zum Anfang <index.html>`__     | ?5.5. ``MAINTAINER``                       |
+------------------------------------------+---------------------------------+--------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
