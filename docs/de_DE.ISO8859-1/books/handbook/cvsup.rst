==================================
A.8. Benutzen von CVSup (veraltet)
==================================

.. raw:: html

   <div class="navheader">

A.8. Benutzen von CVSup (veraltet)
`Zur?ck <svn-mirrors.html>`__?
Anhang A. Bezugsquellen f?r FreeBSD
?\ `Weiter <cvs-tags.html>`__

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

A.8. Benutzen von CVSup (veraltet)
----------------------------------

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

A.8.1. Einf?hrung
~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

CVSup ist eine Anwendung, die Verzeichnisb?ume von einem entfernten
CVS-Server bereitstellt und aktualisiert. Die Quellen von FreeBSD werden
in einem CVS-Repository auf einer Entwicklungsmaschine in Kalifornien
gepflegt. Mit CVSup k?nnen sich FreeBSD-Benutzer den eigenen Quellbaum
auf aktuellem Stand halten.

Zum Aktualisieren benutzt CVSup die Pull-Methode, bei der die
Aktualisierungen vom Client angefragt werden. Der Server wartet dabei
passiv auf Anfragen von Clients, das hei?t er verschickt nicht
unaufgefordert Aktualisierungen. Somit gehen alle Anfragen vom Client
aus und die Benutzer m?ssen CVSup entweder manuell starten oder einen
``cron`` Job einrichten, um regelm??ig Aktualisierungen zu erhalten.

CVSup in genau dieser Schreibweise bezeichnet die Anwendung, die aus dem
Client ``cvsup`` und dem Server ``cvsupd`` besteht. ``cvsup`` l?uft auf
den Maschinen der Benutzer, ``cvsupd`` l?uft auf jedem der
FreeBSD-Spiegel.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Mit csup gibt es in inzwischen auch eine in C geschriebene
Neuimplementierung von CVSup. Der gr??te Vorteil dieser neuen Version
ist neben einer h?heren Geschwindigkeit der, dass dieses Programm nicht
von der Sprache Modula-3 abh?ngig ist und Sie daher dieses Paket nicht
mitinstallieren m?ssen. csup ist bereits im Basissystem enthalten und
kann sofort verwendet werden. Wollen Sie k?nftig csup einsetzen,
?berspringen Sie in den folgenden Ausf?hrungen einfach den Abschnitt zur
Installation von CVSup und ersetzen alle Vorkommen von CVSup durch csup.

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

A.8.2. Installation von CVSup
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

CVSup k?nnen Sie leicht installieren, wenn Sie das vorkompilierte Paket
`net/cvsup <http://www.freebsd.org/cgi/url.cgi?ports/net/cvsup/pkg-descr>`__
aus der `Ports-Sammlung <ports.html>`__ benutzen. Alternativ k?nnen Sie
`net/cvsup <http://www.freebsd.org/cgi/url.cgi?ports/net/cvsup/pkg-descr>`__
auch ausgehend von den Quellen bauen, doch seien Sie gewarnt:
`net/cvsup <http://www.freebsd.org/cgi/url.cgi?ports/net/cvsup/pkg-descr>`__
h?ngt vom Modula-3 System ab, das viel Zeit und Platz zum Herunterladen
und Bauen braucht.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Wenn Sie CVSup auf einer Maschine ohne Xorg (also beispielsweise auf
einem Server), benutzen, stellen Sie bitte sicher, dass Sie den Port
ohne das CVSup-GUI,
(`net/cvsup-without-gui <http://www.freebsd.org/cgi/url.cgi?ports/net/cvsup-without-gui/pkg-descr>`__)
verwenden.

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

A.8.3. Konfiguration von CVSup
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das Verhalten von CVSup wird mit einer Konfigurationsdatei gesteuert,
die ``supfile`` genannt wird. Beispiele f?r Konfigurationsdateien finden
Sie in dem Verzeichnis file://localhost/usr/share/examples/cvsup/.

Ein ``supfile`` enth?lt die folgenden Informationen:

.. raw:: html

   <div class="itemizedlist">

-  `Welche Dateien Sie erhalten
   wollen. <cvsup.html#cvsup-config-files>`__

-  `Welche Versionen der Dateien Sie
   ben?tigen. <cvsup.html#cvsup-config-vers>`__

-  `Woher Sie die Dateien beziehen
   wollen. <cvsup.html#cvsup-config-where>`__

