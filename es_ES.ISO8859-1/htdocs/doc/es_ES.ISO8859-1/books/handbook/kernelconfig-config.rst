================================
8.6. El fichero de configuraci?n
================================

.. raw:: html

   <div class="navheader">

8.6. El fichero de configuraci?n
`Anterior <kernelconfig-building.html>`__?
Cap?tulo 8. Configuraci?n del kernel de FreeBSD
?\ `Siguiente <kernelconfig-trouble.html>`__

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

8.6. El fichero de configuraci?n
--------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Actualizado a FreeBSD 6.X por Joel Dahl.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El formato de un fichero de configuraci?n es bastante simple. Cada l?nea
contiene una palabra clave con uno o m?s argumentos. Para simplificar,
hay muchas l?neas que solamente contienen un argumento. Cualquier cosa
detr?s de un ``#`` se considerar? un comentario y en consecuencia ser?
ignorado. Las siguientes secciones describen todas las palabras clave en
el orden en el que aparecen en ``GENERIC``. Si quiere una lista
exhaustiva de de opciones dependientes de arquitectura y de dispositivos
puede consultar el fichero ``NOTES`` en el mismo directorio donde est?
el fichero ``GENERIC``. Si quiere ver las opciones independientes de
arquitectura consulte ``/usr/src/sys/conf/NOTES``.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Puede generar un fichero que contenga todas las opciones disponibles en
un kernel. Esto es algo que solamente se usa para hacer pruebas. Si
quiere generarlo ejecute, como ``root``, lo siguiente:

.. code:: screen

    # cd /usr/src/sys/i386/conf && make LINT

.. raw:: html

   </div>

A continuaci?n veremos un ejemplo de fichero de configuraci?n de un
kernel ``GENERIC`` al que se han a?adido comentarios adicionales donde
se ha visto que era necesario abundar un poco para mayor claridad. Este
ejemplo es igual (o, en el peor de los casos, casi igual) que la copia
del mismo que tiene usted en ``/usr/src/sys/i386/conf/GENERIC``.

.. code:: programlisting

    machine     i386

Esta es la arquitectura de la m?quina. Debe ser ``alpha``, ``amd64``,
``i386``, ``ia64``, ``pc98``, ``powerpc`` o ``sparc64``.

.. code:: programlisting

    cpu          I486_CPU
    cpu          I586_CPU
    cpu          I686_CPU

Las opciones anteriores definen el tipo de CPU que haya en su sistema.
Puede dejar varias l?neas de CPU (si, por ejemplo, no est? seguro de
usar ``I586_CPU`` o ``I686_CPU``), pero si est? personalizando su kernel
es mucho mejor que solamente ponga la CPU que tenga. Si no est? seguro
de la CPU que tiene busque en los mensajes de arranque que se guardan en
``/var/run/dmesg.boot``.

.. code:: programlisting

    ident          GENERIC

Este es el identificador del kernel. Modif?quelo para que cuadre con el
nombre que le haya dado a su kernel, es decir, ``MIKERNEL`` si ha
seguido los ejemplos anteriores. El valor que asigne a la cadena
``ident`` ser? el que se muestre cuando arranque con su kernel, as? que
es ?til darle a su kernel un nombre distintivo que permita distinguirlo
f?cilmente de otros, por ejemplo, si est? compilando un kernel
experimental.

.. code:: programlisting

    #To statically compile in device wiring instead of /boot/device.hints
    #hints          "GENERIC.hints"         # Default places to look for devices.

`device.hints(5) <http://www.FreeBSD.org/cgi/man.cgi?query=device.hints&sektion=5>`__
se usa para configurar opciones de controladores de dispositivo. La
ubicaci?n por defecto en la que
`loader(8) <http://www.FreeBSD.org/cgi/man.cgi?query=loader&sektion=8>`__
buscar? durante el arranque es ``/boot/device.hints``. Si usa la opci?n
``hints`` puede compilar el contenido de ``device.hints`` en su kernel,
lo que har? innecesario crear ese fichero en ``/boot``.

.. code:: programlisting

    makeoptions     DEBUG=-g          # Build kernel with gdb(1) debug symbols

El proceso normal de compilaci?n en FreeBSD incluye informaci?n de
depuraci?n de errores si se compila un kernel con la opci?n ``-g``, que
activa la informaci?n de depuraci?n de errores al pasar a
`gcc(1) <http://www.FreeBSD.org/cgi/man.cgi?query=gcc&sektion=1>`__.

.. code:: programlisting

    options          SCHED_4BSD         # 4BSD scheduler

El planificador de tareas tradicional y por omisi?n de FreeBSD. D?jelo
como est?.

.. code:: programlisting

    options          PREEMPTION         # Enable kernel thread preemption

Permite que hilos que est?n en el kernel puedan asociarse con hilos cuya
prioridad sea m?s alta. Ayuda con la interactividad y permite que los
hilos interrumpidos puedan ejecutarse antes en lugar de tener que
esperar.

.. code:: programlisting

    options          INET              # InterNETworking

Networking. Deje esto como est?, incluso si no tiene en mente conectar
la m?quina a una red. Muchos programas necesitan al menos disponer de lo
que se llama ?loopback networking? (esto es, poder efectuar conexiones
de red con su propia m?quina) as? que tener esto es obligatorio.

