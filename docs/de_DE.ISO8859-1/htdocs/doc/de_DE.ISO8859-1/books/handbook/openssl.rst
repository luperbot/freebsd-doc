=============
15.8. OpenSSL
=============

.. raw:: html

   <div class="navheader">

15.8. OpenSSL
`Zur?ck <kerberos5.html>`__?
Kapitel 15. Sicherheit
?\ `Weiter <ipsec.html>`__

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

15.8. OpenSSL
-------------

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

Es wird oft ?bersehen, dass OpenSSL Teil des FreeBSD-Basissystems ist.
OpenSSL bietet eine verschl?sselte Transportschicht oberhalb der
normalen Kommunikationsschicht und kann daher zusammen mit vielen
Netzdiensten benutzt werden.

Anwendungsbeispiele f?r OpenSSL sind die verschl?sselte
Authentifizierung von E-Mail-Clients oder Web-Transaktionen wie das
Bezahlen mit einer Kreditkarte. OpenSSL kann w?hrend des Baus in viele
Ports, wie
`www/apache22 <http://www.freebsd.org/cgi/url.cgi?ports/www/apache22/pkg-descr>`__
und
`mail/claws-mail <http://www.freebsd.org/cgi/url.cgi?ports/mail/claws-mail/pkg-descr>`__,
integriert werden.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Ist beim Aufruf von ``make`` die Variable ``WITH_OPENSSL_BASE`` nicht
explizit auf ``yes`` gesetzt, baut die Ports-Sammlung meist den Port
`security/openssl <http://www.freebsd.org/cgi/url.cgi?ports/security/openssl/pkg-descr>`__.

.. raw:: html

   </div>

Das OpenSSL von FreeBSD stellt die Protokolle Secure Sockets Layer v2/v3
(SSLv2/SSLv3) und Transport Layer Security v1 (TLSv1) zur Verf?gung. Die
OpenSSL-Bibliotheken stellen kryptographische Funktionen bereit.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Mit OpenSSL kann der IDEA-Algorithmus verwendet werden, wegen Patenten
in den USA ist der Algorithmus in der Voreinstellung allerdings
deaktiviert. Wenn Sie die IDEA-Lizenz akzeptieren, k?nnen Sie den
IDEA-Algorithmus aktivieren, indem Sie die Variable ``MAKE_IDEA`` in
``make.conf`` setzen.

.. raw:: html

   </div>

Meist wird OpenSSL eingesetzt, um Zertifikate f?r Anwendungen
bereitzustellen. Die Zertifikate stellen die Identit?t einer Firma oder
eines Einzelnen sicher. Wenn ein Zertifikat nicht von einer
Zertifizierungsstelle (*Certificate Authority*, CA) gegengezeichnet
wurde, erhalten Sie normalerweise eine Warnung. Eine
Zertifizierungsstelle ist eine Firma wie
`VeriSign <http://www.verisign.com/>`__, die Zertifikate von Personen
oder Firmen gegenzeichnet und damit die Korrektheit der Zertifikate
best?tigt. Diese Prozedur kostet Geld, ist aber keine Voraussetzung f?r
den Einsatz von Zertifikaten, beruhigt aber sicherheitsbewusste
Benutzer.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

15.8.1. Zertifikate erzeugen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Ein Zertifikat erzeugen Sie mit dem nachstehenden Kommando:

.. code:: screen

    # openssl req -new -nodes -out req.pem -keyout cert.pem
    Generating a 1024 bit RSA private key
    ................++++++
    .......................................++++++
    writing new private key to 'cert.pem'
    -----
    You are about to be asked to enter information that will be incorporated
    into your certificate request.
    What you are about to enter is what is called a Distinguished Name or a DN.
    There are quite a few fields but you can leave some blank
    For some fields there will be a default value,
    If you enter '.', the field will be left blank.
    -----
    Country Name (2 letter code) [AU]:US
    State or Province Name (full name) [Some-State]:PA
    Locality Name (eg, city) []:Pittsburgh
    Organization Name (eg, company) [Internet Widgits Pty Ltd]:My Company
    Organizational Unit Name (eg, section) []:Systems Administrator
    Common Name (eg, YOUR name) []:localhost.example.org
    Email Address []:trhodes@FreeBSD.org

    Please enter the following 'extra' attributes
    to be sent with your certificate request
    A challenge password []:SOME PASSWORD
    An optional company name []:Another Name

Beachten Sie bitte, dass die Eingabe bei „Common Name“ ein g?ltiger
Domain-Name sein muss. Eine andere Eingabe erzeugt ein unbrauchbares
Zertifikat. Das Zertifikat kann mit einer G?ltigkeitsdauer und anderen
Verschl?sselungsalgorithmen erzeugt werden. Die Hilfeseite
`openssl(1) <http://www.FreeBSD.org/cgi/man.cgi?query=openssl&sektion=1>`__
beschreibt die zur Verf?gung stehenden Optionen.

