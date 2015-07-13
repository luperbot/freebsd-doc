=======================
25.3. Uso de Kernel PPP
=======================

.. raw:: html

   <div class="navheader">

25.3. Uso de Kernel PPP
`Anterior <userppp.html>`__?
Cap?tulo 25. PPP y SLIP
?\ `Siguiente <pppoe.html>`__

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

25.3. Uso de Kernel PPP
-----------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Partes originalmente desarrolladas por Gennady B. Sorokopud y Robert
Huff.

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

25.3.1. Configurando Kernel PPP
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Antes de comenzar a configurar PPP en su maquina, asegurese de ``pppd``
se localiza en ``/usr/sbin`` y de que existe el directorio ``/etc/ppp``.

``pppd`` puede trabajar de dos maneras

.. raw:: html

   <div class="orderedlist">

#. Como un “cliente” — cuando desea conectar su maquina al mundo
   exterior utilizando PPP, por medio de una conexi?n serial o bien una
   l?nea de modem.

#. 

   como un “servidor” — cuando su maquina esta conectada a una red y es
   utilizada para que otras maquinas se conecten utilizando ppp.

.. raw:: html

   </div>

En ambos casos, ser? necesario configurar un fichero de opciones
(``/etc/ppp/options`` o bien ``~/.ppprc`` si se cuenta con m?s de un
usuario que utilizar? ppp en la misma maquina.

Tambi?n deber? de contar con un software para hacer la conexi?n por
medio de m?dem (de preferencia kermit), de manera que pueda hacer la
conexi?n con un host remoto.

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

25.3.2. Uso de ``pppd`` como Cliente
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div>

Basedo en informaci?n provista por Trev Roydhouse.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El siguiente archivo de configuraci?n ``/etc/ppp/options`` puede
utilizarse para realizar la conexi?n a una terminal CISCO, por medio de
PPP.

.. code:: programlisting

    crtscts         # habilita el flujo de controls de hardware
    modem           # l?nea de control del modem
    noipdefault     # el servidor PPP remoto asignar? la direcci?n IP
                    # si el servidor no envia una direcci?n IP durante IPCP
                    # remueva esta opci?n.
    passive         # espere por los paquetes LCP
    domain ppp.foo.com      # escriba su nombre de dominio aqui

    :<remote_ip>    # escriba la IP del host remoto aqui
                    # este ser? utilizado para el ruteo de paquetes por medio
                    # de PPP, si no especifica esta opci?n, cambie la
                    # l?nea a quedar  <local_ip>:<remote_ip>

    defaultroute    # establezca esta opci?n si el servidor su ruteador
                    # por default

Para conectarse:

.. raw:: html

   <div class="procedure">

#. Realice el llamado al host remoto, utilizando kermit (o cualquier
   otra aplicaci?n de este tipo), ingrese su nombre de usuario y
   contrase?a (o cualquier info que sea necesaria para habilitar PPP en
   el host remoto).

#. Salga de kermit (sin colgar la l?nea).

#. Ingrese lo siguiente:

   .. code:: screen

       # /usr/src/usr.sbin/pppd.new/pppd /dev/tty01 19200

   Asegurese de utilizar el dispositivo y la velocidad adecuados.

.. raw:: html

   </div>

Ahora su computadora esta conectada por medio de PPP. Si la conexi?n
falla, puede a?adir la opci?n ``debug`` en el fichero
``/etc/ppp/options`` de tal forma que pueda verificar la que esta
ocurriendo y pueda resolver el problema.

El siguiente script; ``/etc/ppp/pppup`` realizar? los 3 pasos de forma
autom?tica:

.. code:: programlisting

    #!/bin/sh
    ps ax |grep pppd |grep -v grep
    pid=`ps ax |grep pppd |grep -v grep|awk '{print $1;}'`
    if [ "X${pid}" != "X" ] ; then
            echo 'killing pppd, PID=' ${pid}
            kill ${pid}
    fi
    ps ax |grep kermit |grep -v grep
    pid=`ps ax |grep kermit |grep -v grep|awk '{print $1;}'`
    if [ "X${pid}" != "X" ] ; then
            echo 'killing kermit, PID=' ${pid}
            kill -9 ${pid}
    fi

    ifconfig ppp0 down
    ifconfig ppp0 delete

    kermit -y /etc/ppp/kermit.dial
    pppd /dev/tty01 19200

El fichero ``/etc/ppp/kermit.dial`` es un script de kermit, uqe realiza
el marcado y negocia la autorizaci?n necesaria con el host remoto (un
ejemplo de este script se encuentra al final de este documento).

Utilice el siguiente script, llamado ``/etc/ppp/pppdown`` para
desconectar la l?nea PPP:

.. code:: programlisting

    #!/bin/sh
    pid=`ps ax |grep pppd |grep -v grep|awk '{print $1;}'`
    if [ X${pid} != "X" ] ; then
            echo 'killing pppd, PID=' ${pid}
            kill -TERM ${pid}
    fi

    ps ax |grep kermit |grep -v grep
    pid=`ps ax |grep kermit |grep -v grep|awk '{print $1;}'`
    if [ "X${pid}" != "X" ] ; then
            echo 'killing kermit, PID=' ${pid}
            kill -9 ${pid}
    fi

    /sbin/ifconfig ppp0 down
    /sbin/ifconfig ppp0 delete
    kermit -y /etc/ppp/kermit.hup
    /etc/ppp/ppptest

