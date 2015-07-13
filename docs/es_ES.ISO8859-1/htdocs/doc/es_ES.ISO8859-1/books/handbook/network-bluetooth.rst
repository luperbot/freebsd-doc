===============
29.4. Bluetooth
===============

.. raw:: html

   <div class="navheader">

29.4. Bluetooth
`Anterior <network-wireless.html>`__?
Cap?tulo 29. Networking avanzado
?\ `Siguiente <network-bridging.html>`__

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

29.4. Bluetooth
---------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Escrito por Pav Lucistnik.

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

29.4.1. Introducci?n
~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Bluetooth es una tecnolog?a inal?mbrica que opera en banda de 2.4 GHz
(donde no se necesita licencia). Se trata de una tecnolog?a pensada para
la creaci?n de redes de ?mbito personal (de cobertura reducida,
normalmente de unos 10 metros). Las redes se suelen construir en modo
“ad-hoc” utilizando dispositivos heterog?neos como tel?fonos m?viles,
dispositivos manuales (“handhelds”) y computadoras port?tiles. A
diferencia de otras tecnolog?as inal?mbricas como Wi-Fi, Bluetooth
ofrece perfiles de servicio m?s detallados; por ejemplo un perfil para
actuar como un servidor de ficheros basado en FTP, para la difusi?n de
ficheros (“file pushing”), para el transporte de voz, para la emulaci?n
de l?nea serie y muchos m?s.

La pila de Bluetooth en FreeBSD se implementa utilizando el entorno de
Netgraph (v?ase
`netgraph(4) <http://www.FreeBSD.org/cgi/man.cgi?query=netgraph&sektion=4>`__).
La mayor?a de los dispositivos USB Bluetooth se pueden utilizar mediante
el controlador
`ng\_ubt(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_ubt&sektion=4>`__.
Los dispositivos Bluetooth basados en el chip Broadcom BCM2033 est?n
soportados mediante los controladores
`ubtbcmfw(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ubtbcmfw&sektion=4>`__
y
`ng\_bt3c(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_bt3c&sektion=4>`__.
Los dispositivos Bluetooth basados en la interfaz serie o de Rayos
Infrarrojos (UART) se controlan mediante
`sio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sio&sektion=4>`__,
`ng\_h4(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_h4&sektion=4>`__
y
`hcseriald(8) <http://www.FreeBSD.org/cgi/man.cgi?query=hcseriald&sektion=8>`__.
Este cap?tulo describe el uso de dispositivos Bluetooth USB. El soporte
para Bluetooth se encuentra en las versiones de FreeBSD 5.0 y
posteriores.

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

29.4.2. Instalaci?n del dispositivo
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Por defecto los controladores de los dispositivos Bluetooth se
encuentran disponibles como m?dulos del kernel. Antes de enchufar el
dispositivo Bluetooth se debe cargar el m?dulo correspondiente dentro
del n?cleo.

.. code:: screen

    # kldload ng_ubt

Si el dispositivo Bluetooth se encuentra conectado cuando el sistema
arranca se debe cargar el m?dulo modificando a tal efecto el fichero
``/boot/loader.conf``.

.. code:: programlisting

    ng_ubt_load="YES"

Al conectar el dispositivo Bluetooth aparecer? en la consola (o en
syslog) la siguiente informaci?n:

.. code:: screen

    ubt0: vendor 0x0a12 product 0x0001, rev 1.10/5.25, addr 2
    ubt0: Interface 0 endpoints: interrupt=0x81, bulk-in=0x82, bulk-out=0x2
    ubt0: Interface 1 (alt.config 5) endpoints: isoc-in=0x83, isoc-out=0x3,
          wMaxPacketSize=49, nframes=6, buffer size=294

Se debe copiar ``/usr/share/examples/netgraph/bluetooth/rc.bluetooth`` a
alg?n lugar m?s conveniente, por ejemplo ``/etc/rc.bluetooth``. Este
script se usa para ejecutar y detener la pila Bluetooth del sistema. Se
suele recomendar quitar la pila antes de desenchufar el dispositivo pero
si no se hace no deber?a producirse ning?n desastre. Cuando se arranca
la pila aparece un mensaje similar a este:

.. code:: screen

    # /etc/rc.bluetooth start ubt0
    BD_ADDR: 00:02:72:00:d4:1a
    Features: 0xff 0xff 0xf 00 00 00 00 00
    <3-Slot> <5-Slot> <Encryption> <Slot offset>
    <Timing accuracy> <Switch> <Hold mode> <Sniff mode>
    <Park mode> <RSSI> <Channel quality> <SCO link>
    <HV2 packets> <HV3 packets> <u-law log> <A-law log> <CVSD>
    <Paging scheme> <Power control> <Transparent SCO data>
    Max. ACL packet size: 192 bytes
    Number of ACL packets: 8
    Max. SCO packet size: 64 bytes
    Number of SCO packets: 8

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

29.4.3. Interfaz de la controladora de la m?quina (HCI)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

La interfaz de la Controladora de la M?quina (Host Controller Interface)
proporciona una interfaz de ?rdenes para la controladora de banda base y
para el gestor de enlace, y permite acceder al estado del hardware y a
los registros de control. Esta interfaz proporciona una capa de acceso
homog?nea para todos los dispositivos Bluetooth de banda base. La capa
HCI de la m?quina intercambia ?rdenes y datos con el firmware del HCI
presente en el dispositivo Bluetooth. El driver de la capa de transporte
de la controladora de la m?quina (es decir, el driver del bus f?sico)
proporciona ambas capas de HCI la posibilidad de intercambiar
informaci?n entre ellas.

Se crea un nodo Netgraph de tipo *HCI* para cada dispositivo Bluetooth.
El nodo Netgraph HCI se conecta normalmente con el nodo que representa
el controlador del dispositivo Bluetooth de la m?quina (sentido de
bajada) y con el nodo Netgraph L2CAP en el sentido de subida. Todas las
operaciones HCI se realizan sobre el nodo Netgraph HCI y no sobre el el
nodo que representa al dispositivo. El nombre por defecto para el nodo
HCI es “devicehci”. Para obtener m?s detalles, por favor consulte la
p?gina del manual de
`ng\_hci(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_hci&sektion=4>`__.

Una de las tareas m?s importantes que se deben realizar es el
descubrimiento autom?tico de otros dispositivos Bluetooth que se
encuentren dentro del radio de cobertura. Esta operaci?n se denomina en
ingl?s *inquiry* (consulta). Esta operaci?n o otras operaciones HCI
relacionadas se realizan mediante la utilidad
`hccontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=hccontrol&sektion=8>`__.
El siguiente ejemplo muestra c?mo descubrir dispositivos en pocos
segundos. Tenga siempre presente que un dispositivo remoto s?lo contesta
a la consulta si se encuentra configurado en modo descubrimiento
(*discoverable mode*).

.. code:: screen

    % hccontrol -n ubt0hci inquiry
    Inquiry result, num_responses=1
    Inquiry result #0
           BD_ADDR: 00:80:37:29:19:a4
           Page Scan Rep. Mode: 0x1
           Page Scan Period Mode: 00
           Page Scan Mode: 00
           Class: 52:02:04
           Clock offset: 0x78ef
    Inquiry complete. Status: No error [00]

``BD_ADDR`` es la direcci?n identificativa ?nica del dispositivo
Bluetooth, similar a las direcciones MAC de las tarjetas Ethernet. Esta
direcci?n se necesita para transmitir otro tipo de informaci?n a otros
dispositivos. Se puede asignar un nombre m?s significativo para los
humanos en la variable BD\_ADDR. El fichero ``/etc/bluetooth/hosts``
contiene informaci?n relativa a los dispositivos Bluetooth conocidos. El
siguiente ejemplo muestra c?mo obtener un nombre significativo para los
humanos que fu? asignado a un dispositivo remoto:

.. code:: screen

    % hccontrol -n ubt0hci remote_name_request 00:80:37:29:19:a4
    BD_ADDR: 00:80:37:29:19:a4
    Name: Pav's T39

Si se realiza una consulta (inquiry) sobre el dispositivo Bluetooth
remoto, dicho dispositivo identificar? nuestro computador como
“nombre.de.su.sistema (ubt0)”. El nombre asignado al dispositivo local
se puede modificar en cualquier momento.

