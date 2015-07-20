=====================
2. Was Sie tun k?nnen
=====================

.. raw:: html

   <div class="navheader">

2. Was Sie tun k?nnen
`Zur?ck <index.html>`__?
?
?\ `Weiter <ix01.html>`__

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

2. Was Sie tun k?nnen
---------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

M?gliche Beitr?ge lassen sich in f?nf Kategorien einteilen:

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.1. Fehlerberichte und allgemeine Vorschl?ge
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Eine Idee oder ein Vorschlag von *allgemeinem* technischen Interesse
sollte an `FreeBSD technical
discussions <http://lists.FreeBSD.org/mailman/listinfo/freebsd-hackers>`__
geschickt werden. Personen, die an solchen Fragen interessiert sind (und
kein Problem mit einem *hohen* Mailaufkommen haben!) k?nnen die
Mailingliste `FreeBSD technical
discussions <http://lists.FreeBSD.org/mailman/listinfo/freebsd-hackers>`__
auch abonnieren. Informationen zu dieser und anderen Mailinglisten
finden Sie im `FreeBSD
Handbuch <../../../../doc/de_DE.ISO8859-1/books/handbook/eresources.html#ERESOURCES-MAIL>`__.

Wenn Sie einen Fehler gefunden oder eine Verbesserung entwickelt haben,
vergessen Sie nicht, einen Bericht ?ber
`send-pr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=send-pr&sektion=1>`__
oder dessen `Internetschnittstelle <../../../../de/send-pr.html>`__ zu
erstellen. Versuchen Sie bitte, jedes Feld auszuf?llen. Ist Ihr Patch
kleiner als 65?KB, sollten Sie ihn direkt in den Bericht einbauen. Kann
der Patch direkt auf den Quellcodebaum angewendet werden, f?gen Sie
``[PATCH]`` im Synopsis-Feld ein. Wenn Sie einen Patch einf?gen,
verwenden Sie bitte *kein copy-and-paste*, weil dadurch Tabulatoren in
Leerzeichen umgewandelt werden, was den Patch unbrauchbar macht. Sind
die Patches viel gr??er als 20?KB, sollten Sie sie komprimieren (z.B.
mit
`gzip(1) <http://www.FreeBSD.org/cgi/man.cgi?query=gzip&sektion=1>`__
oder
`bzip2(1) <http://www.FreeBSD.org/cgi/man.cgi?query=bzip2&sektion=1>`__)
und
`uuencode(1) <http://www.FreeBSD.org/cgi/man.cgi?query=uuencode&sektion=1>`__
verwenden, um diese in ihren Problembericht einzuf?gen.

Nachdem Sie einen Bericht versandt haben, erhalten Sie eine E-Mail, die
eine Best?tigung sowie eine Identifikationsnummer enth?lt. Geben Sie
diese Nummer im Betreff der Nachricht an (``"Re:     kern/3377"``), wenn
Sie neue Informationen zu diesem Problem an
``<bug-followup@FreeBSD.org>`` senden. Zus?tzliche Informationen zu
Problemberichten sollten immer auf diese Art und Weise verschickt
werden.

Sollten Sie innerhalb einer Woche keine Best?tigung erhalten, oder
`send-pr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=send-pr&sektion=1>`__
nicht verwenden k?nnen, k?nnen Sie ?ber `FreeBSD problem
reports <http://lists.FreeBSD.org/mailman/listinfo/freebsd-bugs>`__
jemanden bitten, dies f?r Sie zu erledigen.

Weitere Informationen zum Verfassen von guten Problemberichten finden
Sie im entsprechenden
`Artikel <../../../../doc/en_US.ISO8859-1/articles/problem-reports/article.html>`__.

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

2.2. ?nderungen der Dokumentation
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

?nderungen der Dokumentation werden vom `FreeBSD documentation
project <http://lists.FreeBSD.org/mailman/listinfo/freebsd-doc>`__
?berwacht. Lesen Sie bitte die `Fibel f?r neue Mitarbeiter des
FreeBSD-Dokumentationsprojekts <../../../../doc/de_DE.ISO8859-1/books/fdp-primer/index.html>`__
f?r weitere Informationen. Korrekturen und Erg?nzungen (selbst kleine
?nderungen sind willkommen!) werden mit
`send-pr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=send-pr&sektion=1>`__
?bermittelt. Lesen Sie dazu den Abschnitt `Fehlerberichte und allgemeine
Vorschl?ge <contrib-how.html#contrib-general>`__.

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

