=========================
3. Sich im System umsehen
=========================

.. raw:: html

   <div class="navheader">

3. Sich im System umsehen
`Zur?ck <adding-a-user.html>`__?
?
?\ `Weiter <getting-help.html>`__

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

3. Sich im System umsehen
-------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Nachdem wir uns als gew?hnlicher Benutzer angemeldet haben, sehen wir
uns nun im System um und testen einige Befehle, die uns den Zugriff auf
die Hilfefunktion erm?glichen sowie einige Informationen ?ber unser
System liefern.

.. raw:: html

   <div class="variablelist">

``id``
    Sagt uns, wer wir sind!

``pwd``
    Zeigt uns, wo wir uns befinden, gibt also das aktuelle Verzeichnis
    (*working directory*) aus.

``ls``
    Listet die Dateien im aktuellen Verzeichnis auf.

``ls -F``
    Listet Dateien im aktuellen Verzeichnis auf und kennzeichnet
    ausf?hrbare Dateien mit einem ``*``, Verzeichnisse mit einem ``/``,
    sowie symbolische Links mit ``@``.

``ls -l``
    Listet Dateiem im Langformat auf, dabei werden Gr??e, Datum und
    Rechte angezeigt.

``ls -a``
    Listet auch versteckte Dateien auf (so genannte „dot“-Dateien).
    Falls Sie als ``root`` angemeldet sind, werden die „dot“-Dateien
    auch ohne die Option ``-a`` angezeigt.

``cd``
    Wechselt das Verzeichnis. ``cd         ..`` wechselt in der
    Verzeichnishierarchie eine Stufe nach oben (beachten Sie das
    Leerzeichen nach ``cd``!). ``cd /usr/local`` wechselt dorthin.
    ``cd ~`` wechselt wechselt in des Heimatverzeichnis des angemeldeten
    Benutzers, in unserem Fall nach ``/usr/home/jack``. Geben Sie
    ``cd /cdrom``, gefolgt von ``ls``, ein, um herauszufinden, ob Ihr
    CD-ROM-Laufwerk eingebunden ist und funktioniert.

``view           Dateiname``
    Zeigt den Inhalt von *``Dateiname``* auf dem Bildschirm an. Falls
    der Inhalt der Datei zu lang ist, und Sie nur das Ende sehen,
    aktivieren Sie die **Rollen**-Taste und dr?cken dann die **Bild
    hoch**-Taste, um nach oben zu scrollen. Sie k?nnen die
    **Rollen**-Taste auch bei Manualpages verwenden. Dr?cken Sie die
    **Rollen**-Taste nochmals, um das Scrollen zu beenden. Sie sollten
    sich auch einige der versteckten Dateien in Ihrem Heimatverzeichnis
    mit ``cat`` ansehen: ``cat             .cshrc``,
    ``cat             .login``, ``cat             .profile``.

.. raw:: html

   </div>

In ``.cshrc`` sind einige n?tzliche Aliase f?r den Befehl ``ls``
definiert. Dort k?nnen Sie auch zus?tzliche Aliase definieren. Um diese
Aliase allen Benutzern zur Verf?gung zu stellen, m?ssen Sie diese in
``/etc/csh.cshrc``, der systemweiten Konfigurationsdatei von ``csh``,
eintragen.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------------------------------------+-------------------------------+----------------------------------------+
| `Zur?ck <adding-a-user.html>`__?                                      | ?                             | ?\ `Weiter <getting-help.html>`__      |
+-----------------------------------------------------------------------+-------------------------------+----------------------------------------+
| 2. Einen neuen Benutzer anlegen, der ``root``-Rechte erlangen kann?   | `Zum Anfang <index.html>`__   | ?4. Hilfe und Informationen erhalten   |
+-----------------------------------------------------------------------+-------------------------------+----------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
