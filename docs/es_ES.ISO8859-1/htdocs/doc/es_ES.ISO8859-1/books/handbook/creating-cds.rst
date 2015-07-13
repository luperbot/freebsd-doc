===========================================
18.6. Creaci?n y uso de medios ?pticos (CD)
===========================================

.. raw:: html

   <div class="navheader">

18.6. Creaci?n y uso de medios ?pticos (CD)
`Anterior <usb-disks.html>`__?
Cap?tulo 18. Almacenamiento
?\ `Siguiente <creating-dvds.html>`__

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

18.6. Creaci?n y uso de medios ?pticos (CD)
-------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Texto de Mike Meyer.

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

18.6.1. Introducci?n
~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Los CD tienen muchas opciones que los hacen distintos de los discos
convencionales. Al principio los usuarios no pod?an escribirlos. Su
dise?o permite que leamos en ellos sin el retardo del movimiento de una
cabeza lectora de una pista a otra. Tambi?n son mucho m?s f?ciles de
transportar de un sistema a otro que muchos otros soportes de
informaci?n.

Los CD tienen pistas, pero son una secci?n de los que permiten lectura
cont?nua, no una propiedad f?sica del disco. Para crear un CD en FreeBSD
debe preparar los ficheros de datos que van a constituir las pistas del
CD y luego escribir las pistas al CD.

El sistema de ficheros ISO 9660 se dise?? para gestionar estas
diferencias. Por desgracia implementa l?mites de sistema de ficheros que
eran comunes en la ?poca en que se dise??. Por suerte tambi?n
proporciona un mecanismo de extensiones que permite que CD escritos
excediendo dichos l?mites funcionen en sistemas que no soportan esas
extensiones.

El port
`sysutils/cdrtools <http://www.freebsd.org/cgi/url.cgi?ports/sysutils/cdrtools/pkg-descr>`__
incluye
`mkisofs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mkisofs&sektion=8>`__,
un programa que le permitir? crear un fichero de datos que contenga un
sistema de ficheros ISO 9660. Incorpora opciones que soportan varias
extensiones. Se describe m?s adelante.

Qu? herramienta usar para grabar el CD depende de si su grabadora es
ATAPI o no. Las grabadoras de CD ATAPI usan el programa ``burncd``, que
forma parte del sistema base. Las grabadoras SCSI y USB usan
``cdrecord``, del port
`sysutils/cdrtools <http://www.freebsd.org/cgi/url.cgi?ports/sysutils/cdrtools/pkg-descr>`__.

``burncd`` no soporta cualquier unidad de grabaci?n. Para saber si una
unidad est? soportada consulte la siguiente lista de `unidades CD-R/RW
soportadas <http://www.freebsd.dk/ata/>`__.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Si utiliza FreeBSD?5.X, FreeBSD?4.8-RELEASE o posteriores, puede
utilizar ``cdrecord`` y otras herramientas para unidades SCSI en
hardware ATAPI con el `m?dulo ATAPI/CAM <creating-cds.html#atapicam>`__.

.. raw:: html

   </div>

Si quiere usar un interfaz gr?fico con su software de grabaci?n de CD
quiz?s le guste X-CD-Roast o K3b. Puede instalar estas herramientas como
paquetes o desde los ports
`sysutils/xcdroast <http://www.freebsd.org/cgi/url.cgi?ports/sysutils/xcdroast/pkg-descr>`__
y
`sysutils/k3b <http://www.freebsd.org/cgi/url.cgi?ports/sysutils/k3b/pkg-descr>`__,
respectivamente. X-CD-Roast y K3b requieren el `m?dulo
ATAPI/CAM <creating-cds.html#atapicam>`__ si usa hardware ATAPI.

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

18.6.2. mkisofs
~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El programa
`mkisofs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mkisofs&sektion=8>`__
(que forma parte del port
`sysutils/cdrtools <http://www.freebsd.org/cgi/url.cgi?ports/sysutils/cdrtools/pkg-descr>`__)
genera un sistema de ficheros ISO 9660 que es una imagen de un ?rbol de
directorios en el espacio de nombres del sistema de ficheros UNIX?. Esta
es la forma m?s simple de usarlo:

.. code:: screen

    # mkisofs -o ficherodeimagen.iso /ruta/del/?rbol

