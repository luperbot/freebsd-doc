==================
FreeBSD Sicherheit
==================

.. raw:: html

   <div id="containerwrap">

.. raw:: html

   <div id="container">

`Skip site navigation <#content>`__ (1) `Skip section
navigation <#contentwrap>`__ (2)

.. raw:: html

   <div id="headercontainer">

.. raw:: html

   <div id="header">

Header und Logo
---------------

.. raw:: html

   <div id="headerlogoleft">

|FreeBSD|

.. raw:: html

   </div>

.. raw:: html

   <div id="headerlogoright">

Externe Links
-------------

.. raw:: html

   <div id="searchnav">

.. raw:: html

   </div>

.. raw:: html

   <div id="search">

.. raw:: html

   <div>

Suche
-----

.. raw:: html

   <div>

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div id="menu">

-  `Startseite <../>`__

-  `?ber FreeBSD <../about.html>`__

   -  `F?r Einsteiger <../projects/newbies.html>`__
   -  `Eigenschaften <../features.html>`__
   -  `Advocacy <../../advocacy/>`__
   -  `Marketing <../../marketing/>`__
   -  `Privacy Policy <../../privacy.html>`__

-  `Bezugsquellen <../where.html>`__

   -  `Release Information <../releases/>`__
   -  `Release Engineering <../../releng/>`__

-  `Dokumentation <../docs.html>`__

   -  `FAQ <../../doc/de_DE.ISO8859-1/books/faq/>`__
   -  `Handbuch <../../doc/de_DE.ISO8859-1/books/handbook/>`__
   -  `Porter-Handbuch <../../doc/de_DE.ISO8859-1/books/porters-handbook>`__
   -  `Entwickler-Handbuch <../../doc/de_DE.ISO8859-1/books/developers-handbook>`__
   -  `Manualpages <//www.FreeBSD.org/cgi/man.cgi>`__

-  `Community <../community.html>`__

   -  `Mailinglisten <../community/mailinglists.html>`__
   -  `Forum <http://forums.freebsd.org>`__
   -  `User Groups <../../usergroups.html>`__
   -  `Events <../../events/events.html>`__

-  `Entwicklung <../../projects/index.html>`__

   -  `Projektideen <http://wiki.FreeBSD.org/IdeasPage>`__
   -  `SVN-Repository <http://svnweb.FreeBSD.org>`__
   -  `Perforce-Repository <http://p4web.FreeBSD.org>`__

-  `Hilfe <../support.html>`__

   -  `Kommerzieller Support <../../commercial/commercial.html>`__
   -  `Sicherheit <../../security/>`__
   -  `Problemberichte <//www.FreeBSD.org/cgi/query-pr-summary.cgi>`__
   -  `Problembericht erstellen <../send-pr.html>`__

-  `Foundation <http://www.freebsdfoundation.org/>`__

   -  `Geldspende <http://www.freebsdfoundation.org/donate/>`__
   -  `Hardwarespende <../../donations/>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div id="content">

.. raw:: html

   <div id="sidewrap">

.. raw:: html

   <div id="sidenav">

Section Navigation
------------------

-  `Hilfe <../support.html>`__
-  `Anbieter <../../commercial/>`__

   -  `Software <../../commercial/software_bycat.html>`__
   -  `Hardware <../../commercial/hardware.html>`__
   -  `Beratung <../../commercial/consult_bycat.html>`__
   -  `Internet Service Provider <../../commercial/isp.html>`__
   -  `Verschiedenes <../../commercial/misc.html>`__

-  `Sicherheit <../../security/index.html>`__

   -  `Advisories <../../security/advisories.html>`__
   -  `Errata Notices <../../security/notices.html>`__

-  `Fehlerberichte <../support/bugreports.html>`__

   -  `Einreichen <../send-pr.html>`__

-  `Internet-Ressourcen <../support/webresources.html>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div id="contentwrap">

FreeBSD Sicherheit
==================

Einf?hrung
----------

Diese Webseite gibt Einsteigern und erfahrenen Benutzern Hilfestellungen
zum Thema Sicherheit. Bei FreeBSD wird Sicherheit gro? geschrieben: Wir
arbeiten st?ndig daran, das Betriebssystem so sicher wie m?glich zu
machen.

Inhalt
------

