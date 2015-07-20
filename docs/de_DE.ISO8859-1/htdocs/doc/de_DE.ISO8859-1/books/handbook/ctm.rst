========
A.5. CTM
========

.. raw:: html

   <div class="navheader">

A.5. CTM
`Zur?ck <anoncvs.html>`__?
Anhang A. Bezugsquellen f?r FreeBSD
?\ `Weiter <svn.html>`__

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

A.5. CTM
--------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Mit CTM`:sup:`[19]` <#ftn.idp94095824>`__ k?nnen Sie einen entfernten
Verzeichnisbaum mit einem zentralen Baum synchronisieren. Es wurde extra
zum Synchronisieren der FreeBSD Quellen entwickelt, obwohl es mit der
Zeit vielleicht auch andere Anwendungen geben wird. Zurzeit existiert
leider so gut wie keine Dokumentation zum Erstellen der Deltas. Wenn Sie
Hilfe ben?tigen oder CTM f?r andere Zwecke einsetzen wollen, wenden Sie
sich bitte an die Mailingliste
`ctm-users <http://lists.FreeBSD.org/mailman/listinfo/ctm-users>`__.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

A.5.1. Warum soll ich CTM benutzen?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Mit CTM erhalten Sie eine lokale Kopie des FreeBSD-Quellbaums, den es in
mehreren „Varianten“ gibt. Sie k?nnen das ganze Repository oder nur
einen Zweig spiegeln. Wenn Sie ein aktiver FreeBSD-Entwickler mit einer
schlechten oder gar keiner TCP/IP Verbindung sind, oder die ?nderungen
einfach automatisch zugesandt bekommen wollen, dann ist CTM das Richtige
f?r Sie. F?r die Zweige mit der meisten Aktivit?t m?ssen Sie sich
t?glich bis zu drei Deltas beschaffen, Sie sollten allerdings erw?gen,
die Deltas automatisch ?ber E-Mail zu beziehen. Die Gr??e der Updates
wird so klein wie m?glich gehalten. Normalerweise sind sie kleiner als
5?kB, manchmal sind sie 10-50?kB gro? (etwa jedes 10.?Update) und ab und
an werden Sie auch einmal ein Update mit 100?kB oder mehr erhalten.

Sie sollten sich ?ber die Vorbehalte gegen die Verwendung der Quellen
anstelle eines offiziellen Releases bewusst sein. Das trifft besonders
auf FreeBSD-CURRENT zu, lesen Sie dazu bitte den Abschnitt
`FreeBSD-CURRENT <current-stable.html#current>`__.

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

A.5.2. Was brauche ich, um CTM zu benutzen?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Zwei Sachen: Das CTM Programm und die initialen Deltas, von denen aus
Sie auf die „aktuellen“ St?nde kommen.

CTM ist schon seit der Version?2.0 Teil des FreeBSD-Basissystems. Sie
finden es in ``/usr/src/usr.sbin/ctm``, wenn Sie eine Kopie der Quellen
besitzen.

Die Deltas, die CTM verarbeitet, k?nnen Sie ?ber FTP oder E-Mail
beziehen. Wenn Sie ?ber einen FTP Zugang zum Internet verf?gen, erhalten
Sie die Deltas unter der folgenden URL:

``ftp://ftp.FreeBSD.org/pub/FreeBSD/CTM/``

Die Deltas werden auch von `CTM Spiegeln <ctm.html#mirrors-ctm>`__
bereitgehalten.

Wechseln Sie in das passende Verzeichnisse zum Beispiel ``src-cur`` f?r
FreeBSD-CURRENT und laden Sie sich von dort die Deltas herunter.

Sie k?nnen die Deltas auch ?ber E-Mail beziehen.

Abonnieren Sie dazu eine der CTM-Verteilerlisten. ?ber
`ctm-cvs-cur <http://lists.FreeBSD.org/mailman/listinfo/ctm-cvs-cur>`__
erhalten Sie den kompletten CVS-Baum, ?ber
`ctm-src-cur <http://lists.FreeBSD.org/mailman/listinfo/ctm-src-cur>`__
erhalten Sie FreeBSD-CURRENT und ?ber
`ctm-src-9 <http://lists.FreeBSD.org/mailman/listinfo/ctm-src-9>`__
erhalten Sie den FreeBSD 9.X-Zweig. Wenn Sie nicht wissen, wie Sie eine
der Mailinglisten abonnieren, folgen Sie einem der Verweise von oben
oder besuchen Sie die Seite http://lists.FreeBSD.org/mailman/listinfo.
Weitere Informationen erhalten Sie, wenn Sie dort auf die gew?nschte
Liste klicken.

