=====================
25.2. Uso de User PPP
=====================

.. raw:: html

   <div class="navheader">

25.2. Uso de User PPP
`Anterior <ppp-and-slip.html>`__?
Cap?tulo 25. PPP y SLIP
?\ `Siguiente <ppp.html>`__

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

25.2. Uso de User PPP
---------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Originalmente contribuido por Brian Somers.

.. raw:: html

   </div>

.. raw:: html

   <div>

Con apoyo de Nik Clayton, Dirk Fr?mberg, Peter Childs y Tom Rhodes.

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

25.2.1. User PPP
~~~~~~~~~~~~~~~~

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

25.2.1.1. Aclaraciones
^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Este documento asume que usted cuenta con lo siguiente:

.. raw:: html

   <div class="itemizedlist">

-  

   Una cuenta activa con un Proveedor del Servicio de Internet (ISP—por
   sus siglas en ingl?es), que usted utliza para conectarse.

-  Adicionalmente, un m?dem o alg?n otro dispositivo, conectado a su
   sistema, y configurado correctamente, que le permite realizar la
   conexi?n con su ISP.

-  El n?mero telef?nico de su proveedor.

-  

   Su nombre de usuario y contrase?a. (Ya sea un nombre de usuario y/o
   contrase?a estilo UNIX, o bien para uso por medio de PAP o CHAP)

-  

   La direcci?n IP de uno o m?s servidores de nombres (DNS).
   Normalmente, estos ser?n provistos por su proveedor de Internet. Si
   su proveedor no le ha dado esta informaci?n, puede utilizar la opci?n
   ``enable dns`` en su fichero ``ppp.conf``, para indicarle a ppp que
   configure el DNS por usted. Esta caracter?stica depende del sistema
   de negociaci?n de DNS que mantenga su proveedor de Internet.

.. raw:: html

   </div>

La siguiente informaci?n puede ser que haya sido provista por su
proveedor de servicios de internet, pero no es completamente necesaria:

.. raw:: html

   <div class="itemizedlist">

-  La direcci?n IP del gateway (pasarela de salida) de su PSI. El
   gateway es la m?quina a la cual usted se conectar? y ser? la *ruta
   por default*. Si usted no cuenta con esta informaci?n, puede inventar
   uno y al intentar conectarse, el servidor de su PSI, este nos
   indicar? cual es el valor correcto.

   Esta direcci?n IP, es referida por ppp como ``HISADDR``.

-  La mascara de red (netmask) que debe utilizar. Si su PSI no le ha
   provisto de una, puede utilizar sin problema ``255.255.255.255``.

-  

   Si su PSI, le ha provisto de una direcci?n de IP est?tica y un nombre
   de host, puede capturarla. De otra forma podemos dejar que el
   servidor asigne cualquier IP que corresponda.

.. raw:: html

   </div>

Si usted no cuenta con alguna de la informaci?n que hemos comentado, le
recomendamos contactar con su PSI para requerirla.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

En el transcurso de la presente secci?n, algunos ejemplos muestran el
contenido de archivos de configuraci?n los cuales presentan una
numeraci?n. Estos n?meros sirven como ayuda y referencia a cada l?nea,
pero estos no deben de estar presentes en el archivo original. Una
sangr?a adecuada, as? como espacios adecuados, tambi?n son de suma
importancia.

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

25.2.1.2. Preparando el Kernel
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Como se comento anteriormente, la aplicaci?n ppp utiliza el dispositivo
``tun``. Si este dispositivo no ha sido compilado dentro del kernel, ppp
lo cargar? como m?dulo cuando sea requerido. El dispositivo tun es
din?mico, de tal forma que se generara de acuerdo a la demanda que tenga
(usted no esta limitado por el kernel).

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Vale la pena hacer notar que el controlador tun, crea los dispositivos
de acuerdo a sus necesidades, por lo que el comando ``ifconfig -a``, no
necesariamente mostrar? los dispositivos ``tun``.

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

25.2.1.3. Verificando el dispositivo ``tun``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Bajo circunstancias normales, la mayor?a de los usuarios s?lo utilizaran
un dispositivo ``tun`` (``/dev/tun0``). En lo sucesivo podemos hacer
referencia a ``tun0`` con la expresi?n ``tunN`` donde ``N`` es el n?mero
que corresponde en su sistema.

Para instalaciones de FreeBSD que no tienen el habilitado el DEVFS la
existencia de ``tun0`` debe ser verificada (esto no es necesario si se
cuenta habilitada la opci?n DEVFS ya que los nodos de dispositivos se?n
creados en funci?n a las necesidades).

La forma m?s sencilla de verificar si el dispositivo ``tun0`` se
encuentra configurado correctamente, es la de rehacer el dispositivo.
Para hacer esto simplemente siga los siguientes pasos:

.. code:: screen

    # cd /dev
    # sh MAKEDEV tun0

Si usted necesita 16 dispositivos tun en su kernel, deber? crearlos.
Esto puede hacerse de la siguiente manera:

.. code:: screen

    # cd /dev
    # sh MAKEDEV tun15

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

25.2.1.4. Configuraci?n de la Resoluci?n de Nombres
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

