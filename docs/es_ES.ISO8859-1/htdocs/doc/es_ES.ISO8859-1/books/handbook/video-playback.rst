==========================
7.4. Reproducci?n de v?deo
==========================

.. raw:: html

   <div class="navheader">

7.4. Reproducci?n de v?deo
`Anterior <sound-mp3.html>`__?
Cap?tulo 7. Multimedia
?\ `Siguiente <tvcard.html>`__

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

7.4. Reproducci?n de v?deo
--------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Contributed by Ross Lippert.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

La reproducci?n de v?deo es un ?rea muy nueva y en la que se producen
grandes cambios a gran velocidad. Tenga paciencia. Aqu? no va a ser todo
tan sencillo como al configurar el sonido.

Antes de comenzar es imprescindible que sepa con certeza cu?l es el
modelo de su tarjeta gr?fica y qu? chip usa. Tanto Xorg como XFree86™
soportan gran cantidad de tarjetas gr?ficas, pero de pocas se puede
decir que den un buen rendiemiento de reproducci?n. Puede consultar una
lista de extensiones que el servidor X puede hacer funcionar en su
tarjeta ejecutando
`xdpyinfo(1) <http://www.FreeBSD.org/cgi/man.cgi?query=xdpyinfo&sektion=1>`__
desde una sesi?n X11.

Le recomendamos que tenga a mano un fichero MPEG no muy grande para
usarlo en las pruebas que haga con los diversos reproductores y
opciones. Algunos reproductores de DVD buscar?n por omisi?n soportes DVD
en ``/dev/dvd`` (algunos incluso tienen fijado en el c?digo el nombre de
dicha unidad) seguramente le resultar? ?til ejecutar los siguientes
enlaces simb?licos:

.. code:: screen

    # ln -sf /dev/acd0 /dev/dvd
    # ln -sf /dev/acd0 /dev/rdvd

Tenga en cuenta que debido al dise?o de
`devfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=devfs&sektion=5>`__
los enlaces creados a mano no sobrevivir?n a un reinicio del sistema.
Para que as? suceda tras cada reinicio debe a?adir las siguientes l?neas
a ``/etc/devfs.conf``:

.. code:: programlisting

    link acd0 dvd
    link acd0 rdvd

Adem?s, el descifrado de DVD (una tarea que har? necesario llamar a
funciones especiales de los DVD-ROM) requiere permisos de escritura en
unidades DVD.

Le recomendamos que aumente la memoria compartida del interfaz X11, para
lo cual tendr? que incremente los valores asignados a varias
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__:

.. code:: programlisting

    kern.ipc.shmmax=67108864
    kern.ipc.shmall=32768

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

7.4.1. C?mo determinar las caracter?sticas de video
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Hay varias formas de reproducir v?deo en X11, pero cu?l de ellas sea la
que funcione depende en gran medida del hardware que intervenga. Cada
uno de los m?todos que se describen m?s son mejores o peores seg?n en
qu? hardware se ejecute. Adem?s el procesamiento de video en X11 es un
asunto que est? recibiendo mucha atenci?n ?ltimamente y en cada nueva
versi?n de Xorg y de XFree86™ no es extra?o encontrar avances
significativos.

Veamos una lista de interfaces de v?deo muy comunes:

.. raw:: html

   <div class="orderedlist">

#. X11: salida normal de X11 utilizando memoria compartida.

#. XVideo: una extensi?n del interfaz X11 que permite la reproducci?n de
   v?deo en las ventanas de X11.

#. SDL: Simple Directmedia Layer.

#. DGA: Direct Graphics Access (``acceso directo         a gr?ficos``.

#. SVGAlib: capa de consola de gr?ficos a bajo nivel.

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

7.4.1.1. XVideo
^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Xorg y XFree86™ 4.X tienen una extensi?n llamada *XVideo* (tambi?n
conocida como Xvideo, Xv o xv) que permite reproducir v?deo en ventanas
del sistema X11 a trav?s de un tipo de aceleraci?n especial. Dicha
extensi?n ofrece una calidad de reproducci?n muy alta incluso en
m?quinas muy cortas de recursos.

Utilice ``xvinfo`` para saber qu? extensi?n est? utilizando:

.. code:: screen

    % xvinfo

XVideo is supported for your card if the result looks like:

.. code:: screen

    X-Video Extension version 2.2
    screen #0
      Adaptor #0: "Savage Streams Engine"
        number of ports: 1
        port base: 43
        operations supported: PutImage
        supported visuals:
          depth 16, visualID 0x22
          depth 16, visualID 0x23
        number of attributes: 5
          "XV_COLORKEY" (range 0 to 16777215)
                  client settable attribute
                  client gettable attribute (current value is 2110)
          "XV_BRIGHTNESS" (range -128 to 127)
                  client settable attribute
                  client gettable attribute (current value is 0)
          "XV_CONTRAST" (range 0 to 255)
                  client settable attribute
                  client gettable attribute (current value is 128)
          "XV_SATURATION" (range 0 to 255)
                  client settable attribute
                  client gettable attribute (current value is 128)
          "XV_HUE" (range -180 to 180)
                  client settable attribute
                  client gettable attribute (current value is 0)
        maximum XvImage size: 1024 x 1024
        Number of image formats: 7
          id: 0x32595559 (YUY2)
            guid: 59555932-0000-0010-8000-00aa00389b71
            bits per pixel: 16
            number of planes: 1
            type: YUV (packed)
          id: 0x32315659 (YV12)
            guid: 59563132-0000-0010-8000-00aa00389b71
            bits per pixel: 12
            number of planes: 3
            type: YUV (planar)
          id: 0x30323449 (I420)
            guid: 49343230-0000-0010-8000-00aa00389b71
            bits per pixel: 12
            number of planes: 3
            type: YUV (planar)
          id: 0x36315652 (RV16)
            guid: 52563135-0000-0000-0000-000000000000
            bits per pixel: 16
            number of planes: 1
            type: RGB (packed)
            depth: 0
            red, green, blue masks: 0x1f, 0x3e0, 0x7c00
          id: 0x35315652 (RV15)
            guid: 52563136-0000-0000-0000-000000000000
            bits per pixel: 16
            number of planes: 1
            type: RGB (packed)
            depth: 0
            red, green, blue masks: 0x1f, 0x7e0, 0xf800
          id: 0x31313259 (Y211)
            guid: 59323131-0000-0010-8000-00aa00389b71
            bits per pixel: 6
            number of planes: 3
            type: YUV (packed)
          id: 0x0
            guid: 00000000-0000-0000-0000-000000000000
            bits per pixel: 0
            number of planes: 0
            type: RGB (packed)
            depth: 1
            red, green, blue masks: 0x0, 0x0, 0x0

Tenga en cuenta que los formatos que aparecen en el listado (YUV2,
YUV12, etc) no aparecen en todas las implementaciones de de XVideo y su
ausencia puede despistar a algunos reproductores.

Si el resultado se parece mucho a esto

.. code:: screen

    X-Video Extension version 2.2
    screen #0
    no adaptors present

lo m?s probable es que su tarjeta no soporte XVideo.

Si su tarjeta gr?fica no soporta XVideo lo ?nico que significa es que
para su sistema ser? m?s complicado alcanzar los requisitos
computacionales necesarios para el procesamiento de v?deo. Dependiendo
de la tarjeta gr?fica y el procesador que tenga es posible que de todos
modos pueda salvar la papeleta. Consulte la secci?n sobre recursos
avanzados en la `Secci?n?7.4.3, “Lecturas
adicionales” <video-playback.html#video-further-reading>`__.

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

7.4.1.2. Simple Directmedia Layer
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

SDL (Simple Directmedia Layer) se cre? pensando en una capa que
permitiera aplicaciones f?ciles de portar entre las plataformas
Microsoft??Windows?, BeOS y UNIX? y que permitiera al mismo tiempo un
uso eficiente del sonido y el v?deo. La capa SDL ofrece abstracci?n de
hardware a bajo nivel, lo que a veces puee ser m?s eficiente que la
propia interfaz X11.

SDL est? en
`devel/sdl12 <http://www.freebsd.org/cgi/url.cgi?ports/devel/sdl12/pkg-descr>`__.

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

7.4.1.3. Direct Graphics Access
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

?Direct Graphics Access? es una extensi?n de X11 que permite que un
programa sort?e el servidor X y acceda directamente al ?framebuffer?.
Utiliza memoria de bajo nivel, as? es imprescindible que se ejecute como
``root``.

Puede probar y analizar el rendimiento de la extensi?n DGA con
`dga(1) <http://www.FreeBSD.org/cgi/man.cgi?query=dga&sektion=1>`__. Al
ejecutar ``dga`` la pantalla cambia de color cada vez que pulsa una
tecla. Para salir de la aplicaci?n pulse **q**.

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

