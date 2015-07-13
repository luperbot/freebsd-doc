====================================================================
18.12. Sistemas de ficheros en red, memoria y respaldados en fichero
====================================================================

.. raw:: html

   <div class="navheader">

18.12. Sistemas de ficheros en red, memoria y respaldados en fichero
`Anterior <backup-basics.html>`__?
Cap?tulo 18. Almacenamiento
?\ `Siguiente <snapshots.html>`__

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

18.12. Sistemas de ficheros en red, memoria y respaldados en fichero
--------------------------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Reorganizado y mejorado por Marc Fonvieille.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Adem?s de los discos que conecta f?sicamente en su m?quina (discos
flexibles, CDs, discos duros, etc.) FreeBSD permite usar otro tipo de
discos: *los discos virtuales*.

Esto incluye sistemas de ficheros en red como `NFS <network-nfs.html>`__
y Coda, sistemas de ficheros basados en memoria y sistemas de ficheros
basados en fichero.

Seg?n la versi?n de FreeBSD que utilice tendr? que utilizar diferentes
herramientas para la creaci?n y uso de sistemas de ficheros en memoria y
sistemas de ficheros basados en fichero.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Los usuarios de FreeBSD?4.X tendr?n que usar
`MAKEDEV(8) <http://www.FreeBSD.org/cgi/man.cgi?query=MAKEDEV&sektion=8>`__
para crear los dispositivos requeridos. FreeBSD?5.0 y posteriores usan
`devfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=devfs&sektion=5>`__
para gestionar los nodos de dispositivo correspondientes de forma
transparente para el usuario.

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

18.12.1. Sistema de ficheros basado en fichero en FreeBSD?4.X
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

La utilidad
`vnconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=vnconfig&sektion=8>`__
configura y habilita vnodes de dispositivos de pseudodisco. Un *vnode*
es una representaci?n de un fichero y es el enfoque de la actividad de
fichero. Esto significa que
`vnconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=vnconfig&sektion=8>`__
utiliza ficheros para crear y operar un sistema de ficheros. Un uso
posible es el montaje de im?genes de disquetes o CD almacenadas como
ficheros.

Para poder usar
`vnconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=vnconfig&sektion=8>`__
necesitar? tener
`vn(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vn&sektion=4>`__ en el
fichero de configuraci?n de su kernel:

.. code:: programlisting

    pseudo-device vn

Para montar una imagen de un sistema de ficheros:

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Ejemplo 18.4. Uso de vnconfig para montar una imagen de un sistema de
ficheros bajo FreeBSD?4.X

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    # vnconfig vn0 imagendedisco
    # mount /dev/vn0c /mnt

.. raw:: html

   </div>

.. raw:: html

   </div>

