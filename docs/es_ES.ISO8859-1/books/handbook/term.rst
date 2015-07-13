================
24.3. Terminales
================

.. raw:: html

   <div class="navheader">

24.3. Terminales
`Anterior <serial.html>`__?
Cap?tulo 24. Comunicaciones serie
?\ `Siguiente <dialup.html>`__

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

24.3. Terminales
----------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Contribuido porSean Kelly.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Las terminales proveen una manera conveniente y de bajo coste de accesar
su sistema FreeBSD cuando no se encuentra en la consola de la
computadora o en una red conectada. Esta secci?n describe como utilizar
terminales con FreeBSD.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

24.3.1. Usos y tipos de terminales
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Los sistemas originales UNIX? no ten?n consolas. En su lugar la gente se
firmaba y corr?a programas a trav?s de terminales conectadas a los
puertos serie de la computadora. Es bastante similar a usar un modem y
un programa de terminal para marcar hacia un sistema remoto para hacer
trabajo en modo texto.

Las PCs actuales tienen consolas con gr?ficos de alta calidad, pero la
habilidad para establecer una sesi?n en un puerto serie todav?a existe
en casi cualquier sistema operativo UNIX? al d?a de hoy; FreeBSD no es
la excepci?n. Utilizando una terminal conectada a un puerto serie libre,
usted puede accesar y correr cualquier programa de texto que podr?a
correr normalmente en la consola o en una ventana ``xterm`` en el
sistema X Window.

Para el usuario corporativo, se pueden conectar muchas terminales a un
sistema FreeBSD y ponerlas en los escritorios de sus empleados. Para un
usuario casero, una computadora de reserva, como una IBM PC m?s antigua
o una Macintosh?, puede ser una terminal cableada a una computadora m?s
poderosa corriendo FreeBSD. Puede convertir lo que de otra manera ser?a
una computadora de un solo usuario en un poderoso sistema de usuarios
m?ltiples.

Para FreeBSD, existen tres clases de terminales:

.. raw:: html

   <div class="itemizedlist">

-  `Terminales tontas <term.html#term-dumb>`__

-  `PCs actuando como terminales <term.html#term-pcs>`__

-  `Terminales X <term.html#term-x>`__

.. raw:: html

   </div>

Las subsecciones siguientes describen cada tipo.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

24.3.1.1. Terminales tontas
^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Terminales tontas son piezas de hardware especializadas que le permiten
conectar a computadoras a trav?s de l?neas serie. Son llamadas “tontas”
porque solo tienen poder computacional suficiente para desplegar, enviar
y recibir texto. No puede ejecutar ning?n programa en ellas. Es la
computadora a la cual se conectan la que tiene todo el poder para correr
editores de texto, compiladores, correo electr?nico, juegos, y dem?s.

Existen cientos de tipos de terminales tontas hechas por muchos
fabricantes, incluyendo VT-100 de Digital Equipment Corporation y WY-75
de Wyse. Cualquier tipo funcionar? con FreeBSD. Algunas terminales
superiores pueden incluso desplegar gr?ficos, pero solo ciertos paquetes
de software pueden tomar ventaja de estas funciones avanzadas.

Las terminales tontas son populares en ambientes de trabajo donde los
trabajadores no necesitan acceso a aplicaciones gr?ficas como las que
provee el sistema X Window.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

24.3.1.2. PCs actuando como terminales
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Si una `terminal tonta <term.html#term-dumb>`__ tiene apenas la
habilidad para desplegar, enviar y recibir texto, entonces ciertamente
cualquier computadora personal de reserva puede ser una terminal tonta.
Todo lo que necesita es el cable apropiado y alg?n software de
*emulaci?n de terminal* para correr en la computadora.

Tal configuraci?n es popular en hogares. Por ejemplo, si su consorte se
encuentra ocupado trabajando en la consola de su sistema FreeBSD, usted
puede realizar alg?n trabajo en modo texto al mismo tiempo desde una
computadora personal menos poderosa conectada como una terminal al
sistema FreeBSD.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

24.3.1.3. Terminales X
^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Las terminales X son el tipo m?s sofisticado de terminal disponible. En
lugar de conectar a un puerto serie, usualmente se conectan a una red
como Ethernet. En lugar de ser relegadas a aplicaciones de modo texto
pueden desplegar aplicaciones X.

Hemos introducido terminales X solo por complementar. Sin embargo, este
cap?tulo *no* cubre instalaci?n, configuraci?n o uso de terminales X.

.. raw:: html

   </div>

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

24.3.2. Configuraci?n
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Esta secci?n describe lo que necesita para configurar en su sistema
FreeBSD y permitirle habilitar sesiones de entrada en una terminal.
Asume que ya tiene configurado su kernel para soportar el puerto serie
al cual la terminal est? conectada—y que la tiene conectada.

