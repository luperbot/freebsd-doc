============
29.9. NIS/YP
============

.. raw:: html

   <div class="navheader">

29.9. NIS/YP
`Anterior <network-isdn.html>`__?
Cap?tulo 29. Networking avanzado
?\ `Siguiente <network-dhcp.html>`__

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

29.9. NIS/YP
------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Escrito por Bill Swingle.

.. raw:: html

   </div>

.. raw:: html

   <div>

Ampliado por Eric Ogren y Udo Erdelhoff.

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

29.9.1. ?Qu? es esto?
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

NIS, siglas de Network Information Services (Servicios de Informaci?n de
Red), fu? un servicio desarrollado por Sun Microsystems para centralizar
la administraci?n de sistemas UNIX? (originalmente SunOS™). Actualmente
se considera como un est?ndar de la industria; los principales sistemas
tipo UNIX? (Solaris™, HP-UX, AIX?, Linux, NetBSD, OpenBSD, FreeBSD, etc)
implementan NIS.

NIS tambi?n se conoc?a como el servicio de p?ginas amarillas pero debido
a problemas legales debidos a la propiedad de marcas comerciales, Sun
tuvo que cambiar el nombre. El ant?guo t?rmino (“Yellow Pages” o yp)
todav?a se ve y se utiliza con frecuencia.

Se trata de un sistema cliente servidor basado en llamadas RPC que
permite a un grupo de m?quinas que se encuentran definidas dentro de un
dominio administrativo NIS compartir un conjunto de ficheros de
configuraci?n. Esto permite al administrador de sistemas por un lado
configurar clientes NIS de forma minimalista y por otro lado centralizar
la gesti?n de los ficheros de configuraci?n en una ?nica ubicaci?n (una
sola m?quina).

Se trata de algo similar al sistema de dominio de Windows?NT? aunque la
implementaci?n interna no se puede comparar, la funcionalidad y el
servicio obtenido son similares.

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

29.9.2. T?rminos/procesos que debe usted conocer
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Existen varios conceptos y varios procesos de usuario que el usuario no
versado en estos temas suele encontrarse la primera vez que se intenta
implantar un servicio de NIS en FreeBSD, tanto si se intenta configurar
un servidor como si se intenta configurar un cliente:

.. raw:: html

   <div class="informaltable">

+------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Term             | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
+==================+========================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================+
| NIS domainname   | Un servidor maestro de NIS y todos sus clientes (incluyendo a sus servidores esclavos) poseen el mismo nombre dominio NIS. Al igual que ocurre con el nombre de dominio de Windows?NT?, el nombre de dominio de NIS no tiene nada que ver con el nombre de dominio de DNS.                                                                                                                                                                                                                                                                                                                                                                                                             |
+------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| portmap          | Debe ejecutarse para que se activen las llamadas a procedimientos remotos (Remote Procedure Call o RPC) que son utilizadas por NIS. Si portmap no se est? ejecutando no se podr? ejecutar ni clientes ni servidores de NIS.                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
+------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ypbind           | “Asocia” un cliente con un servidor NIS. Primeramente se lee el nombre de dominio NIS del sistema y utilizando RPC se conecta con el servidor. ypbind es la parte central de la comunicaci?n cliente servidor del sistema NIS; si ypbind muere en una m?quina cliente, dicha m?quina no podr? acceder al servidor NIS.                                                                                                                                                                                                                                                                                                                                                                 |
+------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ypserv           | Debe ejecutarse s?lamente en los servidores NIS; se trata del proceso servidor de NIS. Si `ypserv(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ypserv&sektion=8>`__ muere, el servidor no ser? capaz de responder a peticiones NIS (no obstante, si se definen servidores NIS esclavos la situaci?n puede recuperarse). Existen algunas implementaciones de NIS (no es el caso de FreeBSD) que no intentan conectarse con otro servidor si el servidor con otro servidor si el servidor que se estaba que se estaba utilizando muere. A menudo lo ?nico que se puede hacer en estos casos es reiniciar el servidor (el proceso o la propia m?quina) o el proceso ypbind del cliente.   |
+------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| rpc.yppasswdd    | Otro proceso que s?lo debe ejecutarse en el servidor maestro de NIS; se trata de un d?mon que permite a los clientes de NIS modificar las contrase?as de los usuarios. Si no se ejecuta este d?mon los usuarios tendr?n que entrar en el servidor maestro de NIS para cambiar sus contrase?as all?.                                                                                                                                                                                                                                                                                                                                                                                    |
+------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

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

29.9.3. ?C?mo funciona?
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Existen tres tipos de m?quinas dentro del entorno NIS: los servidores
maestros, los servidores esclavos y los clientes de NIS. Los servidores
act?an como repositorios centrales para almacenamiento de informaci?n de
configuraci?n. Los servidores maestros mantienen una copia maestra de
dicha informaci?n, mientras que los servidores esclavos mantienen copias
de la informaci?n maestra por motivos de redundancia. Los servidores se
encargan de transmitir la informaci?n necesaria a los clientes a
petici?n de estos ?ltimos.

De esta forma se pueden compatir mucha informaci?n contenida en varios
archivos. Los ficheros ``     master.passwd``, ``group`` y
``     hosts`` normalmente se comparten a trav?s de NIS. Siempre que un
proceso en un cliente necesita informaci?n que, en caso de no utilizar
NIS, se podr?a recuperar de ficheros locales, en este caso se env?a una
solicitud al servidor NIS con el que nos encontramos asociados.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

29.9.3.1. Clases de m?quinas
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="itemizedlist">

-  

   *Servidor de NIS maestro*. Este servidor, semejante a un controlador
   de dominio primario de Windows?NT? mantiene todos los archivos que
   utilizan los clientes. Los ficheros ``passwd``, ``group`` y algunos
   otros se encuentran ubicados en el servidor maestro.

   .. raw:: html

      <div class="note" xmlns="">

   Nota:
   ~~~~~

   Resulta posible configurar una m?quina para que act?e como servidor
   NIS maestro para m?s de un dominio NIS. No obstante esta
   configuraci?n no se va a tratar en esta introducci?n, en la cual
   asumimos un entorno NIS de tama?o relativamente peque?o.

   .. raw:: html

      </div>

-  

   *Servidores de NIS esclavos*. Semejantes a los controladores de
   backup de Windows?NT?, los servidores NIS esclavos se utilizan para
   proporcionar redundancia en entornos de trabajo donde la
   disponibilidad del servicio resulta muy importante. Adem?s se
   utilizan para distribuir la carga que normalmente soporta un servidor
   maestro: los clientes de NIS siempre se asocian con el servidor de
   NIS que posee mejor tiempo de respuesta, y esto y esto tambi?n
   incluye a los servidores de NIS esclavos.

-  

   *Clientes NIS*. Los clientes NIS, de forma semejante a las estaciones
   de trabajo de Windows?NT?, se validan contra un servidor NIS (en el
   caso de Windows?NT? se validan contra un controlador de dominio) para
   acceder al sistema.

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

29.9.4. Uso de NIS/YP
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Esta secci?n trata sobre c?mo configurar y poner en funcionamiento un
entorno de NIS sencillo.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Esta secci?n supone que se est? utilizando utilizando FreeBSD?3.3 o
posteriores. Las instrucciones dadas aqu? *probablemente* funcionen
tambi?n en cualquier versi?n de FreeBSD superior a la 3.0 pero no
podemos garantizar que esto sea as?.

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

