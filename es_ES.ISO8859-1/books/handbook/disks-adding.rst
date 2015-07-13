===================
18.3. A?adir discos
===================

.. raw:: html

   <div class="navheader">

18.3. A?adir discos
`Anterior <disks-naming.html>`__?
Cap?tulo 18. Almacenamiento
?\ `Siguiente <raid.html>`__

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

18.3. A?adir discos
-------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Texto original de David O'Brien.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Digamos que queremos a?adir un nuevo disco SCSI a una m?quina que solo
tiene un disco. Comience por apagar el sistema e instale el disco
siguiendo las instrucciones del fabricante de la computadora, del disco
y de la controladora. Debido a la gran variedad de procedimientos
posibles los detalles est?n m?s all? del alcance de este texto.

Entre como usuario ``root``. Una vez instalado el disco inspeccione
``/var/run/dmesg.boot`` para asegurarse de que el sistema encontr? el
nuevo disco. Continuando con nuestro ejemplo, el disco reci?n a?adido
ser? ``da1`` y queremos montarlo en ``/1`` (si est? a?adiendo un disco
IDE, el nombre de dispositivo ser? ``wd1`` en sistemas anteriores a 4.0,
y ``ad1`` en sistemas 4.X y 5.X).

FreeBSD funciona en computadoras IBM-PC y compatibles, por lo tanto
tendr? en cuenta las particiones de la BIOS del PC, que son diferentes
del tipo de partici?n que se ha venido usando en BSD. Un disco para PC
puede contener hasta cuatro entradas de particiones BIOS. Si el disco va
a utilizarse ?ntegramente con FreeBSD puede usar el modo *dedicado*. Si
no, FreeBSD tendr? que instalarse dentro de una las particiones BIOS. En
FreeBSD se llama slices (“porciones” o “rebanadas”) a las particiones de
PC BIOS para no confundirlas con las particiones BSD. Tambi?n puede
utilizar slices en un disco dedicado a FreeBSD pero que se est? usando
en un sistema que tambi?n tiene otro sistema operativo instalado. Esta
es una buena manera de evitar confundir la versi?n de ``fdisk`` de otros
sistemas operativos.

Desde el punto de vista de las slices el disco se a?adir? como
``/dev/da1s1e``. Se interpreta del siguiente modo: disco SCSI, unidad
n?mero 1 (segundo disco SCSI), slice 1 (partici?n 1 de PC BIOS), y
partici?n BSD ``e``. Si es un disco dedicado, el disco se a?adir? como
``/dev/da1e``.

Debido al uso de enteros de 32-bits para almacenar el n?mero de
sectores,
`bsdlabel(8) <http://www.FreeBSD.org/cgi/man.cgi?query=bsdlabel&sektion=8>`__
(llamado
`disklabel(8) <http://www.FreeBSD.org/cgi/man.cgi?query=disklabel&sektion=8>`__
en FreeBSD?4.X) est? limitado a 2^32-1 sectores por disco ? 2TB (en la
mayor?a de los casos). El formato de
`fdisk(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fdisk&sektion=8>`__
permite un sector de arranque de un m?ximo de m?s de 2^32-1 y no m?s de
2^32-1 de longitud, limitando las particiones a 2TB y los discos a 4TB
(tambi?n en la mayor?a de los casos). El formato
`sunlabel(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sunlabel&sektion=8>`__
tiene una limitaci?n de 2^32-1 sectores por partici?n y 8 particiones en
un espacio m?ximo de 16TB. Si va a usar discos mayores puede usar
particiones
`gpt(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gpt&sektion=8>`__.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

18.3.1. Uso de `sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="procedure">

#. **Navegar en Sysinstall**

   Puede utilizar ``sysinstall`` (``/stand/sysinstall`` en versiones de
   FreeBSD anteriores a 5.2) para particionar y etiquetar un disco nuevo
   usando sus intuitivos men?s. Entre como el usuario ``root`` o utilice
   ``su``. Ejecute ``sysinstall`` y entre al men? ``Configure``. Dentro
   de ``FreeBSD Configuration Menu``, descienda y seleccione la opci?n
   ``Fdisk``.

#. **Editor de particiones fdisk**

   Una vez dentro de fdisk, tecl?e **``A``** si quiere usar el disco
   entero con FreeBSD Cuando se le pregunte “remain cooperative with any
   future possible operating systems”
   `:sup:`[10]` <#ftn.idp77211216>`__, responda ``YES``. Escriba los
   cambios al disco pulsando **``W``**. Salga del editor FDISK pulsando
   **``q``**. A continuaci?n se le preguntar? sobre el “Master Boot
   Record”. Debido a que est? a?adiendo un nuevo disco a un sistema que
   ya est? instalado, tendr? que seleccionar ``None``.

