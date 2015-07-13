=========================
5.4. Configuraci?n de X11
=========================

.. raw:: html

   <div class="navheader">

5.4. Configuraci?n de X11
`Anterior <x-install.html>`__?
Cap?tulo 5. El sistema X Window
?\ `Siguiente <x-fonts.html>`__

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

5.4. Configuraci?n de X11
-------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Escrito por Christopher Shumway.

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

5.4.1. Antes de empezar
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Antes de configurar X11 necesitar? la siguiente informaci?n sobre el
sistema:

.. raw:: html

   <div class="itemizedlist">

-  Especificaciones del monitor

-  Chipset de la tarjeta de v?deo

-  Memoria de la tarjeta de v?deo

.. raw:: html

   </div>

X11 usa las especificaciones del monitor para determinar la resoluci?n y
la frecuencia de refresco a la que funcionar?. Estas especificaciones se
pueden encontrar normalmente en la documentaci?n que viene con el
monitor o en la web del fabricante. Se necesitan dos rangos de n?meros:
la frecuencia de refresco horizontal y la vertical.

El chipset de la tarjeta de v?deo define qu? controlador utilizar? X11
para comunicarse con el hardware gr?fico. Con la mayor?a de chipsets es
posible detectarlo autom?ticamente pero es ?til saberlo en caso de que
la detecci?n autom?tica no funcione.

La memoria de la tarjeta gr?fica determina la resoluci?n y la
profundidad de color a la que el sistema funcionar?. Es importante
saberlo para que el usuario conozca las limitaciones del sistema.

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

5.4.2. Configurar X11
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A partir de la versi?n 7.3 Xorg puede funcionar sin utilizar fichero de
configuraci?n; basta con teclear en el prompt:

.. code:: screen

    % startx

Si no funciona, o si la configuraci?n por omisi?n no es aceptable, hay
que configurar X11 a mano.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Ciertos entornos de escritorio como GNOME, KDE o XFce tienen
herramientas que permiten al usuario configurar f?cilmente par?metros de
la pantalla como la resoluci?n. Si la configuraci?n por omisi?n no sirve
y tiene idea de instalar un entorno de escritorio puede seguir adelante
tranquilamente con la instalaci?n del entorno de escritorio y utilice la
herramienta que el software que instale le facilite.

.. raw:: html

   </div>

La configuraci?n de X11 es un proceso que consta de m?ltiples pasos. El
primero es generar un fichero inicial de configuraci?n. Como
superusuario teclee:

.. code:: screen

    # Xorg -configure

Esto generar? un fichero de configuraci?n bastante esquem?tico pero
completo en ``/root`` llamado ``xorg.conf.new`` (si ha utilizado
`su(1) <http://www.FreeBSD.org/cgi/man.cgi?query=su&sektion=1>`__ o ha
entrado directamente como superusuario afectar? al valor que tenga la
variable de directorio ``$HOME``). X11 intentar? probar el hardware
gr?fico del sistema y escribir un fichero de configuraci?n en el que
registrar los controladores de dispositivo adecuados para hacer
funcionar el harware que haya detectado.

El siguiente paso es probar el fichero generado para verificar si Xorg
puede funcionar con el hardware gr?fico del sistema. Para ello teclee:

.. code:: screen

    # Xorg -config xorg.conf.new

Si aparece una rejilla negra y gris junto con el cursor del rat?n con
forma de X es que la configuraci?n ha tenido ?xito. Para salir de la
prueba pulse simult?neamente **Ctrl**+**Alt**+**Retroceso**.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Si el rat?n no funciona tendr? que configurarlo antes de continuar.
Consulte la `Secci?n?2.10.10, “Configuraci?n del
rat?n” <install-post.html#mouse>`__ en el cap?tulo de instalaci?n de
FreeBSD.

.. raw:: html

   </div>

Despu?s modifique el fichero ``xorg.conf.new`` a su gusto. Abra el
fichero con un editor de texto (como
`emacs(1) <http://www.FreeBSD.org/cgi/man.cgi?query=emacs&sektion=1>`__
o `ee(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ee&sektion=1>`__).
Primero a?ada las frecuencias del monitor. Estas suelen estar expresadas
en frecuencia de refresco horizontal y vertical. Estos valores se a?aden
al fichero ``xorg.conf.new`` en la secci?n ``"Monitor"``:

.. code:: programlisting

    Section "Monitor"
            Identifier   "Monitor0"
            VendorName   "Monitor Vendor"
            ModelName    "Monitor Model"
            HorizSync    30-107
            VertRefresh  48-120
    EndSection

