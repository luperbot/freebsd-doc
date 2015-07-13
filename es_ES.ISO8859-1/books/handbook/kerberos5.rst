===============
14.8. Kerberos5
===============

.. raw:: html

   <div class="navheader">

14.8. Kerberos5
`Anterior <kerberosIV.html>`__?
Cap?tulo 14. Seguridad
?\ `Siguiente <openssl.html>`__

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

14.8. Kerberos5
---------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Texto de Tillman Hodgson.

.. raw:: html

   </div>

.. raw:: html

   <div>

Basado en un texto de Mark Murray.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Cada versi?n de FreeBSD posterior a FreeBSD-5.1 incluye soporte
solamente para Kerberos5. Por esta raz?n Kerberos5 es la ?nica versi?n
incluida. Su configuraci?n es similar en muchos aspectos a la de
KerberosIV. La siguiente informaci?n solo ata?e a Kerberos5 en versiones
de FreeBSD-5.0 o posteriores. Los usuarios que des?en utilizar
KerberosIV pueden instalar el port
`security/krb4 <http://www.freebsd.org/cgi/url.cgi?ports/security/krb4/pkg-descr>`__.

Kerberos es un sistema/protocolo agregado para red que permite a los
usuarios validar su identidad a trav?s de los servicios de un servidor
seguro. Los servicios como login remoto, copia remota, copias de fichero
de un sistema a otro y otras tareas generalmente consideradas poco
seguras pasan a ser considerablemente seguras y m?s controlables.

Kerberos puede describirse como un sistema proxy
identificador/verificador. Tambi?n puede describirse como un sistema
confiable de autentificaci?n de terceros. Kerberos solamente ofrece una
funci?n: la validaci?n segura de usuarios a trav?s de una red. No
proporciona funciones de autorizaci?n (es decir, lo que los usuarios
tienen permitido hacer) o funciones de auditor?a (lo que esos usuarios
hicieron). Despu?s de que un servidor y un cliente han usado Kerberos
para demostrar su identidad pueden tambi?n cifrar todas sus sus
comunicaciones, asegurando de este modo su intimidad y la integridad de
sus datos durante su uso del sistema.

Es, por tanto, altamente recomendable que se use Kerberos *adem?s* de
otros m?todos de seguridad que ofrezcan servicios de autorizaci?n y
auditor?a.

Puede usar las siguientes instrucciones como una gu?a para configurar
Kerberos tal y como se distribuye en FreeBSD. De todas maneras, deber?a
consultar las p?ginas de manual adecuadas para tener toda la
informaci?n.

Vamos a mostrar una instalaci?n Kerberos, para lo cual usaremos los
siguientes espacios de nombres:

.. raw:: html

   <div class="itemizedlist">

-  El dominio DNS (“zona”) ser? ejemplo.org.

-  El dominio Kerberos (realm) ser? EJEMPLO.ORG.

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Debe utilizar nombres de dominio reales al configurar Kerberos incluso
si pretende ejecutarlo internamente. Esto le evitar? problemas de DNS y
asegura la interoperaci?n con otros dominios Kerberos.

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

14.8.1. Historia
~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Kerberos fu? creado en el Massachusetts Institute of Technology (MIT)
como una soluci?n a los problemas de seguridad de la red. El protocolo
Kerberos utiliza criptograf?a fuerte para que un cliente pueda demostrar
su identidad en un servidor (y viceversa) a trav?s de una conexi?n de
red insegura.

Kerberos es el nombre de un protocolo de autentificaci?n v?a red y un
adjetivo para describir programas que implementan el programa (Kerberos
telnet, por ejemplo, conocido tambi?n como el “telnet kerberizado”). La
versi?n actual del protocolo es la 5, descrita en RFC?1510.

