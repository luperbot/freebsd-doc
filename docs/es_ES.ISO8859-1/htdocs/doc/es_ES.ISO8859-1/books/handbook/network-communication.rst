===============================
Parte?IV.?Comunicaciones en red
===============================

.. raw:: html

   <div class="navheader">

Parte?IV.?Comunicaciones en red
`Anterior <small-lans.html>`__?
?
?\ `Siguiente <serialcomms.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="part">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="partintro">

.. raw:: html

   <div xmlns="">

.. raw:: html

   </div>

FreeBSD es uno de los sistemas operativos m?s utilizados como servidores
en red de alto rendimiento. Los siguientes cap?tulos cubren:

.. raw:: html

   <div class="itemizedlist">

-  Comunicaciones serie

-  PPP y PPP sobre Ethernet

-  Correo electr?nico

-  Servidores de red

-  Otros aspectos avanzados de red

.. raw:: html

   </div>

Estos cap?tulos est?n dise?ados para leerse seg?n van haciendo falta. No
tienen por qu? leerse en un determinado orden, ni tiene por qu? leerlos
todos antes de poder usar FreeBSD en un entorno de red.

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Tabla de contenidos

.. raw:: html

   </div>

`24. Comunicaciones serie <serialcomms.html>`__
`24.1. Sinopsis <serialcomms.html#serial-synopsis>`__
`24.2. Introducci?n <serial.html>`__
`24.3. Terminales <term.html>`__
`24.4. Servicio dial-in <dialup.html>`__
`24.5. Servicio dial-out <dialout.html>`__
`24.6. Configurando la consola serie <serialconsole-setup.html>`__
`25. PPP y SLIP <ppp-and-slip.html>`__
`25.1. Sinopsis <ppp-and-slip.html#idp80093520>`__
`25.2. Uso de User PPP <userppp.html>`__
`25.3. Uso de Kernel PPP <ppp.html>`__
`25.4. Uso de PPP sobre Ethernet (PPPoE) <pppoe.html>`__
`25.5. Uso de PPP sobre ATM (PPPoA) <pppoa.html>`__
`25.6. Uso de SLIP <slip.html>`__
`26. Cortafuegos <firewalls.html>`__
`26.1. \* <firewalls.html#firewalls-intro>`__
`27. Correo Electr?nico <mail.html>`__
`27.1. Sinopsis <mail.html#mail-synopsis>`__
`27.2. Utilizaci?n del correo electr?nico <mail-using.html>`__
`27.3. Configuraci?n de sendmail <sendmail.html>`__
`27.4. Sustituci?n del Agente de Transferencia de
Correo <mail-changingmta.html>`__
`27.5. Depuraci?n de Problemas <mail-trouble.html>`__
`27.6. Conceptos Avanzados <mail-advanced.html>`__
`27.7. SMTP con UUCP <SMTP-UUCP.html>`__
`27.8. Configuraci?n para s?lamente enviar
correo <outgoing-only.html>`__
`27.9. Utilizaci?n del correo con una conexi?n mediante m?dem anal?gico
(dial-up) <SMTP-dialup.html>`__
`27.10. Autentificaci?n utilizando SMTP <SMTP-Auth.html>`__
`27.11. Agente de Correo de Usuario <mail-agents.html>`__
`27.12. Manejo de fetchmail <mail-fetchmail.html>`__
`27.13. Uso de procmail <mail-procmail.html>`__
`28. Servidores de red <network-servers.html>`__
`28.1. \* <network-servers.html#network-servers-synopsis>`__
`29. Networking avanzado <advanced-networking.html>`__
`29.1.
Resumen <advanced-networking.html#advanced-networking-synopsis>`__
`29.2. Pasarelas y “routers” <network-routing.html>`__
`29.3. Redes sin cables (“wireless”) <network-wireless.html>`__
`29.4. Bluetooth <network-bluetooth.html>`__
`29.5. Puenteado <network-bridging.html>`__
`29.6. NFS <network-nfs.html>`__
`29.7. Ejecuci?n sin disco duro <network-diskless.html>`__
`29.8. RDSI <network-isdn.html>`__
`29.9. NIS/YP <network-nis.html>`__
`29.10. DHCP <network-dhcp.html>`__
`29.11. DNS <network-dns.html>`__
`29.12. NTP <network-ntp.html>`__
`29.13. Traducci?n de direcciones de red <network-natd.html>`__
`29.14. El “Superservidor” inetd <network-inetd.html>`__
`29.15. L?nea IP paralela (PLIP) <network-plip.html>`__
`29.16. IPv6 <network-ipv6.html>`__
`29.17. ATM en FreeBSD?5.X <network-atm.html>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------+---------------------------+---------------------------------------+
| `Anterior <small-lans.html>`__?   | ?                         | ?\ `Siguiente <serialcomms.html>`__   |
+-----------------------------------+---------------------------+---------------------------------------+
| 23.5. Redes peque?as?             | `Inicio <index.html>`__   | ?Cap?tulo 24. Comunicaciones serie    |
+-----------------------------------+---------------------------+---------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
