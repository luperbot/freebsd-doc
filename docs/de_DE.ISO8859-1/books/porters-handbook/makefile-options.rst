=======================
5.11. Makefile-Optionen
=======================

.. raw:: html

   <div class="navheader">

5.11. Makefile-Optionen
`Zur?ck <makefile-info.html>`__?
Kapitel 5. Die Konfiguration des Makefile
?\ `Weiter <makefile-wrkdir.html>`__

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

5.11. Makefile-Optionen
-----------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Einige gr??ere Applikationen k?nnen mit einer Reihe von Konfigurationen,
die zus?tzliche Funktionalit?ten hinzuf?gen, erstellt werden, falls eine
oder mehrere Bibliotheken oder Applikationen verf?gbar sind. Dazu
geh?ren die Auswahl von nat?rlichen Sprachen, GUI versus
Kommandozeilen-Versionen oder die Auswahl aus mehreren
Datenbank-Programmen. Da nicht alle Nutzer diese Bibliotheken oder
Applikationen wollen, stellt das Ports-System hooks (Haken) zur
Verf?gung, damit der Autor des Ports bestimmen kann, welche
Konfiguration erstellt werden soll.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.11.1. KNOBS (Einstellungen)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.11.1.1. ``WITH_*`` und ``WITHOUT_*``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Diese Variablen sind entworfen worden, um vom System-Administrator
gesetzt zu werden. Es gibt viele, die in
```ports/KNOBS`` <http://www.freebsd.org/cgi/cvsweb.cgi/ports/KNOBS?rev=HEAD&content-type=text/x-cvsweb-markup>`__
standardisiert sind.

Benennen Sie Schalter bei der Erstellung eines Ports nicht
programmspezifisch. Verwenden Sie zum Beispiel im Avahi-Port
``WITHOUT_MDNS`` anstelle von ``WITHOUT_AVAHI_MDNS``.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Sie sollten nicht annehmen, dass ein ``WITH_*`` notwendigerweise eine
korrespondierende ``           WITHOUT_*``-Variable hat oder umgekehrt.
Im Allgemeinen wird diese Vorgabe einfach unterstellt.

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Falls nicht anderweitig festgelegt, werden diese Variablen nur
dahingehend ?berpr?ft, ob sie gesetzt sind oder nicht?–?nicht darauf, ob
sie auf bestimmte Werte wie ``YES`` oder ``NO`` gesetzt sind.

.. raw:: html

   </div>

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Tabelle 5.3. H?ufige ``WITH_*`` und ``           WITHOUT_*``-Variablen

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+-------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Variable                | Bedeutung                                                                                                                                                                                                                      |
+=========================+================================================================================================================================================================================================================================+
| \ ``WITHOUT_NLS``       | Falls gesetzt, bedeutet sie, dass eine Internationalisierung nicht ben?tigt wird, was Kompilierzeit sparen kann. Als Vorgabe wird Internationalisierung gebraucht.                                                             |
+-------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``WITH_OPENSSL_BASE``   | Nutze die Version von OpenSSL aus dem Basissystem.                                                                                                                                                                             |
+-------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``WITH_OPENSSL_PORT``   | Installiert die Version von OpenSSL aus `security/openssl <http://www.freebsd.org/cgi/url.cgi?ports/security/openssl/pkg-descr>`__, auch wenn das Basissystem auf aktuellem Stand ist.                                         |
+-------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``WITHOUT_X11``         | Falls der Port mit oder ohne Unterst?tzung f?r X erstellt werden kann, dann sollte normalerweise mit X-Unterst?tzung erstellt werden. Falls die Variable gesetzt ist, soll die Version ohne X-Unterst?tzung erstellt werden.   |
+-------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.11.1.2. Benennung von Knobs (Einstellungen)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Um die Anzahl der Knobs niedrig zu halten und zum Vorteil des Anwenders,
wird empfohlen, dass Porter ?hnliche Namen f?r Knobs verwenden. Eine
Liste der beliebtesten Knobs kann in der
`KNOBS-Datei <http://www.freebsd.org/cgi/cvsweb.cgi/ports/KNOBS?rev=HEAD&content-type=text/x-cvsweb-markup>`__
eingesehen werden.

Knob-Namen sollten wiederspiegeln, was der Knob bedeutet und was er
bewirkt. Wenn ein Port einen lib-Pr?fix im ``PORTNAME`` hat, dann soll
das lib-Pr?fix im Knob-Namen entfallen.

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

5.11.2. ``OPTIONS``
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.11.2.1. Hintergrund
^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die ``OPTIONS``-Variable gibt dem Nutzer, der diesen Port installiert,
einen Dialog mit ausw?hlbaren Optionen und speichert diese in
``/var/db/ports/portname/options``. Bei der n?chsten Neuerstellung des
Ports werden diese Einstellungen wieder verwandt. Sie werden sich
niemals mehr an all die zwanzig ``WITH_*`` und ``WITHOUT_*``-Optionen
erinnern m?ssen, die Sie benutzt haben, um diesen Port zu erstellen!