La resoluci?n es la parte del sistema que busca una direcci?n IP en los
nombres de servidores (host) y viceversa. Puede ser configurado para que
busque en "mapas" que describen la IP del servidor en uno de dos
lugares, el primero es un archivo llamado ``/etc/hosts``. Lea
`hosts(5) <http://www.FreeBSD.org/cgi/man.cgi?query=hosts&sektion=5>`__
para m?s informaci?n al respecto. El segundo es el Servicio de Nombres
de Dominio de Internet (DNS-Internet Domain Name Service), el cual es
una base de datos de distribuci?n. Para mayor informaci?n con respecto a
los DNS, referirse a dns.

La resoluci?n de nombres es un sistema que por medio de llamadas,
realiza el mapeo de nombres, pero es necesario inidicarle donde debe
buscar la informaci?n. Para versiones de FreeBSD anteriores a la 5.0,
esto es hecho al editar el archivo ``/etc/host.conf``. La versi?n 5.0 de
FreeBSD utiliza el archivo ``/etc/nsswitch.conf``.

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

25.2.1.4.1. Edici?n del archivo ``/etc/host.conf``
''''''''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Para versiones de FreeBSD anteriores a la 5.0, este archivo debe
contener las siguientes dos l?neas (en este orden):

.. code:: programlisting

    hosts
    bind

Esto le indica a la resoluci?n que busque en primer t?rmino en el
archivo ``/etc/hosts``, y posteriormente en el DNS, si el nombre no fu?
localizado

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

25.2.1.4.2. Editando el archivo ``/etc/nsswitch.conf``
''''''''''''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Para versiones de FreeBSD 5.0 y posteriores, este archivo debe contener,
al menos, la siguiente l?nea:

.. code:: programlisting

    hosts: files, dns

Esto le indica a la resoluci?n de nombres, que busque en primer lugar en
el archivo ``/etc/hosts``, y en caso de que el nombre no haya sido
localizado, busque en el DNS.

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

25.2.1.4.3. Editando el archivo ``/etc/hosts``
''''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Este archivo puede contener direcciones IP, as? como el nombre de las
m?quinas de su red local. Como m?nimo debe contar con la informaci?n de
la m?quina que correr? ppp. Asumiendo que su ordenador se llama
``foo.bar.com`` con la direcci?n IP ``10.0.0.1``, el archivo
``/etc/hosts`` debiese contener:

.. code:: programlisting

    127.0.0.1 localhost.bar.com   localhost
    ::1 localhost.bar.com   localhost
    10.0.0.1    foo.bar.com     foo

Las primeras dos l?neas definen el alias del ``localhost``, como
sin?nimo de la maquina actual. Independientemente de su propia direcci?n
IP, la direcci?n IP en estas l?neas siempre debe ser ``127.0.0.1`` y
``::1``. La ?ltima l?nea especifica el nombre ``         foo.bar.com``
(asi como ``foo`` para acortarlo), para la direcci?n ``10.0.0.1``.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

La direcci?n ``127.0.0.1`` y el nombre ``localhost`` son conocidos como
direcciones "loopback" las cuales hacen un "loopback" (salto de regreso)
a la maquina local.

.. raw:: html

   </div>

Si su proveedor de Internet, le asigna una direcci?n IP fija, as?n como
un nombre, y usted no lo utiliza como nombre del host, a?ada esto
tambi?n al archivo ``/etc/hosts``.

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

25.2.1.4.4. Editando el archivo ``/etc/resolv.conf``
''''''''''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El archivo ``/etc/resolv.conf``, le indica a la resoluci?n de nombres,
como comportarse. Normalmente deber? de incluir la(s) siguiente(s)
l?nea(s):

.. code:: programlisting

    domain ejemplo.com
    nameserver x.x.x.x
    nameserver y.y.y.y

Donde *``x.x.x.x``* y *``y.y.y.y``* deben reemplazarse con las
direcciones IP de los servidores DNS, de su ISP. Puede ser que esta
informaci?n se la hayan entregado al suscribirse o no, pero una r?pida
llamada a su ISP debe resolver esto.

Tambi? puede configurar su sistema, de tal forma que
`syslog(3) <http://www.FreeBSD.org/cgi/man.cgi?query=syslog&sektion=3>`__
provee de un login para su conecci?n por PPP. S?lo a?ada:

.. code:: programlisting

          !ppp
          *.*        /var/log/ppp.log

al fichero ``/etc/syslog.conf``. En la mayor?a de los casos esto
funciona bien.

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

25.2.1.5. Configuraci?n Autom?tica de PPP
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Ambos, ``ppp`` as? como ``pppd`` (la implementaci?n del kernel para
PPP), utilizan la configuraci?n de los archivos localizados en el
directorio ``/etc/ppp``. Ejemplos para ppp, pueden encontrarse en:
``/usr/share/examples/ppp/``.

Para efecto de configurar correctamente ``ppp``, es necesario editar
varios ficheros, dependiendo de sus necesidades. La manera en que edite
dichos archivos, depende en la forma que utilice su PSI (Proveedor de
Servicios de Internet) para brindarle conexi?n, ya sea por medio de una
direcci?n IP est?tica o bien una IP din?mica (ya sea que cada vez que se
conecta obtiene una nueva direcci?n).

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

