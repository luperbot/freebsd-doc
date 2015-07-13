================================
Cap?tulo 29. Networking avanzado
================================

.. raw:: html

   <div class="navheader">

Cap?tulo 29. Networking avanzado
`Anterior <network-servers.html>`__?
Parte?IV.?Comunicaciones en red
?\ `Siguiente <network-routing.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="chapter">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

Cap?tulo 29. Networking avanzado
--------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Tabla de contenidos

.. raw:: html

   </div>

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

Networking avanzado

.. raw:: html

   <div class="sect1">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

29.1. Resumen
-------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Este cap?tulo cubre algunos de los servicios de red que se usan con m?s
frecuencia en sistemas UNIX?. Para ser m?s concretos este cap?tulo
explica c?mo definir, ejecutar, probar y mantener todos los servicios de
red que utiliza FreeBSD. Se muestran adem?s ejemplos de ficheros de
configuraci?n que podr? utilizar para sus propios quehaceres.

Despu?s de leer este cap?tulo habremos aprendido:

.. raw:: html

   <div class="itemizedlist">

-  Los conceptos b?sicos de pasarelas y “routers”.

-  C?mo poner en funcionamiento dispositivos IEEE 802.11 y Bluetooth?.

-  C?mo configurar FreeBSD para que act?e como un “bridge”.

-  C?mo poner en funcionamiento un sistema de ficheros en red con NFS.

-  C?mo realizar un arranque del sistema por red en m?quinas sin disco
   duro.

-  C?mo ejecutar un servidor de informaci?n en red para compartir
   cuentas de usuario mediante NIS.

-  C?mo especificar par?metros de configuraci?n autom?tica de red
   utilizando DHCP.

-  C?mo ejecutar un servidor de nombres de dominio.

-  C?mo sincronizar la hora y la fecha y ejecutar un servidor horario
   utilizando el protocolo NTP.

-  C?mo ejecutar un servicio de traducci?n de direcciones de red.

-  C?mo gestionar el d?mon inetd.

-  C?mo conectar dos computadoras a trav?s de PLIP.

-  C?mo habilitar IPv6 en una m?quina FreeBSD.

-  C?mo configurar ATM sobre FreeBSD?5.X.

.. raw:: html

   </div>

Antes de leer este cap?tulo deber?a usted:

.. raw:: html

   <div class="itemizedlist">

-  Intentar comprender los conceptos b?sicos de los scripts de
   ``/etc/rc``.

-  Familiarizarse con la terminolog?a b?sica de redes.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------+------------------------------------------+-------------------------------------------+
| `Anterior <network-servers.html>`__?   | `Subir <network-communication.html>`__   | ?\ `Siguiente <network-routing.html>`__   |
+----------------------------------------+------------------------------------------+-------------------------------------------+
| Cap?tulo 28. Servidores de red?        | `Inicio <index.html>`__                  | ?29.2. Pasarelas y “routers”              |
+----------------------------------------+------------------------------------------+-------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