-  `Sicherheitsprobleme melden <#how>`__
-  `Der FreeBSD Security-Officer <#sec>`__
-  `Umgang mit Informationen <#pol>`__
-  `Unterst?tzte FreeBSD-Versionen <#sup>`__
-  `Nicht mehr unterst?tzte FreeBSD-Versionen <#unsup>`__

Weitere Ressourcen
------------------

-  `Charter des Security Officers und des Security
   Teams <charter.html>`__
-  `Liste der FreeBSD
   Sicherheitshinweise <../../security/advisories.html>`__
-  `Liste der FreeBSD Fehler-Hinweise (Errata
   Notices) <../../security/notices.html>`__
-  `FreeBSD-Sicherheitshinweise
   verstehen <../../doc/de_DE.ISO8859-1/books/handbook/security-advisories.html>`__

Sicherheitsprobleme melden
--------------------------

Melden Sie Sicherheitsprobleme in FreeBSD direkt an das
`Security-Team <mailto:secteam@FreeBSD.org>`__ oder, falls eine h?here
Vertraulichkeit erforderlich ist, PGP-verschl?sselt an das
`Security-Officer-Team <mailto:security-officer@FreeBSD.org>`__
(verwenden Sie dazu den ?ffentlichen `PGP-Schl?ssel des Security
Officers <../../security/so_public_key.asc>`__). Wenn Sie ein Problem
melden, geben Sie bitte folgende Informationen an:

-  Eine Beschreibung des Sicherheitsproblems,
-  welche FreeBSD-Versionen betroffen sind,
-  wie das Problem umgangen werden kann und
-  wenn m?glich, reichen Sie bitte auch eine Fehlerbehebung ein.

Der Security-Officer oder ein Mitglied des Security-Officer-Teams wird
Sie ansprechen, nachdem Sie ein Problem gemeldet haben.

Spam-Filter
~~~~~~~~~~~

Aufgrund des hohen Spam-Aufkommen durchlaufen alle an die Hauptadresse
des Security-Teams gerichteten E-Mails einen Spam-Filter. K?nnen Sie den
FreeBSD Security Officer oder das FreeBSD Security Team nicht erreichen,
weil Ihre E-Mail vom Spam-Filter verworfen wird (oder falls Sie
vermuten, dass dies der Fall ist), so senden Sie Ihre E-Mail bitte an
die Adresse ``security-officer-XXXX@FreeBSD.org``, wobei Sie *XXXX*
durch ``3432`` ersetzen. Beachten Sie, dass diese Adresse regelm??ig
ge?ndert wird. Alle E-Mails, die Sie an diese Adresse senden, werden an
das FreeBSD Security Officer Team weitergeleitet.

Der FreeBSD Security-Officer und das Security-Officer-Team
----------------------------------------------------------

Damit Sicherheitsprobleme schnell bearbeitet werden, wird die E-Mail an
das Security-Officer Alias an drei Personen ausgeliefert: den
Security-Officer, den Deputy-Security-Officer und ein Mitglied des
Core-Teams. Zurzeit werden E-Mails an
`<security-officer@FreeBSD.org> <mailto:security-officer@FreeBSD.org>`__
an die folgenden Personen geliefert:

+---------------------------------------------------------------------------+-----------------------------------------------------------+
| Simon L. B. Nielsen `<simon@FreeBSD.org> <mailto:simon@FreeBSD.org>`__    | Security Officier                                         |
+---------------------------------------------------------------------------+-----------------------------------------------------------+
| Colin Percival `<cperciva@FreeBSD.org> <mailto:cperciva@FreeBSD.org>`__   | Security Officer Emeritus                                 |
+---------------------------------------------------------------------------+-----------------------------------------------------------+
| Robert Watson `<rwatson@FreeBSD.org> <mailto:rwatson@FreeBSD.org>`__      | Release-Engineering,                                      |
|                                                                           |  TrustedBSD-Project, Experte f?r Sicherheitsarchitektur   |
+---------------------------------------------------------------------------+-----------------------------------------------------------+

Der Security-Officer wird vom `FreeBSD Security
Team <../administration.html#t-secteam>`__
(`<secteam@FreeBSD.org> <mailto:secteam@FreeBSD.org>`__), einer von ihm
ausgew?hlten Gruppe von Committern, unterst?tzt.

Umgang mit Informationen
------------------------

