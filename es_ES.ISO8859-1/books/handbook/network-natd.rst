=======================================
29.13. Traducci?n de direcciones de red
=======================================

.. raw:: html

   <div class="navheader">

29.13. Traducci?n de direcciones de red
`Anterior <network-ntp.html>`__?
Cap?tulo 29. Networking avanzado
?\ `Siguiente <network-inetd.html>`__

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

29.13. Traducci?n de direcciones de red
---------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Escrito por Chern Lee.

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

29.13.1. Overview
~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El d?mon de FreeBSD que se encarga de traducir direcciones de red, m?s
conocido como
`natd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=natd&sektion=8>`__,
es un d?mon que acepta paquetes IP, modifica la direcci?n IP fuente de
dichos paquetes y los reinyecta en el flujo de paquetes IP de salida.
`natd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=natd&sektion=8>`__
ejecuta este proceso modificando la direcci?n de origen y el puerto de
tal forma que cuando se reciben paquetes de contestaci?n
`natd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=natd&sektion=8>`__ es
capaz de determinar el destino real y reenviar el paquete a dicho
destino.

El uso m?s com?n de NAT es para Compartir la Conexi?n a Internet.

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

29.13.2. Configuraci?n
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Debido al peque?o espacio de direccionamiento que se encuentra
actualmente disponible en IPv4 y debido tambi?n al gran aumento que se
est? produciendo en cuanto a n?mero de usuarios de l?neas de conexi?n a
Internet de alta velocidad como cable o DSL la gente necesita utilizar
cada vez m?s la salida de Compartici?n de Conexi?n a Internet. La
caracter?stica de poder conectar varios computadores a trav?s de una
?nica conexi?n y una ?nica direcci?n IP hacen de
`natd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=natd&sektion=8>`__
una elecci?n razonable.

Cada vez con m?s frecuencia un usuario t?pico dispone de una m?quina
conectada mediante cable o DSL pero desear?a utilizar dicha m?quina como
un “ router” de acceso para el resto de los ordenadores de su red de
?rea local.

Para poder hacerlo la m?quina (FreeBSD por supuesto) debe configurarse
para actuar como pasarela. Debe tener al menos dos tarjetas de red, una
para conectarse a la red de ?rea local y la otra para conectarse con el
“router” de acceso a Internet. Todas las m?quinas de la LAN se conectan
entre s? mediante un “hub” o un “ switch”.

.. raw:: html

   <div class="mediaobject">

|Topolog?a de la Red|

.. raw:: html

   </div>

Una configuraci?n como esta se utiliza frecuentemente para compartir el
acceso a Internet. Una de las m?quinas de la LAN est? realmente
conectada a Internet. El resto de las m?quinas acceden a Internet
utilizando como “pasarela” la m?quina inicial.

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

29.13.3. Configuraci?n
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Se deben a?adir las siguientes opciones al fichero de configuraci?n del
n?cleo:

.. code:: programlisting

    options IPFIREWALL
    options IPDIVERT

Adem?s, seg?n se prefiera, se pueden a?adir tambi?n las siguientes:

.. code:: programlisting

    options IPFIREWALL_DEFAULT_TO_ACCEPT
    options IPFIREWALL_VERBOSE

Lo que viene a continuaci?n se tiene que definir en ``/etc/rc.conf``:

.. code:: programlisting

    gateway_enable="YES"
    firewall_enable="YES"
    firewall_type="OPEN"
    natd_enable="YES"
    natd_interface="fxp0"
    natd_flags=""

.. raw:: html

   <div class="informaltable">

+--------------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| gateway\_enable="YES"    | Configura la m?quina para que act?e como “router” o pasarela de red. Se puede conseguir lo mismo ejecutando ``sysctl net.inet.ip.forwarding=1``.                                                                                |
+--------------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| firewall\_enable="YES"   | Activa las reglas de cortafuegos que se encuentran definidas por defecto en ``/etc/rc.firewall`` y que entran en funcionamiento en el arranque del sistema.                                                                     |
+--------------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| firewall\_type="OPEN"    | Especifica un conjunto de reglas de cortafuegos que permite el acceso a todos los paquetes que se reciban. Consulte ``/etc/rc.firewall`` para obtener informaci?n sobre el resto de tipos de reglas que se pueden configurar.   |
+--------------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| natd\_interface="fxp0"   | Indica qu? interfaz se utiliza para reenviar paquetes (la interfaz que se conecta a Internet).                                                                                                                                  |
+--------------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| natd\_flags=""           | Define cualesquiera otras opciones que se deseen proporcionar a `natd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=natd&sektion=8>`__ en tiempo de arranque.                                                                    |
+--------------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