Las palabras ``HorizSync`` y ``VertRefresh`` podr?an no existir en el
fichero de configuraci?n. Si no existen es necesario a?adirlas con la
frecuencia horizontal correcta puesta despu?s de la palabra
``HorizSync`` y la frecuencia vertical correcta despu?s de la palabra
``VertRefresh``. En el ejemplo anterior se pusieron las frecuencias del
monitor.

X permite usar las caracter?sticas DPMS (Energy Star) con los monitores
que lo soportan. El programa
`xset(1) <http://www.FreeBSD.org/cgi/man.cgi?query=xset&sektion=1>`__
controla el ?timeout?, y puede forzar los modos ?standby?, suspendido o
apagado. Si desea habilitar las caracter?sticas DPMS para su monitor
tendr? que a?adir la siguiente l?nea en la secci?n ``monitor``:

.. code:: programlisting

            Option       "DPMS"

Agrege a su ``xorg.conf.new`` la resoluci?n por omisi?n y la profundidad
de color deseada. Esto se define en la secci?n ``"Screen"``:

.. code:: programlisting

    Section "Screen"
            Identifier "Screen0"
            Device     "Card0"
            Monitor    "Monitor0"
            DefaultDepth 24
            SubSection "Display"
                    Viewport  0 0
                    Depth     24
                    Modes     "1024x768"
            EndSubSection
    EndSection

La palabra ``DefaultDepth`` describe la profundidad de color a la que
arrancar? por omisi?n. Esto puede sobrescribirse con el argumento
``-bpp`` de
`Xorg(1) <http://www.FreeBSD.org/cgi/man.cgi?query=Xorg&sektion=1>`__ (o
`XFree86(1) <http://www.FreeBSD.org/cgi/man.cgi?query=XFree86&sektion=1>`__).
La palabra ``Modes`` describe la resoluci?n a la que funcionar? para esa
profundidad de color. Observe que s?lo los modos est?ndar VESA est?n
soportados por el hardware gr?fico. En el ejemplo anterior la
profundidad de color es 24 bits por pixel. En esta profundidad de color
la resoluci?n aceptada es 1024 por 768 pixels.

Para acabar guarde el fichero de configuraci?n y pru?belo usando el modo
de prueba descrito anteriormente

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Una de las herramientas disponibles para ayudarle con el proceso de
soluci?n de problemas es el fichero de ?logs?, que contiene informaci?n
de cada dispositivo al que el servidor X11 se conecta. Los ?logs? (o
bit?coras) de Xorg se pueden encontrar en ``/var/log/Xorg.0.log`` El
nombre exacto del fichero de ?log? puede variar entre ``Xorg.0.log`` y
``Xorg.8.log`` y as? sucesivamente.

.. raw:: html

   </div>

Si todo ha ido bien ha llegado el momento de ubicar el fichero de
configuraci?n donde
`Xorg(1) <http://www.FreeBSD.org/cgi/man.cgi?query=Xorg&sektion=1>`__
pueda encontrarlo. Puede dejarlo en ``/etc/X11/xorg.conf`` o
``/usr/local/etc/X11/xorg.conf``.

.. code:: screen

    # cp xorg.conf.new /etc/X11/xorg.conf

El proceso de configuraci?n de X11 ha concluido. Arranque Xorg mediante
`startx(1) <http://www.FreeBSD.org/cgi/man.cgi?query=startx&sektion=1>`__.
Puede tambi?n arrancar el servidor X11 utilizando
`xdm(1) <http://www.FreeBSD.org/cgi/man.cgi?query=xdm&sektion=1>`__.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Existe tambi?n una herramienta gr?fica de configuraci?n en X11,
`xorgcfg(1) <http://www.FreeBSD.org/cgi/man.cgi?query=xorgcfg&sektion=1>`__.
Permite definir de forma interactiva su configuraci? mediante la
elecci?n de los controladores y las opciones adecuadas. Este programa
tambi?n puede usarse desde consola mediante la orden
``xorgcfg -textmode``. Para m?s informaci?n consulte la p?gina de manual
de
`xorgcfg(1) <http://www.FreeBSD.org/cgi/man.cgi?query=xorgcfg&sektion=1>`__.

Puede usar tambi?n
`xorgconfig(1) <http://www.FreeBSD.org/cgi/man.cgi?query=xorgconfig&sektion=1>`__.
Este programa es una herramienta orientada a consola que es bastante
menos atractiva para el usuario, pero que puede funcionar en situaciones
en las que otras herramientas no sirven.

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

5.4.3. Configuraci?n avanzada
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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

5.4.3.1. Configuraci?n de chipsets gr?ficos Intel? i810
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Para configurar los chipsets integrados Intel? i810 es necesario el
interfaz de programaci?n AGP ``agpart`` para que X11 pueda usarla.
Consulte la p?gina de manual de
`agp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=agp&sektion=4>`__ para
m?s informaci?n.

