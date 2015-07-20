==========================
FreeBSD 4.7-RELEASE README
==========================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD 4.7-RELEASE README
==========================

Das FreeBSD Projekt
~~~~~~~~~~~~~~~~~~~

Copyright © 2000, 2001, 2002 The FreeBSD Documentation Project

Copyright © 2002 The FreeBSD German Documentation Project

| $FreeBSD$

--------------

.. raw:: html

   </div>

    .. raw:: html

       <div class="ABSTRACT">

    Dieses Dokument enth?lt eine kurze Einf?hrung zu FreeBSD
    4.7-RELEASE. Es enth?lt einige Hinweise, wie Sie FreeBSD beziehen
    k?nnen; wie Kontakt zum FreeBSD Project aufnehmen k?nnen, sowie
    Verweise auf zus?tzliche Informationsquellen.

    .. raw:: html

       </div>

.. raw:: html

   <div class="SECT1">

--------------

1. Einf?hrung
-------------

Diese Ausgabe von FreeBSD ist eine release-Version von FreeBSD
4.7-RELEASE und repr?sentiert den aktuellen Zustand im Entwicklungszweig
4-STABLE.

.. raw:: html

   <div class="SECT2">

--------------

1.1. ?ber FreeBSD
~~~~~~~~~~~~~~~~~

FreeBSD ist ein auf 4.4 BSD Lite basierendes Betriebssystem f?r Intel,
AMD, Cyrix oder NexGen \`\`x86''-basierte PCs und Compaq (ehemals DEC)
Alpha Systeme. Versionen f?r die Plattformen IA64, PowerPC, und Sparc64
sind ebenfalls in der Entwicklung. FreeBSD unterst?tzt viele
verschiedene Ger?te und Umgebungen und f?r alle Anwendungen von der
Software-Entwicklung bis zur Anbietung von Diensten im Internet genutzt
werden.

Diese Version von FreeBSD stellt Ihnen alles zur Verf?gung, was Sie zum
Betrieb eines derartigen Systems brauchen. Dazu geh?rt der Quellcode f?r
den Kernel und alle Programme des Basissystem. Wenn Sie \`\`source''
Distribution installieren, k?nnen Sie das gesamte System mit einem
einzigen Befehl neu kompilieren. Diese Eigenschaft macht es ideal f?r
Studenten, Forscher, und interessierte Benutzer, die einfach wissen
wollen, wie das System funktioniert.

Die gro?e Sammlung von angepa?ter Software anderer Anbieter (die
\`\`Ports Collection'') macht es Ihnen leicht, ihre Lieblingtools f?r
Unix auch f?r FreeBSD zu finden und zu installieren. Jeder \`\`port''
besteht aus einer Reihe von Skripten, um eine gegebene Anwendung mit
einem einzigen Kommando herunterladen, konfigurieren, kompilieren, und
installieren zu k?nnen. Die ?ber 10,000 Ports (vom Editor ?ber
Programmiersprachen bis zu graphischen Anwendungen) machen FreeBSD zu
einer leistungsstarken und umfassenden Arbeitsumgebung, die viele
kommerzielle Unix-Varianten weit hinter sich l??t. Die meisten Ports
sind auch als vorkompilierte Packages erh?ltlich, die mit dem
Installationsprogramm einfach und schnell installiert werden k?nnen.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

1.2. Zielgruppe
~~~~~~~~~~~~~~~

Diese release von FreeBSD ist f?r alle Arten von Benutzern gedacht. Sie
wurde ausf?hrlich gepr?ft und getestet, um die gr??tm?gliche
Zuverl?ssigkeit und Betriebssicherheit garantieren zu k??nnen.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

2. Bezugsquellen f?r FreeBSD
----------------------------

FreeBSD kann auf vielen verschiedenen Wegen bezogen werden. Dieses
Kapitel konzentriert sich auf die Varianten, die f?r den Bezug auf einer
komplett neuen Version von FreeBSD gedacht sind und weniger auf die
M?glichkeit zur Aktualisierung eines bereits bestehenden Systems.

.. raw:: html

   <div class="SECT2">

--------------

2.1. CDROM und DVD
~~~~~~~~~~~~~~~~~~

FreeBSD-RELEASE Distributionen k?nnen auf CDROM oder DVD von diversen
Firmen bezogen werden. Dies ist normalerweise der bequemste Weg, wenn
Sie FreeBSD zum ersten Mal installieren, da Sie das System einfach neu
installieren k?nnen, falls das notwendig ist. Einige Distributionen
enthalten einige der optionalen \`\`Packages'' aus der FreeBSD Ports
Collection.

Eine ?bersicht ?ber die Firmen, die FreeBSD auf CDROM oder DVD
vertreiben, finden Sie im Anhang `\`\`Bezugsquellen f?r
FreeBSD'' <http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/mirrors.html>`__
des Handbuches.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