25.2.1.5.1. PPP y direcciones de IP est?ticas (fijas)
'''''''''''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Ser? necesario editar el archivo de configuraci?n;
``/etc/ppp/ppp.conf``. Y deber? quedar de una manera similar al ejemplo
que se describe a continuaci?n.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Las l?neas que terminan con ``:``, deben comenzar en la primer columna
del archivo — el resto de las l?neas deber?n utilizar sangr?a como se
muestra, utilizando espacios o bien el tabulador. La mayor parte de la
informaci?n que requiere ingresar aqui, se mostro en el marcado manual
anterior.

.. raw:: html

   </div>

.. code:: programlisting

    1     default:
    2       set log Phase Chat LCP IPCP CCP tun command
    3       ident user-ppp VERSION (built COMPILATIONDATE)
    4       set device /dev/cuaa0
    5       set speed 115200
    6       set dial "ABORT BUSY ABORT NO\\sCARRIER TIMEOUT 5 \
    7                 \"\" AT OK-AT-OK ATE1Q0 OK \\dATDT\\T TIMEOUT 40 CONNECT"
    8       set timeout 180
    9       enable dns
    10
    11    provider:
    12      set phone "(123) 456 7890"
    13      set authname foo
    14      set authkey bar
    15      set login "TIMEOUT 10 \"\" \"\" gin:--gin: \\U word: \\P col: ppp"
    16      set timeout 300
    17      set ifaddr x.x.x.x y.y.y.y 255.255.255.255 0.0.0.0
    18      add default HISADDR

.. raw:: html

   <div class="variablelist">

L?nea 1:
    Identifica la entrada por omisi?n a utilizar. Los comandos descritos
    en esta parte, ser?n ejecutados de manera autom?tica cuando se
    ejecute ppp.

L?nea 2:
    Habilita los par?metros de acceso. Cuando la configuraci?n trabaja
    sin problemas, esta l?nea deber? quedar de la siguiente forma:

    .. code:: programlisting

        set log phase tun

    para efecto de evitar avisos masivos del sistema (logs).

L?nea 3:
    Esta l?nea le indica a PPP como identificarse ante el puerto. PPP se
    identifica, si tiene algun problema para efecto de establecer la
    conexi?n, en esta identificaci?n, PPP provee de cierta informaci?n
    que puede resultar util para detectar el probelma.

L?nea 4:
    Le indica a PPP cual es el dispositivo a utilizar para realizar la
    conexi?n, o bien al que esta conectado el m?dem. El dispositivo
    ``COM1`` es ``/dev/cuaa0`` y ``COM2`` es ``/dev/cuaa1``.

L?nea 5:
    Establece la velocidad a utilizar en la conexi?n. Si la velocidad de
    115200 no trabaja correctamente (la cual deberia con cualquier m?dem
    normal), intente con una velocidad inferior, como puede ser 38400.

L?neas 6 y 7:
    La cadena de inicializaci?n. El modo User PPP, utiliza y espera
    enviar-recibir, la informaci?n utilizando una sintaxis similar a la
    descrita en el programa
    `chat(8) <http://www.FreeBSD.org/cgi/man.cgi?query=chat&sektion=8>`__.
    Favor de consultar la p?gina de ayuda para conocer las opciones de
    este lenguaje.

    Nota: Este comando continua en la siguiente l?nea, para facilitar su
    lectura. Cualquier comando en el archivo ``ppp.conf`` puede utilizar
    este formato, siempre y cuando el ?ltimo caracter de la l?nea sea
    una diagonal invertida "\\".

L?nea 8:
    Establece el tiempo de espera que debe tratar de realizar la
    conexi?n. Por omisi?n se establecen 180 segundos, por lo que esta
    l?nea se deja por pura est?tica.

L?nea 9:
    Esta l?nea le indica a PPP, que solicite confirmaci?n al puerto,
    sobre la configuraci?n de la resoluci?n local. Si usted esta
    corriendo un servidor local de nombres, deber? comentar o eliminar
    esta l?nea.

L?nea 10:
    Una l?nea en blanco, para facilitar la lectura. Las l?neas en blanco
    son ignoradas por PPP.

L?nea 11:
    Identifica el incio de datos para un “proveedor” determinado, de
    servicios de internet. Este podr? ser cambiado por el nombre de su
    ISP, de tal forma que en lo sucesivo utilice la opci?n ``load ISP``,
    para iniciar una sesi?n.

L?nea 12:
    Indica el numero telef?nico del proveedor. Pueden indicarse varios
    numeros a utilizar, utilizando el signo de dos puntos (``:``) o bien
    la barra (``|``) como separador. La diferencia entre estos dos
    separadores, es detallada en el
    `ppp(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ppp&sektion=8>`__.
    Pero en resumen, se puede decir que si se desean utilizar varios
    numeros de manera aleatoria se debe utilizar los dos puntos, pero si
    se desea siempre utilizar el primer numero y en caso de falla el
    siguiente y as? sucesivamente, se debe utilizar la barra. Es
    importante que todo lo que se refiere a numeros telefonicos, este
    entre comillas como se muestra. Es importante que si piensa usar
    espacios en los numeros, haga uso de estas comillas (``"``). La
    falta de estas pueden ocasionar un simple error.

L?neas 13 y 14:
    Identifica el nombre de usuario y su contrase?a. Cuando uno se
    conecta utilizando un login de tipo Unix, estos valores hacen
    referencia al comando ``set login``, utilizando las variables \\U y
    \\P. Cuando la conexi?n es utilizando alg?n metodo como PAP o CHAP,
    estos valores, son utilizados al momento de la autentificaci?n.

L?nea 15:
    Si usted esta utilizando el metodo PAP o CHAP, no habr? un login en
    este punto, y esta l?nea deber? ser comentada (utilizando el s?mbolo
    ``#`` al principio de la l?nea) o bien eliminada por completo. Vea
    la parte `Autentificaci?n con PAP y
    CHAP <userppp.html#userppp-PAPnCHAP>`__ para m?s detalles.

    La cadena de acceso (login), utiliza la misma sint?xis que se
    utiliza en la cadena de marcado. En este ejemplo, la cadena sirve
    para un servicio, en el cual el inicio de sesi?n se ve algo as? como
    lo siguiente:

    .. code:: screen

        Proveedor de servicios X
        login: foo
        password: bar
        protocol: ppp

    Es recomendable editar el script, para que se ajuste a sus propias
    necesidades. Cuando cree este script por primera vez, asegurese de
    haber habilitado la parte que se refiere a al acceso por medio de
    “chat”, para efecto de poder dar seguimiento al curso de la conexi?n
    y la resoluci?n de la misma.

L?nea 16:
    Establece el tiempo por defecto en el que se perder? la conexi?n (en
    segundos). En este caso la conexi?n ser? cortada de forma
    autom?tica, despu?s de 300 segundos de inactividad. Si no desea
    habilitar esta funci?n establezca este valor en cero o bien utilice
    el comando en l?nea ``-ddial``.

L?nea 17:
    Indica la direcci?n de la interfaz. La cadena que aparece como
    *``x.x.x.x.``*, debe se cambiada por la direcci?n asignada por su
    PSI. La l?nea que aparece como *``y.y.y.y.``*, debe se substituida
    por la direcci? IP especificada por su PSI, como servidor de salida
    o pasarela (gateway)(la maquina a la cual se va a conectar). Si su
    PSI no le ha indicado una direcci?n de este tipo, puede utilizar
    ``10.0.0.2/0``. Si usted necesita utilizar una direcci?n
    “aleatoria”, asegurese de crear el fichero ``/etc/ppp/ppp.linkup``,
    siguiendo las instrucciones de `PPP y las direcciones de IP
    Din?micas <userppp.html#userppp-dynamicIP>`__, para su llenado. Si
    esta l?nea es omitida, ``ppp``, no podr? ejecutarse en el modo
    ``-auto``.

L?nea 18:
    A?ade una ruta por omisi?n al servidor de salida de su PSI. La
    palabra especial ``HISADDR`` se reemplaza con la direcci?n del
    gateway indicado por su PSI, que esta en la l?nea 9, de otra forma
    ``HISADDR`` no ser? inicializado.

    Si no desea ejecutar ``ppp`` en modo ``-auto``, esta l?nea deber?
    pasar al archivo ``ppp.linkup``.

.. raw:: html

   </div>

No hay necesidad de editar el archivo ``ppp.linkup`` si usted cuenta con
una direcci?n IP est?tica y se esta ejecutando ppp en modo ``-auto``, en
virtud de que para efecto de realizar la conexi?n sus mapas de ruteo
debe estar correctas. De cualquier forma puede ser que usted desee
ejecutar algun programa/comando, posterior a la conexi?n. Este es
explicado con m?s detalle posteriormente, cuando se vea el ejemplo de
sendmail.

Ejemplo de los archivos de configuraci?n, se pueden encontrar en el
directorio; ``/usr/share/examples/ppp``.

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

25.2.1.5.2. PPP y direcciones de IP Din?micas (Variables)
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Si su proveedor de servicios, no le asigna una direcci?n de IP fija,
ser? necesario configurar a ``ppp``, de tal forma que al momento de
realizar la conexi?n, negocie tanto la direcci?n local, como la remota.
Esto se lleva a cabo al “adivinar” una direcci?n IP y permitiendo a
``ppp`` que la establezca correctamente, usando el Protocolo de
Configuraci?n de IP (IPCP), una vez que se ha conectado. La
configuraci?n que debe tener el archivo ``ppp.conf``, es la misma que la
utilizada en `PPP y direcciones de IP
fijas <userppp.html#userppp-staticIP>`__, salvo el siguiente cambio:

.. code:: programlisting

    17      set ifaddr 10.0.0.1/0 10.0.0.2/0 255.255.255.255

Una vez m?s, no debe incluir el numero de l?nea, este s?lo es una
referencia. As? mismo deber? existir sangrado, de cuando menos 1
espacio.

.. raw:: html

   <div class="variablelist">

L?nea 17:
    El numero siguiente a la diagonal (``/``), es el numero de bits de
    la direcci?n en la cual ppp insistir? en conectarse. Puede ser que
    usted desee utilizar numeros de IP que sean m?s apropiados, para
    ajustar a sus necesiadades, pero el ejemplo descrito anteriormente
    siempre podr? utilizarse.

    El ?ltimo argumento (``0.0.0.0``), le indica a PPP, que inicie las
    negociaciones, utilizando como direcci?n ``0.0.0.0``, en lugar de
    que utilice ``10.0.0.1``, lo cual es necesario con algunos
    proveedores. No utilice la direcci?n ``0.0.0.0`` como el primer
    argumento, para el comando ``set ifaddr``, ya que impide que PPP
    configure de forma correcta el sistema, cuando se utiliza en modo
    ``-auto``.

.. raw:: html

   </div>

Si usted no esta ejecutando PPP en modo ``-auto``, deber? editar su
archivo ``/etc/ppp/ppp.linkup``. El archivo ``ppp.linkup``, es utilizado
una vez que se ha realizado la conexi?n. En este punto, ``ppp`` habr?
negociado una direcci?n de interfaz, y ser? posible ahora, a?adir las
entradas para la las tablas de ruteo:

.. code:: programlisting

    1     provider:
    2      add default HISADDR

.. raw:: html

   <div class="variablelist">

L?nea 1:
    Al establecer (``ppp``) una conexi?n, buscar? en ``ppp.linkup`` una
    entrada, de acuerdo a las siguientes reglas. Primero, tratar de
    encontrar una entrada que sea igual a la utilizada en el archivo
    ``ppp.conf``. Si esto falla, buscar una IP con la direcci?n de
    nuestro gateway. Esta entrada es una etiqueta de tipo IP, de
    cuatro-octetos. Si aun despu?s de esto no se ha detectado la entrada
    correcta, buscar la entrada ``MYADDR``.

L?nea 2:
    Esta l?nea le indica a ``ppp`` que a?ada una ruta por omisi?n, que
    este dirigida hacia ``HISADDR``. ``HISADDR`` ser? reemplazada, con
    la IP del gateway, como se negocio por IPCP.

.. raw:: html

   </div>

Para ver un detalle m?s preciso de esto, puede consultar la entrada de
``pmdemand`` en los archivos de ejemplo
``/usr/share/examples/ppp/ppp.conf.sample`` as? como
``/usr/share/examples/ppp/ppp.linkup.sample``.

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

25.2.1.5.3. Recibiendo Llamadas Externas
''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Cuando se configure ppp, para recibir llamadas externas, en una maquina
conectada a un LAN (Red de Area Local), debe decidir si se va a permitir
el env?o de paquetes a la LAN. Si es as?, debe asignar un numero de IP
de su red local y utilizar el comando ``enable proxy`` en el archivo de
configuracion ``/etc/ppp/ppp.conf``. Tambi?n deber? asegurarse que en su
archivo ``/etc/rc.conf`` cuente con la l?nea:

.. code:: programlisting

    gateway_enable="YES"

.. raw:: html

   <div class="sect5">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

25.2.1.5.3.1. ?Qu? getty utilizar?
                                  

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El enlace Configurando FreeBSD para Servicios de Marcado provee de una
buena descripci?, sobre la configuraci?n de estos servicios, basado en
`getty(8) <http://www.FreeBSD.org/cgi/man.cgi?query=getty&sektion=8>`__.

Una alternativa para el comando ``getty`` es
`mgetty <http://www.leo.org/~doering/mgetty/index.html>`__, el cual es
una versi?n m?s inteligente de getty dise?ada para servicios de marcado
telefonico.

Una de las principales ventajas de ``mgetty`` es que, de hecho *platica*
con los modems, esto es, significativo, ya que si el puerto esta
desactivado en su ``/etc/ttys`` el modem no responder? el llamado.

Las ?ltimas versiones de ``mgetty`` (de la 0.99beta y sucesivas),
tambi?n cuentan con soporte para la detecci?n autom?tica de llamados de
PPP, permitiendo el acceso a servidores de una manera m?s sencilla (sin
uso de tanto scripts).

Puede referirse a `Mgetty y AutoPPP <userppp.html#userppp-mgetty>`__
para m?s informaci?n con respecto al comando ``mgetty``.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect5">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

25.2.1.5.3.2. Permisos de PPP
                             

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El comando ``ppp`` normalmente debe ser ejecutado por root
(superusuario). Si de cualquier forma, usted desea permitir que ``ppp``
pueda ser ejecutado en modo servidor, por un usuario regular, como se
describe a continuaci?n, deber? otorgar los permisos necesarios a ese
usuario al a?adirlo al grupo ``network``, en el fichero ``/etc/groups``.

Tambi?n ser? necesario darle acceso a una o m?s partes del archivo de
configuraci?n, haciendo uso del comando ``allow``, como se ve a
continuaci?n:

.. code:: programlisting

    allow users fred mary

Si el comando es utilizado en la secci?n ``default``, esto le dar? a
el(los) usuario(s) especificado(s), acceso a todo.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect5">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

25.2.1.5.3.3. Shells de PPP para Usuarios de IP Din?mica
                                                        

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Cree un fichero llamado: ``/etc/ppp/ppp-shell`` y que contenga lo
siguiente:

.. code:: programlisting

    #!/bin/sh
    IDENT=`echo $0 | sed -e 's/^.*-\(.*\)$/\1/'`
    CALLEDAS="$IDENT"
    TTY=`tty`

    if [ x$IDENT = xdialup ]; then
            IDENT=`basename $TTY`
    fi

    echo "PPP for $CALLEDAS on $TTY"
    echo "Starting PPP for $IDENT"

    exec /usr/sbin/ppp -direct $IDENT

Este script deber? ser ejecutable. Ahora cree un enl?ce simb?lico
llamado ``ppp-dialup`` a este script, utilizando los siguientes
comandos:

.. code:: screen

    # ln -s ppp-shell /etc/ppp/ppp-dialup

Deber? utilizar este script como *shell* para todos los usuarios que
realicen conexi?n. Este es un ejemplo del fichero ``/etc/password`` para
un usuario con acceso a PPP, con nombre de usuario ``pchilds`` (recuerde
no editar directamente el fichero password, utilice ``vipw``).

.. code:: programlisting

    pchilds:*:1011:300:Peter Childs PPP:/home/ppp:/etc/ppp/ppp-dialup

Cree un directorio llamado ``/home/ppp`` que contenga los siguentes
archivos de 0 bytes:

.. code:: screen

    -r--r--r--   1 root     wheel           0 May 27 02:23 .hushlogin
    -r--r--r--   1 root     wheel           0 May 27 02:22 .rhosts

los cuales impiden que ``/etc/motd`` sea desplegado.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect5">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

25.2.1.5.3.4. Shells de PPP para Usuarios de IP Est?tica
                                                        

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Cree el fichero ``ppp-shell`` al igual que el mencionado con
anterioridad, y por cada cuenta donde se tenga asignada una IP est?tica,
cree un enlace simb?lico al fichero ``ppp-shell``.

Por ejemplo, si usted cuenta con tres usuarios que utilicen este
servicio; ``fred``, ``sam`` y ``mary``, los cuales redirecciona a una
red de clase C, habria que hacer lo siguiente:

.. code:: screen

    # ln -s /etc/ppp/ppp-shell /etc/ppp/ppp-fred
    # ln -s /etc/ppp/ppp-shell /etc/ppp/ppp-sam
    # ln -s /etc/ppp/ppp-shell /etc/ppp/ppp-mary

Cada uno de los usuarios se?alados, deber?n de contar con el enlace a su
shell-script como se indic? (por ejemplo, el usuario ``mary``, debe
contar con su enlace al fichero ``/etc/ppp/ppp-mary``).

.. raw:: html

   </div>

.. raw:: html

   <div class="sect5">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

25.2.1.5.3.5. Configurando ``ppp.conf`` para Usuarios de IP-Din?mica
                                                                    

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El archivo ``/etc/ppp/ppp.conf`` deber? contener algo similar a lo
siguiente:

.. code:: programlisting

    default:
      set debug phase lcp chat
      set timeout 0

    ttyd0:
      set ifaddr 203.14.100.1 203.14.100.20 255.255.255.255
      enable proxy

    ttyd1:
      set ifaddr 203.14.100.1 203.14.100.21 255.255.255.255
      enable proxy

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Tomar en cuenta el sangrado, ya que es importante.

.. raw:: html

   </div>

La secci?n ``default:`` es cargada para cada sesi?n. Para cada l?nea que
exista y habilite el marcado, en el fichero ``/etc/ttys``, se deber?
crear una entrada similar a la l?nea ``ttyd0:`` mencionada arriba. Cada
l?nea debera contar con su propia direcci?n IP, de sus direcciones IP
disponibles para asignar din?micamente.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect5">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

25.2.1.5.3.6. Configurando ``ppp.conf`` para Usuarios de IP Est?tica
                                                                    

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Junto con el contenido del fichero de ejemplo
``/usr/share/examples/ppp/ppp.conf`` mencionado anteriormente, deber?
agregar una secci?n para cada usuario asignado est?ticamente.
Continuaremos con nuestro ejemplo con los usuarios ``fred``, ``sam`` y
``mary``.

.. code:: programlisting

    fred:
      set ifaddr 203.14.100.1 203.14.101.1 255.255.255.255

    sam:
      set ifaddr 203.14.100.1 203.14.102.1 255.255.255.255

    mary:
      set ifaddr 203.14.100.1 203.14.103.1 255.255.255.255

El archivo ``/etc/ppp/ppp.linkup`` deber? de contener tambi?n
informaci?n del ruteo, para cada IP est?tica, si es necesario. Las
l?neas a continuaci?n a?adir?n una ruta a la direcci?n ``203.14.101.0``
de clase C, por medio del ppp link del cliente.

.. code:: programlisting

    fred:
      add 203.14.101.0 netmask 255.255.255.0 HISADDR

    sam:
      add 203.14.102.0 netmask 255.255.255.0 HISADDR

    mary:
      add 203.14.103.0 netmask 255.255.255.0 HISADDR

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

25.2.1.5.4. Algo m?s de ``mgetty``, AutoPPP, y Extensiones MS
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect5">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

25.2.1.5.4.1. ``mgetty`` y AutoPPP
                                  

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Configurando y compilando ``mgetty`` con la opci?n ``AUTO_PPP``
habilitada, permite a ``mgetty`` detectar la fase LCP de conexiones PPP
y autom?ticamente enviarlo a un shel de ppp. Aun con esto, y debido a
que no se ingresa el nombre de usuario y contrase?a, es necesario
autntificarse por medio de PAP o CHAP.

Esta secci?n asume que el usuaio ha configurado, compilado e instalado
correctamente una versi?n de ``mgetty``, con la opci?n ``Auto_PPP``
(v0.99beta o posterior).

Asegurese de que su fichero ``/usr/local/etc/mgetty+sendfax/login.conf``
contiene la siguiente l?nea en ?l:

.. code:: programlisting

    /AutoPPP/ -     -             /etc/ppp/ppp-pap-dialup

Esto le indicar? a ``mgetty`` que ejecute el script ``ppp-pap-dialup``,
para efecto de detectar conexiones de tipo PPP.

Cree un fichero llamado ``/etc/ppp/ppp-pap-dialup`` que contenga las
siguientes l?neas (el fichero deber? ser ejecutable):

.. code:: programlisting

    #!/bin/sh
    exec /usr/sbin/ppp -direct pap$IDENT

Para cada l?nea de marcado habilitada en ``/etc/ttys``, cree la entrada
correspondiente en ``/etc/ppp/ppp.conf``. Esto co-existir? pac?ficamente
con las definiciaones que se hayan hecho, de acuerdo a lo mostrado en la
parte de arriba.

.. code:: programlisting

    pap:
      enable pap
      set ifaddr 203.14.100.1 203.14.100.20-203.14.100.40
      enable proxy

Cada usuario que ingrese al sistema utilizando este metodo, deber? de
contar con su clave de usuario, as? como su contrase?a, en el archivo
``/etc/ppp/ppp.secret``, o bien agrege la siguiente opci?n, para efecto
de que se pueda realizar la autentificaci?n por medio de PAP,
directamente del fichero ``/etc/password``.

.. code:: programlisting

    enable passwdauth

Si desea asignar una direcci?n IP fija a algunos usuarios, puede
especificar el n?mero como un tercer argumento en el fichero
``/etc/ppp/ppp.secrets``. Vea el archivo
``/usr/share/examples/ppp/ppp.secret.sample`` para obtener ejemplos m?s
detallados de esto.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect5">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

25.2.1.5.4.2. Extensiones de MS
                               

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Es posible configurar PPP, para efecto de que brinde a DNS y a NetBIOS,
direcciones de servidores de nombres de forma autom?tica.

Para efecto de habilitar estas extensiones con PPP versi?n 1.x, las
siguientes l?neas deber?n a?adirse a la secci?n relevante de
``/etc/ppp/ppp.conf``.

.. code:: programlisting

    enable msext
    set ns 203.14.100.1 203.14.100.2
    set nbns 203.14.100.5

Y para versiones de PPP 2 y posteriores:

.. code:: programlisting

    accept dns
    set dns 203.14.100.1 203.14.100.2
    set nbns 203.14.100.5

Esto le indicar? a los clientes, las direcciones del servidor primario y
secundario y el servidor-host para NetBIOS.

Si la l?nea ``set dns``, es omitida en versiones 2 y posteriores, PPP
utilizar? los valores que encuentre en ``/etc/resolv.conf``.

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

25.2.1.5.5. Autentificaci?n por medio de PAP y CHAP
'''''''''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Algunos proveedores de internet tienen su sistema configurado para que
cada usuario al conecatrse sean autentificados por medio de PAP o CHAP.
Si este es el caso, al momento de realizar la conexion, no aparecer? un
``login:``, sino que comenzar? a comunicarse PPP inmediatamente.

