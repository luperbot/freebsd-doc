==================
La red FreeBSD.org
==================

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

La red FreeBSD.org
==================

Esta p?gina describe, para aquellos con cuentas de acceso en la red
FreeBSD.org, las m?quinas y recursos actualmente disponibles y el tipo
de tarea que realiza cada una de ellas.

Todos los nombres de m?quinas en el dominio FreeBSD.org
-------------------------------------------------------

+-------------+---------------+------------------------------------------+---------------------+
| M?quina     | S.O.          | Objetivo                                 | Administrador(es)   |
+=============+===============+==========================================+=====================+
| builder     | 4.0-current   | Creaci?n de packages -current            | Equipo de ports     |
+-------------+---------------+------------------------------------------+---------------------+
| beast       | 4.0-current   | M?quina Alpha para tests FreeBSD/alpha   | jkh                 |
+-------------+---------------+------------------------------------------+---------------------+
| bento       | 3.0-stable    | Creaci?n de packages 3.0-stable          | Equipo de ports     |
+-------------+---------------+------------------------------------------+---------------------+
| freefall    | 3-stable      | CVS master repository                    | committers          |
+-------------+---------------+------------------------------------------+---------------------+
| hub         | 3-stable      | Servicios Mail & WWW                     | post/webmaster      |
+-------------+---------------+------------------------------------------+---------------------+
| node82-89   | 3-stable      | Cluster creaci?n de ports                | Equipo de ports     |
+-------------+---------------+------------------------------------------+---------------------+

Configuraciones Hardware
------------------------

+-------------+-----------------+---------------------------------------------------------------------------------------------------------------------------------------------------------+
| M?quina     | Tipo            | Hardware                                                                                                                                                |
+=============+=================+=========================================================================================================================================================+
| builder     | Intel x86       | 400Mhz Pentium II, 128MB mem, NCR 53c875, 9GB IBM Disco SCSI, Winbond 100bTX NIC.                                                                       |
+-------------+-----------------+---------------------------------------------------------------------------------------------------------------------------------------------------------+
| beast       | Aspen Durango   | 500MHz 21164A en DEC PCI64 MB, 128MB mem, controladora NCR 53c875 SCSI , discos 2x4GB SCSI WIDE (uno NetBSD/alpha, uno FreeBSD/alpha), DEC 21140 NIC.   |
+-------------+-----------------+---------------------------------------------------------------------------------------------------------------------------------------------------------+
| bento       | Intel x86 MP    | 2x300MHz Pentium II, 128MB mem, controladora AHC 2940 PCI SCSI, discos 5x4GB SCSI WIDE, Intel EtherExpress Pro 10/100B NIC.                             |
+-------------+-----------------+---------------------------------------------------------------------------------------------------------------------------------------------------------+
| freefall    | Intel x86       | 400MHz Pentium II, 256MB mem, controladora AHA2940U2W PCI SCSI , discos 2x4GB SCSI WIDE y 3x9GB SCSI U2W, Intel EtherExpress Pro 10/100B NIC.           |
+-------------+-----------------+---------------------------------------------------------------------------------------------------------------------------------------------------------+
| hub         | Intel x86       | 400MHz Pentium II, 256MB mem, AHC 2940 PCI SCSI controller, 3x4GB SCSI WIDE drives, HP 6020i CDR, Intel EtherExpress Pro 10/100B NIC.                   |
+-------------+-----------------+---------------------------------------------------------------------------------------------------------------------------------------------------------+
| node82-89   | AMD x86         | 300MHz AMD K6/2, 64MB mem, disco 3GB IDE, Intel EtherExpress Pro 10/100B NIC.                                                                           |
+-------------+-----------------+---------------------------------------------------------------------------------------------------------------------------------------------------------+

Como regla general, todas las m?quinas est?n conectadas a 100Mbits a la
red FreeBSD (switch de 100Mbit), a no ser que por alguna raz?n
determinada, se deba conectar a 10Mbits.

Pol?ticas Administrativas
-------------------------

Si la m?quina en cuesti?n es administrada por alguna persona
determinada, por favor, preg?ntale primero a ellos sobre temas
administrativos, incluyendo cambios en las cuentas de usuario o en los
sistemas de ficheros.

Todas las nuevas cuentas deben ser aceptadas por el equipo de
administradores, admins@freebsd.org y solo se dan a desarrolladores de
FreeBSD, ya sea en la documentaci?n, ports o c?digo fuente del sistema.
La ?nica excepci?n a esta regla es la m?quina de pruebas
kickme.freebsd.org, para la cual se podr?n conceder cuentas de acceso a
desarrolladores no pertenecientes a FreeBSD, pero que requieran de
acceso a un sistema FreeBSD para temas verdaderamente experimentales o
muy espec?ficos. Las cuentas no son concedidas al "p?blico en general",
as? que por favor, no preguntes. Gracias.

| Jordan Hubbard
|  jkh@freebsd.org

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
