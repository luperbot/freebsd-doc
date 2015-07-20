===================================
4. Hilfe und Informationen erhalten
===================================

.. raw:: html

   <div class="navheader">

4. Hilfe und Informationen erhalten
`Zur?ck <looking-around.html>`__?
?
?\ `Weiter <editing-text.html>`__

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

4. Hilfe und Informationen erhalten
-----------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Im folgenden Abschnitt erhalten Sie einige Tipps zur Verwendung der
Hilfefunktion. *``Text``* steht dabei f?r etwas, das Sie eingeben m?ssen
— meistens einen Befehl oder einen Dateinamen.

.. raw:: html

   <div class="variablelist">

``apropos             text``
    Jeder Eintrag, der die Zeichenkette *``text``* in der
    whatis-Datenbank enth?lt, wird aufgelistet.

``man             text``
    Die Manualpage von *``text``*. Manualpages sind die
    Hauptinformationsquelle f?r UNIX?-Systeme. ``man ls`` zeigt alle
    M?glichkeiten, wie ``ls`` verwendet werden kann. Dr?cken Sie
    **Enter** um weiterzubl?ttern, **Strg**+**B**, um eine Seite zur?ck
    zu bl?ttern, **Strg**+**F**, um eine Seite vorw?rts zu bl?ttern oder
    **Strg**+**C** zum Beenden.

``which             text``
    Sagt Ihnen, in welchem Verzeichnis der Befehl *``text``* im Pfad des
    Benutzers gefunden wird.

``locate             text``
    Alle Verzeichnisse, welche die Zeichenkette *``text``* enthalten,
    werden ausgegeben.

``whatis             text``
    Gibt aus, wof?r das Kommando *``text``* steht und welche
    Handbuchseite(n) es daf?r gibt. ``whatis *`` liefert Ihnen
    Informationen zu allen ausf?hrbaren Dateien des aktuellen
    Verzeichnisses.

``whereis             text``
    Gibt den absoluten Pfad der Datei *``text``* aus.

.. raw:: html

   </div>

Rufen Sie nun ``whatis`` mit einigen n?tzlichen Befehlen wie ``cat``,
``more``, ``grep``, ``mv``, ``find``, ``tar``, ``chmod``, ``chown``,
``date``, und ``script`` auf. ``more`` funktioniert genau so wie unter
DOS und zeigt den Inhalt der Datei seitenweise an. ``ls -l | more``
entspricht daher ``more Dateiname``. Das ``*``-Zeichen dient als
Platzhalter, ``ls w*`` zeigt daher alle Dateien an, die mit ``w``
beginnen.

Funktioniert der eine oder andere Aufruf bei Ihnen nicht? Sowohl
`locate(1) <http://www.FreeBSD.org/cgi/man.cgi?query=locate&sektion=1>`__,
als auch
`whatis(1) <http://www.FreeBSD.org/cgi/man.cgi?query=whatis&sektion=1>`__
sind von einer Datenbank abh?ngig, die w?chentlich aktualisiert wird.
Falls Ihr Rechner nicht st?ndig l?uft, k?nnen Sie die t?glichen,
w?chentlichen und monatlichen Aktualisierungen auch manuell starten.
Melden Sie sich dazu als ``root`` an. Warten Sie jeweils auf das Ende
eines Befehls, bevor Sie den n?chsten Befehl eingeben.

.. raw:: html

   <div class="informalexample">

.. code:: screen

    # periodic daily
    output omitted
    # periodic weekly
    output omitted
    # periodic monthly
    output omitted

.. raw:: html

   </div>

Diese Befehle sind zwar Teil der Systemverwaltung, als alleiniger
Benutzer eines UNIX?-Systems sind Sie aber auch der Administrator des
Systems. Sie m?ssen sich nur als ``root`` anmelden, wenn Sie das System
verwalten m?chten. Eine Information, die leider in vielen dicken B?chern
?ber UNIX? vergessen wird, die sich lieber den Pulldown-Men?s und
Window-Managern widmen. Empfehlenswerte B?cher zur
UNIX?-Systemadministration sind das *UNIX System Administration
Handbook* von Evi Nemeth et.al. (Prentice-Hall, 1995, ISBN 0-13-15051-7,
die zweite Ausgabe hat ein rotes Cover), oder *Essential System
Administration* von ?leen Frisch (O'Reilly & Associates, 2002, ISBN
0-596-00343-9).

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------+-------------------------------+-------------------------------------+
| `Zur?ck <looking-around.html>`__?   | ?                             | ?\ `Weiter <editing-text.html>`__   |
+-------------------------------------+-------------------------------+-------------------------------------+
| 3. Sich im System umsehen?          | `Zum Anfang <index.html>`__   | ?5. Textdateien bearbeiten          |
+-------------------------------------+-------------------------------+-------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
