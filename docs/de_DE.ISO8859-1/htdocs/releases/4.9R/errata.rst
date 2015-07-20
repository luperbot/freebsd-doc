==========================
FreeBSD 4.9-RELEASE Errata
==========================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD 4.9-RELEASE Errata
==========================

.. raw:: html

   <div class="AUTHORGROUP">

Das FreeBSD Projekt
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

Copyright © 2000, 2001, 2002, 2003 The FreeBSD Documentation Project

Copyright © 2001, 2002, 2003 The FreeBSD German Documentation Project

| $FreeBSD$

.. raw:: html

   <div class="LEGALNOTICE">

FreeBSD ist ein eingetragenes Warenzeichen von Wind River Systems, Inc.
Dies soll sich bald ?ndern.

Intel, Celeron, EtherExpress, i386, i486, Itanium, Pentium und Xeon sind
Warenzeichen oder eingetragene Warenzeichen der Intel Corporation oder
ihrer Gesellschaften in den Vereinigten Staaten und in anderen L?ndern.

Viele Produktbezeichnungen von Herstellern und Verk?ufern sind
Warenzeichen. Soweit dem FreeBSD Project das Warenzeichen bekannt ist,
werden die in diesem Dokument vorkommenden Bezeichnungen mit dem Symbol
\`\`™'' oder dem Symbol \`\`®'' gekennzeichnet.

.. raw:: html

   </div>

--------------

.. raw:: html

   </div>

    .. raw:: html

       <div class="ABSTRACT">

    Dieses Dokument enth?lt die Errata f?r FreeBSD 4.9-RELEASE, also
    wichtige Informationen, die erst nach oder zu kurz vor der
    Ver?ffentlichung bekannt wurden und aus diesem Grund nicht in die
    dortige Dokumentation aufgenommen werden konnten. Dazu geh?hren
    Ratschl?ge zur Sicherheit sowie ?nderungen in der Software oder
    Dokumentation, die die Stabilit?t und die Nutzung beeintr?chtigen
    k?nnten. Sie sollten immer die aktuelle Version dieses Dokumentes
    lesen, bevor sie diese Version von FreeBSD installieren.

    Dieses Errata f?r FreeBSD 4.9-RELEASE wird bis zum Erscheinen von
    FreeBSD 4.9.1-RELEASE weiter aktualisiert werden.

    .. raw:: html

       </div>

.. raw:: html

   <div class="SECT1">

--------------

1. Einleitung
-------------

Dieses Errata enth?lt \`\`brandhei?e'' Informationen ?ber FreeBSD
4.9-RELEASE. Bevor Sie diese Version installieren, sollten Sie auf jeden
Fall dieses Dokument lesen, um ?ber Probleme informiert zu werden, die
erst nach der Ver?ffentlichung entdeckt (und vielleicht auch schon
behoben) wurden.

Die zusammen mit der Ver?ffentlichung erschienene Version dieses
Dokumentes (zum Beispiel die Version auf der CDROM) ist per Definition
veraltet. Allerdings sind im Internet aktualisierte Versionen verf?gbar,
die die \`\`aktuellen Errata'' f?r diese Version sind. Diese Versionen
sind bei http://www.FreeBSD.org/releases/ und allen aktuellen Mirrors
dieser Webseite verf?gbar.

Die Snapshots von FreeBSD 4-STABLE (sowohl die der Quelltexte als auch
die der ausf?hrbaren Programme) enthalten ebenfalls die zum Zeitpunkt
ihrer Ver?ffentlichung aktuelle Version dieses Dokumentes.

Die Liste der FreeBSD CERT security advisories finden Sie bei
http://www.FreeBSD.org/security/ oder
ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

2. Sicherheitshinweise
----------------------

**BIND** enth?lt eine Sicherheitl?cke, die einen Denial-of-Service
Angriff m?glich macht. Um diese L?cke zu schli?en, wurde im
Sicherheitszweig 4.9-RELEASE ein Patch des Herstellers und im
Entwicklungszweig 4-STABLE eine neue Version importiert. Weitere
Informationen finden Sie in
`FreeBSD-SA-03:19 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:19.bind.asc>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

3. Aktuelle Informationen
-------------------------

