====================================
26.5. Einem Entwicklungszweig folgen
====================================

.. raw:: html

   <div class="navheader">

26.5. Einem Entwicklungszweig folgen
`Zur?ck <updating-upgrading-documentation.html>`__?
Kapitel 26. FreeBSD aktualisieren
?\ `Weiter <synching.html>`__

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

26.5. Einem Entwicklungszweig folgen
------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD besitzt zwei Entwicklungszweige: FreeBSD-CURRENT und
FreeBSD-STABLE. Dieser Abschnitt beschreibt beide Zweige und erl?utert,
wie Sie Ihr System auf dem aktuellen Stand eines Zweiges halten. Zuerst
wird FreeBSD-CURRENT vorgestellt, dann FreeBSD-STABLE.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

26.5.1. FreeBSD-CURRENT
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Beachten Sie im Folgenden, dass FreeBSD-CURRENT die Spitze der
Entwicklung von FreeBSD ist. Benutzer von FreeBSD-CURRENT sollten ?ber
sehr gute technische F?higkeiten verf?gen und in der Lage sein,
schwierige Probleme alleine zu l?sen. Wenn FreeBSD neu f?r Sie ist,
?berlegen Sie sich genau, ob Sie FreeBSD-CURRENT benutzen wollen.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

26.5.1.1. Was ist FreeBSD-CURRENT?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD-CURRENT besteht aus den neuesten Quellen des FreeBSD-Systems. Es
enth?lt Sachen, an denen gerade gearbeitet wird, experimentelle
?nderungen und ?bergangsmechanismen, die im n?chsten offiziellen Release
der Software enthalten sein k?nnen oder nicht. Obwohl FreeBSD-CURRENT
t?glich von vielen Entwicklern gebaut wird, gibt es Zeitr?ume, in denen
sich das System nicht bauen l?sst. Diese Probleme werden so schnell wie
m?glich gel?st, aber ob Sie mit FreeBSD-CURRENT Schiffbruch erleiden
oder die gew?nschten Verbesserungen erhalten, kann von dem Zeitpunkt
abh?ngen, an dem Sie sich den Quelltext besorgt haben!

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

26.5.1.2. Wer braucht FreeBSD-CURRENT?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD-CURRENT wird haupts?chlich f?r 3 Interessengruppen zur Verf?gung
gestellt:

.. raw:: html

   <div class="orderedlist">

#. Entwickler, die an einem Teil des Quellbaums arbeiten und daher ?ber
   die aktuellen Quellen verf?gen m?ssen.

#. Tester, die bereit sind, Zeit in das L?sen von Problemen zu
   investieren und sicherstellen, dass FreeBSD-CURRENT so stabil wie
   m?glich bleibt. Weiterhin Leute, die Vorschl?ge zu ?nderungen oder
   der generellen Entwicklung von FreeBSD machen und Patches
   bereitstellen, um diese Vorschl?ge zu realisieren.

#. F?r Leute, die die Entwicklung im Auge behalten wollen, oder die
   Quellen zu Referenzzwecken (zum Beispiel darin lesen, aber nicht
   verwenden) benutzen wollen. Auch diese Gruppe macht Vorschl?ge oder
   steuert Quellcode bei.

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

26.5.1.3. Was FreeBSD-CURRENT *nicht* ist!
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="orderedlist">

#. Der schnellste Weg, neue Sachen vor dem offiziellen Release
   auszuprobieren. Bedenken Sie, dass der erste, der die neuen Sachen
   ausprobiert, auch der erste ist, der die neuen Fehler findet.

#. Ein schneller Weg, um an Fehlerbehebungen (engl. *bug fixes*) zu
   kommen. Jede Version von FreeBSD-CURRENT f?hrt mit gleicher
   Wahrscheinlichkeit neue Fehler ein, mit der sie alte behebt.

#. In irgendeiner Form „offiziell unterst?tzt“. Wir tun unser Bestes, um
   Leuten aus den drei „legitimen“ Benutzergruppen von FreeBSD-CURRENT
   zu helfen, aber wir *haben einfach nicht die Zeit*, technische
   Unterst?tzung zu erbringen. Das kommt nicht daher, dass wir
   kleinliche, gemeine Leute sind, die anderen nicht helfen wollen (wenn
   wir das w?ren, w?rden wir FreeBSD nicht machen), wir k?nnen einfach
   nicht jeden Tag Hunderte Nachrichten beantworten *und* an FreeBSD
   arbeiten! Vor die Wahl gestellt, FreeBSD zu verbessern oder jede
   Menge Fragen zu experimentellem Code zu beantworten, haben sich die
   Entwickler f?r ersteres entschieden.

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