Para crear una nueva imagen de un sistema de ficheros con
`vnconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=vnconfig&sektion=8>`__:

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Ejemplo 18.5. Creaci?n de una imagen nueva de un sistema de ficheros
respaldado en un archivo con ``vnconfig``

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    # dd if=/dev/zero of=nuevaimagen bs=1k count=5k
    5120+0 records in
    5120+0 records out
    # vnconfig -s labels -c vn0 nuevaimagen
    # disklabel -r -w vn0 auto
    # newfs vn0c
    Warning: 2048 sector(s) in last cylinder unallocated
    /dev/vn0c:     10240 sectors in 3 cylinders of 1 tracks, 4096 sectors
            5.0MB in 1 cyl groups (16 c/g, 32.00MB/g, 1280 i/g)
    super-block backups (for fsck -b #) at:
     32
    # mount /dev/vn0c /mnt
    # df /mnt
    Filesystem  1K-blocks     Used    Avail Capacity  Mounted on
    /dev/vn0c        4927        1     4532     0%    /mnt

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

18.12.2. Sistemas de ficheros basados en fichero en FreeBSD?5.X
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

`mdconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mdconfig&sektion=8>`__
se usa para configurar y habilitar discos habilitar discos de memoria,
`md(4) <http://www.FreeBSD.org/cgi/man.cgi?query=md&sektion=4>`__, en
FreeBSD?5.X. Para usar
`mdconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mdconfig&sektion=8>`__,
tendr? que cargar el m?dulo
`md(4) <http://www.FreeBSD.org/cgi/man.cgi?query=md&sektion=4>`__ o
a?adir soporte para el mismo el el fichero de configuraci?n del kernel:

.. code:: programlisting

    device md

`mdconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mdconfig&sektion=8>`__
soporta tres tipos de discos virtuales en memoria: discos de memoria
asignados mediante
`malloc(9) <http://www.FreeBSD.org/cgi/man.cgi?query=malloc&sektion=9>`__,
discos de memoria usando un fichero o espacio de swap como respaldo. Un
uso posible es montar im?genes de disquetes o CD archivadas.

Para montar una imagen de un sistema de ficheros:

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Ejemplo 18.6. Uso de ``mdconfig`` para montar una imagen de un sistema
de ficheros en FreeBSD?5.X

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    # mdconfig -a -t vnode -f imagendedisco -u 0
    # mount /dev/md0 /mnt

.. raw:: html

   </div>

.. raw:: html

   </div>

Para crear una imagen nueva de un sistema de ficheros con
`mdconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mdconfig&sektion=8>`__:

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Ejemplo 18.7. Creaci?n de un disco respaldado en fichero con
``mdconfig``

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    # dd if=/dev/zero of=nuevaimagen bs=1k count=5k
    5120+0 records in
    5120+0 records out
    # mdconfig -a -t vnode -f nuevaimagen -u 0
    # disklabel -r -w md0 auto
    # newfs md0c
    /dev/md0c: 5.0MB (10240 sectors) block size 16384, fragment size 2048
        using 4 cylinder groups of 1.27MB, 81 blks, 256 inodes.
    super-block backups (for fsck -b #) at:
     32, 2624, 5216, 7808
    # mount /dev/md0c /mnt
    # df /mnt
    Filesystem  1K-blocks     Used    Avail Capacity  Mounted on
    /dev/md0c        4846        2     4458     0%    /mnt

.. raw:: html

   </div>

.. raw:: html

   </div>

Si no especifica el n?mero de unidad con la opci?n ``-u``
`mdconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mdconfig&sektion=8>`__
usar? la designaci?n autom?tica de
`md(4) <http://www.FreeBSD.org/cgi/man.cgi?query=md&sektion=4>`__ para
seleccionar un dispositivo sin usar. El nombre de la unidad designada se
enviar? a la salida es?ndar como ``md4``. Para m?s informaci?n sobre
`mdconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mdconfig&sektion=8>`__
consulte su p?gina de manual.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

A partir de FreeBSD?5.1-RELEASE
`bsdlabel(8) <http://www.FreeBSD.org/cgi/man.cgi?query=bsdlabel&sektion=8>`__
reemplaz? a
`disklabel(8) <http://www.FreeBSD.org/cgi/man.cgi?query=disklabel&sektion=8>`__.
En
`bsdlabel(8) <http://www.FreeBSD.org/cgi/man.cgi?query=bsdlabel&sektion=8>`__
se eliminaron muchas opciones y par?metros obsoletos. En el ejemplo de
arriba ignore la opci?n ``-r``. Para m?s informaci?n consulte la p?gina
de manual de
`bsdlabel(8) <http://www.FreeBSD.org/cgi/man.cgi?query=bsdlabel&sektion=8>`__.

.. raw:: html

   </div>

`mdconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mdconfig&sektion=8>`__
es muy ?til, aunque requiere muchas l?neas de comando para crear un
sistema de ficheros basado en un fichero. FreeBSD?5.0 incorpora
`mdmfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mdmfs&sektion=8>`__,
que configura un disco
`md(4) <http://www.FreeBSD.org/cgi/man.cgi?query=md&sektion=4>`__
utilizando
`mdconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mdconfig&sektion=8>`__,
pone un sistema de ficheros UFS en ?l mediante
`newfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newfs&sektion=8>`__
y lo monta usando
`mount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount&sektion=8>`__.
Por ejemplo, si desea crear y montar la misma imagen de sistema de
ficheros de arriba, simplemente tecl?e lo siguiente:

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Ejemplo 18.8. Configurar y montar un disco basado en un fichero con
``mdmfs``

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    # dd if=/dev/zero of=nuevaimagen bs=1k count=5k
    5120+0 records in
    5120+0 records out
    # mdmfs -F newimage -s 5m md0 /mnt
    # df /mnt
    Filesystem 1K-blocks Used Avail Capacity  Mounted on
    /dev/md0        4846    2  4458     0%    /mnt

.. raw:: html

   </div>

.. raw:: html

   </div>

Si utiliza la opci?n ``md`` sin n?mero de unidad,
`mdmfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mdmfs&sektion=8>`__
usar? la opci?n de auto unidad de
`md(4) <http://www.FreeBSD.org/cgi/man.cgi?query=md&sektion=4>`__ para
selecionar autom?ticamente un dispositivo sin usar. Para m?s informaci?n
sobre
`mdmfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mdmfs&sektion=8>`__
dir?jase a la p?gina de manual.

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

18.12.3. Sistemas de ficheros basados en memoria en FreeBSD?4.X
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El controlador
`md(4) <http://www.FreeBSD.org/cgi/man.cgi?query=md&sektion=4>`__ es un
modo sencillo y eficiente de crear sistemas de ficheros basados en
memoria en FreeBSD?4.X.
`malloc(9) <http://www.FreeBSD.org/cgi/man.cgi?query=malloc&sektion=9>`__
se usa para ubicar la memoria.

Sencillamete toma un sistema de ficheros que usted ha preparado con, por
ejemplo,
`vnconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=vnconfig&sektion=8>`__,
y:

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Ejemplo 18.9. Disco de memoria md en FreeBSD?4.X

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    # dd if=nuevaimagen of=/dev/md0
    5120+0 records in
    5120+0 records out
    # mount /dev/md0c /mnt
    # df /mnt
    Filesystem  1K-blocks     Used    Avail Capacity  Mounted on
    /dev/md0c        4927        1     4532     0%    /mnt

.. raw:: html

   </div>

.. raw:: html

   </div>

Para m?s informaci?n por favor consulte la p?gina de manual de
`md(4) <http://www.FreeBSD.org/cgi/man.cgi?query=md&sektion=4>`__.

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

18.12.4. sistemas de ficheros basados en memoria en FreeBSD?5.X
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Se usan las mismas herramientas para tratar con sistemas de ficheros
basados en memoria o en ficheros:
`mdconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mdconfig&sektion=8>`__
o
`mdmfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mdmfs&sektion=8>`__.
El almacenamiento de sistemas de ficheros basados en memoria requiere el
uso de
`malloc(9) <http://www.FreeBSD.org/cgi/man.cgi?query=malloc&sektion=9>`__.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Ejemplo 18.10. Creaci?n de un nuevo disco basado en memoria con
``mdconfig``

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    # mdconfig -a -t malloc -s 5m -u 1
    # newfs -U md1
    /dev/md1: 5.0MB (10240 sectors) block size 16384, fragment size 2048
        using 4 cylinder groups of 1.27MB, 81 blks, 256 inodes.
        with soft updates
    super-block backups (for fsck -b #) at:
     32, 2624, 5216, 7808
    # mount /dev/md1 /mnt
    # df /mnt
    Filesystem 1K-blocks Used Avail Capacity  Mounted on
    /dev/md1        4846    2  4458     0%    /mnt

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Ejemplo 18.11. Creaci?n de un nuevo disco basado en memoria con
``mdmfs``

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    # mdmfs -M -s 5m md2 /mnt
    # df /mnt
    Filesystem 1K-blocks Used Avail Capacity  Mounted on
    /dev/md2        4846    2  4458     0%    /mnt

.. raw:: html

   </div>

.. raw:: html

   </div>

En lugar de usar un sistema de ficheros respaldado en
`malloc(9) <http://www.FreeBSD.org/cgi/man.cgi?query=malloc&sektion=9>`__,
es posible utilizar swap; lo ?nico que debe hacer es sustituir
``malloc`` por ``swap`` en la l?nea de comando de
`mdconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mdconfig&sektion=8>`__.
`mdmfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mdmfs&sektion=8>`__
por defecto (sin ``-M``) crea un disco basado en swap). Para m?s
informaci?n, consulte las p?ginas de manual de
`mdconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mdconfig&sektion=8>`__
y de
`mdmfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mdmfs&sektion=8>`__.

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

18.12.5. Desconexi?n del sistema de un disco de memoria
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Cuando un sistema de ficheros basado en memoria o basado en fichero no
se usa puede liberar recursos del sistema. Lo primero es desmontar el
sistema de ficheros: use
`mdconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mdconfig&sektion=8>`__
para desconectar el disco del sistema y liberar dichos recursos.

Por ejemplo, para desconectar y liberar todos los recursos usados por
``/dev/md4``:

.. code:: screen

    # mdconfig -d -u 4

Es posible listar informaci?n sobre dispositivos
`md(4) <http://www.FreeBSD.org/cgi/man.cgi?query=md&sektion=4>`__
configurados en el sistema mediante ``mdconfig -l``.

En FreeBSD?4.X se usa
`vnconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=vnconfig&sektion=8>`__
para desconectar el dispositivo. Por ejemplo, para desconectar y liberar
todos los recursos usados por ``/dev/vn4``:

.. code:: screen

    # vnconfig -u vn4

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+---------------------------+--------------------------------------------------------------+
| `Anterior <backup-basics.html>`__?   | `Subir <disks.html>`__    | ?\ `Siguiente <snapshots.html>`__                            |
+--------------------------------------+---------------------------+--------------------------------------------------------------+
| 18.11. Bases para respaldos?         | `Inicio <index.html>`__   | ?18.13. Instant?neas (“snapshots”) de sistemas de ficheros   |
+--------------------------------------+---------------------------+--------------------------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
