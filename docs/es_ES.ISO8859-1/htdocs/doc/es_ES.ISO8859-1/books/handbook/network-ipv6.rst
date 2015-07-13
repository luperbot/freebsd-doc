===========
29.16. IPv6
===========

.. raw:: html

   <div class="navheader">

29.16. IPv6
`Anterior <network-plip.html>`__?
Cap?tulo 29. Networking avanzado
?\ `Siguiente <network-atm.html>`__

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

29.16. IPv6
-----------

.. raw:: html

   </div>

.. raw:: html

   <div>

Texto original de Aaron Kaplan.

.. raw:: html

   </div>

.. raw:: html

   <div>

Reestructurado y ampliado por Tom Rhodes.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

IPv6 (tambi?n conocido como IPng o “IP de nueva generaci?n”) es la nueva
versi?n del conocido protocolo de red IP, tamb?en llamado IPv4. Como
sucede con el resto de los sistemas \*BSD FreeBSD proporciona una
implementaci?n de referencia que desarrolla el proyecto japon?s KAME.
FreeBSD dispone de todo lo necesario para experimentar con el nuevo
protocolo de red. Esta secci?n se centra en conseguir configurar y
ejecutar correctamente el protocolo IPv6.

Al comienzo de los a?os 90 la gente comenz? a preocuparse por el r?pido
consumo del espacio de direcciones de IPv4. Dada la expansi?n actual de
Internet existen dos preocupaciones principales:

.. raw:: html

   <div class="itemizedlist">

-  Agotamiento de las direcciones disponibles. Actualmente no se trata
   del principal problema debido al uso generalizado del del espacio de
   direccionamiento privado (``10.0.0.0/8``, ``192.168.0.0/24``, etc.)
   junto con NAT.

-  El n?mero de entradas de las tablas de rutas comenzaba a ser
   imposible de manejar. Esto todavia es un problema prioritario.

.. raw:: html

   </div>

IPv6 trata de resolver estos problemas y algunos m?s de la siguiente
forma:

.. raw:: html

   <div class="itemizedlist">

-  IPv6 posee un espacio de direccionamiento de 128 bits. En otras
   palabras, en teor?a existen
   340,282,366,920,938,463,463,374,607,431,768,211,456 direcciones
   disponibles. Esto significa que existen aproximadamente 6.67 \* 10^27
   direcciones IPv6 por metro cuadrado disponibles para todo el planeta
   Tierra.

-  Los “routers” s?lo almacenan direcciones de red agregadas as? que se
   reduce el n?mero de entradas para cada tabla de rutas a un promedio
   de 8192.

.. raw:: html

   </div>

Existen adem?s muchas otras caracter?siticas interesantes que IPv6
proporciona, como:

.. raw:: html

   <div class="itemizedlist">

-  Autoconfiguraci?n de direcciones
   (`RFC2462 <http://www.ietf.org/rfc/rfc2462.txt>`__)

-  Direcciones anycast (“una-de-varias”)

-  Soporte de direcciones multicast predefinido

-  IPsec (Seguridad en IP)

-  Estructura de la cabecera simplificada

-  IP m?vil

-  Mecanismos de traducci?n de IPv6 a IPv4 (y viceversa)

.. raw:: html

   </div>

Si quiere saber m?s sobre IPv6 le recomendamos que consulte:

.. raw:: html

   <div class="itemizedlist">

-  Resumen de IPv6 en
   `playground.sun.com <http://playground.sun.com/pub/ipng/html/ipng-main.html>`__

-  `KAME.net <http://www.kame.net>`__

-  `6bone.net <http://www.6bone.net>`__

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

29.16.1. Conceptos b?sicos sobre las direcciones IPv6
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Existen varios tipos distintos de direcciones IPv6: Unicast, Anycast y
Multicast.

Las direcciones unicast son direcciones bien conocidas. Un paquete que
se env?a a una direcci?n unicast deber?n llega a la interfaz
identificada por dicha direcci?n.

