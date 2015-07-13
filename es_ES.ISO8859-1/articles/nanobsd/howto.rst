==================
2. NanoBSD “Howto”
==================

.. raw:: html

   <div class="navheader">

2. NanoBSD “Howto”
`Anterior <index.html>`__?
?
?\ `Siguiente <ix01.html>`__

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

2. NanoBSD “Howto”
------------------

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

2.1. El dise?o de NanoBSD
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Una vez que la imagen est? en el medio puede arrancar NanoBSD. El medio
de almacenamiento se divide por omisi?n en tres partes:

.. raw:: html

   <div class="itemizedlist">

-  Dos particiones de la imagen: ``code#1`` y ``code#2``.

-  La partici?n que contiene los ficheros de configuraci?n, que puede
   montarse bajo ``/cfg`` durante el funcionamiento del sistema.

.. raw:: html

   </div>

Estas particiones se montan normalmente en modo de s?lo lectura.

Los directorios ``/etc`` y ``/var`` son discos
`md(4) <http://www.FreeBSD.org/cgi/man.cgi?query=md&sektion=4>`__
(malloc).

La partici?n de los ficheros de configuraci?n permanece bajo el
directorio ``/cfg``. Este directorio contiene ficheros que usa el
directorio ``/etc`` y se monta en modo de s?lo lectura inmediatamente
despu?s del arranque; por lo tanto, es necesario que los ficheros que se
modifiquen en ``/etc`` se copien en ``/cfg`` si se desea que los cambios
perduren despu?s del reinicio del sistema.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Ejemplo 1. C?mo hacer cambios persistentes en ``/etc/resolv.conf``

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    # vi /etc/resolv.conf
    [...]
    # mount /cfg
    # cp /etc/resolv.conf /cfg
    # umount /cfg

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

La partici?n que contiene el directorio ``/cfg`` deber?a montarse
?nicamente en el arranque y mientras se sobreescriben los ficheros de
configuraci?n.

No es buena idea montar siempre el directorio ``/cfg``, especialmente si
el sistema NanoBSD se ejecuta en un dispositivo de almacenamiento masivo
que pueda verse afectado negativamente por un n?mero elevado de
escrituras en la partici?n (i.e. cuando el sistema de ficheros
sincroniza los datos con el sistema de discos).

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

2.2. C?mo generar una imagen de NanoBSD
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Una imagen de NanoBSD se genera usando el sencillo script de shell
``nanobsd.sh``, ubicado en el directorio
``/usr/src/tools/tools/nanobsd``. El script crea una imagen que se
deber? copiar al medio de almacenamiento mediante la utilidad
`dd(1) <http://www.FreeBSD.org/cgi/man.cgi?query=dd&sektion=1>`__.

Los comandos necesarios para generar una imagen de NanoBSD son:

.. code:: screen

    # cd /usr/src/tools/tools/nanobsd 
    # sh nanobsd.sh 
    # cd /usr/obj/nanobsd.full 
    # dd if=_.disk.full of=/dev/da0 bs=64k 

.. raw:: html

   <div class="calloutlist">

+--------------------------------------+--------------------------------------+
| `|1| <#nbsd-cd>`__                   | Cambia el directorio actual por el   |
|                                      | directorio base del script de        |
|                                      | generaci?n de NanoBSD.               |
+--------------------------------------+--------------------------------------+
| `|2| <#nbsd-sh>`__                   | Comienza el proceso de generaci?n.   |
+--------------------------------------+--------------------------------------+
| `|3| <#nbsd-cd2>`__                  | Cambia el directorio actual por el   |
|                                      | directorio donde se encuentra la     |
|                                      | imagen generada.                     |
+--------------------------------------+--------------------------------------+
| `|4| <#nbsd-dd>`__                   | Instala NanoBSD dentro del medio de  |
|                                      | almacenamiento.                      |
+--------------------------------------+--------------------------------------+

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

2.3. Personalizaci?n de una imagen de NanoBSD
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Esta es probablemente la caracter?stica m?s importante y m?s interesante
de NanoBSD. Tambi? es donde usted pasar? la mayor parte del tiempo
cuando est? desarrollando con NanoBSD.

La invocaci?n del siguiente comando forzar? al script ``nanobsd.sh`` a
leer su configuraci?n desde el fichero ``mi-configuracion.nano`` ubicado
en el directorio actual:

.. code:: screen

    # sh nanobsd.sh -c mi-configuracion.nano

La personalizaci?n se hace de dos maneras:

.. raw:: html

   <div class="itemizedlist">

-  Opciones de configuraci?n

-  Funciones personalizadas

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

