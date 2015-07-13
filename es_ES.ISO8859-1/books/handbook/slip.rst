=================
25.6. Uso de SLIP
=================

.. raw:: html

   <div class="navheader">

25.6. Uso de SLIP
`Anterior <pppoa.html>`__?
Cap?tulo 25. PPP y SLIP
?\ `Siguiente <firewalls.html>`__

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

25.6. Uso de SLIP
-----------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Contribuci?n Original por Satoshi Asami.

.. raw:: html

   </div>

.. raw:: html

   <div>

Con comentarios por Guy Helmer y Piero Serini.

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

25.6.1. Configurando un cliente SLIP
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Lo siguiente es una forma de configurar FreeBSD para que utilice SLIP,
en un red con direcci?n est?tica. Para direcciones din?micas (esto es,
donde su direcci?n cambia cada vez que se conecta), probablemente sea
necesario realizar algunos ajustes que complican la configuraci?n.

En primer t?rmino, es necesario determinar a que puerto serial esta
conectado nuestro m?dem. Mucha gente opta por} contar con un enl?ce
simb?lico, tal como ``/dev//modem``, que apunta al nombre real del
dispositivo, ``/dev/cuaaN``. Esto permite abstenerse de usar el nombre
real del dispositivo, en caso de que sea necesario cambiar de puerto
nuestro m?dem. Lo cual puede ser de mucha ayuda, ya que puede ser un
fastidio tener que editar un monton de ficheros en ``/etc`` y ficheros
de tipo ``.kermrc`` en todo el sistema!.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

``/dev/cuaa0`` es ``COM1``, ``cuaa1`` es ``COM2``, etc.

.. raw:: html

   </div>

Asegurese de contar con la siguiente opci?n en la configuraci?n de su
kernel:

.. code:: programlisting

    pseudo-device   sl      1

Esta opci?n esta incluida en el archivo del kernel ``GENERIC``, as? que
no debe haber problema, claro esta, a menos que lo haya borrado
intencionalmente.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

25.6.1.1. Cosas Que Tiene Que Hacer Solo Una Vez
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="procedure">

#. A?ada el nombre de su maquina, gateway, servidores de nombre a su
   fichero ``/etc/hosts``. Este es un ejemplo de mi fichero:

   .. code:: programlisting

       127.0.0.1               localhost loghost
       136.152.64.181          water.CS.Example.EDU water.CS water
       136.152.64.1            inr-3.CS.Example.EDU inr-3 slip-gateway
       128.32.136.9            ns1.Example.EDU ns1
       128.32.136.12           ns2.Example.EDU ns2

#. Asegurese de que cuenta con la opci?n ``hosts`` antes de la opci?n
   ``bind``, en su fichero ``/etc/host.conf``. De lo contrario pueden
   ocurrir cosas graciosas en su sistema.

#. Edite el fichero ``/etc/rc.conf``.

   .. raw:: html

      <div class="orderedlist">

   #. Especifique su nombre host al editar la l?nea que dice:

      .. code:: programlisting

          hostname=“minombre.mi.dominio”

      El nombre completo de su sistema para internet, debe ser escrito
      en este punto.

   #. A?ada el dispositivo ``sl0`` a la lista de dispositivos de red, al
      cambiar la l?nea que dice:

      .. code:: programlisting

          network_interfaces="lo0"

      a quedar:

      .. code:: programlisting

          network_interfaces=“lo0 sl0”

   #. A?ada los par?metros de inicializaci?n del dispositivo sl0, al
      a?adir la l?nea:

      .. code:: programlisting

          ifconfig_sl0="inet ${hostname} slip-gateway netmask 0xffffff00 up"

   #. 

      Especificque cual ser? su ruteador por omisi?n al editar la l?nea:

      .. code:: programlisting

          defaultrouter=“NO”

      a quedar:

      .. code:: programlisting

          defaultrouter=“slip-gateway”

   .. raw:: html

      </div>

