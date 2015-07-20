=======================
9.4. PREFIX und DESTDIR
=======================

.. raw:: html

   <div class="navheader">

9.4. ``PREFIX`` und ``DESTDIR``
`Zur?ck <testing-porttools.html>`__?
Kapitel 9. Ihren Port testen
?\ `Weiter <testing-tinderbox.html>`__

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

9.4. ``PREFIX`` und ``DESTDIR``
-------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``PREFIX`` bestimmt, an welche Stelle der Port installiert werden soll.
In der Regel ist dies\ ``/usr/local`` oder ``/opt``, was jedoch
anpassbar ist. Ihr Port muss sich an diese Variable halten.

``DESTDIR``, wenn es vom Benutzer gesetzt wird, bestimmt die alternative
Umgebung (in der Regel eine Jail oder ein installiertes System, welches
an anderer Stelle als ``/`` eingeh?ngt ist). Ein Port wird unter
``DESTDIR``/``PREFIX`` installiert und registriert sich in der
Paket-Datenbank unter ``DESTDIR``/var/db/pkg. Da ``DESTDIR`` mittels
eines
`chroot(8) <http://www.FreeBSD.org/cgi/man.cgi?query=chroot&sektion=8>`__-Aufrufs
vom Ports-System automatisch gesetzt wird, brauchen Sie keine ?nderungen
oder besondere Pflege f?r ``DESTDIR``-konforme Ports.

Der Wert von ``PREFIX`` wird auf ``LOCALBASE`` gesetzt (Standard ist
``/usr/local``). Falls ``USE_LINUX_PREFIX`` gesetzt ist, wird ``PREFIX``
``LINUXBASE`` annehmen (Standard ist ``/compat/linux``).

Die Vermeidung der hart kodierten Angaben von ``/usr/local`` oder
``/usr/X11R6`` im Quelltext wird den Port viel flexibler machen und
erleichtert es die Anforderungen anderer Einsatzorte zu erf?llen. F?r
X-Ports, die ``imake`` benutzen, geschieht dies automatisch; andernfalls
kann dies erreicht werden, indem alle Angaben von ``/usr/local`` (oder
``/usr/X11R6`` f?r X-Ports, die nicht imake benutzen) in den
verschiedenen ``Makefile``\ s im Port ersetzt werden, um ``${PREFIX}``
zu lesen, da diese Variable automatisch an jede Stufe des Build- und
Install-Prozesses ?bergeben wird.

Vergewissern Sie sich bitte, dass Ihre Anwendung nichts unter
``/usr/local`` an Stelle von ``PREFIX`` installiert. Um dies
festzustellen, k?nnen Sie folgendes machen:

.. code:: screen

    # make clean; make package PREFIX=/var/tmp/`make -V PORTNAME`

Wenn etwas au?erhalb von ``PREFIX`` installiert wird, so gibt der
Prozess der Paketerstellung eine Meldung aus, dass es die Dateien nicht
finden kann.

Dies pr?ft nicht das Vorhandensein eines internen Verweises oder die
richtige Verwendung von ``LOCALBASE`` f?r Verweise auf Dateien anderer
Ports. Das Testen der Installation in ``/var/tmp/`make -V PORTNAME```
w?rde dies erledigen.

Die Variable ``PREFIX`` kann in Ihrem ``Makefile`` oder der Umgebung des
Benutzers neu gesetzt werden. Allerdings wird f?r einzelne Ports
dringend davon abgeraten diese Variable in den ``Makefile``\ s direkt zu
setzen.

Verweisen Sie bitte au?erdem auf Programme/Dateien von anderen Ports
durch die oben erw?hnten Variablen und nicht mit den eindeutigen
Pfadnamen. Wenn Ihr Port zum Beispiel vom Makro ``PAGER`` erwartet, dass
es den vollst?ndigen Pfadnamen von ``less`` enth?lt, benutzen Sie
folgendes Compiler-Flag:

.. code:: programlisting

    -DPAGER=\"${LOCALBASE}/bin/less\"

anstatt ``-DPAGER=\"/usr/local/bin/less\"``. Somit ist die
Wahrscheinlichkeit h?her, dass es auch funktioniert, wenn der
Administrator den ganzen ``/usr/local``-Baum an eine andere Stelle
verschoben hat.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------+--------------------------------+------------------------------------------+
| `Zur?ck <testing-porttools.html>`__?   | `Nach oben <testing.html>`__   | ?\ `Weiter <testing-tinderbox.html>`__   |
+----------------------------------------+--------------------------------+------------------------------------------+
| 9.3. Port Tools?                       | `Zum Anfang <index.html>`__    | ?9.5. Die Tinderbox                      |
+----------------------------------------+--------------------------------+------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