El metodo PAP es menos seguro que CHAP, pero la seguridad normalmente no
se toma mucho en cuenta en este tipo de conexiones, en funcion de que al
enviarse la informaci?n de contrase?a en texto plano, por medio de una
l?nea serial, no deja mucho espacio para que los crackers “husmeen”.

Haciendo referencia a lo que vimos de `PPP y Direcciones de IP
Fijas <userppp.html#userppp-staticIP>`__ o bien `PPP y Direcciones de IP
Din?micas <userppp.html#userppp-dynamicIP>`__, habr?a que aplicar los
siguientes cambios:

.. code:: programlisting

    7       set login
    …
    12      set authname MiNombreDeUsuario
    13      set authkey MiContrase?a

.. raw:: html

   <div class="variablelist">

L?nea 7:
    Su PSI normalmente requerir? que usted ingrese al sistema, cuando se
    utiliza PAP o CHAP. Por esta raz?n debemos deshabilitar la l?nea que
    corresponde a “set login”.

L?nea 12:
    Esta l?nea especif?ca a PAP/CHAP su nombre de usuario. Usted deber?
    cambiar el valor a quedar el nombre correcto en el campo;
    *``MiNombreDeUsuario``*.

L?nea 13:
    Esta l?nea especif?ca su contrase?a de PAP/CHAP. Es necesario que
    usted cambie el valor a quedar el dato correcto, en el campo;
    *``MiContrase?a``*. Quiz?s sea recomendable que a?ada una l?nea a
    quedar:

    .. code:: programlisting

        15      accept PAP

    o

    .. code:: programlisting

        15      accept CHAP

    la intenci?n de esto es para hacerlo obvio, aunque en realidad PAP y
    CHAP son aceptadas por omisi?n.

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