Recuerde del `Cap?tulo?12, *El proceso de arranque en
FreeBSD* <boot.html>`__ que el proceso ``init`` es responsable del
control e inicializaci?n de todos los procesos al inicio del sistema.
Una de las tareas ejecutadas por ``init`` es leer el fichero
``/etc/ttys`` e iniciar un proceso ``getty`` en las terminales
disponibles. El proceso ``getty`` es responsable de leer un nombre de
entrada e iniciar el programa ``login`` .

As?, para configurar terminales para su sistema FreeBSD los siguientes
pasos deben hacerse como ``root``:

.. raw:: html

   <div class="procedure">

#. Agregue una l?nea a ``/etc/ttys`` para la entrada en el directorio
   ``/dev`` para el puerto serie si todav?a no se encuentra ah?.

#. Especifique que ``/usr/libexec/getty`` sea ejecutado en el puerto, y
   especifique el tipo apropiado de *``getty``* desde el fichero
   ``/etc/gettytab`` .

#. Especifique el tipo de terminal por omisi?n.

#. Ponga el puerto a “on.”

#. Especifique si el puerto debe ser o no “seguro.”

#. Obligue a ``init`` a releer el fichero ``/etc/ttys`` .

.. raw:: html

   </div>

Como un paso opcional, tal vez desee crear un tipo *``getty``*
personalizado para utilizar en el paso 2 mediante una entrada en
``/etc/gettytab``. Este cap?tulo no explica como realizarlo; por lo que
se le exhorta a leer las p?ginas de manual
`gettytab(5) <http://www.FreeBSD.org/cgi/man.cgi?query=gettytab&sektion=5>`__
y
`getty(8) <http://www.FreeBSD.org/cgi/man.cgi?query=getty&sektion=8>`__
para mayor informaci?n.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

24.3.2.1. Agregando una entrada a ``/etc/ttys``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El fichero ``/etc/ttys`` lista todos los puertos en su sistema FreeBSD
donde quiere permitir logins. Por ejemplo, la primera consola virtual
``ttyv0`` tiene una entrada en este fichero. Puede firmarse en la
consola utilizando esta entrada. Este fichero tambi?n contiene entradas
para las otras consolas virtuales, puertos serie y pseudo-ttys. Para una
terminal conectada por cable, solo liste la entrada ``/dev`` del puerto
serie sin la parte de ``/dev`` (por ejemplo, ``/dev/ttyv0`` deber?a
estar listado como ``ttyv0``).

Una instalaci?n por omisi?n de FreeBSD incluye un fichero ``/etc/ttys``
con soporte para los primeros cuatro puertos serie: ``ttyd0`` hasta
``ttyd3``. Si est? conectando una terminal a uno de esos puertos, no
necesita agregar otra entrada.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Ejemplo 24.1. Agregando entradas de terminal a ``/etc/ttys``

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Suponga que quisi?ramos conectar dos terminales al sistema: una Wyse-50
y una vieja IBM PC 286 corriendo el software de terminal Procomm
emulando una terminal VT-100. Conectamos la Wyse al segundo puerto serie
y la 286 al sexto puerto serie (un puerto en una tarjeta multipuerto
serie). Las entradas correspondiente en el fichero ``/etc/ttys`` se
ver?an como esto:

.. code:: programlisting

    ttyd1  "/usr/libexec/getty std.38400"  wy50  on  insecure
    ttyd5   "/usr/libexec/getty std.19200"  vt100  on  insecure
          

.. raw:: html

   <div class="calloutlist">

