====================
Cap?tulo 9. Imprimir
====================

.. raw:: html

   <div class="navheader">

Cap?tulo 9. Imprimir
`Anterior <kernelconfig-trouble.html>`__?
Parte?II.?Tareas comunes
?\ `Siguiente <printing-intro-spooler.html>`__

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

Cap?tulo 9. Imprimir
--------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Escrito por Sean Kelly.

.. raw:: html

   </div>

.. raw:: html

   <div>

Reestructurado y actualizado por Jim Mock.

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

`9.1. Sinopsis <printing.html#idp72842832>`__
`9.2. Introducci?n <printing-intro-spooler.html>`__
`9.3. Configuraci?n b?sica <printing-intro-setup.html>`__
`9.4. Configuraci?n avanzada de impresoras <printing-advanced.html>`__
`9.5. C?mo utilizar impresoras <printing-using.html>`__
`9.6. Alternativas a LPD <printing-lpd-alternatives.html>`__
`9.7. Soluci?n de problemas <printing-troubleshooting.html>`__

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

9.1. Sinopsis
-------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD puede utilizarse para imprimir en una gran variedad de
impresoras, desde las antiguas impresoras de matriciales hasta las m?s
modernas impresoras laser y todo lo que existe entre unas y otras, con
lo que podr? imprimir con una calidad muy alta desde cualquier
aplicaci?n.

FreeBSD puede usarse tambi?n como servidor de impresi?n en red; FreeBSD
puede recibir peticiones de impresi?n de una gran cantidad de sistemas,
bien sean FreeBSD, Windows? y Mac?OS?. FreeBSD se encarga de los
trabajos se vayan imprimiendo uno tras otro y puede mantener
estad?sticas sobre qu? usuarios y qu? m?quinas est?n imprimiendo m?s,
generar p?ginas de ?encabezado? para colocarlas antes de cada trabajo y
distinguir as? de qui?n es la impresi?n, etc.

Tras leer el presente cap?tulo sabr? usted:

.. raw:: html

   <div class="itemizedlist">

-  C?mo configurar la cola de impresi?n en FreeBSD.

-  C?mo instalar filtros de impresi?n para gestionar diversos trabajos
   especiales como la conversi?n de documentos a formatos aptos para su
   impresora.

-  C?mo habilitar encabezados en sus impresiones.

-  C?mo imprimir en impresoras conectadas a otras m?quinas.

-  C?mo imprimir en impresoras conectadas directamente a la red.

-  C?mo controlar restricciones de impresi?n, como por ejemplo
   limitaciones del tama?o de trabajos o evitar que ciertos usuarios
   puedan imprimir.

-  C?mo mantener estad?sticas de impresi?n y cuentas de usuario de
   impresi?n.

-  C?mo solucionar los problemas de impresi?n m?s comunes.

.. raw:: html

   </div>

Antes de leer este cap?tulo usted deber?a:

.. raw:: html

   <div class="itemizedlist">

-  Saber c?mo compilar e instalar un kernel personalizado (`Cap?tulo?8,
   *Configuraci?n del kernel de FreeBSD* <kernelconfig.html>`__).

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------------+---------------------------------+--------------------------------------------------+
| `Anterior <kernelconfig-trouble.html>`__?   | `Subir <common-tasks.html>`__   | ?\ `Siguiente <printing-intro-spooler.html>`__   |
+---------------------------------------------+---------------------------------+--------------------------------------------------+
| 8.7. Qu? hacer si algo va mal?              | `Inicio <index.html>`__         | ?9.2. Introducci?n                               |
+---------------------------------------------+---------------------------------+--------------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
