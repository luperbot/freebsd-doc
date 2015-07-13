=================
10.2. Instalaci?n
=================

.. raw:: html

   <div class="navheader">

10.2. Instalaci?n
`Anterior <linuxemu.html>`__?
Cap?tulo 10. Compatibilidad binaria con Linux
?\ `Siguiente <linuxemu-mathematica.html>`__

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

10.2. Instalaci?n
-----------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

La compatibilidad binaria con Linux no viene activada por omisi?n. La
forma m?s sencilla de habilitarla es cargar el KLD (“objeto cargable en
el kernel”) ``linux``. Como usuario ``root`` proceda del siguiente modo:

.. code:: screen

    # kldload linux

Si quiere que la compatibilidad con Linux est? siempre activada tendr?
que a?adir la siguiente l?nea en ``/etc/rc.conf``:

.. code:: programlisting

    linux_enable="YES"

Utilice
`kldstat(8) <http://www.FreeBSD.org/cgi/man.cgi?query=kldstat&sektion=8>`__
para verificar que el KLD est? cargado:

.. code:: screen

    % kldstat
    Id Refs Address    Size     Name
     1    2 0xc0100000 16bdb8   kernel
     7    1 0xc24db000 d000     linux.ko

Si por alguna raz?n no desea o no puede cargar el KLD, entonces puede
enlazar est?ticamente la compatibilidad de binarios Linux en el kernel
agregando ``options COMPAT_LINUX`` a su fichero de configuraci?n del
kernel. Luego instale su nuevo kernel como se describe en `Cap?tulo?8,
*Configuraci?n del kernel de FreeBSD* <kernelconfig.html>`__.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

10.2.1. Instalaci?n de bibliotecas de ejecuci?n Linux
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Puede hacerse de dos maneras, ya sea usando el port
`linux\_base <linuxemu-lbc-install.html#linuxemu-libs-port>`__, o
instal?ndolas `de forma
manual <linuxemu-lbc-install.html#linuxemu-libs-manually>`__.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

10.2.1.1. Instalaci?n usando el port linux\_base
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Este es con mucho el m?todo mas sencillo para instalar bibliotecas de
ejecuci?n. Es como instalar cualquier otro port de la `Colecci?n de
Ports <file://localhost/usr/ports/>`__. Es tan sencillo como esto:

.. code:: screen

    # cd /usr/ports/emulators/linux_base
    # make install distclean

Hecho esto deber?a disponer de compatibilidad binaria con Linux. Algunos
programas pueden “quejarse” por la presencia de versiones antiguas de
algunas bibliotecas del sistema. Generalmente esto no suele ser un
problema muy grave.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Pueden coexistir m?ltiples versiones del port
`emulators/linux\_base <http://www.freebsd.org/cgi/url.cgi?ports/emulators/linux_base/pkg-descr>`__
disponibles correspondientes a distintas versiones de diversas
distribuciones de Linux. Tendr? que instalar el port que m?s se ajuste a
las necesidades de las aplicaciones de Linux que quiera instalar.

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

10.2.1.2. Instalaci?n manual de bibliotecas
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Si, por el motivo que fuese, no tiene instalada la colecci?n de ports
puede instalar las bibliotecas que necesite de forma manual. Necesitar?
las bibliotecas compartidas Linux de las que depende el programa y el
enlazador en tiempo de ejecuci?n (“runtime linker”). Necesitar? tambi?n
crear un directorio ``/compat/linux`` donde alojar las bibliotecas Linux
en su sistema FreeBSD Cualquier biblioteca compartida a la que haya
recurrido un programa de Linux ejecutado en FreeBSD buscar? en primer
lugar en dicho directorio. Por lo tanto, si se carga un programa Linux,
por ejemplo ``/lib/libc.so``, FreeBSD intentar? en primer lugar abrir
``/compat/linux/lib/libc.so`` y, si no existe, lo intentar? con
``/lib/libc.so``. Las bibliotecas compartidas deben instalarse en
``/compat/linux/lib`` en lugar de las rutas que el ``ld.so`` de Linux
proporcione.

En general, necesitar? buscar las bibliotecas compartidas de las que los
binarios Linux dependen s?lamente las primeras veces que instale un
programa Linux en su FreeBSD. M?s adelante tendr? un conjunto suficiente
de bibliotecas compartidas Linux en su sistema para poder ejecutar
binarios Linux sin que tenga que hacer nada m?s.

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

10.2.1.3. C?mo instalar bibliotecas compartidas adicionales
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

