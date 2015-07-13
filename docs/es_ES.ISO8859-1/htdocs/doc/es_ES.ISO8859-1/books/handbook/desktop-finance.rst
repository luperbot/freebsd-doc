=============
6.5. Finanzas
=============

.. raw:: html

   <div class="navheader">

6.5. Finanzas
`Anterior <desktop-viewers.html>`__?
Cap?tulo 6. Aplicaciones de escritorio
?\ `Siguiente <desktop-summary.html>`__

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

6.5. Finanzas
-------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Si por algun motivo quisiera gestionar sus finanzas personales en su
escritorio FreeBSD hay algunas aplicaciones potentes y sencillas de
utilizar que puede instalar. Algunas de ellas son compatibles con
formatos muy extendidos como documentos de Quicken o Excel.

Esta secci?n cubre las siguientes aplicaciones:

.. raw:: html

   <div class="informaltable">

+------------------------+-----------------------+-------------------------------+----------------------------+
| Nombre de aplicaci?n   | Recursos necesarios   | Instalaci?n desde los ports   | Dependencias importantes   |
+========================+=======================+===============================+============================+
| GnuCash                | ligero                | pesado                        | GNOME                      |
+------------------------+-----------------------+-------------------------------+----------------------------+
| Gnumeric               | ligero                | pesado                        | GNOME                      |
+------------------------+-----------------------+-------------------------------+----------------------------+
| Abacus                 | ligero                | pesado                        | Tcl/Tk                     |
+------------------------+-----------------------+-------------------------------+----------------------------+
| KMyMoney               | ligero                | pesado                        | KDE                        |
+------------------------+-----------------------+-------------------------------+----------------------------+

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.5.1. GnuCash
~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

GnuCash es parte del af?n de GNOME por ofrecer aplicaciones de uso
sencillo pero a la vez potentes a los usuarios. Con GnuCash, puede
gestionar sus ingresos y sus gastos, sus cuentas bancarias o sus
acciones. Tiene una interfaz intuitiva pero muy profesional.

GnuCash dispone de un registro elegante, un sistema jer?rquico de
cuentas, muchos atajos de teclado y m?todos de autocompletado. Puede
dividir una transacci?n en varias partes m?s detalladas. GnuCash puede
importar y mezclar ficheros QIF de Quicken. Tambi?n admite muchos
formatos internacionales de fecha y moneda.

Para instalar GnuCash en su sistema ejecute:

.. code:: screen

    # pkg_add -r gnucash

Si el paquete no est? disponible puede usar la colecci?n de ports:

.. code:: screen

    # cd /usr/ports/finance/gnucash
    # make install clean

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.5.2. Gnumeric
~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Gnumeric es una hoja de c?lculo que forma parte del entorno de
escritorio GNOME. Implementa una ?predicci?n? autom?tica de la entrada
del usuario de acuerdo con el formato de celda y un sistema de
completado autom?tico para m?ltiples secuencias. Puede importar ficheros
de un gran n?mero de formatos muy extendidos, como Excel, Lotus 1-2-3 o
Quattro Pro. Gnumeric soporta gr?ficas mediante el programa de gr?ficas
`math/guppi <http://www.freebsd.org/cgi/url.cgi?ports/math/guppi/pkg-descr>`__.
Tiene un gran n?mero de funciones internas y permite todos los formatos
normales de celda como n?mero, moneda, fecha, hora y muchos m?s.

Para instalar Gnumeric como package ejecute:

.. code:: screen

    # pkg_add -r gnumeric

Si el package no est? disponible puede usar la colecci?n de ports del
siguiente modo:

.. code:: screen

    # cd /usr/ports/math/gnumeric
    # make install clean

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.5.3. Abacus
~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Abacus es una hoja de c?lculo peque?a y f?cil de usar. Tiene muchas
funciones ?tiles en varios ?mbitos como la estad?stica, las finanzas y
las matem?ticas. Puede importar y exportar ficheros con formato Excel.
Abacus puede generar ficheros PostScript?.

Para instalar Abacus como package ejecute:

.. code:: screen

    # pkg_add -r abacus

Si no hay package al alcance puede usar la colecci?n de ports:

.. code:: screen

    # cd /usr/ports/deskutils/abacus
    # make install clean

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------+----------------------------+-------------------------------------------+
| `Anterior <desktop-viewers.html>`__?   | `Subir <desktop.html>`__   | ?\ `Siguiente <desktop-summary.html>`__   |
+----------------------------------------+----------------------------+-------------------------------------------+
| 6.4. Visores de documentos?            | `Inicio <index.html>`__    | ?6.6. Resumen                             |
+----------------------------------------+----------------------------+-------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