2.3. ?nderungen am vorhandenen Quellcode
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

?nderungen des existierenden Quellcodes sind etwas komplizierter.
Entscheidend ist hier, wie vertraut Sie mit dem aktuellen
Entwicklungsstand von FreeBSD sind. Es existiert eine spezielle, st?ndig
aktualisierte Version von FreeBSD, die als „FreeBSD-CURRENT“ bekannt
ist. Diese ist auf verschiedenen Wegen erh?ltlich und stellt den
aktuellen Stand der Entwicklung dar. Lesen Sie den Abschnitt
`FreeBSD-CURRENT vs.
FreeBSD-STABLE <../../../../doc/de_DE.ISO8859-1/books/handbook/current-stable.html>`__
des Handbuchs f?r weitere Informationen zur Installation und Verwendung
von FreeBSD-CURRENT.

Arbeiten Sie mit ?lteren Quellcodeversionen, kann dies leider bedeuten,
das Ihre ?nderungen obsolet sind, oder sich nicht mehr in FreeBSD
reintegrieren lassen. Dieses Risiko l?sst sich verringern, wenn Sie die
Mailinglisten `FreeBSD
announcements <http://lists.FreeBSD.org/mailman/listinfo/freebsd-announce>`__
und
`FreeBSD-CURRENT <http://lists.FreeBSD.org/mailman/listinfo/freebsd-current>`__
abonnieren, auf denen aktuelle System?nderungen diskutiert werden.

Wenn Ihre ?nderungen auf ausreichend aktuellen Quellen beruhen,
erstellen Sie als N?chstes einen Differenzensatz, den Sie an die
FreeBSD-Entwickler schicken. Eine solche Differenz erstellen Sie mit
`diff(1) <http://www.FreeBSD.org/cgi/man.cgi?query=diff&sektion=1>`__.

Das bevorzugte
`diff(1) <http://www.FreeBSD.org/cgi/man.cgi?query=diff&sektion=1>`__-Format
f?r das Versenden von Patches ist das sogenannte *unified
output*-Format, das Sie mit ``diff -u`` erstellen. F?r gr??ere
?nderungen kann allerdings das *context output*-Format (erzeugt mit
``diff -c``) die bessere Wahl sein.

Dazu ein Beispiel:

.. code:: screen

    % diff -c oldfile newfile

oder

.. code:: screen

    % diff -c -r olddir newdir

w?rde einen solchen Satz von Differenzen f?r die angegebene
Verzeichnishierarchie erzeugen.

Genauso h?tte

.. code:: screen

    % diff -u oldfile newfile

oder

.. code:: screen

    % diff -u -r olddir newdir

den gleichen Effekt, allerdings erfolgt die Ausgabe im *unified
diff*-Format.

Lesen Sie dazu auch
`diff(1) <http://www.FreeBSD.org/cgi/man.cgi?query=diff&sektion=1>`__.

Nachdem Sie den Differenzensatz erstellt und mit
`patch(1) <http://www.FreeBSD.org/cgi/man.cgi?query=patch&sektion=1>`__
getestet haben, sollten Sie ihn an das FreeBSD-Projekt senden. Verwenden
Sie dazu
`send-pr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=send-pr&sektion=1>`__
(wie im Abschnitt `Fehlerberichte und allgemeine
Vorschl?ge <contrib-how.html#contrib-general>`__ beschrieben). Senden
Sie die Differenzen *nicht nur* an `FreeBSD technical
discussions <http://lists.FreeBSD.org/mailman/listinfo/freebsd-hackers>`__,
da diese sonst verloren gehen. Wir freuen uns ?ber Ihren Beitrag
(schlie?lich ist FreeBSD ein Freiwilligenprojekt); wir sind aber
manchmal nicht in der Lage, das Problem sofort anzugehen. Es verbleibt
aber in der PR-Datenbank, bis wir daf?r Zeit finden. Verwenden Sie den
Begriff ``[PATCH]`` im Synopsis-Feld des Berichts.