2.2. FTP
~~~~~~~~

Sie k?nnen FreeBSD und/oder die optionalen Packages mit FTP vom prim?ren
FreeBSD-Server ftp://ftp.FreeBSD.org/ und allen seinen \`\`mirrors''
beziehen.

Eine Liste von alternativen Bezugsquellen f?r FreeBSD finden Sie im
Kapitel `FTP
Server <http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/mirrors-ftp.html>`__
des Handbuchs und auf unseren http://www.freebsdmirrors.org/ Webseiten.
Wir raten Ihnen dringend, einen Mirror in der n?heren Umgebung (aus
Netzwerksicht) zu verwenden.

Zus?tzliche Mirrors sind immer willkommen. Wenden Sie sich bitte an
``<freebsd-admin@FreeBSD.org>``, wenn Sie an weiteren Informationen zu
diesem Thema interessiert sind.

Sie finden die f?r den Start der Installation notwendigen Images der
Bootdisketten und die Dateien der eigentlichen Distribution auf allen
Servern. Einige Server stellen auch die ISO-Images bereit, die Sie zur
Erzeugung einer (bootf?hige) CDROM der FreeBSD-Release ben?tigen.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

3. Kontaktinformation f?r das FreeBSD Projekt
---------------------------------------------

.. raw:: html

   <div class="SECT2">

3.1. Email und Mailinglisten
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Wenn Sie Fragen haben oder Hilfe ben?tigen, wenden Sie sich bitte an
Mailingliste `FreeBSD general
questions <http://lists.FreeBSD.org/mailman/listinfo/freebsd-questions>`__.

Wenn Sie die Entwicklung von -STABLE mitverfolgen, *m?ssen* Sie die
Mailingliste
`FreeBSD-STABLE <http://lists.FreeBSD.org/mailman/listinfo/freebsd-stable>`__
lesen. Nur so k?nnen Sie die teilweise lebensnotwendigen Informationen
?ber die aktuellen Entwicklungen und ?nderungen erhalten, die Sie f?r
den Betrieb des Systems ben?tigen.

Da FreeBSD zum gr??ten Teil von Freiwilligen und Idealisten entwickelt
wird, freuen wir uns ?ber jeden, der mit anpacken m?chte -- schon jetzt
gibt es mehr W?nsche als Zeit, um diese umzusetzen. Wenn Sie Kontakt zu
den Entwicklern suchen, um technische Angelegenheiten zu besprechen oder
um Ihre Hilfe anzubieten, wenden Sie sich bitte an die Mailingliste
`FreeBSD technical
discussions <http://lists.FreeBSD.org/mailman/listinfo/freebsd-hackers>`__.

Bitte beachten Sie, auf diesen Mailinglisten teilweise *extrem viele*
Mails erscheinen. Wenn Ihre Mailversorgung nur sehr langsam oder sehr
teuer ist, oder Sie nur an den Schlagzeilen der FreeBSD-Entwicklung
interessiert sind, d?rfte es besser sein, wenn Sie sich auf die
Mailingliste `FreeBSD
announcements <http://lists.FreeBSD.org/mailman/listinfo/freebsd-announce>`__
konzentrieren.