#. Edite su fichero ``/etc/resolv.conf`` (si no existe debe crearlo), a
   que contenga lo siguiente:

   .. code:: programlisting

       domain CS.Ejemplo.EDU
       nameserver 128.32.136.9
       nameserver 128.32.136.12

   Como puede ver, lo anterior define el nombre de host, de su servidor
   de nombres. Claro esta, el nombre de dominio y las direcciones IP,
   dependen de su sistema espec?fico.

#. Establezca la contrase?a del superusuario ``root`` y de su s?mil
   ``toor`` (y de cualquier otro usuario que aun no cuente con la
   misma).

#. Reinicie su sistema y asegurese que cuenta con el nombre de host
   (hostname) correcto.

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

25.6.1.2. Haciendo una Conexi?n con SLIP
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="procedure">

#. Marque el n?mero, teclee en el signo de comando ``slip``, ingrese el
   nombre y la contrase?a. Lo que se requiere ingresar, depende de su
   sistema. Si utiliza kermit, puede utilizar un script similar al
   siguiente:

   .. code:: programlisting

       # kermit setup
       set modem hayes
       set line /dev/modem
       set speed 115200
       set parity none
       set flow rts/cts
       set terminal bytesize 8
       set file type binary
       # El siguiente macro se encarga de llamar e ingresar al sistema
       define slip dial 643-9600, input 10 =>, if failure stop, -
       output slip\x0d, input 10 Username:, if failure stop, -
       output silvia\x0d, input 10 Password:, if failure stop, -
       output ***\x0d, echo \x0aCONNECTED\x0a

   Claro esta, que debe cambiar el nombre y contrase? a quedar de
   acuerdo a sus necesidades. Despu?s de hacer esto, puede simplemente
   teclear ``slip`` en el s?mbolo de sistema (prompt) de kermit, para
   realizar la conexi?n.

   .. raw:: html

      <div class="note" xmlns="">

   Nota:
   ~~~~~

   El dejar su contrase?a en texto plano, en cualquier parte del
   sistema, generalmente es una *mala* idea. H?galo bajo su propio
   riesgo.

   .. raw:: html

      </div>

#. Dej? a kermit en ese punto trabajando (puede suspenderlo tecleando
   **Ctrl**+**z**) y como ``root``, teclee:

   .. code:: screen

       # slattach -h -c -s 115200 /dev/modem

   Si puede hacer ``ping`` a cualquier host que se encuentre del otro
   lado del ruteador, usted esta conectado!. Si esto no funciona, puede
   intentar como argumento del comando ``slattach``, la opci?n ``-a`` en
   lugar de utilizar la optci?n ``-c``.

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

25.6.1.3. Como Terminar la Conexi?n
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Para terminar la conexi?n haga lo siguiente:

.. code:: screen

    # kill -INT `cat /var/run/slattach.modem.pid`

esto terminara? ``slattach``. Recuerde que para hacer esto, usted debe
estar firmado como superusuario (root). Posteriormente dirijase a kermit
(puede hacer esto con ``fg`` si lo envio a segundo plano) y salga
(tecleando ``q``).

La p?gina de ayuda de ``slattach`` indica que debe utilizar el comando
``ifconfig sl0 down``, para marcar como terminado el uso del
dispositivo, pero tal parece que esto no hace una gran diferencia para
mi. (``ifconfig sl0`` da el mismo resultado.)

En algunas ocasiones, puede que su m?dem se niegue a cortar la
comunicaci?n (el mio lo hace a veces). Si ese es el caso, simplemente
inicie de nuevo kermit y vuelva a salir. Normalmente en el segundo
intento hay exito.

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

25.6.1.4. Problemas Comunes
^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Si esto no funciona, sientase libre de preguntarme. Lo siguiente es una
recapitulaci?n de los problemas que m?s comunmente se presentan:

.. raw:: html

   <div class="itemizedlist">

