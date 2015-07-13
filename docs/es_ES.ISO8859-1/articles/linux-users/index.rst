=======================================
Gu?a de FreeBSD para usuarios de Linux?
=======================================

.. raw:: html

   <div class="navheader">

Gu?a de FreeBSD para usuarios de Linux?
?
?
?\ `Siguiente <shells.html>`__

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

John Ferrell
~~~~~~~~~~~~

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

Copyright ? 2008 El Proyecto de Documentaci?n de FreeBSD

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

El objetivo de este documento es familiarizar de forma r?pida a usuarios
de nivel intermedio o avanzado de Linux? sobre los conceptos b?sicos de
FreeBSD.

*Traducci?n de G?bor K?vesd?n ``<gabor@FreeBSD.org>``.*

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

`1. Introducci?n <index.html#intro>`__
`2. Shells: ?No est? Bash? <shells.html>`__
`3. Packages y Ports: Instalaci?n de software en
FreeBSD <software.html>`__
`4. Arranque del sistema: ?D?nde est?n los niveles de
ejecuci?n? <startup.html>`__
`5. Configuraci?n de la red <network.html>`__
`6. Cortafuegos <firewall.html>`__
`7. Actualizaci?n de FreeBSD <updates.html>`__
`8. procfs: perdido pero no olvidado <procfs.html>`__
`9. Comandos m?s comunes <commands.html>`__
`10. Conclusi?n <conclusion.html>`__

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

1. Introducci?n
---------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

En este documento se muestran las diferencias entre FreeBSD y Linux?
para que usuarios de nivel intermedio o avanzado de Linux? puedan
aprender r?pidamente los fundamentos de FreeBSD. Es solamente una breve
presentaci?n t?cnica, no intenta explicar las diferencias de las
“filosof?as” que hay detr?s de ambos sistemas operativos.

Este documento presupone que usted ya tiene FreeBSD instalado. Si no lo
ha instalado o necesita ayuda con el proceso de la instalaci?n consulte
el cap?tulo en el que se explica la `instalaci?n de
FreeBSD <../../../../doc/es_ES.ISO8859-1/books/handbook/install.html>`__
del Handbook.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----+-----+----------------------------------+
| ?   | ?   | ?\ `Siguiente <shells.html>`__   |
+-----+-----+----------------------------------+
| ?   | ?   | ?2. Shells: ?No est? Bash?       |
+-----+-----+----------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
