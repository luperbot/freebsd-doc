======================================================
12.6. Etwas hinter die bsd.port.mk-Anweisung schreiben
======================================================

.. raw:: html

   <div class="navheader">

12.6. Etwas hinter die ``bsd.port.mk``-Anweisung schreiben
`Zur?ck <freebsd-versions.html>`__?
Kapitel 12. Was man machen respektive vermeiden sollte
?\ `Weiter <dads-sh-exec.html>`__

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

12.6. Etwas hinter die ``bsd.port.mk``-Anweisung schreiben
----------------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Schreiben Sie bitte nichts hinter die
``.include     <bsd.port.mk>``-Zeile. Normalerweise kann dies vermieden
werden, indem Sie die Datei ``bsd.port.pre.mk`` irgendwo in der Mitte
Ihres ``Makefile``\ s und ``bsd.port.post.mk`` am Ende einf?gen.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Sie d?rfen entweder nur das
``bsd.port.pre.mk``/``bsd.port.post.mk``-Paar oder ``bsd.port.mk``
alleine hinzuf?gen; vermischen Sie diese Verwendungen nicht!

.. raw:: html

   </div>

``bsd.port.pre.mk`` definiert nur einige Variablen, welche in Tests im
``Makefile`` benutzt werden k?nnen, ``bsd.port.post.mk`` definiert den
Rest.

Hier sind einige wichtige Variablen, welche in ``bsd.port.pre.mk``
definiert sind (dies ist keine vollst?ndige Liste, lesen Sie bitte
``bsd.port.mk`` f?r eine vollst?ndige Auflistung).

.. raw:: html

   <div class="informaltable">

+---------------------+---------------------------------------------------------------------------------------------------------------------------------------+
| Variable            | Beschreibung                                                                                                                          |
+=====================+=======================================================================================================================================+
| ``ARCH``            | Die Architektur, wie von ``uname             -m`` zur?ckgegeben (z.B. ``i386``)                                                       |
+---------------------+---------------------------------------------------------------------------------------------------------------------------------------+
| ``OPSYS``           | Der Typ des Betriebsystems, wie von ``uname             -s`` zur?ckgegeben (z.B. ``FreeBSD``)                                         |
+---------------------+---------------------------------------------------------------------------------------------------------------------------------------+
| ``OSREL``           | Die Release Version des Betriebssystems (z.B., ``2.1.5`` oder ``2.2.7``)                                                              |
+---------------------+---------------------------------------------------------------------------------------------------------------------------------------+
| ``OSVERSION``       | Die numerische Version des Betriebssystems; gleichbedeutend mit ```__FreeBSD_version`` <freebsd-versions.html>`__.                    |
+---------------------+---------------------------------------------------------------------------------------------------------------------------------------+
| ``PORTOBJFORMAT``   | Das Objektformat des Systems (``elf`` oder ``aout``; beachten Sie, dass f?r „moderne“ Versionen von FreeBSD ``aout`` veraltet ist).   |
+---------------------+---------------------------------------------------------------------------------------------------------------------------------------+
| ``LOCALBASE``       | Die Basis des „local“ Verzeichnisbaumes (z.B. ``/usr/local/``)                                                                        |
+---------------------+---------------------------------------------------------------------------------------------------------------------------------------+
| ``PREFIX``          | Wo der Port sich selbst installiert (siehe `Mehr Informationen ?ber ``PREFIX`` <porting-prefix.html>`__).                             |
+---------------------+---------------------------------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Falls Sie die Variablen ``USE_IMAKE``, ``USE_X_PREFIX``, oder
``MASTERDIR`` definieren m?ssen, sollten Sie dies vor dem Einf?gen von
``bsd.port.pre.mk`` machen.

.. raw:: html

   </div>

Hier sind ein paar Beispiele von Dingen, die Sie hinter die Anweisung
``bsd.port.pre.mk`` schreiben k?nnen:

.. code:: programlisting

    # lang/perl5 muss nicht kompliliert werden, falls perl5 schon auf dem System ist
    .if ${OSVERSION} > 300003
    BROKEN= perl ist im System
    .endif

    # nur eine Versionsnummer f?r die ELF Version der shlib
    .if ${PORTOBJFORMAT} == "elf"
    TCL_LIB_FILE=  ${TCL_LIB}.${SHLIB_MAJOR}
    .else
    TCL_LIB_FILE=  ${TCL_LIB}.${SHLIB_MAJOR}.${SHLIB_MINOR}
    .endif

    # die Software erstellt schon eine Verkn?pfung f? ELF, aber nicht f? a.out
    post-install:
    .if ${PORTOBJFORMAT} == "aout"
           ${LN} -sf liblinpack.so.1.0 ${PREFIX}/lib/liblinpack.so
    .endif

Sie haben sich daran erinnert Tabulator statt Leerzeichen nach
``BROKEN=`` und ``TCL_LIB_FILE=`` zu benutzen, oder? :-).

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------+-------------------------------------+------------------------------------------------------------------+
| `Zur?ck <freebsd-versions.html>`__?   | `Nach oben <porting-dads.html>`__   | ?\ `Weiter <dads-sh-exec.html>`__                                |
+---------------------------------------+-------------------------------------+------------------------------------------------------------------+
| 12.5. \_\_FreeBSD\_version Werte?     | `Zum Anfang <index.html>`__         | ?12.7. Benutzen Sie die ``exec``-Anweisung in Wrapper-Skripten   |
+---------------------------------------+-------------------------------------+------------------------------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