?Que pasar?a si instalara el port ``linux_base`` y su aplicaci?n todav?a
tuviera problemas debido a bibliotecas compartidas que no encuentra en
el sistema? ?C?mo saber qu? bibliotecas compartidas necesitan los
binarios Linux? B?sicamente hay dos posibilidades (para poder ejecutar
las siguientes instrucciones necesitar? estar como ``root``

Si tiene acceso a un sistema Linux busque en ?l qu? bibliotecas necesita
la aplicaci?n, y c?pielas a su sistema FreeBSD. Veamos unos ejemplos:

.. raw:: html

   <div class="informalexample">

Asumiremos que utiliz? FTP para conseguir los binarios Linux de Doom y
los puso en un sistema Linux. Para ver qu? bibliotecas compartidas
necesitar? ejecute ``ldd linuxdoom``:

.. code:: screen

    % ldd linuxdoom
    libXt.so.3 (DLL Jump 3.1) => /usr/X11/lib/libXt.so.3.1.0
    libX11.so.3 (DLL Jump 3.1) => /usr/X11/lib/libX11.so.3.1.0
    libc.so.4 (DLL Jump 4.5pl26) => /lib/libc.so.4.6.29

Necesitar?a todos los ficheros de la segunda columna, y tendr? que
ponerlos en ``/compat/linux`` con los nombres de la primera columna como
enlaces simb?licos apuntando hacia ellos. De este modo tendr?a en su
sistema FreeBSD los siguientes ficheros:

.. code:: screen

    /compat/linux/usr/X11/lib/libXt.so.3.1.0
    /compat/linux/usr/X11/lib/libXt.so.3 -> libXt.so.3.1.0
    /compat/linux/usr/X11/lib/libX11.so.3.1.0
    /compat/linux/usr/X11/lib/libX11.so.3 -> libX11.so.3.1.0
    /compat/linux/lib/libc.so.4.6.29
    /compat/linux/lib/libc.so.4 -> libc.so.4.6.29

.. raw:: html

   <div class="blockquote">

    .. raw:: html

       <div class="note" xmlns="">

    Nota:
    ~~~~~

    Recuerde que si ya tiene una biblioteca compartida Linux con un
    n?mero de versi?n mayor que coincida con la primera columna de la
    salida de ``ldd`` no necesitar? copiar el fichero que aparece en la
    ?ltima columna; el que tiene deber?a funcionar, aunque se aconseja
    copiar la biblioteca compartida de todas maneras si es una nueva
    versi?n. Puede eliminar la vieja siempre que haga que el enlace
    simb?lico apunte a la nueva. Si tiene estas bibliotecas en su
    sistema:

    .. code:: screen

        /compat/linux/lib/libc.so.4.6.27
        /compat/linux/lib/libc.so.4 -> libc.so.4.6.27

    y un binario requiere una versi?n m?s reciente (como indica la
    siguiente salida de ``ldd``):

    .. code:: screen

        libc.so.4 (DLL Jump 4.5pl26) -> libc.so.4.6.29

    si solo ve una o dos versiones desfasadas en los ?ltimos d?gitos no
    se preocupe de copiar ``/lib/libc.so.4.6.29``, el programa deber?a
    funcionar bien con una versi?n ligeramente antigua. De todas formas,
    si as? lo prefiere, puede actualizar ``libc.so``; el resultado ser?a
    este:

    .. code:: screen

        /compat/linux/lib/libc.so.4.6.29
        /compat/linux/lib/libc.so.4 -> libc.so.4.6.29

    .. raw:: html

       </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="blockquote">

    .. raw:: html

       <div class="note" xmlns="">

    Nota:
    ~~~~~

    El mecanismo de enlazado simb?lico *s?lamente* es necesario con
    binarios Linux. El enlazador en tiempo de ejecuci?n de FreeBSD se
    encarga de buscar ?l mismo las versiones correctas, as? que no
    tendr? que preocuparse usted de hacerlo.

    .. raw:: html

       </div>

.. raw:: html

   </div>

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

10.2.2. Instalar binarios ELF Linux
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Los binarios ELF algunas veces requieren un paso extra de “marcado”. Si
trata de ejecutar un binario ELF no marcado recibir? un mensaje de error
como el siguiente:

.. code:: screen

    % ./mi-binario-elf
    ELF binary type not known
    Abort

Para ayudar al kernel de FreeBSD a distinguir entre un binario ELF de
FreeBSD y uno de Linux utilice
`brandelf(1) <http://www.FreeBSD.org/cgi/man.cgi?query=brandelf&sektion=1>`__.

.. code:: screen

    % brandelf -t Linux mi-binario-elf-de-linux

Las herramientas GNU se encargan de ubicar autom?ticamente la marca
apropiada en los binarios ELF, por lo tanto este paso ser? innecesario
en un futuro pr?ximo.

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

10.2.3. Configuraci?n de la resoluci?n de nombres de equipos
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Si el DNS no funciona u obtiene este mensaje:

.. code:: screen

    resolv+: "bind" is an invalid keyword resolv+:
    "hosts" is an invalid keyword

Necesitar? un fichero ``/compat/linux/etc/host.conf`` con el siguiente
contenido:

.. code:: programlisting

    order hosts, bind
    multi on

Significa que ``/etc/hosts`` ser?analizado en primer lugar y despu?s se
usar? DNS. Si ``/compat/linux/etc/host.conf`` no est? instalado, las
aplicaciones Linux usan el ``/etc/host.conf`` de FreeBSD y chocan con la
sintaxis (incompatible) de FreeBSD. Borre ``bind`` de su
``/etc/resolv.conf`` si no tiene configurado un servidor de nombres.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------------------+-----------------------------+------------------------------------------------+
| `Anterior <linuxemu.html>`__?                    | `Subir <linuxemu.html>`__   | ?\ `Siguiente <linuxemu-mathematica.html>`__   |
+--------------------------------------------------+-----------------------------+------------------------------------------------+
| Cap?tulo 10. Compatibilidad binaria con Linux?   | `Inicio <index.html>`__     | ?10.3. Instalaci?n de Mathematica?             |
+--------------------------------------------------+-----------------------------+------------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
