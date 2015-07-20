===============================
17.8. Das MAC Modul bsdextended
===============================

.. raw:: html

   <div class="navheader">

17.8. Das MAC Modul bsdextended
`Zur?ck <mac-seeotheruids.html>`__?
Kapitel 17. Verbindliche Zugriffskontrolle
?\ `Weiter <mac-ifoff.html>`__

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

17.8. Das MAC Modul bsdextended
-------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Modulname: ``mac_bsdextended.ko``

Parameter in der Kernelkonfiguration: ``options MAC_BSDEXTENDED``

Bootparameter: ``mac_bsdextended_load="YES"``

Das Modul
`mac\_bsdextended(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_bsdextended&sektion=4>`__
erstellt eine Firewall f?r das Dateisystem und ist eine Erweiterung des
sonst ?blichen Rechtemodells. Es erlaubt einem Administrator einen
Regelsatz zum Schutz von Dateien, Werkzeugen und Verzeichnissen in der
Dateisystemhierarchie zu erstellen, der einer Firewall ?hnelt. Sobald
auf ein Objekt im Dateisystem zugegriffen werden soll, wird eine Liste
von Regel abgearbeitet, bis eine passende Regel gefunden wird oder die
Liste zu Ende ist. Das Verhalten kann durch die ?nderung des
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
Parameters ``security.mac.bsdextended.firstmatch_enabled`` eingestellt
werden. ?hnlich wie bei den anderen Firewallmodulen in FreeBSD wird eine
Datei erstellt, welche die Zugriffsregeln enth?lt. Diese wird beim
Systemstart durch eine Variable in
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5>`__
eingebunden.

Der Regelsatz kann mit dem Programm
`ugidfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ugidfw&sektion=8>`__
eingepflegt werden, welches eine Syntax bereitstellt, die der von
`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8>`__
gleicht. Weitere Werkzeuge k?nnen auch selbst erstellt werden, indem die
Funktionen der Bibliothek
`libugidfw(3) <http://www.FreeBSD.org/cgi/man.cgi?query=libugidfw&sektion=3>`__
verwendet werden.

Bei der Arbeit mit diesem Modul ist ?u?erste Vorsicht geboten - falscher
Gebrauch kann den Zugriff auf Teile des Dateisystems komplett
unterbinden.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

17.8.1. Beispiele
~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Nachdem das Modul
`mac\_bsdextended(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_bsdextended&sektion=4>`__
erfolgreich geladen wurde, zeigt das folgende Kommando die gegenw?rtig
aktiven Regeln an:

.. code:: screen

    # ugidfw list 0 slots, 0 rules

Wie erwartet, sind keine Regeln definiert. Das bedeutet, das auf alle
Teile des Dateisystems zugegriffen werden kann. Um eine Regel zu
definieren, die jeden Zugriff durch Nutzer blockiert und nur die Rechte
von ``root`` unangetastet l??t, mu? lediglich dieses Kommando ausgef?hrt
werden:

.. code:: screen

    # ugidfw add subject not uid root new object not uid root mode n

Das ist allerdings keine gute Idee, da nun allen Nutzern der Zugriff auf
selbst die einfachsten Programme wie ``ls`` untersagt wird. Angemessener
w?re etwas wie:

.. code:: screen

    # ugidfw set 2 subject uid user1 object uid user2 mode n
    # ugidfw set 3 subject uid user1 object gid user2 mode n

Diese Befehle bewirken, dass ``user1`` keinen Zugriff mehr auf Dateien
und Programme hat, die ``user2`` geh?ren. Dies schlie?t das Auslesen von
Verzeichniseintr?gen ein.

Anstelle ``uid`` ``user1`` k?nnte auch ``not uid     user2`` als
Parameter ?bergeben werden. Dies w?rde diesselben Einschr?nkungen f?r
alle Nutzer bewirken anstatt nur einen einzigen.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

``root`` ist von diesen Einstellungen nicht betroffen.

.. raw:: html

   </div>

Dies sollte als ?berblick ausreichen, um zu verstehen, wie das Modul
`mac\_bsdextended(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_bsdextended&sektion=4>`__
helfen kann, das Dateisystem abzuschotten. Weitere Informationen bieten
die Manpages
`mac\_bsdextended(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_bsdextended&sektion=4>`__
und
`ugidfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ugidfw&sektion=8>`__.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------+-------------------------------+----------------------------------+
| `Zur?ck <mac-seeotheruids.html>`__?   | `Nach oben <mac.html>`__      | ?\ `Weiter <mac-ifoff.html>`__   |
+---------------------------------------+-------------------------------+----------------------------------+
| 17.7. Das MAC Modul seeotheruids?     | `Zum Anfang <index.html>`__   | ?17.9. Das MAC Modul ifoff       |
+---------------------------------------+-------------------------------+----------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