.. code:: programlisting

    options          INET6             # IPv6 communications protocols

Activa los protocolos de comunicaci?n IPv6.

.. code:: programlisting

    options          FFS               # Berkeley Fast Filesystem

El sistema de ficheros b?sico para discos duros. Debe dejarlo como est?
si pretende poder arrancar desde disco duro.

.. code:: programlisting

    options          SOFTUPDATES       # Enable FFS Soft Updates support

Activa Soft Updates en el kernel, lo que acelerar? los accesos de
escritura a sus discos. Esta funcionalidad la facilita el kernel, pero
debe activarse para cada disco de forma espec?fica. Revise la salida de
`mount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount&sektion=8>`__
y ver? si Soft Updates est? activado en los discos de su sistema. Si no
aparece la opci?n ``soft-updates`` act?vela mediante
`tunefs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=tunefs&sektion=8>`__
(para sistemas de ficheros ya existentes) o
`newfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newfs&sektion=8>`__
(en el caso de sistemas de ficheros nuevos).

.. code:: programlisting

    options          UFS_ACL           # Support for access control lists

Esta opci?n activa en el kernel las listas de control de acceso.
Consiste en el uso de atributos extendidos y UFS2 junto con las
caracter?sticas que se describen detalladamente en la `Secci?n?14.12,
“Listas de control de acceso a sistemas de ficheros” <fs-acl.html>`__.
Las ACL por omisi?n est?n activadas, y no deben desactivarse del kernel
una vez que hayan sido usadas en un sistema de ficheros puesto que
eliminar? las listas de control de acceso y el modo en el que se
protegen esos ficheros de un modo totalmente fuera de control.

.. code:: programlisting

    options          UFS_DIRHASH       # Improve performance on big directories

This option includes functionality to speed up disk operations on large
directories, at the expense of using additional memory. You would
normally keep this for a large server, or interactive workstation, and
remove it if you are using FreeBSD on a smaller system where memory is
at a premium and disk access speed is less important, such as a
firewall.

.. code:: programlisting

    options          MD_ROOT           # MD is a potential root device

Esta opci?n permite que la partici?n ra?z est? en un disco virtual
basado en memoria.

.. code:: programlisting

    options          NFSCLIENT         # Network Filesystem Client
    options          NFSSERVER         # Network Filesystem Server
    options          NFS_ROOT          # NFS usable as /, requires NFSCLIENT

NFS, el sistema de ficheros en red. Salvo que tenga intenci?n de montar
particiones de sistemas de ficheros UNIX? de un servidor a trav?s de
TCP/IP puede comentar estas opciones.

.. code:: programlisting

    options          MSDOSFS           # MSDOS Filesystem

El sistema de ficheros MS-DOS?. Salvo que tenga en mente montar
particiones de disco duro con formato DOS durante el arranque puede
comentar esta opci?n. En caso de necesidad esta funcionalidad se cargar?
autom?ticamente. Tambi?n tiene a su
`emulators/mtools <http://www.freebsd.org/cgi/url.cgi?ports/emulators/mtools/pkg-descr>`__,
que le permitir? acceder a disquetes DOS sin tener que montarlos y
desmontarlos (y ni siquiera requiere ``MSDOSFS``).

.. code:: programlisting

    options          CD9660            # ISO 9660 Filesystem

El sistema de ficheros ISO 9660 para CDROM. Com?ntelo si no tiene unidad
CDROM o solamente monta CD muy de vez en cuando; cuando lo necesite el
sistema lo cargar? din?micamente. Los CD de sonido no utilizan este
sistema de ficheros.

.. code:: programlisting

    options          PROCFS            # Process filesystem (requires PSEUDOFS)

El sistema de ficheros de procesos. Es un sistema de ficheros “simulado”
que se monta en ``/proc`` y permite a programas como
`ps(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ps&sektion=1>`__
suministrar m?s informaci?n sobre qu? procesos est?n ejecut?ndose. En la
mayoar?a de los casos no es necesario usar ``PROCFS``, puesto que la
mayor?a de las herramientas de monitorizaci?n y depuraci?n han sido
adaptadas para que funcionen sin ``PROCFS``. De hecho aunque lo instale
el sistema no lo montar? por omisi?n.

.. code:: programlisting

    options          PSEUDOFS          # Pseudo-filesystem framework

Los kernel 6.X pueden usar ``PSEUDOFS`` al utilizar ``PROCFS``.

.. code:: programlisting

    options          GEOM_GPT          # GUID Partition Tables.

Con esta opci?n se puede tener una gran cantidad de particiones en un
?nico disco.

.. code:: programlisting

    options          COMPAT_43         # Compatible with BSD 4.3 [KEEP THIS!]

Compatibilidad con 4.3BSD. D?jelo como est?; ciertos programas pueden
comportarse de formas muy extra?as si comenta esta opci?n.

.. code:: programlisting

    options          COMPAT_FREEBSD4   # Compatible with FreeBSD4

FreeBSD?5.X en sistemas i386™ y Alpha necesita esta opci?n para poder
usar aplicaciones compiladas en versiones antiguas de FreeBSD que
utilizan, por tanto, llamadas al sistema m?s antiguas. Esta opci?n no es
necesaria en plataformas en las que funciona FreeBSD desde 5.X, como
ia64 y Sparc64?.

