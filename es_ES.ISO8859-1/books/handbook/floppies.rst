============================================
18.8. Creaci?n y uso de disquetes (floppies)
============================================

.. raw:: html

   <div class="navheader">

18.8. Creaci?n y uso de disquetes (floppies)
`Anterior <creating-dvds.html>`__?
Cap?tulo 18. Almacenamiento
?\ `Siguiente <backups-tapebackups.html>`__

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

18.8. Creaci?n y uso de disquetes (floppies)
--------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Texto original de Julio Merino.

.. raw:: html

   </div>

.. raw:: html

   <div>

Reescrito por Martin Karlsson.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Poder almacenar datos en discos flexibles es ?til algunas veces, por
ejemplo cuando no se tiene cualquier otro medio de almacenamiento
extraible o cuando se necesita transferir una cantidad peque?a de datos
a otro sistema.

Esta secci?n explicar? c?mo usar disquetes en FreeBSD. Cubrir?
principalmente el formateo y utilizaci?n de disquetes DOS de 3.5
pulgadas, pero los conceptos son similares en otros formatos de
disquete.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

18.8.1. Formateo de disquetes
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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

18.8.1.1. El dispositivo
^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El acceso a los disquetes se efect?a a trav?s de entradas en ``/dev``,
igual que en otros dispositivos. Para acceder al disquete “crudo” (raw)
en versiones 4.X y anteriores, se usa ``/dev/fdN``, donde *``N``*
representa el n?mero de unidad, generalmente 0, o ``/dev/fdNX``, donde
*``X``* representa una letra.

En versiones 5.0 o posteriores, simplemente use ``/dev/fdN``.

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

18.8.1.1.1. El tama?o de disco en versiones 4.X y anteriores
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Tambi?n existen dispositivos ``/dev/fdN.tama?o``, donde *``tama?o``* es
el tama?o del disquete en kilobytes. Estas entradas se usan durante el
formateo a bajo nivel para determinar el tama?o del disco. En los
siguientes ejemplos se usar? el tama?o de 1440kB.

Algunas veces las entradas bajo ``/dev`` tendr?n que ser (re)creadas.
Para ello, ejecute:

.. code:: screen

    # cd /dev && ./MAKEDEV "fd*"

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

18.8.1.1.2. El tama?o de disco en versiones 5.0 y posteriores
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

En 5.0,
`devfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=devfs&sektion=5>`__
administrar? autom?ticamente los nodos de dispositivo en ``/dev``, as?
que el uso de ``MAKEDEV`` no es necesario.

El tama?o de disco deseado se pasa a
`fdformat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=fdformat&sektion=1>`__
mediante la bandera ``-f``. Los tama?os soportados aparecen en
`fdcontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fdcontrol&sektion=8>`__,
pero tenga muy en cuenta que 1440kB es el que funciona mejor.

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

18.8.1.2. Formatear
^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Un disquete necesita ser formateado a bajo nivel antes de poder usarse.
Esto suele hacerlo el fabricante, pero el formateo es una buena manera
de revisar la integridad del medio. Aunque es posible forzar tama?os de
disco m?s grandes (o peque?os), 1440kB es para lo que la mayor?a de los
disquetes est?n dise?ados.

Para formatear un disquete a bajo nivel debe usar
`fdformat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=fdformat&sektion=1>`__.
Esta utilidad espera el nombre del dispositivo como argumento.

Tome nota de cualquier mensaje de error, ya que ?stos pueden ayudarle a
determinar si el disco est? bien o mal.

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

18.8.1.2.1. Formateo en versiones 4.X y anteriores
''''''''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Use el dispositivo ``/dev/fdN.tama?o`` para formatear el disquete.
Inserte un disco de 3'5 pulgadas en su unidad y ejecute:

.. code:: screen

    # /usr/sbin/fdformat /dev/fd0.1440

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

18.8.1.2.2. Formateo en versiones 5.0 y posteriores
'''''''''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Use el dispositivo ``/dev/fdN`` para formatear el disquete. Inserte un
disco de 3'5 pulgadas en su unidad y ejecute:

.. code:: screen

    # /usr/sbin/fdformat -f 1440 /dev/fd0

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

18.8.2. La etiqueta de disco
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Tras un formato del disco a bajo nivel necesitar? colocar una etiqueta
de disco en ?l. Esta etiqueta de disco ser? destruida m?s tarde, pero es
necesaria para que el sistema determine el tama?o del disco y su
geometr?a.

La nueva etiqueta de disco ocupar? todo el disco, y contendr? toda la
informaci?n apropiada sobre la geometr?a del disquete. Los valores de
geometr?a para la etiqueta de disco est?n en ``/etc/disktab``.

Ejecute
`disklabel(8) <http://www.FreeBSD.org/cgi/man.cgi?query=disklabel&sektion=8>`__
as?:

.. code:: screen

    # /sbin/disklabel -B -r -w /dev/fd0 fd1440

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Desde FreeBSD?5.1-RELEASE
`bsdlabel(8) <http://www.FreeBSD.org/cgi/man.cgi?query=bsdlabel&sektion=8>`__
reemplaz? al viejo programa
`disklabel(8) <http://www.FreeBSD.org/cgi/man.cgi?query=disklabel&sektion=8>`__.
En
`bsdlabel(8) <http://www.FreeBSD.org/cgi/man.cgi?query=bsdlabel&sektion=8>`__
se eliminaron muchas opciones y par?metros obsoletos; en el ejemplo de
arriba la opci?n ``-r`` no debe usarse. Para mayor informaci?n consulte
la p?gina de manual de
`bsdlabel(8) <http://www.FreeBSD.org/cgi/man.cgi?query=bsdlabel&sektion=8>`__.

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

18.8.3. El sistema de ficheros
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Ahora el disquete est? listo para ser formateado a alto nivel. Esto
colocar? un sistema de ficheros nuevo en el disco y permitir? a FreeBSD
leer y escribir en el disco. Despu?s de crear el sistema de ficheros se
destruye la etiqueta de disco, as? que si desea reformatearlo, tendr?
que recrear la etiqueta de disco.

El sistema de ficheros del disquete puede ser UFS o o FAT. FAT suele ser
una mejor opci?n para disquetes.

Para formatear un disquete ejecute:

.. code:: screen

    # /sbin/newfs_msdos /dev/fd0

El disco est? para su uso.

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

18.8.4. Uso de un disquete
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Para usar el disquete m?ntelo con
`mount\_msdos(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount_msdos&sektion=8>`__
(en versiones 4.X y anteriores) o con
`mount\_msdosfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount_msdosfs&sektion=8>`__
(en versiones 5.X o posteriores). Tambi?n se puede usar
`emulators/mtools <http://www.freebsd.org/cgi/url.cgi?ports/emulators/mtools/pkg-descr>`__.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------------------+---------------------------+-----------------------------------------------+
| `Anterior <creating-dvds.html>`__?              | `Subir <disks.html>`__    | ?\ `Siguiente <backups-tapebackups.html>`__   |
+-------------------------------------------------+---------------------------+-----------------------------------------------+
| 18.7. Crear y utilizar medios ?pticos (DVDs)?   | `Inicio <index.html>`__   | ?18.9. Creaci?n y uso de cintas de datos      |
+-------------------------------------------------+---------------------------+-----------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
