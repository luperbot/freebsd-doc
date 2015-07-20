==================================================
FreeBSD Documentation Project: Beitr?ge einreichen
==================================================

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

-  `Dokumentation <../docs.html>`__
-  `FAQ <../../doc/de_DE.ISO8859-1/books/faq/>`__
-  `Handbuch <../../doc/de_DE.ISO8859-1/books/handbook/>`__
-  `Manual-Pages (Online) <//www.FreeBSD.org/cgi/man.cgi>`__
-  `B?cher und Artikel (Online) <../docs/books.html>`__
-  `Publikationen <../../publish.html>`__
-  `Internet-Ressourcen <../docs/webresources.html>`__
-  `F?r Einsteiger <../projects/newbies.html>`__
-  `Documentation Project <../docproj/>`__
-  `German Documentation
   Project <https://people.freebsd.org/~jkois/FreeBSDde/de/>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div id="contentwrap">

FreeBSD Documentation Project: Beitr?ge einreichen
==================================================

Ich habe eine neue Anleitung geschrieben. Wie kann ich diese einreichen?
------------------------------------------------------------------------

Danke, dass Sie unsere Dokumentation erweitern wollen.

Sie m?ssen Ihre Dokumentation dem Documentation Project zur Verf?gung
stellen, damit Ihr Beitrag gepr?ft werden kann. Dazu hinterlegen Sie das
Dokument beispielsweise auf einem FTP- oder Webserver.

Danach schicken Sie eine E-Mail an die Mailingliste ``FreeBSD-doc``, in
der Sie Ihren Beitrag kurz beschreiben und vor allem mitteilen, wo Sie
ihn hinterlegt habt. Au?erdem sollten Sie die Mitglieder des FreeBSD
Documentation Projects um die Pr?fung Ihres Beitrags bitten.

Ist es Ihnen nicht m?glich, Ihren Beitrag auf einem Server zu
hinterlegen, k?nnen Sie ihn auch direkt an die Mailingliste
``FreeBSD-doc`` schicken. Denken Sie aber daran, dass Ihre E-Mail in
diesem Fall nur "normalen" Text enthalten darf.

Falls Ihr Beitrag auch f?r andere Mailinglisten interessant ist, sollte
Sie Ihre E-Mail als Kopie auch an andere Mailinglisten schicken und um
Kommentare bitten. Handelt es sich bei Ihrem Beitrag etwa um eine
Anleitung zur Aktualisierung des Quellcodes mit CVSup, so ist dies auch
f?r die Leser der Mailinglisten ``FreeBSD-current`` und
``FreeBSD-stable`` interessant.

Nachdem Ihr Beitrag gepr?ft wurde und Sie eventuelle
Verbesserungsvorschl?ge in Ihr Dokument aufgenommen haben, k?nnen Sie
Ihren Beitrag einreichen.

Dazu verpacken Sie Ihr Dokument in ein tar-Archiv. Besteht Ihr Dokument
beispielsweise aus den drei Dateien ``eins``, ``zwei``, und ``drei``,
die alle in das gemeinsame tar-Archiv ``doc.tar`` aufgenommen werden
sollen, verwenden Sie folgenden Befehl:

::

        % tar cf doc.tar eins zwei drei
        

Danach komprimieren Sie das tar-Archiv:

::

        % gzip -9 doc.tar
        

Als Ergebnis erhalten Sie die komprimierte Datei ``doc.tar.gz``.

Als letzten Schritt der Vorbereitung kodieren Sie diese Datei noch,
damit sie von allen E-Mail-Programmen korrekt erkannt und verarbeitet
wird:

::

        % uuencode doc.tar.gz doc.tar.gz > doc.uue
        

Nun k?nnen Sie das FreeBSD Documentation Project ?ber Ihren Beitrag
informieren. Der korrekte Weg daf?r ist der Einsatz von **send-pr**, das
auf Ihrem System bereits installiert sein sollte. Alternativ k?nnen Sie
auch das `Internetformular zum Einreichen von
Problemberichten <../send-pr.html>`__ verwenden.

Nur so kann sichergestellt werden, dass Ihr Beitrag auch korrekt erfasst
wird. Wenn Sie einen Problembericht (PR) einreichen, erh?lt dieser eine
eindeutige Nummer. Ein Committer wird diesen PR ?bernehmen und Ihrem
Beitrag weiterbearbeiten. Weitere Informationen zu diesem Thema finden
Sie im Artikel `Writing FreeBSD Problem
Reports <../../doc/en_US.ISO8859-1/articles/problem-reports/>`__.

Die Bedienung von **send-pr** ist relativ einfach. Die Aufgabe des
Programms ist es, eine speziell formatierte E-Mail an eine bestimmte
E-Mail-Adresse zu schicken. Wenn Sie **send-pr** aufrufen, wird
automatisch Ihr Standardeditor (beispielsweise **vi** oder **emacs**)
mit einer von Ihnen auszuf?llenden Vorlage geladen, die auch einige
zus?tzliche Anweisungen enth?lt.

Achten Sie beim Ausf?llen des Formulars darauf, dass Sie im Feld
"Category" den Wert "docs" eintragen und dass im Feld Class" der Eintrag
"change-request" steht. Im "Body"-Bereich f?gen Sie die vorhin erstellte
``.uue``-Datei ein.

Wenn Sie den Editor beenden, wird der PR als E-Mail an die korrekte
Adresse geschickt. Kurz darauf erhalten Sie (wiederum als E-Mail) eine
Best?tigung, die insbesondere die Ihrem PR zugewiesene eindeutige Nummer
enth?lt. Diese PR-Nummer k?nnen Sie dazu verwenden, den aktuellen Status
Ihres Beitrags zu pr?fen.

Ich habe ein bereits vorhandenes Dokument verbessert. Wie kann ich meine Korrekturen einreichen?
------------------------------------------------------------------------------------------------

Danke, dass Sie unsere Dokumentation verbessern wollen.

In diesem Fall m?ssen Sie eine spezielle Datei, eine sogenannte
Differenz (*diff*) erstellen. Diese Differenz enth?lt alle von Ihnen
durchgef?hrten ?nderungen. Dadurch wird es den Committern erleichtert,
Ihre ?nderungen zu finden und zu pr?fen. Sie haben den Vorteil, dass Sie
nicht umst?ndlich erkl?ren m?ssen, was Sie ge?ndert haben.
Nichtsdestotrotz sollten Sie nat?rlich begr?nden k?nnen, warum Sie diese
?nderung f?r n?tig halten.

Um eine Differenz (einen "Diff") zu erstellen, gehen Sie wie folgt vor:

#. Erstellen Sie eine Kopie der zu ?ndernden Datei (in diesem Fall
   ``foo.xml``): do

   ::

           % cp foo.xml foo.xml.old
           

#. Nun f?hren Sie Ihre ?nderungen in foo.xml durch.

   ::

           % vi foo.xml
           ... tipp tipp tipp ...

           ... ?nderungen testen, Tippfehler suchen und korrigieren ...
           

#. Danach erzeugen Sie die Differenz:

   ::

           % diff -u foo.xml.old foo.xml > foo.diff
           

   Mit diesem Befehl werden die beiden Dateien verglichen und die
   Unterschiede in die Datei ``foo.diff`` geschrieben.

Als letzten Schritt senden Sie die erstellte Differenz ``foo.diff`` an
das Documentation Project. Dazu erstellen Sie wiederum einen PR. Im
Unterschied zur Erstellung einer neuen Anleitung, enth?lt der
"Body"-Bereich nun aber die von Ihnen erstellte Differenz ``foo.diff``.

`Startseite des FreeBSD Documentation Projects <docproj.html>`__

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
