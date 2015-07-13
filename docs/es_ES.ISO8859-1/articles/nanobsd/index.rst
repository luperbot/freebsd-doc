======================
Introducci?n a NanoBSD
======================

.. raw:: html

   <div class="navheader">

Introducci?n a NanoBSD
?
?
?\ `Siguiente <howto.html>`__

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

Daniel Gerzo
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

Copyright ? 2006 The FreeBSD Documentation Project

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

Este documento trata sobre NanoBSD. NanoBSD es una herramienta que
permite crear im?genes del sistema FreeBSD para su uso en aplicaciones
empotradas y listas para cargarse en una tarjeta Compact Flash (u otro
medio de almacenamiento masivo).

*Traducci?n de Germ?n Marcos ``<gri.msg@gmail.com>``.*

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

`1. Introducci?n a NanoBSD <index.html#intro>`__
`2. NanoBSD “Howto” <howto.html>`__
`?ndice <ix01.html>`__

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

1. Introducci?n a NanoBSD
-------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

NanoBSD es una herramienta actualmente desarrollada por Poul-Henning
Kamp. Crea una imagen del sistema FreeBSD para aplicaciones empotradas
lista para su uso en una tarjeta Compact Flash (u otro medio de
almacenamiento masivo).

Puede utilizarse para generar im?genes instalables especiales; est?
dise?ado pensando en una instalaci?n y mantenimiento f?ciles en sistemas
conocidos como “sistemas empotrados”. Los sistemas empotrados tienen
hardware y software integrado en el producto, lo que significa que todas
las aplicaciones est?n preinstaladas. Estos dispositivos pueden
conectarse a una red dada y comenzar a trabajar (casi) inmediatamente.

Las caracter?sticas de NanoBSD incluyen:

.. raw:: html

   <div class="itemizedlist">

-  Los ports y paquetes funcionan como en FreeBSD: Cualquier aplicaci?n
   puede instalarse y usarse en una imagen de NanoBSD de la misma forma
   que en FreeBSD.

-  No se pierde funcionalidad: Si es posible hacer algo en FreeBSD es
   posible hacer lo mismo en NanoBSD, a menos que se haya eliminado
   expl?citamente esa caracter?stica o caracter?sticas especiales al
   crear la imagen de NanoBSD.

-  Todo est? en modo de s?lo lectura durante el funcionamiento del
   sistema: Un apagado brusco es totalmente seguro. No es necesario
   ejecutar
   `fsck(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck&sektion=8>`__
   despu?s de que el sistema sufra un apag?n.

-  F?cil de generar y personalizar: Usando un solo script de shell y un
   fichero de configuraci?n pueden generarse im?genes reducidas y
   personalizadas que satisfagan cualquier necesidad.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----+-----+---------------------------------+
| ?   | ?   | ?\ `Siguiente <howto.html>`__   |
+-----+-----+---------------------------------+
| ?   | ?   | ?2. NanoBSD “Howto”             |
+-----+-----+---------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
