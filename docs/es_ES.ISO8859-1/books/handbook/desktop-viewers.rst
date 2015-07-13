==========================
6.4. Visores de documentos
==========================

.. raw:: html

   <div class="navheader">

6.4. Visores de documentos
`Anterior <desktop-productivity.html>`__?
Cap?tulo 6. Aplicaciones de escritorio
?\ `Siguiente <desktop-finance.html>`__

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

6.4. Visores de documentos
--------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Desde la aparici?n de UNIX? han ido apareciendo formatos de documento de
lo m?s diverso, alguno de los cuales se ha hecho muy popular. Los
visores de documentos est?ndar que requieren no tienen por qu? estar en
el sistema base. En esta secci?n veremos c?mo instalar estos visores.

Esta secci?n cubre las siguientes aplicaciones:

.. raw:: html

   <div class="informaltable">

+---------------------------+-----------------------+-------------------------------+-----------------------------------+
| Nombre de la aplicaci?n   | Recursos necesarios   | Instalaci?n desde los ports   | Dependencias importantes          |
+===========================+=======================+===============================+===================================+
| Acrobat?Reader?           | ligero                | ligero                        | Compatibilidad binaria de Linux   |
+---------------------------+-----------------------+-------------------------------+-----------------------------------+
| gv                        | ligero                | ligero                        | Xaw3d                             |
+---------------------------+-----------------------+-------------------------------+-----------------------------------+
| Xpdf                      | ligero                | ligero                        | FreeType                          |
+---------------------------+-----------------------+-------------------------------+-----------------------------------+
| GQview                    | ligero                | ligero                        | Gtk+ o GNOME                      |
+---------------------------+-----------------------+-------------------------------+-----------------------------------+

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

6.4.1. Acrobat?Reader?
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Muchos documentos se distribuyen en formato PDF, siglas de ?Portable
Document Format?. Uno de los visores recomendados para este tipo de
ficheros es Acrobat?Reader?, un producto de Adobe para Linux. Dado que
FreeBSD puede ejecutar binarios de Linux tambi?n existe para FreeBSD.

Para instalar Acrobat?Reader? 7 desde la Colecci?n de Ports ejecute:

.. code:: screen

    # cd /usr/ports/print/acroread7
    # make install clean

No hay package debido a las restricciones que impone la licencia del
software.

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

6.4.2. gv
~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

gv es un visor de PostScript? y PDF. Tiene su origen en ghostview pero
tiene un aspecto bastante mejorado gracias a la librer?a Xaw3d. Es
r?pido y tiene una interfaz limpia. gv tiene muchas opci?nes como
orientaci?n, tama?o del papel, escalado o antialias. Casi todas las
operaciones se pueden realizar desde el teclado o desde el rat?n.

Para instalar gv como package ejecute:

.. code:: screen

    # pkg_add -r gv

Si no puede obtener el package puede usar la colecci?n de ports:

.. code:: screen

    # cd /usr/ports/print/gv
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

6.4.3. Xpdf
~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Si quiere un visor de PDF peque?o, Xpdf es un visor ligero y eficiente.
Requiere muy pocos recursos y es muy estable. Usa los tipos est?ndar de
X y no depende de Motif? ni de ning?n otro ?toolkit? de X.

Para instalar el package de Xpdf use la siguiente orden:

.. code:: screen

    # pkg_add -r xpdf

Si el paquete no est? disponible o prefiere usar la colecci?n de ports
ejecute:

.. code:: screen

    # cd /usr/ports/graphics/xpdf
    # make install clean

Una vez que la instalaci?n haya concluido puede lanzar Xpdf; use el
bot?n derecho del rat?n para activar el men?.

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

6.4.4. GQview
~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

GQview es un visor de im?genes. Puede ver un fichero con un click,
lanzar un editor externo, obtener im?genes de previsualizaci?n y muchas
cosas m?s. Tambi?n tiene un modo de presentaci?n y admite algunas
opciones b?sicas de manipulaci?n de ficheros. Puede gestionar
colecciones de im?genes y encontrar ficheros duplicados con facilidad.
GQview puede mostrar las im?genes a pantalla completa y est? preparado
para la internacionalizaci?n.

Si quiere instalar el paquete de GQview ejecute:

.. code:: screen

    # pkg_add -r gqview

Si el paquete no est? disponible o prefiere usar la colecci?n de ports
ejecute:

.. code:: screen

    # cd /usr/ports/graphics/gqview
    # make install clean

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------------+----------------------------+-------------------------------------------+
| `Anterior <desktop-productivity.html>`__?   | `Subir <desktop.html>`__   | ?\ `Siguiente <desktop-finance.html>`__   |
+---------------------------------------------+----------------------------+-------------------------------------------+
| 6.3. Productividad?                         | `Inicio <index.html>`__    | ?6.5. Finanzas                            |
+---------------------------------------------+----------------------------+-------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