Wenn der Anwender ``make config`` benutzt (oder ein ``make build`` das
erste Mal laufen l?sst) wird das Framework auf
``/var/db/ports/portname/options`` die Einstellungen pr?fen. Falls die
Datei nicht existiert, werden die Werte von ``OPTIONS`` genutzt, um eine
Dialogbox zu erzeugen, in welcher die Optionen an- oder abgeschaltet
werden k?nnen. Dann wird die ``options``-Datei gespeichert und die
ausgew?hlten Variablen werden bei der Erstellung des Ports benutzt.

Falls eine neue Version des Ports ``OPTIONS`` hinzuf?gt, wird der Dialog
mit den gespeicherten Werten dem Nutzer angezeigt.

Benutzen Sie ``make showconfig``, um die gespeicherte Konfiguration zu
betrachten. Benutzen Sie ``make rmconfig``, um die gespeicherte
Konfiguration zu L?schen.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.11.2.2. Syntax
^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Syntax f?r die ``OPTIONS``-Variable lautet:

.. code:: programlisting

    OPTIONS=    OPTION    "descriptive text" default ...

Der Wert als Vorgabe ist entweder ``ON`` oder ``OFF``. Wiederholungen
dieser drei Felder sind erlaubt.

``OPTIONS``-Definitionen m?ssen vor der Einbindung von
``bsd.port.options.mk`` erscheinen. Die ``WITH_*`` und
``WITHOUT_*``-Variablen k?nnen nur nach der Einbindung von
``bsd.port.options.mk`` getestet werden. ``bsd.port.pre.mk`` kann auch
stattdessen eingebunden werden und wird immer noch von vielen Ports
eingebunden, die vor der Einf?hrung von ``bsd.port.options.mk`` erstellt
wurden. Jedoch wirken manche Variablen nicht wie gewohnt nach der
Einbindung von ``bsd.port.pre.mk``, typischerweise ``USE_*``-Optionen.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel 5.8. Einfache Anwendung von ``OPTIONS``

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    OPTIONS=      FOO "Enable option foo" On \
                  BAR "Support feature bar" Off

    .include <bsd.port.options.mk>

    .if defined(WITHOUT_FOO)
    CONFIGURE_ARGS+=    --without-foo
    .else
    CONFIGURE_ARGS+=    --with-foo
    .endif

    .if defined(WITH_BAR)
    RUN_DEPENDS+=    bar:${PORTSDIR}/bar/bar
    .endif

    .include <bsd.port.mk>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel 5.9. Veraltete Anwendung von ``OPTIONS``

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    OPTIONS=      FOO "Enable option foo" On

    .include <bsd.port.pre.mk>

    .if defined(WITHOUT_FOO)
    CONFIGURE_ARGS+=    --without-foo
    .else
    CONFIGURE_ARGS+=    --with-foo
    .endif

    .include <bsd.port.post.mk>

.. raw:: html

   </div>

.. raw:: html

   </div>

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

5.11.3. Automatische Aktivierung von Funktionen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn Sie ein GNU-Konfigurationsskript benutzen, sollten Sie ein Auge
darauf werfen, welche Funktionen durch die automatische Erkennung
aktiviert werden. Schalten Sie Funktionen, die Sie nicht m?chten,
ausdr?cklich durch Verwendung von ``--without-xxx`` oder
``--disable-xxx`` in der Variable ``CONFIGURE_ARGS`` einzeln ab.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel 5.10. Falsche Behandlung einer Option

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    .if defined(WITH_FOO)
    LIB_DEPENDS+=        foo.0:${PORTSDIR}/devel/foo
    CONFIGURE_ARGS+=    --enable-foo
    .endif

.. raw:: html

   </div>

.. raw:: html

   </div>

Stellen Sie sich vor im obigen Beispiel ist eine Bibliothek libfoo auf
dem System installiert. Der Nutzer will nicht, dass diese Applikation
libfoo benutzt, also hat er die Option auf "off" im
``make config``-Dialog umgestellt. Aber das Konfigurationsskript der
Applikation hat erkannt, dass die Bibliothek auf dem System vorhanden
ist und f?gt ihre Funktionen in die Bin?rdatei ein. Falls der Nutzer
sich nun entschliesst libfoo von seinem System zu entfernen, dann wird
das Ports-System nicht protestieren (es wurde keine Abh?ngigkeit von
libfoo eingetragen), aber die Applikation bricht ab.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Beispiel 5.11. Korrekte Behandlung einer Option

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    .if defined(WITH_FOO)
    LIB_DEPENDS+=        foo.0:${PORTSDIR}/devel/foo
    CONFIGURE_ARGS+=    --enable-foo
    .else
    CONFIGURE_ARGS+=    --disable-foo
    .endif

.. raw:: html

   </div>

.. raw:: html

   </div>

Im zweiten Beispiel wird die Bibliothek libfoo explizit abgeschaltet.
Das Konfigurationsskript aktiviert die entsprechenden Funktionen nicht
in der Applikation trotz der Anwesenheit der Bibliothek auf dem System.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------+---------------------------------+---------------------------------------------------+
| `Zur?ck <makefile-info.html>`__?   | `Nach oben <makefile.html>`__   | ?\ `Weiter <makefile-wrkdir.html>`__              |
+------------------------------------+---------------------------------+---------------------------------------------------+
| 5.10. Info-Dateien?                | `Zum Anfang <index.html>`__     | ?5.12. Die Festlegung des Arbeitsverzeichnisses   |
+------------------------------------+---------------------------------+---------------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