El sistema Bluetooth proporciona una conexi?n punto a punto (con s?lo
dos unidades Bluetooth involucradas) o tambi?n una conexi?n punto
multipunto. En el ?ltimo caso, la conexi?n se comparte entre varios
dispositivos Bluetooth. El siguiente ejemplo muestra como obtener una
lista de las conexiones de banda base activas en el dispositivo local:

.. code:: screen

    % hccontrol -n ubt0hci read_connection_list
    Remote BD_ADDR    Handle Type Mode Role Encrypt Pending Queue State
    00:80:37:29:19:a4     41  ACL    0 MAST    NONE       0     0 OPEN

Resulta ?til disponer de un *manejador de la conexi?n* cuando se
necesita terminar la conexi?n de banda base. Es importante recalcar que
normalmente no es necesario realizar esta terminaci?n de forma manual.
La pila Bluetooth puede conclu?r autom?ticamente las conexiones de banda
base que se encuentren inactivas.

.. code:: screen

    # hccontrol -n ubt0hci disconnect 41
    Connection handle: 41
    Reason: Connection terminated by local host [0x16]

Se ruega consultar la salida de la orden ``hccontrol help`` para obtener
un listado completo de las ?rdenes HCI disponibles. La mayor?a de estas
?rdenes no requiren privilegios de superusuario.

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

29.4.4. Protocolo de adaptaci?n y de control de enlace a nivel l?gico (L2CAP)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El protocolo L2CAP (Logical Link Control and Adaptation Protocol)
proporciona servicios de datos tanto orientados a conexi?n como no
orientados a conexi?n a los protocolos de las capas superiores, junto
con facilidades de multiplexaci?n y de segmentacion y reensamblaje.
L2CAP permite que los protocolos de capas superiores puedan transmitir y
recibir paquetes de datos L2CAP de hasta 64 kilobytes de longitud.

L2CAP se basa en el concepto de *canales*. Un canal es una conexi?n
l?gica que se sit?a sobre la conexi?n de banda base. Cada canal se
asocia a un ?nico protocolo. Cada paquete L2CAP que se recibe a un canal
se redirige al protocolo superior correspondiente. Varios canales pueden
operar sobre la misma conexi?n de banda base, pero un canal no puede
tener asociados m?s de un protocolo de alto nivel.

Para cada dispositivo Bluetooth se cre un ?nico nodo Netgraph de tipo
*l2cap*. El nodo L2CAP se conecta normalmente conectado al nodo Netgraph
HCI (hacia abajo) y con nodos Bluetooth tipo “sockets” hacia arriba. El
nombre por defecto para el nodo Netgraph L2CAP es “devicel2cap”. Para
obtener m?s detalles se ruega consultar la p?gina del manual
`ng\_l2cap(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ng_l2cap&sektion=4>`__.

`l2ping(8) <http://www.FreeBSD.org/cgi/man.cgi?query=l2ping&sektion=8>`__
le ser? muy ?til para hacer ping a otros dispositivos. Algunas
implementaciones de Bluetooth no devuelven todos los datos que se
env?an, de tal forma que el valor *0 bytes* que se observa a
continuaci?n es normal:

.. code:: screen

    # l2ping -a 00:80:37:29:19:a4
    0 bytes from 0:80:37:29:19:a4 seq_no=0 time=48.633 ms result=0
    0 bytes from 0:80:37:29:19:a4 seq_no=1 time=37.551 ms result=0
    0 bytes from 0:80:37:29:19:a4 seq_no=2 time=28.324 ms result=0
    0 bytes from 0:80:37:29:19:a4 seq_no=3 time=46.150 ms result=0

La herramienta
`l2control(8) <http://www.FreeBSD.org/cgi/man.cgi?query=l2control&sektion=8>`__
se utiliza para realizar varias operaciones sobre los nodos L2CAP. Este
ejemplo muestra c?mo obtener la lista de conexiones l?gicas (canales) y
la lista de conexiones de banda base (f?sica) que mantiene el
dispositivo local:

.. code:: screen

    % l2control -a 00:02:72:00:d4:1a read_channel_list
    L2CAP channels:
    Remote BD_ADDR     SCID/ DCID   PSM  IMTU/ OMTU State
    00:07:e0:00:0b:ca    66/   64     3   132/  672 OPEN
    % l2control -a 00:02:72:00:d4:1a read_connection_list
    L2CAP connections:
    Remote BD_ADDR    Handle Flags Pending State
    00:07:e0:00:0b:ca     41 O           0 OPEN

Otra herramienta de diagn?stico interesante es
`btsockstat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=btsockstat&sektion=1>`__.
Realiza un trabajo similar a la orden
`netstat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=netstat&sektion=1>`__,
pero en este caso para las estructuras de datos relacionadas con el
sistema Bluetooth. A continuaci?n se muestra la informaci?n relativa a
la misma conexi?n l?gica del ejemplo anterior.

.. code:: screen

    % btsockstat
    Active L2CAP sockets
    PCB      Recv-Q Send-Q Local address/PSM       Foreign address   CID   State
    c2afe900      0      0 00:02:72:00:d4:1a/3     00:07:e0:00:0b:ca 66    OPEN
    Active RFCOMM sessions
    L2PCB    PCB      Flag MTU   Out-Q DLCs State
    c2afe900 c2b53380 1    127   0     Yes  OPEN
    Active RFCOMM sockets
    PCB      Recv-Q Send-Q Local address     Foreign address   Chan DLCI State
    c2e8bc80      0    250 00:02:72:00:d4:1a 00:07:e0:00:0b:ca 3    6    OPEN

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

29.4.5. Protocolo RFCOMM
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El protocolo RFCOMM proporciona emulaci?n de puertos serie a trav?s del
protocolo L2CAP. Este protocolo se basa en el est?ndar de la ETSI
denominado TS 07.10. RFCOMM es un protoclo de transporte sencillo, con
soporte para hasta 9 puertos serie RS-232 (EIATIA-232-E). El protocolo
RFCOMM permite hasta 60 conexiones simultaneas (canales RFCOMM) entre
dos dispositivos Bluetooth.

Para los prop?sitos de RFCOMM, un camino de comunicaci?n involucra
siempre a dos aplicaciones que se ejecutan en dos dispositivos distintos
(los extremos de la comunicaci?n). Entre ellos existe un segmento que
los comunica. RFCOMM pretende cubrir aquellas aplicaciones que utilizan
los puertos serie de las m?quinas donde se ejecutan. El segmento de
comunicaci?n es un enlace Bluetooth desde un dispositivo al otro
(conexi?n directa).

RFCOMM trata ?nicamente con la conexi?n de dispositivos directamente, y
tambi?n con conexiones entre el dispositivo y el modem para realizar
conexiones de red. RFCOMM puede soportar otras configuraciones, tales
como m?dulos que se comunican via Bluetooth por un lado y que
proporcionan una interfaz de red cableada por el otro.

En FreeBSD el protocolo RFCOMM se implementa utilizando la capa de
“sockets” de Bluetooth.

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

29.4.6. Enparejamiento de dispositivos
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Por defecto, la comunicaci?n Bluetooth no se valida, por lo que
cualquier dispositivo puede en principio hablar con cualquier otro. Un
dispositivo Bluetooth (por ejemplo un tel?fono celular) puede solicitar
autenticaci?n para realizar un determinado servicio (por ejemplo para el
servicio de marcaci?n por modem). La autenticaci?n de Bluetooth
normalmente se realiza utilizando *c?digos PIN*. Un c?digo PIN es una
cadena ASCII de hasta 16 caracteres de longitud. Los usuarios deben
introducir el mismo c?digo PIN en ambos dispositivos. Una vez que el
usuario ha introducido el PIN adecuado ambos dispositivos generan una
*clave de enlace*. Una vez generada, la clave se puede almacenar en el
propio dispositivo o en un dispositivo de almacenamiento externo. La
siguiente vez que se comuniquen ambos dispositivos se reutilizar? la
misma clave. El procedimiento descrito hasta este punto se denomina
*emparejamiento (pairing)*. Es importante recordar que si la clave de
enlace se pierde en alguno de los dispositivos involucrados se debe
volver a ejecutar el procedimiento de emparejamiento.

