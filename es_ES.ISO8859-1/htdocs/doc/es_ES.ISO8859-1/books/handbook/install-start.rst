=============================
2.4. Inicio de la instalaci?n
=============================

.. raw:: html

   <div class="navheader">

2.4. Inicio de la instalaci?n
`Anterior <install-pre.html>`__?
Cap?tulo 2. Instalaci?n de FreeBSD
?\ `Siguiente <using-sysinstall.html>`__

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

2.4. Inicio de la instalaci?n
-----------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="important" xmlns="">

Importante:
~~~~~~~~~~~

La instalaci?n no efect?a ning?n cambio en su disco o discos duros hasta
la aparici?n del siguiente mensaje:

.. code:: literallayout

    Last Chance: Are you SURE you want continue the installation?

    If you're running this on a disk with data you wish to save then WE
    STRONGLY ENCOURAGE YOU TO MAKE PROPER BACKUPS before proceeding!

    We can take no responsibility for lost disk contents!

Es decir:

.. code:: literallayout

    ?ltima oportunidad: ?Seguro que quiere seguir adelante con la instalaci?n?

    ?Si est? ejecutando este programa en un disco que contenga datos
    que quiera conservar LE RECOMENDAMOS ENCARECIDAMENTE QUE HAGA
    COPIAS DE SEGURIDAD FIABLES antes de proseguir!

    ?No podemos responsabilizarnos de datos perdidos!

El proceso de instalaci?n puede abandonarse en cualquier momento antes
de la advertencia final sin efectuar cambios en el contenido del disco
duro. Si advierte que ha configurado algo de forma incorrecta basta con
que apague su sistema y no estropear? nada.

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

2.4.1. El arranque
~~~~~~~~~~~~~~~~~~

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

2.4.1.1. El arranque en i386™
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="procedure">

#. Comience con su sistema apagado.

#. Arranque el sistema. Durante el arranque deber? mostrarse la opci?n
   para entrar en la BIOS, normalmente mediante las teclas **F2**,
   **F10**, **Del**, o **Alt**+**S**. Utilice la tecla o combinaci?n de
   las mismas que se le indique en pantalla. En algunos casos el sistema
   puede mostrar un gr?fico durante el arranque. Pulsar **Esc** suele
   disminuir en esos casos el tama?o del gr?fico y le permitir? ver los
   mensajes del arranque.

#. Encuentre el par?metro que controla desde qu? dispositivos arranca el
   sistema. Normalmente se llama ?Boot Order? y suele presentarse como
   una lista de dispositivos, como ``Floppy``, ``CDROM``,
   ``First Hard Disk``, etc.

   Si necesita disquetes de arranque aseg?rese de que selecciona la
   unidad correspondiente. Si va a arrancar desde CDROM, seleccione la
   unidad CDROM. En caso de duda consulte el manual que ven?a con su
   computadora y/o el de su placa base.

   Haga los cambios necesarios, guarde los cambios y salga. El sistema
   deber?a reiniciarse.

#. Si ha elegido arrancar desde disquete, tal y como se describe en
   `Secci?n?2.3.7, “Preparaci?n del medio de
   arranque” <install-pre.html#install-floppies>`__, uno de ellos ser?
   el primer disco de arranque, probablemente el que contiene
   ``kern.flp``. Introduzca ese disco en su unidad de disquetes.

   Si va a arrancar desde CDROM tendr? que arrancar el sistema e
   introducir el CDROM en cuanto tenga ocasi?n.

   Si su sistema arranca normalmente y carga el sistema operativo que ya
   est? instalado puede ocurrir alguna de estas cosas:

   .. raw:: html

      <div class="orderedlist">

   #. Los discos no se introdujeron lo suficientemente pronto en el
      proceso de arranque. D?jelos insertados y reinicie su sistema.

   #. Los cambios que hizo en la BIOS no han funcionado. Deber?a repetir
      los pasos previos hasta que d? con la opci?n correcta.

   #. Su BIOS en concreto no admite el arranque el arranque desde el
      medio que ha elegido.

   .. raw:: html

      </div>

