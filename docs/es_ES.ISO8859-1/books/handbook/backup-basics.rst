===========================
18.11. Bases para respaldos
===========================

.. raw:: html

   <div class="navheader">

18.11. Bases para respaldos
`Anterior <backups-floppybackups.html>`__?
Cap?tulo 18. Almacenamiento
?\ `Siguiente <disks-virtual.html>`__

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

18.11. Bases para respaldos
---------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Los tres principales programas para respaldos son
`dump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dump&sektion=8>`__,
`tar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tar&sektion=1>`__ y
`cpio(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cpio&sektion=1>`__.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

18.11.1. Dump y Restore
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Los programas UNIX? que se han usado durante muchos a?os para hacer
copias de seguridad son ``dump`` y ``restore``. Operan en las unidades
como una colecci?n de bloques de disco, bajo la abstracci?n de ficheros,
los enlaces y directorios creados por el sistema de ficheros. ``dump``
respalda un sistema de ficheros completo en un dispositivo. No es capaz
de respaldar solamente parte de un sistema de ficheros o un ?rbol de
directorios que se extienda por m?s de un sistema de ficheros. ``dump``
no escribe ficheros y directorios a cinta, escribe los bloques de datos
“crudos” (raw) que conforman los ficheros y directorios.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Si utiliza ``dump`` en su directorio ra?z, no respaldar? ``/home``,
``/usr`` ni muchos otros directorios, ya que suelen ser puntos de
montaje de otros sistemas de ficheros o enlaces simb?licos hacia dichos
sistemas de ficheros.

.. raw:: html

   </div>

``dump`` tiene peculiaridades que se mantienen desde sus primeros d?as
en la Version 6 de AT&T UNIX (alrededor de 1975). Los par?metros por
defecto son los adecuados para cintas de 9 pistas (6250 bpi), pero no
para los medios de alta densidad disponibles hoy en d?a (hasta 62,182
ftpi). Estos valores por defecto deben obviarse en la l?nea de comandos
para aprovechar la capacidad de las unidades de cinta actuales.

Tambi?n es posible respaldar datos a trav?s de la red a una unidad de
cinta conectada a otra computadora con ``rdump`` y ``rrestore``. Ambos
programas dependen de
`rcmd(3) <http://www.FreeBSD.org/cgi/man.cgi?query=rcmd&sektion=3>`__ y
`ruserok(3) <http://www.FreeBSD.org/cgi/man.cgi?query=ruserok&sektion=3>`__
para acceder a la unidad de cinta remota. Por consiguiente, el usuario
que realiza el respaldo debe estar listado en el fichero ``.rhosts`` de
la computadora remota. Los argumentos para ``rdump`` y ``rrestore``
deben ser adecuados para usarse en la computadora remota. Cuando realice
un ``rdump`` desde FreeBSD a una unidad de cinta Exabyte conectada a una
Sun llamada ``komodo``, use:

.. code:: screen

    # /sbin/rdump 0dsbfu 54000 13000 126 komodo:/dev/nsa8 /dev/da0a 2>&1

Advertencia: existen implicaciones de seguridad al permitir
autentificaci?n mediante ``.rhosts``. Le recomendamos que eval?e la
situaci?n cuidadosamente.

Tambi?n es posible usar ``dump`` y ``restore`` de una forma m?s segura a
trav?s de ``ssh``.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Ejemplo 18.1. Utilizando ``dump`` a trav?s de ssh

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    # /sbin/dump -0uan -f - /usr | gzip -2 | ssh -c blowfish \
              usuario@maquinaobjetivo.ejemplo.com dd of=/misficherosgrandes/dump-usr-l0.gz

.. raw:: html

   </div>

.. raw:: html

   </div>

Uso del m?todo integrado de ``dump``, configurando la variable de
ambiente ``RSH``:

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Ejemplo 18.2. Uso de ``dump`` a trav?s de ssh con ``RSH`` configurada

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    # RSH=/usr/bin/ssh /sbin/dump -0uan -f usuario@maquinaobjetivo.ejemplo.com:/dev/sa0 /usr

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

18.11.2. ``tar``
~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

