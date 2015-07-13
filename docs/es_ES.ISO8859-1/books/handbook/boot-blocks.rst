=====================================================
12.3. El RMA y las etapas de arranque uno, dos y tres
=====================================================

.. raw:: html

   <div class="navheader">

12.3. El RMA y las etapas de arranque uno, dos y tres
`Anterior <boot-introduction.html>`__?
Cap?tulo 12. El proceso de arranque en FreeBSD
?\ `Siguiente <boot-kernel.html>`__

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

12.3. El RMA y las etapas de arranque uno, dos y tres
-----------------------------------------------------

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

12.3.1. RMA, ``/boot/boot0``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El RMA de FreeBSD, se localiza en ``/boot/boot0``. Este es una *copia*
del RMA, ya que el RMA real debe localizarse en una parte especial del
disco duro, fuera de la ?rea de FreeBSD.

El fichero ``boot0`` es muy simple, dado que el programa en el RMA s?lo
puede ser de 512 bytes. Si usted ha instalado el RMA de FreeBSD y ha
instalado varios sistemas operativos en sus discos duros, entonces al
momento de arrancar el sistema, visualizar? una pantalla similar a la
siguiente.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Ejemplo 12.1. Pantalla ``boot0``

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    F1 DOS
    F2 FreeBSD
    F3 Linux
    F4 ??
    F5 Drive 1

    Default: F2

.. raw:: html

   </div>

.. raw:: html

   </div>

Es sabido que otros sistemas, en particular Windows 95, sobreescriben el
RMA con el suyo. Si esto le sucede, o bien desea reemplazar su RMA
actual con el RMA de FreeBSD, entonces puede utilizar las siguientes
?rdenes.

.. code:: screen

    # fdisk -B -b /boot/boot0 dispositivo

Donde *``dispositivo``* es aquel, desde el cual usted pretende arrancar
el sistema, tal como ``ad0`` para el disco conectado al primer IDE,
``ad2`` para el disco maestro conectado al IDE secundario, ``da0`` para
el primer disco SCSI, y as? sucesivamente.

Por otro lado, si usted es un usuario de Linux, y prefiere que la
aplicaci?n LILO controle el proceso de arranque, puede editar el fichero
``/etc/lilo.conf`` para incluir a FreeBSD, o bien seleccionar la opci?n
``Leave The Master Boot Record Untouched`` durante el proceso de
instalaci?n. Si ha instalado el gestor de arranque de FreeBSD, puede
arrancar Linux y modificar el fichero de configuraci?n de LILO,
``/etc/lilo.conf``, a?adiendo la siguiente opci?n:

.. code:: programlisting

    other=/dev/hdXY
    table=/dev/hdb
    loader=/boot/chain.b
    label=FreeBSD

lo que permitir? el arranque de FreeBSD y Linux, por medio de LILO. En
nuestro ejemplo hemos utilizado *``XY``* para especificar el disco
utilizado y su partici?n. Si usted utiliza un sistema SCSI, deber?
cambiar *``/dev/hdXY``* por algo similar a *``/dev/sdXY``*, que
nuevamente utiliza la sint?xis *``XY``*. La opci?n
``loader=/boot/chain.b`` puede omitirse si usted cuenta con ambos
sistemas operativos en el mismo disco. Una vez que esto se ha
completado, puede ejecutar ``/sbin/lilo -v`` para que se actualicen los
cambios en el sistema, lo cual deber? verificarse con los mensajes que
aparezcan en pantalla.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

N de T: La opci?n mencionada como;
``Leave The Master Boot Record Untouched``, se mostrar? “tal cual”
aparece en este documento, una vez que ha terminado la fase de partici?n
del disco duro.

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

12.3.2. Etapa uno, ``/boot/boot1``, y etapa dos, ``/boot/boot2``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Conceptualmente las estapas uno y dos, son parte del mismo programa, en
la misma ?rea del disco. Por cuestiones de espacio se han dividido en
dos, pero estas siempre se instalaran de manera conjunta.

Estas son localizadas en el sector de arranque, de la partici?n de
arranque, que es donde `boot0 <boot-blocks.html#boot-boot0>`__, o
cualquier otro programa del RMA espera encontrar el programa que dar?
continuaci?n al proceso de arranque. Los ficheros localizados bajo el
directorio ``/boot`` son copias de los ficheros reales, que se localizan
fuera del sistema de ficheros de FreeBSD.

