=======================================================================================
12.14. Einen Port durch BROKEN, FORBIDDEN oder IGNORE als nicht installierbar markieren
=======================================================================================

.. raw:: html

   <div class="navheader">

12.14. Einen Port durch ``BROKEN``, ``FORBIDDEN`` oder ``IGNORE`` als
nicht installierbar markieren
`Zur?ck <dads-readme.html>`__?
Kapitel 12. Was man machen respektive vermeiden sollte
?\ `Weiter <dads-deprecated.html>`__

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

12.14. Einen Port durch ``BROKEN``, ``FORBIDDEN`` oder ``IGNORE`` als nicht installierbar markieren
---------------------------------------------------------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In manchen F?llen sollten Benutzer davon abgehalten werden einen Port zu
installieren. Um einem Benutzer mitzuteilen, dass ein Port nicht
installiert werden sollte, gibt es mehrere Variablen f?r ``make``, die
im ``Makefile`` des Ports genutzt werden k?nnen. Der Wert der folgenden
``make``-Variablen wird dem Benutzer als Grund f?r die Ablehnung der
Installation des Ports zur?ckgegeben. Bitte benutzen Sie die richtige
``make``-Variable, denn jede enth?lt eine v?llig andere Bedeutung f?r
den Benutzer und das automatische System, das von dem ``Makefile``
abh?ngt, wie `der Ports-Build-Custer <build-cluster.html>`__,
`FreshPorts <keeping-up.html#freshports>`__ und
`portsmon <portsmon.html>`__.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

12.14.1. Variablen
~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="itemizedlist">

-  ``BROKEN`` ist reserviert f?r Ports, welche momentan nicht korrekt
   kompiliert, installiert oder deinstalliert werden. Es sollte f?r
   Ports benutzt werden, von denen man annimmt, dass dies ein tempor?res
   Problem ist.

   Falls angegeben, wird der Build-Cluster dennoch versuchen den Port zu
   bauen, um zu sehen, ob das zugrunde liegende Problem behoben wurde
   (das ist jedoch im Allgemeinen nicht der Fall).

   Benutzen Sie ``BROKEN`` zum Beispiel, wenn ein Port:

   .. raw:: html

      <div class="itemizedlist">

   -  nicht kompiliert

   -  beim Konfiguration- oder Installation-Prozess scheitert

   -  Dateien au?erhalb von ``${LOCALBASE}`` installiert

   -  beim Deinstallieren nicht alle seine Dateien sauber entfernt
      (jedoch kann es akzeptable und w?nschenswert sein, Dateien, die
      vom Nutzer ver?ndert wurden, nicht zu entfernen)

   .. raw:: html

      </div>

-  ``FORBIDDEN`` wird f?r Ports verwendet, die Sicherheitsl?cken
   enthalten oder die ernste Sicherheitsbedenken f?r das FreeBSD-System
   aufwerfen, wenn sie installiert sind (z.B. ein als unsicher bekanntes
   Programm, oder ein Programm, das einen Dienst zur Verf?gung stellt,
   der leicht kompromittiert werden kann). Ports sollten als
   ``FORBIDDEN`` gekennzeichnet werden, sobald ein Programm eine
   Schwachstelle hat und kein Update ver?ffentlicht wurde. Idealerweise
   sollten Ports so bald wie m?glich aktualisiert werden wenn eine
   Sicherheitsl?cke entdeckt wurde, um die Zahl verwundbarer
   FreeBSD-Hosts zu verringern (wir sch?tzen es f?r unsere Sicherheit
   bekannt zu sein), obwohl es manchmal einen beachtlichen Zeitabstand
   zwischen der Bekanntmachung einer Schwachstelle und dem
   entsprechenden Update gibt. Bitte kennzeichnen Sie einen Port nicht
   aus irgendeinem Grund au?er Sicherheit als ``FORBIDDEN``.

