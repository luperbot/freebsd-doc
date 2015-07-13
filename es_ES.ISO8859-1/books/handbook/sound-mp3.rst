===============
7.3. Sonido MP3
===============

.. raw:: html

   <div class="navheader">

7.3. Sonido MP3
`Anterior <sound-setup.html>`__?
Cap?tulo 7. Multimedia
?\ `Siguiente <video-playback.html>`__

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

7.3. Sonido MP3
---------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Escrito por Chern Lee.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El formato MP3 (MPEG Layer 3 Audio) llega casi al nivel de calidad del
CD, por lo que no hay motivo por el deba faltar en su escritorio
FreeBSD.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

7.3.1. Reproductores de MP3
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El reproductor de MP3 para X11 m?s extendido es, de lejos, XMMS (X
Multimedia System). Puede usar en ?l ?skins?de Winamp puesto que el
interfaz gr?fico de XMMS es casi id?ntico al de Nullsoft Winamp. XMMS
incluye tambi?n soporte nativo para ?plug-ins?.

Puede instalar XMMS como port
(`multimedia/xmms <http://www.freebsd.org/cgi/url.cgi?ports/multimedia/xmms/pkg-descr>`__)
o como package.

La interfaz de XMMS es intuitiva e incluye una lista de reproducci?n, un
ecualizador gr?fico y muchas otras cosas. Si est? acostumbrado a Winamp
XMMS le ser? muy f?cil de usar.

El port
`audio/mpg123 <http://www.freebsd.org/cgi/url.cgi?ports/audio/mpg123/pkg-descr>`__
es un reproductor MP3 que se usa desde la shell.

Puede especificarle desde la misma l?nea de ?rdenes a mpg123 el
dispositivo de sonido que debe usar y el fichero MP3 que debe
reproducir. Veamos un ejemplo:

.. code:: screen

    # mpg123 -a /dev/dsp1.0 ASaber-Grandes?xitos.mp3
    High Performance MPEG 1.0/2.0/2.5 Audio Player for Layer 1, 2 and 3.
    Version 0.59r (1999/Jun/15). Written and copyrights by Michael Hipp.
    Uses code from various people. See 'README' for more!
    THIS SOFTWARE COMES WITH ABSOLUTELY NO WARRANTY! USE AT YOUR OWN RISK!





    Playing MPEG stream from ASaber-Grandes?xitos.mp3 ...
    MPEG 1.0 layer III, 128 kbit/s, 44100 Hz joint-stereo

Sustituya ``/dev/dsp1.0`` por el dispositivo ``dsp`` que haya en su
sistema.

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

7.3.2. Extracci?n de pistas de sonido de un CD
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Antes de convirtir una pista o todo un CD a MP3 la informaci?n sonido
debe volcarse al disco duro. Esto se hace convirtiendo los datos ?raw
CDDA? (CD Digital Audio) a ficheros WAV.

La herramienta ``cdda2wav``, que forma parte del port
`sysutils/cdrtools <http://www.freebsd.org/cgi/url.cgi?ports/sysutils/cdrtools/pkg-descr>`__,
permite la extracci?n de informaci?n de sonido en CD as? como la
informaci?n asociada a ?l.

Con el CD en la unidad la siguiente orden (como ``root``) un CD entero
en ficheros WAV individuales, uno por pista:

.. code:: screen

    # cdda2wav -D 0,1,0 -B

cdda2wav soporta unidades CDROM ATAPI (IDE). En el caso de unidades IDE
especifique el n?mero de dispositivo en el lugar correspondiente al n?ro
de unidad SCSI. Por ejemplo, para extraer la pista 7 desde una unidad
IDE:

.. code:: screen

    # cdda2wav -D /dev/acd0 -t 7

La opci?n ``-D 0,1,0`` indica el dispositivo SCSI ``0,1,0``, que
corresponde con la salida de ``cdrecord     -scanbus``.

Para extraer pistas de forma selectiva use la opci?n ``-t``:

.. code:: screen

    # cdda2wav -D 0,1,0 -t 7

Esta opci?n extrae la s?ptima pista de un CDROM de sonido. Si quiere
extraer un rango de pistas, por ejemplo las pistas de la uno a la siete,
declare el rango del siguiente modo:

.. code:: screen

    # cdda2wav -D 0,1,0 -t 1+7

La herramienta
`dd(1) <http://www.FreeBSD.org/cgi/man.cgi?query=dd&sektion=1>`__ le
permite tambi?n extraer pistas de sonido desde unidades ATAPI; consulte
la `Secci?n?18.6.5, “Copiar CD de
audio” <creating-cds.html#duplicating-audiocds>`__ para m?s informaci?n.

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

