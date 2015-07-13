===========================
29.2. Pasarelas y “routers”
===========================

.. raw:: html

   <div class="navheader">

29.2. Pasarelas y “routers”
`Anterior <advanced-networking.html>`__?
Cap?tulo 29. Networking avanzado
?\ `Siguiente <network-wireless.html>`__

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

29.2. Pasarelas y “routers”
---------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Escrito por Coranth Gryphon.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Para que una m?quina sea capaz de encontrar otra m?quina remota a trav?s
de la red debe existir mecanismo que describa c?mo llegar del origen al
destino. Este mecanismo se demonina *routing* o *encaminamiento*. Una
“ruta” es un par definido de direcciones: una direcci?n de “destino” y
una direcci?n de “pasarela”. ?ste par indica que para llegar a dicho
*destino* debe efectuarse una comunicaci?n previa con dicha *pasarela*.
Exiten tres tipos distintos de destinos: m?quinas individuales, subredes
y “por defecto”. La “ruta por defecto” se utiliza s?lamente cuando no se
puede aplicar ninguna de las otras rutas existentes. El tema de las
rutas por defecto se tratar? m?s adelante con m?s detalle. Tambi?n
existen tres tipos de pasarelas distintas: m?quinas individuales,
interfaces (tambi?n llamados “enlaces”) y direcciones hardware de
ethernet (direcciones MAC).

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

29.2.1. Ejemplo
~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Para ilustrar diferentes aspectos del sistema de encaminamiento veamos
el siguiente ejemplo obtenido mediante ``netstat``.

.. code:: screen

    % netstat -r
    Routing tables

    Destination      Gateway            Flags     Refs     Use     Netif Expire

    default          outside-gw         UGSc       37      418      ppp0
    localhost        localhost          UH          0      181       lo0
    test0            0:e0:b5:36:cf:4f   UHLW        5    63288       ed0     77
    10.20.30.255     link#1             UHLW        1     2421
    ejemplo.com      link#1             UC          0        0
    host1            0:e0:a8:37:8:1e    UHLW        3     4601       lo0
    host2            0:e0:a8:37:8:1e    UHLW        0        5       lo0 =>
    host2.ejemplo.com link#1            UC          0        0
    224              link#1             UC          0        0

Las primeras dos l?neas especifican la ruta por defecto (la cual se
comenta en la `siguiente
secci?n <network-routing.html#network-routing-default>`__) y la ruta de
``m?quina           local``.

La interfaz (columna ``Netif``) que especifica esta tabla de rutas para
el destino ``localhost`` se denomina ``lo0``, y tambi?n se conoce como
el dispositivo de “ loopback” a de bucle de retorno. Esto viene a decir
que el tr?fico no debe entregarse a la red puesto que dicho tr?fico va
destinado a la misma m?quina que lo origin?.

Lo siguiente que podemos observar son las direcciones que comienzan por
``0:e0:``. Son direcciones hardware de Ethernet, llamadas tambi?n se
direcciones MAC. FreeBSD identifica autom?ticamente cualquier m?quina
(``test0`` en el ejemplo anterior) que se encuentre en la red local y
crea una ruta del estilo que estamos comentando, para entregar el
tr?fico directamente a trav?s del correspondiente interfaz Ethernet, en
este caso ``ed0``. Existe tambi?n un contador (``Expire``) asociado con
este tipo de rutas que se usa para borrarlas cuando dicho contador
expira. Las rutas para las m?quinas de nuestra propia red de de ?rea
local se crean din?micamente utilizando el protocolo ARP (Address
Resolution Protocol o Protocolo de Resoluci?n de Direcciones), que se
encarga de averiguar la direcci?n MAC que se corresponde con la
direcci?n IP de la m?quina destino.

FreeBSD tamb?en utiliza rutas de subred para direccionar la subred local
(``10.20.30.255`` es la direcci?n de broadcast para la subred
``10.20.30``, y ``ejemplo.com`` es el nombre de dominio asociado con
dicha subred.) La notaci?n ``link#1`` se refiere a la primera tarjeta
Ethernet de la m?quina. En este tipo de redes no se especifica ning?n
interfaz en el campo de ``Netif``.

