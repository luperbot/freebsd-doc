==========================
FreeBSD 4.7-RELEASE Errata
==========================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD 4.7-RELEASE Errata
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

--------------

.. raw:: html

   </div>

    .. raw:: html

       <div class="ABSTRACT">

    Dieses Dokument enth?lt die Errata f?r FreeBSD 4.7-RELEASE, also
    wichtige Informationen, die erst nach der Ver?ffentlichung bekannt
    wurden. Dazu geh?hren Ratschl?ge zur Sicherheit sowie ?nderungen in
    der Software oder Dokumentation, die die Stabilit?t und die Nutzung
    beeintr?chtigen k?nnten. Sie sollten immer die aktuelle Version
    dieses Dokumentes lesen, bevor sie diese Version von FreeBSD
    installieren.

    Dieses Errata f?r FreeBSD 4.7-RELEASE wird bis zum Erscheinen von
    FreeBSD 4.9-RELEASE weiter aktualsiert werden.

    .. raw:: html

       </div>

.. raw:: html

   <div class="SECT1">

--------------

1. Einleitung
-------------

Dieses Errata enth?lt \`\`brandhei?e'' Informationen ?ber FreeBSD
4.7-RELEASE. Bevor Sie diese Version installieren, sollten Sie auf jeden
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

Durch Puffer-?berl?ufe in kadmind(8) und k5admin war es m?glich, den
Administrations-Server zur Ausf?rhung beliebiger Programme zu
mi?brauchen. Informationen, wie dieser Fehler umgangen bzw. behoben
werden kann, finden Sie im Sicherheitshinweis
`FreeBSD-SA-02:40 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:40.kadmind.asc>`__.

Durch Fehler in
`smrsh(8) <http://www.FreeBSD.org/cgi/man.cgi?query=smrsh&sektion=8&manpath=FreeBSD+4.8-RELEASE>`__
konnten Benutzer die Einschr?nkugen auf bestimmte Programme umgehen.
Diese Fehler wurden zwar schon in FreeBSD 4.7-RELEASE behoben, da der
entsprechende Sicherheitshinweis
(`FreeBSD-SA-02:41 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:41.smrsh.asc>`__)
aber erst nach der Ver?ffentlichung dieser Version herausgegeben wurde,
wurde dieses Problem nicht in den Release Notes erw?hnt.

In
`resolver(3) <http://www.FreeBSD.org/cgi/man.cgi?query=resolver&sektion=3&manpath=FreeBSD+4.8-RELEASE>`__
wurden Puffer-?berl?ufe beseitigt, die zu Programm-Fehlern f?hren
konnten. Diese ?nderung wurde nicht in den Release Notes aufgef?hrt,
weil der entsprechende Sicherheitshinweis
(`FreeBSD-SA-02:42 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:42.resolv.asc>`__)
erst nach der Ver?ffentlichung dieser Version herausgegeben wurde.

Die bei FreeBSD 4.7-RELEASE mitgelieferte **BIND**-Version enth?lt
mehrere schwerwiegende Fehler, die die Sicherheit des Systems
beeintr?chtigen k?nnen. Weitergehende Informationen und M?glichkeiten
zur Umgehung bzw. Beseitigung der Fehler finden Sie im
Sicherheitshinweis
`FreeBSD-SA-02:43 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:43.bind.asc>`__.

In der Systemfunktion
`fpathconf(2) <http://www.FreeBSD.org/cgi/man.cgi?query=fpathconf&sektion=2&manpath=FreeBSD+4.8-RELEASE>`__
wurde ein Fehler (Verlust von Datei-Handles) beseitigt, durch den ein
lokaler Benutzer das System zum Absturz bringen oder h?here Privilegien
erhalten konnte. Weitere Informationen finden Sie in
`FreeBSD-SA-02:44 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-02:44.filedesc.asc>`__.

Ein ?ber das Netzwerk ausnutzbarer Fehler in **CVS** k?nnte dazu f?hren,
da? ein Angreifer beliebige Programme auf dem CVS Server ausf?hren kann.
Weitere Informationen finden Sie in
`FreeBSD-SA-03:01 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:01.cvs.asc>`__.

Durch Auswertung der Antwortzeiten von **OpenSSL** w?re es einem
Angreifer mit sehr viel Rechenleistung m?glich gewesen, unter bestimmten
Umst?nden den Klartext der ?bermittelten Daten zu erhalten. Dieser
Fehler wurde in FreeBSD 4.8-RELEASE durch die neue **OpenSSL** Version
0.9.7 behoben. Auf den f?r Sicherheitsprobleme unterst?tzten
Entwicklungszweigen wurde der Fehler durch die neue **OpenSSL** Version
0.9.6i behoben. Weitere Informationen finden Sie in
`FreeBSD-SA-03:02 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:02.openssl.asc>`__.

