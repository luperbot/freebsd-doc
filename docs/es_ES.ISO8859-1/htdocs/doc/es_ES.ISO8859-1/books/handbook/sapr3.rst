==============================
10.7. Instalaci?n de SAP??R/3?
==============================

.. raw:: html

   <div class="navheader">

10.7. Instalaci?n de SAP??R/3?
`Anterior <linuxemu-oracle.html>`__?
Cap?tulo 10. Compatibilidad binaria con Linux
?\ `Siguiente <linuxemu-advanced.html>`__

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

10.7. Instalaci?n de SAP??R/3?
------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Escrito por Holger Kipp.

.. raw:: html

   </div>

.. raw:: html

   <div>

Versi?n original convertida a SGML por Valentino Vaschetto.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Las instalaciones de sistemas SAP? en FreeBSD no reciben soporte t?cnico
de SAP?. SAP? solamente lo ofrece si se usan plataformas certificadas.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

10.7.1. Introducci?n
~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Este texto expone una forma de instalar un SAP??R/3? System con una
Oracle? Database para Linux en una m?quina FreeBSD, incluyendo la
instalaci?n de FreeBSD y Oracle?. Se muestran dos configuraciones
diferentes:

.. raw:: html

   <div class="itemizedlist">

-  SAP??R/3? 4.6B (IDES) con Oracle? 8.0.5 en FreeBSD 4.3-STABLE

-  SAP??R/3? 4.6C con Oracle? 8.1.7 en FreeBSD 4.5-STABLE

.. raw:: html

   </div>

Aunque este documento trate de describir todos los pasos importantes con
detalle no ha sido escrito como sustituto de las gu?as de instalaci?n de
Oracle? y SAP??R/3?.

Por favor, consulte la documentaci?n de SAP??R/3? que se incluye en la
edici?n para Linux de SAP? y las preguntas espec?ficas sobre Oracle?,
as? como los recursos que est?n a su disposici?n sobre Oracle? y SAP?
OSS.

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

10.7.2. Software
~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Durante la instalaci?n de SAP? se han utilizado los siguientes CD-ROM:

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

10.7.2.1. SAP??R/3? 4.6B, Oracle? 8.0.5
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+-----------+------------+----------------------------------------------------------+
| Nombre    | N?mero     | Descripci?n                                              |
+===========+============+==========================================================+
| KERNEL    | 51009113   | SAP Kernel Oracle / Installation / AIX, Linux, Solaris   |
+-----------+------------+----------------------------------------------------------+
| RDBMS     | 51007558   | Oracle / RDBMS 8.0.5.X / Linux                           |
+-----------+------------+----------------------------------------------------------+
| EXPORT1   | 51010208   | IDES / DB-Export / Disco 1 de 6                          |
+-----------+------------+----------------------------------------------------------+
| EXPORT2   | 51010209   | IDES / DB-Export / Disco 2 de 6                          |
+-----------+------------+----------------------------------------------------------+
| EXPORT3   | 51010210   | IDES / DB-Export / Disco 3 de 6                          |
+-----------+------------+----------------------------------------------------------+
| EXPORT4   | 51010211   | IDES / DB-Export / Disco 4 de 6                          |
+-----------+------------+----------------------------------------------------------+
| EXPORT5   | 51010212   | IDES / DB-Export / Disco 5 de 6                          |
+-----------+------------+----------------------------------------------------------+
| EXPORT6   | 51010213   | IDES / DB-Export / Disco 6 de 6                          |
+-----------+------------+----------------------------------------------------------+

.. raw:: html

   </div>

Tambi?n utilizamos el CD de Oracle? 8 Server (versi?n pre-producci?n
8.0.5 para Linux, versi?n de kernel 2.0.33), que no es realmente
necesario y FreeBSD 4.3-STABLE (a unos cuantos d?as de la liberaci?n de
4.3-RELEASE).

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

10.7.2.2. SAP??R/3? 4.6C SR2, Oracle? 8.1.7
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+-----------+------------+------------------------------------------------------------+
| Nombre    | N?mero     | Descripci?n                                                |
+===========+============+============================================================+
| KERNEL    | 51014004   | SAP Kernel Oracle / SAP Kernel Version 4.6D / DEC, Linux   |
+-----------+------------+------------------------------------------------------------+
| RDBMS     | 51012930   | Oracle 8.1.7/ RDBMS / Linux                                |
+-----------+------------+------------------------------------------------------------+
| EXPORT1   | 51013953   | Release 4.6C SR2 / Export / Disco 1 de 4                   |
+-----------+------------+------------------------------------------------------------+
| EXPORT1   | 51013953   | Release 4.6C SR2 / Export / Disco 2 de 4                   |
+-----------+------------+------------------------------------------------------------+
| EXPORT1   | 51013953   | Release 4.6C SR2 / Export / Disco 3 de 4                   |
+-----------+------------+------------------------------------------------------------+
| EXPORT1   | 51013953   | Release 4.6C SR2 / Export / Disco 4 de 4                   |
+-----------+------------+------------------------------------------------------------+
| LANG1     | 51013954   | Release 4.6C SR2 / Language / DE, EN, FR / Disco 1 de 3    |
+-----------+------------+------------------------------------------------------------+

.. raw:: html

   </div>

Seg?n los idiomas que quiera usar es posible que necesite otros CD de
idiomas. S?lo hemos utilizado DE y EN, as? que nos bast? con el primer
CD. Para su informaci?n, los n?meros de los cuatro CD EXPORT son
id?nticos. Los tres CD de idiomas tambi?n tienen el mismo n?mero, aunque
esto es distinto en los CD de la versi?n 4.6B IDES. Al escribir este
texto (20.03.2002) ejecutamos la instalaci?n en FreeBSD 4.5-STABLE
(20.03.2002).

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

10.7.3. Notas SAP?
~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Las siguientes notas han resultado ser muy ?tiles durante la
instalaci?n, as? que le recomendamos encarecidamente que las lea antes
de instalar SAP??R/3?:

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

10.7.3.1. SAP??R/3? 4.6B, Oracle? 8.0.5
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+-----------+---------------------------------------------------------+
| N?mero    | T?tulo                                                  |
+===========+=========================================================+
| 0171356   | SAP Software on Linux: Essential Comments               |
+-----------+---------------------------------------------------------+
| 0201147   | INST: 4.6C R/3 Inst. on UNIX - Oracle                   |
+-----------+---------------------------------------------------------+
| 0373203   | Update / Migration Oracle 8.0.5 --> 8.0.6/8.1.6 LINUX   |
+-----------+---------------------------------------------------------+
| 0072984   | Release of Digital UNIX 4.0B for Oracle                 |
+-----------+---------------------------------------------------------+
| 0130581   | R3SETUP step DIPGNTAB terminates                        |
+-----------+---------------------------------------------------------+
| 0144978   | Your system has not been installed correctly            |
+-----------+---------------------------------------------------------+
| 0162266   | Questions and tips for R3SETUP on Windows NT / W2K      |
+-----------+---------------------------------------------------------+

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

10.7.3.2. SAP??R/3? 4.6C, Oracle? 8.1.7
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+-----------+--------------------------------------------------+
| N?mero    | T?tulo                                           |
+===========+==================================================+
| 0015023   | Initializing table TCPDB (RSXP0004) (EBCDIC)     |
+-----------+--------------------------------------------------+
| 0045619   | R/3 with several languages or typefaces          |
+-----------+--------------------------------------------------+
| 0171356   | SAP Software on Linux: Essential Comments        |
+-----------+--------------------------------------------------+
| 0195603   | RedHat 6.1 Enterprise version: Known problems    |
+-----------+--------------------------------------------------+
| 0212876   | The new archiving tool SAPCAR                    |
+-----------+--------------------------------------------------+
| 0300900   | Linux: Released DELL Hardware                    |
+-----------+--------------------------------------------------+
| 0377187   | RedHat 6.2: important remarks                    |
+-----------+--------------------------------------------------+
| 0387074   | INST: R/3 4.6C SR2 Installation on UNIX          |
+-----------+--------------------------------------------------+
| 0387077   | INST: R/3 4.6C SR2 Inst. on UNIX - Oracle        |
+-----------+--------------------------------------------------+
| 0387078   | SAP Software on UNIX: OS Dependencies 4.6C SR2   |
+-----------+--------------------------------------------------+

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

10.7.4. Requisitos de hardware
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El siguiente equipo es suficiente para la instalaci?n de un sistema
SAP??R/3?. Si pretende darle uso productivo necesitar? hacer un estudio
detallado de sus necesidades:

.. raw:: html

   <div class="informaltable">

