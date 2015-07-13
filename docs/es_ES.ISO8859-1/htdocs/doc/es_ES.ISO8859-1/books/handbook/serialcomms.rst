=================================
Cap?tulo 24. Comunicaciones serie
=================================

.. raw:: html

   <div class="navheader">

Cap?tulo 24. Comunicaciones serie
`Anterior <network-communication.html>`__?
Parte?IV.?Comunicaciones en red
?\ `Siguiente <serial.html>`__

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

Cap?tulo 24. Comunicaciones serie
---------------------------------

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

`24.1. Sinopsis <serialcomms.html#serial-synopsis>`__
`24.2. Introducci?n <serial.html>`__
`24.3. Terminales <term.html>`__
`24.4. Servicio dial-in <dialup.html>`__
`24.5. Servicio dial-out <dialout.html>`__
`24.6. Configurando la consola serie <serialconsole-setup.html>`__

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

24.1. Sinopsis
--------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

UNIX? siempre ha tenido soporte para comunicaci?n serie. De hecho, las
primeras m?quinas UNIX? depend?an de l?neas serie para tener interacci?n
con el usuario. Las cosas han cambiado mucho desde esos d?as cuando la
“terminal” promedio consist?a de una terminal serie de
10-caracteres-por-segundo, impresora y teclado. Este cap?tulo cubrir?
algunas de las maneras en las que FreeBSD utiliza comunicaciones serie.

Despues de leer este cap?tulo, usted entender?:

.. raw:: html

   <div class="itemizedlist">

-  Como conectar terminales a su sistema FreeBSD.

-  Como utilizar un modem para marcar a equipos remotos.

-  Como permitir a usuarios remotos entrar a su sistema con un modem.

-  Como arrancar su sistema desde una consola serie.

.. raw:: html

   </div>

Antes de leer este cap?tulo usted deber?a:

.. raw:: html

   <div class="itemizedlist">

-  Saber como configurar e instalar un nuevo kernel (`Cap?tulo?8,
   *Configuraci?n del kernel de FreeBSD* <kernelconfig.html>`__).

-  Entender procesos y permisos UNIX? (`Cap?tulo?3, *Conceptos b?sicos
   de Unix* <basics.html>`__).

-  Tener acceso al manual t?cnico para el hardware serie (modem o
   tarjeta multipuerto) que le gustar?a utilizar con FreeBSD.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------------+------------------------------------------+----------------------------------+
| `Anterior <network-communication.html>`__?   | `Subir <network-communication.html>`__   | ?\ `Siguiente <serial.html>`__   |
+----------------------------------------------+------------------------------------------+----------------------------------+
| Parte?IV.?Comunicaciones en red?             | `Inicio <index.html>`__                  | ?24.2. Introducci?n              |
+----------------------------------------------+------------------------------------------+----------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
