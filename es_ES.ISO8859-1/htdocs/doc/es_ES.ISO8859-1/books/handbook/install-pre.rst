=======================================
2.3. Tareas anteriores a la instalaci?n
=======================================

.. raw:: html

   <div class="navheader">

2.3. Tareas anteriores a la instalaci?n
`Anterior <install-hardware.html>`__?
Cap?tulo 2. Instalaci?n de FreeBSD
?\ `Siguiente <install-start.html>`__

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

2.3. Tareas anteriores a la instalaci?n
---------------------------------------

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

2.3.1. Inventario de su sistema
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Antes de instalar FreeBSD en su sistema deber?a hacer un inventario de
los componentes de su computadora. El sistema de instalaci?n de FreeBSD
le mostrar? los componentes (discos duros, tarjetas de red, unidades de
CDROM, etc.) con sus datos de modelo y fabricante. FreeBSD tratar?
tambi?n de determinar la configuraci?n correcta para dichos
dispositivos, lo que incluye informaci?n sobre las IRQ y el uso de
puertos IO. A causa de la ingente variedad de hardware para PC este
proceso no siempre se puede culminar con ?xito y es posible que deba
corregir las decisiones de FreeBSD retocando la configuraci?n.

Si ya dispone de otro sistema operativo instalado (como Windows? o
Linux) puede usar los recursos que dicho o dichos sistemas operativos le
faciliten para determinar exactamente qu? hardware tiene y c?mo est?
configurado. Si tiene del todo claro qu? configuraci?n est? usando una
tarjeta de expasi?n concreta es posible que pueda encontrar esos datos
impresos en la propia tarjeta. Es muy habitual el uso de las IRQ 3, 5 y
7 y las direcciones de los puertos IO suelen representarse con n?meros
hexadecimales, como 0x330.

Le recomendamos imprimir o tomar nota de todos esos datos antes de
instalar FreeBSD. Una tabla como esta puede serle de mucha ayuda:

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Tabla 2.1. Ejemplo de inventario de dispositivos

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+----------------------------+-------+----------------+----------------------------------------------------+
| Nombre de dispositivo      | IRQ   | Puerto(s) IO   | Notas                                              |
+============================+=======+================+====================================================+
| Primer disco duro          | N/A   | N/A            | 40?GB, fabricado por Seagate, primer maestro IDE   |
+----------------------------+-------+----------------+----------------------------------------------------+
| CDROM                      | N/A   | N/A            | Primer esclavo IDE                                 |
+----------------------------+-------+----------------+----------------------------------------------------+
| Segundo disco duro         | N/A   | N/A            | 20?GB, fabricado por IBM, segundo maestro IDE      |
+----------------------------+-------+----------------+----------------------------------------------------+
| Primera controladora IDE   | 14    | 0x1f0          | ?                                                  |
+----------------------------+-------+----------------+----------------------------------------------------+
| Tarjeta de red             | N/A   | N/A            | Intel? 10/100                                      |
+----------------------------+-------+----------------+----------------------------------------------------+
| M?dem                      | N/A   | N/A            | 3Com? 56K faxmodem, en COM1                        |
+----------------------------+-------+----------------+----------------------------------------------------+
| …                          | ?     | ?              | ?                                                  |
+----------------------------+-------+----------------+----------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

Una vez termine el inventorio de componentes de su sistema debe
comprobar si aparecen en la lista de hardware soportado de la versi?n de
FreeBSD que vaya a instalar.

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

2.3.2. Haga una copia de seguridad de sus datos
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Si la m?quina en la que va a instalar FreeBSD contiene datos que desea
conservar por alg?n motivo aseg?rese de haber hecho una copia de
seguridad de los mismos y de que esa copia es de fiar antes de instalar
FreeBSD. El sistema de instalaci?n de FreeBSD le mostrar? una
advertencia antes de modificar datos en su disco pero una vez que el
proceso ha comenzado no hay manera de dar marcha atr?s.

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

