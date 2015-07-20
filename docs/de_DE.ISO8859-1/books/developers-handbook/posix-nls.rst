=======================================================================
4.2. Lokalisierte Nachrichten mit POSIX.1 Native Language Support (NLS)
=======================================================================

.. raw:: html

   <div class="navheader">

4.2. Lokalisierte Nachrichten mit POSIX.1 Native Language Support (NLS)
`Zur?ck <l10n.html>`__?
Kapitel 4. Lokalisierung und Internationalisierung - L10N und I18N
?\ `Weiter <policies.html>`__

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

4.2. Lokalisierte Nachrichten mit POSIX.1 Native Language Support (NLS)
-----------------------------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Beigetragen von G?bor K?vesd?n.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

?ber die Basisfunktionen von I18N hinaus, wie das Bereitstellen von
verschiedenen Eingabecodierungen oder die diversen nationalen
Konventionen, zum Beispiel die verschiedenen Dezimalpunkte, ist es auf
einem h?heren Level von I18N m?glich, die Ausgabe von Programmen zu
lokalisieren. Ein Weg dies zu tun besteht in der Nutzung der POSIX.1
NLS-Funktionen von FreeBSD.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.2.1. Organisation von lokalisierten Mitteilungen in Katalog Dateien
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

POSIX.1 NLS basiert auf Katalogdateien, welche die lokalisierten
Mitteilungen in der entsprechenden Codierung enthalten. Die Mitteilungen
sind in Sets organisiert und jede Mitteilung ist durch eine eindeutige
Zahl in dem jeweiligen Set identifiziert. Die Katalogdateien werden nach
der Lokale, von den jeweiligen lokalisierten Mitteilungen, die sie
enthalten, gefolgt von der ``.msg`` Endung benannt. Zum Beispiel werden
die ungarischen Mitteilungen f?r das ISO8859-2 Encoding in einer Datei
mit dem Dateinamen ``hu_HU.ISO8859-2`` gespeichert.

Diese Katalogdateien sind normale Textdateien, welche die nummerierten
Mitteilungen enthalten. Es ist m?glich Kommentare in die Dateien zu
schreiben, indem Sie ein ``$``-Zeichen an den Anfang der Zeile setzen.
Das Setzen von Grenzen wird ebenfalls durch spezielle Kommentare m?glich
wobei das Schl?sselwort ``set`` direkt nach dem ``$``-Zeichen folgen
muss. Dem Schl?sselwort ``set`` folgt dann die Set-Nummer. Ein Beispiel:

.. code:: programlisting

    $set 1

Der aktuelle Mitteilungseintrag startet mit der Mitteilungsnummer
gefolgt von der lokalisierten Nachricht. Die bekannten Modifikatoren von
`printf(3) <http://www.FreeBSD.org/cgi/man.cgi?query=printf&sektion=3>`__
werden akzeptiert:

.. code:: programlisting

    15 "File not found: %s\n"

Die Katalogdateien m?ssen in bin?rer Form vorliegen, bevor sie von einem
Programm benutzt werden k?nnen. Dies wird mit dem
`gencat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=gencat&sektion=1>`__
Tool durchgef?hrt. Das erste Argument ist der Dateiname des kompilierten
Katalogs und die weiteren Argumente sind die Eingabekataloge. Die
lokalisierten Mitteilungen k?nnen auf mehrere Katalogdateien aufgeteilt
sein. Danach werden dann alle auf einmal mit dem
`gencat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=gencat&sektion=1>`__
Tool kompiliert.

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

4.2.2. Nutzung der Katalogdateien im Quellcode
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das Benutzen der Katalogdateien ist einfach. Um die relevante Funktion
zu nutzen, muss ``nl_types.h`` in die Quelldatei eingef?gt werden. Bevor
ein Katalog benutzt werden kann, muss er mit
`catopen(3) <http://www.FreeBSD.org/cgi/man.cgi?query=catopen&sektion=3>`__
ge?ffnet werden. Die Funktion hat 2 Argumente. Der erste Parameter ist
der Name des installierten und kompilierten Katalogs. Normalerweise wird
der Name des Programmes, zum Beispiel grep, genutzt. Dieser Name wird
zum Suchen der kompilierten Katalogdatei benutzt. Der Aufruf von
`catopen(3) <http://www.FreeBSD.org/cgi/man.cgi?query=catopen&sektion=3>`__
sucht nach dieser Datei in ``/usr/share/nls/locale/catname`` und in
``/usr/local/share/nls/locale/catname``, wobei ``locale`` die gesetzte
Lokale und ``catname`` der Katalogname ist. Der zweite Parameter ist
eine Konstante, die zwei Werte haben kann:

.. raw:: html

   <div class="itemizedlist">

-  ``NL_CAT_LOCALE``, hat die Bedeutung, dass die benutzte Katalogdatei
   auf ``LC_MESSAGES`` basiert.

-  ``0``, hat die Bedeutung, dass ``LANG`` benutzt wird, um die
   Katalogdatei zu ?ffnen.

.. raw:: html

   </div>

Der
`catopen(3) <http://www.FreeBSD.org/cgi/man.cgi?query=catopen&sektion=3>`__
Aufruf gibt einen Katalogidentifizierer vom Type ``nl_catd`` zur?ck.
Sehen Sie in der Manualpage nach, um eine Liste mit m?glichen
Fehlercodes zu erhalten.

Nach dem ?ffnen eines Katalogs, kann
`catgets(3) <http://www.FreeBSD.org/cgi/man.cgi?query=catgets&sektion=3>`__
benutzt werden, um Mitteilungen zu erhalten. Der erste Parameter ist der
Katalogidentifizierer, der von
`catopen(3) <http://www.FreeBSD.org/cgi/man.cgi?query=catopen&sektion=3>`__
zur?ck gegeben wurde, das zweite ist die Nummer des Sets, das dritte die
Nummer der Mitteilung und das vierte ist eine Fallbackmitteilung, die
angezeigt wird, falls die gew?nschte Mitteilung in der Katalogdatei
nicht verf?gbar ist.

Nach der Nutzung der Katalogdatei, muss sie mit dem Kommando
`catclose(3) <http://www.FreeBSD.org/cgi/man.cgi?query=catclose&sektion=3>`__,
geschlossen werden. Es besitzt ein Argument, die Katalog ID.

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

4.2.3. Ein Beispiel aus der Praxis
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das folgende Beispiel zeigt einen einfachen Weg wie man NLS-Kataloge
flexibel nutzen kann.

Die nachfolgenden Zeilen m?ssen in eine allgemeine Headerdatei, die in
allen Quelldateien vorhanden ist, die lokalisierte Mitteilungen
benutzen, eingef?gt werden:

.. code:: programlisting

    #ifdef WITHOUT_NLS
    #define getstr(n)         nlsstr[n]
    #else
    #include <nl_types.h>

    extern nl_catd            catalog;
    #define getstr(n)         catgets(catalog, 1, n, nlsstr[n])
    #endif

    extern char              *nlsstr[];
            

Als n?chstes f?gen Sie die folgenden Zeilen in den globalen
Deklarationsteil der Hauptquelldatei ein:

.. code:: programlisting

    #ifndef WITHOUT_NLS
    #include <nl_types.h>
    nl_catd   catalog;
    #endif

    /*
    * Default messages to use when NLS is disabled or no catalog
    * is found.
    */
    char    *nlsstr[] = {
            "",
    /* 1*/  "some random message",
    /* 2*/  "some other message"
    };
        

Als n?chstes kommt der Code der den Katalog ?ffnet, liest und schlie?t:

.. code:: programlisting

    #ifndef WITHOUT_NLS
     catalog = catopen("myapp", NL_CAT_LOCALE);
    #endif

    ...

    printf(getstr(1));

    ...

    #ifndef WITHOUT_NLS
     catclose(catalog);
    #endif
        

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.2.3.1. Reduzierung von zu lokalisierenden Zeichenketten
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Es gibt einen guten Weg, Zeichenketten die lokaliesert werden m?ssen,
durch den Einsatz von libc-Fehlermeldungen zu reduzieren. Dadurch
vermeidet man Duplikate und erstellt gleiche Meldungen f?r h?ufige
Fehlermeldungen, die bei vielen Programmen auftreten k?nnen.

Als erstes ist hier ein Beispiel, dass keine libc-Fehlermeldungen
benutzt:

.. code:: programlisting

    #include <err.h>
    ...
    if (!S_ISDIR(st.st_mode))
     err(1, "argument is not a directory");
          