25.2.1.5.6. Cambiando la configuraci?n de ``ppp`` sobre la marcha (al vuelo)
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Es posible hablar con el programa ``ppp`` mientras se esta ejecutando en
segundo plano, pero s?lo si se ha habilitado un puerto de diagn?stico.
Para hacer esto, a?ada lo siguiente a su configuraci?n:

.. code:: programlisting

    set server /var/run/ppp-tun%d DiagnosticPassword 0177

Esto le indicar? a PPP que preste atenci?n al socket del dominio-Unix,
solicitando a los usuarios su contrase?a, antes de permitir el acceso.
La variable ``%d`` deber? ser reemplazada por el numero de dispositivo
``tun`` que este utilizando (ej. ``tun0``).

Una vez que se a configurado el socket, se puede utilizar
`pppctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pppctl&sektion=8>`__
en scripts que deseen manipular el programa.

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

25.2.1.6. Configuraci?n Final del Sistema
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Ahora usted cuenta con un ``ppp`` configurado, pero es necesario hacer
algunas cosas, antes de que este disponible para trabajar. Todas ellas
giran entorno a la edici?n del fichero ``/etc/rc.conf``.

En primer lugar es importante que se asegure que ha asignado un nombre a
su maquina. Esto se hace asignandolo en la l?nea de ``hostname=``, por
ejemplo:

.. code:: programlisting

    hostname="foo.ejemplo.com"

Si su Proveedor de Servicios de Internet (PSI), le ha provisto de una
direcci?n fija y un nombre de host, es recomendable que utilice este
como su ``hostname``.

Localice la l?nea que se refiera a sus dispositivos de red, la cual es
``network_interfaces``. Si desea configurar su sistema para marcar a su
PSI a petici?n, asegurese de que el dispositivo ``tun0`` este en la
lista, de otra forma eliminelo.

.. code:: programlisting

    network_interfaces="lo0 tun0" ifconfig_tun0=

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

La variable ``ifconfig_tun0`` debe permanecer en blanco (vacia), y
deber? crearse un fichero llamado ``/etc/start_if.tun0`` que contenga la
siguiente l?nea:

.. code:: programlisting

    ppp -auto MiSistema

Este script se ejecuta cuando se esta configurando la red, inicializando
el demonio de ppp de modo autom?tico. Si usted cuenta con una LAN (red
de ?rea local), de la cual esta maquina sea la pasarela (gateway), es
tambien recomendable que utilice la opci?n ``-alias``. Referirse a la
p?gina de ayuda (man) para mayores detalles.

.. raw:: html

   </div>

Especifique el programa router a ``NO``, con la siguiente l?nea en su
fichero ``/etc/rc.conf``:

.. code:: programlisting

    router_enable="NO"

Es importante que el demonio ``routed`` no se inicialice por default, en
virtud de que ``routed`` tiende a eliminar las variables creadas por
``ppp``.

Probablemente valga la pena asegurarse de que la l?nea
``sendmail_flags``, no incluya la opci?n ``-q``, ya que de ser as?
``sendmail`` intentar? localizar los par?metros de la red de vex en
cuando, ocasionando que realice llamados al exterior. Puede intentar
esto:

.. code:: programlisting

    sendmail_flags="-bd"

La parte negativa de esta conifguraci?n es que tiene que forzar a
``sendmail`` a re-examinar los llamados del servidor de correo, cada vez
que ``ppp`` realiza una conexi?n, con el siguiente comando:

.. code:: screen

    # /usr/sbin/sendmail -q

Puede utilizar el comando ``!bg`` en el fichero ``ppp.linkup`` para
hacer esto de manera autom?tica:

.. code:: programlisting

    1     provider:
    2       delete ALL
    3       add 0 0 HISADDR
    4       !bg sendmail -bd -q30m

Si usted no desea hacer esto, es posible establecer un “dfilter”
(filtro), para bloquear el tr?fico al servidor de salida de correo
(SMTP). Favor de referirse a los archivos de ejemplos para mayor detalle
al respecto.