29.9.4.1. Planificaci?n
^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Vamos a suponer que somos el administrador de un peque?o laboratorio de
una universidad. En este laboratorio, compuesto por 15 m?quinas FreeBSD,
actualmente no existe ning?n punto de administraci?n centralizada; cada
m?quina posee sus sus propios ``/etc/passwd`` y
``           /etc/master.passwd``. Estos ficheros se encuentran
sincronizados el uno con el otro mediante intervenci?n manual; por
tanto, cuando queramos a?adir un usuario a nuestro laboratorio tendremos
que ejecutar ``adduser`` en todas las m?quinas. Claramente esta
situaci?n tiene que cambiar, de tal forma que hemos decidido crear un
dominio NIS en el laboratorio usando dos m?quinas como servidores NIS.

La configuraci?n de nuestro laboratorio deber?a ser algo parecido a lo
siguiente:

.. raw:: html

   <div class="informaltable">

+---------------------+---------------------+---------------------------------------+
| Nombre de m?quina   | Direcci?n IP        | Papel                                 |
+=====================+=====================+=======================================+
| ``ellington``       | ``10.0.0.2``        | servidor NIS maestro                  |
+---------------------+---------------------+---------------------------------------+
| ``coltrane``        | ``10.0.0.3``        | Servidor NIS esclavo                  |
+---------------------+---------------------+---------------------------------------+
| ``basie``           | ``10.0.0.4``        | Estaci?n de trabajo del profesorado   |
+---------------------+---------------------+---------------------------------------+
| ``bird``            | ``10.0.0.5``        | m?quina cliente                       |
+---------------------+---------------------+---------------------------------------+
| ``cli[1-11]``       | ``10.0.0.[6-17]``   | Resto de m?quinas clientes            |
+---------------------+---------------------+---------------------------------------+

.. raw:: html

   </div>

Si se est? configurando un esquema de NIS por primera vez es una buena
idea detenerse a pensar c?mo queremos implantar el sistema. Existen
varias decisiones que se deben tomar independientemente del tama?o de
nuestra red.

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

29.9.4.1.1. Elecci?n del nombre de dominio NIS
''''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Este nombre puede no ser el “nombre de dominio” al que estamos
acostumbrados. Resulta m?s preciso llamarlo “nombre de dominio NIS”.
Cuando un cliente genera peticiones de NIS que llegan a todas las
m?quinas (broadcast) solicitando informaci?n se incluye el nombre de
dominio NIS que tiene configurado. De esta forma, varios servidores de
dominios distintos situados en la misma red pueden discriminar las
peticiones recibidas. Se puede pensar en el nombre de dominio NIS como
un identificador de grupos de m?quinas que se encuentran relacionados
administrativamente de alguna forma.

Algunas organizaciones eligen utilizar su nombre de dominio de Internet
como nombre de dominio NIS. Esto no se recomienda ya que puede causar
confusi?n cuando se intentan depurar problemas de red. El nombre de
dominio NIS deber?a ser un nombre ?nico dentro de nuestra red y resulta
m?s ?til a?n si el nombre elegido puede describir de alguna forma al
conjunto de m?quinas que representa. Por ejemplo el departamento de arte
de la empresa Acme puede utilizar como nombre de dominio “acme-art”. En
nuestro ejemplo hemos utilizado el nombre ``test-domain``.

No obstante algunos sistemas operativos (de forma notable SunOS™)
utilizan como nombres de dominio nombres de Internet. Si se poseen
m?quinas con esta restricci?n no queda m?s remedio que *utilizar* los
nombres de dominio de Internet como nombres de dominio NIS.

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

29.9.4.1.2. Requisitos f?sicos de los servidores
''''''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Existen varias cosas que debemos tener en cuenta cuando se selecciona
una m?quina para actuar como servidor NIS. Una de las caracter?sticas
desafortunadas del servicio de p?ginas amarillas es el alto nivel de
dependencia que llegan a tener los clientes respecto del servidor de
NIS. Si el cliente no puede contactar con el servidor NIS normalmente la
m?quina se queda en un estado totalmente inutilizable. La carencia de
informaci?n de usuarios y grupos provoca que las m?quinas se bloqueen.
Con esto en mente debemos debemos asegurarnos de escoger un servidor de
NIS que no se reinicie de forma habitual o uno que no se utilice para
para desarrollar. Si se dispone de una red con poca carga puede resultar
aceptable colocar el servidor de NIS en una m?quina donde se ejecuten
otros servicios pero en todo momento se debe tener presente que si por
cualquier motivo el servidor de NIS quedara inutilizable afectar?a a
*todas* las m?quinas de forma negativa.

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

29.9.4.2. Servidores NIS
^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Las copias can?nicas de toda la informaci?n que mantiene el sistema de
p?ginas amarillas se almacenan en una ?nica m?quina denominada servidor
maestro de NIS. Las bases de datos utilizadas para almacenar la
informaci?n se denominan mapeos NIS. En FreeBSD estas asociaciones o
mapeos se almacenan en el directorio ``/var/yp/[nombrededominio]`` donde
``[nombrededominio]`` es el nombre del dominio de NIS que el servidor
gestiona. Un ?nico servidor NIS puede gestionar varios dominios al mismo
tiempo de forma que resulta posible tener varios directorios como el
anterior, uno por cada dominio soportado. Cada dominio posee su conjunto
de mapeos independiente y propio.

Los servidores maestro y esclavos manejan todas las peticiones de a
trav?s del d?mon ``ypserv``. ``ypserv`` se responsabiliza de recibir
peticiones de los clientes NIS. Estas peticiones se traducen a una ruta
dentro del servidor. Esta ruta localiza un fichero de base de datos
determinado del servidor de NIS, y finalmente ``           ypserv`` se
encarga de transmitir la informaci?n de dicha base de datos de vuelta al
cliente que la solicit?.

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

29.9.4.2.1. Configuraci?n de un servidor de NIS maestro
'''''''''''''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

La configuraci?n de un servidor de NIS maestro puede resultar
relativamente sencilla dependiendo de las necesidades que se tengan.
FreeBSD viene preconfigurado por defecto con un servicio NIS. Todo lo
que necesitamos es a?adir la siguiente l?nea en ``/etc/rc.conf`` y
FreeBSD se encarga del resto.

.. raw:: html

   <div class="procedure">

#. .. code:: programlisting

       nisdomainname="test-domain"

   Esta l?nea establece el nombre de dominio NIS como ``test-domain``,
   cuando se realiza la configuraci?n de la red (por ejemplo, despu?s de
   un reinicio).

#. .. code:: programlisting

       nis_server_enable="YES"

   Esta variable indica a FreeBSD que ejecute los procesos necesarios
   para actuar como un servidor de NIS la pr?xima vez que se configure
   el subsistema de red.

#. .. code:: programlisting

       nis_yppasswdd_enable="YES"

   Esto permite activar el d?mon ``rpc.yppasswdd`` el cual, como se ha
   mencionado anteriormente, permite a los usuarios realizar cambios de
   contrase?a desde las m?quinas clientes de NIS.

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Dependiendo de la configuraci?n de NIS podemos necesitar a?adir algunas
entradas m?s. Consulte la `secci?n sobre servidores NIS que tambi?n
act?an como clientes <network-nis.html#network-nis-server-is-client>`__,
m?s adelante en el texto, para saber m?s sobre esto.

.. raw:: html

   </div>

Una vez hecho esto todo lo que tenemos que hacer es ejecutar
``/etc/netstart`` como superusuario. Esta orden realiza los pasos de
configuraci?n necesarios utilizando los valores de las variables
definidas en ``/etc/rc.conf``.

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

29.9.4.2.2. Inicializaci?n de los mapeos de NIS
'''''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Las *asociaciones o mapeos de NIS* no son m?s que ficheros de base de
datos. Estos ficheros se generan a partir de los ficheros de
configuraci?n contenidos en el directorio ``             etc/`` excepto
para el caso del fichero ``             etc/master.passwd``. Esto es as?
por una buena raz?n ya que no suele ser buena idea propagar las
contrase?as de ``root`` y de otras cuentas de administraci?n a todos los
servidores NIS del dominio. servidores NIS del dominio. As?, antes de
inicializar los mapeos se debe ejecutar:

.. code:: screen

    # cp /etc/master.passwd /var/yp/master.passwd
    # cd /var/yp
    # vi master.passwd

Se deben borrar todas las entradas que hagan referencia a cuentas del
sistema (``bin``, ``tty``, ``kmem``, ``games``, etc), junto con
cualquier cuenta que no deseemos que se transmita a los clientes NIS
(por ejemplo la cuenta de ``             root`` y cualquier otra cuenta
con UID 0 (el del superusuario)).

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Aseg?rese de que ``/var/yp/master.passwd`` no se puede leer ni por
grupos ni por el resto de usuarios (modo 600). Utilice ``chmod`` en caso
de necesidad.

.. raw:: html

   </div>

Una vez hecho esto es hora de inicializar las asociaciones de NIS.
FreeBSD incluye un “script” denominado ``ypinit`` para realizar esta
tarea (consulte su p?gina del manual para obtener m?s informaci?n).
Recuerde que este “script” se encuentra disponible en la mayor?a de los
sistemas UNIX?, pero no en todos. En sistemas Digital UNIX/Compaq Tru64
UNIX se denomina ``ypsetup``. Debido a que se pretende generar
asociaciones para un servidor NIS maestro vamos a ejecutar ``ypinit``
con la opci?n ``-m``. A modo de ejemplo, suponiendo que todos los pasos
comentados anteriormente se han realizado con ?xito, ejecute:

.. code:: screen

    ellington# ypinit -m test-domain
    Server Type: MASTER Domain: test-domain
    Creating an YP server will require that you answer a few questions.
    Questions will all be asked at the beginning of the procedure.
    Do you want this procedure to quit on non-fatal errors? [y/n: n] n
    Ok, please remember to go back and redo manually whatever fails.
    If you don't, something might not work.
    At this point, we have to construct a list of this domains YP servers.
    rod.darktech.org is already known as master server.
    Please continue to add any slave servers, one per line. When you are
    done with the list, type a <control D>.
    master server   :  ellington
    next host to add:  coltrane
    next host to add:  ^D
    The current list of NIS servers looks like this:
    ellington
    coltrane
    Is this correct?  [y/n: y] y

    [..salida de la generacion de mapeos..]

    NIS Map update completed.
    ellington has been setup as an YP master server without any errors.

``ypinit`` deber?a haber creado el fichero ``/var/yp/Makefile`` a partir
de ``/var/yp/Makefile.dist``. Una vez creado este archivo presupone que
se est? usando un entorno NIS con un ?nico servidor utilizando s?lamente
m?quinas FreeBSD. Debido a que ``test-domain`` posee tambi?n un servidor
NIS esclavo se debe editar el fichero ``             var/yp/Makefile``:

.. code:: screen

    ellington# vi
                  /var/yp/Makefile

Se debe comentar la l?nea que dice:

.. code:: programlisting

    NOPUSH = "True"

(si es que no se encuentra ya comentada).

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

29.9.4.2.3. Configuraci?n de un servidor NIS esclavo
''''''''''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

La configuraci?n de un servidor NIS esclavo resulta ser incluso m?s
sencilla que la del maestro. Basta con entrar en el servidor esclavo y
editar ``/etc/rc.conf`` de foma semejante a como se realiz? en el
apartado anterior. La ?nica diferencia consiste en que ahora debemos
utilizar la opci?n ``-s`` cuando ejecutemos ejecutemos ``ypinit``. A
continuaci?n del par?metro ``-s`` se debe especificar el nombre del
servidor maestro de modo que la orden tendr?a que ser algo parecido a
esto:

.. code:: screen

    coltrane# ypinit -s ellington test-domain

    Server Type: SLAVE Domain: test-domain Master: ellington

    Creating an YP server will require that you answer a few questions.
    Questions will all be asked at the beginning of the procedure.

    Do you want this procedure to quit on non-fatal errors? [y/n: n]  n

    Ok, please remember to go back and redo manually whatever fails.
    If you don't, something might not work.
    There will be no further questions. The remainder of the procedure
    should take a few minutes, to copy the databases from ellington.
    Transferring netgroup...
    ypxfr: Exiting: Map successfully transferred
    Transferring netgroup.byuser...
    ypxfr: Exiting: Map successfully transferred
    Transferring netgroup.byhost...
    ypxfr: Exiting: Map successfully transferred
    Transferring master.passwd.byuid...
    ypxfr: Exiting: Map successfully transferred
    Transferring passwd.byuid...
    ypxfr: Exiting: Map successfully transferred
    Transferring passwd.byname...
    ypxfr: Exiting: Map successfully transferred
    Transferring group.bygid...
    ypxfr: Exiting: Map successfully transferred
    Transferring group.byname...
    ypxfr: Exiting: Map successfully transferred
    Transferring services.byname...
    ypxfr: Exiting: Map successfully transferred
    Transferring rpc.bynumber...
    ypxfr: Exiting: Map successfully transferred
    Transferring rpc.byname...
    ypxfr: Exiting: Map successfully transferred
    Transferring protocols.byname...
    ypxfr: Exiting: Map successfully transferred
    Transferring master.passwd.byname...
    ypxfr: Exiting: Map successfully transferred
    Transferring networks.byname...
    ypxfr: Exiting: Map successfully transferred
    Transferring networks.byaddr...
    ypxfr: Exiting: Map successfully transferred
    Transferring netid.byname...
    ypxfr: Exiting: Map successfully transferred
    Transferring hosts.byaddr...
    ypxfr: Exiting: Map successfully transferred
    Transferring protocols.bynumber...
    ypxfr: Exiting: Map successfully transferred
    Transferring ypservers...
    ypxfr: Exiting: Map successfully transferred
    Transferring hosts.byname...
    ypxfr: Exiting: Map successfully transferred

    coltrane has been setup as an YP slave server without any errors.
    Don't forget to update map ypservers on ellington.

En estos momentos debemos tener un nuevo directorio llamado
``/var/yp/test-domain``. Las copias de los mapeos del servidor maestro
se almacenan en dicho directorio. Es nuestra responsabilidad como
administradores asegurar que dichas copias permanecen actualizadas en
todo momento. La siguiente entrada en el archivo ``/etc/crontab`` del
servidor esclavo se encarga de realizar esta tarea:

.. code:: programlisting

    20      *       *       *       *       root   /usr/libexec/ypxfr passwd.byname
    21      *       *       *       *       root   /usr/libexec/ypxfr passwd.byuid

Estas dos l?neas obligan al servidor esclavo a sincronizar los mapeos
con el servidor maestro. Estas entradas no son obligatorias ya que el
servidor maestro siempre intenta comunicar cualquier cambio que se
produzca en sus asociaciones a todos los servidores esclavos ya que la
informaci?n de, esclavos, ya que la informaci?n de, por ejemplo,
contrase?as es de vital importancia para el funcionamiento de los
sistemas que dependen del servidor. No obstante es una buena idea
obligar a que se realicen estos cambios mediante las entradas
anteriores. Esto resulta ser incluso m?s importante en redes de
sobrecargadas donde las actualizaciones de asociaciones pueden algunas
veces no llegar a realizarse de forma completa.

A continuaci?n se ejecuta ``/etc/netstart`` en el servidor esclavo de
igual de igual forma que se hizo con el servidor maestro; esto relanza
de nuevo el servidor de NIS.

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

29.9.4.3. Clientes NIS
^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Un cliente de NIS establece lo que se conoce con el nombre de asociaci?n
(bind en ingl?s) con un servidor NIS NIS determinado utilizando el d?mon
``       ypbind``. ``ypbind`` comprueba el dominio por defecto del
sistema (especificado mediante ``domainname``) y comienza a enviar
peticiones RPC a todos los elementos de la red local (broadcast). Estas
peticiones especifican el nombre del dominio con el que se quiere
establecer la asociaci?n. Si esta petici?n alcanza una petici?n alcanza
un servidor NIS configurado para servir dicho dominio el servidor
responde a la petici?n e ``ypbind`` almacenar? la direcci?n de dicho
servidor. Si existen varios servidores disponibles (un maestro y varios
esclavos, por ejemplo), ``ypbind`` utilizar? la direcci?n del primero en
responder. A partir de este punto el cliente dirigir? el resto de sus
peticiones NIS directamente a la direcci?n IP almacenada. Ocasionalmente
``ypbind`` env?a un “ping” sobre el servidor para comprobar que en
efecto se encuentra funcionando. Si no se recibe contestaci?n al ping
dentro de un espacio de tiempo determinado ``ypbind`` marca el dominio
como “sin asociar” y comienza de nuevo a inundar la red con la esperanza
de localizar alg?n otro servidor NIS.

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

29.9.4.3.1. Configuraci?n de un cliente NIS
'''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

