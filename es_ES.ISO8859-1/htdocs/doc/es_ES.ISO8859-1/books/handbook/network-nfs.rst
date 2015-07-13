=========
29.6. NFS
=========

.. raw:: html

   <div class="navheader">

29.6. NFS
`Anterior <network-bridging.html>`__?
Cap?tulo 29. Networking avanzado
?\ `Siguiente <network-diskless.html>`__

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

29.6. NFS
---------

.. raw:: html

   </div>

.. raw:: html

   <div>

Reorganizado y ampliado por Tom Rhodes.

.. raw:: html

   </div>

.. raw:: html

   <div>

Escrito por Bill Swingle.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD soporta diversos sistemas de ficheros, uno de los cuales es el
Sistema de Ficheros en Red, tamb?en conocido por su acr?nimo en ingl?s
NFS. NFS permite compartir directorios y ficheros a trav?s de la red.
Los usuarios del sistema NFS pueden acceder a ficheros que se encuentran
f?sicamente en m?quinas remotas de una forma transparente, como si se
tratara de ficheros locales.

He aqu? algunos los beneficios m?s destacados que NFS proporciona:

.. raw:: html

   <div class="itemizedlist">

-  Las estaciones de trabajo locales utilizan menos espacio de disco
   debido a que los datos se encuentran centralizados en un ?nico lugar
   pero pueden ser accedidos y modificados por varios usuarios, de tal
   forma que no es necesario replicar la informaci?n.

-  Los usuarios no necesitan disponer de un directorio “ home” en cada
   una de las m?quinas de la organizaci?n. Los directorios “home” pueden
   crearse en el servidor de NFS para posteriormente poder acceder a
   ellos desde cualquier m?quina a trav?s de la infraestrutura de red.

-  Tambi?n se pueden compartir a trav?s de la red dispositivos de
   almacenamiento como disqueteras, CDROM y unidades ZIP. Esto puede
   reducir la inversi?n en dichos dispositivos y mejorar el
   aprovechamiento del hardware existente en la organizaci?n.

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

29.6.1. C?mo funciona NFS
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El sistema NFS est? dividido al menos en dos partes principales: un
servidor y uno o m?s clientes. Los clientes acceden de forma remota a
los datos que se encuentran almacenados en el servidor. Para que el
sistema funcione correctamente se deben configurar y ejecutar unos
cuantos procesos.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

En FreeBSD 5.X se ha reemplazado portmap por rpcbind. de esta forma para
los ejemplos que vamos a comentar a continuaci?n se recuerda que en
FreeBSD 5.X se debe reemplazar cualquier instancia de portmap por
rpcbind.

.. raw:: html

   </div>

El servidor de NFS debe ejecutar los siguientes d?mones:

.. raw:: html

   <div class="informaltable">

+-----------+------------------------------------------------------------------------------------------------------------------------------------------------+
| D?mon     | Descripci?n                                                                                                                                    |
+===========+================================================================================================================================================+
| nfsd      | El d?monNFS, que atiende peticiones de clientes NFS.                                                                                           |
+-----------+------------------------------------------------------------------------------------------------------------------------------------------------+
| mountd    | El d?mon de montaje de NFS, que transporta las peticiones que `nfsd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=nfsd&sektion=8>`__ realiza.   |
+-----------+------------------------------------------------------------------------------------------------------------------------------------------------+
| portmap   | El d?mon portmapper permite que los clientes NFS puedan descubrir qu? puerto est? utilizando el servidor de NFS.                               |
+-----------+------------------------------------------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

El cliente tambi?n puede ejecutar un d?mon conocido , como nfsiod. El
d?mon nfsiod atiende las peticiones provinientes del servidor NFS. Este
d?mon es opcional y sirve para mejorar el rendimiento pero no es
necesario para el funcionamiento correcto del sistema. Se recomienda
consultar
`nfsiod(8) <http://www.FreeBSD.org/cgi/man.cgi?query=nfsiod&sektion=8>`__
para obtener m?s informaci?n.

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