.. code:: programlisting

    options          COMPAT_FREEBSD5   # Compatible with FreeBSD5

Esta opci?n hace falta en sistemas FreeBSD?6.X y versiones posteriores
para poder ejecutar aplicaciones compiladas en FreeBSD?5.X, que usan
interfaces de llamada al sistema FreeBSD?5.X.

.. code:: programlisting

    options          SCSI_DELAY=5000  # Delay (in ms) before probing SCSI

Hace que el kernel haga una pausa de 5 segundos antes de probar los
dispositivos SCSI del sistema. Si solamente tiene discos IDE puede
ignorar esta opci?n, o tambi?n puede asignarle un valor menos para
evitar el retardo en el arranque. Si lo hace y FreeBSD tiene problemas
para reconocer dispositivos SCSI en el sistema es obvio que tendr? que
incrementar el valor.

.. code:: programlisting

    options          KTRACE            # ktrace(1) support

Activa las trazas en el kernel, algo muy ?til para la depuraci?n de
errores.

.. code:: programlisting

    options          SYSVSHM           # SYSV-style shared memory

Facilita memoria compartida System?V. El uso m?s habitual es la
extensi?n XSHM de X, que utiliza la mayor?a de programas que hacen uso
intensivo de los gr?ficos para incrementar la velocidad. Si usa X es
casi seguro que le vendr? bien esta opci?n.

.. code:: programlisting

    options          SYSVMSG           # SYSV-style message queues

Mensajes System?V. Esta opci?n a?ade solamente unos cuantos bytes al
kernel.

.. code:: programlisting

    options          SYSVSEM           # SYSV-style semaphores

Sem?foros System?V. No es demasiado frecuente que se utilicen, pero
solamente a?aden unos cuantos cientos de bytes al kernel.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

La opci?n ``-p`` de
`ipcs(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ipcs&sektion=1>`__ le
mostrar? una lista de procesos que est?n utilizando caracter?sticas
System?V.

.. raw:: html

   </div>

.. code:: programlisting

    options       _KPOSIX_PRIORITY_SCHEDULING # POSIX P1003_1B real-time extensions

Extensiones en tiempo real a?adidas en 1993 POSIX?. Ciertas aplicaciones
de la Colecci?n de Ports las utilizan, por ejemplo StarOffice™.

.. code:: programlisting

    options          KBD_INSTALL_CDEV  # install a CDEV entry in /dev

This option is required to allow the creation of keyboard device nodes
in ``/dev``.

.. code:: programlisting

    options          ADAPTIVE_GIANT    # Giant mutex is adaptive.

Giant es un mecanismo de exclusi?n mutua (?sleep mutex?) que protege un
gran conjunto de recursos del kernel. Hoy en dia no es asumible tener un
cuello de botella as? por el impacto que tiene en el rendimiento, as?
que est? siendo reemplazado por bloqueos que protegen los recursos de
manera individual. ``ADAPTIVE_GIANT`` hace que Giant sea incluido en un
conjunto de ?mutextes? que va rotando Esto es, cuando un hilo quiere
bloquear el Giant mutex (pero ya est? bloqueado por un hilo de otra CPU)
el primer hilo seguir? ejecut?ndose a la espera de que se libere el
bloqueo. Generalmente el hilo volver? al estado de reposo y esperar?
hasta que aparezca otra oportunidad de ejecutarse. Si no est? seguro de
lo que est? haciendo es mejor que deje esta opci?n tal y como est?.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Tenga en cuenta que en FreeBSD?8.0-CURRENT y versiones siguientes todos
los ?mutexes? son adaptables por omisi?n, salvo que se use la opci?n
``NO_ADAPTIVE_MUTEXES``. El resultado evidente que es Giant es adaptable
por omisi?n, as? que la opci?n ``ADAPTIVE_GIANT`` ha sido eliminada de
la configuraci?n.

.. raw:: html

   </div>

.. code:: programlisting

    device          apic               # I/O APIC

El dispositivo apic activa la E/S APIC en la entrega de interrupciones.
El dispositivo apic puede usarse tanto en kernels para un procesador
(UP) como para sistemas multiprocesador (SMP). Si a?ada ``options SMP``
funcionar? en sistemas multiprocesador.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

El dispositivo apic existe solamente en la arquitectura i386, de modo
que no debe usarse esta l?nea en otras arquitecturas.

.. raw:: html

   </div>

.. code:: programlisting

    device          eisa

Use esta opci?n si tiene una placa base EISA. Activa la detecci?n
autom?tica y permite la configuraci?n de todos los dispositivos que
est?n en el bus EISA.

.. code:: programlisting

    device          pci

Use esta opci?n si tiene una placa PCI. Permite la detecci?n autom?tica
de tarjetas PCI y permite la configuraci?n entre el bus ISA y el PCI.

.. code:: programlisting

    # Floppy drives
    device          fdc

Este dispositivo es el controlador de la unidad de disquetes.

.. code:: programlisting

    # ATA and ATAPI devices
    device          ata

