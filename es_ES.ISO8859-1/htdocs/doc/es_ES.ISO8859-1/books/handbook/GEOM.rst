=======================================================================
Cap?tulo 19. GEOM: Marco de trabajo modular de transformaci?n de discos
=======================================================================

.. raw:: html

   <div class="navheader">

Cap?tulo 19. GEOM: Marco de trabajo modular de transformaci?n de discos
`Anterior <disks-encrypting.html>`__?
Parte?III.?Administraci?n del sistema.
?\ `Siguiente <GEOM-intro.html>`__

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

Cap?tulo 19. GEOM: Marco de trabajo modular de transformaci?n de discos
-----------------------------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Escrito por Tom Rhodes.

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

`19.1. Sinopsis <GEOM.html#GEOM-synopsis>`__
`19.2. Introducci?n a GEOM <GEOM-intro.html>`__
`19.3. RAID0 - Distribuci?n por bandas <GEOM-striping.html>`__
`19.4. RAID1 - Replicaci?n <GEOM-mirror.html>`__

.. raw:: html

   </div>

*Traducci?n de Enrique Mat?as S?nchez ``<cronopios@gmail.com>``.*

.. raw:: html

   <div class="sect1">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

19.1. Sinopsis
--------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Este cap?tulo explica el uso de discos bajo el marco de trabajo GEOM en
FreeBSD. Esto incluye las principales utilidades de control de RAID que
usan el marco de trabajo para su configuraci?n. Este cap?tulo no se
adentrar? en un examen en profundidad de como GEOM maneja o controla la
E/S, el subsistema subyacente, o el c?digo. Esta informaci?n se
proporciona en la p?gina de manual
`geom(4) <http://www.FreeBSD.org/cgi/man.cgi?query=geom&sektion=4>`__ y
sus diversas referencias VEA TAMBI?N. Este cap?tulo tampoco es una gu?a
definitiva de configuraciones RAID. S?lo se examinan las clasificaciones
de RAID que puede usar GEOM.

Tras leer este cap?tulo, sabr?:

.. raw:: html

   <div class="itemizedlist">

-  Que tipo de soporte para RAID est? disponible a trav?s de GEOM.

-  Como utilizar las utilidades base para configurar, mantener, y
   manipular los diversos niveles de RAID.

-  Como replicar, unir, cifrar, y conectar remotamente dispositivos de
   disco por medio de GEOM.

-  Como solucionar problemas con los discos adscritos al marco de
   trabajo GEOM.

.. raw:: html

   </div>

Antes de leer este cap?tulo, deber?a:

.. raw:: html

   <div class="itemizedlist">

-  Entender como trata FreeBSD a los dispositivos de disco
   (`Cap?tulo?18, *Almacenamiento* <disks.html>`__).

-  Saber como configurar e instalar un nuevo n?cleo de FreeBSD
   (`Cap?tulo?8, *Configuraci?n del kernel de
   FreeBSD* <kernelconfig.html>`__).

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------------+------------------------------------------+--------------------------------------+
| `Anterior <disks-encrypting.html>`__?     | `Subir <system-administration.html>`__   | ?\ `Siguiente <GEOM-intro.html>`__   |
+-------------------------------------------+------------------------------------------+--------------------------------------+
| 18.15. Cifrado de particiones de disco?   | `Inicio <index.html>`__                  | ?19.2. Introducci?n a GEOM           |
+-------------------------------------------+------------------------------------------+--------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
