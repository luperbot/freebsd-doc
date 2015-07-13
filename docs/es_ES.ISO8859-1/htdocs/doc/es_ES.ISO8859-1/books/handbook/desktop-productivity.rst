==================
6.3. Productividad
==================

.. raw:: html

   <div class="navheader">

6.3. Productividad
`Anterior <desktop-browsers.html>`__?
Cap?tulo 6. Aplicaciones de escritorio
?\ `Siguiente <desktop-viewers.html>`__

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

6.3. Productividad
------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Cuando se trata de productividad, normalmente los nuevos usuarios
piensan en una buena suite ofim?tica o un procesador de textos amigable.
Mientras que algunos `entornos de escritorio <x11-wm.html>`__ como KDE
ofrecen una suite ofim?tica propia, no hay una aplicaci?n por defecto.
FreeBSD permite usar todo lo que se necesite sin importar qu? entorno de
escritorio use.

Esta secci?n cubre estas aplicaciones:

.. raw:: html

   <div class="informaltable">

+---------------------------+-----------------------+-------------------------------+------------------------------+
| Nombre de la aplicaci?n   | Recursos necesarios   | Instalaci?n desde los ports   | Dependencias importantes     |
+===========================+=======================+===============================+==============================+
| KOffice                   | ligero                | pesado                        | KDE                          |
+---------------------------+-----------------------+-------------------------------+------------------------------+
| AbiWord                   | ligero                | ligero                        | Gtk+ o GNOME                 |
+---------------------------+-----------------------+-------------------------------+------------------------------+
| The Gimp                  | ligero                | pesado                        | Gtk+                         |
+---------------------------+-----------------------+-------------------------------+------------------------------+
| OpenOffice.org            | pesado                | enorme                        | GCC 3.1, JDK™ 1.3, Mozilla   |
+---------------------------+-----------------------+-------------------------------+------------------------------+

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

6.3.1. KOffice
~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

La comunidad de KDE ha dotado su entorno de escritorio con una suite
ofim?tica totalmente independiente de KDE. Incluye los 4 componentes
est?ndar que se pueden encontrar en otras suites ofim?ticas. KWord es el
procesador de textos, KSpread es la hoja de c?lculo, KPresenter se
encarga de las presentaciones y Kontour le permite dibujar documentos
gr?ficos.

Antes de instalar el ?ltimo KOffice aseg?rese de que tiene una versi?n
actualizada de KDE.

Para instalar KOffice como un paquete ejecute la siguiente orden:

.. code:: screen

    # pkg_add -r koffice

Si el paquete no est? disponible puede usar la colecci?n de ports. Por
ejemplo, para instalar KOffice para KDE3 haga lo siguiente:

.. code:: screen

    # cd /usr/ports/editors/koffice-kde3
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

6.3.2. AbiWord
~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

AbiWord es un procesador de textos libre con un aspecto parecido a
Microsoft? Word. Es ?til para escribir documentos, cartas, informes,
notas, etc. Es muy r?pido, tiene muchas opciones y es muy amigable.

AbiWord puede importar o exportar muchos formatos de fichero, incluyendo
algunos propietarios como Microsoft ``.doc``.

AbiWord est? disponible como package. Si quiere instalarlo haga lo
siguiente:

.. code:: screen

    # pkg_add -r AbiWord2

Si el package no est? disponible por el motivo que fuere puede
instalarlo desde la colecci?n de Ports. La colecci?n de ports deber?a
estar m?s actualizada:

.. code:: screen

    # cd /usr/ports/editors/AbiWord2
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

6.3.3. The GIMP
~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

GIMP es un programa de manipulaci?n de im?genes muy sofisticado que le
permitir? tambi?n crearlas y retocarlas. Puede usarlo como un programa
de dibujo sencillo o como una sofisticada herramienta de retoque
fotogr?fico. Admite una gran cantidad de ?plug-ins? y tiene opciones tan
interesantes como una interfaz para ?scripts?. GIMP puede leer y
escribir un gran n?mero de formatos de fichero. Soporta esc?ners y
tabletas gr?ficas.

Instale el package mediante la siguiente orden:

.. code:: screen

    # pkg_add -r gimp

Si su servidor FTP no tiene este package puede usar la colecci?n de
ports. El directorio
`graphics <http://www.FreeBSD.org/ports/graphics.html>`__ de la
colecci?n de ports tambi?n contiene The Gimp Manual. Si quiere
instalarlo haga lo siguiente:

