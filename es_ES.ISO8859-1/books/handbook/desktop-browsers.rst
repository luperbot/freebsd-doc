================
6.2. Navegadores
================

.. raw:: html

   <div class="navheader">

6.2. Navegadores
`Anterior <desktop.html>`__?
Cap?tulo 6. Aplicaciones de escritorio
?\ `Siguiente <desktop-productivity.html>`__

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

6.2. Navegadores
----------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD no trae ning?n navegador preinstalado, pero en el directorio
`www <http://www.FreeBSD.org/ports/www.html>`__ de la colecci?n de ports
tiene muchos navegadores listos para instalar. Si no tiene tiempo para
compilarlo todo (esto puede requerir much?simo tiempo en algunos casos)
muchos de ellos est?n disponibles como packages.

KDE y GNOME ya proporcionan navegadores HTML. Consulte la `Secci?n?5.7,
“Entornos de escritorio” <x11-wm.html>`__ para m?s informaci?n sobre
c?mo configurar estos escritorios.

Si busca navegadores ligeros tiene en la colecci?n de ports
`www/dillo <http://www.freebsd.org/cgi/url.cgi?ports/www/dillo/pkg-descr>`__,
`www/links <http://www.freebsd.org/cgi/url.cgi?ports/www/links/pkg-descr>`__,
o
`www/w3m <http://www.freebsd.org/cgi/url.cgi?ports/www/w3m/pkg-descr>`__.

Esta secci?n cubre estas aplicaciones:

.. raw:: html

   <div class="informaltable">

+------------------------+-----------------------+-------------------------------+--------------------------------------------------------------------------------------------------------------------------------------+
| Nombre de aplicaci?n   | Recursos necesarios   | Instalaci?n desde los Ports   | Dependencias importantes                                                                                                             |
+========================+=======================+===============================+======================================================================================================================================+
| Mozilla                | pesado                | pesado                        | Gtk+                                                                                                                                 |
+------------------------+-----------------------+-------------------------------+--------------------------------------------------------------------------------------------------------------------------------------+
| Opera                  | ligero                | ligero                        | Versiones para FreeBSD y Linux disponibles. La versi?n de Linux depende de la compatibiliad binaria de Linux y de linux-openmotif.   |
+------------------------+-----------------------+-------------------------------+--------------------------------------------------------------------------------------------------------------------------------------+
| Firefox                | medio                 | pesado                        | Gtk+                                                                                                                                 |
+------------------------+-----------------------+-------------------------------+--------------------------------------------------------------------------------------------------------------------------------------+
| Konqueror              | medio                 | pesado                        | KDE Librer?s                                                                                                                         |
+------------------------+-----------------------+-------------------------------+--------------------------------------------------------------------------------------------------------------------------------------+

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

6.2.1. Mozilla
~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Mozilla es una navegador moderno y estable que dispone de soporte
completo en FreeBSD: dispone de un motor de presentaci?n de HTML muy
ajustado a los est?ndares, tiene cliente de correo electr?nico, lector
de noticias e incluso ofrece un editor de p?ginas HTML por si quiere
crear p?ginas web. Los usuarios de Netscape? encontrar?n semejanzas con
la suite Communicator, dado que ambos navegadores comparten parte de la
base de desarrollo.

En m?quinas lentas, con una CPU de velocidad inferior a 233MHz o con
menos de 64MB de RAM, Mozilla puede consumir demasiados recursos para
poder utilizarse. Puede usar el navegador Opera, mucho m?s ligero, que
se describe m?s adelante en este mismo cap?tulo.

Si no puede o no quiere compilar Mozilla por alg?n motivo, el equipo de
FreeBSD GNOME ya lo ha hecho por usted. Instale el package desde la red
del siguiente modo:

.. code:: screen

    # pkg_add -r mozilla

Si no hay package disponible y tiene suficiente tiempo y espacio en el
disco puede obtener el c?digo de Mozilla, compilarlo e instalarlo en su
sistema. Esto se hace con:

.. code:: screen

    # cd /usr/ports/www/mozilla
    # make install clean

El port de Mozilla se asegura de que se inicialice adecuadamente
ejecutando la configuraci?n del registro ?chrome? con privilegios de
``root``, aunque si quiere instalar alg?n a?adido como ?mouse gestures?
(gestos del rat?n) tendr? que ejecutar que correr Mozilla como ``root``
para que se instale correctamente.

Una vez efectuada la instalaci?n de Mozilla no es necesario ser ``root``
por m?s tiempo. Puede arrancar Mozilla como navegador escribiendo:

.. code:: screen

    % mozilla