Este comando crear? un *``ficherodeimagen.iso``* que contenga un sistema
de ficheros ISO 9660 que es una copia del ?rbol ubicado en
*``/ruta/al/?rbol``*. En el proceso, mapear? los nombres de fichero a
nombres que se ajusten a las limitaciones del est?ndar del sistema de
ficheros ISO 9660, y excluir? ficheros que posean nombres no
caracter?sticos de sistemas de ficheros ISO.

Existe gran cantidad de opciones que permiten superar esas
restricciones. En particular, ``-R`` habilita las extensiones Rock Ridge
comunes para sistemas UNIX?, ``-J`` habilita las extensiones Joliet
usadas por sistemas Microsoft y ``-hfs`` puede usarse para crear
sistemas de ficheros utilizados por Mac?OS?.

Puede utilizar ``-U`` para deshabilitar todas las restricciones de
nombres de fichero si quiere crear un CD que se vaya a usar
exclusivamente en sistemas FreeBSD. Cuando se usa con ``-R`` produce una
imagen de sistema de ficheros que es id?ntica al ?rbol FreeBSD origen,
aunque puede violar el est?ndar ISO 9660 de m?ltiples formas.

La ?ltima opci?n de uso general es ``-b``. Se usa para configurar la
ubicaci?n de la imagen de arranque que se usar? al crear un CD
arrancable “El Torito”. Esta opci?n usa como argumento la ruta a la
imagen de arranque desde la ra?z del ?rbol de directorios que se va a
escribir en el CD. Por defecto
`mkisofs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mkisofs&sektion=8>`__
crea una imagen ISO en un modo llamado “de emulaci?n de disquete
(floppy)”, y por lo tanto espera que la imagen de arranque sea
exactamente de 1.200, 1.440 o 2880?KB de tama?o. Algunos cargadores de
arranque, como el que se usa en los discos de la distribuci?n FreeBSD,
no utilizan modo de emulaci?n: se usa la opci?n ``-no-emul-boot``. Por
tanto, si ``/tmp/miarranque`` tiene un sistema FreeBSD arrancable con la
imagen de arranque en ``/tmp/miarranque/boot/cdboot`` podr?a crear la
imagen en un sistema de ficheros ISO 9660 en ``/tmp/arrancable.iso`` de
la siguiente manera:

.. code:: screen

    # mkisofs -R -no-emul-boot -b boot/cdboot -o /tmp/arrancable.iso /tmp/miarranque

Hecho esto, si tiene ``vn`` (FreeBSD?4.X), o ``md`` (FreeBSD?5.X)
configurado en su kernel, puede montar el sistema de ficheros del
siguiente modo:

.. code:: screen

    # vnconfig -e vn0c /tmp/arrancable.iso
    # mount -t cd9660 /dev/vn0c /mnt

En FreeBSD?4.X y FreeBSD?5.X proceda del siguiente modo:

.. code:: screen

    # mdconfig -a -t vnode -f /tmp/arrancable.iso -u 0
    # mount -t cd9660 /dev/md0 /mnt

Ahora puede verificar que ``/mnt`` y ``/tmp/miarranque`` sean id?nticos.

Existen muchas otras opciones que puede usar para depurar el
comportamiento de
`mkisofs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mkisofs&sektion=8>`__,
sobre todo en lo que se refiere al esquema ISO 9660 y la creaci?n de
discos Joliet y HFS. Consulte el manual de
`mkisofs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mkisofs&sektion=8>`__.

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

18.6.3. burncd
~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Si tiene una grabadora ATAPI puede usar ``burncd`` para grabar una
imagen ISO en un CD. ``burncd`` forma parte del sistema base, y est? en
``/usr/sbin/burncd``. Su uso es muy sencillo, ya que tiene pocas
opciones:

.. code:: screen

    # burncd -f unidaddecd data ficheroimagen.iso fixate

Esto grabar? una copia de *``ficheroimagen.iso``* en *``unidadcd``*. El
dispositivo por defecto es ``/dev/acd0`` (o ``/dev/acd0c`` en
FreeBSD?4.X). Consulte
`burncd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=burncd&sektion=8>`__
para ver las opciones de configuraci?n de velocidad de escritura,
expulsi?n de CD una vez grabado, y escritura de datos de audio.

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

18.6.4. cdrecord
~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Si no dispone de una grabadora ATAPI de CD, tendr? que usar ``cdrecord``
para grabar sus CD. ``cdrecord`` no forma parte del sistema base;
inst?lelo desde el port
`sysutils/cdrtools <http://www.freebsd.org/cgi/url.cgi?ports/sysutils/cdrtools/pkg-descr>`__
o como paquete. Los cambios en el sistema base pueden hacer que las
versiones binarias del programa fallen. Tendr? que actualizar el port
cuando actualice su sistema o, si est? `siguiendo la rama
-STABLE <current-stable.html#stable>`__, actualizar el port cuando haya
una nueva versi?n disponible.

