================
14.7. KerberosIV
================

.. raw:: html

   <div class="navheader">

14.7. KerberosIV
`Anterior <tcpwrappers.html>`__?
Cap?tulo 14. Seguridad
?\ `Siguiente <kerberos5.html>`__

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

14.7. KerberosIV
----------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Escrito por Mark Murray.

.. raw:: html

   </div>

.. raw:: html

   <div>

Basado en un texto de Mark Dapoz.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Kerberos es un sistema/protocolo de red agregado que permite a los
usuarios identificarse a trav?s de los servicios de un servidor seguro.
Los servicios como login remoto, copia remota, copias de ficheros de un
sistema a otro y otras tantas tareas arriesgadas pasan a ser
considerablemente seguras y m?s controlables.

Las siguientes instrucciones pueden usarse como una gu?a para configurar
Kerberos tal y como se distribuye con FreeBSD. De todas maneras, debe
consultar diversas p?ginas de manual para conocer todos los detalles.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

14.7.1. Instalaci?n de KerberosIV
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Kerberos es un componente opcional de FreeBSD. La manera m?s f?cil de
instalar este software es seleccionando la distribuci?n ``krb4`` o
``krb5`` en sysinstall durante la instalaci?n inicial de FreeBSD. Desde
ah? instalar? la implementaci?n de Kerberos “eBones” (KerberosIV) o
“Heimdal” (Kerberos5). Estas implementaciones se incluyen porque a que
han sido desarrolladas fuera de EEUU y Canad?, lo que las convert?a en
accesibles para administradores de sistemas del resto del mundo durante
la ?poca restrictiva de control control de exportaciones de c?digo
criptogr?fico desde EEUU.

Tambi?n puede instalar la implementaci?n de Kerberos del MIT desde la
colecci?n de ports
(`security/krb5 <http://www.freebsd.org/cgi/url.cgi?ports/security/krb5/pkg-descr>`__).

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

14.7.2. Creaci?n de la base de datos inicial
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Esto solo debe hacerse en el servidor Kerberos. Lo primero es asegurarse
de que no tiene bases de datos de Kerberos anteriores. Entre al
directorio ``/etc/kerberosIV`` y aseg?rese de que solo est?n los
siguientes ficheros:

.. code:: screen

    # cd /etc/kerberosIV
    # ls
    README      krb.conf        krb.realms

Si existe cualquier otro fichero (como ``principal.*`` o ``master_key``)
utilice ``kdb_destroy`` para destruir la base de datos antigua de
Kerberos. Si Kerberos no est? funcionando simplemente borre los ficheros
sobrantes.

Edite ``krb.conf`` y ``krb.realms`` para definir su dominio Kerberos. En
nuestro ejemplo el dominio ser? ``EJEMPLO.COM`` y el servidor es
``grunt.ejemplo.com``. Editamos o creamos ``krb.conf``:

.. code:: screen

    # cat krb.conf
    EJEMPLO.COM
    EJEMPLO.COM grunt.ejemplo.com admin server
    CS.BERKELEY.EDU okeeffe.berkeley.edu
    ATHENA.MIT.EDU kerberos.mit.edu
    ATHENA.MIT.EDU kerberos-1.mit.edu
    ATHENA.MIT.EDU kerberos-2.mit.edu
    ATHENA.MIT.EDU kerberos-3.mit.edu
    LCS.MIT.EDU kerberos.lcs.mit.edu
    TELECOM.MIT.EDU bitsy.mit.edu
    ARC.NASA.GOV trident.arc.nasa.gov

Los dem?s dominios no deben estar forzosamente en la configuraci?n. Los
hemos incluido como ejemplo de c?mo puede hacerse que una m?quina
trabaje con m?ltiples dominios. Si quiere mantener todo simple puede
abstenerse de incluirlos.

La primera l?nea es el dominio en el que el sistema funcionar?. Las
dem?s l?neas contienen entradas dominio/equipo. El primer componente de
cada l?nea es un dominio y el segundo es un equipo de ese dominio, que
act?a como “centro de distribuci?n de llaves”. Las palabras
``admin server`` que siguen al nombre de equipo significan que ese
equipo tambi?n ofrece un servidor de base da datos administrativo. Si
quiere consultar una explicaci?n m?s completa de estos t?rminos consulte
las p?ginas de manual de de Kerberos.

Ahora a?adiremos ``grunt.ejemplo.com`` al dominio ``EJEMPLO.COM`` y
tambi?n una entrada para poner todos los equipos en el dominio
``.ejemplo.com`` Kerberos ``EJEMPLO.COM``. Puede actualizar su
``krb.realms`` del siguiente modo:

.. code:: screen

    # cat krb.realms
    grunt.ejemplo.com EJEMPLO.COM
    .ejemplo.com EJEMPLO.COM
    .berkeley.edu CS.BERKELEY.EDU
    .MIT.EDU ATHENA.MIT.EDU
    .mit.edu ATHENA.MIT.EDU

Igual que en caso previo, no tiene por qu? incluir los dem?s dominios.
Se han incluido para mostrar c?mo puede usar una m?quina en m?ltiples
dominios. Puede eliminarlos y simplificar la configuraci?n.

La primera l?nea pone al sistema *espec?fico* en el dominio nombrado. El
resto de las l?neas muestran c?mo asignar por defecto sistemas de un
subdominio a un dominio Kerberos.

Ya podemos crear la base de datos. Solo se ejecuta en el servidor
Kerberos (o centro de distribuci?n de llaves). Ejecute ``kdb_init``:

.. code:: screen

    # kdb_init
    Realm name [default  ATHENA.MIT.EDU ]: EJEMPLO.COM
    You will be prompted for the database Master Password.
    It is important that you NOT FORGET this password.

    Enter Kerberos master key: 

Ahora tendremos que guardar la llave para que los servidores en la
m?quina local puedan recogerla. Utilice ``kstash``:

.. code:: screen

    # kstash

    Enter Kerberos master key:

    Current Kerberos master key version is 1.

    Master key entered. BEWARE!

Esto guarda la contrase?a cifrada maestra en
``/etc/kerberosIV/master_key``.

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

14.7.3. Puesta en marcha del sistema
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Tendr? que a?adir a la base de datos dos entradas en concreto para
*cada* sistema que vaya a usar Kerberos: ``kpasswd`` y ``rcmd``. Se
hacen para cada sistema individualmente cada sistema, y el campo
“instance” es el nombre individual del sistema.

Estos d?mons kpasswd y rcmd permiten a otros sistemas cambiar
contrase?as de Kerberos y ejecutar ?rdenes como
`rcp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rcp&sektion=1>`__,
`rlogin(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rlogin&sektion=1>`__
y `rsh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rsh&sektion=1>`__.

Ahora vamos a a?adir estas entradas:

.. code:: screen

    # kdb_edit
    Opening database...

    Enter Kerberos master key:

    Current Kerberos master key version is 1.

    Master key entered.  BEWARE!
    Previous or default values are in [brackets] ,
    enter return to leave the same, or new value.

    Principal name: passwd
    Instance: grunt

    <Not found>, Create [y] ? y

    Principal: passwd, Instance: grunt, kdc_key_ver: 1
    New Password:                    <---- tecleo aleatorio
    Verifying password

    New Password: <---- tecleo aleatorio

    Random password [y] ? y

    Principal's new key version = 1
    Expiration date (enter yyyy-mm-dd) [ 2000-01-01 ] ?
    Max ticket lifetime (*5 minutes) [ 255 ] ?
    Attributes [ 0 ] ?
    Edit O.K.
    Principal name: rcmd
    Instance: grunt

    <Not found>, Create [y] ?

    Principal: rcmd, Instance: grunt, kdc_key_ver: 1
    New Password:       <---- tecleo aleatorio
    Verifying password

    New Password:           <---- tecleo aleatorio

    Random password [y] ?

    Principal's new key version = 1
    Expiration date (enter yyyy-mm-dd) [ 2000-01-01 ] ?
    Max ticket lifetime (*5 minutes) [ 255 ] ?
    Attributes [ 0 ] ?
    Edit O.K.
    Principal name:         <---- si introduce datos nulos saldr? del programa

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

14.7.4. Creaci?n del fichero del servidor
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Ahora tendremos que extraer todas las instancias que definen los
servicios en cada m?quina; para ello usaremos ``ext_srvtab``. Esto
crear? un fichero que debe ser copiado o movido *por medios seguros* al
directorio ``/etc/kerberosIV`` de cada cliente Kerberos. Este fichero
debe existir en todos los servidores y clientes dada su importancia
clave para el funcionamiento de Kerberos.

.. code:: screen

    # ext_srvtab grunt
    Enter Kerberos master key:

    Current Kerberos master key version is 1.

    Master key entered. BEWARE!
    Generating 'grunt-new-srvtab'....

Esta orden solo genera un fichero temporal al que tendr? que cambiar el
nombre a ``srvtab`` para que todos los servidores puedan recogerlo.
Utilice
`mv(1) <http://www.FreeBSD.org/cgi/man.cgi?query=mv&sektion=1>`__ para
moverlo al lugar correcto en el sistema original:

.. code:: screen

    # mv grunt-new-srvtab srvtab

Si el fichero es para un sistema cliente y la red no puede considerarse
segura copie el ``cliente-new-srvtab`` en un medio extra?ble y
transp?rtelo por medios f?sicos seguros. Aseg?rese de cambiar su nombre
a ``srvtab`` en el directorio ``/etc/kerberosIV`` del cliente, y
aseg?rese tambi?n de que tiene modo 600:

.. code:: screen

    # mv grumble-new-srvtab srvtab
    # chmod 600 srvtab

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

14.7.5. A?adir entradas a la base de datos
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Ahora tenemos que a?adir entradas de usuarios a la base de datos.
Primero vamos a crear una entrada para el usuario ``jane``. Para ello
usaremos ``kdb_edit``:

.. code:: screen

    # kdb_edit
    Opening database...

    Enter Kerberos master key:

    Current Kerberos master key version is 1.

    Master key entered.  BEWARE!
    Previous or default values are in [brackets] ,
    enter return to leave the same, or new value.

    Principal name: jane
    Instance:

    <Not found>, Create [y] ? y

    Principal: jane, Instance: , kdc_key_ver: 1
    New Password:                <---- introduzca una constrase?a segura
    Verifying password

    New Password:                <---- introduzca de nuevo la contrase?a
    Principal's new key version = 1
    Expiration date (enter yyyy-mm-dd) [ 2000-01-01 ] ?
    Max ticket lifetime (*5 minutes) [ 255 ] ?
    Attributes [ 0 ] ?
    Edit O.K.
    Principal name:        <---- si introduce datos nulos saldr? del programa

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

14.7.6. Prueba del sistema
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Primero tenemos que iniciar los d?mons de Kerberos. Tenga en cuenta que
si su ``/etc/rc.conf`` est? configurado correctamente el inicio tendr?
ligar cuando reinicie el sistema. Esta prueba solo es necesaria en el
servidor Kerberos; los clientes Kerberos tomar?n lo que necesiten
autom?ticamente desde el directorio ``/etc/kerberosIV``.

.. code:: screen

    # kerberos &
    Kerberos server starting
    Sleep forever on error
    Log file is /var/log/kerberos.log
    Current Kerberos master key version is 1.

    Master key entered. BEWARE!

    Current Kerberos master key version is 1
    Local realm: EJEMPLO.COM
    # kadmind -n &
    KADM Server KADM0.0A initializing
    Please do not use 'kill -9' to kill this job, use a
    regular kill instead

    Current Kerberos master key version is 1.

    Master key entered.  BEWARE!

Ahora podemos probar a usar ``kinit`` para obtener un ticket para el ID
``jane`` que creamos antes:

.. code:: screen

    % kinit jane
    MIT Project Athena (grunt.ejemplo.com)
    Kerberos Initialization for "jane"
    Password: 

Pruebe a listar los tokens con ``klist`` para ver si realmente est?n:

.. code:: screen

    % klist
    Ticket file:    /tmp/tkt245
    Principal:      jane@EJEMPLO.COM

      Issued           Expires          Principal
    Apr 30 11:23:22  Apr 30 19:23:22  krbtgt.EJEMPLO.COM@EJEMPLO.COM

Ahora trate de cambiar la contrase?a usando
`passwd(1) <http://www.FreeBSD.org/cgi/man.cgi?query=passwd&sektion=1>`__
para comprobar si el d?mon kpasswd est? autorizado a acceder a la base
de datos Kerberos:

.. code:: screen

    % passwd
    realm EJEMPLO.COM
    Old password for jane:
    New Password for jane:
    Verifying password
    New Password for jane:
    Password changed.

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

14.7.7. A?adir privilegios de ``su``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Kerberos nos permite dar a *cada* usuario que necesite privilegios de
``root`` su *propia* contrase?a para
`su(1) <http://www.FreeBSD.org/cgi/man.cgi?query=su&sektion=1>`__.
Podemos agregar un ID que est? autorizado a ejecutar
`su(1) <http://www.FreeBSD.org/cgi/man.cgi?query=su&sektion=1>`__
``root``. Esto se controla con una instancia de ``root`` asociada con un
usuario. Vamos a crear una entrada ``jane.root`` en la base de datos,
para lo que recurrimos a ``kdb_edit``:

.. code:: screen

    # kdb_edit
    Opening database...

    Enter Kerberos master key:

    Current Kerberos master key version is 1.

    Master key entered.  BEWARE!
    Previous or default values are in [brackets] ,
    enter return to leave the same, or new value.

    Principal name: jane
    Instance: root

    <Not found>, Create [y] ? y

    Principal: jane, Instance: root, kdc_key_ver: 1
    New Password:                    <---- introduzca una contrase?a SEGURA
    Verifying password

    New Password:            <---- introduzca otra vez la constrase?a

    Principal's new key version = 1
    Expiration date (enter yyyy-mm-dd) [ 2000-01-01 ] ?
    Max ticket lifetime (*5 minutes) [ 255 ] ? 12 <--- Keep this short!
    Attributes [ 0 ] ?
    Edit O.K.
    Principal name:              <---- si introduce datos nulos saldr? del programa

Ahora trate de obtener los tokens para comprobar que todo funciona:

.. code:: screen

    # kinit jane.root
    MIT Project Athena (grunt.ejemplo.com)
    Kerberos Initialization for "jane.root"
    Password:

Hemos de agregar al usuario al ``.klogin`` de ``root``:

.. code:: screen

    # cat /root/.klogin
    jane.root@EJEMPLO.COM

Ahora trate de hacer
`su(1) <http://www.FreeBSD.org/cgi/man.cgi?query=su&sektion=1>`__:

.. code:: screen

    % su
    Password:

y eche un vistazo a qu? tokens tenemos:

.. code:: screen

    # klist
    Ticket file:    /tmp/tkt_root_245
    Principal:      jane.root@EJEMPLO.COM

      Issued           Expires          Principal
    May  2 20:43:12  May  3 04:43:12  krbtgt.EJEMPLO.COM@EJEMPLO.COM

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

14.7.8. Uso de otras ?rdenes
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

En un ejemplo anterior creamos un usuario llamado ``jane`` con una
instancia ``root``. Nos basamos en un usuario con el mismo nombre del
“principal” (``jane``), el procedimiento por defecto en Kerberos:
``<principal>.<instancia>`` con la estructura
``<nombre de usuario>.``\ ``root`` permitir? que ``<nombre de usuario>``
haga `su(1) <http://www.FreeBSD.org/cgi/man.cgi?query=su&sektion=1>`__ a
``root`` si existen las entradas necesarias en el ``.klogin`` que hay en
el directorio home de ``root``:

.. code:: screen

    # cat /root/.klogin
    jane.root@EJEMPLO.COM

De la misma manera, si un usuario tiene en su directorio home lo
siguiente:

.. code:: screen

    % cat ~/.klogin
    jane@EJEMPLO.COM
    jack@EJEMPLO.COM

significa que cualquier usuario del dominio ``EJEMPLO.COM`` que se
identifique como ``jane`` o como ``jack`` (v?a ``kinit``, ver m?s
arriba) podr? acceder a la cuenta de ``jane`` o a los ficheros de este
sistema (``grunt``) v?a
`rlogin(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rlogin&sektion=1>`__,
`rsh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rsh&sektion=1>`__ o
`rcp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rcp&sektion=1>`__.

Veamos por ejemplo c?mo ``jane`` se se identifica en otro sistema
mediante Kerberos:

.. code:: screen

    % kinit
    MIT Project Athena (grunt.ejemplo.com)
    Password:
    % rlogin grunt
    Last login: Mon May  1 21:14:47 from grumble
    Copyright (c) 1980, 1983, 1986, 1988, 1990, 1991, 1993, 1994
            The Regents of the University of California.   All rights reserved.

    FreeBSD BUILT-19950429 (GR386) #0: Sat Apr 29 17:50:09 SAT 1995

Aqu? ``jack`` se identifica con la cuenta de ``jane`` en la misma
m?quina (``jane`` tiene configurado su fichero ``.klogin`` como se ha
mostrado antes, y la persona encargada de la administraci?n de Kerberos
ha configurado un usuario principal *jack* con una instancia nula):

.. code:: screen

    % kinit
    % rlogin grunt -l jane
    MIT Project Athena (grunt.ejemplo.com)
    Password:
    Last login: Mon May  1 21:16:55 from grumble
    Copyright (c) 1980, 1983, 1986, 1988, 1990, 1991, 1993, 1994
            The Regents of the University of California.   All rights reserved.
    FreeBSD BUILT-19950429 (GR386) #0: Sat Apr 29 17:50:09 SAT 1995

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------+-----------------------------+-------------------------------------+
| `Anterior <tcpwrappers.html>`__?   | `Subir <security.html>`__   | ?\ `Siguiente <kerberos5.html>`__   |
+------------------------------------+-----------------------------+-------------------------------------+
| 14.6. TCP Wrappers?                | `Inicio <index.html>`__     | ?14.8. Kerberos5                    |
+------------------------------------+-----------------------------+-------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