`tar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tar&sektion=1>`__
tambi?n es de la ?poca de la Version 6 de AT&T UNIX (alrededor de 1975).
``tar`` trabaja en cooperaci?n con el sistema de ficheros; escribe
ficheros y directorios a cinta. ``tar`` no soporta el rango completo de
opciones que ofrece
`cpio(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cpio&sektion=1>`__,
pero no requiere el inusual comando de pipeline que utiliza ``cpio``.

En FreeBSD 5.3 y posteriores, tiene a su disposici?n GNU ``tar`` y el
comando por defecto ``bsdtar``. La versi?n GNU puede ser invocada
mediante ``gtar``. Soporta dispositivos remotos mediante la misma
sintaxis que ``rdump``. Para hacer un ``tar`` a una unidad de cinta
conectada a una Sun llamada ``komodo``, use:

.. code:: screen

    # /usr/bin/gtar cf komodo:/dev/nsa8 . 2>&1

Puede hacer lo mismo con o con ``bsdtar`` usando un “pipe” y ``rsh``
para mandar los datos a una unidad de cinta remota.

.. code:: screen

    # tar cf - . | rsh nombredemaquina dd of=dispositivo-de-cinta obs=20b

Si le preocupa la seguridad del proceso de hacer un respaldo a trav?s de
una red debe usar ``ssh`` en lugar de ``rsh``.

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

18.11.3. ``cpio``
~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

`cpio(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cpio&sektion=1>`__ es
el programa de intercambio de archivos de cinta para medios magn?ticos.
``cpio`` tiene opciones (entre muchas otras) para realizar intercambio
de bytes, escribir un n?mero diferente de formatos de archivo y hacer
“pipe” de datos hacia otros programas. Esta ?ltima opci?n hace de
``cpio`` una elecci?n excelente para medios de instalaci?n. ``cpio`` no
sabe c?mo recorrer el ?rbol de directorios, as? que debe facilitarle una
lista de directorios a trav?s de ``stdin``.

``cpio`` no permite respaldos a trav?s de la red. Puede usar un pipe y
``rsh`` para mandar los datos a una unidad de cinta remota.

.. code:: screen

    # for f in lista_directorios; do
    find $f << backup.list
    done
    # cpio -v -o --format=newc < backup.list | ssh usuario@m?quina "cat > dispositivo_de_respaldo"

Donde *``lista_directorios``* es la lista de directorios que desea
respaldar, *``usuario``*\ @\ *``m?quina``* es la combinaci?n
usuario/nombre de equipo que realizar? el respaldo y
*``dispositivo_de_respaldo``* es donde el respaldo se escribir?
efectivamente (por ejemplo ``/dev/nsa0``).

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

18.11.4. ``pax``
~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

`pax(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pax&sektion=1>`__ es
la respuesta IEEE/POSIX? a ``tar`` y ``cpio``. A trav?s de los a?os las
diversas versiones de ``tar`` y ``cpio`` se han vuelto ligeramente
incompatibles, as? que en lugar de pelear por hacerlo completamente
est?ndar, POSIX? cre? una nueva utilidad de archivado. ``pax`` trata de
leer y escribir muchos de los diversos formatos de ``cpio`` y ``tar``,
adem?s de nuevos formatos propios. Su conjunto de comandos se parece m?s
a ``cpio`` que a ``tar``.

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

18.11.5. Amanda
~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Amanda (Advanced Maryland Network Disk Archiver) es un sistema de
respaldos cliente/servidor, en lugar de un solo programa. Un servidor
Amanda respaldar? a una sola unidad de cinta cualquier cantidad de
computadoras que tengan clientes Amanda y una conexi?n de red al
servidor Amanda. Un problema com?n en sitios con gran cantidad de discos
grandes es que la cantidad de tiempo requerida para respaldar los datos
directamente a cinta excede la cantidad de tiempo disponible para la
tarea. Amanda resuelve este problema. Amanda puede usar un “disco
intermedio” para respaldar varios sistemas de ficheros al mismo tiempo.
Amanda crea “conjuntos de archivo”, esto es, un grupo de cintas usadas
durante un periodo de tiempo para crear respaldos completos de todos los
sistemas de ficheros listados en el fichero de configuraci?n de Amanda.
El “conjunto de archivo” tambi?n contiene respaldos incrementales
nocturnos (o diferenciales) de todos los sistemas de ficheros. Para
restaurar un sistema de ficheros da?ado hace falta el respaldo completo
m?s reciente y los respaldos incrementales.