Hecho esto podr? configurar el hardware como cualquier otra tarjeta
gr?fica. Tenga en cuenta que si en un sistema que no tenga el
controlador
`agp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=agp&sektion=4>`__
intenta cargar el m?dulo del kernel con
`kldload(8) <http://www.FreeBSD.org/cgi/man.cgi?query=kldload&sektion=8>`__
no va a funcionar. El controlador tiene necesariamente que estar en el
kernel desde el mismo momento del arranque, cosa que puede obtenerse
bien compilando un nuevo kernel, bien utilizando ``/boot/loader.conf``.

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

5.4.3.2. A?adir una pantalla panor?mica a nuestro sistema
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A lo largo de esta secci?n se asumen unos m?nimos de soltura con ciertos
aspectos de configuraci?n avanzada. Si Si las herramientas est?ndar de
configuraci?n que se han descrito previamente no le ayudan a tener una
configuraci?n funcional busque en los ficheros de log, ah? encontrar?
informaci?n suficiente para lograrlo. Tendr? que utilizar un editor de
texto a lo largo de estas instrucciones.

Los formatos actuales de pantalla panor?mica, (tambi?n conocidas como
?Widescreen?, WSXGA, WSXGA+, WUXGA, WXGA, WXGA+, etc, soportan formatos
de 16:10 y 10:9 o aspectos-tasa que pueden ser problem?ticos. Veamos
algunos ejemplos de resoluciones de pantalla en formatos 16:10:

.. raw:: html

   <div class="itemizedlist">

-  2560x1600

-  1920x1200

-  1680x1050

-  1440x900

-  1280x800

.. raw:: html

   </div>

At some point, it will be as easy as adding one of these resolutions as
a possible ``Mode`` in the ``Section       "Screen"`` as such:

.. code:: programlisting

    Section "Screen"
    Identifier "Screen0"
    Device     "Card0"
    Monitor    "Monitor0"
    DefaultDepth 24
    SubSection "Display"
        Viewport  0 0
        Depth     24
        Modes     "1680x1050"
    EndSubSection
    EndSection

Xorg se basta y se sobra para recabar la informaci?n de resoluci?n de su
pantalla panor?mica mediante la informaci?n I2C/DDC, as? que sabe qu?
frecuencias y resoluciones puede manejar el monitor.

Si esas ``ModeLines`` no existen en los controladores tendr? usted que
ayudar un poco a Xorg. Lea atentamente el contenido de
``/var/log/Xorg.0.log``; de ?l podr? extraer suficiente informaci?n como
para crear un ``ModeLine`` que funcione. Todo lo que tiene que hacer es
buscar informaci?n que se parezca a esta:

.. code:: programlisting

    (II) MGA(0): Supported additional Video Mode:
    (II) MGA(0): clock: 146.2 MHz   Image Size:  433 x 271 mm
    (II) MGA(0): h_active: 1680  h_sync: 1784  h_sync_end 1960 h_blank_end 2240 h_border: 0
    (II) MGA(0): v_active: 1050  v_sync: 1053  v_sync_end 1059 v_blanking: 1089 v_border: 0
    (II) MGA(0): Ranges: V min: 48  V max: 85 Hz, H min: 30  H max: 94 kHz, PixClock max 170 MHz

Esta informaci?n se llama informaci?n EDID. Para crear una ``ModeLine``
a partir de estos datos solamente tiene que poner los n?meros en el
orden correcto:

.. code:: programlisting

    ModeLine <name> <clock> <4 horiz. timings> <4 vert. timings>

As? que la ``ModeLine`` en la ``Section "Monitor"`` del ejemplo tendr?a
este aspecto:

.. code:: programlisting

    Section "Monitor"
    Identifier      "Monitor1"
    VendorName      "Bigname"
    ModelName       "BestModel"
    ModeLine        "1680x1050" 146.2 1680 1784 1960 2240 1050 1053 1059 1089
    Option          "DPMS"
    EndSection

Como ve, con un poco de edici?n hemos culminado la tarea y X deber?a ya
poder arrancar sin problemas en su nuevo monitor panor?mico.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------+---------------------------+-----------------------------------+
| `Anterior <x-install.html>`__?   | `Subir <x11.html>`__      | ?\ `Siguiente <x-fonts.html>`__   |
+----------------------------------+---------------------------+-----------------------------------+
| 5.3. Instalar X11?               | `Inicio <index.html>`__   | ?5.5. Uso de tipos en X11         |
+----------------------------------+---------------------------+-----------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