26.5.1.4. Benutzen von FreeBSD-CURRENT
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="orderedlist">

#. Es ist *essentiell*, die Mailinglisten
   `freebsd-current <http://lists.FreeBSD.org/mailman/listinfo/freebsd-current>`__
   und
   `svn-src-head <http://lists.FreeBSD.org/mailman/listinfo/svn-src-head>`__\ 
   zu lesen. Wenn Sie
   *`freebsd-current <http://lists.FreeBSD.org/mailman/listinfo/freebsd-current>`__*
   nicht lesen, verpassen Sie die Kommentare anderer ?ber den momentanen
   Zustand des Systems und rennen demzufolge in viele bekannte Probleme,
   die schon gel?st sind. Noch kritischer ist, dass Sie wichtige
   Bekanntmachungen verpassen, die erhebliche Auswirkungen auf die
   Stabilit?t Ihres Systems haben k?nnen.

   In der
   `svn-src-head <http://lists.FreeBSD.org/mailman/listinfo/svn-src-head>`__
   Mailingliste sehen Sie zu jeder ?nderung das Commit-Log, das
   Informationen zu m?glichen Seiteneffekten enth?lt.

   Um diese Listen zu abonnieren (oder zu lesen) besuchen Sie bitte die
   Seite http://lists.FreeBSD.org/mailman/listinfo. Weitere
   Informationen erhalten Sie, wenn Sie dort auf die gew?nschte Liste
   klicken. Wenn Sie daran interessiert sind, die ?nderungen am gesamten
   Quellbaum mit zu verfolgen, schlagen wir vor, die Liste
   `svn-src-all <http://lists.FreeBSD.org/mailman/listinfo/svn-src-all>`__
   zu abonnieren.

#. Beschaffen Sie sich die Quellen von einem
   `FreeBSD-Spiegel <mirrors.html>`__. Sie haben dazu zwei
   M?glichkeiten:

   .. raw:: html

      <div class="orderedlist">

   #. Benutzen Sie das Programm `cvsup <cvsup.html>`__\  mit der Datei
      ``standard-supfile`` aus dem Verzeichnis
      ``/usr/share/examples/cvsup``. Dies ist die empfohlene Methode, da
      Sie die ganzen Quellen nur einmal herunterladen und danach nur
      noch ?nderungen beziehen. Viele lassen ``cvsup`` aus ``cron``
      heraus laufen, um ihre Quellen automatisch auf Stand zu bringen.
      Sie m?ssen die obige Sup-Datei anpassen und
      `cvsup <cvsup.html>`__\  in Ihrer Umgebung konfigurieren.

      .. raw:: html

         <div class="note" xmlns="">

      Anmerkung:
      ~~~~~~~~~~

      Die ``standard-supfile``-Beispieldatei ist daf?r vorgesehen, einen
      bestimmten Sicherheitszweig zu verfolgen und nicht
      FreeBSD-CURRENT. Sie m?ssen diese Datei bearbeiten und die
      folgende Zeile:

      .. code:: programlisting

          *default release=cvs tag=RELENG_X_Y

      durch diese ersetzen:

      .. code:: programlisting

          *default release=cvs tag=.

      Lesen Sie den Abschnitt ?ber `CVS Tags <cvs-tags.html>`__ im
      Handbuch, um eine genaue Beschreibung von verwendbaren Tags zu
      erhalten.

      .. raw:: html

         </div>

   #. CTM kommt in Frage, wenn Sie ?ber eine schlechte
      Internet-Anbindung (hoher Preis oder nur E-Mail Zugriff) verf?gen.
      Der Umgang mit CTM ist allerdings recht m?hsam und Sie k?nnen
      besch?digte Dateien erhalten. Daher wird es selten benutzt, was
      wiederum dazu f?hrt, dass es ?ber l?ngere Zeit nicht funktioniert.
      Wir empfehlen jedem mit einem 9600?bps oder schnellerem Modem,
      CVSup zu benutzen.

   .. raw:: html

      </div>

#. Wenn Sie die Quellen einsetzen und nicht nur darin lesen wollen,
   besorgen Sie sich bitte die *kompletten* Quellen von FreeBSD-CURRENT
   und nicht nur ausgesuchte Teile. Der Grund hierf?r ist, dass die
   verschiedenen Teile der Quellen voneinander abh?ngen. Es ist ziemlich
   sicher, dass Sie in Schwierigkeiten geraten, wenn Sie versuchen, nur
   einen Teil der Quellen zu ?bersetzen.

   Sehen Sie sich das ``Makefile`` in ``/usr/src`` genau an, bevor Sie
   FreeBSD-CURRENT ?bersetzen. Wenn Sie FreeBSD das erste Mal
   aktualisieren, sollten Sie sowohl `einen Kernel als auch das System
   neu installieren <makeworld.html>`__. Lesen Sie bitte die
   Mailingliste
   `FreeBSD-CURRENT <http://lists.FreeBSD.org/mailman/listinfo/freebsd-current>`__
   und ``/usr/src/UPDATING``, um ?ber ?nderungen im
   Installationsverfahren, die manchmal vor der Einf?hrung eines neuen
   Releases notwendig sind, informiert zu sein.