+--------------------------------------+--------------------------------------+
| `|1| <#co-ttys-line1col1>`__         | El primer campo normalmente          |
|                                      | especifica el nombre de fichero      |
|                                      | especial de la terminal como es      |
|                                      | hallado en ``/dev``.                 |
+--------------------------------------+--------------------------------------+
| `|2| <#co-ttys-line1col2>`__         | El segundo campo es el comando a     |
|                                      | ejecutar por esta l?nea, el cual es  |
|                                      | usualmente                           |
|                                      | `getty(8) <http://www.FreeBSD.org/cg |
|                                      | i/man.cgi?query=getty&sektion=8>`__. |
|                                      | ``getty`` inicializa y abre la       |
|                                      | l?nea, establece la velocidad,       |
|                                      | pregunta por un nombre de usuario y  |
|                                      | entonces ejecuta el programa         |
|                                      | `login(1) <http://www.FreeBSD.org/cg |
|                                      | i/man.cgi?query=login&sektion=1>`__  |
|                                      | .                                    |
|                                      |                                      |
|                                      | El programa ``getty`` acepta un      |
|                                      | par?metro (opcional) en su l?nea de  |
|                                      | comando, el tipo *``getty``*. Un     |
|                                      | tipo *``getty``* configura           |
|                                      | caracter?sticas en la l?nea de       |
|                                      | terminal, como tasa de bps y         |
|                                      | paridad. El programa ``getty`` lee   |
|                                      | estas caracter?sticas desde el       |
|                                      | fichero ``/etc/gettytab``.           |
|                                      |                                      |
|                                      | El fichero ``/etc/gettytab``         |
|                                      | contiene muchas entradas para l?neas |
|                                      | de terminal viejas y nuevas. En la   |
|                                      | mayor?a de los casos, las entradas   |
|                                      | que empiezan con el texto ``std``    |
|                                      | funcionar?n para terminales          |
|                                      | conectadas f?sicamente. Estas        |
|                                      | entradas ignoran la paridad. Existe  |
|                                      | una entrada ``std`` por cada tasa de |
|                                      | bps de 110 a 115200. Por supuesto    |
|                                      | puede agregar sus propias entradas a |
|                                      | este fichero. La p?gina de manual    |
|                                      | `gettytab(5) <http://www.FreeBSD.org |
|                                      | /cgi/man.cgi?query=gettytab&sektion= |
|                                      | 5>`__                                |
|                                      | provee mayor informaci?n.            |
|                                      |                                      |
|                                      | Al establecer el tipo *``getty``* en |
|                                      | el fichero ``/etc/ttys``, aseg?rese  |
|                                      | que las propiedades de               |
|                                      | comunicaciones en la terminal        |
|                                      | concuerden.                          |
|                                      |                                      |
|                                      | Para nuestro ejemplo, la Wyse-50 no  |
|                                      | usa paridad y conecta a 38400?bps.   |
|                                      | La 286?PC no usa paridad y conecta a |
|                                      | 19200?bps.                           |
+--------------------------------------+--------------------------------------+
| `|3| <#co-ttys-line1col3>`__         | El tercer campo es el tipo de        |
|                                      | terminal usualmente conectado a esa  |
|                                      | l?nea tty. Para puertos dial-up,     |
|                                      | ``unknown`` o ``dialup`` son usados  |
|                                      | t?picamente en este campo puesto que |
|                                      | los usuarios pueden marcar           |
|                                      | pr?cticamente con cualquier tipo de  |
|                                      | terminal o de software. Para         |
|                                      | terminales conectadas f?sicamente,   |
|                                      | el tipo de terminal no cambia, as?   |
|                                      | que puede poner un tipo de terminal  |
|                                      | real del fichero de base de datos    |
|                                      | `termcap(5) <http://www.FreeBSD.org/ |
|                                      | cgi/man.cgi?query=termcap&sektion=5> |
|                                      | `__                                  |
|                                      | en este campo.                       |
|                                      |                                      |
|                                      | Para nuestro ejemplo, la Wyse-50     |
|                                      | utiliza el tipo de terminal real     |
|                                      | mientras que la PC 286 corriendo     |
|                                      | Procomm ser? puesta a emular una     |
|                                      | VT-100.                              |
+--------------------------------------+--------------------------------------+
| `|4| <#co-ttys-line1col4>`__         | El cuarto campo especifica si el     |
|                                      | puerto debe habilitarse. Poniendo    |
|                                      | ``on`` aqu? provocar? que el proceso |
|                                      | ``init`` inicie el programa en el    |
|                                      | segundo campo, ``getty``. Si pone    |
|                                      | ``off`` en este campo, no habr?      |
|                                      | ``getty``, y por consecuencia ningun |
|                                      | login en el puerto.                  |
+--------------------------------------+--------------------------------------+
| `|5| <#co-ttys-line1col5>`__         | El ?ltimo campo es utilizado para    |
|                                      | especificar si el puerto es seguro.  |
|                                      | Marcar un puerto como seguro         |
|                                      | significa que se conf?a en ?l lo     |
|                                      | suficiente para permitir que la      |
|                                      | cuenta ``root`` (o cualquier cuenta  |
|                                      | con un ID de usuario 0) se firme     |
|                                      | desde ese puerto. Los puertos        |
|                                      | inseguros no permiten entradas de    |
|                                      | ``root``. En un puerto inseguro, los |
|                                      | usuarios deben firmarse desde        |
|                                      | cuentas sin privilegios y entonces   |
|                                      | utilizar                             |
|                                      | `su(1) <http://www.FreeBSD.org/cgi/m |
|                                      | an.cgi?query=su&sektion=1>`__        |
|                                      | o un mecanismo similar para acceder  |
|                                      | a privilegios de superusuario.       |
|                                      |                                      |
|                                      | Es altamente recomendable que        |
|                                      | utilize “insecure” incluso para      |
|                                      | terminales que se encuentran detr?s  |
|                                      | de puertas con llave. Es muy         |
|                                      | sencillo entrar y usar ``su`` si     |
|                                      | necesita privilegios de              |
|                                      | superusuario.                        |
+--------------------------------------+--------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