El fichero de configuraci?n ofrece un control exhaustivo de los
respaldos y del tr?fico de red que Amanda genera. Amanda usar?
cualquiera de los programas de respaldo mencionados arriba para escribir
los datos a cinta. Puede instalar Amanda como paquete y como port. No
forma parte del sistema base.

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

18.11.6. No hacer nada
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

“No hacer nada” no es un programa, pero es la estrategia de respaldo m?s
extendida. No tiene coste. No hay un calendario de respaldos a seguir.
Simplemente hay que decir *que no*. Si algo le sucediera a sus datos
*sonr?a y acost?mbrese a su nueva situaci?n*.

Si su tiempo y sus datos valen poco o nada, entonces “no hacer nada” es
el programa de respaldo m?s adecuado para usted. Pero cuidado, UNIX? es
una herramienta muy poderosa y puede suceder que dentro de seis meses
tenga un mont?n de ficheros que sean valiosos para usted.

“No hacer nada” es el m?todo correcto de respaldo para ``/usr/obj`` y
otros ?rboles de directorios que pueden ser f?cilmente recreados por su
computadora. Un ejemplo son los archivos que forman la versi?n HTML o
PostScript? de este manual. Estos documentos han sido generados desde
ficheros SGML. Crear respaldos de los archivos HTML o PostScript? no es
necesario dado que los ficheros SGML se respaldan regularmente.

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

18.11.7. ?Cu?l es el mejor programa de respaldos?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

`dump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dump&sektion=8>`__.
*Y no hay m?s que hablar.* Elizabeth D. Zwicky realiz? pruebas de estr?s
a a todos los programas de copia de seguridad aqu? expuestos. La
elecci?n clar?sima para preservar todos sus datos y todas las
peculiaridades de sus sistemas de ficheros UNIX? es ``dump``. Elizabeth
cre? sistemas de ficheros conteniendo una gran variedad de condiciones
inusuales (y algunos no tan inusuales) y prob? cada programa haciendo un
respaldo y restaurando esos sistemas de ficheros. Esas peculiaridades
inclu?an: ficheros con y un bloque nulo, ficheros con caracteres
extra?os en sus nombres, ficheros que no se pod?an leer ni escribir,
dispositivos, ficheros que cambiaban de tama?o durante el respaldo,
ficheros que eran creados/borrados durante el respaldo y cosas as?.
Elizabeth present? los resultados en LISA V en octubre de 1991. Consulte
`torture-testing Backup and Archive
Programs <http://berdmann.dyndns.org/zwicky/testdump.doc.html>`__.

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

18.11.8. Procedimiento de restauraci?n de emergencia
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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

18.11.8.1. Antes del desastre
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Solamente existen cuatro pasos que debe realizar en preparaci?n de
cualquier desastre que pudiera ocurrir.

Primero, imprima la etiqueta de disco de cada uno de sus discos
(``disklabel da0 | lpr``), su tabla de sistemas de ficheros
(``/etc/fstab``) y todos los mensajes de arranque, dos copias de cada
uno.

Segundo, aseg?rese que los disquetes de rescate (``boot.flp`` y
``fixit.flp``) tienen todos sus dispositivos. La manera m?s f?cil de
revisarlo es reiniciar su m?quina con el disquete en la unidad y revisar
los mensajes de arranque. Si todos sus dispositivos aparecen en la lista
y funcionan, pase al tercer paso.

Si ha habido alg?n problema tiene que crear dos disquetes de arranque
personalizados, que deben tener un kernel que pueda montar todos sus
discos y acceder a su unidad de cinta. Estos discos deben contener:
``fdisk``, ``disklabel``, ``newfs``, ``mount`` y cualquier programa de
respaldo que utilice. Estos programas deben estar enlazados
est?ticamente. Si usa ``dump``, el disquete debe contener ``restore``.

Tercero, use cintas de respaldo regularmente. Cualquier cambio que haga
despu?s de su ?ltimo respaldo puede perderse irremediablemente. Proteja
contra escritura las cintas de respaldo.

