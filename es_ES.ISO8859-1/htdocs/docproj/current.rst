========================================================
Proyecto de Documentaci?n de FreeBSD: Proyectos Actuales
========================================================

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

Proyecto de Documentaci?n de FreeBSD: Proyectos Actuales
========================================================

Estos son los proyectos en curso (o sobre los que se est? trabajando en
la lista freebsd-doc).

Si piensa que puede ayudar en cualquier de ellos, por favor, no dude en
hacerlo. Hable con la persona responsable, que le pondr? al d?a con la
marcha del proyecto. Si tiene ideas sobre un nuevo proyecto, por favor,
env?elas a FreeBSD-doc@FreeBSD.org.

-  `Lista TODO (tareas pendientes) de documentaci?n <#todo>`__
-  `Informes de problemas abiertos sobre la documentaci? <#pr>`__
-  `Enviar presentaciones <#slides>`__
-  `FreeBSD para usuarios de Linux <#freebsd4linux>`__
-  `Escribir una secci?n del Handbook y/o las FAQ <#handbooksection>`__
-  `Escribir nuevos documentos <#newpapers>`__
-  `Scripts CGI <#cgiscripts>`__
-  `Web scripts multil?ng?es <#multilingualwebscripts>`__
-  `Traducciones de la documentaci?n de FreeBSD <#translations>`__
-  `Mejoras en el motor de b?squedas <#search-enhancements>`__

Lista TODO de documentaci?n
~~~~~~~~~~~~~~~~~~~~~~~~~~~

La lista `TODO <todo.html>`__ de documentaci?n es una lista actualizada
de los problemas de la documentaci?n que est?n por solucionarse. Dicha
lista se env?a cada mes a la lista de correo FreeBSD-doc@FreeBSD.org. Si
quiere ayudarnos a mejorar la documentaci?n de FreeBSD puede elegir por
d?nde empezar por la lista TODO.

Informes de problemas abiertos de la documentaci?n
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Los informes de problemas que hay abiertos est?n en la base de datos
GNATS.

**Responsable:** Annelise Anderson <andrsn@andrsn.stanford.edu>
`Aqu? <http://www.FreeBSD.org/cgi/query-pr-summary.cgi?category=docs&responsible=.>`__
puede verlos.

Mejoras en el ?ndice del Handbook
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**Responsable:** FreeBSD-doc <FreeBSD-doc@FreeBSD.org\ >

**Sinopsis:** Muchas nuevas secciones se a?adieron al Handbook de
FreeBSD sin la correspondiente entrada en el ?ndice, otras se a?adieron
con etiquetas indexterm primarias o secundarias que no se adaptan al
esquema actual. Algunos t?rminos se a?adieron dentro de listas u otras
?reas, cosa que no permite nuestra hoja de estilo, con lo que en el
?ndice aparece ``???`` en vez del n?mero de la p?gina.

El trabajo en el ?ndice requiere experiencia previa; quien quiera hacer
modificaciones en ?l deber?a leer atentamente el ?ndice existente
(print-output) y el Chicago Manual of Style u otro libro que trate sobre
?ndices. Por favor, consulte en el hist?rico del CVS sobre los errores
ya corregidos de los ficheros chapter.xml y el ?ndice. Es imprescindible
revisar la versi?n PostScript del Handbook despu?s de hacer cualquier
cambio en "indexterm"; palabras demasiado largas o "indexterms"
demasiado anidados pueden destruir la salida en dos columnas o hacer
aparecer el n?mero de p?gina como ``???``.

Puede usar el "script" ``doc/share/misc/indexreport.pl`` para encontrar
las ocasiones en las que <indexterms> est? en un sitio incorrecto en un
fichero SGML.

Enviar presentaciones
~~~~~~~~~~~~~~~~~~~~~

**Responsable:** FreeBSD-doc <FreeBSD-doc@FreeBSD.org\ >, Murray Stokely
<murray@FreeBSD.org\ >

**Sinopsis:** Las presentaciones hechas mediante la DTD DocBook-slides
se han a?adido recientemente a la documentaci?n; est?n en
``doc/en_US.ISO8859-1/slides``. Hace falta m?s material para usar en
charlas y conferencias. Tambi?n es necesario trabajar m?s en hojas de
estilo para integrar contenidos de las noticias de releases as? como
otros contenidos XML a nuestra documentaci?n. De este modo ser? m?s
f?cil generar presentaciones totalmente actualizadas con un simple
'make'. Un ejemplo simple de presentaci?n con algunas de estas
caracter?sticas ya est? en el CVS pero hay que hacer m?s. Adem?s de
esto, las hojas de estilo de la salida print/PDF (mediante procesadores
XSLT basados en Java, PassiveTeX se queda corto para hacer
presentaciones de calidad) se deber?an mejorar tambi?n ya que las hojas
de estilo XSL-FO generan presentaciones muy espartanas.

