================
6. Integraciones
================

.. raw:: html

   <div class="navheader">

6. Integraciones
`Anterior <branches.html>`__?
?
?\ `Siguiente <submit.html>`__

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

6. Integraciones
----------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

“Integraci?n” es el t?rmino que se utiliza en Perforce para describir la
acci?n de mover cambios desde una parte del “dep?sito” a otra. Se suele
realizar junto con las ?rdenes creaci?n y mantenimiento de ramas. Una
integraci?n es necesaria cuando se quiere rellenar inicialmente una rama
y cuando se quieren mover cambios realizados en la rama padre hacia la
rama hija, o de la la rama hija a la padre. Un caso muy com?n es la
integraci?n peri?dica desde el ?rbol original de FreeBSD hacia la rama
hija propia del usuario. El servidor Perforce mantiene el estado de los
cambios en cada rama y sabe cu?ndo hay cambios que pueden integrarse de
una rama a otra.

La forma m?s com?n de hacer una integraci?n se muestra en la siguiente
orden:

.. code:: screen

    % p4 integrate -b nombrederama

*``nombrederama``* es el nombre que se ha dado a la especificaci?n de
rama, tal y como se explic? en la secci?n anterior. Esta orden indica a
Perforce que busque cambios en la rama padre que todav?a no se hayan
aplicado a la rama hija. En base a los cambios encontrados se prepara un
listado de diferencias a aplicar. Si la integraci?n se realiza por
primera vez sobre una rama (por ejemplo cuando se realiza una operaci?n
de rellenado inicial) los ficheros de la rama padre simplemente se
copiar?n en la ubicaci?n en la rama hija de la m?quina local.

Una vez que la operaci?n de integraci?n ha finalizado se debe ejecutar
``p4 resolve``, que aplicar? los cambios y resolver? posibles
conflictos. Los conflictos puede surgir debido a cambios que se solapan
al encontrarse tanto en fichero de la rama padre como en la copia del
fichero de la rama hija. Normalmente no suelen aparecer conflictos y
Perforce puede calcular r?pidamente c?mo unir los cambios. Para ejecutar
una operaci?n de resoluci?n (“resolve”) utilice las siguientes ?rdenes:

.. code:: screen

    % p4 resolve -as
    % p4 resolve

La primera invocaci?n indica a Perforce que una autom?ticamente los
cambios y que acepte aquellos ficheros que no den conflictos. La segunda
invocaci?n permite inspeccionar cada fichero con conflictos y resolver
de forma manual dichas incompatiblidades.

Una vez hecha la integraci?n de los ficheros llega el momento de aplicar
los cambios al repositorio. Para ello se emplearemos la orden
``p4 submit``, cuyo uso se explica en la siguiente secci?n.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------+---------------------------+-----------------------------------------------+
| `Anterior <branches.html>`__?   | ?                         | ?\ `Siguiente <submit.html>`__                |
+---------------------------------+---------------------------+-----------------------------------------------+
| 5. Ramas?                       | `Inicio <index.html>`__   | ?7. Aplicaci?n de cambios en el repositorio   |
+---------------------------------+---------------------------+-----------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