Cuarto, pruebe los disquetes (ya sea ``boot.flp`` y ``fixit.flp`` o los
dos discos personalizados que cre? en el segundo paso) y las cintas de
respaldo. Documente el procedimiento. Almacene estas notas con los
discos de arranque, las impresiones y las cintas de respaldo. Estar? tan
perturbado cuando restaure su sistema que las notas pueden pueden evitar
que destruya sus cintas de respaldo. (?Como? en lugar de
``tar xvf /dev/sa0``, puede teclear accidentalmente ``tar cvf /dev/sa0``
y sobreescribir su cinta).

Como medida adicional de seguridad haga discos de inicio y dos cintas de
respaldo cada vez. Almacene una de cada en una ubicaci?n remota. Una
ubicaci?n remota *NO* es el s?tano del mismo edificio. Muchas firmas
alojadas en el World Trade Center aprendieron esta lecc?n de la manera
m?s dif?cil. Esa ubicaci?n remota debe estar separada f?sicamente de sus
computadoras y unidades de disco por una distancia significativa.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Ejemplo 18.3. Un “script” para la creaci?n de discos flexibles de
arranque

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    #!/bin/sh
    #
    # create a restore floppy
    #
    # format the floppy
    #
    PATH=/bin:/sbin:/usr/sbin:/usr/bin

    fdformat -q fd0
    if [ $? -ne 0 ]
    then
         echo "Bad floppy, please use a new one"
         exit 1
    fi

    # place boot blocks on the floppy
    #
    disklabel -w -B /dev/fd0c fd1440

    #
    # newfs the one and only partition
    #
    newfs -t 2 -u 18 -l 1 -c 40 -i 5120 -m 5 -o space /dev/fd0a

    #
    # mount the new floppy
    #
    mount /dev/fd0a /mnt

    #
    # create required directories
    #
    mkdir /mnt/dev
    mkdir /mnt/bin
    mkdir /mnt/sbin
    mkdir /mnt/etc
    mkdir /mnt/root
    mkdir /mnt/mnt          # for the root partition
    mkdir /mnt/tmp
    mkdir /mnt/var

    #
    # populate the directories
    #
    if [ ! -x /sys/compile/MINI/kernel ]
    then
         cat &lt;&lt; EOM
    The MINI kernel does not exist, please create one.
    Here is an example config file:
    #
    # MINI - A kernel to get FreeBSD onto a disk.
    #
    machine         "i386"
    cpu             "I486_CPU"
    ident           MINI
    maxusers        5

    options         INET                    # needed for _tcp _icmpstat _ipstat
                                            #            _udpstat _tcpstat _udb
    options         FFS                     #Berkeley Fast File System
    options         FAT_CURSOR              #block cursor in syscons or pccons
    options         SCSI_DELAY=15           #Be pessimistic about Joe SCSI device
    options         NCONS=2                 #1 virtual consoles
    options         USERCONFIG              #Allow user configuration with -c XXX

    config          kernel  root on da0 swap on da0 and da1 dumps on da0

    device          isa0
    device          pci0

    device          fdc0    at isa? port "IO_FD1" bio irq 6 drq 2 vector fdintr
    device          fd0 at fdc0 drive 0

    device          ncr0

    device          scbus0

    device          sc0 at isa? port "IO_KBD" tty irq 1 vector scintr
    device          npx0    at isa? port "IO_NPX" irq 13 vector npxintr

    device          da0
    device          da1
    device          da2

    device          sa0

    pseudo-device   loop            # required by INET
    pseudo-device   gzip            # Exec gzipped a.out's
    EOM
         exit 1
    fi

    cp -f /sys/compile/MINI/kernel /mnt

    gzip -c -best /sbin/init > /mnt/sbin/init
    gzip -c -best /sbin/fsck > /mnt/sbin/fsck
    gzip -c -best /sbin/mount > /mnt/sbin/mount
    gzip -c -best /sbin/halt > /mnt/sbin/halt
    gzip -c -best /sbin/restore > /mnt/sbin/restore

    gzip -c -best /bin/sh > /mnt/bin/sh
    gzip -c -best /bin/sync > /mnt/bin/sync

    cp /root/.profile /mnt/root

    cp -f /dev/MAKEDEV /mnt/dev
    chmod 755 /mnt/dev/MAKEDEV

    chmod 500 /mnt/sbin/init
    chmod 555 /mnt/sbin/fsck /mnt/sbin/mount /mnt/sbin/halt
    chmod 555 /mnt/bin/sh /mnt/bin/sync
    chmod 6555 /mnt/sbin/restore

    #
    # create the devices nodes
    #
    cd /mnt/dev
    ./MAKEDEV std
    ./MAKEDEV da0
    ./MAKEDEV da1
    ./MAKEDEV da2
    ./MAKEDEV sa0
    ./MAKEDEV pty0
    cd /

    #
    # create minimum file system table
    #
    cat > /mnt/etc/fstab &lt;&lt;EOM
    /dev/fd0a    /    ufs    rw  1  1
    EOM

    #
    # create minimum passwd file
    #
    cat > /mnt/etc/passwd &lt;&lt;EOM
    root:*:0:0:Charlie &amp;:/root:/bin/sh
    EOM

    cat > /mnt/etc/master.passwd &lt;&lt;EOM
    root::0:0::0:0:Charlie &amp;:/root:/bin/sh
    EOM

    chmod 600 /mnt/etc/master.passwd
    chmod 644 /mnt/etc/passwd
    /usr/sbin/pwd_mkdb -d/mnt/etc /mnt/etc/master.passwd

    #
    # umount the floppy and inform the user
    #
    /sbin/umount /mnt
    echo "The floppy has been unmounted and is now ready."

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

