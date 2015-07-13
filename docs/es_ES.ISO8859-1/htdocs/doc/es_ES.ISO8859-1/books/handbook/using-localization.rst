============================
22.3. Uso de la localizaci?n
============================

.. raw:: html

   <div class="navheader">

22.3. Uso de la localizaci?n
`Anterior <l10n-basics.html>`__?
Cap?tulo 22. Localizaci?n - Uso y configuraci?n de I18N/L10N
?\ `Siguiente <l10n-compiling.html>`__

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

22.3. Uso de la localizaci?n
----------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

En todo su esplendor, la I18N no es espec?fica de FreeBSD, y es una
convenci?n. Le animamos a que ayude a FreeBSD siguiendo esta convenci?n.

Las opciones de localizaci?n se basan en tres t?rminos principales:
c?digo de idioma, c?digo de pa?s y codificaci?n. Los nombres de las
“locales” se construyen a partir de estas tres partes como sigue:

.. code:: programlisting

    C?digoDelIdioma
          _C?digoDelPa?s.
          Codificaci?n

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

22.3.1. C?digos de idioma y pa?s
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Para localizar un sistema FreeBSD a un idioma concreto (o cualquier otro
sistema de tipo UNIX? que soporte I18N), los usuarios necesitar
averiguar los c?digos del pa?s e idioma concreto (los c?digos de pa?s le
dicen a las aplicaciones que variedad del idioma dado deben usar).
Adem?s, los navegadores web, servidores SMTP/POP, servidores web, etc
toman decisiones bas?ndose en ellos. Los siguientes son ejemplos de
c?digos de idioma/pa?s:

.. raw:: html

   <div class="informaltable">

+-------------------------+--------------------------------------+
| C?digo de idioma/pa?s   | Descripci?n                          |
+=========================+======================================+
| en\_US                  | Ingl?s - Estados Unidos de Am?rica   |
+-------------------------+--------------------------------------+
| ru\_RU                  | Ruso de Rusia                        |
+-------------------------+--------------------------------------+
| zh\_TW                  | Chino tradicional de Taiw?n          |
+-------------------------+--------------------------------------+

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

22.3.2. Codificaciones
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Algunos idiomas usan codificaciones distintas al ASCII que son de 8
bits, caracteres anchos o multibyte; consulte
`multibyte(3) <http://www.FreeBSD.org/cgi/man.cgi?query=multibyte&sektion=3>`__
para conocer m?s detalles. Algunas aplicaciones m?s antiguas no los
reconocen y los confunden con caracteres de control. Las aplicaciones
modernas normalmente reconocen los caracteres de 8 bits. Dependiendo de
la implementaci?n, los usuarios pueden necesitar compilar una aplicaci?n
con soporte para caracteres anchos o multibyte, o configurarlo
correctamente. Para poder introducir y procesar caracteres anchos o
multibyte, la Colecci?n de “Ports” de FreeBSD proporciona diferentes
programas a cada idioma. Dir?jase a la documentaci?n de I18N del “ port”
de FreeBSD correspondiente.

Espec?ficamente, los usuarios necesitan mirar la documentaci?n de la
aplicaci?n para decidir como configurarla correctamente o pasar valores
correctos al configure/Makefile/compilador.

Algunas cosas a tener presentes son:

.. raw:: html

   <div class="itemizedlist">

-  Los juegos de caracteres de tipo char de C espec?ficos para el idioma
   (consulte
   `multibyte(3) <http://www.FreeBSD.org/cgi/man.cgi?query=multibyte&sektion=3>`__),
   v.g. ISO-8859-1, ISO-8859-15, KOI8-R, CP437.

-  Las codificaciones anchas o multibyte, v.g. EUC, Big5 .

.. raw:: html

   </div>

Puede comprobar la lista activa de juegos de caracteres en el `Registro
IANA <http://www.iana.org/assignments/character-sets>`__.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Las versiones 4.5 y posteriores de FreeBSD usan en su lugar
codificaciones de la “locale” compatibles con X11.

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

22.3.3. Aplicaciones I18N
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

En el sistema de paquetes y ports de FreeBSD, las aplicaciones I18N se
han denominado con ``I18N     `` en su nombre para una f?cil
identificaci?n. Sin embargo, no siempre soportan el idioma necesitado.

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

