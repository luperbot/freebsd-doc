==========================
FreeBSD 5.3-RELEASE Errata
==========================

.. raw:: html

   <div class="ARTICLE">

.. raw:: html

   <div class="TITLEPAGE">

FreeBSD 5.3-RELEASE Errata
==========================

.. raw:: html

   <div class="AUTHORGROUP">

Das FreeBSD Projekt
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

Copyright © 2000, 2001, 2002, 2003, 2004, 2005 The FreeBSD Documentation
Project

Copyright © 2001, 2002, 2003, 2004, 2005 The FreeBSD German
Documentation Project

| $FreeBSD$

.. raw:: html

   <div class="LEGALNOTICE">

FreeBSD ist ein eingetragenes Warenzeichen der FreeBSD Foundation.

Intel, Celeron, EtherExpress, i386, i486, Itanium, Pentium und Xeon sind
Warenzeichen oder eingetragene Warenzeichen der Intel Corporation oder
ihrer Gesellschaften in den Vereinigten Staaten und in anderen L?ndern.

Sparc, Sparc64, SPARCEngine und UltraSPARC sind Warenzeichen von SPARC
International, Inc in den Vereinigten Staaten und in anderen L?ndern.
Produkte, die das Warenzeichen SPARC tragen, basieren auf einer von Sun
Microsystems, Inc. entwickelten Architektur.

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

    Dieses Dokument enth?lt die Errata f?r FreeBSD 5.3-RELEASE also
    wichtige Informationen, die kurz vor bzw. erst nach der
    Ver?ffentlichung bekannt wurden. Dazu geh?ren Ratschl?ge zur
    Sicherheit sowie ?nderungen in der Software oder Dokumentation,
    welche die Stabilit?t und die Nutzung beeintr?chtigen k?nnten. Sie
    sollten immer die aktuelle Version dieses Dokumentes lesen, bevor
    sie diese Version von FreeBSD installieren.

    Dieses Dokument enth?lt auch die Errata f?r FreeBSD 5.3-RELEASE,
    eine \`\`point release'', die rund einen Monat nach FreeBSD
    5.3-RELEASE erschien. Wenn nichts anderes angegeben ist, gelten alle
    in diesem Dokument enthaltenen Errata sowohl f?r 5.3-RELEASE als
    auch f?r 5.3-RELEASE.

    Diese Errata f?r FreeBSD 5.3-RELEASE werden bis zum Erscheinen von
    FreeBSD 5.4-RELEASE weiter aktualisiert werden.

    .. raw:: html

       </div>

.. raw:: html

   <div class="SECT1">

--------------

1. Einleitung
-------------

Diese Errata enthalten \`\`brandhei?e'' Informationen ?ber
FreeBSD 5.3-RELEASE. Bevor Sie diese Version installieren, sollten Sie
auf jeden Fall dieses Dokument lesen, um ?ber Probleme informiert zu
werden, die erst nach der Ver?ffentlichung entdeckt (und vielleicht auch
schon behoben) wurden.

Die zusammen mit der Ver?ffentlichung erschienene Version dieses
Dokumentes (zum Beispiel die Version auf der CDROM) ist per Definition
veraltet. Allerdings sind im Internet aktualisierte Versionen verf?gbar,
die die \`\`aktuellen Errata'' f?r diese Version sind. Diese Versionen
sind bei http://www.FreeBSD.org/releases/ und allen aktuellen Mirrors
dieser Webseite verf?gbar.

Die Snapshots von FreeBSD 5-STABLE (sowohl die der Quelltexte als auch
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

(1. Dezember 2004) Ein Fehler in
`procfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=procfs&sektion=5&manpath=FreeBSD+5.3-stable>`__
und
`linprocfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=linprocfs&sektion=5&manpath=FreeBSD+5.3-stable>`__
wurde behoben. Ein b?swilliger lokal angemeldeter Benutzer konnte die
Verf?gbarkeit des Systems durch Panics einschr?nken (Denial of Service)
oder Teile des Kernelspeichers lesen. Weiteres entnehmen Sie bitte dem
Sicherheitshinweis
`FreeBSD-SA-04:17 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-04:17.procfs.asc>`__.

(18. November 2004) Ein Fehler im Werkzeug
`fetch(1) <http://www.FreeBSD.org/cgi/man.cgi?query=fetch&sektion=1&manpath=FreeBSD+5.3-stable>`__
erlaubt es b?sartigen HTTP-Servern, Speicherbereiche des Clients zu
?berschreiben. Der Fehler wurde behoben; weiteres entnehmen Sie bitte
dem Sicherheitshinweis
`FreeBSD-SA-04:16 <ftp://ftp.FreeBSD.org/pub/FreeBSD/CERT/advisories/FreeBSD-SA-04:16.fetch.asc>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

3. Bekannte Probleme
--------------------

(31. Oktober 2004) Unter hoher Last ist die Leistung der Treiber
`re(4) <http://www.FreeBSD.org/cgi/man.cgi?query=re&sektion=4&manpath=FreeBSD+5.3-stable>`__
und
`em(4) <http://www.FreeBSD.org/cgi/man.cgi?query=em&sektion=4&manpath=FreeBSD+5.3-stable>`__
manchmal sehr schlecht. Insbesondere gibt es Berichte, nach denen sich
der
`em(4) <http://www.FreeBSD.org/cgi/man.cgi?query=em&sektion=4&manpath=FreeBSD+5.3-stable>`__-Treiber
auf einem IBM ThinkPad T40 unter hoher Last aufh?ngt.

