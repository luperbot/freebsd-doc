=================================
17.16. Beispiel 2: User Lock Down
=================================

.. raw:: html

   <div class="navheader">

17.16. Beispiel 2: User Lock Down
`Zur?ck <mac-implementing.html>`__?
Kapitel 17. Verbindliche Zugriffskontrolle
?\ `Weiter <mac-troubleshoot.html>`__

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

17.16. Beispiel 2: User Lock Down
---------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Grundlage dieses Beispiels ist ein relativ kleines System zur
Datenspeicherung mit weniger als 50 Benutzern. Diese haben die
M?glichkeit, sich einzuloggen und d?rfen nicht nur Daten speichern,
sondern auch auf andere Ressourcen zugreifen.

Die Richtlinien
`mac\_bsdextended(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_bsdextended&sektion=4>`__
und
`mac\_seeotheruids(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_seeotheruids&sektion=4>`__
k?nnen gleichzeitig eingesetzt werden. Zusammen kann man mit ihnen nicht
nur den Zugriff auf Systemobjekte einschr?nken, sondern auch
Nutzerprozesse verstecken.

Beginnen Sie, indem Sie die folgende Zeile in die Datei
``/boot/loader.conf`` eintragen:

.. code:: programlisting

    mac_seeotheruids_load="YES"

Die Richtlinie
`mac\_bsdextended(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_bsdextended&sektion=4>`__
wird durch den anschlie?enden Eintrag in ``/etc/rc.conf`` hinzugef?gt:

.. code:: programlisting

    ugidfw_enable="YES"

Die Standardregeln, welche in ``/etc/rc.bsdextended`` gespeichert sind,
werden zum Systemstart geladen. Sie m?ssen aber noch angepa?t werden. Da
dieser Computer nur Nutzern dienen soll und weitere Dienste gestartet
werden, kann alles bis auf die beiden letzten Zeilen auskommentiert
werden. Das sorgt daf?r dass jeder Nutzer seine eigenen Systemobjekte
erh?lt.

Nun f?gen wir alle ben?tigten Nutzer auf der Maschine hinzu und starten
neu. Zum Testen der Einstellungen loggen Sie sich parallel zwei mal mit
unterschiedlichen Nutzernamen ein und starten Sie das Kommando
``ps aux``. Dort sehen Sie, dass Sie die Prozesse des anderen Nutzers
nicht sehen k?nnen. Versuchen Sie,
`ls(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ls&sektion=1>`__ auf
das Heimatverzeichnis eines anderen Nutzers auszuf?hren. Auch dieser
Versuch wird fehlschlagen.

Solange nicht die speziellen ``sysctl``-Variablen ge?ndert wurden, hat
der Superuser noch vollen Zugriff. Sobald auch diese Einstellungen
angepa?t wurden, f?hren Sie ruhig auch den obigen Test als ``root`` aus.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Wenn ein neuer Benutzer hinzugef?gt wird, ist f?r diesen zun?chst keine
`mac\_bsdextended(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_bsdextended&sektion=4>`__
Regel im Regelsatz vorhanden. Schnelle Abhilfe schafft hier, einfach das
Kernelmodul mit
`kldunload(8) <http://www.FreeBSD.org/cgi/man.cgi?query=kldunload&sektion=8>`__
zu entladen und mit
`kldload(8) <http://www.FreeBSD.org/cgi/man.cgi?query=kldload&sektion=8>`__
erneut einzubinden.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------------+-------------------------------+-----------------------------------------+
| `Zur?ck <mac-implementing.html>`__?            | `Nach oben <mac.html>`__      | ?\ `Weiter <mac-troubleshoot.html>`__   |
+------------------------------------------------+-------------------------------+-----------------------------------------+
| 17.15. Beispiel 1: Nagios in einer MAC Jail?   | `Zum Anfang <index.html>`__   | ?17.17. Fehler im MAC beheben           |
+------------------------------------------------+-------------------------------+-----------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
