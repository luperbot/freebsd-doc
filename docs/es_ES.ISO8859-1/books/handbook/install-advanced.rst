==================================
2.12. Gu?a avanzada de instalaci?n
==================================

.. raw:: html

   <div class="navheader">

2.12. Gu?a avanzada de instalaci?n
`Anterior <install-trouble.html>`__?
Cap?tulo 2. Instalaci?n de FreeBSD
?\ `Siguiente <install-diff-media.html>`__

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

2.12. Gu?a avanzada de instalaci?n
----------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Escrito por Valentino Vaschetto.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This section describes how to install FreeBSD in exceptional cases.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.12.1. Instalaci?n de FreeBSD en un sistema sin monitor o teclado
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Es posible instalar FreeBSD en m?quinas que no tengan teclado ni
siquiera monitor conectado. De hecho no tienen por qu? tener ni salida
VGA. ?C?mo es posible?, se preguntar?: Haciendolo todo a trav?s de una
consola serie. Una consola serie consiste b?sicamente en usar otro
sistema como la pantalla y el teclado de una m?quina. Siga las
instrucciones de creaci?n de los disquetes que se detallan en la
`Secci?n?2.3.7, “Preparaci?n del medio de
arranque” <install-pre.html#install-floppies>`__.

Tendr? que modificar esos disquetes para que arranquen en la consola
serie; siga estas instrucciones:

.. raw:: html

   <div class="procedure">

#. **Modificaci?n de los disquetes de arranque para que permitan el
   arranque en la consola serie**

   Si arrancara con los disquetes que acaba de crear FreeBSD arrancar?a
   en el modo normal de instalaci?n. Lo que queremos es que FreeBSD
   arranque en una consola serie, as? que hemos de montar el disquete
   ``kern.flp`` en un sistema FreeBSD mediante
   `mount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount&sektion=8>`__.

   .. code:: screen

       # mount /dev/fd0 /mnt

   Una vez montado el disquete entre en el directorio ``/mnt``?:

   .. code:: screen

       # cd /mnt

   Aqu? es donde ense?aremos al disquete a arrancar en la consola serie.
   Debe crearse un fichero llamado ``boot.config`` que contenga lo
   siguiente: ``/boot/loader -h``. Con esto le pasamos cargador de
   arranque (el ?bootloader?) el par?metro necesario para que intente
   arrancar en una consola serie.

   .. code:: screen

       # echo "/boot/loader -h" > boot.config

   Una vez configurado correctamente nuestro disquete lo desmontamos con
   `umount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=umount&sektion=8>`__:

   .. code:: screen

       # cd /
       # umount /mnt

   Y podemos extraer el disquete de la unidad.

#. **Conexi?n del cable modem**

   Tiene que conectar un `cable m?dem
   nulo <serial.html#term-cables-null>`__ entre dos m?quinas. *Un cable
   serie normal no funcionar?*, necesitar? un cable m?dem nulo porque
   tiene cruzado alguno de los hilos.

#. **Arranque de la instalaci?n**

   Podemos iniciar la instalaci?n. Introduzca el disquete ``kern.flp``
   en la unidad de disquetes de la m?quina en la que quiere hacer la
   instalaci?n y encienda la m?quina.

#. **La conexi?n a su m?quina sin teclado ni monitor**

   Con?ctese usando
   `cu(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cu&sektion=1>`__:

   .. code:: screen

       # cu -l /dev/cuaa0

.. raw:: html

   </div>

?Ya est?! Desde este momento ya puede controlar su m?quina sin monitor
ni teclado desde la sesi?n ``cu`` que acaba de abrir. El sistema le
pedir? que introduzca el disco ``kern1.flp`` y despu?s tendr? que elegir
qu? tipo de terminal va a utilizar. Elija la consola en color de FreeBSD
y buena suerte con la instalaci?n.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------+----------------------------+-------------------------------------------------------+
| `Anterior <install-trouble.html>`__?   | `Subir <install.html>`__   | ?\ `Siguiente <install-diff-media.html>`__            |
+----------------------------------------+----------------------------+-------------------------------------------------------+
| 2.11. Soluci?n de problemas?           | `Inicio <index.html>`__    | ?2.13. C?mo preparar su propio medio de instalaci?n   |
+----------------------------------------+----------------------------+-------------------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