Aunque ``cdrecord`` tiene muchas opciones, el uso b?sico es incluso m?s
simple que el de ``burncd``. As? se graba una imagen ISO 9660:

.. code:: screen

    # cdrecord dev=dispositivo ficheroimagen.iso

La parte complicada de utilizar ``cdrecord`` es encontrar qu? ``dev``
usar. Utilice la bandera ``-scanbus`` para dar con la configuraci?n
apropiada. La salida ser? parecida a la siguiente:

.. code:: screen

    # cdrecord -scanbus
    Cdrecord 1.9 (i386-unknown-freebsd4.2) Copyright (C) 1995-2000 J?rg Schilling
    Using libscg version 'schily-0.1'
    scsibus0:
            0,0,0     0) 'SEAGATE ' 'ST39236LW       ' '0004' Disk
            0,1,0     1) 'SEAGATE ' 'ST39173W        ' '5958' Disk
            0,2,0     2) *
            0,3,0     3) 'iomega  ' 'jaz 1GB         ' 'J.86' Removable Disk
            0,4,0     4) 'NEC     ' 'CD-ROM DRIVE:466' '1.26' Removable CD-ROM
            0,5,0     5) *
            0,6,0     6) *
            0,7,0     7) *
    scsibus1:
            1,0,0   100) *
            1,1,0   101) *
            1,2,0   102) *
            1,3,0   103) *
            1,4,0   104) *
            1,5,0   105) 'YAMAHA  ' 'CRW4260         ' '1.0q' Removable CD-ROM
            1,6,0   106) 'ARTEC   ' 'AM12S           ' '1.06' Scanner
            1,7,0   107) *

Esta lista muestra los valores ``dev`` apropiados para los dispositivos
de la lista. Localice su grabadora de CD y utilice los tres n?meros
separados por comas como valor para ``dev``. En este caso, el
dispositivo CDW es 1,5,0 y por tanto la entrada apropiada ser?a
``dev=1,5,0``. Hay modos m?s f?ciles de especificar este valor; consulte
`cdrecord(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cdrecord&sektion=1>`__
para m?s detalles. Tambi?n es el lugar donde buscar informaci?n sobre la
escritura de pistas de audio, controlar la velocidad de escritura y
muchas m?s cosas.

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

18.6.5. Copiar CD de audio
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Puede duplicar un CD de audio extrayendo los datos de audio del CD a
ficheros y escribir estos ficheros en un CD virgen. El proceso es
ligeramente diferente en unidades ATAPI y SCSI.

.. raw:: html

   <div class="procedure">

.. raw:: html

   <div class="procedure-title">

Procedimiento 18.1. Unidades SCSI

.. raw:: html

   </div>

#. Use ``cdda2wav`` para extraer el audio.

   .. code:: screen

       % cdda2wav -v255 -D2,0 -B -Owav

#. Use ``cdrecord`` para escribir los ficheros ``.wav``.

   .. code:: screen

       % cdrecord -v dev=2,0 -dao -useinfo  *.wav

   Aseg?rese de que *``2,0``* este configurado apropiadamente, como se
   describe en la `Secci?n?18.6.4,
   “cdrecord” <creating-cds.html#cdrecord>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="procedure">

.. raw:: html

   <div class="procedure-title">

Procedimiento 18.2. Unidades ATAPI

.. raw:: html

   </div>

#. El controlador de CD ATAPI hace que cada pista sea accesible como
   ``/dev/acddtnn``, donde *``d``* es el n?mero de unidad y *``nn``* es
   el n?mero de pista expresado con dos d?gitos decimales, precedido por
   un cero si es necesario. La primera pista del primer disco es
   ``/dev/acd0t01``, la segunda es ``/dev/acd0t02``, la tercera es
   ``/dev/acd0t03`` y as? sucesivamente.

   Aseg?rese de que existen los ficheros apropiados en ``/dev``.

   .. code:: screen

       # cd /dev
       # sh MAKEDEV acd0t99

   .. raw:: html

      <div class="note" xmlns="">

   Nota:
   ~~~~~

   En FreeBSD 5.0
   `devfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=devfs&sektion=5>`__
   crear? y gestionar? autom?ticamente las entradas necesarias en
   ``/dev``, as? que no ser? necesario usar ``MAKEDEV``.

   .. raw:: html

      </div>

#. Extraer cada pista con
   `dd(1) <http://www.FreeBSD.org/cgi/man.cgi?query=dd&sektion=1>`__.
   Tambi?n deber? declarar un tama?o espec?fico de bloque al extraer los
   ficheros.

   .. code:: screen

       # dd if=/dev/acd0t01 of=pista1.cdr bs=2352
       # dd if=/dev/acd0t02 of=pista2.cdr bs=2352
       ...

