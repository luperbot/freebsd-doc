=====================
10.8. Temas avanzados
=====================

.. raw:: html

   <div class="navheader">

10.8. Temas avanzados
`Anterior <sapr3.html>`__?
Cap?tulo 10. Compatibilidad binaria con Linux
?\ `Siguiente <system-administration.html>`__

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

10.8. Temas avanzados
---------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Si siente curiosidad por saber c?mo funciona la compatibilidad con Linux
esta es la secci?n que debe leer. La mayor parte de lo que sigue est?
basado casi en su totalidad en un mensaje enviado por Terry Lambert
``<tlambert@primenet.com>`` a la lista `lista de charla de
FreeBSD <http://lists.FreeBSD.org/mailman/listinfo/freebsd-chat>`__
(Message ID: ``<199906020108.SAA07001@usr09.primenet.com>``).

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

10.8.1. ?C?mo funciona?
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD dispone de una abstracci? denominada “cargador de clase en
ejecuci?n”. Esto no es m?s que un bloque de c?digo incrustado en la
llamada
`execve(2) <http://www.FreeBSD.org/cgi/man.cgi?query=execve&sektion=2>`__
del sistema.

Hist?ricamente las plataformas UNIX? dispon?an de un ?nico cargador de
binarios, que en ?ltima instancia (*fallback*) recurr?a al cargador
``#!`` para ejecutar cualesquiera int?rpretes o scripts de la shell. Ese
cargador ?nico examinaba el n?mero m?gico (generalmente los 4 u 8
primeros bytes del fichero) para ver si era un binario reconocible por
el sistema y, en tal caso, invocaba al cargador binario.

Si no era de tipo binario, la llamada
`execve(2) <http://www.FreeBSD.org/cgi/man.cgi?query=execve&sektion=2>`__
devolv?a un error y la shell intentaba empezar a ejecutarlo como ?rdenes
shell, tomando por defecto como punto de partida “la shell actual, sea
cual sea”.

Posteriormente se pens? en hacer una modificaci?n de manera que
`sh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sh&sektion=1>`__
examinara los dos primeros caracteres, de modo que si eran ``:\n`` se
llamaba a la shell
`csh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=csh&sektion=1>`__ en
su lugar (parece ser que en SCO fueron los primeros en utilizar ese
truco).

Lo que ocurre ahora es que FreeBSD dispone de una lista de cargadores,
en lugar de uno solo. FreeBSD recorre esa lista de cargadores, con un
cargador gen?rico ``#!`` que sabe reconocer los int?rpretes en base a
los caracteres que siguen al siguiente espacio en blanco, con
``/bin/sh`` como ?ltimo recurso.

Para dar soporte a la ABI (“Application Binary Interface”) de Linux,
FreeBSD interpreta el n?mero m?gico como un binario ELF (“Executable and
Linking Format”): En este punto no hace distinci?n entre FreeBSD,
Solaris™, Linux? o cualquier otro SO que tenga un tipo de imagen ELF.

El cargador ELF busca entonces una marca (*brand*) especial, una secci?n
de comentarios en la imagen ELF que no est? presente en los binarios ELF
de SVR4/Solaris™.

Para que los binarios de Linux funcionen deben estar marcados con
`brandelf(1) <http://www.FreeBSD.org/cgi/man.cgi?query=brandelf&sektion=1>`__
como tipo ``Linux``:

.. code:: screen

    # brandelf -t Linux file

Hecho esto el cargador ELF ver? la marca ``Linux`` en el fichero.

Cuando el cargador ELF ve la marca ``Linux`` sustituye un puntero en la
estructura ``proc``. Todas las llamadas del sistema se indexan a trav?s
de este puntero (en un sistema UNIX? tradicional ser?a el ?array? de
estructura ``sysent[]`` que contiene las llamadas del sistema). Adem?s,
el proceso se marca con unos indicadores (“flags”) para que el vector
trampa del c?digo de env?o se?ales lo maneje de una forma determinada,
as? como otros arreglos (menores) que ser?n utilizados por el m?dulo
Linux del kernel.