-  `Wo Sie die erhaltenen Dateien
   speichern. <cvsup.html#cvsup-config-dest>`__

-  `Wo Sie die Status-Dateien aufbewahren
   wollen. <cvsup.html#cvsup-config-status>`__

.. raw:: html

   </div>

In den folgenden Abschnitten erstellen wir ein typisches ``supfile``
indem wir nach und nach diese Punkte kl?ren. Zuerst beschreiben wir aber
den Aufbau dieser Konfigurationsdatei.

Ein ``supfile`` ist eine Textdatei. Kommentare beginnen mit einem ``#``
und gelten bis zum Zeilenende. Leerzeilen und Zeilen, die nur Kommentare
enthalten, werden ignoriert.

Die anderen Zeilen legen die Dateien fest, die ein Benutzer erhalten
will. Der Server organisiert verschiedene Dateien in einer „Sammlung“,
deren Name auf einer Zeile angegeben wird. Nach dem Namen der Sammlung
k?nnen mehrere durch Leerzeichen getrennte Felder folgen, die die oben
angesprochenen Informationen festlegen. Es gibt zwei Arten von Feldern:
Felder, die Optionen festlegen und Felder mit Parametern. Optionen
bestehen aus einem Schl?sselwort, wie ``delete`` oder ``compress`` und
stehen alleine. Ein Parameterfeld beginnt mit einem Schl?sselwort, dem
``=`` und ein Parameter, wie in ``release=cvs``, folgt. Dieses Feld darf
keine Leerzeichen enthalten.

In einem ``supfile`` werden normalerweise mehrere Sammlungen
angefordert. Die erforderlichen Felder k?nnen explizit f?r jede Sammlung
angegeben werden, dann werden jedoch die Zeilen ziemlich lang. Au?erdem
ist dieses Vorgehen sehr unhandlich, da die meisten Felder f?r alle
Sammlungen gleich sind. CVSup bietet die M?glichkeit, Vorgaben f?r die
Felder der Sammlungen festzulegen. Zeilen, die mit der Pseudo-Sammlung
``*default`` beginnen, legen Optionen und Parameter f?r nachfolgende
Sammlungen im ``supfile`` fest. Der Vorgabewert kann in der Zeile einer
bestimmten Sammlung ?berschrieben werden. Durch Hinzuf?gen weiterer
``*default`` Zeilen k?nnen die Vorgaben auch mitten im ``supfile``
?berschrieben oder erweitert werden.

Mit diesem Wissen k?nnen wir nun ein ``supfile`` erstellen, das den
Quellbaum von `FreeBSD-CURRENT <current-stable.html#current>`__
anfordert und aktualisiert.

.. raw:: html

   <div class="itemizedlist">

-  Welche Dateien wollen Sie empfangen?

   Dateien werden von CVSup in „Sammlungen“ organisiert. Die
   erh?ltlichen Sammlungen werden `sp?ter <cvsup.html#cvsup-collec>`__
   beschrieben. Wir wollen den Quellbaum von FreeBSD empfangen, der in
   der Sammlung ``src-all`` enthalten ist. Das ``supfile`` enth?lt pro
   Zeile eine Sammlung, in diesem Fall also nur eine einzige Zeile:

   .. code:: programlisting

       src-all

