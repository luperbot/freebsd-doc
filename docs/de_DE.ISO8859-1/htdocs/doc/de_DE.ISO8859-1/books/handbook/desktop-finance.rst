===================
7.5. Finanzsoftware
===================

.. raw:: html

   <div class="navheader">

7.5. Finanzsoftware
`Zur?ck <desktop-viewers.html>`__?
Kapitel 7. Desktop-Anwendungen
?\ `Weiter <desktop-summary.html>`__

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

7.5. Finanzsoftware
-------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn Sie, warum auch immer, Ihre Finanzen mit einem FreeBSD Arbeitsplatz
verwalten wollen, stehen Ihnen verschiedene Anwendungen zur Verf?gung.
Einige von ihnen unterst?tzen verbreitete Formate, darunter
Dateiformate, die von Quicken oder Excel verwendet werden.

Dieser Abschnitt behandelt die folgenden Anwendungen:

.. raw:: html

   <div class="informaltable">

+-------------+--------------------+--------------------------------------+---------------------------+
| Anwendung   | Ressourcenbedarf   | Installationsaufwand aus den Ports   | wichtige Abh?ngigkeiten   |
+=============+====================+======================================+===========================+
| GnuCash     | niedrig            | hoch                                 | GNOME                     |
+-------------+--------------------+--------------------------------------+---------------------------+
| Gnumeric    | niedrig            | hoch                                 | GNOME                     |
+-------------+--------------------+--------------------------------------+---------------------------+
| Abacus      | niedrig            | niedrig                              | Tcl/Tk                    |
+-------------+--------------------+--------------------------------------+---------------------------+
| KMyMoney    | niedrig            | hoch                                 | KDE                       |
+-------------+--------------------+--------------------------------------+---------------------------+

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

7.5.1. GnuCash
~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

GnuCash ist Teil des GNOME-Projekts, dessen Ziel es ist, leicht zu
bedienende und doch leistungsf?hige Anwendungen zu erstellen. Mit
GnuCash k?nnen Sie Ihre Einnahmen und Ausgaben, Ihre Bankkonten und
Wertpapiere verwalten. Das Programm ist leicht zu bedienen und gen?gt
dennoch hohen Anspr?chen.

GnuCash stellt ein Register, ?hnlich dem in einem Scheckheft und ein
hierarchisches System von Konten zur Verf?gung. Eine Transaktion kann in
einzelne Teile aufgespaltet werden. GnuCash kann Quicken-Dateien (QIF)
importieren und einbinden. Weiterhin unterst?tzt das Programm die
meisten internationalen Formate f?r Zeitangaben und W?hrungen. Die
Bedienung des Programms kann durch zahlreiche Tastenkombinationen und
dem automatischen Vervollst?ndigen von Eingaben beschleunigt werden.

Das GnuCash-Paket installieren Sie wie folgt:

.. code:: screen

    # pkg_add -r gnucash

Wenn das Paket nicht zur Verf?gung steht, benutzen Sie die
Ports-Sammlung:

.. code:: screen

    # cd /usr/ports/finance/gnucash
    # make install clean

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

7.5.2. Gnumeric
~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Gnumeric ist eine Tabellenkalkulation, die Teil der GNOME
Benutzeroberfl?che ist. Das Programm kann Eingaben anhand des
Zellenformats oder einer Folge von Eingaben vervollst?ndigen. Dateien
verbreiteter Formate, wie die von Excel, Lotus 1-2-3 oder Quattro Pro
lassen sich importieren. Grafiken erstellt Gnumeric mit dem Programm
`math/guppi <http://www.freebsd.org/cgi/url.cgi?ports/math/guppi/pkg-descr>`__.
Gnumeric besitzt viele eingebaute Funktionen und Zellenformate (zum
Beispiel die ?blich verwendeten, wie Zahl, W?hrung, Datum oder Zeit).

Installieren Sie das Gnumeric-Paket mit dem folgenden Kommando:

.. code:: screen

    # pkg_add -r gnumeric

Wenn das Paket nicht zur Verf?gung steht, benutzen Sie die
Ports-Sammlung:

.. code:: screen

    # cd /usr/ports/math/gnumeric
    # make install clean

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

7.5.3. Abacus
~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Abacus ist eine kleine und leicht zu bedienende Tabellenkalkulation. Die
vordefinierten Funktionen stammen aus verschiedenen Bereichen wie der
Statistik, der Wirtschaft und der Mathematik. Das Programm kann Dateien
im Excel Dateiformat importieren und exportieren sowie Ausgaben in
PostScript? erzeugen.

Installieren Sie das Abacus-Paket mit dem folgenden Kommando:

.. code:: screen

    # pkg_add -r abacus

Wenn das Paket nicht zur Verf?gung steht, benutzen Sie die
Ports-Sammlung:

.. code:: screen

    # cd /usr/ports/deskutils/abacus
    # make install clean

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

7.5.4. KMyMoney
~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Bei KMyMoney handelt es sich ein Programm zur Verwaltung der
pers?nlichen Finanzen, das unter KDE entwickelt wird. KMyMoney hat das
Ziel, alle wichtigen Funktionen zu bieten, die auch von kommerziellen
Programmen zur Verwaltung der pers?nlichen Finanzen unterst?tzt werden.
Weiters z?hlen einfache Benutzung sowie korrekte doppelte Buchf?hrung zu
den herausragenden F?higkeiten dieses Programms. KMyMoney unterst?tzt
den Import von Datendateien im Format *Quicken Interchange Format
(QIF)*, kann Investionen verfolgen, unterst?tzt verschiedene W?hrungen
und bietet umfangreiche Reportm?glichkeiten. OFX-Import wird ?ber ein
separates Plugin realisiert.

Um KMyMoney ?ber das FreeBSD-Paketsystem zu installieren, geben Sie
Folgendes ein:

.. code:: screen

    # pkg_add -r kmymoney2

Sollte das Paket nicht verf?gbar sein, k?nnen Sie das Programm auch ?ber
die Ports-Sammlung installieren:

.. code:: screen

    # cd /usr/ports/finance/kmymoney2
    # make install clean

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+--------------------------------+----------------------------------------+
| `Zur?ck <desktop-viewers.html>`__?   | `Nach oben <desktop.html>`__   | ?\ `Weiter <desktop-summary.html>`__   |
+--------------------------------------+--------------------------------+----------------------------------------+
| 7.4. Anzeigen von Dokumenten?        | `Zum Anfang <index.html>`__    | ?7.6. Zusammenfassung                  |
+--------------------------------------+--------------------------------+----------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
