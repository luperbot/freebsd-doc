=============================================
Kapitel 4. Einen Port in aller Ruhe erstellen
=============================================

.. raw:: html

   <div class="navheader">

Kapitel 4. Einen Port in aller Ruhe erstellen
`Zur?ck <porting-submitting.html>`__?
?
?\ `Weiter <slow-sources.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="chapter">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Inhaltsverzeichnis

.. raw:: html

   </div>

`4.1. Die Funktionsweise <slow.html#slow-work>`__
`4.2. Den originalen Quelltext besorgen <slow-sources.html>`__
`4.3. Den Port bearbeiten <slow-modifying.html>`__
`4.4. Fehlerbehebung (Patches) <slow-patch.html>`__
`4.5. Konfigurieren <slow-configure.html>`__
`4.6. Handhabung von Benutzereingaben <slow-user-input.html>`__

.. raw:: html

   </div>

Ok, das war nicht ganz einfach und der Port hat einige Ver?nderungen
erfordert, um funktionieren zu k?nnen. In diesem Abschnitt werden wir
Schritt f?r Schritt erkl?ren, wie man den funktionierenden Port den
Vorgaben der Ports entsprechend anpasst.

.. raw:: html

   <div class="sect1">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.1. Die Funktionsweise
-----------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Beginnen wir mit der Abfolge der Ereignisse, die eintreten, wenn der
Nutzer das erste ``make`` in Ihrem Portsverzeichnis ausf?hrt. Sie
empfinden es f?r das Verst?ndnis vielleicht hilfreich ``bsd.port.mk`` in
einem anderen Fenster offen zu haben, w?hrend Sie diesen Abschnitt
lesen.

Aber machen Sie sich keine Sorgen, falls Sie nicht wirklich verstehen,
was ``bsd.port.mk`` macht, die Wenigsten begreifen dies... *:>*

.. raw:: html

   <div class="procedure">

#. Das Target ``fetch`` wird aufgerufen. Es ist daf?r verantwortlich
   sicherzustellen, dass der Tarball lokal im ``DISTDIR`` verf?gbar ist.
   Falls ``fetch`` die ben?tigten Dateien in ``DISTDIR`` nicht finden
   kann, durchsucht es die URL ``MASTER_SITES``, welche im Makefile
   gesetzt ist, ebenso wie unsere Haupt-FTP-Seite unter
   `ftp://ftp.freebsd.org/pub/FreeBSD/ports/distfiles/ <ftp://ftp.FreeBSD.org/pub/FreeBSD/ports/distfiles>`__,
   wo wir genehmigte Distfiles als Backup aufbewahren. Danach wird
   versucht, so eine direkte Internetverbindung besteht, dass genannte
   Distfile mit ``FETCH`` herunterzuladen. Falls dies gelingt, wird die
   Datei in ``DISTDIR`` f?r weitere Nutzung abgelegt und f?hrt fort.

#. Das Target ``extract`` wird aufgerufen. Es sucht nach den Distfiles
   Ihres Ports (normalerweise ein gzip-komprimierter Tarball) in
   ``DISTDIR`` und entpackt diese in ein tempor?res Unterverzeichnis,
   welches von ``         WRKDIR`` festgelegt wird (standardm??ig
   ``work``).

#. Das Target ``patch`` wird aufgerufen. Zuerst werden alle in
   ``PATCHFILES`` festgelegten Patches eingespielt. Anschlie?end werden,
   falls Patches der Form ``patch-*`` in ``PATCHDIR`` (standardm??ig das
   ``files``-Unterverzeichnis) gefunden werden, diese in alphabetischer
   Reihenfolge eingespielt.

#. Das Target ``configure`` wird aufgerufen. Dieses kann viele
   verschiedene Dinge machen.

   .. raw:: html

      <div class="orderedlist">

   #. Existiert ``scripts/configure``, so wird es aufgerufen.

   #. Falls ``HAS_CONFIGURE`` oder ``GNU_CONFIGURE`` gesetzt sind, wird
      ``WRKSRC/configure         ``\ ausgef?hrt.

   #. Falls ``USE_IMAKE`` gesetzt ist, wird ``XMKMF`` (standardm??ig
      ``xmkmf -a``) ausgef?hrt.

   .. raw:: html

      </div>

#. Das Target ``build`` wird aufgerufen. Es ist f?r das Wechseln in das
   private Arbeitsverzeichnis (``WRKSRC``) und das Bauen des Ports
   zust?ndig. Ist ``USE_GMAKE`` gesetzt, so wird GNU ``make`` verwendet,
   sonst das System-\ ``make``.

.. raw:: html

   </div>

Die oben genannten Schritte sind die Standardaktionen. Zus?tzlich k?nnen
Sie ``pre-     irgendwas`` oder ``post-irgendwas`` als Targets
definieren oder Skripten mit diesen Namen in das
``scripts``-Unterverzeichnis legen. Sie werden dann vor bzw. nach den
Standardaktionen aufgerufen.

Angenommen Sie haben das Target ``post-extract     `` in Ihrem
``Makefile`` definiert und eine Datei ``pre-build`` im ``scripts``
Unterverzeichnis, so wird das Target ``post-extract`` nach dem normalen
Entpacken aufgerufen und das Skript ``pre-build`` ausgef?hrt, bevor die
vordefinierten Bau-Regeln abgearbeitet sind. Es wird empfohlen, dass Sie
``Makefile``-Targets verwenden, falls die Aktionen es erlauben, da es so
f?r jemanden einfacher sein wird herauszufinden, was f?r eine
nicht-standardm??ige Aktion der Port ben?tigt.

Die Standardaktionen werden aus den Targets ``bsd.port.mk``
``do-irgendwas`` ?bernommen. Zum Beispiel sind die Befehle zum Entpacken
eines Ports im Target ``do-extract`` zu finden. Falls Sie mit einem
vorgegebenen Target nicht zufrieden sind, k?nnen Sie es ver?ndern, indem
Sie das Target ``do-irgendwas`` in Ihrem ``Makefile`` neu definieren.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Die „Haupt“-Targets (z.B. ``extract``, ``configure`` usw.) machen nicht
mehr als sicherzustellen, dass bis hierhin alle Abschnitte abgeschlossen
sind, um danach die eigentlichen Targets oder Skripte aufzurufen. Und es
ist nicht beabsichtigt, dass diese ge?ndert werden. Falls Sie das
Entpacken ver?ndern wollen, ver?ndern Sie ``do-extract``, aber niemals
die Art, wie ``extract`` arbeitet!

.. raw:: html

   </div>

Jetzt, da Sie verstehen, was geschieht, wenn der Benutzer ``make``
eingibt, lassen Sie uns durch die empfohlenen Schritte gehen, um den
perfekten Port zu erstellen.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------+-------------------------------+-------------------------------------------+
| `Zur?ck <porting-submitting.html>`__?   | ?                             | ?\ `Weiter <slow-sources.html>`__         |
+-----------------------------------------+-------------------------------+-------------------------------------------+
| 3.6. Den neuen Port einreichen?         | `Zum Anfang <index.html>`__   | ?4.2. Den originalen Quelltext besorgen   |
+-----------------------------------------+-------------------------------+-------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