El d?mon
`hcsecd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=hcsecd&sektion=8>`__
se encarga de gestionar todas las peticiones de autenticaci?n Bluetooth.
El archivo de configuraci?n predeterminado se denomina
``/etc/bluetooth/hcsecd.conf``. A continuaci?n se muestra una secci?n de
ejemplo de un tel?fono celular con el c?digo PIN arbitrariamente fijado
al valor “1234”:

.. code:: programlisting

    device {
            bdaddr  00:80:37:29:19:a4;
            name    "Pav's T39";
            key     nokey;
            pin     "1234";
          }

No existe ninguna limitaci?n en los c?digos PIN a excepci?n de su
longitud. Algunos dispositivos (por ejemplo los dispositivos de mano
Bluetooth) pueden obligar a escribir un n?mero predeterminado de
caracteres para el c?digo PIN. La opci?n ``-d`` fuerza al d?mon
`hcsecd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=hcsecd&sektion=8>`__
a permanecer ejecut?dose en primer plano, de tal forma que se puede
observar f?cilmente lo que ocurre. Si se configura el dispositivo
Bluetooth remoto para aceptar el procedimiento de emparejamiento y se
inicia la conexi?n con dicho dispositivo, el dispositivo remoto deber?a
decir que el procedimiento de emparejamiento se ha aceptado y deber?a
solicitar el c?digo PIN. Si se introduce el mismo c?digo PIN que se
escribi? en su momento en el fichero ``hcsecd.conf`` el procedimiento de
emparejamiento y de generaci?n de la clave de enlace deber?a terminar
satisfactoriamente. Por otra parte el procedimiento de emparejamiento se
puede iniciar en el dispositivo remoto. A continuaci?n se muestra un
ejemplo de la salida del d?mon ``hcsecd``.

.. code:: programlisting

    hcsecd[16484]: Got Link_Key_Request event from 'ubt0hci', remote bdaddr 0:80:37:29:19:a4
    hcsecd[16484]: Found matching entry, remote bdaddr 0:80:37:29:19:a4, name 'Pav's T39', link key doesn't exist
    hcsecd[16484]: Sending Link_Key_Negative_Reply to 'ubt0hci' for remote bdaddr 0:80:37:29:19:a4
    hcsecd[16484]: Got PIN_Code_Request event from 'ubt0hci', remote bdaddr 0:80:37:29:19:a4
    hcsecd[16484]: Found matching entry, remote bdaddr 0:80:37:29:19:a4, name 'Pav's T39', PIN code exists
    hcsecd[16484]: Sending PIN_Code_Reply to 'ubt0hci' for remote bdaddr 0:80:37:29:19:a4

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

29.4.7. Protocolo de descubrimiento de servicios (SDP)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El Protocolo de Descubrimiento de Servicios (Service Discovery Protocol
o SDP) permite a las aplicaciones cliente descubrir la existencia de
diversos servicios proporcionados por uno o varios servidores de
aplicaciones, junto con los atributos y propiedades de los servicios que
se ofrecen. Estos atributos de servicio incluyen el tipo o clase de
servicio ofrecido y el mecanismo o la informaci?n necesaria para
utilizar dichos servicios.

SDP se basa en una determinada comunicaci?n entre un servidor SDP y un
cliente SDP. El servidor mantiene una lista de registros de servicios,
los cuales describen las caracter?sticas de los servicios ofrecidos.
Cada registro contiene informaci?n sobre un determinado servicio. Un
cliente puede recuperar la informaci?n de un registro de servicio
almacenado en un servidor SDP lanzando una petici?n SDP. Si el cliente o
la aplicaci?n asociada con el cliente decide utilizar un determinado
servicio, debe establecer una conexi?n independiente con el servicio en
cuesti?n. SDP proporciona un mecanismo para el descubrimiento de
servicios y sus atributos asociados, pero no proporciona ning?n
mecanismo ni protocolo para utilizar dichos servicios.