2.3.1. Opciones de configuraci?n
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Por medio de ajustes de configuraci?n es posible configurar las opciones
que se pasan a las fases ``buildworld`` e ``installworld`` del proceso
de generaci?n de NanoBSD. Mediante estas opciones puede reducirse el
tama?o del sistema de manera que pueda incluso encajar en algo tan
peque?o como un dispositivo de 64MB. Es posible recortar FreeBSD incluso
m?s, hasta que consista ?nicamente en el kernel y dos o tres ficheros de
“userland”.

El fichero de configuraci?n est? compuesto por opciones de configuraci?n
que sobreescriben los valores por omisi?n. Las directivas m?s
importantes son:

.. raw:: html

   <div class="itemizedlist">

-  ``NANO_NAME`` : Nombre de la generaci?n que estamos ejecutando (se
   usa para dar nombres a los directorios donde encontraremos el
   resultado del proceso).

-  ``NANO_SRC`` : Ruta al c?digo fuente que se usar? para generar la
   imagen.

-  ``NANO_KERNEL`` : Nombre del fichero de configuraci?n del kernel que
   se usar? para generar el kernel.

-  ``CONF_BUILD`` : Opciones que se pasan a la fase ``buildworld``.

-  ``CONF_INSTALL`` : Opciones que se pasan a la fase ``installworld``.

-  ``CONF_WORLD`` : Opciones que se pasan tanto a ``buildworld`` como a
   ``installworld``.

-  ``FlashDevice`` : Define el tipo de medio de almacenamiento que se
   usar?. Para m?s informaci?n consulte el fichero ``FlashDevice.sub``.

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

2.3.2. Funciones personalizadas
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Puede ajustar NanoBSD de forma muy precisa mediante el uso de funciones
de shell en el fichero de configuraci?n. En el siguiente ejemplo vemos
un modelo b?sico de funci?n personalizada.

.. code:: programlisting

    cust_foo () (
        echo "bar=topless" > \
          ${NANO_WORLDDIR}/etc/foo
    )
    customize_cmd cust_foo

A continuaci?n vemos un ejemplo m?s ?til de funci?n personalizada, que
cambia el tama?o por omisi?n del directorio ``/etc`` de 5MB a 30MB:

.. code:: programlisting

    cust_etc_size () (
        cd ${NANO_WORLDDIR}/conf
        echo 30000 > default/etc/md_size
    )
    customize_cmd cust_etc_size

Hay unas pocas funciones de personalizaci?n predefinidas listas para su
uso:

.. raw:: html

   <div class="itemizedlist">

-  ``cust_comconsole`` : Deshabilita
   `getty(8) <http://www.FreeBSD.org/cgi/man.cgi?query=getty&sektion=8>`__
   en los dispositivos VGA (los nodos de dispositivo ``/dev/tty*``) y
   habilita el uso del puerto serie COM1 para que sea la consola del
   sistema.

-  ``cust_allow_ssh_root`` : Permite a ``root`` acceder a trav?s de
   `sshd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sshd&sektion=8>`__.

-  ``cust_install_files`` : Instala ficheros de configuraci?n desde el
   directorio ``nanobsd/files``, que contiene scripts ?tiles para la
   administraci?n del sistema.

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

2.3.3. C?mo a?adir paquetes
^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Se pueden a?adir paquetes a la imagen de NanoBSD usando una funci?n
personalizada. La siguiente funci?n instalar? todos los paquetes que se
encuentren en ``/usr/src/tools/tools/nanobsd/packages``:

.. code:: programlisting

    install_packages () (
        mkdir -p ${NANO_WORLDDIR}/packages
        cp /usr/src/tools/tools/nanobsd/packages/* ${NANO_WORLDDIR}/packages
        chroot ${NANO_WORLDDIR} sh -c 'cd packages; pkg_add -v *;cd ..;'
        rm -rf ${NANO_WORLDDIR}/packages
    )
    customize_cmd install_packages

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

2.3.4. Ejemplo de fichero de configuraci?n
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El siguiente es un ejemplo completo de fichero de configuraci?n para
generar una imagen personalizada de NanoBSD:

.. code:: programlisting

    NANO_NAME=custom
    NANO_SRC=/usr/src
    NANO_KERNEL=MYKERNEL
    NANO_IMAGES=2

    CONF_BUILD='
    NO_KLDLOAD=YES
    NO_NETGRAPH=YES
    NO_PAM=YES
    '

    CONF_INSTALL='
    NO_ACPI=YES
    NO_BLUETOOTH=YES
    NO_CVS=YES
    NO_FORTRAN=YES
    NO_HTML=YES
    NO_LPR=YES
    NO_MAN=YES
    NO_SENDMAIL=YES
    NO_SHAREDOCS=YES
    NO_EXAMPLES=YES
    NO_INSTALLLIB=YES
    NO_CALENDAR=YES
    NO_MISC=YES
    NO_SHARE=YES
    '

    CONF_WORLD='
    NO_BIND=YES
    NO_MODULES=YES
    NO_KERBEROS=YES
    NO_GAMES=YES
    NO_RESCUE=YES
    NO_LOCALES=YES
    NO_SYSCONS=YES
    NO_INFO=YES
    '

    FlashDevice SanDisk 1G

    cust_nobeastie() (
        touch ${NANO_WORLDDIR}/boot/loader.conf
        echo "beastie_disable=\"YES\"" >> ${NANO_WORLDDIR}/boot/loader.conf
    )

    customize_cmd cust_comconsole
    customize_cmd cust_install_files
    customize_cmd cust_allow_ssh_root
    customize_cmd cust_nobeastie

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

2.4. C?mo actualizar NanoBSD
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El proceso de actualizaci?n de NanoBSD es relativamente simple:

.. raw:: html

   <div class="procedure">

#. Generar una nueva imagen de NanoBSD de la forma habitual.

#. Copiar la nueva imagen sobre la partici?n no utilizada del sistema
   empotrado que est? usando NanoBSD.

   La diferencia m?s importante entre este paso y la instalaci?n inicial
   de NanoBSD es que ahora en lugar de usar el fichero ``_.disk.full``
   (que contiene una imagen de todo el disco) se instala la imagen
   ``_.disk.image`` (que contiene una imagen de una sola partici?n).

#. Reiniciar y arrancar el sistema desde la partici?n que se acaba de
   instalar.

#. Si todo va bien la actualizaci?n ha terminado.

#. Si algo va mal reinicie desde la partici?n anterior (que contiene la
   imagen vieja, pero que funciona) para recuperar el funcionamiento del
   sistema lo antes posible. Arregle los problemas de la nueva
   generaci?n y repita el proceso.

.. raw:: html

   </div>

Para facilitar la instalaci?n de una imagen nueva en su sistema NanoBSD
en funcionamiento dispone de los scripts ``updatep1`` y ``updatep2``,
ubicados en el directorio ``/root``. La elecci?n de uno u otro script
depende de qu? partici?n est? ejecutando el sistema, la primera o la
segunda.

Dependiendo de los servicios disponibles en la m?quina que va a servir
la nueva imagen de NanoBSD y del tipo de transferencia de datos que
prefiera uno de estos tres m?todos le resultar? m?s o menos interesante:

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.4.1. Uso de `ftp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ftp&sektion=1>`__
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Si la prioridad es la velocidad de la transferencia use usted este
ejemplo:

.. code:: screen

    # ftp mi-maquina
    get _.disk.image "| sh updatep1"

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

2.4.2. Uso de `ssh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh&sektion=1>`__
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Si la prioridad es la seguridad de la transferencia seguramente
ejecutar? algo muy parecido a lo siguiente:

.. code:: screen

    # ssh mi-maquina cat _.disk.image.gz | zcat | sh updatep1

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

2.4.3. Uso de `nc(1) <http://www.FreeBSD.org/cgi/man.cgi?query=nc&sektion=1>`__
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Si la m?quina remota no dispone de servicios de
`ftp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ftp&sektion=1>`__ ni
de `sshd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sshd&sektion=8>`__
puede recurrir al siguiente ejemplo:

.. raw:: html

   <div class="procedure">

#. Primero abra un puerto TCP de escucha en la m?quina que sirve la
   imagen y env?ela al cliente:

   .. code:: screen

       mi-maquina# nc -l 2222 < _.disk.image

   .. raw:: html

      <div class="note" xmlns="">

   Nota:
   ~~~~~

   Aseg?rese de que el puerto elegido no tenga bloqueadas las conexiones
   entrantes desde la m?quina NanoBSD por ning?n cortafuegos.

   .. raw:: html

      </div>

#. Con?ctese a la m?quina que va servir la nueva imagen y ejecute el
   script ``updatep1``:

   .. code:: screen

       # nc mi-maquina 2222 | sh updatep1

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

+------------------------------+---------------------------+--------------------------------+
| `Anterior <index.html>`__?   | ?                         | ?\ `Siguiente <ix01.html>`__   |
+------------------------------+---------------------------+--------------------------------+
| Introducci?n a NanoBSD?      | `Inicio <index.html>`__   | ??ndice                        |
+------------------------------+---------------------------+--------------------------------+

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
