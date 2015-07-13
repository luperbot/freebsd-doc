===============================
29.14. El “Superservidor” inetd
===============================

.. raw:: html

   <div class="navheader">

29.14. El “Superservidor” inetd
`Anterior <network-natd.html>`__?
Cap?tulo 29. Networking avanzado
?\ `Siguiente <network-plip.html>`__

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

29.14. El “Superservidor”  inetd
-------------------------------

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

29.14.1. Resumen
~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

`inetd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=inetd&sektion=8>`__
se conoce como el “Super Servidor de Internet” debido a que gestiona las
conexiones de varios d?mones. Los d?mones son programas que proporcionan
servicios de red. inetd act?a como un servidor de servidor de gesti?n de
otros d?mones. Cuando
`inetd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=inetd&sektion=8>`__
recibe una conexi?n se determina qu? d?mon deber?a responder a dicha
conexi?n, se lanza un proceso que ejecuta dicho d?mon y se le entrega el
“ socket”. La ejecuci?n de una ?nica instancia de inetd reduce la carga
del sistema en comparaci?n con lo que significar?a ejecutar cada uno de
los d?mones que gestiona de forma individual.

inetd se utiliza principalmente para lanzar procesos que albergan a
otros d?mones pero inetd tambi?n se utiliza para gestionar determinados
protocolos triviales como chargen, auth y daytime.

Esta secci?n trata la configuraci?n b?sica de inetd a trav?s de sus
opciones de l?nea de ?rdenes y utilizando su fichero de configuraci?n,
denominado ``/etc/inetd.conf``.

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

29.14.2. Configuraciones
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

inetd se inicializa a trav?s del fichero ``/etc/rc.conf`` en tiempo de
arranque. La opci?n ``inetd_enable`` posee el valor ``NO`` por defecto,
pero a menudo la aplicaci?n sysinstall la activa cuando se utiliza la
configuraci?n de perfil de seguridad medio. Estableciendo

.. code:: programlisting

    inetd_enable="YES"

o

.. code:: programlisting

    inetd_enable="NO"

dentro de ``/etc/rc.conf`` se puede activar o desactivar la la ejecuci?n
de inetd en el arranque del sistema.

Se pueden adem?s aplicar distintas opciones de l?nea de ?rdenes mediante
la opci?n ``inetd_flags``.

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

29.14.3. Opciones de l?nea de ?rdenes
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

sinopsis de inetd:

``     inetd [-d] [-l] [-w] [-W] [-c m?ximo] [-C tasa] [-a direcci?n | nombre_de_host]            [-p nombre_de_fichero] [-R tasa] [fichero de configuraci?n ]``

.. raw:: html

   <div class="variablelist">

-d
    Activa la depuraci?n.

-l
    Activa el “logging” de las conexiones efectuadas con ?cute.

-w
    Activa el recubrimiento de TCP para servicios externos (activado por
    defecto).

-W
    Activa el recubrimiento de TCP para los servicios internos,
    ejecutados directamente por el d?mon inetd (activado por defecto).

-c m?ximo
    Especifica el m?ximo n?mero de invocaciones simult?neas de cada
    servicio; el valor por defecto es ilimitado. Se puede sobreescribir
    para cada servicio utilizando la opci?n ``max-child``.

-C tasa
    Especifica el m?ximo n?mero de veces que se puede llamar a un
    servicio desde un direcci?n IP determinada por minuto; el valor por
    defecto es ilimitado. Se puede redefinir para cada servicio
    utilizando la opci?n ``max-connections-per-ip-per-minute``.

-R tasa
    Especifica el m?ximo n?mero de veces que se puede invocar un
    servicio en un minuto; el valor por defecto es 256. Un valor de 0
    permite un n?mero ilimitado de llamadas.

-a
    Especifica una direcci?n IP a la cual se asocia y sobre la cual se
    queda esperando recibir conexiones. Puede declararse tambi?n un
    nombre de m?quina, en cuyo caso se utilizar? la direcci?n (o
    direcciones si hay m?s de una) IPv4 o IPv6 que est?n tras dicho
    nombre. Normalmente se usa un nombre de m?quina cuando inetd se
    ejecuta dentro de un
    `jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8>`__,
    en cuyo caso el nombre de m?quina se corresponde con el entorno
    `jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8>`__.

    Cuando se desea asociarse tanto a direcciones IPv4 como a
    direcciones IPv6 y se utiliza un nombre de m?quina se necesita una
    entrada para cada protocolo (IPv4 o IPv6) para cada servicio que se
    active a trav?s de ``               /etc/inetd.conf``. Por ejemplo
    un servicio basado en TCP necesitar?a dos entradas, una utilizando
    ``tcp4`` para el protocolo IPv4 y otra con ``tcp6`` para las
    conexiones a trav?s del procolo de red IPv6.

-p
    Especifica un fichero alternativo en el cual se guarda el ID del
    proceso.

