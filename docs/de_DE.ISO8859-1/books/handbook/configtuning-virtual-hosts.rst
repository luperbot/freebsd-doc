===================
12.9. Virtual Hosts
===================

.. raw:: html

   <div class="navheader">

12.9. Virtual Hosts
`Zur?ck <config-network-setup.html>`__?
Kapitel 12. Konfiguration und Tuning
?\ `Weiter <configtuning-syslog.html>`__

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

12.9. Virtual Hosts
-------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Ein gebr?uchlicher Zweck von FreeBSD ist das virtuelle Hosting, bei dem
ein Server im Netzwerk wie mehrere Server aussieht. Dies wird dadurch
erreicht, dass einem Netzwerkinterface mehrere Netzwerk-Adressen
zugewiesen werden.

Ein Netzwerkinterface hat eine „echte“ Adresse und kann beliebig viele
„alias“ Adressen haben. Die Aliase werden durch entsprechende alias
Eintr?ge in ``/etc/rc.conf`` festgelegt.

Ein alias Eintrag f?r das Interface ``fxp0`` sieht wie folgt aus:

.. code:: programlisting

    ifconfig_fxp0_alias0="inet xxx.xxx.xxx.xxx netmask xxx.xxx.xxx.xxx"

Beachten Sie, dass die Alias-Eintr?ge mit ``alias0`` anfangen m?ssen und
weiter hochgez?hlt werden, das hei?t ``_alias1``, ``_alias2``, und so
weiter. Die Konfiguration der Aliase h?rt bei der ersten fehlenden Zahl
auf.

Die Berechnung der Alias-Netzwerkmasken ist wichtig, doch zum Gl?ck
einfach. F?r jedes Interface muss es eine Adresse geben, die die
Netzwerkmaske des Netzwerkes richtig beschreibt. Alle anderen Adressen
in diesem Netzwerk haben dann eine Netzwerkmaske, die mit ``1`` gef?llt
ist (also ``255.255.255.255`` oder hexadezimal ``0xffffffff``).

Als Beispiel betrachten wir den Fall, in dem ``fxp0`` mit zwei
Netzwerken verbunden ist: dem Netzwerk ``10.1.1.0`` mit der
Netzwerkmaske ``255.255.255.0`` und dem Netzwerk ``202.0.75.16`` mit der
Netzwerkmaske ``255.255.255.240``. Das System soll die Adressen
``10.1.1.1`` bis ``10.1.1.5`` und ``202.0.75.17`` bis ``202.0.75.20``
belegen. Wie eben beschrieben, hat nur die erste Adresse in einem
Netzwerk (hier ``10.0.1.1`` und ``202.0.75.17``) die richtige
Netzwerkmaske. Alle anderen Adressen (``10.1.1.2`` bis ``10.1.1.5`` und
``202.0.75.18`` bis ``202.0.75.20``) erhalten die Maske
``255.255.255.255``.

Die folgenden Eintr?ge in ``/etc/rc.conf`` konfigurieren den Adapter
entsprechend dem Beispiel:

.. code:: programlisting

    ifconfig_fxp0="inet 10.1.1.1 netmask 255.255.255.0"
    ifconfig_fxp0_alias0="inet 10.1.1.2 netmask 255.255.255.255"
    ifconfig_fxp0_alias1="inet 10.1.1.3 netmask 255.255.255.255"
    ifconfig_fxp0_alias2="inet 10.1.1.4 netmask 255.255.255.255"
    ifconfig_fxp0_alias3="inet 10.1.1.5 netmask 255.255.255.255"
    ifconfig_fxp0_alias4="inet 202.0.75.17 netmask 255.255.255.240"
    ifconfig_fxp0_alias5="inet 202.0.75.18 netmask 255.255.255.255"
    ifconfig_fxp0_alias6="inet 202.0.75.19 netmask 255.255.255.255"
    ifconfig_fxp0_alias7="inet 202.0.75.20 netmask 255.255.255.255"

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------------+--------------------------------------+---------------------------------------------+
| `Zur?ck <config-network-setup.html>`__?   | `Nach oben <config-tuning.html>`__   | ?\ `Weiter <configtuning-syslog.html>`__    |
+-------------------------------------------+--------------------------------------+---------------------------------------------+
| 12.8. Einrichten von Netzwerkkarten?      | `Zum Anfang <index.html>`__          | ?12.10. Konfiguration des syslogd Servers   |
+-------------------------------------------+--------------------------------------+---------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