-  ``IGNORE`` ist f?r Ports reserviert, die aus anderen Gr?nden nicht
   gebaut werden sollten. Es sollte f?r Ports verwendet werden, in denen
   ein strukturelles Problem vermutet wird. Der Build-Cluster wird unter
   keinen Umst?nden Ports, die mit ``IGNORE`` markiert sind, erstellen.
   Verwenden Sie ``IGNORE`` zum Beispiel, wenn ein Port:

   .. raw:: html

      <div class="itemizedlist">

   -  kompiliert, aber nicht richtig l?uft

   -  nicht auf der installierten Version von FreeBSD l?uft

   -  FreeBSD Kernelquelltext zum Bauen ben?tigt, aber der Benutzer
      diese nicht installiert hat

   -  ein Distfile ben?tigt, welches aufgrund von Lizenzbeschr?nkungen
      nicht automatisch abgerufen werden kann

   -  nicht korrekt mit einem momentan installiertem Port arbeitet (der
      Port h?ngt zum Beispiel von
      `www/apache21 <http://www.freebsd.org/cgi/url.cgi?ports/www/apache21/pkg-descr>`__
      ab, aber
      `www/apache13 <http://www.freebsd.org/cgi/url.cgi?ports/www/apache13/pkg-descr>`__
      ist installiert)

   .. raw:: html

      </div>

   .. raw:: html

      <div class="note" xmlns="">

   Anmerkung:
   ~~~~~~~~~~

   Wenn ein Port mit einem momentan installiertem Port kollidiert (zum
   Beispiel, wenn beide eine Datei an die selbe Stelle installieren,
   diese aber eine andere Funktion hat), benutzen Sie stattdessen
   ``CONFLICTS``. ``CONFLICTS`` setzt ``IGNORE`` dann selbstst?ndig.

   .. raw:: html

      </div>

-  Um einen Port nur auf bestimmte Systemarchitekturen mit ``IGNORE`` zu
   markieren, gibt es zwei Variablen, die automatisch ``IGNORE`` f?r Sie
   setzen: ``ONLY_FOR_ARCHS`` und ``NOT_FOR_ARCHS``. Beispiele:

   .. code:: programlisting

       ONLY_FOR_ARCHS= i386 amd64

   .. code:: programlisting

       NOT_FOR_ARCHS= alpha ia64 sparc64

   Eine eigene ``IGNORE``-Ausgabe kann mit ``ONLY_FOR_ARCHS_REASON`` und
   ``NOT_FOR_ARCHS_REASON`` festgelegt werden. F?r eine bestimmte
   Architektur sind Angaben durch ``ONLY_FOR_ARCHS_REASON_ARCH`` und
   ``NOT_FOR_ARCHS_REASON_ARCH`` m?glich.

-  Wenn ein Port i386-Bin?rdateien herunterl?dt und installiert, sollte
   ``IA32_BINARY_PORT`` gesetzt werden. Wenn die Variable gesetzt ist,
   wird ?berpr?ft, ob das Verzeichnis ``/usr/lib32`` f?r IA32-Versionen
   der Bibliotheken vorhanden ist, und ob der Kernel mit
   IA32-Kompatibilit?t gebaut wurde. Wenn eine dieser zwei
   Voraussetzungen nicht erf?llt ist, wird ``IGNORE`` automatisch
   gesetzt.

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

12.14.2. Anmerkungen zur Implementierung
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Zeichenketten sollten nicht in Anf?hrungszeichen gesetzt werden. Auch
die Wortwahl der Zeichenketten sollte die Art und Weise beachten, wie
die Informationen dem Nutzer angezeigt werden. Beispiele:

.. code:: programlisting

    BROKEN= this port is unsupported on FreeBSD 5.x

.. code:: programlisting

    IGNORE= is unsupported on FreeBSD 5.x

resultieren in den folgenden Ausgaben von ``make describe``:

.. code:: programlisting

    ===>  foobar-0.1 is marked as broken: this port is unsupported on FreeBSD 5.x.

.. code:: programlisting

    ===>  foobar-0.1 is unsupported on FreeBSD 5.x.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------+-------------------------------------+-------------------------------------------------------------------------------------------------+
| `Zur?ck <dads-readme.html>`__?   | `Nach oben <porting-dads.html>`__   | ?\ `Weiter <dads-deprecated.html>`__                                                            |
+----------------------------------+-------------------------------------+-------------------------------------------------------------------------------------------------+
| 12.13. ``README.html``?          | `Zum Anfang <index.html>`__         | ?12.15. Kennzeichnen eines Ports zur Entfernung durch ``DEPRECATED`` oder ``EXPIRATION_DATE``   |
+----------------------------------+-------------------------------------+-------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
