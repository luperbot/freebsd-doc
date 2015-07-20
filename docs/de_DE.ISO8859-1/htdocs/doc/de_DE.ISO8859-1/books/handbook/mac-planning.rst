======================================
17.5. Planung eines Sicherheitsmodells
======================================

.. raw:: html

   <div class="navheader">

17.5. Planung eines Sicherheitsmodells
`Zur?ck <mac-understandlabel.html>`__?
Kapitel 17. Verbindliche Zugriffskontrolle
?\ `Weiter <mac-modules.html>`__

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

17.5. Planung eines Sicherheitsmodells
--------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wann immer eine neue Technologie eingepflegt werden soll, ist es
wichtig, vorher einen Plan zu erstellen. In den verschiedenen Etappen
der Planung sollte der Administrator nie das „Gro?e Ganze“ aus den Augen
verlieren und mindestens die folgenden Punkte beachten:

.. raw:: html

   <div class="itemizedlist">

-  Die Anforderungen

-  Die Ziele

.. raw:: html

   </div>

Wenn Sie MAC verwenden m?chten, sind das im Besonderen folgende Punkte:

.. raw:: html

   <div class="itemizedlist">

-  Wie werden Informationen und Ressourcen auf den Zielsystemen
   klassifiziert?

-  Welche Arten von Informationen bzw. Ressourcen sollen im Zugang
   beschr?nkt sein und welche Art Einschr?nkung soll verwendet werden?

-  Welche(s) MAC Modul(e) w?hlt man, um sein Ziel zu erreichen?

.. raw:: html

   </div>

Es ist immer m?glich, die Einstellungen des Systems und der
Systemressourcen im Nachhinein zu „optimieren“. Es ist aber wirklich
l?stig, das gesamte Dateisystem zu durchsuchen, um Dateien oder
Benutzerkonten zu reparieren. Eine gute Planung hilft dem Administrator,
sich einer sorgenfreien und effizienten Umsetzung eines
Sicherheitsmodells zu versichern. Testlauf des Sicherheitsmodells *vor*
dem Einsatz in seiner richtigen Arbeitsumgebung ist auf jeden Fall
empfehlenswert. Die Idee, ein System mit einer MAC einfach loslaufen zu
lassen, ist wie direkt auf einen Fehlschlag hinzuarbeiten.

Jede Umgebung hat ihre eigenen Anforderungen. Ein tiefgreifendes und
vollst?ndiges Sicherheitsprofil zu erstellen spart weitere ?nderungen,
nachdem das System in Betrieb genommen wurde. Also werden die folgenden
Abschnitte die verschiedenen Module vorstellen, die den Administratoren
zur Verf?gung gestellt werden, die Nutzung und Konfiguration der
einzelnen Module beschreiben; und in einigen F?llen Einblicke gew?hren,
f?r welche Situationen welche Module besonders geeignet sind. Zum
Beispiel ein Webserver kann von der Verwendung der
`mac\_biba(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_biba&sektion=4>`__
oder der
`mac\_bsdextended(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_bsdextended&sektion=4>`__
Richtlinie profitieren. In anderen F?llen, an einem Rechner mit nur
wenigen lokalen Benutzern, ist die
`mac\_partition(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_partition&sektion=4>`__
die Richtlinie der Wahl.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------+-------------------------------+------------------------------------+
| `Zur?ck <mac-understandlabel.html>`__?   | `Nach oben <mac.html>`__      | ?\ `Weiter <mac-modules.html>`__   |
+------------------------------------------+-------------------------------+------------------------------------+
| 17.4. MAC Labels verstehen?              | `Zum Anfang <index.html>`__   | ?17.6. Modulkonfiguration          |
+------------------------------------------+-------------------------------+------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
