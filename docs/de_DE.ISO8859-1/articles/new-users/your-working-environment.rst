======================
9. Die Arbeitsumgebung
======================

.. raw:: html

   <div class="navheader">

9. Die Arbeitsumgebung
`Zur?ck <next-steps.html>`__?
?
?\ `Weiter <other.html>`__

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

9. Die Arbeitsumgebung
----------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Shell ist das wichtigste Programm Ihrer Arbeitsumgebung. Unter DOS
hei?t die Shell command.com. Die Shell interpretiert die Befehle, die
Sie auf der Kommandozeile eingeben und kommuniziert so mit dem Rest des
Betriebssystems. Sie k?nnen auch Shellskripte schreiben, die den
DOS-Batchdateien ?hnlich sind. Es handelt sich dabei um eine Folge von
Befehlen, die hintereinander ausgef?hrt werden.

Zwei Shells werden von FreeBSD automatisch installiert: ``csh`` und
``sh``. ``csh`` ist f?r die Arbeit auf der Kommandozeile komfortabler,
Skripten sollten allerdings f?r ``sh`` (oder f?r ``bash``) geschrieben
werden. Mit ``echo $SHELL`` k?nnen Sie herausfinden, welche Shell
benutzt wird.

Die ``csh``-Shell ist zwar nicht schlecht, aber die ``tcsh``-Shell kann
alles, was die ``csh`` kann und einiges mehr. Sie erlaubt es Ihnen,
ausgef?hrte Befehle mit den Pfeiltasten wieder aufzurufen und diese
sogar zu ver?ndern. Dateinamen oder Befehle k?nnen mit der
Tabulator-Taste automatisch vervollst?ndigt werden (``csh`` nutzt daf?r
**ESC**) und mit ``cd -`` k?nnen Sie schnell in das zuletzt verwendete
Verzeichnis wechseln. Auch der Prompt l?sst sich unter der
``tcsh``-Shell wesentlich einfacher anpassen. All diese Eigenschaften
erleichtern den Umgang mit dem Betriebssystem.

Wollen Sie eine neue Shell installieren, gehen Sie wie folgt vor:

.. raw:: html

   <div class="procedure">

#. Installieren Sie die Shell als Port oder Paket genau so, wie Sie
   jedes andere Programm als Port oder Paket installieren w?rden. Rufen
   Sie dann ``rehash`` sowie ``which tcsh`` auf (wir nehmen hier an,
   dass Sie ``tcsh`` installieren wollen), um sicher zu gehen, dass
   alles korrekt installiert wurde.

#. Als ``root`` editieren Sie nun ``/etc/shells``, und f?gen eine Zeile
   f?r die neue Shell ein, in unserem Fall also ``/usr/local/bin/tcsh``.
   Danach speichern Sie die Datei (Einige Ports erledigen diesen Schritt
   automatisch f?r Sie.).

#. Nutzen Sie ``chsh``, um ``tcsh`` dauerhaft als Ihre Shell zu
   definieren. Alternativ geben Sie einfach ``tcsh`` ein, ohne sich neu
   am System anzumelden.

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Bei fr?heren Versionen von FreeBSD und einigen anderen Versionen von
UNIX? traten Probleme auf, wenn ``root`` eine andere Shell als ``sh``
oder ``csh`` zugewiesen wurde; sie hatten dann keine funktionierende
Shell, wenn das System im Single-User-Modus ausgef?hrt wurde. Die L?sung
besteht darin, ``su -m`` einzugeben, um ``root`` zu werden, weil damit
``root`` die ``tcsh`` zugewiesen wird, da diese Shell Teil der Umgebung
ist. Dies kann auch fest als Alias in ``.tcshrc`` eingetragen werden:

.. code:: programlisting

    alias su su -m

.. raw:: html

   </div>

Wenn ``tcsh`` startet, werden ``/etc/csh.cshrc`` und ``/etc/csh.login``
eingelesen (analog zur ``csh``). Ebenfalls eingelesen werden ``.login``
und ``.cshrc`` des Heimatverzeichnisses, falls ``.tcshrc`` nicht
gefunden wurde. Sie k?nnen auch einfach ``.cshrc`` nach ``.tcshrc``
kopieren.

Da ``tcsh`` nun installiert ist, kann der Prompt angepasst werden.
Details dazu finden Sie in
`tcsh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tcsh&sektion=1>`__.
Die hier vorgeschlagene Zeile k?nnen Sie in Ihre ``.tcshrc`` eintragen.
Dadurch wird angezeigt, wie viele Befehle bereits eingegeben wurden.
Au?erdem erhalten Sie die aktuelle Uhrzeit sowie das aktuelle
Arbeitsverzeichnis. F?r den gew?hnlichen Benutzer wird ein ``>`` und f?r
``root`` ein ``#`` ausgegeben. Dabei handelt es sich um die
Standardeinstellung von ``tcsh``:

set prompt = "%h %t %~ %# "

Diese Zeile sollte an derselben Stelle eingef?gt werden, wie die
vorhandene "set prompt" Zeile oder nach "if($?prompt) then".
Kommentieren Sie die alte Zeile aus, damit diese notfalls wieder benutzt
werden kann. Vergessen Sie auch auf keinen Fall die Leerzeichen und
Hochkommata. ``.tcshrc`` wird neu eingelesen, wenn Sie
``source .tcshrc`` eingeben.

Eine Liste aller Umgebungsvariablen erhalten Sie, wenn Sie am Prompt
``env`` eingeben. Sie sehen dann den Default-Editor, -Pager,
-Terminaltyp und viele andere Umgebungsvariablen. Falls Sie sich von
einem entfernten Rechner anmelden und ein Programm nicht starten k?nnen,
weil das Terminal dazu nicht in der Lage ist, kann die Eingabe von
``setenv TERM vt100`` sehr hilfreich sein.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------+-------------------------------+-----------------------------------------+
| `Zur?ck <next-steps.html>`__?   | ?                             | ?\ `Weiter <other.html>`__              |
+---------------------------------+-------------------------------+-----------------------------------------+
| 8. Die n?chsten Schritte?       | `Zum Anfang <index.html>`__   | ?10. Einige abschlie?ende Bemerkungen   |
+---------------------------------+-------------------------------+-----------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
