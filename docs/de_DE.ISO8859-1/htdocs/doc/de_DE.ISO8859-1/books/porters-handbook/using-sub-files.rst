=========================================
8.6. Nutzung von SUB\_FILES und SUB\_LIST
=========================================

.. raw:: html

   <div class="navheader">

8.6. Nutzung von ``SUB_FILES`` und ``SUB_LIST``
`Zur?ck <pkg-names.html>`__?
Kapitel 8. Die ``pkg-*`` Dateien
?\ `Weiter <testing.html>`__

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

8.6. Nutzung von ``SUB_FILES`` und ``SUB_LIST``
-----------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Variablen ``SUB_FILES`` und ``SUB_LIST`` sind n?tzlich, um
dynamische Werte in Port-Dateien zu verwenden, wie beispielsweise der
Installations-\ ``PREFIX`` in ``pkg-message``.

Die Variable ``SUB_FILES`` enth?lt eine Liste von Dateien, die
automatisch ver?ndert werden. Jede *``Datei``* in ``SUB_FILES`` muss ein
entsprechendes Pendant *``datei.in``* im Verzeichnis ``FILESDIR`` haben.
Die modifizierte Version wird in ``WRKDIR`` angelegt. Dateien, die als
Werte von ``USE_RC_SUBR`` (oder veraltet in ``USE_RCORDER``) gespeichert
werden, werden automatisch zu ``SUB_FILES`` hinzugef?gt. F?r die Dateien
``pkg-message``, ``pkg-install``, ``pkg-deinstall`` und ``pkg-req``
werden die jeweiligen Makefile-Variablen selbstt?tig auf die ge?nderte
Version der Datei gesetzt.

Die Variable ``SUB_LIST`` ist eine Liste von ``VAR=WERT``-Paaren. Jedes
Paar ``%%VAR%%`` in den Dateien von ``SUB_FILES`` wird mit ``WERT``
ersetzt. Einige gebr?uchliche Paare werden automatisch definiert:
``PREFIX``, ``LOCALBASE``, ``DATADIR``, ``DOCSDIR``, ``EXAMPLESDIR``.
Jede Zeile, die mit ``@comment`` beginnt, wird nach der
Variablen-Ersetzung aus der neu erstellten Datei gel?scht.

Im folgenden Beispiel wird ``%%ARCH%%`` mit der Systemarchitektur in
``pkg-message`` ersetzt:

.. code:: programlisting

    SUB_FILES=     pkg-message
    SUB_LIST=      ARCH=${ARCH}

Beachten Sie bitte, dass in diesem Beispiel die Datei ``pkg-message.in``
im Verzeichnis ``FILESDIR`` vorhanden sein muss.

Hier ein Beispiel f?r eine gute ``pkg-message.in``:

.. code:: programlisting

    Now it is time to configure this package.
    Copy %%PREFIX%%/share/examples/putsy/%%ARCH%%.conf into your home directory
    as .putsy.conf and edit it.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------------+----------------------------------+---------------------------------+
| `Zur?ck <pkg-names.html>`__?                   | `Nach oben <pkg-files.html>`__   | ?\ `Weiter <testing.html>`__    |
+------------------------------------------------+----------------------------------+---------------------------------+
| 8.5. ?ndern der Namen der ``pkg-*`` Dateien?   | `Zum Anfang <index.html>`__      | ?Kapitel 9. Ihren Port testen   |
+------------------------------------------------+----------------------------------+---------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