#. Seien Sie aktiv! Wenn Sie FreeBSD-CURRENT laufen lassen, wollen wir
   wissen, was Sie dar?ber denken, besonders wenn Sie
   Verbesserungsvorschl?ge oder Fehlerbehebungen haben.
   Verbesserungsvorschl?ge, die Code enthalten, werden ?brigens
   begeistert entgegengenommen.

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

26.5.2. FreeBSD-STABLE
~~~~~~~~~~~~~~~~~~~~~~

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

26.5.2.1. Was ist FreeBSD-STABLE?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD-STABLE ist der Entwicklungszweig, auf dem Releases erstellt
werden. Dieser Zweig ?ndert sich langsamer als FreeBSD-CURRENT und alle
?nderungen hier sollten zuvor in FreeBSD-CURRENT ausgetestet sein.
Beachten Sie, dass dies *immer noch* ein Entwicklungszweig ist und daher
zu jedem Zeitpunkt die Quellen von FreeBSD-STABLE verwendbar sein k?nnen
oder nicht. FreeBSD-STABLE ist Teil des Entwicklungsprozesses und nicht
f?r Endanwender gedacht.

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

26.5.2.2. Wer braucht FreeBSD-STABLE?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn Sie den FreeBSD-Entwicklungsprozess, besonders im Hinblick auf das
n?chste Release, verfolgen oder dazu beitragen wollen, sollten Sie
erw?gen, FreeBSD-STABLE zu benutzen.

Auch wenn sicherheitsrelevante Fehlerbehebungen in den FreeBSD-STABLE
Zweig einflie?en, m?ssen Sie deswegen noch lange nicht FreeBSD-STABLE
verfolgen. Jeder der FreeBSD Sicherheitshinweise beschreibt f?r jedes
betroffene Release, `:sup:`[15]` <#ftn.idp85506768>`__ wie sie einen
sicherheitsrelevanten Fehler beheben. Wenn Sie den Entwicklungszweig aus
Sicherheitsgr?nden verfolgen wollen, bedenken Sie, dass Sie neben
Fehlerbehebungen auch eine Vielzahl unerw?nschter ?nderungen erhalten
werden.

Obwohl wir versuchen sicherzustellen, dass der FreeBSD-STABLE Zweig sich
jederzeit ?bersetzen l?sst und l?uft, k?nnen wir daf?r keine Garantie
?bernehmen. Auch wenn Neuentwicklungen in FreeBSD-CURRENT stattfinden,
ist es jedoch so, dass mehr Leute FreeBSD-STABLE benutzen als
FreeBSD-CURRENT und es daher unvermeidlich ist, dass Fehler und
Grenzf?lle erst in FreeBSD-STABLE auffallen.

Aus diesen Gr?nden empfehlen wir Ihnen *nicht*, blindlings
FreeBSD-STABLE zu benutzen. Es ist wichtig, dass Sie FreeBSD-STABLE
zuerst sorgf?ltig in einer Testumgebung austesten, bevor Sie Ihre
Produktion auf FreeBSD-STABLE migrieren.

Wenn Sie dies nicht leisten k?nnen, empfehlen wir Ihnen, das aktuelle
FreeBSD-Release zu verwenden. Benutzen Sie dann den bin?ren
Update-Mechanismus, um auf neue Releases zu migrieren.

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

26.5.2.3. Benutzen von FreeBSD-STABLE
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="orderedlist">