22.3.4. Configuraci?n de las “locales”
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Normalmente basta con exportar el valor del nombre de la “locale” como
``LANG`` en el int?rprete de ?rdenes de la sesi?n. Esto se podr?a hacer
en el fichero ``     ~/.login_conf`` del usuario o en el fichero de
inicio del int?rprete de ?rdenes del usuario (``~/.profile``,
``~/.bashrc     ``, ``~/.cshrc``). No es necesario configurar las otras
variables de localizaci?n como ``LC_CTYPE`` o ``LC_CTIME``. Dir?jase a
la documentaci?n de FreeBSD espec?fica de su idioma para m?s
informaci?n.

Deber?a configurar las siguientes dos variables de entorno en sus
ficheros de configuraci?n:

.. raw:: html

   <div class="itemizedlist">

-  

   ``LANG`` para las funciones de la familia
   `setlocale(3) <http://www.FreeBSD.org/cgi/man.cgi?query=setlocale&sektion=3>`__
   de POSIX?

-  

   ``MM_CHARSET`` para el juego de caracteres MIME de las aplicaciones

.. raw:: html

   </div>

Esto comprende la configuraci?n del int?rprete de ?rdenes del usuario,
la configuraci?n espec?fica de la aplicaci?n y la configuraci?n de X11.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

22.3.4.1. M?todos de configuraci?n de las “ locales”
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Hay dos m?todos para configurar las “ locales”, que se describen aqu?
abajo. El primero (que es el recomendado) es asignar las variables de
entorno en una `clase de
sesi?n <using-localization.html#login-class>`__, y el segundo es a?adir
las asignaciones de las variables de entorno al `fichero de
inicio <using-localization.html#startup-file>`__ del int?rprete de
?rdenes del sistema.

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

22.3.4.1.1. M?todo de las clases de sesi?n
''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Este m?todo permite asignar las variables de entorno necesarias para el
nombre de las “locales ” y el juego de caracteres MIME de una sola vez
para todos los posibles int?rpretes de ?rdenes, en vez de a?adir
asignaciones espec?ficas en los ficheros de inicio de cada uno de los
int?rpretes de ?rdenes. La `configuraci?n a nivel de
usuario <using-localization.html#usr-setup>`__ la puede realizar el
propio usuario, mientras que la `configuraci?n a nivel de
administrador <using-localization.html#adm-setup>`__ precisa de permisos
de superusuario.

.. raw:: html

   <div class="sect5">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

22.3.4.1.1.1. Configuraci?n a nivel de usuario
                                              

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Esto es un ejemplo minimalista de un fichero ``.login_conf`` de la
carpeta de inicio de un usuario, que contiene las dos variables
configuradas para la codificaci?n Latin-1:

.. code:: programlisting

    me:\
        :charset=ISO-8859-1:\
        :lang=de_DE.ISO8859-1:

Esto es un ejemplo de un ``.login_conf           `` que configura las
variables para el chino tradicional en la codificaci?n BIG-5. Observe
que se configuran muchas m?s variables porque algunos programas no
respetan correctamente las variables de las “locales” para el chino, el
japon?s y el coreano.

.. code:: programlisting

    #Users who do not wish to use monetary units or time formats
    #of Taiwan can manually change each variable
    me:\
        :lang=zh_TW.Big5:\
        :lc_all=zh_TW.Big:\
        :lc_collate=zh_TW.Big5:\
        :lc_ctype=zh_TW.Big5:\
        :lc_messages=zh_TW.Big5:\
        :lc_monetary=zh_TW.Big5:\
        :lc_numeric=zh_TW.Big5:\
        :lc_time=zh_TW.Big5:\
        :charset=big5:\
        :xmodifiers="@im=xcin": #Setting the XIM Input Server

Consulte la `configuraci?n a nivel de
administrador <using-localization.html#adm-setup>`__ y
`login.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=login.conf&sektion=5>`__
para conocer m?s detalles.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect5">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

22.3.4.1.1.2. Configuraci?n a nivel de administrador
                                                    

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Compruebe que la clase de sesi?n en ``/etc/login.conf`` establece el
idioma adecuado. Aseg?rese de que estas opciones aparecen en
``/etc/login.conf           ``:

.. code:: programlisting

    nombre_del_idioma:t?tulo_cuentas:\
        :charset=juego_de_caracteres_MIME:\
        :lang=nombre de la locale:\
        :tc=default:

As? que, si seguimos con nuestro ejemplo anterior que usaba Latin-1,
tendr?a este aspecto:

.. code:: programlisting

    german:German Users Accounts:\
        :charset=ISO-8859-1:\
        :lang=de_DE.ISO8859-1:\
        :tc=default:

Modificaci?n de las clases de sesi?n con `vipw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=vipw&sektion=8>`__
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

Utilice ``vipw`` para a?adir nuevos usuarios, y haga que la entrada
tenga este aspecto:

.. code:: programlisting

    usuario:contrase?a:1111:11:idioma:0:0:Nombre de usuario:/home/usuario:/bin/sh

Modificaci?n de las clases de sesi?n con with `adduser(8) <http://www.FreeBSD.org/cgi/man.cgi?query=adduser&sektion=8>`__
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

Utilice ``adduser`` para a?adir nuevos usuarios, y haga lo siguiente:

.. raw:: html

   <div class="itemizedlist">

-  Establezca ``defaultclass =           idioma`` en
   ``/etc/adduser.conf``. Recuerde que en este caso debe introducir una
   clase ``default`` (por omisi?n) para todos los usuarios de otros
   idiomas.

-  Una variante alternativa es contestar el idioma indicado cada vez que
   `adduser(8) <http://www.FreeBSD.org/cgi/man.cgi?query=adduser&sektion=8>`__
   muestre

   .. code:: screen

       Enter login class: default
                 []: 

-  Otra alternativa es utilizar lo siguiente para cada usuario de un
   idioma diferente al que desee a?adir:

   .. code:: screen

       # adduser -class
                 idioma
                 

.. raw:: html

   </div>

Modificaci?n de las clases de sesi?n con `pw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pw&sektion=8>`__
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

Si utiliza
`pw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pw&sektion=8>`__ para
a?adir nuevos usuarios, ll?melo de esta manera:

.. code:: screen

    # pw useradd
              nombre_usuario -L
              idioma

.. raw:: html

   </div>

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

22.3.4.1.2. M?todo de los ficheros de inicio de los int?rpretes de ?rdenes
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

No se recomienda este m?todo porque precisa de una configuraci?n
diferente para cada int?rprete de ?rdenes que se pueda elegir. Utilice
en su lugar el `m?todo de las clases de
sesi?n <using-localization.html#login-class>`__.

.. raw:: html

   </div>

Para a?adir el nombre de la “locale ” y el juego de caracteres MIME,
simplemente establezca las dos variables de entorno mostradas abajo en
los ficheros de inicio del int?rprete de ?rdenes ``/etc/profile`` y/o
``/etc/csh.login``. Aqu? abajo usaremos el idioma alem?n como ejemplo:

En ``/etc/profile``:

.. code:: programlisting

    LANG=de_DE.ISO8859-1; export LANG
    MM_CHARSET=ISO-8859-1; export MM_CHARSET

O en ``/etc/csh.login``:

.. code:: programlisting

    setenv LANG de_DE.ISO8859-1
    setenv MM_CHARSET ISO-8859-1

Como alternativa, puede a?adir las instrucciones anteriores a
``/usr/share/skel/             dot.profile`` (similar a lo que se
utiliz? antes en ``/etc/profile`` ), o ``/usr/share/skel/dot.login``
(similar a lo que se utiliz? antes en ``             /etc/csh.login``).

Para X11:

En ``$HOME/.xinitrc``:

.. code:: programlisting

    LANG=de_DE.ISO8859-1; export LANG

O:

.. code:: programlisting

    setenv LANG de_DE.ISO8859-1

En funci?n de su int?rprete de ?rdenes (vea m?s arriba).

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

22.3.5. Configuraci?n de la consola
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Para todos los juegos de caracteres representables con el tipo char en
C, establezca los tipos de letra para la consola adecuados para el
idioma en cuesti?n en ``         /etc/rc.conf`` con:

.. code:: programlisting

    font8x16=nombre_del_tipo_de_letra
            
    font8x14=nombre_del_tipo_de_letra
    font8x8=nombre_del_tipo_de_letra

Aqu?, el *``nombre_del_tipo_de_letra         ``* se toma del directorio
``/usr/share/         syscons/fonts``, sin el sufijo ``.fnt         ``.

