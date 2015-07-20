===================================
3.9. Arbeiten nach der Installation
===================================

.. raw:: html

   <div class="navheader">

3.9. Arbeiten nach der Installation
`Zur?ck <bsdinstall-final-warning.html>`__?
Kapitel 3. FreeBSD?9.\ *``x``* (und neuer) installieren
?\ `Weiter <bsdinstall-install-trouble.html>`__

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

3.9. Arbeiten nach der Installation
-----------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Konfiguration von verschiedenen Optionen folgt auf eine erfolgreiche
FreeBSD-Installation. Eine solche Option kann durch das erneute betreten
der Konfigurationsoptionen aus dem letzten Men? vor dem Neustart in das
gerade installierte FreeBSD-System angepasst werden.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.9.1. Setzen des ``root``-Passworts
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das ``root``-Password muss gesetzt werden. Wichtig ist dabei zu wissen,
dass die eingegebenen Zeichen nicht auf dem Bildschirm angezeigt werden.
Nachdem das Passwort eingegeben wurde, muss es zur Best?tigung erneut
eingetippt werden. Damit werden auch Tippfehler verhindert.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 3.21. Das ``root``-Passwort setzen

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Das root-Passwort setzen|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Nachdem das Passwort erfolgreich gesetzt wurde, wird die Installation
nun fortgesetzt.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.9.2. Die Netzwerkschnittstelle konfigurieren
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Die Netzwerkkonfiguration wird ?bersprungen, falls dies bereits als Teil
der *bootonly* durchgef?hrt worden ist.

.. raw:: html

   </div>

Eine Liste aller gefundenen Netzwerkschnittstellen, die auf diesem
Computer gefunden wurden, wird als n?chstes angezeigt. W?hlen Sie davon
eine aus, um diese zu konfigurieren.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 3.22. Eine zu konfigurierende Netzwerkschnittstelle ausw?hlen

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Eine zu konfigurierende Netzwerkschnittstelle ausw?hlen|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.9.2.1. Eine drahtlose Netzwerkverbindung einrichten
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Sollte eine drahtlose Netzwerkverbindung ausgew?hlt worden sein, m?ssen
WLAN-Identifikation und Sicherheitsparameter nun eingegeben werden, um
die Verbindung mit dem Netzwerk herzustellen.

Drahtlose Netzwerke werden durch einen Service Set Identifier oder auch
SSID genannt, identifiziert. Der SSID ist ein kurzer, eindeutiger Namen,
der f?r jedes Netzwerk vergeben wird.

Die meisten drahtlosen Netzwerke verschl?sseln die ?bertragenen Daten,
um die Information darin vor unautorisiertem Zugriff zu sch?tzen. Die
Verwendung von WPA2-Verschl?sselung wird empfohlen. ?ltere
Verschl?sselungstypen, wie WEP, bieten nur sehr wenig Sicherheit.

Der erste Schritt des Verbindungsaufbaus ist das drahtlose Netzwerk nach
drahtlosen Zugriffspunkten (access points) zu scannen.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 3.23. Nach drahtlosen Access Points scannen

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Nach drahtlosen Access Points scannen|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

SSIDs, die w?hrend des scannens gefunden wurden, werden aufgelistet,
gefolgt von einer Beschreibung der Verschl?sselungsarten, die f?r dieses
Netzwerk verf?gbar sind. Falls die gew?nschte SSID nicht in der Liste
auftaucht, w?hlen Sie [?Rescan?], um erneut einen Scanvorgang
durchzuf?hren. Falls dann das gew?nschte Netzwerk immer noch nicht
erscheint, ?berpr?fen Sie Ihre Antenne auf Verbindungsprobleme oder
versuchen Sie, n?her an den Access point zu gelangen. Scannen Sie erneut
nach jeder vorgenommenen ?nderung.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 3.24. Ein drahtloses Netzwerk ausw?hlen

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Ein drahtloses Netzwerk ausw?hlen|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Verschl?sselungsinformationen, um sich mit dem Netzwerk zu
verbinden, werden nach der Auswahl des Netzwerks eingegeben. Mit WPA2
wird nur ein Passwort (auch bekannt als Pre-Shared Key oder PSK)
ben?tigt. Zeichen, die in die Eingabebox getippt werden, erscheinen aus
Sicherheitsgr?nden als Sternchen.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 3.25. Verbindungsaufbau mit WPA2

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Verbindungsaufbau mit WPA2|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die Netzwerkkonfiguration wird fortgesetzt, nachdem das drahtlose
Netzwerk und die Verbindungsinformationen eingegeben wurden.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.9.2.2. Konfiguration des IPv4-Netzwerks
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

