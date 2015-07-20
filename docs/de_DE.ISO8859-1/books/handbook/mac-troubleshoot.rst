============================
17.17. Fehler im MAC beheben
============================

.. raw:: html

   <div class="navheader">

17.17. Fehler im MAC beheben
`Zur?ck <mac-userlocked.html>`__?
Kapitel 17. Verbindliche Zugriffskontrolle
?\ `Weiter <audit.html>`__

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

17.17. Fehler im MAC beheben
----------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

W?hrend der Entwicklung des Frameworks haben einige Nutzer auf Probleme
hingewiesen. Einige davon werden hier aufgef?hrt:

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

17.17.1. Die Option ``multilabel`` greift nicht auf der ``/``-Partition
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Es scheint, dass etwa jedem f?nfzigsten Nutzer dieses Problem
widerf?hrt. Und in der Tat - auch wir kennen es aus der Entwicklung.
Genauere Untersuchungen dieses „Bugs“ machten uns glauben, dass es sich
entweder um einen Fehler in oder eine fehlerhafte Interpretation der
Dokumentation handelt. Warum auch immer dieser Fehler auftritt - er kann
mit folgender Prozedur behoben werden:

.. raw:: html

   <div class="procedure">

#. ?ffnen Sie die Datei ``/etc/fstab`` und setzen Sie die Rootpartition
   auf ``ro`` wie „read-only“.

#. Starten Sie in den Einzelnutzermodus.

#. Rufen Sie ``tunefs`` ``-l enable`` f?r ``/`` auf.

#. Starten Sie in den Mehrbenutzermodus.

#. F?hren Sie ``mount`` ``-urw`` ``/`` aus und ?ndern Sie anschlie?end
   in der Datei ``/etc/fstab`` die Option ``ro`` zur?ck in ``rw``.
   Starten Sie das System noch einmal neu.

#. Achten Sie besonders auf die Ausgabe von ``mount`` um sich zu
   versichern, dass die ``multilabel`` korrekt f?r das root-Dateisystem
   gesetzt wurde.

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

17.17.2. Mit der aktivierten MAC kann ich keinen X11 Server starten
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dies kann durch die Richtlinie ``partition`` oder einer fehlerhaften
Verwendung einer Richtlinie, die mit Labels arbeitet, auftreten. Zum
debuggen versuchen Sie folgendes:

.. raw:: html

   <div class="procedure">

#. Schauen Sie sich die Fehlermeldungen genau an. Wenn der Nutzer einer
   ``insecure`` Klasse angeh?rt, ist wahrscheinlich die Richtlinie
   ``partition`` die Ursache. Versuchen Sie, die Nutzerklasse auf
   ``default`` zu stellen und danach die Datenbank mit ``cap_mkdb`` zu
   erneuern. Wenn das Problem dadurch nicht gel?st wird, gehen Sie
   weiter zu Schritt 2.

#. Gehen Sie die Label-Richtlinien Schritt f?r Schritt nocheinmal durch.
   Achten Sie darauf, dass f?r den Nutzer, bei dem das Problem auftritt,
   f?r X11 und das Verzeichnis ``/dev`` alle Einstellungen korrekt sind.

#. Falls all dies nicht helfen sollte, senden Sie die Fehlermeldung und
   eine Beschreibung ihrer Arbeitsumgebung an die (englisch-sprachige)
   TrustedBSD Diskussionsliste auf der
   `TrustedBSD <http://www.TrustedBSD.org>`__ Webseite oder an die
   `FreeBSD general
   questions <http://lists.FreeBSD.org/mailman/listinfo/freebsd-questions>`__
   Mailingliste.

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

17.17.3. Error: `\_secure\_path(3) <http://www.FreeBSD.org/cgi/man.cgi?query=_secure_path&sektion=3>`__ cannot stat ``.login_conf``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn ich versuche, von ``root`` zu einem anderen Nutzer des Systems zu
wechseln, erhalte ich die Fehlermeldung \_secure\_path: unable to state
.login\_conf.

Diese Meldung wird gew?hnlich ausgegeben, wenn der Nutzer ein h?here
Label-Einstellung hat als der, dessen Identit?t man annehmen m?chte.
Ausf?hrlich: Wenn ein Nutzer ``joe`` als ``biba/low`` gelabelt wurde,
kann ``root``, der ``biba/high`` als Voreinstellung tr?gt, das
Heimatverzeichnis von ``joe`` nicht einsehen. Das passiert unabh?nig
davon, ob ``root`` vorher mit ``su`` die Identit?t von ``joe``
angenommen hat oder nicht, da das Label sich nicht ?ndert. Hier haben
wir also einen Fall, in dem das Gew?hrleistungsmodell von Biba
verhindert, das der Superuser Objekte einer niedrigeren Integrit?t
betrachten kann.

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

17.17.4. Der Nutzer ``root`` ist kaputt!
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Im normalen oder sogar im Einzelbenutzermodus wird ``root`` nicht
anerkannt. Das Kommando ``whoami`` liefert 0 (null) und ``su`` liefert
who are you? zur?ck. Was geht da vor?

Das kann passieren, wenn eine Label-Richtlinie ausgeschaltet wird -
entweder durch
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
oder wenn das Richtlinienmodul entladen wurde. Wenn eine Richtlinie
deaktiviert oder auch nur vor?bergehen deaktiviert wird, mu? die
Bef?higungsdatenbank neu konfiguriert werden, d.h. die ``label`` Option
mu? entfernt werden. ?berpr?fen Sie, ob alle ``label`` Eintr?ge aus der
Datei ``/etc/login.conf`` entfernt wurden und bauen Sie die Datenbank
mit ``cap_mkdb`` neu.

Dieser Fehler kann auch auftreten, wenn eine Richtlinie den Zugriff auf
die Datei ``master.passwd`` einschr?nkt. Normalerweise passiert das nur,
wenn ein Administrator ein Label an diese Datei vergibt, das mit der
allgemeing?ltigen Richtlinie, die das System verwendet, in Konflikt
steht. In solchen F?llen werden die Nutzerinformationen vom System
ausgelesen und jeder weitere Zugriff wird blockiert, sobald das neue
Label greift. Wenn man die Richtlinie via
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
ausschaltet, sollte es erstmal wieder gehen.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+-------------------------------+----------------------------------------+
| `Zur?ck <mac-userlocked.html>`__?    | `Nach oben <mac.html>`__      | ?\ `Weiter <audit.html>`__             |
+--------------------------------------+-------------------------------+----------------------------------------+
| 17.16. Beispiel 2: User Lock Down?   | `Zum Anfang <index.html>`__   | ?Kapitel 18. Security Event Auditing   |
+--------------------------------------+-------------------------------+----------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
