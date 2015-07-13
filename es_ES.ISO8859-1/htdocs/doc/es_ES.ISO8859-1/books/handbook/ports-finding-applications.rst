================================
4.3. C?mo encontrar aplicaciones
================================

.. raw:: html

   <div class="navheader">

4.3. C?mo encontrar aplicaciones
`Anterior <ports-overview.html>`__?
Cap?tulo 4. Instalaci?n de aplicaciones: ?packages? y ports
?\ `Siguiente <packages-using.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="sect1">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.3. C?mo encontrar aplicaciones
--------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Antes de poder instalar cualquier software debe saber qu? es lo que
quiere instalar y c?mo se llama la aplicaci?n.

La lista de software disponible para FreeBSD crece constantemente.
Afortunadamente existen varias formas de localizar lo que busca:

.. raw:: html

   <div class="itemizedlist">

-  El sitio web de FreeBSD mantiene una lista (actualizada y que admite
   b?squedas) de todas las aplicaciones disponibles para FreeBSD en la
   direcci?n
   `http://www.FreeBSD.org/ports/ <http://www.freebsd.org/ports/index.html>`__.
   Esta base esta dividida en categor?as, y puede buscar por nombre (si
   lo sabe) o bien listar las aplicaciones disponibles en cierta
   categor?a.

-  

   Dan Langille mantiene FreshPorts en ``http://www.FreshPorts.org/``.
   FreshPorts verifica los cambios en las aplicaciones del ?rbol de
   ports, y le permite ?seguir? uno o m?s ports, sobre los que le
   enviar?n un correo cada vez que se actualicen.

-  

   Si no conoce el nombre de la aplicaci?n que desea pruebe a usar un
   sitio como FreshMeat (http://www.freshmeat.net/) para encontrar una
   aplicaci?n; despu?s consulte el sitio web de FreeBSD para ver si la
   aplicaci?n ha sido portada.

-  Si sabe el nombre exacto del port y solo necesita saber en qu?
   categoria est? puede usar
   `whereis(1) <http://www.FreeBSD.org/cgi/man.cgi?query=whereis&sektion=1>`__.
   Simplemente escriba ``whereis           fichero``, donde
   *``fichero``* es el programa que quiera instalar. Si est? en su
   sistema, le dir? d?nde est?:

   .. code:: screen

       # whereis lsof
       lsof: /usr/ports/sysutils/lsof

   Esto nos dice que ``lsof`` (una utilidad de sistema) est? en el
   directorio ``/usr/ports/sysutils/lsof``.

-  Otra forma de encontrar un port en particular es usando el mecanismo
   de b?squeda integrado en la colecci?n de ports. Para poder usar esta
   opci?n de b?squeda debe estar en el directorio ``/usr/ports``. Una
   vez en ese directorio ejecute
   ``make search         name=nombre-del-programa``, donde
   *``nombre-del-programa``* es el nombre del programa que desea
   encontrar. Por ejemplo, si busca ``lsof``:

   .. code:: screen

       # cd /usr/ports
       # make search name=lsof
       Port:   lsof-4.56.4
       Path:   /usr/ports/sysutils/lsof
       Info:   Lists information about open files (similar to fstat(1))
       Maint:  obrien@FreeBSD.org
       Index:  sysutils
       B-deps:
       R-deps: 

   Debe prestar especial atenci?n a la l?nea ?Path:?de la salida, porque
   es la que indica d?nde puede encontrar el port. El resto de
   informaci?n no se necesita para instalar el port.

   Si quiere hacer una b?squeda m?s a fondo utilice
   ``make        search key=cadena`` donde *``cadena``* es el t?rmino
   que busca. Podr? buscar nombres de ports, comentarios, descripciones
   y dependencias; tambi?n se puede usar para encontrar ports que tengan
   relaci?n con alg?n tema en particular si no conoce el nombre del
   programa que busca.

   En ambos casos la cadena de b?squeda no distingue entre may?sculas y
   min?sculas. Buscar ?LSOF? dar? los mismos resultados que buscar
   ?lsof?.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------------------+---------------------------+------------------------------------------+
| `Anterior <ports-overview.html>`__?               | `Subir <ports.html>`__    | ?\ `Siguiente <packages-using.html>`__   |
+---------------------------------------------------+---------------------------+------------------------------------------+
| 4.2. Aproximaci?n a la instalaci?n de software?   | `Inicio <index.html>`__   | ?4.4. Uso del sistema de packages        |
+---------------------------------------------------+---------------------------+------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