Es ist theoretisch m?glich, da? ein Angreifer den geheimen Schl?ssel
ermittelt, der von der Erweiterung \`\`syncookies'' genutzt wird.
Dadurch sinkt deren Effektivit?t beim Schutz vor TCP SYN Flood
Denial-of-Service Angriffen. Hinweise, wie sie das Problem umgehen
k?nnen und weitere Informationen finden Sie in
`FreeBSD-SA-03:03 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:03.syncookies.asc>`__.

Durch einen Buffer-?berlaufen in den von **sendmail** genutzten Routinen
zum Parsen des Headers war es einen Angreifer m?glich, eine speziell
konstruierte Nachricht an
`sendmail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sendmail&sektion=8&manpath=FreeBSD+4.8-RELEASE>`__
zu senden und so beliebige Programme ausf?hren zu lassen. Diese
Programme verf?gten ?ber die Rechte des Benutzer, unter dessen Kennung
`sendmail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sendmail&sektion=8&manpath=FreeBSD+4.8-RELEASE>`__
lief, also typischerweise ``root``. Weitere Informationen und Verweise
auf Patches finden Sie in
`FreeBSD-SA-03:04 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:04.sendmail.asc>`__.

Durch einen Puffer-?berlauf im XDR Kodierer/Dekodierer war es einem
Angreifer m?lich, den Service zum Absturz zu bringen. Informationen, wie
Sie den Fehler beheben, finden Sie in
`FreeBSD-SA-03:05 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:05.xdr.asc>`__.

**OpenSSL** enth?lt zwei Schwachstellen, die erst vor kurzer Zeit
bekanntgemacht wurden. Informationen, wie Sie die Probleme umgehen
k?nnen und weitere Informationen finden Sie in
`FreeBSD-SA-03:06 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-03:06.openssl.asc>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

3. Aktuelle Informationen
-------------------------

Da gegen Ende des Release-Zyklus f?r FreeBSD 4.7-RELEASE Bedenken wegen
der Lizenz des Treibers
`matcd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=matcd&sektion=4&manpath=FreeBSD+4.8-RELEASE>`__
aufkamen, mu?te dieser entfernt werden. An diesem Problem wird zur Zeit
gearbeitet und es ist denkbar, da? der Treiber in einer sp?teren Version
von FreeBSD wieder zur Verf?gung stehen wird.

Die Distribution ``srelease`` enth?lt im Verzeichnis
``release/sysinstall`` \*.o Dateien f?r
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8&manpath=FreeBSD+4.8-RELEASE>`__.
Diese Dateien werden bei der Erstellung der Release generiert, wurden
aber aus noch unbekannten Gr?nden nicht aus den Dateien f?r die
Distribution entfernt. Sie sind aber harmlos.

Die im 4.7-RELEASE Package Set enthaltenen Packages
```databases/rdfdb`` <http://www.FreeBSD.org/cgi/url.cgi?ports/databases/rdfdb/pkg-descr>`__
und
```mail/ssmtp`` <http://www.FreeBSD.org/cgi/url.cgi?ports/mail/ssmtp/pkg-descr>`__
k?nnen nicht korrekt installiert werden. Um diesen Fehler zu umgehen,
sollten Sie die beiden Packages ?ber die Ports Collection compilieren
und installieren.

Es kann bei der Benutzung des bei 4.7-RELEASE mitgelieferten Packages
```net/gnomeicu`` <http://www.FreeBSD.org/cgi/url.cgi?ports/net/gnomeicu/pkg-descr>`__
zu Problemen kommen, weil es keinen Hinweis auf seine Abh?ngigkeit vom
Package
```net/gnet`` <http://www.FreeBSD.org/cgi/url.cgi?ports/net/gnet/pkg-descr>`__
enth?lt. Um diesen Fehler zu umgeben, m?ssen Sie lediglich
```net/gnet`` <http://www.FreeBSD.org/cgi/url.cgi?ports/net/gnet/pkg-descr>`__
als Package oder ?ber die Ports Collection installieren; nach
M?glichkeit vor der Installation von
```net/gnomeicu`` <http://www.FreeBSD.org/cgi/url.cgi?ports/net/gnomeicu/pkg-descr>`__.

In den Release Notes f?r FreeBSD 4.7-RELEASE stand ein Hinweis, da? die
von
`xargs(1) <http://www.FreeBSD.org/cgi/man.cgi?query=xargs&sektion=1&manpath=FreeBSD+4.8-RELEASE>`__
verstandene Option -J nicht mehr verwendet werden sollte, weil sie in
einer sp?teren Version entfernt werden soll. Diese Angabe ist falsch, es
gibt keine Pl?ne, diese Option zu entfernen.

In der Virtual Hosting-Funktionalit?t von
`ftpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ftpd&sektion=8&manpath=FreeBSD+4.8-RELEASE>`__
wurde ein Fehler entdeckt, der nur auftritt, wenn die IP-Adresse eines
virtuellen Systems in ``/etc/ftphosts`` in einem Hostnamen aufgel?st
werden kann. In diesem Fall st?rzt der Dæmon mit SIGSEGV (Signal 11) an,
wenn er durch
`inetd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=inetd&sektion=8&manpath=FreeBSD+4.8-RELEASE>`__
gestartet wird; wird er normal gestartet, kann es zu unvorhersagbaren
Abst?rzen kommen. Der Fehler wurde in FreeBSD 4.8-RELEASE behoben.

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

Alle Anwender von FreeBSD 4-STABLE sollten sich in die Mailingliste
<stable@FreeBSD.org\ > eintragen.

Wenn Sie Fragen zu dieser Dokumentation haben, wenden Sie sich an
<de-bsd-translators@de.FreeBSD.org\ >.

|
