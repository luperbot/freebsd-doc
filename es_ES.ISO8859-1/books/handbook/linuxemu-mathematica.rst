=================================
10.3. Instalaci?n de Mathematica?
=================================

.. raw:: html

   <div class="navheader">

10.3. Instalaci?n de Mathematica?
`Anterior <linuxemu-lbc-install.html>`__?
Cap?tulo 10. Compatibilidad binaria con Linux
?\ `Siguiente <linuxemu-maple.html>`__

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

10.3. Instalaci?n de Mathematica?
---------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Actualizado para Mathematica 5.X por Hollas Boris.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Este documento describe el proceso de instalaci?n de la versi?n para
Linux de Mathematica? 5.X en un sistema FreeBSD.

Puede pedir a Wolfram, el fabricante, La versi?n para para Linux de
Mathematica? o la versi?n de Mathematica? para estudiantes en su sitio
web, ``http://www.wolfram.com/``.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

10.3.1. El instalador de Mathematica?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Lo primero que tiene que hacer es decirle a FreeBSD que los binarios de
Mathematica? para Linux utilizan la ABI Linux. La forma m?s sencilla de
hacerlo es marcar por omisi?n todos los binarios sin marcas como Linux
ELF.

.. code:: screen

    # sysctl kern.fallback_elf_brand=3

Hecho esto FreeBSD asumir? que cualquier binario sin marca que encuentre
utiliza la ABI Linux; de este modo podr? ejecutar el binario
directamente desde el CDROM.

Copie el fichero ``MathInstaller`` en su disco duro

.. code:: screen

    # mount /cdrom
    # cp /cdrom/Unix/Installers/Linux/MathInstaller /directoriolocal/

Edite este fichero y sustituya la primera l?nea, ``/bin/sh``, por
``/compat/linux/bin/sh`` para asegurarnos de que lo que ejecute el
instalador sea la veri?n de
`sh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sh&sektion=1>`__ de
Linux. El siguiente paso es sustituir todos los ``Linux)`` por
``FreeBSD)`` con un editor de texto on con el script que encontrar? en
la siguiente secci?n. Esto se hace para ayudar al instalador de
Mathematica?, el cual en un cierto momento invoca a ``uname -s`` para
determinar el sistema operativo, a tratar a FreeBSD como si fuera un
sistema operativo muy similar a Linux. Hecho todo esto, cuando ejecute
``MathInstaller`` podr? instalar Mathematica?.

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

10.3.2. Modificaci?n de los ejecutables de Mathematica?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Debe modificar los scripts de shell que Mathematica? cre? durante la
instalaci?n antes de usarlos. Si eligi? ubicar en ``/usr/local/bin`` los
ejecutables de Mathematica? ver? que en ese directorio hay enlaces
simb?licos a ficheros como ``math``, ``mathematica``, ``Mathematica`` y
``MathKernel``. En cada uno de esos ficheros debe sustituir ``Linux)``
por ``FreeBSD)`` con un editor de texto o bien con el siguiente script
de shell:

.. code:: programlisting

    #!/bin/sh
    cd /usr/local/bin
    for i in math mathematica Mathematica MathKernel
      do sed 's/Linux)/FreeBSD)/g' $i > $i.tmp
      sed 's/\/bin\/sh/\/compat\/linux\/bin\/sh/g' $i.tmp > $i
      rm $i.tmp
      chmod a+x $i
    done

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

10.3.3. C?mo obtener una contrase?a de Mathematica?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Cuando arranque Mathematica? por primera vez se le pedir? una
contrase?a. Si Wolfram no le ha enviado ya necesita un “machine ID”,
para lo cual debe ir al directorio de instalaci?n y ejecutar
``mathinfo``. Este “machine IDE” se obtiene de la direcci?n MAC de la
primera tarjeta Ethernet de la m?quina y tiene como objetivo que no
pueda ejecutar Mathematica? en m?s de una m?quina.

Durante el proceso de registro en Wolfram (ya sea por correo
electr?nico, tel?fono o fax) les dar? el “machine ID” y Wolfram le
enviar? una contrase?a relacionada con ?l, consistente en grupos de
n?meros.

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

10.3.4. Ejecuci?n del ?frontend? de Mathematica? trav?s de una red
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Mathematica? usa unos cuantos tipos especiales para mostrar caracteres
que no est?n en ning?n conjunto est?ndar de tipos: integrales, sumas,
letras griegas, etc. El protocolo X exige que los tipos est?n instalados
*en local*, es decir, tiene que copiar los tipos del CDROM o la m?quina
desde la que ha instalado Mathematica? a su m?quina. Los tipos est?n en
el directorio del CDDROM ``/cdrom/Unix/Files/SystemFiles/Fonts`` y se
supone que deben estar en su disco duro en el directorio
``/usr/local/mathematica/SystemFiles/Fonts``. Los tipos est?n realmente
en los subdirectorios ``Type1`` y ``X``. Hay varias formas de
utilizarlos.

La primera es copiarlos en uno de los directorios de tipos que hay en
``/usr/X11R6/lib/X11/fonts``, antes de lo cual tendr? que a?adir a
``fonts.dir`` los nombres de los tipos; tendr? tambi?n que cambiar el
n?mero de tipos en la primera l?nea. Por otra parte, todo esto puede
hacerse ejecutando
`mkfontdir(1) <http://www.FreeBSD.org/cgi/man.cgi?query=mkfontdir&sektion=1>`__
en el directorio donde haya copiado los tipos.

La segunda forma de utilizar estos tipos es copiarlos bajo
``/usr/X11R6/lib/X11/fonts``:

.. code:: screen

    # cd /usr/X11R6/lib/X11/fonts
    # mkdir X
    # mkdir MathType1
    # cd /cdrom/Unix/Files/SystemFiles/Fonts
    # cp X/* /usr/X11R6/lib/X11/fonts/X
    # cp Type1/* /usr/X11R6/lib/X11/fonts/MathType1
    # cd /usr/X11R6/lib/X11/fonts/X
    # mkfontdir
    # cd ../MathType1
    # mkfontdir

A?ada los nuevos directorios de tipos a su ruta de tipos:

.. code:: screen

    # xset fp+ /usr/X11R6/lib/X11/fonts/X
    # xset fp+ /usr/X11R6/lib/X11/fonts/MathType1
    # xset fp rehash

Si usa el servidor Xorg puede cargar los tipos autom?ticamente
a?adi?ndolos al fichero ``xorg.conf``.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

En servidores XFree86™ el fichero de configuraci?n es ``XF86Config``.

.. raw:: html

   </div>

Si *no* tiene ya en su sistema un directorio
``/usr/X11R6/lib/X11/fonts/Type1`` puede cambiarle el nombre al
directorio ``MathType1`` del ejemplo anterior por ``Type1``.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------------+-----------------------------+------------------------------------------+
| `Anterior <linuxemu-lbc-install.html>`__?   | `Subir <linuxemu.html>`__   | ?\ `Siguiente <linuxemu-maple.html>`__   |
+---------------------------------------------+-----------------------------+------------------------------------------+
| 10.2. Instalaci?n?                          | `Inicio <index.html>`__     | ?10.4. Instalaci?n de Maple™             |
+---------------------------------------------+-----------------------------+------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