2.3.3. Decida d?nde instalar FreeBSD
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Si quiere que FreeBSD use todo su disco duro puede saltar tranquilamente
a la siguiente secci?n.

Si por el contrario necesita que FreeBSD coexista con otros sistemas
operativos tendr? que comprender c?mo se almacenan los datos en el disco
duro y c?mo le afecta esto.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.3.3.1. Esquemas de disco en FreeBSD/i386™
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Un disco de PC puede dividirse en varias partes. Estas partes reciben el
nombre de *partitions*. Dado que FreeBSD internamente tambi?n tiene
particiones la nomenclatura puede ser confusa muy r?pidamente, as? que
estas partes del disco reciben el nombre de ?disk slices? o
sencillamente ?slices? (?rebanadas de disco?y ?rebanadas?
respectivamente). Por ejemplo, la versi?n de ``fdisk`` que usar? FreeBSD
con las particiones de disco de PC usa la palabra ?slices? en lugar de
?partitions?. Debido a limitaciones de dise?o la plataforma PC s?lo
admite cuatro particiones por disco. Dichas particiones reciben el
nombre de *particiones primarias*. Esta limitaci?n puede sortearse (y de
ese modo disponer de m?s de cuatro particiones) gracias a que se cre? un
nuevo tipo de partici?n, las *particiones extendidas*. Un disco puede
contener una ?nica partici?n extendida. Dentro de ella pueden crearse
particiones especiales, que reciben el nombre de *particiones l?gicas*.

Cada partici?n tiene un *identificador de partici?n* (o *partition ID*),
que es un n?mero que se usa para identificar el tipo de datos que
alberga la partici?n. Las particiones FreeBSD tienen como identificador
de partici?n ``165``.

Normalmente cada sistema operativo que vaya a utilizar identificar? las
particiones de un modo propio. Por ejemplo DOS (y sus descendientes,
como Windows?) asignan a cada partici?n primaria y l?gica una *letra de
unidad* a partir de ``C:``.

FreeBSD debe instalarse en una partici?n primaria. FreeBSD puede
albergar todos los datos que necesita, incluyendo cualquier fichero que
pueda usted crear, en esta partici?n. Si tiene usted varios discos duros
puede crear particiones para que FreeBSD las use en todos ellos o en
algunos nada m?s. Al instalar FreeBSD debe usar al menos una partici?n.
Puede usar una partici?n vac?a que haya preparado o puede usar tambi?n
una partici?n que contenga datos que no desea conservar.

Si est? usando todas las particiones de todos sus discos tendr? que
dejar libre una de ellas para FreeBSD usando las herramientas del otro
sistema operativo que est? usando (por ejemplo ``fdisk`` en DOS o en
Windows?).

Si tiene una partici?n sobrante puede usarla, pero puede verse en la
necesidad de reducir una o m?s de las particiones que est? usando.

Una instalaci?n m?nima de FreeBSD cabr? en s?lo 100?MB de disco pero
tenga en cuenta que apenas quedar?a espacio para los ficheros que quiera
crear. Un m?nimo m?s realista ser?a de 250?MB si no pretende usar
entorno gr?fico y 350?MB o m?s si quiere usar un interfaz gr?fico de
usuario. Si quiere instalar gran cantidad de software para usarlo en
FreeBSD sin duda necesitar? m?s espacio.

Para ello puede usar herramientas comerciales como PartitionMagic? o
libres como GParted para redimensionar sus particiones y hacer sitio
para FreeBSD. El directorio ``tools`` directory del CDROM de instalaci?n
contiene dos herramientas libres con las que puede hacer hacer esta
redimensi?n: FIPS y PResizer. En el mismo directorio encontrar?
documentaci?n de ambas. FIPS, PResizer y PartitionMagic? pueden
redimensionar particiones FAT16 y FAT32, que pueden encontrarse desde
MS-DOS? hasta Windows? ME. Tanto PartitionMagic? como GParted funcionan
tambi?n en particiones NTFS. GParted forma parte de diversas
distribuciones de ?Live CD? de Linux, como
`SystemRescueCD <http://www.sysresccd.org/>`__.

