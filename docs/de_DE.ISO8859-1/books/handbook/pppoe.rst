===============================
29.5. PPP over Ethernet (PPPoE)
===============================

.. raw:: html

   <div class="navheader">

29.5. PPP over Ethernet (PPPoE)
`Zur?ck <ppp-troubleshoot.html>`__?
Kapitel 29. PPP und SLIP
?\ `Weiter <pppoa.html>`__

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

29.5. PPP over Ethernet (PPPoE)
-------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Beigetragen (durch
http://node.to/freebsd/how-tos/how-to-freebsd-pppoe.html) von Jim Mock.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dieser Abschnitt beschreibt, wie Sie PPP over Ethernet (PPPoE)
einrichten.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

29.5.1. Konfiguration des Kernels
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Eine besondere Kernelkonfiguration ist f?r PPPoE nicht mehr
erforderlich. Sofern die notwendige NetGraph-Unterst?tzung nicht in den
Kernel eingebaut wurde, wird diese von ppp dynamisch geladen.

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

29.5.2. Einrichtung von ``ppp.conf``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dies hier ist ein Beispiel einer funktionierenden ``ppp.conf``:

.. code:: programlisting

    default:
      set log Phase tun command # you can add more detailed logging if you wish
      set ifaddr 10.0.0.1/0 10.0.0.2/0

    name_of_service_provider:
      set device PPPoE:xl1 # replace xl1 with your Ethernet device
      set authname YOURLOGINNAME
      set authkey YOURPASSWORD
      set dial
      set login
      add default HISADDR

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

29.5.3. ppp ausf?hren
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Als ``root``, geben Sie ein:

.. code:: screen

    # ppp -ddial name_of_service_provider

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

29.5.4. ppp beim Systemstart ausf?hren
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

F?gen Sie Folgendes in Ihre Datei ``/etc/rc.conf`` ein:

.. code:: programlisting

    ppp_enable="YES"
    ppp_mode="ddial"
    ppp_nat="YES"   # if you want to enable nat for your local network, otherwise NO
    ppp_profile="name_of_service_provider"

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

29.5.5. Verwendung einer PPPoE-Dienstbezeichnung (service tag)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Manchmal kann es notwendig sein, eine Dienstbezeichnung (*service tag*)
zu verwenden, um eine Verbindung aufzubauen. Dienstbezeichnungen werden
eingesetzt, um zwischen verschiedenen PPPoE-Servern unterscheiden zu
k?nnen, die einem bestehenden Netzwerk zugeteilt sind.

Die erforderlichen Dienstbezeichnungen sollten in der Dokumentation, zu
finden sein, die Ihnen Ihr ISP zur Verf?gung gestellt hat. Wenn Sie
diese Informationen dort nicht finden, fragen Sie beim technischen
Kundendienst Ihres ISP danach.

Als letzte M?glichkeit, bleibt die Methode, die von dem Programm
`Roaring Penguin PPPoE <http://www.roaringpenguin.com/pppoe/>`__
vorgeschlagen wird, das in der `Ports-Sammlung <ports.html>`__ zu finden
ist. Bedenken Sie aber, dass dadurch Daten Ihres Modems gel?scht werden
k?nnen, so dass es nicht mehr benutzt werden kann. ?berlegen Sie also
genau, ob Sie dies machen wollen. Installieren Sie einfach das Programm,
das Ihnen Ihr Provider zusammen mit dem Modem geliefert hat. Gehen Sie
dann in das Men? System dieses Programms. Der Name Ihres Profils, sollte
in der Liste aufgef?hrt sein. Normalerweise ist dies *ISP*.

Der Name des Profils (*service tag*) wird im Eintrag f?r die
PPPoE-Konfiguration in der Datei ``ppp.conf`` verwendet, als der Teil
des Befehls ``set device`` (die manpage
`ppp(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ppp&sektion=8>`__
enth?lt Einzelheiten hierzu), der den Provider angibt. Dieser Eintrag
sollte folgenderma?en aussehen:

.. code:: programlisting

    set device PPPoE:xl1:ISP

Vergessen Sie nicht, statt *``xl1``* das richtige Device Ihrer
Netzwerkkarte anzugeben.

Denken sie auch daran, *``ISP``* durch das Profil, das Sie oben gefunden
haben zu ersetzen.

Weitere Informationen bieten:

.. raw:: html

   <div class="itemizedlist">

-  `Cheaper Broadband with FreeBSD on
   DSL <http://renaud.waldura.com/doc/freebsd/pppoe/>`__ von Renaud
   Waldura.

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

29.5.6. PPPoE mit einem 3Com? HomeConnect? ADSL Modem Dual Link
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dieses Modem folgt nicht dem `RFC
2516 <http://www.faqs.org/rfcs/rfc2516.html>`__ (*A Method for
transmitting PPP over Ethernet (PPPoE)*, verfasst von L. Mamakos, K.
Lidl, J. Evarts, D. Carrel, D. Simone, und R. Wheeler). Stattdessen
wurden andere Pakettyp-Codes f?r die Ethernet Frames verwendet. Bitte
beschweren Sie sich unter `3Com <http://www.3com.com/>`__, wenn Sie der
Ansicht sind, dass dieses Modem die PPPoE-Spezifikation einhalten
sollte.

Um FreeBSD in die Lage zu versetzen, mit diesem Ger?t zu kommunizieren,
muss ein sysctl Befehl angegeben werden. Dies kann beim Systemstart
automatisch geschehen, indem die Datei ``/etc/sysctl.conf`` angepasst
wird:

.. code:: programlisting

    net.graph.nonstandard_pppoe=1

oder, wenn der Befehl unmittelbar wirksam werden soll, durch:

.. code:: screen

    # sysctl net.graph.nonstandard_pppoe=1

Da hiermit eine systemweit g?ltige Einstellung vorgenommen wird, ist es
nicht m?glich, gleichzeitig mit einem normalen PPPoE-Client oder Server
und einem 3Com? HomeConnect? ADSL Modem zu kommunizieren.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------+-------------------------------------+-------------------------------+
| `Zur?ck <ppp-troubleshoot.html>`__?    | `Nach oben <ppp-and-slip.html>`__   | ?\ `Weiter <pppoa.html>`__    |
+----------------------------------------+-------------------------------------+-------------------------------+
| 29.4. Probleme bei PPP-Verbindungen?   | `Zum Anfang <index.html>`__         | ?29.6. PPP over ATM (PPPoA)   |
+----------------------------------------+-------------------------------------+-------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