.. raw:: html

   </div>

Estas opciones se pueden declarar dentro de las variables
``inetd_flags`` del fichero ``/etc/rc.conf``. Por defecto
``inetd_flags`` tiene el valor ``-wW``, lo que activa el recubrimiento
de TCP para los servicios internos y externos de inetd. Los usuarios
inexpertos no suelen introducir estos par?metros y por ello ni siquiera
necesitan especificarse dentro de ``         /etc/rc.conf``.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Un servicio externo es un d?mon que se ejecuta fuera de inetd y que se
lanza cuando se recibe un intento de conexi?n. Un servicio interno es un
servicio que inetd puede servir directamente sin necesidad de lanzar
nuevos procesos.

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

29.14.4. ``inetd.conf``
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

La configuraci?n de inetd se realiza a trav?s del ficherode
configuraci?n ``     /etc/inetd.conf``.

Cuando se realiza una modificaci?n en el fichero ``/etc/inetd.conf`` se
debe obligar a inetd a releer dicho fichero de configuraci?n, lo cual se
realiza enviando una se?al “HANGUP” al proceso inetd como se muestra a
continuaci?n:

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Ejemplo 29.4. Env?o de una se?al HANGUP a inetd

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    # kill -HUP `cat /var/run/inetd.pid`

.. raw:: html

   </div>

.. raw:: html

   </div>

Cada l?nea del fichero de configuraci?n especifica un d?mon individual.
Los comentarios se preceden por el caracter “#”. El formato del fichero
de configuraci?n ``/etc/inetd.conf`` es el siguiente:

.. code:: programlisting

    service-name
    socket-type
    protocol
    {wait|nowait}[/max-child[/max-connections-per-ip-per-minute]]
    user[:group][/login-class]
    server-program
    server-program-arguments

A continuaci?n se muestra una entrada de ejemplo para el d?mon ftpd para
IPv4:

.. code:: programlisting

    ftp     stream  tcp     nowait  root    /usr/libexec/ftpd       ftpd -l

.. raw:: html

   <div class="variablelist">

service-name
    Este es el nombre del servicio que proporciona un determinado d?mon.
    Se debe corresponder con el nombre del nombre de servicio que se
    declara en el fichero ``/etc/services``. Este fichero determina
    sobre qu? puerto debe ponerse a escuchar inetd. Si se crea un nuevo
    servicio se debe especificar primero en ``/etc/services``.

socket-type
    Puede ser ``stream``, ``dgram``, ``raw`` o ``seqpacket``. ``stream``
    se debe utilizar obligatoriamente para d?mones orientados a conexi?n
    (d?mones TCP) mientras que ``dgram`` se utiliza en d?mones basados
    en el protocolo de transporte UDP.

protocol
    Uno de los siguientes:

    .. raw:: html

       <div class="informaltable">

    +-------------+-----------------------------------+
    | Protocolo   | Explicaci?n                       |
    +=============+===================================+
    | tcp, tcp4   | TCP IPv4                          |
    +-------------+-----------------------------------+
    | udp, udp4   | UDP IPv4                          |
    +-------------+-----------------------------------+
    | tcp6        | TCP IPv6                          |
    +-------------+-----------------------------------+
    | udp6        | UDP IPv6                          |
    +-------------+-----------------------------------+
    | tcp46       | TCP IPv4 e IPv6 al mismo tiempo   |
    +-------------+-----------------------------------+
    | udp46       | UDP IPv4 e IPv6 al mismo tiempo   |
    +-------------+-----------------------------------+

    .. raw:: html

       </div>

