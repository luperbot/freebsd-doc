==============================
29.7. Ejecuci?n sin disco duro
==============================

.. raw:: html

   <div class="navheader">

29.7. Ejecuci?n sin disco duro
`Anterior <network-nfs.html>`__?
Cap?tulo 29. Networking avanzado
?\ `Siguiente <network-isdn.html>`__

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

29.7. Ejecuci?n sin disco duro
------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Actualizado por Jean-Fran?ois Dock?s.

.. raw:: html

   </div>

.. raw:: html

   <div>

Reorganizado y ampliado por Alex Dupre.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Una m?quina FreeBSD se puede arrancar a trav?s de la red y operar sin
que necesite poseer ning?n disco, utilizando sistemas de ficheros de un
servidor de NFS. No se necesita realizar ninguna modificaci?n al
sistema, salvo configurar determinados ficheros. Este tipo de sistemas
se pueden configurar f?cilmente puesto que FreeBSD dispone de todos los
elementos necesarios:

.. raw:: html

   <div class="itemizedlist">

-  Existen al menos dos formas de cargar el n?cleo del sistema operativo
   a trav?s de la red:

   .. raw:: html

      <div class="itemizedlist">

   -  PXE: El sistema de Intel? conocido como Preboot Execution
      Environment. Se trata de una especie de arranque inteligente a
      partir de una memoria de s?lo lectura (ROM) que se encuentra en
      algunas placas bases y tarjetas de red. Se puede obtener m?s
      informaci?n en
      `pxeboot(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pxeboot&sektion=8>`__.

   -  El port etherboot
      (`net/etherboot <http://www.freebsd.org/cgi/url.cgi?ports/net/etherboot/pkg-descr>`__)
      genera c?digo de s?lo lectura (c?digo ROM) que se puede utilizar
      para arrancar m?quinas a trav?s de la red. Dicho c?digo se puede
      instalar en una memoria de arranque tipo PROM en algunas tarjetas
      de red o se puede cargar en una disquetera (o disco duro), y
      tambi?n en un sistema de ficheros MS-DOS? que est? en ejecuci?n.
      Varias tarjetas de red soportan este mecanismo.

   .. raw:: html

      </div>

-  Existe un script de ejemplo
   (``/usr/share/examples/diskless/clone_root``) que facilita la
   creaci?n y el mantenimiento del sistema de ficheros ra?z de la
   estaci?n de trabajo en el servidor. La configuraci?n de este “script”
   se debe retocar ligeramente pero sirve como punto de partida para
   comenzar r?pidamente.

-  Existen ficheros est?ndar de arranque bajo ``/etc`` que dan soporte
   al arranque de m?quinas sin disco.

-  El “swapping”, en caso de ser necesario, se puede realizar usando NFS
   y tamb?en usando un disco duro local.

.. raw:: html

   </div>

Existen varias formas de ejecutar una estaci?n de trabajo sin discos. En
el proceso se involucran distintos elementos y la mayor?a se pueden
adaptar a las necesidades del usuario. A continuaci?n se describen
variaciones sobre la configuraci?n de un sistema sin discos, haciendo
incapi? en la simplicidad y compatibilidad con los “scripts” de arranque
de FreeBSD. El sistema que vamos a describir tiene las siguientes
caracter?sticas.

.. raw:: html

   <div class="itemizedlist">

-  Las estaciones de trabajo sin disco utilizan un sistema de ficheros
   ``ra?z`` de s?lo lectura y un sistema de ficheros compartido, tambi?n
   de s?lo lectura, bajo ``/usr``.

   El sistema de ficheros ``ra?z`` es una copia del sistema ra?z
   estandar de FreeBSD (normalmente del sistema ra?z del servidor),
   donde se sobreescriben algunos archivos de configuraci?n necesarios
   para la ejecuci?n sin discos y para la configuraci?n local espec?fica
   de la m?quina objetivo.

   Las partes del sistema de ficheros ``ra?z`` que tiene que tener
   permisos de lectura y escritura se superponen con los sistemas de
   ficheros
   `mfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mfs&sektion=8>`__
   (FreeBSD?4.X) o
   `md(4) <http://www.FreeBSD.org/cgi/man.cgi?query=md&sektion=4>`__.
   Cualquier cambio que se produzca en dichas partes se perder? cuando
   se reinicie el sistema.