Alle Mailinglisten stehen f?r jeden offen, der sich f?r das jeweilige
Thema interessiert. Senden Sie einfach eine Mail an
``<majordomo@FreeBSD.org>``, die als Text nur das Schl?sselwort help in
einer Zeile enth?lt. Dadurch erhalten Sie weitergehende Informationen,
wie Sie die diversen Mailinglisten abbonieren k?nnen, wie Sie auf die
Archive zugreifen k?nnen, usw. Es gibt viele Mailinglisten, die nur mit
einem ganz bestimmten Thema befassen und hier nicht aufgef?hrt sind.
Weitergehende Informationen finden Sie im Bereich
`Mailinglisten <http://www.FreeBSD.org/support.html#mailing-list>`__ der
FreeBSD Webseite.

.. raw:: html

   <div class="IMPORTANT">

    **Wichtig:** Senden Sie *auf gar keinen Fall* eine Mail an die
    Mailinglisten, um diese zu abonnieren. Benutzen Sie f?r diesen Zweck
    die Adresse ``<majordomo@FreeBSD.org>`` .

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

3.2. Meldungen ?ber Fehler und Probleme
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Vorschl?ge, Fehlermeldungen und zus?tzlicher Sourcecode sind immer
willkommen -- bitte informieren Sie uns ?ber jedes Problem, das sie
finden. Fehlermeldungen, die sofort auch die entsprechende Korrektur
enthalten, sind nat?rlich noch willkommener.

Wenn Ihr System an das Internet angeschlossen ist, sollten Sie
`send-pr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=send-pr&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
oder das Formular auf der Webseite http://www.FreeBSD.org/send-pr.html
benutzen. Wenn Sie Ihren \`\`Problem Reports'' (PRs) auf dieser Art und
Weise absetzen, wird er automatisch archiviert und weiterverfolgt. Die
Entwickler von FreeBSD bem?hen sich, so schnell wie m?glich auf alle
gemeldeten Fehler zu reagieren. `Eine ?bersicht ?ber alle offenen
PRs <http://www.FreeBSD.org/cgi/query-pr-summary.cgi>`__ ist auf dem
Webserver von FreeBSD verf?gbar. Diese Liste ist sehr n?tzlich, wenn Sie
wissen wollen, welche m?glichen Probleme schon von anderen Benutzern
gefunden wurden.

Bitte beachten Sie, da?
`send-pr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=send-pr&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
nur ein Shell-Skript ist, da? man relativ einfach auch auf anderen
Systemen als FreeBSD verwenden kann. Wir empfehlen Ihnen dringend, diese
Variante zu verwenden. Wenn Sie allerdings aus irgendeinem Grund
`send-pr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=send-pr&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
nicht benutzen k?nnen, k?nnen Sie versuchen, Ihren Problem Report an die
Mailingliste `FreeBSD problem
reports <http://lists.FreeBSD.org/mailman/listinfo/freebsd-bugs>`__ zu
senden.

Weitere Informationen finden Sie im Dokument `\`\`Writing FreeBSD
Problem
Reports'' <http://www.FreeBSD.org/doc/en_US.ISO8859-1/articles/problem-reports/>`__
auf der Webseite von FreeBSD. Es enth?lt viele n?tzliche Tips zum
Verfassen und Versenden effektiver Fehlermeldungen.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

4. Weiterf?hrende Dokumente
---------------------------

Es gibt viele verschiedene Quellen f?r Informationen ?ber FreeBSD,
einige sind Bestandteil dieser Distribution, w?hrend andere ?ber das
Internet oder in gedruckter Form verf?gbar sind.

.. raw:: html

   <div class="SECT2">

--------------