El vector de llamada del sistema Linux contiene, entre otras cosas, una
lista de entradas ``sysent[]`` cuyas direcciones residen en el m?dulo
del kernel.

Cuando el binario Linux realiza una llamada al sistema, el c?digo trampa
extrae el puntero a la funci?n de la llamada del sistema de la
estructura ``proc``, y as? obtiene los puntos de entrada a las llamadas
del sistema Linux, no las de FreeBSD.

Adem?s, el modo Linux cambia la ra?z de las b?squedas de una forma
din?mica. En efecto, esto es lo que hace la opci?n ``union`` cuando se
monta un sistema de ficheros (?y que *no* es lo mismo que el sistema de
ficheros ``unionfs``!). Primero se hace un intento de buscar el fichero
en el directorio ``/compat/linux/ruta-original`` y *solo despu?s*, si lo
anterior falla, se repite la b?squeda en el directorio
``/ruta-original``. Esto permite que se puedan ejecutar binarios que
necesitan de otros binarios (por ejemplo las herramientas de
programaci?n (“toolchain”) de Linux pueden ejecutarse en su totalidad
bajo la ABI de Linux). Esto significa tambi?n que los binarios Linux
pueden cargar y ejecutar binarios FreeBSD si los binarios Linux
equivalentes no se hallan presentes y que se puede poner una orden
`uname(1) <http://www.FreeBSD.org/cgi/man.cgi?query=uname&sektion=1>`__
en el ?rbol de directorios ``/compat/linux`` para poder estar seguros de
que los binarios Linux no puedan decir que no estaban ejecut?ndose en
Linux.

En efecto, hay un kernel Linux en el kernel FreeBSD; las distintas
funciones subyacentes que implementan todos los servicios proporcionados
por el kernel son id?nticas en ambas, las tablas de entradas de llamadas
del sistema en FreeBSD y en Linux: operaciones del sistema de ficheros,
operaciones de memoria virtual, env?o de se?ales IPC System V, etc. La
?nica diferencia es que los binarios FreeBSD reciben sus funciones de
conexi?n (“*glue*”) y los binarios Linux las suyas (la mayor?a de los
sistemas operativos m?s antiguos solo tienen sus propias funciones de
conexi?n: direcciones de funciones en un “array” de estructura
``sysent[]`` est?tica y global, en lugar de direcciones de funciones que
se extraen a partir de un puntero inicializado din?micamente en la
estructura ``proc`` del proceso que hace la llamada).

?Cu?l es entonces la ABI nativa de FreeBSD? No importa. B?sicamente, la
?nica diferencia es (ahora mismo; esto podr?a cambiar y probablemente lo
har? en una release futura) que las funciones de conexi?n de FreeBSD
est?n enlazadas est?ticamente en el kernel mientras que las de Linux
pueden estarlo tambi?n est?ticamente o se puede acceder a ellas por
medio de un m?dulo del kernel.

Bien, pero ?de verdad es esto una emulaci?n? No. Es una implementaci?n
ABI, no una emulaci?n. No hay un emulador involucrado (ni un simulador,
para adelantarnos a la siguiente pregunta).

Entonces ?por qu? a veces se le llama “emulaci?n Linux”? ?Para hacer m?s
dif?cil el vender FreeBSD! En serio, se debe a que la primera
implementaci?n se hizo en un momento en que realmente no hab?a ninguna
palabra distinta a esa para describir lo que se estaba haciendo; decir
que FreeBSD ejecutaba binarios Linux no era cierto si no se compilaba el
c?digo o se cargaba un m?dulo; hac?a falta una forma de describir todo
esto y acabamos usando “emulador Linux”.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------+-----------------------------+-------------------------------------------------+
| `Anterior <sapr3.html>`__?        | `Subir <linuxemu.html>`__   | ?\ `Siguiente <system-administration.html>`__   |
+-----------------------------------+-----------------------------+-------------------------------------------------+
| 10.7. Instalaci?n de SAP??R/3??   | `Inicio <index.html>`__     | ?Parte?III.?Administraci?n del sistema.         |
+-----------------------------------+-----------------------------+-------------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