El fichero ``boot1`` es muy simple, en virtud de que s?lo puede tener un
tama?o de 512 bytes, y conocer simplemente del etiquetador de discos de
FreeBSD (*disklabel*), el cual almacena la informaci?n de las
particiones, para efecto de localizar y ejecutar ``boot2``.

El fichero ``boot2`` es un poco m?s sofisticado, y comprende lo
suficiente del sistema de ficheros de FreeBSD como para localizar
ficheros en el, y puede proveer una interfaz simple, para seleccionar el
kernel o cargador que deber? ejecutarse.

En virtud de que el `cargador <boot-blocks.html#boot-loader>`__ (loader)
es mucho m?s sofisticado, y provee una configuraci?n de arranque m?s
sencilla de utilizar, ``boot2`` la ejecuta normalmente, una vez que ha
terminado de solicitar el arranque del kernel directamente.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Ejemplo 12.2. Pantalla de ``boot2``

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    >> FreeBSD/i386 BOOT
    Default: 0:ad(0,a)/kernel
    boot:

.. raw:: html

   </div>

.. raw:: html

   </div>

Si alguna vez requiere reemplazar los ficheros ``boot1`` y ``boot2``
instalados, utilice
`disklabel(8) <http://www.FreeBSD.org/cgi/man.cgi?query=disklabel&sektion=8>`__.

.. code:: screen

    # disklabel -B partici?n

Donde *``partici?n``* es el disco y partici?n del cual pretende arrancar
el sistema, tal como ``ad0s1`` para la primer partici?n del disco
Mastro—Primario.

.. raw:: html

   <div class="warning" xmlns="">

Modo peligrosamente dedicado:
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Si s?lo utiliza el nombre del disco, tal como ``ad0``, al usar
`disklabel(8) <http://www.FreeBSD.org/cgi/man.cgi?query=disklabel&sektion=8>`__
crear? un disco peligrosamente dedicado, sin partici?n alguna.
Seguramente esto no es lo que desea hacer, as? que asegurese dos veces
antes de presionar la tecla **Return** cuando utilice
`disklabel(8) <http://www.FreeBSD.org/cgi/man.cgi?query=disklabel&sektion=8>`__.

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

12.3.3. Etapa tres, ``/boot/loader`` (cargador de arranque)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El cargador es la etapa final de las tres etapas del mecanismo de
arranque, y esta localizado en el sistema de ficheros, normalmente como
``/boot/loader``.

El cargador pretende ser un metodo amistoso de configuraci?n, utilizando
una serie de ?rdenes integradas de f?cil uso, respaldado por un
int?rprete m?s poderoso, con una serie de ?rdenes de mayor complejidad.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

12.3.3.1. Flujo del programa cargador
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Durante la inicializaci?n del sistema, el cargador har? una comprobaci?n
en busca de una consola y discos, y sabra de que disco se encuentra
arrancando. Establecer? las variables necesarias, y posteriormente es
iniciado el int?rprete donde se pueden introducir ?rdenes desde un
“script” o de manera interactiva.

Posteriormente el cargador leer? el fichero ``/boot/loader.rc``, que por
default lee la informaci?n del fichero ``/boot/defaults/loader.conf``
que a su vez, establece las variables correspondientes y verifica en el
fichero ``/boot/loader.conf`` los cambios locales que se hayan hecho,
para establecer valores de las variables modificadas. Una vez llevado a
cabo esto, ``loader.rc`` actua sobre estas variables, cargando cualquier
m?dulo y kernel seleccionado.

Finalmente, y por default, el cargador hace una pausa contando 10
segundos y en espera de que al presionar una tecla se interrumpa el
proceso, de no ser as?, proceder? a arrancar el kernel. En el caso de
que al hacer esta pausa, se haya presionado una tecla (diferente de
**Return**), el proceso ser? interrumpido y se nos mostrar? un “prompt”,
que entiende el conjunto de ?rdenes de f?cil-uso, y donde el usuario
puede ajustar ciertas variables, cargar y descargar todos los m?dulos, y
tambi?n arrancar o reiniciar el sistema.

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

12.3.3.2. ?rdenes internas del cargador
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A continuaci?n se presentan las ?rdenes m?s comunes del cargador. Para
ver una descripci?n detallada de los mismos, por favor consulte la
p?gina de manual de
`loader(8) <http://www.FreeBSD.org/cgi/man.cgi?query=loader&sektion=8>`__

