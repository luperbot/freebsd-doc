=========================
19.4. RAID1 - Replicaci?n
=========================

.. raw:: html

   <div class="navheader">

19.4. RAID1 - Replicaci?n
`Anterior <GEOM-striping.html>`__?
Cap?tulo 19. GEOM: Marco de trabajo modular de transformaci?n de discos
?\ `Siguiente <vinum-vinum.html>`__

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

19.4. RAID1 - Replicaci?n
-------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

La replicaci?n es una tecnolog?n que usan muchas empresas y usuarios
para hacer copias de respaldo de sus datos sin interrupciones. Cuando
hay una r?plica, simplemente significa que el discoB replica al discoA.
O, quiz? el discoC+D replica al discoA+B. Al margen de la configuraci?n
de los discos, lo importante es que la informaci?n de un disco o
partici?n est? siendo replicada. M?s adelante se podr?a restaurar esa
informaci?n m?s f?cilmente, hacerse una copia de respaldo sin provocar
intrrupciones de servicio o acceso, e incluso almacenarla f?sicamente en
una caja fuerte para datos.

Para empezar, aseg?rese de que el sistema tiene dos unidades de disco
del mismo tama?o, eb este ejercicio se supone que son discos SCSI de
acceso directo
(`da(4) <http://www.FreeBSD.org/cgi/man.cgi?query=da&sektion=4>`__).

Comience por instalar FreeBSD en el primer disco con s?lo dos
particiones. Una deber?a ser una partici?n de intercambio, de dos veces
el tama?o de la RAM, y todo el espacio restante se dedicar? al sistema
de ficheros ra?z (``/``). Es posible tener particiones aparte para otros
puntos de montajes; sin embargo, esto multiplicar? por diez el nivel de
dificultad, debido a la alteraci?n manual de las opciones de
`bsdlabel(8) <http://www.FreeBSD.org/cgi/man.cgi?query=bsdlabel&sektion=8>`__
y
`fdisk(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fdisk&sektion=8>`__.

Reinicie y espere a que el sistema se inicie por completo. Una vez haya
finalizado este proceso, ingrese como usuario ``root``.

Cree el dispositivo ``/dev/mirror/gm`` y enl?celo a ``/dev/da1``:

.. code:: screen

    # gmirror label -vnb round-robin gm0 /dev/da1

El sistema deber?a responder con:

.. code:: screen

    Metadata value stored on /dev/da1.
    Done.

Inicialice GEOM, esto cargar? el m?dulo del n?cleo
``/boot/kernel/geom_mirror.ko``:

.. code:: screen

    # gmirror load

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Esta orden deber?a haber creado en el directorio ``/dev/mirror`` los
nodos de dispositivo ``gm0``, ``gm0s1``, ``gm0s1a``, y ``gm0s1c``.

.. raw:: html

   </div>

Instale una etiqueta gen?rica ``fdisk`` y el c?digo de arranque en el
reci?n creado dispositivo ``gm0``:

.. code:: screen

    # fdisk -vBI /dev/mirror/gm0

Ahora instale la informaci?n ``bsdlabel`` gen?rica:

.. code:: screen

    # bsdlabel -wB /dev/mirror/gm0s1

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Si hay varias slices (rodajas) y particiones, necesitar? modificar las
opciones de las dos ?rdenes anteriores. Deben coincidir con la slice y
tama?o de partici?n del otro disco.

.. raw:: html

   </div>

Utilice la utilidad
`newfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newfs&sektion=8>`__
para crear un sistema de ficheros predefinido en nodo de dispositivo
``gm0s1a``:

.. code:: screen

    # newfs -U /dev/mirror/gm0s1a

Esto deber?a haber hecho que el sistema mostrara alguna informaci?n y un
pu?ado de n?meros. Esto es bueno. Examine la pantalla por si hay alg?n
mensaje de error y monte el dispositivo en el punto de montaje ``/mnt``:

.. code:: screen

    # mount /dev/mirror/gm0s1a /mnt

Ahora mueva todos los datos del disco de arranque a este nuevo sistema
de ficheros. Este ejemplo usa las ?rdenes
`dump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dump&sektion=8>`__ y
`restore(8) <http://www.FreeBSD.org/cgi/man.cgi?query=restore&sektion=8>`__;
aunque,
`dd(1) <http://www.FreeBSD.org/cgi/man.cgi?query=dd&sektion=1>`__
tambi?n deber?a funcionar en este escenario. Evitamos utilizar
`tar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tar&sektion=1>`__
porque no copiar? el c?digo de arranque. De ese modo, el fallo estar?a
garantizado.

.. code:: screen

    # dump -L -0 -f- / |(cd /mnt && restore -r -v -f-)