Hay informes de problemas redimensionando particiones de Microsoft?
Vista. Le recomendamos tener a mano un disco de instalaci?n de Vista
cuando intente hacer esto. Lo dicho para cualquier otra tarea de
mantenimiento de discos es v?lido aqu?: tenga una copia de seguridad
*fiable* y reciente a mano.

.. raw:: html

   <div class="warning" xmlns="">

Aviso:
~~~~~~

El uso incorrecto de estas herramientas puede borrar datos de su disco
duro. Recuerde, aseg?rese de disponer de copias de seguridad recientes y
utilizables antes de usarlas.

.. raw:: html

   </div>

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Ejemplo 2.1. Uso de una partici?n sin cambiar nada

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Supongamos que tiene una m?quina con un s?lo disco de 4?GB que ya tiene
una versi?n de Windows? instalada y que ese disco est? dividido en dos
unidades, ``C:`` y ``D:``, cada una de las cuales tiene un tama?o de
2?GB. Tiene 1?GB de datos en ``C:`` y 0.5?GB de datos en ``D:``.

Esto significa que su disco duro tiene dos particiones, una por cada
letra de unidad. Copie todos sus datos de ``D:`` en ``C:``; de este modo
vaciar? la segunda partici? y podr? usarla con FreeBSD.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Ejemplo 2.2. Reducir una partici?n existente

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Suponga que tiene una m?quina con un s?lo disco de 4?GB que contiene una
versi?n de Windows? instalada. Cuando instal? Windows? cre? una gran
partici?n, lo que le di? como resultado una unidad ``C:`` de 4?GB. Est?
usando 1.5?GB de espacio y quiere que FreeBSD tenga 2?GB de espacio.

Para poder instalar FreeBSD tendr? que realizar una de las siguientes
tareas:

.. raw:: html

   <div class="orderedlist">

#. Haga una copia de sus datos de Windows? y despu?s reinstale Windows?,
   eligiendo una partici?n de 2?GB en el momento de la instalaci?n.

#. Utilice alguna herramienta del estilo de PartitionMagic? que se han
   descrito antes para reducir el tama?o de su partici?n de Windows?.

.. raw:: html

   </div>

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

2.3.3.2. Estructura de discos en Alpha
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Tendr? que dedicar un disco de su sistema para usar FreeBSD puesto que
de momento es imposible compartir un disco con otro sistema operativo.
Dependiendo de la la m?quina Alpha que tenga el disco podr? ser SCSI o
IDE en la medida en que sea posible arrancar desde tales discos.

Siguiendo las normas de los manuales de Digital / Compaq todos los datos
suministrados a SRM se muestran en may?sculas. SRM no distingue entre
may?sculas y min?sculas.

Use ``SHOW DEVICE`` en la consola de SRM para saber qu? tipo de discos
hay en su sistema:

.. code:: screen

    >>>SHOW DEVICE
    dka0.0.0.4.0               DKA0           TOSHIBA CD-ROM XM-57  3476
    dkc0.0.0.1009.0            DKC0                       RZ1BB-BS  0658
    dkc100.1.0.1009.0          DKC100             SEAGATE ST34501W  0015
    dva0.0.0.0.1               DVA0
    ewa0.0.0.3.0               EWA0              00-00-F8-75-6D-01
    pkc0.7.0.1009.0            PKC0                  SCSI Bus ID 7  5.27
    pqa0.0.0.4.0               PQA0                       PCI EIDE
    pqb0.0.1.4.0               PQB0                       PCI EIDE

Este ejemplo es de una Digital Personal Workstation 433au y muestra tres
discos instalados en el sistema. El primer disco es una unidad CDROM
llamada ``DKA0`` y los otros dos reciben los nombres de ``DKC0`` y
``DKC100`` respectivamente.