La configuraci?n de un cliente FreeBSD de NIS resulta ser una operaci?n
extremadamente sencilla.

.. raw:: html

   <div class="procedure">

#. Editar el fichero ``/etc/rc.conf`` y a?adir las siguientes l?neas
   para establecer el nombre de dominio NIS y para que se ejecute
   ``ypbind`` al arranque de la red:

   .. code:: programlisting

       nisdomainname="test-domain"
       nis_client_enable="YES"

#. Para importar todas las entradas de contrase?as del servidor de NIS
   hay que eliminar todas las cuentas de usuario de
   ``/etc/master.passwd`` y utilizar ``vipw`` para a?adir la siguiente
   l?nea al final de dicho fichero:

   .. code:: programlisting

       +:::::::::

   .. raw:: html

      <div class="note" xmlns="">

   Nota:
   ~~~~~

   Esta l?nea permite que cualquiera abra una cuenta en local, siempre
   que dicha cuenta se encuentre definida en las asociaciones de cuentas
   y contrase?as del servidor NIS. Existen varias formas de configurar
   los clientes NIS modificando esta l?nea. Consulte la `secci?n sobre
   netgroups <network-nis.html#network-netgroups>`__ que se encuentra
   m?s adelante en este mismo texto. Si quiere saber m?s puede consultar
   el libro de O'Reilly ``Managing NFS and                     NIS``.

   .. raw:: html

      </div>

   .. raw:: html

      <div class="note" xmlns="">

   Nota:
   ~~~~~

   Se debe mantener al menos una cuenta local (por ejemplo, una cuenta
   que no se importe a trav?s de NIS) en el fichero
   ``/etc/master.passwd`` y adem?s dicha cuenta deber?a ser miembro del
   grupo ``wheel``. Si algo va mal con el procedimiento descrito esta
   cuenta se puede utilizar para entrar en la m?quina cliente de forma
   remota para posteriormente convertirse en superusuario e intentar
   solucionar el problema.

   .. raw:: html

      </div>

#. Para importar todas las entradas de grupo posibles del servidor NIS
   se debe a?adir la siguiente l?nea al fichero ``/etc/group``:

   .. code:: programlisting

       +:*::

.. raw:: html

   </div>

Despu?s de completar estos pasos deber?mos ser capaces de ejecutar
``ypcat passwd`` y ver la asociaci?n de contrase?as que se encuentra en
el servidor de NIS

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

29.9.5. Seguridad en NIS
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

En general cualquier usuario remoto puede realizar peticiones de RPC a
`ypserv(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ypserv&sektion=8>`__
y recuperar los contenidos de las asociaciones de NIS siempre y cuando
el usuario remoto conozca el nombre de dominio de NIS. Para evitar este
tipo de transacciones no autorizadas,
`ypserv(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ypserv&sektion=8>`__
soporta una caracter?stica denominada “securenets” la cual se puede
utilizar para limitar el acceso a un determinado conjunto de m?quinas.
En el arranque
`ypserv(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ypserv&sektion=8>`__
intenta cargar la informaci?n de “securenets” a partir de un fichero
denominado ``/var/yp/securenets``.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Esta ruta de fichero var?a dependiendo del camino especificado con la
opci?n ``-p``. Dicho fichero contiene entradas compuestas de, por un
lado, un rango de red y por otro una m?scara de red, separados por
espacios en blanco. Las l?neas que comienzan por “#” se consideran
comentarios. A continuaci?n se muestra un ejemplo de un fichero
“securenet”:

.. raw:: html

   </div>

.. code:: programlisting

    # admitir conexiones desde localhost -- obligatorio
    127.0.0.1     255.255.255.255
    # admitir conexiones desde cualquier host
    # on the 192.168.128.0 network
    192.168.128.0 255.255.255.0
    # admitir conexiones desde cualquier host
    # between 10.0.0.0 to 10.0.15.255
    # esto incluye las maquinas en el 'testlab'
    10.0.0.0      255.255.240.0

Si
`ypserv(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ypserv&sektion=8>`__
recibe una petici?n de una direcci?n que coincide con alguna de las
reglas especificadas en el fichero se procesa la petici?n. Si no existe
ninguna coincidencia la petici?n se rechaza y se graba un mensaje de
aviso. Si el archivo ``/var/yp/securnets`` no existe ``ypserv`` acepta
conexiones de cualquier m?quina.

El programa ``ypserv`` tambi?n posee soporte para el paquete de Wietse
Venema denominado tcpwrapper. Este paquete permite utilizar los ficheros
de configuraci?n de tcpwrapper para realizar control de acceso en lugar
de utilizar ``     var/yp/securenets``.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Aunque ambos mecanismos de control de acceso proporcionan un grado de
seguridad mayor que no utilizar nada resultan vulnerables a ataques de
“falsificaci?n de IPs”. El cortafuegos de la red donde se implanta el
servicio de NIS deber?a encargarse de bloquear el tr?fico espec?fico de
dicho servicio.

