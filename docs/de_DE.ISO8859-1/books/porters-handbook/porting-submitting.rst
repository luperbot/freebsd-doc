==============================
3.6. Den neuen Port einreichen
==============================

.. raw:: html

   <div class="navheader">

3.6. Den neuen Port einreichen
`Zur?ck <porting-portlint.html>`__?
Kapitel 3. Einen neuen Port erstellen
?\ `Weiter <slow.html>`__

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

3.6. Den neuen Port einreichen
------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Bevor Sie den neuen Port einreichen, lesen Sie bitte unbedingt den
Abschnitt `DOs and DON'Ts <porting-dads.html>`__.

Nun, da Sie mit Ihrem Port zufrieden sind, m?ssen Sie ihn nur noch in
den Haupt-Ports-Tree von FreeBSD einbringen, damit alle daran teilhaben
k?nnen. Wir ben?tigen nicht Ihr ``work``-Verzeichnis oder Ihr
``pkgname.tgz``-Paket?–?diese k?nnen Sie nun l?schen. Wenn Ihr Port
beispielsweise ``oneko`` hei?t, wechseln Sie in das Verzeichnis, in dem
sich das Verzeichnis ``oneko`` befindet und f?hren den Befehl
``shar `find oneko` > oneko.shar`` aus.

F?gen Sie Ihre Datei ``oneko.shar`` einem Fehlerbericht an und senden
Sie diesen mit Hilfe des Programms
`send-pr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=send-pr&sektion=1>`__
(unter `Bug Reports and General
Commentary <../../../../doc/de_DE.ISO8859-1/articles/contributing/contrib-how.html#CONTRIB-GENERAL>`__
finden Sie weitere Informationen ?ber
`send-pr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=send-pr&sektion=1>`__).
Ordnen Sie den Fehlerbericht bitte in die Kategorie ``Ports`` mit der
Klasse ``Change-Request`` ein (Markieren Sie den Bericht nicht als
``vertraulich`` (``confidential``)!). F?gen Sie bitte eine kurze
Beschreibung des Programms, das Sie portiert haben, in das
„Beschreibungs“-Feld des Problemberichts und die shar-Datei in das
„Fix“-Feld ein (bespielsweise eine kurze Version des ``COMMENT``).

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Sie k?nnen uns die Arbeit um einiges vereinfachen, wenn Sie eine gute
Beschreibung in der Zusammenfassung des Problemberichtes verwenden. Wir
bevorzugen etwas wie „Neuer Port:
<Kategorie>/<Portname><Kurzbeschreibung des Ports>“ f?r neue Ports. Wenn
Sie sich an dieses Schema halten, ist die Chance, dass sich jemand bald
Ihren Bericht ansieht, deutlich besser.

.. raw:: html

   </div>

Noch einmal: *Bitte f?gen Sie nicht das distfile der Originalquelle, das
``work``-Verzeichnis oder das Paket, das Sie mit ``make package``
erstellt haben, ein.* Und verwenden Sie
`shar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=shar&sektion=1>`__
f?r neue Ports (und NICHT
`diff(1) <http://www.FreeBSD.org/cgi/man.cgi?query=diff&sektion=1>`__).

Haben Sie bitte etwas Geduld, nachdem Sie den Port eingereicht haben.
Manchmal kann es einige Monate dauern, bevor ein Port in FreeBSD
eingef?gt wird, obwohl es wahrscheinlich nur ein paar Tage dauert. Sie
k?nnen sich die `Liste der PRs, die darauf warten, in FreeBSD committet
zu
werden <http://www.FreeBSD.org/cgi/query-pr-summary.cgi?category=ports>`__,
ansehen.

Nachdem wir einen Blick auf Ihren Port geworfen haben, werden wir, wenn
n?tig, bei Ihnen nachfragen und ihn in die Ports-Sammlung ?bernehmen.
Ihr Name taucht dann auch in der Liste der `Additional FreeBSD
Contributors <../../../../doc/de_DE.ISO8859-1/articles/contributors/contrib-additional.html>`__
und in anderen Dateien auf. Ist das nicht toll?! :-)

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------------+--------------------------------------+--------------------------------------------------+
| `Zur?ck <porting-portlint.html>`__?            | `Nach oben <quick-porting.html>`__   | ?\ `Weiter <slow.html>`__                        |
+------------------------------------------------+--------------------------------------+--------------------------------------------------+
| 3.5. Ihren Port mit ``portlint`` ?berpr?fen?   | `Zum Anfang <index.html>`__          | ?Kapitel 4. Einen Port in aller Ruhe erstellen   |
+------------------------------------------------+--------------------------------------+--------------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