Generell ver?ffentlicht der Security-Officer nach einer angemessenen
Zeit alle Informationen ?ber ein Sicherheitsproblem. Die Zeitspanne
erlaubt eine sichere Analyse und die Behebung des Sicherheitsproblems
und dient auch zum Testen der Korrektur sowie der Koordination mit
anderen Betroffenen.

Der Security-Officer *wird* einen oder mehrere der Administratoren des
FreeBSD-Clusters ?ber Sicherheitsprobleme informieren, die Ressourcen
des FreeBSD Projects bedrohen.

Der Security-Officer kann weitere FreeBSD-Entwickler oder externe
Entwickler hinzuziehen, wenn dies zur Beurteilung oder L?sung des
Sicherheitsproblems notwendig ist. Ein diskretes Vorgehen verhindert die
unn?tige Verbreitung des Sicherheitsproblems. Alle hinzugezogenen
Experten handeln entsprechend den Richtlinien des Security-Officers. In
der Vergangenheit wurden Experten wegen ihrer immensen Erfahrungen mit
komplexen Komponenten des Systems, wie dem FFS, dem VM-System und dem
Netzwerkstack, hinzugezogen.

Wenn gerade ein Release erstellt wird, kann der FreeBSD Release-Engineer
ebenfalls ?ber das Sicherheitsproblem und dessen Ausma?e unterrichtet
werden. Damit k?nnen fundierte Entscheidungen ?ber den Ablauf der
Release-Erstellung und die Auswirkungen der Sicherheitsprobleme auf das
kommende Release getroffen werden. Auf Anfrage gibt der Security-Officer
nur die Existenz des Sicherheitsproblems und dessen Schwere an den
Release-Engineer weiter.

Der Security-Officer arbeitet eng mit anderen Organisationen zusammen.
Dazu z?hlen Dritthersteller, die Quellcode von FreeBSD benutzen
(OpenBSD, NetBSD, DragonFlyBSD, Apple und andere Hersteller, die
Software auf Basis von FreeBSD vertreiben, sowie die
Linux-Vendor-Security Liste) und Organisationen, die
Sicherheitsproblemen und Sicherheitsvorf?llen nachgehen, beispielsweise
das CERT. Oft haben Sicherheitsprobleme Auswirkungen, die ?ber FreeBSD
hinausgehen. Sie k?nnen auch (vielleicht weniger h?ufig) gro?e Teile des
Internets betreffen. Unter diesen Umst?nden wird der Security-Officer
andere Organisationen ?ber das Sicherheitsproblem informieren wollen.
Wenn Sie das nicht w?nschen, vermerken Sie das bitte explizit beim
Einreichen eines Sicherheitsproblems.

Besondere Anforderungen an den Umgang mit den eingereichten Information
m?ssen ausdr?cklich angegeben werden.

Wenn die Ver?ffentlichung des Sicherheitsproblems mit dem Einsender
und/oder anderen Lieferanten abgestimmt werden soll, so muss dies
ausdr?cklich beim Einreichen des Problems angegeben werden. Ist dies
nicht vermerkt, legt der Security-Officer einen Zeitplan f?r die
Ver?ffentlichung des Problems fest. Der Zeitplan ber?cksichtigt die
m?glichst schnelle Ver?ffentlichung und die zum Testen von L?sungen
ben?tigte Zeit. Wenn das Problem schon in ?ffentlichen Foren (wie
Bugtraq) diskutiert wird und ausgenutzt wird, kann der Security-Officer
einen anderen als den vorgeschlagenen Zeitplan verwenden. Dies dient dem
maximalen Schutz der Benutzergemeinde.

Eingesendete Sicherheitsprobleme k?nnen mit PGP gesch?tzt werden. Auf
Wunsch werden die Antworten ebenfalls mit PGP gesch?tzt.

Unterst?tzte FreeBSD-Versionen
------------------------------

Der FreeBSD-Security-Officer gibt Sicherheitshinweise f?r verschiedene
FreeBSD-Entwicklungszweige heraus: Die *-STABLE-Zweige* und die
*Sicherheits-Zweige*. F?r den *-CURRENT-Zweig* werden keine
Sicherheitshinweise herausgegeben.

-  Die -STABLE-Zweige haben Namen wie ``RELENG_7``. Auf diesen Zweigen
   erstellte Versionen tragen Namen wie ``FreeBSD 7.0-STABLE``.

-  Jedes FreeBSD-Release besitzt einen Sicherheits-Zweig. Die Tags der
   Sicherheits-Zweige haben Namen wie ``RELENG_7_0``. Die daraus
   gebauten FreeBSD-Versionen tragen Namen wie
   ``FreeBSD 7.0-RELEASE-p1``.

