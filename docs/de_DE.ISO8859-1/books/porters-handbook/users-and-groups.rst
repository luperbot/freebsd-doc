==========================================
6.24. Hinzuf?gen von Benutzern und Gruppen
==========================================

.. raw:: html

   <div class="navheader">

6.24. Hinzuf?gen von Benutzern und Gruppen
`Zur?ck <rc-scripts.html>`__?
Kapitel 6. Besonderheiten
?\ `Weiter <ch06s25.html>`__

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

6.24. Hinzuf?gen von Benutzern und Gruppen
------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Manche Ports setzen voraus, dass ein bestimmter Benutzer auf dem System
angelegt ist. W?hlen Sie in einem solchen Fall eine freie Kennnummer
zwischen 50 und 999 aus und tragen Sie diese in ``ports/UIDs`` (f?r
Benutzer) oder ``ports/GIDs`` (f?r Gruppen) ein. Stellen Sie dabei
sicher, dass Sie keine Kennnummer ausw?hlen, die bereits vom System oder
von anderen Ports verwendet wird.

Erstellen Sie bitte eine entsprechende Patch-Datei f?r diese beiden
Dateien, wenn f?r Ihren Port ein neuer Benutzer oder eine neue Gruppe
angelegt werden muss.

Sie k?nnen dann die Variablen ``USERS`` und ``GROUPS`` im ``Makefile``
benutzen, um bei der Port-Installation das automatische Anlegen des
Benutzers zu veranlassen.

.. code:: programlisting

    USERS=  pulse
    GROUPS= pulse pulse-access pulse-rt

Die Liste mit den momentan belegten UIDs (GIDs) befindet sich in
``ports/UIDs`` (``ports/GIDs``).

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------------------------+--------------------------------+--------------------------------------------+
| `Zur?ck <rc-scripts.html>`__?                            | `Nach oben <special.html>`__   | ?\ `Weiter <ch06s25.html>`__               |
+----------------------------------------------------------+--------------------------------+--------------------------------------------+
| 6.23. Starten und Anhalten von Diensten (rc Skripten)?   | `Zum Anfang <index.html>`__    | ?6.25. Von Kernelquellen abh?ngige Ports   |
+----------------------------------------------------------+--------------------------------+--------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
