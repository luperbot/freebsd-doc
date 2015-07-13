=======================
15.6. Uso de las jaulas
=======================

.. raw:: html

   <div class="navheader">

15.6. Uso de las jaulas
`Anterior <jails-tuning.html>`__?
Cap?tulo 15. Jaulas
?\ `Siguiente <mac.html>`__

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

15.6. Uso de las jaulas
-----------------------

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

15.6.1. Jaulas “de servicio”
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div>

Escrito por Daniel Gerzo.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Esta secci?n est? basada en una idea que Simon L. B. Nielsen present?
por primera vez en ``http://simon.nitro.dk/service-jails.html`` y en un
art?culo con contenido adicional escrito por Ken Tom
``<locals@gmail.com>``. En esta secci?n se detalla c?mo configurar un
sistema FreeBSD que a?ade una capa adicional de seguridad mediante el
uso de
`jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8>`__.
Para su verdadero aprovechamiento se asume que el sistema en el que se
vaya a aplicar ejecuta al menos RELENG\_6\_0 y que la informaci?n que
contienen las secciones previas de este cap?tulo se ha comprendido
totalmente.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

15.6.1.1. Dise?o
^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Uno de los mayores problemas de las jaulas es la gesti?n de su proceso
de actualizaci?n. Este proceso tiene a ser un problema porque cada jaula
tiene que recompilarse ?ntegramente desde el c?digo fuente cada vez que
hay que actualizarla. Esto no es un gran problema si tenemos una sola
jaula puesto que el proceso de actualizaci?n es bastante simple, pero si
hay muchas jaulas ser? un trabajo largo y tedioso.

.. raw:: html

   <div class="warning" xmlns="">

Aviso:
~~~~~~

:?Esta configuraci?n requiere mucha experiencia con FreeBSD y el uso de
sus caracter?sticas. Si los pasos que se detallan a continuaci?n le
parecen demasiado complicados puede echar un vistazo a sistemas m?s
sencillos como
`sysutils/ezjail <http://www.freebsd.org/cgi/url.cgi?ports/sysutils/ezjail/pkg-descr>`__,
que le permitir? acceder a un m?todo de administraci?n de jaulas en
FreeBSD m?s sencillo y no es tan sofisticado como el que le proponemos a
continuaci?n.

.. raw:: html

   </div>

El origen de esta idea es resolver los problemas antes descritos
compartiendo el m?ximo posible entre distintas jaulas, de un modo seguro
(utilizando montajes using read-only
`mount\_nullfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount_nullfs&sektion=8>`__
mounts) para que la actualizaci?n sea m?s sencilla y el ubicar servicios
aislados en jaulas sea m?s interesante. Adem?s, se presenta una forma
sencilla de a?adir o borrar jaulas as? como una forma de actualizarlas.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Los ejemplos de servicios en este contexto son: un servidor HTTP,un
servidor DNS, un servidor SMTP, etc.

.. raw:: html

   </div>

Los objetivos de la configuraci?n descrita en esta secci?n son:

.. raw:: html

   <div class="itemizedlist">

-  Crear una estructura de jaulas simple y f?cil de entender. Esto
   implica *no* tener que ejecutar un “installworld” completo en todas y
   cada una de las jaulas.

-  Facilitar la creaci?n de nuevas jaulas o el borrado de jaulas
   previamente existentes.

-  Facilitar la actualizaci?n de jaulas ya existentes.

-  Hacer posible el uso de una rama de FreeBSD personalizada.

-  Ser paranoico en cuanto a seguridad, reduciendo todo lo posible la
   posibilidad de que los sistemas se vean comprometidos.

-  Ahorrar todo el espacio e inodos que sea posible.

.. raw:: html

   </div>

Como ya se ha dicho, este dise?o se basa en gran medida en el disponer
de una ?nica plantilla en modo de s?lo lectura (a la que llamaremos
nullfs) montada en cada jaula y un dispositivo en modo lectura-escritura
por cada jaula. El dispositivo puede ser otro disco f?sico adicional,
una partici?n o un dispositivo
`md(4) <http://www.FreeBSD.org/cgi/man.cgi?query=md&sektion=4>`__ basado
en un vnode. En este ejemplo utilizaremos montajes nullfs en modo
lectura-escritura.

La estructura del sistema de ficheros se detalla en la siguiente lista:

.. raw:: html

   <div class="itemizedlist">

-  Cada jaula se montar? bajo ``/home/j``.

-  ``/home/j/mroot`` ser? la plantilla para cada jaula y la partici?n de
   s?lo lectura para todas las jaulas.

-  Se crear? un directorio vac?o para cada jaula bajo el directorio
   ``/home/j``.

-  Cada jaula tendr? un directorio ``/s`` que estar? enlazado con la
   parte de lectura-escritura del sistema.

