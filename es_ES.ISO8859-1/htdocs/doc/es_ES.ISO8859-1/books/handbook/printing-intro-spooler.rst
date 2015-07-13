=================
9.2. Introducci?n
=================

.. raw:: html

   <div class="navheader">

9.2. Introducci?n
`Anterior <printing.html>`__?
Cap?tulo 9. Imprimir
?\ `Siguiente <printing-intro-setup.html>`__

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

9.2. Introducci?n
-----------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Si quiere utilizar impresoras con FreeBSD debe configurarlas de forma
que funcionen con el sistema de cola de impresi?n de Berkeley, tambi?n
conocido como sistema de cola LPD. Es el sistema de control de impresi?n
est?ndar en FreeBSD. Este cap?tulo trata sobre el sistema LPD, al que en
adelante nos referiremos simplemente como LPD, y le introducir? en la
configuraci?n del mismo.

Si est? familiarizado con el sistema de cola de impresi?n LPD, o bien
con alg?n otro sistema de impresi?n, puede pasar a la secci?n
`Configuraci?n del sistema de cola de
impresi?n <printing-intro-setup.html>`__.

LPD se encarga de controlar todo lo relacionado con la impresi?n, lo que
en consecuencia implica encargarse de lo siguiente:

.. raw:: html

   <div class="itemizedlist">

-  Controlar el acceso a las impresoras conectadas directamente al
   sistema y a impresoras conectadas a otras m?quinas de la red.

-  

   Permitir que ciertos usuarios puedan enviar ficheros para su
   impresi?n; estos env?os reciben el nombre de *trabajos* (“jobs”).

-  Evita que usuarios diferentes accedan a la impresora al mismo tiempo
   manteniendo un orden estricto en la cola de impresi?n de cada
   impresora.

-  Imprimir *encabezados* de forma que los usuarios puedan distinguir
   f?cilmente los trabajos que han impreso.

-  Se ocupa de los par?metros para impresoras conectadas a puertos
   serie.

-  Enviar trabajos de impresi?n a trav?s de una red a la cola LPD de una
   m?quina remota.

-  Ejecutar filtros especiales para formatear trabajos que requieren la
   gesti?n de lenguajes de impresi?n o impresoras de diferentes
   caracter?sticas.

-  Mantener un registro del uso de la impresora.

.. raw:: html

   </div>

Gracias al fichero de configuraci?n (``/etc/printcap``) y mediante
programas especiales de filtrado puede hacerse que el sistema LPD cumpla
todas las tareas citadas o si lo prefiere solo unas cuantas; adem?s
puede hacerlo en una gran variedad de impresoras.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

9.2.1. ?Por qu? utilizar una cola de impresi?n?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Si es usted la ?nica persona que usa el sistema se estar? por qu?
preocuparse de utilizar un sistema de cola de impresi?n si es evidente
que no necesita restricciones de acceso, encabezados ni cuentas de
impresi?n. Puede utilizar el acceso directo a impresi?n, pero deber?a
utilizar una cola de impresi?n por las siguientes razones:

.. raw:: html

   <div class="itemizedlist">

-  El sistema LPD ejecuta los trabajos en segundo plano, esto es, no
   tiene que esperar a que la impresora procese los datos para seguir
   trabajando.

-  

   LPD puede procesar un trabajo de forma que pase por filtros, a?adir
   cabeceras de fecha y hora o convertir un fichero de formato especial
   (por ejemplo TeX DVI) a un formato que la impresora entienda y que no
   tenga usted que ocuparse de ello manualmente.

-  Muchos programas, tanto libres como comerciales, desde los que se
   puede imprimir est?n hechos pensando en que haya disponible un
   sistema de impresi?n. Una vez que configure un sistema de colas podr?
   utilizar software que ya tiene instalado y preparar el campo para el
   que instale en el futuro.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------+-----------------------------+------------------------------------------------+
| `Anterior <printing.html>`__?   | `Subir <printing.html>`__   | ?\ `Siguiente <printing-intro-setup.html>`__   |
+---------------------------------+-----------------------------+------------------------------------------------+
| Cap?tulo 9. Imprimir?           | `Inicio <index.html>`__     | ?9.3. Configuraci?n b?sica                     |
+---------------------------------+-----------------------------+------------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
