==========
18.4. RAID
==========

.. raw:: html

   <div class="navheader">

18.4. RAID
`Anterior <disks-adding.html>`__?
Cap?tulo 18. Almacenamiento
?\ `Siguiente <usb-disks.html>`__

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

18.4. RAID
----------

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

18.4.1. Software RAID
~~~~~~~~~~~~~~~~~~~~~

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

18.4.1.1. Configuraci?n de controlador de disco concatenado (CCD)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   <div>

Texto original de Christopher Shumway.

.. raw:: html

   </div>

.. raw:: html

   <div>

Revisado por Jim Brown.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Al escoger una soluci?n de almacenamiento masivo los factores m?s
importantes a considerar son velocidad, fiabilidad y coste. Es raro
tener los tres por igual; normalmente un dispositivo de almacenamiento
masivo veloz y fiable es caro, y para recortar los costes suele
sacrificarse la velocidad o la fiabilidad.

Al dise?ar el sistema descrito m?s adelante se eligi? el coste como el
factor m?s importante, seguido de la velocidad, y luego la fiabilidad.
La velocidad de transferencia de datos para este sistema est?, en ?ltima
instancia, limitada por la red. Y mientras que la confiabilidad es muy
importante, el controlador CCD descrito m?s adelante sirve datos que
est?n respaldados en CD-R y pueden ser reemplazados sin dificultad.

Al escoger una soluci?n de almacenamiento masivo el primer paso es
definir sus necesidades. Si prefiere velocidad o fiabilidad por encima
del coste, el resultado ser? distinto del que vamos a describir en esta
secci?n.

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

18.4.1.1.1. Instalaci?n del hardware
''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Adem?s del disco IDE, el n?cleo del disco CCD est? compuesto por tres
discos IDE discos IDE Western Digital de 30GB y 5400 RPM, que ofrecen
aproximadamente 90GB de almacenamiento. Lo ideal ser?a que cada disco
IDE tuviera su propio cable y controlador, pero para minimizar costes no
se utilizaron controladores IDE adicionales. En lugar de eso se
configuraron los discos con “jumpers” para que cada controlador IDE
tuviera un maestro y un esclavo.

Despues de reiniciar la BIOS se configur? para que detectara
autom?ticamente los discos conectados. FreeBSD los detect? al reiniciar:

.. code:: programlisting

    ad0: 19574MB <WDC WD205BA> [39770/16/63] at ata0-master UDMA33
    ad1: 29333MB <WDC WD307AA> [59598/16/63] at ata0-slave UDMA33
    ad2: 29333MB <WDC WD307AA> [59598/16/63] at ata1-master UDMA33
    ad3: 29333MB <WDC WD307AA> [59598/16/63] at ata1-slave UDMA33

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Si FreeBSD no detecta todos los discos aseg?rese de que ha colocado
correctamente los “jumpers”. La mayor?a de los discos IDE tienen un
“jumper” “Cable Select”. Este *no* es el “jumper” que define la relaci?n
maestro/esclavo. Consulte la documentaci?n del disco para identificar el
“jumper” correcto.

.. raw:: html

   </div>

El siguiente paso es estudiar c?mo conectarlos para que formen parte del
sistema de ficheros. Investigue Debe investigar
`vinum(8) <http://www.FreeBSD.org/cgi/man.cgi?query=vinum&sektion=8>`__
(`Cap?tulo?20, *El Gestor de Vol?menes Vinum* <vinum-vinum.html>`__) y
`ccd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ccd&sektion=4>`__.
Nosotros elegimos
`ccd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ccd&sektion=4>`__ para
nuestra configuraci?n.

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

18.4.1.1.2. Configuraci?n de CCD
''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El controlador
`ccd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ccd&sektion=4>`__ le
permite tomar varios discos id?nticos y concatenarlos en un solo sistema
l?gico de ficheros. Para poder usar
`ccd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ccd&sektion=4>`__
necesita un kernel compilado con soporte de
`ccd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ccd&sektion=4>`__.
A?ada esta l?nea al fichero de configuraci?n de su kernel, recompile y
reinstale su kernel:

.. code:: programlisting

    pseudo-device   ccd     4

En sistemas 5.X, use la siguiente l?nea:

.. code:: programlisting

    device   ccd

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

En FreeBSD?5.X no es necesario especificar un n?mero de dispositivos
`ccd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ccd&sektion=4>`__, ya
que el controlador de dispositivo
`ccd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ccd&sektion=4>`__ es
capaz de clonarse a s? mismo (se crear?n nuevas instancias de
dispositivo autom?ticamente seg?n vayan haciendo falta).

.. raw:: html

   </div>

El soporte de
`ccd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ccd&sektion=4>`__
tambi?n puede cargarse como m?dulo en FreeBSD 3.0 y posteriores.

Para configurar
`ccd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ccd&sektion=4>`__
tendr? que usar
`disklabel(8) <http://www.FreeBSD.org/cgi/man.cgi?query=disklabel&sektion=8>`__
para etiquetar los discos:

.. code:: programlisting

    disklabel -r -w ad1 auto
    disklabel -r -w ad2 auto
    disklabel -r -w ad3 auto

Esto crea una etiqueta de disco para ``ad1c``, ``ad2c`` y ``ad3c`` que
abarcan el disco completo.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

A partir de FreeBSD?5.1-RELEASE
`bsdlabel(8) <http://www.FreeBSD.org/cgi/man.cgi?query=bsdlabel&sektion=8>`__
reemplaz? al antiguo programa
`disklabel(8) <http://www.FreeBSD.org/cgi/man.cgi?query=disklabel&sektion=8>`__.
En
`bsdlabel(8) <http://www.FreeBSD.org/cgi/man.cgi?query=bsdlabel&sektion=8>`__
se eliminaron muchas opciones y par?metros obsoletos; en los ejemplos de
arriba la opci?n ``-r`` deben obviarse. Para m?s informaci?n consulte
`bsdlabel(8) <http://www.FreeBSD.org/cgi/man.cgi?query=bsdlabel&sektion=8>`__.

.. raw:: html

   </div>

El siguiente paso es cambiar el tipo de etiqueta de disco. Edite los
discos con
`disklabel(8) <http://www.FreeBSD.org/cgi/man.cgi?query=disklabel&sektion=8>`__:

.. code:: programlisting

    disklabel -e ad1
    disklabel -e ad2
    disklabel -e ad3

Esto abre la etiqueta de disco de cada disco con el editor declarado en
la variable de entorno ``EDITOR``, por defecto
`vi(1) <http://www.FreeBSD.org/cgi/man.cgi?query=vi&sektion=1>`__.

Esta es una etiqueta de disco sin modificar:

.. code:: programlisting

    8 partitions:
    #        size   offset    fstype   [fsize bsize bps/cpg]
      c: 60074784        0    unused        0     0     0   # (Cyl.    0 - 59597)

`ccd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ccd&sektion=4>`__
necesita que a?ada una nueva partici?n ``e``. Puede copiarla desde la
partici?n ``c``, pero el tipo de sistema de ficheros (la opci?n
``fstype``) debe ser **``4.2BSD``**. La etiqueta del disco deber?a tener
este aspecto:

.. code:: programlisting

    8 partitions:
    #        size   offset    fstype   [fsize bsize bps/cpg]
      c: 60074784        0    unused        0     0     0   # (Cyl.    0 - 59597)
      e: 60074784        0    4.2BSD        0     0     0   # (Cyl.    0 - 59597)

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