-  El n?cleo se transmite y se carga utilizando etherboot o bien PXE,
   dependiendo del hardware y los mecanismos que se soporten.

.. raw:: html

   </div>

.. raw:: html

   <div class="caution" xmlns="">

Atenci?n:
~~~~~~~~~

Como se ha comentado con anterioridad estos sistemas son inseguros. Se
debe confinar dentro de una red protegida y el resto de las m?quinas por
defecto no deben confiar en estos m?todos.

.. raw:: html

   </div>

Toda la informaci?n que se presenta en esta secci?n se ha probado
utilizando FreeBSD 4.9-RELEASE y 5.2.1-RELEASE. El texto se encuentra
estructurado principalmente para utilizaci?n en sistemas 4.X. Se
insertan notas para indicar cambios producidos en las versiones 5.X.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

29.7.1. Conocimientos previos
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Configurar estaciones de trabajo sin discos es una operaci?n
relativamente sencilla pero en la que pueden cometerse errores. Estos
errores resultan algunas veces dif?ciles de diagnosticar debido a
razones que vamos a exponer a continuaci?n. Por ejemplo:

.. raw:: html

   <div class="itemizedlist">

-  Diferentes opciones de tiempo de compilaci?n pueden determinar
   comportamientos distintos en tiempo de ejecuci?n.

-  Los mensajes de error a menudo resultan cr?pticos o incluso no
   existen.

.. raw:: html

   </div>

Se se quieren resolver los posibles problemas que puedan surgir resulta
muy ?til conocer el funcionamiento conceptual del mecanismo.

Para que el arranque se produzca exitosamente se deben realizar varias
operaciones:

.. raw:: html

   <div class="itemizedlist">

-  La m?quina necesita obtener algunos par?metros iniciales, tales como
   su direcci?n IP, el fichero ejecutable, el nombre del servidor y la
   ruta ra?z. Esto se realiza utilizando los protocolos DHCP o BOOTP.
   DHCP es una extensi?n compatible del protocolo BOOTP y utiliza los
   mismos n?meros de puertos y los mismos formatos de paquete b?sicos.

   Es posible configurar un sistema de tal forma que utilice s?lamente
   BOOTP. En el sistema base de FreeBSD se incluye el programa servidor
   `bootpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=bootpd&sektion=8>`__.

   No obstante DHCP posee varias ventajas sobre BOOTP (archivos de
   configuraci?n m?s limpios, posibilidad de ejecutar PXE, junto con
   otras caracter?sticas que no se relacionan directamente con el tema
   que estamos tratando tratando) por lo que principalmente se va a
   describir la configuraci?n de DHCP, proporcionando ejemplos
   equivalentes en
   `bootpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=bootpd&sektion=8>`__
   siempre que sea posible. La configuraci?n de ejemplo se basa en el
   paquete software de ISC DHCP (en el servidor de prueba se instal? la
   versi?n 3.0.1.r12).

-  La m?quina sin disco necesita transferir uno o varios programas a la
   memoria local. Para ello se usa TFTP o bien NFS. La elecci?n entre
   ambos se produce mediante la configuraci?n de la compilaci?n que se
   produce en varios lugares. Una fuente de error t?pica aparece cuando
   se especifican ficheros con el protocolo incorrecto: TFTP normalmente
   transfiere todos los ficheros desde un ?nico directorio del servidor,
   de modo que espera nombres de ficheros relativos a dicho directorio.
   Por otro lado NFS necesita recibir rutas de fichero absolutas.

