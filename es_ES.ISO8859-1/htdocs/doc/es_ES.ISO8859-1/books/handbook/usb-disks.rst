========================================
18.5. Dispositivos de almacenamiento USB
========================================

.. raw:: html

   <div class="navheader">

18.5. Dispositivos de almacenamiento USB
`Anterior <raid.html>`__?
Cap?tulo 18. Almacenamiento
?\ `Siguiente <creating-cds.html>`__

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

18.5. Dispositivos de almacenamiento USB
----------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Texto de Marc Fonvieille.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Hoy d?a hay una enorme cantidad de soluciones de almacenamiento
externoque usan el bus serie universal (USB): discos duros, “mecheros”
(o “l?pices”) USB, grabadoras de CD-R, etc. FreeBSD puede usar estos
dispositivos.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

18.5.1. Configuraci?n
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El controlador de dispositivos de almacenamiento masivo USB,
`umass(4) <http://www.FreeBSD.org/cgi/man.cgi?query=umass&sektion=4>`__,
ofrece soporte para dispositivos de almacenamiento USB. Si usa el kernel
``GENERIC`` no necesita cambiar nada en su configuraci?n. Si utiliza un
kernel personalizado aseg?rese de que su fichero de configuraci?n del
kernel contiene las siguientes l?neas:

.. code:: programlisting

    device scbus
    device da
    device pass
    device uhci
    device ohci
    device usb
    device umass

El controlador
`umass(4) <http://www.FreeBSD.org/cgi/man.cgi?query=umass&sektion=4>`__
usa el subsistema SCSI para acceder a los dispositivos de almacenamiento
USB y su dispositivo USB aparecer? en el sistema como dispositivo SCSI.
Dependiendo del chipset USB de su placa base s?lamente necesitar?
``device uhci`` o ``device ohci``; en cualquier caso tener los dos en el
fichero de configuraci?n del kernel no provocar? ning?n da?o. No olvide
compilar e instalar el nuevo kernel si hizo alguna modificaci?n.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Si su dispositivo USB es una grabadora CD-R o DVD el controlador SCSI
CD-ROM,
`cd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=cd&sektion=4>`__, debe
ser a?adirse al kernel mediante la siguiente l?nea:

.. code:: programlisting

    device cd

Dado que la grabadora aparece como una unidad SCSI no tiene que usar el
controlador
`atapicam(4) <http://www.FreeBSD.org/cgi/man.cgi?query=atapicam&sektion=4>`__
en la configuraci?n del kernel.

.. raw:: html

   </div>

En FreeBSD?5.X y en la rama 4.X desde FreeBSD?4.10-RELEASE el soporte
para controladores USB 2.0 se incorpora al sistema del siguiente modo:

.. code:: programlisting

    device ehci

Tenga en cuenta que
`uhci(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uhci&sektion=4>`__ y
`ohci(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ohci&sektion=4>`__
siguen siendo necesarios si quiere disponer de soporte para USB 1.X.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

En FreeBSD?4.X, El d?mon USB
(`usbd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=usbd&sektion=8>`__)
debe ejecutarse para poder ver ciertos tipos de dispositivo USB. Para
habilitarlo, a?ada ``usbd_enable="YES"`` en ``/etc/rc.conf`` y reinicie
la m?quina.

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

18.5.2. Prueba de la configuraci?n
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

La configuraci?n est? lista para probarse: conecte su dispositivo USB;
en el b?fer de mensajes del sistema
(`dmesg(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dmesg&sektion=8>`__),
la unidad debe aparecer como algo similar a esto:

.. code:: screen

    umass0: USB Solid state disk, rev 1.10/1.00, addr 2
    GEOM: create disk da0 dp=0xc2d74850
    da0 at umass-sim0 bus 0 target 0 lun 0
    da0: <Generic Traveling Disk 1.11> Removable Direct Access SCSI-2 device
    da0: 1.000MB/s transfers
    da0: 126MB (258048 512 byte sectors: 64H 32S/T 126C)

Obviamente la marca, el nodo de dispositivo (``da0``) y otros detalles
pueden diferir dependiendo de su hardware.

Ya que el dispositivo USB aparece como uno SCSI, puede usar
``camcontrol`` para ver una lista de dispositivos USB conectados al
sistema:

.. code:: screen

    # camcontrol devlist
    <Generic Traveling Disk 1.11>      at scbus0 target 0 lun 0 (da0,pass0)

Si la unidad tiene un sistema de ficheros puede montarla. La
`Secci?n?18.3, “A?adir discos” <disks-adding.html>`__ contiene
informaci?n que le resultar? muy ?til para formatear y crear particiones
en el disco USB en caso de necesitarlo.

Si desconecta el dispositivo (el disco debe desmontarse previamente),
deber?a ver en el b?fer de mensajes del sistema algo parecido a esto:

.. code:: screen

    umass0: at uhub0 port 1 (addr 2) disconnected
    (da0:umass-sim0:0:0:0): lost device
    (da0:umass-sim0:0:0:0): removing device entry
    GEOM: destroy disk da0 dp=0xc2d74850
    umass0: detached

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

18.5.3. Lecturas recomendadas
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Ademas de las secciones `C?mo a?adir discos <disks-adding.html>`__ y
`Montado y desmontado de sistemas ficheros <mount-unmount.html>`__,
consulte las siguientes p?ginas man:
`umass(4) <http://www.FreeBSD.org/cgi/man.cgi?query=umass&sektion=4>`__,
`camcontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=camcontrol&sektion=8>`__
y
`usbdevs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=usbdevs&sektion=8>`__.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------+---------------------------+------------------------------------------------+
| `Anterior <raid.html>`__?   | `Subir <disks.html>`__    | ?\ `Siguiente <creating-cds.html>`__           |
+-----------------------------+---------------------------+------------------------------------------------+
| 18.4. RAID?                 | `Inicio <index.html>`__   | ?18.6. Creaci?n y uso de medios ?pticos (CD)   |
+-----------------------------+---------------------------+------------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