-  Cada jaula tendr? su propio sistema en modo lectura-escritura basado
   en ``/home/j/skel``.

-  Cada parte de lectura-escritura correspondiente a cada jaula se
   crear? en ``/home/js``.

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Se asume que las jaulas se instalar?n bajo la partici?n ``/home``. Por
supuesto esto no es en absoluto obligatorio, pero hay que tener en
cuenta que debe hacerse el mismo cambio en cada uno de los ejemplos que
se muestran m?s adelante.

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

15.6.1.2. Creaci?n de la plantilla
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

En esta secci?n se describen los pasos necesarios para crear la
plantilla maestra que conformar? la parte de s?lo lectura que usar?n las
jaulas.

Siempre es recomendable actualizar el sistema FreeBSD a la ?ltima rama
-RELEASE. Consulte el
`cap?tulo <../../../../doc/es_ES.ISO8859-1/books/handbook/makeworld.html>`__
correspondiente de este libro si necesita m?s informaci?n. En caso de
que la actualizaci?n no sea posible tendr? que usar “buidworld” para
poder seguir adelante. Tambi?n necesitar? el paquete
`sysutils/cpdup <http://www.freebsd.org/cgi/url.cgi?ports/sysutils/cpdup/pkg-descr>`__.
Usaremos
`portsnap(8) <http://www.FreeBSD.org/cgi/man.cgi?query=portsnap&sektion=8>`__
para descargar la Colecci?n de Ports de FreeBSD. El cap?tulo sobre
`Portsnap <../../../../doc/es_ES.ISO8859-1/books/handbook/portsnap.html>`__
es siempre una lectura muy recomendable para quienes no tengan
experiencia con su funcionamiento.

.. raw:: html

   <div class="procedure">

#. Lo primero que haremos ser? crear una estructura de directorios para
   el sistema de ficheros de s?lo lectura que contendr? los binarios de
   nuestras jaulas, luego iremos al directorio que contiene el ?rbol de
   c?digo de FreeBSD e instalaremos el sistema de ficheros de s?lo
   lectura en la plantilla de las jaulas:

   .. code:: screen

       # mkdir /home/j /home/j/mroot
       # cd /usr/src
       # make installworld DESTDIR=/home/j/mroot

#. Una vez hecho esto, prepararemos la Colecci?n de Ports de FreeBSD
   para nuestras jaulas as? como un ?rbol de c?digo FreeBSD, necesario
   para usar mergemaster:

   .. code:: screen

       # cd /home/j/mroot
       # mkdir usr/ports
       # portsnap -p /home/j/mroot/usr/ports fetch extract
       # cpdup /usr/src /home/j/mroot/usr/src

#. Crear la estructura de directorios necesaria para la parte de
   lectura-escritura del sistema:

   .. code:: screen

       # mkdir /home/j/skel /home/j/skel/home /home/j/skel/usr-X11R6 /home/j/skel/distfiles
       # mv etc /home/j/skel
       # mv usr/local /home/j/skel/usr-local
       # mv tmp /home/j/skel
       # mv var /home/j/skel
       # mv root /home/j/skel

#. Usamos mergemaster para instalar los ficheros de configuraci?n que
   falten. Despu?s nos libramos de los directorios adicionales que haya
   creado mergemaster:

   .. code:: screen

       # mergemaster -t /home/j/skel/var/tmp/temproot -D /home/j/skel -i
       # cd /home/j/skel
       # rm -R bin boot lib libexec mnt proc rescue sbin sys usr dev

#. Ahora enlazamos simb?licamente el sistema de ficheros de
   lectura-escritura con el sistema de ficheros de s?lo lectura. Por
   favor, aseg?rese de que los enlaces simb?licos se crean en las
   ubicaciones correctas: ``s/``. Si se usan directorios reales o
   directorios err?neos la instalaci?n no funcionar?.

   .. code:: screen

       # cd /home/j/mroot
       # mkdir s
       # ln -s s/etc etc
       # ln -s s/home home
       # ln -s s/root root
       # ln -s ../s/usr-local usr/local
       # ln -s ../s/usr-X11R6 usr/X11R6
       # ln -s ../../s/distfiles usr/ports/distfiles
       # ln -s s/tmp tmp
       # ln -s s/var var

#. Como ?ltimo paso, cree un ``/home/j/skel/etc/make.conf`` gen?rico con
   el siguiente contenido:

   .. code:: programlisting

       WRKDIRPREFIX?=  /s/portbuild

   El tener ``WRKDIRPREFIX`` configurado de este modo har? posible
   compilar ports de FreeBSD dentro de cada jaula. Recuerde que el el
   directorio de los ports es de s?lo lectura. La ruta personalizada por
   ``WRKDIRPREFIX`` permite ejecutar compilaciones en la parte de s?lo
   lectura de cada jaula.

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