Los servidores que utilizan ``/var/yp/securenets`` pueden no prestar
servicio a clientes NIS leg?timos cuando se trabaja con implementaciones
arcaicas de TCP/IP. Algunas de estas implementaciones ponen a cero todos
los bits de m?quina cuando se realizan broadcast y/o pueden fallar al
especificar la m?scara de red en el mismo caso, por citar algunos
ejemplos. Mientras que algunos de estos problemas se pueden solucionar
variando la configuraci?n del cliente en otros casos podemos vernos
obligados a prescindir del cliente en cuesti?n o a prescindir del
fichero ``           var/yp/securenets``.

Se desaconseja la utilizaci?n de ``           var/yp/securenets`` en un
sistema con una implementaci?n arcaica de TCP/IP y puede suponer una
p?rdida de funcionalidad para grandes zonas de la red.

La utilizaci?n del paquete tcpwrapper incrementa la latencia del
servidor NIS. El retardo adicional introducido puede ser lo
suficientemente grande como para causar la expiraci?n de ciertos
temporizadores de los programas clientes, especialmente en redes muy
cargadas o con servidores de NIS lentos. Si se experimentan estos
s?ntomas en varias m?quinas clientes, puede ser conveniente convertir
dichas m?quinas en servidores NIS esclavos y obligarlas a asociarse con
ellas mismas.

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

29.9.6. Prohibir el acceso a determinados usuarios
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

En nuestro laboratorio de ejemplo existe una m?quina denominada
``basie`` que act?a s?lo como una estaci?n de trabajo para el
profesorado. No queremos sacar a esta m?quina del dominio NIS pero nos
damos cuenta de que el fichero ``passwd`` que se encuentra en el
servidor de NIS posee cuentas tanto para profesores como para alumnos.
?Qu? podemos hacer?.

Existe una forma de prohibir el acceso a determinados usuarios sobre una
determinada m?quina incluso aunque se encuentren dados de alta en la
base de datos de NIS. Para realizar esto todo lo que debemos hacer es
a?adir ``-nombredeusuario`` al final del fichero ``/etc/master.passwd``
en la m?quina cliente donde *``nombredeusuario``* es el nombre de
usuario del usuario al que queremos prohibirle el acceso. Esto se debe
realizar a poder ser mediante ``vipw`` ya que ``vipw`` realiza
comprobaciones de seguridad sobre los cambios realizados y adem?s se
encarga de reconstruir la base de datos de contrase?as cuando se termina
la edici?n. Por ejemplo, si quisi?ramos prohibir el acceso al usuario
``         bill`` a la m?quina ``basie`` har?amos:

.. code:: screen

    basie# vipw
    [a?adimos -bill al final y salimos]
    vipw: rebuilding the database...
    vipw: done

    basie# cat /etc/master.passwd

    root:[password]:0:0::0:0:The super-user:/root:/bin/csh
    toor:[password]:0:0::0:0:The other super-user:/root:/bin/sh
    daemon:*:1:1::0:0:Owner of many system processes:/root:/sbin/nologin
    operator:*:2:5::0:0:System &:/:/sbin/nologin
    bin:*:3:7::0:0:Binaries Commands and Source,,,:/:/sbin/nologin
    tty:*:4:65533::0:0:Tty Sandbox:/:/sbin/nologin
    kmem:*:5:65533::0:0:KMem Sandbox:/:/sbin/nologin
    games:*:7:13::0:0:Games pseudo-user:/usr/games:/sbin/nologin
    news:*:8:8::0:0:News Subsystem:/:/sbin/nologin
    man:*:9:9::0:0:Mister Man Pages:/usr/share/man:/sbin/nologin
    bind:*:53:53::0:0:Bind Sandbox:/:/sbin/nologin
    uucp:*:66:66::0:0:UUCP pseudo-user:/var/spool/uucppublic:/usr/libexec/uucp/uucico
    xten:*:67:67::0:0:X-10 daemon:/usr/local/xten:/sbin/nologin
    pop:*:68:6::0:0:Post Office Owner:/nonexistent:/sbin/nologin
    nobody:*:65534:65534::0:0:Unprivileged user:/nonexistent:/sbin/nologin
    +:::::::::
    -bill

    basie#

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

29.9.7. Uso de Netgroups
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div>

Escrito por Udo Erdelhoff.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El m?todo descrito en la secci?n anterior funciona razonablemente bien
si las reglas especiales se definen para un conjunto peque?o de usuarios
y/o m?quinas. En dominios admnistrativos grandes puede que se nos
*olvide* prohibir el acceso a alg?n usuario en determinadas m?quinas
perdiendo de esta forma el principal beneficio de utilizar el servicio
de p?ginas amarillas: *administraci?n centralizada*.

La soluci?n creada por los desarrolladores de NIS se denomina
*netgroups*. Su prop?sito se asemeja al concepto de grupos utilizado por
los sistemas UNIX?. La diferencia principal es la carencia de un
identificador num?rico y la habilidad para definir un “netgroup” que
incluye tanto a cuentas de usuario como a otros “netgroups”.

Los netgroups se desarrollaron para gestionar redes grandes y y
complejas con cientos de usuarios y m?quinas. Por un lado esto es una
Cosa Buena si nos encontramos en tal situaci?n pero por otro lado esta
complejidad a?adida hace que sea casi imposible de explicar a trav?s de
ejemplos sencillos. El ejemplo que va a utilizar en lo que queda de
secci?n ilustrar? este hecho.

Vamos a suponer que la exitosa introducci?n del servicio de p?ginas
amarillas en nuestro laboratorio ha llamado la atenci?n de nuestros
jefes. Nuestra siguiente tarea consiste en extender el dominio de NIS
para que cubra otras m?quinas del campus. Las tablas que se muestran a
continuaci?n contienen los nombres de los nuevos usuarios y m?quinas
junto con una breve descripci?n de ellas.

.. raw:: html

   <div class="informaltable">

+-----------------------------------------+------------------------------------------------+
| Nombre del Usuario/usuarios             | Descripci?n                                    |
+=========================================+================================================+
| ``alpha``, ``beta``                     | Empleados normales del departamento de IT      |
+-----------------------------------------+------------------------------------------------+
| ``charlie``, ``delta``                  | Los nuevos aprendices del departamento de IT   |
+-----------------------------------------+------------------------------------------------+
| ``echo``, ``foxtrott``, ``golf``, ...   | Empleados normales                             |
+-----------------------------------------+------------------------------------------------+
| ``able``, ``baker``, ...                | Los actuales internos                          |
+-----------------------------------------+------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+----------------------------------------------------------------------------+----------------------------------------------------------------------------------------------------------+
| Nombre de la M?quina(s)                                                    | Descripci?n                                                                                              |
+============================================================================+==========================================================================================================+
| ``guerra``, ``muerte``, ``hambre``, ``peste``                              | Los servidores m?s importantes. S?lo los empleados de IT pueden entrar en estas m?quinas                 |
+----------------------------------------------------------------------------+----------------------------------------------------------------------------------------------------------+
| ``orgullo``, ``avaricia``, ``envidia``, ``ira``, ``lujuria``, ``pereza``   | Servidores de menor importancia. Todos los miembros del departamento de IT pueden entrar en ellos.       |
+----------------------------------------------------------------------------+----------------------------------------------------------------------------------------------------------+
| ``uno``, ``dos``, ``tres``, ``cuatro``, ...                                | Estaciones de trabajo ordinarias. S?lo los empleados *actuales* pueden utilizar estas m?quinas.          |
+----------------------------------------------------------------------------+----------------------------------------------------------------------------------------------------------+
| ``trashcan``                                                               | Una m?quina muy vieja sin ning?n dato dato cr?tico. Incluso los internos pueden utilizar esta m?quina.   |
+----------------------------------------------------------------------------+----------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

