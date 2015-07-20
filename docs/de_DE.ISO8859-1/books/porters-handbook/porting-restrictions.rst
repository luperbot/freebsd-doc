=======================================
6.2. Ports mit beschr?nkter Verbreitung
=======================================

.. raw:: html

   <div class="navheader">

6.2. Ports mit beschr?nkter Verbreitung
`Zur?ck <special.html>`__?
Kapitel 6. Besonderheiten
?\ `Weiter <building.html>`__

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

6.2. Ports mit beschr?nkter Verbreitung
---------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Lizenzen variieren und manche geben Restriktionen vor, wie die
Applikation gepackt werden oder ob sie gewinnorientiert verkauft werden
kann, usw.

.. raw:: html

   <div class="important" xmlns="">

Wichtig:
~~~~~~~~

Es liegt in Ihrer Verantwortung als Porter die Lizenzbestimmungen der
Software zu lesen und sicherzustellen, dass das FreeBSD-Projekt nicht
haftbar gemacht wird f?r Lizenzverletzungen durch Weiterverbreitung des
Quelltextes oder kompilierter Binaries ?ber FTP/HTTP oder CD-ROM. Im
Zweifelsfall kontaktieren Sie bitte die `FreeBSD
ports <http://lists.FreeBSD.org/mailman/listinfo/freebsd-ports>`__.

.. raw:: html

   </div>

In solchen Situationen k?nnen die in den folgenden Abschnitten
beschriebenen Variablen gesetzt werden.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.2.1. ``NO_PACKAGE``
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Diese Variable zeigt an, dass wir keine bin?ren Pakete dieser
Applikation erzeugen d?rfen - z.B. wenn die Lizenz die Weiterverteilung
von bin?ren Paketen oder Paketen verbietet, die aus ver?ndertem
Quelltext erzeugt wurden.

Die ``DISTFILES`` des Ports d?rfen allerdings frei ?ber FTP/HTTP Mirrors
weiterverbreitet werden. Sie d?rfen auch auf CD-ROM (oder ?hnlichen
Medien) weiterverbreitet werden - es sei denn, ``NO_CDROM`` ist
ebenfalls gesetzt.

``NO_PACKAGE`` sollte auch benutzt werden, wenn das bin?re Paket nicht
allgemein brauchbar ist und die Applikation immer aus dem Quelltext
kompiliert werden sollte. Zum Beispiel, wenn die Applikation
konfigurierte Informationen ?ber den Rechner/Installationsort bei der
Installation einkompiliert bekommt, setzen Sie ``NO_PACKAGE``.

``NO_PACKAGE`` sollte auf eine Zeichenkette gesetzt werden, die den
Grund beschreibt, warum kein Paket erzeugt werden soll.

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

6.2.2. ``NO_CDROM``
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Diese Variable gibt an, dassobwohl wir bin?re Pakete erzeugen
d?rfen?–?wir weder diese Pakete noch die ``DISTFILES`` des Ports auf
einer CD-ROM (oder ?hnlichen Medien) verkaufen d?rfen. Die ``DISTFILES``
des Ports d?rfen allerdings immer noch auf FTP/HTTP Mirrors.

Wenn diese Variable und auch ``NO_PACKAGE`` gesetzt ist, dann werden nur
die ``DISTFILES`` des Ports erh?ltlich sein?–?und das nur mittels
FTP/HTTP.

``NO_CDROM`` sollte auf eine Zeichenkette gesetzt werden, die den Grund
beschreibt, warum der Port nicht auf CD-ROM weiterverbreitet werden
kann. Das sollte z.B. gemacht werden, wenn die Lizenz des Ports nur f?r
„nichtkommerzielle Zwecke“ gilt.

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

6.2.3. ``NOFETCHFILES``
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dateien, die in der Variable ``NOFETCHFILES`` aufgelistet sind, sind von
keiner der ``MASTER_SITES`` abrufbar. Ein Beispiel solch einer Datei ist
eine selbige, welche vom Anbieter auf CD-ROM bereitgestellt wird.

Werkzeuge, die das Vorhandensein dieser Dateien auf den ``MASTER_SITES``
?berpr?fen, sollten diese Dateien ignorieren und sie nicht melden.

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

6.2.4. ``RESTRICTED``
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Setzen Sie diese Variable, wenn die Lizenz der Applikation weder das
Spiegeln der ``DISTFILES`` der Applikation noch das Weiterverbreiten von
bin?ren Paketen in jedweder Art erlaubt.

``NO_CDROM`` oder ``NO_PACKAGE`` sollten nicht zusammen mit
``RESTRICTED`` gesetzt werden, weil letztere Variable die anderen beiden
impliziert.

``RESTRICTED`` sollte auf eine Zeichenkette gesetzt werden, die den
Grund beschreibt, warum der Port nicht weiterverbreitet werden kann.
Typischerweise besagt dies, dass der Port propriet?re Software enth?lt
und der Benutzer die ``DISTFILES`` manuell herunterladen
muss?–?m?glicherweise erst nachdem er sich f?r die Software registriert
oder die Bedingungen eines Endbenutzer-Lizenzvertrags (EULA) akzeptiert
hat.

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

6.2.5. ``RESTRICTED_FILES``
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn ``RESTRICTED`` oder ``NO_CDROM`` gesetzt ist, ist diese Variable
auf ``${DISTFILES}         ${PATCHFILES}`` voreingestellt, sonst ist sie
leer. Wenn nicht jede dieser Dateien beschr?nkt ist, dann f?hren Sie die
betroffenen Dateien in dieser Variable auf.

Beachten Sie, dass der Porter f?r jede aufgef?hrte Distributionsdatei
einen Eintrag zu ``/usr/ports/LEGAL`` hinzuf?gen sollte, der genau
beschreibt, was die Beschr?nkung mit sich bringt.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------+--------------------------------+---------------------------------+
| `Zur?ck <special.html>`__?   | `Nach oben <special.html>`__   | ?\ `Weiter <building.html>`__   |
+------------------------------+--------------------------------+---------------------------------+
| Kapitel 6. Besonderheiten?   | `Zum Anfang <index.html>`__    | ?6.3. Build-Mechanismen         |
+------------------------------+--------------------------------+---------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