Este controlador permite utilizar dispositivos ATA y ATAPI. Si a?ade al
kernel one ``device ata`` ?ste detectar? cualquier dispositivo ATA/ATAPI
PCI que conecte a una m?quina moderna.

.. code:: programlisting

    device          atadisk                 # ATA disk drives

Si usa ``device ata`` tendr? que a?adir tambi?n esto para poder usar
unidades de disco ATA.

.. code:: programlisting

    device          ataraid                 # ATA RAID drives

Si usa ``device ata`` tendr? que a?adir tambi?n esto para poder usar
unidades de disco ATA RAID.

.. code:: programlisting

    device          atapicd                 # ATAPI CDROM drives

Si usa ``device ata`` tendr? que a?adir tambi?n esto para poder usar
unidades ATAPI CDROM.

.. code:: programlisting

    device          atapifd                 # ATAPI floppy drives

Si usa ``device ata`` tendr? que a?adir tambi?n esto para poder usar
unidades de disquete ATAPI.

.. code:: programlisting

    device          atapist                 # ATAPI tape drives

Si usa ``device ata`` tendr? que a?adir tambi?n esto para poder usar
unidades de cinta ATAPI.

.. code:: programlisting

    options         ATA_STATIC_ID           # Static device numbering

Con esta opci?n hace que el n?mero de controladores sea est?tico; si no
se usa los n?meros de dispositivo se asignan din?micamente.

.. code:: programlisting

    # SCSI Controllers
    device          ahb        # EISA AHA1742 family
    device          ahc        # AHA2940 and onboard AIC7xxx devices
    options         AHC_REG_PRETTY_PRINT    # Print register bitfields in debug
                                            # output.  Adds ~128k to driver.
    device          ahd        # AHA39320/29320 and onboard AIC79xx devices
    options         AHD_REG_PRETTY_PRINT    # Print register bitfields in debug
                                            # output.  Adds ~215k to driver.
    device          amd        # AMD 53C974 (Teckram DC-390(T))
    device          isp        # Qlogic family
    #device         ispfw      # Firmware for QLogic HBAs- normally a module
    device          mpt        # LSI-Logic MPT-Fusion
    #device         ncr        # NCR/Symbios Logic
    device          sym        # NCR/Symbios Logic (newer chipsets + those of `ncr')
    device          trm        # Tekram DC395U/UW/F DC315U adapters

    device          adv        # Advansys SCSI adapters
    device          adw        # Advansys wide SCSI adapters
    device          aha        # Adaptec 154x SCSI adapters
    device          aic        # Adaptec 15[012]x SCSI adapters, AIC-6[23]60.
    device          bt         # Buslogic/Mylex MultiMaster SCSI adapters

    device          ncv        # NCR 53C500
    device          nsp        # Workbit Ninja SCSI-3
    device          stg        # TMC 18C30/18C50

Controladoras SCSI. Com?ntelas si no las tiene en su sistema. Si en su
sistema tiene solamente unidades IDE puede borrarlas todas. Las l?neas
``*_REG_PRETTY_PRINT`` son opciones de depuraci?n de errores de sus
respectivos controladores de dispositivo.

.. code:: programlisting

    # SCSI peripherals
    device          scbus      # SCSI bus (required for SCSI)
    device          ch         # SCSI media changers
    device          da         # Direct Access (disks)
    device          sa         # Sequential Access (tape etc)
    device          cd         # CD
    device          pass       # Passthrough device (direct SCSI access)
    device          ses        # SCSI Environmental Services (and SAF-TE)

Perif?ricos SCSI. Estos tambi?n puede borrarlos sin problemas si no los
tiene en su sistema o si solamente tiene hardware IDE.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

El controlador USB
`umass(4) <http://www.FreeBSD.org/cgi/man.cgi?query=umass&sektion=4>`__
(y unos cuantos controladores m?s) utilizan el subsistema SCSI aunque no
sean dispositivos SCSI reales. No elimine el subsistema SCSI del kernel
si va a utilizar cualquiera de estos controladores.

.. raw:: html

   </div>

.. code:: programlisting

    # RAID controllers interfaced to the SCSI subsystem
    device          amr        # AMI MegaRAID
    device          arcmsr     # Areca SATA II RAID
    device          asr        # DPT SmartRAID V, VI and Adaptec SCSI RAID
    device          ciss       # Compaq Smart RAID 5*
    device          dpt        # DPT Smartcache III, IV - See NOTES for options
    device          hptmv      # Highpoint RocketRAID 182x
    device          rr232x     # Highpoint RocketRAID 232x
    device          iir        # Intel Integrated RAID
    device          ips        # IBM (Adaptec) ServeRAID
    device          mly        # Mylex AcceleRAID/eXtremeRAID
    device          twa        # 3ware 9000 series PATA/SATA RAID

    # RAID controllers
    device          aac        # Adaptec FSA RAID
    device          aacp       # SCSI passthrough for aac (requires CAM)
    device          ida        # Compaq Smart RAID
    device          mfi        # LSI MegaRAID SAS
    device          mlx        # Mylex DAC960 family
    device          pst        # Promise Supertrak SX6000
    device          twe        # 3ware ATA RAID

Controladoras RAID que pueden utilizarse en FreeBSD. Si no las tiene en
su sistema puede borrarlas.