29.6.2. Configuraci?n de NFS
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

La configuraci?n de NFS es un proceso relativamente sencillo. Para que
los procesos anteriormente descritos se ejecuten en tiempo de arranque
del sistema, basta con realizar paque?as modificaciones en
``/etc/rc.conf``.

En ``/etc/rc.conf`` del servidor de NFS se deben configurar las
siguientes opciones:

.. code:: programlisting

    portmap_enable="YES"
    nfs_server_enable="YES"
    mountd_flags="-r"

mountd se ejecuta autom?ticamente cuando se activa el servidor NFS.

En el cliente debemos asegurarnos de que se encuentra activada la
activada la siguiente opci?n dentro de ``         /etc/rc.conf``:

.. code:: programlisting

    nfs_client_enable="YES"

El archivo ``/etc/exports`` especifica los directorios o sistemas de
ficheros que NFS exporta al exterior. Cada l?nea dentro de
``     /etc/exports/`` especifia un sistema de ficheros y qu? m?quinas
tienen derechos de acceso sobre dicho sistema. Adem?s de los derechos de
acceso se pueden definir otras opciones de acceso, tales como solo
lectura o lectura y escritura. Existen multitud de opciones que pueden
definirse sobre un directorio exportable pero en este manual s?lo se van
a comentar unas pocas. Consulte
`exports(5) <http://www.FreeBSD.org/cgi/man.cgi?query=exports&sektion=5>`__
para obtener una descripci?n m?s detallada.

Aqu? se muestran algunos ejemplos de entradas para ``/etc/exports``:

El siguiente ejemplo proporciona una idea de c?mo exportar sistemas de
ficheros, aunque los par?metros pueden diferir dependiendo de su entorno
y su configuraci?n de red. En dicho ejemplo, se exporta el directorio
``/cdromm`` a tres m?quinas que se encuentran en el mismo dominio que el
servidor (de ah? que no se especifique ning?n nombre de dominio para
cada m?quina) o que pueden estar dadas de alta en ``/etc/hosts``. En
cualquier caso la opci?n ``-ro`` configura el sistema de ficheros de red
como “s?lo lectura” (“read-only”). Con esta opci?n los sistemas remotos
no ser?n capaces de realizar cambios sobre el sistema de ficheros
exportados.

.. code:: programlisting

    /cdrom -ro host1 host2 host3

La siguiente l?nea exporta el directorio ``/home`` a tres m?quinas
utilizando direcciones IP. Esto resulta ?til cuando disponemos de una
red privada pero no disponemos de ning?n servidor de DNS configurado.
Tambi?n se podr?a configurar ``/etc/hosts`` para que resolviera nombres
de m?quinas internos; consulte
`hosts(5) <http://www.FreeBSD.org/cgi/man.cgi?query=hosts&sektion=5>`__
para obtener m?s informaci?n al respecto. La opci?n ``-alldirs`` permite
que los subdirectorios del directorio ``/home`` tamb?en se puedan
utilizar como puntos de montaje. En otras palabras, esto permite que los
clientes puedan trabajar sobre los subdirectorios en los que est?n
realmente interesados.

.. code:: programlisting

    /home  -alldirs  10.0.0.2 10.0.0.3 10.0.0.4

La siguiente l?nea exporta el directorio ``/a`` de tal forma que puedan
acceder a dicho directorio dos m?quinas situadas en distintos dominios.
La opci?n ``-maproot=root`` permite que el usuario ``root`` de la
m?quina cliente modifique los datos del sistema de ficheros en red como
si fuera el usuario ``root`` del servidor. Si no se especifica la opci?n
``-maproot=root`` el usuario ``root`` del cliente puede no poseer los
permisos necesarios para realizar modificaciones en el sistema de
ficheros.

.. code:: programlisting

    /a  -maproot=root  host.example.com box.example.org