-  El kernel y los programas de arranque intermedios deben ser
   inicializados y ejecutados. Existen diferencias importantes en este
   ?rea:

   .. raw:: html

      <div class="itemizedlist">

   -  PXE carga
      `pxeboot(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pxeboot&sektion=8>`__,
      una versi?n modificada de la tercera fase del cargador de arranque
      de FreeBSD.
      `loader(8) <http://www.FreeBSD.org/cgi/man.cgi?query=loader&sektion=8>`__
      obtiene la mayor?a de los par?metros necesarios para arrancar el
      sistema y los deposita en variables de entorno del kernel antes de
      tranferir el control. En este caso es posible utilizar un un
      n?cleo ``GENERIC`` .

   -  etherboot carga directamente el directamente el n?cleo con menos
      trabajo previo que el m?todo anterior. Para ello se debe compilar
      un n?cleo con ciertas opciones.

   .. raw:: html

      </div>

   PXE y etherboot funcionan muy bien en los sistemas 4.X. Dado que los
   n?cleos de los sistemas 5.X permiten que el
   `loader(8) <http://www.FreeBSD.org/cgi/man.cgi?query=loader&sektion=8>`__
   realice m?s tareas, se prefiere usar PXE.

   Si su BIOS y su tarjeta de red soportan PXE lo normal es utilizarlo.
   No obstante se puede arrancar un sistema 5.X utilizando etherboot.

-  Para acabar la tarea la m?quina necesita acceder al sistema de
   ficheros. En todos los casos se utiliza NFS.

.. raw:: html

   </div>

No olvide consultar
`diskless(8) <http://www.FreeBSD.org/cgi/man.cgi?query=diskless&sektion=8>`__.

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

29.7.2. Instrucciones de configuraci?n
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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

29.7.2.1. Configuraci?n utilizando ISC DHCP
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El servidor ISC DHCP puede responder tanto a peticiones de BOOTP como a
peticiones de DHCP.

ISC DHCP no forma parte de la versi?n 4.9 de FreeBSD por lo que se debe
instalar el port
`net/isc-dhcp3-server <http://www.freebsd.org/cgi/url.cgi?ports/net/isc-dhcp3-server/pkg-descr>`__
o el paquete correspondiente. Por favor, consulte `Cap?tulo?4,
*Instalaci?n de aplicaciones: ?packages? y ports* <ports.html>`__ para
obtener m?s informaci?n sobre los ports y los paquetes.

Una vez que ISC DHCP se encuentra instalado necesita un fichero de
configuraci?n para poder ejecutarse ``/usr/local/etc/dhcpd.conf``). A
continuaci?n se muestra un ejemplo comentado, donde la m?quina
``margaux`` utiliza etherboot y la m?quina ``corbieres`` utiliza PXE:

.. code:: programlisting

    default-lease-time 600;
    max-lease-time 7200;
    authoritative;

    option domain-name "example.com";
    option domain-name-servers 192.168.4.1;
    option routers 192.168.4.1;

    subnet 192.168.4.0 netmask 255.255.255.0 {
      use-host-decl-names on; 
      option subnet-mask 255.255.255.0;
      option broadcast-address 192.168.4.255;

      host margaux {
        hardware ethernet 01:23:45:67:89:ab;
        fixed-address margaux.example.com;
        next-server 192.168.4.4; 
        filename "/data/misc/kernel.diskless"; 
        option root-path "192.168.4.4:/data/misc/diskless"; 
      }
      host corbieres {
        hardware ethernet 00:02:b3:27:62:df;
        fixed-address corbieres.example.com;
        next-server 192.168.4.4;
        filename "pxeboot";
        option root-path "192.168.4.4:/data/misc/diskless";
      }
    }
              

.. raw:: html

   <div class="calloutlist">