Aseg?rese tambi?n de configurar los mapas de teclado y pantalla
correctos para su juego de caracteres C por medio de ``sysinstall``
(``/stand/sysinstall`` en versiones de FreeBSD anteriores a la 5.2). Una
vez dentro de sysinstall , seleccione Configure , y despu?s Console .
Como alternativa, puede a?adir lo siguiente en ``/etc/rc.conf``:

.. code:: programlisting

    scrnmap=nombre_del_mapa_de_pantalla
    keymap=nombre_del_mapa_de_teclado
    keychange="secuencia n?mero_tecla_de_funci?n"

Aqu?, el *``nombre_del_mapa_de_pantalla         ``* se toma del
directorio ``/usr/share/         syscons/scrnmaps``, sin el sufijo
``.scm         ``. Normalmente es necesario un mapa de pantalla
(“screenmap”) con un tipo de letra correspondiente para poder extender
de 8 a 9 bits la matriz de caracteres de una tarjeta VGA en un ?rea
pseudogr?fica, es decir, desplazar las letras fuera de ese ?rea si el
tipo de letra de pantalla usa una columna de 8 bits.

Si tiene habilitado el d?mon moused por configurar esto en su
``/etc/         rc.conf``:

.. code:: programlisting

    moused_enable="YES"

entonces estudie la informaci?n sobre el cursor del rat?n del siguiente
p?rrafo.

Por omisi?n, el cursor del rat?n del controlador
`syscons(4) <http://www.FreeBSD.org/cgi/man.cgi?query=syscons&sektion=4>`__
ocupa el intervalo 0xd0-0xd3 del juego de caracteres. Si su idioma usa
este intervalo, necesita desplazar el intervalo del cursor fuera de ?l.
En versiones de FreeBSD anteriores a la 5.0, introduzca la siguiente
l?nea en la configuraci?n del n?cleo:

.. code:: programlisting

    options        SC_MOUSE_CHAR=0x03

En FreeBSD 4.4 y posteriores, introduzca la siguiente l?nea en
``/etc/rc.conf``:

.. code:: programlisting

    mousechar_start=3

Aqu?, el *``nombre_del_mapa_de_teclado         ``* se toma del
directorio ``/usr/share/         syscons/keymaps``, sin el sufijo
``.kbd         ``. Si no est? seguro de cual mapa de teclado usar, puede
usar
`kbdmap(1) <http://www.FreeBSD.org/cgi/man.cgi?query=kbdmap&sektion=1>`__
para probar los mapas de teclado sin reiniciar.

Normalmente se necesita el ``keychange`` para programar las teclas de
funci?n para que coincidan con el tipo de terminal seleccionado, porque
las secuencias de las teclas de funci?n no se pueden definir en el mapa
de teclado.

Aseg?rese tambi?n de configurar el tipo de terminal consola correcto en
``/etc/ttys`` para todas las entradas ``ttyv*``. Las correspondencias
predefinidas actualmente son:

.. raw:: html

   <div class="informaltable">

+---------------------------------+--------------------+
| Juego de caracteres             | Tipo de terminal   |
+=================================+====================+
| ISO-8859-1 o ISO-8859-15        | ``cons25l1``       |
+---------------------------------+--------------------+
| ISO-8859-2                      | ``cons25l2``       |
+---------------------------------+--------------------+
| ISO-8859-7                      | ``cons25l7``       |
+---------------------------------+--------------------+
| KOI8-R                          | ``cons25r``        |
+---------------------------------+--------------------+
| KOI8-U                          | ``cons25u``        |
+---------------------------------+--------------------+
| CP437 (predeterminada en VGA)   | ``cons25``         |
+---------------------------------+--------------------+
| US-ASCII                        | ``cons25w``        |
+---------------------------------+--------------------+

.. raw:: html

   </div>

Para los idiomas en caracteres anchos o multibyte, utilice el port
correcto de FreeBSD en su directorio ``     /usr/ports/idioma``. Algunos
ports aparecen como consola mientras que el sistema los ve como una vtty
serie, por lo tanto debe reservar suficientes vtty tanto para X11 como
la consola pseudoserie. Aqu? tiene una lista parcial de aplicaciones
para usar otros idiomas en la consola:

.. raw:: html

   <div class="informaltable">

