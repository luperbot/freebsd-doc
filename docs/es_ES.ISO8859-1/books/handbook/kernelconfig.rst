===============================================
Cap?tulo 8. Configuraci?n del kernel de FreeBSD
===============================================

.. raw:: html

   <div class="navheader">

Cap?tulo 8. Configuraci?n del kernel de FreeBSD
`Anterior <scanners.html>`__?
Parte?II.?Tareas comunes
?\ `Siguiente <ch08s02.html>`__

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

Cap?tulo 8. Configuraci?n del kernel de FreeBSD
-----------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Actualizado y reestructurado por Jim Mock.

.. raw:: html

   </div>

.. raw:: html

   <div>

Texto original por Jake Hamby.

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

`8.1. Sinopsis <kernelconfig.html#idp72252752>`__
`8.2. ?Qu? razones hay para compilar un kernel
personalizado? <ch08s02.html>`__
`8.3. Inventario de hardware del sistema <kernelconfig-devices.html>`__
`8.4. Controladores del kernel, subsistemas y
m?dulos <kernelconfig-modules.html>`__
`8.5. Compilaci?n e instalaci?n de un kernel
personalizado <kernelconfig-building.html>`__
`8.6. El fichero de configuraci?n <kernelconfig-config.html>`__
`8.7. Qu? hacer si algo va mal <kernelconfig-trouble.html>`__

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

8.1. Sinopsis
-------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El kernel de FreeBSD es el coraz?n del sistema operativo. Es el
responsable de la gesti?n y control de la memoria, reforzamiento de los
controles de seguridad, gesti?n de redes, acceso a dispositivos y muchas
cosas m?s. FreeBSD es un sistema din?mico y configurable, pero a veces
sigue siendo necesario reconfigurar y recompilar un kernel hecho a la
medida de nuestras necesidades.

Una vez leido este cap?tulo sabr? usted:

.. raw:: html

   <div class="itemizedlist">

-  Por qu? puede ser necesario que compile un kernel personalizado.

-  C?mo crear un fichero de configuraci?n del kernel, o bien editar un
   fichero existente.

-  C?mo utilizar el fichero de configuraci?n para crear y compilar un
   nuevo kernel.

-  C?mo instalar su nuevo kernel.

-  C?mo resolver algunos problemas si algo sale mal.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------+---------------------------------+-----------------------------------------------------------------+
| `Anterior <scanners.html>`__?   | `Subir <common-tasks.html>`__   | ?\ `Siguiente <ch08s02.html>`__                                 |
+---------------------------------+---------------------------------+-----------------------------------------------------------------+
| 7.6. Esc?neres de im?genes?     | `Inicio <index.html>`__         | ?8.2. ?Qu? razones hay para compilar un kernel personalizado?   |
+---------------------------------+---------------------------------+-----------------------------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