Benutzen Sie ``ctm_rmail``, um die CTM Updates, die Sie per E-Mail
empfangen, auszupacken und anzuwenden. Wenn Sie diesen Prozess
automatisiert ablaufen lassen m?chten, k?nnen Sie dazu einen Eintrag in
``/etc/aliases`` verwenden. Genauere Informationen finden Sie in der
Manualpage von ``ctm_rmail``.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Sie sollten die Mailingliste
`ctm-announce <http://lists.FreeBSD.org/mailman/listinfo/ctm-announce>`__
abonnieren, egal wie Sie die CTM-Deltas erhalten. Ank?ndigungen, die den
Betrieb des CTM-Systems betreffen, werden nur auf dieser Liste bekannt
gegeben. Klicken Sie auf den Namen der Liste oder besuchen Sie die Seite
http://lists.FreeBSD.org/mailman/listinfo, um diese Liste zu abonnieren.

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

A.5.3. Initialisieren von CTM
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Bevor Sie die CTM Deltas benutzen k?nnen, brauchen Sie einen Startpunkt,
auf den die nachfolgenden Deltas angewendet werden.

Sie k?nnen nat?rlich mit einem leeren Verzeichnis beginnen. In diesem
Fall ben?tigen Sie ein ``XEmpty``-Delta, mit dem Sie den
CTM-Verzeichnisbaum initialisieren. Wenn Sie Gl?ck haben, finden Sie ein
``XEmpty``-Delta, mit dem sie beginnen k?nnen, auf einer der CDs Ihrer
Distribution.

Da die Verzeichnisb?ume mehrere Megabyte gro? sind, sollten Sie nach
M?glichkeit etwas schon vorhandenes benutzen. Wenn Sie eine -RELEASE CD
besitzen, k?nnen Sie die Quellen von dieser CD benutzen. Sie ersparen
sich damit das ?bertragen gro?er Datenmengen.

Die Deltas, mit denen Sie beginnen k?nnen, enthalten ein ``X`` in ihrem
Namen, wie in ``src-cur.3210XEmpty.gz``. Hinter dem ``X`` wird der
Startpunkt der Deltas angegeben, in diesem Fall steht ``Empty`` f?r ein
leeres Verzeichnis. Nach etwa 100?Deltas wird ein neues ``XEmpty``-Delta
erstellt. Mit ungef?hr 75?Megabyte komprimierter Daten sind diese
``XEmpty``-Deltas ?brigens sehr gro?.

Nachdem Sie Ihren Startpunkt festgelegt haben, ben?tigen Sie alle Deltas
mit einer h?heren Nummer.

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

A.5.4. Benutzen von CTM
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Um ein Delta einzuspielen, benutzen Sie das folgende Kommando:

.. code:: screen

    # cd /Pfad/zu/den/Quellen
    # ctm -v -v /Pfad/zu/den/Deltas/src-xxx.*

CTM kann mit Deltas arbeiten, die mit ``gzip`` komprimiert wurden. Sie
brauchen die Deltas vorher nicht mit ``gunzip`` zu dekomprimieren und
sparen damit Plattenplatz.

Ihr Quellbaum wird erst dann ver?ndert, wenn CTM die Deltas sauber
verarbeiten kann. Die Integrit?t der Deltas und ihre Anwendbarkeit auf
den Quellbaum lassen sich durch die Angabe des Schalters ``-c``
?berpr?fen, CTM ?ndert in diesem Fall Ihren Quellbaum nicht.

CTM verf?gt ?ber weitere Kommandozeilenoptionen, Informationen dazu
finden Sie in der Manualpage oder dem Quellcode.

Das war schon alles. Um Ihre Quellen aktuell zu halten, verwenden Sie
CTM jedes Mal, wenn Sie neue Deltas bekommen.

L?schen Sie die Deltas nicht, wenn Sie diese nur schwer wieder
beschaffen k?nnen. Behalten Sie sie f?r den Fall, das etwas passiert.
Auch wenn Sie nur Disketten besitzen, sollten Sie erw?gen, die Deltas
mit ``fdwrite`` zu sichern.

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

A.5.5. Umgang mit lokalen ?nderungen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Entwickler wollen mit den Dateien im Quellbaum experimentieren und diese
ver?ndern. In beschr?nkter Weise werden lokale ?nderungen von CTM
unterst?tzt. Wenn CTM die Datei ``foo`` bearbeiten will, ?berpr?ft es
zuerst ob die Datei ``foo.ctm`` existiert. Wenn diese Datei existiert,
werden ?nderungen in ihr anstatt in ``foo`` vorgenommen.

Mit diesem Verfahren ist eine leichte Handhabung lokaler ?nderungen
m?glich. Kopieren Sie die Dateien, die Sie ?ndern m?chten, in Dateien,
die das Suffix ``.ctm`` tragen. Sie k?nnen dann ungest?rt mit dem
Quellcode arbeiten, w?hrend ``CTM`` die ``.ctm`` Dateien aktualisiert.

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

A.5.6. Weitere CTM-Optionen
~~~~~~~~~~~~~~~~~~~~~~~~~~~

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

