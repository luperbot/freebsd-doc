====================
2. Ein echtes UNIX??
====================

.. raw:: html

   <div class="navheader">

2. Ein echtes UNIX??
`Zur?ck <index.html>`__?
?
?\ `Weiter <why-is-bsd-not-better-known.html>`__

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

2. Ein echtes UNIX??
--------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

BSD-Betriebssysteme sind keine Nachbauten, sondern Weiterentwicklungen
des UNIX? Betriebssystems von AT&T's Research, das als Vorfahre des
modernen UNIX? System V gilt. ?berrascht Sie diese Aussage? Wie kann das
sein, wenn AT&T seine Quellen nie als Open Source ver?ffentlicht hat?

Es stimmt, dass AT&T UNIX? kein Open Source ist. Im Sinne des Copyright
ist BSD daher eindeutig *kein* UNIX?. Andererseits f?gte AT&T aber
Quellcode von anderen Projekten in den eigenen Code ein, insbesondere
jenen der Computer Sciences Research Group (CSRG) der University of
California in Berkeley, CA. Im Jahr 1976 begann die CSRG damit, B?nder
ihrer Software zu vertreiben, die sie *Berkeley Software Distribution*
oder *BSD* nannten.

Anfangs wurden vor allem Anwendungen ver?ffentlicht. Das ?nderte sich
schlagartig, als die CSRG von der Advanced Research Projects Agency
(DARPA) den Auftrag bekam, deren Kommunikationsprotokolle (ARPANET) zu
?berarbeiten. Die neuen Protokolle wurden als *Internet Protocols*
bezeichnet, und wurden sp?ter als *TCP/IP* weltbekannt. Die erste
Implementierung dieser Protokolle erfolgte 1982 als Teil von 4.2BSD.

Im Laufe der 80er Jahre entstanden einige neue Firmen, die Workstations
vertrieben. Viele zogen es vor, UNIX? zu lizenzieren und kein eigenes
Betriebssystem zu entwickeln. Sun?Microsystems lizenzierte UNIX?,
implementierte eine Version von 4.2BSD und bezeichnete das fertige
Produkt als SunOS™. Als es AT&T gestattet wurde, UNIX? kommerziell zu
vertreiben, verkaufte AT&T eine abgespeckte Version namens System?III,
der schnell System?V folgte. Im System?V-Basissystem waren keine
Netzwerkfunktionen enthalten, daher wurden alle Implementierungen
zus?tzlich mit Software des BSD-Projekts, darunter TCP/IP sowie diverse
n?tzliche Programme wie *csh* oder *vi*. Diese Erweiterungen wurden
unter der Bezeichnung *Berkeley Extensions* zusammengefasst.

Da die BSD-B?nder AT&T-Quellcode enthielten, war eine UNIX? Lizenz
erforderlich. Als im Jahre 1990 die F?rderung der CSRG auslief,
beschlossen einige Mitglieder der Gruppe, den quelloffenen BSD-Code ohne
den propriet?ren AT&T-Code zu ver?ffentlichen. Das Ergebnis dieser
Bem?hungen war *Networking Tape 2*, besser bekannt als *Net/2*. Net/2
war aber kein komplettes Betriebssystem, da gut 20 Prozent des
Kernelcodes fehlten. William F. Jolitz, ein Mitglied der CSRG, schrieb
den fehlenden Code und ver?ffentlichte diesen Anfang 1992 als *386BSD*.
Zur gleichen Zeit gr?ndete eine andere Gruppe ehemaliger CSRG-Mitglieder
das kommerzielle Unternehmen `Berkeley Software Design
Inc. <http://www.bsdi.com/>`__ und ver?ffentlichte eine Betaversion des
Betriebssystems unter dem Namen `BSD/386 <http://www.bsdi.com>`__, die
auf den gleichen Quellen basierte. Sp?ter wurde dieses Betriebssystem in
BSD/OS umbenannt.

386BSD war niemals wirklich stabil. Daher spalteten sich 1993 zwei neue
Projekte ab: `NetBSD <http://www.NetBSD.org/>`__ sowie
`FreeBSD <../../../../index.html>`__. Beide Projekte entstanden, weil
sich 386BSD zu langsam weiterentwickelte. Die erste NetBSD-Version
entstand Anfang 1993, die erste FreeBSD-Version Ende 1993. Zu dieser
Zeit hatte sich der Quellcode aber derart ver?ndert, dass es schwer war,
ihn wieder zu verschmelzen. Zudem hatten die beiden Projekte
unterschiedliche Ziele, die dieser Artikel noch beschreiben wird. 1996
spaltete sich ein weiteres Projekt von NetBSD ab:
`OpenBSD <http://www.OpenBSD.org>`__. 2003 spaltete sich schlie?lich
`DragonFlyBSD <http://www.dragonflybsd.org/>`__ von FreeBSD ab.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------+-------------------------------+----------------------------------------------------+
| `Zur?ck <index.html>`__?    | ?                             | ?\ `Weiter <why-is-bsd-not-better-known.html>`__   |
+-----------------------------+-------------------------------+----------------------------------------------------+
| Hintergrundwissen zu BSD?   | `Zum Anfang <index.html>`__   | ?3. Warum ist BSD nicht bekannter?                 |
+-----------------------------+-------------------------------+----------------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