7.4.2. Ports y packages relacionados con el v?deo
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Esta secci?n expone el software existente en la Colecci?n de Ports de
FreeBSD que puede usar para la reproducci?n de v?deo. La reproducci?n de
v?deo es un ?rea del desarrollo de software donde hay much?sima
actividad, de manera que las caracter?sticas de m?s de una de las
aplicaciones que vamos a describir pueden ser distintas.

Lo primero que hay que conocer es el importante detalle de que la
mayor?a de las aplicaciones de v?deo que funcionan en FreeBSD se
desarrollaron para Linux. Muchas de esas aplicaciones todav?a est?n en
versiones beta. Estos son algunos de los problemas que puede encontrarse
durante el uso de software de v?deo en FreeBSD:

.. raw:: html

   <div class="orderedlist">

#. Una aplicaci?n no puede reproducir un fichero que ha generado otra
   aplicaci?n distinta.

#. Una aplicaci?n no puede reproducir un fichero que ella misma a
   generado.

#. La misma aplicaci?n ejecut?ndose en dos m?quinas distintas, compilada
   en cada una de esas m?quinas; la reproducci?n del mismo fichero da
   resultados diferentes.

#. El uso de un filtro aparentemente trivial como es redimensionar una
   imagen aplicando una escala da como fruto un resultado horroroso
   debido a que la rutina encargada de aplicarla es defectuosa.

#. Que una aplicaci?n de volcados de memoria (?core dumps?).

#. La documentaci?n no se instala con el port, pero s? que existe en la
   web o en el directorio ``work`` del port.

.. raw:: html

   </div>

La mayor?a de estas aplicaciones muestra s?ntomas evidente de
?Linuxismo?, es decir, hay problemas derivados del modo en el que se
implementan las bibliotecas en las distribuciones de Linux, o del hecho
de que ciertas caracter?sticas del kernel de Linux han sido dadas por
omnipresentes por los autores de las aplicaciones. Estos problemas no
siempre han sido advertidas y solucionadas de alg?n modo por los
responsables de los ports, lo que puede desembocar en problemas como:

.. raw:: html

   <div class="orderedlist">

#. El uso de ``/proc/cpuinfo`` para detectar las caracter?sticas del
   procesador.

#. El uso err?neo de los hilos puede causar que ciertos programas se
   cuelguen al intentar cerrarse en lugar de cerrarse correctamente.

#. Software que a?n no est? en la Colecci?n de Ports de FreeBSD usado
   frecuentemente con la aplicaci?n.

.. raw:: html

   </div>

Hasta ahora los autores de las aplicaciones han colaborado de buen grado
con los responsables de los ports para hacer m?s sencillo el trabajo de
portar estas aplicaciones a FreeBSD.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

7.4.2.1. MPlayer
^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

MPlayer es un reproductor de v?deo desarrollado muy recientemente y con
un desarrollo rapid?simo. Los objetivos del equipo MPlayer son la
velocidad y la flexibilidad en Linux y otros sistemas Unix. El proyecto
comenz? cuando el fundador del equipo se cans? de padecer el pobre
rendimiento de los reproductores de v?deo que hab?a disponibles en ese
momento. Hay quien dice que el interfaz gr?fico fue sacrificado en pos
de un dise?o m?s ligero, aunque una vez que se acostumbre a las opciones
desde la l?nea de ?rdenes y a los atajos de teclado todo ir? como la
seda.

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