W?hlen Sie, ob Sie ein IPv4-Netzwerk verwenden m?chten. Dies ist der am
h?ufigsten vorkommende Typ einer Netzwerkverbindung.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 3.26. Auswahl von IPv4

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Auswahl von IPv4|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Es gibt zwei Arten, ein IPv4-Netzwerk zu konfigurieren. *DHCP* wird
automatisch die Netzwerkschnittstelle richtig konfigurieren und sollte
als bevorzugte Methode verwendet werden. *Statische* Konfiguration
erfordert die manuelle Eingabe von Netzwerkinformationen.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Geben Sie keine zuf?llig gew?hlten Netzwerkinformationen ein, da dies
nicht funktionieren wird. Holen Sie sich die in `Abschnitt?3.3.3,
„Netzwerkparameter
ermitteln“ <bsdinstall-pre.html#bsdinstall-collect-network-information>`__
gezeigten Informationen von Ihrem Netzwerkadministrator oder
Serviceprovider.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.9.2.2.1. Netzwerkkonfiguration von IPv4 mittels DHCP
''''''''''''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Falls ein DHCP-Server zur Verf?gung steht, w?hlen Sie [?Yes?], um die
Netzwerkschnittstelle automatisch einrichten zu lassen.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 3.27. Ausw?hlen der IPv4-Konfiguration ?ber DHCP

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Ausw?hlen der IPv4-Konfiguration ?ber DHCP|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.9.2.2.2. Statische IPv4-Netzwerkkonfiguration
'''''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Statische Konfiguration der Netzwerkschnittstelle erfordert die die
Eingabe einiger IPv4-Informationen.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 3.28. Statische IPv4-Konfiguration

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Statische IPv4-Konfiguration|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="itemizedlist">

-  ``IP-Adresse`` - Die manuell festgelegte IPv4-Adresse, welche diesem
   Computer zugewiesen werden soll. Diese Adresse muss eindeutig sein
   und darf von keinem anderen Ger?t im lokalen Netzwerk bereits
   verwendet werden.

-  ``Subnetzmaske`` - Die Subnetzmaske, die im lokalen Netzwerk
   Verwendung findet. Typischerweise ist dies ``255.255.255.0``.

-  ``Defaultrouter`` - Die IP-Adresse des Defaultrouters in diesem
   Netzwerk. Normalerweise ist das die Adresse des Routers oder einer
   anderen Netzwerkkomponente, die das lokale Netzwerk mit dem Internet
   verbindet. Auch bekannt als das *Default Gateway*.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.9.2.3. Konfiguration des IPv6-Netzwerks
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

IPv6 ist eine neuere Methode der Netzwerkkonfiguration. Falls IPv6
verf?gbar ist und verwendet werden soll, w?hlen Sie [?Yes?] aus.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 3.29. Auswahl von IPv6

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Auswahl von IPv6|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

IPv6 besitzt ebenfalls zwei Arten der Konfiguration. *SLAAC*, oder
*StateLess Address AutoConfiguration*, wird die Netzwerkschnittstelle
automatisch richtig konfigurieren. *Statische* Konfiguration verlangt
die manuelle Eingabe von Netzwerkinformationen.

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.9.2.3.1. IPv6 Stateless Address Autoconfiguration
'''''''''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