Verifique que su PPP aun se esta ejecutando, por medio de
``/usr/etc/ppp/ppptest``, que deber? verse algo similar a esto:

.. code:: programlisting

    #!/bin/sh
    pid=`ps ax| grep pppd |grep -v grep|awk '{print $1;}'`
    if [ X${pid} != "X" ] ; then
            echo 'pppd running: PID=' ${pid-NONE}
    else
            echo 'No pppd running.'
    fi
    set -x
    netstat -n -I ppp0
    ifconfig ppp0

Para colgar el m?dem, ejecute ``/etc/ppp/kermit.hup``, que deber?
contener:

.. code:: programlisting

    set line /dev/tty01    ; aqui va el dispositivo del modem
    set speed 19200
    set file type binary
    set file names literal
    set win 8
    set rec pack 1024
    set send pack 1024
    set block 3
    set term bytesize 8
    set command bytesize 8
    set flow none

    pau 1
    out +++
    inp 5 OK
    out ATH0\13
    echo \13
    exit

He aqui un metodo alterno, donde se utiliza ``chat`` en lugar de
utilizar ``kermit``.

Los siguientes dos ficheros deben ser suficiente, para realizar una
conexi?n por medio de ``pppd``.

.. code:: programlisting

    /dev/cuaa1 115200

    crtscts     # habilita el control de flujo por medio de hardware
    modem       # l?nea de control del m?dem
    connect "/usr/bin/chat -f /etc/ppp/login.chat.script"
    noipdefault # el servidor remoto debe asignar la direcci?n IP.
                # si el servidor no asigna una IP durante la negociaci?n
                    # IPCP , remueva esta l?nea y espere por los
    passive         # paquetes LCP
    domain <your.domain>  # aqui va su dominio

    :       # escriba la IP del host remoto aqui
                    # si no ha especificado la opci?n noipdefault
                    # cambie esta l?nea a quedar <local_ip>:<remote_ip>

    defaultroute    # escriba esto, si desea que el servidor PPP sea su
                    # router por default

``/etc/ppp/login.chat.script``:

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Lo siguiente debe ir en una sola l?nea.

.. raw:: html

   </div>

.. code:: programlisting

    ABORT BUSY ABORT 'NO CARRIER' "" AT OK ATDT<numero.de.telefono>
      CONNECT "" TIMEOUT 10 ogin:-\\r-ogin: <nombre.usuario>
      TIMEOUT 5 sword: <contrase?a>

Una vez que estos ficheros han sido modificados correctamente e
instalados, todo lo que necesita es ejecutar el comando ``pppd``, algo
como:

.. code:: screen

    # pppd

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

25.3.3. Uso de ``pppd`` como Servidor
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El fichero ``/etc/ppp/options`` debe contener algo similar a lo
siguiente:

.. code:: programlisting

    crtscts   # control de flujo por Hardware
    netmask 255.255.255.0           # mascara de red (no es requisito)
    192.114.208.20:192.114.208.165  # direcciones ip del host local y remoto
                                    # la direcci?n ip local debe ser
                                    # diferente a la que le haya asignado a su
                                    # dispositivo de red ethernet (u otro)
                                    # la direcci?n ip remota que ser?
                                    # asignada a la maquina remota
    domain ppp.foo.com              # su dominio
    passive                         # espera por LCP
    modem                           # l?nea de modem

El siguiengte script, llamado ``/etc/ppp/pppserv`` habilitar? pppd, para
que actue como servidor:

.. code:: programlisting

    #!/bin/sh
    ps ax |grep pppd |grep -v grep
    pid=`ps ax |grep pppd |grep -v grep|awk '{print $1;}'`
    if [ "X${pid}" != "X" ] ; then
            echo 'killing pppd, PID=' ${pid}
            kill ${pid}
    fi
    ps ax |grep kermit |grep -v grep
    pid=`ps ax |grep kermit |grep -v grep|awk '{print $1;}'`
    if [ "X${pid}" != "X" ] ; then
            echo 'killing kermit, PID=' ${pid}
            kill -9 ${pid}
    fi

    # reset ppp interface
    ifconfig ppp0 down
    ifconfig ppp0 delete

    # enable autoanswer mode
    kermit -y /etc/ppp/kermit.ans

    # run ppp
    pppd /dev/tty01 19200

Utilice el script ``/etc/ppp/pppservdown`` para detener el servidor:

.. code:: programlisting

    #!/bin/sh
    ps ax |grep pppd |grep -v grep
    pid=`ps ax |grep pppd |grep -v grep|awk '{print $1;}'`
    if [ "X${pid}" != "X" ] ; then
            echo 'killing pppd, PID=' ${pid}
            kill ${pid}
    fi
    ps ax |grep kermit |grep -v grep
    pid=`ps ax |grep kermit |grep -v grep|awk '{print $1;}'`
    if [ "X${pid}" != "X" ] ; then
            echo 'killing kermit, PID=' ${pid}
            kill -9 ${pid}
    fi
    ifconfig ppp0 down
    ifconfig ppp0 delete

    kermit -y /etc/ppp/kermit.noans

