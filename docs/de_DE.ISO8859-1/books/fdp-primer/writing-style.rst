===========================
Kapitel 12. Der Schreibstil
===========================

.. raw:: html

   <div class="navheader">

Kapitel 12. Der Schreibstil
`Zur?ck <translations.html>`__?
?
?\ `Weiter <writing-style-word-list.html>`__

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

   <div>

?bersetzt von Johann Kois.

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

`12.1. Anleitungen f?r einen korrekten
Schreibstil <writing-style.html#writing-style-guide>`__
`12.2. H?ufig verwendete W?rter <writing-style-word-list.html>`__

.. raw:: html

   </div>

Damit von verschiedenen Autoren geschriebene Dokumente zueinander
konsistent bleiben, gibt es einige Richtlinien, denen Autoren bei der
Erstellung ihrer Dokumente folgen m?ssen.

.. raw:: html

   <div class="variablelist">

Verwendung von amerikanischem Englisch
    Es gibt mehrere englische Varianten und damit verbunden verschiedene
    Schreibweisen f?r das gleiche Wort. Wo dies der Fall ist, ist die
    amerikanische Schreibweise zu verwenden. Man schreibt daher „color“
    statt „colour“, „rationalize“ statt „rationalise“, und so weiter.

    .. raw:: html

       <div class="note" xmlns="">

    Anmerkung:
    ~~~~~~~~~~

    Die Verwendung von Britischem Englisch ist akzeptabel, wenn es sich
    um einen neuen Beitrag handelt, solange die gesamte Schreibweise
    eines Dokuments einheitlich bleibt. Alle anderen Dokumente wie
    B?cher, Internetseiten, Manualpages und andere m?ssen allerdings
    amerikanisches Englisch verwenden.

    .. raw:: html

       </div>

Vermeiden von Zusammenziehungen
    Verwenden Sie keine Zusammenziehungen, sondern schreiben Sie die
    Phrase immer aus. Die Schreibweise „Don't use contractions.“ w?re
    also nicht korrekt.

    Die Vermeidung von Zusammenziehungen sorgt f?r einen etwas
    formelleren Ton, ist pr?ziser und erleichtert die Arbeit der
    ?bersetzer.

Nutzung von Kommas bei Aufz?hlungen
    Bei einer Aufz?hlung innerhalb eines Absatzes sollten Sie zwischen
    den einzelnen Begriffen Kommas setzen. Zwischen dem letzten und
    vorletzten Begriff setzen Sie ein Komma und das Wort „und“.

    Dazu ein Beispiel:

    .. raw:: html

       <div class="blockquote">

        Das ist eine Liste von ein, zwei und drei Dingen.

    .. raw:: html

       </div>

    Handelt es sich dabei um eine Liste von drei Begriffen, „ein“,
    „zwei“, und „drei“, oder um eine Liste von zwei Begriffen, „ein“ und
    „zwei und drei“?

    Es ist daher besser, explizit ein serielles Komma zu setzen:

    .. raw:: html

       <div class="blockquote">

        Das ist eine Liste von ein, zwei, und drei Dingen.

    .. raw:: html

       </div>

Vermeidung von redundanten Begriffen
    Versuchen Sie, keine redundanten Phrasen zu verwenden. Dies gilt
    insbesondere f?r die Ausdr?cke „der Befehl“, „die Datei“, und „man
    command“.

    Die folgenden zwei Beispiele veranschaulichen dies f?r Befehle.
    Bevorzugt wird die Schreibweise des zweiten Beispiels.

    .. raw:: html

       <div class="informalexample">

    Verwenden Sie den Befehl ``svn``, um Ihre Quellen zu aktualisieren.

    .. raw:: html

       </div>

    .. raw:: html

       <div class="informalexample">

    Verwenden Sie ``svn``, um Ihre Quellen zu aktualisieren.

    .. raw:: html

       </div>

    Analoges gilt f?r Dateinamen, wobei wiederum die zweite Schreibweise
    bevorzugt wird.

    .. raw:: html

       <div class="informalexample">

    … in der Datei ``/etc/rc.local``\ …

    .. raw:: html

       </div>

    .. raw:: html

       <div class="informalexample">

    … in ``/etc/rc.local``\ …

    .. raw:: html

       </div>

    Auch f?r Manualpages gibt es zwei Schreibweisen. Auch hier wird die
    zweite Schreibweise bevorzugt (das zweite Beispiel nutzt das Tag
    ``citerefentry``).

    .. raw:: html

       <div class="informalexample">

    Weitere Informationen finden Sie in ``man csh``.

    .. raw:: html

       </div>

    .. raw:: html

       <div class="informalexample">

    Weitere Informationen finden Sie in
    `csh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=csh&sektion=1>`__.

    .. raw:: html

       </div>