-  Welche Versionen der Dateien werden ben?tigt?

   Mit CVSup k?nnen Sie jede Version der Quellen bekommen, da der
   cvsupd-Server seine Daten direkt aus dem CVS-Repository bezieht. Sie
   k?nnen die ben?tigten Versionen in den Parameterfeldern ``tag=`` und
   ``date=`` angeben.

   .. raw:: html

      <div class="warning" xmlns="">

   Warnung:
   ~~~~~~~~

   Achten Sie darauf, dass Sie das richtige ``tag=``-Feld angeben.
   Einige Tags sind nur f?r spezielle Sammlungen g?ltig. Wenn Sie ein
   falsches Tag angeben oder sich verschreiben, wird CVSup Dateien
   l?schen, die Sie wahrscheinlich gar nicht l?schen wollten. Achten Sie
   insbesondere bei den ``ports-*``-Sammlungen darauf, *ausschlie?lich*
   ``tag=.`` zu verwenden.

   .. raw:: html

      </div>

   Mit ``tag=`` wird ein symbolischer Name aus dem Repository angegeben.
   Es gibt zwei verschiedene Tags: Tags, die Revisionen bezeichnen und
   Tags, die Zweige bezeichnen. Die ersteren sind statisch und fest an
   eine Revision gebunden. Ein Tag, das einen Zweig bezeichnet, bezieht
   sich dagegen zu einem gegebenen Zeitpunkt immer auf die aktuellste
   Revision. Da ein Tag eines Zweiges nicht an eine bestimmte Revision
   gebunden ist, kann sich dessen Bedeutung von heute auf morgen ?ndern.

   `Abschnitt?A.9, „CVS-Tags“ <cvs-tags.html>`__ z?hlt f?r Benutzer
   relevante Tags auf. Wenn Sie in der Konfigurationsdatei ein Tag, wie
   ``RELENG_8``, angeben, m?ssen Sie diesem ``tag=`` vorstellen:
   ``tag=RELENG_8``. Denken Sie daran, dass es f?r die Ports-Sammlung
   nur ``tag=.`` gibt.

   .. raw:: html

      <div class="warning" xmlns="">

   Warnung:
   ~~~~~~~~

   Achten Sie darauf, dass Sie den Namen eines Tags richtig angeben.
   CVSup kann nicht zwischen richtigen und falschen Tags unterscheiden.
   Wenn Sie sich bei der Angabe eines Tags vertippen, nimmt CVSup an,
   Sie h?tten ein g?ltiges Tag angegeben, dem nur keine Dateien
   zugeordnet sind. Die Folge davon ist, dass Ihre vorhandenen Quellen
   gel?scht werden.

   .. raw:: html

      </div>

   Wenn Sie ein Tag angeben, das sich auf einen Zweig bezieht, erhalten
   Sie die aktuellsten Revisionen der Dateien auf diesem Zweig. Wenn Sie
   eine fr?here Revision erhalten m?chten, k?nnen Sie diese im ``date=``
   Feld angeben. Einzelheiten dazu finden Sie in der Manualpage von
   ``cvsup``.

   Wir m?chten gerne FreeBSD-CURRENT beziehen und f?gen die folgende
   Zeile *am Anfang* der Konfigurationsdatei ein:

   .. code:: programlisting

       *default tag=.

   Eine wichtige Ausnahme ist wenn Sie weder ein ``tag=``-Feld noch ein
   ``date=``-Feld angeben. In diesem Fall erhalten Sie anstelle einer
   speziellen Revision die wirklichen RCS-Dateien aus dem CVS-Repository
   des Servers. Diese Vorgehensweise wird von Entwicklern bevorzugt, da
   sie mit einem eigenen Repository leicht die Entwicklungsgeschichte
   und Ver?nderungen von Dateien verfolgen k?nnen. Dieser Vorteil muss
   allerdings mit sehr viel Plattenplatz bezahlt werden.

-  Woher sollen die Dateien bezogen werden?

   Im ``host=``-Feld wird angegeben, woher ``cvsup`` die Dateien holen
   soll. Sie k?nnen hier jeden der
   `CVSup-Spiegel <cvsup.html#cvsup-mirrors>`__ angeben, doch sollten
   Sie einen Server in Ihrer N?he ausw?hlen. F?r dieses Beispiel wollen
   wir den erfundenen Server ``cvsup99.FreeBSD.org`` verwenden:

   .. code:: programlisting

       *default host=cvsup99.FreeBSD.org

   Bevor Sie CVSup laufen lassen, sollten Sie hier einen existierenden
   Server einsetzen. Den zu verwendenden Server k?nnen Sie auf der
   Kommandozeile mit ``-h           hostname`` ?berschreiben.

-  Wo sollen die Dateien gespeichert werden?

   Im ``prefix=``-Feld teilen Sie ``cvsup`` mit, wo die Dateien
   gespeichert werden sollen. In diesem Beispiel werden wir die
   Quelldateien direkt im Verzeichnisbaum f?r Quellen ``/usr/src``
   ablegen. Das Verzeichnis ``src`` ist schon in der Sammlung, die wir
   beziehen enthalten, so dass wir die folgende Zeile angeben:

   .. code:: programlisting

       *default prefix=/usr

-  Wo sollen die Statusinformationen von ``cvsup`` gespeichert werden?

   ``cvsup`` legt in einem Verzeichnis Statusinformationen ab, die
   festhalten, welche Versionen schon empfangen wurden. Wir verwenden
   das Verzeichnis ``/var/db``:

   .. code:: programlisting

       *default base=/var/db

   Wenn das Verzeichnis f?r die Statusinformationen nicht existiert,
   sollten Sie es jetzt anlegen, da ``cvsup`` ohne dieses Verzeichnis
   nicht startet.