7.4.2.1.1. Compilaci?n de MPlayer
'''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Encontrar? MPlayer en
`multimedia/mplayer <http://www.freebsd.org/cgi/url.cgi?ports/multimedia/mplayer/pkg-descr>`__.
MPlayer ejecuta una serie de pruebas de hardware durante el proceso de
compilaci?n, dando como resultado un binario que no tiene por qu?
funcionar en otros sistemas. Recuerde, por tanto, compilar la aplicaci?n
como port y no utilice el package binario. Adem?s hay m?ltiples
par?metros que puede pasarle a ``make``, tal y como ver? al comenzar la
compilaci?n:

.. code:: screen

    # cd /usr/ports/multimedia/mplayer
    # make
    N - O - T - E

    Take a careful look into the Makefile in order
    to learn how to tune mplayer towards you personal preferences!
    For example,
    make WITH_GTK1
    builds MPlayer with GTK1-GUI support.
    If you want to use the GUI, you can either install
    /usr/ports/multimedia/mplayer-skins
    or download official skin collections from
    http://www.mplayerhq.hu/homepage/dload.html

Las opciones por omisi?n del port deber?an bastar para la mayor?a de los
usuarios, aunque si va a necesitar el codec XviD tendr? que especificar
``WITH_XVID`` en la l?nea de ?rdenes. La unidad de DVD por defecto se
puede definir con la opci?n ``WITH_DVD_DEVICE``\ si la opci?n por
omisi?n, ``/dev/acd0``, no le sirve.

En el momento de escribir esto el port de MPlayer genera la
documentaci?n en formato HTML y dos ejecutables: ``mplayer`` y
``mencoder``, que es una herramienta para recodificar v?deo.

La documentaci?n en HTML de MPlayer es muy informativa. Si el lector no
cubre todas sus dudas sobre hardware de v?deo e interfaces con el
contenido de este cap?tulo la documentaci?n de MPlayer es el sitio donde
debe buscar. Si quiere m?s informaci?n sobre el soporte de v?deo en
UNIX? el mejor sitio para consultar es, sin duda alguna, la
documentaci?n de MPlayer.

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

7.4.2.1.2. Uso de MPlayer
'''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Los usuarios de MPlayer deben crear un subdirectorio ``.mplayer`` en su
?home?. Para crear este directorio (necesario para el funcionamiento de
la aplicaci?n) tecl?e lo siguiente:

.. code:: screen

    % cd /usr/ports/multimedia/mplayer
    % make install-user

Las opciones de ``mplayer`` para la l?nea de ?rdenes se detallan en la
p?gina de manual. Si necesita todav?a m?s detalles consulte la
documentaci?n en HTML. En esta secci?n se va a explicar solamente lo m?s
b?sico.

Para reproducir el fichero ``ficherodeprueba.avi``, mediante una de las
diversas interfaces de v?deo utilice la opci?n ``-vo``:

.. code:: screen

    % mplayer -vo xv ficherodeprueba.avi

.. code:: screen

    % mplayer -vo sdl ficherodeprueba.avi

.. code:: screen

    % mplayer -vo x11 ficherodeprueba.avi

.. code:: screen

    # mplayer -vo dga ficherodeprueba.avi

.. code:: screen

    # mplayer -vo 'sdl:dga' ficherodeprueba.avi

Merece la pena que pruebe todas, puesto que el rendimiento relativo
depende en gran medida de muchos factores y ser? muy distinto el
resultado dependiendo del hardware.

Si quiere reproducir un DVD sustituya ``ficherodeprueba.avi`` por
``dvd://N`` -dvd-device *``DISPOSITIVO``*, donde *``N``* es el n?mero de
t?tulo que quiere reproducir y ``DISPOSITIVO`` es el nodo de dispositivo
del DVD-ROM. Veamos un ejemplo: para reproducir el t?tulo 3 desde
``/dev/dvd`` ejecutaremos:

.. code:: screen

    # mplayer -vo xv dvd://3 -dvd-device /dev/dvd

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

La unidad de DVD por omisi?n puede definirse durante la compilaci?n del
port de MPlayer con la opci?n ``WITH_DVD_DEVICE``. Por defecto apunta a
``/dev/acd0``. Tiene todos los detalles en el ``Makefile`` del port.

.. raw:: html

   </div>

Consulte los atajos de teclado para parar la reproducci?n, ponerla en
pausa, etc. consulte la salida de ``mplayer -h`` o mejor a?n l?se la
p?gina de manual.

Hay otras opciones que le resultar?n de inter?s para la reproducci?n:
``-fs -zoom``, para la reproducci?n a pantalla completa y
``-framedrop``, que mejora el rendimiento.

Para evitar que la l?nea de ?rdenes se haga demasiado larga puede crear
un fichero ``.mplayer/config`` e introducir en ?l las opciones que
quiera usar desde el arranque de la aplicaci?n:

.. code:: programlisting

    vo=xv
    fs=yes
    zoom=yes

Para terminar, puede usar ``mplayer`` para extraer un t?tulo de un DVD a
un fichero ``.vob``. Por ejemplo, si quiere extraer el segundo t?tulo de
un DVD escriba esto:

.. code:: screen

    # mplayer -dumpstream -dumpfile salida.vob dvd://2 -dvd-device /dev/dvd

