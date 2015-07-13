================
2. Los comienzos
================

.. raw:: html

   <div class="navheader">

2. Los comienzos
`Anterior <index.html>`__?
?
?\ `Siguiente <clients.html>`__

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

2. Los comienzos
----------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El primer paso para utilizar Perforce consiste en obtener una cuenta en
el servidor. Si ya dispone de una cuenta en ``FreeBSD.org`` entre en
``freefall`` y ejecute el siguiente comando utilizando una contrase?a
distinta del acceso de su FreeBSD o de cualquier otro mecanismo de
autenticaci?n SSH:

.. code:: screen

    % /usr/local/bin/p4newuser

Por supuesto si no tiene una cuenta en ``FreeBSD.org`` necesitar?
coordinarse con su mentor.

El siguiente paso consiste en establecer las variables de entorno que
necesita ``p4`` y en verificar que puede conectarse al servidor. Es
necesario especificar la variable ``P4PORT`` para realizar cualquier
operaci?n. Dicha variable indica el servidor Perforce con el que se va a
trabajar. En el caso del Proyecto FreeBSD, cr?ela con el siguiente
valor:

.. code:: screen

    % export P4PORT=perforce.freebsd.org:1666

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Los usuarios con acceso “shell” al “cluster” ``FreeBSD.org`` pueden
querer encapsular el protocolo cliente-servidor de Perforce a trav?s de
un t?nel SSH, en cuyo caso la variable de arriba deber?a establecerse al
valor ``localhost``.

.. raw:: html

   </div>

El servidor FreeBSD tambi?n necesita que se establezcan las variables
``P4PASSWD`` y ``P4USER``. Utilice el nombre de usuario y la contrase?a
anteriores del siguiente modo:

.. code:: screen

    % export P4USER=nombre_de_usuario
    % export P4PASSWD=contrase?a

Compruebe que todo funciona mediante la siguiente orden:

.. code:: screen

    % p4 info

A resultas de esta orden deber?a ver informaci?n referente al servidor.
Si no es as? compruebe que la variable ``P4PORT`` tiene el valor
correcto.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------------------+---------------------------+-----------------------------------+
| `Anterior <index.html>`__?                           | ?                         | ?\ `Siguiente <clients.html>`__   |
+------------------------------------------------------+---------------------------+-----------------------------------+
| Perforce en el contexto del desarrollo de FreeBSD?   | `Inicio <index.html>`__   | ?3. Clientes                      |
+------------------------------------------------------+---------------------------+-----------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