-  El no utilizar la opci?n ``-c`` o ``-a`` con el comando ``slattach``
   (Esto debiera se fatal, pero algunos usuarios han reportado que esto
   ha solucionado sus problemas.

-  Usar la opci?n ``s10`` en vez de usar la opci?n ``sl0`` (puede ser
   dif?cil ver la diferencia con algunos tipos de letras).

-  Intente ``ifconfig sl0`` para visualizar el estatus de sus
   dispositivos de red. Por ejemplo, puede ser que obtenga algo similiar
   a lo siguiente:

   .. code:: screen

       # ifconfig sl0
       sl0: flags=10<POINTOPOINT>
               inet 136.152.64.181 --> 136.152.64.1 netmask ffffff00

-  Tambi?n el comando ``netstat -r`` le mostrar? la tabla de ruteo, en
   caso de que obtenga el mensaje “no route to te host”, al hacer
   ``ping``. Un ejemplo de esto se muestra a continuaci?n:

   .. code:: screen

       # netstat -r
       Routing tables
       Destination      Gateway            Flags     Refs     Use  IfaceMTU    Rtt    Netmasks:

       (root node)
       (root node)

       Route Tree for Protocol Family inet:
       (root node) =>
       default          inr-3.Example.EDU  UG          8   224515  sl0 -      -
       localhost.Exampl localhost.Example. UH          5    42127  lo0 -       0.438
       inr-3.Example.ED water.CS.Example.E UH          1        0  sl0 -      -
       water.CS.Example localhost.Example. UGH        34 47641234  lo0 -       0.438
       (root node)

   Esto es despu?s de que el sistema ha estado conectado por un tiempo.
   Los numeros pueden variar en su sistema.

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

25.6.2. Estableciendo un Servidor SLIP
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Este documento provee sugerencias, para establecer un servidor de SLIP,
bajo FreeBSD, lo que generalmente significa configurar su sistema, para
que de manera autom?tica inicie los servicios, al firmarse
usuarios—clientes remotos en su sistema.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

25.6.2.1. Prerequisitos
^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Esta secci?n es de naturaleza muy t?cnica, as? que contar con
antecedentes sobre esto es requerido. Este documento supone que usted
cuenta con conocimientos sobre el protocolo de redes TCP/IP, y
particularmente, redes y direcciones de nodos, mascaras de red,
subneteo, ruteo y protocolos de ruteo, tal como RIP. El configurar
servicios SLIP, en un servidor, requiere un conocimiento de estos
conceptos, y si usted no esta familiarizado con estos, puede leer una
copia, ya sea del libro de Craig Hunt; *TCP/IP Networking
Administration*, publicado por O'Reilly & Associates, Inc. (Numero ISBN
0-937175-82-X), o alguno de los libros de Douglas Comer, sobre
protocolos TCP/IP.

Se da por un hecho, que usted ha instalado y configurado correctamente
su(s) m?dem(s), as? como la configuraci?n de su sistema, para efecto de
utilizar el mismo para realizar la conexi?n. Si usted no lo ha hecho,
por favor lea el tutorial sobre configuraci?n de estos servicios; si
cuenta con un navegador para la World-Wide Web, puede ver los tutoriales
disponibles en `http://www.FreeBSD.org/ <../../../../index.html>`__.

Puede ser que tambi?n desee revisar las p?ginas de ayuda (*man*),
`sio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sio&sektion=4>`__ para
informaci?n referente a los controladores de dispositivos de puertos en
serie, y
`ttys(5) <http://www.FreeBSD.org/cgi/man.cgi?query=ttys&sektion=5>`__,
`gettytab(5) <http://www.FreeBSD.org/cgi/man.cgi?query=gettytab&sektion=5>`__,
`getty(8) <http://www.FreeBSD.org/cgi/man.cgi?query=getty&sektion=8>`__,
& `init(8) <http://www.FreeBSD.org/cgi/man.cgi?query=init&sektion=8>`__,
para ver informaci?n relevante, sobre la configuraci?n de su sistema,
para efecto de que acepte accesos (logins) por medio de un m?dem, y
quiz?s
`stty(1) <http://www.FreeBSD.org/cgi/man.cgi?query=stty&sektion=1>`__
para informaci?n sobre los par?metros de configuraci?n de puertos en
serie (tal como ``clocal``, que se utiliza para la conexi?n directa por
medio de puertos seriales).

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

25.6.2.2. Echemos un Vistazo
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