+--------------------------------------+--------------------------------------+
| `|1| <#co-dhcp-host-name>`__         | Esta opci?n indica a dhcpd que env?e |
|                                      | el valor que se encuentra en las     |
|                                      | declaraciones de ``host`` como el    |
|                                      | nombre de m?quina para la m?quina    |
|                                      | sin disco. Otra forma de hacer esto  |
|                                      | ser?a a?adiendo una opci?n           |
|                                      | ``option host-name                 m |
|                                      | argaux``                             |
|                                      | dentro de las declaraciones de       |
|                                      | m?quina.                             |
+--------------------------------------+--------------------------------------+
| `|2| <#co-dhcp-next-server>`__       | La directiva ``next-server``         |
|                                      | selecciona el servidor de TFTP o de  |
|                                      | NFS que se debe utilizar para cargar |
|                                      | el n?cleo o el fichero cargador del  |
|                                      | n?cleo (por defecto se utiliza la    |
|                                      | misma m?quina que act?a como         |
|                                      | servidor de DHCP).                   |
+--------------------------------------+--------------------------------------+
| `|3| <#co-dhcp-filename>`__          | La directiva ``filename`` define el  |
|                                      | archivo que etherboot o PXE cargar?  |
|                                      | en el siguiente paso de ejecuci?n.   |
|                                      | Debe especificarse de acuerdo con el |
|                                      | m?todo de transferencia              |
|                                      | seleccionado. Etherboot se puede     |
|                                      | compilar para que use NFS o TFTP. El |
|                                      | sistema FreeBSD se configura por     |
|                                      | defecto para NFS. PXE utiliza TFTP   |
|                                      | por lo que se utiliza una ruta       |
|                                      | relativa para especificar el nombre  |
|                                      | del fichero (esto puede depender de  |
|                                      | la configuraci?n del servidor de     |
|                                      | TFTP pero suele ser lo normal).      |
|                                      | Adem?s PXE no carga el n?cleo, lo    |
|                                      | hace ``pxeboot``. Existen otras      |
|                                      | posibilidades interesantes, como     |
|                                      | cargar ``pxeboot`` desde el          |
|                                      | directorio ``/boot`` de una unidad   |
|                                      | de CD-ROM de FreeBSD (ya que         |
|                                      | `pxeboot(8) <http://www.FreeBSD.org/ |
|                                      | cgi/man.cgi?query=pxeboot&sektion=8> |
|                                      | `__                                  |
|                                      | puede cargar un n?cleo ``GENERIC``   |
|                                      | surge la posibilidad de utilizar PXE |
|                                      | para arrancar desde una unidad de    |
|                                      | CD-ROM remota).                      |
+--------------------------------------+--------------------------------------+
| `|4| <#co-dhcp-root-path>`__         | La opci?n ``root-path`` define la    |
|                                      | ruta para el sistema de ficheros     |
|                                      | ra?z utilizando la notaci?n t?pica   |
|                                      | de NFS. Cuando se utiliza PXE, es    |
|                                      | posible dejar la direcci?n IP        |
|                                      | siempre y cuando no se active la     |
|                                      | opci?n del n?cleo de BOOTP. El       |
|                                      | servidor NFS ser? en este caso el    |
|                                      | mismo que el servidor de TFTP.       |
+--------------------------------------+--------------------------------------+

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

29.7.2.2. Configuraci?n utilizando BOOTP
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A continuaci?n se muestra la configuraci?n equivalente utilizando bootpd
(reducida a un ?nico cliente). Esta configuraci?n se debe situar en
``/etc/bootptab``.

Por favor, recuerde que etherboot se debe compilar con la opci?n
espec?fica de ``NO_DHCP_SUPPORT`` para que pueda utilizar BOOTP y que
PXE *requiere* DHCP. La ?nica ventaja obvia de bootpd es que se
encuentra disponible en el sistema base.

.. code:: programlisting

    .def100:\
      :hn:ht=1:sa=192.168.4.4:vm=rfc1048:\
      :sm=255.255.255.0:\
      :ds=192.168.4.1:\
      :gw=192.168.4.1:\
      :hd="/tftpboot":\
      :bf="/kernel.diskless":\
      :rp="192.168.4.4:/data/misc/diskless":

    margaux:ha=0123456789ab:tc=.def100
              

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

29.7.2.3. Preparaci?n de un programa de arranque con Etherboot
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

`La p?gina web de Etherboot <http://etherboot.sourceforge.net>`__
contiene `una amplia
documentaci?n <http://etherboot.sourceforge.net/doc/html/userman/t1.html>`__
enfocada principalmente a los sistemas Linux pero en cualquier caso
contiene informaci?n que puede resultar ?til. En los siguientes p?rrafos
se describe brevemente como se puede utilizar etherboot en un sistema
FreeBSD.