El siguiente script de kermit (``/etc/ppp/kermit.ans``)
habilita/deshabilita el modo de autorespuesta en su m?dem. Y debe verse
algo similar a lo siguiente:

.. code:: programlisting

    set line /dev/tty01
    set speed 19200
    set file type binary
    set file names literal
    set win 8
    set rec pack 1024
    set send pack 1024
    set block 3
    set term bytesize 8
    set command bytesize 8
    set flow none

    pau 1
    out +++
    inp 5 OK
    out ATH0\13
    inp 5 OK
    echo \13
    out ATS0=1\13   ; cambiar esto a quedar out ATS0=0\13 si desea deshabilitar el modo
                    ; de autorespuesta
    inp 5 OK
    echo \13
    exit

Un script llamado ``/etc/ppp/kermit.dial`` es utilizado para llamar y
autentificarse en un host remoto. Es necesario que edite este fichero,
de acuerdo a sus necesidades. Escriba su nombre de usuario (login) y
contrase?a (password) en este fichero, tambi?n ser? necesario cambiar su
metodo de conexi?n, de acuerdo a lo que se ajuste a sus necesidades.

.. code:: programlisting

    ;
    ; ingrese el dispositivo que esta apuntando a su m?dem:
    ;
    set line /dev/tty01
    ;
    ; escriba la velocidad del m?dem:
    ;
    set speed 19200
    set file type binary            ; full 8 bit file xfer
    set file names literal
    set win 8
    set rec pack 1024
    set send pack 1024
    set block 3
    set term bytesize 8
    set command bytesize 8
    set flow none
    set modem hayes
    set dial hangup off
    set carrier auto                ; Posteriormente SET CARRIER si es necesario
    set dial display on             ; despues SET DIAL si es necesario
    set input echo on
    set input timeout proceed
    set input case ignore
    def \%x 0
    goto slhup

    :slcmd                          ; cambio a modo de comando
    echo Put the modem in command mode.
    clear                           ; Limpieza del buffer de entrada
    pause 1
    output +++
    input 1 OK\13\10                ; esperar para OK
    if success goto slhup
    output \13
    pause 1
    output at\13
    input 1 OK\13\10
    if fail goto slcmd              ; si el modem no responde Ok, intentar de nuevo

    :slhup                          ; colgar el tel?fono
    clear                           ; Limpieza del buffer de entrada
    pause 1
    echo Hanging up the phone.
    output ath0\13
    input 2 OK\13\10
    if fail goto slcmd              ; si no hay un OK como respuesta, poner el modem en modo de comando

    :sldial                         ; marcar el numero telefonico
    pause 1
    echo Dialing.
    output atdt9,550311\13\10               ; escriba el numero de telefono
    assign \%x 0                    ; asignar cero al contador

    :look
    clear                           ; Limpieza del buffer de entrada
    increment \%x                   ; Conteo de segundos
    input 1 {CONNECT }
    if success goto sllogin
    reinput 1 {NO CARRIER\13\10}
    if success goto sldial
    reinput 1 {NO DIALTONE\13\10}
    if success goto slnodial
    reinput 1 {\255}
    if success goto slhup
    reinput 1 {\127}
    if success goto slhup
    if < \%x 60 goto look
    else goto slhup

    :sllogin                        ; login
    assign \%x 0                    ; asignar cero al contador
    pause 1
    echo Looking for login prompt.

    :slloop
    increment \%x                   ; Conteo de segundos
    clear                           ; Limpieza del buffer de entrada
    output \13
    ;
    ; escriba su login prompt aqui:
    ;
    input 1 {Username: }
    if success goto sluid
    reinput 1 {\255}
    if success goto slhup
    reinput 1 {\127}
    if success goto slhup
    if < \%x 10 goto slloop         ; intentar 10 veces para obtener un login
    else goto slhup                 ; colgar y empezar de nuevo si a la decima falla

    :sluid
    ;
    ; escriba su nombre de usuario:
    ;
    output ppp-login\13
    input 1 {Password: }
    ;
    ; escriba su contrase?a:
    ;
    output ppp-password\13
    input 1 {Entering SLIP mode.}
    echo
    quit

    :slnodial
    echo \7No dialtone.  Check the telephone line!\7
    exit 1

    ; local variables:
    ; mode: csh
    ; comment-start: "; "
    ; comment-start-skip: "; "
    ; end:

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------+---------------------------------+--------------------------------------------+
| `Anterior <userppp.html>`__?   | `Subir <ppp-and-slip.html>`__   | ?\ `Siguiente <pppoe.html>`__              |
+--------------------------------+---------------------------------+--------------------------------------------+
| 25.2. Uso de User PPP?         | `Inicio <index.html>`__         | ?25.4. Uso de PPP sobre Ethernet (PPPoE)   |
+--------------------------------+---------------------------------+--------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
