================================
17.7. Das MAC Modul seeotheruids
================================

.. raw:: html

   <div class="navheader">

17.7. Das MAC Modul seeotheruids
`Zur?ck <mac-modules.html>`__?
Kapitel 17. Verbindliche Zugriffskontrolle
?\ `Weiter <mac-bsdextended.html>`__

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

17.7. Das MAC Modul seeotheruids
--------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Modulename: ``mac_seeotheruids.ko``

Parameter in der Kernelkonfiguration: ``options MAC_SEEOTHERUIDS``

Bootparameter: ``mac_seeotheruids_load="YES"``

Das Modul
`mac\_seeotheruids(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_seeotheruids&sektion=4>`__
erweitert die ``sysctl``-Variablen ``security.bsd.see_other_uids`` und
``security.bsd.see_other_gids``. Diese Optionen ben?tigen keine im
Vorhinein zu setzenden Labels und k?nnen leicht durchschaubar mit den
anderen MAC-Modulen zusammenarbeiten.

Nachdem das Modul geladen wurde, k?nnen die folgenden ``sysctl``
Variablen verwendet werden.

.. raw:: html

   <div class="itemizedlist">

-  ``security.mac.seeotheruids.enabled`` dient zur Aktivierung des
   Moduls, zun?chst mit den Standardeinstellungen. Diese verhindern,
   dass Nutzer Prozesse und Sockets sehen k?nnen, die ihnen nicht selbst
   geh?en.

-  ``security.mac.seeotheruids.specificgid_enabled`` kann eine
   spezifizierte Nutzergruppe von dieser Richtlinie ausnehmen. Die
   entsprechende Gruppe mu? an den Parameter
   ``security.mac.seeotheruids.specificgid=XXX`` ?bergeben werden, wobei
   *``XXX``* die ID der Gruppe ist, die von der Richtlinie ausgenommen
   werden soll.

-  ``security.mac.seeotheruids.primarygroup_enabled`` kann verwendet
   werden, um eine spezifische, *prim?re* Nutzergruppe von der
   Richtlinie auszuschliessen. Dieser Parameter und
   ``security.mac.seeotheruids.specificgid_enabled`` schlie?en einander
   aus.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------+-------------------------------+----------------------------------------+
| `Zur?ck <mac-modules.html>`__?   | `Nach oben <mac.html>`__      | ?\ `Weiter <mac-bsdextended.html>`__   |
+----------------------------------+-------------------------------+----------------------------------------+
| 17.6. Modulkonfiguration?        | `Zum Anfang <index.html>`__   | ?17.8. Das MAC Modul bsdextended       |
+----------------------------------+-------------------------------+----------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
