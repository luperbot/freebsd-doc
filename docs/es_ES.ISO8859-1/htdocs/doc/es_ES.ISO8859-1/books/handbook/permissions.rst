=============
3.3. Permisos
=============

.. raw:: html

   <div class="navheader">

3.3. Permisos
`Anterior <consoles.html>`__?
Cap?tulo 3. Conceptos b?sicos de Unix
?\ `Siguiente <dirstructure.html>`__

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

3.3. Permisos
-------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD, cuya ra?z hist?rica es el UNIX? BSD, se fundamenta en varios
conceptos clave de UNIX. El primero y m?s importante es que FreeBSD es
un sistema operativo multi-usuario. El sistema puede gestionar m?ltiples
usuarios trabajando simult?neamente y en tareas que no guarden relaci?n
entre s?. El sistema se encarga de compartir y administrar peticiones de
dispositivos de hardware, perif?ricos, memoria y tiempo de CPU de manera
equitativa para cada usuario.

Debido a que el sistema es capaz de soportar m?ltiples usuarios, todo lo
que el sistema administra tiene un conjunto de permisos que usa para
decidir qui?n puede leer, escribir y ejecutar un recurso. Estos permisos
se guardan como octetos divididos en tres partes: una para el
propietario del fichero, otra para el grupo al que el fichero pertenece,
y otra para todos los dem?s grupos y usuarios. Veamos una representaci?n
num?rica de esto:

.. raw:: html

   <div class="informaltable">

+---------+-------------------------------------+-------------------------+
| Valor   | Permiso                             | Listado de directorio   |
+=========+=====================================+=========================+
| 0       | No leer, no escribir, no ejecutar   | ``---``                 |
+---------+-------------------------------------+-------------------------+
| 1       | No leer, no escribir, ejecutar      | ``--x``                 |
+---------+-------------------------------------+-------------------------+
| 2       | No leer, escribir, no ejecutar      | ``-w-``                 |
+---------+-------------------------------------+-------------------------+
| 3       | No leer, escribir, ejecutar         | ``-wx``                 |
+---------+-------------------------------------+-------------------------+
| 4       | Leer, no escribir, no ejecutar      | ``r--``                 |
+---------+-------------------------------------+-------------------------+
| 5       | Leer, no escribir, ejecutar         | ``r-x``                 |
+---------+-------------------------------------+-------------------------+
| 6       | Leer, escribir, no ejecutar         | ``rw-``                 |
+---------+-------------------------------------+-------------------------+
| 7       | Leer, escribir, ejecutar            | ``rwx``                 |
+---------+-------------------------------------+-------------------------+

.. raw:: html

   </div>

Puede utilizar el par?metro de l?nea de ?rdenes ``-l`` de
`ls(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ls&sektion=1>`__ para
ver un listado largo que incluya una columna con informaci?n acerca de
los permisos de fichero para el propietario, grupo y los dem?s. Por
ejemplo, un ``ls -l`` en un directorio puede mostrar algo como esto:

.. code:: screen

    % ls -l
    total 530
    -rw-r--r--  1 root  wheel     512 Sep  5 12:31 mifichero
    -rw-r--r--  1 root  wheel     512 Sep  5 12:31 otrofichero
    -rw-r--r--  1 root  wheel    7680 Sep  5 12:31 email.txt
    ...

Aqu? est? como se divide la primera columna de ``ls -l``:

.. code:: screen

    -rw-r--r--

El primer caracter (m?s a la izquierda) indica si este fichero es un
fichero regular, un directorio, un dispositivo especial de caracter, un
socket o cualquier otro dispositivo especial pseudo-ficheroa . En este
caso, el ``-`` un fichero regular. Los siguientes tres caracteres,
``rw-`` en este ejemplo, dan los permisos para el propietario del
fichero. Los siguientes tres caracteres, ``r--``, dan los permisos para
el grupo al que el fichero pertenece. Los ?ltimos tres caracteres,
``r--``, dan los permisos para el resto del mundo. Un gui?n indica que
el permiso est? desactivado. En el caso de este fichero, los permisos
est?n asignados de tal manera que el propietario puede leer y escribir
en el fichero, el grupo puede leer el fichero, y el resto del mundo s?lo
puede leer el fichero. De acuerdo con la tabla de arriba, los permisos
para este fichero ser?an ``644``, donde cada d?gito representa las tres
partes de los permisos del fichero.