Existen diversas implementaciones libres de este protocolo, cubriendo un
amplio rango de sistemas operativos. El MIT, donde Kerberos fu?
desarrollado, contin?a desarrollando su propio paquete Kerberos. Suele
usarse en los EEUU como producto criptogr?fico y como tal ha sufrido las
regulaciones de exportaci?n de los EEUU. El Kerberos del MIT existe como
un port en
(`security/krb5 <http://www.freebsd.org/cgi/url.cgi?ports/security/krb5/pkg-descr>`__).
Heimdal Kerberos es otra implementaci?n de la versi?n 5, y fu?
desarrollada de forma intencionada fuera de los EEUU para sortear las
regulaciones de exportaci?n (y por eso puede incluirse en versiones no
comerciales de UNIX?). La distribuci?n Heimdal Kerberos est? en el port
(`security/heimdal <http://www.freebsd.org/cgi/url.cgi?ports/security/heimdal/pkg-descr>`__),
y se incluye una instalaci?n m?nima en el sistema base de FreeBSD.

Para alcanzar la mayor audiencia estas instrucciones asumen el uso de la
distribuci?n Heimdal inclu?da en FreeBSD.

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

14.8.2. Configuraci?n de un KDC Heimdal
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El centro de distribuci?n de llaves (KDC, Key Distribution Center) es el
servicio centralizado de validaci?n que proporciona Kerberos: es el
sistema que emite tickets Kerberos. El KDC goza del est?tus de ser
considerado como “confiable” por las dem?s computadoras del dominio
Kerberos, y por eso tiene consideraciones de seguridad m?s elevadas.

Tenga en cuenta que, aunque la ejecuci?n del servidor Kerberos requiere
muy pocos recursos, se recomienda el uso de una m?quina dedicada a KDC
por razones de seguridad.

Para empezar a configurar un KDC aseg?rese de que su ``/etc/rc.conf``
contenga la configuraci?n adecuada para actuar como KDC (tal vez deba
ajustar algunas rutas para que cuadren con su sistema):

.. code:: programlisting

    kerberos5_server_enable="YES"
    kadmind5_server_enable="YES"
    kerberos_stash="YES"

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

``kerberos_stash`` solo existe en FreeBSD?4.X.

.. raw:: html

   </div>

A continuaci?n configuraremos el fichero de configuraci?n de Kerberos,
``/etc/krb5.conf``:

.. code:: programlisting

    [libdefaults]
        default_realm = EJEMPLO.ORG [realms]
        EXAMPLE.ORG = {
            kdc = kerberos.ejemplo.org
            admin_server = kerberos.ejemplo.org
        }
    [domain_realm]
        .ejemplo.org = EJEMPLO.ORG

Tenga en cuenta que este ``/etc/krb5.conf`` implica que su KDC tendr? el
nombre de equipo completo calificado de ``kerberos.ejemplo.org``.
Necesitar? a?adir una entrada CNAME (alias) a su fichero de zona si su
KDC tiene un nombre de equipo diferente.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

En grandes redes con un servidor DNS BIND bien configurado, el ejemplo
de arriba puede quedar del siguiente modo:

.. code:: programlisting

    [libdefaults]
          default_realm = EJEMPLO.ORG

Con las siguientes l?neas agregadas al fichero de zona ``ejemplo.org``:

.. code:: programlisting

    _kerberos._udp      IN  SRV     01 00 88 kerberos.ejemplo.org.
    _kerberos._tcp      IN  SRV     01 00 88 kerberos.ejemplo.org.
    _kpasswd._udp       IN  SRV     01 00 464 kerberos.ejemplo.org.
    _kerberos-adm._tcp  IN  SRV     01 00 749 kerberos.ejemplo.org.
    _kerberos           IN  TXT     EJEMPLO.ORG

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Para que los clientes sean capaces de encontrar los servicios Kerberos
*debe* tener ya sea un ``/etc/krb5.conf`` configurado o un
``/etc/krb5.conf`` configurado de forma m?nima *y* un servidor DNS
configurado correctamente.

.. raw:: html

   </div>

A continuaci?n crearemos la base de datos Kerberos. Esta base de datos
contiene las llaves de todos los principales cifradas con una contrase?a
maestra. No es necesario que recuerde esta contrase?a, pues se
almacenar? en ``/var/heimdal/m-key``. Para crear la llave maestra
ejecute ``kstash`` e introduzca una contrase?a.

Una vez que se ha creado la llave maestra puede inicializar la base de
datos usando el programa ``kadmin`` con la opci?n ``-l`` (que significa
“local”). Esta opci?n le dice a ``kadmin`` que modifique los ficheros de
la base de datos directamente en lugar de ir a trav?s del servicio de
red ``kadmind``. Esto gestiona el problema del huevo y la gallina de
tratar de conectar a la base de datos antes de que ?sta exista. Una vez
que tiene el “prompt” de ``kadmin``, utilice ``init`` para crear su base
de datos de dominios iniciales.