Normalmente, un cliente SDP realiza una b?squeda de servicios acotada
por determinadas caracter?sticas. No obstante hay momentos en los que
resulta deseable descubrir todos los servicios ofrecidos por un servidor
SDP sin que pueda existir ning?n conocimiento previo sobre los registros
que pueda contener. Este proceso de b?squeda de cualquier servicio
ofrecido se denomina *navegaci?n* o *browsing*.

El servidor Bluetooth SDP denominado
`sdpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sdpd&sektion=8>`__ y
el cliente de l?nea de ?rdenes
`sdpcontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sdpcontrol&sektion=8>`__
se incluyen en la instalaci?n est?ndar de FreeBSD. El siguiente ejemplo
muestra c?mo realizar una consulta de navegaci?n una consulta de
navegaci?n SDP.

.. code:: screen

    % sdpcontrol -a 00:01:03:fc:6e:ec browse
    Record Handle: 00000000
    Service Class ID List:
            Service Discovery Server (0x1000)
    Protocol Descriptor List:
            L2CAP (0x0100)
                    Protocol specific parameter #1: u/int/uuid16 1
                    Protocol specific parameter #2: u/int/uuid16 1

    Record Handle: 0x00000001
    Service Class ID List:
            Browse Group Descriptor (0x1001)

    Record Handle: 0x00000002
    Service Class ID List:
            LAN Access Using PPP (0x1102)
    Protocol Descriptor List:
            L2CAP (0x0100)
            RFCOMM (0x0003)
                    Protocol specific parameter #1: u/int8/bool 1
    Bluetooth Profile Descriptor List:
            LAN Access Using PPP (0x1102) ver. 1.0

... y as? sucesivamente. Resulta importante resaltar una vez m?s que
cada servicio posee una lista de atributos (por ejemplo en el canal
RFCOMM). Dependiendo de los servicios que se quieran utilizar puede
resultar necesario anotar algunos de los atributos. Algunas
implementaciones de Bluetooth no soportan navegaci?n de servicios y
pueden devolver una lista vac?a. En este caso se puede intentar buscar
alg?n servicio determinado. El ejemplo siguiente muestra c?mo buscar el
servicio OBEX Object Push (OPUSH):

.. code:: screen

    % sdpcontrol -a 00:01:03:fc:6e:ec search OPUSH

En FreeBSD los servicios a clientes Bluetooth se suministran mediante el
servidor
`sdpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sdpd&sektion=8>`__.

.. code:: screen

    # sdpd

La aplicaci?n local servidora que quiere proporcionar servicio Bluetooth
a los clientes remotos puede registrar su servicio con el d?mon SDP
local. Un ejemplo de dicha aplicaci?n Un ejemplo de dicha aplicaci?n lo
constituye el d?mon
`rfcomm\_pppd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rfcomm_pppd&sektion=8>`__.
Una vez ejecutado el d?mon registra un servicio LAN de Bluetooth en el
d?mon SDP local.

Se puede obtener la lista de servicios registrados con el servidor SDP
local lanzando una consulta de navegaci?n SDP utilizando el canal de
control local.

.. code:: screen

    # sdpcontrol -l browse

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

29.4.8. Acceso telef?nico a redes (DUN) y acceso a redes mediante perfiles PPP (LAN)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El perfil de Acceso Telef?nico a Redes (Dial-Up Networking o DUN) se
utiliza mayoritariamente con modems y tel?fonos celulares. Los
escenarios cubiertos por este perfil se describen a continuaci?n:

.. raw:: html

   <div class="itemizedlist">

-  Utilizaci?n de un tel?fono celular o un modem por una computadora
   para simular un modem sin cables que se conecte a un servidor de
   acceso telef?nico a redes o para otros servicios de acceso telef?nico
   relacionados;

-  Utilizaci?n de un tel?fono celular o un modem por un computador para
   recibir llamadas de datos.

.. raw:: html

   </div>

El Acceso a Redes con perfiles PPP (LAN) se puede utilizar en las
siguientes situaciones:

.. raw:: html

   <div class="itemizedlist">

-  Acceso LAN para un ?nico dispositivo Bluetooth;

-  Acceso LAN para m?ltiples dispositivos Bluetooth;

