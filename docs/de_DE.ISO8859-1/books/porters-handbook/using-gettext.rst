==============================
6.5. Benutzung von GNU gettext
==============================

.. raw:: html

   <div class="navheader">

6.5. Benutzung von GNU ``gettext``
`Zur?ck <using-autotools.html>`__?
Kapitel 6. Besonderheiten
?\ `Weiter <using-perl.html>`__

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

6.5. Benutzung von GNU ``gettext``
----------------------------------

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

6.5.1. Grundlegende Benutzung
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn Ihr Port ``gettext`` ben?tigt, setzen Sie einfach ``USE_GETTEXT``
auf ``yes``, und Ihr Port bekommt die Abh?ngigkeit von
`devel/gettext <http://www.freebsd.org/cgi/url.cgi?ports/devel/gettext/pkg-descr>`__.
Der Wert von ``USE_GETTEXT`` kann auch die ben?tigte Version der
``libintl``-Bibliothek angeben, der grundlegenden Teil von
``gettext``?–?jedoch wird von der Benutzung dieser Funktion *dringend
abgeraten*: Ihr Port sollte einfach nur mit der aktuellen Version von
`devel/gettext <http://www.freebsd.org/cgi/url.cgi?ports/devel/gettext/pkg-descr>`__
funktionieren.

Ein ziemlich h?ufiger Fall ist, dass ein Port ``gettext`` und
``configure`` benutzt. Normalerweise sollte GNU ``configure``
``gettext`` automatisch finden k?nnen. Sollte das einmal nicht
funktionieren, k?nnen Hinweise ?ber den Ort von ``gettext`` in
``CPPFLAGS`` und ``LDFLAGS`` wie folgt ?bergeben werden:

.. code:: programlisting

    USE_GETTEXT=    yes
    CPPFLAGS+=      -I${LOCALBASE}/include
    LDFLAGS+=       -L${LOCALBASE}/lib

    GNU_CONFIGURE=  yes
    CONFIGURE_ENV=  CPPFLAGS="${CPPFLAGS}" \
                LDFLAGS="${LDFLAGS}"

Nat?rlich kann der Code kompakter sein, wenn es keine weiteren Flags
gibt, die ``configure`` ?bergeben werden m?ssen:

.. code:: programlisting

    USE_GETTEXT=    yes
    GNU_CONFIGURE=  yes
    CONFIGURE_ENV=  CPPFLAGS="-I${LOCALBASE}/include" \
                LDFLAGS="-L${LOCALBASE}/lib"

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

6.5.2. Optionale Benutzung
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Manche Softwareprodukte erlauben die Deaktivierung von NLS - z.B. durch
?bergeben von ``--disable-nls`` an ``configure``. In diesem Fall sollte
Ihr Port ``gettext`` abh?ngig vom Status von
```WITHOUT_NLS`` <makefile-options.html#knobs-without-nls>`__ benutzen.
F?r Ports mit niedriger bis mittlerer Komplexit?t k?nnen Sie sich auf
das folgende Idiom verlassen:

.. code:: programlisting

    GNU_CONFIGURE=          yes

    .if !defined(WITHOUT_NLS)
    USE_GETTEXT=            yes
    PLIST_SUB+=             NLS=""
    .else
    CONFIGURE_ARGS+=        --disable-nls
    PLIST_SUB+=             NLS="@comment "
    .endif

Der n?chste Punkt auf Ihrer Todo-Liste ist daf?r zu sorgen, dass die
Message-Catalog-Dateien nur bedingt in der Packliste aufgef?hrt werden.
Der ``Makefile``-Teil dieser Aufgabe ist schon durch obiges Idiom
erledigt. Das wird im Abschnitt ?ber `Fortgeschrittene
``pkg-plist``-Methoden <plist.html#plist-sub>`__ erkl?rt. Kurz gesagt,
jedes Vorkommen von ``%%NLS%%`` in ``pkg-plist`` wird durch
„``@comment?``“, wenn NLS abgeschaltet ist, oder durch eine leere
Zeichenkette, wenn NLS aktiviert ist, ersetzt. Folglich werden die
Zeilen, denen ``%%NLS%%`` vorangestellt ist, zu reinen Kommentaren in
der endg?ltigen Packliste, wenn NLS abgeschaltet ist; andernfalls wird
der Prefix einfach nur ausgelassen. Alles, was Sie jetzt noch machen
m?ssen, ist ``%%NLS%%`` vor jedem Pfad zu einer Message-Catalog-Datei in
``pkg-plist`` einzuf?gen. Zum Beispiel:

.. code:: programlisting

    %%NLS%%share/locale/fr/LC_MESSAGES/foobar.mo
    %%NLS%%share/locale/no/LC_MESSAGES/foobar.mo

In sehr komplexen F?llen m?ssen Sie eventuell fortgeschrittenere
Techniken als die hier vorgestellte benutzen - wie z.B. `Dynamische
Packlistenerzeugung <plist-dynamic.html>`__.

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

6.5.3. Behandlung von Message-Catalog-Verzeichnissen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Bei der Installation von Message-Catalog-Dateien gibt es einen Punkt zu
beachten. Ihr Zielverzeichnis, das unter
``         LOCALBASE/share/locale`` liegt, sollte nur selten von Ihrem
Port erzeugt und gel?scht werden. Die Verzeichnisse f?r die
gebr?uchlichsten Sprachen sind in ``/etc/mtree/BSD.local.dist``
aufgelistet; das heisst, sie sind Teil des Systems. Die Verzeichnisse
f?r viele andere Sprachen sind Teil des Ports
`devel/gettext <http://www.freebsd.org/cgi/url.cgi?ports/devel/gettext/pkg-descr>`__.
Sie wollen vielleicht dessen ``pkg-plist`` zur Hand nehmen, um
festzustellen, ob Ihr Port eine Message-Catalog-Datei f?r eine seltene
Sprache installiert.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+--------------------------------+------------------------------------+
| `Zur?ck <using-autotools.html>`__?   | `Nach oben <special.html>`__   | ?\ `Weiter <using-perl.html>`__    |
+--------------------------------------+--------------------------------+------------------------------------+
| 6.4. Benutzung von GNU autotools?    | `Zum Anfang <index.html>`__    | ?6.6. Die Benutzung von ``perl``   |
+--------------------------------------+--------------------------------+------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
