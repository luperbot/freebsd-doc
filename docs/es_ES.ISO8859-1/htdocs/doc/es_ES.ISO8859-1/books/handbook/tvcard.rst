====================================
7.5. Configuraci?n de tarjetas de TV
====================================

.. raw:: html

   <div class="navheader">

7.5. Configuraci?n de tarjetas de TV
`Anterior <video-playback.html>`__?
Cap?tulo 7. Multimedia
?\ `Siguiente <scanners.html>`__

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

7.5. Configuraci?n de tarjetas de TV
------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Texto original de Josef El-Rayes.

.. raw:: html

   </div>

.. raw:: html

   <div>

Ampliado y adaptado por Marc Fonvieille.

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

7.5.1. Introducci?n
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Las tarjetas de TV le permiten ver en su sistema emisiones de TV
tradicionales o incluso por cable. La mayor?a aceptan v?deo compuesto
mediante RCA o una entrada de S-video; algunas de estas tarjetas
incorporan tambi?n un sintonizador de radio FM.

FreeBSD puede utilizar tarjetas de TV PCI que tengan el chip Brooktree
Bt848/849/878/879 o el chip de captura de v?deo Conexant CN-878/Fusion
878a gracias al controlador
`bktr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bktr&sektion=4>`__.
Aseg?rese de que la tarjeta tiene un sintonizador que est? soportado:
consulte la lista de sintonizadores soportados que encontrar? en la
p?gina de manual de
`bktr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bktr&sektion=4>`__.

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

7.5.2. A?adir el controlador
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Poder usar la tarjeta tendr? que cargar el controlador
`bktr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bktr&sektion=4>`__.
Una forma de hacerlo es a?dir la siguiente l?nea al fichero
``/boot/loader.conf``:

.. code:: programlisting

    bktr_load="YES"

Tambi?n puede hacerlo compilando est?ticamente el soporte para la
tarjeta de TV en su kernel; a?ada las siguientes l?neas al fichero de
configuraci?n de su kernel:

.. code:: programlisting

    device  bktr
    device  iicbus
    device  iicbb
    device  smbus

Es necesario incluir todas esas lineas adicionales porque los
componentes de la tarjeta est?n conectados entre s? por un bus I2C.
Hecho esto compile e instale su nuevo kernel.

Una vez a?adido el soporte de la tarjeta al sistema tendr? que
reiniciar. Durante el arranque deber?an aparecer rastros de su tarjeta
de TV. Veamos un ejemplo:

.. code:: programlisting

    bktr0: <BrookTree 848A> mem 0xd7000000-0xd7000fff irq 10 at device 10.0 on pci0
    iicbb0: <I2C bit-banging driver> on bti2c0
    iicbus0: <Philips I2C bus> on iicbb0 master-only
    iicbus1: <Philips I2C bus> on iicbb0 master-only
    smbus0: <System Management Bus> on bti2c0
    bktr0: Pinnacle/Miro TV, Philips SECAM tuner.

Es obvio que estos mensajes ser?n distintos seg?n sea el hardware del
que se trate. Aseg?rese de que el sistema detecta correctamente el
sintonizador. Se puede sobreescribir alguno de los par?metros detectados
por el sistema mediante MIB
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
y opciones del fichero de configuraci?n del kernel. Si por ejemplo
quiere obligar al sintonizador para que se comporte como un Phillips
SECAM a?ada lo siguiente al fichero de configuraci?n de su kernel:

.. code:: programlisting

    options OVERRIDE_TUNER=6

Puede utilizar directamente
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__:

.. code:: screen

    # sysctl hw.bt848.tuner=6

Consulte en
`bktr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bktr&sektion=4>`__ y
en ``/usr/src/sys/conf/NOTES`` si necesita m?s detalles sobre las
opciones disponibles.

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

7.5.3. Aplicaciones ?tiles
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Tendr? que instalar una de estas aplicaciones para poder utilizar su
tarjeta de TV:

.. raw:: html

   <div class="itemizedlist">

-  `multimedia/fxtv <http://www.freebsd.org/cgi/url.cgi?ports/multimedia/fxtv/pkg-descr>`__
   ofrece ?TV en una ventana? y captura de imagen/sonido/v?deo.

-  `multimedia/xawtv <http://www.freebsd.org/cgi/url.cgi?ports/multimedia/xawtv/pkg-descr>`__:
   otra aplicaci?n de TV; ofrece lo mismo que fxtv.

-  `misc/alevt <http://www.freebsd.org/cgi/url.cgi?ports/misc/alevt/pkg-descr>`__
   decodifica y reproduce videotexto y teletexto.

-  `audio/xmradio <http://www.freebsd.org/cgi/url.cgi?ports/audio/xmradio/pkg-descr>`__
   permite utilizar el sintonizador de radio FM que incorporan algunas
   tarjetas de TV.

-  `audio/wmtune <http://www.freebsd.org/cgi/url.cgi?ports/audio/wmtune/pkg-descr>`__,
   una aplicaci?n de escritorio muy ?til para el uso de sintonizadores
   de radio.

.. raw:: html

   </div>

Hay m?s aplicaciones ?tiles en la Colecci?n de de Ports de FreeBSD.

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

7.5.4. Soluci?n de problemas
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Si tiene alg?n problema con su tarjeta de TV compruebe en primer lugar
que el chip de captura de v?deo y el sintonizador realmente funcionan
con el controlador
`bktr(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bktr&sektion=4>`__ y
si ha utilizado las opciones de configuraci?n m?s adecuadas. Si necesita
m?s ayuda o necesita respuestas sobre su tarjeta de TV puede recurrir a
la lista de correo
`freebsd-multimedia <http://lists.FreeBSD.org/mailman/listinfo/freebsd-multimedia>`__.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------+-------------------------------+------------------------------------+
| `Anterior <video-playback.html>`__?   | `Subir <multimedia.html>`__   | ?\ `Siguiente <scanners.html>`__   |
+---------------------------------------+-------------------------------+------------------------------------+
| 7.4. Reproducci?n de v?deo?           | `Inicio <index.html>`__       | ?7.6. Esc?neres de im?genes        |
+---------------------------------------+-------------------------------+------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
