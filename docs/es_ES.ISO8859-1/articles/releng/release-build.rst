=============================
3. Construcci?n de la Release
=============================

.. raw:: html

   <div class="navheader">

3. Construcci?n de la Release
`Anterior <release-proc.html>`__?
?
?\ `Siguiente <distribution.html>`__

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

3. Construcci?n de la Release
-----------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Cualquier persona due?a de una potente m?quina y con acceso de lectura
al repositorio de c?digo fuente puede “construir” las “releases” de
FreeBSD. En la pr?ctica esto significa que cualquiera puede generar el
proceso de construcci?n de releases, ya que, como se coment? con
anterioridad, FreeBSD ofrece acceso CVS an?nimo a todo el mundo
(consulte el Handbook para m?s detalles). El ?nico requisito
imprescindible para realizar este proceso es la existencia del
dispositivo
`vn(4) <http://www.FreeBSD.org/cgi/man.cgi?query=vn&sektion=4>`__. (En
-CURRENT, este dispositivo ha sido reemplazado por el nuevo driver de
discos en memoria denominado
`md(4) <http://www.FreeBSD.org/cgi/man.cgi?query=md&sektion=4>`__.) Si
el dispositivo no se encuentra cargado en el kernel, deber?a cargarse
autom?ticamente al ejecutar el comando
`vnconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=vnconfig&sektion=8>`__
como parte de la fase de creaci?n del medio de arranque. Todas las
herramientas necesarias para construir la release se encuentran
disponibles en el repositorio de CVS dentro del directorio
``src/release``. Estas herramientas proporcionan una forma consistente y
robusta de construir releases de FreeBSD. Una release completa se puede
construir utilizando un ?nico comando, incluyendo la creaci?n de las
im?genes ISO necesarias para realizar copias en CDROM, junto con
disquetes de instalaci?n y un directorio para la instalaci?n por FTP.
Este comando fue adecuadamente bautizado como ``make release``.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.1. ``make release``
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Para poder construir la releases de una forma exitosa se debe rellenar
primero el directorio ``/usr/obj`` ejecutando el comando ``make world``
o simplemente ``make       buildworld``. El target release que utiliza
el comando make necesita varias variables, tal como se muestra a
continuaci?n:

.. raw:: html

   <div class="itemizedlist">

-  ``CHROOTDIR`` - El directorio que se utiliza para el entorno de
   chroot durante la construcci?n de la release entera.

-  ``BUILDNAME`` - El nombre de la release que se va a construir.

-  ``CVSROOT`` - La ubicaci?n del repositorio de CVS.

-  ``RELEASETAG`` - La etiqueta CVS correspondiente con la release que
   se quiere construir.

.. raw:: html

   </div>

Si no se dispone de acceso a un repositorio de CVS local, se puede
realizar una copia espejo (un mirror) con
`CVSup <http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/synching.html#CVSUP>`__.
El fichero ``/usr/share/examples/cvsup/cvs-supfile``, sirve como buen
punto de partida para realizar un mirror del repositorio de CVS.

Si se omite ``RELEASETAG``, la release se construir? a partir de la rama
``HEAD`` (tambi?n conocida como -CURRENT). Las releases que se
construyen desde el principio se conocen normalmente con el nombre de
“-CURRENT snapshots”.

Existen otras variables que se pueden editar para adaptar el proceso de
construcci?n de la release. La mayor?a de estas variables se encuentran
documentadas al comienzo de ``src/release/Makefile``. El comando exacto
para contruir la release oficial de FreeBSD 4.7 (x86) fue:

.. code:: screen

    make release CHROOTDIR=/local3/release \
           BUILDNAME=4.7-RELEASE \
           CVSROOT=/host/cvs/usr/home/ncvs \
           RELEASETAG=RELENG_4_7_0_RELEASE
           
         

El ``Makefile`` de la release se puede dividir en varios pasos
distintos.

.. raw:: html

   <div class="itemizedlist">

-  Creaci?n de un entorno de sistema limpio en una jerarqu?a de
   directorios separada utilizando “``make installworld``”.

-  Comprobaci?n de la correcta versi?n de los ficheros fuentes
   almacenados en la jerarqu?a de directorios reci?n creada, junto con
   el chequeo de la documentaci?n y de los ports utilizando, todo ello a
   trav?s de CVS.

-  Relleno de los directorios ``/etc`` y ``/dev`` dentro del entorno
   chroot.

-  Creaci?n de un “chroot” dentro de la jerarqu?a de directorios creada,
   para que resulte m?s dificil que el entorno de la m?quina se vea
   contaminado por la construcci?n de la release.

-  ``make world`` dentro del entorno de chroot.

-  Contrucci?n de los binarios relacionados con Kerberos.

-  Construcci?n del kernel ``GENERIC``.

-  Creaci?n de un esqueleto del ?rbol de directorios donde se
   construir?n y empaquetar?n las distribuciones binarias.

-  Construcci?n e instalaci?n del conjunto de herramientas de
   documentaci?n necesarias para convertir los fuentes de la
   documentaci?n (SGML) en los documentos HTML y de texto que pasar?n a
   formar parte de la release.

-  Construcci?n e instalaci?n de la documentaci?n real (manuales de
   usuario, tutoriales, release notes, listas de compatibilidad de
   hardware, etc.)

-  Construcci?n de los “decisivos” binarios utilizados en los disquetes
   de instalaci?n.

-  Colocaci?n adecuada de los de los paquetes de distribuci?n de
   binarios y de fuentes.

-  Creaci?n del medio de arranque y del disquete “fixit” o salvamento.

-  Creaci?n de la jerarqu?a de directorios de instalaci?n por FTP.