FreeBSD para usuarios de Linux
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**Responsable:** FreeBSD-doc <FreeBSD-doc@FreeBSD.org\ >

**Sinopsis:** Los usuarios de FreeBSD provenientes de Linux pueden
confundirse gracias a algunas de las diferencias que hay entre los dos
sistemas (diferente shell por omisi?n, el funcionamiento de la
configuraci?n del arranque, etc).

Escribir una secci?n en las FAQ y/o Handbook
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**Responsable:** Ninguno

**Sinopsis:** Hay algunas partes de las FAQ y del Handbook que est?n
incompletas y esperando su aportaci?n. Si ha usado alguna parte de la
documentaci?n y cree que es complicada o insuficiente, por favor,
compl?tela con sus experiencias.

Si tuvo que hacer algo que no existe en las FAQ y/o el Handbook puede
escribir una nueva secci?n del documento. Env?elo como se explica m?s
arriba.

Escribir nuevos documentos
~~~~~~~~~~~~~~~~~~~~~~~~~~

Escribir nuevos Tutoriales
~~~~~~~~~~~~~~~~~~~~~~~~~~

El nuevo SCSI de FreeBSD (CAM)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

**Responsable:** <doc@FreeBSD.org\ >, <scsi@FreeBSD.org\ >

**Sinopsis:** Lea `The Design and Implementation of the FreeBSD SCSI
Subsystem <http://www.FreeBSD.org/~gibbs/>`__ como introducci?n.

Scripts CGI
~~~~~~~~~~~

**Responsable:** <doc@FreeBSD.org, Wolfram Schneider
<wosch@FreeBSD.org\ >

**Sinopsis:** Los scripts CGI url.cgi, ports.cgi, pds.cgi y el script de
portindex deben modificarse para que usen los m?dulos
`FreeBSD::Ports <http://people.FreeBSD.org/~tom/portpm/>`__ de Perl.
Estos m?dulos necesitan que se les hagan pruebas exhaustivas.

::

       xfig-3.2.2|/usr/ports/graphics/xfig|/usr/X11R6|A drawing program for X11|/usr/ports/graphics/xfig/pkg/DESCR|ports@FreeBSD.ORG|graphics x11|XFree86-3.3.2 Xaw3d-1.3 jpeg-6b xpm-3.4k|XFree86-3.3.2 Xaw3d-1.3 jpeg-6b netpbm-94.3.1 tiff-3.4 transfig-3.2 xpm-3.4k
            

Scripts web multil?ngues
~~~~~~~~~~~~~~~~~~~~~~~~

**Responsable:** <doc@FreeBSD.org\ >

**Sinopsis:** Nuestras p?ginas web est?n escritas en ingl?s (americano).
Los `Proyectos de Traducci?n de FreeBSD <translations.html>`__ traducen
el sitio web, el Handbook y las FAQ a otras lenguas.

Hay que traducir los scripts cgi del web y las herramientas de creaci?n
del web. Los scripts deber?n admitir el uso de distintos idiomas, no
s?lo uno. Muchos de estos scripts est?n escritos en Perl.

-  Unificar los scripts
   `www/en/ports/portindex <ftp://ftp.FreeBSD.org/pub/FreeBSD/FreeBSD-current/www/en/ports/portindex>`__
   y
   `www/ja/ports/portindex <ftp://ftp.FreeBSD.org/pub/FreeBSD/FreeBSD-current/www/ja/ports/portindex>`__
   en un s?lo script. A?adir una opci?n para la salida en ingl?s o
   japon?s.

Traducciones de la documentaci?n de FreeBSD
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**Responsable:** <doc@FreeBSD.org\ >

Traducir la documentaci?n de FreeBSD (Web, FAQ, Handbook, p?ginas man) a
otros idiomas. Consulte los detalles en `el proyecto de
traducciones <translations.html>`__.

Mejoras en el motor de b?squedas
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**Responsable:** <doc@FreeBSD.org\ >

Cuando realizamos una b?squeda en el web el resultado que obtenemos es
el nombre del fichero en el que se ha encontrado el resultado, algo como
``FAQ34.html``.

Ser?a mucho m?s ?til si los resultados incluyesen el texto en cuesti?n,
permitiendo al usuario ver la relevancia del resultado obtenido.

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