24.3.2.2. Forzar ``init`` a que relea ``/etc/ttys``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Despues de realizar los cambios necesarios al fichero ``/etc/ttys``
deber?a mandar una se?al SIGHUP (hangup) al proceso ``init`` para
forzarlo a releer su fichero de configuraci?n. Por ejemplo:

.. code:: screen

    # kill -HUP 1

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

``init`` siempre es el primer proceso que corre en un sistema, por lo
tanto siempre tendr? el PID 1.

.. raw:: html

   </div>

Si todo est? puesto correctamente, todos los cables en su lugar, y las
terminales est?n encendidas, entonces un proceso ``getty`` debe estar
corriendo en cada terminal y deber?a ver prompts de entrada en sus
terminales en este punto.

.. raw:: html

   </div>

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

24.3.3. Determinando errores en su conexi?n
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Incluso con la m?s meticulosa etenci?n al detalle, algo puede salir mal
mientras se configura una terminal. Esta es una lista de s?ntomas y
algunos arreglos sugeridos.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

24.3.3.1. No aparece prompt de login
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Aseg?rese que la terminal est? conectada y encendida, aseg?rese que se
encuentra ejecutando un software de emulaci?n de terminal en el puerto
serie correcto.

Aseg?rese que el cable est? conectado firmemente tanto a la terminal
como a la computadora FreeBSD. Aseg?rese que es el tipo correcto de
cable.

Aseg?rese que la terminal y FreeBSD concuerdan en la tasa de bps y
propiedades de paridad. Si tiene una terminal de desplegado de video,
aseg?rese que los controles de contraste y brillo est?n encendidos. Si
es una terminal de impresi?n, aseg?rese que papel y tinta se encuentren
en forma.

Aseg?rese que un proceso ``getty`` est? corriendo y sirviendo la
terminal. Por ejemplo, para obtener una lista de procesos ``getty`` con
``ps``, tecl?e:

.. code:: screen

    # ps -axww|grep getty

Deber?a ver una entrada para la terminal. Por ejemplo, el siguiente
desplegado muestra que un ``getty`` est? corriendo en el segundo puerto
serie ``ttyd1`` y est? utilizando la entrada ``std.38400`` en
``/etc/gettytab``:

.. code:: screen

    22189  d1  Is+    0:00.03 /usr/libexec/getty std.38400 ttyd1

Si no hay un proceso ``getty`` corriendo, aseg?rese que tiene habilitado
el puerto en ``/etc/ttys``. Recuerde tambi?n ejecutar ``kill -HUP 1``
despues de modificar el fichero ``ttys``.

Si el proceso ``getty`` est? corriendo pero la terminal todav?a no
despliega un prompt de login, o si despliega un prompt pero no le
permite escribir, su terminal o cable tal vez no soporte inicializaci?n
por hardware. Trate cambiar la entrada en ``/etc/ttys`` de ``std.38400``
a ``3wire.38400`` recuerde correr ``kill -HUP 1`` despues de modificar
``/etc/ttys``. La entrada ``3wire`` es similar a ``std``, pero ignora la
inicializaci?n por harware. Tal vez necesite reducir la tasa de baudios
o habilitar control de flujo por software cuando utilice ``3wire`` para
prevenir desbordamientos de buffer.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

24.3.3.2. Si aparece basura en lugar de un prompt de login
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Aseg?rese que la terminal y FreeBSD concuerdan en la tasa de bps y
propiedades de paridad. Revise los procesos ``getty`` para asegurarse
que el tipo correcto de *``getty``* est? en uso. Si no es as?, edite
``/etc/ttys`` y ejecute ``kill -HUP 1``.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

24.3.3.3. Los caracteres aparecen doble; las contrase?as aparecen cuando se escriben
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Cambie la terminal (o el software de emulaci?n de terminal) de “half
duplex” o “local echo” a “full duplex.”

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------+--------------------------------+----------------------------------+
| `Anterior <serial.html>`__?   | `Subir <serialcomms.html>`__   | ?\ `Siguiente <dialup.html>`__   |
+-------------------------------+--------------------------------+----------------------------------+
| 24.2. Introducci?n?           | `Inicio <index.html>`__        | ?24.4. Servicio dial-in          |
+-------------------------------+--------------------------------+----------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.

.. |1| image:: ./imagelib/callouts/1.png
.. |2| image:: ./imagelib/callouts/2.png
.. |3| image:: ./imagelib/callouts/3.png
.. |4| image:: ./imagelib/callouts/4.png
.. |5| image:: ./imagelib/callouts/5.png
