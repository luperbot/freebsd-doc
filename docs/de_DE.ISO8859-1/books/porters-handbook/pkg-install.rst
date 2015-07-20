================
8.2. pkg-install
================

.. raw:: html

   <div class="navheader">

8.2. ``pkg-install``
`Zur?ck <pkg-files.html>`__?
Kapitel 8. Die ``pkg-*`` Dateien
?\ `Weiter <pkg-deinstall.html>`__

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

8.2. ``pkg-install``
--------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Sollte es n?tig sein, dass Ihr Port bei der Installation des Bin?rpakets
mit
`pkg\_add(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_add&sektion=1>`__
Befehle ausf?hrt, k?nnen Sie das Skript ``pkg-install`` benutzen. Dieses
Skript wird automatisch dem Paket hinzugef?gt und zweimal von
`pkg\_add(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_add&sektion=1>`__
ausgef?hrt: Zuerst als ``${SH} pkg-install ${PKGNAME}     PRE-INSTALL``
und beim zweiten Mal als
``${SH} pkg-install ${PKGNAME}     POST-INSTALL``. ``$2`` kann also
getestet werden, um festzustellen, in welchem Modus das Skript
ausgef?hrt wird. Die Umgebungsvariable ``PKG_PREFIX`` wird auf das
Verzeichnis gesetzt, in welches das Paket installiert wird. Siehe
`pkg\_add(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_add&sektion=1>`__
f?r weiterf?hrende Informationen.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Das Skript wird nicht automatisch ausgef?hrt, wenn Sie den Port mit
``make install`` installieren. Wenn Sie es ausf?hren lassen wollen, dann
m?ssen Sie es im Makefile aufrufen:
``PKG_PREFIX=${PREFIX} ${SH}       ${PKGINSTALL} ${PKGNAME}       PRE-INSTALL.``

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------+----------------------------------+--------------------------------------+
| `Zur?ck <pkg-files.html>`__?        | `Nach oben <pkg-files.html>`__   | ?\ `Weiter <pkg-deinstall.html>`__   |
+-------------------------------------+----------------------------------+--------------------------------------+
| Kapitel 8. Die ``pkg-*`` Dateien?   | `Zum Anfang <index.html>`__      | ?8.3. ``pkg-deinstall``              |
+-------------------------------------+----------------------------------+--------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