En su configuraci?n t?pica, el desarrollo de FreeBSD como un servidor
SLIP, funciona de la siguiente manera: un Usuario SLIP, se conecta del
Servidor SLIP FreeBSD e ingresa al sistema con una identificaci?n
especial, que utiliza ``/usr/sbin/sliplogin`` como shell del usuario. El
programa ``sliplogin`` busca en el fichero ``/etc/sliphome/slip.hosts``
la l?nea que haya sido creada especialmente para el usuario, conecta la
l?nea serial a una interfaz SLIP disponible y posteriormente ejecuta el
script ``/etc/sliphome/slip.login``, para configurar la interfaz SLIP.

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

25.6.2.2.1. Un Ejemplo de Acceso al Servidor SLIP
'''''''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Por ejemplo si la clave de acceso de un usuario SLIP fuese ``Shelmerg``,
la entrada del usuario ``Shelmerg``, en el fichero
``/etc/master.passwd`` se vera algo similar a lo siguiente:

.. code:: programlisting

    Shelmerg:password:1964:89::0:0:Guy Helmer - SLIP:/usr/users/Shelmerg:/usr/sbin/sliplogin

Cuando ``Shelmerg`` accese al sistema, el comando ``sliplogin``, buscar?
en el fichero ``/etc/sliphome/slip.hosts``, una l?nea, en la cual el ID
(identificaci?n) del usuario coincida, por ejemplo, puede ser que en el
fichero ``/etc/sliphome/slip.hosts`` exista una l?nea simliar a la
siguiente:

.. code:: programlisting

    Shelmerg        dc-slip sl-helmer       0xfffffc00       autocomp

El comando ``sliplogin`` encontrar? la l?nea que coincida, enganchar? la
l?nea serial a cualquier interfaz SLIP disponible y posteriormente
ejecutar? ``/etc/sliphome/slip.login`` de manera similar a:

.. code:: programlisting

    /etc/sliphome/slip.login 0 19200 Shelmerg dc-slip sl-helmer 0xfffffc00 autocomp