15.6.1.3. Creaci?n de las jaulas
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Ya tenemos una plantilla de jaulas de FreeBSD completa, as? que podemos
configurar nuestras jaulas en ``/etc/rc.conf``. En este ejemplo
crearemos 3 jaulas: “NS”, “MAIL” y “WWW”.

.. raw:: html

   <div class="procedure">

#. Introduzca las siguientes lineas en el fichero ``/etc/fstab``; con
   esto cada jaula tendr? acceso a la plantilla de s?lo lectura y al
   espacio de lectura-escritura:

   .. code:: programlisting

       /home/j/mroot   /home/j/ns     nullfs  ro  0   0
       /home/j/mroot   /home/j/mail   nullfs  ro  0   0
       /home/j/mroot   /home/j/www    nullfs  ro  0   0
       /home/js/ns     /home/j/ns/s   nullfs  rw  0   0
       /home/js/mail   /home/j/mail/s nullfs  rw  0   0
       /home/js/www    /home/j/www/s  nullfs  rw  0   0

   .. raw:: html

      <div class="note" xmlns="">

   Nota:
   ~~~~~

   Las particiones que tienen un 0 en la columna “pass” no ser?n
   revisadas por
   `fsck(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck&sektion=8>`__
   durante el arranque y las que tienen un 0 en la columna “dump” no
   ser?n copiadas por
   `dump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dump&sektion=8>`__.
   No nos interesa que fsck compruebe la integridad de montajes nullfs
   ni que dump haga copias de seguridad de montajes nullfs de s?lo
   lectura de las jaulas. Por esta raz?n el ejemplo de ``fstab`` tiene
   en las dos ?ltimas columnas “0?0”.

   .. raw:: html

      </div>

#. Configure las jaulas en ``/etc/rc.conf``:

   .. code:: programlisting

       jail_enable="YES"
       jail_set_hostname_allow="NO"
       jail_list="ns mail www"
       jail_ns_hostname="ns.ejemplo.org"
       jail_ns_ip="192.168.3.17"
       jail_ns_rootdir="/usr/home/j/ns"
       jail_ns_devfs_enable="YES"
       jail_mail_hostname="mail.ejemplo.org"
       jail_mail_ip="192.168.3.18"
       jail_mail_rootdir="/usr/home/j/mail"
       jail_mail_devfs_enable="YES"
       jail_www_hostname="www.ejemplo.org"
       jail_www_ip="62.123.43.14"
       jail_www_rootdir="/usr/home/j/www"
       jail_www_devfs_enable="YES"

   .. raw:: html

      <div class="warning" xmlns="">

   Aviso:
   ~~~~~~

   :?La raz?n por la que ``jail_nombre``\ \_rootdir contiene
   ``/usr/home`` y no ``/home`` es que la ruta f?sica del
   directorio\ ``/home`` en una instalaci?n de FreeBSD por omisi?n es
   ``/usr/home``. La variable ``jail_nombre``\ \_rootdir *no* debe
   apuntar a una ruta que contenga un enlace simb?lico porque ser?a
   imposible arrancar las jaulas. Utilice la herramienta
   `realpath(1) <http://www.FreeBSD.org/cgi/man.cgi?query=realpath&sektion=1>`__
   para asegurarse del valor exacto que debe asignar a la variable. Por
   favor, consulte el aviso de seguridad FreeBSD-SA-07:01.jail para m?s
   informaci?n.

   .. raw:: html

      </div>

#. Creamos los puntos de montaje de sistemas de ficheros de s?lo lectura
   correspondientes a cada jaula:

   .. code:: screen

       # mkdir /home/j/ns /home/j/mail /home/j/www

#. Instalamos la plantilla de lectura-escritura dentro de cada jaula.
   Observe que utilizamos
   `sysutils/cpdup <http://www.freebsd.org/cgi/url.cgi?ports/sysutils/cpdup/pkg-descr>`__
   para asegurarnos de que se hace una copia exacta de cada directorio:

   .. code:: screen

       # mkdir /home/js
       # cpdup /home/j/skel /home/js/ns
       # cpdup /home/j/skel /home/js/mail
       # cpdup /home/j/skel /home/js/www

#. Llegados a este punto las jaulas est?n configuradas y listas para
   arrancar. Monte los sistemas de ficheros de cada jaula y luego
   arr?nquelas con el script ``/etc/rc.d/jail``:

   .. code:: screen

       # mount -a
       # /etc/rc.d/jail start

.. raw:: html

   </div>

Las jaulas deber?an haber arrancado. Aseg?rese de ello con
`jls(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jls&sektion=8>`__. La
salida que ver? debe parecerse a esta:

.. code:: screen

    # jls
       JID  IP Address      Hostname                      Path
         3  192.168.3.17    ns.ejemplo.org                /home/j/ns
         2  192.168.3.18    mail.ejemplo.org              /home/j/mail
         1  62.123.43.14    www.ejemplo.org               /home/j/www

En este punto deber?a ser posible entrar a cada una de las jaulas,
a?adir nuevos usuarios o configurar d?mons. La columna ``JID`` indica el
n?mero de identificaci?n de cada jaula que est? funcionando en el
sistema. Con el siguiente comando puede ejecutar tareas administrativas
en la jaula cuyo ``JID`` sea 3:

.. code:: screen

    # jexec 3 tcsh

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

15.6.1.4. Actualizaci?n
^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Llegar? el momento en el que sea necesario actualizar el sistema, bien
por seguridad o porque sea ?til para las jaulas disponer de alguna nueva
caracter?stica del sistema. El dise?o de esta configuraci?n facilita una
forma f?cil de actualizar sus jaulas. Adem?s, minimiza la p?rdida de
servicio, puesto que las jaulas deben apagarse s?lamente al final de
todo el proceso. Se ofrece tambi?n la posibilidad de volver a la versi?n
anterior en caso de que algo salga mal.

.. raw:: html

   <div class="procedure">

#. El primer paso es actualizar el servidor que aloja las jaulas de la
   forma habitual. Despu?s creamos una plantilla de s?lo lectura
   temporal en ``/home/j/mroot2``.

   .. code:: screen

       # mkdir /home/j/mroot2
       # cd /usr/src
       # make installworld DESTDIR=/home/j/mroot2
       # cd /home/j/mroot2
       # cpdup /usr/src usr/src
       # mkdir s

   La ejecuci?n de ``installworld`` crea unos cuantos directorios
   innecesarios que debemos borrar:

   .. code:: screen

       # chflags -R 0 var
       # rm -R etc var root usr/local tmp

#. Creamos de nuevo los enlaces simb?licos de lectura-escritura del
   sistema de ficheros principal:

   .. code:: screen

       # ln -s s/etc etc
       # ln -s s/root root
       # ln -s s/home home
       # ln -s ../s/usr-local usr/local
       # ln -s ../s/usr-X11R6 usr/X11R6
       # ln -s s/tmp tmp
       # ln -s s/var var

#. Ha llegado el momento de parar las jaulas:

   .. code:: screen

       # /etc/rc.d/jail stop

#. Desmontamos los sistemas de ficheros originales:

   .. code:: screen

       # umount /home/j/ns/s
       # umount /home/j/ns
       # umount /home/j/mail/s
       # umount /home/j/mail
       # umount /home/j/www/s
       # umount /home/j/www

   .. raw:: html

      <div class="note" xmlns="">

   Nota:
   ~~~~~

   Los sistemas de ficheros de lectura-escritura cuelgan del sistema de
   s?lo lectura ``/s`` y por tanto deben desmontarse antes.

   .. raw:: html

      </div>

#. Movemos el sistema de ficheros de s?lo lectura viejo y lo
   reemplazamos por el nuevo. Nos servir? de copia de seguridad y como
   archivo en caso de que haya problemas. Para darle un nombre usamos la
   fecha en la que se creado una nueva copia del sistema de ficheros de
   s?lo lectura. Movemos tambi?n la Colecci?n de Ports de FreeBSD al
   sistema de ficheros nuevo para ahorrar un poco m?s de espacio e
   inodos:

   .. code:: screen

       # cd /home/j
       # mv mroot mroot.20060601
       # mv mroot2 mroot
       # mv mroot.20060601/usr/ports mroot/usr

#. Una vez llegados a este punto la nueva plantilla de s?lo lectura est?
   lista, de manera que lo ?nico que nos queda por hacer es montar los
   sistemas de ficheros y arrancar las jaulas:

   .. code:: screen

       # mount -a
       # /etc/rc.d/jail start

.. raw:: html

   </div>

Compruebe con
`jls(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jls&sektion=8>`__ si
las jaulas han arrancado sin contratiempos. No olvide ejecutar
mergemaster en cada jaula. Tendr? que actualizar tanto los ficheros de
configuraci?n como los scripts rc.d.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------------------+---------------------------+------------------------------------------+
| `Anterior <jails-tuning.html>`__?                 | `Subir <jails.html>`__    | ?\ `Siguiente <mac.html>`__              |
+---------------------------------------------------+---------------------------+------------------------------------------+
| 15.5. Administraci?n y personalizaci?n a fondo?   | `Inicio <index.html>`__   | ?Cap?tulo 16. Mandatory Access Control   |
+---------------------------------------------------+---------------------------+------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