18.4.1.1.3. Contrucci?n del sistema de ficheros
'''''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Puede que todav?a no exista el nodo de dispositivo para ``ccd0c``. Si es
as?, ejecute lo siguiente:

.. code:: programlisting

    cd /dev
    sh MAKEDEV ccd0

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

En FreeBSD 5.0
`devfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=devfs&sektion=5>`__
administrar? autom?ticamente los nodos de dispositivos en ``/dev``, as?
que no tendr? que usar ``MAKEDEV``.

.. raw:: html

   </div>

Una vez etiquetados todos los discos construya el
`ccd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ccd&sektion=4>`__.
Utilice
`ccdconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ccdconfig&sektion=8>`__
con opciones similares a las siguientes:

.. code:: programlisting

    ccdconfig ccd0 32 0 /dev/ad1e /dev/ad2e /dev/ad3e

El uso y el significado de cada una de las opciones se muestra m?s
abajo:

.. raw:: html

   <div class="calloutlist">

+--------------------------------------+--------------------------------------+
| `|1| <#co-ccd-dev>`__                | El primer argumento es el            |
|                                      | dispositivo a configurar, en este    |
|                                      | caso ``/dev/ccd0c``. La parte        |
|                                      | ``/dev/`` es opcional.               |
+--------------------------------------+--------------------------------------+
| `|2| <#co-ccd-interleave>`__         | El intervalo para el sistema de      |
|                                      | ficheros. El intervalo define el     |
|                                      | tama?o de una banda en bloques de    |
|                                      | disco, normalmente 512 bytes. Por lo |
|                                      | tanto, un intervalo de 32            |
|                                      | equivaldr?a 16.384 bytes.            |
+--------------------------------------+--------------------------------------+
| `|3| <#co-ccd-flags>`__              | Banderas para                        |
|                                      | `ccdconfig(8) <http://www.FreeBSD.or |
|                                      | g/cgi/man.cgi?query=ccdconfig&sektio |
|                                      | n=8>`__.                             |
|                                      | Si desea disponer sus discos en      |
|                                      | espejo use aqu? una bandera. Esta    |
|                                      | configuraci?n no necesita discos en  |
|                                      | espejo, por lo que est? dispuesta a  |
|                                      | 0 (cero).                            |
+--------------------------------------+--------------------------------------+
| `|4| <#co-ccd-devs>`__               | Los ?ltimos argumentos de            |
|                                      | `ccdconfig(8) <http://www.FreeBSD.or |
|                                      | g/cgi/man.cgi?query=ccdconfig&sektio |
|                                      | n=8>`__                              |
|                                      | son los dispositivos a colocar en el |
|                                      | array. Utilice la ruta completa para |
|                                      | cada dispositivo.                    |
+--------------------------------------+--------------------------------------+

.. raw:: html

   </div>

Despues de ejecutar
`ccdconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ccdconfig&sektion=8>`__
el `ccd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ccd&sektion=4>`__
estar? configurado y podr? instalar un sistema de ficheros. Consulte las
opciones de
`newfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newfs&sektion=8>`__
y ejecute:

.. code:: programlisting

    newfs /dev/ccd0c

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

18.4.1.1.4. Automatizaci?n
''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Seguramente querr? que
`ccd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ccd&sektion=4>`__ est?
dispuesto tras cada reinicio. Para ello, debe configurarlo. Guarde su
configuraci?n en ``/etc/ccd.conf`` mediante lo siguiente:

.. code:: programlisting

    ccdconfig -g > /etc/ccd.conf

Durante el reinicio, el “script” ``/etc/rc`` ejecuta ``ccdconfig -C`` si
encuentra el fichero ``/etc/ccd.conf``. De este modo
`ccd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ccd&sektion=4>`__
queda configurado autom?ticamente para que pueda montarse.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Si ha arrancando en modo mono usuario necesita ejecutar el siguiente
comando antes de que pueda montar el
`ccd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ccd&sektion=4>`__ para
configurar el array:

.. code:: programlisting

    ccdconfig -C

.. raw:: html

   </div>

Para montar automaticamente el
`ccd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ccd&sektion=4>`__
coloque una entrada para
`ccd(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ccd&sektion=4>`__ en
``/etc/fstab`` para que se monte durante el arranque:

.. code:: programlisting

    /dev/ccd0c              /media       ufs     rw      2       2

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

18.4.1.2. El administrador de vol?menes Vinum
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El administrador de vol?menes Vinum es un controlador de dispositivos de
bloque que implementa unidades de disco virtuales. A?sla los discos
hardware de la interfaz de dispositivos de bloque y mapea datos de modo
que revierta en un incremento de flexibilidad, rendimiento y fiabilidad
comparados con el sistema de slices de almacenamiento de disco
tradicional.
`vinum(8) <http://www.FreeBSD.org/cgi/man.cgi?query=vinum&sektion=8>`__
implementa los modelos RAID-0, RAID-1 y RAID-5, individualmente o
combinados.

Consulte el `Cap?tulo?20, *El Gestor de Vol?menes
Vinum* <vinum-vinum.html>`__ para mayor informaci?n sobre
`vinum(8) <http://www.FreeBSD.org/cgi/man.cgi?query=vinum&sektion=8>`__.

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

18.4.2. RAID por Hardware
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD admite una gran variedad de controladores RAID por hardware.
Estos dispositivos controlan un subsistema RAID sin necesidad de
software espec?fico para FreeBSD que administre el array.

Puede controlar la mayor?a de las operaciones de disco con una tarjeta
que incorpore BIOS. El siguiente texto es una breve descripci?n de
configuraci?n utilizando una controladora Promise RAID IDE. Cuando se
instala esta tarjeta e inicia el sistema despliega un “prompt” pidiendo
informaci?n. Siga las instrucciones para entrar a la pantalla de
configuraci?n de la tarjeta. Ah? tendr? posibilidad de combinar todos
los discos que haya conectado. Hecho esto el disco (o discos) aparecer?n
como una sola unidad en FreeBSD. Pueden configurarse otros niveles de
RAID.

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

18.4.3. Reconstrucci?n de arrays ATA RAID1
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD le permite reemplazar en caliente un disco da?ado. Esto requiere
que lo intercepte antes de reiniciar.

Probablemente vea algo como lo siguiente en ``/var/log/messages`` o en
la salida de
`dmesg(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dmesg&sektion=8>`__:

.. code:: programlisting

    ad6 on monster1 suffered a hard error.
    ad6: READ command timeout tag=0 serv=0 - resetting
    ad6: trying fallback to PIO mode
    ata3: resetting devices .. done
    ad6: hard error reading fsbn 1116119 of 0-7 (ad6 bn 1116119; cn 1107 tn 4 sn 11)\\
    status=59 error=40
    ar0: WARNING - mirror lost

Consulte
`atacontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=atacontrol&sektion=8>`__
para m?s informaci?n:

.. code:: screen

    # atacontrol list
    ATA channel 0:
        Master:      no device present
        Slave:   acd0 <HL-DT-ST CD-ROM GCR-8520B/1.00> ATA/ATAPI rev 0

    ATA channel 1:
        Master:      no device present
        Slave:       no device present

    ATA channel 2:
        Master:  ad4 <MAXTOR 6L080J4/A93.0500> ATA/ATAPI rev 5
        Slave:       no device present

    ATA channel 3:
        Master:  ad6 <MAXTOR 6L080J4/A93.0500> ATA/ATAPI rev 5
        Slave:       no device present

    # atacontrol status ar0
    ar0: ATA RAID1 subdisks: ad4 ad6 status: DEGRADED

.. raw:: html

   <div class="procedure">

#. Primero debe desconectar el disco del array para que pueda retirarlo
   con seguridad:

   .. code:: screen

       # atacontrol detach 3

#. Reemplace el disco.

#. Conecte el disco de repuesto:

   .. code:: screen

       # atacontrol attach 3
       Master:  ad6 <MAXTOR 6L080J4/A93.0500> ATA/ATAPI rev 5
       Slave:   no device present

#. Reconstruya el array:

   .. code:: screen

       # atacontrol rebuild ar0

#. El comando de reconstrucci?n no responder? hasta que termine la
   tarea. Puede abrir otra terminal (mediante **Alt**+**F\ *``n``***) y
   revisar el progreso ejecutando lo siguiente:

   .. code:: screen

       # dmesg | tail -10
       [texto eliminado]
       ad6: removed from configuration
       ad6: deleted from ar0 disk1
       ad6: inserted into ar0 disk1 as spare

       # atacontrol status ar0
       ar0: ATA RAID1 subdisks: ad4 ad6 status: REBUILDING 0% completed

#. Espere hasta que termine la operaci?n.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------+---------------------------+---------------------------------------------+
| `Anterior <disks-adding.html>`__?   | `Subir <disks.html>`__    | ?\ `Siguiente <usb-disks.html>`__           |
+-------------------------------------+---------------------------+---------------------------------------------+
| 18.3. A?adir discos?                | `Inicio <index.html>`__   | ?18.5. Dispositivos de almacenamiento USB   |
+-------------------------------------+---------------------------+---------------------------------------------+

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
.. |3| image:: ./imagelib/callouts/3.png
.. |4| image:: ./imagelib/callouts/4.png
