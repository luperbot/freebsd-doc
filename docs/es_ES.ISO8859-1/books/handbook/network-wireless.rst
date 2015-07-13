===================================
29.3. Redes sin cables (“wireless”)
===================================

.. raw:: html

   <div class="navheader">

29.3. Redes sin cables (“wireless”)
`Anterior <network-routing.html>`__?
Cap?tulo 29. Networking avanzado
?\ `Siguiente <network-bluetooth.html>`__

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

29.3. Redes sin cables (“wireless”)
-----------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Escrito por Eric Anderson.

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

29.3.1. Introducci?n
~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Puede resultar muy ?til el ser capaz de utilizar una computadora sin la
molestia de tener un cable de red colgando de la m?quina en todo
momento. FreeBSD puede utilizarse como un cliente de “wireless” e
incluso como un “punto de acceso”.

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

29.3.2. Modos de operaci?n Wireless
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Existen dos formas diferentes de configurar dispositivos wireless
802.11: BSS e IBSS.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

29.3.2.1. Modo BSS
^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El modo BSS es el que se utiliza normalmente. Este modo tambi?n se
denomina modo infraestructura. En esta configuraci?n se conectan un
determinado n?mero de puntos de acceso a una red cableada. Cada red Cada
red “wireless” pos?e su propio nombre. Este nombre es el SSID de la red.

Los clientes “wireless” se conectan a estos puntos de acceso. El
est?ndar IEEE 802.11 define el protocolo que se utiliza para realizar
esta conexi?n. Un cliente “wireless” puede asociarse con una determinada
red “wireless” especificando el SSID. Un cliente “wireless” tambi?n
puede asociarse a cualquier red que se encuentre disponible; basta con
no especificar ning?n SSID.

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

29.3.2.2. Modo IBSS
^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El modo IBSS, tambi?n conocido como modo ad-hoc, se ha dise?ado para
facilitar las conexiones punto a punto. En realidad existen dos tipos
distintos de modos ad-hoc. Uno es el modo IBSS, tambi?n conocido como
modo ad-hoc o modo ad-hoc del IEEE. Este modo se encuentra especificado
en el est?ndar IEEE 802.11. El segundo tipo se denomina modo ad-hoc de
demostraci?n o modo ad-hoc de Lucent (y algunas veces, tambi?n se le
llama simplemente modo ad-hoc, lo cual es bastante confuso). Este es el
modo de funcionamiento ant?guo, anterior al est?ndar 802.11, del modo
ad-hoc deber?a utilizarse s?lo en instalaciones propietarias. No
profundizaremos m?s sobre estos modos de funcionamiento.

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

29.3.3. Modo infraestructura
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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

29.3.3.1. Puntos de acceso
^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Los puntos de acceso son dispositivos de red “wireless” que funcionan de
forma equivalente a los “hubs” o concentradores, permitiendo que varios
clientes “ wireless” se comuniquen entre s?. A menudo se utilizan varios
puntos de acceso para cubrir un ?rea determinada como una casa, una
oficina u otro tipo de localizaci?n delimitada.

Los puntos de acceso poseen t?picamente varias conexiones de red: la
tarjeta “wireless” y una o m?s tarjetas Ethernet que se utilizan para
comunicarse con el resto de la red.

Los puntos de acceso se pueden comprar como tales pero tambi?n se puede
configurar un sistema FreeBSD para crear nuestro propio punto de acceso
“wireless” utilizando un determinado tipo de tarjetas “wireless” que
poseen tales capacidades de configuraci?n. Existe una gran cantidad de
fabricantes de hardware que distribuyen puntos de acceso y tarjetas de
red “wireless”, aunque las capacidades de unos y otras var?n.

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

29.3.3.2. Construcci?n de un punto de acceso basado en FreeBSD
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

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

