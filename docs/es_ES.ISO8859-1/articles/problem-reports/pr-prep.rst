===============
3. Preparativos
===============

.. raw:: html

   <div class="navheader">

3. Preparativos
`Anterior <pr-when.html>`__?
?
?\ `Siguiente <pr-writing.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="section">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3. Preparativos
---------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Una buena regla que se puede seguir consiste en realizar siempre una
b?squeda antes de enviar un informe de problemas. Quiz? nuestro problema
ya ha sido reportado; quiz? se est? discutiendo en las listas de
distribuci?n o fue discutido hace poco; incluso es posible que se haya
arreglado en versiones m?s recientes del software. Por lo tanto, se
deben consultar los sitios y fuentes m?s obvias antes de proceder con el
env?o del informe de errores. En FreeBSD esto significa:

.. raw:: html

   <div class="itemizedlist">

-  Las `Preguntas M?s
   Frecuentes <http://www.freebsd.org/doc/en/books/faq/index.html>`__
   (FAQ) de FreeBSD. Las FAQ intentan proporcionar respuestas para un
   amplio rango de dudas, tales como aquellas relacionadas con las
   `compatibilidades
   hardware <http://www.freebsd.org/doc/en/books/faq/hardware.html>`__,
   las `aplicaciones de
   usuario <http://www.freebsd.org/doc/en/books/faq/applications.html>`__
   y la `configuraci?n del
   kernel <http://www.freebsd.org/doc/en/books/faq/kernelconfig.html>`__.

-  Las `listas de
   correo <http://www.freebsd.org/doc/en/books/handbook/eresources.html#ERESOURCES-MAIL>`__.
   Si no est? subscrito utilice `la b?squeda en los
   archivos <http://www.FreeBSD.org/search/search.html#mailinglists>`__
   del sitio web de FreeBSD. Si el problema no se ha discutido con
   anterioridad en las listas, se puede intentar enviar un mensaje y
   esperar unos pocos d?as para ver si alguien puede aconsejarle
   adecuadamente sobre alg?n punto que quiz? haya pasado por alto en
   relaci?n con el problema.

-  Opcionalmente, la web entera—utilice su motor de b?squeda favorito
   para localizar cualquier referencia a su problema. Incluso pueden
   aparecer listas de correo o grupos de noticias de los cuales ni
   siquiera tuviera conocimiento de su existencia o quiz? no consider?
   apropiado consultarlas al principio.

-  A continuaci?n, la b?squeda a trav?s de `la base de datos FreeBSD
   PR <http://www.FreeBSD.org/cgi/query-pr-summary.cgi?query>`__
   (GNATS). A menos que nuestro problema sea muy reciente o rebuscado,
   existe un gran n?mero de posibilidades de que ya haya sido informado
   o reportado.

-  Lo m?s importante, se deber?a intentar comprobar si la documentaci?n
   existente en el c?digo fuente del programa puede resolver el
   problema.

   En el caso de las fuentes del sistema FreeBSD debe estudiarse
   cuidadosamente el contenido del fichero ``/usr/src/UPDATING`` del
   sistema o su ?ltima versi?n, que se encuentra en
   ``http://www.FreeBSD.org/cgi/cvsweb.cgi/src/UPDATING``. (Esta
   informaci?n se considera de vital importancia si se est? actualizando
   de una versi?n a otra, especialmente si la actualizaci?n se realiza
   de la versi?n estable a la versi?n FreeBSD-CURRENT).

   No obstante, si el problema se encuentra en algo que se instal? como
   parte de la collecci?n de ports de FreeBSD, se debe consultar el
   archivo ``/usr/ports/UPDATING`` (para ports individuales) o el
   archivo ``/usr/ports/CHANGES`` (para cambios que afectan a la
   colecci?n de ports completa).
   ``http://www.FreeBSD.org/cgi/cvsweb.cgi/ports/UPDATING`` y
   ``http://www.FreeBSD.org/cgi/cvsweb.cgi/ports/CHANGES`` tambi?n se
   encuentran disponibles a trav?s de CVSweb.

.. raw:: html

   </div>

A continuaci?n debemos asegurarnos de que el informe de errores llega a
las personas adecuadas.

La primera consideraci?n llegados a este punto consiste en: Si el
problema resulta ser un bug en un software de terceras partes (un port o
un paquete que se ha instalado) se debe informar sobre el bug al autor
original del software, no al proyecto FreeBSD. Existen dos excepciones a
esta regla: la primera ocurre cuando el bug no se produce en otras
plataformas, en cuyo caso el problema puede residir en c?mo fue migrado
el software a FreeBSD; la segunda excepci?n ocurre cuando el autor
original ya ha corregido el problema y distribuido un parche o una nueva
versi?n de su software, pero el port de FreeBSD todav?a no se ha
actualizado.

La segunda consideraci?n es que el sistema de seguimiento de bugs de
FreeBSD ordena los informes de problemas de acuerdo con la categor?a que
ha seleccionado el informador. De este modo, si se selecciona una
categor?a incorrecta cuando se env?a el informe de problemas, existe una
gran probabilidad de que nadie se de cuenta de su existencia durante un
per?odo de tiempo indefinido, hasta que alguien se encarge de
re-categorizarlo.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------------+---------------------------+----------------------------------------+
| `Anterior <pr-when.html>`__?              | ?                         | ?\ `Siguiente <pr-writing.html>`__     |
+-------------------------------------------+---------------------------+----------------------------------------+
| 2. Cu?ndo enviar informes de problemas?   | `Inicio <index.html>`__   | ?4. Escribir el informe de problemas   |
+-------------------------------------------+---------------------------+----------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
