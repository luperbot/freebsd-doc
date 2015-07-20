=========================================
17.12. Das MAC Modul Multi-Level Security
=========================================

.. raw:: html

   <div class="navheader">

17.12. Das MAC Modul Multi-Level Security
`Zur?ck <mac-partition.html>`__?
Kapitel 17. Verbindliche Zugriffskontrolle
?\ `Weiter <mac-biba.html>`__

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

17.12. Das MAC Modul Multi-Level Security
-----------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Modulname: ``mac_mls.ko``

Parameter f?r die Kernelkonfiguration: ``options       MAC_MLS``

Bootparameter: ``mac_mls_load="YES"``

Die Richtlinie
`mac\_mls(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_mls&sektion=4>`__
kontrolliert die Zugriffe zwischen Subjekten und Objekten, indem sie den
Informationsflu? strengen Regeln unterwirft.

In MLS Umgebungen wird jedem Subjekt oder Objekt ein „Freigabe“-Level
zugeordnet, und diese werden wiederum zu einzelnen Verb?nden
zusammengefa?t. Da diese Freigabe- oder Anf?lligkeits-Level Zahlen
gr??er 6000 erreichen k?nnen, ist es f?r jeden Systemadministrator eine
undankbare Aufgabe, jede Entit?t von Grund auf zu konfigurieren. Zum
Gl?ck gibt es 3 „instant“ Labels, die in der Richtlinie zur Anwendung
bereit stehen.

Diese drei Labels hei?en ``mls/low``, ``mls/equal`` und ``mls/high``. Da
sie in den Manpages
`mac\_mls(4) <http://www.FreeBSD.org/cgi/man.cgi?query=mac_mls&sektion=4>`__
ausf?hrlich beschrieben werden, gibt es hier nur einen kurzen Abri?:

.. raw:: html

   <div class="itemizedlist">

-  Das Label ``mls/low`` ist eine niedrige Einstellung, die von allen
   anderen dominiert werden darf. Alles, was mit ``mls/low`` versehen
   wird, hat ein niedriges Freigabe-Level und darf auf keine
   Informationen zugreifen, denen ein h?heres Freigabe-Level zugeordnet
   wurde. Einem Objekt mit diesem Label kann au?erdem keine Information
   durch ein Objekt h?herer Freigabe ?bergeben werden, es kann also auch
   nicht durch solche Objekte editiert oder ?berschrieben werden.

-  Das Label ``mls/equal`` wird an Objekte vergeben, die von dieser
   Richtlinie ausgenommen werden sollen.

-  Das Label ``mls/high`` verk?rpert das h?chstm?gliche Freigabe-Level.
   Objekte, denen dieses Label zugeordnet wird, dominieren alle anderen
   Objekte des Systems. Trotzdem k?nnen sie Objekten mit einem
   niedrigeren Freigabe-Level keine Informationen zuspielen.

.. raw:: html

   </div>

MLS bietet:

.. raw:: html

   <div class="itemizedlist">

-  Eine hierarchische Sicherheitsschicht und Zuordnung
   nichthierarchischer Kategorien;

-  Feste Regeln: kein „Read-Up“, kein „Write-Down“ (ein Subjekt kann nur
   Objekte gleicher oder *niedrigerer* Stufe lesen, und es kann nur
   Objekte gleicher oder *h?herer* Stufe schreiben);

-  Geheimhaltung (indem unangemessene Offenlegung von Daten verhindert
   wird);

-  Eine Basis zum Entwerfen von Systemen, die Daten verschiedener
   Vertraulichkeitsebenen gleichzeitig handhaben sollen (ohne das
   geheime und vertrauliche Informationen untereinander ausgetauscht
   werden k?nnen).

.. raw:: html

   </div>

Nachfolgend werden die ``sysctl``-Variablen vorgestellt, die f?r die
Einrichtung spezieller Dienste und Schnittstellen vorhanden sind.

.. raw:: html

   <div class="itemizedlist">