Las rutas de subredes aparecen cuando se asigna una direcci?n IP a una
interfaz, utilizando una m?scara de red. Tambi?n se pueden aprender
din?micamente utilizando demonios de encaminamiento, como routed. Por
?ltimo estas rutas pueden crearse manualmente de forma expl?cita; es lo
que se conoce con el nombre de rutas est?ticas.

La l?nea de ``host1`` se refiere a nuestra m?quina, que el sistema
identifica por la correspondiente direcci?n Ethernet de la tarjeta de
red. FreeBSD sabe que debe utilizar la interfaz de loopback (``lo0``) en
vez de enviar los paquetes a a trav?s de red.

Las dos l?neas que comienzan por ``host2`` son ejemplos del uso de alias
de
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8>`__
alias (consultar la secci?n sobre Ethernet para averiguar por qu? nos
podr?a interesar hacer esto.) El s?mbolo ``=>`` despu?s de la interfaz
``lo0`` especifica que no s?lo estamos utilizando la interfaz de
loopback, si no que adem?s especifica que se trata de un alias. Estas
rutas s?lo aparecen en las m?quinas que implementan el alias, el resto
de las m?quinas de la subred local solamente poseer?n una l?nea
``link#1`` para dichas rutas.

La ?ltima l?nea (destino de subred ``224``) trata sobre encaminamiento
multicast, que cubriremos en otra secci?n.

Finalmente, se pueden observar varios atributos relacionados con las
rutas en la columna de ``Flags``. A continuaci?n se muestra una peque?a
tabla con el significado de algunos de esos de los atributos o “flags”.

.. raw:: html

   <div class="informaltable">

+-----+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| U   | Up: La ruta est? activa.                                                                                                                                                          |
+-----+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| H   | Host: El destino de la ruta es una ?nica m?quina.                                                                                                                                 |
+-----+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| G   | Gateway: Env?a cualquier cosa para ?ste destino a trav?s de la pasarela especificada, la cual decidir? c?mo encaminar el paquete hasta que eventualmente se alcance el destino.   |
+-----+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| S   | Static: Esta ruta se configur? manualmente, y no se ha generado de forma autom?tica por el sistema.                                                                               |
+-----+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| C   | Clone: Genera una nueva ruta para la m?quina a la que nos queremos conectar bas?ndose en la ruta actual. Este tipo de ruta se utiliza normalmente en redes locales.               |
+-----+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| W   | WasCloned: Indica una ruta que se auto-configur? bas?ndose en una ruta de red de ?rea local con etiqueta Clone.                                                                   |
+-----+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| L   | Link: Esta ruta pos?e referencias a hardware de Ethernet.                                                                                                                         |
+-----+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

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

29.2.2. Rutas por defecto
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Cuando el sistema local necesita realizar una conexi?n con una m?quina
remota se examina la tabla de rutas para determinar si se conoce alg?n
camino para llegar al destino. Si la m?quina remota pertenece a una
subred que sabemos c?mo alcanzar (rutas clonadas) entonces el sistema
comprueba si se puede conectar utilizando dicho camino.

Si todos los caminos conocidos fallan al sistema le queda una ?nica
opci?n: la “ruta por defecto”. Esta ruta est? constitu?da por un tipo
especial de pasarela (normalmente el ?nico “router” presente en la red
?rea local) y siempre pos?e el “flag” ``c`` en el campo de “flags”. En
una LAN, la pasarela es la m?quina que pos?e conectividad con el resto
de las redes (sea a trav?s de un enlace PPP, DSL, cable modem, T1 u otra
interfaz de red.)

Si se configura la ruta por defecto en una m?quina que est? actuando
como pasarela hacia el mundo exterior la ruta por defecto ser? el
“router” que se encuentre en posesi?n del proveedor de servicios de
internet (ISP).

Vamos a examinar un ejemplo que utiliza rutas por defecto. A
continuaci?n se muestra una configuraci?n bastante com?n:

.. raw:: html

   <div class="mediaobject">

|image0|

.. raw:: html

   </div>

Las m?quinas ``Local1`` y ``Local2`` se encuentran en nuestro sitio u
organizaci?n. ``Local1`` se conecta con un ISP a trav?s de una conexi?n
de modem PPP. El servidor PPP del ISP se conecta a trav?s de una red de
?rea local a otra pasarela utilizando una interfaz externa.

Las rutas por defecto para cada una de las m?quinas son las siguientes:

.. raw:: html

   <div class="informaltable">

+----------+-------------------+-------------+
| Host     | Default Gateway   | Interface   |
+==========+===================+=============+
| Local2   | Local1            | Ethernet    |
+----------+-------------------+-------------+
| Local1   | T1-GW             | PPP         |
+----------+-------------------+-------------+

.. raw:: html

   </div>

Una pregunta bastante frecuente es “?Por qu? (o c?mo) hacer que la
m?quina ``T1-GW`` sea el ‘router’ por defecto para ``Local1`` en vez de
que sea el servidor del ISP al cual se est? conectando?”.

Recordemos que, como la interfaz PPP est? utilizando una direcci?n de la
red local del ISP en nuestro lado de la las rutas para cualquier otra
m?quina en la red local del proveedor se generar?n de forma autom?tica.
De este ya sabemos el modo de alcanzar la m?quina ``T1-GW``, de tal
forma que no se necesita un paso intermedio para enviar tr?fico al
servidor del ISP.

Es frecuente utilizar la direcci?n ``X.X.X.1`` como la direcci?n de la
pasarela en la red local. Siguiendo con el ejemplo anterior, si nuestro
espacio de direccionamiento local fuera la clase C ``10.20.30`` y
nuestro ISP estuviera utilizando ``10.9.9`` las rutas por defecto
ser?an:

.. raw:: html

   <div class="informaltable">

+----------------------------------+-----------------------+
| Host                             | Default Route         |
+==================================+=======================+
| Local2 (10.20.30.2)              | Local1 (10.20.30.1)   |
+----------------------------------+-----------------------+
| Local1 (10.20.30.1, 10.9.9.30)   | T1-GW (10.9.9.1)      |
+----------------------------------+-----------------------+

.. raw:: html

   </div>

Se puede especificar f?cilmente la entrada de la ruta por defecto
utilizando el fichero ``/etc/rc.conf``. En nuestro ejemplo en la m?quina
``Local2``, se a?adi? la siguiente l?nea en dicho fichero:

.. code:: programlisting

    defaultrouter="10.20.30.1"

Tambi?n se puede hacer directamente desde la l?nea de ?rdenes mediante
`route(8) <http://www.FreeBSD.org/cgi/man.cgi?query=route&sektion=8>`__:

.. code:: screen

    # route add default 10.20.30.1

Para obtener m?s informaci?n sobre la manipulaci?n de tablas de rutas se
ruega consultar la p?gina de manual
`route(8) <http://www.FreeBSD.org/cgi/man.cgi?query=route&sektion=8>`__.

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

29.2.3. M?quinas con doble pertenencia (Dual Homed Hosts)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Existe otro tipo de configuraci?n que debemos describir y que se produce
cuando una m?quina se sit?a en dos redes distintas al mismo tiempo.
T?cnicamente hablando cualquier m?quina que act?a como pasarela (en el
caso anterior utilizando un enlace de PPP) pertenece al tipo de m?quinas
con doble pertenencia, pero normalmente el t?rmino s?lo se aplica para
describir m?quinas que se encuentran directamente conectadas con dos
redes de ?rea local.

En un caso la m?quina pos?e dos tarjetas de red Ethernet, cada una de
ellas con una direcci?n de red independiente. En otro caso la m?quina
puede tener s?lo una tarjeta de red, pero utilizar “ aliasing”
(`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8>`__).
El primer caso se utiliza cuando se necesita usar dos redes Ethernet al
mismo tiempo mientras que el segundo caso se utiliza cuando se dispone
de un ?nico segmento de red f?sico pero se han definido dos redes
l?gicas distintas

