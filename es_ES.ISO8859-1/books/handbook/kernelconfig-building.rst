=========================================================
8.5. Compilaci?n e instalaci?n de un kernel personalizado
=========================================================

.. raw:: html

   <div class="navheader">

8.5. Compilaci?n e instalaci?n de un kernel personalizado
`Anterior <kernelconfig-modules.html>`__?
Cap?tulo 8. Configuraci?n del kernel de FreeBSD
?\ `Siguiente <kernelconfig-config.html>`__

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

8.5. Compilaci?n e instalaci?n de un kernel personalizado
---------------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

En primer lugar, hagamos un breve recorrido por el directorio donde se
lleva a cabo la compilaci?n del kernel. Todos los directorios
mencionados hacen referencia al directorio principal, que es
``/usr/src/sys``, al que tambi?n podemos acceder desde ``/sys``. Existen
gran cantidad de subdirectorios que representan diferentes partes del
kernel, pero el m?s importante para lo que deseamos hacer son ``arch`` y
``/conf``, que es donde se llevara a cabo la edici?n del fichero de
configuraci?n y la compilaci?n propiamente dicha del mismo, el punto de
partida para la personalizaci?n del kernel. El directorio ``arch``
representa la arquitectura del sistema, por lo que puede ser ``i386``,
``alpha``, ``amd64``, ``ia64``, ``powerpc``, ``sparc64`` o ``pc98`` (una
arquitectura alternativa, similar a PC y muy popular en Jap?n). Todo lo
que existe dentro de un directorio de una arquitectura en particular, es
espec?fico para dicha arquitectura; el resto del c?digo es com?n para
todas las plataformas en las que FreeBSD puede funcionar. Observe la
organizaci?n l?gica de la estructura de los directorios, con cada
dispositivo utilizable en el sistema, sistema de ficheros y opciones,
cada cosa en su propio subdirectorio.

A lo largo de este cap?tulo asumiremos que est? utilizando la
arquitectura i386, puesto que sobre ella son los ejemplos que vamos a ir
exponiendo. Si no es este su caso debe hacer los cambios adecuados a su
arquitectura de hardware en las rutas que vayamos utilizando.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Si *no existe* el directorio ``/usr/src/sys`` en su sistema quiere decir
que no est?n instaladas las fuentes del kernel. La forma m?s sencilla de
tenerlas es mediante ``/stand/sysinstall``. Como usuario ``root``
seleccione ``Configure``, luego ``Distributions``, despu?s ``src`` y
finalmente ``sys``. Si no le gusta mucho sysinstall y tiene acceso a un
CDROM “oficial” de FreeBSD puede instalar las fuentes por medio de la
siguiente l?nea de ?rdenes:

.. code:: screen

    # mount /cdrom
    # mkdir -p /usr/src/sys
    # ln -s /usr/src/sys /sys
    # cat /cdrom/sys/ssys.[a-d]* | tar -xzvf

.. raw:: html

   </div>

Ahora vaya al al directorio ``arch/conf`` y copie el fichero de
configuraci?n ``GENERIC`` con el nombre que desee. Por ejemplo:

.. code:: screen

    # cd /usr/src/sys/i386/conf
    # cp GENERIC MIKERNEL

Por tradici?n el nombre se escribe con may?suculas y si tiene varias
maquinas FreeBSD, con diferente hardware es recomendable darle a cada
kernel el mismo nombre que la m?quina en la que va a ejecutarse. En este
ejemplo usaremos el nombre de ``MIKERNEL`` .

.. raw:: html

   <div class="tip" xmlns="">

Sugerencia:
~~~~~~~~~~~

Guardar su fichero de configuraci?n directamente bajo el directorio
``/usr/src``, puede que no sea una idea muy astuta. Si empieza a tener
problemas puede ser muy tentador borrar ``/usr/src`` y comenzar desde
cero. Cinco segundos despu?s de haber hecho esto se dar? cuenta de que
ha eliminado el fichero de configuraci?n de su kernel, en el que quiz?s
llevaba horas trabajando.

Le proponemos una alternativa: guardar su fichero de configuraci?n
cualquier otro sitio y crear un enlace simb?lico al fichero que hay en
el directorio ``i386``.

Por ejemplo:

.. code:: screen

    # cd /usr/src/sys/i386/conf
    # mkdir /root/kernels
    # cp GENERIC /root/kernels/MIKERNEL
    # ln -s /root/kernels/MIKERNEL

.. raw:: html

   </div>