Los discos con nombres tipo ``DKx`` son discos SCSI. Por ejemplo
``DKA100`` se refiere a un disco SCSI con el ?target ID 1? en el primer
bus SCSI (A), mientras que ``DKC300`` es un disco SCSI con un ID 3 en el
tercer bus SCSI (C). Los nombres de dispositivo ``PKx`` son para
adaptadores de bus SCSI. Como hemos visto en la salida de
``SHOW DEVICE`` las unidades CDROM SCSI son consideradas iguales a otros
discos duros SCSI.

Los discos IDE tienen nombres similares a ``       DQx``, mientras que
``PQx`` es la controladora IDE asociada.

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

2.3.4. Recopile los datos de la configuraci?n de la red
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Si pretende conectarse a alguna red durante la instalaci?n de FreeBSD
(por ejemplo si pretende hacerlo desde un sitio FTP o mediante un
servidor NFS) tendr? que conocer la configuraci?n de su red. Durante la
instalaci?n se le pedir?n esos datos para que FreeBSD pueda conectarse a
la red y realizar la instalaci?n.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.3.4.1. Conexi?n a una red Ethernet o a un m?dem Cable/DSL
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Necesitar? la siguiente informaci?n si va a conectarse a una red
Ethernet o si tiene una conexi?n a Internet a trav?s de una adaptador
Ethernet via cable o DSL:

.. raw:: html

   <div class="orderedlist">

#. Direcci?n IP

#. Direcci?n IP de la pasarela (?gateway?, ?puerta de enlace?)

#. Nombre del sistema (?hostname?)

#. Direcci?n IP del servidor DNS

#. M?scara de subred

.. raw:: html

   </div>

Si no conoce estos datos p?ngase en contacto con su administrador de
sistemas o con su proveedor de servicios. Es que le digan que tal
informaci?n se asigna autom?ticamente mediante *DHCP*. Si es as?,
an?telo.

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

2.3.4.2. Conexi?n mediante m?dem
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Si usted se conecta con su ISP mediante un m?dem tradicional sigue
pudiendo instalar FreeBSD a trav?s de Internet; el problema es que
tardar? mucho m?s que por otros medios.

Necesitar? saber:

.. raw:: html

   <div class="orderedlist">

#. El n?mero de tel?fono de su ISP a trav?s del que acceder? a Internet

#. El COM: el puerto al que est? conectado su m?dem

#. Su nombre de usuario y su contrase?a de acceso a Internet

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

2.3.5. Consulte ?FreeBSD Errata?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A pesar de que el proyecto FreeBSD hace todo lo humanamente posible para
asegurarse de que cada ?release? de FreeBSD es todo lo estable posible a
veces alg?n error logra entrar en escena. En contad?simas ocasiones esos
errores llegan a afectar al proceso de instalaci?n. Cuando esos errores
son ubicados y corregidos aparecen en lo que llamamos la `FreeBSD
Errata <http://www.FreeBSD.org/releases/10.1R/errata.html>`__, que
encontrar? en el sitio web de FreeBSD. Deber?a consultar este texto
antes de la instalaci?n para asegurarse de que no hay problemas de
?ltima hora de los que deba preocuparse.

Tiene informaci?n sobre las ?releases?, incluyendo la ?errata? de cada
una de ellas, en la `secci?n de informaci?n de
?releases? <http://www.FreeBSD.org/releases/index.html>`__ del `sitio
web de FreeBSD <http://www.FreeBSD.org/index.html>`__.

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

2.3.6. Obtenci?n de los ficheros de instalaci?n de FreeBSD
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El proceso de instalaci?n de FreeBSD permite instalar FreeBSD desde
ficheros ubicados en cualquiera de los siguientes sitios:

.. raw:: html

   <div class="itemizedlist">

.. raw:: html

   <div class="itemizedlist-title">

Medios locales

.. raw:: html

   </div>

-  Un CDROM o DVD

-  Una partici?n DOS en la propia computadora

-  Una cinta SCSI o QIC