Lo primero es instalar el port o paquete
`net/etherboot <http://www.freebsd.org/cgi/url.cgi?ports/net/etherboot/pkg-descr>`__.
El port de etherboot est? en ``/usr/ports/net/etherboot``. Si el ?rbol
de ports est? instalado en el sistema basta con ejecutar ``make`` en
dicho directorio. Por favor, lea `Cap?tulo?4, *Instalaci?n de
aplicaciones: ?packages? y ports* <ports.html>`__ para saber m?s sobre
los ports y los paquetes.

Se puede modificar la configuraci?n de etherboot (por ejemplo, para que
use TFTP en lugar de NFS) editando el fichero ``Config`` que se
encuentra en el directorio fuente de etherboot.

Para nuestros prop?sitos se utilizar? un disquete de arranque. Para
utilizar otros m?todos (PROM o un programa MS-DOS?) por favor consulte
la documentaci?n de etherboot.

Para crear un disco de arranque se debe insertar un disco en la unidad
de disquetes de la m?quina donde se ha instalado etherboot, cambiar al
directorio ``src`` dentro del ?rbol de directorios de etherboot y
teclear:

.. code:: screen

    # gmake bin32/tipo_de_dispositivo.fd0
        

*``tipo_de_dispositivo``* depende del tipo de tarjeta Ethernet que se
encuentre instalada en la estaci?n de trabajo sin disco. Consulte el
fichero ``NIC`` en el mismo directorio para determinar c?al es el
*``tipo_de_dispositivo``* que debe usted usar.

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

29.7.2.4. Arranque con PXE
^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Por defecto el cargador
`pxeboot(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pxeboot&sektion=8>`__
carga, valga la redundancia, el kernel v?a NFS. El El cargador se puede
compilar para que utilice TFTP en lugar de NFS especificando la opci?n
``LOADER_TFTP_SUPPORT`` dentro de ``/etc/make.conf``. Observe los
comentarios de ``/etc/defaults/make.conf`` (o de
``/usr/share/examples/etc/make.conf`` para sistemas 5.X) para saber m?s
detalles.

Existen otras dos opciones de ``make.conf`` no documentadas que pueden
ser ?tiles para arrancar una m?quina sin disco a trav?s del puerto
serie: ``BOOT_PXELDR_PROBE_KEYBOARD`` y ``BOOT_PXELDR_ALWAYS_SERIAL``
(esta ?ltima s?lo existe en FreeBSD?5.X).

Para utilizar PXE cuando arranca la m?quina normalmente el usuario tiene
que seleccionar la opci?n ``Boot from network`` dentro del men? de
opciones de la BIOS o pulsar un tecla de funci?n cuando la m?quina se
est? inicializando.

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

29.7.2.5. Configuraci?n de servidores de TFTP y de NFS
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Si PXE o etherboot se encuentran configurados para utilizar TFTP se
necesita activar tftpd en el servidor de ficheros:

.. raw:: html

   <div class="procedure">

#. Crear un directorio desde el cual el d?mon tftpd servir? los
   ficheros, por ejemplo ``/tftpboot``.

#. A?adir la siguiente l?nea a ``/etc/inetd.conf``:

   .. code:: programlisting

       tftp    dgram   udp wait    root    /usr/libexec/tftpd  tftpd -l -s /tftpboot

   .. raw:: html

      <div class="note" xmlns="">

   Nota:
   ~~~~~

   Parece que al menos algunas versiones de PXE utilizan la versi?n TCP
   de TFTP. En este caso se puede a?adir una segunda l?nea, donde se
   reemplace ``dgram udp`` por ``stream                 tcp``.

   .. raw:: html

      </div>