Si se definen las opciones anteriores, en el arranque del sistema el
fichero ``/etc/rc.conf`` configurar? las variables de tal forma que se
ejecutar?a ``natd -interface fxp0``. Evidentemente esta orden tambi?n se
puede ejecutar de forma manual.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Tambi?n es posible utilizar un fichero de configuraci?n para
`natd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=natd&sektion=8>`__ en
caso de que deseemos especificar muchos par?metros de arranque.
Tendremos que declarar la ubicaci?n del fichero de configuraci?n
mediante la inclusi?n de lo siguiente en ``/etc/rc.conf``:

.. code:: programlisting

    natd_flags="-f /etc/natd.conf"

El fichero ``/etc/natd.conf`` debe contener una lista de opciones de
configuraci?n una opci?n por l?nea. Por ejemplo, en el caso que se
comenta en la siguiente secci?n se utilizar?a un fichero de
configuraci?n con la siguiente informaci?n:

.. code:: programlisting

    redirect_port tcp 192.168.0.2:6667 6667
    redirect_port tcp 192.168.0.3:80 80

Para obtener m?s informaci?n sobre el fichero de configuraci?n se puede
consultar la opci?n ``-f`` que se describe en la p?gina del manual de
`natd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=natd&sektion=8>`__.

.. raw:: html

   </div>

Cada m?quina (y cada interfaz) que se encuentra conectada a la LAN debe
poseer una direcci?n IP perteneciente al espacio de direcciones IP
privado tal y como se define en `RFC
1918 <ftp://ftp.isi.edu/in-notes/rfc1918.txt>`__ y debe poseer como
pasarela por defecto la direcci?n IP de la interfaz interna (la interfaz
que se conecta a la LAN) de la m?quina que ejecuta natd.

Por ejemplo los clientes ``A`` y ``B`` se encuentran en la LAN
utilizando las direcciones IP ``?192.168.0.2`` y ``192.168.0.3``,
respectivamente. La m?quina que ejecuta natd posee la direcci?n IP
``192.168.0.1`` en la interfaz que se conecta a la LAN. El “router” por
defecto tanto de ``A`` omo de ``B`` se establece al valor
``192.168.0.1``. La interfaz externa de la m?quina que ejecuta natd, la
interfaz que se conecta con Internet, no necesita de ninguna especial en
relaci?n con el tema que estamos tratando en esta secci?n.

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

29.13.4. Redirecci?n de puertos
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El incoveniente que se presenta con la utilizaci?n de
`natd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=natd&sektion=8>`__ es
que los clientes de la LAN no son accesibles desde Internet. Dichos
clientes pueden establecer conexiones con el exterior pero no pueden
recibir intentos de conexi?n desde pueden recibir intentos de conexion
desde Internet. Esto supone un gran problema cuando se quieren ejecutar
servicios de acceso global en una o varias m?quinas de la red LAN. Una
forma sencilla de solucionar parcialmente este problemma consiste en
redirigir determinados puertos en el servidor natd hacia determinadas
m?quinas de la LAN.

Supongamos por ejemplo que en ``A`` se ejecuta un servidor de IRC y que
en ``B`` se ejecuta un servidor web. Para que funcione lo que hemos
comentado anteriormente se tienen que redirigir las conexiones recibidas
en los puertos 6667 (IRC) y 80 (web) a dichas m?quinas, respectivamente.

Se debe pasar la opci?n ``-redirect_port`` a
`natd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=natd&sektion=8>`__
con los valores apropiados. La sintaxis es como sigue:

.. code:: programlisting

      -redirect_port proto IPdestino:PUERTOdestino[-PUERTOdestino]
                     [aliasIP:]aliasPUERTO[-aliasPUERTO]
             [IPremota[:PUERTOremoto[-PUERTOremoto]]]