Puede arrancarlo directamente como lector de correo y noticias del
siguiente modo:

.. code:: screen

    % mozilla -mail

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

6.2.2. Firefox
~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Firefox es un navegador de nueva generaci?n basado en el c?digo fuente
de Mozilla. Mozilla es una suite completa de aplicaciones en la que
encontrar? un navegador, un cliente de correo, un cliente de chat y
muchas otras. Firefox es solamente un navegador, lo que hace que sea
mucho m?s peque?o y ligero.

Puede instalarlo como package del siguiente modo:

.. code:: screen

    # pkg_add -r firefox

Si prefiere compilar el c?digo fuente e instalarlo desde los ports puede
hacer esto otro:

.. code:: screen

    # cd /usr/ports/www/firefox
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

6.2.3. Firefox, Mozilla y el ?plugin? Java™
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

En esta secci?n y en la siguiente asumiremos que ya ha instalado Firefox
o Mozilla.

.. raw:: html

   </div>

La FreeBSD Foundation disponde una licencia de Sun Microsystems que le
permite distribuir binarios FreeBSD del Java Runtime Environment (JRE™)
y del Java Development Kit (JDK™). Puede descargar packages binarios
para FreeBSD desde el `sitio
web <http://www.freebsdfoundation.org/downloads/java.shtml>`__\ de la
FreeBSD Foundation.

Para a?adir soporte Java™ a Firefox o Mozilla tiene que instalar el port
the
`java/javavmwrapper <http://www.freebsd.org/cgi/url.cgi?ports/java/javavmwrapper/pkg-descr>`__.
Despu?s descargue el package Diablo JRE™ desde
``http://www.freebsdfoundation.org/downloads/java.shtml`` e inst?lelo
con
`pkg\_add(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_add&sektion=1>`__.

Arranque su navegador, introduzca ``about:plugins`` en la barra de
navegaci?n y pulse **Intro**. Ver? una p?gina con una lista de los
?plugins? que tenga instalados; el ?plugin? Java™ deber?a ser uno de los
que aparezcan. Si no es as? ejecute (como ``root``) lo siguiente

.. code:: screen

    # ln -s /usr/local/diablo-jre1.6.0/plugin/i386/ns7/libjavaplugin_oji.so \
      /usr/local/lib/browser_plugins/

y reinicie su navegador.

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

6.2.4. Opera
~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Opera es un navegador muy r?pido, completo y que cumple con los
est?ndares. Hay dos versiones: la versi?n ?nativa? de FreeBSD y la
versi?n que se ejecuta bajo la emulaci?n de Linux. Para cada sistema
operativo hay una versi?n gratuita que muestra publicidad y otra sin
publicidad que se puede comprar en `la p?gina web de
Opera <http://www.opera.com/>`__.

Para navegar por la web con la versi?n para FreeBSD de Opera tendr? que
instalar el package:

.. code:: screen

    # pkg_add -r opera

Algunos sitios FTP no tienen todos los paquetes, pero puede instalarlo
desde la Colecci?n de Ports:

.. code:: screen

    # cd /usr/ports/www/opera
    # make install clean

Si quiere instalar la versi?n de Linux de Opera ponga ``linux-opera`` en
lugar de ``opera`` en los atnteriores ejemplos. La versi?n de Linux es
?til en situaciones donde se necesitan ?plugins? de los que s?lo hay
versiones para Linux, como Adobe Acrobat?Reader?. En todos los dem?s
aspectos las versiones de FreeBSD y Linux son iguales.

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

6.2.5. Konqueror
~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Konqueror forma parte de KDE pero tambi?n se puede instalar y usar
independienmente de KDE instalando
`x11/kdebase3 <http://www.freebsd.org/cgi/url.cgi?ports/x11/kdebase3/pkg-descr>`__.
Konqueror es mucho m?s que un navegador, tambi?n es gestor de ficheros y
visor multimedia.

Konqueror tambi?n trae un conjunto de ?plugins?, disponibles en
`misc/konq-plugins <http://www.freebsd.org/cgi/url.cgi?ports/misc/konq-plugins/pkg-descr>`__.

Konqueror tambi?n soporta Flash™, hay un tutorial en
``http://freebsd.kde.org/howto.php``.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------------+----------------------------+------------------------------------------------+
| `Anterior <desktop.html>`__?              | `Subir <desktop.html>`__   | ?\ `Siguiente <desktop-productivity.html>`__   |
+-------------------------------------------+----------------------------+------------------------------------------------+
| Cap?tulo 6. Aplicaciones de escritorio?   | `Inicio <index.html>`__    | ?6.3. Productividad                            |
+-------------------------------------------+----------------------------+------------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