+-----------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Idioma                      | Ubicaci?n                                                                                                                                                                                                 |
+=============================+===========================================================================================================================================================================================================+
| Chino tradicional (BIG-5)   | `chinese/big5con <http://www.freebsd.org/cgi/url.cgi?ports/chinese/big5con%0A%09%20%20%20%20%20%20%20%20/pkg-descr>`__                                                                                    |
+-----------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Japon?s                     | `japanese/kon2-16dot <http://www.freebsd.org/cgi/url.cgi?ports/japanese/kon2-16dot/pkg-descr>`__ o `japanese/mule-freewnn <http://www.freebsd.org/cgi/url.cgi?ports/japanese/mule-freewnn/pkg-descr>`__   |
+-----------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Coreano                     | `korean/han <http://www.freebsd.org/cgi/url.cgi?ports/korean/han/pkg-descr>`__                                                                                                                            |
+-----------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

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

22.3.6. Configuraci?n de X11
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Aunque X11 no es parte del Proyecto FreeBSD, hemos incluido aqu? algo de
informaci?n para usuarios de FreeBSD. Para m?s detalles, acuda al `sitio
web de Xorg <http://www.x.org/>`__ o del servidor X11 que utilice.

En ``~/.Xresources``, puede afinar m?s las opciones de I18N espec?ficas
de la aplicaci?n (v.g., tipos de letra, men?s, etc).

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

22.3.6.1. Visualizaci?n de los tipos de letra
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Instale el servidor Xorg
(`x11-servers/xorg-server <http://www.freebsd.org/cgi/url.cgi?ports/x11-servers/xorg-server/pkg-descr>`__
o el servidor XFree86™
(`x11-servers/XFree86-4-Server <http://www.freebsd.org/cgi/url.cgi?ports/x11-servers/XFree86-4-Server/pkg-descr>`__),
y desp?es instale los tipos de letra TrueType? del idioma. La
configuraci?n de la “locale” correcta para el idioma deber?a permitirle
ver el idioma seleccionado en men?s y similares.

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

22.3.6.2. Introducci?n de caracteres no ingleses
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El protocolo M?todo de Introducci?n X11 (XIM) es un nuevo est?ndar para
todos los clientes X11. Todas las aplicaciones X11 deber?an estar
escritas como clientes XIM que reciben entradas de servidores XIM. Hay
varios servidores XIM disponibles para distintos idiomas.

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

22.3.7. Configuraci?n de la impresora
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Hay algunos juegos de caracteres de tipo char de C que est?n normalmente
codificados por hardware en las impresoras. Los juegos de caracteres
anchos o multibyte precisan de una configuraci?n especial y recomendamos
el uso de apsfilter. Tambi?n puede convertir el documento a los formatos
PostScript? o PDF usando conversores espec?ficos del idioma.

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

22.3.8. El n?cleo y los sistemas de ficheros
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El sistema de ficheros r?pido (FFS) de FreeBSD funciona bien a 8 bits,
as? que se puede usar con cualquier juego de caracteres de tipo char de
C (vea
`multibyte(3) <http://www.FreeBSD.org/cgi/man.cgi?query=multibyte&sektion=3>`__),
pero no hay almacenado ning?n nombre de juego de caracteres en el
sistema de ficheros; es decir, son 8 bits en bruto y no sabe nada acerca
del orden de codificaci?n. Oficialmente, FFS no soporta todav?a ninguna
forma de juegos de caracteres anchos o multibyte. Sin embargo, algunos
juegos de caracteres anchos o multibyte tienen parches independientes
para habilitar dicho soporte en FFS. Son solamente soluciones temporales
no portables o “hacks”, y hemos decicido no incluirlas en el ?rbol de
c?digo fuente. Dir?jase a los sitios web de los respectivos idiomas para
encontrar m?s informaci?n y los parches.

El sistema de ficheros MS-DOS?de FreeBSD tiene la capacidad configurable
de convertir entre los juegos de caracteres MS-DOS?, Unicode y los
juegos de caracteres seleccionados del sistema de ficheros de FreeBSD.
Vea
`mount\_msdos(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount_msdos&sektion=8>`__
para m?s detalles.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------+---------------------------+---------------------------------------------------------+
| `Anterior <l10n-basics.html>`__?   | `Subir <l10n.html>`__     | ?\ `Siguiente <l10n-compiling.html>`__                  |
+------------------------------------+---------------------------+---------------------------------------------------------+
| 22.2. Lo b?sico?                   | `Inicio <index.html>`__   | ?22.4. Compilaci?n de programas con soporte para I18N   |
+------------------------------------+---------------------------+---------------------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