7.3.3. Codificaci?n de MP3
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Hoy por hoy el codificador de MP3 por antonomasia es lame. Puede
encontrar lame en
`audio/lame <http://www.freebsd.org/cgi/url.cgi?ports/audio/lame/pkg-descr>`__.

Partiendo de ficheros WAV previamente extraidos la siguiente orden
convierte ``audio01.wav`` en ``audio01.mp3``:

.. code:: screen

    # lame -h -b 128 \
    --tt "T?tulo de copla o cantar" \
    --ta "Grupo, solista o coral sinf?nica" \
    --tl "T?tulo del ?lbum" \
    --ty "2001" \
    --tc "Autor de la extracci?n y paso a MP3" \
    --tg "Estilo" \
    audio01.wav audio01.mp3

Los 128?kbits pasan por se el est?ndar de ratio de bits de los MP3,
aunque puede que usted sea de los que prefieren calidades m?s altas, 160
o incluso 192. A mayor ratio de bits, m?s espacio en disco necesitar?,
aunque la calidad tambi?n ser? mayor. La opci?n ``-h`` usa el modo ?m?s
calidad pero algo m?s lento?. Las opciones que empiezan por ``--t``
indican etiquetas ID3, que suelen contener informaci?n de la canci?n que
contiene el fichero MP3. Tiene informaci?n sobre otras opciones de
codificaci?n en la p?gina de manual de lame.

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

7.3.4. Decodificaci?n de MP3
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Para grabar un CD de sonido desde ficheros MP3 hay que convertirlos a
formato WAV no comprimido. Tanto XMMS como mpg123 soportan la conversi?n
de MP3 a un formato de fichero no comprimido.

Escritura a disco desde XMMS:

.. raw:: html

   <div class="procedure">

#. Arranque XMMS.

#. Bot?n derecho del ra?n en la ventana para acceder al men? de XMMS.

#. Elija ``Preferences`` en ``Options``.

#. Cambie el ?Output Plugin? a ?Disk Writer Plugin?.

#. Pulse ``Configure``.

#. Elija un directorio en el que guardar los ficheros descomprimidos.

#. Cargue el fichero MP3 en XMMS de la forma habitual, pero aseg?rese de
   tener el volumen al 100% y las opciones de ecualizaci?n desactivadas.

#. Pulse ``Play`` — parecer? que XMMS est? reproduciendo m?sica pero no
   sonar? nada. Lo que est? haciendo es volcar el MP3 a un fichero.

#. Recuerde que antes de poder volver a escuchar ficheros MP3 de nuevo
   tendr? que devolver el ?Plugin de salida? por omisi?n a la posici?n
   inicial.

.. raw:: html

   </div>

Escritura de la salida est?ndar en mpg123:

.. raw:: html

   <div class="procedure">

-  Ejecute ``mpg123 -s audio01.mp3         > audio01.pcm``

.. raw:: html

   </div>

XMMS genera un fichero WAV, mientras que mpg123 convierte MP3 a datos de
sonido raw PCM. Puede usar cdrecord con ambos formatos para crear CD de
sonido. Tendr? que usar
`burncd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=burncd&sektion=8>`__
para raw PCM. Si lo que tiene son ficheros WAV escuchar? un ligero clic
al principio de cada pista: se trata de la cabecera del fichero WAV.
Puede eliminar esta cabecera mediante SoX (que puede instalar como port
desde
`audio/sox <http://www.freebsd.org/cgi/url.cgi?ports/audio/sox/pkg-descr>`__
o si lo prefiere como package):

.. code:: screen

    % sox -t wav -r 44100 -s -w -c 2 pista.wav pista.raw

Consulte la `Secci?n?18.6, “Creaci?n y uso de medios ?pticos
(CD)” <creating-cds.html>`__ para m?s informaci?n sobre el uso de
grabadoras de CD en FreeBSD.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------------+-------------------------------+------------------------------------------+
| `Anterior <sound-setup.html>`__?              | `Subir <multimedia.html>`__   | ?\ `Siguiente <video-playback.html>`__   |
+-----------------------------------------------+-------------------------------+------------------------------------------+
| 7.2. Configuraci?n de la tarjeta de sonido?   | `Inicio <index.html>`__       | ?7.4. Reproducci?n de v?deo              |
+-----------------------------------------------+-------------------------------+------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
