========================
5.5. Uso de tipos en X11
========================

.. raw:: html

   <div class="navheader">

5.5. Uso de tipos en X11
`Anterior <x-config.html>`__?
Cap?tulo 5. El sistema X Window
?\ `Siguiente <x-xdm.html>`__

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

5.5. Uso de tipos en X11
------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Escrito por Murray Stokely.

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

5.5.1. Tipos Type1
~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Los tipos que X11 incluye por omisi?n no son precisamente ideales para
las aplicaciones t?picas. Los tipos grandes para presentaciones aparecen
dentados y con un aspecto poco profesional, mientras que los tipos
peque?os en Netscape? son pr?cticamente ilegibles. Sin embargo hay
varios tipos de letra libres Type1 de alta calidad (PostScript?) que se
pueden usar con X11. Por ejemplo los tipos URW
(`x11-fonts/urwfonts <http://www.freebsd.org/cgi/url.cgi?ports/x11-fonts/urwfonts/pkg-descr>`__)
incluyen una versi?n de alta calidad de los tipos est?ndar Type 1 (Times
Roman?, (Helvetica?, (Palatino?, y muchas otras). Las Freefonts
(`x11-fonts/freefonts <http://www.freebsd.org/cgi/url.cgi?ports/x11-fonts/freefonts/pkg-descr>`__
) incluyen muchas m?s pero la mayor?a est?n pensadas para usarse con
software gr?fico como el Gimp y no son lo bastante completos para usarse
como tipos de pantalla. Adem?s X11 se puede configurar para usar tipos
TrueType? con un esfuerzo m?nimo. Para m?s detalles sobre esto consulte
la p?gina del manual
`X(7) <http://www.FreeBSD.org/cgi/man.cgi?query=X&sektion=7>`__ o la
`secci?n de tipos TrueType? <x-fonts.html#truetype>`__.

Para instalar los tipos Type1 desde los ports ejecute las siguientes
?rdenes:

.. code:: screen

    # cd /usr/ports/x11-fonts/urwfonts
    # make install clean

Proceda del mismo modo con los FreeFonts o cualesquiera otras. Para que
el servidor X las detecte a?ada la siguiente l?nea al fichero de
configuraci?n de X (``/etc/X11/xorg.conf``:

.. code:: programlisting

    FontPath "/usr/X11R6/lib/X11/fonts/URW/"

o bien desde una emulaci?n de terminal durante una sesi?n X ejecute

.. code:: screen

    % xset fp+ /usr/X11R6/lib/X11/fonts/URW
    % xset fp rehash

Esto funcionar? hasta que la sesi?n X se cierre a menos que lo a?ada a
su fichero de inicio (``~/.xinitrc`` en el caso de una sesi?n ``startx``
normal o ``~/.xsession`` si hace login desde un gestor gr?fico como
XDM). Una tercera forma ser?a usando el nuevo fichero
``/usr/X11R6/etc/fonts/local.conf``: consulte la secci?n de
`anti-aliasing <x-fonts.html#antialias>`__.

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

5.5.2. Tipos TrueType?
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Xorg se dise?? pensando en que utilizara tipos TrueType?. Hay dos
m?dulos diferentes que pueden habilitar esta opci?n. El m?dulo freetype
se usa en en este ejemplo porque es m?s consistente con el resto de
?back-ends? de representaci?n. Para habilitar el m?dulo freetype debe
a?adir la siguiente l?nea a la secci?n ``"Module"`` del fichero
``/etc/X11/xorg.conf``.

.. code:: programlisting

    Load "freetype"

Ahora haga un directorio para los tipos TrueType? (por ejemplo
``/usr/X11R6/lib/X11/fonts/TrueType``) y copie todos los tipos TrueType?
en este directorio. Recuerde que los tipos TrueType? no se pueden coger
directamente de un Macintosh?; tienen que estar en formato
UNIX?/MS-DOS?/Windows? para usarlas con X11. Una vez que los ficheros se
hayan copiado en este directorio use ttmkfdir para crear un fichero
``fonts.dir``, para que el representador de tipos de X sepa que se han
instalado estos ficheros nuevos. ``ttmkfdir`` forma parte de la
Colecci?n de Ports de FreeBSD:
`x11-fonts/ttmkfdir <http://www.freebsd.org/cgi/url.cgi?ports/x11-fonts/ttmkfdir/pkg-descr>`__.

.. code:: screen

    # cd /usr/local/lib/X11/fonts/TrueType
    # ttmkfdir -o fonts.dir

Ahora a?ada el directorio TrueType? a la ruta de tipos. Esto es igual
que lo anteriormente descrito sobre los tipos
`Type1 <x-fonts.html#type1>`__. Ejecute:

.. code:: screen

    % xset fp+ /usr/local/lib/X11/fonts/TrueType
    % xset fp rehash

o a?ada una l?nea ``FontPath`` en su ``/etc/X11/xorg.conf``.

Esto es todo. Ahora Netscape?, Gimp, StarOffice™ y el resto de
aplicaciones X debieran reconocer los tipos TrueType? instalados. Los
tipos muy peque?os (como el texto en una pantalla con alta resoluci?n
viendo una p?gina web) y los tipos muy grandes (Dentro de StarOffice™)
se ver?n much?simo mejor ahora.

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

5.5.3. Tipos Anti-Aliasing
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div>

Actualizado por Joe Marcus Clarke.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Los ?tipos anti-aliasing? han estado en X11 desde XFree86™ 4.0.2. Aunque
la configuraci?n de los tipos era inc?moda antes de XFree86™ 4.3.0. A
partir de XFree86™ 4.3.0 todos los tipos de X11 que se encuentren en
``/usr/local/lib/X11/fonts/`` y ``~/.fonts/`` est?n disponibles
autom?ticamente para aplicaciones que soporten Xft. No todas las
aplicaciones soportan Xft pero muchas ya tienen soporte Xft. Ejemplos de
aplicaciones que lo soportan son Qt 2.3 o superior (el ?toolkit? del
escritorio KDE), GTK+ 2.0 o superior (el ?toolkit? del escritorio GNOME
) y Mozilla 1.2 o superior.

Para controlar qu? tipos ?anti-aliasing? o configurar las propiedades
?anti-aliasing? cr?e (o edite, si ya existe) el fichero
``/usr/local/etc/fonts/local.conf``. Se pueden modificar diversas
opciones avanzadas del sistema de tipos Xft usando este fichero; esta
secci?n describe solo algunas posibilidades simples. Para m?s detalles
consulte
`fonts-conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=fonts-conf&sektion=5>`__.

Este fichero tiene que estar en formato XML. Preste especial atenci?n a
las may?sculas y min?sculas y aseg?rese de que las etiquetas est?n
cerradas correctamente. El fichero empieza con la t?pica cabecera XML
seguida de una definici?n DOCTYPE y despu?s la etiqueta
``<fontconfig>``:

.. code:: programlisting

            <?xml version="1.0"?>
            <!DOCTYPE fontconfig SYSTEM "fonts.dtd">
            <fontconfig>
          

Como se ha dicho antes todos los tipos en ``/usr/local/lib/X11/fonts/``
y en ``~/.fonts/`` est?n ya disponibles para las aplicaciones que
soporten Xft. Si usted desea a?adir otro directorio adem?s de estos dos
?rboles de directorios a?ada una l?nea similar a esta en el fichero
``/usr/local/etc/fonts/local.conf``:

.. code:: programlisting

    <dir>/ruta/de/mis/tipos</dir>

Despu?s de a?adir los nuevos tipos, y en especial los nuevos directorios
de tipos, debe ejecutar la siguiente orden para reconstruir la cach? de
tipos:

.. code:: screen

    # fc-cache -f

Los ?tipos anti-aliasing? hacen los bordes ligeramente borrosos, lo que
hace que el texto muy peque?o sea m?s legible y elimina los escalones
del texto grande pero puede causar fatiga visual aplicada al texto
normal. Para excluir los tipos de menos de 14 puntos del ?anti-aliasing?
incluya las siguientes l?neas:

.. code:: programlisting

            <match target="font">
                <test name="size" compare="less">
                    <double>14</double>
                </test>
                <edit name="antialias" mode="assign">
                    <bool>false</bool>
                </edit>
            </match>
            <match target="font">
                <test name="pixelsize" compare="less" qual="any">
                    <double>14</double>
                </test>
                <edit mode="assign" name="antialias">
                    <bool>false</bool>
                </edit>
            </match>

El espacio entre algunos tipos tambi?n podr?a ser inapropiado con
?anti-aliasing?, por ejemplo en el caso de KDE. Una posible soluci?n
para esto es forzar que el espacio entre los tipos sea 100. A?ada las
siguientes l?neas:

.. code:: programlisting

           <match target="pattern" name="family">
                 <test qual="any" name="family">
                     <string>fixed</string>
                 </test>
                 <edit name="family" mode="assign">
                     <string>mono</string>
                 </edit>
              </match>
              <match target="pattern" name="family">
                  <test qual="any" name="family">
                      <string>console</string>
                  </test>
                  <edit name="family" mode="assign">
                      <string>mono</string>
                  </edit>
              </match>

(Esto selecciona los otros nombres comunes para ?tipos fixed? como
``"mono"``); a?ada tambi?n lo siguiente:

.. code:: programlisting

             <match target="pattern" name="family">
                 <test qual="any" name="family">
                     <string>mono</string>
                 </test>
                 <edit name="spacing" mode="assign">
                     <int>100</int>
                 </edit>
             </match>      

Algunos tipos, como Helvetica, podr?an tener problemas con
?anti-aliasing?. Normalmente esto se manifiesta en tipos que parecen
cortados verticalmente por la mitad. En el peor de los casos podr?a
causar que el funcionamiento de aplicaciones como Mozilla se
interrumpiese. Para evitar esto puede a?adir lo siguiente a
``local.conf``:

.. code:: programlisting

             <match target="pattern" name="family">
                 <test qual="any" name="family">
                     <string>Helvetica</string>
                 </test>
                 <edit name="family" mode="assign">
                     <string>sans-serif</string>
                 </edit>
             </match>        

Una vez que haya terminado de editar ``local.conf`` aseg?rese de que el
fichero termina con la etiqueta ``</fontconfig>``. Si no lo hace los
cambios que haya hecho ser?n ignorados.

Los tipos por omisi?n que vienen con X11 no son los ideales para
?anti-aliasing?. Puede encontrar otros mucho mejores en el port
`x11-fonts/bitstream-vera <http://www.freebsd.org/cgi/url.cgi?ports/x11-fonts/bitstream-vera/pkg-descr>`__.
Este port instalar? el fichero ``/usr/local/etc/fonts/local.conf`` si
aun no se ha creado. Si el fichero existe el port creara el fichero
``/usr/local/etc/fonts/local.conf-vera``. Combine el contenido de este
fichero con ``/usr/local/etc/fonts/local.conf`` y los tipos Bitstream
reemplazar?n autom?ticamente los tipos por defecto por X11 Serif, Sans
Serif y Monospaced.

Por si esto fuera poco los usuarios pueden a?adir sus propios ajustes
mediante sus ficheros personales ``.fonts.conf``. Los usuarios que
deseen hacerlo deber?n crear un fichero ``~/.fonts.conf``. Este fichero
tiene que estar tambi?n en formato XML.

Un ?ltimo punto: con pantallas LCD ser?a deseable un muestreo de
subpixel, que consiste en configurar los componentes (separados
horizontalmente) rojo, verde y azul para mejorar la resoluci?n
horizontal; los resultados pueden ser impresionantes. Para habilitarlo
a?ada la siguiente l?nea a ``local.conf``:

.. code:: programlisting

            <match target="font">
                <test qual="all" name="rgba">
                    <const>unknown</const>
                </test>
                <edit name="rgba" mode="assign">
                    <const>rgb</const>
                </edit>
            </match>
          

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Dependiendo del tipo de pantalla ``rgb`` podr?a ser ``bgr`` o ``vrgb`` o
``vbgr``: experimente y elija cu?l de ellos funciona mejor.

.. raw:: html

   </div>

Una vez concluido el proceso ?anti-aliasing? se deber?a activar la
pr?xima vez que arranque X, aunque los programas necesitan saber como
utilizarlo. En este momento el ?toolkit? Qt es capaz de hacerlo, as? que
KDE entero puede usar ?tipos anti-aliasing?. GTK+ y GNOME tambi?n pueden
usar ?tipos anti-aliasing? mediante el ?applet? ?Font? (consulte
`Secci?n?5.7.1.3, “Tipos ?Anti-aliased? en
GNOME” <x11-wm.html#x11-wm-gnome-antialias>`__ para m?s detalle). Por
omisi?n Mozilla 1.2 y versiones siguientes usar?n autom?ticamente ?tipos
anti-aliasing?. Para deshabilitarlos recompile Mozilla usando el
par?metro ``-DWITHOUT_XFT``.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------+---------------------------+---------------------------------+
| `Anterior <x-config.html>`__?   | `Subir <x11.html>`__      | ?\ `Siguiente <x-xdm.html>`__   |
+---------------------------------+---------------------------+---------------------------------+
| 5.4. Configuraci?n de X11?      | `Inicio <index.html>`__   | ?5.6. El gestor de pantalla X   |
+---------------------------------+---------------------------+---------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