Si todo marcha bien, ``/etc/sliphome/slip.login`` crear? una
configuraci?n, por medio de ``ifconfig``, para la interfaz SLIP, a la
cual ``sliplogin`` se ha adjuntado (la interfaz slip 0, que era el
primer par?metro dado en la lista de ``slip.login``), para establecer la
direcci?n local IP (``dc-slip``), la interfaz de la direci?n IP Remota
(``sl-helmer``), la submascara de red para la interfaz SLIP
(``0xfffffc00``) y cualquier otra opci?n adicional (``autocomp``). Si
algo no va del todo bien, normalmente ``sliplogin`` guarda bastante
informaci?n para depurar, por medio del ``demonio`` (``daemon``) syslog,
que usualmente guarda dicha infomraci?n en ``/var/log/messages`` (vea la
p?gina de ayuda
`syslogd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=syslogd&sektion=8>`__
as? como
`syslog.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=syslog.conf&sektion=5>`__
y quizas el fichero ``/etc/syslog.conf``, para ver que es lo que
``syslogd`` esta almacenando y donde es que lo almacena.

OK, basta de ejemplos — entremos de lleno en la configuraci?n del
sistema.

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

25.6.2.3. Configuraci?n del Kernel
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El kernel de FreeBSD, por omisi?n, cuenta con 2 dispositivos SLIP
definidos (``sl0`` y ``sl1``); usted puede utilizar ``netstat -i``, para
verificar si estos dispositivos se encuentran en el kernel de su
sistema.

Un ejemplo del resultado de ``netstat -i``:

.. code:: screen

    Name  Mtu   Network     Address            Ipkts Ierrs    Opkts Oerrs  Coll
    ed0   1500  <Link>0.0.c0.2c.5f.4a         291311     0   174209     0   133
    ed0   1500  138.247.224 ivory             291311     0   174209     0   133
    lo0   65535 <Link>                            79     0       79     0     0
    lo0   65535 loop        localhost             79     0       79     0     0
    sl0*  296   <Link>                             0     0        0     0     0
    sl1*  296   <Link>                             0     0        0     0     0

En este ejemplo vemos que existen dos dispositivos SLIP en el kernel,
que son; ``sl0`` y ``sl1`` (el asterisco que aparece despu?s de ``sl0``
y ``sl1`` indica que los dispositivos no estan “trabajando”.)

Aun cuando el kernel cuente con los dispositivos, por omisi?n el kernel
de FreeBSD, no viene configurado para enviar paquetes (de hecho su
sistema FreeBSD no trabajara como ruteador, por default) esto en base a
los requerimientos para Internet, establecidos por los RFCs ( vea 1009
[Requerimentos para Pasarelas (Gateway) en Internet], 1122
[Requerimientos para hosts de Internet — Capas de comunicaci?n] y quiz?s
1127 [RFC sobre Una Perspectiva de los Requerimientos de Hosts]). Si
usted desea que su servidor SLIP sobre FreeBSD, opere como un ruteador,
ser? necesario que edite el fichero ``/etc/rc.conf`` y cambie la opci?n
``gateway_enable``, a quedar ``YES``, esto habilitar? esta funci?n.

Ser? necesario que reinicie su sistema, para efecto de que estos cambios
surtan efecto.

Al verificar su fichero de configuraci?n del kernel
(``/sys/i386/conf/GENERIC``), podr? notar que cerca del final, hay una
l?nea como la siguiente:

.. code:: programlisting

    pseudo-device sl 2

Esta l?nea es la que define el numero de dispositivos SLIP disponibles
en el kernel; el numero al final de la l?nea es el numero m?ximo de
conecciones SLIP que puede manejar el servidor simultaneamente.

Para ayuda con relaci?n a la configuraci?n y compilaci?n del kernel en
su sistema FreeBSD, por favor refierase `Cap?tulo?8, *Configuraci?n del
kernel de FreeBSD* <kernelconfig.html>`__ al apartado correspondiente.

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

25.6.2.4. Configuraci?n de Sliplogin
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Como se menciono anteriormente, existen tres ficheros en el directorio
``/etc/sliphome``, que son parte de la configuraci?n de
``/usr/sbin/sliplogin`` (vea la pagina de ayuda
`sliplogin(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sliplogin&sektion=8>`__
de para ver la ayuda del comando ``sliplogin``): ``slip.hosts``, que es
el fichero que define a los usuarios SLIP, as? como sus direcciones IP
correspondientes; ``slip.login``, que normalmente es utilizado para
configurar la interfaz de SLIP; y (opcionalmente) ``slip.logout``, que
hace lo opuesto a ``slip.login``, cuando la conexi?n serial ha
terminado.

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

25.6.2.4.1. Configuraci? de ``slip.hosts``
''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El fichero ``/etc/sliphome/slip.hosts`` contiene l?neas, que al menos
cuentan con cuatro partes, separadas por espacios en blanco:

.. raw:: html

   <div class="itemizedlist">

-  Identificador (nombre) del usuario SLIP

-  Direcci?n Local (local para el servidor SLIP) de la liga a SLIP

-  Direcci?n Remota de la liga a SLIP

-  Mascara de red

.. raw:: html

   </div>

Las direcciones local y remota, pueden ser nombres del host (la
resoluci?n de los mismos, es llevada a cabo, por medio de ``/etc/hosts``
o por el servidor de nombres de dominio (DNS), dependiendo de lo que
haya especificado en el fichero ``/etc/host.conf``), y la mascara de red
puede ser un nombre, que puede ser resuelto revisando ``/etc/networks``.
En un sistema de ejemplo, el fichero ``/etc/sliphome/slip.hosts``, puede
verse as?:

.. code:: programlisting

    #
    # login local-addr      remote-addr     mask            opt1    opt2
    #                                               (normal,compress,noicmp)
    #
    Shelmerg  dc-slip       sl-helmerg      0xfffffc00      autocomp

Al final de la l?nea puede ver que existen una o m?s opciones.

.. raw:: html

   <div class="itemizedlist">

-  ``normal`` — sin compresi?n de los encabezados.

-  ``compress`` — compresi?n de los encabezados.

-  ``autocomp`` — compresi?n autom?tica, si el host remoto lo permite.

-  ``noicmp`` — deshabilitar los paquetes ICMP (de tal forma que
   cualquier paquete enviado por “ping” ser?a rechazado, en lugar de
   ocupar de su ancho de banda).

.. raw:: html

   </div>

La elecci?n sobre la direcci?n local y remota depende si usted va a
utilizar una conexi?n TCP/IP dedicada o bien si va a utilizar una
conexi?n por medio de “proxy ARP” en su servidor SLIP (no es correcto
“proxy ARP”, pero es la terminolog?a utilizada en esta secci?n para
describirlo). Si usted no esta seguro que metodo manejar o como asignar
la direcci?n IP, por favor refierase a alguno de los libros sobre
TCP/IP, que se mencionan en los Prerequisitos de SLIP
(`Secci?n?25.6.2.1, “Prerequisitos” <slip.html#slips-prereqs>`__) y/o
consulte al administrador de IP de su red.

Si usted piensa subnetear para los diferentes clientes SLIP, ser?
necesario que la direcci?n de la subred (subnet), salga de la direcci?n
IP que tenga asignada su red, y el numero de cada cliente, del numero
que asigne a su subred. Posteriormente puede que sea necesario, o bien
configurar una ruta est?tica a la subred SLIP, por medio de su servidor
SLIP en su ruteador m?s cercano por IP.

De otra forma, si usted piensa utilizar un metodo “proxy ARP”, ser?
necesario que a sus clientes SLIP, se les asigne una direcci?n IP, que
se encuentre dentro del rango que este utilizando para su subred
Ethernet, y tambi? ser? necesario que haga algunos ajustes en los
ficheros script ``/etc/sliphome/slip.login`` y en
``/etc/sliphome/slip.logout``, para que usen
`arp(8) <http://www.FreeBSD.org/cgi/man.cgi?query=arp&sektion=8>`__,
para que maneje la tabla ARP del servidor SLIP y llamados del proxy-ARP.

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

25.6.2.4.2. ``slip.login`` Configuraci?n
''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El t?pico fichero ``/etc/sliphome/slip.login`` se ve de la siguiente
manera:

.. code:: programlisting

    #!/bin/sh -
    #
    #       @(#)slip.login  5.1 (Berkeley) 7/1/90

    #
    # generic login file for a slip line.  sliplogin invokes this with
    # the parameters:
    #      1        2         3        4          5         6     7-n
    #   slipunit ttyspeed loginname local-addr remote-addr mask opt-args
    #
    /sbin/ifconfig sl$1 inet $4 $5 netmask $6

This ``slip.login`` file merely runs ``ifconfig`` for the appropriate
SLIP interface with the local and remote addresses and network mask of
the SLIP interface.

If you have decided to use the “proxy ARP” method (instead of using a
separate subnet for your SLIP clients), your
``/etc/sliphome/slip.login`` file will need to look something like this:

.. code:: programlisting

    #!/bin/sh -
    #
    #       @(#)slip.login  5.1 (Berkeley) 7/1/90

    #
    # generic login file for a slip line.  sliplogin invokes this with
    # the parameters:
    #      1        2         3        4          5         6     7-n
    #   slipunit ttyspeed loginname local-addr remote-addr mask opt-args
    #
    /sbin/ifconfig sl$1 inet $4 $5 netmask $6
    # Answer ARP requests for the SLIP client with our Ethernet addr
    /usr/sbin/arp -s $5 00:11:22:33:44:55 pub

La l?nea adicional, ``arp -s $5 00:11:22:33:44:55         pub`` del
script ``slip.login``, crea una entrada ARP en la tabla del servidor
SLIP. Esta entrada le indica al servidor SLIP que debe responder con la
direcci?n MAC de su dispositivo Ethernet, cuando cualquier otro nodo IP
en la red, solicite informaci?n a la IP del cliente SLIP.

Al tomar en cuenta el ejemplo anterior, es importante que sustituya la
direcci?n Ethernet MAC (``00:11:22:33:44:55``), con la direcci?n que
corresponde a su tarjeta de red, o definitivamente su “proxy ARP” no va
a funcionar!. Para efecto de conocer cual es la direcci?n MAC del
dispositivo Ethernet (tarjeta de red), de su servidor SLIP, puede
ejecutar el comando ``netstat -i``, el cual tendr? como resultado algo
similar a lo siguiente:

.. code:: screen

    ed0   1500  <Link>0.2.c1.28.5f.4a         191923   0   129457     0   116

Esto indica que la direcci?n MAC de su dispositivo Ethernet, en este
sistema es ``00:02:c1:28:5f:4a`` — los puntos que aparecen en la salida
del comando ``netstat -i`` deben cambiarse por dos puntos, as? mismo
deber? de anteponerse un cero, a cada d?gito hexadecimal que aparezca
s?lo (no en pares), de tal forma que convirtamos la direcci?n en lo que
`arp(8) <http://www.FreeBSD.org/cgi/man.cgi?query=arp&sektion=8>`__
requiere para trabajar; vea la p?gina de ayuda
`arp(8) <http://www.FreeBSD.org/cgi/man.cgi?query=arp&sektion=8>`__,
para ver informaci?n completa sobre su uso.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Recuerde que cuando cree los ficheros ``/etc/sliphome/slip.login`` y
``/etc/sliphome/slip.logout``, deben contar con permisos de ejecuci?n
(``chmod 755 /etc/sliphome/slip.login           /etc/sliphome/slip.logout``),
de otra forma estos scripts no podr?n llevar a cabo su funci?n.

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

25.6.2.4.3. Configuraci?n de ``slip.logout``
''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El fichero ``/etc/sliphome/slip.logout`` no es indispensable (a menos
que vaya a utilizar “proxy ARP”), pero si aun as? decide crearlo, el
siguiente es un ejemplo b?sico del script ``slip.logout`` :

.. code:: programlisting

    #!/bin/sh -
    #
    #       slip.logout

    #
    # logout file for a slip line.  sliplogin invokes this with
    # the parameters:
    #      1        2         3        4          5         6     7-n
    #   slipunit ttyspeed loginname local-addr remote-addr mask opt-args
    #
    /sbin/ifconfig sl$1 down

Si usted esta utilizando “proxy ARP”, es recomendable que le indique a
``/etc/sliphome/slip.logout``, que desea eliminar la entrada ARP, para
el cliente SLIP:

.. code:: programlisting

    #!/bin/sh -
    #
    #       @(#)slip.logout

    #
    # logout file for a slip line.  sliplogin invokes this with
    # the parameters:
    #      1        2         3        4          5         6     7-n
    #   slipunit ttyspeed loginname local-addr remote-addr mask opt-args
    #
    /sbin/ifconfig sl$1 down
    # Dejar de solicitar respuesta ARP al cliente SLIP
    /usr/sbin/arp -d $5

El comando ``arp -d $5``, elimina la entrada ARP, que ``slip.login`` de
“proxy ARP” a?adi? al cliente SLIP al ingresar al sistema.

Para esta m?s seguros: asegurese de que el fichero
``/etc/sliphome/slip.logout`` cuenta con los permisos adecuados para su
ejecuci?n, una vez que lo ha creado (ej.
``chmod 755 /etc/sliphome/slip.logout``) .

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

25.6.2.5. Consideraciones sobre el Enrutamiento
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Si usted no esta utilizando el metodo “proxy ARP”, para efecto de rutear
los paquetes entre sus clientes SLIP y el resto de la red (y quiz?s
Internet), deber? de hacer una de las siguientes dos acciones, o bien
a?adir direcciones est?ticas, a su(s) ruteador(es) m?s cercanos, para
que se reenvien los paquetes de la subred de sus clientes SLIP, por
medio de su servidor SLIP, o bien tendr? que instalar y configurar
``gated`` en su servidor SLIP (que corre FreeBSD!), de tal forma que le
indique a su(s) ruteador(es), por medio del protocolo correcto, a cerca
de su subred SLIP.

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

25.6.2.5.1. Direcciones de Enrutamiento Est?ticas
'''''''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A?adir direcciones est?ticas de enrutamiento puede ser un problema (o
imposible si usted no cuenta con la autoridad para hacerlo...). Si usted
cuenta con una red de ruteo-m?ltiple en su organizaci?n, algunos
ruteadores, tales como los fabricados por Cisco y Proteon, puede ser que
no sea suficiente con el hecho de configurar las rutas est?ticas de su
subred SLIP, sino que sea necesario indicar que rutas utilizar para
informar a cerca de otras rutas, as? que algo de experiencia as? como
determinaci?n para la resoluci?n de problemas ser?n necesarias para
poner la ruta basada-en- ruteo-est?tico a trabajar.

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