En cualquier caso la tabla de rutas se construye de tal forma que cada
subred sepa que la m?quina es la pasarela definida definida (“inbound
route”) para la otra subred. ?sta configuraci?n en la que la m?quina
act?a como “router” entre las dos subredes se usa a menudo cuando
queremos implementar filtrado de paquetes o cortafuegos seguridad en un
sentido o en ambos.

Si queremos que dicha m?quina encamine paquetes entre las dos interfaces
es necesario decirle a FreeBSD que active dicha funcionalidad. En la
siguiente secci?n se explica c?mo hacerlo.

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

29.2.4. Construcci?n de un “route”
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Un “router” de red, tambi?n llamado pasarela o “route”, es simplemente
un sistema que reenv?a paquetes desde un interfaz hacia otro interfaz.
Los est?ndares Internet y el sentido com?n aplicado a la ingenier?a de
redes impiden que FreeBSD incluya por defecto ?sta caracter?stica. Se
puede activar cambiando a ``YES`` el valor de la siguiente variable en
el fichero
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5>`__:

.. code:: programlisting

    gateway_enable=YES          # Set to YES if this host will be a gateway

Esta opci?n modificar? la variable de
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
``net.inet.ip.forwarding`` al valor ``1``. Si en alg?n momento se
necesita detener el “router” de forma temporal basta con asignar a dicha
variable el valor ``0``. Consulte
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
para m?s detalles.

Nuestro reci?n activado “router” necesita rutas para saber a d?nde debe
enviar el tr?fico recibido. Si nuestra red es ?a se pueden definir rutas
est?ticas. FreeBSD incluye por defecto el d?mon de encaminamiento BSD,
`routed(8) <http://www.FreeBSD.org/cgi/man.cgi?query=routed&sektion=8>`__,
que admite RIP (versi?n 1 y versi?n 2) e IRDP. El paquete
`net/zebra <http://www.freebsd.org/cgi/url.cgi?ports/net/zebra/pkg-descr>`__
le permitir? usar otros protocolos de encaminamiento din?mico como BGP
v4, OSPF v2 y muchos otros. En caso de necesitar caracter?sticas
avanzadas de gesti?n puede usted recurrir a productos comerciales como
GateD?.

Incluso cuando FreeBSD se configura del modo descrito no se cumple
completamente con los est?ndares de Internet respecto a los “routers”.
Bastar? no obstante para poder usarse.

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

29.2.5. Configuraci?n de rutas est?ticas
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div>

Escrito porAl Hoang.

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

29.2.5.1. Configuraci?n manual
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Vamos a suponer que tenemos la siguiente topolog?a de red:

.. code:: literallayout

        INTERNET
          | (10.0.0.1/24) Router por defecto para Internet
          |
          |Interfaz xl0
          |10.0.0.10/24
       +------+
       |      | RouterA
       |      | (pasarela FreeBSD)
       +------+
          | Interfaz xl1
          | 192.168.1.1/24
          |
      +--------------------------------+
       Red Interna 1       | 192.168.1.2/24
                           |
                       +------+
                       |      | RouterB
                       |      |
                       +------+
                           | 192.168.2.1/24
                           |
                         Red Interna 2
        

En este escenario ``RouterA`` es nuestra m?quina FreeBSD que act?a como
pasarela para acceder al resto de internet. Tiene una ruta por defecto
que apunta a ``10.0.0.1`` que le permite conectarse con el mundo
exterior. Vamos a suponer tambi?n que ``RouterB`` se encuentra
configurado de forma adecuada que sabe c?mo llegar a cualquier sitio que
necesite. Esto es sencillo viendo nuestra topolog?a de red, basta con
a?adir una ruta por defecto en la m?quina ``RouterB`` utilizando
``192.168.1.1`` como “router”.