#. Indicar a inetd que vuelva a leer su fichero de configuraci?n:

   .. code:: screen

       # kill -HUP `cat
                       /var/run/inetd.pid`

.. raw:: html

   </div>

Se puede situar el directorio ``tftpboot`` en cualquier parte del
servidor. Debe asegurarse de que la localizaci?n se encuentra
correctamente configurada tanto en ``inetd.conf`` como en
``dhcpd.conf``.

En todos los casos tambi?n resulta necesario activar el sistema de NFS y
exportar los sistemas de ficheros adecuados, todo ello en el servidor de
NFS.

.. raw:: html

   <div class="procedure">

#. A?adir lo siguiente a ``/etc/rc.conf``:

   .. code:: programlisting

       nfs_server_enable="YES"

#. Exportar el sistema de ficheros donde el directorio ra?z sin disco se
   encuentra localizado a?adiendo lo siguiente a ``/etc/exports``
   (ajuste el punto de montaje de la unidad y sustituya
   *``margaux corbieres``* por el nombre de las estaciones de trabajo
   sin disco, seg?n corresponda):

   .. code:: programlisting

       /data/misc -alldirs -ro margaux corbieres

#. Indicar a mountd que vuelva a leer su archivo de configuraci?n. Si en
   un primer paso se ha configurado la activaci?n autom?tica del sistema
   de NFS en ``/etc/rc.conf`` lo mejor es reiniciar para que los cambios
   surtan efecto.

   .. code:: screen

       # kill -HUP `cat
                       /var/run/mountd.pid`

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

29.7.2.6. Construcci?n de un kernel sin disco
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Si se utiliza etherboot, se necesita crear un archivo de configuraci?n
para el kernel de la m?quina sin disco que posea las siguientes opciones
(adem?s de las opciones del n?cleo habituales):

.. code:: programlisting

    options     BOOTP          # Use BOOTP to obtain IP address/hostname
    options     BOOTP_NFSROOT  # NFS mount root filesystem using BOOTP info
        

Puede resultar interesante utilizar adem?s ``BOOTP_NFSV3``,
``BOOT_COMPAT`` y ``BOOTP_WIRED_TO`` (consultar ``LINT`` en 4.X o
``NOTES`` en sistemas 5.X).

Los nombres de estas opciones son nombres hist?ricos y ligeramente
confusos ya que permiten un uso indistinto tanto de DHCP como de BOOTP
dentro del n?cleo (tambi?n resulta posible forzar la utilizaci?n ?nica
de o bien BOOTP o bien de DHCP).

Contruir el n?cleo (vea `Cap?tulo?8, *Configuraci?n del kernel de
FreeBSD* <kernelconfig.html>`__) y copiarlo al lugar especificado en el
archivo ``dhcpd.conf``.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Cuando se utiliza PXE, la construcci?n del n?cleo con las opciones
anteriores no resulta ser algo estrictamente necesario (aunque se
recomienda). Activar dichas opciones provoca un mayor tr?fico de
peticiones de DHCP durante el arranque del n?cleo, lo que puede dar
lugar a peque?as inconsistencias entre los nuevos valores y los los
valores recuperados por
`pxeboot(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pxeboot&sektion=8>`__
en casos muy espec?ficos. La ventaja de utilizarlas consiste en que como
un efecto colateral se configurar? el nombre de la m?quina. De otro modo
tendr?amos que configurar dicho nombre mediante otro m?todo por ejemplo
mediante la configuraci?n espec?fica de la m?quina cliente a trav?s del
archivo ``rc.conf``.

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Para que el n?cleo se pueda cargar sin problemas con etherboot en
sistemas 5.X dicho n?cleo tiene que tener compilado el soporte para
*device hints*. Para ello normalmente se especifica la siguiente opci?n
dentro del fichero de configuraci?n del n?cleo (consulte los comentarios
del fichero ``NOTES``):

.. code:: programlisting

    hints     "GENERIC.hints"

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

29.7.2.7. Preparaci?n del sistema de ficheros ra?z
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Se debe crear un sistema de ficheros ra?z en las estaciones de trabajo
sin disco, concretamente en la localizaci?n especificada por
``root-path`` dentro de ``dhcpd.conf``. Las siguientes secciones
describen dos formas de hacer esto.

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

29.7.2.7.1. Utilizaci?n del “script” ``clone_root``
'''''''''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Este es el modo m?s r?pido de crear un sistema de ficheros ra?z, pero
actulamente s?lo se encuentra soportado en FreeBSD?4.X. El “script” de
shell se encuentra en ``/usr/share/examples/diskless/clone_root`` y debe
ser configurado al menos para ajustar el lugar donde se construir? el
sistema de ficheros (concretamente la variable ``DEST``).

Consulte los comentarios que se encuentran al comienzo del “script” para
conocer cuales son las instrucciones que debe seguir. All? se explica
c?mo se construye el sistema de ficheros base y como determinados
ficheros se pueden sobreescribir de manera selectiva por versiones
espec?ficas para funcionar sin discos, para toda una subred o para una
m?quina individual. Tambi?n all? se muestran ejemplos de los ficheros
``/etc/fstab`` y ``/etc/rc.conf`` para m?quinas sin disco.

Los archivos ``README`` que se encuentran dentro de
``/usr/share/examples/diskless`` contienen mucha informaci?n de base,
que junto con el resto de ejemplos dentro del directorio ``diskless``
sirven para documentar un m?todo de configuraci?n distinto del que se
utiliza en ``clone_root`` y en los “ scripts” del sistema de ``/etc``,
que resultan ser un tanto confusos. No obstante se pueden utilizar a
modo de referencia, excepto si se prefiere utilizar el m?todo que se
describe en ellos, en cuyo caso se necesitar? modificar y adaptar los
“scripts” de forma adecuada.

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

29.7.2.7.2. Utilizaci?n del procedimiento est?ndar de ``make world``
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Este m?todo se puede utilizar tanto en FreeBSD?4.X o 5.X y se instalar?
un sistema completamente nuevo (no s?lo el sistema de ficheros ra?z)
dentro de ``DESTDIR``. Basta con ejecutar el siguiente “ script”:

.. code:: programlisting

    #!/bin/sh
    export DESTDIR=/data/misc/diskless
    mkdir -p ${DESTDIR}
    cd /usr/src; make world && make kernel
    cd /usr/src/etc; make distribution

Una vez ejecutado puede ser necesario ajustar los ficheros
``/etc/rc.conf`` y ``/etc/fstab`` que se encuentran en ``DESTDIR`` de
acuerdo con nuestras necesidades.

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

29.7.2.8. Configuraci?n de la partici?n de intercambio
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

En caso de ser necesario se puede acceder a un fichero de intercambio
(swap) a trav?s del sistema NFS. Uno de los m?todos t?picamente
utilizados para realizar esta tarea ha sido retirado de la distribuci?n
5.X.

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

29.7.2.8.1. NFS swap en sistemas FreeBSD?4.X
''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

La ubicaci?n del fichero de intercambio y su tama?o se puede especificar
con las opciones FreeBSD-specific 128 y 129 de BOOTP/DHCP. A
continuaci?n se muestran varios ejemplos de ficheros de de configuraci?n
para ISC DHCP 3.0 o bootpd:

.. raw:: html

   <div class="procedure">

#. A?adir las siguientes l?neas al fichero ``dhcpd.conf``:

   .. code:: programlisting

       # Global section
       option swap-path code 128 = string;
       option swap-size code 129 = integer 32;

       host margaux {
         ... # Standard lines, see above
         option swap-path "192.168.4.4:/netswapvolume/netswap";
         option swap-size 64000;
       }
               

   ``swap-path`` es la ruta al directorio donde se instalar?n los
   archivos de intercambio. Cada Cada fichero se denomina
   ``swap.direccion-ip-del-cliente``.

   Versiones m?s antiguas de dhcpd usaban una sint?xis del estilo de
   ``option option-128 "...``, lo cual ya no est? soportado.

   ``/etc/bootptab`` normalmente utiliza la siguiente sintaxis:

   .. code:: programlisting

       T128="192.168.4.4:/netswapvolume/netswap":T129=0000fa00

   .. raw:: html

      <div class="note" xmlns="">

   Nota:
   ~~~~~

   El tama?o del fichero dedicado a intercambio se debe expresar en
   ``/etc/bootptab`` en formato hexadecimal.

   .. raw:: html

      </div>

#. En el servidor de ficheros NFS donde va a residir el fichero de
   “swap” se debe(n) crear dicho(s) fichero(s)

   .. code:: screen

       # mkdir /volumenintercambiored/intercambiored
       # cd /volumenintercambiored/intercambiored
       # dd if=/dev/zero bs=1024 count=64000 of=swap.192.168.4.6
       # chmod 0600 swap.192.168.4.6
                   

   *``192.168.4.6``* es la direcci?n IP del cliente sin disco.

#. En el servidor NFS a?adir a ``/etc/exports`` la siguiente l?nea:

   .. code:: programlisting

       /volumenintercambiored  -maproot=0:10 -alldirs margaux corbieres
               

   A continuaci?n indicar a mountd que vuelva a leer el fichero
   ``/etc/exports`` como se ha indicado anteriormente.

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

29.7.2.8.2. NFS swap en FreeBSD?5.X
'''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El n?cleo no soporta la activaci?n del intercambio a trav?s de NFS en
tiempo de arranque. De esta forma la “swap” se debe activar mediante los
“scripts” montando un sistema de ficheros de lectura-escritura y creando
y activando el fichero de intercambio. Para crear un fichero de
intercambio de un determinado tama?o se puede ejecutar lo siguiente:

.. code:: screen

    # dd if=/dev/zero of=/ruta/al/fichero/de/intercambio bs=1k count=1 oseek=100000

Para activar el intercambio se tiene que a?adir la siguiente l?nea al
fichero de configuraci?n ``rc.conf``:

.. code:: programlisting

    swapfile=/ruta/al/fichero/de/intercambio

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

29.7.2.9. Varios
^^^^^^^^^^^^^^^^

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

29.7.2.9.1. Ejecuci?n con un ``/usr`` de s?lo lectura
'''''''''''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Si la estaci?n de trabajo sin disco se configura para utilizar el
sistema X-Window se tiene que ajustar el fichero de configuraci?n de xdm
debido a que dicho fichero sit?a por defecto el fichero de “logs” de
errores en el directorio ``/usr``.

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

29.7.2.9.2. Uso de un servidor no-FreeBSD
'''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Cuando el servidor del sistema de ficheros ra?z no ejecuta FreeBSD se
tiene que crear un sistema de ficheros ra?z sobre una m?quina FreeBSD
para despu?s copiarlo al servidor original mediante las ?rdenes ``tar``
o ``cpio``.

En esta situaci?n algunas veces surgen varios problemas relacionados con
los dispositivos especiales que se encuentran en el directorio ``/dev``
debido a los diferentes tama?os de los enteros mayor/menor. Una soluci?n
para este problema consiste en exportar un directorio del servidor
no-FreeBSD, montar este directorio en la m?quina FreeBSD anterior y
ejecutar ``MAKEDEV`` en dicha m?quina para crear las entradas de
dispositivo correctas (FreeBSD 5.0 y posteriores utilizan
`devfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=devfs&sektion=5>`__
para ubicar nodos de dispositivos de forma transparente para el usuario
de tal modo que la ejecuci?n de ``MAKEDEV`` en estos sistemas no sirve
para nada).

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

+------------------------------------+----------------------------------------+----------------------------------------+
| `Anterior <network-nfs.html>`__?   | `Subir <advanced-networking.html>`__   | ?\ `Siguiente <network-isdn.html>`__   |
+------------------------------------+----------------------------------------+----------------------------------------+
| 29.6. NFS?                         | `Inicio <index.html>`__                | ?29.8. RDSI                            |
+------------------------------------+----------------------------------------+----------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.

.. |1| image:: ./imagelib/callouts/1.png
.. |2| image:: ./imagelib/callouts/2.png
.. |3| image:: ./imagelib/callouts/3.png
.. |4| image:: ./imagelib/callouts/4.png