+--------------------+---------------------------+---------------------------+
| Componente         | 4.6B                      | 4.6C                      |
+====================+===========================+===========================+
| Procesador         | Pentium? III 800MHz x 2   | Pentium? III 800MHz x 2   |
+--------------------+---------------------------+---------------------------+
| Memoria            | 1GB ECC                   | 2GB ECC                   |
+--------------------+---------------------------+---------------------------+
| Espacio en disco   | 50-60GB (IDES)            | 50-60GB (IDES)            |
+--------------------+---------------------------+---------------------------+

.. raw:: html

   </div>

Para su uso en producci?n le recomendamos procesadores Xeon™ con una
cach? grande, discos de alta velocidad (SCSI, controlador de RAID por
hardware), USV y ECC-RAM. Un espacio en disco tan grande se debe al
sistema IDES preconfigurado, que crea ficheros de bases de datos de
27?GB durante la instalaci?n. Este espacio tambi?n es suficiente para
sistemas de producci?n iniciales y datos de aplicaci?n.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

10.7.4.1. SAP??R/3? 4.6B, Oracle? 8.0.5
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Este es el hardware que utilizamos al escribir este texto: placa base
dual con 2 procesadores Pentium??III a 800?MHz, adaptador SCSI Adaptec?
29160 Ultra160 (para acceder a una unidad de cinta 40/80?GB DLT y
CDROM), Mylex? AcceleRAID™ (2 canales, firmware 6.00-1-00 con 32?MB
RAM). La controladora Mylex? RAID tiene conectados dos discos duros de
17?GB (replicados) y cuatro discos duros de 36?GB (RAID nivel 5).

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

10.7.4.2. SAP??R/3? 4.6C, Oracle? 8.1.7
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Para esta instalaci?n se us? un Dell™ PowerEdge™ 2500: placa base dual
con 2 procesadores Pentium??III a 1000?MHz (256?kB de Cach?), 2?GB PC133
ECC SDRAM, controladora RAID PERC/3 DC PCI con 128?MB y una unidad EIDE
DVD-ROM. La controladora RAID tiene conectados dos discos duros 18?GB
(replicados) y cuatro discos duros de 36?GB (RAID nivel 5).

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

10.7.5. Instalaci?n de FreeBSD
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Lo primero que tiene que hacer es instalar FreeBSD. Hay muchas formas de
hacerlo. Nosotros instalamos FreeBSD 4.3 desde un FTP y FreeBSD?4.5
desde el CD de la distribuci?n. Si necesita m?s informaci?n sobre los
medios de instalaci?n de FreeBSD consulte la `Secci?n?2.13, “C?mo
preparar su propio medio de instalaci?n” <install-diff-media.html>`__.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

10.7.5.1. Esquema de disco
^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Quisimos hacer el proceso lo m?s simple posible, as? que usamos el
esquema de disco de SAP??R/3? 46B y SAP??R/3? 46C SR2. Solo cambiamos
los nombres de dispositivo debido a que las instalaciones tuvieron lugar
en hardware diferente (``/dev/da`` y ``/dev/amr`` respectivamente. Si
utiliza una AMI MegaRAID? ver? en pantalla ``/dev/amr0s1a`` en lugar de
``/dev/da0s1a``):

.. raw:: html

   <div class="informaltable">

+-----------------------+--------------------------+---------------+-----------------------------+
| Sistema de ficheros   | Tama?o (bloques de 1k)   | Tama?o (GB)   | Montado en                  |
+=======================+==========================+===============+=============================+
| ``/dev/da0s1a``       | 1.016.303                | 1             | ``/``                       |
+-----------------------+--------------------------+---------------+-----------------------------+
| ``/dev/da0s1b``       |                          | 6             | swap                        |
+-----------------------+--------------------------+---------------+-----------------------------+
| ``/dev/da0s1e``       | 2.032.623                | 2             | ``/var``                    |
+-----------------------+--------------------------+---------------+-----------------------------+
| ``/dev/da0s1f``       | 8.205.339                | 8             | ``/usr``                    |
+-----------------------+--------------------------+---------------+-----------------------------+
| ``/dev/da1s1e``       | 45.734.361               | 45            | ``/compat/linux/oracle``    |
+-----------------------+--------------------------+---------------+-----------------------------+
| ``/dev/da1s1f``       | 2.032.623                | 2             | ``/compat/linux/sapmnt``    |
+-----------------------+--------------------------+---------------+-----------------------------+
| ``/dev/da1s1g``       | 2.032.623                | 2             | ``/compat/linux/usr/sap``   |
+-----------------------+--------------------------+---------------+-----------------------------+

.. raw:: html

   </div>

Configure e inicialice antes que nada las dos unidades l?gicas con el
software Mylex? o PERC/3 RAID. El software puede iniciarse durante la
fase de arranque de BIOS.

Por favor, tenga en cuenta que el esquema de disco que utilizamos
difiere ligeramente de las recomendaciones de SAP?, ya que SAP? sugiere
montar los subdirectorios Oracle? (y algunos otros) por separado.
Decidimos crearlos como subdirectorios reales para simplificar.

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

10.7.5.2. ``make world`` y un nuevo kernel
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Descargue las fuentes -STABLE m?s recientes. Ejecute ``make world`` y
compile su kernel personalizado. Recuerde incluir en ?l tanto los
`par?metros del kernel <sapr3.html#kerneltuning>`__ requeridos por
SAP??R/3? como los que necesita Oracle?.

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

10.7.6. Instalaci?n del entorno Linux
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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

10.7.6.1. Instalaci?n del sistema base Linux
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Primero instale el port
`linux\_base <linuxemu-lbc-install.html#linuxemu-libs-port>`__ (como
``root``):

.. code:: screen

    # cd /usr/ports/emulators/linux_base
    # make install distclean

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

10.7.6.2. Instalaci?n del entorno de desarrollo Linux
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El entorno de desarrollo Linux es imprescindible si quiere instalar
Oracle? en FreeBSD seg?n se explica en la `Secci?n?10.6, “Instalaci?n de
Oracle?” <linuxemu-oracle.html>`__:

.. code:: screen

    # cd /usr/ports/devel/linux_devtools
    # make install distclean

El entorno de desarrollo Linux solo ha de instalarse si sigue el proceso
para instalar SAP??R/3? 46B IDES. No es necesario si Oracle? DB no est?
reenlazado (?relinked?) con el sistema FreeBSD. Este ser?a su caso si
est? usa el fichero comprimido tar de Oracle? de un sistema Linux.

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

10.7.6.3. Instalaci?n de los RPM necesarios
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Necesitar? soporte PAM para iniciar el programa ``R3SETUP``. Durante la
primera instalaci?n de SAP? en FreeBSD 4.3-STABLE intentamos instalar
PAM con todas las dependencias y finalmente forzamos la instalaci?n del
paquete PAM, y funcion?. En SAP??R/3? 4.6C SR2 forzamos la instalaci?n
del RPM PAM, que tambi?n funcion?, as? que parece que las dependencias
no lo son tanto:

.. code:: screen

    # rpm -i --ignoreos --nodeps --root /compat/linux --dbpath /var/lib/rpm \
    pam-0.68-7.i386.rpm

Para que Oracle? 8.0.5 pueda lanzar el agente inteligente tambi?n
tendremos que instalar el paquete Tcl de RedHat
``tcl-8.0.5-30.i386.rpm`` (si no, cuando lo reenlace durante la
instalaci?n de Oracle? no funcionar?). Existen otros aspectos
relacionados con el reenlazado de Oracle? a tener en cuenta durante la
instalaci?n, pero ata?en a la versi?n para Linux de Oracle? y no son
espec?ficos de FreeBSD.

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

10.7.6.4. Sugerencias
^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Le recomendamos a?adir ``linprocfs`` a ``/etc/fstab``. Consulte
`linprocfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=linprocfs&sektion=5>`__
para m?s informaci?n. Otro par?metro que deber?a configurar es
``kern.fallback_elf_brand=3`` en ``/etc/sysctl.conf``.

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

10.7.7. Creaci?n del entorno SAP??R/3?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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

10.7.7.1. Creaci?n de los sistemas de ficheros y puntos de montaje necesarios
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Para una instalaci?n sencilla es suficiente con crear los siguientes
sistemas de ficheros:

.. raw:: html

   <div class="informaltable">

+-----------------------------+----------------+
| punto de montaje            | tama?o en GB   |
+=============================+================+
| ``/compat/linux/oracle``    | 45 GB          |
+-----------------------------+----------------+
| ``/compat/linux/sapmnt``    | 2 GB           |
+-----------------------------+----------------+
| ``/compat/linux/usr/sap``   | 2 GB           |
+-----------------------------+----------------+

.. raw:: html

   </div>

Tambi?n es necesario crear algunos enlaces. Si no, el instalador SAP?
tendr? problemas ya que buscar? los siguientes enlaces:

.. code:: screen

    # ln -s /compat/linux/oracle /oracle
    # ln -s /compat/linux/sapmnt /sapmnt
    # ln -s /compat/linux/usr/sap /usr/sap

Veamos unos cuantos errores que se le pueden presentar durante la
instalaci?n (en este caso con el sistema *PRD* y la instalaci?n de
SAP??R/3? 4.6C SR2):

.. code:: screen

    INFO 2002-03-19 16:45:36 R3LINKS_IND_IND SyLinkCreate:200
        Checking existence of symbolic link /usr/sap/PRD/SYS/exe/dbg to
        /sapmnt/PRD/exe. Creating if it does not exist...

    WARNING 2002-03-19 16:45:36 R3LINKS_IND_IND SyLinkCreate:400
        Link /usr/sap/PRD/SYS/exe/dbg exists but it points to file
        /compat/linux/sapmnt/PRD/exe instead of /sapmnt/PRD/exe. The
        program cannot go on as long as this link exists at this
        location. Move the link to another location.

    ERROR 2002-03-19 16:45:36 R3LINKS_IND_IND Ins_SetupLinks:0
        can not setup link '/usr/sap/PRD/SYS/exe/dbg' with content
        '/sapmnt/PRD/exe'

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

10.7.7.2. Creaci?n de usuarios y directorios
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

SAP??R/3? necesita dos usuarios y tres grupos. Los nombres de usuario
dependen del “SAP? system ID” (SID), y consisten en tres letras. Algunos
de estos SID est?n reservados por SAP? (por ejemplo ``SAP`` y ``NIX``.
Tiene una lista completa de ellos en la documentaci?n de SAP?). Para la
instalaci?n de IDES usamos ``IDS`` y para la instalaci?n de 4.6C SR2
``PRD``, dado que ese sistema est? pensado para un uso de producci?n.
Tenemos por lo tanto los siguientes grupos (Los ID de grupo pueden ser
diferentes, estos son solamente los valores que utilizamos en nuestra
instalaci?n):

.. raw:: html

   <div class="informaltable">

+---------------+-------------------+----------------------------------+
| ID de grupo   | nombre de grupo   | descripci?n                      |
+===============+===================+==================================+
| 100           | dba               | Administrador de base de datos   |
+---------------+-------------------+----------------------------------+
| 101           | sapsys            | Sistema SAP?                     |
+---------------+-------------------+----------------------------------+
| 102           | oper              | Operador de base de datos        |
+---------------+-------------------+----------------------------------+

.. raw:: html

   </div>

En una instalaci?n por omisi?n de Oracle? solo se usa el grupo ``dba``.
Puede usar el grupo ``oper`` como grupo ``dba`` (consulte la
documentaci?n de Oracle? y SAP? para m?s informaci?n).

Tambi?n necesitaremos los siguientes usuarios:

.. raw:: html

   <div class="informaltable">

+-----------------+---------------------+-------------------+----------+----------------------+-------------------------+
| ID de usuario   | nombre de usuario   | nombre gen?rico   | grupo    | grupos adicionales   | descripci?n             |
+=================+=====================+===================+==========+======================+=========================+
| 1000            | idsadm/prdadm       | *``sid``*\ adm    | sapsys   | oper                 | Administrador SAP?      |
+-----------------+---------------------+-------------------+----------+----------------------+-------------------------+
| 1002            | oraids/oraprd       | ora\ *``sid``*    | dba      | oper                 | Administrador Oracle?   |
+-----------------+---------------------+-------------------+----------+----------------------+-------------------------+

.. raw:: html

   </div>

Al a?adir dichos usuarios mediante
`adduser(8) <http://www.FreeBSD.org/cgi/man.cgi?query=adduser&sektion=8>`__
tenga en cuenta que debe incluir las siguientes entradas (observe la
shell y el directorio home) al crear el “administrador SAP?”:

.. code:: programlisting

    Name: sidadm
    Password: ******
    Fullname: SAP Administrator SID
    Uid: 1000
    Gid: 101 (sapsys)
    Class:
    Groups: sapsys dba
    HOME: /home/sidadm
    Shell: bash  (/compat/linux/bin/bash)

y para el “Administrador Oracle?”:

.. code:: programlisting

    Name: orasid
    Password: ******
    Fullname: Oracle Administrator SID
    Uid: 1002
    Gid: 100 (dba)
    Class:
    Groups: dba
    HOME: /oracle/sid
    Shell: bash  (/compat/linux/bin/bash)

Esto tambi?n incluye al grupo ``oper`` en caso de que est? usando el
grupo ``dba`` y el grupo ``oper``.

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

10.7.7.3. Creaci?n de directorios
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Estos directorios se crean como sistemas de ficheros independientes.
Esto depende totalmente de sus necesidades. Nosotros decidimos crearlos
como directorios ya que todos est?n en el mismo RAID 5:

Primero vamos a configurar los propietarios y los derechos de algunos
directorios (como ``root``):

.. code:: screen

    # chmod 775 /oracle
    # chmod 777 /sapmnt
    # chown root:dba /oracle
    # chown sidadm:sapsys /compat/linux/usr/sap
    # chmod 775 /compat/linux/usr/sap

Luego vamos a crear directorios como el usuario ``orasid``. Estos ser?n
todos subdirectorios de ``/oracle/SID``:

.. code:: screen

    # su - orasid
    # cd /oracle/SID
    # mkdir mirrlogA mirrlogB origlogA origlogB
    # mkdir sapdata1 sapdata2 sapdata3 sapdata4 sapdata5 sapdata6
    # mkdir saparch sapreorg
    # exit

Para la instalaci?n de Oracle? 8.1.7 tendr? que crear unos cuantos
directorios m?s:

.. code:: screen

    # su - orasid
    # cd /oracle
    # mkdir 805_32
    # mkdir client stage
    # mkdir client/80x_32
    # mkdir stage/817_32
    # cd /oracle/SID
    # mkdir 817_32

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

El directorio ``client/80x_32`` tiene que tener exactamente este nombre.
No sustituya la *x* por un n?mero ni por ninguna otra cosa.

.. raw:: html

   </div>

En el tercer paso creamos directorios como usuario ``sid``\ adm:

.. code:: screen

    # su - sidadm
    # cd /usr/sap
    # mkdir SID
    # mkdir trans
    # exit

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

10.7.7.4. Entradas en ``/etc/services``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

SAP??R/3? requiere algunas entradas en ``/etc/services`` que es posible
que no est?n correctamente activadas durante la instalalaci?n. A?ada las
siguientes entradas (necesita al menos las entradas correspondientes al
n?mero de instancia, en este caso, ``00``. No har? ning?n da?o a?adir
todas las entradas de ``00`` hasta ``99`` para ``dp``, ``gw``, ``sp`` y
``ms``). Si va a utilizar un SAProuter o necesita acceder a SAP? OSS,
tambi?n necesitar? ``99``, ya que el puerto 3299 se usa generalmente
para el proceso SAProuter en el sistema destino:

.. code:: programlisting

    sapdp00    3200/tcp # SAP Dispatcher.      3200 + Instance-Number
    sapgw00  3300/tcp # SAP Gateway.         3300 + Instance-Number
    sapsp00  3400/tcp #                      3400 + Instance-Number
    sapms00  3500/tcp #                      3500 + Instance-Number
    sapmsSID 3600/tcp # SAP Message Server.  3600 + Instance-Number
    sapgw00s   4800/tcp # SAP Secure Gateway   4800 + Instance-Number

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

10.7.7.5. Locales necesarios
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

SAP? requiere al menos dos locales que no forman parte de la instalaci?n
por defecto de RedHat. SAP? dispone de los paquetes RPMs que pueda
necesitar; puede descargalos desde su FTP, aunque tenga en cuenta que
solo pueden acceder al mismo los clientes con acceso OSS). Consulte la
nota 0171356, que contiene una lista de los RPM que necesitar?.

Tambi?n puede crear enlaces (por ejemplo desde *de\_DE* y *en\_US* ),
pero no se lo recomendamos si pretende configurar un sistema de
producci?n (no obstante, hemos de reconocer que a nosotros nos ha
funcionado con el sistema IDES sin ning?n problema). Necesitar? al menos
los siguientes locales:

.. code:: programlisting

    de_DE.ISO-8859-1
    en_US.ISO-8859-1

Haga los enlaces de esta manera:

.. code:: screen

    # cd /compat/linux/usr/share/locale
    # ln -s de_DE de_DE.ISO-8859-1
    # ln -s en_US en_US.ISO-8859-1