29.3.3.2.1. Requisitos
''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Para crear nuestro propio punto de acceso con FreeBSD debemos utilizar
un determinado tipo de tarjeta “wireless”. Por el momento, s?lo las
tarjetas con el chip Prism nos permiten hacer un punto de acceso.
Tambi?n vamos a necesitar una tarjeta para red cableada que sea
soportada por el sistema (esto no es muy complicado dada la ingente
cantidad de dispositivos de este tipo que funcionan en FreeBSD). Para
este ejemplo vamos a suponer que queremos puentear
(`bridge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bridge&sektion=4>`__)
todo el tr?fico entre la red cableada y la red inal?mbrica.

El uso como punto de acceso “wireless” (tambi?n denominado *hostap*)
funciona mejor con determinadas versiones del “ firmware”. Las tarjetas
con chip Prism2 deben disponer de la versi?n 1.3.4 (o superior) del “
firmware”. Los chips Prism2.5 y Prism3 deben disponer de la versi?n
1.4.9 o superior del “firmware”. Las versiones m?s ant?guas de estos “
firmwares” pueden no funcionar correctamente. A d?a de hoy la ?nica
forma de actualizar el “ firmware” de las tarjetas es usando las
herramientas que proporciona el fabricante para Windows?.

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

29.3.3.2.2. Puesta en marcha del sistema
''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Primero debemos asegurarnos de que el sistema reconoce la tarjeta
“wireless”:

.. code:: screen

    # ifconfig -a
    wi0: flags=8843<UP,BROADCAST,RUNNING,SIMPLEX,MULTICAST> mtu 1500
            inet6 fe80::202:2dff:fe2d:c938%wi0 prefixlen 64 scopeid 0x7
            inet 0.0.0.0 netmask 0xff000000 broadcast 255.255.255.255
            ether 00:09:2d:2d:c9:50
            media: IEEE 802.11 Wireless Ethernet autoselect (DS/2Mbps)
            status: no carrier
            ssid ""
            stationname "nodo Wireless FreeBSD"
            channel 10 authmode OPEN powersavemode OFF powersavesleep 100
            wepmode OFF weptxkey 1

No se preocupe si no entiende algo de la configuraci?n anterior, lo
importante es asegurarse de que el sistema muestra algo parecido, lo
cual nosindicar? que la tarjeta “wireless” ha sido correctamente
reconocida por FreeBSD. Si el interfaz inal?mbrico no es reconocido
correctamente y se est? utilizando una tarjeta PC Card consulte
`pccardc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pccardc&sektion=8>`__
y
`pccardd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pccardd&sektion=8>`__,
en las que tiene mucha informaci?n al respecto.

A continuaci?n, para que podamos disponer de un “bridge” deber? cargar
el m?dulo del kernel
`bridge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bridge&sektion=4>`__
por el sencillo procedimiento de ejecutar la siguiente orden:

.. code:: screen

    # kldload bridge

No deber?a aparecer mensaje de error alguno al ejecutar dicha orden. Si
apareciera alguno quiz?s deba compilar el kernel del sistema con
`bridge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bridge&sektion=4>`__
inclu?do. La secci?n `Bridging <network-bridging.html>`__ de ?ste manual
incluye informaci?n abundante para llevar a buen puerto esa tarea.

Una vez que tenemos el soporte de “bridging” cargado debemos indicar a
FreeBSD qu? interfaces se desean puentear. Para ello emplearemos
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__:

.. code:: screen

    # sysctl net.link.ether.bridge=1
    # sysctl net.link.ether.bridge_cfg="wi0,xl0"
    # sysctl net.inet.ip.forwarding=1

En FreeBSD?5.2-RELEASE y posteriores se deben emplear las siguientes
opciones en lugar de las anteriormente expuestas:

.. code:: screen

    # sysctl net.link.ether.bridge.enable=1
    # sysctl net.link.ether.bridge.config="wi0,xl0"
    # sysctl net.inet.ip.forwarding=1

Ahora es el momento de configurar la tarjeta de red inal?mbrica. La
siguiente orden convierte la tarjeta en un punto de acceso:

.. code:: screen

    # ifconfig wi0 ssid mi_red channel 11 media DS/11Mbps mediaopt hostap up stationname "PA FreeBSD"
             