-  ``security.mac.mls.enabled`` schaltet die Richtlinie MLS ein (oder
   aus).

-  ``security.mac.mls.ptys_equal`` sorgt daf?r, dass w?hrend der
   Initialisierung alle
   `pty(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pty&sektion=4>`__-Ger?te
   als ``mls/equal`` gekennzeichnet werden.

-  ``security.mac.mls.revocation_enabled`` sorgt daf?r, dass die
   Zugriffsrechte von Objekten wieder zur?ckgesetzt werden, nachdem
   deren Label vor?bergehend auf ein niedrigeres Freigabe-Level ge?ndert
   wurde.

-  ``security.mac.mls.max_compartments`` gibt die maximale Anzahl von
   Verb?nden an. Im Prinzip ist es die h?chste Nummer eines Verbundes
   auf dem System.

.. raw:: html

   </div>

Um die Labels der MLS Richtlinie zu bearbeiten verwendet man
`setfmac(8) <http://www.FreeBSD.org/cgi/man.cgi?query=setfmac&sektion=8>`__.
Um ein Objekt zu kennzeichnen, benutzen Sie folgendes Kommando:

.. code:: screen

    # setfmac mls/5 test

Um das MLS-Label der Datei ``test`` auszulesen, verwenden Sie dieses
Kommando:

.. code:: screen

    # getfmac test

Dies ist eine Zusammenstellung der Merkmale von ``test``. Ein anderer
Ansatz ist, f?r diese Richtlinie eine Konfigurationsdatei in ``/etc``
abzulegen, die alle Informationen enth?lt und mit der dann das Kommando
``setfmac`` gef?ttert wird. Diese Vorgehensweise wird erkl?rt, nachdem
alle Richtlinien vorgestellt wurden.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

17.12.1. Verbindlicher Vertraulichkeit in der Planungsphase
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Mit dem Richtlinienmodul `` Multi-Level Security`` bereitet sich ein
Administrator darauf vor, den Flu? vertraulicher Informationen zu
kontrollieren. Beim Starten der Richtlinie ist immer ``mls/low``
voreingestellt?- alles kann auf alles zugreifen. Der Administrator
?ndert dies w?hrend der eigentlichen Konfiguration, indem er die
Vertraulichkeit bestimmter Objekte erh?ht.

Jenseits der drei Grundeinstellungen des Labels kann der Administrator
einzelne Nutzer oder Nutzergruppen nach Bedarf zusammenschlie?en und den
Informationsaustausch zwischen diesen gestatten oder unterbinden. Es ist
sicher eine Vereinfachung, die Freigabe-Level mit Begriffen wie
``vertraulich``, ``geheim`` oder ``streng geheim`` zu bezeichnen. Einige
Administratoren erstellen einfach verschiedene Gruppen auf der Ebene von
gegenw?rtigen Projekten. Ungeachtet der Herangehensweise bei der
Klassifizierung mu? ein gut durchdachter Plan existieren, bevor eine
derart einengende Richtlinie umgesetzt wird.

Exemplarisch f?r die Anwendung dieses Moduls bzw. dieser Richtlinie
seien angef?hrt:

.. raw:: html

   <div class="itemizedlist">

-  Ein E-Commerce Webserver

-  Ein Dateiserver, der vertrauliche Informationen einer Firma oder
   eines Konzerns speichert

-  Umgebungen in Finanzeinrichtungen

.. raw:: html

   </div>

Der unsinnigste Einsatzort f?r diese Richtlinie w?re ein
Arbeitsplatzrechner mit nur zwei oder drei Benutzern.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------+-------------------------------+---------------------------------+
| `Zur?ck <mac-partition.html>`__?   | `Nach oben <mac.html>`__      | ?\ `Weiter <mac-biba.html>`__   |
+------------------------------------+-------------------------------+---------------------------------+
| 17.11. Das MAC Modul partition?    | `Zum Anfang <index.html>`__   | ?17.13. Das MAC Modul Biba      |
+------------------------------------+-------------------------------+---------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