Si no est?n habr? algunos problemas durante la instalaci?n. Si se
ignoran (es decir, si configura el ``STATUS`` de los pasos relacionados
con esos locales a ``OK`` en el fichero ``CENTRDB.R3S``) ser? imposible
entrar al sistema SAP? sin tener que recurrir a ciertas triqui?uelas.

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

10.7.7.6. Personalizaci?n del kernel
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Los sistemas SAP??R/3? necesitan muchos recursos, por eso hemos a?adido
los siguientes par?metros al fichero de configuraci?n de su kernel:

.. code:: programlisting

    # Set these for memory pigs (SAP and Oracle):
    options MAXDSIZ="(1024*1024*1024)"
    options DFLDSIZ="(1024*1024*1024)"
    # System V options needed.
    options SYSVSHM #SYSV-style shared memory
    options SHMMAXPGS=262144 #max amount of shared mem. pages
    #options SHMMAXPGS=393216 #use this for the 46C inst.parameters
    options SHMMNI=256 #max number of shared memory ident if.
    options SHMSEG=100 #max shared mem.segs per process
    options SYSVMSG #SYSV-style message queues
    options MSGSEG=32767 #max num. of mes.segments in system
    options MSGSSZ=32 #size of msg-seg. MUST be power of 2
    options MSGMNB=65535 #max char. per message queue
    options MSGTQL=2046 #max amount of msgs in system
    options SYSVSEM #SYSV-style semaphores
    options SEMMNU=256 #number of semaphore UNDO structures
    options SEMMNS=1024 #number of semaphores in system
    options SEMMNI=520 #number of semaphore identifiers
    options SEMUME=100       #number of UNDO keys

Puede consultar los valores m?nimos en la documentaci?n de SAP?. Como no
hay detalles sobre Linux, consulte para mayor informaci?n la secci?n de
HP-UX (32-bit). El sistema de instalaci?n 4.6C SR2 tiene m?s memoria
principal, as?n que los segmentos compartidos pueden ser m?s extensos
tanto para SAP? como para Oracle?; elija, por tanto, un n?mero mayor de
p?ginas de memoria compartida.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

En la instalaci?n por omisi?n de FreeBSD?4.5 en i386™, configure
``MAXDSIZ`` y ``DFLDSIZ`` como m?ximo a 1?GB. Si no lo hace podr?an
aparecer errores extra?os como ORA-27102: out of memory y Linux Error:
12: Cannot allocate memory.

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

10.7.8. Instalaci?n de SAP??R/3?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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

10.7.8.1. Preparaci?n de los CDROM
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Hay que montar y desmontar muchos CD-ROM durante la instalaci?n. Si
tiene suficientes unidades de CDROM, podr?a montarlos todos. Nosotros
decidimos copiar el contenido de los CD-ROM a los directorios
correspondientes:

.. code:: programlisting

    /oracle/SID/sapreorg/nombre-cd

Donde *``nombre-cd``* era ``KERNEL``, ``RDBMS``, ``EXPORT1``,
``EXPORT2``, ``EXPORT3``, ``EXPORT4``, ``EXPORT5`` y ``EXPORT6`` para la
instalaci?n 4.6B/IDES, y ``KERNEL``, ``RDBMS``, ``DISK1``, ``DISK2``,
``DISK3``, ``DISK4`` y ``LANG`` para la instalaci?n 4.6C SR2. Todos los
nombres de fichero en los CDs montados deben estar en may?sculas; si no
es as? use la opci?n ``-g`` al montar. Utilice lo siguiente:

.. code:: screen

    # mount_cd9660 -g /dev/cd0a /mnt
    # cp -R /mnt/* /oracle/SID/sapreorg/nombre-cd
    # umount /mnt

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

10.7.8.2. Ejecuci?n del “script” de instalaci?n
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Primero tendr? que preparar un directorio ``install``:

.. code:: screen

    # cd /oracle/SID/sapreorg
    # mkdir install
    # cd install

Una vez arrancado el “script” de instalaci?n copiar? casi todos los
ficheros relevantes en el directorio ``install``:

.. code:: screen

    # /oracle/SID/sapreorg/KERNEL/UNIX/INSTTOOL.SH

La instalaci?n IDES (4.6B) incluye un sistema de demostraci?n SAP??R/3?
totalmente personalizado, as? que hay seis CD EXPORT en lugar de solo
tres. La plantilla de instalaci?n ``CENTRDB.R3S`` est? pensada para una
instancia central est?ndar (R/3? y base de datos), no la instancia
central IDES, as? que hay que copiar el ``CENTRDB.R3S`` correspondiente
del directorio ``EXPORT1``. Si no lo hace ``R3SETUP`` solo pedir? tres
CD EXPORT.

La nueva versi?n de SAP? 4.6C SR2 incluye cuatro CDs EXPORT. El fichero
de par?metros que controla los pasos de la instalaci?n es
``CENTRAL.R3S``. A diferencia de versiones versiones anteriores, no
existen patrones de instalaci?n por separado para una instancia central
con o sin base de datos. SAP? utiliza un patr?n separado para la
instalaci?n de la base de datos. Para reiniciar la instalaci?n despu?s
es suficiente reiniciarla con el fichero original.

Durante y despu?s de la instalaci?n, SAP? necesita que ``hostname``
devuelva *s?lamente* el nombre del sistema, no el nombre cualificado de
dominio. Configure el nombre del equipo de ese modo, o active un alias
mediante ``alias hostname='hostname -s'`` para ``orasid`` y para
``sid``\ adm (y para ``root`` al menos durante los pasos de la
instalaci?n realizados como ``root``). Tambi?n puede configurar los
ficheros ``.profile`` y ``.login`` de los usuarios que se crean durante
la instalaci?n SAP?.

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

10.7.8.3. Inicio de ``R3SETUP`` 4.6B
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Aseg?rese de que ``LD_LIBRARY_PATH`` est? configurada correctamente:

.. code:: screen

    # export LD_LIBRARY_PATH=/oracle/IDS/lib:/sapmnt/IDS/exe:/oracle/805_32/lib

Inicie ``R3SETUP`` como ``root`` desde el directorio de instalaci?n:

.. code:: screen

    # cd /oracle/IDS/sapreorg/install
    # ./R3SETUP -f CENTRDB.R3S

El “script” le preguntar? algunas cosas; le mostramos aqu? entre
corchetes la respuesta por defecto, y despu?s la respuesta que nosotros
introdujimos:

.. raw:: html

   <div class="informaltable">