Si se trata de implementar estas restricciones a nivel de usuario
particular tendr?amos que a?adir una l?nea ``-usuario`` a cada fichero
``passwd`` del sistema para cada usuario que tuviera prohibido el acceso
a dicho sistema. Si nos olvidamos de una sola entrada podr?mos tener
serios problemas. Puede ser factible realizar esta configuraci?n cuando
se instala el servicio pero no obstante el riesgo que corremos al
mantener este sistema de restricciones en el d?a d?a es muy alto.
Despu?s de todo Murphy era un optimista.

La gesti?n de esta situaci?n mediante netgroups ofrece varias ventajas.
Cada usuario no tiene que tratarse de una forma individualizada; basta
con a?adir un usuario a uno o m?s netgroups y posteriormente permitir o
prohibir el acceso para todos los usuarios del netgroup. Si se a?ade una
nueva m?quina al servicio de NIS simplemente tendremos que definir
restricciones de acceso para los netgroups definidos en la red. Si se
a?ade un nuevo usuario bastar? con a?adir dicho usuario a un netgroup
existente. Estos cambios son independientes unos de otros: se acab? la
necesidad de aplicar la frase “por cada combinaci?n de usuario y m?quina
haga esto y esto”. Si hemos planificado nuestro servicio de NIS
cuidadosamente, s?lo tendremos que modificar un fichero de configuraci?n
en un determinado servidor para permitir o denegar estos accesos.

El primer paso consiste en la inicializaci?n de la asociaci?n o mapeo
del netgroup. La orden de FreeBSD
`ypinit(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ypinit&sektion=8>`__
no crea este mapeo por defecto pero una vez creado ser? tenido en cuenta
por la implementaci?n de NIS. Para crear una asociaci?n vac?a
simplemente escriba:

.. code:: screen

    ellington# vi /var/yp/netgroup

y comienze a a?adir contenido. En nuestro ejemplo necesitamos al menos
cuatro netgroups: empleados de IT, aprendices de IT, empleados normales
e internos.

.. code:: programlisting

    IT_EMP  (,alpha,test-domain)    (,beta,test-domain)
    IT_APP  (,charlie,test-domain)  (,delta,test-domain)
    USERS   (,echo,test-domain)     (,foxtrott,test-domain) \
            (,golf,test-domain)
    INTERNS (,able,test-domain)     (,baker,test-domain)

``IT_EMP``, ``IT_APP`` etc. son los nombres de los netgroups. Cada
conjunto delimitado por par?ntesis define una o m?s cuentas como
pertenecientes al netgroup. Existen tres campos definidos dentro de
dichos de dichos grupos:

.. raw:: html

   <div class="orderedlist">

#. El nombre de las m?quinas donde los siguientes items son aplicables.
   Si no se especifica un nombre de m?quina la entrada se aplica a todas
   las m?quinas existentes. Si se especifica una m?quina determinada
   entraremos en un mundo lleno de horrores y confusiones as? que mejor
   no hacerlo.

#. El nombre de la cuenta que pertenece al netgroup que estamos
   definiendo.