Las direcciones anycast son sint?cticamente indistinguibles de las
direcciones unicast pero sirven para identificar a un *conjunto* de
interfaces. Un paquete destinado a una direcci?n anycast llega a la
interfaz “m?s cercana” (en t?rminos de m?trica de “routers”). Las
direcciones anycast s?lo se pueden utilizar en “routers”.

Las direcciones multicast identifican un grupo de interfaces. Un paquete
destinado a una direcci?n multicast llega a todos los los interfaces que
se encuentran agrupados bajo dicha direcci?n.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Las direcciones IPv4 de tipo broadcast (normalmente ``xxx.xxx.xxx.255``)
se expresan en IPv6 mediante direcciones multicast.

.. raw:: html

   </div>

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Tabla 29.2. Direcciones IPv6 reservadas

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+--------------------------+-------------------------------+-----------------------------------------+----------------------------------------------------------------------------------------------------------------------------+
| Direcci?n IPv6           | Longitud del Prefijo (Bits)   | Descripci?n                             | Notas                                                                                                                      |
+==========================+===============================+=========================================+============================================================================================================================+
| ``::``                   | 128 bits                      | sin especificar                         | como ``0.0.0.0`` en Pv4                                                                                                    |
+--------------------------+-------------------------------+-----------------------------------------+----------------------------------------------------------------------------------------------------------------------------+
| ``::1``                  | 128 bits                      | direcci?n de bucle local (loopback)     | como las ``127.0.0.1`` en IPv4                                                                                             |
+--------------------------+-------------------------------+-----------------------------------------+----------------------------------------------------------------------------------------------------------------------------+
| ``::00:xx:xx:xx:xx``     | 96 bits                       | direcci?nes IPv6 compatibles con IPv4   | Los 32 bits m?s bajos contienen una direcci?n IPv4. Tambi?n se denominan direcciones “empotradas.”                         |
+--------------------------+-------------------------------+-----------------------------------------+----------------------------------------------------------------------------------------------------------------------------+
| ``::ff:xx:xx:xx:xx``     | 96 bits                       | direcciones IPv6 mapeadas a IPv4        | Los 32 bits m?s bajos contienen una direcci?n IPv4. Se usan para representar direcciones IPv4 mediante direcciones IPv6.   |
+--------------------------+-------------------------------+-----------------------------------------+----------------------------------------------------------------------------------------------------------------------------+
| ``fe80::`` - ``feb::``   | 10 bits                       | direcciones link-local                  | equivalentes a la direcci?n de loopback de IPv4                                                                            |
+--------------------------+-------------------------------+-----------------------------------------+----------------------------------------------------------------------------------------------------------------------------+
| ``fec0::`` - ``fef::``   | 10 bits                       | direcciones site-local                  | Equivalentes al direccionamiento privado de IPv4                                                                           |
+--------------------------+-------------------------------+-----------------------------------------+----------------------------------------------------------------------------------------------------------------------------+
| ``ff::``                 | 8 bits                        | multicast                               | ?                                                                                                                          |
+--------------------------+-------------------------------+-----------------------------------------+----------------------------------------------------------------------------------------------------------------------------+
| ``001`` (base 2)         | 3 bits                        | direcciones unicast globales            | Todas las direcciones IPv6 globales se asignan a partir de este espacio. Los primeros tres bits siempre son “001”.         |
+--------------------------+-------------------------------+-----------------------------------------+----------------------------------------------------------------------------------------------------------------------------+

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

29.16.2. Lectura de las direcciones IPv6
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

La forma can?nica que se utiliza para representar direcciones IPv6 es:
``x:x:x:x:x:x:x:x``, donde cada “x” se considera un valor hexadecimal de
16 Bit. Por ejemplo ``FEBC:A574:382B:23C1:AA49:4592:4EFE:9982``

A menudo una direcci?n posee alguna subcadena de varios ceros
consecutivos de forma que se puede abreviar dicha cadena (s?lo una vez,
para evitar ambig?edades) mediante “::”. Tambi?n se pueden omitir los
ceros a la ceros a la izquierda dentro de un valor “x”. Por ejemplo
``fe80::1`` se corresponde con la forma can?nica
``fe80:0000:0000:0000:0000:0000:0000:0001``.

