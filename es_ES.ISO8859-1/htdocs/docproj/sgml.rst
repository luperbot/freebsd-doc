==========================================
Proyecto de Documentaci?n de FreeBSD: SGML
==========================================

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

Proyecto de Documentaci?n de FreeBSD: SGML
==========================================

El proyecto de Documentaci?n usa SGML como m?todo est?ndar de
representar la documentaci?n.

El nombre SGML viene de **S**\ tandard **G**\ eneralised **M**\ arkup
**L**\ anguage, que podr?a traducirse como "lenguaje de etiquetado
est?ndar de prop?sito general".

Brevemente (y disculpas para los puristas de SGML que puedan sentirse
ofendidos) SGML es un lenguaje para escribir otros lenguajes.

Probablemente ya haya usado SGML sin saberlo. HTML, el lenguaje en el
que se escriben las p?ginas web, tiene una descripci?n formal. Esta
descripci?n se escribi? en SGML. Cuando escribe en HTML **no** est?
escribiendo SGML pero s? que est? usando un lenguaje definido por SGML.

Existen muchos, muchos lenguajes "markup" que est?n definidos usando
SGML. HTML es uno de ellos. Otro es el llamado "DocBook". ?ste es un
lenguaje dise?ado espec?ficamente para escribir documentaci?n t?cnica y
tiene muchas etiquetas o "tags", (por ejemplo ``<tag?contenido>``).
FreeBSD lo adopt? y definid? nuevos elementos para hacerlo m?s preciso.

Por ejemplo, as? se escribir?a un breve p?rrafo en HTML (no se preocupe
del contenido, solo f?jese en las etiquetas):

::

        <p>The system's passwords are stored in <tt>/etc/passwd</tt>. To edit
          this file you should use <b><tt>vipw</tt></b>. However, if you just
          want to add a new user you can use <b><tt>adduser</tt></b>.</p>

El mismo p?rrafo en DocBook ser?a:

::

        <para>The system's passwords are stored in
          <filename>/etc/passwd</filename>. To edit this file you should use
          <command>vipw</command>. However, if you just want to add a new user
          you can use <command>adduser</command>.</para>

Como puede ver DocBook es mucho m?s expresivo que HTML. En el ejemplo
HTML el nombre del fichero se muestra con un tipo de letra de m?quina de
escribir. En el ejemplo de DocBook, el nombre de fichero lleva la
etiqueta "filename" (nombre de fichero); la representaci?n de un nombre
de fichero no est? descrita.

Esta mayor expresividad tiene grandes ventajas:

-  No es ambiguo o inconsistente.

   No se pierde tiempo pensando "?Hmm, necesito mostrar un nombre de
   fichero, ?deber?a usar "tt", o "b", o "em"?

   En lugar de eso, use la etiqueta correcta para lo que quiera hacer.

   El proceso de conversi?n de DocBook a otros formatos como HTML o
   Postscript garantiza que la presentaci?n de todos ellos ser? la
   misma.

-  Dejar de pensar en c?mo representar la documentaci?n y concentrarse
   solamente en el contenido.

-  Como la documentaci?n no est? pensada para un determinado formato de
   salida la misma documentaci?n puede crearse en diferentes formatos:
   texto, HTML, Postscript, RTF, PDF, etc.

-  La documentaci?n es m?s "inteligente", lo que permite hacer cosas m?s
   inteligentes con ella. Por ejemplo, es posible crear un ?ndice
   autom?tico que liste cada comando mostrado en la documentaci?n.

   .

Si est? familiarizado con ellos es como las galer?as de estilo de
Microsoft Word, s?lo que infinitamente m?s potente.

Por supuesto, esta potencia tiene un precio:

-  Al existir un mayor n?mero de etiquetas el aprendizaje es m?s largo y
   cuesta m?s trabajo aprender a usarlas.

   La mejor manera de aprender es leer los fuentes de otros documentos
   para ver c?mo representaron informaci?n similar otros autores.

-  El proceso de conversi?n no es tan simple.

?Qu? pasa si no sabe DocBook? ?Todav?a puedo ayudar?
----------------------------------------------------

S?, por supuesto. Un poco de documentaci?n es mejor que no tener nada.
Si tiene documentaci?n con la que contribuir y no est? en formato
DocBook no se preocupe.

`Env?e <submitting.html>`__ la documentaci?n de la manera habitual.
Alg?n miembro del proyecto recoger? los documentos que env?e y trabajar?
en ellos. Con un poco de suerte le enviar?n una copia ya etiquetada en
DocBook. As? podr? comparar el documento original con el que reciba y
podr? ir aprendiendo a hacerlo usted mismo.

Obviamente esto retrasa el que la documentaci?n est? online porque su
documento requiere un trabajo adicional. Esto puede suponer unas horas o
unos d?as pero de cualquier modo llegar? a su destino.

? Necesita m? informaci?n sobre SGML y DocBook?
-----------------------------------------------

Lo primero que deber? leer es el `**Documentation Project
Primer** <../../doc/en_US.ISO8859-1/books/fdp-primer/index.html>`__. Es
una extensa explicaci?n de todo lo que necesita saber para poder
trabajar con la documentaci?n de FreeBSD. Es un documento largo,
dividido en m?ltiples p?ginas diferentes de peque?o tama?o. Tambi?n
puede verlo en formato de `**un sola
p?gina** <../../doc/en_US.ISO8859-1/books/fdp-primer/book.html>`__.

`**http://www.oasis-open.org/cover/sgml-xml.html** <http://www.oasis-open.org/cover/sgml-xml.html>`__
    La web de SGML/XML. Incluye m?s recursos sobre SGML.

`**http://www-sul.stanford.edu/tools/tutorials/html2.0/gentle.html** <http://www-sul.stanford.edu/tools/tutorials/html2.0/gentle.html>`__
    El "Gentle Introduction to SGML". De recomendada lectura para
    cualquiera que desee tener conocimientos avanzados de SGML.

`**http://www.oasis-open.org/docbook/** <http://www.oasis-open.org/docbook/>`__
    OASIS mantiene el DTD DocBook. Estas p?ginas est?n pensadas para
    usuarios con bastante experiencia con SGML y quieren aprender
    DocBook.

`Inicio del Proyecto de Documentaci?n de FreeBSD <docproj.html>`__

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
