==========
8. Edici?n
==========

.. raw:: html

   <div class="navheader">

8. Edici?n
`Anterior <submit.html>`__?
?
?\ `Siguiente <changes.html>`__

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

8. Edici?n
----------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

En el servidor se almacena y mantiene el estado de cada fichero del
cliente. Para evitar colisiones entre distintas personas trabajando al
mismo tiempo en el mismo fichero Perforce presta atenci?n a qu? ficheros
est?n abiertos en modo de edici?n, y utiliza esa informaci?n para poder
gestionar posteriormente las operaciones de entrega, las
sincronizaciones y las integraciones.

Para abrir un fichero para editarlo utilice ``p4   edit`` de la
siguiente forma:

.. code:: screen

    % p4 edit nombredefichero

Esto marca el fichero en el servidor con el estado de edici?n, lo que
permite entregar el fichero posteriormente una vez realizados los
cambios oportunos, o lo etiqueta como de tratamiento especial cuando se
est? efectuando una operaci?n de integraci?n o sincronizaci?n. Tenga en
cuenta que la edici?n no es exclusiva en Perforce. Varias personas
pueden tener el mismo fichero en estado de edici?n (ser? informado de
ello si es necesario cuando ejecute ``edit``), pero podr? entregar sus
cambios incluso cuando haya otras personas que tengan ese fichero en
estado de edici?n.

Cuando alguien entregue un cambio de un fichero que usted est? editando
necesitar? cotejar sus modificaciones con las de la otra u otras
personas para poder aplicar correctamente sus modifaciones al
repositorio. La forma m?s sencilla de hacerlo es ejecutar ``p4 sync`` o
``p4 submit`` y dejar que el programa encuentre alg?n conflicto, y a
continuaci?n ejecutar ``p4 resolve`` para “resolver” manualmente los
conflictos y aceptar los cambios de la otra persona en su copia del
fichero. Hecho esto, utilice ``p4     submit`` para aplicar sus cambios
en el repositorio.

Si posee un fichero abierto para su edici?n y quiere descartar los
cambios y devolverlo a su estado original ejecute ``p4 revert`` de la
siguiente forma:

.. code:: screen

    % p4 revert nombredefichero

Esto resincroniza el fichero con el contenido del servidor y elimina en
el servidor el atributo de edici?n para ese fichero. Se perder?
cualquier cambio que haya hecho en local. Esto resulta muy ?til cuando
se han efectuado una serie de cambios en un determinado fichero y se
decide posteriormente que no se desean aplicar dichos cambios en el
servidor.

Cuando se sincroniza un fichero se marca como s?lo lectura en el sistema
de ficheros. Aunque se pueden sobreescribir f?cilmente dichos permisos
se aplican para recordar al usuario de una forma educada que para ello
se debe utilizar ``p4 edit``. Los ficheros modificados en local pero que
no est?n en estado de edici?n pueden sobreescribirse al ejecutar
``p4 sync``.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------------+---------------------------+------------------------------------------+
| `Anterior <submit.html>`__?                   | ?                         | ?\ `Siguiente <changes.html>`__          |
+-----------------------------------------------+---------------------------+------------------------------------------+
| 7. Aplicaci?n de cambios en el repositorio?   | `Inicio <index.html>`__   | ?9. Cambios, descripciones e historial   |
+-----------------------------------------------+---------------------------+------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