.. code:: programlisting

    # atkbdc0 controls both the keyboard and the PS/2 mouse
    device          atkbdc     # AT keyboard controller

El controlador de teclado (``atkbdc``) ofrece servicios de E/S con
teclados AT y ratones PS/2. El controlador de teclado (``atkbd``) y el
controlador de rat?n PS/2 (``psm``) necesitan este dispositivo.

.. code:: programlisting

    device          atkbd      # AT keyboard

El controlador ``atkbd``, junto con el controlador ``atkbdc``, permiten
utilizar el teclado AT 84 u otros tipos de teclados AT mejorados que se
conecten mediante el controlador de teclado AT.

.. code:: programlisting

    device          psm        # PS/2 mouse

Utilice este dispositivo si conecta su rat?n en el puerto PS/2.

.. code:: programlisting

    device          kbdmux        # keyboard multiplexer

Funcionalidad b?sica para m?ltiples teclados. Si no tiene en mente usar
m?s de un teclado en el sistema puede borrar esta l?nea sin mayor
problema.

.. code:: programlisting

    device          vga        # VGA video card driver

El controlador de la tarjeta gr?fica.

.. code:: programlisting

    device          splash     # Splash screen and screen saver support

?Splash screen? en el arranque. Los salvapantallas necesitan este
dispositivo.

.. code:: programlisting

    # syscons is the default console driver, resembling an SCO console
    device          sc

``sc`` por omisi?n es el controlador de dispositivo de la consola; se
parece mucho a una consola de SCO. Dado que muchos programas de pantalla
completa acceden a la consola a trav?s de la biblioteca de bases de
datos de terminal ``termcap`` no tiene demasiada importancia si usa
``vt``, el controlador de consola compatible ``VT220``. Cuando acceda al
sistema asigne a su variable ``TERM`` el valor ``scoansi``\ si los
programas a pantalla completa tienen alg?n problema para acceder a la
consola.

.. code:: programlisting

    # Enable this for the pcvt (VT220 compatible) console driver
    #device          vt
    #options         XSERVER          # support for X server on a vt console
    #options         FAT_CURSOR       # start with block cursor

El controlador de dispositivo VT220-compatible; es compatible con
VT100/102, anterior a ?l. Funciona bien en ciertos sistemas port?tiles
que adolecen de incompatibilidad de harware con ``sc``. Asigne a su
variable de entorno ``TERM`` el valor ``vt100`` o ``vt220`` cuando
acceda al sistema. Este controlador le puede ser de utilidad si tiene
que acceder a gran cantidad de m?quinas a trav?s de una red, una
situaci?n en la que suele suceder que ``termcap`` o ``terminfo`` no
est?n ah? para que las use ``sc``. ``vt100``, por el contrario, deber?a
aparecer en pr?ticamente cualquier plataforma.

.. code:: programlisting

    device          agp

Utilice esta opci?n si tiene en el sistema una tarjeta AGP. Activar? AGP
y tambi?n AGP GART si su tarjeta puede usarla.

.. code:: programlisting

    # Power management support (see NOTES for more options)
    #device          apm

Gesti?n avanzada de la energ?a. Muy ?til en sistemas port?tiles. Viene
desactivada por omisi?n en el kernel ``GENERIC`` .

.. code:: programlisting

    # Add suspend/resume support for the i8254.
    device           pmtimer

Controlador del reloj para eventos de gesti?n de la energ?a, como APM y
ACPI.

.. code:: programlisting

    # PCCARD (PCMCIA) support
    # PCMCIA and cardbus bridge support
    device          cbb               # cardbus (yenta) bridge
    device          pccard            # PC Card (16-bit) bus
    device          cardbus           # CardBus (32-bit) bus

Dispositivos PCMCIA. Si el sistema es port?til necesita tener esto
activado.

.. code:: programlisting

    # Serial (COM) ports
    device          sio               # 8250, 16[45]50 based serial ports

Estos son los puertos serie a los que se conoce como puertos ``COM`` en
entornos MS-DOS?/Windows?.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Si tiene un m?dem interno en ``COM4`` un puerto serie en ``COM2`` tendr?
que asignar a la IRQ del m?dem el 2 (por razones t?cnicas ignotas IRQ2 =
IRQ 9) para que pueda acceder al dispositivo desde FreeBSD. Si tiene una
tarjeta serie multipuerto consulte la p?gina de manual de
`sio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sio&sektion=4>`__ si
quiere m?s detalles sobre los valores que debe a?adir a
``/boot/device.hints``. Algunas tarjetas gr?ficas (sobre todo las que
usan chips S3) utilizan direcciones IO del tipo ``0x*2e8`` y dado que
muchas tarjetas serie de baja calidad no decodifican correctamente el
espacio de direcciones de 16 bits chocan con estas tarjetas, haciendo
que el puerto ``COM4`` sea pr?cticamente in?til.

Es necesario que cada puerto serie tenga una IRQ ?nica (salvo que use
una tarjeta multipuerto que permita compartir interrupciones), as? que
las IRQ de ``COM3`` y de ``COM4`` no se pueden utilizar.

.. raw:: html

   </div>

.. code:: programlisting

    # Parallel port
    device          ppc

El interfaz del puerto paralelo de bus ISA.

.. code:: programlisting

    device          ppbus      # Parallel port bus (required)

