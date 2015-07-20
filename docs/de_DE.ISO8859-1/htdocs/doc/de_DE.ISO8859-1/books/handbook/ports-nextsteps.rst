==========================
5.6. Nach der Installation
==========================

.. raw:: html

   <div class="navheader">

5.6. Nach der Installation
`Zur?ck <ports-using.html>`__?
Kapitel 5. Installieren von Anwendungen: Pakete und Ports
?\ `Weiter <ports-broken.html>`__

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

5.6. Nach der Installation
--------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Nach der Installation einer neuen Anwendung wollen Sie wahrscheinlich
die mitgelieferte Dokumentation lesen und die Konfigurationsdateien der
Anwendung anpassen. Wenn die Anwendung ein D?mon ist, sollten Sie
sicherstellen, dass die Anwendung beim Booten startet.

Die einzelnen Schritte sind nat?rlich von Anwendung zu Anwendung
verschieden. Wenn Sie sich allerdings nach der Installation einer
Anwendung die Frage „Was nun?“ stellen, helfen die folgenden Hinweise
vielleicht weiter.

.. raw:: html

   <div class="itemizedlist">

-  Finden Sie mit
   `pkg\_info(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_info&sektion=1>`__
   heraus, welche Dateien die Anwendung wo installiert hat. Wenn Sie
   beispielsweise gerade die Version 1.0.0 von FooPackage installiert
   haben, zeigt Ihnen das folgende Kommando alle installierten Dateien
   des Pakets:

   .. code:: screen

       # pkg_info -L foopackage-1.0.0 | less

   Achten Sie besonders auf die Manualpages, die Sie in ``man/``
   Verzeichnissen finden und auf Konfigurationsdateien, die in ``etc/``
   abgelegt werden. Manche Pakete enthalten in ``doc/`` zus?tzliche
   Dokumentation.

   Wenn Sie sich nicht sicher sind, welche Version einer Anwendung Sie
   gerade installiert haben, k?nnen Sie mit dem folgenden Kommando nach
   der Anwendung suchen:

   .. code:: screen

       # pkg_info | grep -i foopackage

   Das Kommando zeigt alle installierten Pakete, deren Paketname
   *``foopackage``* enth?lt. Ersetzen Sie *``foopackage``* durch den
   Namen der Anwendung, die Sie suchen.

-  Nachdem Sie die Manualpages der Anwendung gefunden haben, lesen Sie
   diese bitte mit
   `man(1) <http://www.FreeBSD.org/cgi/man.cgi?query=man&sektion=1>`__.
   Schauen Sie sich auch die Beispiele f?r Konfigurationsdateien und die
   zus?tzliche Dokumentation, wenn es welche gibt, an.

-  Wenn es f?r die Anwendung eine Webseite gibt, suchen Sie dort nach
   zus?tzlicher Dokumentation wie FAQs (h?ufig gestellte Fragen). Wenn
   Sie die Adresse der Webseite nicht kennen, versuchen Sie das folgende
   Kommando:

   .. code:: screen

       # pkg_info foopackage-1.0.0

   Die Ausgabe enth?lt oft eine Zeile, die mit ``WWW:`` beginnt und die
   URL der Webseite enth?lt.

-  Ports, die w?hrend des Systemstarts gestartet werden sollen,
   installieren meist ein Beispielskript im Verzeichnis
   ``/usr/local/etc/rc.d``. ?berpr?fen Sie dieses Skript. Wenn n?tig,
   passen Sie das Skript an und benennen Sie es um. Weitere
   Informationen finden Sie in `Abschnitt?12.5, „Start von
   Diensten“ <configtuning-starting-services.html>`__.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------+-------------------------------+-------------------------------------+
| `Zur?ck <ports-using.html>`__?      | `Nach oben <ports.html>`__    | ?\ `Weiter <ports-broken.html>`__   |
+-------------------------------------+-------------------------------+-------------------------------------+
| 5.5. Benutzen der Ports-Sammlung?   | `Zum Anfang <index.html>`__   | ?5.7. Kaputte Ports                 |
+-------------------------------------+-------------------------------+-------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