{wait\|nowait}[/max-child[/max-connections-per-ip-per-minute]]
    ``wait|nowait`` indica si el d?mon puede gestionar su propio
    “socket” o no. Los “ sockets” de tipo ``dgram`` deben utilizar
    obigatoriamente la opci?n ``wait`` mientras que los d?mones basados
    en “sockets” de tipo “stream”, los cuales se implementan normalmente
    mediante hilos, deber?a utilizar la opci?n ``nowait``. La opci?n
    ``wait`` normalmente entrega varios “ sockets” a un ?nico d?mon,
    mientras que la opci?n ``nowait`` lanza un d?mon “hijo” por cada
    nuevo “ socket”.

    El n?mero m?ximo de d?mones “ hijo” que puede lanzar inetd se puede
    especificar mediante la opci?n ``max-child``. Si se necesita por
    ejemplo un l?mite de diez instancias para un d?mon en particular se
    puede especificar el valor ``10`` justo despu?s de la opci?n
    ``nowait``.

    Adem?s de ``max-child`` se puede activar otra opci?n para limitar en
    n?mero m?ximo de conexiones que se aceptan desde un determinado
    lugar mediante la opci?n ``max-connections-per-ip-per-minute``. Esta
    opci?n hace justo lo que su nombre indica. Un valor de, por ejemplo,
    diez en esta opci?n limitar?a cualquier m?quina remota a un m?ximo
    de diez intentos de conexi?n por minuto. Esto resulta ?til para
    prevenir un consumo incontrolado de recursos y ataques de Denegaci?n
    de Servicio (“Denial of Service” o DoS) sobre nuestra m?quina.

    Cuando se especifica este campo las opciones ``wait`` o ``nowait``
    son obligatorias ``max-child`` y
    ``max-connections-per-ip-per-minute`` son opcionales.

    Un d?mon de tipo “stream” sin la opci?n ``max-child`` y sin la
    opci?n ``max-connections-per-ip-per-minute`` simplemente
    especificar?a la opci?n ``nowait``.

    El mismo d?mon con el l?mite m?ximo de diez d?mones “hijos” ser?a:
    ``nowait/10``.

    La misma configuraci?n con un l?mite de veinte conexiones por
    direcci?n IP por minuto y un m?ximo total de diez d?mones “hijos”
    ser?a: ``nowait/10/20``.

    Todas estas opciones son utilizadas por el d?mon fingerd que se
    muestra a continuaci?n a modo de ejemplo:

    .. code:: programlisting

        finger stream  tcp     nowait/3/10 nobody /usr/libexec/fingerd fingerd -s

user
    Este es el nombre de usuario con el que deber?a ejecutarse un
    determinado d?mon. Normalmente los d?mones se suelen ejectar con
    permisos de ``root``. Por motivos de seguridad, resulta bastante
    com?n encontrarse con algunos servidores que se ejecutan bajo el
    usuario ``daemon`` o incluso por el usuario menos privilegiado de
    todos que es el usuario ``nobody``.

server-program
    La ruta completa de la localizaci?n del d?mon que se quiere ejecutar
    cuando se recibe un intento de conexi?n. Si el d?mon es un servicio
    proporcionado por el propio inetd se debe utilizar la opcion
    ``internal`` en su lugar.

server-program-arguments
    Esto funciona en conjunci?n con ``server-program``, ya que
    especifica los argumentos, comenzando por ``argv[0]``, que se pasan
    al d?mon cuando se le invoca. Si la l?nea de ?rdenes es
    ``mydaemon -d``, ``mid?mon                 -d`` deber?a ser el valor
    de la opci?n ``server-program-arguments``. Si el d?mon es un
    servicio interno se debe utilizar la utilizar la opci?n ``internal``
    en lugar de la que estamos comentando.

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

29.14.5. Seguridad
~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dependiendo del perfil de seguridad establecido cuando se instal? el
sistema FreeBSD varios d?mones de inetd pueden estar desactivados o
activados. Si no se necesita un d?mon determinado, *no lo active*.
Especifique un “#” al comienzo de la l?nea del d?mon que quiere
desactivar y env?e una se?al
`hangup <network-inetd.html#network-inetd-hangup>`__ a inetd. No se
aconseja ejecutar algunos d?mones determinados (un caso t?pico es
fingerd) porque pueden proporcionar informaci?n valiosa para un
atacante.

Algunos d?mones no presentan ninguna caracter?stica de seguridad y
poseen grandes o incluso no poseen tiempos de expiraci?n para los
intentos de conexi?n. Esto permite que un atacante sature los recursos
de nuestra m?quina realizando intentos de conexi?n a una tasa
relativamente baja contra uno de estos ingenuos d?mones. Pueder ser una
buena idea protegerse de esto utilizando las opciones
``max-connections-per-ip-per-minute`` y ``     max-child`` para este
tipo de d?mones.

El recubrimiento de TCP est? activado por defecto tal y como ya se ha
comentado anteriormente. Consulte la p?gina del manual de
`hosts\_access(5) <http://www.FreeBSD.org/cgi/man.cgi?query=hosts_access&sektion=5>`__
para obtener m?s informaci?n sobre c?mo aplicar restricciones
relacionadas con TCP a los d?mones invocados por inetd.

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

29.14.6. Varios
~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

daytime, time, echo, discard, chargen y auth son servicios que inetd
proporciona de forma interna y propia.

El servicio auth proporciona servicios de identificaci?n a trav?s de la
red (ident, identd) y se puede configurar hasta en cierto grado.

Consulte la p?gina del manual de
`inetd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=inetd&sektion=8>`__
si quiere conocer todos los detalles.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------------+----------------------------------------+----------------------------------------+
| `Anterior <network-natd.html>`__?          | `Subir <advanced-networking.html>`__   | ?\ `Siguiente <network-plip.html>`__   |
+--------------------------------------------+----------------------------------------+----------------------------------------+
| 29.13. Traducci?n de direcciones de red?   | `Inicio <index.html>`__                | ?29.15. L?nea IP paralela (PLIP)       |
+--------------------------------------------+----------------------------------------+----------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