El bus del puerto paralelo.

.. code:: programlisting

    device          lpt        # Printer

Permite usar el puerto paralelo para conectar impresoras.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Necesitar? disponer de los tres anteriores para poder utilizar
impresoras mediante el puerto paralelo.

.. raw:: html

   </div>

.. code:: programlisting

    device          plip       # TCP/IP over parallel

Este controlador es para la interfaz de red a trav?s del puerto
paralelo.

.. code:: programlisting

    device          ppi        # Parallel port interface device

La E/S de prop?sito general (conocida tambi?n como “puerto geek”) + E/S
IEEE1284.

.. code:: programlisting

    #device         vpo        # Requires scbus and da

Este dispositivo se usa con unidades Iomega Zip. Necesita ``scbus`` y
``da`` . El mejor rendimiento se alcanza con el uso de los puertos en
modo EPP 1.9.

.. code:: programlisting

    #device         puc

Puede utilizar este dispositivo si tiene una tarjeta PCI “tonta” (por
puerto serie o paralelo) que funcione mediante el controlador
`puc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=puc&sektion=4>`__.

.. code:: programlisting

    # PCI Ethernet NICs.
    device          de         # DEC/Intel DC21x4x (“Tulip”)
    device          em         # Intel PRO/1000 adapter Gigabit Ethernet Card
    device          ixgb       # Intel PRO/10GbE Ethernet Card
    device          txp        # 3Com 3cR990 (“Typhoon”)
    device          vx         # 3Com 3c590, 3c595 (“Vortex”)

Diversos controladores para tarjetas de red PCI. Puede borrar todas las
que no est?n en su sistema.

.. code:: programlisting

    # PCI Ethernet NICs that use the common MII bus controller code.
    # NOTE: Be sure to keep the 'device miibus' line in order to use these NICs!
    device          miibus     # MII bus support

El poder utilizar bus MII es necesario para ciertas tarjetas Ethernet
PCI 10/100, m?s concretamente las que usan transceptores compatibles con
MII o implementan interfaces de control de transceptores que funcionan
como si fueran MII. Si incluye ``device miibus`` al kernel dispondr? de
la API miibus gen?rica y todos los controladores PHY, incluyendo uno que
har? funcionar hardware que, siendo del tipo PHY, no est? bajo ninguno
de los controladores PHY espec?ficos.

.. code:: programlisting

    device          bce        # Broadcom BCM5706/BCM5708 Gigabit Ethernet
    device          bfe        # Broadcom BCM440x 10/100 Ethernet
    device          bge        # Broadcom BCM570xx Gigabit Ethernet
    device          dc         # DEC/Intel 21143 and various workalikes
    device          fxp        # Intel EtherExpress PRO/100B (82557, 82558)
    device          lge        # Level 1 LXT1001 gigabit ethernet
    device          msk        # Marvell/SysKonnect Yukon II Gigabit Ethernet
    device          nge        # NatSemi DP83820 gigabit ethernet
    device          nve        # nVidia nForce MCP on-board Ethernet Networking
    device          pcn        # AMD Am79C97x PCI 10/100 (precedence over 'lnc')
    device          re         # RealTek 8139C+/8169/8169S/8110S
    device          rl         # RealTek 8129/8139
    device          sf         # Adaptec AIC-6915 (“Starfire”)
    device          sis        # Silicon Integrated Systems SiS 900/SiS 7016
    device          sk         # SysKonnect SK-984x & SK-982x gigabit Ethernet
    device          ste        # Sundance ST201 (D-Link DFE-550TX)
    device          stge       # Sundance/Tamarack TC9021 gigabit Ethernet
    device          ti         # Alteon Networks Tigon I/II gigabit Ethernet
    device          tl         # Texas Instruments ThunderLAN
    device          tx         # SMC EtherPower II (83c170 “EPIC”)
    device          vge        # VIA VT612x gigabit ethernet
    device          vr         # VIA Rhine, Rhine II
    device          wb         # Winbond W89C840F
    device          xl         # 3Com 3c90x (“Boomerang”, “Cyclone”)

Controladores que utilizan el c?digo del controlador de bus MII.

.. code:: programlisting

    # ISA Ethernet NICs.  pccard NICs included.
    device          cs         # Crystal Semiconductor CS89x0 NIC
    # 'device ed' requires 'device miibus'
    device          ed         # NE[12]000, SMC Ultra, 3c503, DS8390 cards
    device          ex         # Intel EtherExpress Pro/10 and Pro/10+
    device          ep         # Etherlink III based cards
    device          fe         # Fujitsu MB8696x based cards
    device          ie         # EtherExpress 8/16, 3C507, StarLAN 10 etc.
    device          lnc        # NE2100, NE32-VL Lance Ethernet cards
    device          sn         # SMC's 9000 series of Ethernet chips
    device          xe         # Xircom pccard Ethernet

    # ISA devices that use the old ISA shims
    #device         le

Controladores Ethernet ISA. Consulte ``/usr/src/sys/i386/conf/NOTES``
para m?s detalles sobre qu? tarjetas hace funcionar qu? controlador.

.. code:: programlisting

    # Wireless NIC cards
    device          wlan            # 802.11 support

