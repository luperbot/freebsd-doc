==================
8.3. pkg-deinstall
==================

.. raw:: html

   <div class="navheader">

8.3. ``pkg-deinstall``
`Zur?ck <pkg-install.html>`__?
Kapitel 8. Die ``pkg-*`` Dateien
?\ `Weiter <pkg-req.html>`__

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

8.3. ``pkg-deinstall``
----------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dieses Skript wird ausgef?hrt, wenn ein Paket deinstalliert wird.

Es wird zweimal von
`pkg\_delete(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_delete&sektion=1>`__
aufgerufen. Das erste Mal als
``${SH} pkg-deinstall     ${PKGNAME} DEINSTALL`` und dann als
``${SH} pkg-deinstall ${PKGNAME}     POST-DEINSTALL.``

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------+----------------------------------+--------------------------------+
| `Zur?ck <pkg-install.html>`__?   | `Nach oben <pkg-files.html>`__   | ?\ `Weiter <pkg-req.html>`__   |
+----------------------------------+----------------------------------+--------------------------------+
| 8.2. ``pkg-install``?            | `Zum Anfang <index.html>`__      | ?8.4. ``pkg-req``              |
+----------------------------------+----------------------------------+--------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
