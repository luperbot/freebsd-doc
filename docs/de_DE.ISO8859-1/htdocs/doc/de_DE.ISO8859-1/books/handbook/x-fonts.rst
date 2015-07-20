=================================
6.5. Schriftarten in X11 benutzen
=================================

.. raw:: html

   <div class="navheader">

6.5. Schriftarten in X11 benutzen
`Zur?ck <x-config.html>`__?
Kapitel 6. Das X-Window-System
?\ `Weiter <x-xdm.html>`__

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

6.5. Schriftarten in X11 benutzen
---------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Beigetragen von Murray Stokely.

.. raw:: html

   </div>

.. raw:: html

   </div>

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

6.5.1. Type?1 Schriftarten
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Schriftarten, die mit X11 geliefert werden, eignen sich ganz und gar
nicht f?r Desktop-Publishing-Anwendungen. Gro?e Schriftarten zeigen bei
Pr?sentationen deutliche Treppenstufen und die kleinen Schriftarten in
Netscape? sind fast unleserlich. Es gibt allerdings mehrere hochwertige
Type?1 Schriftarten (PostScript?), die mit X11 benutzt werden k?nnen.
Beispielsweise enthalten die URW-Schriftarten
(`x11-fonts/urwfonts <http://www.freebsd.org/cgi/url.cgi?ports/x11-fonts/urwfonts/pkg-descr>`__)
hochwertige Versionen g?ngiger Type?1 Schriftarten (zum Beispiel Times
Roman?, Helvetica?, Palatino?). Die Sammlung Freefonts
(`x11-fonts/freefonts <http://www.freebsd.org/cgi/url.cgi?ports/x11-fonts/freefonts/pkg-descr>`__)
enth?lt noch mehr Schriftarten, doch sind diese f?r den Einsatz in
Grafik-Programmen wie The Gimp gedacht. Es fehlen auch einige
Schriftarten, sodass sich die Sammlung nicht f?r den allt?glichen
Gebrauch eignet. Weiterhin kann X11 leicht so konfiguriert werden, dass
es TrueType?-Schriftarten verwendet. Mehr dazu erfahren Sie in der
Hilfeseite
`X(7) <http://www.FreeBSD.org/cgi/man.cgi?query=X&sektion=7>`__ und im
Abschnitt `TrueType? Schriftarten <x-fonts.html#truetype>`__.

Die Type?1 Schriftarten lassen sich aus der Ports-Sammlung wie folgt
installieren:

.. code:: screen

    # cd /usr/ports/x11-fonts/urwfonts
    # make install clean

Analog lassen sich Freefont und andere Sammlungen installieren. Die
neuen Schriftarten m?ssen Sie in die Konfigurationsdatei des X-Servers
im Verzeichnis ``/etc/X11`` eintragen. Die Konfigurationsdatei von Xorg
hei?t ``xorg.conf``. F?gen Sie die folgende Zeile hinzu:

.. code:: programlisting

    FontPath "/usr/local/lib/X11/fonts/URW/"

Sie k?nnen aber auch in der X-Sitzung das folgende Kommando absetzen:

.. code:: screen

    % xset fp+ /usr/local/lib/X11/fonts/URW
    % xset fp rehash

Dann kennt der X-Server die neuen Schriftarten nur bis zum Ende der
Sitzung. Wenn die ?nderung dauerhaft sein soll, m?ssen Sie die Kommandos
in ``~/.xinitrc`` eintragen, wenn Sie X mit ``startx`` starten, oder in
``~/.xsession``, wenn Sie XDM benutzen. Sie k?nnen die Schriftarten auch
in die neue Datei ``/usr/local/etc/fonts/local.conf``, die im Abschnitt
`Anti-aliasing <x-fonts.html#antialias>`__ beschrieben wird, eintragen.

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

6.5.2. TrueType?-Schriftarten
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Xorg kann TrueType?-Schriftarten mithilfe von zwei Modulen darstellen.
Im folgenden Beispiel wird das Freetype-Modul benutzt, da es besser mit
anderen Werkzeugen, die TrueType?-Schriftarten darstellen,
?bereinstimmt. Das Freetype-Modul aktivieren Sie im Abschnitt
``"Module"`` von ``/etc/X11/xorg.conf`` durch Einf?gen der Zeile:

.. code:: programlisting

    Load  "freetype"

Erstellen Sie ein Verzeichnis f?r die TrueType?-Schriftarten (z.B.
``/usr/local/lib/X11/fonts/TrueType``) und kopieren Sie alle
Schriftarten dorthin. Die Schriftarten m?ssen im
UNIX?/MS-DOS?/Windows?-Format vorliegen, Schriftarten von einem
Macintosh? k?nnen Sie nicht direkt ?bernehmen. Die Schriftarten m?ssen
noch im Katalog ``fonts.dir`` erfasst werden. Den Katalog erzeugen Sie
mit dem Kommando ``ttmkfdir`` aus dem Port
`x11-fonts/ttmkfdir <http://www.freebsd.org/cgi/url.cgi?ports/x11-fonts/ttmkfdir/pkg-descr>`__:

.. code:: screen

    # cd /usr/local/lib/X11/fonts/TrueType
    # ttmkfdir -o fonts.dir

Geben Sie dem System das TrueType?-Verzeichnis, wie im Abschnitt `Type?1
Schriftarten <x-fonts.html#type1>`__ beschrieben, bekannt:

.. code:: screen

    % xset fp+ /usr/local/lib/X11/fonts/TrueType
    % xset fp rehash

Oder f?gen Sie eine ``FontPath``-Zeile in die Datei ``xorg.conf`` ein.

Das war's. Jetzt sollten Netscape?, Gimp, StarOffice™ und alle anderen
X-Anwendungen die TrueType?-Schriftarten benutzen. Extrem kleine
Schriftarten (Webseiten, die mit hoher Aufl?sung betrachtet werden) und
sehr gro?e Schriftarten (in StarOffice™) sollten jetzt viel besser
aussehen.

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

6.5.3. Anti-aliasing
~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div>

Aktualisiert von Joe Marcus Clarke.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Alle Schriftarten in X11, die in den Verzeichnissen
``/usr/local/lib/X11/fonts/`` und ``~/.fonts/`` gefunden werden, werden
automatisch f?r Anti-aliasing an Anwendungen zur Verf?gung gestellt, die
Xft beherrschen. Die meisten aktuellen Anwendungen beherrschen Xft, dazu
geh?ren auch KDE, GNOME und Firefox.

In der Datei ``/usr/local/etc/fonts/local.conf`` werden die
Schriftarten, die mit dem Anti-aliasing-Verfahren benutzt werden sollen
und die Eigenschaften des Verfahrens festgelegt. In diesem Abschnitt
wird nur die grundlegende Konfiguration von Xft beschrieben. Weitere
Details entnehmen Sie bitte der Hilfeseite
`fonts-conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=fonts-conf&sektion=5>`__.

Die Datei ``local.conf`` ist ein XML-Dokument. Achten Sie beim Editieren
der Datei daher auf die richtige Gro?- und Kleinschreibung und darauf,
dass alle Tags geschlossen sind. Die Datei beginnt mit der ?blichen
XML-Deklaration gefolgt von einer DOCTYPE-Definition und dem
``<fontconfig>``-Tag:

.. code:: programlisting

            <?xml version="1.0"?>
            <!DOCTYPE fontconfig SYSTEM "fonts.dtd">
            <fontconfig>
          

Wie vorher erw?hnt, stehen schon alle Schriftarten in
``/usr/local/lib/X11/fonts/`` und ``~/.fonts/`` f?r Anwendungen, die Xft
unterst?tzen, zur Verf?gung. Wenn Sie ein Verzeichnis au?erhalb dieser
beiden B?ume benutzen wollen, f?gen Sie eine Zeile wie die nachstehende
zu ``/usr/local/etc/fonts/local.conf`` hinzu:

.. code:: programlisting

    <dir>/path/to/my/fonts</dir>

Wenn Sie neue Schriftarten hinzugef?gt haben, m?ssen Sie den
Schriftarten-Cache neu aufbauen:

.. code:: screen

    # fc-cache -f

Das Anti-aliasing-Verfahren zeichnet R?nder leicht unscharf, dadurch
werden kleine Schriften besser lesbar und der Treppenstufen-Effekt bei
wird gro?en Schriften vermieden. Auf normale Schriftgr??en sollte das
Verfahren aber nicht angewendet werden, da dies die Augen zu sehr
anstrengt. Um kleinere Schriftgr??en als 14?Punkt von dem Verfahren
auszunehmen, f?gen Sie in ``local.conf`` die nachstehenden Zeilen ein:

.. code:: programlisting

            <match target="font">
                <test name="size" compare="less">
                    <double>14</double>
                </test>
                <edit name="antialias" mode="assign">
                    <bool>false</bool>
                </edit>
            </match>
            <match target="font">
                <test name="pixelsize" compare="less" qual="any">
                    <double>14</double>
                </test>
                <edit mode="assign" name="antialias">
                    <bool>false</bool>
                </edit>
            </match>

Das Anti-aliasing-Verfahren kann die Abst?nde einiger Fixschriften
falsch darstellen, dies f?llt besonders unter KDE auf. Sie k?nnen das
Problem umgehen, indem Sie die Abst?nde dieser Schriften auf den Wert
``100`` festsetzen. F?gen Sie die nachstehenden Zeilen hinzu:

.. code:: programlisting

           <match target="pattern" name="family">
               <test qual="any" name="family">
                   <string>fixed</string>
               </test>
               <edit name="family" mode="assign">
                   <string>mono</string>
               </edit>
            </match>
            <match target="pattern" name="family">
                <test qual="any" name="family">
                    <string>console</string>
                </test>
                <edit name="family" mode="assign">
                    <string>mono</string>
                </edit>
            </match>

Damit werden die Namen der gebr?uchlichen Fixschriften auf ``"mono"``
abgebildet. F?r diese Schriften setzen Sie dann den Abstand fest:

.. code:: programlisting

             <match target="pattern" name="family">
                 <test qual="any" name="family">
                     <string>mono</string>
                 </test>
                 <edit name="spacing" mode="assign">
                     <int>100</int>
                 </edit>
             </match>      

Bestimmte Schriftarten, wie Helvetica, k?nnen Probleme mit dem
Anti-Aliasing-Verfahren verursachen. In der Regel erscheinen diese
Schriftarten dann vertikal halbiert. Im schlimmsten Fall st?rzen
Anwendungen als Folge davon ab. Sie vermeiden dies, indem Sie betroffene
Schriftarten in ``local.conf`` von dem Verfahren ausnehmen:

.. code:: programlisting

             <match target="pattern" name="family">
                 <test qual="any" name="family">
                     <string>Helvetica</string>
                 </test>
                 <edit name="family" mode="assign">
                     <string>sans-serif</string>
                 </edit>
             </match>        

Wenn Sie ``local.conf`` editiert haben, stellen Sie bitte sicher, dass
die Datei mit dem Tag ``</fontconfig>`` endet. Ist das nicht der Fall,
werden die ?nderungen nicht ber?cksichtigt.

Benutzer k?nnen eigene Einstellungen in der Datei ``~/.fonts.conf``
vornehmen. Achten Sie auch hier auf die richtige XML-Syntax.

Mit einem LCD k?nnen Sie *sub-pixel sampling* anstelle von Anti-aliasing
einsetzen. Dieses Verfahren behandelt die horizontal getrennten Rot-,
Gr?n- und Blau-Komponenten eines Pixels gesondert und verbessert damit
(teilweise sehr wirksam) die horizontale Aufl?sung. Die nachstehende
Zeile in ``local.conf`` aktiviert diese Funktion:

.. code:: programlisting

             <match target="font">
                 <test qual="all" name="rgba">
                     <const>unknown</const>
                 </test>
                 <edit name="rgba" mode="assign">
                     <const>rgb</const>
                 </edit>
             </match>

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Abh?ngig von der Art Ihres Bildschirms m?ssen Sie anstelle von ``rgb``
eines der folgenden verwenden: ``bgr``, ``vrgb`` oder ``vbgr``.
Experimentieren Sie und vergleichen, was besser aussieht.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------+-------------------------------+-------------------------------+
| `Zur?ck <x-config.html>`__?   | `Nach oben <x11.html>`__      | ?\ `Weiter <x-xdm.html>`__    |
+-------------------------------+-------------------------------+-------------------------------+
| 6.4. X11 konfigurieren?       | `Zum Anfang <index.html>`__   | ?6.6. Der X-Display-Manager   |
+-------------------------------+-------------------------------+-------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
