======================
Cap?tulo 7. Multimedia
======================

.. raw:: html

   <div class="navheader">

Cap?tulo 7. Multimedia
`Anterior <desktop-summary.html>`__?
Parte?II.?Tareas comunes
?\ `Siguiente <sound-setup.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="chapter">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

Cap?tulo 7. Multimedia
----------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Editado por Ross Lippert.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Tabla de contenidos

.. raw:: html

   </div>

`7.1. Sinopsis <multimedia.html#idp71524304>`__
`7.2. Configuraci?n de la tarjeta de sonido <sound-setup.html>`__
`7.3. Sonido MP3 <sound-mp3.html>`__
`7.4. Reproducci?n de v?deo <video-playback.html>`__
`7.5. Configuraci?n de tarjetas de TV <tvcard.html>`__
`7.6. Esc?neres de im?genes <scanners.html>`__

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

7.1. Sinopsis
-------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD admite una gran variedad de tarjetas de sonido, lo que permite
disfrutar de sonido de alta fidelidad en su sistema. ?sto incluye la
posibilidad de grabar y reproducir ficheros de audio tanto en los
formatos MPEG Audio Layer 3 (MP3), WAV y Ogg Vorbis, as? como muchos
otros. La Colecci?n de Ports de FreeBSD contiene tambi?n aplicaciones
que le permitir?n editar audio previamente grabado, a?adir efectos y
controlar dispositivos MIDI.

Tras unas cuantas pruebas podr? reproducir ficheros de video y DVD en
FreeBSD. La cantidad de aplicaciones disponibles para codificar,
convertir y reproducir los diversos soportes de video es m?s limitada
que lo que hay disponible para el sonido. Por ejemplo, en el momento de
escribir este texto no hay en la Colecci?n de Ports de FreeBSD una buena
aplicaci?n que permita pasar datos de un formato a otro, el equivalente
a lo que hay en el campo del sonido con
`audio/sox <http://www.freebsd.org/cgi/url.cgi?ports/audio/sox/pkg-descr>`__.
A pesar de eso la situaci?n en este ?rea est? cambiando r?pidamente.

Este cap?tulo muestra los pasos necesarios para configurar una tarjeta
de sonido. La configuraci?n e instalaci?n de X11 (`Cap?tulo?5, *El
sistema X Window* <x11.html>`__) habr? solucionado ya todos los
problemas que hubiera podido darle su tarjeta gr?fica, aunque quiz?s
haya alg?n peque?o detalle que a?adir para mejorar la reproducci?n.

Tras leer ?ste cap?tulo sabr? usted:

.. raw:: html

   <div class="itemizedlist">

-  C?mo configurar su sistema de modo que su tarjeta de sonido sea
   reconocida por el mismo.

-  Confirmar el funcionamiento de su tarjeta usando herramientas de
   muestreo.

-  C?mo enfrentarse a problemas de configuraci?n de sonido.

-  C?mo reproducir y crear ficheros MP3 y otros.

-  C?mo gestiona el video el servidor X.

-  Identificar unos cuantos ports para reproducir y codificar video que
   le dar?n muy buenos resultados.

-  C?mo reproducir DVD y ficheros ``.mpg`` y ``.avi``.

-  C?mo convertir CD y DVD en ficheros de datos.

-  C?mo configurar una tarjeta de TV.

-  C?mo configurar un esc?ner de im?genes.

.. raw:: html

   </div>

Antes de leer ?ste cap?tulo deber?a:

.. raw:: html

   <div class="itemizedlist">

-  Saber configurar e instalar un nuevo kernel (`Cap?tulo?8,
   *Configuraci?n del kernel de FreeBSD* <kernelconfig.html>`__).

.. raw:: html

   </div>

.. raw:: html

   <div class="warning" xmlns="">

Aviso:
~~~~~~

?Si intenta montar un cd con
`mount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount&sektion=8>`__
provocar? (como m?nimo) un error en el sistema, pero puede llegar a
provocar un *kernel panic*. Dichos soportes tienen codificaciones
especiales sustancialmente diferentes de los t?picos sistemas de
ficheros ISO.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------+---------------------------------+-----------------------------------------------+
| `Anterior <desktop-summary.html>`__?   | `Subir <common-tasks.html>`__   | ?\ `Siguiente <sound-setup.html>`__           |
+----------------------------------------+---------------------------------+-----------------------------------------------+
| 6.6. Resumen?                          | `Inicio <index.html>`__         | ?7.2. Configuraci?n de la tarjeta de sonido   |
+----------------------------------------+---------------------------------+-----------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