#. FreeBSD comenzar? a arrancar. Si est? arrancando desde CDROM deber?a
   ver algo parecido a esto (se ha omitido la informaci?n de n?mero de
   versi?n):

   .. code:: screen

       Verifying DMI Pool Data ........
       Boot from ATAPI CD-ROM :
        1. FD 2.88MB  System Type-(00)
       Uncompressing ... done

       BTX loader 1.00 BTX version is 1.01
       Console: internal video/keyboard
       BIOS drive A: is disk0
       BIOS drive B: is disk1
       BIOS drive C: is disk2
       BIOS drive D: is disk3
       BIOS 639kB/261120kB available memory

       FreeBSD/i386 bootstrap loader, Revision 0.8

       /kernel text=0x277391 data=0x3268c+0x332a8 |

       |
       Hit [Enter] to boot immediately, or any other key for command prompt.
       Booting [kernel] in 9 seconds... _

   Si arranca desde floppy ver? algo parecido a esto (se ha omitido la
   informaci?n de n?mero de versi?n):

   .. code:: screen

       Verifying DMI Pool Data ........

       BTX loader 1.00  BTX version is 1.01
       Console: internal video/keyboard
       BIOS drive A: is disk0
       BIOS drive C: is disk1
       BIOS 639kB/261120kB available memory

       FreeBSD/i386 bootstrap loader, Revision 0.8

       /kernel text=0x277391 data=0x3268c+0x332a8 |

       Please insert MFS root floppy and press enter:

   Siga las instrucciones y extraiga el disco ``kern.flp`` disc, inserte
   el disco ``mfsroot.flp`` y pulse **Intro**.

#. Tanto si arranca desde disquete como CDROM el proceso de arranque
   llegar? a este punto:

   .. code:: screen

       Hit [Enter] to boot immediately, or any other key for command prompt.
       Booting [kernel] in 9 seconds... _

   Dicho y hecho: espere diez segundos o pulse **Enter**. Esto lanzar?
   el men? de configuraci?n del kernel.

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

2.4.1.2. Arranque en Alpha
^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="procedure">

#. Comience con su sistema apagado.

#. Encienda su computadora y espera un mensaje de arranque en el
   monitor.

#. Si va a arrancar desde disquetes, tal y como se describe en la
   `Secci?n?2.3.7, “Preparaci?n del medio de
   arranque” <install-pre.html#install-floppies>`__, uno de ellos ser?
   el primer disco de arranque, probablemente el que contiene
   ``kern.flp``. Ponga este disco en la unidad de disquetes y escriba el
   siguiente comando para lanzar el arranque desde el disco (corrija el
   nombre de su unidad de disquetes si fuera necesario):

   .. code:: screen

       >>>BOOT DVA0 -FLAGS '' -FILE ''

   Si va a arrancar desde CDROM introduzca el CDROM en la unidad y
   escriba el siguiente comando para iniciar la instalaci?n (corrija el
   nombre de la unidad correcta de CDROM si fuera necesario):

   .. code:: screen

       >>>BOOT DKA0 -FLAGS '' -FILE ''

#. FreeBSD comenzar? a arrancar. Si est? arrancando desde disquete
   llegado un cierto punto ver? usted este mensaje:

   .. code:: screen

       Please insert MFS root floppy and press enter:

   Siga las instrucciones del programa de instalaci?n y retire el disco
   ``kern.flp``, inserte el disco ``mfsroot.flp``\ y pulse **Intro**.

#. Tanto si arranc? desde disquete como desde CDROM el proceso de
   arranque llegar? a este punto:

   .. code:: screen

       Hit [Enter] to boot immediately, or any other key for command prompt.
       Booting [kernel] in 9 seconds... _

   Dicho y hecho: Espere diez segundos o pulse **Enter**. Esto iniciar?
   el men? de configuraci?n del kernel.

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

2.4.1.3. Arranque en Sparc64?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

La mayor?a de sistemas Sparc64? est?n configurados para arrancar
autom?ticamente desde disco. Si quiere instalar FreeBSD tendr? que
arrancar por red o desde un CDROM, lo que requiere que acceda a la PROM
(OpenFirmware).

Reinicie el sistema y espere hasta que aparezca el mensaje de arranque.
Depende del modelo, pero deber?a parecerse a este:

.. code:: screen

    Sun Blade 100 (UltraSPARC-IIe), Keyboard Present
    Copyright 1998-2001 Sun Microsystems, Inc.  All rights reserved.
    OpenBoot 4.2, 128 MB memory installed, Serial #51090132.
    Ethernet address 0:3:ba:b:92:d4, Host ID: 830b92d4.