Das Verzeichnis, in dem Sie den letzten Befehl ausgef?hrt haben, enth?lt
nun zwei Dateien: Die Anforderung f?r ein neues Zertifikat wurde in
``req.pem`` gespeichert. Diese Datei k?nnen Sie an eine
Zertifizierungsstelle senden, wo Ihre Angaben gepr?ft werden. Nach
erfolgreicher Pr?fung wird das Zertifikat an Sie zur?ckgesandt. Die
zweite Datei, ``cert.pem``, enth?lt den privaten Schl?ssel f?r Ihr
Zertifikat und darf auch keine Fall in fremde H?nde geraten, da ein
Angreifer sonst in der Lage ist, anderen Personen oder Rechnern
vorzugaukeln, dass es sich bei ihm um Sie handelt.

Wenn Sie keine Signatur einer Zertifizierungsstelle ben?tigen, k?nnen
Sie ein selbst-signiertes Zertifikat erstellen. Erzeugen Sie dazu zuerst
einen RSA-Schl?ssel:

.. code:: screen

    # openssl dsaparam -rand -genkey -out myRSA.key 1024

Erzeugen Sie dann den CA-Schl?ssel:

.. code:: screen

    # openssl gendsa -des3 -out myca.key myRSA.key

Erstellen Sie mit diesem Schl?ssel das Zertifikat:

.. code:: screen

    # openssl req -new -x509 -days 365 -key myca.key -out new.crt

Zwei neue Dateien befinden sich nun im Verzeichnis: Der Schl?ssel der
Zertifizierungsstelle ``myca.key`` und das Zertifikat selbst,
``new.crt``. Sie sollten in einem Verzeichnis, vorzugsweise unterhalb
von ``/etc`` abgelegt werden, das nur von ``root`` lesbar ist. Setzen
Sie die Zugriffsrechte der Dateien mit ``chmod`` auf ``0700``.

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

15.8.2. Beispiel f?r Zertifikate
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Was fangen Sie mit einem Zertifikat an? Sie k?nnten damit beispielsweise
die Verbindungen zu Sendmail verschl?sseln. Dies w?rde die
Klartext-Authentifizierung f?r Benutzer des lokalen MTA ?berfl?ssig
machen.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Das ist nicht unbedingt die beste L?sung, da einige MUAs Warnungen
ausgeben, wenn ein Zertifikat nicht lokal installiert ist. Die
Installation von Zertifikaten wird in der Dokumentation der MUAs
beschrieben.

.. raw:: html

   </div>

Erg?nzen Sie die Konfigurationsdatei von sendmail (``.mc``) um die
nachstehenden Zeilen:

.. code:: programlisting

    dnl SSL Options
    define(`confCACERT_PATH',`/etc/certs')dnl
    define(`confCACERT',`/etc/certs/new.crt')dnl
    define(`confSERVER_CERT',`/etc/certs/new.crt')dnl
    define(`confSERVER_KEY',`/etc/certs/myca.key')dnl
    define(`confTLS_SRV_OPTIONS', `V')dnl

Im Verzeichnis ``/etc/certs`` befindet sich der Schl?ssel und das
Zertifikat. Bauen Sie danach im Verzeichnis ``/etc/mail`` mit dem
Kommando ``make     install`` die ``.cf``-Datei und starten Sie
anschlie?end sendmail mit ``make     restart`` neu.

Wenn alles gut ging, erscheinen keine Fehlermeldungen in der Datei
``/var/log/maillog`` und Sie sehen sendmail in der Prozessliste.

Testen Sie nun den Mailserver mit dem Kommando
`telnet(1) <http://www.FreeBSD.org/cgi/man.cgi?query=telnet&sektion=1>`__:

.. code:: screen

    # telnet example.com 25
    Trying 192.0.34.166...
    Connected to example.com.
    Escape character is '^]'.
    220 example.com ESMTP Sendmail 8.12.10/8.12.10; Tue, 31 Aug 2004 03:41:22 -0400 (EDT)
    ehlo example.com
    250-example.com Hello example.com [192.0.34.166], pleased to meet you
    250-ENHANCEDSTATUSCODES
    250-PIPELINING
    250-8BITMIME
    250-SIZE
    250-DSN
    250-ETRN
    250-AUTH LOGIN PLAIN
    250-STARTTLS
    250-DELIVERBY
    250 HELP
    quit
    221 2.0.0 example.com closing connection
    Connection closed by foreign host.

Wenn in einer Zeile ``STARTTLS`` erscheint, hat alles funktioniert.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------+---------------------------------+------------------------------+
| `Zur?ck <kerberos5.html>`__?   | `Nach oben <security.html>`__   | ?\ `Weiter <ipsec.html>`__   |
+--------------------------------+---------------------------------+------------------------------+
| 15.7. Kerberos5?               | `Zum Anfang <index.html>`__     | ?15.9. VPNs mit IPsec        |
+--------------------------------+---------------------------------+------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