Para terminar, mientras est? todav?a en ``kadmin`` puede crear su primer
principal mediante ``add``. Utilice las opciones por defecto por ahora,
m?s tarde puede cambiarlas mediante ``modify``. Recuerde que puede usar
``?`` en cualquier “prompt” para consultar las opciones disponibles.

Veamos un ejemplo de sesi?n de creaci?n de una base de datos:

.. code:: screen

    # kstash
    Master key: xxxxxxxx
    Verifying password - Master key: xxxxxxxx

    # kadmin -l
    kadmin> init EJEMPLO.ORG
    Realm max ticket life [unlimited]:
    kadmin> add tillman
    Max ticket life [unlimited]:
    Max renewable life [unlimited]:
    Attributes []:
    Password: xxxxxxxx
    Verifying password - Password: xxxxxxxx

Ahora puede arrancar los servicios KDC. Ejecute
``/etc/rc.d/kerberos start`` y ``/etc/rc.d/kadmind start`` para levantar
dichos servicios. Recuerde que no tendr? ning?n d?mon kerberizado
ejecut?ndose pero debe poder confirmar que KDC funciona por el
procedimiento de obtener y listar un boleto del principal (usuario) que
acaba de crear en la l?nea de ?rdenes de KDC:

.. code:: screen

    % k5init tillman
    tillman@EJEMPLO.ORG's Password:

    % k5list
    Credentials cache: FILE:/tmp/krb5cc_500
        Principal: tillman@EJEMPLO.ORG

      Issued           Expires          Principal
    Aug 27 15:37:58  Aug 28 01:37:58  krbtgt/EJEMPLO.ORG@EJEMPLO.ORG

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

14.8.3. Creaci?n de un servidor Kerberos con servicios Heimdal
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Antes de nada necesitaremos una copia del fichero de configuraci?n de
Kerberos, ``/etc/krb5.conf``. C?pielo al cliente desde KDC de forma
segura (mediante
`scp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=scp&sektion=1>`__, o
usando un disquete).

A continuaci?n necesitar? un fichero ``/etc/krb5.keytab``. Esta es la
mayor diferencia entre un servidor que proporciona d?mons habilitados
con Kerberos y una estaci?n de trabajo: el servidor debe tener un
fichero ``keytab``. Dicho fichero contiene las llaves de equipo del
servidor, las cuales le permiten a ?l y al KDC verificar la identidad
entre ellos. Deben transmitirse al servidor de forma segura ya que la
seguridad del servidor puede verse comprometida si la llave se hace
p?blica. Por decirlo m?s claro, transferirla como texto plano a trav?s
de la red (por ejemplo por FTP) es una *p?sima idea*.

Lo normal es que transmita su ``keytab`` al servidor mediante el
programa ``kadmin``. Esto es pr?ctico porque tambi?n debe crear el
principal del equipo (el KDC que aparece al final de ``krb5.keytab``)
usando ``kadmin``.

Tenga en cuenta que ya debe disponer de un ticket, y que este ticket
debe poder usar el interfaz ``kadmin`` en ``kadmind.acl``. Consulte la
secci?n “administraci?n remota” en la p?gina info de Heimdal
(``info heimdal``), donde se exponen los detalles de dise?o de las
listas de control de acceso. Si no quiere habilitar acceso remoto
``kadmin``, puede conectarse de forma segura al KDC (por medio de
consola local,
`ssh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh&sektion=1>`__ o
`telnet(1) <http://www.FreeBSD.org/cgi/man.cgi?query=telnet&sektion=1>`__
Kerberos) y administrar en local mediante ``kadmin -l``.

Despu?s de instalar el fichero ``/etc/krb5.conf`` puede usar ``kadmin``
desde el servidor Kerberos. ``add --random-key`` le permitir? a?adir el
principal del equipo servidor, y ``ext`` le permitir? extraer el
principal del equipo servidor a su propio keybat. Por ejemplo:

