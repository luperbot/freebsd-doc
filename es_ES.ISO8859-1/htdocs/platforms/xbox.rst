=====================
Proyecto FreeBSD/xbox
=====================

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

Proyecto FreeBSD/xbox
=====================

Introducci?n
~~~~~~~~~~~~

FreeBSD/xbox es un proyecto que pretende ejecutar FreeBSD en sistemas de
Xbox? de Microsoft?. `Rink Springer <mailto:rink@FreeBSD.org>`__ comenz?
este proyecto e hizo la mayor?a de los parches y el trabajo de
programaci?n. `Ed Schouten <mailto:ed@fxq.nl>`__ le ayud? revisando
parches y facilitando informaci?n sobre ciertas particularidades del
funcionamiento interno de Xbox.

Estado
~~~~~~

FreeBSD/xbox est? soportado en 6-STABLE y FreeBSD 7-CURRENT. Est?n
soportados los dispositivos Ethernet, "framebuffer", sonido y USB (por
ejemplo un teclado USB para la consola).

Se ha creado un disco combinado (de instalaci?n y "live" CD para
facilitar la
`instalaci?n <http://lists.freebsd.org/pipermail/freebsd-stable/2006-August/027894.html>`__
de FreeBSD/xbox. Puede encontrarlo
`aqu? <ftp://ftp.stack.nl/pub/freebsd-xbox/>`__.

Arranque del kernel de FreeBSD-CURRENT
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Para que arranque la versi?n del CVS de FreeBSD 7-CURRENT necesita una
versi?n actualizada de la BIOS Linux/xbox, llamada Cromwell (su kernel
dejar? de funcionar tras arrancarlo). Hay una versi?n de Cromwell con
UFS de FreeBSD (con el que podr? cargar un kernel directamente desde un
sistemas de ficheros UFS) en el ?rbol de ports, m?s concretamente en
disponible en el ports en /usr/ports/sysutils/cromwell; puede actualizar
la EEPROM mediante el port raincoat (/usr/ports/sysutils/raincoat)
siempre y cuando su Xbox sea de una versi?n anterior a la 1.6.

**Nota**: Diversos componentes de Xbox rechazan ciertos tipos de
soportes. Si experimenta cuelgues, "panics" o corrupciones durante la
instalaci?n pruebe con otro DVD/CD-ROM que sepa que funcione.

Instalaci?n en un disco duro
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Puede instalar usando el CD "live" pero tendr? que hacer todo a mano. Le
recomendamos que configure su disco en una m?quina FreeBSD/i386 y adapte
el fichero de configuraci?n /boot/xboxlinux.cfg a su gusto para que
Cromwell pueda determinar qu? kernel debe cargar.

Enlaces
~~~~~~~

-  `Proyecto Linux Xbox <http://www.xbox-linux.org/>`__
-  `Proyecto FreeBSD/xbox <http://www.xbox-bsd.nl/>`__

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
