===========================
5.3. Suchen einer Anwendung
===========================

.. raw:: html

   <div class="navheader">

5.3. Suchen einer Anwendung
`Zur?ck <ports-overview.html>`__?
Kapitel 5. Installieren von Anwendungen: Pakete und Ports
?\ `Weiter <packages-using.html>`__

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

5.3. Suchen einer Anwendung
---------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Bevor Sie eine Anwendung installieren, m?ssen Sie deren Art und Namen
kennen.

Die Anzahl der nach FreeBSD portierten Anwendungen steigt st?ndig. Zum
Gl?ck gibt es einige Wege, die richtige zu finden.

.. raw:: html

   <div class="itemizedlist">

-  Eine aktuelle Liste verf?gbarer Anwendungen, die sich auch
   durchsuchen l?sst, finden Sie unter
   `http://www.FreeBSD.org/ports/ <../../../../ports/index.html>`__. Die
   Anwendungen sind in Kategorien unterteilt und Sie k?nnen sich alle
   Anwendungen einer Kategorie anzeigen lassen. Wenn Sie den Namen der
   Anwendung kennen, k?nnen Sie nat?rlich auch direkt nach dem Namen
   suchen.

-  

   FreshPorts, das von Dan Langille gepflegt wird, erreichen Sie unter
   ``http://www.FreshPorts.org/``. FreshPorts verfolgt ?nderungen an
   Anwendungen aus den Ports. Mit FreshPorts k?nnen Sie ein oder mehrere
   Ports beobachten und sich eine E-Mail schicken lassen, wenn ein Port
   aktualisiert wird.

-  

   Wenn Sie den Namen einer Anwendung nicht kennen, versuchen Sie eine
   Webseite wie ``Freecode.com``, um eine passende Anwendung zu finden.
   Schauen Sie dann auf der FreeBSD-Webseite nach, ob die Anwendung
   schon portiert wurde.

-  Wenn Sie den Portnamen kennen und nur nach der Kategorie suchen
   wollen, verwenden Sie das Kommando
   `whereis(1) <http://www.FreeBSD.org/cgi/man.cgi?query=whereis&sektion=1>`__.
   Geben Sie einfach ``whereis Datei`` ein. *``Datei``* ist der Name des
   Programms, das Sie suchen:

   .. code:: screen

       # whereis lsof
       lsof: /usr/ports/sysutils/lsof

   Damit haben wir herausgefunden, dass sich ``lsof``, ein
   Systemwerkzeug, im Verzeichnis ``/usr/ports/sysutils/lsof`` befindet.

-  Auch mit einem einfachen
   `echo(1) <http://www.FreeBSD.org/cgi/man.cgi?query=echo&sektion=1>`__-Befehl
   k?nnen Sie herausfinden, wo Sie einen bestimmten Port finden. Dazu
   ein Beispiel:

   .. code:: screen

       # echo /usr/ports/*/*lsof*
                 /usr/ports/sysutils/lsof

   Beachten Sie aber, dass dieser Befehl auch alle Dateien im
   Verzeichnis ``/usr/ports/distfiles`` findet, auf die der angegebene
   Suchbegriff passt.

-  Ein weiterer Weg, einen bestimmten Port zu finden, ist es, die
   eingebaute Suchfunktion der Ports-Sammlung zu benutzen. Dazu muss Ihr
   Arbeitsverzeichnis ``/usr/ports`` sein. In diesem Verzeichnis rufen
   Sie ``make search       name=Anwendungsname`` auf, wobei
   *``Anwendungsname``* der Name der gesuchten Anwendung ist. Wenn Sie
   zum Beispiel nach ``lsof`` suchen:

   .. code:: screen

       # cd /usr/ports
       # make search name=lsof
       Port:   lsof-4.56.4
       Path:   /usr/ports/sysutils/lsof
       Info:   Lists information about open files (similar to fstat(1))
       Maint:  obrien@FreeBSD.org
       Index:  sysutils
       B-deps:
       R-deps: 

   Der Teil der Ausgabe der Sie interessiert ist die Zeile, die mit
   „Path:“ beginnt, weil sie Ihnen sagt, wo der Port zu finden ist. Die
   anderen Informationen werden zum Installieren des Ports nicht direkt
   ben?tigt, Sie brauchen sich darum jetzt nicht weiter zu k?mmern.

   Erweiterte Suchen f?hren Sie mit dem Kommando
   ``make search       key=Text`` aus. Damit werden Portnamen,
   Kommentare, Beschreibungen und Abh?ngigkeiten nach *``Text``*
   durchsucht. Dies kann sehr n?tzlich sein, wenn Sie den Namen des
   Programms, nach dem Sie suchen, nicht kennen.

   In beiden F?llen wird Gro?- und Kleinschreibung bei der Suche
   ignoriert. Die Suche nach „LSOF“ wird dieselben Ergebnisse wie die
   Suche nach „lsof“ liefern.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------+-------------------------------+---------------------------------------+
| `Zur?ck <ports-overview.html>`__?   | `Nach oben <ports.html>`__    | ?\ `Weiter <packages-using.html>`__   |
+-------------------------------------+-------------------------------+---------------------------------------+
| 5.2. Installation von Software?     | `Zum Anfang <index.html>`__   | ?5.4. Benutzen des Paketsystems       |
+-------------------------------------+-------------------------------+---------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
