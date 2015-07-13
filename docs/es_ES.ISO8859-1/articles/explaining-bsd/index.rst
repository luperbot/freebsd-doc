==========
Qu? es BSD
==========

.. raw:: html

   <div class="navheader">

Qu? es BSD
?
?
?\ `Siguiente <ar01s02.html>`__

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

   <div class="author" xmlns="http://www.w3.org/1999/xhtml">

Greg Lehey
~~~~~~~~~~

.. raw:: html

   <div class="affiliation">

.. raw:: html

   <div class="address">

``<grog@FreeBSD.org>``

.. raw:: html

   </div>

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

En el mundo del c?digo abierto la palabra “Linux” suele ser utilizada
como sin?nimo de “Sistema Operativo” pero no es el ?nico sistema
operativo libre UNIX?. En Abril de 1.999 el `Internet Operating System
Counter <http://www.leb.net/hzo/ioscount/data/r.9904.txt>`__ reflejaba
que el 31'3% de los sistemas que ofrec?an alg?n servicio en Internet
usaban Linux y el 14'6% usaban BSD UNIX?. Alguna de las empresas m?s
grandes de Internet, como por ejemplo
`Yahoo! <http://www.yahoo.com/>`__, usan BSD. El servidor de FTP con m?s
carga en 1999 (ahora desaparecido) ,
`ftp.cdrom.com <ftp://ftp.cdrom.com/>`__, transfer?a 1'4TB diariamente
usando BSD. Es f?cil suponer que no se trata de un nicho de mercado: BSD
es un secreto bien guardado.

?As? que cu?l es el secreto? ?Por qu? BSD no es m?s conocido? ?ste
art?culo trata sobre esa y otras cuestiones.

A lo largo de ?ste art?culo ser?n destacadas de *?ste modo*.

*Traducci?n de Jos? Ram?n Baz ``<jr_baz@hartu.net>`` y Jos? Vicente
Carrasco ``<carvay@es.FreeBSD.org>``.*

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

`1. ?Qu? es BSD? <index.html#idp63455696>`__
`2. Entonces ?es un UNIX verdadero? <ar01s02.html>`__
`3. ?Por qu? BSD no se conoce mejor? <ar01s03.html>`__
`4. Comparemos BSD y Linux <ar01s04.html>`__

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

1. ?Qu? es BSD?
---------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

BSD son las siglas de “Berkeley Software Distribution”. As? se llam? a
las distribuciones de c?digo fuente que se hicieron en la Universidad de
Berkeley en California y que en origen eran extensiones del sistema
operativo UNIX? de AT&T Research. Varios proyectos de sistemas
operativos de c?digo abierto tienen su origen en una distribuci?n de
?ste c?digo conocida como 4.4BSD-Lite. A?aden adem?s un buen n?mero de
paquetes de otros proyectos de C?digo Abierto, incluyendo de forma
destacada al proyecto GNU. El sistema operativo completo incluye:

.. raw:: html

   <div class="itemizedlist">

-  El kernel BSD, que se encarga de la programaci?n del tiempo de
   ejecuci?n de los procesos, la gesti?n de memoria, el multiproceso
   sim?trico (SMP), los controladores de dispositivos, etc.

   *A diferecia del kernel Linux existen varios kernel BSD con diversas
   funciones.*

-  La biblioteca C, la API base del sistema.

   *La biblioteca C de BSD est? basada en c?digo procedente de Berkeley
   no del proyecto GNU.*

-  Aplicaciones como las distintas shells, aplicaciones de gesti?n de
   ficheros, compiladores y enlazadores.

   *Algunas de las aplicaciones derivan del proyecto GNU, otras no.*

-  El sistema X Window, que gestiona el entorno gr?fico.

   El sistema X Window que se usa en la mayor?a de versiones de BSD es
   producto de un proyecto aparte, el `Proyecto
   XFree86 <http://www.XFree86.org/>`__. Se usa el mismo c?digo que en
   Linux. BSD por lo general no predetermina un “gestor de ventanas”
   como KDE o GNOME, aunque ?stos y otros muchos esten disponibles.

-  Muchos otros programas y utilidades.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----+-----+---------------------------------------+
| ?   | ?   | ?\ `Siguiente <ar01s02.html>`__       |
+-----+-----+---------------------------------------+
| ?   | ?   | ?2. Entonces ?es un UNIX verdadero?   |
+-----+-----+---------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
