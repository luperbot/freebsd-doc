=======================================================
3. Packages y Ports: Instalaci?n de software en FreeBSD
=======================================================

.. raw:: html

   <div class="navheader">

3. Packages y Ports: Instalaci?n de software en FreeBSD
`Anterior <shells.html>`__?
?
?\ `Siguiente <startup.html>`__

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

3. Packages y Ports: Instalaci?n de software en FreeBSD
-------------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Aparte del m?todo tradicional de instalar software en UNIX? (descargar
fuentes, descomprimir, editar el fuente y compilar), FreeBSD ofrece dos
alternativas para instalar programas: packages y dos alternativas para
instalar programas: package y ports. Una lista y ports. Hay una lista
completa de los ports disponibles
`aqu? <http://www.freebsd.org/ports/master-index.html>`__.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.1. Packages
~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Los “packages” son programas precompilados, equivalentes en FreeBSD a
los ficheros ``.deb`` en sistemas Debian/Ubuntu y ``.rpm`` en sistemas
Red?Hat/Fedora. Los packages se instalan usando
`pkg\_add(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_add&sektion=1>`__.
Por ejemplo, puede instalar Apache 2.2 del siguiente modo:

.. code:: screen

    # pkg_add /tmp/apache-2.2.6_2.tbz

Al usar la opci?n ``-r``,
`pkg\_add(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_add&sektion=1>`__
autom?ticamente descargar? el package indicado y lo instalar?, as? como
todos aquellos que necesite para su funcionamiento. Esto son las
``dependencias``.

.. code:: screen

    # pkg_add -r apache22
    Fetching ftp://ftp.freebsd.org/pub/FreeBSD/ports/i386/packages-6.2-release/Latest/apache22.tbz... Done.
    Fetching ftp://ftp.freebsd.org/pub/FreeBSD/ports/i386/packages-6.2-release/All/expat-2.0.0_1.tbz... Done.
    Fetching ftp://ftp.freebsd.org/pub/FreeBSD/ports/i386/packages-6.2-release/All/perl-5.8.8_1.tbz... Done.
    [snip]

    To run apache www server from startup, add apache22_enable="YES"
    in your /etc/rc.conf. Extra options can be found in startup script.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Si usa una versi?n release de FreeBSD (6.2, 6.3, 7.0, etc., lo que
seguramente es una instalaci?n desde CD-ROM) ``pkg_add -r`` descargar?
packages compilados para esa release espec?fica. Estos packages *pueden
ser* versiones desactualizadas del programa. Puede usar la variable
``PACKAGESITE`` para ignorar este comportamiento, que es el que se
espera por omisi?n del programa. Por ejemplo, asigne a ``PACKAGESITE``
el valor
``ftp://ftp.freebsd.org/pub/FreeBSD/ports/i386/packages-6-stable/Latest/``
si quiere descargar los packages m?s recientes compilados para la
versi?n 6.X.

.. raw:: html

   </div>

Para m?s informaci?n sobre los packages consulte la secci?n 4.4 del
Handbook: `Uso del sistema de
packages <../../../../doc/es_ES.ISO8859-1/books/handbook/packages-using.html>`__.

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

3.2. Ports
~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El segundo m?todo que ofrece FreeBSD para instalar programas es usar la
Colecci?n de Ports. la Colecci?n de Ports es un entorno de ficheros
``Makefile`` y parches adaptados espec?ficamente para poder instalar
desde el c?digo fuente aplicaciones de lo m?s variopinto en sistemas
FreeBSD. Si instala un port el sistema descargar? los fuentes, aplicar?
los parches necesarios, compilar? el c?digo e instalar? el programa (y
har? exactamente los mismo con todas las dependencias).

La Colecci?n de Ports, tambi?n conocida como ?rbol de ports, est? en
``/usr/ports`` si se instal? durante el proceso de instalaci?n de
FreeBSD. Si la Colecci?n de Ports no est? instalada puede hacerlo puede
hacerlo desde los discos de instalaci?n mediante
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8>`__
o desde los servidores de FreeBSD gracias a
`csup(1) <http://www.FreeBSD.org/cgi/man.cgi?query=csup&sektion=1>`__ o
`portsnap(8) <http://www.FreeBSD.org/cgi/man.cgi?query=portsnap&sektion=8>`__.
Tiene instrucciones detalladas para instalar la Colecci?n de Ports en la
`secci?n
4.5.1 <../../../../doc/en_US.ISO8859-1/books/handbook/ports-using.html>`__
del Handbook.

Instalar un port es (generalmente) tan simple como entrar en el
directorio del port y ejecutar el proceso de compilaci?n. El ejemplo que
se muestra a continuaci?n instala Apache 2.2 desde la Colecci?n de
Ports:

.. code:: screen

    # cd /usr/ports/www/apache22
    # make install clean

Una de las principales ventajas del uso de ports para instalar software
es la posibilidad de ajustar las opciones de la instalaci?n. Por
ejemplo, es posible activar mod\_ldap dentro de su Apache 2.2 durante la
instalaci?n mediante el uso de la variable ``WITH_LDAP`` de
`make(1) <http://www.FreeBSD.org/cgi/man.cgi?query=make&sektion=1>`__:

.. code:: screen

    # cd /usr/ports/www/apache22
    # make WITH_LDAP="YES" install clean

Para m?s informaci?n sobre la Colecci?n de Ports consulte la secci?n del
Handbook dedicada a `la Colecci?n de
Ports <../../../../doc/es_ES.ISO8859-1/books/handbook/ports-using.html>`__.

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

3.3. ?Qu? deber?a usar? ?Ports o Packages?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Los packages son simplemente ports precompilados, as? que es cuesti?n de
elegir entre instalar desde los fuentes (ports) o instalar binarios
directamente (packages). Cualquiera de los dos tiene sus propias
ventajas:

.. raw:: html

   <div class="itemizedlist">

.. raw:: html

   <div class="itemizedlist-title">

Package (binario)

.. raw:: html

   </div>

-  Instalaci?n m?s r?pida (compilar programas grandes puede llevar su
   tiempo).
-  No hay que comprender el proceso de compilar software.
-  No es necesario instalar compiladores en su sistema.

.. raw:: html

   </div>

.. raw:: html

   <div class="itemizedlist">

.. raw:: html

   <div class="itemizedlist-title">

Ports (fuente)

.. raw:: html

   </div>

-  Es posible ajustar las opciones de la instalaci?n. (Los packages se
   generan normalmente con las opciones est?ndar. Con los ports puede
   ajustar diversas opciones, como disponer de m?dulos adicionales o
   cambiar la ruta por omisi?n.)
-  Puede usar sus propios parches si tiende hacerlo.

.. raw:: html

   </div>

Si no tiene requisitos especiales los packages probablemente cubran sus
necesidades sin problema. Si alguna vez necesita algo m?s ajustado puede
recurrir a los ports. Tenga en cuenta que si necesita un programa a su
medida pero sigue prefiriendo usar packages puede hacerse uno su gusto
mediante ``make`` ``patch`` y luego copie el package a otras m?quinas.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------+---------------------------+--------------------------------------------------------------------+
| `Anterior <shells.html>`__?   | ?                         | ?\ `Siguiente <startup.html>`__                                    |
+-------------------------------+---------------------------+--------------------------------------------------------------------+
| 2. Shells: ?No est? Bash??    | `Inicio <index.html>`__   | ?4. Arranque del sistema: ?D?nde est?n los niveles de ejecuci?n?   |
+-------------------------------+---------------------------+--------------------------------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
