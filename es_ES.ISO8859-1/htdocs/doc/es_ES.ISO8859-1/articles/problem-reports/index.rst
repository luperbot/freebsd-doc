============================================
C?mo enviar informes de problemas de FreeBSD
============================================

.. raw:: html

   <div class="navheader">

C?mo enviar informes de problemas de FreeBSD
?
?
?\ `Siguiente <pr-when.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="article" lang="es" lang="es">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="authorgroup" xmlns="http://www.w3.org/1999/xhtml">

.. raw:: html

   <div class="author">

Dag-Erling Sm?rgrav
~~~~~~~~~~~~~~~~~~~

Escrito por ?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div>

Revisi?n: ` <https://svnweb.freebsd.org/changeset/doc/>`__

.. raw:: html

   </div>

.. raw:: html

   <div>

`Aviso Legal <trademarks.html>`__

.. raw:: html

   </div>

.. raw:: html

   <div>

por .

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="abstract" xmlns="http://www.w3.org/1999/xhtml">

.. raw:: html

   <div class="abstract-title">

Resumen

.. raw:: html

   </div>

Este art?culo describe c?mo realizar y enviar informes de errores para
el proyecto FreeBSD de la mejor forma posible.

*Traducci?n de Juan F. Rodriguez ``<jrh@it.uc3m.es>``.*

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="docformatnavi">

[ Split HTML / `Single HTML <article.html>`__ ]

.. raw:: html

   </div>

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Tabla de contenidos

.. raw:: html

   </div>

`1. Introducci?n <index.html#pr-intro>`__
`2. Cu?ndo enviar informes de problemas <pr-when.html>`__
`3. Preparativos <pr-prep.html>`__
`4. Escribir el informe de problemas <pr-writing.html>`__
`5. Follow-up <pr-followup.html>`__
`6. Lecturas recomendadas <pr-further.html>`__
`?ndice <ix01.html>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="section">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

1. Introducci?n
---------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Una de las experiencias m?s fustrantes que se pueden experimentar como
usuario de software es aquella en la cual el usuario se toma la molestia
de rellenar un informe de problemas detallado para observar tras un
determinado espacio de tiempo que dicho informe se cierra con una
explicaci?n corta y abrupta como “no es un error” o “PR erroneo”. De
forma semejante, una de las experiencias m?s fustrantes que puede
experimentar un desarrollador de aplicaciones consiste en verse inundado
por una cantidad ingente de informes de errores que en realidad vienen a
ser solicitudes de soporte o ayuda, o que contienen poca o ninguna
informaci?n sobre c?al es el problema y como se puede reproducir.

Este documento intenta describir c?mo escribir informes de problemas de
calidad. Usted se preguntar? c?mo se pueden escribir informes de
problemas de calidad. Bien, para ir directos al grano, un informe de
problemas de calidad es aqu?l que se puede analizar y tratar
r?pidamente, para m?tua satisfacci?n del usuario y del desarrollador.

Aunque el objetivo principal de este art?culo se centra en los informes
de problemas de FreeBSD la mayor?a de los conceptos se pueden aplicar
bastante bien en otros proyectos de software.

D?se cuenta de que este art?culo se organiza de forma tem?tica, no
cronol?gicamente, de tal forma que se debe leer el documento ?ntegro
antes de enviar informes de problemas. No debe tratarse como un tutorial
del estilo paso a paso.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----+-----+-------------------------------------------+
| ?   | ?   | ?\ `Siguiente <pr-when.html>`__           |
+-----+-----+-------------------------------------------+
| ?   | ?   | ?2. Cu?ndo enviar informes de problemas   |
+-----+-----+-------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