SLAAC erlaubt es einer IPv6-Netzwerkkomponente, die Information zur
automatischen Konfiguration von einem lokalen Router abzufragen. Lesen
Sie `RFC4862 <http://tools.ietf.org/html/rfc4862>`__ f?r weitere
Informationen.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 3.30. Auswahl der IPv6 SLAAC-Konfiguration

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Auswahl der IPv6 SLAAC-Konfiguration|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.9.2.3.2. Statische IPv6-Netzwerkkonfiguration
'''''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Statische Konfiguration der Netzwerkschnittstelle ben?tigt die Eingabe
von IPv6-Konfigurationsinformationen.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 3.31. Statische IPv6-Konfiguration

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Statische IPv6-Konfiguration|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="itemizedlist">

-  ``IPv6-Adresse`` - The manuell zugewiesene IP-Adresse, welche dem
   Computer zugeteilt werden soll. Diese Adresse muss eindeutig sein und
   nicht bereits von einer anderen Netzwerkkomponente im lokalen
   Netzwerk verwendet werden.

-  ``Defaultrouter`` - Die IPv6-Adresse des Defaultrouters in diesem
   Netzwerk. Normalerweise ist dies die Adresse des Routers oder einer
   anderen Netzwerkkomponente, welche das lokale Netz mit dem Internet
   verbindet. Auch bekannt als *Default Gateway*.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.9.2.4. DNS-Konfiguration
^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Der *Domain Name System* (oder auch *DNS*) Aufl?ser wandelt Hostnamen
von und zu Netzwerkadressen um. Falls DHCP oder SLAAC verwendet wurde,
um die Netzwerkschnittstelle zu konfigurieren, ist die Konfiguration f?r
den Aufl?ser m?glicherweise bereits vorhanden. Andernfalls geben Sie den
lokalen Netzwerkdom?nennamen in das Suchfeld ein. DNS #1 und DNS #2 sind
die IP-Adressen der lokalen DNS-Server. Zumindest ein DNS-Server wird
ben?tigt.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 3.32. DNS-Konfiguration

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|DNS-Konfiguration|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.9.3. Setzen der Zeitzone
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das Setzen der Zeitzone f?r Ihre Maschine erlaubt es, diese auf
regionale Zeitver?nderungen hin anzupassen und um andere
zeitzonenbezogene Funktionen richtig durchzuf?hren.

Das hier Beispiel gezeigte Beispiel bezieht sich auf einen Rechner in
der ?stlichen Zeitzone der Vereinigten Staaten. Ihre Auswahl wird von
Ihrer geographischen Position davon abweichen.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 3.33. Lokale oder UTC-Zeit

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Lokale oder UTC-Zeit|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

W?hlen Sie [?Yes?] oder [?No?], abh?ngig davon, wie die Rechneruhr
konfiguriert ist und dr?cken Sie dann **Enter**. Wenn Sie nicht wissen,
ob Ihr System UTC oder lokale Zeit verwendet, w?hlen Sie [?No?], um die
am h?ufigsten verwendete lokale Zeit zu setzen.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 3.34. Das Gebiet ausw?hlen

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Das Gebiet ausw?hlen|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das passende Gebiet wird durch die Pfeiltasten und das anschliessende
dru?cken von **Enter** gew?hlt.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 3.35. Das Land ausw?hlen

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Das Land ausw?hlen|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

W?hlen Sie das zutreffende Land mit den Pfeiltasten und durch
anschliessendes dr?cken von **Enter** aus.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 3.36. W?hlen einer Zeitzone

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|W?hlen einer Zeitzone|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die passende Zeitzone wird durch die Pfeiltasten und anschliessendes
dr?cken von **Enter** ausgew?hlt.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 3.37. Best?tigen der Zeitzone

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Best?tigen der Zeitzone|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Best?tigen Sie, dass die Abk?rzung f?r die Zeitzone richtig ist. Wenn
Ihnen diese richtig erscheint, dr?cken Sie **Enter**, um mit dem Rest
der Konfiguration nach der Installation fortzufahren.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.9.4. Zu aktivierende Dienste ausw?hlen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Zus?tzliche Systemdienste, die zur Startzeit aktiviert werden sollen,
k?nnen eingeschaltet werden. All diese Dienste sind optional.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 3.38. Auswahl zus?tzlicher Dienste

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Auswahl zus?tzlicher Dienste|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="itemizedlist">

.. raw:: html

   <div class="itemizedlist-title">

Zus?tzliche Dienste

.. raw:: html

   </div>

-  ``sshd`` - Secure Shell (SSH)-Dienst f?r sicheren Fernzugriff.

-  ``moused`` - Sorgt f?r Mausunterst?tzung innerhalb der Systemkonsole.

-  ``ntpd`` - Network Time Protocol (NTP)-Dienst zur automatischen
   Uhrzeitsynchronisation.

-  ``powerd`` - Systemleistungskontrollwerkzeug zur Leistungsregelung
   und f?r Stromsparfunktionen.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.9.5. Absturzaufzeichnung aktivieren
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

bsdinstall wird Sie fragen, ob die Absturzaufzeichnung auf dem
Zielsystem aktiviert werden soll. Die Aktivierung von
Absturzaufzeichnungen kann sehr n?tzlich sein, um Systemfehler
aufzusp?ren, deswegen wird Anwendern empfohlen, diese so oft wie m?glich
einzusetzen. W?hlen Sie [?Yes?], um Absturzaufzeichnungen zu aktivieren
oder [?No?], um ohne die Aufzeichnung von Abst?rzen fortzufahren.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 3.39. Aktivierung der Absturzaufzeichnung

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Aktivierung der Absturzaufzeichnung|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.9.6. Benutzer hinzuf?gen
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das hinzuf?gen von mindestens einem Benutzer w?hrend der Installaton
erlaubt das Benutzen des Systems ohne als ``root``-Benutzer angemeldet
zu sein. Wenn man als ``root`` angemeldet ist, gibt es so gut wie keine
Beschr?nkungen oder Schutz vor dem, was man tun kann. Anmeldenals
normaler Benutzer ist daher sicherer und bietet mehr Schutz.

W?hlen Sie [?Yes?], um neue Benutzer hinzuzuf?gen.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 3.40. Benutzerkonten hinzuf?gen

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Benutzerkonten hinzuf?gen|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Geben Sie die n?tigen Informationen f?r den Benutzer ein, der dem System
hinzugef?gt werden soll.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 3.41. Benutzerinformationen eingeben

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Benutzerinformationen eingeben|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="itemizedlist">

.. raw:: html

   <div class="itemizedlist-title">

Benutzerinformationen

.. raw:: html

   </div>

-  ``Username`` - Der Name des Benutzers, den man zur Anmeldung eingeben
   muss. Typischerweise der erste Buchstabe des Vornamens, gefolgt vom
   Nachnamen.

-  ``Full name`` - Der volle Name des Benutzers.

-  ``Uid`` - User ID. Normalerweise wird dieses Feld leer gelassen, so
   dass das System einen Wert vergibt.

-  ``Login group`` - Die Benutzergruppe. Normalerweise bleibt dieses
   Feld leer, um die Standardgruppe zu akzeptieren.

-  ``Invite user into           other groups?`` - Zus?tzliche Gruppen zu
   denen der Benutzer als Mitglied hinzugef?gt werden soll.

-  ``Login class`` - In der Regel bleibt dieses Feld leer.

-  ``Shell`` - Die interaktive Shell f?r diesen Benutzer. In diesem
   Beispiel wurde
   `csh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=csh&sektion=1>`__
   ausgew?lt.

-  ``Home directory`` - Das Heimatverzeichnis des Benutzers. Die Vorgabe
   ist f?r gew?hnlich richtig.

-  ``Home directory permissions`` - Zugriffsrechte auf das
   Heimatverzeichnis des Benutzers. Die Vorgabe ist normalerweise die
   passende.

-  ``Use password-based authentication?`` Normalerweise "yes".

-  ``Use an empty password?`` - Normalerweise "no".

-  ``Use a random password?`` - Normalerweise "no".

-  ``Enter password`` - Das Passwort f?r diesem Benutzer. Eingegebene
   Zeichen werden nicht am Bildschirm angezeigt.

-  ``Enter password again`` - Das Passwort muss zur ?berpr?fung erneut
   eingegeben werden.

-  ``Lock out the account after creation?`` - Normalerweise "no".

.. raw:: html

   </div>

Nachdem alles eingegeben wurde, wird eine Zusammenfassung angezeigt und
das System fragt Sie, dies so korrekt ist. Falls ein Eingabefehler
gemacht wurde, geben Sie ``no`` ein und versuchen es erneut. Falls alles
in Ordnung ist, dr?cken Sie ``yes``, um den neuen Benutzer anzulegen.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 3.42. Verlassen der Benutzer- und Gruppenverwaltung

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Verlassen der Benutzer- und Gruppenverwaltung|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Falls es mehr Benutzer hinzuzuf?gen gibt, beantworten Sie die Frage "Add
another user?" mit ``yes``. Geben Sie ``no`` ein, wird das hinzuf?gen
von Benutzern beendet und die Installation fortgesetzt.

F?r weitere Informationen zum hinzuf?gen von Benutzern und deren
Verwaltung, lesen Sie `Kapitel?14, *Benutzer und grundlegende
Account-Verwaltung* <users.html>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.9.7. Letzte Konfigurationsschritte
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Nachdem alles installiert und konfiguriert wurde, bekommen Sie noch eine
letzte Chance, um Einstellungen zu ver?ndern.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 3.43. Letzte Schritte der Konfiguration

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Letzte Schritte der Konfiguration|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Verwenden Sie dieses Men?, um noch letzte ?nderungen oder zus?tzliche
Konfigurationen vor dem Abschliessen der Installation zu t?tigen.

.. raw:: html

   <div class="itemizedlist">

.. raw:: html

   <div class="itemizedlist-title">

Letzte Konfigurationsoptionen

.. raw:: html

   </div>

-  ``Add User`` - Beschrieben in `Abschnitt?3.9.6, „Benutzer
   hinzuf?gen“ <bsdinstall-post.html#bsdinstall-addusers>`__.

-  ``Root Password`` - Beschrieben in `Abschnitt?3.9.1, „Setzen des
   ``root``-Passworts“ <bsdinstall-post.html#bsdinstall-post-root>`__.

-  ``Hostname`` - Beschrieben in `Abschnitt?3.5.2, „Den Rechnernamen
   festlegen“ <using-bsdinstall.html#bsdinstall-hostname>`__.

-  ``Network`` - Beschrieben in `Abschnitt?3.9.2, „Die
   Netzwerkschnittstelle
   konfigurieren“ <bsdinstall-post.html#bsdinstall-config-network-dev>`__.

-  ``Services`` - Beschrieben in `Abschnitt?3.9.4, „Zu aktivierende
   Dienste ausw?hlen“ <bsdinstall-post.html#bsdinstall-sysconf>`__.

-  ``Time Zone`` - Beschrieben in `Abschnitt?3.9.3, „Setzen der
   Zeitzone“ <bsdinstall-post.html#bsdinstall-timezone>`__.

-  ``Handbook`` - Herunterladen und installieren des FreeBSD Handbuchs
   (welches Sie gerade lesen).

.. raw:: html

   </div>

Nachdem die lezten Konfigurationsschritte beendet sind, w?hlen Sie Exit,
um die Installation zu verlassen.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 3.44. Manuelle Konfiguration

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Manuelle Konfiguration|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

bsdinstall wird nach zus?tzlichen Konfigurationen, die noch zu t?tigen
sind, fragen, bevor in das neue System gebootet wird. W?hlen Sie
[?Yes?], um in eine Shell innerhalb des neuen Systems zu wechseln oder
[?No?], um mit dem letzten Schritt der Installation zu beginnen.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 3.45. Die Installation vervollst?ndigen

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Die Installation vervollst?ndigen|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn weitere Konfigurationen oder besondere Einstellungen ben?tigt
werden, kann durch ausw?hlen von [?Live?CD?] das Installationsmedium im
Live CD Modus gestartet werden.

Wenn die Installation vollst?ndig ist, w?hlen Sie [?Reboot?], um den
Computer neu zu starten und das neu installierte FreeBSD-System zu
booten. Vergessen Sie nicht, die FreeBSD Installations-CD, -DVD oder den
USB-Stick zu entfernen, oder der Computer wird erneut davon starten.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.9.8. FreeBSD starten und herunterfahren
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.9.8.1. FreeBSD/i386 starten
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn FreeBSD startet, werden viele Informationsmeldungen ausgegeben. Die
meisten davon werden aus dem Bildschirm verschwinden, das ist normal.
Nachdem das System den Startvorgang abgeschlossen hat, wird eine
Anmeldeaufforderungen angezeigt. Um Nachrichten, die aus dem Bildschirm
gelaufen sind, zu sehen, aktivieren Sie durch dr?cken von
**Scroll-Lock** den *scroll-back buffer*. Die Tasten **PgUp**, **PgDn**
und die Pfeiltasten dienen zur Navigation durch die Nachrichten. Durch
erneutes dr?cken von **Scroll-Lock** wird der Bildschirm wieder
entsperrt und kehrt zur normalen Anzeige zur?ck.

Am ``login:``-Bildschirm geben Sie den Benutzernamen ein, den Sie
w?hrend der Installation angelegt haben, in diesem Fall ist das
``asample``. Vermeiden Sie die Anmeldung als ``root``, ausser wenn es
wirklich notwendig ist.

Der oben beschriebene scroll-back buffer ist in der Gr?sse beschr?nkt,
somit werden vielleicht nicht alle Nachrichten sichtbar sein. Nach dem
Anmelden k?nnen die meisten davon aus der Kommandozeile aus durch
eingabe von ``dmesg | less`` betrachtet werden. Durch dr?cken von **q**
kehren Sie wieder zur Kommandozeile zur?ck.

Typische Startmeldungen (Versionsinformationen wurden hier weggelassen):

.. code:: screen

    Copyright (c) 1992-2011 The FreeBSD Project.
    Copyright (c) 1979, 1980, 1983, 1986, 1988, 1989, 1991, 1992, 1993, 1994
            The Regents of the University of California. All rights reserved.
    FreeBSD is a registered trademark of The FreeBSD Foundation.

        root@farrell.cse.buffalo.edu:/usr/obj/usr/src/sys/GENERIC amd64
    CPU: Intel(R) Core(TM)2 Duo CPU     E8400  @ 3.00GHz (3007.77-MHz K8-class CPU)
      Origin = "GenuineIntel"  Id = 0x10676  Family = 6  Model = 17  Stepping = 6
      Features=0x783fbff<FPU,VME,DE,PSE,TSC,MSR,PAE,MCE,CX8,APIC,SEP,MTRR,PGE,MCA,CMOV,PAT,PSE36,MMX,FXSR,SSE,SSE2>
      Features2=0x209<SSE3,MON,SSSE3>
      AMD Features=0x20100800<SYSCALL,NX,LM>
      AMD Features2=0x1<LAHF>
    real memory  = 536805376 (511 MB)
    avail memory = 491819008 (469 MB)
    Event timer "LAPIC" quality 400
    ACPI APIC Table: <VBOX   VBOXAPIC>
    ioapic0: Changing APIC ID to 1
    ioapic0 <Version 1.1> irqs 0-23 on motherboard
    kbd1 at kbdmux0
    acpi0: <VBOX VBOXXSDT> on motherboard
    acpi0: Power Button (fixed)
    acpi0: Sleep Button (fixed)
    Timecounter "ACPI-fast" frequency 3579545 Hz quality 900
    acpi_timer0: <32-bit timer at 3.579545MHz> port 0x4008-0x400b on acpi0
    cpu0: <ACPI CPU> on acpi0
    pcib0: <ACPI Host-PCI bridge> port 0xcf8-0xcff on acpi0
    pci0: <ACPI PCI bus> on pcib0
    isab0: <PCI-ISA bridge> at device 1.0 on pci0
    isa0: <ISA bus> on isab0
    atapci0: <Intel PIIX4 UDMA33 controller> port 0x1f0-0x1f7,0x3f6,0x170-0x177,0x376,0xd000-0xd00f at device 1.1 on pci0
    ata0: <ATA channel 0> on atapci0
    ata1: <ATA channel 1> on atapci0
    vgapci0: <VGA-compatible display> mem 0xe0000000-0xe0ffffff irq 18 at device 2.0 on pci0
    em0: <Intel(R) PRO/1000 Legacy Network Connection 1.0.3> port 0xd010-0xd017 mem 0xf0000000-0xf001ffff irq 19 at device 3.0 on pci0
    em0: Ethernet address: 08:00:27:9f:e0:92
    pci0: <base peripheral> at device 4.0 (no driver attached)
    pcm0: <Intel ICH (82801AA)> port 0xd100-0xd1ff,0xd200-0xd23f irq 21 at device 5.0 on pci0
    pcm0: <SigmaTel STAC9700/83/84 AC97 Codec>
    ohci0: <OHCI (generic) USB controller> mem 0xf0804000-0xf0804fff irq 22 at device 6.0 on pci0
    usbus0: <OHCI (generic) USB controller> on ohci0
    pci0: <bridge> at device 7.0 (no driver attached)
    acpi_acad0: <AC Adapter> on acpi0
    atkbdc0: <Keyboard controller (i8042)> port 0x60,0x64 irq 1 on acpi0
    atkbd0: <AT Keyboard> irq 1 on atkbdc0
    kbd0 at atkbd0
    atkbd0: [GIANT-LOCKED]
    psm0: <PS/2 Mouse> irq 12 on atkbdc0
    psm0: [GIANT-LOCKED]
    psm0: model IntelliMouse Explorer, device ID 4
    attimer0: <AT timer> port 0x40-0x43,0x50-0x53 on acpi0
    Timecounter "i8254" frequency 1193182 Hz quality 0
    Event timer "i8254" frequency 1193182 Hz quality 100
    sc0: <System console> at flags 0x100 on isa0
    sc0: VGA <16 virtual consoles, flags=0x300>
    vga0: <Generic ISA VGA> at port 0x3c0-0x3df iomem 0xa0000-0xbffff on isa0
    atrtc0: <AT realtime clock> at port 0x70 irq 8 on isa0
    Event timer "RTC" frequency 32768 Hz quality 0
    ppc0: cannot reserve I/O port range
    Timecounters tick every 10.000 msec
    pcm0: measured ac97 link rate at 485193 Hz
    em0: link state changed to UP
    usbus0: 12Mbps Full Speed USB v1.0
    ugen0.1: <Apple> at usbus0
    uhub0: <Apple OHCI root HUB, class 9/0, rev 1.00/1.00, addr 1> on usbus0
    cd0 at ata1 bus 0 scbus1 target 0 lun 0
    cd0: <VBOX CD-ROM 1.0> Removable CD-ROM SCSI-0 device
    cd0: 33.300MB/s transfers (UDMA2, ATAPI 12bytes, PIO 65534bytes)
    cd0: Attempt to query device size failed: NOT READY, Medium not present
    ada0 at ata0 bus 0 scbus0 target 0 lun 0
    ada0: <VBOX HARDDISK 1.0> ATA-6 device
    ada0: 33.300MB/s transfers (UDMA2, PIO 65536bytes)
    ada0: 12546MB (25694208 512 byte sectors: 16H 63S/T 16383C)
    ada0: Previously was known as ad0
    Timecounter "TSC" frequency 3007772192 Hz quality 800
    Root mount waiting for: usbus0
    uhub0: 8 ports with 8 removable, self powered
    Trying to mount root from ufs:/dev/ada0p2 [rw]...
    Setting hostuuid: 1848d7bf-e6a4-4ed4-b782-bd3f1685d551.
    Setting hostid: 0xa03479b2.
    Entropy harvesting: interrupts ethernet point_to_point kickstart.
    Starting file system checks:
    /dev/ada0p2: FILE SYSTEM CLEAN; SKIPPING CHECKS
    /dev/ada0p2: clean, 2620402 free (714 frags, 327461 blocks, 0.0% fragmentation)
    Mounting local file systems:.
    vboxguest0 port 0xd020-0xd03f mem 0xf0400000-0xf07fffff,0xf0800000-0xf0803fff irq 20 at device 4.0 on pci0
    vboxguest: loaded successfully
    Setting hostname: machine3.example.com.
    Starting Network: lo0 em0.
    lo0: flags=8049<UP,LOOPBACK,RUNNING,MULTICAST> metric 0 mtu 16384
            options=3<RXCSUM,TXCSUM>
            inet6 ::1 prefixlen 128
            inet6 fe80::1%lo0 prefixlen 64 scopeid 0x3
            inet 127.0.0.1 netmask 0xff000000
            nd6 options=21<PERFORMNUD,AUTO_LINKLOCAL>
    em0: flags=8843<UP,BROADCAST,RUNNING,SIMPLEX,MULTICAST> metric 0 mtu 1500
            options=9b<RXCSUM,TXCSUM,VLAN_MTU,VLAN_HWTAGGING,VLAN_HWCSUM>
            ether 08:00:27:9f:e0:92
            nd6 options=29<PERFORMNUD,IFDISABLED,AUTO_LINKLOCAL>
            media: Ethernet autoselect (1000baseT <full-duplex>)
            status: active
    Starting devd.
    Starting Network: usbus0.
    DHCPREQUEST on em0 to 255.255.255.255 port 67
    DHCPACK from 10.0.2.2
    bound to 192.168.1.142 -- renewal in 43200 seconds.
    add net ::ffff:0.0.0.0: gateway ::1
    add net ::0.0.0.0: gateway ::1
    add net fe80::: gateway ::1
    add net ff02::: gateway ::1
    ELF ldconfig path: /lib /usr/lib /usr/lib/compat /usr/local/lib
    32-bit compatibility ldconfig path: /usr/lib32
    Creating and/or trimming log files.
    Starting syslogd.
    No core dumps found.
    Clearing /tmp (X related).
    Updating motd:.
    Configuring syscons: blanktime.
    Generating public/private rsa1 key pair.
    Your identification has been saved in /etc/ssh/ssh_host_key.
    Your public key has been saved in /etc/ssh/ssh_host_key.pub.
    The key fingerprint is:
    10:a0:f5:af:93:ae:a3:1a:b2:bb:3c:35:d9:5a:b3:f3 root@machine3.example.com
    The key's randomart image is:
    +--[RSA1 1024]----+
    |    o..          |
    |   o . .         |
    |  .   o          |
    |       o         |
    |    o   S        |
    |   + + o         |
    |o . + *          |
    |o+ ..+ .         |
    |==o..o+E         |
    +-----------------+
    Generating public/private dsa key pair.
    Your identification has been saved in /etc/ssh/ssh_host_dsa_key.
    Your public key has been saved in /etc/ssh/ssh_host_dsa_key.pub.
    The key fingerprint is:
    7e:1c:ce:dc:8a:3a:18:13:5b:34:b5:cf:d9:d1:47:b2 root@machine3.example.com
    The key's randomart image is:
    +--[ DSA 1024]----+
    |       ..     . .|
    |      o  .   . + |
    |     . ..   . E .|
    |    . .  o o . . |
    |     +  S = .    |
    |    +  . = o     |
    |     +  . * .    |
    |    . .  o .     |
    |      .o. .      |
    +-----------------+
    Starting sshd.
    Starting cron.
    Starting background file system checks in 60 seconds.

    Thu Oct  6 19:15:31 MDT 2011

    FreeBSD/amd64 (machine3.example.com) (ttyv0)

    login:

Das Generieren der RSA- und DSA-Schl?ssel kann auf langsameren Rechnern
einige Zeit ben?tigen. Dies geschieht nur w?hrend der Startphase einer
neuen Installation und auch nur, wenn sshd zum automatischen Start
gesetzt ist. Die nachfolgenden Startvorg?nge werden schneller sein.

FreeBSD installiert standardm?ssig keine graphische Umgebung, jedoch
stehen viele zur Verf?gung. Lesen Sie `Kapitel?6, *Das
X-Window-System* <x11.html>`__ f?r weitere Informationen.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.9.9. FreeBSD herunterfahren
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das korrekte herunterfahren eines FreeBSD-Computers hilft, beugt dem
Datenverlust vor und sch?tzt sogar die Hardware vor Sch?den. Schalten
Sie nicht einfach den Strom ab. Wenn der Benutzer ein Mitglied der
``wheel``-Gruppe ist, k?nnen Sie zum Superuser durch die Eingabe von
``su`` und der anschliessenden Eingabe des Passworts von ``root``
werden. Andernfalls melden Sie sich mit ``root`` an und verwenden den
Befehl ``shutdown -p now``. Das System wird jetzt sauber
heruntergefahren und den Rechner ausschalten.

Die **Ctrl**+**Alt**+**Del** Kombination kann verwendet werden, um das
System neu zu starten, jedoch wird dies nicht w?hrend des normalen
Betriebs empfohlen.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------------+-----------------------------------+---------------------------------------------------+
| `Zur?ck <bsdinstall-final-warning.html>`__?   | `Nach oben <bsdinstall.html>`__   | ?\ `Weiter <bsdinstall-install-trouble.html>`__   |
+-----------------------------------------------+-----------------------------------+---------------------------------------------------+
| 3.8. Die Installation festschreiben?          | `Zum Anfang <index.html>`__       | ?3.10. Fehlerbehebung                             |
+-----------------------------------------------+-----------------------------------+---------------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.

.. |Das root-Passwort setzen| image:: bsdinstall/bsdinstall-post-root-passwd.png
.. |Eine zu konfigurierende Netzwerkschnittstelle ausw?hlen| image:: bsdinstall/bsdinstall-configure-network-interface.png
.. |Nach drahtlosen Access Points scannen| image:: bsdinstall/bsdinstall-configure-wireless-scan.png
.. |Ein drahtloses Netzwerk ausw?hlen| image:: bsdinstall/bsdinstall-configure-wireless-accesspoints.png
.. |Verbindungsaufbau mit WPA2| image:: bsdinstall/bsdinstall-configure-wireless-wpa2setup.png
.. |Auswahl von IPv4| image:: bsdinstall/bsdinstall-configure-network-interface-ipv4.png
.. |Ausw?hlen der IPv4-Konfiguration ?ber DHCP| image:: bsdinstall/bsdinstall-configure-network-interface-ipv4-dhcp.png
.. |Statische IPv4-Konfiguration| image:: bsdinstall/bsdinstall-configure-network-interface-ipv4-static.png
.. |Auswahl von IPv6| image:: bsdinstall/bsdinstall-configure-network-interface-ipv6.png
.. |Auswahl der IPv6 SLAAC-Konfiguration| image:: bsdinstall/bsdinstall-configure-network-interface-slaac.png
.. |Statische IPv6-Konfiguration| image:: bsdinstall/bsdinstall-configure-network-interface-ipv6-static.png
.. |DNS-Konfiguration| image:: bsdinstall/bsdinstall-configure-network-ipv4-dns.png
.. |Lokale oder UTC-Zeit| image:: bsdinstall/bsdinstall-set-clock-local-utc.png
.. |Das Gebiet ausw?hlen| image:: bsdinstall/bsdinstall-timezone-region.png
.. |Das Land ausw?hlen| image:: bsdinstall/bsdinstall-timezone-country.png
.. |W?hlen einer Zeitzone| image:: bsdinstall/bsdinstall-timezone-zone.png
.. |Best?tigen der Zeitzone| image:: bsdinstall/bsdinstall-timezone-confirm.png
.. |Auswahl zus?tzlicher Dienste| image:: bsdinstall/bsdinstall-config-services.png
.. |Aktivierung der Absturzaufzeichnung| image:: bsdinstall/bsdinstall-config-crashdump.png
.. |Benutzerkonten hinzuf?gen| image:: bsdinstall/bsdinstall-adduser1.png
.. |Benutzerinformationen eingeben| image:: bsdinstall/bsdinstall-adduser2.png
.. |Verlassen der Benutzer- und Gruppenverwaltung| image:: bsdinstall/bsdinstall-adduser3.png
.. |Letzte Schritte der Konfiguration| image:: bsdinstall/bsdinstall-finalconfiguration.png
.. |Manuelle Konfiguration| image:: bsdinstall/bsdinstall-final-modification-shell.png
.. |Die Installation vervollst?ndigen| image:: bsdinstall/bsdinstall-mainexit.png