A.5.6.1. Was wird aktualisiert?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Eine Liste der ?nderungen, die CTM an Ihrem Quellbaum vornehmen wird,
erhalten Sie, wenn Sie die Option ``-l`` angeben.

Das ist n?tzlich, wenn Sie Logs ?ber die ?nderungen f?hren wollen,
ge?nderte Dateien vor- oder nachbearbeiten wollen, oder einfach ein
bisschen paranoid sind.

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

A.5.6.2. Sicherungen vor einer Aktualisierung erstellen
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Sie wollen vielleicht die Dateien, die durch eine CTM Aktualisierung
ver?ndert werden, sichern.

Mit ``-B           backup-file`` weisen Sie CTM an, alle Dateien, die
durch ein CTM Delta ver?ndert w?rden, nach ``backup-file`` zu sichern.

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

A.5.6.3. Dateien ausschlie?en
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Manchmal wollen Sie nur bestimmte Teile aktualisieren oder nur bestimmte
Dateien aus einer Folge von Deltas extrahieren.

Sie k?nnen die Liste der Dateien, mit denen CTM arbeitet, einschr?nken,
indem Sie regul?re Ausdr?cke mit den Optionen ``-e`` und ``-x`` angeben.

Wenn Sie eine aktuelle Kopie von ``lib/libc/Makefile`` aus den
gesicherten CTM Deltas erhalten wollen, setzen Sie das folgende Kommando
ab:

.. code:: screen

    # cd /wo/Sie/es/auspacken/wollen/
    # ctm -e '^lib/libc/Makefile' ~ctm/src-xxx.*

Die Optionen ``-e`` und ``-x`` werden in der Reihenfolge angewandt, in
der sie auf der Kommandozeile angegeben wurden. Eine Datei wird nur dann
von CTM verarbeitet, wenn dies nach der Anwendung der Optionen ``-e``
und ``-x`` noch erlaubt ist.

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

A.5.7. Pl?ne f?r CTM
~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Mehrere:

.. raw:: html

   <div class="itemizedlist">

-  Hinzuf?gen eines Authentifizierungsmechanismus, damit gef?lschte
   CTM-Deltas erkannt werden k?nnen.

-  Aufr?umen der CTM-Optionen, die mit der Zeit un?bersichtlich und
   irref?hrend wurden.

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

A.5.8. Verschiedenes
~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Es gibt Deltas f?r die Ports-Sammlung, die aber nicht intensiv genutzt
werden.

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

A.5.9. CTM-Spiegel
~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die CTM-Deltas k?nnen Sie mit anonymous FTP von den folgenden Spiegeln
beziehen. Versuchen Sie bitte einen Spiegel in Ihrer N?he zu benutzen.

Bei Problemen wenden Sie sich bitte an die Mailingliste
`ctm-users <http://lists.FreeBSD.org/mailman/listinfo/ctm-users>`__.

.. raw:: html

   <div class="variablelist">

Kalifornien, Bay Area, Offizieller Server
    .. raw:: html

       <div class="itemizedlist">

    -  ``ftp://ftp.FreeBSD.org/pub/FreeBSD/development/CTM/``

    .. raw:: html

       </div>

S?dafrika, Backup-Server f?r alte Deltas
    .. raw:: html

       <div class="itemizedlist">

    -  ``ftp://ftp.za.FreeBSD.org/pub/FreeBSD/CTM/``

    .. raw:: html

       </div>

Taiwan/R.O.C.
    .. raw:: html

       <div class="itemizedlist">

    -  ``ftp://ctm.tw.FreeBSD.org/pub/FreeBSD/development/CTM/``

    -  ``ftp://ctm2.tw.FreeBSD.org/pub/FreeBSD/development/CTM/``

    -  ``ftp://ctm3.tw.FreeBSD.org/pub/FreeBSD/development/CTM/``

    .. raw:: html

       </div>

.. raw:: html

   </div>

Wenn die Liste keinen Spiegel in Ihrer N?he enth?lt oder Sie Probleme
mit dem ausgew?hlten Spiegel haben, versuchen Sie einen Spiegel mit
einer Suchmaschine, wie `alltheweb <http://www.alltheweb.com/>`__, zu
finden.

.. raw:: html

   </div>

.. raw:: html

   <div class="footnotes">

--------------

.. raw:: html

   <div id="ftn.idp94095824" class="footnote">

`:sup:`[19]` <#idp94095824>`__ Abk?rzung f?r „CVS Through eMail“

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------+--------------------------------+---------------------------------+
| `Zur?ck <anoncvs.html>`__?       | `Nach oben <mirrors.html>`__   | ?\ `Weiter <svn.html>`__        |
+----------------------------------+--------------------------------+---------------------------------+
| A.4. Anonymous CVS (veraltet)?   | `Zum Anfang <index.html>`__    | ?A.6. Benutzen von Subversion   |
+----------------------------------+--------------------------------+---------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
