======================
Proyecto FreeBSD/sun4v
======================

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

-  `Desarrollo <../projects/index.html>`__
-  `Manual del
   desarrollador <../../doc/en_US.ISO8859-1/books/developers-handbook>`__
-  `Manual del
   porter <../../doc/en_US.ISO8859-1/books/porters-handbook>`__
-  `Repositorio CVS <../../developers/cvs.html>`__
-  `Ingenier?a de releases <../../releng/index.html>`__
-  `Arquitecturas <../platforms/>`__
-  `Ideas de proyectos <../../projects/ideas/>`__
-  `Contribuir a
   FreeBSD <../../doc/es_ES.ISO8859-1/articles/contributing/index.html>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div id="contentwrap">

Proyecto FreeBSD/sun4v
======================

Introducci?n
~~~~~~~~~~~~

Esta p?gina contiene informaci?n sobre el port de FreeBSD para
arquitectura UltraSPARC-T1? de Sun Microsystem. El intercambio de
informaci?n sobre el port UltraSPARC-T1 tienen lugar en la lista de
distribuci?n
`freebsd-sun4v <http://lists.freebsd.org/mailman/listinfo/freebsd-sun4v>`__.

Contenidos
~~~~~~~~~~

-  `Cr?ditos <#who>`__
-  `?ltimas noticias <#news>`__
-  `Lista de hardware <#hw>`__
-  `Tareas pendientes <#todo>`__
-  `Enlaces de inter?s <#links>`__

Cr?ditos
~~~~~~~~

Las personas siguientes han trabajado en mayor o menor medida para que
el port funcione:

-  `Kip Macy <mailto:kmacy@FreeBSD.org>`__
-  `John Birrell <mailto:jb@FreeBSD.org>`__

?ltimas noticias
~~~~~~~~~~~~~~~~

-  **13 de noviembre de 2006**: La gesti?n de tiempo/fecha del sistema
   est? terminada.

-  **12 de noviembre de 2006**: La primer im?gen ISO de instalaci?n y CD
   "live" est? lista para su uso:
   `7.0-20061112-SNAP-sun4v-disc1.iso.bz2 <http://people.freebsd.org/~jb/sun4v/7.0-20061112-SNAP-sun4v-disc1.iso.bz2>`__.

   Ver? errores de "timeout" de acd0 durante el arranque. Estos errores
   se corregir?n en versiones posteriores. De momento tendr? que tener
   paciencia.

   Si quiere usar el CD "live" seleccione "Fixit" en el men?. Tenga en
   cuenta que al ser una instant?nea recibir? un aviso de que la
   etiqueta no coincide con 7.0-CURRENT.

Lista de hardware
~~~~~~~~~~~~~~~~~

A continuaci?n ver? una lista de sistemas soportados. SMP funciona en
todos los sistemas soportados.

-  `Servidor Sun Fire
   T1000 <http://www.sun.com/servers/coolthreads/t1000/>`__
-  `Servidor T2000 <http://www.sun.com/servers/coolthreads/t2000/>`__

Tareas pendientes
~~~~~~~~~~~~~~~~~

-  Las interrupciones del balanceo de carga entre procesadores
-  Soporte para puerto serie
-  Hay que implementar el reinicio del sistema y la salida a OFW (usar
   sc para reiniciar)

Enlaces de inter?s
~~~~~~~~~~~~~~~~~~

-  `Documentaci?n del procesador
   UltraSPARC <http://www.sun.com/processors/documentation.html>`__
-  `Sitio web de OpenSPARC <http://www.opensparc.net/>`__

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