Sie k?nnen auch ein ``tar``-Archiv erzeugen (was vor allem dann sinnvoll
ist, wenn Sie Dateien hinzugef?gt, gel?scht oder umbenannt haben) und
`uuencode(1) <http://www.FreeBSD.org/cgi/man.cgi?query=uuencode&sektion=1>`__
auf das Archiv anwenden. Mit
`shar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=shar&sektion=1>`__
erzeugte Archive sind ebenfalls willkommen.

Wenn Ihre ?nderungen potentielle Probleme aufweisen, wie Unklarheiten im
Hinblick auf das Copyright, oder Sie einfach eine genaue ?berpr?fung
Ihrer ?nderungen m?chten, sollten Sie die ?nderungen an das Core Team
``<core@FreeBSD.org>`` schicken, statt sie mit
`send-pr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=send-pr&sektion=1>`__
zu versenden. Die Mailingliste Core Team ``<core@FreeBSD.org>`` erreicht
nur eine kleine Gruppe von Leuten, die sich um die t?gliche Arbeit an
FreeBSD k?mmern. Beachten Sie aber, dass diese Gruppe *sehr besch?ftigt*
ist. Daher sollten Sie nur dann eine E-Mail an sie schicken, wenn es
absolut notwendig ist.

`intro(9) <http://www.FreeBSD.org/cgi/man.cgi?query=intro&sektion=9>`__
und
`style(9) <http://www.FreeBSD.org/cgi/man.cgi?query=style&sektion=9>`__
beschreiben den zu verwendenden Programmierstil. Bevor Sie also Code
versenden, sollten Sie diese Informationen gelesen haben.

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

2.4. Neuer Code oder gro?e Mehrwertpakete
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Handelt es sich um einen bedeutenden Beitrag oder um das Hinzuf?gen von
neuen wichtigen F?higkeiten zu FreeBSD, ist es fast immer notwendig, die
?nderungen als *uuencoded tar*-Dateien zu versenden, oder diese auf
einer Internetseite oder einem FTP-Server bereitzustellen. Haben Sie
keinen eigenen Speicherplatz im Internet, sollten Sie auf einer
entsprechenden Mailinglisten nachfragen, ob jemand diese Aufgabe f?r Sie
?bernehmen kann.

Arbeitet man mit gro?en Codebest?nden, kommt man unweigerlich mit den
unterschiedlichen Lizenzen in Ber?hrung. Code, der in FreeBSD enthalten
ist, kann unter den folgenden Lizenzen stehen:

.. raw:: html

   <div class="orderedlist">

#. 

   Der BSD-Lizenz. Diese Lizenz wird von uns bevorzugt, weil sie an
   „keine Bedingungen“ gekn?pft ist und daher f?r kommerzielle
   Unternehmen sehr attraktiv ist. Das FreeBSD-Projekt unterst?tzt diese
   kommerzielle Verwendung, die manchmal sogar in eine F?rderung des
   FreeBSD-Projekts m?ndet.

#. 

   Der GNU General Public License, oder „GPL“. Diese Lizenz ist nicht
   ganz so beliebt bei uns, da sie die kommerzielle Nutzung des
   Quellcodes einschr?nkt. In Anbetracht der schieren Menge an
   GPL-Quellcode, den wir derzeit ben?tigen (wie Compiler, Assembler
   oder Textformatierer) w?ren wir aber schlecht beraten, Beitr?ge, die
   unter dieser Lizenz stehen, abzulehnen. Code, der unter der GPL
   steht, befindet sich in einem gesonderten Bereich des Quellcodebaums,
   und zwar unter ``/sys/gnu`` oder ``/usr/src/gnu``, und ist daher f?r
   jeden, f?r den die GPL ein Problem darstellt, sofort erkennbar.

.. raw:: html

   </div>

Beitr?ge, die unter einer dieser Lizenzen stehen, m?ssen sorgf?ltig
gepr?ft werden, bevor ihre Aufnahme in FreeBSD in Betracht gezogen wird.
Beitr?ge, f?r die besonders restriktive Lizenzen gelten, werden generell
abgelehnt, obwohl die Autoren ermutigt werden, ihre Ver?nderungen ?ber
ihre eigenen Kan?le verf?gbar zu machen.

