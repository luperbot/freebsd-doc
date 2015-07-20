===================================================
H?ufig gestellte Fragen zu FreeBSD 7.X, 8.X und 9.X
===================================================

.. raw:: html

   <div class="navheader">

H?ufig gestellte Fragen zu FreeBSD 7.\ *``X``*, 8.\ *``X``* und
9.\ *``X``*
?
?
?\ `Weiter <introduction.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="book" lang="de" lang="de">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

.. raw:: html

   </div>

.. raw:: html

   <div>

Frequently Asked Questions zu FreeBSD 7.\ *``X``*, 8.\ *``X``* und 9.\ *``X``*
------------------------------------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="authorgroup" xmlns="http://www.w3.org/1999/xhtml">

.. raw:: html

   <div class="author">

The FreeBSD German Documentation Project
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="authorgroup" xmlns="http://www.w3.org/1999/xhtml">

.. raw:: html

   <div class="author">

Robert S. F. Drehmel
~~~~~~~~~~~~~~~~~~~~

?bersetzt von ?

.. raw:: html

   </div>

.. raw:: html

   <div class="author">

Dirk Gouders
~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div class="author">

Udo Erdhoff
~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div class="author">

Johann Kois
~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div class="author">

Benedict Reuschling
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div>

Version: ` <https://svnweb.freebsd.org/changeset/doc/>`__

.. raw:: html

   </div>

.. raw:: html

   <div>

Copyright ? 1995-2012 The FreeBSD Documentation Project

.. raw:: html

   </div>

.. raw:: html

   <div>

Copyright ? 2000 - 2011 The FreeBSD German Documentation Project

.. raw:: html

   </div>

.. raw:: html

   <div>

`Rechtlicher Hinweis <legalnotice.html>`__

.. raw:: html

   </div>

.. raw:: html

   <div>

`Rechtlicher Hinweis <trademarks.html>`__

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="abstract" xmlns="http://www.w3.org/1999/xhtml">

.. raw:: html

   <div class="abstract-title">

Zusammenfassung

.. raw:: html

   </div>

Dies ist die FAQ f?r die FreeBSD-Versionen 7.\ *``X``* 8.\ *``X``* und
9.\ *``X``*. Alle Eintr?ge sollten f?r FreeBSD ab Version 7.\ *``X``*
relevant sein, andernfalls wird darauf explizit hingewiesen. Falls Sie
daran interessiert sein sollten, an diesem Projekt mitzuarbeiten, senden
Sie eine Mail an die Mailingliste 'FreeBSD German Documentation Project'
``<de-bsd-translators@de.FreeBSD.org>``. Die aktuelle Version dieses
Dokuments ist st?ndig auf dem `FreeBSD
World-Wide-Web-Server <http://www.FreeBSD.org/>`__ verf?gbar. Sie kann
aber auch als eine einzige gro?e `HTML <book.html>`__-Datei, als
Textdatei, als PostScript?- oder PDF-Datei sowie in verschiedenen
anderen Formaten vom `FreeBSD
FTP-Server <ftp://ftp.de.FreeBSD.org/pub/FreeBSD/doc/>`__
heruntergeladen werden. Alternativ k?nnen Sie die FAQ auch
`durchsuchen <../../../../search/search.html>`__.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="docformatnavi">

[ einzelne Abschnitte / `komplettes Dokument <book.html>`__ ]

.. raw:: html

   </div>

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Inhaltsverzeichnis

.. raw:: html

   </div>

`1. Einleitung <introduction.html>`__
`2. Dokumentation und Support <support.html>`__
`3. Installation <install.html>`__
`4. Hardware-Kompatibilit?t <hardware.html>`__
`4.1. Allgemeines <hardware.html#compatibility-general>`__
`4.2. Hauptspeicher <compatibility-memory.html>`__
`4.3. Architekturen und Prozessoren <compatibility-processors.html>`__
`4.4. Festplatten, Bandlaufwerke, sowie CD- und
DVD-Laufwerke <compatibility-drives.html>`__
`4.5. Tastaturen und M?use <compatibility-kbd-mice.html>`__
`4.6. Netzkarten und serielle Ger?te <compatibility-networking.html>`__
`4.7. Soundkarten <compatibility-sound.html>`__
`4.8. Sonstige Hardware <compatibility-other.html>`__
`5. Fehlerbehebung <troubleshoot.html>`__
`6. Kommerzielle Anwendungen <commercial.html>`__
`7. Benutzerprogramme <applications.html>`__
`8. Kernelkonfiguration <kernelconfig.html>`__
`9. Platten, Dateisysteme und Boot Loader <disks.html>`__
`10. Systemadministration <admin.html>`__
`11. Das X Window System und virtuelle Konsolen <x.html>`__
`12. Netzwerke <networking.html>`__
`13. Sicherheit <security.html>`__
`14. PPP <ppp.html>`__
`15. Serielle Verbindungen <serial.html>`__
`16. Verschiedene Fragen <misc.html>`__
`17. Nicht ganz ernstgemeinte Fragen <funnies.html>`__
`18. Weiterf?hrende Themen <advanced.html>`__
`19. Danksagung <acknowledgments.html>`__
`Bibliographie <bibliography.html>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="list-of-tables">

.. raw:: html

   <div class="toc-title">

Tabellenverzeichnis

.. raw:: html

   </div>

3.1. `Maximale Dateigr??e <install.html#idp65015632>`__
12.1. `Netzwerkkarten mit
DEC-PCI-Chipsatz <networking.html#idp69593296>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="list-of-examples">

.. raw:: html

   <div class="toc-title">

Liste der Beispiele

.. raw:: html

   </div>

11.1. `Abschnitt „InputDevice“ f?r Rad-M?use in der Konfigurationsdatei
von Xorg <x.html#idp69270480>`__
11.2. `„.emacs“ Beispiel f?r seitenweises Bl?ttern mit einer Rad-Maus
(optional) <x.html#idp69272016>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----+-----+-------------------------------------+
| ?   | ?   | ?\ `Weiter <introduction.html>`__   |
+-----+-----+-------------------------------------+
| ?   | ?   | ?Kapitel 1. Einleitung              |
+-----+-----+-------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
