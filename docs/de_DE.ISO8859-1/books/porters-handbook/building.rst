======================
6.3. Build-Mechanismen
======================

.. raw:: html

   <div class="navheader">

6.3. Build-Mechanismen
`Zur?ck <porting-restrictions.html>`__?
Kapitel 6. Besonderheiten
?\ `Weiter <using-autotools.html>`__

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

6.3. Build-Mechanismen
----------------------

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

6.3.1. Paralleles Bauen von Ports
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das Ports-Framework von FreeBSD unterst?tzt das parallele Bauen von
Ports, indem es mehrere ``make``-Instanzen ausf?hrt, damit SMP-Systeme
ihre gesamte CPU-Rechenleistung ausn?tzen k?nnen und so das Bauen von
Ports schneller und effektiver werden kann.

Dies erm?glicht der Parameter ``-jX`` an
`make(1) <http://www.FreeBSD.org/cgi/man.cgi?query=make&sektion=1>`__,
wenn Code von Drittanbietern kompiliert wird. Leider k?nnen nicht alle
Ports wirklich gut mit dem Parallelbau umgehen. Deshalb ist es
erforderlich, dass dieses Feature explizit durch ``MAKE_JOBS_SAFE=yes``
irgendwo unterhalb des Abschnitts f?r Abh?ngigkeiten im ``Makefile``
aktiviert wird.

Eine weitere M?glichkeit im Umgang mit dieser Option besteht f?r den
Maintainer darin, ``MAKE_JOBS_UNSAFE=yes`` zu setzen. Diese Variable
wird dann verwendet, wenn ein Port bekannterweise mit ``-jX`` nicht
gebaut werden kann, der Benutzer jedoch f?r alle Ports den
Mehrprozessorbau durch ``FORCE_MAKE_JOBS=yes`` in ``/etc/make.conf``
erzwingt.

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

6.3.2. ``make``, ``gmake`` und ``imake``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn Ihr Port GNU make benutzt, dann setzen Sie bitte ``USE_GMAKE=yes``.

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Tabelle 6.1. Port-Variablen im Zusammenhang mit gmake

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+-----------------+---------------------------------------------------------------+
| Variable        | Bedeutung                                                     |
+=================+===============================================================+
| ``USE_GMAKE``   | Der Port ben?tigt ``gmake`` f?r den Build.                    |
+-----------------+---------------------------------------------------------------+
| ``GMAKE``       | Der ganze Pfad zu ``gmake``, wenn es nicht im ``PATH`` ist.   |
+-----------------+---------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn Ihr Port eine X-Applikation ist, die ``Makefile``-Dateien aus
``Imakefile``-Dateien mit imake erzeugt, dann setzen Sie
``USE_IMAKE=yes``. Das sorgt daf?r, dass die Konfigurationsphase
automatisch ein ``xmkmf -a`` ausf?hrt. Wenn das Flag ``-a`` ein Problem
f?r Ihren Port darstellt, setzen Sie ``XMKMF=xmkmf``. Wenn der Port
imake benutzt, aber das ``install.man``-Target nicht versteht, dann
sollte ``NO_INSTALL_MANPAGES=yes`` gesetzt werden.

Wenn das ``Makefile`` im Quelltext Ihres Ports etwas anderes als ``all``
als Haupt-Build-Target hat, setzen Sie ``ALL_TARGET`` entsprechend. Das
Gleiche gilt f?r ``install`` und ``INSTALL_TARGET``.

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

6.3.3. ``configure`` Skript
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn Ihr Port ein ``configure``-Skript benutzt, um ``Makefile``-Dateien
aus ``Makefile.in``-Dateien zu erzeugen, setzen Sie
``GNU_CONFIGURE=yes``. Wenn Sie dem ``configure``-Skript zus?tzliche
Argumente ?bergeben wollen (das Vorgabeargument ist
``--prefix=${PREFIX}         --infodir=${PREFIX}/${INFO_PATH}         --mandir=${MANPREFIX}/man         --build=${CONFIGURE_TARGET}``),
setzen Sie diese zus?tzlichen Argumente in ``CONFIGURE_ARGS``.
Zus?tzliche Umgebungsvariablen k?nnen ?berdie Variable ``CONFIGURE_ENV``
?bergeben werden.

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Tabelle 6.2. Variablen f?r Ports, die ``configure`` benutzen

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+------------------------+---------------------------------------------------------------------------------------------------------------+
| Variable               | Bedeutung                                                                                                     |
+========================+===============================================================================================================+
| ``GNU_CONFIGURE``      | Der Port benutzt ein ``configure``-Skript, um das Bauen vorzubereiten.                                        |
+------------------------+---------------------------------------------------------------------------------------------------------------+
| ``HAS_CONFIGURE``      | Wie ``GNU_CONFIGURE``, nur dass kein Standard-Konfigurations-Target zu ``CONFIGURE_ARGS`` hinzugef?gt wird.   |
+------------------------+---------------------------------------------------------------------------------------------------------------+
| ``CONFIGURE_ARGS``     | Zus?tzliche Argumente f?r das ``configure``-Skript.                                                           |
+------------------------+---------------------------------------------------------------------------------------------------------------+
| ``CONFIGURE_ENV``      | Zus?tzliche Umgebungsvariablen f?r die Abarbeitung des ``configure``-Skriptes.                                |
+------------------------+---------------------------------------------------------------------------------------------------------------+
| ``CONFIGURE_TARGET``   | Ersetzt das Standard-Konfigurations-Target. Vorgabewert ist ``${MACHINE_ARCH}-portbld-freebsd${OSREL}``.      |
+------------------------+---------------------------------------------------------------------------------------------------------------+

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

6.3.4. Benutzung von ``scons``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn Ihr Port SCons benutzt, definieren Sie ``USE_SCONS=yes``.

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Tabelle 6.3. Variablen f?r Ports, die ``scons`` benutzen

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+----------------------+------------------------------------------------------------------------------+
| Variable             | Bedeutung                                                                    |
+======================+==============================================================================+
| ``SCONS_ARGS``       | Port-spezifische SCons-Argumente, die der SCons-Umgebung ?bergeben werden.   |
+----------------------+------------------------------------------------------------------------------+
| ``SCONS_BUILDENV``   | Variablen, die in der System-Umgebung gesetzt werden sollen.                 |
+----------------------+------------------------------------------------------------------------------+
| ``SCONS_ENV``        | Variablen, die in der SCons-Umgebung gesetzt werden sollen.                  |
+----------------------+------------------------------------------------------------------------------+
| ``SCONS_TARGET``     | Letztes Argument, das SCons ?bergeben wird?–??hnlich ``MAKE_TARGET``.        |
+----------------------+------------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

Um ``SConstruct`` im Quelltext alles, was SCons in ``SCONS_ENV``
?bergeben wird, respektieren zu lassen (das ist haupts?chlich
``CC/CXX/CFLAGS/CXXFLAGS``), patchen Sie ``SConstruct``, sodass das
Build ``Environment`` wie folgt konstruiert wird:

.. code:: programlisting

    env = Environment(**ARGUMENTS)

Es kann dann mit ``env.Append`` und ``env.Replace`` modifiziert werden.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------------+--------------------------------+----------------------------------------+
| `Zur?ck <porting-restrictions.html>`__?    | `Nach oben <special.html>`__   | ?\ `Weiter <using-autotools.html>`__   |
+--------------------------------------------+--------------------------------+----------------------------------------+
| 6.2. Ports mit beschr?nkter Verbreitung?   | `Zum Anfang <index.html>`__    | ?6.4. Benutzung von GNU autotools      |
+--------------------------------------------+--------------------------------+----------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
