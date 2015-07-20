=============================
Kapitel 8. Die pkg-\* Dateien
=============================

.. raw:: html

   <div class="navheader">

Kapitel 8. Die ``pkg-*`` Dateien
`Zur?ck <plist-autoplist.html>`__?
?
?\ `Weiter <pkg-install.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="chapter">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Inhaltsverzeichnis

.. raw:: html

   </div>

`8.1. ``pkg-message`` <pkg-files.html#porting-message>`__
`8.2. ``pkg-install`` <pkg-install.html>`__
`8.3. ``pkg-deinstall`` <pkg-deinstall.html>`__
`8.4. ``pkg-req`` <pkg-req.html>`__
`8.5. ?ndern der Namen der ``pkg-*`` Dateien <pkg-names.html>`__
`8.6. Nutzung von ``SUB_FILES`` und
``SUB_LIST`` <using-sub-files.html>`__

.. raw:: html

   </div>

Es gibt noch einige Tricks mit ``pkg-*``, die wir noch nicht erw?hnt
haben, die aber oft sehr praktisch sind.

.. raw:: html

   <div class="sect1">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

8.1. ``pkg-message``
--------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn Sie dem Anwender bei der Installation weitere Informationen
anzeigen wollen, so k?nnen Sie diese Nachricht in ``pkg-message``
speichern. Diese Vorgehensweise ist oft n?tzlich, um zus?tzliche
Schritte anzuzeigen, die nach
`pkg\_add(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_add&sektion=1>`__
durchgef?hrt werden m?ssen. Dadurch k?nnen Sie auch Lizenzinformationen
darstellen.

Wollen Sie nur ein paar Zeilen ?ber die Einstellungen zum Erstellen des
Ports oder Warnungen ausgeben, benutzen Sie ``ECHO_MSG``.
``pkg-message`` ist nur f?r Schritte nach der Installation vorgesehen.
Sie sollten den Unterschied zwischen ``ECHO_MSG`` und ``ECHO_CMD``
beachten: Ersteres wird benutzt, um Informationen auf dem Bildschirm
auszugeben, w?hrend Letzteres f?r Kommando-Pipelining bestimmt ist.

Ein gutes Beispiel f?r die Benutzung der beiden Befehle ist in
``shells/bash2/Makefile`` zu finden:

.. code:: programlisting

    update-etc-shells:
        @${ECHO_MSG} "updating /etc/shells"
        @${CP} /etc/shells /etc/shells.bak
        @( ${GREP} -v ${PREFIX}/bin/bash /etc/shells.bak; \
        ${ECHO_CMD} ${PREFIX}/bin/bash) >/etc/shells
        @${RM} /etc/shells.bak

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Die ``pkg-message`` wird nicht zur ``pkg-plist`` hinzugef?gt. Sie wird
auch nicht automatisch angezeigt, falls ein Anwender den Port
installiert. Sie m?ssen also die Ausgabe selbst im ``post-install``-Ziel
des Make-Vorgangs veranlassen.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------------------+-------------------------------+------------------------------------+
| `Zur?ck <plist-autoplist.html>`__?                | ?                             | ?\ `Weiter <pkg-install.html>`__   |
+---------------------------------------------------+-------------------------------+------------------------------------+
| 7.5. Automatisiertes Erstellen von Paketlisten?   | `Zum Anfang <index.html>`__   | ?8.2. ``pkg-install``              |
+---------------------------------------------------+-------------------------------+------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