#. Grabar los ficheros extra?dos a disco con ``burncd``. Debe declarar
   que son ficheros de audio y que ``burncd`` debe cerrar (“fixate”) el
   disco al terminar la grabaci?n.

   .. code:: screen

       # burncd -f /dev/acd0 audio pista1.cdr pista2.cdr ... fixate

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

18.6.6. Duplicar CDs de datos
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Puede copiar un CD de datos a un fichero de imagen que ser?
funcionalmente equivalente al fichero de imagen creado con
`mkisofs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mkisofs&sektion=8>`__,
y puede usarlo para duplicar cualquier CD de datos. El ejemplo dado aqu?
asume que su dispositivo CDROM es ``acd0``. Sustit?yalo por el
dispositivo CDROM correcto para su configuraci?n. Bajo FreeBSD?4.X, se
debe a?adir una ``c`` al final del nombre del dispositivo para indicar
la partici?n entera o, en el caso de los CDROM, el disco entero.

.. code:: screen

    # dd if=/dev/acd0 of=fichero.iso bs=2048

Hecha la imagen puede garbarla en un CD como se describi? anteriormente.

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

18.6.7. Uso de CD de datos
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Ahora que ha creado un CDROM de datos est?ndar tal vez quiera montarlo y
leer los datos que contiene. Por defecto
`mount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount&sektion=8>`__
asume que los sistemas de ficheros son de tipo ``ufs``. Si trata de
hacer algo como

.. code:: screen

    # mount /dev/cd0 /mnt

recibir? un error como este: Incorrect super block y no se montar?. Un
CDROM no es un sistema de ficheros ``UFS`` as? que los intentos de
montarlo como tal fallar?n. Tendr? que decirle a
`mount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount&sektion=8>`__
que el sistema de ficheros es de tipo ``ISO9660`` y funcionar?. Puede
hacerlo mediante la opci?n ``-t cd9660``. Por ejemplo, si quiere montar
el dispositivo CDROM ``/dev/cd0`` en ``/mnt`` ejecute:

.. code:: screen

    # mount -t cd9660 /dev/cd0 /mnt

Tenga en cuenta que el nombre de su dispositivo (``/dev/cd0`` en este
ejemplo) puede ser diferente, dependiendo de la interfaz que su CDROM
utilice. Adem?s la opci?n ``-t cd9660`` s?lo ejecuta
`mount\_cd9660(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount_cd9660&sektion=8>`__.
El ejemplo de arriba puede resumirse del siguiente modo:

.. code:: screen

    # mount_cd9660 /dev/cd0 /mnt

En general puede usar CDROM de datos de cualquier fabricante, aunque los
discos con ciertas extensiones ISO 9660 pueden mostrar un comportamiento
extra?o. Por ejemplo, los discos Joliet almacenan todos los nombres de
fichero en caracteres unicode de dos-bytes. El kernel de FreeBSD no
comprende unicode (*todav?a*) as? que los caracteres que no est?n en
ingl?s aparecen como signos de interrogaci?n. (Si utiliza FreeBSD 4.3 o
alguna versi?n posterior, el controlador CD9660 incluye unas estructuras
llamadas “ganchos”, que le permitir?n cargar una tabla de conversi?n
unicode apropiada cuando haga falta. Hay m?dulos para algunas de las
codificaciones m?s comunes en el port
`sysutils/cd9660\_unicode <http://www.freebsd.org/cgi/url.cgi?ports/sysutils/cd9660_unicode/pkg-descr>`__.)

Es posible que reciba un error Device not configured al tratar de montar
un CDROM. Generalmente esto significa que la unidad de CDROM piensa que
no hay disco en la bandeja, o que la unidad no es visible en el bus.
Puede llevar un par de segundos el que una unidad de CDROM se d? cuenta
de que ha sido alimentada, por lo tanto sea paciente.