.. code:: screen

    # kadmin
    kadmin> add --random-key host/myserver.ejemplo.org
    Max ticket life [unlimited]:
    Max renewable life [unlimited]:
    Attributes []:
    kadmin> ext host/miservidor.ejemplo.org
    kadmin> exit

Tenga en cuenta que ``ext`` (contracci?n de “extract”) almacena la llave
extra?da por defecto en en ``/etc/krb5.keytab``.

Si no tiene ``kadmind`` ejecut?ndose en KDC (posiblemente por razones de
seguridad) y por lo tanto carece de acceso remoto a ``kadmin`` puede
a?adir el principal de equipo (``host/miservidor.EJEMPLO.ORG``)
directamente en el KDC y entonces extraerlo a un fichero temporal (para
evitar sobreescribir ``/etc/krb5.keytab`` en el KDC) mediante algo
parecido a esto:

.. code:: screen

    # kadmin
    kadmin> ext --keytab=/tmp/ejemplo.keytab host/miservidor.ejemplo.org
    kadmin> exit

Puede entonces copiar de forma segura el keytab al servidor (usando
``scp`` o un diquete). Aseg?rese de usar un nombre de keytab diferente
para evitar sobreescribir el keytab en el KDC.

Su servidor puede comunicarse con el KDC (gracias a su fichero
``krb5.conf``) y puede probar su propia identidad (gracias al fichero
``krb5.keytab``). Ahora est? listo para que usted habilite algunos
servicios Kerberos. En este ejemplo habilitaremos el servicio ``telnet``
poniendo una l?nea como esta en su ``/etc/inetd.conf`` y reiniciando el
servicio
`inetd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=inetd&sektion=8>`__
con ``/etc/rc.d/inetd restart``:

.. code:: programlisting

    telnet    stream  tcp     nowait  root    /usr/libexec/telnetd  telnetd -a user

La parte cr?tica es ``-a``, de autentificaci?n de usuario. Consulte la
p?gina de manual
`telnetd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=telnetd&sektion=8>`__
para m?s informaci?n.

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

14.8.4. Kerberos con un cliente Heimdal
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Configurar una computadora cliente es extremadamente f?cil. Lo ?nico que
necesita es el fichero de configuraci?n de Kerberos que encontrar? en
``/etc/krb5.conf``. Simplemente c?pielo de forma segura a la computadora
cliente desde el KDC.

Pruebe su computadora cliente mediante ``kinit``, ``klist``, y
``kdestroy`` desde el cliente para obtener, mostrar y luego borrar un
ticket para el principal que cre? antes. Deber?a poder usar aplicaciones
Kerberos para conectarse a servidores habilitados con Kerberos, aunque
si no funciona y tiene problemas al intentar obtener el boleto lo m?s
probable es que el problema est? en el servidor y no en el cliente o el
KDC.

Al probar una aplicaci?n como ``telnet``, trate de usar un “sniffer” de
paquetes ( como
`tcpdump(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tcpdump&sektion=1>`__)
para confirmar que su contrase?a no viaja en claro por la red. Trate de
usar ``telnet`` con la opci?n ``-x``, que cifra el flujo de datos por
entero (algo parecido a lo que hace ``ssh``).

Las aplicaciones clientes Kerberos principales (llamadas
tradicionalmente ``kinit``, ``klist``, ``kdestroy`` y ``kpasswd``) est?n
incluidas en la instalaci?n base de FreeBSD. Tenga en cuenta que en las
versiones de FreeBSD anteriores a 5.0 reciben los nombres de ``k5init``,
``k5list``, ``k5destroy``, ``k5passwd`` y ``k5stash``.

Tambi?n se instalan por defecto diversas aplicaciones Kerberos que no
entran dentro de la categor?a de “imprescindibles”. Es aqu? donde la
naturaleza “m?nima” de la instalaci?n base de Heimdal salta a la
palestra: ``telnet`` es el ?nico servicio Kerberos habilitado.

El port Heimdal a?ade algunas de las aplicaciones cliente que faltan:
versiones Kerberos de ``ftp``, ``rsh``, ``rcp``, ``rlogin`` y algunos
otros programas menos comunes. El port del MIT tambi?n contiene una
suite completa de aplicaciones cliente de Kerberos.

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