Se debe hacer esto para cada sistema de ficheros. Simplemente ponga el
sistema de ficheros adecuado en la ubicaci?n correcta al ejecutar la
orden mencionada.

Ahora edite el fichero replicado ``/mnt/etc/fstab`` y elimine o comente
el fichero swap `:sup:`[12]` <#ftn.idp78735952>`__. Cambie la
informaci?n del otro sistema de ficheros para que utilice el nuevo
disco. Vea el siguiente ejemplo:

.. code:: programlisting

    # Device                Mountpoint      FStype  Options         Dump    Pass#
    #/dev/da0s2b             none            swap    sw              0       0
    /dev/mirror/gm0s1a       /               ufs     rw              1       1

Ahora cree un fichero ``boot.conf`` tanto en la partici?n actual como en
la nueva partici?n ra?z. Este fichero “ayudar?” al BIOS del sistema a
arrancar la unidad correcta:

.. code:: screen

    # echo "1:da(1,a)/boot/loader" > /boot.config

.. code:: screen

    # echo "1:da(1,a)/boot/loader" > /mnt/boot.config

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Lo hemos colcoado en ambas particiones ra?z para asegurar un arranque
correcto. Si por alguna raz?n el sistema no pudiera leer en la nueva
partici?n ra?z, est? disponible un arranque a prueba de fallos.

.. raw:: html

   </div>

Ahora agregue la siguiente l?nea al nuevo ``/boot/loader.conf``:

.. code:: screen

    # echo 'geom_mirror_load="YES"' >> /mnt/boot/loader.conf

Esto le dice a la utilidad
`loader(8) <http://www.FreeBSD.org/cgi/man.cgi?query=loader&sektion=8>`__
que cargue el ``geom_mirror.ko`` durante la inicializaci?n del sistema.

Reinicie el sistema:

.. code:: screen

    # shutdown -r now

Si todo ha ido bien, el sistema deber?a haber arrancado desde el
dispositivo ``gm0s1a``, y un prompt ``login`` deber?a estar a la espera.
Si algo fue mal, consulte la secci?n posterior de resoluci?n de
problemas. Ahora agregue el disco ``da0`` al dispositivo ``gm0``:

.. code:: screen

    # gmirror configure -a gm0
    # gmirror insert gm0 /dev/da0

La opci?n ``-a`` le dice a
`gmirror(8) <http://www.FreeBSD.org/cgi/man.cgi?query=gmirror&sektion=8>`__
que use sincronizaci?n autom?tica; por ejemplo, que replique las
escrituras en disco autom?ticamente. La p?gina de manual explica como
reconstruir y reemplazar discos, aunque utiliza ``data`` en vez de
``gm0``.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

19.4.1. Resoluci?n de problemas
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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

19.4.1.1. El sistema se niega a arrancar
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Si el sistema arranca hasta un prompt similar a:

.. code:: programlisting

    ffs_mountroot: can't find rootvp
    Root mount failed: 6
    mountroot>

Reinicie la m?quina utilizando el bot?n de encendido o el de reset. En
el men? de arranque, seleccione la opci?n seis (6). Esto llevar? al
sistema a un prompt de
`loader(8) <http://www.FreeBSD.org/cgi/man.cgi?query=loader&sektion=8>`__.
Cargue el m?dulo del n?cleo manualmente:

.. code:: screen

    OK? load geom_mirror.ko
    OK? boot

Si esto funciona, es que por alguna raz?n el m?dulo no se cargaba
correctamente. Ponga:

.. code:: programlisting

    options   GEOM_MIRROR

en el fichero de configuraci?n del n?cleo, recompile y reinstale. Esto
deber?a solucionar el problema.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="footnotes">

--------------

.. raw:: html

   <div id="ftn.idp78735952" class="footnote">

`:sup:`[12]` <#idp78735952>`__\ Debe advertirse que comentar la entrada
del fichero swap en ``fstab`` probablemente le obligar? a reestablecer
una manera diferente de habilitar el espacio de intercambio. Consulte
`Secci?n?11.4, “A?adir espacio swap” <adding-swap-space.html>`__ para
m?s informaci?n.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------+---------------------------+----------------------------------------------+
| `Anterior <GEOM-striping.html>`__?       | `Subir <GEOM.html>`__     | ?\ `Siguiente <vinum-vinum.html>`__          |
+------------------------------------------+---------------------------+----------------------------------------------+
| 19.3. RAID0 - Distribuci?n por bandas?   | `Inicio <index.html>`__   | ?Cap?tulo 20. El Gestor de Vol?menes Vinum   |
+------------------------------------------+---------------------------+----------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