4.1. Dokumentation zur Release
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Sie finden weitergehende ?ber diese release Distribution in anderen
Dokumenten. Diese Dokumente stehen in verschiedenen Formaten zur
Verf?gung. Die Varianten Text (``.TXT``) und HTML (``.HTM``) stehen fast
immer zur Verf?gung. Einige Distributionen stellen weitere Formate wie
PostScript (``.PS``) oder das Portable Document Format (``.PDF``) zur
Verf?gung.

-  ``README.TXT``: Sie lesen es gerade. Hier finden Sie allgemeine
   Informationen ?ber FreeBSD und ein paar allgemeine Hinweise zum Bezug
   einer Distribution.

-  ``RELNOTES.TXT``: Die begleitenden Informationen zu dieser Release
   enthalten die Neuerungen in dieser Version von FreeBSD (4.7-RELEASE)
   und die ?nderungen seit der letzten Version (FreeBSD 4.6-RELEASE).

-  ``HARDWARE.TXT``: Die Liste der unterst?tzten Hardware enth?lt eine
   ?bersicht ?ber die Ger?te, auf den FreeBSD erfolgreich getestet
   wurde.

-  ``INSTALL.TXT``: Die Anleitung zur Installation von FreeBSD von dem
   Distributions-Medium.

-  ``ERRATA.TXT``: Die Errata. Brandaktuelle Informationen, die erst
   nach dem Erscheinen dieser Version bekannt wurden, finden Sie hier.
   Diese Datei ist speziell f?r die Anwender einer Release (und nicht
   der Snapshots) von Interesse. Sie sollten diesen Text auf jeden Fall
   lesen, bevor Sie FreeBSD installieren, da er die aktuellsten
   Informationen ?ber die seit der Ver?ffentlichung gefundenen und
   behobenen Probleme enth?lt.

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** Einige dieser Dokumente (speziell ``RELNOTES.TXT``,
    ``HARDWARE.TXT``, und ``INSTALL.TXT``) enthalten Informationen, die
    nur f?r eine bestimmte Architektur gellten. Zum Beispiel enthalten
    die Release Notes f?r die Alpha keine Informationen ?ber
    i386-Systeme, und umgekehrt. Die Information, zu welcher Architektur
    ein Dokument geh?rt, steht immer am Anfang des Textes.

.. raw:: html

   </div>

Diese Dokumente finden Sie w?hrend der Installation normalerweise unter
dem Men?punkt Dokumentation. Um nach der Installation des Systems dieses
Men? zugreifen zu k?nnen, m?ssen Sie das Programm
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+4.7-RELEASE>`__
aufrufen.

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** Sie sollten auf jeden Fall die Errata zur jeweiligen
    Version lesen, bevor Sie die Installation beginnen. Dies ist der
    einzige Weg, die aktuellsten Informationen zu erhalten und sich ?ber
    eventuell nach der Installation auftretende Probleme zu informieren.
    Die zusammen mit der Ver?ffentlichung erschienene Version ist per
    Definition veraltet. Allerdings sind im Internet aktualisierte
    Versionen verf?gbar, die die \`\`aktuellen Errata'' f?r diese
    Version sind. Diese Versionen sind bei
    http://www.FreeBSD.org/releases/ und allen aktuellen Mirrors dieser
    Webseite verf?gbar.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

4.2. Onlinehilfe (Manual Pages)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Wie bei fast jedem anderen UNIX-?hnlichen System steht Ihnen auch bei
FreeBSD eine Onlinehilfe zur Verf?gung, die Sie ?ber das Kommando
`man(1) <http://www.FreeBSD.org/cgi/man.cgi?query=man&sektion=1&manpath=FreeBSD+4.7-RELEASE>`__
oder ?ber das `hypertext manual pages
gateway <http://www.FreeBSD.org/cgi/man.cgi>`__ auf dem Webserver von
FreeBSD ansprechen k?nnen. Die Onlinehilfe stellt den Benutzern von
FreeBSD Informationen zu einzelnen Befehlen und Interfaces zur
Programmierung zur Verf?gung.