14.8.5. Ficheros de configuraci?n de usuario: ``.k5login`` y ``.k5users``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Suele ser habitual que los usuarios de un dominio Kerberos (o
“principales”) tengan su usuario (por ejemplo ``tillman@EJEMPLO.ORG``)
mapeado a una cuenta de usuario local (por ejemplo un usuario llamado
llamado ``tillman``). Las aplicaciones cliente como ``telnet``
normalmente no requieren un nombre de usuario o un principal.

Es posible que de vez en cuando quiera dar acceso a una una cuenta de
usuario local a alguien que no tiene un principal Kerberos. Por ejemplo,
``tillman@EJEMPLO.ORG`` puede necesitar acceso a la cuenta de usuario
local ``webdevelopers``. Otros principales tal vez necesiten acceso a
esas cuentas locales.

Los ficheros ``.k5login`` y ``.k5users``, ubicados en el directorio home
del usuario, pueden usarse de un modo similar a una combinaci?n potente
de ``.hosts`` y ``.rhosts``. Por ejemplo, si pusiera un fichero
``.k5login`` con el siguiente contenido

.. code:: screen

    tillman@example.org
    jdoe@example.org

en el directorio home del usuario local ``webdevelopers`` ambos
principales listados tendr?an acceso a esa cuenta sin requerir una
contrase?a compartida.

Le recomendamos encarecidamente la lectura de las p?ginas de manual de
estas ?rdenes. Recuerde que la p?gina de manual de ``ksu`` abarca
``.k5users``.

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

14.8.6. Kerberos Sugerencias, trucos y soluci?n de problemas
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="itemizedlist">

-  Tanto si utiliza el port de Heimdal o el Kerberos del MIT aseg?rese
   de que su variable de entorno ``PATH`` liste las versiones de
   Kerberos de las aplicaciones cliente antes que las versiones del
   sistema.

-  ?Todas las computadoras de su dominio Kerberos tienen la hora
   sincronizada? Si no, la autentificaci?n puede fallar. `Secci?n?29.12,
   “NTP” <network-ntp.html>`__ describe como sincronizar los relojes
   utilizando NTP.

-  MIT y Heimdal conviven bien, con la excepci?n de ``kadmin``,
   protocolo no est? estandarizado.

-  Si cambia su nombre de equipo debe cambiar tambi?n el “apellido” de
   su principal y actualizar su keytab. Esto tambi?n se aplica a
   entradas especiales en keytab como el principal ``www/`` que usa el
   `www/mod\_auth\_kerb <http://www.freebsd.org/cgi/url.cgi?ports/www/mod_auth_kerb/pkg-descr>`__
   de Apache.

-  Todos los equipos en su dominio Kerberos deben poder resolverse
   (tanto en la forma normal normal como en la inversa) en el DNS (o en
   ``/etc/hosts`` como m?nimo). Los CNAME funcionar?n, pero los
   registros A y PTR deben ser correctos y estar en su sitio. El mensaje
   de error que recibir? de no hacerlo as? no es muy intuitivo:
   Kerberos5 refuses authentication because Read req failed: Key table
   entry not found.

-  Algunos sistemas operativos que puede usar como clientes de su KDC no
   activan los permisos para ``ksu`` como setuid ``root``. Esto har? que
   ``ksu`` no funcione, lo cual es muy seguro pero un tanto molesto.
   Tenga en cuenta que no se debe a un error de KDC.

-  Si desea permitir que un principal tenga un ticket con una validez
   m?s larga que el valor por defecto de diez horas en Kerberos del MIT
   debe usar ``modify_principal`` en ``kadmin`` para cambiar “maxlife”
   tanto del principal en cuesti?n como del ``krbtgt`` del principal.
   Hecho esto, el principal puede utilizar la opci?n ``-l`` con
   ``kinit`` para solicitar un boleto con m?s tiempo de vida.