Para que un cliente pueda acceder al sistema de ficheros exportado debe
poseer permisos para ello. Debemos asegurarnos de que el cliente se
encuentra listado en ``/etc/exports``.

Dentro de ``/etc/exports`` cada l?nea representa informaci?n de
exportaci?n de un sistema de ficheros para un determinado conjunto de
m?quinas. Una m?quina s?lo puede aparecer una vez dentro de un sistema
de ficheros exportable y el archivo s?lo puede tener una ?nica entrada
por defecto. Por ejemplo, si suponemos que ``/usr`` es un ?nico sistema
de ficheros la siguiente configuraci?n de ``/etc/exports`` ser?a
incorrecta:

.. code:: programlisting

    /usr/src   client
    /usr/ports client

Existe un sistema de ficheros, concretamente ``/usr``, que posee dos
l?neas con reglas de exportaci?n para la misma m?quina, ``client``. El
formato correcto para esta situaci?n ser?a el siguiente:

.. code:: programlisting

    /usr/src /usr/ports  client

Las propiedades de un sistemas de ficheros que se exporta al exterior
deben aparecer agrupadas bajo la misma l?nea. L?neas que no poseen
ning?n cliente se tratan como si tuvieran una ?nica m?quina. Esto limita
la forma en que pueden configurarse la exportaciones de sistemas de
ficheros pero para la mayor?a de la gente no suele ser un problema.

El ejemplo que se muestra a continuaci?n es una muestra de una lista de
exportaci?n correcta, donde ``         /usr`` y ``/exports`` son
sistemas de ficheros locales:

.. code:: programlisting

    # Exportar src y ports a cliente01 y cliente02, pero
    # solo el cliente01 tiene acceso root
    /usr/src /usr/ports -maproot=root    cliente01
    /usr/src /usr/ports               cliente02
    # Las maquinas cliente tienen acceso root y pueden montar todo lo que aparezca
    # en /exports.  Cualquier sistema puede montar /exports/obj en modo
    # solo lectura
    /exports -alldirs -maproot=root      cliente01 cliente02
    /exports/obj -ro

Se debe reiniciar el d?mon mountd siempre que se modifique el contenido
del archivo ``/etc/exports`` para que los cambios surtan efecto. Esto se
realiza enviando la se?al HUP al proceso ``mountd``:

.. code:: screen

    # kill -HUP `cat /var/run/mountd.pid`

Tambi?n se puede reiniciar FreeBSD para que se cargue la nueva
configuraci?n pero este mecanismo no resulta necesario si se ejecutan
las ?rdenes como ``root``, que ponen el servidor de NFS de nuevo en
funcionamiento.

En el servidor de NFS:

.. code:: screen

    # portmap
    # nfsd -u -t -n 4
    # mountd -r

En el cliente de NFS:

.. code:: screen

    # nfsiod -n 4

En este punto todo deber?a estar preparado para poder anclar el sistema
de ficheros remoto en la m?quina cliente. En los siguientes ejemplos el
nombre del servidor es ``server`` y el punto de montaje temporal
utilizado por el cliente es ``client``. Si se desea montar el sistema de
ficheros de forma temporal o simplemente comprobar que la configuraci?n
funciona sin problemas se puede ejecutar una orden como la que se
muestra a continuaci?n con permisos de ``root`` en la m?quina cliente:

.. code:: screen

    # mount server:/home /mnt

Esta orden ancla el directorio ``/home`` del servidor en el directorio
``/mnt`` del cliente. Si todo funciona correctamente deber?a poder
entrar en el directorio ``/mnt`` del cliente y ver todos los ficheros
que se encuentran en el directorio ``/home`` del servidor.

Si queremos anclar autom?ticamente un sistema de ficheros remoto cuando
la m?quina est? arrancando se puede a?adir una l?nea como la siguiente
dentro de ``/etc/fstab``:

.. code:: programlisting

    servidor:/home /mnt    nfs rw  0   0

