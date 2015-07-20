==================
5.7. Kaputte Ports
==================

.. raw:: html

   <div class="navheader">

5.7. Kaputte Ports
`Zur?ck <ports-nextsteps.html>`__?
Kapitel 5. Installieren von Anwendungen: Pakete und Ports
?\ `Weiter <x11.html>`__

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

5.7. Kaputte Ports
------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Stolpern Sie einmal ?ber einen Port, der bei Ihnen nicht funktioniert,
k?nnten Sie zum Beispiel Folgendes tun:

.. raw:: html

   <div class="orderedlist">

#. Stellen Sie fest, ob die `Datenbank mit den
   Problemberichten <../../../../de/support.html#gnats>`__ bereits einen
   L?sungsvorschlag enth?lt. Ist dies der Fall, k?nnen Sie die
   vorgeschlagene L?sung testen.

#. Bitten Sie den Betreuer des Ports um Hilfe. Geben Sie dazu
   ``make maintainer`` ein oder lesen Sie das ``Makefile`` im
   Verzeichnis des Ports, um an die E-Mail-Adresse zu kommen. Vergessen
   Sie nicht den Namen und die Version des Ports (schicken Sie die Zeile
   mit ``$FreeBSD:`` aus dem ``Makefile``) und die Ausgabe bis zur
   Fehlermeldung mitzuschicken.

   .. raw:: html

      <div class="note" xmlns="">

   Anmerkung:
   ~~~~~~~~~~

   Einige Ports werden nicht von einer Einzelperson, sondern von einer
   `Mailingliste <../../../../doc/en_US.ISO8859-1/articles/mailing-list-faq/article.html>`__
   betreut. Viele (aber nicht alle) dieser Adressen haben die Form
   ``<freebsd-NameDerListe@FreeBSD.org>``. Denken Sie daran, wenn Sie
   Ihre Fragen formulieren.

   Dies gilt insbesondere f?r Ports, die als Betreuer den Eintrag
   ``<ports@FreeBSD.org>`` aufweisen. Derartige Ports haben ?berhaupt
   keinen Betreuer. Korrekturen und Unterst?tzung kommen daher nur von
   Personen, die diese Mailingliste abonniert haben. Gerade in diesem
   Bereich werden jederzeit zus?tzliche freiwillige Helfer ben?tigt!

   .. raw:: html

      </div>

   Erhalten Sie auf Ihre Anfrage keine Antwort, k?nnen Sie ?ber
   `send-pr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=send-pr&sektion=1>`__
   einen Problembericht erstellen. Bevor Sie einen solchen Bericht
   erstellen, sollten Sie den Artikel `Writing FreeBSD Problem
   Reports <../../../../doc/en_US.ISO8859-1/articles/problem-reports/article.html>`__
   lesen.

#. Reparieren Sie ihn! Das `FreeBSD Porter's
   Handbook <../../../../doc/en_US.ISO8859-1/books/porters-handbook/index.html>`__
   enth?lt eine detaillierte Beschreibung des Portsystems. Damit sind
   Sie in der Lage, einen gelegentlich kaputten Port zu reparieren oder
   einen eigenen Port zu erstellen.

#. Holen Sie sich das Paket von einem FTP-Server in Ihrer N?he. Die
   „Basis“-Sammlung aller Pakete liegt auf ``ftp.de.FreeBSD.org`` im
   Verzeichnis
   `packages <ftp://ftp.de.FreeBSD.org/pub/FreeBSD/ports/packages/>`__.
   Aber versuchen Sie *zuerst* einen `Spiegel in Ihrer
   N?he <mirrors-ftp.html>`__! Benutzen Sie das Programm
   `pkg\_add(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_add&sektion=1>`__,
   um Pakete auf Ihrem Rechner zu installieren. Dies hat zudem den
   Vorteil, dass es schneller geht.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+-------------------------------+-----------------------------------+
| `Zur?ck <ports-nextsteps.html>`__?   | `Nach oben <ports.html>`__    | ?\ `Weiter <x11.html>`__          |
+--------------------------------------+-------------------------------+-----------------------------------+
| 5.6. Nach der Installation?          | `Zum Anfang <index.html>`__   | ?Kapitel 6. Das X-Window-System   |
+--------------------------------------+-------------------------------+-----------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
