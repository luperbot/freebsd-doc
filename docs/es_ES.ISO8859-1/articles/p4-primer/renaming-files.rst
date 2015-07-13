===============================
13. Cambiar nombres de ficheros
===============================

.. raw:: html

   <div class="navheader">

13. Cambiar nombres de ficheros
`Anterior <working-with-diffs.html>`__?
?
?\ `Siguiente <freebsd-cvs-and-p4.html>`__

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

13. Cambiar nombres de ficheros
-------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Perforce no dispone de una forma predefinida de cambiar nombres a
ficheros o de moverlos a otra parte del ?rbol. Si se copia el fichero en
cuesti?n a una nueva ubicaci?n mediante ``p4     add``, y posteriormente
``p4     delete`` en la versi?n anterior, se obtiene algo muy parecido a
lo que se quer?a, pero tiene el inconveniente de que no se preserva el
historial de cambios de ese fichero. Esto puede perjudicar futuras
integraciones entre padres e hijos. Hay otro m?todo m?s recomendable,
que consiste en efectuar una integraci?n dentro del mismo ?rbol y de una
sola vez. Veamos un ejemplo:

.. code:: screen

    % p4 integrate -i ficheroprevio ficheronuevo
    % p4 resolve
    % p4 delete ficheroprevio
    % p4 submit

La integraci?n fuerza a Perforce a mantener un registro de las
relaciones entre los nombres antiguos y los nuevos, lo cual ser? muy
?til en futuras integraciones. La opci?n ``-i`` indica que se trata de
una integraci?n “sin base”, es decir, que no existe un historial de
ramas al que recurrir en la integraci?n. Este par?metro tiene sentido en
el presente ejemplo, pero no deber?a utilizarse en integraciones basadas
en ramas.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------------+---------------------------+---------------------------------------------------------+
| `Anterior <working-with-diffs.html>`__?   | ?                         | ?\ `Siguiente <freebsd-cvs-and-p4.html>`__              |
+-------------------------------------------+---------------------------+---------------------------------------------------------+
| 12. El trabajo con “diffs”?               | `Inicio <index.html>`__   | ?14. Interacciones entre el CVS de FreeBSD y Perforce   |
+-------------------------------------------+---------------------------+---------------------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