-  Verschiedene Einstellungen:

   Eine weitere Zeile sollte normalerweise in jedem ``supfile`` sein:

   .. code:: programlisting

       *default release=cvs delete use-rel-suffix compress

   Mit ``release=cvs`` wird angegeben, dass der Server das
   FreeBSD-Haupt-Repository abfragen soll, was praktisch immer der Fall
   ist (die Ausnahmen werden in diesem Text nicht diskutiert).

   ``delete`` erlaubt es CVSup, Dateien zu l?schen. Diese Option sollten
   Sie immer angeben, damit CVSup Ihren Quellbaum auch wirklich aktuell
   halten kann. CVSup l?scht nur Dateien f?r die es auch verantwortlich
   ist. Andere Dateien, die sich in einem Baum unter Kontrolle von CVSup
   befinden, werden nicht ver?ndert.

   Wenn Sie wirklich etwas ?ber das obskure ``use-rel-suffix`` erfahren
   wollen, lesen Sie bitte in der Manualpage nach, ansonsten geben Sie
   es einfach an und vergessen es.

   Wenn Sie ``compress`` angeben, werden Daten auf dem
   Kommunikationskanal komprimiert. Wenn Sie ?ber eine T1-Leitung oder
   eine schnellere Netzanbindung verf?gen, brauchen Sie diese Option
   vielleicht nicht. In allen anderen F?llen beschleunigt sie aber den
   Ablauf.

-  Zusammenfassung:

   Das vollst?ndige ``supfile`` unseres Beispiels sieht nun so aus:

   .. code:: programlisting

       *default tag=.
       *default host=cvsup99.FreeBSD.org
       *default prefix=/usr
       *default base=/var/db
       *default release=cvs delete use-rel-suffix compress

       src-all

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

A.8.3.1. Die ``refuse`` Datei
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

CVSup benutzt die Pull-Methode, das hei?t wenn sich ein Client mit einem
Server verbindet, erh?lt er eine Liste der verf?gbaren Sammlungen und
w?hlt aus diesen die herunterzuladenden Dateien aus. In der
Voreinstellung w?hlt der Client alle Dateien aus, die zu einer gegebenen
Sammlung und zu einem gegebenen Tag passen. Um nur einen Teil des Baumes
herunterzuladen, benutzen Sie die ``refuse`` Datei.

Mit einer ``refuse`` Datei k?nnen Sie bestimmte Dateien einer Sammlung
von der ?bertragung ausschlie?en. Der Ort der ``refuse`` ist
``base/sup/refuse``, wobei *``base``* in Ihrem ``supfile`` festgelegt
wurde. Wir verwenden das Verzeichnis ``/var/db``, der Ort der ``refuse``
Datei ist daher ``/var/db/sup/refuse``.

Das Format der ``refuse`` Datei ist einfach: Sie enth?lt eine Liste der
Dateien und Verzeichnisse, die Sie nicht herunterladen wollen. Zum
Beispiel:

.. code:: programlisting

    bin/
          usr.bin/

Die ``refuse`` Datei spart Anwendern von CVSup, die ?ber eine langsame
Internetanbindung verf?gen oder deren Internetverbindung zeitlich
abgerechnet wird, Zeit, da sie Dateien, die sie nicht ben?tigen, nicht
mehr herunterladen m?ssen. Weitere Informationen zu ``refuse`` Dateien
und anderen Eigenschaften von CVSup entnehmen Sie bitte der Manualpage.

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

A.8.4. Ausf?hren von CVSup
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wir k?nnen nun eine Aktualisierung mit der folgenden Kommandozeile
starten:

.. code:: screen

    # cvsup supfile

``supfile`` gibt dabei das eben erstelle ``supfile`` an. Wenn Sie X11
benutzen, wird ``cvsup`` ein GUI starten. Dr?cken Sie go und schauen Sie
zu.

Das Beispiel aktualisiert die Dateien im Verzeichnisbaum ``/usr/src``.
Sie m?ssen ``cvsup`` als ``root`` starten, damit Sie die n?tigen Rechte
haben, die Dateien zu aktualisieren. Sie sind vielleicht ein bisschen
nerv?s weil Sie das Programm zum ersten Mal anwenden und m?chten zuerst
einmal einen Testlauf durchf?hren. Legen Sie dazu ein tempor?res
Verzeichnis an und ?bergeben es auf der Kommandozeile von ``cvsup``:

.. code:: screen

    # mkdir /var/tmp/dest
    # cvsup supfile /var/tmp/dest

Aktualisierungen werden dann nur in dem angegebenen Verzeichnis
vorgenommen. CVSup untersucht die Dateien in ``/usr/src``, wird aber
keine dieser Dateien ver?ndern. Die ver?nderten Dateien finden Sie
stattdessen in ``/var/tmp/dest/usr/src``. Die Statusdateien von CVSup
werden ebenfalls nicht ge?ndert, sondern in dem angegebenen Verzeichnis
abgelegt. Wenn Sie Leseberechtigung in ``/usr/src`` haben, brauchen Sie
das Programm noch nicht einmal unter ``root`` laufen zu lassen.

Wenn Sie X11 nicht benutzen wollen oder keine GUIs m?gen, sollten Sie
``cvsup`` wie folgt aufrufen:

.. code:: screen

    # cvsup -g -L 2 supfile

``-g`` verhindert den Start des GUIs. Wenn Sie kein X11 laufen haben,
passiert das automatisch, ansonsten m?ssen Sie diesen Schalter angeben.

Mit ``-L 2`` gibt CVSup Einzelheiten zu jeder Aktualisierung aus. Die
Wortf?lle der Meldungen k?nnen Sie von ``-L 0`` bis ``-L 2`` einstellen.
In der Voreinstellung ``-L 0`` werden nur Fehlermeldungen ausgegeben.

Eine Zusammenfassung der Optionen von CVSup erhalten Sie mit
``cvsup -H``. Genauere Informationen finden Sie in der Manualpage von
CVSup.

Wenn Sie mit dem Ablauf der Aktualisierung zufrieden sind, k?nnen Sie
CVSup regelm??ig aus
`cron(8) <http://www.FreeBSD.org/cgi/man.cgi?query=cron&sektion=8>`__
ausf?hren. In diesem Fall sollten Sie nat?rlich nicht das GUI benutzen.

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

A.8.5. CVSup Sammlungen
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die CVSup Sammlungen sind hierarchisch organisiert. Es gibt wenige gro?e
Sammlungen, die in kleinere Teilsammlungen unterteilt sind. Wenn Sie
eine gro?e Sammlung beziehen, entspricht das dem Beziehen aller
Teilsammlungen. Der Hierarchie der Sammlung wird in der folgenden
Aufz?hlung durch Einr?ckungen dargestellt.

Die am h?ufigsten benutzte Sammlung ist ``src-all``.

.. raw:: html

   <div class="variablelist">

