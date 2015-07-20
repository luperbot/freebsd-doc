=======================================
19.14. Schnappsch?sse von Dateisystemen
=======================================

.. raw:: html

   <div class="navheader">

19.14. Schnappsch?sse von Dateisystemen
`Zur?ck <disks-virtual.html>`__?
Kapitel 19. Speichermedien
?\ `Weiter <quotas.html>`__

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

19.14. Schnappsch?sse von Dateisystemen
---------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Beigetragen von Tom Rhodes.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Zusammen mit `Soft Updates <configtuning-disk.html#soft-updates>`__
bietet FreeBSD eine neue Funktion: Schnappsch?sse von Dateisystemen.

Schnappsch?sse sind Dateien, die ein Abbild eines Dateisystems enthalten
und m?ssen auf dem jeweiligen Dateisystem erstellt werden. Pro
Dateisystem darf es maximal 20?Schnappsch?sse, die im Superblock
vermerkt werden, geben. Schnappsch?sse bleiben erhalten, wenn das
Dateisystem abgehangen, neu eingehangen oder das System neu gestartet
wird. Wenn Sie einen Schnappschuss nicht mehr ben?tigen, k?nnen Sie ihn
mit `rm(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rm&sektion=1>`__
l?schen. Es ist egal, in welcher Reihenfolge Schnappsch?sse gel?scht
werden. Es kann allerdings vorkommen, dass nicht der gesamte
Speicherplatz wieder freigegeben wird, da ein anderer Schnappschuss
einen Teil der entfernten Bl?cke f?r sich beanspruchen kann.

Das unver?nderliche ``Snapshot``-Dateiflag wird nach der Erstellung des
Snaphshots von
`mksnap\_ffs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mksnap_ffs&sektion=8>`__
gesetzt. Durch die Verwendung von
`unlink(1) <http://www.FreeBSD.org/cgi/man.cgi?query=unlink&sektion=1>`__
ist es allerdings m?glich, einen Schnappschuss zu l?schen.

Schnappsch?sse werden mit
`mount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount&sektion=8>`__
erstellt. Das folgende Kommando legt einen Schnappschuss von ``/var`` in
``/var/snapshot/snap`` ab:

.. code:: screen

    # mount -u -o snapshot /var/snapshot/snap /var

Den Schnappschuss k?nnen Sie auch mit
`mksnap\_ffs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mksnap_ffs&sektion=8>`__
erstellen:

.. code:: screen

    # mksnap_ffs /var /var/snapshot/snap

Um einen Schnappschuss auf Ihrem System zu finden, verwenden Sie
`find(1) <http://www.FreeBSD.org/cgi/man.cgi?query=find&sektion=1>`__:

.. code:: screen

    # find /var -flags snapshot

Nachdem ein Schnappschuss erstellt wurde, k?nnen Sie ihn f?r
verschiedene Zwecke benutzen:

.. raw:: html

   <div class="itemizedlist">

-  Sie k?nnen den Schnappschuss f?r die Datensicherung benutzen und ihn
   auf eine CD oder ein Band schreiben.

-  Sie k?nnen den Schnappschuss mit
   `fsck(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck&sektion=8>`__
   manuell pr?fen. Wenn das Dateisystem zum Zeitpunkt der Erstellung des
   Schnappschusses in Ordnung war, sollte
   `fsck(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck&sektion=8>`__
   immer erfolgreich durchlaufen. Der Hintergrund-Prozess
   `fsck(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck&sektion=8>`__
   hat im ?brigen genau diese Aufgabe.

-  Sie k?nnen den Schnappschuss mit
   `dump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dump&sektion=8>`__
   sichern. Sie erhalten dann eine konsistente Sicherung des
   Dateisystems zu dem Zeitpunkt, der durch den Zeitstempel des
   Schnappschusses gegeben ist. Der Schalter ``-L`` von
   `dump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dump&sektion=8>`__
   erstellt f?r die Sicherung einen Schnappschuss und entfernt diesen am
   Ende der Sicherung wieder.

-  Sie k?nnen einen Schnappschuss in den Verzeichnisbaum einh?ngen und
   sich dann den Zustand des Dateisystems zu dem Zeitpunkt ansehen, an
   dem der Schnappschuss erstellt wurde. Der folgende Befehl h?ngt den
   Schnappschuss ``/var/snapshot/snap`` ein:

   .. code:: screen

       # mdconfig -a -t vnode -f /var/snapshot/snap -u 4
       # mount -r /dev/md4 /mnt

.. raw:: html

   </div>

Sie k?nnen sich nun den eingefrorenen Stand des ``/var`` Dateisystems
unterhalb von ``/mnt`` ansehen. Mit Ausnahme der fr?heren
Schnappsch?sse, die als leere Dateien auftauchen, wird zu Beginn alles
so aussehen, wie zum Zeitpunkt der Erstellung des Schnappschusses. Wenn
Sie den Schnappschuss nicht mehr ben?tigen, k?nnen Sie ihn, wie
nachfolgend gezeigt, abh?ngen:

.. code:: screen

    # umount /mnt
    # mdconfig -d -u 4

Weitere Informationen ?ber Soft Updates und Schnappsch?sse von
Dateisystemen sowie technische Artikel finden Sie auf der `Webseite von
Marshall Kirk McKusick <http://www.mckusick.com/>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------------------------------+-------------------------------+-------------------------------+
| `Zur?ck <disks-virtual.html>`__?                              | `Nach oben <disks.html>`__    | ?\ `Weiter <quotas.html>`__   |
+---------------------------------------------------------------+-------------------------------+-------------------------------+
| 19.13. Netzwerk-, speicher- und dateibasierte Dateisysteme?   | `Zum Anfang <index.html>`__   | ?19.15. Dateisystem-Quotas    |
+---------------------------------------------------------------+-------------------------------+-------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