-  Discos floppy

.. raw:: html

   </div>

.. raw:: html

   <div class="itemizedlist">

.. raw:: html

   <div class="itemizedlist-title">

Red

.. raw:: html

   </div>

-  Un sitio FTP, saliendo a trav?s de un cortafuegos o usando un proxy
   HTTP si fuera necesario

-  Un servidor NFS

-  Una conexi?n serie o a trav?s de una cable paralelo

.. raw:: html

   </div>

Si ha adquirido FreeBSD en CD o DVD ya tiene todo lo que necesitar?,
puede pasar a la siguiente secci?n: (`Secci?n?2.3.7, “Preparaci?n del
medio de arranque” <install-pre.html#install-floppies>`__).

Si no dispone de los ficheros de instalaci?n de FreeBSD deber?a
consultar la `Secci?n?2.13, “C?mo preparar su propio medio de
instalaci?n” <install-diff-media.html>`__, donde se explica c?mo
preparar la instalaci?n de FreeBSD desde cualquiera de los medios
listados anteriormente. Tras leer esa secci?n puede volver aqu? y leer
la `Secci?n?2.3.7, “Preparaci?n del medio de
arranque” <install-pre.html#install-floppies>`__.

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

2.3.7. Preparaci?n del medio de arranque
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El proceso de instalaci?n de FreeBSD comienza por arrancar su sistema
mediante el instalador de FreeBSD: no es un programa que pueda ejecutar
desde otro sistema operativo. Su sistema suele arrancar usando el
sistema operativo que est? instalado en su disco duro pero puede tambi?n
ser configurado para que lo haga desde un floppy ?arrancable?. Las
computadoras m?s modernas pueden tambi?n arrancar desde un CDROM
introducido en la unidad CDROM.

.. raw:: html

   <div class="tip" xmlns="">

Sugerencia:
~~~~~~~~~~~

Si tiene FreeBSD en CDROM o DVD (por haberlo comprado o haberlo
preparado por usted) y su sistema puede arracar desde CDROM o DVD (suele
ser una opci?n de BIOS llamada ?Boot Order? o algo similar) puede
saltarse esta secci?n. Las im?genes de CDROM o DVD de FreeBSD permiten
arrancar desde ellas y pueden emplearse para instalar FreeBSD sin
ninguna preparaci?n especial.

.. raw:: html

   </div>

Siga estos pasos para crear las im?genes que le permitir?n arrancar
desde floppy:

.. raw:: html

   <div class="procedure">

#. **Consiga las im?genes de arranque desde floppy**

   Los discos de arranque se encuentran en el directorio ``floppies/``
   del medio de instalaci?n o pueden descargarse desde el directorio
   correspondiente de
   ``ftp://ftp.FreeBSD.org/pub/FreeBSD/releases/<arch>/<version>-RELEASE/floppies/``.
   Reemplace *``<arch>``* y *``<version>``* con la arquitectura y la
   versi?n de FreeBSD que quiera instalar. Por ejemplo, las im?genes de
   arranque desde floppy para FreeBSD?10.1-RELEASE para i386™ est?n en
   from
   ``ftp://ftp.FreeBSD.org/pub/FreeBSD/releases/i386/10.1-RELEASE/floppies/``.

   Las im?genes de floppy tienen la extensi?n ``.flp``. El directorio
   ``floppies/`` contiene diferentes im?genes y las que usted necesitar?
   depender?n de la versi?n de FreeBSD que vaya a instalar y, en algunos
   casos, del hardware en el que lo va a instalar. En la mayor?a de de
   los casos solamente usar? dos ficheros: ``kern.flp`` y
   ``mfsroot.flp``. La instalaci?n en algunos sistemas concretos
   requerir? controladores de dispositivo adicionales, que se encuentran
   en la imagen ``drivers.flp``. Consulte ``README.TXT`` en el propio
   directorio, ah? encontrar? la informaci?n m?s reciente sobre las
   im?genes.

   .. raw:: html

      <div class="important" xmlns="">

   Importante:
   ~~~~~~~~~~~

   Su programa de FTP debe usar *modo binario* para descargar las
   im?genes. Algunos navegadores web suelen usar el modo *texto* ( o
   *ASCII*). He aqu? lo primero a comprobar si no puede arrancar desde
   los disquetes que ha creado.

   .. raw:: html

      </div>