Ahora edite el fichero de configuraci?n ``MIKERNEL`` con su editor de
textos favorito. Si se trata de una instalaci?n reciente probablemente
el ?nico editor disponible sea vi, del cual es complicado explicar su
uso detallado en este documento, pero existen bastantes libros que
detallan su uso; puede ver algunos en la
`bibliograf?a <bibliography.html>`__. FreeBSD dispone de un editor de
uso muy sencillo, llamado ee; si es usted principiante le ser? de mucha
ayuda. Cambie los comentarios al principio del fichero con algo que
refleje los cambios realizados o al menos para diferenciarlo del fichero
``GENERIC``.

Si ha compilado un kernel en SunOS™ o alg?n otro sistema operativo BSD
seguramente la mayor parte de fichero le ser? muy familiar. Si viene
usted de otros sistemas operativos como DOS, el fichero ``GENERIC``
puede parecerle intimidante, as? que siga las instrucciones descritas en
`El Fichero de Configuraci?n <kernelconfig-config.html>`__ detenidamente
y con sumo cuidado.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Aseg?rese siempre de verificar el fichero ``/usr/src/UPDATING`` antes de
realizar cualquier actualizaci?n del sistema si ha `sincronizado sus
fuentes <cutting-edge.html>`__ para disponer de la ?ltima versi?n de los
mismos. En el fichero ``/usr/src/UPDATING`` est? toda la informaci?n
importante sobre las actualizaciones. Al distribuirse con FreeBSD dicha
informaci?n deber? estar m?s actualizada que la que hay en este mismo
texto.

.. raw:: html

   </div>

Ahora es momento de llevar a cabo la compilaci?n del c?digo fuente del
kernel.

.. raw:: html

   <div class="procedure">

.. raw:: html

   <div class="procedure-title">

Procedimiento 8.1. Compilaci?n del kernel

.. raw:: html

   </div>

#. Vaya al directorio ``/usr/src``:

   .. code:: screen

       # cd /usr/src

#. Compile el kernel:

   .. code:: screen

       # make buildkernel KERNCONF=MIKERNEL

#. Instale el nuevo kernel:

   .. code:: screen

       # make installkernel KERNCONF=MIKERNEL

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Es imprescindible que disponga del c?digo fuente completo de FreeBSD
para poder compilar el kernel.

.. raw:: html

   </div>

.. raw:: html

   <div class="tip" xmlns="">

Sugerencia:
~~~~~~~~~~~

Por omisi?n, si compila un kernel personalizado *todos* los m?dulos del
kernel ser?n recompilados tambi?n. Si quiere que la actualizaci?n de su
kernel sea mucho m?s r?pida o compilar solamente ciertos m?dulos
personalizados, edite kernel modules will be rebuilt as well.
``/etc/make.conf`` antes de compilar el kernel:

.. code:: programlisting

    MODULES_OVERRIDE = linux acpi sound/sound sound/driver/ds1 ntfs

Esta variable crea una lista de m?dulos listos para ser compilados, sin
tocar los dem?s.

.. code:: programlisting

    WITHOUT_MODULES = linux acpi sound/sound sound/driver/ds1 ntfs

Esta variable crea una lista de m?dulos que ser?n excluidos del proceso
de compilaci?n. Hay otras variables que pueden resultarle ?tiles durante
este proceso; consulte la p?gina de manual de
`make.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=make.conf&sektion=5>`__.

.. raw:: html

   </div>

El nuevo kernel se copiar? al directorio ra?z como ``/kernel`` y el
kernel viejo tendr? el nombre de ``/kernel.old``. Ahora reinicie su
sistema para poder probar su nuevo kernel. En caso de que se presente
algun problema hay algunos consejos para la `resoluci?n de
problemas <kernelconfig-trouble.html>`__ al final de este cap?tulo.
Aseg?rese de leer la secci?n que explica c?mo recuperar el sistema en
caso de que su kernel `no quiera
arrancar <kernelconfig-trouble.html#kernelconfig-noboot>`__.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Ciertos ficheros relacionados con el proceso de arranque, como
`loader(8) <http://www.FreeBSD.org/cgi/man.cgi?query=loader&sektion=8>`__\ y
su configuraci?n, se guardan en ``/boot``. Los m?dulos personalizados o
de terceros se suelen guardar en ``/boot/kernel``, aunque debe tener
presente que es muy importante que los m?dulos y el kernel est?n
sincronizados. Si intenta usar m?dulos con un kernel para el que no
est?n destinados puede haber errores o incluso producirse
intesatabilidades.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------------------------+---------------------------------+-----------------------------------------------+
| `Anterior <kernelconfig-modules.html>`__?               | `Subir <kernelconfig.html>`__   | ?\ `Siguiente <kernelconfig-config.html>`__   |
+---------------------------------------------------------+---------------------------------+-----------------------------------------------+
| 8.4. Controladores del kernel, subsistemas y m?dulos?   | `Inicio <index.html>`__         | ?8.6. El fichero de configuraci?n             |
+---------------------------------------------------------+---------------------------------+-----------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
