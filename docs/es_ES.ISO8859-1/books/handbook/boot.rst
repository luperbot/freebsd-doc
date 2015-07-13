==============================================
Cap?tulo 12. El proceso de arranque en FreeBSD
==============================================

.. raw:: html

   <div class="navheader">

Cap?tulo 12. El proceso de arranque en FreeBSD
`Anterior <adding-swap-space.html>`__?
Parte?III.?Administraci?n del sistema.
?\ `Siguiente <boot-introduction.html>`__

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

Cap?tulo 12. El proceso de arranque en FreeBSD
----------------------------------------------

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

`12.1. Sinopsis <boot.html#boot-synopsis>`__
`12.2. El problema que representa arrancar el
sistema <boot-introduction.html>`__
`12.3. El RMA y las etapas de arranque uno, dos y
tres <boot-blocks.html>`__
`12.4. Interacci?n con el kernel durante el
arranque <boot-kernel.html>`__
`12.5. Device Hints <device-hints.html>`__
`12.6. Init: inicializaci?n del proceso de control <boot-init.html>`__
`12.7. Secuencia de apagado <boot-shutdown.html>`__

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

12.1. Sinopsis
--------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Al proceso de inicio del sistema y carga del sistema operativo se le
conoce como “mecanismo de arranque” (bootstrap), o simplemente
“arranque” (booting). El proceso de arranque de FreeBSD provee de gran
flexibilidad al configurar lo que ocurre cuando se inicia el sistema,
permitiendole seleccionar de diferentes sistemas operativos instalados
en el mismo ordenador, o inclusive diferentes versiones del mismo
sistema oprativo o kernels instalados.

Este cap?tulo detalla las opciones de configuraci?n que puede manejar y
como personalizar el proceso de arranque de FreeBSD. Esto incluye todo
lo que sucede hasta que el kernel de FreeBSD comienza con la
comprobaci?n de dispositivos y se inicializa
`init(8) <http://www.FreeBSD.org/cgi/man.cgi?query=init&sektion=8>`__.
En caso de que usted desconozca cuando ocurre todo esto, esto sucede
cuando el color del texto que aparece al iniciar el sistema, cambia de
blanco a gris.

Una vez que concluya con la lectura de este cap?tulo, usted sabr?:

.. raw:: html

   <div class="itemizedlist">

-  Cuales son los componentes del mecanismo de arranque de FreeBSD, y
   como es que interactuan entre s?.

-  Las opciones que puede manejar con los componentes del mecanismo de
   arranque de FreeBSD, para controlar el proceso de inicio del sistema.

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

S?lo x86:
~~~~~~~~~

El presente cap?tulo describe ?nicamente el proceso de inicio, para
sistemas FreeBSD que corren en plataformas Intel x86.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------+------------------------------------------+---------------------------------------------------------+
| `Anterior <adding-swap-space.html>`__?   | `Subir <system-administration.html>`__   | ?\ `Siguiente <boot-introduction.html>`__               |
+------------------------------------------+------------------------------------------+---------------------------------------------------------+
| 11.4. A?adir espacio swap?               | `Inicio <index.html>`__                  | ?12.2. El problema que representa arrancar el sistema   |
+------------------------------------------+------------------------------------------+---------------------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