25.6.2.5.2. Ejecutando ``gated``
''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Una alternativa para los dolores de cabeza que pueden dar las redes con
ruteo est?tico, es intalar ``gated`` en su servidor SLIP bajo FreeBSD y
configurarlo, para que utilice los protocolos de ruteo apropiados
(RIP/OSPF/BGP/EGP) para informar a otros ruteadores, a cerca de su
subred SLIP. Una vez que lo ha compilado e instalado, deber? crear el
fichero ``/etc/gated.conf``, que configurar? a ``gated``; aqui hay un
ejemplo, similar al que el autor utiliz? en un servidor SLIP FreeBSD:

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

``gated`` es un software propietario y su c?digo fuente no estar?
disponible al p?blico m?s (m?s informaci?n en el sitio
`gated <http://www.gated.org/>`__). Esta secci?n solo existe para
asegurarse de la compatibilidad con aquellos que usan la versi? antigua.

.. raw:: html

   </div>

.. code:: programlisting

    #
    # gated configuration file for dc.dsu.edu; for gated version 3.5alpha5
    # Only broadcast RIP information for xxx.xxx.yy out the ed Ethernet interface
    #
    #
    # tracing options
    #
    traceoptions "/var/tmp/gated.output" replace size 100k files 2 general ;

    rip yes {
      interface sl noripout noripin ;
      interface ed ripin ripout version 1 ;
      traceoptions route ;
    } ;

    #
    # Turn on a bunch of tracing info for the interface to the kernel:
    kernel {
      traceoptions remnants request routes info interface ;
    } ;

    #
    # Propagate the route to xxx.xxx.yy out the Ethernet interface via RIP
    #

    export proto rip interface ed {
      proto direct {
          xxx.xxx.yy mask 255.255.252.0 metric 1; # SLIP connections
      } ;
    } ;

    #
    # Accept routes from RIP via ed Ethernet interfaces

    import proto rip interface ed {
      all ;
    } ;