.. raw:: html

   <div class="variablelist">

autoboot *``segundos``*
    Procede a iniciar el arranque del sistema, si es que no es
    interrumpido el periodo dado, en segundos. Despliega una cuenta
    regresiva, y el tiempo dado es de 10 segundos.

boot [-opciones] [nombre\_del\_kernel]
    Procede a iniciar el kernel de manera inmediata, con las opciones
    dadas, si es que fuera el caso y el kernel especificado, si es que
    se especifica alguno.

boot-conf
    Rehace la configuraci?n autom?tica de modulos en funci?n a las
    variables definidas, como sucede al arrancar. Esta opci?n s?lo tiene
    sentido utilizarla, si en primer lugar hemos usado ``unload``, y
    hemos modificado alguna variable, siendo lo m?s com?n el ``kernel``.

help [tema]
    Muestra la ayuda de un tema espec?fico, que lee del fichero
    ``/boot/loader.help``. Si el tema que se indica es ``index``,
    entonces se mostrar? una lista de todos los temas disponibles.

include *``fichero``* …
    Procesa el fichero que se ha especificado. El fichero se lee e
    interpreta l?nea por l?nea. Cualquier error detendr? inmediatamente
    a include.

load [-t tipo] *``fichero``*
    Carga el kernel, modulo del kernel, o el fichero del tipo dado, en
    base al fichero especificado. Cualquier argumento que se a?ada, ser?
    pasado al fichero.

ls [-l] [ruta]
    Despliega un listado de todos los ficheros que se localizan en la
    ruta especificada, o en el directorio ra?z, si es que no se le
    especifica ruta alguna. Si se utiliza la opci?n ``-l``, tambi?n se
    mostrara el tama?o de los ficheros.

lsdev [-v]
    Nos muestra una lista de todos los dispositivos desde los cuales
    puede ser posible cargar modulos. Si se incluye la opci?n ``-v``, el
    listado que se obtiene cuenta con m?s detalle.

lsmod [-v]
    Despliega los m?dulos cargados. Si se utiliza la opci?n ``-v``, se
    mostraran m?s detalles.

more *``fichero``*
    Despliega el contenido del fichero especificado, haciendo una pausa
    a cada numero determinado de ``LINEAS`` mostradas.

reboot
    Reinicia el sistema de forma inmediata.

set *``variable``*, set *``variable``*\ =\ *``valor``*
    Especifica los valores de las variables de entorno del cargador.

unload
    Remueve todos los m?dulos cargados.

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

12.3.3.3. Ejemplos de uso del cargador
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

He aqui unos ejemplos pr?cticos sobre el uso correcto del cargador.

.. raw:: html

   <div class="itemizedlist">

-  

   Para arrancar simplemente su kernel usual, pero en modo mono-usuario,
   deber? hacer lo siguiente:

   .. code:: screen

       boot -s

-  Para descargar su kernel usual y sus m?dulos correspondientes, y
   posteriormente cargar su kernel anterior (o cualquier otro):

   .. code:: screen

       unload
       load kernel.old

   Puede utilizar ``kernel.GENERIC`` para referirse al kernel generico
   actual que viene con la instalaci?n, o bien puede utilizar
   ``kernel.old`` para hacer referencia al kernel anterior (por ejemplo,
   cuando ha actualizado su sistema o ha recompilado su propio kernel).

   .. raw:: html

      <div class="note" xmlns="">

   Nota:
   ~~~~~

   Utilice lo siguiente para cargar sus m?dulos actuales con otro
   kernel:

   .. code:: screen

       unload
       set kernel="kernel.old"
       boot-conf

   .. raw:: html

      </div>

-  Para cargar un escrito de configuraci?n (script que de forma
   autom?tica har? todo lo que normalmente hace usted de forma manual al
   momento de ejecutarse el configurador de arranque):

   .. code:: screen

       load -t escrito_de_configuraci?n /boot/kernel.conf

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------------------------+---------------------------+--------------------------------------------------------+
| `Anterior <boot-introduction.html>`__?                  | `Subir <boot.html>`__     | ?\ `Siguiente <boot-kernel.html>`__                    |
+---------------------------------------------------------+---------------------------+--------------------------------------------------------+
| 12.2. El problema que representa arrancar el sistema?   | `Inicio <index.html>`__   | ?12.4. Interacci?n con el kernel durante el arranque   |
+---------------------------------------------------------+---------------------------+--------------------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
