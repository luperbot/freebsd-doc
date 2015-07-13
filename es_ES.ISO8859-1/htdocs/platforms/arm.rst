====================
Proyecto FreeBSD/ARM
====================

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

Proyecto FreeBSD/ARM
====================

FreeBSD/ARM es un port de FreeBSD que intenta ejecutarse en la
arquitectura ARM. El prop?sito del proyecto es que FreeBSD se ejecute en
la arquitectura y en el hardware que la acompa?a.

Noticias de hardware de FreeBSD/ARM
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Actualmente FreeBSD debe funcionar en placas Intel basadas en i80321 que
incluyen los dispositivos IQ31244 e IQ80321. El soporte es a?n muy
precario. De momento llega al procesador, el bus PCI-X, adaptadores de
Ethernet em(4), UART y herramientas temporizadores.

Hay soporte bastante limitado para el procesador StrongARM 1100, pero
s?lo hasta los l?mites de lo que Simics emula: CPU, UART y la hora.
Te?ricamente es posible arrancar en la placa Assabet que Simics emula;
no disponemos de informes de intentos con o sin ?xito.

Tareas pendientes
~~~~~~~~~~~~~~~~~

-  Debe a?adirse soporte SATA.
-  Otras herramientas, como watchdog, i2c y bu se deben portar de
   NetBSD.

Enlaces relacionados con FreeBSD/ARM
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-  `Una breve historia de
   ARM <http://tisu.mit.jyu.fi/embedded/TIE345/luentokalvot/Embedded_3_ARM.pdf>`__
-  `Proyecto NetBSD Arm/32 <http://www.netbsd.org/Ports/arm32/>`__

Breve gu? de instalaci?n
~~~~~~~~~~~~~~~~~~~~~~~~

Olivier Houchard (cognet@FreeBSD.org) escribi? una breve gu?a para
instalar del fuente actual de FreeBSD. Est? disponible
`aqu? <http://people.freebsd.org/~cognet/freebsd_arm.txt>`__.

Lista de correo de FreeBSD/ARM
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Para suscribirse a la lista env?e un correo a
``<freebsd-arm-subscribe@FreeBSD.org>`` o visite `la interfaz de
mailman <http://lists.FreeBSD.org/mailman/listinfo/freebsd-arm>`__.

Lo que dicen los m?sicos sobre FreeBSD/ARM
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Con FreeBSD/ARM puede usted disfrutar del silencio al ejecutar su
sistema (empotrado). Hay incluso una canci?n con el t?tulo "Enjoy The
Silence" de Depeche Mode:

::

    All I ever wanted
    All I ever needed
    Is here in my ARMs
    Words are very unnecessary
    They can only do harm

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