In einige F?llen behandelt die Online-Hilfe spezielle Themen.
Interessante Beispiele daf?r sind
`tuning(7) <http://www.FreeBSD.org/cgi/man.cgi?query=tuning&sektion=7&manpath=FreeBSD+4.7-RELEASE>`__
(Hinweise, wie sie die Performance Ihres Systems verbessern k?nnen),
`security(7) <http://www.FreeBSD.org/cgi/man.cgi?query=security&sektion=7&manpath=FreeBSD+4.7-RELEASE>`__
(eine Einf?hrung in das Thema Sicherheit unter FreeBSD), und
`style(9) <http://www.FreeBSD.org/cgi/man.cgi?query=style&sektion=9&manpath=FreeBSD+4.7-RELEASE>`__
(die Spielregeln f?r die Kernel-Programmierung).

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT2">

--------------

4.3. B?cher und Artikel
~~~~~~~~~~~~~~~~~~~~~~~

Zwei extrem n?tzliche Sammlungen von Informationen ?ber FreeBSD, die vom
FreeBSD Project verwaltet werden, sind das FreeBSD Handbuch und der
FreeBSD FAQ. Die aktuellen Versionen des
`Handbuches <http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/>`__
und der `FAQ <http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/faq/>`__
sind immer auf der Webseite `FreeBSD
Dokumentation <http://www.FreeBSD.org/docs.html>`__ und allen Ihren
Mirror-Sites verf?gbar. Wenn Sie die Distribution ``doc`` installiert
haben, k?nnen Sie den FAQ und Handbuch mit einem Web-Browser direkt auf
Ihrem System lesen.

Es gibt eine ganze Reihe von Online verf?gbaren B?chern und Artikeln,
die vom FreeBSD Project herausgegeben werden und auf einzelne
FreeBSD-bezogene Themen genauer eingehen. Dabei wird ein sehr breites
Spektrum abgedeckt, es gibt Informationen zur effektiven Nutzung der
Mailinglisten, den parallelen Betrieb von FreeBSD und anderen
Betriebssystem, und Hinweise f?r neue Entwickler. Wie das Handbuch und
die FAQ sind auch diese Dokumente auf Webseite FreeBSD Dokumentation und
in der Distribution ``doc`` verf?gbar.

Eine Liste zus?tzlicher B?cher und Dokumentationen zu FreeBSD finden Sie
im Kapitel
`Bibliographie <http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/bibliography.html>`__
des Handbuchs. Da FreeBSD ganz klar aus der UNIX-Welt stammt, enthalten
auch andere Artikel und B?cher ?ber UNIX-Systeme n?tzliche
Informationen. Eine Auswahl dieser Dokumente finden Sie ebenfalls in der
Bibliographie.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

5. Danksagung
-------------

FreeBSD ist das Ergebnis der Arbeit vieler hundert, wenn nicht Tausender
Personen aus der ganzen Welt, die ungez?hlte Stunden investiert haben,
um diese Version m?glich zu machen. Die vollst?ndige Liste aller
Entwickler und Helfer finden Sie auf der FreeBSD-Webseite
`\`\`Beteiligte'' <http://www.FreeBSD.org/doc/en_US.ISO8859-1/articles/contributors/>`__
und allen aktuellen Mirrors dieser Webseite.

Wir m?chten uns speziell bei den vielen tausend Anwendern und Testern
aus der ganzen Welt bedanken, ohne die diese release niemals m?glich
gewesen w?re.

.. raw:: html

   </div>

.. raw:: html

   </div>

--------------

Diese Datei und andere Dokumente zu dieser Version sind bei
ftp://ftp.FreeBSD.org/\ verfuegbar.

Wenn Sie Fragen zu FreeBSD haben, lesen Sie erst die
`Dokumentation, <http://www.FreeBSD.org/docs.html>`__ bevor Sie sich an
<de-bsd-questions@de.FreeBSD.org\ > wenden.

Wenn Sie Fragen zu dieser Dokumentation haben, wenden Sie sich an
<de-bsd-translators@de.FreeBSD.org\ >.

|