En el ejemplo anterior, el fichero de configuraci?n ``gated.conf``
transmite informaci?n sobre la subred SLIP *``xxx.xxx.yy``*, por medio
de RIP al dispositivo Ethernet; si usted esta utilizando un dispositivo
de red, diferente de ``ed``, ser? necesario que modifique el par?metro
``ed`` por el correspondiente. En este ejemplo, el fichero tambi?n
realiza una busqueda por el fichero ``/var/tmp/gated.output``, que es un
fichero que nos sirve para depurar cualquier error que se presente en la
actividad de ``gated``; usted puede desactivar la opci?n de depuraci?n
(debug), si es que ``gated`` esta funcionando correctamente. Ser?
necesario que modifique *``xxx.xxx.yy.``*, a quedar con la direcci?n
correcta de su subred SLIP (asegurese de modificar tambi?n la m?scara de
red, en la cl?usula ``proto direct`` tambi?n).

Una vez que ha instalado y configurado ``gated`` en su sistema,
necesitar? indicarle a FreeBSD que al iniciar el sistema, ejecute el
script para ``gated``, en lugar de ejecutar ``routed``. La forma m?s
f?cil de hacer esto, es editar las variables de ``route`` y
``router_flags``, en el fichero ``/etc/rc.conf``. Por favor vea la
p?gina de ayuda de ``gated``, para ver informaci?n sobre los par?metros
de la l?nea—de—comandos.

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

+---------------------------------------+---------------------------------+-------------------------------------+
| `Anterior <pppoa.html>`__?            | `Subir <ppp-and-slip.html>`__   | ?\ `Siguiente <firewalls.html>`__   |
+---------------------------------------+---------------------------------+-------------------------------------+
| 25.5. Uso de PPP sobre ATM (PPPoA)?   | `Inicio <index.html>`__         | ?Cap?tulo 26. Cortafuegos           |
+---------------------------------------+---------------------------------+-------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