+------------------------------------------------------------------------------------------------------+-----------------------------------+--------------------------------+
| Pregunta                                                                                             | Por omisi?n                       | Entrada                        |
+======================================================================================================+===================================+================================+
| Enter SAP System ID                                                                                  | [C11]                             | IDS**Intro**                   |
+------------------------------------------------------------------------------------------------------+-----------------------------------+--------------------------------+
| Enter SAP Instance Number                                                                            | [00]                              | **Intro**                      |
+------------------------------------------------------------------------------------------------------+-----------------------------------+--------------------------------+
| Enter SAPMOUNT Directory                                                                             | [/sapmnt]                         | **Intro**                      |
+------------------------------------------------------------------------------------------------------+-----------------------------------+--------------------------------+
| Enter name of SAP central host                                                                       | [troubadix.domain.de]             | **Intro**                      |
+------------------------------------------------------------------------------------------------------+-----------------------------------+--------------------------------+
| Enter name of SAP db host                                                                            | [troubadix]                       | **Intro**                      |
+------------------------------------------------------------------------------------------------------+-----------------------------------+--------------------------------+
| Select character set                                                                                 | [1] (WE8DEC)                      | **Intro**                      |
+------------------------------------------------------------------------------------------------------+-----------------------------------+--------------------------------+
| Enter Oracle server version (1) Oracle 8.0.5, (2) Oracle 8.0.6, (3) Oracle 8.1.5, (4) Oracle 8.1.6   |                                   | 1**Intro**                     |
+------------------------------------------------------------------------------------------------------+-----------------------------------+--------------------------------+
| Extract Oracle Client archive                                                                        | [1] (Yes, extract)                | **Intro**                      |
+------------------------------------------------------------------------------------------------------+-----------------------------------+--------------------------------+
| Enter path to KERNEL CD                                                                              | [/sapcd]                          | /oracle/IDS/sapreorg/KERNEL    |
+------------------------------------------------------------------------------------------------------+-----------------------------------+--------------------------------+
| Enter path to RDBMS CD                                                                               | [/sapcd]                          | /oracle/IDS/sapreorg/RDBMS     |
+------------------------------------------------------------------------------------------------------+-----------------------------------+--------------------------------+
| Enter path to EXPORT1 CD                                                                             | [/sapcd]                          | /oracle/IDS/sapreorg/EXPORT1   |
+------------------------------------------------------------------------------------------------------+-----------------------------------+--------------------------------+
| Directory to copy EXPORT1 CD                                                                         | [/oracle/IDS/sapreorg/CD4\_DIR]   | **Intro**                      |
+------------------------------------------------------------------------------------------------------+-----------------------------------+--------------------------------+
| Enter path to EXPORT2 CD                                                                             | [/sapcd]                          | /oracle/IDS/sapreorg/EXPORT2   |
+------------------------------------------------------------------------------------------------------+-----------------------------------+--------------------------------+
| Directory to copy EXPORT2 CD                                                                         | [/oracle/IDS/sapreorg/CD5\_DIR]   | **Intro**                      |
+------------------------------------------------------------------------------------------------------+-----------------------------------+--------------------------------+
| Enter path to EXPORT3 CD                                                                             | [/sapcd]                          | /oracle/IDS/sapreorg/EXPORT3   |
+------------------------------------------------------------------------------------------------------+-----------------------------------+--------------------------------+
| Directory to copy EXPORT3 CD                                                                         | [/oracle/IDS/sapreorg/CD6\_DIR]   | **Intro**                      |
+------------------------------------------------------------------------------------------------------+-----------------------------------+--------------------------------+
| Enter path to EXPORT4 CD                                                                             | [/sapcd]                          | /oracle/IDS/sapreorg/EXPORT4   |
+------------------------------------------------------------------------------------------------------+-----------------------------------+--------------------------------+
| Directory to copy EXPORT4 CD                                                                         | [/oracle/IDS/sapreorg/CD7\_DIR]   | **Intro**                      |
+------------------------------------------------------------------------------------------------------+-----------------------------------+--------------------------------+
| Enter path to EXPORT5 CD                                                                             | [/sapcd]                          | /oracle/IDS/sapreorg/EXPORT5   |
+------------------------------------------------------------------------------------------------------+-----------------------------------+--------------------------------+
| Directory to copy EXPORT5 CD                                                                         | [/oracle/IDS/sapreorg/CD8\_DIR]   | **Intro**                      |
+------------------------------------------------------------------------------------------------------+-----------------------------------+--------------------------------+
| Enter path to EXPORT6 CD                                                                             | [/sapcd]                          | /oracle/IDS/sapreorg/EXPORT6   |
+------------------------------------------------------------------------------------------------------+-----------------------------------+--------------------------------+
| Directory to copy EXPORT6 CD                                                                         | [/oracle/IDS/sapreorg/CD9\_DIR]   | **Intro**                      |
+------------------------------------------------------------------------------------------------------+-----------------------------------+--------------------------------+
| Enter amount of RAM for SAP + DB                                                                     |                                   | 850**Intro** (en Megabytes)    |
+------------------------------------------------------------------------------------------------------+-----------------------------------+--------------------------------+
| Service Entry Message Server                                                                         | [3600]                            | **Intro**                      |
+------------------------------------------------------------------------------------------------------+-----------------------------------+--------------------------------+
| Enter Group-ID of sapsys                                                                             | [101]                             | **Intro**                      |
+------------------------------------------------------------------------------------------------------+-----------------------------------+--------------------------------+
| Enter Group-ID of oper                                                                               | [102]                             | **Intro**                      |
+------------------------------------------------------------------------------------------------------+-----------------------------------+--------------------------------+
| Enter Group-ID of dba                                                                                | [100]                             | **Intro**                      |
+------------------------------------------------------------------------------------------------------+-----------------------------------+--------------------------------+
| Enter User-ID of *``sid``*\ adm                                                                      | [1000]                            | **Intro**                      |
+------------------------------------------------------------------------------------------------------+-----------------------------------+--------------------------------+
| Enter User-ID of ora\ *``sid``*                                                                      | [1002]                            | **Intro**                      |
+------------------------------------------------------------------------------------------------------+-----------------------------------+--------------------------------+
| Number of parallel procs                                                                             | [2]                               | **Intro**                      |
+------------------------------------------------------------------------------------------------------+-----------------------------------+--------------------------------+

.. raw:: html

   </div>

Si no ha copiado los CD a su disco duro el instalador SAP? no podr?
encontrar el CD que necesite (identifica los contenidos mediante fichero
``LABEL.ASC`` de cada CD) y por lo tanto le pedir? que introduzca y
monte el CD, o que confirme o introduzca la ruta de montaje.

``CENTRDB.R3S`` puede contener alg?n error. En nuestro caso, solicit? el
CD EXPORT4 m?s de una vez, pero se le indic? la clave correcta
(6\_LOCATION, luego 7\_LOCATION, etc), as? que pudimos continuar
introduciendo los valores correctos.

Aparte de algunos problemas que se detallan m?s adelante deber?amos ir
llegando a la instalaci?n del software de base de datos Oracle?.

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

10.7.8.4. Iniciar ``R3SETUP`` 4.6C SR2
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Aseg?rese de que ``LD_LIBRARY_PATH`` est? correctamente configurada.
Tenga en cuenta de que es un valor diferente de la instalaci?n 4.6B con
Oracle? 8.0.5:

.. code:: screen

    # export LD_LIBRARY_PATH=/sapmnt/PRD/exe:/oracle/PRD/817_32/lib

Arranque ``R3SETUP`` como el usuario ``root`` desde el directorio de
instalaci?n:

.. code:: screen

    # cd /oracle/PRD/sapreorg/install
    # ./R3SETUP -f CENTRAL.R3S

El “script” le preguntar? algunas cosas. Le presentamos la respuesta por
omisi?n entre corchetes y despu?s la respuesta que dimos nosotros):

.. raw:: html

   <div class="informaltable">

+------------------------------------------------+----------------------+--------------------------------+
| Pregunta                                       | Por omisi?n          | Entrada                        |
+================================================+======================+================================+
| Enter SAP System ID                            | [C11]                | PRD**Intro**                   |
+------------------------------------------------+----------------------+--------------------------------+
| Enter SAP Instance Number                      | [00]                 | **Intro**                      |
+------------------------------------------------+----------------------+--------------------------------+
| Enter SAPMOUNT Directory                       | [/sapmnt]            | **Intro**                      |
+------------------------------------------------+----------------------+--------------------------------+
| Enter name of SAP central host                 | [majestix]           | **Intro**                      |
+------------------------------------------------+----------------------+--------------------------------+
| Enter Database System ID                       | [PRD]                | PRD**Intro**                   |
+------------------------------------------------+----------------------+--------------------------------+
| Enter name of SAP db host                      | [majestix]           | **Intro**                      |
+------------------------------------------------+----------------------+--------------------------------+
| Select character set                           | [1] (WE8DEC)         | **Intro**                      |
+------------------------------------------------+----------------------+--------------------------------+
| Enter Oracle server version (2) Oracle 8.1.7   |                      | 2**Intro**                     |
+------------------------------------------------+----------------------+--------------------------------+
| Extract Oracle Client archive                  | [1] (Yes, extract)   | **Intro**                      |
+------------------------------------------------+----------------------+--------------------------------+
| Enter path to KERNEL CD                        | [/sapcd]             | /oracle/PRD/sapreorg/KERNEL    |
+------------------------------------------------+----------------------+--------------------------------+
| Enter amount of RAM for SAP + DB               | 2044                 | 1800**Intro** (in Megabytes)   |
+------------------------------------------------+----------------------+--------------------------------+
| Service Entry Message Server                   | [3600]               | **Intro**                      |
+------------------------------------------------+----------------------+--------------------------------+
| Enter Group-ID of sapsys                       | [100]                | **Intro**                      |
+------------------------------------------------+----------------------+--------------------------------+
| Enter Group-ID of oper                         | [101]                | **Intro**                      |
+------------------------------------------------+----------------------+--------------------------------+
| Enter Group-ID of dba                          | [102]                | **Intro**                      |
+------------------------------------------------+----------------------+--------------------------------+
| Enter User-ID of ``oraprd``                    | [1002]               | **Intro**                      |
+------------------------------------------------+----------------------+--------------------------------+
| Enter User-ID of ``prdadm``                    | [1000]               | **Intro**                      |
+------------------------------------------------+----------------------+--------------------------------+
| LDAP support                                   |                      | 3**Intro** (no support)        |
+------------------------------------------------+----------------------+--------------------------------+
| Installation step completed                    | [1] (continue)       | **Intro**                      |
+------------------------------------------------+----------------------+--------------------------------+
| Choose installation service                    | [1] (DB inst,file)   | **Intro**                      |
+------------------------------------------------+----------------------+--------------------------------+

.. raw:: html

   </div>

La creaci?n de usuarios da un error durante la instalaci?n en las fases
OSUSERDBSID\_IND\_ORA (al crear al usuario ``orasid``) y
OSUSERSIDADM\_IND\_ORA (al crear el usuario ``sid``\ adm).