#. **Preparaci?n de los discos floppy**

   Tendr? que preperar un disquete por cada imagen que descargue. Es
   imprescindible que esos discos carezcan de errores. La forma m?s
   sencilla de asegurarlo es formatearlos usted. No conf?e en disquetes
   preformateados. La herramienta de formateo de Windows? no le
   advertir? del hallazgo de bloques defectuosos, si encuentra alguno
   sencillamente lo marcar? como ?defectuoso? y lo ignorar?. Le
   recomendamos que use disquetes nuevos si decide usar este
   procedimiento de instalaci?n.

   .. raw:: html

      <div class="important" xmlns="">

   Importante:
   ~~~~~~~~~~~

   Si instenta instalar FreeBSD y el programa de instalaci?n falla, se
   queda congelado o sucede alguna otra cat?strofe uno de las primeras
   cosas de las que sospechar son los disquetes. Vuelque los ficheros de
   imagen en discos nuevos e int?ntelo de nuevo.

   .. raw:: html

      </div>

#. **Escriba los ficheros de imagen en discos floppy (? disquetes?)**

   Los ficheros ``.flp`` *no* son ficheros normales que puedan copiarse
   a disco. Son im?genes del contenido completo de los discos. Esto
   significa que *no puede* simplemente copiar esos ficheros de un disco
   a otro. Debe usar herramientas especializadas para escribir esas
   im?genes directamente al disco correspondiente.

   Si va a crear los disquetes de arranque en un sistema en el que se
   est? ejecutando MS-DOS?/Windows? utilice la herramienta ``fdimage``.

   Si las im?genes est?n en el CDROM y su CDROM es la unidad ``E:``
   ejecute lo siguiente:

   .. code:: screen

       E:\> tools\fdimage floppies\kern.flp A:

   Repita el proceso con cada fichero ``.flp`` reemplazando cada vez el
   disco y recuerde etiquetarlos con el nombre del fichero que ha
   copiado en cada uno. Modifique la l?nea del comando donde sea
   necesario, adapt?ndola al lugar donde tenga usted los ficheros
   ``.flp``. Puede descargar ``fdimage`` desde el directorio
   ```tools`` <ftp://ftp.FreeBSD.org/pub/FreeBSD/tools/>`__ del sitio
   FTP de FreeBSD.

   Si va a crear los disquetes en un sistema UNIX? (por ejemplo otro
   sistema FreeBSD) puede utilizar
   `dd(1) <http://www.FreeBSD.org/cgi/man.cgi?query=dd&sektion=1>`__
   para volcar las im?genes a los discos. En FreeBSD puede ejecutar algo
   como:

   .. code:: screen

       # dd if=kern.flp of=/dev/fd0

   En FreeBSD ``/dev/fd0`` es la primera unidad de disquetes (la unidad
   ``A:``). ``/dev/fd1`` ser?a la unidad ``B:`` y as? sucesivamente.
   Otras versiones de UNIX? pueden asignar nombres diferentes a las
   unidades de disquetes; consulte la documentaci?n de su sistema.

.. raw:: html

   </div>

Ya podemos instalar instalar FreeBSD.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------+----------------------------+-----------------------------------------+
| `Anterior <install-hardware.html>`__?   | `Subir <install.html>`__   | ?\ `Siguiente <install-start.html>`__   |
+-----------------------------------------+----------------------------+-----------------------------------------+
| 2.2. Requisitos de hardware?            | `Inicio <index.html>`__    | ?2.4. Inicio de la instalaci?n          |
+-----------------------------------------+----------------------------+-----------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
