===========
3.9. Shells
===========

.. raw:: html

   <div class="navheader">

3.9. Shells
`Anterior <basics-daemons.html>`__?
Cap?tulo 3. Conceptos b?sicos de Unix
?\ `Siguiente <editors.html>`__

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

3.9. Shells
-----------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

En FreeBSD gran parte del trabajo diario se hace en una interfaz de
l?nea de ?rdenes llamada shell. El trabajo principal de la shell es ir
recibiendo ?rdenes mediante un canal de entrada y ejecutarlos. Muchas
shells tambi?n tienen funciones integradas para ayudar ayudar con las
tareas diarias como manipulaci?n de ficheros, gesti?n de archivos con
expresiones regulares, edici?n en la propia l?nea de ?rdenes, macros de
?rdenes y variables de entorno. FreeBSD incluye diversas shells, como
``sh``, el shell Bourne y ``tcsh``, el shell C mejorado. Hay muchas
otras shells disponibles en la colecci?n de ports de FreeBSD, como
``zsh`` y ``bash``.

?Qu? shell usar? es una cuesti?n de gustos. Si va a programar en C puede
preferir usar una shell tipo C, como ``tcsh``. Si viene del mundo Linux
o si es nuevo en la interfaz de l?nea de ?rdenes de UNIX? puede probar
con ``bash``. Tenga en cuenta que cada shell posee unas propiedades
?nicas que pueden o no funcionar con su entorno de trabajo preferido y
que puede usted elegir qu? shell usar.

Una de las propiedades comunes de las shell es que completan los nombres
de fichero. Una vez que ha introducido las primeras letras de una orden
o del nombre de un fichero, se puede hacer que la shell complete
autom?ticamente el resto de la orden o nombre de fichero pulsando la
tecla **Tab**. Veamos un ejemplo. Suponga que tiene dos ficheros
llamados ``talcual`` y ``tal.cual``. Usted quiere borrar ``tal.cual``.
Lo que habr?a que teclear es: ``rm ta[tabulador].[tabulador]``.

La shell mostrar?a en pantalla ``rm       ta[BIP].cual``.

El [BIP] es la campana de la consola, es decir, la shell est? dici?ndome
que no pudo completar totalmente el nombre de fichero porque hay m?s de
una coincidencia. Tanto ``talcual`` como ``tal.cual`` comienzan por
``ta``, pero solo se pudo completar hasta ``tal``. Si se teclea ``.``, y
de nuevo **tabulador** la shell es capaz de a?adir el resto del nombre
de fichero.

Otra funci?n de la shell son las variables de entorno. Las variables de
entorno son parejas de valores clave almacenados en el espacio de
entorno del shell. Este espacio puede ser le?do por cualquier programa
invocado por la shell y por lo tanto contiene mucha configuraci?n de
programas. Esta es una lista de las variables de entorno m?s comunes y
su significado:

.. raw:: html

   <div class="informaltable">

+----------------+---------------------------------------------------------------------------------------------------------------------+
| Variable       | Descripci?n                                                                                                         |
+================+=====================================================================================================================+
| ``USER``       | Nombre de usuario en el sistema.                                                                                    |
+----------------+---------------------------------------------------------------------------------------------------------------------+
| ``PATH``       | Lista de directorios, separados por punto y coma, en los que se buscan ejecutables.                                 |
+----------------+---------------------------------------------------------------------------------------------------------------------+
| ``DISPLAY``    | Nombre de red de la pantalla X11 a la que conectarse, si est? disponible.                                           |
+----------------+---------------------------------------------------------------------------------------------------------------------+
| ``SHELL``      | La shell actual.                                                                                                    |
+----------------+---------------------------------------------------------------------------------------------------------------------+
| ``TERM``       | El nombre de la terminal del usuario. Se usa para determinar las caracter?sticas de la terminal.                    |
+----------------+---------------------------------------------------------------------------------------------------------------------+
| ``TERMCAP``    | Base de datos donde encontrar los c?digos de escape necesarios para realizar diferentes funciones en la terminal.   |
+----------------+---------------------------------------------------------------------------------------------------------------------+
| ``OSTYPE``     | Tipo de sistema operativo. Por ejemplo, FreeBSD.                                                                    |
+----------------+---------------------------------------------------------------------------------------------------------------------+
| ``MACHTYPE``   | Arquitectura de CPU en la que se est? ejecutando el sistema.                                                        |
+----------------+---------------------------------------------------------------------------------------------------------------------+
| ``EDITOR``     | El editor de texto preferido por el usuario.                                                                        |
+----------------+---------------------------------------------------------------------------------------------------------------------+
| ``PAGER``      | El paginador de texto preferido por el usuario.                                                                     |
+----------------+---------------------------------------------------------------------------------------------------------------------+
| ``MANPATH``    | Lista de directorios separados por punto y coma en los que se buscan p?ginas de manual.                             |
+----------------+---------------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