La l?nea de
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8>`__
levanta el interfaz ``wi0``, configura el SSID con el valor de
*``mi_red``* y tambi?n el nombre de la estaci?n como *``FreeBSD``*. La
opci?n ``media DS/11Mbps`` configura la tarjeta a 11Mbps. ?sto es
necesario para que cualquier valor que se necesite asignar a
``mediaopt`` surta efecto. La opci?n ``mediaopt hostap`` sit?a el
interfaz en modo punto de acceso. La opci?n ``        channel 11``
configura la tarjeta para que use el canal de radio n?mero 11. En
`wicontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=wicontrol&sektion=8>`__
encontrar?a rangos de canales v?lidos para varios dominios regulatorios.
Por favor, tenga en cuenta que no todos los canales son legales en todos
los pa?ses.

Despues de esto deber?amos disponer de un punto de acceso completamente
funcional y en ejecuci?n. Le animamos a consultar
`wicontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=wicontrol&sektion=8>`__,
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8>`__
y `wi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=wi&sektion=4>`__ para
m?ss informaci?n.

Tambi?n le recomemdamos leer la secci?n sobre cifrado que econtrar? m?s
adelante.

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

29.3.3.2.3. Informaci?n de estado
'''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Una vez que el punto de acceso est?configurado resulta interesante poder
obtener informaci?n acerca de los clientes que est?n asociados. La
persona encargada de la administraci?n del punto de acceso puede
ejecutar cuando estime oportuno lo siguiente:

.. code:: screen

    # wicontrol -l
    1 station:
    00:09:b7:7b:9d:16  asid=04c0, flags=3<ASSOC,AUTH>, caps=1<ESS>, rates=f<1M,2M,5.5M,11M>, sig=38/15

Lo que aqu? se muestra indica que hay una ?nica estaci?n asociada y nos
suministra sus par?metros. Los valores de se?al que se muestran se deben
tomar s?lo como indicaciones aproximadas de la fuerza de dicha se?al. Su
traducci?n a dBm u otras unidades var?a seg?n la versi?n del “ firmware”
de la tarjeta que se use.

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

29.3.3.3. Clientes
^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Un cliente “wireless” es un sistema que se comunica con un punto de
acceso o directamente con otro cliente “wireless”.

Generalmente los clientes “wireless” s?lo poseen un dispositivo de red:
la tarjeta de red inal?mbrica.

Existen varias formas de configurar un cliente “ wireless” basadas en
los distintos modos inal?mbricos, normalmente reducidos a BSS (o modo
infraestructura, que requiere de un punto de acceso) y el modo IBSS
(modo ad-hoc, o modo punto a punto). En nuestro ejemplo usaremos el m?s
famoso de ambos, el BSS, para comunicarnos con un punto de acceso.

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

29.3.3.3.1. Requisitos
''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

S?lamente existe un requisito real para configurar un sistema FreeBSD
como cliente inal?mbrico: usar una tarjeta de red inal?mbrica soportada
por el sistema.

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

29.3.3.3.2. Ejecuci?n de un cliente inal?mbrico FreeBSD
'''''''''''''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Para utilizar una red inal?mbrica se necesitan conocer algunos conceptos
b?sicos de redes de redes wireless. En nuestro ejemplo queremos
conectarnos a la red inal?mbrica *``mi_red``* y queremos hacerlo con el
soporte de cifrado desactivado.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

En este ejemplo no se utiliza cifrado, lo cual resulta ser bastante
peligroso. En la pr?xima secci?n aprenderemos c?mo activar el sistema de
cifrado com?n el los dispositivos inal?mbricos, por qu? resulta
importante hacerlo y por qu? algunas tecnolog?as de cifrado no son
suficientes para protegernos completamente.

.. raw:: html

   </div>

Aseg?rese de que FreeBSD reconoce su tarjeta de red inal?mbrica:

.. code:: screen

    # ifconfig -a
    wi0: flags=8843<UP,BROADCAST,RUNNING,SIMPLEX,MULTICAST> mtu 1500
            inet6 fe80::202:2dff:fe2d:c938%wi0 prefixlen 64 scopeid 0x7
            inet 0.0.0.0 netmask 0xff000000 broadcast 255.255.255.255
            ether 00:09:2d:2d:c9:50
            media: IEEE 802.11 Wireless Ethernet autoselect (DS/2Mbps)
            status: no carrier
            ssid ""
            stationname "FreeBSD Wireless node"
            channel 10 authmode OPEN powersavemode OFF powersavesleep 100
            wepmode OFF weptxkey 1

A continuaci?n debemos especificar los par?metros correctos para nuestra
red:

.. code:: screen

    # ifconfig wi0 inet 192.168.0.20 netmask 255.255.255.0 ssid mi_red

Sustituya ``192.168.0.20`` y ``255.255.255.0`` con una direcci?n IP y
m?scara de red que se adec?en con el espacio de direccionamiento de la
red cableada. Recordemos que nuestro punto de acceso est? puenteando la
red inal?mbrica y la red de cable, de modo que para el resto de
dispositivos de la red el cliente inal?brico se muestra como un elemento
m?s de la red cableada.

Llegados a este punto deber?amos poder hacer ping a las m?quinas de la
red cableada como si estuvi?ramos compartiendo el mismo enlace f?sico
cableado.

Si se presentan problemas con la conexi?n inal?mbrica se puede comprobar
si la tarjeta “ wireless” se encuentra correctamente asociada
(conectada) con el punto de acceso:

.. code:: screen

    # ifconfig wi0

eber?a devolver alg?n tipo de informaci?n entre la que deber?amos
observar la siguiente l?nea:

.. code:: screen

    status: associated

Si no aparece la palabra ``associated`` puede ser que nos encontremos
fuera de la cobertura proporcionada por el punto de acceso o puede ser
que necesitemos activar el cifrado, aunque ?stos no son los ?nicos
problemas con los que nos podemos encontrar.

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

29.3.3.4. Cifrado
^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El cifrado, tambi?n llamado codificaci?n, de una red inal?mbrica es un
proceso importante porque, a diferencia de lo que ocurre con las redes
cableadas convencionales, las redes inal?mbricas no se pueden restringir
a un espacio f?sico determinado. Los datos que viajan a trav?s de ondas
de radio se difunden a trav?s de las paredes y alcanzan a los vecinos
m?s cercanos. Aqu? es donde entra en en juego el sistema de cifrado. El
cifrado se emplea para evitar que cualquiera pueda examinar los datos
enviados a trav?s del aire.

Los dos m?todos m?s comunes para realizar el cifrado de datos entre el
cliente y el punto de acceso son WEP e
`ipsec(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipsec&sektion=4>`__.

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

29.3.3.4.1. WEP
'''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