#. El dominio NIS donde reside la cuenta. Se pueden importar cuentas de
   otros dominios NIS (en caso de que usted pertenezca al extra?o grupo
   de personas que gestionan m?s de un dominio NIS.

.. raw:: html

   </div>

Cada uno de estos campos puede contener comodines. Consulte
`netgroup(5) <http://www.FreeBSD.org/cgi/man.cgi?query=netgroup&sektion=5>`__
para obtener m?s detalles.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

No se deben utilizar nombres de los netgroups superiores a ocho
caracteres, especialmente si las m?quinas de nuestro dominio utilizan
sistemas operativos variados. Los nombres son sensibles a las
may?sculas/min?sculas: se recomienda utilizar nombres en may?sculas para
distinguirlos de los usuarios o m?quinas.

Algunos clientes de NIS (distintos de los clientes FreeBSD) no pueden
gestionar netgroups con un gran n?mero de entradas. Por ejemplo algunas
versiones antiguas de SunOS™ comienzan a presentar problemas si un
netgroup contiene m?s de *quince entradas*. Se puede solventar este
problema creando varios sub-netgroups de como mucho quince usuarios y
finalmente creando el verdadero netgroup compuesto por los
sub-netgroups:

.. code:: programlisting

    BIGGRP1  (,joe1,domain)  (,joe2,domain)  (,joe3,domain) [...]
    BIGGRP2  (,joe16,domain)  (,joe17,domain) [...]
    BIGGRP3  (,joe31,domain)  (,joe32,domain)
    BIGGROUP  BIGGRP1 BIGGRP2 BIGGRP3

Se puede repetir este proceso si se tienen que definir m?s de 225
usuarios dentro de un ?nico netgroup.

.. raw:: html

   </div>

La activaci?n y distribuci?n de nuestro nuevo mapeo NIS resulta
sencillo:

.. code:: screen

    ellington# cd /var/yp
    ellington# make

Esto genera las tres asociaciones NIS ``netgroup``, ``netgroup.byhost``
y ``netgroup.byuser``. Utilice
`ypcat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ypcat&sektion=1>`__
para comprobar si el nuevo mapeo NIS se encuentra disponible:

.. code:: screen

    ellington% ypcat -k netgroup
    ellington% ypcat -k netgroup.byhost
    ellington% ypcat -k netgroup.byuser

La salida de la primera orden deber?a parecerse a los contenidos del
fichero ``/var/yp/netgroup``. La segunda orden no mostrar? ninguna
salida salvo que se hayan especificado netgroups espec?ficos para
m?quinas. La tercera orden se puede utilizar para obtener la lista de
los netgroups a los que petenece un determinado usuario.

La configuraci?n del cliente es bastante simple. Para configurar el
servidor ``guerra`` se debe ejecutar
`vipw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=vipw&sektion=8>`__ y
sustitu?r la l?nea

.. code:: programlisting

    +:::::::::

por

.. code:: programlisting

    +@IT_EMP:::::::::

Ahora s?lo se importan los datos para los usuarios que se encuentren
definidos en el netgroup ``IT_EMP``; dichos datos se importan en la base
de datos de contrase?as de ``guerra`` y s?lo se permite el acceso a
estos usuarios.

Por desgraciaesta informaci?n tambi?n se aplica a la funci?n ``~`` del
shell y a todas las rutinas que traducen nombres de usuarios con los
correspondientes identificadores n?mericos de usuario (uid). En otras
palabras, la orden ``cd           ~`` no va a funcionar,
``ls           -l`` muestra el identificador num?rico en lugar del
nombre de usuario y ``find . -user joe           -print`` produce un
error de No such user (“Usuario desconocido”). Para solucionar esto
debemos importar todas las entradas de usuario en la m?quina cliente NIS
pero sin permitirles el acceso.

Esto se puede realizar a?adiendo otra l?nea al fichero
``/etc/master.passwd``. Esta l?nea deber?a contener lo siguiente:

``+:::::::::/sbin/nologin``, lo que significa que se “importen todas las
entradas pero que se reemplace el shell por ``/sbin/nologin``”. Se puede
sustituir cualquier campo de la entrada de contrase?as especificando un
valor concreto para dicho campo en el fichero local local
``/etc/master.passwd``.

.. raw:: html

   <div class="warning" xmlns="">

Aviso:
~~~~~~

Aseg?rese de que la l?nea ``+:::::::::/sbin/nologin`` se sit?a despu?s
de ``+@IT_EMP:::::::::``. Si esto no se cumple todas las cuentas de
usuario importadas del servidor NIS poseer?n ``/sbin/nologin`` como
shell de acceso.

.. raw:: html

   </div>

Despu?s de este cambio si se introduce un nuevo empleado en el
departamento de IT basta con cambiar una asociaci?n de NIS. Se podr?a
aplicar una aproximaci?n similar para los servidores menos importantes
sustituyendo la cadena ``+:::::::::`` en las versiones locales del
fichero ``/etc/master.passwd`` por algo parecido a esto:

.. code:: programlisting

    +@IT_EMP:::::::::
    +@IT_APP:::::::::
    +:::::::::/sbin/nologin

Las l?neas correspondientes para las estaciones de trabajo normales
podr?an ser:

.. code:: programlisting

    +@IT_EMP:::::::::
    +@USERS:::::::::
    +:::::::::/sbin/nologin

Y parece que todos nuestros problemas de gesti?n han desaparecido; hasta
que unas semanas m?s tarde se produce un cambio en la pol?tica de
gesti?n: el depatamento de IT comienza a alquilar interinos. Los
interinos de IT pueden utilizar las estaciones de trabajo normales y los
servidores menos importantes y los aprendices de IT pueden acceder a los
servidores principales. No nos queda m?s remedio que a?adir un nuevo
netgroup denominado ``IT_INTERN`` y a?adir los nuevos interinos de IT a
este nuevo grupo y comenzar a cambiar la la configuraci?n de cada
m?quina, una por una... Como dice el antiguo proverbio: “Errores en la
planificaci?n centralizada conllevan grandes quebraderos de de cabeza
globales”.

La habilidad que posee NIS para crear netgroups a partir de otros
netgroups se puede utilizar para evitar la situaci?n anterior. Una
posibilidad consiste en la creaci?n de netgroups basados en roles. Por
ejemplo, se podr?a crear un netgroup denominado ``BIGSRV`` para definir
las restricciones de acceso para los servidores importantes, otro grupo
denominado ``USERBOX`` para las estaciones de trabajo... Cada uno de
estos netgroups podr?a contener los netgroups que pueden acceder a
dichas m?quinas. Las nuevas entradas para nuestro mapeo NIS de netgroups
ser?a algo as?:

.. code:: programlisting

    BIGSRV    IT_EMP  IT_APP
    SMALLSRV  IT_EMP  IT_APP  ITINTERN
    USERBOX   IT_EMP  ITINTERN USERS

Este m?todo de definir restricciones de acceso funciona razonablemente
bien si podemos definir grupos de m?quinas que posean restricciones
semejantes. Por desgracia lo normal es que este caso resulta ser una
excepci?n m?s que una regla. En la mayor parte de las ocasiones
necesitaremos definir restricciones de acceso en funci?n de m?quinas
individuales.

Las definiciones de netgroups espec?ficos para determinadas m?quinas
constituyen el segundo m?todo que se puede utilizar para gestionar el
cambio de pol?tica del ejemplo que estamos explicando. En nuestro caso
el fichero ``/etc/master.passwd`` de cada m?quina contiene dos l?neas
que comienzan por “+”. La primera de ellas a?ade un netgroup con las
cuentas que pueden acceder a esa m?quina, mientras que la segunda a?ade
el resto de cuentas con shell el resto de cuentas con shell
``/sbin/nologin``. Es una buena idea utilizar la versi?n “todo en
may?sculas” del nombre de m?quina como el nombre del netgroup. En otras
palabras, las l?neas deber?an ser como la siguiente:

.. code:: programlisting

    +@BOXNAME:::::::::
    +:::::::::/sbin/nologin

Una vez que hemos completado esta tarea para todas las m?quinas nunca
m?s resultar? necesario modificar las versiones locales de
``/etc/master.passwd``. Los futuros cambios se pueden gestionar
simplemente modificando el mapeo o asociaci?n de NIS. A continuaci?n se
muestra un mapeo de netgroups para el escenario que se est? explicando
junto con algunas buenas ideas:

.. code:: programlisting

    # Definimos antes que nada los grupos de usuarios
    IT_EMP    (,alpha,test-domain)    (,beta,test-domain)
    IT_APP    (,charlie,test-domain)  (,delta,test-domain)
    DEPT1     (,echo,test-domain)     (,foxtrott,test-domain)
    DEPT2     (,golf,test-domain)     (,hotel,test-domain)
    DEPT3     (,india,test-domain)    (,juliet,test-domain)
    ITINTERN  (,kilo,test-domain)     (,lima,test-domain)
    D_INTERNS (,able,test-domain)     (,baker,test-domain)
    #
    # Ahora definimos unos pocos grupos basados en roles
    USERS     DEPT1   DEPT2     DEPT3
    BIGSRV    IT_EMP  IT_APP
    SMALLSRV  IT_EMP  IT_APP    ITINTERN
    USERBOX   IT_EMP  ITINTERN  USERS
    #
    # Y un grupo para tareas especiales
    # Permitimos a echo y golf acceso a nuestra maquina-anti-virus
    SECURITY  IT_EMP  (,echo,test-domain)  (,golf,test-domain)
    #
    # netgroups basados en maquinas
    # Nuestros servidores principales
    GUERRA   BIGSRV
    HAMBRE   BIGSRV
    # El usuario india necesita acceso a este servidor
    PESTE  BIGSRV  (,india,test-domain)
    #
    # Este es realmente importante y necesita mas restricciones de
    # acceso
    MUERTE     IT_EMP
    #
    # La maquina-anti-virus que mencionabamos mas arriba
    ONE       SECURITY
    #
    # Restringimos una maquina a un solo usuario
    TWO       (,hotel,test-domain)
    # [...otros grupos]

Si estamos utilizando algun tipo de base de datos para gestionar cuentas
de usuario debemos ser capaces de crear la primera parte del mapeo
utilizando las herramientas proporcionadas por dicho sistema de base de
datos. De este modo los nuevos usuarios tendr?n autom?ticamente derechos
de acceso sobre las m?quinas.

Una ?ltima, por precauci?n: puede no ser siempre aconsejable utilizar
netgroups basados en m?quinas. Si se est?n desplegando, por ejemplo, un
par de docenas o incluso cientos de m?quinas id?nticas en laboratorios
de estudiantes, es mejor utilizar netgroups basados en roles en lugar de
netgroups basados en m?quinas individuales para mantener el tama?o de la
asociaci?n NIS dentro de unos l?mites razonables.

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

29.9.8. Conceptos importantes a tener muy en cuenta
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Todav?a quedan un par de cosas que tendremos que hacer de forma distinta
a lo comentado hasta ahora en caso de encontrarnos dentro de un entorno
de NIS.

.. raw:: html

   <div class="itemizedlist">

-  Cada vez que deseemos a?adir un usuario a nuestro laboratorio debemos
   a?adirlo al servidor NIS maestro *?nicamente* y es tarea fundamental
   del administrador *acordarse de reconstruir los mapeos NIS*. Si nos
   olvidamos de esto el nuevo usuario ser? incapaz de acceder a ninguna
   m?quina excepto al servidor NIS. Por ejemplo, si necesit?ramos a?adir
   el nuevo usuario ``jsmith`` al laboratorio tendr?amos que ejecutar lo
   siguiente:

   .. code:: screen

       # pw useradd jsmith
       # cd /var/yp
       # make test-domain

   Se puede ejecutar tambi?n ``adduser               jsmith`` en lugar
   de ``pw useradd jsmith``.

-  *No introduzca las cuentas de administraci?n dentro de los mapeos de
   NIS*. No es buena idea propagar cuentas y contrase?as de
   administraci?n a m?quinas donde residen usuarios que normalmente no
   deber?an poder acceder a dichas cuentas.

-  *Mantenga el servidor maestro y esclavo de NIS seguros y minimize el
   tiempo de interrupci?n del servicio*. Si alguien fuera capaz de
   comprometer la integridad de estas m?quinas o de apagarlas los
   usuarios del dominio no podr?an acceder a sus cuentas en ning?n
   sistema.

   Esto es la debilidad principal de cualquier sistema de administraci?n
   centralizada. Si no se protegen los servidores NIS tendremos frente a
   nosotros a una horda de usuarios bastante enfadados.

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

29.9.9. Compatibilidad con NIS v1
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El servicio ypserv de FreeBSD puede servir tambi?n a clientes NIS v1. La
implementaci?n de NIS de FreeBSD s?lo utiliza el protocolo NIS v2 aunque
otras implementaciones incluyen soporte para el protocolo v1 por razones
de compatibilidad con sistemas antiguos. Los d?mones ypbind
suministrados con estos sistemas tratan de establecer una asociaci?n con
un servidor NIS versi?n 1 aunque puede que nunca la lleguen a utilizar
(y pueden continuar realizando b?squedas mediante broadcast incluso
cuando reciben una respuesta de un servidor versi?n 2). Tenga muy
presente que mientras se soportan las llamadas normales de clientes v1,
la versi?n de ypserv actualmente suministrada no gestiona peticiones de
transferencia de mapeos a trav?s de la versi?n 1; en consecuencia no se
puede utilizar como maestro o esclavo junto con servidores de NIS
antiguos que s?lo soporten el protocolo v1. Por suerte quedan muy pocos
servidores de este estilo en funcionamiento hoy en d?a.

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

29.9.10. Servidores NIS que act?an tambi?n como clientes NIS
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Se debe tener cuidado cuando se ejecuta ypserv en un entorno
multi-servidor donde las m?quinas servidoras act?an tambi?n como
m?quinas clientes de NIS. Normalmente es una buena idea obligar a los
servidores a que se asocien con ellos mismos mejor que permitirles
emitir peticiones de asociaci?n en broadcast, lo que posiblemente
terminar? con los servidores asociados entre s?. Se pueden producir
extra?os fallos si un servidor del que dependen otros deja de funcionar.
Puede darse que los contadores de todos los clientes expiren e intenten
asociarse a otro servidor, pero el retardo puede ser considerable y los
fallos todav?a podr?n persistir debido a que los servidores se asocian
cont?nuamente los unos a los otros.

Se puede obligar a una m?quina a asociarse con un servidor en particular
ejecutando ``ypbind`` con la opci?n ``-S``. Si no se quiere ejecutar
esto manualmente cada vez que se reinice el servidor NIS se puede puede
a?adir la siguiente l?nea al fichero ``/etc/rc.conf``:

.. code:: programlisting

    nis_client_enable="YES"  # ejecuta tambien el soft cliente
    nis_client_flags="-S NIS domain,server"

Consulte
`ypbind(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ypbind&sektion=8>`__
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

29.9.11. Formatos de contrase?as
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Uno de los problemas m?s comunes que se encuentra la gente a la hora de
implantar un servicio de NIS es la compatibilidad del formato de las
contrase?as. Si nuestro servidor de NIS utiliza contrase?as cifradas
mediante DES s?lo podr? aceptar clientes que utilicen DES. Por ejemplo,
si poseemos clientes de NIS Solaris™ en nuestra red casi seguro que
necesitaremos utilizar contrase?as cifradas mediante DES.

Para comprobar qu? formato utilizan los servidores y los clientes, se
puede mirar en ``/etc/login.conf``. Si la m?quina se configura para
utilizar cifrado de contrase?as mediante DES, entonces la clase por
defecto debe poseer una entrada como la siguiente:

.. code:: programlisting

    default:\
        :passwd_format=des:\
        :copyright=/etc/COPYRIGHT:\
        [Se han omitido otras entradas]

Otros posibles valores para caracter?stica de ``passwd_format`` pueden
ser ``blf`` y ``md5`` (para utilizar los algoritmos Blowfish y MD5
respectivamente).

Se debe reconstruir la base de datos de acceso siempre que se modifique
el fichero ``/etc/login.conf`` mediante la ejecuci?n de la siguiente
orden como ``root``:

.. code:: screen

    # cap_mkdb /etc/login.conf

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

El formato de las contrase?as que ya se encuentran definidas en
``/etc/master.passwd`` no se actualizar? hasta que el usuario cambie su
contrase?a, despu?s de que se haya reconstruido la base de datos de
tipos de acceso.

.. raw:: html

   </div>

A continuaci?n para asegurarse de que las contrase?as se cifran con el
formato seleccionado tambi?n debemos comprobar que la variable
``crypt_default`` dentro del fichero ``/etc/auth.conf`` da preferencia
al formato de contrase?a elegido. Por ejemplo cuando se utilizan
contrase?as cifradas con DES la entrada debe ser:

.. code:: programlisting

    crypt_default  =   des blf md5

Si se realizan los pasos anteriores en cada una de las m?quinas clientes
y servidoras de nuestro entorno NIS podemos asegurar que todas utilizan
el mismo formato de contrase?a dentro de nuestra red. Si se presentan
problemas de validaci?n con determinados usuarios en una determinada
m?quina cliente se puede empezar a investigar sobre el asunto. Recuerde:
si se quiere desplegar un servicio de p?ginas amarillas sobre un entorno
de red heterog?neo probablemente se deba utilizar DES en todos los
sistemas puesto que DES es el m?nimo com?n denominador.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------+----------------------------------------+----------------------------------------+
| `Anterior <network-isdn.html>`__?   | `Subir <advanced-networking.html>`__   | ?\ `Siguiente <network-dhcp.html>`__   |
+-------------------------------------+----------------------------------------+----------------------------------------+
| 29.8. RDSI?                         | `Inicio <index.html>`__                | ?29.10. DHCP                           |
+-------------------------------------+----------------------------------------+----------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