Si en este punto su sistema arranca desde el disco pulse **L1**+**A** o
**Stop**+**A**, o env?e un\ ``BREAK`` desde la consola serie serial
console (usando, por ejemplo, ``~#`` en
`tip(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tip&sektion=1>`__ o
`cu(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cu&sektion=1>`__) para
as? recuperar el prompt de PROM. Tiene este aspecto:

.. code:: screen

    ok     
    ok {0} 

.. raw:: html

   <div class="calloutlist">

+--------------------------------------+--------------------------------------+
| `|1| <#prompt-single>`__             | Este es el prompt que ver? en        |
|                                      | sistemas con una sola CPU.           |
+--------------------------------------+--------------------------------------+
| `|2| <#prompt-smp>`__                | Este prompt se usa en sistemas SMP;  |
|                                      | el d?gito indica el n?mero de la CPU |
|                                      | activa.                              |
+--------------------------------------+--------------------------------------+

.. raw:: html

   </div>

Ponga el CDROM dentro de la unidad y tecl?e ``boot cdrom`` en el prompt
de la PROM.

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

2.4.2. Revisi?n de los resultados de la prueba de dispositivos
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Es posible revisar los ?ltimos cientos de l?neas que se han mostrado en
pantalla, pues se almacenan en un b?fer con ese prop?sito.

Pulse **Bloq Despl** (**Scroll Lock**) y ya puede revisar el b?fer. Para
moverse use las flechas o **ReP?g** y **AvP?g** (**PageUp** y
**PageDown** respectivamente). Pulse de nuevo **Bloq Despl** (**Scroll
Lock**) cuando quiera salir del b?fer.

Pru?belo, revise el texto que ha generado el kernel al probar los
dispositivos del sistema. Ver? un texto muy similar al de la
`Figura?2.1, “Ejemplo de resultado de prueba de
dispositivos” <install-start.html#install-dev-probe>`__, aunque en su
caso concreto se mostrar?n los dispositivos que tenga su sistema.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figura 2.1. Ejemplo de resultado de prueba de dispositivos

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. code:: screen

    avail memory = 253050880 (247120K bytes)
    Preloaded elf kernel "kernel" at 0xc0817000.
    Preloaded mfs_root "/mfsroot" at 0xc0817084.
    md0: Preloaded image </mfsroot> 4423680 bytes at 0xc03ddcd4

    md1: Malloc disk
    Using $PIR table, 4 entries at 0xc00fde60
    npx0: <math processor> on motherboard
    npx0: INT 16 interface
    pcib0: <Host to PCI bridge> on motherboard
    pci0: <PCI bus> on pcib0
    pcib1:<VIA 82C598MVP (Apollo MVP3) PCI-PCI (AGP) bridge> at device 1.0 on pci0
    pci1: <PCI bus> on pcib1
    pci1: <Matrox MGA G200 AGP graphics accelerator> at 0.0 irq 11
    isab0: <VIA 82C586 PCI-ISA bridge> at device 7.0 on pci0
    isa0: <iSA bus> on isab0
    atapci0: <VIA 82C586 ATA33 controller> port 0xe000-0xe00f at device 7.1 on pci0
    ata0: at 0x1f0 irq 14 on atapci0
    ata1: at 0x170 irq 15 on atapci0
    uhci0 <VIA 83C572 USB controller> port 0xe400-0xe41f irq 10 at device 7.2 on pci
    0
    usb0: <VIA 83572 USB controller> on uhci0
    usb0: USB revision 1.0
    uhub0: VIA UHCI root hub, class 9/0, rev 1.00/1.00, addr1
    uhub0: 2 ports with 2 removable, self powered
    pci0: <unknown card> (vendor=0x1106, dev=0x3040) at 7.3
    dc0: <ADMtek AN985 10/100BaseTX> port 0xe800-0xe8ff mem 0xdb000000-0xeb0003ff ir
    q 11 at device 8.0 on pci0
    dc0: Ethernet address: 00:04:5a:74:6b:b5
    miibus0: <MII bus> on dc0
    ukphy0: <Generic IEEE 802.3u media interface> on miibus0
    ukphy0: 10baseT, 10baseT-FDX, 100baseTX, 100baseTX-FDX, auto
    ed0: <NE2000 PCI Ethernet (RealTek 8029)> port 0xec00-0xec1f irq 9 at device 10.
    0 on pci0
    ed0 address 52:54:05:de:73:1b, type NE2000 (16 bit)
    isa0: too many dependant configs (8)
    isa0: unexpected small tag 14
    orm0: <Option ROM> at iomem 0xc0000-0xc7fff on isa0
    fdc0: <NEC 72065B or clone> at port 0x3f0-0x3f5,0x3f7 irq 6 drq2 on isa0
    fdc0: FIFO enabled, 8 bytes threshold
    fd0: <1440-KB 3.5” drive> on fdc0 drive 0
    atkbdc0: <Keyboard controller (i8042)> at port 0x60,0x64 on isa0
    atkbd0: <AT Keyboard> flags 0x1 irq1 on atkbdc0
    kbd0 at atkbd0
    psm0: <PS/2 Mouse> irq 12 on atkbdc0
    psm0: model Generic PS/@ mouse, device ID 0
    vga0: <Generic ISA VGA> at port 0x3c0-0x3df iomem 0xa0000-0xbffff on isa0
    sc0: <System console> at flags 0x100 on isa0
    sc0: VGA <16 virtual consoles, flags=0x300>
    sio0 at port 0x3f8-0x3ff irq 4 flags 0x10 on isa0
    sio0: type 16550A
    sio1 at port 0x2f8-0x2ff irq 3 on isa0
    sio1: type 16550A
    ppc0: <Parallel port> at port 0x378-0x37f irq 7 on isa0
    pppc0: SMC-like chipset (ECP/EPP/PS2/NIBBLE) in COMPATIBLE mode
    ppc0: FIFO with 16/16/15 bytes threshold
    plip0: <PLIP network interface> on ppbus0
    ad0: 8063MB <IBM-DHEA-38451> [16383/16/63] at ata0-master UDMA33
    acd0: CD-RW <LITE-ON LTR-1210B> at ata1-slave PIO4
    Mounting root from ufs:/dev/md0c
    /stand/sysinstall running as init on vty0