Zwei Leerzeichen am Satzende
    Verwenden Sie immer zwei Leerzeichen am Ende eines Satzes. Dadurch
    erh?ht sich die Lesbarkeit des Textes und die Nutzung von Werkzeugen
    wie Emacs wird vereinfacht.

    Nun k?nnte man behaupten, dass ein Punkt vor einem Gro?buchstaben
    das Satzende markiert. Vor allem bei Namen, beispielsweise bei
    „Jordan K. Hubbard“, ist dies allerdings nicht der Fall. Wir haben
    hier ein gro?es ``K``, gefolgt von einem Punkt und einem
    Leerzeichen. Dennoch handelt es sich nicht um den Anfang eines neuen
    Satzes.

.. raw:: html

   </div>

Eine ausf?hrliche Beschreibung des korrekten Schreibstils finden Sie im
Buch `Elements of Style <http://www.bartleby.com/141/>`__ von William
Strunk.

.. raw:: html

   <div class="sect1">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

12.1. Anleitungen f?r einen korrekten Schreibstil
-------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Damit die Quellen der Dokumentation selbst dann konsistent bleiben, wenn
viele Leute daran arbeiten, folgen Sie bitte den folgenden Konventionen.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

12.1.1. Gro?- und Kleinschreibung
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Tags werden in Kleinbuchstaben geschrieben, Sie schreiben also ``para``,
*nicht* ``PARA``.

Text im SGML-Kontext wird hingegen in Gro?buchstaben geschrieben. Man
schreibt also ``<!ENTITY…>`` und ``<!DOCTYPE…>``, *nicht* ``<!entity…>``
und ``<!doctype…>``.

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

12.1.2. Abk?rzungen (Akronyme)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Abk?rzungen sollten bei ihrer ersten Verwendung immer ausgeschrieben
werden. Man schreibt also beispielsweise „Network Time Protocol (NTP)“.
Nachdem die Abk?rzung definiert wurde, sollte hingegen nur noch die
Abk?rzung verwendet werden, es sei denn, die Verwendung des gesamten
Begriffes ergibt im jeweiligen Kontext mehr Sinn. Im Normalfall werden
Akronyme in jedem Dokument nur einmal definiert. Es ist allerdings auch
m?glich, sie f?r jedes Kapitel erneut zu definieren.

Die drei ersten Vorkommen der Abk?rzung sollten in ``acronym``-Tags
eingeschlossen werden. Zus?tzlich wird ein ``role``-Attribut mit dem
vollst?ndigen Begriff definiert. Dadurch kann ein Link zu einem Glossar
erzeugt werden. Au?erdem wird der komplette Begriff angezeigt, wenn man
den Mauscursor ?ber die Abk?rzung bewegt.

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

12.1.3. Einr?ckung
~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die erste Zeile jeder Datei hat die Einr?ckung 0, und zwar *unabh?ngig*
von der Einr?ckung der Datei, in der sie enthalten ist.

?ffnende Tags erh?hen die Einr?ckung um zwei Leerzeichen. Schlie?ende
Tags verringern sie hingegen um zwei Leerzeichen. Ein Block von acht
Leerzeichen wird durch einen Tabulator ersetzt. Ein solcher Block
beginnt immer am Anfang einer Zeile, f?hrende Leerzeichen sind hier also
nicht erlaubt. Vermeiden Sie au?erdem Leerzeichen am Zeilenende. Der
Inhalt von Elementen wird um zwei Leerzeichen einger?ckt, wenn er sich
?ber mehr als eine Zeile erstreckt.

Der Quellcode dieses Abschnitts sieht daher in etwa so aus:

.. code:: programlisting

    +--- Einr?ckung (Spalte) 0
    V
    <chapter>
      <title>...</title>

      <sect1>
        <title>...</title>

        <sect2>
          <title>Einr?ckung</title>

          <para>Die erste Zeile jeder Datei hat die Einr?ckung 0, und
            zwar <emphasis>unabh?ngig</emphasis> von der Einr?ckung
            der Datei, in der sie enthalten ist.</para>

          ...
        </sect2>
      </sect1>
    </chapter>

Wenn Sie Emacs oder XEmacs verwenden, um Ihre Dateien zu bearbeiten,
sollte der ``sgml-mode`` automatisch geladen werden, und die lokalen
Emacs-Variablen am Ende einer Datei sollten diesen Stil erzwingen.

Verwenden Sie Vim, sollten Sie Ihren Editor so konfigurieren:

.. code:: programlisting

    augroup sgmledit
      autocmd FileType sgml set formatoptions=cq2l " Special formatting options
      autocmd FileType sgml set textwidth=70       " Wrap lines at 70 columns
      autocmd FileType sgml set shiftwidth=2       " Automatically indent
      autocmd FileType sgml set softtabstop=2      " Tab key indents 2 spaces
      autocmd FileType sgml set tabstop=8          " Replace 8 spaces with a tab
      autocmd FileType sgml set autoindent         " Automatic indentation
    augroup END

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

