==================
3. Voraussetzungen
==================

.. raw:: html

   <div class="navheader">

3. Voraussetzungen
`Zur?ck <introduction.html>`__?
?
?\ `Weiter <Configuration.html>`__

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

3. Voraussetzungen
------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

F?r den Bau eines internen FreeBSD Update Server sollten einige
Anforderungen erf?llt werden.

.. raw:: html

   <div class="itemizedlist">

-  Ein laufendes FreeBSD System.

   .. raw:: html

      <div class="note" xmlns="">

   Anmerkung:
   ~~~~~~~~~~

   Als Minimum, muss das zu verteilende Ziel-Release auf einer gleichen,
   oder h?heren FreeBSD Version gebaut werden.

   .. raw:: html

      </div>

-  Ein Benutzerkonto mit mindestens 4?GB freiem Speicherplatz. Dies
   erlaubt die Erstellung der Updates f?r 7.1 und 7.2. Der genaue
   Platzbedarf kann sich aber von Version zu Version ?ndern.

-  Ein
   `ssh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh&sektion=1>`__
   Konto auf einem entfernten System, um die sp?ter zu verteilenden
   Updates hochzuladen.

-  Einen Webserver, wie
   `Apache <../../../../doc/de_DE.ISO8859-1/books/handbook/network-apache.html>`__,
   wobei ?ber die H?lfte des Platzes f?r den Bau ben?tigt wird. Als
   Beispiel ben?tigt der Bau von 7.1 und 7.2 insgesamt 4?GB. Der
   Speicherplatz, den der Webserver f?r die Verteilung dieser Updates
   ben?tigt, w?rde 2.6?GB betragen.

-  Grundlegende Kenntnisse im Shell Skripting mit der Bourne Shell,
   `sh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sh&sektion=1>`__.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------+-------------------------------+-------------------------------------------+
| `Zur?ck <introduction.html>`__?   | ?                             | ?\ `Weiter <Configuration.html>`__        |
+-----------------------------------+-------------------------------+-------------------------------------------+
| 2. Einf?hrung?                    | `Zum Anfang <index.html>`__   | ?4. Konfiguration: Installation & Setup   |
+-----------------------------------+-------------------------------+-------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
