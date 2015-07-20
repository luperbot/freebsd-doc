==================================
11.2. Sicherheitsl?cken schliessen
==================================

.. raw:: html

   <div class="navheader">

11.2. Sicherheitsl?cken schliessen
`Zur?ck <security.html>`__?
Kapitel 11. Sicherheit der Ports
?\ `Weiter <security-notify.html>`__

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

11.2. Sicherheitsl?cken schliessen
----------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Bei Ports und Paketen kann eine Sicherheitsl?cke im urspr?nglichen
Programm oder in den Port-Dateien verursacht werden. Im ersten Fall wird
der urspr?ngliche Entwickler den Fehler wahrscheinlich umgehend
korrigieren oder eine neue Version herausgeben und Sie m?ssen den Port
nur aktualisieren und die Korrekturen des Autors beachten. Falls sich
die Korrektur aus irgendeinem Grund verz?gert, sollten Sie `den Port als
``FORBIDDEN`` markieren <dads-noinstall.html>`__ oder selbst den Fehler
f?r den Port korrigieren. Falls die Sicherheitsl?cke im Port verursacht
wird, sollten Sie ihn sobald wie m?glich berichtigen. In jedem Fall
sollte `die Standardvorgehensweise zum Einreichen von
?nderungen <port-upgrading.html>`__ beachtet werden?–?es sei denn, Sie
haben das Recht diese direkt in den Ports-Baum zu committen.

.. raw:: html

   <div class="important" xmlns="">

Wichtig:
~~~~~~~~

Ports-Committer zu sein ist nicht genug, um ?nderungen an einem
beliebigen Port zu committen. Bitte denken Sie daran, dass Ports
?blicherweise Maintainer haben, die Sie respektieren sollten.

.. raw:: html

   </div>

Bitte stellen Sie sicher, dass die Revision des Ports erh?ht wird,
sobald die Sicherheitsl?cke geschlossen wurde. Dadurch sehen die Nutzer,
die installierte Pakete regelm??ig aktualisieren, dass es an der Zeit
ist eine Aktualisierung durchzuf?hren. Au?erdem wird ein neues Paket
gebaut, ?ber FTP–?und WWW-Spiegel verteilt und die unsichere Version
damit verdr?ngt. ``PORTREVISION`` sollte erh?ht werden?–?es sei denn,
``PORTREVISION`` hat sich im Laufe der Korrektur des Fehlers ge?ndert.
Das hei?t, Sie sollten ``PORTREVISION`` erh?hen, wenn Sie eine Korrektur
hinzugef?gt haben. Sie sollten diese aber nicht erh?hen, wenn Sie den
Port auf die neueste Version des Programms gebracht haben und
``PORTREVISION     `` somit schon ver?ndert wurde. Bitte beachten Sie
den `betreffenden
Abschnitt <makefile-naming.html#makefile-naming-revepoch>`__ f?r weitere
Informationen.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------+---------------------------------+------------------------------------------+
| `Zur?ck <security.html>`__?         | `Nach oben <security.html>`__   | ?\ `Weiter <security-notify.html>`__     |
+-------------------------------------+---------------------------------+------------------------------------------+
| Kapitel 11. Sicherheit der Ports?   | `Zum Anfang <index.html>`__     | ?11.3. Die Community informiert halten   |
+-------------------------------------+---------------------------------+------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