(31. Oktober 2004) Es gibt Berichte nach denen sich der
`sk(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sk&sektion=4&manpath=FreeBSD+5.3-stable>`__-Treiber
unter hoher Last aufh?ngt. Insbesondere trifft dies auf die integrierten
Netzwerkkarten von ASUStek Hauptplatinen zu. Sie k?nnen das Problem
umgehen, indem Sie das Netzwerkinterface deaktivieren und dann wieder
aktivieren oder das System neu starten.

(31. Oktober 2004) Das Werkzeug
`burncd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=burncd&sektion=8&manpath=FreeBSD+5.3-stable>`__
funktioniert, verh?lt sich allerdings auf einigen Systemen merkw?rdig.
Beobachtete Symptome sind, da?
`burncd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=burncd&sektion=8&manpath=FreeBSD+5.3-stable>`__
anscheinend h?ngt, obwohl die Aktion beendet wurde oder der
Fortschrittsindikator nicht den richtigen Wert anzeigt. Umgehungen sind:

-  Nach dem Brennen einer CD entnehmen Sie das Medium und legen das
   Medium erneut ein.

-  Dr?cken Sie **Ctrl**-**C** wenn sich
   `burncd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=burncd&sektion=8&manpath=FreeBSD+5.3-stable>`__
   anscheinend aufgehangen hat, die Zugriffs-LED aber keine Aktivit?t
   mehr anzeigt.

(31. Oktober 2004) Wenn Sie in den Regeln von
`pf(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pf&sektion=4&manpath=FreeBSD+5.3-stable>`__
und
`ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4&manpath=FreeBSD+5.3-stable>`__
Benutzer oder Gruppen benutzen, mu? die Loader-Variable debug.mpsafenet
auf 0 gesetzt werden (in der Voreinstellung hat sie den Wert 1).
Beispiele f?r betroffene Regeln:

`ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4&manpath=FreeBSD+5.3-stable>`__:

.. code:: PROGRAMLISTING

    count ip from any to 192.168.2.1 uid root

`pf(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pf&sektion=4&manpath=FreeBSD+5.3-stable>`__:

.. code:: PROGRAMLISTING

    block log quick proto { tcp, udp } all user root

Um debug.mpsafenet bei jedem Systemstart auf 0 zu setzen, erg?nzen Sie
die Datei ``/boot/loader.conf`` um die folgende Zeile:

.. code:: PROGRAMLISTING

    debug.mpsafenet=0

Betroffen sind die Filter-Parameter group und user von
`pf(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pf&sektion=4&manpath=FreeBSD+5.3-stable>`__
und die Regeloptionen gid, jail und uid von
`ipfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=4&manpath=FreeBSD+5.3-stable>`__.
Wenn debug.mpsafenet auf 1 gesetzt ist, kann das System wegen eines
Lock-Order-Reversals in der Socket-Schicht h?ngen. Weitere Einzelheiten
entnehmen Sie bitte den Hilfeseiten
`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8&manpath=FreeBSD+5.3-stable>`__
und
`pf.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=pf.conf&sektion=5&manpath=FreeBSD+5.3-stable>`__.

