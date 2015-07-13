========
5. Ramas
========

.. raw:: html

   <div class="navheader">

5. Ramas
`Anterior <syncing.html>`__?
?
?\ `Siguiente <Integrations.html>`__

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

5. Ramas
--------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Una de las caracter?sticas m?s interesantes de Perforce es la
posibilidad de crear ramas. Las ramas son muy sencillas de crear y
tambi?n resulta muy f?cil mover cambios entre distintas ramas (como se
ver? m?s adelante). Las ramas tambi?n nos permiten realizar trabajos muy
experimentales dentro de un entorno de “sandbox”, sin necesidad de tener
que preocuparnos por las colisiones con otros usuarios o por
desestabilizar el ?rbol principal. Adem?s, las ramas proporcionan el
aislamiento necesario frente a los errores que se cometen cuando se
aprende a manejar el sistema Perforce. Vistas estas ventajas es l?gico
que cada proyecto disponga de su propia rama y en FreeBSD recomendamos
encarecidamente este esquema. Tambi?n se recomienda la aplicaci?n
frecuente de los cambios realizados.

El repositorio Perforce (conocido como el “dep?sito”, o “depot” en la
jerga de Perforce) es un ?nico ?rbol plano. Se accede a cada fichero a
trav?s de una sencilla ruta bajo el directorio ``//depot``, tanto si se
trata de un fichero de nueva creaci?n como si proviene de una
ramificaci?n. Esto supone una gran diferencia con respecto a sistemas
como CVS, donde cada rama se encuentra en la misma ruta que su rama
padre. En Perforce el servidor mantiene las relaciones entre los
ficheros padre e hijo, pero los ficheros en s? est?n bajo sus propias
rutas.

El primer para para crear una rama consiste en crear una especificaci?n
de rama. Es similar a la especificaci?n de un cliente, pero se crea
mediante la orden ``p4 branch     nombre_de_rama``.

Veamos los campos m?s importantes:

.. raw:: html

   <div class="variablelist">

``Branch``
    El nombre de la rama. Puede ser cualquier nombre, pero debe ser
    ?nico en el repositorio. La convenci?n que se usa en FreeBSD es
    *``nombre_de_usuario``*\ \_\ *``nombre_del_proyecto``*.

``Description``
    Puede poner aqu? un texto simple que describa la rama.

``View``
    Esto es la asociaci?n de la rama. En lugar de asociar desde el
    “dep?sito” hacia la m?quina local como una asociaci?n de cliente, se
    crea una asociaci?n entre la rama padre y la rama hija dentro del
    “dep?sito”. Por ejemplo, puede querer crear una rama del proyecto
    smpng. La asociaci?n resultar?a en algo parecido a esto:

    .. code:: programlisting

        //depot/projects/smpng/... //depot/projects/mi-super-smpng/...

    O puede crear una rama totalmente nueva a partir de las fuentes de
    FreeBSD:

    .. code:: programlisting

        //depot/vendor/freebsd/... //depot/projects/mi-nuevo-proyecto/...

    Esto asociar? el HEAD del ?rbol de FreeBSD a su nueva rama.

.. raw:: html

   </div>

La creaci?n de la especificaci?n de rama ?nicamente graba la
especificaci?n en s? misma dentro del servidor. No modifica el
“dep?sito” ni cambia ning?n fichero. El directorio que se declara en la
rama permanece vac?o en el servidor hasta que se comience a llenar.

Para rellenar la rama primero debemos editar el cliente con la orden
``p4 client`` y asegurarnos de que el directorio de rama est? asociado
en el cliente. Puede ser necesario a?adir una l?nea ``View`` como esta:

.. code:: programlisting

    //depot/projects/mi-nuevo-proyecto/... //micliente/mi-nuevo-proyecto/...

El siguiente paso consiste en ejecutar ``p4   integrate``, como se
describe en la siguiente secci?n.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------+---------------------------+----------------------------------------+
| `Anterior <syncing.html>`__?   | ?                         | ?\ `Siguiente <Integrations.html>`__   |
+--------------------------------+---------------------------+----------------------------------------+
| 4. Sincronizaciones?           | `Inicio <index.html>`__   | ?6. Integraciones                      |
+--------------------------------+---------------------------+----------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