12.1.4. Die korrekte Schreibweise von Tags
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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

12.1.4.1. Einr?cken von Tags
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Tags, die die gleiche Einr?ckung aufweisen wie das vorangegangene Tag,
sollten durch eine Leerzeile getrennt werden, Tags mit unterschiedlicher
Einr?ckung hingegen nicht:

.. raw:: html

   <div class="informalexample">

.. code:: programlisting

    <article lang='de'>
      <articleinfo>
        <title>NIS</title>

        <pubdate>October 1999</pubdate>

        <abstract>
          <para>...
        ...
        ...</para>
        </abstract>
      </articleinfo>

      <sect1>
        <title>...</title>

        <para>...</para>
      </sect1>

      <sect1>
        <title>...</title>

        <para>...</para>
      </sect1>
    </article>

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

12.1.4.2. Gliederung von Tags
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Tags wie zum Beispiel ``itemizedlist``, die immer weitere Tags
einschlie?en und selbst keine Zeichen enthalten, befinden sich immer in
einer eigenen Zeile.

Tags wie ``para`` und ``term`` k?nnen selbst Text enthalten, und ihr
Inhalt beginnt direkt nach dem Tag, und zwar *in der gleichen Zeile*.

Dies gilt analog, wenn diese zwei Tag-Arten wieder geschlossen werden.

Eine Vermischung dieser Tags kann daher zu Problemen f?hren.

Wenn auf ein Start-Tag, das keine Zeichen enthalten kann, unmittelbar
ein Tag folgt, das andere Tags einschlie?en muss, um Zeichen
darzustellen, befinden sich diese Tags auf verschiedenen Zeilen. Das
zweite Tag wird dabei entsprechend einger?ckt.

Wenn ein Tag, das Zeichen enthalten kann, direkt nach einem Tag, das
keine Zeichen enthalten kann, geschlossen wird, befinden sich beide Tags
in der gleichen Zeile.

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

12.1.5. Markup-?nderungen (*white space changes*)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn Sie ?nderungen committen, *committen Sie niemals Inhalts- und
Formatierungs?nderungen zur gleichen Zeit*.

Nur auf diese Weise k?nnen die ?bersetzungs-Teams sofort erkennen,
welche ?nderungen durch Ihren Commit verursacht wurden, ohne dar?ber
nachdenken zu m?ssen, ob sich der Inhalt einer Zeile oder nur deren
Formatierung ge?ndert hat.

Nehmen wir an, Sie haben zwei S?tze in einen Absatz eingef?gt. Daher
sind zwei Zeilen nun l?nger als 80?Zeichen. Zuerst committen Sie Ihre
inhaltliche ?nderung inklusive der zu langen Zeilen. Im n?chsten Commit
korrigieren Sie den Zeilenumbruch und geben in der Commit-Mitteilung an,
dass es sich nur um ?nderung am Markup handelt (*whitespace-only
change*), und ?bersetzer den Commit daher ignorieren k?nnen.

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

12.1.6. Vermeiden von fehlerhaften Zeilenumbr?chen (Nutzung von *non-breaking space*)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Vermeiden Sie Zeilenumbr?che an Stellen, an denen diese h?sslich
aussehen oder es erschweren, einem Satz zu folgen. Zeilenumbr?che h?ngen
von der Breite des gew?hlten Ausgabemedium ab. Insbesondere bei der
Verwendung von Textbrowsern k?nnen schlecht formatierte Abs?tze wie der
folgende entstehen:

.. code:: literallayout

    Data capacity ranges from 40 MB to 15
    GB.  Hardware compression …

Die Nutzung der Entity ``&nbsp;`` verhindert Zeilenumbr?che zwischen
zusammengeh?renden Teilen. Verwenden Sie *non-breaking spaces* daher in
den folgenden F?llen:

.. raw:: html

   <div class="itemizedlist">

-  Zwischen Zahlen und Einheiten:

   .. code:: programlisting

       57600&nbsp;bps

-  Zwischen Programmnamen und Versionsnummern:

   .. code:: programlisting

       FreeBSD&nbsp;4.7

-  Zwischen mehreren zusammengeh?renden W?rtern (Vorsicht bei Namen, die
   aus mehr als 3-4 W?rtern bestehen, wie „The FreeBSD Brazilian
   Portuguese Documentation Project“):

   .. code:: programlisting

       Sun&nbsp;Microsystems

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

+-----------------------------------+-------------------------------+------------------------------------------------+
| `Zur?ck <translations.html>`__?   | ?                             | ?\ `Weiter <writing-style-word-list.html>`__   |
+-----------------------------------+-------------------------------+------------------------------------------------+
| Kapitel 11. ?bersetzungen?        | `Zum Anfang <index.html>`__   | ?12.2. H?ufig verwendete W?rter                |
+-----------------------------------+-------------------------------+------------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
