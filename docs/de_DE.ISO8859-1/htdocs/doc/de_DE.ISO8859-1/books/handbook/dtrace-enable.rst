=========================================
27.3. Die DTrace Unterst?tzung aktivieren
=========================================

.. raw:: html

   <div class="navheader">

27.3. Die DTrace Unterst?tzung aktivieren
`Zur?ck <dtrace-implementation.html>`__?
Kapitel 27. DTrace
?\ `Weiter <dtrace-using.html>`__

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

27.3. Die DTrace Unterst?tzung aktivieren
-----------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In FreeBSD 9.2 und 10.0 ist die Unterst?tzung von DTrace im
``GENERIC``-Kernel bereits eingebaut. Nutzer von fr?heren Versionen
sollten die folgenden Zeilen in eine eigene Kernelkonfigurationsdatei
einf?gen und den Kernel mittels der Anleitung in `Kapitel?9,
*Konfiguration des FreeBSD-Kernels* <kernelconfig.html>`__ neu
?bersetzen:

.. code:: programlisting

    options         KDTRACE_HOOKS
    options         DDB_CTF
    options         DEBUG=-g

Besitzer der AMD64-Architektur werden wahrscheinlich noch die folgende
Zeile zur Kernelkonfigurationsdatei hinzuf?gen:

.. code:: programlisting

    options         KDTRACE_FRAME

Diese Option liefert die Unterst?tzung f?r die FBT-Eigenschaft. DTrace
wird auch ohne diese Option funktionieren; jedoch wird dann Function
Boundary Tracing nur eingeschr?nkt unterst?tzt.

Sobald FreeBSD in den neuen Kernel gebootet oder die DTrace-Kernelmodule
mittels ``kldload       dtraceall`` geladen wurden, ben?tigt das System
Unterst?tzung f?r die Korn-Shell, da DTrace mehrere Dienstprogramme
enth?lt, die in ``ksh`` implementiert sind. Vergewissern Sie sich, dass
das Paket oder der Port
`shells/ksh93 <http://www.freebsd.org/cgi/url.cgi?ports/shells/ksh93/pkg-descr>`__
installiert ist. Es ist auch m?glich, diese Werkzeuge unter
`shells/pdksh <http://www.freebsd.org/cgi/url.cgi?ports/shells/pdksh/pkg-descr>`__
oder
`shells/mksh <http://www.freebsd.org/cgi/url.cgi?ports/shells/mksh/pkg-descr>`__
laufen zu lassen.

Zum Schluss sollten Sie noch den aktuellen DTrace-Werkzeugsatz
beschaffen. Die DTrace-Werkzeugsammlung enth?lt gebrauchsfertige
Skripte, um Systeminformationen zu sammeln. Es gibt Skripte zum
?berpr?fen von offenen Dateien, Speicher- und CPU-Gebrauch und noch viel
mehr. FreeBSD 10 installiert ein paar dieser Skripte in
``/usr/share/dtrace``. F?r andere FreeBSD-Versionen oder um die volle
DTrace-Werkzeugsammlung zu installieren, verwenden Sie den
`sysutils/DTraceToolkit <http://www.freebsd.org/cgi/url.cgi?ports/sysutils/DTraceToolkit/pkg-descr>`__
Port oder das Paket.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Die Skripte in ``/usr/share/dtrace`` wurden speziell f?r FreeBSD
portiert. Nicht alle Skripte in der DTrace-Werkzeugsammlung werden in
FreeBSD unver?ndert funktionieren und manche Skript ben?tigen einigen
Aufwand, damit diese auf FreeBSD funktionieren.

.. raw:: html

   </div>

Der DTrace-Werkzeugsatz beinhaltet viele Skripte in der speziellen
Sprache von DTrace. Diese Sprache wird die D-Sprache genannt und ist
sehr ?hnlich zu C++. Eine detaillierte Beschreibung dieser Sprache
sprengt den Rahmen dieses Dokuments. In
``http://wikis.oracle.com/display/DTrace/Documentation`` wird diese
Sprache ausf?hrlich beschrieben.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------------+-------------------------------+-------------------------------------+
| `Zur?ck <dtrace-implementation.html>`__?     | `Nach oben <dtrace.html>`__   | ?\ `Weiter <dtrace-using.html>`__   |
+----------------------------------------------+-------------------------------+-------------------------------------+
| 27.2. Unterschiede in der Implementierung?   | `Zum Anfang <index.html>`__   | ?27.4. DTrace verwenden             |
+----------------------------------------------+-------------------------------+-------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