802.11 gen?rico. Necesitar? esta l?nea si va a usar redes inal?mbricas.

.. code:: programlisting

    device          wlan_wep        # 802.11 WEP support
    device          wlan_ccmp       # 802.11 CCMP support
    device          wlan_tkip       # 802.11 TKIP support

Criptograf?a en dispositivos 802.11. Necesita estas l?neas si quiere
utilizar criptograf?a y protocolos de seguridad 802.11.

.. code:: programlisting

    device          an         # Aironet 4500/4800 802.11 wireless NICs.
    device          ath             # Atheros pci/cardbus NIC's
    device          ath_hal         # Atheros HAL (Hardware Access Layer)
    device          ath_rate_sample # SampleRate tx rate control for ath
    device          awi        # BayStack 660 and others
    device          ral        # Ralink Technology RT2500 wireless NICs.
    device          wi         # WaveLAN/Intersil/Symbol 802.11 wireless NICs.
    #device         wl         # Older non 802.11 Wavelan wireless NIC.

Diversas tarjetas inal?mbricas.

.. code:: programlisting

    # Pseudo devices
    device   loop          # Network loopback

El dispositivo de ?loopback? para TCP/IP. Si accede por telnet o FTP or
FTP to ``localhost`` tambi?n conocido como ``127.0.0.1``) lo har? a
trav?s de este dispositivo. Es *imprescindible* tenerlo en el sistema.

.. code:: programlisting

    device   random        # Entropy device

Generador de n?meros criptogr?ficamente seguro.

.. code:: programlisting

    device   ether         # Ethernet support

``ether`` solo es necesario si tiene alguna tarjeta Ethernet. Incluye
c?digo gen?rico del protocolo Ethernet.

.. code:: programlisting

    device   sl            # Kernel SLIP

``sl`` permite utilizar SLIP. Ha sido sustituido casi totalmente por
PPP, que es m?s f?cil de usar, est? mejor capacitado para la conexi?n de
m?dem a m?dem y es, en general, claramente mejor.

.. code:: programlisting

    device   ppp           # Kernel PPP

Este dispositivo incluye en el kernel la capacidad de gestionar
conexiones de llamada entrante ?dial-up?. Hay tambi?n una versi?n de PPP
implementada como aplicaci?n de usuario; utiliza ``tun`` y ofrece m?s
flexibilidad y caracter?sticas como la llamada bajo petici?n.

.. code:: programlisting

    device   tun           # Packet tunnel.

Este dispositivo lo usa el software PPP de usuario. Consulte la secci?n
sobre `PPP <userppp.html>`__ de este mismo libro.

.. code:: programlisting

    device   pty           # Pseudo-ttys (telnet etc)

Este dispositivo es una “pseudoterminal”, o un puerto de entrada al
sistema simulado. Se usa en sesiones entrantes de ``telnet`` y
``rlogin``; tambi?n lo usan xterm y otras aplicaciones, entre las que
encontramos a Emacs.

.. code:: programlisting

    device   md            # Memory “disks”

Pseudodispositivos de disco basados en memoria.

.. code:: programlisting

    device   gif           # IPv6 and IPv4 tunneling

Este dispositivo implementa t?neles de IPv6 sobre IPv4, IPv4 sobre IPv6,
IPv4 sobre IPv4 e IPv6 sobre IPv6. El dispositivo ``gif`` se puede
clonar a s? mismo, as? que los nodos de dispositivo se van creando a
medida que van haciendo falta.

.. code:: programlisting

    device   faith         # IPv6-to-IPv4 relaying (translation)

Este pseudodispositivo captura paquetes que se le hayan enviado y los
dirige hacia el d?mon de traducci?n IPv4/IPv6.

.. code:: programlisting

    # The `bpf' device enables the Berkeley Packet Filter.
    # Be aware of the administrative consequences of enabling this!
    # Note that 'bpf' is required for DHCP.
    device   bpf           # Berkeley packet filter

El filtro de paquetes de Berkeley. Este pseudodispositivo permite poner
interfaces de red en modo prom?scuo, lo que significa que capturan todos
los paquetes que circulen por una red broadcast (por ejemplo una
Ethernet). Dichos paquetes pueden guardarse en disco para su posterior
examen mediante
`tcpdump(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tcpdump&sektion=1>`__
(el an?lisis con
`tcpdump(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tcpdump&sektion=1>`__
no puede hacerse directamente tambi?n).

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

El dispositivo
`bpf(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bpf&sektion=4>`__
tambi?n lo usa
`dhclient(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dhclient&sektion=8>`__
para obtener direcciones IP del encaminador (gateway) por omisi?n. Si
usa DHCP deje esta opci?n como est?.

.. raw:: html

   </div>

.. code:: programlisting

    # USB support
    device          uhci          # UHCI PCI->USB interface
    device          ohci          # OHCI PCI->USB interface
    device          ehci          # EHCI PCI->USB interface (USB 2.0)
    device          usb           # USB Bus (required)
    #device         udbp          # USB Double Bulk Pipe devices
    device          ugen          # Generic
    device          uhid          # “Human Interface Devices”
    device          ukbd          # Keyboard
    device          ulpt          # Printer
    device          umass         # Disks/Mass storage - Requires scbus and da
    device          ums           # Mouse
    device          ural          # Ralink Technology RT2500USB wireless NICs
    device          urio          # Diamond Rio 500 MP3 player
    device          uscanner      # Scanners
    # USB Ethernet, requires mii
    device          aue           # ADMtek USB Ethernet
    device          axe           # ASIX Electronics USB Ethernet
    device          cdce          # Generic USB over Ethernet
    device          cue           # CATC USB Ethernet
    device          kue           # Kawasaki LSI USB Ethernet
    device          rue           # RealTek RTL8150 USB Ethernet

