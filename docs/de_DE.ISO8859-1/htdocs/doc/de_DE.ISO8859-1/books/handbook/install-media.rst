======================================
2.8. Das Installationsmedium ausw?hlen
======================================

.. raw:: html

   <div class="navheader">

2.8. Das Installationsmedium ausw?hlen
`Zur?ck <install-choosing.html>`__?
Kapitel 2. FreeBSD?8.\ *``X``* (und ?lter) installieren
?\ `Weiter <install-final-warning.html>`__

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

2.8. Das Installationsmedium ausw?hlen
--------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn Sie von einer CD-ROM oder einer DVD installieren, w?hlen Sie bitte
Install from a FreeBSD CD/DVD aus. Stellen Sie sicher, dass [?OK?] aktiv
ist und dr?cken Sie dann die Taste **Enter**, um mit der Installation
fortzufahren.

Wenn Sie ein anderes Installationsmedium benutzen, w?hlen Sie die
passende Option aus und folgen den angezeigten Anweisungen.

Die Hilfeseiten ?ber Installationsmedien erreichen Sie mit der Taste
**F1**. Dr?cken Sie **Enter**, um zur Auswahl des Installationsmediums
zur?ckzukehren.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Abbildung 2.27. Das Installationsmedium ausw?hlen

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Das Installationsmedium ausw?hlen|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

FTP-Installationsmodi:
~~~~~~~~~~~~~~~~~~~~~~

Sie k?nnen zwischen drei FTP-Installationsmodi w?hlen: Active-FTP,
Passive-FTP oder ?ber einen HTTP-Proxy.

.. raw:: html

   <div class="variablelist" xmlns="http://www.w3.org/1999/xhtml">

FTP Active: Install from an FTP server
    Diese Option f?hrt alle FTP-Operationen im Active-Mode aus. Dieser
    Modus funktioniert nicht durch Firewalls, er funktioniert aber mit
    alten FTP-Servern, die den Passive-Mode nicht beherrschen. Wenn die
    Verbindung im Passive-Mode (das ist die Vorgabe) h?ngt, versuchen
    Sie den Active-Mode.

FTP Passive: Install from an FTP server through a firewall
    Mit dieser Option benutzt sysinstall Passive-Mode f?r alle
    FTP-Operationen. In diesem Modus funktionieren Verbindungen durch
    Firewalls, die einkommende Pakete auf beliebigen TCP-Ports
    blockieren.

FTP via a HTTP proxy: Install from an FTP server through a http proxy
    Diese Option weist sysinstall an, alle FTP-Operationen mit HTTP ?ber
    einen Proxy (wie ein Web-Browser) durchzuf?hren. Der Proxy leitet
    die Anfragen an den richtigen FTP-Server weiter. Mit dieser Option
    passieren Sie eine Firewall, die FTP-Verbindungen verbietet, aber
    einen HTTP-Proxy anbietet. Neben dem FTP-Server m?ssen Sie in diesem
    Fall den Proxy-Server angeben.

.. raw:: html

   </div>

Bei einem FTP-Proxy-Server m?ssen Sie normalerweise den Ziel-FTP-Server
als Teil des Benutzernamens hinter dem Klammeraffen („@“) angeben. Der
Proxy-Server ?bernimmt die Kommunikation mit dem Ziel-FTP-Server. Nehmen
wir an, Sie wollen von ``ftp.FreeBSD.org`` ?ber den FTP-Proxy
``foo.example.com`` auf Port ``1234`` installieren.

W?hlen Sie das Men? Options aus und setzen Sie dort den
FTP-Benutzernamen (*username*) auf ``ftp@ftp.FreeBSD.org``. Als Passwort
geben Sie bitte Ihre E-Mail-Adresse an. Setzen Sie das
Installationsmedium auf Active-FTP oder Passive-FTP, je nachdem welchen
Modus der Proxy-Server unterst?tzt. F?r die URL geben Sie
``ftp://foo.example.com:1234/pub/FreeBSD`` an.

Der Proxy-Server ``foo.example.com`` leitet Zugriffe auf das Verzeichnis
``/pub/FreeBSD`` an den Server ``ftp.FreeBSD.org`` weiter. Daher k?nnen
``foo.example.com`` als FTP-Server angeben.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------------+--------------------------------+----------------------------------------------+
| `Zur?ck <install-choosing.html>`__?       | `Nach oben <install.html>`__   | ?\ `Weiter <install-final-warning.html>`__   |
+-------------------------------------------+--------------------------------+----------------------------------------------+
| 2.7. Den Installationsumfang bestimmen?   | `Zum Anfang <index.html>`__    | ?2.9. Die Installation festschreiben         |
+-------------------------------------------+--------------------------------+----------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.

.. |Das Installationsmedium ausw?hlen| image:: install/media.png
