==============================
11. A?adir o eliminar ficheros
==============================

.. raw:: html

   <div class="navheader">

11. A?adir o eliminar ficheros
`Anterior <diffs.html>`__?
?
?\ `Siguiente <working-with-diffs.html>`__

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

11. A?adir o eliminar ficheros
------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

La integraci?n de una rama har? que se a?adan ficheros existentes en el
servidor en su ?rbol, pero quiz?s sea necesario a?adir nuevos ficheros o
eliminar alguno de los ya existentes. Para a?adir ficheros no tiene m?s
que crear el fichero y ejecutar ``p4 add`` de la siguiente forma:

.. code:: screen

    % p4 add nombredefichero

Si quiere a?adir un ?rbol completo de ficheros ejecute:

.. code:: screen

    % find . -type f |xargs p4 add

Al ejecutar ``p4 submit`` se copiar?n los ficheros al “dep?sito” del
servidor. Es muy importante a?adir s?lo ficheros y no directorios. Si se
a?ade expl?citamente un directorio, Perforce lo tratar? como fichero, lo
cual seguramente no es lo que usted ten?a previsto.

Borrar un fichero es igualmente sencillo mediante ``p4 delete``:

.. code:: screen

    % p4 delete nombredefichero

Esta orden marcar? el fichero para que sea borrado del “dep?sito” la
siguiente vez que se ejecute una entrega. Tambi?n borrar? la copia local
del fichero, as? que sea cauteloso cuando la use.

Por supuesto que borrar un fichero no significa que se borre realmente
del repositorio.

Los ficheros borrados se pueden “resucitar” mediante la sincronizaci?n
con una versi?n previa. La ?nica forma de borrar de forma permanente un
fichero es mediante la orden ``p4 obliterat``. Dicha orden es
irreversible y costosa, as? que s?lo est? al alcance del personal que
administra el repositorio.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------+---------------------------+----------------------------------------------+
| `Anterior <diffs.html>`__?   | ?                         | ?\ `Siguiente <working-with-diffs.html>`__   |
+------------------------------+---------------------------+----------------------------------------------+
| 10. “diffs”?                 | `Inicio <index.html>`__   | ?12. El trabajo con “diffs”                  |
+------------------------------+---------------------------+----------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
