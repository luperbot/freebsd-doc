=====================================
Mirrors de las p?ginas Web de FreeBSD
=====================================

.. raw:: html

   <div id="containerwrap">

.. raw:: html

   <div id="container">

`Skip site navigation <#content>`__ (1) `Skip section
navigation <#contentwrap>`__ (2)

.. raw:: html

   <div id="headercontainer">

.. raw:: html

   <div id="header">

Cabecera y Logo
---------------

.. raw:: html

   <div id="headerlogoleft">

|FreeBSD|

.. raw:: html

   </div>

.. raw:: html

   <div id="headerlogoright">

Enlaces externos
----------------

.. raw:: html

   <div id="SEARCHNAV">

-  `Donaciones <../../donations/>`__
-  `Contactar <../mailto.html>`__

.. raw:: html

   </div>

.. raw:: html

   <div id="SEARCH">

.. raw:: html

   <div>

Buscar
------

.. raw:: html

   <div>

?

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div id="topnav">

-  `Inicio <../>`__
-  `Sobre <../about.html>`__
-  `Descargar <../where.html>`__
-  `Documentaci?n <../docs.html>`__
-  `Comunidad <../community.html>`__
-  `Desarrollo <../projects/index.html>`__
-  `Soporte <../support.html>`__
-  `Fundaci?n <http://www.freebsdfoundation.org/>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div id="content">

.. raw:: html

   <div id="sidewrap">

.. raw:: html

   <div id="sidenav">

Navegaci?n por secciones
------------------------

-  `Documentaci?n <../docs.html>`__
-  `FAQ <../../doc/es_ES.ISO8859-1/books/faq/>`__
-  `Manual de FreeBSD <../../doc/es_ES.ISO8859-1/books/handbook/>`__
-  `Manuales en l?nea <//www.FreeBSD.org/cgi/man.cgi>`__
-  `Libros y art?culos en l?nea <../../docs/books.html>`__
-  `Publicaciones <../publish.html>`__
-  `Recursos web <../../docs/webresources.html>`__
-  `Para principantes <../projects/newbies.html>`__
-  `Proyecto de documentaci?n <../docproj/>`__
-  `Proyecto de documentaci?n en
   castellano <../../doc/es_ES.ISO8859-1/articles/fdp-es/>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div id="contentwrap">

Mirrors de las p?ginas Web de FreeBSD
=====================================

Puedes (y te animamos) a mantener mirrors o r?plicas de las p?ginas web
de ``www.freebsd.org``. Para hacerlo, necesitas obtener e instalar un
programa llamado *cvsup* en tu servidor web.
`CVSup <../../handbook/synching.html#CVSUP>`__ es un software para
distribuci?n y actualizaci?n de colecciones de ficheros a trav?s de una
red.

Instalando CVSup
----------------

Para instalarlo, haz lo siguiente:

::

     # cd /usr/ports/net/cvsup-bin
     # make all install clean

Ejecutando CVSup
----------------

Si mantienes las p?ginas replicadas de FreeBSD en el directorio
``/usr/FreeBSD-mirror`` y pertenecen al usuario "fred", ejecuta el
siguiente comando como el usuario "fred":

::

         $ cvsup supfile-www

EL fichero ``supfile-www`` contiene:
::

           *default host=cvsup.FreeBSD.org
           *default prefix=/usr/FreeBSD-mirror
           *default base=/usr/local/etc/cvsup
           www release=current delete use-rel-suffix compress

Esto mantendr?a una r?plica de las p?ginas de FreeBSD en el directorio
``/usr/FreeBSD-mirror``. Puedes instalar este comando en el cron de
"fred", de manera que se realice la actualizaci?n diariamente de manera
autom?tica. Los contenidos de web de FreeBSD son actualizados
diariamente a las 4:30am de California.

M?s informaci?n sobre CVSup
---------------------------

See the `Introducci?n a CVSup <../../handbook/synching.html#CVSUP>`__ en
el handbook.

`FreeBSD Internal Home <internal.html>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div id="footer">

`Mapa del sitio <../search/index-site.html>`__ \| `Noticias del
Copyright <../copyright/>`__ \| ? 1995-2010 El Proyecto FreeBSD. Quedan
reservados todos los derechos.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. |FreeBSD| image:: ../../layout/images/logo-red.png
   :target: ..
