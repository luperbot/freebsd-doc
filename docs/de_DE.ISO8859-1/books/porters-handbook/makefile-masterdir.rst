==============
5.8. MASTERDIR
==============

.. raw:: html

   <div class="navheader">

5.8. ``MASTERDIR``
`Zur?ck <makefile-depend.html>`__?
Kapitel 5. Die Konfiguration des Makefile
?\ `Weiter <makefile-manpages.html>`__

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

5.8. ``MASTERDIR``
------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Falls Ihr Port wegen einer Variable, die verschiedene Werte annimmt
(z.B. Aufl?sung oder Papiergr??e), leicht unterschiedliche Versione von
Paketen erzeugen muss, dann legen Sie bitte ein Unterverzeichnis pro
Paket an, um es f?r den Nutzer einfacher begreiflich zu machen, was zu
machen ist. Aber versuchen Sie dabei so viele Dateien wie m?glich
zwischen diesen Ports gemeinsam zu nutzen. Normalerweise ben?tigen Sie
nur ein sehr kurzes ``Makefile`` in allen ausser einem Unterverzeichnis,
wenn Sie Variablen intelligent nutzen. In diesem einzigen ``Makefile``
k?nnen Sie ``MASTERDIR`` verwenden, um anzugeben, wo der Rest der
Dateien liegt. Benutzen Sie bitte auch eine Variable f?r
```PKGNAMESUFFIX`` <makefile-naming.html#porting-pkgname>`__, damit die
Pakete unterschiedliche Namen haben werden.

Wir demonstrieren dies am Besten an einem Beispiel. Es ist Teil von
``japanese/xdvi300/Makefile``;

.. code:: programlisting

    PORTNAME=       xdvi
    PORTVERSION=    17
    PKGNAMEPREFIX=  ja-
    PKGNAMESUFFIX=  ${RESOLUTION}
     :
    # default
    RESOLUTION?=   300
    .if ${RESOLUTION} != 118 && ${RESOLUTION} != 240 && \
           ${RESOLUTION} != 300 && ${RESOLUTION} != 400
           @${ECHO_MSG} "Error: invalid value for RESOLUTION: \"${RESOLUTION}\""
           @${ECHO_MSG} "Possible values are: 118, 240, 300 (default) and 400."
           @${FALSE}
    .endif

`japanese/xdvi300 <http://www.freebsd.org/cgi/url.cgi?ports/japanese/xdvi300/pkg-descr>`__
verf?gt ebenfalls ?ber alle Patches, Paket-Dateien usw. Wenn Sie
``make`` eintippen, wird der Port die Standardvorgabe f?r die Aufl?sung
nehmen (300) und den Port ganz normal erstellen.

Genauso wie f?r alle anderen Aufl?sungen ist dies das *vollst?ndige*
``xdvi118/Makefile``:

.. code:: programlisting

    RESOLUTION=     118
    MASTERDIR=      ${.CURDIR}/../xdvi300

    .include "${MASTERDIR}/Makefile"

(``xdvi240/Makefile`` und ``xdvi400/Makefile`` sind ?hnlich). Die
``MASTERDIR``-Definition teilt dem ``bsd.port.mk`` mit, dass die
normalen Unterverzeichnisse wie ``FILESDIR`` und ``SCRIPTDIR`` unter
``xdvi300`` gefunden werden k?nnen. Die ``RESOLUTION=118``-Zeile wird
die ``RESOLUTION=300``-Zeile in ``xdvi300/Makefile`` ?berschreiben und
der Port wird mit einer Aufl?sung von 118 erstellt.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------+---------------------------------+------------------------------------------+
| `Zur?ck <makefile-depend.html>`__?    | `Nach oben <makefile.html>`__   | ?\ `Weiter <makefile-manpages.html>`__   |
+---------------------------------------+---------------------------------+------------------------------------------+
| 5.7. Abh?ngigkeiten (dependencies)?   | `Zum Anfang <index.html>`__     | ?5.9. Manualpages                        |
+---------------------------------------+---------------------------------+------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