#. **Editor de etiquetas de disco**

   A continuaci?n, debe salir de sysinstall e iniciarlo de nuevo. Siga
   las instrucciones arriba expuestas, pero esta vez elija la opci?n
   ``Label``. De este modo acceder? al ``editor de etiquetas de disco``.
   En ?l crear? las particiones BSD tradicionales. Un disco puede tener
   hasta ocho particiones, etiquetadas desde la ``a`` a la ``h``.
   Algunas de las etiquetas de las particiones tienen usos especiales.
   La partici?n ``a`` se utiliza para la partici?n ra?z (``/``), por lo
   tanto s?lo su disco de sistema (esto es, el disco desde el cual
   arranca) tendr? una partici?n ``a``. La partici?n ``b`` se usa como
   partici?n swap; puede tener m?s de una partici?n swap y puede
   alojarlas en m?s de un disco. La partici?n ``c`` hace referencia al
   disco entero en modo dedicado, o a la slice de FreeBSD completa en
   modo slice. Las dem?s particiones son para el resto de los usos
   t?picos.

   El editor de etiquetas de sysinstall crear? la partici?n ``e`` como
   partici?n “ni ra?z, ni swap”. En el editor de etiquetas cr?e un solo
   sistema de ficheros tecleando **``C``**. Cuando se le pregunte si
   debe etiquetarse como FS (sistema de ficheros) o swap, elija ``FS`` y
   tecl?e un punto de montaje (por ejemplo ``/mnt``). Al a?adir un disco
   en modo “post-instalaci?n” sysinstall no crear? autom?ticamente las
   entradas correspondientes en ``/etc/fstab``, por lo que el punto de
   montaje que usted especifique no tiene importancia.

   Ahora puede escribir la nueva etiqueta al disco y crear un sistema de
   ficheros en ?l tecleando **``W``**. Ignore cualquier error que
   pudiera generar sysinstall acerca de dificultades para montar la
   nueva partici?n. Salga del editor de etiquetas y de sysinstall.

#. **Terminar**

   El ?ltimo paso es editar ``/etc/fstab`` y a?adir una entrada para su
   nuevo disco.

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

18.3.2. Uso de utilidades de l?nea de comandos
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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

18.3.2.1. Uso de slices
^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Esta configuraci?n le permitir? a su disco convivir sin sobresaltos con
otro sistema operativo que pueda estar instalado en su sistema y no
confundir? a las utilidades ``fdisk`` de esos otros sistemas operativos.
Se recomienda utilizar este m?todo para instalar discos nuevos. *Utilice
el modo dedicado s?lamente si tiene un buen motivo para hacerlo*.

.. code:: screen

    # dd if=/dev/zero of=/dev/da1 bs=1k count=1
    # fdisk -BI da1 #Initialice el nuevo disco.
    # disklabel -B -w -r da1s1 auto #Etiqu?telo.
    # disklabel -e da1s1 # Edite la etiqueta de disco que acaba de crear y a?ada particiones.
    # mkdir -p /1
    # newfs /dev/da1s1e # Repita este paso por cada partici?n que cr?e.
    # mount /dev/da1s1e /1 # Monte la partici?n o particiones.
    # vi /etc/fstab # A?ada la/s entrada/s apropiadas en /etc/fstab.

Si tiene un disco IDE, sustituya ``ad`` por ``da``. En sistemas
anteriores a 4.X utilice ``wd``.

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

18.3.2.2. Dedicado
^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Si no va a compartir el nuevo disco con otro sistema operativo puede
utilizar el modo ``dedicado``. Recuerde que este modo puede confundir a
los sistemas operativos de Microsoft, aunque no podr?n da?ar por ello el
disco o su contenido. Tenga en cuenta que FreeBSD (de IBM) se
“apropiar?” de cualquier partici?n que encuentre y no entienda.

.. code:: screen

    # dd if=/dev/zero of=/dev/da1 bs=1k count=1
    # disklabel -Brw da1 auto
    # disklabel -e da1              # crear partici?n `e'
    # newfs -d0 /dev/da1e
    # mkdir -p /1
    # vi /etc/fstab             # agregar una entrada para /dev/da1e
    # mount /1

Una forma alternativa de hacerlo ser?a:

.. code:: screen

    # dd if=/dev/zero of=/dev/da1 count=2
    # disklabel /dev/da1 | disklabel -BrR da1 /dev/stdin
    # newfs /dev/da1e
    # mkdir -p /1
    # vi /etc/fstab                 # a?adir una entrada para /dev/da1e
    # mount /1

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

A partir de FreeBSD?5.1-RELEASE, la utilidad
`bsdlabel(8) <http://www.FreeBSD.org/cgi/man.cgi?query=bsdlabel&sektion=8>`__
reemplaz? al antiguo programa
`disklabel(8) <http://www.FreeBSD.org/cgi/man.cgi?query=disklabel&sektion=8>`__.
En
`bsdlabel(8) <http://www.FreeBSD.org/cgi/man.cgi?query=bsdlabel&sektion=8>`__
se han eliminado muchos par?metros y opciones obsoletas; en los ejemplos
de arriba la opci?n ``-r`` debe eliminarse si se usa
`bsdlabel(8) <http://www.FreeBSD.org/cgi/man.cgi?query=bsdlabel&sektion=8>`__.
Para m?s informaci?n dir?jase al manual de
`bsdlabel(8) <http://www.FreeBSD.org/cgi/man.cgi?query=bsdlabel&sektion=8>`__.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="footnotes">

--------------

.. raw:: html

   <div id="ftn.idp77211216" class="footnote">

`:sup:`[10]` <#idp77211216>`__ Mantener el disco accesible a sistemas
operativos que pudieran necesitar acceder al mismo en alg?n momento.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------+---------------------------+--------------------------------+
| `Anterior <disks-naming.html>`__?   | `Subir <disks.html>`__    | ?\ `Siguiente <raid.html>`__   |
+-------------------------------------+---------------------------+--------------------------------+
| 18.2. Nombres de dispositivo?       | `Inicio <index.html>`__   | ?18.4. RAID                    |
+-------------------------------------+---------------------------+--------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