Sicherheitshinweise f?r die FreeBSD-Ports-Collection werden auf der
Seite `FreeBSD VuXML <http://vuxml.FreeBSD.org/>`__ ver?ffentlicht.

Jeder Zweig wird vom Security-Officer nur f?r eine begrenzte Zeit
gewartet. Die Zweige werden in Klassen eingeteilt, die den
Wartungszeitraum bestimmen:

Early-Adopter
    Releases aus dem -CURRENT-Zweig werden f?r mindestens 6?Monate nach
    Erscheinen des Releases gewartet.
normal
    Releases aus einem -STABLE-Zweig werden f?r mindestens 12?Monate
    nach Erscheinen des Releases gewartet. Dieser Zeitraum wird
    gegebenfalls verl?ngert, um sicherzustellen, dass ein neues normales
    Release mindestens 3 Monate verf?gbar ist, bevor die Unterst?tzung
    f?r das alte normale Release ausl?uft.
erweitert
    Ausgew?hlte Releases (in der Regel jedes zweite Release sowie
    zus?tzlich das letzte Release eines -STABLE-Zweiges) werden f?r
    mindestens 24?Monate nach Erscheinen des Releases gewartet. Dieser
    Zeitraum wird gegebenfalls verl?ngert, um sicherzustellen, dass ein
    neues erweitertes Release mindestens 3 Monate verf?gbar ist, bevor
    die Unterst?tzung f?r das alte erweiterte Release ausl?uft.

Die Einteilung und Wartungsenden der momentan unterst?tzten Releases
finden Sie in der folgenden Tabelle. Die Spalte *Wartungsende* gibt den
fr?hest m?glichen Zeitpunkt an, an dem ein Zweig aus der Wartung l?uft.
Beachten Sie, dass die Zeitr?ume verl?ngert werden k?nnen, aber nur
besondere Umst?nde dazu f?hren, dass ein Zweig vorzeitig aus der Wartung
genommen wird.

+----------------+---------------+-------------+--------------------+-----------------------------+
| Zweig          | Release       | Klasse      | ver?ffentlicht     | Wartungsende                |
+================+===============+=============+====================+=============================+
| RELENG\_7      | n/a           | n/a         | n/a                | 28. Februar 2013            |
+----------------+---------------+-------------+--------------------+-----------------------------+
| RELENG\_7\_4   | 7.4-RELEASE   | erweitert   | 24. Februar 2011   | 28. Februar 2013            |
+----------------+---------------+-------------+--------------------+-----------------------------+
| RELENG\_8      | n/a           | n/a         | n/a                | letztes Release + 2 Jahre   |
+----------------+---------------+-------------+--------------------+-----------------------------+
| RELENG\_8\_3   | 8.3-RELEASE   | erweitert   | 18. April 2012     | 30. April 2014              |
+----------------+---------------+-------------+--------------------+-----------------------------+
| RELENG\_9      | n/a           | n/a         | n/a                | letztes Release + 2 Jahre   |
+----------------+---------------+-------------+--------------------+-----------------------------+
| RELENG\_9\_0   | 9.0-RELEASE   | normal      | 10. Januar 2012    | 31. Januar 2013             |
+----------------+---------------+-------------+--------------------+-----------------------------+

?ltere Releases werden nicht mehr gepflegt. Benutzer solcher Releases
sollten dringend auf eine oben aufgef?hrte unterst?tzte Release
aktualisieren.

Die Hinweise werden an die folgenden FreeBSD-Mailinglisten versendet:

-  FreeBSD-security-notifications@FreeBSD.org
-  FreeBSD-security@FreeBSD.org
-  FreeBSD-announce@FreeBSD.org

Eine Liste aller bisher ver?ffentlichten Sicherheitshinweise findet sich
auf der Seite `FreeBSD Security
Advisories <../../security/advisories.html>`__.

Die Hinweise werden immer mit dem
`PGP-Schl?ssel <../../security/so_public_key.asc>`__ des
FreeBSD-Security-Officers signiert und gemeinsam mit den zugeh?rigen
Patches auf dem Server http://security.FreeBSD.org/ in den
Unterverzeichnissen
`advisories <http://security.FreeBSD.org/advisories/>`__ sowie
`patches <http://security.FreeBSD.org/patches/>`__ archiviert.