`fstab(5) <http://www.FreeBSD.org/cgi/man.cgi?query=fstab&sektion=5>`__
comenta todas las opciones disponibles.

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

29.6.3. Usos pr?cticos
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El protocolo NFS tiene m?ltiples usos pr?cticos. Los m?s t?picos se
enumeran a continuaci?n:

.. raw:: html

   <div class="itemizedlist">

-  Compartici?n de la unidad de CDROM entre varias m?quinas. Esto
   resulta ser m?s barato y una forma m?s conveniente para instalar
   software en varias m?quinas.

-  En grandes redes puede ser m?s adecuado configurar un servidor
   central de NFS en el cual se almacenen todos los “homes” de los
   distintos usuarios. Estos directorios se pueden exportar a trav?s de
   la red de tal forma que los usuarios pueden trabajar con el mismo
   directorio independientemente de la m?quina que utilicen.

-  Varias m?quinas pueden poseer el directorio ``/usr/ports/distfiles``
   compartido. De este modo cuando necesitemos instalar un port en
   varias m?quinas, se puede acceder r?pidamente a las fuentes sin
   necesidad de bajarlas una vez para cada m?quina.

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

29.6.4. Anclajes autom?ticos usando amd
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div>

Escrito por Wylie Stilwell.

.. raw:: html

   </div>

.. raw:: html

   <div>

Reescrito por Chern Lee.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El d?mon
`amd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=amd&sektion=8>`__
(“the automatic mounter daemon”, o d?mon de montaje autom?tico)
autom?ticamente ancla un sistema de ficheros remoto cuando se tiene que
acceder a un fichero perteneciente a dicho sistema. Los sistemas de
ficheros que permanecen inactivos durante un determinado periodo de
tiempo son autom?ticamente desmontados por el mismo d?mon. Este d?mon
proporciona una alternativa sencilla a la utilizaci?n de los montajes
permanentes que normalmente se especifican a trav?s del fichero
``         /etc/fstab``.

amd trabaja actuando como un servidor servidor de NFS para los
directorios ``/host`` y ``/net``. Cuando se accede a alg?n fichero
ubicado bajo estos directorios amd busca el punto de montaje remoto y
autom?ticamente lo monta. El directorio ``         /net`` se utiliza
para anclar sistemas de ficheros remotos especificados mediante
direcciones IP, mientras que el directorio ``/host`` almacena aquellos
sistemas de ficheros remotos que han sido especificados mediante un
nombre de m?quina.

amd detecta cualquier intento de acceder a un fichero dentro del
directorio ``/host/foobar/usr`` y se encarga de montar el sistema de
ficheros remoto (``/usr``) en la m?quina, en caso de que no estuviera ya
anclado.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Ejemplo 29.1. Anclaje de una exportaci?n utilizando amd

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

``showmount`` muestra los puntos de montaje que posee una m?quina
remota. Por ejemplo para conocer los montajes de un m?quina llamada
``foobar``, se puede utilizar:

.. code:: screen

    % showmount -e foobar
    Exports list on foobar:
    /usr                               10.10.10.0
    /a                                 10.10.10.0
    % cd /host/foobar/usr

.. raw:: html

   </div>

.. raw:: html

   </div>

Como se observa en el ejemplo, ``showmount`` muestra el directorio
``/usr`` como una exportaci?n. Cuando se cambia el directorio actual al
directorio ``/host/foobar/usr`` el d?mon amd intenta resolver el nombre
``foobar`` y autom?ticamente ancla el sistema de ficheros remoto.

El d?mon amd se puede ejecutar a partir de los scripts de inicio,
utilizando la siguiente l?nea del archivo de configuraci?n
``/etc/rc.conf``:

.. code:: programlisting

    amd_enable="YES"

Adem?s, amd soporta opciones adicionales que pueden definirse mediante
la variable ``amd_flags``. Por defecto, la variable ``amd_flags`` posee
las siguientes opciones:

.. code:: programlisting

    amd_flags="-a /.amd_mnt -l syslog /host /etc/amd.map /net /etc/amd.map"

El archivo ``/etc/amd.map`` define las opciones por defecto con las
cuales se anclan los sistemas de ficheros remotos. El archivo
``/etc/amd.conf`` define algunas caracter?sticas avanzadas para el d?mon
amd.

Se ruega consultar las p?ginas del manual de
`amd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=amd&sektion=8>`__ y de
`amd.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=amd.conf&sektion=5>`__
para obtener m?s informaci?n.

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

29.6.5. Problemas de integraci?n con otras plataformas
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div>

Escrito por John Lind.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Determinados adaptadores Ethernet para sistemas basados en el bus ISA
poseen restricciones que pueden producir serios problemas de red, en
particular con el protocolo NFS. Estos problemas no son espec?ficos de
FreeBSD, pero los sistemas FreeBSD se ven afectados por ellos.

El problema surge casi siempre cuando el sistema (FreeBSD) est?
empotrado dentro de una red compuesta por estaciones de trabajo de alto
rendimiento, como por ejemplo estaciones de Silicon Graphics y de Sun
Microsystems. El montaje del sistema de ficheros remoto suele funcionar
perfectamente y algunas operaciones sobre el el sistema de ficheros
pueden tener ?xito pero de repente el el servidor que no responde a las
peticiones del cliente, aunque peticiones y respuestas de otros clientes
funcionan con normalidad y se contin?an procesando. Esto sucede en los
sistemas clientes, tanto en sistemas FreeBSD como en otras estaciones de
trabajo. En muchos sistemas, lo ?nico que se puede hacer es resetear la
m?quina de forma abrupta, ya que el bloqueo producido por el protocolo
NFS no se puede solucionar.

Aunque la soluci?n “correcta” consiste en obtener un adaptador Ethernet
con mayor rendimiento y capacidad, todav?a se puede aplicar un parche
sencillo que puede llegar a permitir un funcionamiento sin problemas. Si
el sistema FreeBSD act?a como servidor de *NFS* se puede inclu?r la
opci?n ``w=1024`` cuando el ejecute una petici?n de montaje sobre dicho
servidor. Si FreeBSD dicho servidor. Si FreeBSD act?a como cliente de
*NFS*, se puede ejecutar
`mount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount&sektion=8>`__
con el par?metro ``-r=1024``. Estas opciones se pueden especificar en el
``/etc/fstab`` del cliente para que entren en funcionamiento cuando se
realicen montajes autom?ticos y tambi?n se puede utilizar el par?metro
``-o`` de
`mount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount&sektion=8>`__
cuando se realicen montajes manuales.

Resulta apropiado resaltar que existe un problema totalmente distinto
que algunas veces se confunde con el que acabamos de describir, que
aparece cuando el servidor y los clientes se encuentran en redes
diferentes. Si nos encontramos en esta situaci?n debemos *asegurarnos*
de que nuestros “ routers” est?n encaminando correctamente los paquetes
UDP que genera el protocolo NFS pues en caso contrario el sistema no
funcionar?, independientemente de los ajustes que se realicen en el
cliente o en el servidor.

En los siguientes ejemplos ``fastws`` es el nombre de una estaci?n de
trabajo de altas prestaciones y ``     freebox`` es el nombre de un
sistema FreeBSD con un adaptador Ethernet de bajas prestaciones. Se
pretende adem?s exportar el directorio ``/sfcompartido`` (ver
`exports(5) <http://www.FreeBSD.org/cgi/man.cgi?query=exports&sektion=5>`__)
y el directorio ``/projecto``. Tenga en cuenta que en cualquier caso
puede resultar ?til definir opciones adicionales a las que que se
muestran en el siguiente ejemplo, como pueden ser ``hard``, ``soft`` o
``bg``. Esto depender? de la aplicaci?n que utilice el sistema de
ficheros remoto.

