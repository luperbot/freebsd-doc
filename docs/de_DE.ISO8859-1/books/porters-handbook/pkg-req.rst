============
8.4. pkg-req
============

.. raw:: html

   <div class="navheader">

8.4. ``pkg-req``
`Zur?ck <pkg-deinstall.html>`__?
Kapitel 8. Die ``pkg-*`` Dateien
?\ `Weiter <pkg-names.html>`__

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

8.4. ``pkg-req``
----------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Muss Ihr Port entscheiden, ob er installiert werden soll oder nicht,
k?nnen Sie ein ``pkg-req``-„Bedingungsskript“ verwenden. Dieses wird
automatisch bei der Installation/ Deinstallation aufgerufen, um zu
entscheiden, ob die Installation/ Deinstallation fortgesetzt werden
soll.

Das Skript wird w?hrend der Installation von
`pkg\_add(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_add&sektion=1>`__
als ``pkg-req ${PKGNAME}     INSTALL`` aufgerufen. Bei der
Deinstallation wird es von
`pkg\_delete(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_delete&sektion=1>`__
als ``pkg-req ${PKGNAME}     DEINSTALL`` ausgef?hrt.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------+----------------------------------+------------------------------------------------+
| `Zur?ck <pkg-deinstall.html>`__?   | `Nach oben <pkg-files.html>`__   | ?\ `Weiter <pkg-names.html>`__                 |
+------------------------------------+----------------------------------+------------------------------------------------+
| 8.3. ``pkg-deinstall``?            | `Zum Anfang <index.html>`__      | ?8.5. ?ndern der Namen der ``pkg-*`` Dateien   |
+------------------------------------+----------------------------------+------------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