M?s adelante hablaremos de cierto problemas que a?n tenemos pendientes,
pero ha llegado el momento de instalar el software de base de datos
Oracle?.

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

10.7.9. Instalaci?n de Oracle? 8.0.5
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Consulte los ``Readme`` de Oracle? y las notas de de SAP? sobre Linux y
Oracle? DB por si hubiera algo que le pueda afectar. La mayor?a de los
problemas, por no decir todos, tienen su origen en bibliotecas
incompatibles.

Para mayor informaci?n sobre la instalaci?n de Oracle? dir?jase al
`cap?tulo de instalaci?n de Oracle?. <linuxemu-oracle.html>`__

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

10.7.9.1. Instalaci?n de Oracle? 8.0.5 con ``orainst``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Si quiere instalar Oracle? 8.0.5 necesitar? unas cuantas bibliotecas
para el enlazado, ya que Oracle? 8.0.5 fu? enlazado con una glibc
antigua (la de RedHat 6.0), pero RedHat 6.1 usa una nueva glibc. Tendr?
que instalar los siguientes paquetes para asegurarse que el reenlazado
funcione:

``compat-libs-5.2-2.i386.rpm``

``compat-glibc-5.2-2.0.7.2.i386.rpm``

``compat-egcs-5.2-1.0.3a.1.i386.rpm``

``compat-egcs-c++-5.2-1.0.3a.1.i386.rpm``

``compat-binutils-5.2-2.9.1.0.23.1.i386.rpm``

Para m?s informaci?n consulte las notas correspondientes de SAP? o los
``Readme`` de Oracle?. Si no es posible (durante la instalaci?n no
tuvimos tiempo suficiente para ello), se podr?an utilizar los binarios
originales, o los binarios reenlazados de un sistema original RedHat.

Instale el paquete Tcl de RedHat para compilar el agente inteligente. Si
no puede conseguir ``tcl-8.0.3-20.i386.rpm`` deber?a funcionar una
versi?n m?s reciente, por ejemplo ``tcl-8.0.5-30.i386.rpm`` para RedHat.

Aparte del reenlazado, la instalaci?n es muy sencilla:

.. code:: screen

    # su - oraids
    # export TERM=xterm
    # export ORACLE_TERM=xterm
    # export ORACLE_HOME=/oracle/IDS
    # cd $ORACLE_HOME/orainst_sap
    # ./orainst

Confirme todas las pantallas con **Intro** hasta que el software est?
instalado; todas excepto en la que debe quitar la marca de instalaci?n
al *visualizador de textos Oracle? en l?nea*, ya que no existe para
Linux. Oracle? intentar?, gracias a esto, reenlazar con
``i386-glibc20-linux-gcc`` en lugar de ``gcc``, ``egcs`` o
``i386-redhat-linux-gcc``.

Debido a la falta de tiempo decidimos usar los binarios de una versi?n
Oracle? 8.0.5 PreProduction, despu?s de que nuestro primer intento de
que funcionara la versi?n del CD RDBMS fallara y viendo que encontrar y
utilizar los RPM correctos hubiera sido una pesadilla.

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

10.7.9.2. Instalaci?n de Oracle? 8.0.5 “Pre-production Release” para Linux (Kernel 2.0.33)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

La instalaci?n es bastante f?cil. Monte el CD e inicie el instalador. Le
preguntar? por la ubicaci?n del directorio home de Oracle?, y copiar? en
?l todos los binarios. (Nosotros no eliminamos los restos de una
instalaci?n RDBMS anterior que no termin? de lleg? a terminar).

Tras esto la base de datos Oracle? puede arrancar.

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

10.7.10. Instalaci?n desde el fichero comprimido de Linux Oracle? 8.1.7
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Descomprima el fichero ``oracle81732.tgz`` (creado en el directorio de
instalaci?n en un sistema Linux) y descompr?malo en
``/oracle/SID/817_32/``.

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

10.7.11. Contin?e con la instalaci?n SAP??R/3?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Revise las configuraciones del entorno de los usuarios ``idsamd``
(*``sid``*\ adm) y ``oraids`` (ora*``sid``*). Ambos deben tener los
ficheros ``.profile``, ``.login`` y ``.cshrc`` con ``hostname``
correctamente configurado. En caso que el nombre del sistema sea el
nombre cualificado completo tendr? que cambiar ``hostname`` a
``hostname -s`` en los tres ficheros anteriormente citados.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

10.7.11.1. Carga de la base de datos
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Hecho esto puede rearrancar ``R3SETUP`` o volver a arrancar la
instalaci?n (dependiendo si eligi? salir o no). ``R3SETUP`` crea las
tablas y carga los datos (en 46B IDES, desde EXPORT1 a EXPORT6, en 46C
desde DISK1 a DISK4) mediante ``R3load``.

Cuando se termina la carga de la base de datos (que puede llevar un par
de horas) se le pedir?n algunas contrase?as. En una instalaci?n de
prueba puede usar unas contrase?as de compromiso. (*use una contrase?a
de verdad si le preocupa siquiera ligeramente la seguridad*):

.. raw:: html

   <div class="informaltable">

+-------------------------------+--------------------------------+
| Pregunta                      | Entrada                        |
+===============================+================================+
| Enter Password for sapr3      | sap**Intro**                   |
+-------------------------------+--------------------------------+
| Confirum Password for sapr3   | sap**Intro**                   |
+-------------------------------+--------------------------------+
| Enter Password for sys        | change\_on\_install**Enter**   |
+-------------------------------+--------------------------------+
| Confirm Password for sys      | change\_on\_install**Enter**   |
+-------------------------------+--------------------------------+
| Enter Password for system     | manager**Intro**               |
+-------------------------------+--------------------------------+
| Confirm Password for system   | manager**Intro**               |
+-------------------------------+--------------------------------+

.. raw:: html

   </div>

Aqu? tuvimos problemas con ``dipgntab`` en la instalaci?n de 4.6B.

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

10.7.11.2. Las escuchas
^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Arranque las escuchas de Oracle? con el usuario ``orasid`` de la
siguiente manera:

.. code:: screen

    % umask 0; lsnrctl start

Si no lo hace as? ver? un error ORA-12546, ya que los sockets no tendr?n
los permisos correctos. Consulte la nota 072984 de SAP?.

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

10.7.11.3. Actualizaci?n de tablas MNLS
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Si tiene previsto importar idiomas que no sean Latin-1 en SAP? tiene que
actualizar las tablas “Multi National Language Support”. Tiene m?s
informaci?n sobre esto en las notas de SAP? OSS 15023 y 45619. Si no es
su caso puede saltarse esta parte de la instalaci?n de SAP?.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Aunque no necesite soporte MNLS sigue siendo necesario que revise la
tabla TCPDB y que la inicialice si no lo ha hecho ya. Consulte las notas
0015023 y 0045619 de SAP? para m?s informaci?n.

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

10.7.12. Pasos para despu?s de la instalaci?n
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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

10.7.12.1. Solicitar una licencia SAP??R/3?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Tiene que solicitar una licencia de SAP??R/3?. No tendr? m?s remedio,
puesto que la licencia temporal que se usa durante la instalaci?n tiene
un l?mite de validez de cuatro semanas. Necesitar? la llave hardware.
Entre al sistema como usuario ``idsadm`` y ejecute ``saplicense``:

.. code:: screen

    # /sapmnt/IDS/exe/saplicense -get

Si ejecuta ``saplicense`` sin par?metros ver? una lista de opciones. Una
vez que tenga la licencia en su poder la podr? instalar del siguiente
modo:

.. code:: screen

    # /sapmnt/IDS/exe/saplicense -install

Se le solicitar? que introduzca los siguientes valores:

.. code:: programlisting

    SAP SYSTEM ID   = SID, 3 caracteres
    CUSTOMER KEY    = llave hardware, 11 caracteres
    INSTALLATION NO = instalaci?n, 10 caracteres
    EXPIRATION DATE = yyyymmdd, normalmente "99991231"
    LICENSE KEY     = licencia, 24 caracteres

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

10.7.12.2. Crear usuarios
^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Cree un usuario dentro del cliente 000 (es necesario para algunas tareas
que requieren hacerse dentro del cliente 000, pero con un usuario que no
sea ni ``sap*`` ni ``ddic``). Nosotros solemos elegir para este usuario
el nombre de ``wartung`` (o ``service``, ambos “servicio” en
castellano). Los perfiles son ``sap_new`` y ``sap_all``. Para mayor
seguridad las contrase?as para usuarios por defecto dentro de todos los
clientes deben cambiarse (incluidos los usuarios ``sap*`` y ``ddic``).

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

10.7.12.3. Configurar sistema de transporte, perfil, modos de operaci?n, etc.
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dentro del cliente 000 y con un usuario que no sea ``ddic`` ni ``sap*``,
haga al menos lo siguiente:

.. raw:: html

   <div class="informaltable">

+--------------------------------------------------------------------------------------------+---------------+
| Tarea                                                                                      | Transacci?n   |
+============================================================================================+===============+
| Configurar sistema de transporte, por ejemplo como *Stand-Alone Transport Domain Entity*   | STMS          |
+--------------------------------------------------------------------------------------------+---------------+
| Crear / editar perfil para el sistema                                                      | RZ10          |
+--------------------------------------------------------------------------------------------+---------------+
| Mantener modos de operaci?n e instancias                                                   | RZ04          |
+--------------------------------------------------------------------------------------------+---------------+

.. raw:: html

   </div>

Todos estos (y muchos m?s) pasos para ejecutar despu?s de la instalaci?n
se explican de forma detallada en las gu?as de instalaci?n de SAP?.

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

10.7.12.4. Editar ``initsid.sap`` (``initIDS.sap``)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El fichero ``/oracle/IDS/dbs/initIDS.sap`` contiene la copia de
seguridad del perfil de de SAP?. Aqu? es donde debe definir el tama?o de
la cinta a utilizar, tipo de conpresi?n, etc. Las siguientes
modificaciones nos permitir?an ejecutar ``sapdba`` / ``brbackup``:

.. code:: programlisting

    compress = hardware
    archive_function = copy_delete_save
    cpio_flags = "-ov --format=newc --block-size=128 --quiet"
    cpio_in_flags = "-iuv --block-size=128 --quiet"
    tape_size = 38000M
    tape_address = /dev/nsa0
    tape_address_rew = /dev/sa0

Explicaci?n:

``compress``: La cinta que usamos es una HP DLT1 que tiene compresi?n
por hardware.

``archive_function``: Define el comportamiento por omisi?n del
almacenaje de los logs de Oracle?: los nuevos ficheros de log se guardan
en cinta, los ficheros de log que ya han sido guardados se guardan de
nuevo y luego se borran. As? se evitan muchos problemas si necesita
recuperar la base de datos y una de las cintas est? da?ada.

``cpio_flags``: por omisi?n se usa ``-B``, que asigna un tama?o de
bloque de 5120?Bytes. HP recomienda un tama?o de bloque de 32?K como
m?nimo; usamos ``--block-size=128`` para que sea de 64?K. Necesitaremos
usar ``--format=newc`` porque tenemos n?meros de inodo mayores a 65535.
La ?ltima opci?n (``--quiet``) se necesita ya que ``brbackup`` se queja
en cuanto ``cpio`` imprime los n?meros de bloque guardados.

``cpio_in_flags``: Par?metros necesarios para cargar datos desde la
cinta. El formato es reconocido autom?ticamente.

``tape_size``: La capacidad de almacenaje de la cinta. Por razones de
seguridad (nosotros usamos compresi?n por hardware) el valor es
ligeramente menor que el valor real.

``tape_address``: El dispositivo (que no permite el rebobinado) que se
usar? con ``cpio``.

``tape_address_rew``: El dispositivo (que permite el rebobinado) que se
usar? con ``cpio``.

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

10.7.12.5. Aspectos de la configuraci?n una vez concluida la instalaci?n
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Los siguientes par?metros SAP? deben personalizarse una vez conclu?da la
instalaci?n (los ejemplos son para IDES 46B, 1?GB de memoria):

.. raw:: html

   <div class="informaltable">

+---------------------------+-------------+
| Nombre                    | Valor       |
+===========================+=============+
| ztta/roll\_extension      | 250000000   |
+---------------------------+-------------+
| abap/heap\_area\_dia      | 300000000   |
+---------------------------+-------------+
| abap/heap\_area\_nondia   | 400000000   |
+---------------------------+-------------+
| em/initial\_size\_MB      | 256         |
+---------------------------+-------------+
| em/blocksize\_kB          | 1024        |
+---------------------------+-------------+
| ipc/shm\_psize\_40        | 70000000    |
+---------------------------+-------------+

.. raw:: html

   </div>

SAP? Note 0013026:

.. raw:: html

   <div class="informaltable">

+---------------------+-----------+
| Nombre              | Valor     |
+=====================+===========+
| ztta/dynpro\_area   | 2500000   |
+---------------------+-----------+

.. raw:: html

   </div>

SAP? Note 0157246:

.. raw:: html

   <div class="informaltable">

+---------------------+---------+
| Nombre              | Valor   |
+=====================+=========+
| rdisp/ROLL\_MAXFS   | 16000   |
+---------------------+---------+
| rdisp/PG\_MAXFS     | 30000   |
+---------------------+---------+

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

En un sistema con 1?GB de memoria y los par?metros arriba expuestos
puede esperarse encontrar un consumo de memoria similar al siguiente:

.. code:: programlisting

    Mem: 547M Active, 305M Inact, 109M Wired, 40M Cache, 112M Buf, 3492K Free

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

10.7.13. Problemas durante la instalaci?n
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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

10.7.13.1. Reiniciar ``R3SETUP`` una vez arreglado el problema
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``R3SETUP`` se detiene si encuentra un error. Si ha revisado los logs y
ha corregido el error reinicie ``R3SETUP``; h?galo seleccionando la
opci?n REPEAT en el paso donde ``R3SETUP`` se detuvo.

Cuando quiera reiniciar ``R3SETUP`` in?cielo con el fichero ``R3S``
correspondiente:

.. code:: screen

    # ./R3SETUP -f CENTRDB.R3S

en el caso de 4.6B, o con

.. code:: screen

    # ./R3SETUP -f CENTRAL.R3S

en 4.6C; no importa si el error ocurri? con ``CENTRAL.R3S`` o con
``DATABASE.R3S``.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

En algunas etapas, ``R3SETUP`` asume que la base de datos y los procesos
SAP? est?n en marcha (como aquellos en los cuales se completaron los
pasos). Si hay errores y por ejemplo la base de datos no se puede
iniciar tendr? que arrancar la base de datos y SAP? manualmente una vez
haya corregido los errores y antes de iniciar ``R3SETUP`` nuevamente.

No olvide iniciar tambi?n la escucha de Oracle? (como ``orasid`` con
``umask 0; lsnrctl start``) si tambi?n tuvo que detenerlo (si por
ejemplo hubo que reiniciar el sistema).

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

10.7.13.2. OSUSERSIDADM\_IND\_ORA durante ``R3SETUP``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Si ``R3SETUP`` se queja en este etapa edite la plantilla ``R3SETUP`` que
est? usando en ese momento (``CENTRDB.R3S`` (en 4.6B) o ``CENTRAL.R3S``
o ``DATABASE.R3S`` (en 4.6C)). Ubique ``[OSUSERSIDADM_IND_ORA]`` o
busque la ?nica entrada ``STATUS=ERROR`` y edite los siguientes valores:

.. code:: programlisting

    HOME=/home/sidadm (was empty)
    STATUS=OK (had status ERROR)
            

Hecho esto, reinicie ``R3SETUP``.

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

10.7.13.3. OSUSERDBSID\_IND\_ORA durante ``R3SETUP``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Es posible que ``R3SETUP`` se queje tambi?n en esta etapa. El error aqu?
es similar al de la fase OSUSERSIDADM\_IND\_ORA. Edite la plantilla
``R3SETUP`` que est? usando (``CENTRDB.R3S`` (en 4.6B) o ``CENTRAL.R3S``
o ``DATABASE.R3S`` (en 4.6C)). Ubique ``[OSUSERDBSID_IND_ORA]`` o busque
la ?nica entrada ``STATUS=ERROR`` y edite los siguientes valores en esa
secci?n:

.. code:: programlisting

    STATUS=OK

Hecho esto reinicie ``R3SETUP``.

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

10.7.13.4. oraview.vrf FILE NOT FOUND durante la instalaci?n de Oracle?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

No ha dejado sin seleccionar la opci?n de instalar el *visualizador de
texto en l?nea de Oracle?* antes de iniciar la instalaci?n. Est?
seleccionado para ser instalado, aunque la aplicaci?n no existe para
Linux. Deje sin seleccionar el producto en el men? de instalaci?n de
Oracle? y reinicie la instalaci?n.

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

10.7.13.5. TEXTENV\_INVALID durante ``R3SETUP``, o inicio de RFC o SAPgui
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Si se encuentra con este error significa que falta el locale correcto.
La nota 0171356 de SAP? contiene una lista de RPM que deben instalarse
(p.ej. ``saplocales-1.0-3``, ``saposcheck-1.0-1`` para RedHat 6.1). En
caso de que ignore todos los errores relacionados y configure los
``STATUS`` correspondientes de ``ERROR`` a ``OK`` (en ``CENTRDB.R3S``)
cada vez que ``R3SETUP`` se queje y simplemente reinicie ``R3SETUP``; el
sistema SAP? no estar? configurado correctamente y no podr? conectarse
al sistema con SAPgui, aunque el sistema pueda arrancar. Si intenta
conectar con el antiguo SAPgui de Linux recibir? los siguientes
mensajes:

.. code:: programlisting

    Sat May 5 14:23:14 2001
    *** ERROR => no valid userarea given [trgmsgo. 0401]
    Sat May 5 14:23:22 2001
    *** ERROR => ERROR NR 24 occured [trgmsgi. 0410]
    *** ERROR => Error when generating text environment. [trgmsgi. 0435]
    *** ERROR => function failed [trgmsgi. 0447]
    *** ERROR => no socket operation allowed [trxio.c 3363]
    Speicherzugriffsfehler

Este comportamiento se debe a que SAP??R/3? es incapaz de asignar
correctamente un locale y tampoco puede configurarse a s? mismo
correctamente (faltan entradas en algunas tablas de la base de datos).
A?ada las siguientes entradas al fichero ``DEFAULT.PFL`` y podr?
conectarse a SAP? (vea la nota 0043288):

.. code:: programlisting

    abap/set_etct_env_at_new_mode = 0
    install/collate/active = 0
    rscp/TCP0B = TCP0B

Reinicie el sistema SAP?. Puede conectar al sistema, aunque la
configuraci?n de idioma o de pa?s puede que no funcione como se espera
de ella. Una vez corregidas las configuraciones de pa?s (y
proporcionados los locales adecuados) puede eliminar estas entradas de
``DEFAULT.PFL`` y el sistema SAP? puede reiniciarse.

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

10.7.13.6. ORA-00001
^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Este error solo aparece con Oracle? 8.1.7 en FreeBSD?4.5. Se debe a que
la base de datos Oracle? no puede inicializarse correctamente y se viene
abajo, dejando sem?foros y memoria compartida en el sistema. El
siguiente intento de iniciar la base de datos produce el error
ORA-00001.

Encu?ntrelos con ``ipcs -a`` y elim?nelos con ``ipcrm``.

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

10.7.13.7. ORA-00445 (Brackground Process PMON Did Not Start)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Este error tuvo lugar con Oracle? 8.1.7. Aparece si se arranca la base
de datos con el “script” ``startsap`` (por ejemplo
``startsap_majestix_00``) con el usuario ``prdadm``.

Una soluci?n (entre otras) es iniciar la base de datos con el usuario
``oraprd`` en lugar de hacerlo con ``svrmgrl``:

.. code:: screen

    % svrmgrl
    SVRMGR> connect internal;
    SVRMGR> startup;
    SVRMGR> exit

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

10.7.13.8. ORA-12546 (Start Listener with Correct Permissions)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Inicie la escucha de Oracle? como usuario ``oraids`` con la siguiente
orden:

.. code:: screen

    # umask 0; lsnrctl start

De no ser as? puede encontrarse con el error ORA-12546, ya que los
sockets no tendr?n los permisos adecuados. Consulte la nota de SAP?
0072984.

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

10.7.13.9. ORA-27102 (Out of Memory)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Este error ocurre al tratar de usar valores mayores a 1?GB
(1024x1024x1024) en ``MAXDSIZ`` y ``DFLDSIZ``. Recibiremos, adem?s, este
otro error: Linux Error 12: Cannot allocate memory.

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

10.7.13.10. [DIPGNTAB\_IND\_IND] during ``R3SETUP``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Consulte la nota de SAP? 0130581 de (``R3SETUP`` step (``DIPGNTAB``
terminates). Por alguna raz?n durante la instalaci?n espec?fica IDES el
proceso de instalaci?n no usaba el nombre de sistema correcto SAP? “IDS”
sino la cadena vac?a ``""``. Esto provocaba algunos errores menores en
el acceso a directorios, ya que las rutas se generan din?micamente en
base a dicho *``SID``* (en este caso IDS). En lugar de ejecutar los
accesos del siguiente modo :

.. code:: programlisting

    /usr/sap/IDS/SYS/...
    /usr/sap/IDS/DVMGS00

se usaron las siguientes rutas:

.. code:: programlisting

    /usr/sap//SYS/...
    /usr/sap/D00

Para continuar con la instalaci?n creamos un enlace y un directorio
adicional:

.. code:: screen

    # pwd
    /compat/linux/usr/sap
    # ls -l
    total 4
    drwxr-xr-x 3  idsadm sapsys 512 May 5 11:20 D00
    drwxr-x--x 5  idsadm sapsys 512 May 5 11:35 IDS
    lrwxr-xr-x 1  root   sapsys 7 May 5 11:35 SYS -> IDS/SYS
    drwxrwxr-x 2  idsadm sapsys 512 May 5 13:00 tmp
    drwxrwxr-x 11 idsadm sapsys 512 May 4 14:20 trans

Encontramos una descripci?n de este comportamiento en las notas de SAP?.
(0029227 y 0008401). En la instalaci?n de SAP? 4.6C no tuvimos estos
problemas.

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

10.7.13.11. [RFCRSWBOINI\_IND\_IND] during ``R3SETUP``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Durante la instalaci?n de SAP? 4.6C nos encontramos con este error, cuyo
origen est? en un error que tuvo lugar anteriormente durante la propia
instalaci?n. Busque en sus ficheros de log y corrija el problema.

Si despues de buscar en los logs el error resulta ser el correcto
(revise las notas de SAP?), puede poner el ``STATUS`` del paso donde se
produce el error de ``ERROR`` a ``OK`` (en el fichero ``CENTRDB.R3S``) y
reiniciar ``R3SETUP``. Una vez finalizada la instalaci?n, tiene que
ejecutar el informe ``RSWBOINS`` de la transacci?n SE38. Consulte la
nota SAP? 0162266 para m?s informaci?n sobre las fases ``RFCRSWBOINI`` y
``RFCRADDBDIF``.

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

10.7.13.12. [RFCRADDBDIF\_IND\_IND] during ``R3SETUP``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Aqu? sucede lo mismo de antes, aseg?rese, revisando los logs, de que la
causa de este error no est? en alg?n problema previo.

Si en la nota de SAP? 0162266 est? la soluci?n ponga el ``STATUS`` del
paso donde se produce el error de ``ERROR`` a ``OK`` (en el fichero
``CENTRDB.R3S``) y reinicie ``R3SETUP``. Una vez finalizada la
instalaci?n ejecute el informe ``RADDBDIF`` desde la transacci?n SE38.

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

10.7.13.13. sigaction sig31: File size limit exceeded
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Este error ocurri? durante el inicio del proceso SAP? *disp+work*. Si
inicia SAP? con el “script” ``startsap`` se inician los subprocesos que
se separan y hacen el “trabajo sucio” de iniciar el resto de procesos de
SAP?, pero es importante saber que el propio “script” no notar? si algo
ha ido mal.

Puede revisar si los procesos SAP? se iniciaron correctamente con
``ps ax | grep SID``, que le proporcionar? una lista de todos los
procesos de Oracle? y de SAP?. Si parece que algunos procesos no est?n,
o si no puede conectarse al sistema SAP? revise los logs que encontrar?
en ``/usr/sap/SID/DVEBMGSnr/work/``. Los ficheros que debe revisar son
``dev_ms`` y ``dev_disp``.

La se?al 31 aparece si la cantidad de memoria compartida asignada a
Oracle? y SAP? supera la definida dentro del fichero de configuraci?n
del kernel y puede resolverse usando un valor mayor:

.. code:: programlisting

    # larger value for 46C production systems:
    options SHMMAXPGS=393216
    # smaller value sufficient for 46B:
    #options SHMMAXPGS=262144

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

10.7.13.14. Start of ``saposcol`` Failed
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Hay algunos problemas con el programa ``saposcol`` (version 4.6D). El
sistema SAP? utiliza ``saposcol`` para recoger datos del rendimiento del
sistema. Este programa no es necesario para usar el sistema SAP?, as?
que el problema puede considerarse como poco importante. La versi?n m?s
antigua (4.6B) funciona, pero no recoge todos los datos (muchas llamadas
devolver?n un 0, por ejemplo el uso de CPU).

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------+-----------------------------+---------------------------------------------+
| `Anterior <linuxemu-oracle.html>`__?   | `Subir <linuxemu.html>`__   | ?\ `Siguiente <linuxemu-advanced.html>`__   |
+----------------------------------------+-----------------------------+---------------------------------------------+
| 10.6. Instalaci?n de Oracle??          | `Inicio <index.html>`__     | ?10.8. Temas avanzados                      |
+----------------------------------------+-----------------------------+---------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