Establecer una variable de entorno difiere ligeramente de shell a shell.
Por ejemplo, en las shells al estilo C como ``tcsh`` y ``csh``, se usa
``setenv`` para establecer las variables de entorno. Bajo shells Bourne
como ``sh`` y ``bash``, se usa ``export`` para establecer las variables
de entorno actuales. Por ejemplo, para establecer o modificar la
variable de entorno ``EDITOR`` (bajo ``csh`` o ``tcsh``) la siguiente
orden establece ``EDITOR`` como ``/usr/local/bin/emacs``:

.. code:: screen

    % setenv EDITOR /usr/local/bin/emacs

Bajo shells Bourne:

.. code:: screen

    % export EDITOR="/usr/local/bin/emacs"

Tambi?n se puede hacer que la mayor?a de las shells muestren el
contenido de una variable de entorno situando el car?cter ``$`` delante
del nombre de la variable en la l?nea de ?rdenes. Por ejemplo,
``echo $TERM`` mostrar? cualquiera que sea el valor que haya establecido
para ``$TERM``, porque la shell expande el valor de ``$TERM`` y se lo
pasa al programa ``echo``.

Las shells manejan muchos caracteres especiales, llamados
metacaracteres, como representaciones especiales de datos. El m?s com?n
es el caracter ``*``, que representa cualquier n?mero de caracteres en
un nombre de fichero. Estos metacaracteres especiales se pueden usar
para la expansi?n de nombres de fichero. Por ejemplo, teclear ``echo *``
es casi lo mismo que introducir ``ls`` porque la shell toma todos los
ficheros que coinciden con ``*`` y se los pone en la l?nea de ?rdenes
para que ``echo`` los vea.

Para evitar que la shell interprete estos caracteres especiales pueden
escamotearse anteponi?ndoles una contrabarra (``\``). ``echo $TERM``
imprime el nombre de terminal que est? usando. ``echo \$TERM`` imprime
``$TERM``, literalmente.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.9.1. C?mo cambiar su shell
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

La manera m?s f?cil de cambiar de shell es mediante ``chsh``. ``chsh``
le colocar? dentro del editor que est? configurado en la variable de
entorno ``EDITOR``; si no la ha modificado, el sistema ejecutar? ``vi``,
el editor por omisi?n. Cambie la l?nea ?Shell:? seg?n sus gustos.

Tambi?n se le puede suministrar a ``chsh`` la opci?n ``-s``; ?sto
establecer? la shell sin necesidad de entrar en el editor de texto. Si
por ejemplo quiere que ``bash`` sea su shell por omisi?n puede
configurarlo del siguiente modo:

.. code:: screen

    % chsh -s /usr/local/bin/bash

Ejecutar ``chsh`` sin par?metros y editar la shell desde ah? tambi?n
funciona.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

La shell que se desee usar *debe* estar incluida en ``/etc/shells``. Si
se ha instalado una shell desde la `colecci?n de ports <ports.html>`__
esto deber? estar hecho autom?ticamente. Si ha instalado la shell
manualmente, tendr? usted que realizar el cambio oportuno en
``/etc/shells``.

Por ejemplo, si instal? manualmente ``bash`` y lo ubic? en
``/usr/local/bin`` deber?a hacer lo siguiente:

.. code:: screen

    # echo "/usr/local/bin/bash" >> /etc/shells

Hecho esto vuelva a ejecutar ``chsh``.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------------+---------------------------+-----------------------------------+
| `Anterior <basics-daemons.html>`__?           | `Subir <basics.html>`__   | ?\ `Siguiente <editors.html>`__   |
+-----------------------------------------------+---------------------------+-----------------------------------+
| 3.8. D?mons, se?ales y c?mo matar procesos?   | `Inicio <index.html>`__   | ?3.10. Editores de texto          |
+-----------------------------------------------+---------------------------+-----------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