``cvs-all release=cvs``
    Das FreeBSD-Haupt-Repository einschlie?lich der
    Kryptographie-Module.

    .. raw:: html

       <div class="variablelist">

    ``distrib release=cvs``
        Dateien, die zum Verteilen und Spiegeln von FreeBSD ben?tigt
        werden.

    ``projects-all release=cvs``
        Quelltexte der verschiedenen FreeBSD-Projekte.

    ``src-all release=cvs``
        Die FreeBSD-Quellen einschlie?lich der Kryptographie-Module.

        .. raw:: html

           <div class="variablelist">

        ``src-base               release=cvs``
            Verschiedene Dateien unter ``/usr/src``.

        ``src-bin               release=cvs``
            Benutzer-Werkzeuge die im Einzelbenutzermodus gebraucht
            werden (``/usr/src/bin``).

        ``src-cddl               release=cvs``
            Werkzeuge und Bibliotheken, die der CDDL-Lizenz unterliegen
            (``/usr/src/cddl``).

        ``src-contrib               release=cvs``
            Werkzeuge und Bibliotheken, die nicht aus dem FreeBSD
            Project stammen und wenig ver?ndert ?bernommen werden.
            (``/usr/src/contrib``).

        ``src-crypto release=cvs``
            Kryptographische Werkzeuge und Bibliotheken, die nicht aus
            dem FreeBSD Project stammen und wenig ver?ndert ?bernommen
            werden. (``/usr/src/crypto``).

        ``src-eBones release=cvs``
            Kerberos und DES (``/usr/src/eBones``). Wird in aktuellen
            Releases von FreeBSD nicht benutzt.

        ``src-etc               release=cvs``
            Konfigurationsdateien des Systems (``/usr/src/etc``).

        ``src-games               release=cvs``
            Spiele (``/usr/src/games``).

        ``src-gnu               release=cvs``
            Werkzeuge, die unter der GNU Public License stehen
            (``/usr/src/gnu``).

        ``src-include               release=cvs``
            Header Dateien (``/usr/src/include``).

        ``src-kerberos5               release=cvs``
            Kerberos5 (``/usr/src/kerberos5``).

        ``src-kerberosIV               release=cvs``
            KerberosIV (``/usr/src/kerberosIV``).

        ``src-lib               release=cvs``
            Bibliotheken (``/usr/src/lib``).

        ``src-libexec               release=cvs``
            Systemprogramme, die von anderen Programmen ausgef?hrt
            werden (``/usr/src/libexec``).

        ``src-release               release=cvs``
            Dateien, die zum Erstellen eines FreeBSD Releases notwendig
            sind (``/usr/src/release``).

        ``src-rescue               release=cvs``
            Statisch gelinkte Programme zur Wiederherstellung eines
            defekten Systems. Lesen Sie dazu auch die Manualpage
            `rescue(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rescue&sektion=8>`__
            (``/usr/src/rescue``).

        ``src-sbin release=cvs``
            Werkzeuge f?r den Einzelbenutzermodus (``/usr/src/sbin``).

        ``src-secure               release=cvs``
            Kryptographische Bibliotheken und Befehle
            (``/usr/src/secure``).

        ``src-share               release=cvs``
            Dateien, die von mehreren Systemen gemeinsam benutzt werden
            k?nnen (``/usr/src/share``).

        ``src-sys               release=cvs``
            Der Kernel (``/usr/src/sys``).

        ``src-sys-crypto             release=cvs``
            Kryptographie Quellen des Kernels (``/usr/src/sys/crypto``).

        ``src-tools               release=cvs``
            Verschiedene Werkzeuge zur Pflege von FreeBSD
            (``/usr/src/tools``).

        ``src-usrbin               release=cvs``
            Benutzer-Werkzeuge (``/usr/src/usr.bin``).

        ``src-usrsbin               release=cvs``
            System-Werkzeuge (``/usr/src/usr.sbin``).

        .. raw:: html

           </div>

    .. raw:: html

       </div>

``distrib release=self``
    Die Konfigurationsdateien des CVSup Servers. Diese werden von den
    CVSup benutzt.

``gnats release=current``
    Die GNATS Datenbank, in der Problemberichte verwaltet werden.

``mail-archive release=current``
    Das Archiv der FreeBSD-Mailinglisten.

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

A.8.6. Weiterf?hrende Informationen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die CVSup FAQ und weitere Informationen ?ber CVSup finden Sie auf `The
CVSup Home Page <http://www.cvsup.org>`__.

FreeBSD spezifische Diskussionen ?ber CVSup finden auf der Mailingliste
`FreeBSD technical
discussions <http://lists.FreeBSD.org/mailman/listinfo/freebsd-hackers>`__
statt. Dort und auf der Liste `FreeBSD
announcements <http://lists.FreeBSD.org/mailman/listinfo/freebsd-announce>`__
werden neue Versionen von CVSup angek?ndigt.

Bei Fragen und Problemberichten zu CVSup lesen Sie bitte die `CVSup
FAQ <http://www.cvsup.org/faq.html#bugreports>`__.

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

A.8.7. CVSup-Server
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die folgende Aufz?hlung enth?lt `CVSup <cvsup.html>`__ Server f?r
FreeBSD:

`Hauptserver <cvsup.html#central-cvsup>`__,

(aktualisiert am: UTC)

.. raw:: html

   <div class="variablelist">

Hauptserver
    .. raw:: html

       <div class="itemizedlist">

    -  cvsup.FreeBSD.org

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

+----------------------------------+--------------------------------+---------------------------------+
| `Zur?ck <svn-mirrors.html>`__?   | `Nach oben <mirrors.html>`__   | ?\ `Weiter <cvs-tags.html>`__   |
+----------------------------------+--------------------------------+---------------------------------+
| A.7. Subversion Mirror Sites?    | `Zum Anfang <index.html>`__    | ?A.9. CVS-Tags                  |
+----------------------------------+--------------------------------+---------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