-  Conexi?n de PC a PC (utilizando emulaci?n de PPP sobre una l?nea
   serie).

.. raw:: html

   </div>

En FreeBSD ambos perfiles se implementan bajo las ?rdenes
`ppp(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ppp&sektion=8>`__ y
`rfcomm\_pppd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rfcomm_pppd&sektion=8>`__,
un encapsulador que convierte la conexi?n RFCOMM de Bluetooth en algo
que puede ser utilizado por PPP. Antes de que se puedan utilizar los
perfiles se debe definir una nueva etiqueta PPP en el fichero de
configuraci?n ``/etc/ppp/ppp.conf``. Consulte
`rfcomm\_pppd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rfcomm_pppd&sektion=8>`__
para ver algunos ejemplos.

En el siguiente ejemplo se va a utilizar
`rfcomm\_pppd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rfcomm_pppd&sektion=8>`__
para abrir una conexi?n RFCOMM con un dispositivo remoto con BD\_ADDR
00:80:37:29:19:a4 sobre un canal RFCOMM basado en DUN (Dial-Up
Networking). El n?mero de canal RFCOMM se obtiene a partir del
dispositivo remoto a trav?s de SDP. Es posible especificar el canal
RFCOMM a mano, en cuyo caso
`rfcomm\_pppd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rfcomm_pppd&sektion=8>`__
no realizar? ninguna consulta SDP. Se puede utilizar la orden
`sdpcontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sdpcontrol&sektion=8>`__
para descubrir el canal RFCOMM utilizado en el dispositivo remoto.

.. code:: screen

    # rfcomm_pppd -a 00:80:37:29:19:a4 -c -C dun -l rfcomm-dialup

Para proporcionar el servicio de Acceso a Redes a trav?s de PPP (LAN) se
debe ejecutar el servidor
`sdpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sdpd&sektion=8>`__.
Se debe crear una nueva entrada en ``/etc/ppp/ppp.conf``. Le rogamos que
consulte
`rfcomm\_pppd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rfcomm_pppd&sektion=8>`__
y observe los ejemplos que se facilitan. Por ?ltimo se debe ejecutar el
servidor PPP RFCOMM sobre un n?mero de canal RFCOMM adecuado. El
servidor PPP RFCOMM registrar? autom?ticamente el servicio LAN de
Bluetooth con el servidor SDP local. El ejemplo que se muestra a
continuaci?n describe c?mo ejecutar el servidor PPP RFCOMM.

.. code:: screen

    # rfcomm_pppd -s -C 7 -l rfcomm-server

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

29.4.9. Perfil OBEX Object Push (OPUSH)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

OBEX es un protocolo muy utilizado para transferencias de ficheros
sencillas entre dispositivos m?viles. Su uso m?s importante se produce
en comuncaciones por infrarrojos, donde se utiliza para transferencia de
ficheros gen?ricos entre port?tiles o dispositivos Palm y para enviar
tarjetas de visita o entradas de la agenda entre tel?fonos celulares y
otros dispositivos con aplicaciones PIM.

El cliente y el servidor de OBEX se implementan como un paquete
denominado obexapp disponible como “ port” en
`comms/obexapp <http://www.freebsd.org/cgi/url.cgi?ports/comms/obexapp/pkg-descr>`__.

El cliente OBEX se utiliza para introducir y para recuperar recuperar
objetos del servidor OBEX. Un objeto puede por ejemplo ser una tarjeta
de visita o una cita. El cliente OBEX puede obtener un n?mero de canal
RFCOMM del dispositivo remoto utilizando SDP. Esto se hace especificando
el nombre del servicio en lugar del n?mero de canal RFCOMM. Los nombres
de servicios soportados son: IrMC, FTRN y OPUSH. Es posible especificar
el canal RFCOMM como un n?mero. A continuaci?n se muestra un ejemplo de
una sesi?n OBEX donde el objeto que posee la informaci?n del dispositivo
se recupera del tel?fono celular y un nuevo objeto (la tarjeta de
visita) se introduce en el directorio de dicho tel?fono.