#. Lesen Sie Mailingliste
   `freebsd-stable <http://lists.FreeBSD.org/mailman/listinfo/freebsd-stable>`__,
   damit Sie ?ber Abh?ngigkeiten beim Bau von FreeBSD-STABLE und Sachen,
   die besondere Aufmerksamkeit erfordern, informiert sind. Umstrittene
   Fehlerbehebungen oder ?nderungen werden von den Entwicklern auf
   dieser Liste bekannt gegeben. Dies erlaubt es den Benutzern, Einw?nde
   gegen die vorgeschlagenen ?nderungen vorzubringen.

   Abonnieren Sie die passende SVN-Liste f?r den jeweiligen Branch, den
   Sie verfolgen. Wenn Sie beispielsweise den Zweig 7-STABLE verfolgen,
   lesen Sie die
   `svn-src-stable-7 <http://lists.FreeBSD.org/mailman/listinfo/svn-src-stable-7>`__.
   Dort sehen Sie zu jeder ?nderung das Commit-Log, das Informationen zu
   m?glichen Seiteneffekten enth?lt.

   Um diese Listen oder andere Listen zu abonnieren besuchen Sie bitte
   die Seite http://lists.FreeBSD.org/mailman/listinfo. Weitere
   Informationen erhalten Sie, wenn Sie dort auf die gew?nschte Liste
   klicken. Wenn Sie daran interessiert sind, ?nderungen am gesamten
   Quellbaum zu verfolgen, dann empfehlen wir, dass Sie
   `svn-src-all <http://lists.FreeBSD.org/mailman/listinfo/svn-src-all>`__
   abonnieren.

#. Wenn Sie ein neues System installieren und dazu einen der monatlich
   aus FreeBSD-STABLE erzeugten Snapshots verwenden wollen, sollten Sie
   zuerst die `Snapshot Website <../../../../../snapshots/>`__ auf
   aktuelle Informationen ?berpr?fen. Alternativ k?nnen Sie auch das
   neueste FreeBSD-STABLE-Release von den `Spiegeln <mirrors.html>`__
   beziehen und Ihr System nach den folgenden Anweisungen aktualisieren.

   Wenn Sie schon ein ?lteres Release von FreeBSD und das System mit dem
   Quellcode aktualisieren wollen, benutzen Sie einen der
   `FreeBSD-Spiegel <mirrors.html>`__. Sie haben dazu zwei
   M?glichkeiten:

   .. raw:: html

      <div class="orderedlist">

   #. Benutzen Sie das Programm `cvsup <cvsup.html>`__\  mit der Datei
      ``stable-supfile``\  aus dem Verzeichnis
      ``/usr/share/examples/cvsup``. Dies ist die empfohlene Methode, da
      Sie die ganzen Quellen nur einmal herunterladen und danach nur
      noch ?nderungen beziehen. Viele lassen ``cvsup`` aus ``cron``
      heraus laufen, um ihre Quellen automatisch auf Stand zu bringen.
      Sie m?ssen das oben erw?hnte ``supfile`` anpassen und
      `cvsup <cvsup.html>`__ konfigurieren.

   #. Benutzen Sie CTM. Wenn Sie ?ber keine schnelle und billige
      Internet-Anbindung verf?gen, sollten Sie diese Methode in Betracht
      ziehen.

   .. raw:: html

      </div>

#. Benutzen Sie ``cvsup`` oder ``ftp``, wenn Sie schnellen Zugriff auf
   die Quellen brauchen und die Bandbreite keine Rolle spielt,
   andernfalls benutzen Sie CTM.

#. Bevor Sie FreeBSD-STABLE ?bersetzen, sollten Sie sich das
   ``Makefile`` in ``/usr/src`` genau anschauen. Wenn Sie FreeBSD das
   erste Mal aktualisieren, sollten Sie sowohl `einen Kernel als auch
   das System neu installieren <makeworld.html>`__. Lesen Sie bitte die
   Mailingliste
   `FreeBSD-STABLE <http://lists.FreeBSD.org/mailman/listinfo/freebsd-stable>`__
   und ``/usr/src/UPDATING``, um ?ber ?nderungen im
   Installationsverfahren, die manchmal vor der Einf?hrung eines neuen
   Releases notwendig sind, informiert zu sein.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="footnotes">

--------------

.. raw:: html

   <div id="ftn.idp85506768" class="footnote">

`:sup:`[15]` <#idp85506768>`__\ Das stimmt nicht ganz. Obwohl wir alte
FreeBSD Releases f?r einige Jahre unterst?tzen, k?nnen wir sie nicht
ewig unterst?tzen. Eine vollst?ndige Beschreibung der Sicherheitspolitik
f?r alte FreeBSD Releases entnehmen Sie bitte
`http://www.FreeBSD.org/security/ <../../../../security/>`__.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------------------------+-------------------------------------------+--------------------------------------+
| `Zur?ck <updating-upgrading-documentation.html>`__?   | `Nach oben <updating-upgrading.html>`__   | ?\ `Weiter <synching.html>`__        |
+-------------------------------------------------------+-------------------------------------------+--------------------------------------+
| 26.4. Aktualisieren der Dokumentationssammlung?       | `Zum Anfang <index.html>`__               | ?26.6. Synchronisation der Quellen   |
+-------------------------------------------------------+-------------------------------------------+--------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
