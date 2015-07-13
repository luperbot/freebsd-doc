===================
Cap?tulo 15. Jaulas
===================

.. raw:: html

   <div class="navheader">

Cap?tulo 15. Jaulas
`Anterior <security-accounting.html>`__?
Parte?III.?Administraci?n del sistema.
?\ `Siguiente <jails-terms.html>`__

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

Cap?tulo 15. Jaulas
-------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Escrito por Matteo Riondato.

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

`15.1. Sinopsis <jails.html#jails-synopsis>`__
`15.2. T?rminos relacionados con las jaulas <jails-terms.html>`__
`15.3. Introducci?n <jails-intro.html>`__
`15.4. Creaci?n y gesti?n de jaulas <jails-build.html>`__
`15.5. Administraci?n y personalizaci?n a fondo <jails-tuning.html>`__
`15.6. Uso de las jaulas <jails-application.html>`__

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

15.1. Sinopsis
--------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

En este cap?tulo se explica qu? son las jaulas en FreeBSD y c?mo
usarlas. Las jaulas, citadas con frecuencia como la nueva generaci?n de
*entornos chroot*, son una herramienta muy poderosa que se ha puesto al
servicio de los administradores de sistemas, aunque su uso m?s b?sico
puede ser tambi?n de suma utilidad para usuarios avanzados.

Tras leer este cap?tulo sabr? usted:

.. raw:: html

   <div class="itemizedlist">

-  Qu? es una jaula y para qu? puede usarse en sistemas FreeBSD.

-  C?mo generar, arrancar y parar una jaula.

-  C?mo manejarse con los rudimentos de la administraci?n de las jaulas,
   tanto desde dentro como desde fuera de la jaula.

.. raw:: html

   </div>

Otras fuentes de informaci?n ?til sobre las jaulas:

.. raw:: html

   <div class="itemizedlist">

-  La p?gina de manual
   `jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8>`__.
   Es la referencia completa de ``jail``, la herramienta administrativa
   de FreeBSD con la que se arrancan, paran y controlan las jaulas.

-  Las listas de correo y sus respectivos archivos. Los archivos de la
   `lista de correo para preguntas generales sobre
   FreeBSD <http://lists.FreeBSD.org/mailman/listinfo/freebsd-questions>`__,
   entre otras listas de correo alojadas en el `servidor de listas de
   FreeBSD <http://lists.FreeBSD.org/mailman/listinfo>`__ contienen una
   enorme cantidad de informaci?n sobre jaulas. La ayuda que est?
   buscando puede obtenerla, por tanto, de una b?squeda en los archivos
   de las listas o de enviar una pregunta que nadie haya hecho en la
   lista de correo
   `freebsd-questions <http://lists.FreeBSD.org/mailman/listinfo/freebsd-questions>`__.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------------+------------------------------------------+-----------------------------------------------+
| `Anterior <security-accounting.html>`__?   | `Subir <system-administration.html>`__   | ?\ `Siguiente <jails-terms.html>`__           |
+--------------------------------------------+------------------------------------------+-----------------------------------------------+
| 14.15. Contabilidad de procesos?           | `Inicio <index.html>`__                  | ?15.2. T?rminos relacionados con las jaulas   |
+--------------------------------------------+------------------------------------------+-----------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