Todo ?sto est? muy bien, pero ?c?mo controla el sistema los permisos de
los dispositivos? FreeBSD en realidad trata la mayor?a de los
dispositivos hardware como un fichero que los programas pueden abrir,
leer y en los que pueden escribir datos como si de cualquier otro
fichero se tratara. Estos ficheros especiales de dispositivo se
encuentran en el directorio ``/dev``.

Los directorios tambi?n son tratados como ficheros. Tienen permisos de
lectura, escritura y ejecuci?n. El bit de ejecuci?n en un directorio
tiene un significado ligeramente distinto que para los ficheros. Cuando
un directorio est? marcado como ejecutable significa que se puede mirar
dentro, se puede hacer un ?cd? (cambiar directorio) a ?l. Esto tambi?n
significa que dentro del directorio es posible acceder a ficheros cuyos
nombres son conocidos (sujeto, claro est?, a los permisos de los
ficheros mismos).

En particular, para poder realizar un listado de directorio, el permiso
de lectura debe ser activado en el directorio, mientras que para borrar
un fichero del que se conoce el nombre es necesario tener permisos de
escritura *y* ejecuci?n en el directorio que contiene el fichero.

Existen m?s permisos, pero se usan principalmente en circunstancias
especiales como los binarios ejecutables de tipo setuid y los los
directorios de tipo ?sticky?. Si desea m?s informaci?n acerca de los
permisos de ficheros y c?mo establecerlos, consulte
`chmod(1) <http://www.FreeBSD.org/cgi/man.cgi?query=chmod&sektion=1>`__.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.3.1. Permisos simb?licos
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div>

Escrito por Tom Rhodes.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Los permisos simb?licos, tambi?n conocidos como expresiones simb?licas,
utilizan caracteres en lugar de valores octales para asignar permisos a
ficheros o directorios. Las expresiones simb?licas utilizan la sintaxis
de (qui?n) (acci?n) (permisos) mediante los siguientes valores:

.. raw:: html

   <div class="informaltable">

+--------------+---------+-----------------------------------+
| Opci?n       | Letra   | Representa                        |
+==============+=========+===================================+
| (qui?n)      | u       | Usuario                           |
+--------------+---------+-----------------------------------+
| (qui?n)      | g       | Grupo propietario                 |
+--------------+---------+-----------------------------------+
| (qui?n)      | o       | Otro                              |
+--------------+---------+-----------------------------------+
| (qui?n)      | a       | Todos (?todo el mundo?)           |
+--------------+---------+-----------------------------------+
| (acci?n)     | +       | A?adir permisos                   |
+--------------+---------+-----------------------------------+
| (acci?n)     | -       | Quitar permisos                   |
+--------------+---------+-----------------------------------+
| (acci?n)     | =       | Activar permisos expl?citamente   |
+--------------+---------+-----------------------------------+
| (permisos)   | r       | Lectura                           |
+--------------+---------+-----------------------------------+
| (permisos)   | w       | Escritura                         |
+--------------+---------+-----------------------------------+
| (permisos)   | x       | Ejecuci?n                         |
+--------------+---------+-----------------------------------+
| (permisos)   | t       | Bit Sticky (?pegajoso?)           |
+--------------+---------+-----------------------------------+
| (permisos)   | s       | Activar UID o GID                 |
+--------------+---------+-----------------------------------+

.. raw:: html

   </div>

Estos valores se aplican con
`chmod(1) <http://www.FreeBSD.org/cgi/man.cgi?query=chmod&sektion=1>`__
de la misma manera que los anteriores, pero con letras. Por ejemplo,
podr?a usar la siguiente orden para bloquear a otros usuarios el acceso
a *``FICHERO``*:

.. code:: screen

    % chmod go= FICHERO