Una tercera forma de escribir direciones IPv6 es utilizando la ya
tradicional notaci?n decimal de IPv4 pero s?lamente para los 32 bits m?s
bajos de la direcci?n IPv6. Por ejemplo ``2002::10.0.0.1`` se
corresponder?a con la representation hexadecimal can?nica
``2002:0000:0000:0000:0000:0000:0a00:0001`` la cual es equivalente
tambi?n a escribir ``2002::a00:1``.

A estas alturas el lector deber?a ser capaz de comprender lo siguiente:

.. code:: screen

    # ifconfig

.. code:: programlisting

    rl0: flags=8943<UP,BROADCAST,RUNNING,PROMISC,SIMPLEX,MULTICAST> mtu 1500
             inet 10.0.0.10 netmask 0xffffff00 broadcast 10.0.0.255
             inet6 fe80::200:21ff:fe03:8e1%rl0 prefixlen 64 scopeid 0x1
             ether 00:00:21:03:08:e1
             media: Ethernet autoselect (100baseTX )
             status: active

``fe80::200:21ff:fe03:8e1%rl0`` es una direcci?n link-local
autoconfigurada. Se construye a partir de la direcci?n MAC de la tarjeta
de red.

Si quiere saber m?s sobre la estructura de las direcciones IPv6 puede
consultar `RFC3513 <http://www.ietf.org/rfc/rfc3513.txt>`__.

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

29.16.3. Establecimiento de conectividad
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Actualmente existen cuatro formas distintas de conectarse con otras
m?quinas y redes IPv6:

.. raw:: html

   <div class="itemizedlist">

-  Unirse a la red experimental denominada 6bone

-  Obtener una red IPv6 a trav?s de nuestro proveedor de acceso a
   Internet. Consulte a su proveedor de servicios para para m?s
   informaci?n.

-  Encapsulaci?n de IPv6 sobre IPv4
   (`RFC3068 <http://www.ietf.org/rfc/rfc3068.txt>`__)

-  Utilizaci?n del “port”
   `net/freenet6 <http://www.freebsd.org/cgi/url.cgi?ports/net/freenet6/pkg-descr>`__
   si se dispone de una de una conexi?n de marcaci?n por modem.

.. raw:: html

   </div>

Vamos a explicar c?mo conectarse al 6bone ya que parece ser la forma m?s
utilizada en la actualidad.

En primer lugar se recomienda consultar el sitio web de
`6bone <http://www.6bone.net/>`__ para saber cu?l es la conexi?n del
6bone (f?sicamente) m?s pr?xima. Se debe escribir a la persona
responsable de ese nodo y con un poco de suerte dicha persona responder?
con con un conjunto de instrucciones y pasos a seguir para establecer la
la conexi?n con ellos y a trav?s de ellos con el resto de los nodos IPv6
que forman parte del 6bone. Normalmente esta conexi?n se establece
usando t?neles GRE (gif).

Veamos un ejemplo t?pico de configuraci?n de un de un t?nel
`gif(4) <http://www.FreeBSD.org/cgi/man.cgi?query=gif&sektion=4>`__:

.. code:: screen

    # ifconfig gif0 create
    # ifconfig gif0
    gif0: flags=8010<POINTOPOINT,MULTICAST> mtu 1280
    # ifconfig gif0 tunnel MI_DIRECCI?n_IPV4  SU_DIRECCI?n_IPV4
    # ifconfig gif0 inet6 alias DIRECCI?n_DE-SALIDA_IPv6_DEL_T?NEL_ASIGNADO

Sustituya las palabras en may?sculas por la informaci?n recibida del
nodo 6bone al que nos queremos conectar.