Si observamos la tabla de rutas de ``RouterA`` veremos algo como lo
siguiente:

.. code:: screen

    % netstat -nr
    Routing tables

    Internet:
    Destination        Gateway            Flags    Refs      Use  Netif  Expire
    default            10.0.0.1           UGS         0    49378    xl0
    127.0.0.1          127.0.0.1          UH          0        6    lo0
    10.0.0/24          link#1             UC          0        0    xl0
    192.168.1/24       link#2             UC          0        0    xl1

Con la tabla de rutas actual ``RouterA`` no es capaz de alcanzar la red
interna 2. Esto es as? porque no posee ninguna ruta para la red
``192.168.2.0/24``. Una forma de mitigar esto es a?adir de forma manual
la ruta que falta. La siguiente orden a?ade la red interna 2 a la tabla
de rutas de la m?quina ``RouterA`` utilizando ``192.168.1.2`` como
siguiente salto:

.. code:: screen

    # route add -net 192.168.2.0/24 192.168.1.2

Ahora ``RouterA`` puede alcanzar cualquier m?quina en la red
``192.168.2.0/24``.

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

29.2.5.2. C?mo hacer la configuraci?n persistente
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El ejemplo anterior es perfecto en tanto que resuelve el problema de
encaminamiento entre redes pero existe un problema. La informaci?n de
encaminamiento desaparecer? si se reinicia la m?quina. La forma de
evitarlo es a?adir las rutas est?ticas a ``/etc/rc.conf``:

.. code:: programlisting

    # A?ade la red interna 2 como una ruta est?tica
    static_routes="redinterna2"
    route_internalnet2="-net 192.168.2.0/24 192.168.1.2"

La variable de configuraci?n ``static_routes`` es una lista de cadenas
separadas por espacios. Cada cadena identifica un nombre para la ruta
que se desea definir. En el ejemplo anterior s?lamente se dispone de una
cadena dentro de la variable ``static_routes``. Esta cadena es
*``redinterna2``*. A continuaci?n se a?ade otra variable de
configuraci?n denominada ``route_redinterna2`` donde se escriben todos
los par?metros de configuraci?n que normalmente utilizar?amos
normalmente utilizar?amos con
`route(8) <http://www.FreeBSD.org/cgi/man.cgi?query=route&sektion=8>`__.
En el ejemplo que estamos comentando se utilizar?a la siguiente orden:

.. code:: screen

    # route add -net 192.168.2.0/24 192.168.1.2

De tal forma que la variable deber?a contener
``"-net 192.168.2.0/24 192.168.1.2"``.

Como ya se ha comentado anteriormente podemos especificar m?s de una
cadena en la variable ``static_routes``. Esto nos permite crear varias
rutas est?ticas. Las siguientes l?nas muestran un ejemplo donde se
a?aden rutas est?ticas para las redes ``192.168.0.0/24`` y
``192.168.1.0/24`` en un “router”imaginario:

.. code:: programlisting

    static_routes="red1 red2"
    route_red1="-net 192.168.0.0/24 192.168.0.1"
    route_red2="-net 192.168.1.0/24 192.168.1.1"

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

29.2.6. Propagaci?n de rutas
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Ya hemos comentado c?mo se definen las rutas para el mundo exterior pero
no hemos comentado nada sobre c?mo haremos que el mundo exterior nos
encuentre a nosotros.

Tambi?n hemos aprendido que las tablas de rutas se pueden constru?r de
tal forma que un grupo de tr?fico (perteneciente a un espacio de
direcciones determinado) se reenv?e a una m?quina espec?fica de la red,
que se encargar? de reenviar los paquetes hacia adentro.

Cuando se obtiene un espacio de direcciones para la organizaci?n el
proveedor de servicios modifica sus tablas de rutas para que todo el
tr?fico para nuestra subred se encamine a trav?s del enlace PPP hasta
alcanzarnos. Pero ?c?mo conocen las organizaciones dispersas a trav?s
del pa?s que deben enviar los paquetes dirigidos a nosotros hacia
nuestro ISP?

