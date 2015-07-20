========================================
12.18. Erneutes Ausliefern von Distfiles
========================================

.. raw:: html

   <div class="navheader">

12.18. Erneutes Ausliefern von Distfiles
`Zur?ck <dads-sysctl.html>`__?
Kapitel 12. Was man machen respektive vermeiden sollte
?\ `Weiter <dads-misc.html>`__

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

12.18. Erneutes Ausliefern von Distfiles
----------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Manchmal ?ndern die Autoren der Software den Inhalt ver?ffentlichter
Distfiles, ohne den Dateinamen zu ?ndern. Sie m?ssen ?berpr?fen, ob die
?nderungen offizell sind und vom Autor durchgef?hrt wurden. Es ist in
der Vergangenheit vorgekommen, dass Distfiles still und heimlich auf dem
Download-Server ge?ndert wurden, um Schaden zu verursachen oder die
Sicherheit der Nutzer zu kompromittieren.

Verschieben Sie das alte Distfile und laden Sie das neue herunter.
Entpacken Sie es und vergleichen Sie den Inhalt mittels
`diff(1) <http://www.FreeBSD.org/cgi/man.cgi?query=diff&sektion=1>`__.
Wenn Sie nichts Verd?chtiges sehen k?nnen Sie ``distinfo``
aktualisieren. Stellen Sie sicher, dass die ?nderungen in Ihrem PR oder
Commit-Protokoll zusammengefasst sind, um zu Gew?hrleisten, dass nichts
Negatives passiert ist.

Sie k?nnen auch mit den Autoren der Software in Verbindung treten und
sich die ?nderungen best?tigen lassen.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------+-------------------------------------+----------------------------------+
| `Zur?ck <dads-sysctl.html>`__?      | `Nach oben <porting-dads.html>`__   | ?\ `Weiter <dads-misc.html>`__   |
+-------------------------------------+-------------------------------------+----------------------------------+
| 12.17. Verwendung von ``sysctl``?   | `Zum Anfang <index.html>`__         | ?12.19. Verschiedenes            |
+-------------------------------------+-------------------------------------+----------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