Um Ihre Arbeit unter die „BSD-Lizenz“ zu stellen, f?gen Sie den
folgenden Text am Beginn jeder von Ihnen erstellten Quellcodedatei ein,
wobei Sie den Text zwischen den ``%%``-Zeichen durch die entsprechenden
Informationen ersetzt:

.. code:: programlisting

    Copyright (c) %%Jahr der Ver?ffentlichung%%
            %%Ihr Name%%, %%Ihr Land%%  %%Ihre Postleitzahl%%.
        All rights reserved.

    Redistribution and use in source and binary forms, with or without
    modification, are permitted provided that the following conditions
    are met:
    1. Redistributions of source code must retain the above copyright
       notice, this list of conditions and the following disclaimer as
       the first lines of this file unmodified.
    2. Redistributions in binary form must reproduce the above copyright
       notice, this list of conditions and the following disclaimer in the
       documentation and/or other materials provided with the distribution.

    THIS SOFTWARE IS PROVIDED BY %%Ihr Name%% ``AS IS'' AND ANY EXPRESS OR
    IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
    OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
    IN NO EVENT SHALL %%Ihr Name%% BE LIABLE FOR ANY DIRECT, INDIRECT,
    INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
    NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
    DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
    THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
    (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
    THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

            $Id$

Eine Kopie dieses Textes finden Sie unter
``/usr/share/examples/etc/bsd-style-copyright``.

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

2.5. Geld, Hardware oder Internetzugang
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wir freuen uns immer, wenn jemand das FreeBSD-Projekt durch Spenden
unterst?tzen will. Auch kleine Spenden k?nnen eine gro?e Wirkung haben.
Hardwarespenden sind ebenfalls sehr wichtig, um die Liste der von
FreeBSD unterst?tzten Hardware erweitern zu k?nnen, da uns die Mittel
zum Erwerb dieser Hardware fehlen.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.5.1. Geldspenden
^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die FreeBSD Foundation ist eine gemeinn?tzige Gesellschaft, die zur
Unterst?tzung des FreeBSD-Projekts geschaffen wurde. Sie ist nach dem
Paragraphen 501(c)3 sowohl von der amerikanischen Einkommenssteuer als
auch von der des Staates Colorado befreit. Spenden an solche
steuerbefreiten Gesellschaften k?nnen unter gewissen Umst?nden
steuermindernd geltend gemacht werden.

Sie k?nnen Spenden in Scheckform an folgende Adresse senden:

.. raw:: html

   <div class="address">

| 
|  ????The?FreeBSD?Foundation
|  ????7321?Brockway?Dr.
|  ????Boulder,?CO?80303
|  ????USA
|  ??

.. raw:: html

   </div>

Die FreeBSD Foundation ist nun auch in der Lage, Spenden durch das
PayPal-System entgegenzunehmen. Solche Spenden k?nnen ?ber die
`Homepage <http://www.freebsdfoundation.org>`__ der Foundation erfolgen.

F?r weitere Informationen zur FreeBSD Foundation sollten Sie den Artikel
`The FreeBSD Foundation -- an
Introduction <http://people.FreeBSD.org/~jdp/foundation/announcement.html>`__
lesen. Sie erreichen die FreeBSD Foundation ?ber die E-Mail-Adresse
``<bod@FreeBSDFoundation.org>``.

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

2.5.2. Hardwarespenden
^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das FreeBSD-Projekt freut sich, wenn jemand ben?tigte Hardware spenden
will. Sind Sie daran interessiert, setzen Sie sich bitte mit dem
`Donations Liaison Office <../../../../donations/>`__ in Verbindung.

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

2.5.3. Internetzugang zur Verf?gung stellen
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wir sind st?ndig auf der Suche nach neuen FTP-, WWW- oder
``cvsup``-Spiegeln. Wenn Sie einen solchen Spiegel einrichten wollen,
lesen Sie bitte den Artikel `Mirroring
FreeBSD <../../../../doc/en_US.ISO8859-1/articles/hubs/index.html>`__,
der weitere Informationen enth?lt.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------+-------------------------------+-----------------------------+
| `Zur?ck <index.html>`__?   | ?                             | ?\ `Weiter <ix01.html>`__   |
+----------------------------+-------------------------------+-----------------------------+
| FreeBSD unterst?tzen?      | `Zum Anfang <index.html>`__   | ?Stichwortverzeichnis       |
+----------------------------+-------------------------------+-----------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
