=======================
6.21. Mozilla verwenden
=======================

.. raw:: html

   <div class="navheader">

6.21. Mozilla verwenden
`Zur?ck <using-xfce.html>`__?
Kapitel 6. Besonderheiten
?\ `Weiter <using-databases.html>`__

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

6.21. Mozilla verwenden
-----------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Tabelle 6.42. Variablen f?r Ports, die Mozilla verwenden

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+-----------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``USE_GECKO``               | Vom Port unterst?tzte Gecko-Backends. M?gliche Werte sind: ``libxul`` (``libxul.so``), ``seamonkey`` (``libgtkembedmoz.so``, (veraltet, sollte daher nicht mehr verwendet werden).                                                  |
+-----------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``USE_FIREFOX``             | Der Port ben?tigt Firefox, um korrekt zu funktionieren. M?gliche Werte sind: ``yes`` (verwendet die Standardversion), ``40``, ``36``, ``35``. Die Standardversion ist derzeit ``40``.                                               |
+-----------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``USE_FIREFOX_BUILD``       | Um den Port zu bauen, muss Firefox installiert sein. Wird diese Variable gesetzt, wird automatisch auch ``USE_FIREFOX`` gesetzt.                                                                                                    |
+-----------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``USE_SEAMONKEY``           | Der Port ben?tigt Seamonkey, um korrekt zu funktionieren. M?gliche Werte sind: ``yes`` (verwendet die Standardversion), ``20``, ``11`` (veraltet, sollte daher nicht mehr verwendet werden). Die Standardversion ist ``20``.        |
+-----------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``USE_SEAMONKEY_BUILD``     | Um den Port zu bauen, muss Seamonkey installiert sein. Wird diese Variable gesetzt, wird automatisch auch ``USE_SEAMONKEY`` gesetzt.                                                                                                |
+-----------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``USE_THUNDERBIRD``         | Dieser Port ben?tigt Thunderbird, um korrekt zu funktionieren. M?gliche Werte sind: ``yes`` (verwendet die Standardversion), ``31``, ``30`` (veraltet, sollte daher nicht mehr verwendet werden). Die Standardversion ist ``31``.   |
+-----------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``USE_THUNDERBIRD_BUILD``   | Um den Port zu bauen, muss Thunderbird installiert sein. Wird diese Variable gesetzt, wird automatisch auch ``USE_THUNDERBIRD`` gesetzt.                                                                                            |
+-----------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

Eine komplette Liste aller verf?gbaren Variablen finden Sie in der Datei
``/usr/ports/Mk/bsd.gecko.mk``.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------+--------------------------------+----------------------------------------+
| `Zur?ck <using-xfce.html>`__?   | `Nach oben <special.html>`__   | ?\ `Weiter <using-databases.html>`__   |
+---------------------------------+--------------------------------+----------------------------------------+
| 6.20. Xfce verwenden?           | `Zum Anfang <index.html>`__    | ?6.22. Benutzung von Datenbanken       |
+---------------------------------+--------------------------------+----------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