Algunas veces un CDROM SCSI puede “perdido” debido a que no tuvo tiempo
suficiente para responder al reset del bus. Si tiene un CDROM SCSI a?ada
la siguiente opci?n a su fichero de configuraci?n del kernel y
`recompile su kernel <kernelconfig-building.html>`__.

.. code:: programlisting

    options SCSI_DELAY=15000

Esto le indica a su bus SCSI que haga una pausa de 15 segundos durante
el arranque para darle ocasi?n a su unidad de CDROM de responder al
reset del bus.

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

18.6.8. Grabar CD de datos “crudos” (Raw)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Puede guardar un fichero directamente a CD sin crear un sistema de
ficheros ISO 9660. Algunas personas hacen esto al crear respaldos. Es un
proceso m?s r?pido que grabar un CD est?ndar:

.. code:: screen

    # burncd -f /dev/acd1 -s 12 data fichero.tar.gz fixate

Para recuperar los datos guardardados de este modo en un CD, debe leer
los datos desde el nodo de dispositivo “crudo”:

.. code:: screen

    # tar xzvf /dev/acd1

No puede montar este disco como lo har?a con un CDROM normal. Estos
CDROM no pueden leerse en ning?n sistema operativo que no sea FreeBSD.
Si quiere montar el CD o compartir los datos con otro sistema operativo
debe utilizar
`mkisofs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mkisofs&sektion=8>`__
como se describi? previamente.

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

18.6.9. Uso del controlador ATAPI/CAM
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div>

Original de Marc Fonvieille.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Este controlador permite que dispositivos ATAPI (CD-ROM, CD-RW, unidades
DVD, etc) sean accesibles a trav?s del subsistema SCSI y por lo tanto
permite el uso de aplicaciones como
`sysutils/cdrdao <http://www.freebsd.org/cgi/url.cgi?ports/sysutils/cdrdao/pkg-descr>`__
o
`cdrecord(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cdrecord&sektion=1>`__.

Para usar este controlador necesitar? a?adir la siguiente l?nea al
fichero de configuraci?n de su kernel:

.. code:: programlisting

    device atapicam

Es posible que necesite tambi?n las siguientes l?neas en el fichero de
configuraci?n de su kernel:

.. code:: programlisting

    device ata
    device scbus
    device cd
    device pass

(que, por otra parte, ya deber?n estar presentes).

Recompile, instale su nuevo kernel y reinicie su m?quina. Durante el
proceso de arranque su grabadora debe ser detectada; veamos un ejemplo:

.. code:: screen

    acd0: CD-RW <MATSHITA CD-RW/DVD-ROM UJDA740> at ata1-master PIO4
    cd0 at ata1 bus 0 target 0 lun 0
    cd0: <MATSHITA CDRW/DVD UJDA740 1.00> Removable CD-ROM SCSI-0 device
    cd0: 16.000MB/s transfers
    cd0: Attempt to query device size failed: NOT READY, Medium not present - tray closed

Puede acceder a la unidad a trav?s del del nombre de dispositivo
``/dev/cd0``; por ejemplo, para montar un CDROM en ``/mnt``, tecl?e lo
siguiente:

.. code:: screen

    # mount -t cd9660 /dev/cd0 /mnt

Como ``root``, puede ejecutar el siguiente comando para obtener las
direcciones SCSI del dispositivo:

.. code:: screen

    # camcontrol devlist
    <MATSHITA CDRW/DVD UJDA740 1.00>   at scbus1 target 0 lun 0 (pass0,cd0)

Seg?n esto, ``1,0,0`` ser? la direcci?n SCSI a utilizar con
`cdrecord(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cdrecord&sektion=1>`__
y otras aplicaciones SCSI.

Para mayor informaci?n sobre sistemas ATAPI/CAM y SCSI, dir?jase a las
p?ginas de manual
`atapicam(4) <http://www.FreeBSD.org/cgi/man.cgi?query=atapicam&sektion=4>`__
y `cam(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cam&sektion=4>`__.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------------+---------------------------+-------------------------------------------------+
| `Anterior <usb-disks.html>`__?              | `Subir <disks.html>`__    | ?\ `Siguiente <creating-dvds.html>`__           |
+---------------------------------------------+---------------------------+-------------------------------------------------+
| 18.5. Dispositivos de almacenamiento USB?   | `Inicio <index.html>`__   | ?18.7. Crear y utilizar medios ?pticos (DVDs)   |
+---------------------------------------------+---------------------------+-------------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