Nicht mehr unterst?tzte FreeBSD-Versionen
-----------------------------------------

Die folgenden Versionen werden nicht mehr unterst?tzt. Die folgende
Auflistung dient daher nur Informationszwecken.

+-----------------+----------------+-------------+---------------------+---------------------+
| Zweig           | Release        | Klasse      | ver?ffentlicht      | Wartungsende        |
+=================+================+=============+=====================+=====================+
| RELENG\_4       | n/a            | n/a         | n/a                 | 31. Januar 2007     |
+-----------------+----------------+-------------+---------------------+---------------------+
| RELENG\_4\_11   | 4.11-RELEASE   | Erweitert   | 25. Januar 2005     | 31. Januar 2007     |
+-----------------+----------------+-------------+---------------------+---------------------+
| RELENG\_5       | n/a            | n/a         | n/a                 | 31. Mai 2008        |
+-----------------+----------------+-------------+---------------------+---------------------+
| RELENG\_5\_3    | 5.3-RELEASE    | Erweitert   | 6. November 2004    | 31. Oktober 2006    |
+-----------------+----------------+-------------+---------------------+---------------------+
| RELENG\_5\_4    | 5.4-RELEASE    | Normal      | 9. Mai 2005         | 31. Oktober 2006    |
+-----------------+----------------+-------------+---------------------+---------------------+
| RELENG\_5\_5    | 5.5-RELEASE    | Erweitert   | 25. Mai 2006        | 31. Mai 2008        |
+-----------------+----------------+-------------+---------------------+---------------------+
| RELENG\_6       | n/a            | n/a         | n/a                 | 30. November 2010   |
+-----------------+----------------+-------------+---------------------+---------------------+
| RELENG\_6\_0    | 6.0-RELEASE    | Normal      | 4. November 2005    | 31. Januar 2007     |
+-----------------+----------------+-------------+---------------------+---------------------+
| RELENG\_6\_1    | 6.1-RELEASE    | Erweitert   | 9. Mai 2006         | 31. Mai 2008        |
+-----------------+----------------+-------------+---------------------+---------------------+
| RELENG\_6\_2    | 6.2-RELEASE    | Normal      | 15. Januar 2007     | 31. Mai 2008        |
+-----------------+----------------+-------------+---------------------+---------------------+
| RELENG\_6\_3    | 6.3-RELEASE    | Erweitert   | 18. Januar 2008     | 31. Januar 2010     |
+-----------------+----------------+-------------+---------------------+---------------------+
| RELENG\_6\_4    | 6.4-RELEASE    | Erweitert   | 28. November 2008   | 30. November 2010   |
+-----------------+----------------+-------------+---------------------+---------------------+
| RELENG\_7\_0    | 7.0-RELEASE    | Normal      | 27. Februar 2008    | 30. April 2009      |
+-----------------+----------------+-------------+---------------------+---------------------+
| RELENG\_7\_1    | 7.1-RELEASE    | Erweitert   | 04. Januar 2009     | 28. Februar 2011    |
+-----------------+----------------+-------------+---------------------+---------------------+
| RELENG\_7\_2    | 7.2-RELEASE    | Normal      | 4. Mai 2009         | 30. Juni 2010       |
+-----------------+----------------+-------------+---------------------+---------------------+
| RELENG\_7\_3    | 7.3-RELEASE    | erweitert   | 23. M?rz 2010       | 31. M?rz 2012       |
+-----------------+----------------+-------------+---------------------+---------------------+
| RELENG\_8\_0    | 8.0-RELEASE    | Normal      | 25. November 2009   | 30. November 2010   |
+-----------------+----------------+-------------+---------------------+---------------------+
| RELENG\_8\_1    | 8.1-RELEASE    | erweitert   | 23. Juli 2010       | 31. Juli 2012       |
+-----------------+----------------+-------------+---------------------+---------------------+
| RELENG\_8\_2    | 8.2-RELEASE    | normal      | 24. Februar 2011    | 31. Juli 2012       |
+-----------------+----------------+-------------+---------------------+---------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div id="footer">

`Sitemap <../../search/index-site.html>`__ \| `Legal
Notices <../../copyright/>`__ \| ? 1995–2015 The FreeBSD Project. Alle
Rechte vorbehalten.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. |FreeBSD| image:: ../../layout/images/logo-red.png
   :target: ..
