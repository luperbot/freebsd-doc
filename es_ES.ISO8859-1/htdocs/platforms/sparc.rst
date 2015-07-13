========================
Proyecto FreeBSD/sparc64
========================

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

Proyecto FreeBSD/sparc64
========================

Introducci?n
~~~~~~~~~~~~

Esta p?gina contiene informaci?n sobre el port de FreeBSD para la
arquitect?ra UltraSPARC? de Sun Microsystem. UltraSPARC es una
arquitect?ra de categor?a `Tier
1 <../doc/en_US.ISO8859-1/articles/committers-guide/archs.html>`__, as?
que est? soportada completamente por el `Proyecto FreeBSD <..>`__,
aunque el port no es tan maduro como los ports de i386 o amd64. El
intercambio de informaci?n sobre el port UltraSPARC tiene lugar en la
lista
`freebsd-sparc <http://lists.freebsd.org/mailman/listinfo/freebsd-sparc64>`__.

Contenidos
~~~~~~~~~~

-  `Cr?ditos <#who>`__
-  `?ltimas noticias <#news>`__
-  `Lista de hardware <#hw>`__
-  `Tareas pendientes <#todo>`__
-  `Enlaces de inter?s <#links>`__

Cr?ditos
~~~~~~~~

Las siguientes personas han trabajado en mayor o menor medida para que
el port funcione:

-  `Jake Burkholder <mailto:jake@FreeBSD.org>`__
-  `Thomas M?stl <mailto:tmm@FreeBSD.org>`__
-  `David O'Brien <mailto:obrien@FreeBSD.org>`__

?ltimas noticias
~~~~~~~~~~~~~~~~

-  **25 de octubre de 2004**: El controlador de sonido CS4231 ha sido
   portado desde `OpenBSD <http://www.OpenBSD.org/>`__, as? que las
   "workstation" SBus con hardware de sonido (Ultra 1E, Ultra 2) tienen
   soporte de sonido.

-  **9 de octubre de 2004**: El controlador auxio ha sido portado desde
   `NetBSD <http://www.NetBSD.org/>`__.

-  **10 de junio de 2004**: El controlador esp ha sido importado de
   `NetBSD <http://www.NetBSD.org/>`__, as? que las m?quinas del tipo
   Ultra iE y Ultra 2 ya tienen soporte de SCSI.

-  **18 de enero de 2003**: El controlador if\_xl ya est?
   `soportado <http://docs.FreeBSD.org/cgi/mid.cgi?200301190023.h0J0Nx0N068255>`__
   en -CURRENT.

-  **10 de diciembre de 2002 2002**: Los snapshot cotidianos de
   5.0-CURRENT est?n accesibles en
   `ftp2.FreeBSD.org <ftp://ftp2.FreeBSD.org/pub/FreeBSD/snapshots/sparc64>`__.

Lista de hardware
~~~~~~~~~~~~~~~~~

A continuaci?n ver? una lista de sistemas soportados. SMP funciona en
todos los sistemas soportados que contengan m?s de un procesador. Si
quiere todos los detalles puede visitar las `noticias de la
release <../releases/10.1R/hardware-sparc64.html>`__ de la
`release <../releases/>`__ que use.

-  Blade 100
-  Blade 150
-  Enterprise 220R
-  Enterprise 250
-  Enterprise 420R
-  Enterprise 450
-  Fire V100
-  Fire V120
-  Netra™ T1 105
-  Netra T1 AC200/DC200
-  Netra t 1100
-  Netra t 1120
-  Netra t 1125
-  Netra t 1400/1405
-  Netra 120
-  Netra X1
-  SPARCEngine? Ultra Axi
-  SPARCEngine Ultra AXmp
-  Ultra 1E
-  Ultra 2
-  Ultra™ 5
-  Ultra 10
-  Ultra 30
-  Ultra 60
-  Ultra 80

Los sistemas listados a continuaci?n est?n soportados pero s?lamente
arrancan por red ("netboot") debido a que la controladora SCSI de la
placa no est? soportada. Es posible que estos sistemas funcionen con el
controlador esp importado de `NetBSD <http://www.NetBSD.org>`__.

-  Enterprise 3500
-  Enterprise 4500

Los sistemas siguientes no est?n soportados.

-  Cualquier sistema con un procesador UltraSPARC III o posterior
-  Ultra 1

Cualquier sistema que no aparezca en la lista y no tenga un procesador
UltraSPARC III o superior deber?a funcionar, pero no ha sido probado. Si
tiene un sistema que no aparezca en la lista, por favor, pru?belo y
`h?ganos saber <mailto:freebsd-sparc@FreeBSD.org>`__ el resultado.

Tareas pendientes
~~~~~~~~~~~~~~~~~

-  Actualizar esta p?gina con m?s frecuencia

Enlaces del inter?s
~~~~~~~~~~~~~~~~~~~

-  `Manual para usuarios de procesadores
   UltraSPARC <http://www.sun.com/processors/manuals/>`__
-  `Documentos del est?ndar
   SPARC <http://www.sparc.org/standards.html>`__
-  `NetBSD/sparc64 <http://www.netbsd.org/Ports/sparc64/>`__
-  `OpenBSD/sparc64 <http://www.openbsd.org/sparc64.html>`__

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