Puede usarse una lista separada por comas cuando se quiera aplicar m?s
de un conjunto de cambios a un fichero. Por ejemplo la siguiente orden
eliminar? los permisos de escritura de grupo y ?mundo? a *``FICHERO``*,
y a?ade permisos de ejecuci?n para todos:

.. code:: screen

    % chmod go-w,a+x FILE

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.3.2. Banderas de fichero en FreeBSD
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div>

Escrito por Tom Rhodes.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Adem?s de los permisos de fichero previamente expuestos, FreeBSD permite
el uso de ?banderas de fichero?. Estas banderas a?aden un nivel de
seguridad y control adicional a los ficheros, pero no a los directorios.

Las banderas de fichero a?aden un nivel adicional de control sobre los
ficheros ayudando a asegurar que en algunos casos ni siquiera ``root``
pueda eliminar o alterar ficheros.

Las banderas de fichero se modifican mediante
`chflags(1) <http://www.FreeBSD.org/cgi/man.cgi?query=chflags&sektion=1>`__,
gracias a una interfaz muy sencilla. Por ejemplo, para habilitar la
bandera imborrable de sistema en ``fichero1``, escriba lo siguiente:

.. code:: screen

    # chflags sunlink fichero1

Y para dehabilitar la bandera imborrable de sistema, simplemente escriba
la orden previa con ?no? antes de ``sunlink``. Observe:

.. code:: screen

    # chflags nosunlink fichero1

Para ver las banderas de este fichero, utilice
`ls(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ls&sektion=1>`__ con
las opciones ``-lo``:

.. code:: screen

    # ls -lo fichero1
        

La salida deber?a ser como esta:

.. code:: programlisting

    -rw-r--r--  1 trhodes  trhodes  sunlnk 0 Mar  1 05:54 fichero1

Varias banderas solo pueden ser a?adidas o retiradas de ficheros por el
usuario ``root``. En otros casos, el propietario del fichero puede
activar estas banderas. Se recomienda que para m?s informaci?n la
persona encargada de la administraci?n del sistema consulte las p?ginas
de manual
`chflags(1) <http://www.FreeBSD.org/cgi/man.cgi?query=chflags&sektion=1>`__
y
`chflags(2) <http://www.FreeBSD.org/cgi/man.cgi?query=chflags&sektion=2>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.3.3. Los permisos ``setuid``, ``setgid`` y ``sticky``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div>

Escrito por Tom Rhodes.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Adem?s de los permisos que se han explicado hay m?s, hay tres tipos m?s
que todos los administradores deber?an conocer. Son los permisos
``setuid``, ``setgid`` y ``sticky``.

Estos permisos juegan un papel clave en ciertas operaciones UNIX? puesto
que facilitan funcionalidades que no se suelen permitir a los usuarios
normales. Para comprenderlas totalmente hay que comprender la diferencia
entre el ID real del usuario y el ID efectivo.

El ID del usuario real es el UID que arranca (y el propietario) del
proceso. El UID efectivo es el ID bajo el que se ejecuta el proceso.
Veamos un ejemplo; el programa
`passwd(1) <http://www.FreeBSD.org/cgi/man.cgi?query=passwd&sektion=1>`__
se ejecuta con el ID real del usuario puesto que el usuario est?
cambiando su contrase?a. Pero para poder manipular la base de datos de
contrase?as debe ejecutarse con el ID efectivo del usuario ``root``. De
este modo es posible que los usuarios cambien su contrase?a sin llegar a
ver un error de Permission Denied (permiso denegado).

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

La opci?n ``nosuid`` de
`mount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount&sektion=8>`__
hace que estos binarios den errores silenciosos, es decir, fallar?n pero
el usuario no recibir? ning?n mensaje de error por ello. Esta opci?n no
funciona siempre, pues, seg?n la p?gina man de
`mount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount&sektion=8>`__,
un ?wrapper? ``nosuid`` puede sortear esta limitaci?n.

.. raw:: html

   </div>

El permiso setuid puede asignarse colocando un n?mero cuatro (4) antes
de los permisos. Se ve mejor con un ejemplo:

.. code:: screen

    # chmod 4755 ejemplosuid.sh