18.11.8.2. Despu?s del desastre
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

La pregunta clave es: ?sobrevivi? su hardware? Ha estado haciendo
respaldos regularmente, as? que no hay necesidad de preocuparse por el
software.

Si el hardware ha sufrido da?os los componentes deben reemplazarse antes
de intentar de usar su sistema.

Si su hardware est? bien revise sus discos de arranque. Si usa disquetes
de arranque personalizados arranque en modo monousuario (tecl?e ``-s``
en el en el “prompt” de arranque ``boot:``). S?ltese el siguiente
p?rrafo.

Si utiliza usando los discos ``boot.flp`` y ``fixit.flp``, siga leyendo.
Inserte el disco ``boot.flp`` en la primera unidad de disquete y
arranque la m?quina. El men? de instalaci?n original se desplegar? en
pantalla. Seleccione la opci?n
``Fixit--Repair mode with CDROM or           floppy.``. Inserte el disco
``fixit.flp`` cuando se le pida. Tanto ``restore`` como los dem?s
programas que necesitar? est?n en ``/mnt2/rescue`` (``/mnt2/stand`` para
versiones de FreeBSD anteriores a 5.2).

Recupere cada sistema de ficheros por separado.

Trate de montar (por ejemplo ``mount /dev/da0a /mnt``) la partici?n ra?z
de su primer disco. Si la etiqueta del disco ha sufrido da?os use
``disklabel`` para reparticionar y etiquetar el disco de forma que
coincida con la etiqueta que imprimi? y guard? previamente. Use
``newfs`` para crear de nuevo sus sistemas de ficheros. Monte de nuevo
la partici?n ra?z del disquete en modo lectura/escritura
(``mount -u -o rw /mnt``). Ejecute su programa de respaldo y utilice las
cintas de respaldo para restaurar sus datos en este sistema de ficheros
(``restore vrf /dev/sa0``). Desmonte el sistema de ficheros
(``umount /mnt``). Repita el proceso con cada sistema de ficheros que
sufri? da?os.

Una vez que su sistema est? en marcha respalde sus datos en cintas
nuevas. Cualquiera que haya sido la causa de la ca?da o p?rdida de datos
puede suceder de nuevo. Una hora m?s que gaste ahora puede ahorrarle
mucho sufrimiento m?s adelante.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------------+---------------------------+-------------------------------------------------------------------------+
| `Anterior <backups-floppybackups.html>`__?   | `Subir <disks.html>`__    | ?\ `Siguiente <disks-virtual.html>`__                                   |
+----------------------------------------------+---------------------------+-------------------------------------------------------------------------+
| 18.10. Respaldos en disquetes?               | `Inicio <index.html>`__   | ?18.12. Sistemas de ficheros en red, memoria y respaldados en fichero   |
+----------------------------------------------+---------------------------+-------------------------------------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