.. code:: screen

    # cd /usr/ports/graphics/gimp
    # make install clean
    # cd /usr/ports/graphics/gimp-manual-pdf
    # make install clean

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

El directorio `graphics <http://www.FreeBSD.org/ports/graphics.html>`__
de la colecci?n de ports tiene la versi?n de desarrollo de GIMP en
`graphics/gimp-devel <http://www.freebsd.org/cgi/url.cgi?ports/graphics/gimp-devel/pkg-descr>`__.
Hay una versi?n en HTML de The Gimp Manual en
`graphics/gimp-manual-html <http://www.freebsd.org/cgi/url.cgi?ports/graphics/gimp-manual-html/pkg-descr>`__.

.. raw:: html

   </div>

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

6.3.4. OpenOffice.org
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

OpenOffice.org incluye todas las aplicaci?nes esenciales en una completa
suite ofim?tica: un procesador de textos, una hoja de c?lculo, un gestor
de presentaciones y un programa de dibujo. Su interfaz de usuario es muy
parecida a otras suites ofim?ticas y puede importar y exportar diversos
formatos muy extendidos. Est? disponible en diversos idiomas; el proceso
de internacionalizaci?n incluye interfaces, correctores ortogr?ficos y
diccionarios.

El procesador de textos de OpenOffice.org usa un fichero XML nativo para
aumentar la portabilidad y la eficiencia. El programa de hojas de
c?lculo tiene un lenguaje de macros y puede usarse desde bases de datos
externas. OpenOffice.org es estable y hay versiones nativas para
Windows?, Solaris™, Linux, FreeBSD, y Mac?OS??X. Tiene m?s informaci?n
sobre OpenOffice.org en `la p?gina web de
OpenOffice <http://www.openoffice.org/>`__. Si quiere informaci?n
espec?fica para FreeBSD, o si quiere bajar directamente los packages use
la p?gina web de `FreeBSD OpenOffice Porting
Team <http://porting.openoffice.org/freebsd/>`__.

Para instalar OpenOffice.org ejecute:

.. code:: screen

    # pkg_add -r openoffice

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Si usa una versi?n -RELEASE de FreeBSD todo lo antedicho funcionar?. Si
usa cualquier otra versi?n visite el sitio web del FreeBSD
OpenOffice.org Porting Team, desde el cual podr? descargar e instalar el
package m?s adecuado e instalarlo mediante
`pkg\_add(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_add&sektion=1>`__.
En este sitio web encontrar? tanto una versi?n current como la de
desarrollo.

.. raw:: html

   </div>

Una vez instalado el package escriba la siguiente orden para ejecutar
OpenOffice.org:

.. code:: screen

    % openoffice.org

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

En el primer arranque se le har?n diversas preguntas se crear? un
directorio ``.openoffice.org2`` en su ?home?.

.. raw:: html

   </div>

Si no hay packages de OpenOffice.org disponibles siempre tiene la opci?n
de compilar el port. Tenga muy en cuenta que necesitar? gran cantidad de
espacio en disco y que este port necesita una cantidad de tiempo
monstruosa para efectuar la compilaci?n.

.. code:: screen

    # cd /usr/ports/editors/openoffice.org-2
    # make install clean

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Si quiere compilar una de las muchas versiones que existen en idiomas
distintos del ingl?s sustituya la orden anterior por la que se muestra a
continuaci?n:

.. code:: screen

    # make LOCALIZED_LANG=su_idioma install clean

Sustituya *``su_idioma``* por el c?digo ISO del idioma que quiera. Tiene
una lista de c?digos de idioma disponibles dentro del directorio del
port en ``files/Makefile.localized``.

.. raw:: html

   </div>

Hecho esto puede ejecutar OpenOffice.org con la orden:

.. code:: screen

    % openoffice.org

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------+----------------------------+-------------------------------------------+
| `Anterior <desktop-browsers.html>`__?   | `Subir <desktop.html>`__   | ?\ `Siguiente <desktop-viewers.html>`__   |
+-----------------------------------------+----------------------------+-------------------------------------------+
| 6.2. Navegadores?                       | `Inicio <index.html>`__    | ?6.4. Visores de documentos               |
+-----------------------------------------+----------------------------+-------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
