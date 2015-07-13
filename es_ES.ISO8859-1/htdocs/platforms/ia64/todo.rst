=====================
Proyecto FreeBSD/ia64
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

-  `Donaciones <../../../donations/>`__
-  `Contactar <../../mailto.html>`__

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

-  `Inicio <../../>`__
-  `Sobre <../../about.html>`__
-  `Descargar <../../where.html>`__
-  `Documentaci?n <../../docs.html>`__
-  `Comunidad <../../community.html>`__
-  `Desarrollo <../../projects/index.html>`__
-  `Soporte <../../support.html>`__
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

-  `Desarrollo <../../projects/index.html>`__
-  `Manual del
   desarrollador <../../../doc/en_US.ISO8859-1/books/developers-handbook>`__
-  `Manual del
   porter <../../../doc/en_US.ISO8859-1/books/porters-handbook>`__
-  `Repositorio CVS <../../../developers/cvs.html>`__
-  `Ingenier?a de releases <../../../releng/index.html>`__
-  `Arquitecturas <../../platforms/>`__
-  `Ideas de proyectos <../../../projects/ideas/>`__
-  `Contribuir a
   FreeBSD <../../../doc/es_ES.ISO8859-1/articles/contributing/index.html>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div id="contentwrap">

Proyecto FreeBSD/ia64
=====================

|Montecito die|
B?squedas en la base de datos de PR de FreeBSD/ia64:

Tareas pendientes
~~~~~~~~~~~~~~~~~

Esta p?gina intenta ser un punto de partida para quienes est?n buscando
alguna tarea pendiente en la que puedan ayudar. El orden de la lista que
se muestra no implica necesariamente un orden de prioridad, aunque puede
ayudar. Hay una gran cantidad de tareas que no se mencionan aqu? pero
que habr? que cumplir de todas maneras. Un ejemplo de esto es el
mantenimiento de las p?ginas web del port ia64... para nuestro bochorno.

Convertir ia64 en una plataforma ia64
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Con dos releases como plataforma Tier 2 a nuestras espaldas va llegando
la hora de dirigir nuestros esfuerzos a convertirla en plataforma Tier
1. Esto implica tareas tan diversas como estas:

-  Mejorar el proceso de instalaci?n para que tenga en cuenta que haya
   un GPT con una partici?n EFI, por ejemplo cuando hay otros sistemas
   operativos. El poder a?adir una entrada para FreeBSD al men? de
   arranque EFI tambi?n estar?a muy bien.
-  Portar el debugger GNU. Se echa mucho a faltar en una m?quina de
   desarrollo y es un requisito imprescindible en plataformas Tier 1.
-  Portar el servidor X (ports/x11/XFree86-4-Server). Lo cierto es que
   no es imprescindible para alcanzar el est?tus de Tier 1, pero no
   ser?a muy razonable esperar llegar a ?l si es imposible usar ia64
   como sistema de escritorio.

Ports y "packages"
^^^^^^^^^^^^^^^^^^

Un factor muy importante para garantizar el ?xito de FreeBSD en ia64 es
el poder garantizar que los usuarios podr?n ejecutar algo m?s que ls(1)
en sus sistemas. Nuestra gigantesca colecci?n de ports ha estado
enfocada principalmente en ia32, por lo que no es sorprendente que haya
muchos ports que no compilan o no funcionan en ia64. En `esta
web <http://pointyhat.FreeBSD.org/errorlogs/ia64-6-latest/>`__ ver? la
lista m?s actualizada de ports que no llegan a compilar por una raz?n o
por otra. Tenga en cuenta que si un port depende de uno o m?s ports que
fallan esos ports no compilan y no se cuentan. Trabajar en esos ports
que tienen muchos otros ports dependiendo de ellos es una excelente
elecci?n si quiere ayudar de verdad (Consulte la columna "Aff.").

Limpiar y dar esplendor
^^^^^^^^^^^^^^^^^^^^^^^

Hay una gran cantidad de funciones (especialmente rutinas en
ensamblador) que se han ido escribiendo para agregar funcionalidades que
no estaban antes sin tener en cuenta la velocidad, la robustez o ambas.
La revisi?n de dichas funciones y su sustituci?n si fuera necesario es
una tarea muy necesaria que puede hacerse de forma concurrente e
independiente de otras actividades y que adem?s no implica
necesariamente que haya que tener much?sima experiencia o conocimientos.

Desarrollo del "core"
^^^^^^^^^^^^^^^^^^^^^

Adem?s de las cosas a alto nivel que no funcionan o no existen hay
tambi?n pendientes trabajos de reescritura en el n?cleo mismo del
sistema y que podr?an incluso afectar a otras plataformas. Veamos
algunos ejemplos:

-  Mejorar la estabilidad en monoprocesador y multiprocesador
   reescribiendo el m?dulo PMAP. La gesti?n a bajo nivel de las
   direcciones de memoria virtual necesita mejorarse. Esto implica
   optimizaci?n y rendimiento.
-  Hay controladores de dispositivos b?sicos como sio(4) y syscons(4)
   que no funcionan en m?quinas ia64 que no tengan soporte para
   dispositivos antiguos. Este es un problema bastante grande porque
   afecta a todas las plataformas y es posible que requiera reescribir
   (una gran) parte de ciertos subsistemas. Evidentemente una tarea as?
   requiere un consenso un?nime y mucha coordinaci?n.
-  Una mejor gesti?n de las configuraciones de memoria (f?sica) evitando
   crear tablas de memoria virtual que ocupe todo el espacio de
   direcciones y aprovechando la memoria presente. A causa de este
   problema ahora mismo estamos obligados a ignorar memoria.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div id="footer">

`Mapa del sitio <../../search/index-site.html>`__ \| `Noticias del
Copyright <../../copyright/>`__ \| ? 1995-2010 El Proyecto FreeBSD.
Quedan reservados todos los derechos.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. |FreeBSD| image:: ../../../layout/images/logo-red.png
   :target: ../..
.. |Montecito die| image:: montecito-die.png