Los permisos de ``ejemplosuid.sh`` deber?an ser as?:

.. code:: programlisting

    -rwsr-xr-x   1 trhodes  trhodes    63 Aug 29 06:36 ejemplosuid.sh

F?jese atentamente en la ``s`` que ha aparecido en los permisos del
fichero, en la parte de los permisos del propietario; esa ``s`` est? en
donde estar?a el bit de ejecuci?n. Gracias a esto el funcionamiento de
aplicaciones que necesitan permisos elevados, como ``passwd``, pueden
funcionar.

Si quiere ver un ejemplo con sus propios ojos abra dos terminales. En
una arranque un proceso (ejecute) ``passwd`` con un usuario normal.
Mientras la aplicaci?n espera a que le de una nueva contrase?a busque la
informaci?n de usuario del proceso ``passwd`` en la tabla de procesos.

En la terminal A:

.. code:: screen

    Changing local password for trhodes
    Old Password:

En la terminal B:

.. code:: screen

    # ps aux | grep passwd

.. code:: screen

    trhodes  5232  0.0  0.2  3420  1608   0  R+    2:10AM   0:00.00 grep passwd
    root     5211  0.0  0.2  3620  1724   2  I+    2:09AM   0:00.01 passwd

Tal y como se ha dicho, un usuario normal puede ejecutar ``passwd``,
pero en realidad est? utilizando el UID efectivo de ``root``.

El permiso ``setgid`` act?a del mismo modo que el ``setuid``, pero
afecta a los permisos del grupo. Cuando una aplicaci?n funciona con esta
configuraci?n lo hace con los permisos del grupo al que pertenece el
fichero, no los del usuario que ha arrancado el proceso.

Si quiere utilizar el permiso ``setgid`` debe situar un n?nmero dos (2)
al principio de los permisos que vaya a asignar mediante ``chmod``.

.. code:: screen

    # chmod 2755 ejemplosuid.sh

La nueva configuraci?n tiene un aspecto muy similar a la que ten?a
antes, pero observe que la ``s`` de antes est? ahora en el campo de los
permisos de grupo:

.. code:: screen

    -rwxr-sr-x   1 trhodes  trhodes    44 Aug 31 01:49 ejemplosuid.sh

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

En ambos ejemplos, incluso si el ?script? en cuesti?n es ejecutable, no
se va a ejecutar con un EUID distinto o un ID efectivo de usuario porque
los ?scripts? de shell no pueden acceder a la llama del sistema
`setuid(2) <http://www.FreeBSD.org/cgi/man.cgi?query=setuid&sektion=2>`__.

.. raw:: html

   </div>

Los dos permisos que acabamos de mostrar los bits de permisos
(``setuid`` y ``setgid``) pueden reducir el nivel de seguridad haciendo
que se escalen los permisos. Pero hay un tercer bit especial de permisos
que puede ser de mucha ayuda para reforzar la seguridad del sistema: el
``sticky bit``.

El ``sticky bit``\ ( que podr?amos traducir como ?bit pegajoso?)
aplicado a un directorio hace que solamente el propietario de un fichero
pueda borrarlo. Esto evita el borrado de ficheros ajenos en directorios
p?blicos como ``/tmp``. Si quiere usarlo coloque un uno (1) antes de los
permisos. Veamos un ejemplo:

.. code:: screen

    # chmod 1777 /tmp

Para ver el ``;sticky bit`` en acci?n usamos ``ls``:

.. code:: screen

    # ls -al / | grep tmp

.. code:: screen

    drwxrwxrwt  10 root  wheel         512 Aug 31 01:49 tmp

El ``sticky bit`` es la letra ``t`` al final de los permisos.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------+---------------------------+----------------------------------------+
| `Anterior <consoles.html>`__?           | `Subir <basics.html>`__   | ?\ `Siguiente <dirstructure.html>`__   |
+-----------------------------------------+---------------------------+----------------------------------------+
| 3.2. Consolas virtuales y terminales?   | `Inicio <index.html>`__   | ?3.4. Estructura de directorios        |
+-----------------------------------------+---------------------------+----------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
