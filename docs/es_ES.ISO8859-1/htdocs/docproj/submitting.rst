============================================================
Proyecto de Documentaci?n de FreeBSD: Enviando Documentaci?n
============================================================

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

Proyecto de Documentaci?n de FreeBSD: Enviando Documentaci?n
============================================================

He escrito algunos documentos, como los env?o?
----------------------------------------------

Ante todo, gracias por ocupar tu tiempo en hacerlo.

Tendr?as que poner los documentos disponibles para ser revisados . Si
puedes ponlos en un espacio FTP o Web. Si no tienes espacio propio,
env?alos a ftp://ftp.FreeBSD.ORG/pub/FreeBSD/incoming/, y usa
**send-pr** para comunicar a los "committers" que est? disponible.

A continuaci?n env?a un mensaje a la lista de distribuci?n freebsd-doc,
con una breve descripci?n y su localizaci?n. Pide opiniones.

Tambi?n deber?as enviar una copia del mensaje a otras listas
relacionadas. Por ejemplo, algo relativo al uso de CVSup para mantener
actualizado el c?digo fuente, tambi?n ser?a de inter?s para los
subscriptores de las listas ``FreeBSD-current`` y ``FreeBSD-stable``.

Una vez la gente haya visto tu documento y hayas podido incorporar las
posibles sugerencias que te hayan hecho, est?s preparado para enviarlo.

Para hacerlo, compacta el/los documentos en un fichero tar. Si tu
documentaci?n consta de 3 ficheros, ``uno``, ``dos`` y ``tres``, y
quieres compactarlos en el fichero ``doc.tar``, haz

::

        % tar cf doc.tar one two three
        

Una vez hecho, comprime el fichero tar,

::

        % gzip -9 doc.tar
        

creando el fichero ``doc.tar.gz``.

A continuaci?n env?a el fichero ``doc.tar.gz`` ( obviamente, ponle un
nombre m?s indicativo del contenido pero siempre manteniendo la
extensi?n ``tar.gz``) a ``ftp.freebsd.org``, en el directorio
``/pub/FreeBSD/incoming/``.

Ahora tienes que comunicar al proyecto de documentaci?n la existencia
del fichero. La manera correcta de hacerlo es usar un comando llamado
**send-pr**, el cual deber?a estar instalado en tu m?quina.

Tienes que hacer esto para que tu env?o pueda ser controlado. Cuando
env?as un PR (Problem Report) se le asigna un n?mero ?nico. As? uno de
los committers puede asignarse el PR, y ponerse de acuerdo contigo para
hacer el env?o final.

Make sure the "Category" is set to "docs" and that the "Class" is set to
one of "change-request". And do not forget to include the name of the
file that you uploaded, so that the committers can find it!

Aseg?rate que el campo "Category" tiene como valor "docs" y que el campo
"Class" est? en "change-request". No te olvides de incluir el nombre del
fichero que has enviado, para que el committer pueda encontrarlo.

Cuando sales del editor, ser? enviado un mensaje de PR al lugar
correcto. En un corto periodo de tiempo recibir?s un mensaje de
notificaci?n indicandote el n?mero de PR asignado, pudiendo usar este
n?mero para hacer el seguimiento del estado en que se encuentra.

Alternativamente, puedes usar un interface web en
http://www.freebsd.org/send-pr.html.

He hecho algunos cambios a documentaci?n ya existente. Como la env?o?
---------------------------------------------------------------------

De nuevo, gracias por ocuparte de ello.

Lo primero que tienes que hacer es crear un fichero especial llamado
*diff*. Este fichero mostrar? ?nica y exclusivamente las modificaciones
realizadas sobre la documentaci?n original.

Para hacer un "diff" tienes que;

#. Hacer una copia del fichero que vas a modificar. Si est?s cambiando
   el fichero ``foo.xml``, haz

   ::

           % cp foo.xml foo.xml.old
           

#. Entonces, haz los cambios en el fichero foo.xml

   ::

           % vi foo.xml
           ... tap tap tap ...

           ... testea los cambios, leelos y revisalos...
           

#. Haz el diff. El comando para hacerlo es

   ::

           % diff -c foo.xml.old foo.xml > foo.diff
           

   Este comando buscar? las diferencias entre los dis ficheros
   escribiendolas en el fichero ``foo.diff``.

Ya puedes enviar el fichero ``foo.diff`` al proyecto.

Tambi?n puedes enviar el fichero ``foo.diff`` a `ftp://ftp.FreeBSD.ORG
/pub/FreeBSD/incoming/ <ftp://ftp.FreeBSD.ORG/pub/FreeBSD/incoming/>`__
o, si es muy pque?o, incluir el diff directamente en el PR, en la
secci?n "Fix:"

De cualquier manera, usar?s el comando **send-pr** para hacer saber a
los "committers" que se han producido modificaciones. Aseg?rate que el
campo "Category" contiene "docs" y que el campo "Class" es "doc-bug" (si
tu cambio modifica alg?n error ya existente) o "change-request" (si
est?s a?adiendo nueva informaci?n a una secci?n ya existente).

`FreeBSD Documentation Project Home <docproj.html>`__

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
