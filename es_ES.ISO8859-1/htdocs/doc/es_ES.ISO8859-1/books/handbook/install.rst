==================================
Cap?tulo 2. Instalaci?n de FreeBSD
==================================

.. raw:: html

   <div class="navheader">

Cap?tulo 2. Instalaci?n de FreeBSD
`Anterior <history.html>`__?
Parte?I.?Primeros pasos
?\ `Siguiente <install-hardware.html>`__

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

Cap?tulo 2. Instalaci?n de FreeBSD
----------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Reestructurado, reorganizado y con algunas partes reescritas por Jim
Mock.

.. raw:: html

   </div>

.. raw:: html

   <div>

El recorrido por sysinstall, las capturas de pantalla y el texto
original son obra de Randy Pratt.

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

`2.1. Sinopsis <install.html#install-synopsis>`__
`2.2. Requisitos de hardware <install-hardware.html>`__
`2.3. Tareas anteriores a la instalaci?n <install-pre.html>`__
`2.4. Inicio de la instalaci?n <install-start.html>`__
`2.5. ?Qu? es sysinstall? <using-sysinstall.html>`__
`2.6. Asignaci?n de espacio en disco <install-steps.html>`__
`2.7. Elecci?n de qu? instalar <install-choosing.html>`__
`2.8. Elecci?n del medio de instalaci?n <install-media.html>`__
`2.9. El punto sin retorno <install-final-warning.html>`__
`2.10. Despu?s de la instalaci?n <install-post.html>`__
`2.11. Soluci?n de problemas <install-trouble.html>`__
`2.12. Gu?a avanzada de instalaci?n <install-advanced.html>`__
`2.13. C?mo preparar su propio medio de
instalaci?n <install-diff-media.html>`__

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

2.1. Sinopsis
-------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD dispone de un programa en modo texto muy f?cil de usar llamado
sysinstall. Es el programa de instalaci?n por omisi?n en FreeBSD, pero
quien decida distribuir FreeBSD tiene todo el derecho de facilitar un
sistema de instalaci?n propio si as? lo desea. Este cap?tulo trata sobre
c?mo usar sysinstall para instalar FreeBSD

Tras leer este cap?tulo sabr? usted:

.. raw:: html

   <div class="itemizedlist">

-  C?mo crear los discos de instalaci?n de FreeBSD

-  C?mo interpreta (y subdivide) FreeBSD sus discos duros.

-  C?mo arrancar sysinstall.

-  Qu? preguntas le har? sysinstall, qu? significan y c?mo responderlas.

.. raw:: html

   </div>

Antes de leer este cap?tulo deber?a usted:

.. raw:: html

   <div class="itemizedlist">

-  Leer la lista de hardware soportado que se suministra con la con la
   versi?n de FreeBSD que va a instalar y verificar que su hardware est?
   en dicha lista.

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

En general ?stas instrucciones de instalaci?n han sido escritas para
computadoras de arquitectura i386™ (?PC compatible?). En algunos puntos
concretos se dar?n instrucciones espec?ficas para otras plataformas (por
ejemplo Alpha). A pesar de que esta gu?a se intenta mantener todo lo al
d?a que es posible puede que se encuentre con peque?as diferencias entre
el programa de instalaci?n y lo que aqu? se le muestra. Le sugerimos que
use este cap?tulo como una gu?a general m?s que como un manual literal
de instalaci?n.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+------------------------------------+--------------------------------------------+
| `Anterior <history.html>`__?         | `Subir <getting-started.html>`__   | ?\ `Siguiente <install-hardware.html>`__   |
+--------------------------------------+------------------------------------+--------------------------------------------+
| 1.3. Acerca del Proyecto FreeBSD ?   | `Inicio <index.html>`__            | ?2.2. Requisitos de hardware               |
+--------------------------------------+------------------------------------+--------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