(31. Oktober 2004, aktualisiert am 12. Movember 2004) Das
`vinum(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vinum&sektion=4&manpath=FreeBSD+5.3-stable>`__-Subsystem
funktioniert unter 5.3, kann aber eine Panic beim Systemstart
verursachen. Als Umgehung f?gen Sie vinum\_load="YES" in die Datei
``/boot/loader.conf`` ein.

Alternativ k?nnen Sie auch das neue auf
`geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4&manpath=FreeBSD+5.3-stable>`__-beruhende
`vinum(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vinum&sektion=4&manpath=FreeBSD+5.3-stable>`__-Subsystem
benutzen. Um das Subsystem beim Systemstart zu aktivieren, f?gen Sie
geom\_vinum\_load="YES" in die Datei ``/boot/loader.conf`` ein.
Entfernen Sie zudem in der Datei ``/etc/rc.conf`` den Eintrag
start\_vinum="YES" wenn er existiert.

Das auf
`geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4&manpath=FreeBSD+5.3-stable>`__-beruhende
`vinum(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vinum&sektion=4&manpath=FreeBSD+5.3-stable>`__-Subsystem
ist weitestgehend kompatibel mit dem alten System. Allerdings werden
seltene Konfigurationen, wie mehrere Vinum-Laufwerke auf einer Platte,
nicht unterst?tzt. Mit dem auf
`geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4&manpath=FreeBSD+5.3-stable>`__-beruhenden
Subsystem mu? das neue Steuerprogramm ``gvinum``, dem einige Funktionen
noch fehlen, benutzt werden.

(31. Oktober 2004) Die Anzeige von ``netstat -m`` kann auf
Mehrprozessorsystemen (SMP) falsch sein, wenn debug.mpsafenet auf 1 (die
Voreinstellung) gesetzt ist. Dies ist ein Fehler in den
Statistik-Routinen, eine Race-Condition bei den Z?hlern, aber kein
Speicherloch (*memory leak*).

(31. Oktober 2004, aktualisiert am 5. November 2004) Wenn Sie
FreeBSD 5.3 auf einem i386- oder amd64-System installieren und eine
USB-Tastatur benutzen, funktioniert die Tastatur nicht mehr, wenn der
Kernel startet, da der Kernel immer von einer PS/2-Tastatur ausgeht.
Umgehen Sie das Problem, indem Sie im Men? des Boot-Loaders \`\`Escape
to loader prompt'' ausw?hlen. Geben Sie dann folgende Zeilen ein:

.. code:: SCREEN

    set hint.atkbd.0.flags="0x1"
    boot

.. raw:: html

   <div class="NOTE">

    **Anmerkung:** Wenn Sie die Startdisketten benutzen, ist dieser Wert
    voreingestellt.

.. raw:: html

   </div>

Nach der Installation tragen Sie die nachstehende Zeile in die Datei
``/boot/loader.conf`` ein:

.. code:: PROGRAMLISTING

    hint.atkbd.0.flags="0x1"

(1. November 2004) Der in den Release-Notes beschriebene ULE-Scheduler
wurde vollst?ndig deaktiviert, da er nicht stabil l?uft.

(1. November 2004)
`top(1) <http://www.FreeBSD.org/cgi/man.cgi?query=top&sektion=1&manpath=FreeBSD+5.3-stable>`__
zeigt vielleicht keinen CPU-Verbrauch f?r mit der Bibliothek
**libpthread** gebundene Programme an. F?r gegen **libthr** gebundene
Programme wird die richtige Statistik angezeigt.

(1. November 2004) ATA RAID funktioniert in diesem Release nicht mit
CMD649 oder SiI0680 ATA-Controllern. Wird einer dieser Controller mit
dem Treiber
`ata(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ata&sektion=4&manpath=FreeBSD+5.3-stable>`__
(ataraid) unter 5.3 verwendet, so k?nnen unter 5.2 oder fr?heren
Releases erstellte RAID-Konfigurationen zerst?rt werden.