.. raw:: html

   </div>

.. raw:: html

   </div>

Compruebe cuidadosamente que FreeBSD haya encontrado todos los
dispositivos que debe encontrar. Si no se lista alg?n dispositivo
significa que FreeBSD no lo ha encontrado. Un `kernel
personalizado <kernelconfig.html>`__ le permitir? agregar al sistema el
soporte de dispositivos que no aparecen en el kernel\ ``GENERIC``, que
suele ser el caso de algunas tarjetas de sonido.

En FreeBSD?6.2 y versiones siguientes ver? tras la prueba de
dispositivos ver? lo que muestra la `Figura?2.2, “Men? de selecci?n de
pa?s” <install-start.html#config-country>`__. Utilice las flechas del
teclado para elegir pa?s, regi?n o grupo. Cuando acabe pulse **Intro**,
con lo que habr? elegido pa?s y esquema de teclado. En cualquier momento
puede salir de easily. It is also easy to exit the sysinstall y volver a
empezar.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figura 2.2. Men? de selecci?n de pa?s

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Men? de selecci?n de pa?s|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figura 2.3. Salir de Sysinstall

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Salir de Sysinstall|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Para salir de sysinstall utilice las flechas del teclado para
seleccionar Exit Install en el men? de la pantalla principal de
instalaci?n. Aparecer? el siguiente mensaje:

.. code:: screen

                          User Confirmation Requested
             Are you sure you wish to exit? The system will reboot
               (be sure to remove any floppies/CDs/DVDs from the drives).

                                [ Yes ]    No

Si pulsa [?Yes?] y no retira el CDROM durante el reinicio el programa de
instalaci?n comenzar? de nuevo.

Si est? arrancando desde disquetes tendr? que retirar el floppy
``boot.flp`` antes de reiniciar.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------------+----------------------------+--------------------------------------------+
| `Anterior <install-pre.html>`__?           | `Subir <install.html>`__   | ?\ `Siguiente <using-sysinstall.html>`__   |
+--------------------------------------------+----------------------------+--------------------------------------------+
| 2.3. Tareas anteriores a la instalaci?n?   | `Inicio <index.html>`__    | ?2.5. ?Qu? es sysinstall?                  |
+--------------------------------------------+----------------------------+--------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.

.. |1| image:: ./imagelib/callouts/1.png
.. |2| image:: ./imagelib/callouts/2.png
.. |Men? de selecci?n de pa?s| image:: install/config-country.png
.. |Salir de Sysinstall| image:: install/sysinstall-exit.png