.. code:: screen

    % obexapp -a 00:80:37:29:19:a4 -C IrMC
    obex> get
    get: remote file> telecom/devinfo.txt
    get: local file> devinfo-t39.txt
    Success, response: OK, Success (0x20)
    obex> put
    put: local file> new.vcf
    put: remote file> new.vcf
    Success, response: OK, Success (0x20)
    obex> di
    Success, response: OK, Success (0x20)

Para proporcionar servicio de OBEX el servidor
`sdpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sdpd&sektion=8>`__
debe estar en funcionamiento. Adem?s se debe crear un directorio ra?z
donde todos los objetos van a ser almacenados. La ruta por defecto para
el directorio ra?z es ``         /var/spool/obex``. Por ?ltimo se debe
ejecutar el servidor OBEX en un n?mero de canal RFCOMM v?lido. El
servidor OBEX registra autom?ticamente el servicio de Object Push con el
d?mon SDP local. El ejemplo que se muestra a local. El ejemplo que se
muestra a continuaci?n continuaci?n describe c?mo ejecutar el servidor
OBEX.

.. code:: screen

    # obexapp -s -C 10

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

29.4.10. Perfil de puerto serie (SP)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El perfil de puerto serie (Serial Port o SP) permite que dispositivos
Bluetooth realicen emulaci?n de RS232 (o similar). El escenario cubierto
por este perfil trata con con aplicaciones comerciales que utilizan
Bluetooth como un sustituto sustituto del cable, utilizando una capa de
abstracci?n que representa un puerto serie virtual.

La aplicaci?n
`rfcomm\_sppd(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rfcomm_sppd&sektion=1>`__
implementa el perfil Puerto Serie. Usa una pseudo tty como abstracci?n
de puerto serie virtual. El ejemplo de m?s abajo muestra c?mo conectarse
a un servicio de dispositivo remoto de Puerto Serie. Observe que no
necesita especificarse el canal RFCOMM:
`rfcomm\_sppd(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rfcomm_sppd&sektion=1>`__
puede obtenerlo del dispotivo remoto via SDP. Si necesita especificarlo
por alguna raz?n h?galo en la propia l?nea de ?rdenes.

.. code:: screen

    # rfcomm_sppd -a 00:07:E0:00:0B:CA -t /dev/ttyp6
    rfcomm_sppd[94692]: Starting on /dev/ttyp6...

Una vez conectado el pseudo tty se puede utilizar como un puerto serie.

.. code:: screen

    # cu -l ttyp6

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

29.4.11. Soluci?n de problemas
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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

29.4.11.1. Un dispositivo remoto no puede conectarse
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Algunos dispositivos Bluetooh antiguos no soportan el cambio de cambio
de roles. Por defecto, roles. Cuando FreeBSD acepta una nueva conexi?n
por defecto intenta realizar un cambio de rol y convertirse en maestro.
Dispositivos que no son capaces de realizar este cambio no pueden
conectarse. Es interesante resaltar que el cambio de roles se realiza
cuando se est? estableciendo una nueva conexi?n de tal forma que no es
posible preguntar al dispositivo si soporta intercambio de roles. Existe
una opci?n HCI para desactivar el intercambio de roles en la parte
local.

.. code:: screen

    # hccontrol -n ubt0hci write_node_role_switch 0

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

29.4.11.2. Algo va mal ?puedo ver exactamente qu? est? ocurriendo?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

S?, se puede. Utilice el paquete hcidump-1.5, que se puede descargar de
`aqu? <http://www.geocities.com/m_evmenkin/>`__. La herramienta hcidump
es similar a la herramienta
`tcpdump(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tcpdump&sektion=1>`__.
Se puede utilizar para mostrar el contenido de los paquetes Bluetooth
sobre el terminal y para volcar los paquetes Bluetooth a un fichero.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------+----------------------------------------+--------------------------------------------+
| `Anterior <network-wireless.html>`__?   | `Subir <advanced-networking.html>`__   | ?\ `Siguiente <network-bridging.html>`__   |
+-----------------------------------------+----------------------------------------+--------------------------------------------+
| 29.3. Redes sin cables (“wireless”)?    | `Inicio <index.html>`__                | ?29.5. Puenteado                           |
+-----------------------------------------+----------------------------------------+--------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