WEP son las siglas de Wired Equivalency Protocol. WEP es un un intento
de crear redes inal?mbricas al menos tan seguras omo las redes cableadas
o al menos de seguridad equivalente a dichas redes. Por desgracia el
sistema WEP es d?bil y resulta bastante sencillo de romper. Esto
significa que cuando se transmite informaci?n de car?cter cr?tico no se
debe confiar ?nicamente en este sistema de cifrado.

No obstante es mejor que no utilizar nada; puede activar WEP en el
sistema que hace de punto de acceso mediante:

.. code:: screen

    # ifconfig wi0 inet up ssid
                  mi_red wepmode on wepkey
                  0x1234567890 media DS/11Mbps
                  mediaopt hostap

y en un cliente inal?mbrico mediante la siguiente orden:

.. code:: screen

    # ifconfig wi0 inet 192.168.0.20 netmask 255.255.255.0 ssid mi_red wepmode on wepkey 0x1234567890

Por favor, tenga un poco de sentido com?n y reemplace la clave
*``0x1234567890``* por otra clave menos obvia.

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

29.3.3.4.2. IPsec
'''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

`ipsec(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipsec&sektion=4>`__
es una herramienta m?s robusta y potente para cifrar datos que se mueven
a trav?s de una red. Es el mecanismo m?s conveniente para asegurar los
datos de una red inal?mbrica. Tiene m?s informaci?n sobre el protocolo
`ipsec(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ipsec&sektion=4>`__
y c?mo utilizarlo en la secci?n `IPsec <ipsec.html>`__ de este manual.

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

29.3.3.5. Herramientas
^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

No hay muchas herramientas disponibles si se quiere depurar y
monitorizar redes inal?mbricas pero en el siguiente apartado mostraremos
c?mo utilizar algunas de ellas.

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

29.3.3.5.1. El paquete bsd-airtools
'''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El paquete bsd-airtools es un conjunto muy completo de herramientas
“wireless” que se pueden utilizar para multitud de tareas, entre las
cuales podemos citar citar el desciframiento de claves WEP, detecci?n de
puntos de de acceso, monitorizaci?n de la se?al de radio, etc.