La orden anterior establece el t?nel. Compruebe que el t?nel funciona
correctamente mediante
`ping(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ping&sektion=8>`__.
Haga un
`ping6(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ping6&sektion=8>`__
a ``ff02::1%gif0``. Deber?amos recibir recibir “dos” respuestas.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Para que el lector no se quede pensando en el significado significado de
la direcci?n ``ff02:1%gif0`` le podemos decir que se trata de de una
direcci?n IPv6 multicast de tipo link-local. ``%gif0`` no forma parte
del protocolo IPv6 como tal sino que se trata de un detalle de
implementaci?n relacionado con las direcciones link-local y se a?ade
para especificar la interfaz de salida que se debe utilizar para enviar
los paquetes de
`ping6(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ping6&sektion=8>`__.
Como estamos haciendo ping a una direcci?n multicast a la que se unen
todos los interfaces pertenecientes al mismo enlace deber?a responder al
ping tanto nuestro propio interfaz como el interfaz remoto.

.. raw:: html

   </div>

A continuaci?n se configura la ruta por defecto hacia nuestro enlace
6bone; observe que es muy semejante a lo que hay que hacer en IPv4:

.. code:: screen

    # route add -inet6 default -interface gif0
    # ping6 -n MI_UPLINK

.. code:: screen

    # traceroute6 www.jp.FreeBSD.org
    (3ffe:505:2008:1:2a0:24ff:fe57:e561) from 3ffe:8060:100::40:2, 30 hops max, 12 byte packets
         1  atnet-meta6  14.147 ms  15.499 ms  24.319 ms
         2  6bone-gw2-ATNET-NT.ipv6.tilab.com  103.408 ms  95.072 ms *
         3  3ffe:1831:0:ffff::4  138.645 ms  134.437 ms  144.257 ms
         4  3ffe:1810:0:6:290:27ff:fe79:7677  282.975 ms  278.666 ms  292.811 ms
         5  3ffe:1800:0:ff00::4  400.131 ms  396.324 ms  394.769 ms
         6  3ffe:1800:0:3:290:27ff:fe14:cdee  394.712 ms  397.19 ms  394.102 ms

Esta captura de pantalla variar? dependiendo de la localizaci?n de la
m?quina. Tras seguir estos pasos deber?amos poder alcanzar el sitio IPv6
de `www.kame.net <http://www.kame.net>`__ y ver la tortuga bailarina,
que es una imagen animada que s?lo se muestra cuando se accede al
servidor web utilizando el protocolo IPv6 (para ellos se encesita
utilizar un navegador web que soporte IPv6, IPv6, por ejemplo
`www/mozilla <http://www.freebsd.org/cgi/url.cgi?ports/www/mozilla/pkg-descr>`__
o Konqueror, que forma parte de
`x11/kdebase3 <http://www.freebsd.org/cgi/url.cgi?ports/x11/kdebase3/pkg-descr>`__,
o tambi?n con
`www/epiphany <http://www.freebsd.org/cgi/url.cgi?ports/www/epiphany/pkg-descr>`__.

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

29.16.4. DNS en el mundo IPv6
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Existen dos tipos de registros de DNS para IPv6. No obstante el IETF ha
declarado los registros A6 y CNAME como registros para uso experimental.
Los registros de tipo AAAA son los ?nicos estandar a d?a de hoy.

La utilizaci?n de registros de tipo AAAA es muy sencilla. Se asocia el
nombre de la m?quina con la direcci?n IPv6 de la siguiente forma:

.. code:: programlisting

    NOMBREDEMIM?QUINA AAAA   MIDIRECCI?NIPv6

De igual forma que en IPv4 se utilizan los registros de tipo A. En caso
de no poder administrar su propia zona de DNS se puede pedir esta
configuraci?n a su proveedor de servicios. Las versiones actuales de
bind (versiones 8.3 y 9) y el “port”
`dns/djbdns <http://www.freebsd.org/cgi/url.cgi?ports/dns/djbdns/pkg-descr>`__
(con el parche de IPv6 correspondiente) soportan los registros de tipo
AAAA.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------+----------------------------------------+---------------------------------------+
| `Anterior <network-plip.html>`__?   | `Subir <advanced-networking.html>`__   | ?\ `Siguiente <network-atm.html>`__   |
+-------------------------------------+----------------------------------------+---------------------------------------+
| 29.15. L?nea IP paralela (PLIP)?    | `Inicio <index.html>`__                | ?29.17. ATM en FreeBSD?5.X            |
+-------------------------------------+----------------------------------------+---------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