Diversos dispositivos USB.

.. code:: programlisting

    # FireWire support
    device          firewire      # FireWire bus code
    device          sbp           # SCSI over FireWire (Requires scbus and da)
    device          fwe           # Ethernet over FireWire (non-standard!)

Diversos dispositivos Firewire.

Tiene m?s informaci?n y una lista con m?s dispositivos que funcionan en
FreeBSD consulte ``/usr/src/sys/i386/conf/NOTES``.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

8.6.1. Configuraciones con grandes cantidades de memoria (PAE)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Las m?quinas que tienen configuraciones con grandes cantidades de
memoria necesitan acceder a m?s de 4 gigabytes de espacio de direcciones
KVA (User+Kernel Virtual Address). Debido a esta limitaci?n Intel a?adi?
a las CPU Pentium? Pro y modelos posteriores la posibilidad de acceso al
espacio de direcciones f?sicas de 36 bits.

PAE (Physical Address Extension) a las CPU Intel? Pentium? Pro y los
modelos posteriores configuraciones de memoria de hasta 64 gigabytes.
Para poder aprovechar esto en FreeBSD existe la opci?n del kernel
``PAE``, disponible en todas las versiones modernas de FreeBSD. A causa
de esta limitaci?n de memoria en los Intel no hay nada que distinga de
alg?n modo la memoria situada por debajo del l?mite de los 4 gigabytes.
La memoria que est? por encima de los 4 gigabytes se coloca en el ?pool?
de memoria disponible.

Si quiere activar PAE en el kernel tiene que a?adir la siguiente li?nea
al fichero de configuraci?n del kernel:

.. code:: programlisting

    options           PAE

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

En FreeBSD PAE solamente existe en procesadores Intel? IA-32. Hemos de
advertirle de que PAE no ha sido probado todo lo necesario, as? que debe
considerarse de calidad beta, sobre todo si se le compara con otras
caracter?sticas de FreeBSD.

.. raw:: html

   </div>

PAE en FreeBSD tiene varias limitaciones:

.. raw:: html

   <div class="itemizedlist">

-  Un solo proceso no puede acceder a m?s de 4 gigabytes de espacio VM.

-  No puede cargar m?dulos KLD en un kernel que tenga PAE activado
   debido a las diferencias existentes entre el ?framework? de
   compilaci?n del m?dulo y el del kernel mismo.

-  Los controladores de dispositivo que utilizan el interfaz
   `bus\_dma(9) <http://www.FreeBSD.org/cgi/man.cgi?query=bus_dma&sektion=9>`__
   pueden provocar corrupci?n de datos en un kernel con PAE activado,
   una excelente raz?n para no utilizarlos. Esta es la raz?n de que
   FreeBSD incorpore un fichero de configuraci?n de un kernel ``PAE``
   del que se han extra?do todos los m?dulos que se sabe que no
   funcionan en un kernel con PAE activado.

-  Algunos ?system tunables? determinan el uso de recursos de memoria
   bas?ndose en la memoria f?sica disponible. Estos ?tunables? pueden
   asignar m?s memoria de la que realmente debieran debido a que el
   sistema PAE est? ?ntimamente ligado a cantidades bastante importantes
   de memoria. Un ejemplo de esto es la sysctl ``kern.maxvnodes``, que
   controla el n?mero m?ximo de vnodes permitidos en el kernel. Le
   recomendamos que ajuste este y otros tunables dentro valores
   razonables.

-  Es posible que tenga que aumentar el espacio virtual de direcciones
   del kernel (el KVA) o reducir la cantidad de recursos exclusivos del
   kernel que se utilicen exhaustivamente (ver m?s arriba) para evitar
   que KVA literalmente se ahogue. La opci?n del kernel ``KVA_PAGES``
   permite incrementar el espacio KVA.

.. raw:: html

   </div>

Si quiere saber m?s sobre la estabilidad del sistema consulte la p?gina
de manual de
`tuning(7) <http://www.FreeBSD.org/cgi/man.cgi?query=tuning&sektion=7>`__.
La p?gina de manual de
`pae(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pae&sektion=4>`__
contiene informaci?n actualizada sobre PAE y FreeBSD.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------------------------------+---------------------------------+------------------------------------------------+
| `Anterior <kernelconfig-building.html>`__?                   | `Subir <kernelconfig.html>`__   | ?\ `Siguiente <kernelconfig-trouble.html>`__   |
+--------------------------------------------------------------+---------------------------------+------------------------------------------------+
| 8.5. Compilaci?n e instalaci?n de un kernel personalizado?   | `Inicio <index.html>`__         | ?8.7. Qu? hacer si algo va mal                 |
+--------------------------------------------------------------+---------------------------------+------------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