Continuando con el ejemplo anterior los valores ser?an:

.. code:: programlisting

        -redirect_port tcp 192.168.0.2:6667 6667
        -redirect_port tcp 192.168.0.3:80 80

Esto redirigir? los puertos *tcp* adecuados a las m?quinas situadas en
la LAN.

La opci?n ``-redirect_port`` se puede utilizar para indicar rangos de
puertos en vez de puertos individuales. Por ejemplo,
*``tcp         192.168.0.2:2000-3000 2000-3000``* redirige todas las
conexiones recibidas desde los puertos 2000 al 3000 a los puertos
puertos 2000 a 3000 de la m?quina ``A``.

Estas opciones se pueden utilizar cuando se ejecute directamente
`natd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=natd&sektion=8>`__ se
pueden situar en la variable ``natd_flags=""`` en ``/etc/rc.conf`` y
tambi?n se pueden pasar mediante un archivo de configuraci?n.

Para obtener m?s informaci?n sobre opciones de configuraci?n por favor
consulte
`natd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=natd&sektion=8>`__

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

29.13.5. Redirecci?n de direcciones
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

La redirecci?n de direcciones es una caracter?stica ?til si se dispone
de varias direcciones IP pero todas ellas se ubican en una ?nica
m?quina. Gracias a esto
`natd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=natd&sektion=8>`__
puede asignar a cada cliente de la red LAN su propia direcci?n IP
externa.
`natd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=natd&sektion=8>`__
reescribe los paquetes que salen de la red LAN con la direcci?n IP
externa adecuada y redirige todo el tr?fico recibido de vuelta al
cliente en funci?n de la direcci?n IP de destino: esto se conoce como
NAT est?tico. Por ejemplo las direcciones IP ``128.1.1.1``,
``128.1.1.2`` y ``128.1.1.3`` pertenecen al “ router” natd.
``128.1.1.1`` se puede utilizar como la direcci?n IP externa del natd,
mientras que ``128.1.1.2`` y ``128.1.1.3`` se redirigen a los clientes
``A`` y ``B``, respectivamente.

La sintaxis de la opci?n ``-redirect_address`` es la siguiente:

.. code:: programlisting

    -redirect_address IPlocal IPp?blica

.. raw:: html

   <div class="informaltable">

+-------------+------------------------------------------------------------------------------------+
| IPlocal     | La direcci?n IP interna del cliente de la LAN.                                     |
+-------------+------------------------------------------------------------------------------------+
| IPp?blica   | La direcci?n IP externa que se corresponde con un determinado cliente de la LAN.   |
+-------------+------------------------------------------------------------------------------------+

.. raw:: html

   </div>

En nuestro ejemplo esta opci?n se especificar?a de la siguiente forma:

.. code:: programlisting

    -redirect_address 192.168.0.2 128.1.1.2
    -redirect_address 192.168.0.3 128.1.1.3

De forma semejante a la opci?n ``-redirect_port`` estos argumentos se
pueden especificar directamente sobre la variable ``natd_flags=""`` del
fichero ``/etc/rc.conf`` o tambi?n se pueden pasar v?a archivo de
configuraci?n de natd. Si se utiliza redirecci?n de direcciones ya no es
necesario utilizar redirecci?n de puertos ya que todos los paquetes que
se reciben en una determinada direcci?n IP son redirigidos a la m?quina
especificada.

Las direcciones IP externas de la m?quina que ejecuta natd se deben
activar y deben formar parte de un alias configurado sobre la interfaz
externa que se conecta a Internet. Consulte
`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5>`__
para aprender a hacerlo.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------+----------------------------------------+-----------------------------------------+
| `Anterior <network-ntp.html>`__?   | `Subir <advanced-networking.html>`__   | ?\ `Siguiente <network-inetd.html>`__   |
+------------------------------------+----------------------------------------+-----------------------------------------+
| 29.12. NTP?                        | `Inicio <index.html>`__                | ?29.14. El “Superservidor” inetd        |
+------------------------------------+----------------------------------------+-----------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.

.. |Topolog?a de la Red| image:: advanced-networking/natd.png