(3. November 2004) Unter FreeBSD/i386 und FreeBSD/amd64 wurde die
SMP-Unterst?tzung im ``GENERIC``-Kernel deaktiviert, da ein Kernel f?r
Mehrprozessorsysteme (SMP) die Leistungsf?higkeit von
Einprozessorsystemen beeintr?chtigen kann. F?r Mehrprozessorsysteme
wurde die Kernelkonfigurationsdatei ``SMP`` hinzugef?gt. Weiteres zum
Bau eines angepassten Kernels finden Sie unter der folgenden URL:
http://www.FreeBSD.org/doc/de_DE.ISO8859-1/books/handbook/kernelconfig.html.

(4. November 2004) Das Werkzeug
`tar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tar&sektion=1&manpath=FreeBSD+5.3-stable>`__
(auch
`bsdtar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=bsdtar&sektion=1&manpath=FreeBSD+5.3-stable>`__
genannt) erkennt das Ende eines Speichermediums (beispielsweise eines
Bands oder einer Diskette) nicht, wenn die Option -f verwendet wird.
Alternativ benutzen Sie bitte
`gtar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=gtar&sektion=1&manpath=FreeBSD+5.3-stable>`__
(**GNU tar**).

(9. November 2004) Das auf
`geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4&manpath=FreeBSD+5.3-stable>`__-beruhende
`vinum(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vinum&sektion=4&manpath=FreeBSD+5.3-stable>`__-Subsystem
beherrscht kein RAID5 auf Einprozessorsystemen. Andere Konfigurationen
als RAID5, wie RAID1, sollten funktionieren. Dieser Fehler wurde auf dem
Zweig RELENG\_5 behoben.

(9. November 2004) Der FreeBSD 5.3-RELEASE Migrationsleitfaden sollte
erw?hnen, da? die zu **BIND 8** geh?renden Dateien
``/usr/sbin/nslookup`` und ``/usr/sbin/nsupdate`` bei einer
Aktualisierung mit dem Quellcode ebenfalls zu entfernen sind.

(9. November 2004) In den Release-Notes zu 5.3-RELEASE fehlt, da? der
auf alten Systemen ?bersetze Port
```net/mpd`` <http://www.FreeBSD.org/cgi/url.cgi?ports/net/mpd/pkg-descr>`__
unter 5.3-RELEASE neu ?bersetzt werden mu?.

(10. November 2004) Die Release-Notes zu 5.3-RELEASE h?tten klar sagen
m?ssen, da? Ports und Pakete, die vor 5.3-RELEASE gebaut wurden und mit
POSIX Thread-Biliotheken (**libc\_r** oder **libkse**) gebunden wurden,
zur Laufzeit den Fehler \`\`Spinlock called when not threaded.''
erzeugen k?nnen. Dies passiert, wenn ein Programm verschiedene
Thread-Bibliotheken verwendet. Typischerweise verwenden ?ltere Ports die
Bibliothek **libc\_r**, neue Ports die Bibliothek **libpthread**.
?bersetzen Sie entweder die Ports neu oder erg?nzen Sie die
erforderlichen Zeilen in der Datei ``/etc/libmap.conf``. Weiteres
entnehmen Sie bitte den Eintr?gen 20040303 und 20040130 der Datei
``/usr/src/UPDATING``.

(12. November 2004) Der Treiber
`em(4) <http://www.FreeBSD.org/cgi/man.cgi?query=em&sektion=4&manpath=FreeBSD+5.3-stable>`__
verh?lt sich falsch, wenn gleichzeitig VLANs und der Promiscuous-Modus
verwendet werden. Eine Fehlerbehebung wird gerade getestet und sp?ter in
den 5.3-Fehlerbehebungszweig eingebracht.

.. raw:: html

   </div>

.. raw:: html

   <div class="SECT1">

--------------

4. Aktuelle Informationen
-------------------------

Zur Zeit gibt es keine weiteren Informationen.

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

Alle Anwender von FreeBSD 5-STABLE sollten sich in die Mailingliste
<stable@FreeBSD.org\ > eintragen.

Wenn Sie Fragen zu dieser Dokumentation haben, wenden Sie sich an
<de-bsd-translators@de.FreeBSD.org\ >.
