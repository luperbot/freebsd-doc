==========================
7.3. Konfigurationsdateien
==========================

.. raw:: html

   <div class="navheader">

7.3. Konfigurationsdateien
`Zur?ck <plist-cleaning.html>`__?
Kapitel 7. Fortgeschrittene ``pkg-plist``-Methoden
?\ `Weiter <plist-dynamic.html>`__

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

7.3. Konfigurationsdateien
--------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Sollte Ihr Port Konfigurationsdateien in ``PREFIX/etc`` ben?tigen, so
sollten Sie diese *nicht* einfach installieren und in ``pkg-plist``
auflisten. Dies w?rde
`pkg\_delete(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_delete&sektion=1>`__
veranlassen, diese Dateien zu l?schen, selbst wenn wenn sie vom Benutzer
editiert wurden.

Stattdessen sollten Beispieldateien mit einem entsprechenden Suffix
(beispielsweise ``filename.sample``) versehen werden. Ist die
Konfigurationsdatei nicht vorhanden, so sollte die Beispieldatei an
deren Platz kopiert werden. Bei der Deinstallation sollte die
Konfigurationsdatei gel?scht werden, aber nur, wenn sie nicht vom
Benutzer ver?ndert wurde. Das alles muss sowohl im ``Makefile`` des
Ports als auch in der ``pkg-plist`` (f?r die Installation aus einem
Paket) sichergestellt werden.

Beispiel aus einem ``Makefile``:

.. code:: programlisting

    post-install:
        @if [ ! -f ${PREFIX}/etc/orbit.conf ]; then \
        ${CP} -p ${PREFIX}/etc/orbit.conf.sample ${PREFIX}/etc/orbit.conf ; \
        fi

Beispiel aus einer ``pkg-plist``:

.. code:: programlisting

    @unexec if cmp -s %D/etc/orbit.conf.sample %D/etc/orbit.conf; then rm -f %D/etc/orbit.conf; fi
    etc/orbit.conf.sample
    @exec if [ ! -f %D/etc/orbit.conf ] ; then cp -p %D/%F %B/orbit.conf; fi

Wahlweise k?nnen Sie auch eine
`Nachricht <pkg-files.html#porting-message>`__ ausgegeben lassen, in der
Sie den Nutzer auffordern, die Datei an die richtige Stelle zu kopieren
und zu bearbeiten, bevor das Programm ausgef?hrt werden kann.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------+-------------------------------+----------------------------------------------+
| `Zur?ck <plist-cleaning.html>`__?   | `Nach oben <plist.html>`__    | ?\ `Weiter <plist-dynamic.html>`__           |
+-------------------------------------+-------------------------------+----------------------------------------------+
| 7.2. Leere Verzeichnisse?           | `Zum Anfang <index.html>`__   | ?7.4. Dynamische oder statische Paketliste   |
+-------------------------------------+-------------------------------+----------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