-  

   .. raw:: html

      <div class="note" xmlns="">

   Nota:
   ~~~~~

   Si ejecuta un “sniffer” de paquetes en su KDC para ayudar con la
   resoluci?n de problemas y ejecuta ``kinit`` desde una estaci?n de
   trabajo puede encontrarse con que su TGT se env?a inmediatamente
   despu?s de ejecutar ``kinit``: *incluso antes de que escriba su
   contrase?a* La explicaci?n es que el servidor Kerberos transmite
   tranquilamente un TGT (Ticket Granting Ticket) a cualquier petici?n
   no autorizada; de todas maneras, cada TGT est? cifrado en una llave
   derivada de la contrase?a del usuario. Por tanto, cuando un usuario
   teclea su contrase?a no la est? enviando al KDC, se est? usando para
   descifrar el TGT que ``kinit`` ya obtuvo. Si el proceso de descifrado
   termina en un ticket v?lido con una marca de tiempo v?lida, el
   usuario tiene credenciales Kerberos v?lidas. Estas credenciales
   incluyen una llave de sesi?n para establecer comunicaciones seguras
   con el servidor Kerberos en el futuro, as? como el TGT en s?, que se
   cifra con la llave del propio servidor Kerberos. Esta segunda capa de
   cifrado es invisible para el usuario, pero es lo que permite al
   servidor Kerberos verificar la autenticidad de cada TGT.

   .. raw:: html

      </div>

-  Si desea utilizar tickets con un tiempo largo de vida (una semana,
   por ejemplo) y est? utilizando OpenSSH para conectarse a la m?quina
   donde se almacena su boleto asg?rese de que Kerberos
   ``TicketCleanup`` est? configurado a ``no`` en su ``sshd_config`` o
   de lo contrario sus tickets ser?n eliminados cuando termine la
   sesi?n.

-  Recuerde que los principales de equipos tambi?n pueden tener tener un
   tiempo de vida m?s largo. Si su principal de usuario tiene un tiempo
   de vida de una semana pero el equipo al que se conecta tiene un
   tiempo de vida de nueve horas, tendr? un principal de equipo expirado
   en su cach?, y la cach? de ticket no funcionar? como esperaba.

-  Cuando est? configurando un fichero ``krb5.dict`` pensando
   espec?ficamente en prevenir el uso de contrase?as defectuosas (la
   p?gina de manual de de ``kadmind`` trata el tema brevemente),
   recuerde que solamente se aplica a principales que tienen una
   pol?tica de contrase?as asignada. El formato de los ficheros
   ``krb5.dict`` es simple: una cadena de texto por l?nea. Puede serle
   ?til crear un enlace simb?lico a ``/usr/share/dict/words``.

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

14.8.7. Diferencias con el port del MIT
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Las diferencias m?s grandes entre las instalaciones MIT y Heimdal est?n
relacionadas con ``kadmin``, que tiene un conjunto diferente (pero
equivalente) de ?rdenes y utiliza un protocolo diferente. Esto tiene
implicaciones muy grandes si su KDC es MIT, ya que no podr? utilizar el
programa ``kadmin`` de Heimdal para administrar remotamente su KDC (o
viceversa).