Ahora lo ?nico que queda pendiente de hacerse es reiniciar el equipo.
Una vez reiniciado el equipo, puede teclear:

.. code:: screen

    # ppp

y posteriormente ``dial proveedor`` para iniciar la sesi?n, o bien si
desea que ``ppp`` inicie la sesi?n autom?ticamente, cuando haya una
petici?n de salida (y no haya creado el fichero ``start_if.tun0``),
puede teclear:

.. code:: screen

    # ppp -auto proveedor

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

25.2.1.7. Summario
^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A manera de recapitulaci?n, podemos decir que para configurar ppp por
primera ocasi?n, debemos:

Por parte del Cliente:

.. raw:: html

   <div class="procedure">

#. Asegurese de que existe el dispositivo ``tun`` dentro de su kernel.

#. Asegurses de que el dispositivo ``tunX``, se encuentra disponible,
   bajo el directorio ``/dev``.

#. Cree una entrada en su fichero ``/etc/ppp/ppp.conf``. Con el fichero
   de ejemplo ``pmdemand`` debe ser suficiente para la mayoria de
   proveedores.

#. Si cuenta con una direcci?n de IP din?mica, cree una entrada en el
   fichero ``/etc/ppp/ppp.linkup`` .

#. Actualice su fichero ``/etc/rc.conf``.

#. Cree un archivo script llamado ``start_if.tun0`` si requiere servicio
   de conexi?n a solicitud.

.. raw:: html

   </div>

Por parte del Servidor:

.. raw:: html

   <div class="procedure">

#. Asegurese de que dentro de su kernel exista el dispositivo ``tun``.

#. Asegurses de que el dispositivo ``tunX``, se encuentra disponible,
   bajo el directorio ``/dev``.

#. Cree una entrada en el fichero ``/etc/passwd`` (usando el programa
   `vipw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=vipw&sektion=8>`__).

#. Cree un perfil en el directorio home de este usuario, que ejecute
   ``ppp -direct direct-server`` o algo similar.

#. Cree una entrada en el fichero ``/etc/ppp/ppp.conf``. El fichero de
   ejemplo ``direct-server`` debe ser suficiente para darse una idea.

#. Cree una entrada en el fichero ``/etc/ppp/ppp.linkup``.

#. Actualice su fichero ``/etc/rc.conf``.

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

+-------------------------------------+---------------------------------+-------------------------------+
| `Anterior <ppp-and-slip.html>`__?   | `Subir <ppp-and-slip.html>`__   | ?\ `Siguiente <ppp.html>`__   |
+-------------------------------------+---------------------------------+-------------------------------+
| Cap?tulo 25. PPP y SLIP?            | `Inicio <index.html>`__         | ?25.3. Uso de Kernel PPP      |
+-------------------------------------+---------------------------------+-------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
