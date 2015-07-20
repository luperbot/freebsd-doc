====================================
10.2. Die Dateien UPDATING und MOVED
====================================

.. raw:: html

   <div class="navheader">

10.2. Die Dateien UPDATING und MOVED
`Zur?ck <port-upgrading.html>`__?
Kapitel 10. Einen existierenden Port aktualisieren
?\ `Weiter <security.html>`__

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

10.2. Die Dateien UPDATING und MOVED
------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn die Aktualisierung des Ports spezielle Schritte wie die Anpassung
von Konfigurationsdateien oder die Ausf?hrung eines speziellen Programms
erfordert, sollten Sie diesen Umstand in der Datei
``/usr/ports/UPDATING`` dokumentieren. Eintr?ge in dieser Datei haben
das folgende Format:

.. code:: programlisting

    YYYYMMDD:
      AFFECTS: users of portcategory/portname
      AUTHOR: Your name <Your email address>

      Special instructions

Wenn Sie exakte Portmaster oder Portupgrade-Meldungen einf?gen wollen,
stellen Sie bitte sicher, dass alle Sonderzeichen korrekt dargestellt
werden.

Wurde der Port gel?scht oder umbenannt, sollten Sie dies in der Datei
``/usr/ports/MOVED`` vermerken. Eintr?ge in dieser Datei haben das
folgende Format:

.. code:: programlisting

    old name|new name (blank for deleted)|date of move|reason

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------------------------+---------------------------------------+-------------------------------------+
| `Zur?ck <port-upgrading.html>`__?                     | `Nach oben <port-upgrading.html>`__   | ?\ `Weiter <security.html>`__       |
+-------------------------------------------------------+---------------------------------------+-------------------------------------+
| Kapitel 10. Einen existierenden Port aktualisieren?   | `Zum Anfang <index.html>`__           | ?Kapitel 11. Sicherheit der Ports   |
+-------------------------------------------------------+---------------------------------------+-------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