Las aplicaciones cliente pueden tambi?n disponer de diferentes opciones
de l?nea de ?rdenes para lograr lo mismo. Le recomendamos seguir las
instrucciones de la p?gina web de Kerberos del MIT
(``http://web.mit.edu/Kerberos/www/``). Sea cuidadoso con los parches:
el port del MIT se instala por defecto en ``/usr/local/``, y las
aplicaciones “normales” del sistema pueden ser ejecutadas en lugar de
las del MIT si su variable de entorno ``PATH`` lista antes los
directorios del sistema.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Si usa el port del MIT
`security/krb5 <http://www.freebsd.org/cgi/url.cgi?ports/security/krb5/pkg-descr>`__
proporcionado por FreeBSD aseg?rese de leer el fichero
``/usr/local/share/doc/krb5/README.FreeBSD`` instalado por el port si
quiere entender por qu? los login v?a ``telnetd`` y ``klogind`` se
comportan de un modo un tanto extra?o. M?s importante a?n, corregir la
conducta de “permisos incorrectos en el fichero cach?” requiere que el
binario ``login.krb5`` se use para la validaci?n para que pueda cambiar
correctamente los permisos de propiedad de credenciales reenviadas.

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

14.8.8. Mitigaci?n de limitaciones encontradas en Kerberos
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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

14.8.8.1. Kerberos es un enfoque “todo o nada”
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Cada servicio habilitado en la red debe modificarse para funcionar con
Kerberos (o debe ser asegurado contra ataques de red) o de lo contrario
las credenciales de usuario pueden robarse y reutilizarse. Un ejemplo de
esto podr?a ser que Kerberos habilite todos los shells remotos ( v?a
``rsh`` y ``telnet``, por ejemplo) pero que no cubra el servidor de
correo POP3, que env?a contrase?as en texto plano.

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

14.8.8.2. Kerberos est? pensado para estaciones de trabajo monousuario
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

En un entorno multiusuario Kerberos es menos seguro. Esto se debe a que
almacena los tickets en el directorio ``/tmp``, que puede ser le?do por
todos los usuarios. Si un usuario est? compartiendo una computadora con
varias personas (esto es, si utiliza un sistema multiusuario) es posible
que los tickets sean robados (copiados) por otro usuario.

Esto puede solventarse con la opci?n de l?nea de ?rdenes ``-c``
nombre-de-fichero o (mejor a?n) la variable de entorno ``KRB5CCNAME``,
pero raramente se hace. Si almacena los tickets en el directorio home de
los usuarios y utiliza sin mucha complicaci?n los permisos de fichero
puede mitigar este problema.

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

14.8.8.3. El KDC es el punto cr?tico de fallo
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Por motivos de dise?o el KDC es tan seguro como la base de datos
principal de contrase?as que contiene. El KDC no debe ejecutar ning?n
otro servicio ejecut?ndose en ?l y debe ser f?sicamente seguro. El
peligro es grande debido a que Kerberos almacena todas las contrase?as
cifradas con la misma llave (la llave “maestra”, que a su vez se guarda
como un fichero en el KDC).

De todos modos una llave maestra comprometida no es algo tan terrible
como parece a primera vista. La llave maestra solo se usa para cifrar la
base de datos Kerberos y como semilla para el generador de n?meros
aleatorios. Mientras sea seguro el acceso a su KDC un atancante no puede
hacer demasiado con la llave maestra.

Adem?s, si el KDC no est? disponible (quiz?s debido a un ataque de
denegaci?n de servicio o problemas de red) no se podr?n utilizar los
servicios de red ya que no se puede efectuar la validaci?n, lo que hace
que esta sea una buena forma de lanzar un ataque de denegaci?n de
servicio. Este problema puede aliviarse con m?ltiples KDCs (un maestro y
uno o m?s esclavos) y con una implementaci?n cautelosa de secundarios o
autentificaci?n de respaldo (para esto PAM es excelente).

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

14.8.8.4. Limitaciones de Kerberos
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Kerberos le permite a usuarios, equipos y servicios validarse entre s?,
pero no dispone de ning?n mecanismo para autentificar el KDC a los
usuarios, equipos o servicios. Esto significa que una versi?n (por
ejemplo) “troyanizada” ``kinit`` puede grabar todos los usuarios y sus
contrase?as. Puede usar
`security/tripwire <http://www.freebsd.org/cgi/url.cgi?ports/security/tripwire/pkg-descr>`__
o alguna otra herramienta de revisi?n de integridad de sistemas de
ficheros para intentar evitar problemas como este.

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

14.8.9. Recursos y m?s informaci?n
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="itemizedlist">

-  `Las preguntas frecuentes (FAQ) de
   Kerberos <http://www.faqs.org/faqs/Kerberos-faq/general/preamble.html>`__

-  `Designing an Authentication System: a Dialog in Four
   Scenes <http://web.mit.edu/Kerberos/www/dialogue.html>`__

-  `RFC 1510, The Kerberos Network Authentication Service
   (V5) <http://www.ietf.org/rfc/rfc1510.txt?number=1510>`__

-  `P?gina web de Kerberos del MIT <http://web.mit.edu/Kerberos/www/>`__

-  `P?gina web de Kerberos Heimdal <http://www.pdc.kth.se/heimdal/>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------+-----------------------------+-----------------------------------+
| `Anterior <kerberosIV.html>`__?   | `Subir <security.html>`__   | ?\ `Siguiente <openssl.html>`__   |
+-----------------------------------+-----------------------------+-----------------------------------+
| 14.7. KerberosIV?                 | `Inicio <index.html>`__     | ?14.9. OpenSSL                    |
+-----------------------------------+-----------------------------+-----------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
