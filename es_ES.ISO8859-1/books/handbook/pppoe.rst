=======================================
25.4. Uso de PPP sobre Ethernet (PPPoE)
=======================================

.. raw:: html

   <div class="navheader">

25.4. Uso de PPP sobre Ethernet (PPPoE)
`Anterior <ppp.html>`__?
Cap?tulo 25. PPP y SLIP
?\ `Siguiente <pppoa.html>`__

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

25.4. Uso de PPP sobre Ethernet (PPPoE)
---------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Contribuido (tomado de
http://node.to/freebsd/how-tos/how-to-freebsd-pppoe.html) por Jim Mock.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

En esta secci?n veremos como configurar PPP sobre una red Ethernet
(PPPoE).

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

25.4.1. Configurando el kernel
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Ya no es necesario realizar una configuraci?n especial para que nuestro
kernel cuente con soporte para PPPoE. Siempre y cuando el soporte de
redes necesario se encuentre en ?l, ppp se encargar? de cargarlo de una
manera din?mica.

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

25.4.2. Editando el fichero ``ppp.conf``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

He aqui un ejemplo de un fichero de configuraci?n ``ppp.conf``
completamente funcional:

.. code:: programlisting

    default:
      set log Phase tun command # puede a?adir m?s dispositivos si lo desea
      set ifaddr 10.0.0.1/0 10.0.0.2/0

    nombre_del_proveedor_del_servicio_de_internet:
      set device PPPoE:xl1 # sustituya xl1 con su dispositivo ethernet
      set authname SuNombreDeUsuario
      set authkey SuContrase?a
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

25.4.3. Ejecutando PPP
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Estando en modo ``superusuario`` (root) puede ejecutar:

.. code:: screen

    # ppp -ddial nombre_del_proveedor_de_inet

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

25.4.4. Ejecutando PPP al inicio de sesi?n
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A?ada las siguientes l?neas a su archivo ``/etc/rc.conf``:

.. code:: programlisting

    ppp_enable="YES"
    ppp_mode="ddial"
    ppp_nat="YES"   # siempre y cuando desee habilitar nat para su red local
    ppp_profile="nombre_del_proveedor_de_inet"

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

25.4.5. Diferenciando el uso del Servicio de PPPoE
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

En ocasiones es necesario utilizar una peque?a marca para diferenciar el
servicio que vamos a utilizar para establecer la conexi?n. Las marcas
(“tags”)de servicio son utilizadas para distinguir entre diferentes
servidores de una red, a los que nos podemos conectar utilizando PPPoE.

Su proveedor de internet debe haberle provisto de la informaci?n
necesaria para crear esta marca. Si esto no fu? as?, puede solicitar a
su proveedor que le brinde esta informaci?n.

Como ?ltimo recurso, puede intentar el m?todo sugerido por el programa
`Roarging Penguin PPPoE <http://www.roaringpenguin.com/pppoe/>`__, que
puede encontrarse en la `colecci?n de ports <ports.html>`__. Al utilizar
este programa debe tener en mente, que este puede desconfigurar su m?dem
por completo, por esta raz?n piense biena antes de utilizarlo.
Simplemente instale el programa controlador del m?dem, provisto por su
porveedor. Posteriormente, debe acceder al men? de ``Sistema`` del
programa. El nombre de su perfil debe aparecer listado. Que normalmente
es *ISP*.

El nombre del perfil (marca del servicio) ser? utilizada por la
configuraci?n de PPPoE en el fichero de configuraci?n ``ppp.conf`` como
el proveedor para la opci?n del comando ``set device`` (puede ver la
p?gina de ayuda
`ppp(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ppp&sektion=8>`__ para
m?s detalles). Esto debe verse algo similar a lo siguiente:

.. code:: programlisting

    set device PPPoE:xl1:ISP

No olvide cambiar *``x11``* por el dispositivo Ethernet que este
utilizando.

No olvide cambiar *``ISP``* por el nombre del perfil que le fu? descrito
anteriormente (por lo general el nombre de su Proveedor de Servicio de
Internet).

Para informaci?n adicional consulte:

.. raw:: html

   <div class="itemizedlist">

-  `Cheaper Broadband with FreeBSD on
   DSL <http://renaud.waldura.com/doc/freebsd/pppoe/>`__ por Renauld
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

25.4.6. Uso de PPPoE en Casa con un Modem Dual ADSL 3Com
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Este m?dem no sigue el estandar establecido en el `RFC
2516 <http://www.faqs.org/rfcs/rfc2516.html>`__ (*Un metodo que describe
el uso de PPP por medio de un dispositivo Ethernet (PPoE)*, escrito por
L. Mamakos, K. Lidl, J. Evarts, D. Carrel, D. Simone y R. Wheeler). En
su lugar, el c?digo de diferentes tipos de paquetes ha sido utilizado
para el manejo del entorno Ethernet. Si cree que esto es incorrecto y
que se debiera ajustar a las especificaciones de PPPoE, por favor
comentelo en `3Com <http://www.3com.com/>`__.

Para poder hacer que FreeBSD sea capaz de comunicarse con este
dispositivo, se debe establecer un control de sistema (sysctl). Esto
puede hacerse de forma autom?tica al momento del arranque, editando el
fichero ``/etc/sysctl.conf``:

.. code:: programlisting

    net.graph.nonstandard_pppoe=1

o bien pude hacerse desde la l?nea de comandos, para un efecto
inmediato, por medio del comando
``sysctl -w net.graph.nonstandard_pppoe=1``.

Desafortunadamente y dado que esto implica una configuraci?n general del
sistema, por lo que no es posible comunicarnos con un dispositivo
cliente — servidor que utilice PPPoE y con un m?dem casero 3Com ADSL, al
mismo tiempo.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------+---------------------------------+---------------------------------------+
| `Anterior <ppp.html>`__?   | `Subir <ppp-and-slip.html>`__   | ?\ `Siguiente <pppoa.html>`__         |
+----------------------------+---------------------------------+---------------------------------------+
| 25.3. Uso de Kernel PPP?   | `Inicio <index.html>`__         | ?25.5. Uso de PPP sobre ATM (PPPoA)   |
+----------------------------+---------------------------------+---------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
