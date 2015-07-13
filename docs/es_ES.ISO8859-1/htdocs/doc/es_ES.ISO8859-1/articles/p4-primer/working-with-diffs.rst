==========================
12. El trabajo con “diffs”
==========================

.. raw:: html

   <div class="navheader">

12. El trabajo con “diffs”
`Anterior <add-rm-files.html>`__?
?
?\ `Siguiente <renaming-files.html>`__

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

12. El trabajo con “diffs”
--------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Algunas veces puede ser necesario aplicar un “diff” al ?rbol de Perfoce
que provenga de otra aplicaci?n. Si se trata de un “diff” de gran tama?o
y que afecta a muchos ficheros, puede resultar tedioso ejecutar
manualmente ``p4 edit`` sobre cada fichero. Hay un truco para hacerlo de
una forma m?s sencilla. En primer lugar, aseg?rese de que no hay
ficheros abiertos en su cliente y de que su ?rbol est? sincronizado y
actualizado a la ?ltima versi?n. A continuaci?n aplique sus cambios
mediante las herramientas habituales, y forzando los permisos de los
ficheros en caso de ser necesario. Despu?s ejecute lo siguiente:

.. code:: screen

    % p4 diff -se ... |xargs p4 edit
    % p4 diff -sd ... |xargs p4 delete
    % find . -type f |xargs p4 add

La primera orden le dice a Perforce que busque los ficheros que han
cambiado, incluso si no est?n abiertos. La segunda orden le dice a
Perforce que busque los ficheros que no existen en la m?quina local pero
que s? est?n en el servidor. La tercera orden intenta a?adir todos los
ficheros que est?n en local. Es un m?todo de fuerza bruta, pero funciona
bien porque Perforce s?lo a?adir? los ficheros que le resulten
desconocidos. El resultado de estas ?rdenes es un conjunto de ficheros
abiertos para edici?n, borrado o para ser a?adidos, seg?n el caso. Hecho
esto solo nos queda ejecutar ``p4 submit`` para entregar los cambios.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------+---------------------------+------------------------------------------+
| `Anterior <add-rm-files.html>`__?   | ?                         | ?\ `Siguiente <renaming-files.html>`__   |
+-------------------------------------+---------------------------+------------------------------------------+
| 11. A?adir o eliminar ficheros?     | `Inicio <index.html>`__   | ?13. Cambiar nombres de ficheros         |
+-------------------------------------+---------------------------+------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