El fichero de salida, ``salida.vob``, un MPEG y puede manipularlo con
las aplicaciones que se describen en esta secci?n.

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

7.4.2.1.3. mencoder
'''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Antes de empezar a usar ``mencoder`` le recomendamos que se familiarice
con las opciones que se detallan en la documentaci?n HTML. Hay tambi?n
una p?gina de manual, pero no es de mucha utilidad sin la documentaci?n
HTML. Hay una ingente cantidad de formas de mejorar la calidad, reducir
el ratio de bits y cambiar formatos; alguno de esos peque?os trucos
pueden marcar la diferencia entre un buen y un mal rendimiento. Le
mostramos un par de ejemplos por los que puede empezar. El primero es
una simple copia:

.. code:: screen

    % mencoder entrada.avi -oac copy -ovc copy -o salida.avi

Ciertas combinaciones err?neas de opciones en la l?nea de ?rdenes pueden
dar como fruto un fichero de salida que no puede reproducir ni siquiera
el propio ``mplayer``, as? que si lo que quiere es extraer datos a un
fichero siga usando tranquilamente la opci?n ``-dumpfile`` de
``mplayer``.

Para convertir ``entrada.avi`` con codificaci?n MPEG4 y audio con
codificaci?n MPEG3 (necesitar?
`audio/lame <http://www.freebsd.org/cgi/url.cgi?ports/audio/lame/pkg-descr>`__):

.. code:: screen

    % mencoder entrada.avi -oac mp3lame -lameopts br=192 \
         -ovc lavc -lavcopts vcodec=mpeg4:vhq -o salida.avi

El fichero de salida puede verse con ``mplayer`` y con ``xine``.

Si sustituye ``entrada.avi`` por ``dvd://1 -dvd-device /dev/dvd`` y lo
ejecuta como ``root`` puede recodificar un t?tulo de DVD directamente.
Es posible que el resultado no sea muy satisfactorio tras los primeros
intentos, as? que le recomendamos que vuelque el t?tulo a un fichero y
haga todas las pruebas que necesite sobre ese fichero.

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

7.4.2.2. El reproductor de v?deo xine
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El reproductor de v?deo xine es un ambicioso proyecto que tiene como
meta ofrecer no solamente una aplicaci?n de v?deo ?todo en uno?, sino
crear una biblioteca base reutilizable y un ejecutable modular que puede
ampliarse mediante ?plugins?. Existe como package y tambi?n como port:
`multimedia/xine <http://www.freebsd.org/cgi/url.cgi?ports/multimedia/xine/pkg-descr>`__.

El reproductor xine est? todav?a en mantillas, pero sus primeros pasos
est?n siendo muy interesantes. xine requiere o una CPU r?pida o una
tarjeta gr?fica, o bien soporte para la extensi?n XVideo. El GUI es
intuitivo, aunque un tanto pedestre.

En el momento de escribir esto xine no incorpora ning?n m?dulo de
entrada que sirva para reproducir DVD codificados con CSS. Hay versiones
compiladas por terceros que tienen m?dulos que lo permiten, pero ninguna
de ellas est? en la Colecci?n de Ports de FreeBSD.

Comparado con MPlayer xine deja las cosas m?s hechas para el usuario,
pero al mismo tiempo pone m?s dif?cil el control exhaustivo sobre todo
lo que pasa. El reproductor xine da un mejor rendimiento en interfaces
XVideo.

Por omisi?n xine arranca con un intefaz gr?fico de usuario. Los men?s
pueden usarse para abrir un fichero en concreto:

.. code:: screen

    % xine

Tambi?n puede invocar la aplicaci?n desde la l?nea de ?rdenes para que
reproduzca un fichero inmediatamente y sin utilizar el GUI:

.. code:: screen

    % xine -g -p fichero.avi

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

7.4.2.3. Las herramientas transcode
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

transcode no es un reproductor, sino una suite de herramientas para
recodificar (tambi?n se podr?a usar la palabra ?transcodificar?, de ah?
su nombre) ficheros de sonido y de v?deo. Con transcode es posible
fundir ficheros de video y reparar ficheros deteriorados desde la l?nea
de ?rdenes y en las interfaces de flujo ``stdin/stdout``.

Puede configurar gran cantidad de opciones en el momento de la
compilaci?n de
`multimedia/transcode <http://www.freebsd.org/cgi/url.cgi?ports/multimedia/transcode/pkg-descr>`__;
le recomendamos que use la siguiente l?nea de ?rdenes para compilar
transcode:

.. code:: screen

    # make WITH_OPTIMIZED_CFLAGS=yes WITH_LIBA52=yes WITH_LAME=yes WITH_OGG=yes \
    WITH_MJPEG=yes -DWITH_XVID=yes

La configuraci?n que le proponemos deber? satisfacer a la mayor?a de los
usuarios.

Veamos un ejemplo ilustrativo de las posibilidades de ``transcode``:
convertir un fichero DivX en un fichero PAL MPEG-1 (PAL VCD):

.. code:: screen

    % transcode -i input.avi -V --export_prof vcd-pal -o output_vcd
    % mplex -f 1 -o output_vcd.mpg output_vcd.m1v output_vcd.mpa

Puede reproducir el fichero MPEG resultante, ``output_vcd.mpg``, con
MPlayer. Si quiere tambi?n puede grabar el fichero en un CD-R y tendr?
un VideoCD, aunque para eso tendr? que instalar
`multimedia/vcdimager <http://www.freebsd.org/cgi/url.cgi?ports/multimedia/vcdimager/pkg-descr>`__
y
`sysutils/cdrdao <http://www.freebsd.org/cgi/url.cgi?ports/sysutils/cdrdao/pkg-descr>`__.

Consulte la p?gina de manual de ``transcode``, pero no olvide consultar
tambi?n el `wiki de
transcode <http://www.transcoding.org/cgi-bin/transcode>`__, en el que
encontrar? m?s informaci?n y muchos ejemplos.

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

7.4.3. Lecturas adicionales
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El desarrollo de las diversas aplicaciones de v?deo disponibles en
FreeBSD avanza r?pidamente. Es muy posible que en un futuro cercano la
mayor?a de los problemas de los que hemos hablado aqu? hayan sido
resueltos. Mientras tanto quien quiera exprimir las capacidades de
FreeBSD en las ?reas del sonido y el v?deo tendr?n que recopilar la
informaci?n repartida en varias FAQ y tutoriales y utilizar unos cuantos
programas diferentes. En esta secci?n se le proponen al lector
interesado varias fuentes de informaci?n adicional.

La `documentaci?n de MPlayer <http://www.mplayerhq.hu/DOCS/>`__ contiene
una gran cantidad de informaci?n t?cnica. Cualquiera que quiera alcanzar
un alto grado de conocimiento en v?deo sobre UNIX? debe consultar esa
documentaci?n. La lista de correo de MPlayer es sumamente hostil hacia
quien no se ha molestado en leer la documentaci?n *antes* de preguntar,
as? que si va a enviar informes de errores a esa lista, por favor,
*l?ase la documentaci?n.*.

El texto `xine
HOWTO <http://dvd.sourceforge.net/xine-howto/en_GB/html/howto.html>`__
contiene un cap?tulo sobre mejora del rendimiento que afecta a todos los
reproductores.

Hay unas cuantas aplicaciones muy prometedoras que el lector deber?a al
menos probar:

.. raw:: html

   <div class="itemizedlist">

-  `Avifile <http://avifile.sourceforge.net/>`__, que encontrar? en los
   ports:\ `multimedia/avifile <http://www.freebsd.org/cgi/url.cgi?ports/multimedia/avifile/pkg-descr>`__.

-  `Ogle <http://www.dtek.chalmers.se/groups/dvd/>`__, tambi?n en la
   colecci?n de ports:
   `multimedia/ogle <http://www.freebsd.org/cgi/url.cgi?ports/multimedia/ogle/pkg-descr>`__.

-  `Xtheater <http://xtheater.sourceforge.net/>`__

-  `multimedia/dvdauthor <http://www.freebsd.org/cgi/url.cgi?ports/multimedia/dvdauthor/pkg-descr>`__,
   una aplicaci?n libre para la producci?n de contenidos en DVD.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------+-------------------------------+-----------------------------------------+
| `Anterior <sound-mp3.html>`__?   | `Subir <multimedia.html>`__   | ?\ `Siguiente <tvcard.html>`__          |
+----------------------------------+-------------------------------+-----------------------------------------+
| 7.3. Sonido MP3?                 | `Inicio <index.html>`__       | ?7.5. Configuraci?n de tarjetas de TV   |
+----------------------------------+-------------------------------+-----------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