Existe un sistema (muy similar al sistema de nombres de dominio, DNS)
que se encarga de controlar todos los espacios de direcciones que se
encuentran actualmente repartidos y que adem?s define sus puntos de
conexi?n con el “backbone” de internet. El “backbone” est? formado por
las principales l?neas de de comunicacion que se encargan de transportar
el tr?fico de internet a trav?s del pa?s y del mundo entero. Cada
m?quina del “backbone” dispone de una copia de un conjunto maestro de
tablas de rutas gracias a las cuales pueden dirigir el tr?fico para una
red particular hacia una determinada red de transporte de dicho
“backbone”. Una vez en la red de transporte adecuada el tr?fico se
encamina a trav?s de un n?mero indeterminado de redes de proveedores de
servicio hasta que se alcanza la red de destino final.

Una de las tareas que debe realizar el proveedor de servicio servicio
consiste en anunciarse a las organizaciones del consiste en anunciarse a
las organizaciones del “backbone” como el punto de conexi?n principal (y
por tanto como el camino de entrada) para alcanzar las redes de sus
clientes. Este proceso se denomina propagaci?n de rutas.

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

29.2.7. Soluci?n de problemas
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

En algunas ocasiones surgen problemas con la propagaci?n de las rutas y
algunas organizaciones son incapaces de conectarse con nuestra subred.
Quiz? la orden m?s ?til para averiguar d?nde se est? interrumpiendo el
sistema de encaminamiento sea
`traceroute(8) <http://www.FreeBSD.org/cgi/man.cgi?query=traceroute&sektion=8>`__.
Se puede usar tambi?n cuando somos nosotros los que no podemos alcanzar
alguna red externa (por ejemplo cuando
`ping(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ping&sektion=8>`__
falla).

`traceroute(8) <http://www.FreeBSD.org/cgi/man.cgi?query=traceroute&sektion=8>`__
se ejecuta pasandole como par?metro el nombre de la m?quina remota a la
que nos queremos conectar. Esta orden muestra por pantalla l?s m?quinas
que act?an de pasarela a lo largo del camino. El proceso termina bien
porque se alcanza el destino o bien porque alg?n “router” intermedio no
puede conectarse con el siguiente salto, o lo desconoce.

Si quiere saber m?s sobre esto consulte la p?gina man de
`traceroute(8) <http://www.FreeBSD.org/cgi/man.cgi?query=traceroute&sektion=8>`__.

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

29.2.8. Rutas multicast
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD soporta tanto aplicaciones multicast como encaminamiento
multicast de forma nativa. Las aplicaciones multicast no necesitan
ninguna configuraci?n especial en FreeBSD; estas aplicaciones se
ejecutan tal cual. El encaminamiento multicast necesita para ser usado
que se compile dicho soporte en el n?cleo de FreeBSD:

.. code:: programlisting

    options MROUTING

Se debe configurar adem?s el d?mon de encaminamiento multicast,
`mrouted(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mrouted&sektion=8>`__,
para establecer t?neles y ejecutar DVMRP utilizando
``/etc/mrouted.conf``. Se pueden encontrar m?s detalles sobre c?mo
realizar una configuraci?n de multicast en
`mrouted(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mrouted&sektion=8>`__.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------------+----------------------------------------+--------------------------------------------+
| `Anterior <advanced-networking.html>`__?   | `Subir <advanced-networking.html>`__   | ?\ `Siguiente <network-wireless.html>`__   |
+--------------------------------------------+----------------------------------------+--------------------------------------------+
| Cap?tulo 29. Networking avanzado?          | `Inicio <index.html>`__                | ?29.3. Redes sin cables (“wireless”)       |
+--------------------------------------------+----------------------------------------+--------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.

.. |image0| image:: advanced-networking/net-routing.png
