======================================
4.2. Den originalen Quelltext besorgen
======================================

.. raw:: html

   <div class="navheader">

4.2. Den originalen Quelltext besorgen
`Zur?ck <slow.html>`__?
Kapitel 4. Einen Port in aller Ruhe erstellen
?\ `Weiter <slow-modifying.html>`__

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

4.2. Den originalen Quelltext besorgen
--------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Normalerweise liegt der original Quelltext als gepackte Datei
(``foo.tar.gz     `` oder ``foo.tar.Z``) vor. Kopieren Sie diese nach
``DISTDIR``. Nutzen Sie, soweit m?glich, immer die Quellen aus dem
*Hauptzweig*.

Es ist notwendig die Variable ``MASTER_SITES`` anzupassen, um anzugeben,
wo sich der originale Quelltext befindet. In ``bsd.sites.mk`` finden
sich hilfreiche Definitionen f?r die gebr?uchlichsten Seiten. Bitte
nutzen Sie diese Seiten und die zugeh?rigen Definitionen, soweit dies
m?glich ist. Damit wird vermieden, immer und immer wieder dieselben
Informationen zu wiederholen. Da die Hauptseiten regelm??ig angepasst
werden m?ssen, vereinfacht dieses Vorgehen die Pflege der Dateien f?r
jeden Beteiligten.

Falls keine zuverl?ssige und gut erreichbare FTP/HTTP-Seite zu finden
ist, oder nur Seiten auffindbar sind, die keinen Standards entsprechen,
sollte eine Kopie des Quelltextes auf einer zuverl?ssigen Seite abgelegt
werden. Dies k?nnte z.B. die eigene Internetseite sein.

Ist kein geeigneter Ort zum Ablegen des Quelltextes auffindbar, ist es
m?glich diesen „intern“ auf ``ftp.FreeBSD.org`` abzulegen; dies sollte
jedoch als letzte M?glichkeit angesehen werden. Das Distfile muss in
diesem Fall in ``~/public_distfiles/     `` eines ``freefall``-Accounts
abgelegt werden. Bitten Sie den Committer Ihres Ports dies zu erledigen.
Er wird au?erdem ``MASTER_SITES`` nach ``MASTER_SITE_LOCAL`` und
``     MASTER_SITE_SUBDIR`` auf den ``freefall``-Benutzernamen
angepasst.

Sollte sich das Distfile des Ports regelm??ig ohne Versionsanpassungen
des Autors ?ndern, sollte ?berlegt werden, das Disfile auf der eigenen
Internetseite abzulegen und diese in der Liste der ``MASTER_SITES`` an
die erste Stelle zu setzen. Falls m?glich, sollte der Autor des Ports
gebeten werden, dies zu erledigen; hier?ber wird die Kontrolle des
Quelltextes verbessert. Wird eine eigene Version des Quelltextes auf
eigenen Internetseiten verf?gbar gemacht, verhindert dies Warnungen von
checksum mismatch und reduziert den Arbeitsaufwand der Maintainer der
FTP-Seiten. Auch wenn nur eine Quelle f?r den Quelltext des Ports zur
Verf?gung steht, ist es empfohlen, ein Backup auf einer weiteren Seite
abzulegen und diese als zweiten Eintrag in ``MASTER_SITES`` aufzunehmen.

Sind f?r den Port zus?tzlich aus dem Internet verf?gbare Patches
erforderlich, sollten diese ebenfalls in ``DISTDIR`` abgelegt werden.
Sollten diese Patches von anderer Quelle als der Hauptseite des Ports
stammen, ist das kein Grund zur Sorge. Es gibt Wege diesem Umstand
gerecht zu werden (beachten Sie die unten stehende Beschreibung zu
`PATCHFILES <makefile-distfiles.html#porting-patchfiles>`__).

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------------------+-------------------------------+---------------------------------------+
| `Zur?ck <slow.html>`__?                          | `Nach oben <slow.html>`__     | ?\ `Weiter <slow-modifying.html>`__   |
+--------------------------------------------------+-------------------------------+---------------------------------------+
| Kapitel 4. Einen Port in aller Ruhe erstellen?   | `Zum Anfang <index.html>`__   | ?4.3. Den Port bearbeiten             |
+--------------------------------------------------+-------------------------------+---------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