Ejemplos de configuraci?n para el sistema FreeBSD (``freebox``) que
act?a como cliente. Configuraci?n del archivo ``/etc/fstab`` de
``freebox``:

.. code:: programlisting

    fastws:/sfcompartido /projecto nfs rw,-r=1024 0 0

Orden de ejecuci?n manual para ``freebox``:

.. code:: screen

    # mount -t nfs -o -r=1024 fastws:/sfcompartido /projecto

Ejemplos de configuraci?n para el sistema FreeBSD que act?a como
servidor. Configuraci?n de ``/etc/fstab`` de ``fastws``:

.. code:: programlisting

    freebox:/sfcompartido /projecto nfs rw,-w=1024 0 0

Orden de ejecuci?n manual para ``fastws``:

.. code:: screen

    # mount -t nfs -o -w=1024 freebox:/sfcompartido /projecto

Casi cualquier adaptador Ethernet de 16 bits permite operar sin operar
sin las restricciones anteriores sobre el tama?o de lectura o escritura
especificado por defecto.

Por si alguien estuviera interesado a continuaci?n se muestra el error
que aparece en estos casos, lo cual explica por qu? decimos que el error
resulta irrecuperable. NFS trabaja t?picamente con un tama?o de “bloque”
de 8?K (aunque se pueden producir fragmentos de menor tama?o). Debido a
que el m?ximo tama?o de los paquetes Ethernet se encuentra alrededor de
los 1500?bytes el “bloque” de NFS se trocea en varios paquetes Ethernet
aunque desde el punto de vista del protocolo NFS se trata como si fuese
un ?nico paquete. Los trozos deben reensamblarse en el destino y se debe
enviar una *confirmaci?n* para el bloque recibido. Las estaciones de
trabajo de altas prestaciones pueden soltar paquetes NFS de forma
cont?nua uno despu?s de otro, lo m?s juntos posible. Por otro lado en
las tarjetas de red m?s peque?as y de menor capacidad puede ocurrir que
un paquete recien llegado a la tarjeta sobreescriba informaci?n
perteneciente a un paquete anterior antes de que llegue a ser
transmitido completamente, de tal forma que al recibirse el bloque NFS
no puede ser ni reconstruido ni ni reconocido. Como resultado de este
proceso la m?quina tratar? de enviar el mismo paquete transcurridos unos
instantes de espera, pero se tratar?n de enviar de nuevo los 8?K que
constituyen un bloque NFS, y de esta forma se repetir? el el proceso,
as? hasta el infinito.

Si se mantiene el tama?o del bloque por debajo del tama?o de paquete
m?ximo de Ethernet, podemos asegurar que cualquier paquete Ethernet
transporta un bloque NFS, el cual puede asentirse individualmente,
evitando as? la explosi?n de paquetes y el eventual bloqueo del sistema.

Desbordamientos circulares del “buffer” (“ overruns”) pueden producirse
si nos encontramos con una estaci?n de trabajo de altas prestaciones que
env?a cont?nuamente mucho tr?fico a un sistema convencional, pero con
tarjetas Ethernet de buena calidad, estos desbordamientos resultan
altamente improbables para el caso de los tama?os de bloque por defecto
generados por el sistema NFS. Cuando se produce un desbordamiento, las
unidades afectadas se retransmiten, y existe una gran probabilidad de
que se reciban, se reensamblen y se confirmen.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------+----------------------------------------+--------------------------------------------+
| `Anterior <network-bridging.html>`__?   | `Subir <advanced-networking.html>`__   | ?\ `Siguiente <network-diskless.html>`__   |
+-----------------------------------------+----------------------------------------+--------------------------------------------+
| 29.5. Puenteado?                        | `Inicio <index.html>`__                | ?29.7. Ejecuci?n sin disco duro            |
+-----------------------------------------+----------------------------------------+--------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