-  ** Creaci?n de im?genes ISO para CDROM/DVD(opcional).

.. raw:: html

   </div>

Para m?s informaci?n sobre la infraestructura involucrada en el proceso
de construcci?n de la release, el lector puede consultar
`release(7) <http://www.FreeBSD.org/cgi/man.cgi?query=release&sektion=7>`__.

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

3.2. Construcci?n deXFree86™
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

XFree86™ es un componente importante para muchos usuarios de entornos
gr?ficos. Antes de la release FreeBSD 4.6 las se usaba
XFree86™3.\ *``X``* por defecto. La forma m?s sencilla de construir
estas versiones consiste en utilizar el script
``src/release/scripts/X11/build_x.sh``. Este script requiere que
XFree86™ y Tcl/Tk se encuentren instalados previamente en la m?quina
donde se realiza la construcci?n. Despu?s de compilar los servidores X
necesarios, el script empaqueta todos los ficheros en “tarballs” que
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8>`__
sabe c?mo localizar utilizando el directorio ``XF86336`` del medio de
instalaci?n.

A partir de FreeBSD 4.6,
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8>`__
instala XFree86™ 4.\ *``X``* por defecto, como cualquier otro conjunto
de paquetes. Estos paquetes se pueden construir a partir del
“package-building cluster” o a partir de las etiquetas del ?rbol de
ports adecuadas.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Es importante borrar cualquier configuraci?n particular almacenada en
``/etc/make.conf``. Por ejemplo, no ser?a una idea muy inteligente
distribuir binarios que se construyeron en un sistema con la variable
``CPUTYPE`` asignada a un determinado procesador.

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

3.3. Software Contribuido (“ports”)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

La colecci?n de `FreeBSD Ports <http://www.FreeBSD.org/ports>`__ est?
compuesta por m?s de 24,000 paquetes de software de terceras partes que
se encuentran disponibles para FreeBSD. El Grupo de administraci?n de
ports ``<portmgr@FreeBSD.org>`` se responsabiliza de mantener un ?rbol
de ports consistente que se pueda utilizar para crear paquetes binarios,
los cuales se a?aden a las releases oficiales de FreeBSD.

Las actividades de ingenier?a de releases para nuestra colecci?n de
paquetes software de terceras partes se encuentra m?s all? del objetivo
de este documento. Otro art?culo,
``http://www.freebsd.org/doc/en_US.ISO8859-1/articles/releng-packages/``,
cubre este tema en profundidad.

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

3.4. ISOs de la release
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A partir de FreeBSD 4.4, el Proyecto FreeBSD decidi? lanzar
gratuitamente al p?blico las cuatro im?genes ISO que anteriormente se
vend?an en *BSDi/Wind River Systems/FreeBSD Mall* como distribuciones en
CDROM “oficiales”. Cada uno de los cuatro discos debe contener un
``README.TXT`` que explica el contenido de cada disco, un ``CDROM.INF``
que proporciona metadatos para que
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8>`__
pueda validar la informaci?n en ?l contenida y un ``filename.txt`` que
proporciona un “manifiesto”. Este *manifiesto* se puede crear utilizando
un simple comando:

.. code:: screen

    /stage/cdrom# find . -type f | sed -e 's/^\.\///' | sort > filename.txt

Los requisitos concretos de cada CD se resumen a continuaci?n.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.4.1. Disco 1
^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El primer disco se crea casi en su totalidad a partir del comando
``make release``. Los ?nicos cambios que se deben realizar dentro del
directorio ``disc1`` son la adici?n de un directorio ``tools``, de
XFree86™ y de los paquetes de terceras partes m?s populares que quepan
dentro del espacio remanente de dicho primer disco. El directorio
``tools`` contiene el software que permite a los usuarios crear
disquetes de instalaci?n desde otros sistemas operativos. Este disco
debe crearse como autoarrancable para que los usuarios de PCs modernos
no necesiten crear disquetes de arranque y puedan utilizar la
caracter?stica de autoarranque desde CD.

Si se proporciona una versi?n alternativa de XFree86™,
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8>`__
debe actualizarse para reflejar la nueva localizaci?n y las
instrucciones de instalaci?n. El c?digo relevante se encuentra en
``src/release/sysinstall`` en -STABLE o en ``src/usr.sbin/sysinstall``
en -CURRENT. Espec?ficamente, se deben actualizar ``dist.c``,
``menus.c`` y ``config.c``.

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

3.4.2. Disco 2
^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El segundo disco se crea en su mayor parte a partir del comando
``make release``. Este disco contiene un “sistema de ficheros vivo”, que
se puede utilizar a partir de
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8>`__
para resolver problemas durante el proceso de instalaci?n de FreeBSD.
Este disco se debe construir como autoarrancable y debe contener una
copia comprimida del repositorio de CVS dentro del directorio
``CVSROOT``, junto con demostraciones de software comercial localizadas
dentro del directorio ``commerce``.

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

3.4.3. Discos 3 and 4
^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Los dos discos que quedan contienen paquetes de software para FreeBSD.
Estos paquetes deben agruparse de tal forma que un paquete y todas sus
*dependencias* quepan en el mismo disco. Se puede obtener m?s
informaci?n sobre la creaci?n de estos discos en el art?culo
``http://www.freebsd.org/doc/en_US.ISO8859-1/articles/releng-packages/``
.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------+---------------------------+----------------------------------------+
| `Anterior <release-proc.html>`__?       | ?                         | ?\ `Siguiente <distribution.html>`__   |
+-----------------------------------------+---------------------------+----------------------------------------+
| 2. Proceso de ingenier?a de releases?   | `Inicio <index.html>`__   | ?4. Distribuci?n                       |
+-----------------------------------------+---------------------------+----------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