El paquete bsd-airtools se puede instalar como “port” desde
`net/bsd-airtools <http://www.freebsd.org/cgi/url.cgi?ports/%0A%20%20%20%20%20%20net/bsd-airtools/pkg-descr>`__.
La informaci?n relacionada con los “ports” puede encontrarse en la
secci?n `Cap?tulo?4, *Instalaci?n de aplicaciones: ?packages? y
ports* <ports.html>`__ de este manual.

El programa ``dstumbler`` es una herramienta que permite descubrir
puntos de acceso y entre otras cosas muestra de forma gr?fica la
relaci?n se?al / ruido del enlace. Si se experimentan problemas para
acceder a un determinado punto de acceso ``dstumbler`` puede ser muy
?til.

Para probar la seguridad de la red inal?mbrica se puede usar
“dweputils”, concretamente las ?rdenes ``       dwepcrack``,
``dwepdump`` y ``       dwepkeygen``. Estas ?rdenes permiten determinar
hasta qu? punto la seguridad que ofrece WEP es suficiente para nuestras
necesidades.

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

29.3.3.5.2. Las utilidades ``wicontrol``, ``ancontrol`` y ``raycontrol``
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Mediante estas herramientas se puede controlar el comportamiento de la
tarjeta de red inal?mbrica. En los ejemplos anteriores se ha utilizado
`wicontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=wicontrol&sektion=8>`__
debido a que la tarjeta de red del ejemplo utiliza el interfaz ``wi0``.
Si se pos?e una tarjeta “wireless” de Cisco dicha tarjeta se mostrar? en
el sistema mediante el interfaz ``       an0`` y por lo tanto la orden
equivalente que se debe usar ser?
`ancontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ancontrol&sektion=8>`__.

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

29.3.3.5.3. ``ifconfig``
''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Con
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8>`__
se puede utilizar unas cuantas de las opciones que se pueden usar con
`wicontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=wicontrol&sektion=8>`__,
pero no obstante no pos?e todas las funcionalidades que proporciona
`wicontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=wicontrol&sektion=8>`__.
Se recomienda leer
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8>`__
para conocer los detalles de los par?metros y opciones que admite.

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

29.3.3.6. Tarjetas de Red inal?mbricas soportadas
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

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

29.3.3.6.1. Puntos de acceso
''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Las ?nicas tarjetas que soportan el modo de funcionamiento
funcionamiento BSS (pueden funcionar como puntos de acceso) son los
dispositivos basados en el chip Prism 2, 2.5 ? 3. Consulte
`wi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=wi&sektion=4>`__ para
ver una lista completa de ellos.

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

29.3.3.6.2. Clientes
''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD soporta casi todas las tarjetas inal?mbricas 802.11b 802.11b que
se encuentran actualmente en el mercado. La mayor?a de las tarjetas
basadas en los chips Prism, Spectrum24, Spectrum24, Hermes, Aironet y
Raylink tamb?en funcionan en modo IBSS (modos ad-hoc, punto a punto y
BSS).

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------+----------------------------------------+---------------------------------------------+
| `Anterior <network-routing.html>`__?   | `Subir <advanced-networking.html>`__   | ?\ `Siguiente <network-bluetooth.html>`__   |
+----------------------------------------+----------------------------------------+---------------------------------------------+
| 29.2. Pasarelas y “routers”?           | `Inicio <index.html>`__                | ?29.4. Bluetooth                            |
+----------------------------------------+----------------------------------------+---------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