Dies kann so abge?ndert werden, dass eine Fehlermeldung durch Auslesen
der Variabel ``errno`` ausgegeben wird. Die Fehlermeldung wird
entsprechend dem Beispiel ausgegeben:

.. code:: programlisting

    #include <err.h>
    #include <errno.h>
    ...
    if (!S_ISDIR(st.st_mode)) {
     errno = ENOTDIR;
     err(1, NULL);
    }
          

In diesem Beispiel wurde die benutzerdefinierte Zeichenkette entfernt.
?bersetzer haben weniger Arbeit, wenn sie ein Programm lokalisieren und
die Benutzer sehen die ?bliche „"Not a directory"“ Fehlermeldung, wenn
dieser Fehler auftritt. Diese Meldung wird ihnen wahrscheinlich vertraut
erscheinen. Bitte beachten Sie, dass es notwendig ist, ``errno.h``
hinzuzuf?gen um einen direkten Zugriff auf ``errno`` zu haben.

Es lohnt sich darauf hinzuweisen, dass es F?lle gibt, in denen ``errno``
automatisch aufgerufen wird, so dass es nicht notwendig ist, es explizit
zu tun:

.. code:: programlisting

    #include <err.h>
    ...
    if ((p = malloc(size)) == NULL)
     err(1, NULL);
          

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

4.2.4. Benutzung von ``bsd.nls.mk``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das Benutzen von Katalogdateien setzt einige sich wiederholende
Schritte, wie das kompilieren und installieren der Kataloge, voraus. Um
diese Schritte zu vereinfachen, stellt ``bsd.nls.mk`` einige Makros zur
Verf?gung. Es ist nicht notwendig ``bsd.nls.mk`` explizit hinein zu
kopieren, es wird automatisch aus den allgemeinen Makefiles wie
``bsd.prog.mk`` oder ``bsd.lib.mk`` gezogen.

Normalerweise reicht es, ``NLSNAME`` zu definieren, die den Namen des
Kataloges als erstes Argument von
`catopen(3) <http://www.FreeBSD.org/cgi/man.cgi?query=catopen&sektion=3>`__
enthalten sollte und die Katalogdateien in ``NLS`` ohne ihre Endung
``.msg`` auflistet. Hier ist ein Beispiel, das es erm?glicht, NLS mit
dem obigen Code zu deaktivieren. Die ``WITHOUT_NLS`` Variable von
`make(1) <http://www.FreeBSD.org/cgi/man.cgi?query=make&sektion=1>`__
muss so definiert werden, dass das Programm ohne NLS-Unterst?tzung
gebaut wird.

.. code:: programlisting

    .if !defined(WITHOUT_NLS)
    NLS=     es_ES.ISO8859-1
    NLS+=    hu_HU.ISO8859-2
    NLS+=    pt_BR.ISO8859-1
    .else
    CFLAGS+= -DWITHOUT_NLS
    .endif
        

Normalerweise werden die Katalogdateien in dem ``nls``-Unterverzeichnis
abgelegt. Dies ist der Standard von ``bsd.nls.mk``. Es ist m?glich, mit
der ``NLSSRCDIR``-Variablen von
`make(1) <http://www.FreeBSD.org/cgi/man.cgi?query=make&sektion=1>`__
diese zu ?berschreiben. Der Standardname der vorkompilierten
Katalogdateien folgt den Namenskonventionen, wie oben beschrieben. Er
kann durch die ``NLSNAME``-Variablen ?berschrieben werden. Es gibt noch
weitere Optionen, um eine Feinabstimmung zur Verarbeitung der
Katalogdateien zu erreichen. Da sie nicht notwendig sind, werden sie
hier nicht weiter beschrieben. Weitere Informationen ?ber ``bsd.nls.mk``
finden Sie in der Datei selbst. Der Text ist kurz und leicht zu
verstehen.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------------------------------------+-------------------------------+---------------------------------------------------------------------+
| `Zur?ck <l10n.html>`__?                                               | `Nach oben <l10n.html>`__     | ?\ `Weiter <policies.html>`__                                       |
+-----------------------------------------------------------------------+-------------------------------+---------------------------------------------------------------------+
| Kapitel 4. Lokalisierung und Internationalisierung - L10N und I18N?   | `Zum Anfang <index.html>`__   | ?Kapitel 5. Vorgaben und Richtlinien f?r das Quelltextverzeichnis   |
+-----------------------------------------------------------------------+-------------------------------+---------------------------------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
