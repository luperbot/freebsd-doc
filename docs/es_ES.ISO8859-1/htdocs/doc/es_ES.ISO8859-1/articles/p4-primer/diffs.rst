===========
10. “diffs”
===========

.. raw:: html

   <div class="navheader">

10. “diffs”
`Anterior <changes.html>`__?
?
?\ `Siguiente <add-rm-files.html>`__

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

10. “diffs”
-----------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Existen dos formas de generar “diffs” de ficheros en Perforce, bien
entre cambios locales que todav?a no se han entregado o bien entre dos
?rboles (o dentro de una misma rama) del “dep?sito”. Estos “diffs” se
generan mediante ?rdenes distintas, ``diff`` y ``diff2``:

.. raw:: html

   <div class="variablelist">

``p4 diff``
    Ese comando genera un “diff” entre los cambios locales y los cambios
    de ficheros en estado de edici?n. Los par?metros ``-du`` y ``-dc``
    permiten crear “diffs” unificados o contextuales, respectivamente.
    Tambi?n se puede establecer la variable ``P4DIFF`` para que apunte a
    un “diff” local. Le recomendamos encarecidamente usar esta orden
    para revisar sus cambios antes de aplicarlos en el servidor.

``p4 diff2``
    Esta orden crea un “diffs” entre ficheros dados en el “dep?sito”, o
    entre ficheros especificados en una especificaci?n de rama. La
    operaci?n tiene lugar en el servidor, as? que la variable ``P4DIFF``
    no surte ning?n efecto, aunque las opciones ``-du`` y ``-dc`` s?
    pueden usarse. Las dos formas de esta orden son:

    .. code:: screen

        % p4 diff2 -b nombrederama

    y

    .. code:: screen

        % p4 diff2 //depot/ruta1 //depot/ruta2

.. raw:: html

   </div>

En todos los casos los “diffs” se muestran en la salida est?ndar. Por
desgracia Perforce usa un formato de “diffs” que resulta ser ligeramente
incompatible con las herramientas Unix est?ndar ``diff`` y ``patch``. La
utilizaci?n de la variable ``P4DIFF`` para que apunte al verdadero
`diff(1) <http://www.FreeBSD.org/cgi/man.cgi?query=diff&sektion=1>`__
puede paliar este problema, o al menos en ciertos casos, puesto s?lo
funciona con la orden ``p4 diff``. La salida de ``diff2`` debe
procesarse para que sea de alguna utilidad (la opci?n ``-u`` de
``diff2`` producir? “diffs” unificados que ser?n *m?s o menos
compatibles*, pero no esto no incluye ficheros nuevos o borrados. Este
“script” puede serle de utilidad para este “proceso necesario”:
``http://people.freebsd.org/~scottl/awkdiff``.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------+---------------------------+----------------------------------------+
| `Anterior <changes.html>`__?             | ?                         | ?\ `Siguiente <add-rm-files.html>`__   |
+------------------------------------------+---------------------------+----------------------------------------+
| 9. Cambios, descripciones e historial?   | `Inicio <index.html>`__   | ?11. A?adir o eliminar ficheros        |
+------------------------------------------+---------------------------+----------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