(28. Oktober 2003) Kurz vor der Ver?ffentlichung wurde die Unterst?tzung
f?r HyperThreading (HTT) auf Intel® Prozessoren ge?ndert. Wenn der
Kernel SMP unterst?tzt, unterst?tzt er automatisch auch HTT; es ist
nicht mehr notwendig, die Option HTT in die Konfigurationsdatei f?r den
angepa?ten Kernel aufzunehmen. Die zus?tzlichen logischen CPUs werden
standardm??ig so konfiguriert, da? sie zwar Interrupts abarbeiten
k?nnen, aber nicht f?r Anwenderprogramme zur Verf?gung stehen. Um die
logischen CPUs vollst?ndig zu aktivieren, mu? die
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8&manpath=FreeBSD+4.8-stable>`__
Variable machdep.hlt\_logical\_cpus von 1 auf 0 ge?ndert werden. Dies
kann bereits im Loader erfolgen, da es eine Loader-Variable mit gleichem
Namen gibt. Dieses Verhalten entspricht dem von FreeBSD 5.X.

(29. Oktober 2003) Einige der Packages auf der ersten CD ben?tigen
verschiedene Versionen des **OpenLDAP** Packages, die nicht gleichzeitig
auf einem System installiert sein k?nnen. Dadurch ist es zum Beispiel
nicht m?glich, die Packages
```x11/gnome2`` <http://www.FreeBSD.org/cgi/url.cgi?ports/x11/gnome2/pkg-descr>`__
und
```x11/kde3`` <http://www.FreeBSD.org/cgi/url.cgi?ports/x11/kde3/pkg-descr>`__
auf einem System zu installieren.

(30. Oktober 2003) F?r die korrekte Funktion der FreeBSD
Standardinstallation ist wahrscheinlich die ``crypto`` Distribution
erforderlich. Auf jeden Fall funktioniert
`pkg\_add(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_add&sektion=1&manpath=FreeBSD+4.8-stable>`__
nur, wenn es die in ``crypto`` enthaltenen Bibliotheken zur Verf?gung
hat.

(30. Oktober 2003) Es gibt einige halbwegs aktuelle i386 Systeme, deren
BIOS nicht in der Lage ist, von einer CD im Emulations-Modus des El
Torito Formats zu booten. Dadurch k?nnen diese Systeme nicht von den
FreeBSD 4.9-STABLE CDs booten. Um das Problem zu umgehen, m?ssen Sie die
Images der Bootdisketten herunterladen, von diesen booten und
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+4.8-stable>`__
starten, und dann eine CDROM-Installation durchf?hren. Zur Zeit scheint
dieses Problem aber nicht sehr weit verbreitet zu sein.

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** FreeBSD 5.X nutzt auf den Installations-CDs das El
    Torito Format ohne Emulation. Diese CDs funktionieren allerdings auf
    sehr alten i386 Systemen nicht, da diese nur den Emulations-Modus
    unterst?tzen.

.. raw:: html

   </div>

(10. November 2003) Bei der Aktualisierung des Eintrages f?r xterm in
der
`termcap(5) <http://www.FreeBSD.org/cgi/man.cgi?query=termcap&sektion=5&manpath=FreeBSD+4.8-stable>`__
Datenbank wurde unter anderem die Einstellung bs (Backspacing) entfernt.
Das Spiel
`hack(6) <http://www.FreeBSD.org/cgi/man.cgi?query=hack&sektion=6&manpath=FreeBSD+4.8-stable>`__
funktioniert braucht dieses Feature und funktioniert daher nicht mehr,
wenn es in einem Fenster mit Terminal-Typ xterm l?uft.

(10. November 2003) Das Tagged Queuing im
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+4.8-stable>`__
Treiber scheint fehlerhaft zu sein und Totalabst?rze zu produzieren.

.. raw:: html

   </div>

.. raw:: html

   </div>

--------------

Diese Datei und andere Dokumente zu dieser Version sind bei
http://snapshots.jp.FreeBSD.org/\ verfuegbar.

Wenn Sie Fragen zu FreeBSD haben, lesen Sie erst die
`Dokumentation, <http://www.FreeBSD.org/docs.html>`__ bevor Sie sich an
<de-bsd-questions@de.FreeBSD.org\ > wenden.

Alle Anwender von FreeBSD 4-STABLE sollten sich in die Mailingliste
<stable@FreeBSD.org\ > eintragen.

Wenn Sie Fragen zu dieser Dokumentation haben, wenden Sie sich an
<de-bsd-translators@de.FreeBSD.org\ >.

|
