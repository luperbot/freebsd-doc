============================
5.6. El gestor de pantalla X
============================

.. raw:: html

   <div class="navheader">

5.6. El gestor de pantalla X
`Anterior <x-fonts.html>`__?
Cap?tulo 5. El sistema X Window
?\ `Siguiente <x11-wm.html>`__

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

5.6. El gestor de pantalla X
----------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Escrito por Seth Kingsley.

.. raw:: html

   </div>

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

5.6.1. Descripci?n
~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El gestor de pantalla X (XDM) es una parte opcional del sistema X Window
que se usa para la gesti?n de sesiones. Esto es ?til en diferentes
situaciones, como ?Terminales X? con escritorios m?nimos y grandes
servidores de red. Como X Window System es independiente del protocolo y
de la red hay muchas configuraciones posibles para ejecutar clientes y
servidores X en diferentes equipos conectados a una red. XDM dispone de
un interfaz gr?fico para elegir a qu? pantalla se quiere conectar y
pedir la informaci?n de autentificaci?n como el nombre de usuario y le
contrase?a.

XDM ac6t?a como proveedor de la misma funcionalidad que
`getty(8) <http://www.FreeBSD.org/cgi/man.cgi?query=getty&sektion=8>`__
(consulte `Secci?n?24.3.2, “Configuraci?n” <term.html#term-config>`__
para m?s detalles). Esto quiere decir que se encarga de las entradas al
sistema en la pantalla a la que est? conectado y arranca el gestor de
sesiones para que lo utilice el usuario (normalmente un gestor de
ventanas X). XDM espera a que el programa termine, env?a la se?al de que
el usuario ha terminado y que se le deber?a desconectar de la pantalla.
En este punto XDM puede mostrar las pantallas de entrada al sistema y de
selecci?n de pantalla para que el siguiente usuario intente acceder al
sistema.

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

5.6.2. Uso de XDM
~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El d?mon XDM est? en ``/usr/local/bin/xdm``. Este programa se puede
arrancar en cualquier momento como ``root`` y empezar? a gestionar la
pantalla X en la m?quina local. Si se quiere que XDM arranque cada vez
que la m?quina se encienda puede hacerlo a?adiendo una entrada a
``/etc/ttys``. Para m?s informaci?n sobre el formato y uso de este
fichero consulte la `Secci?n?24.3.2.1, “Agregando una entrada a
``/etc/ttys``\ ” <term.html#term-etcttys>`__. Por omisi?n hay una l?nea
en ``/etc/ttys`` que permite arrancar el d?mon XDM en una terminal
virtual:

.. code:: screen

    ttyv8   "/usr/local/bin/xdm -nodaemon"  xterm   off secure

Por omisi?n esta entrada est? deshabilitada; para habilitarla cambie el
campo 5 de ``off`` a ``on`` y reinicie
`init(8) <http://www.FreeBSD.org/cgi/man.cgi?query=init&sektion=8>`__
usando los pasos descritos en la `Secci?n?24.3.2.2, “Forzar ``init`` a
que relea ``/etc/ttys``\ ” <term.html#term-hup>`__. El primer campo es
el nombre de la terminal que que gestiona el programa, ``ttyv8``. Es
decir, XDM empezar? a ejecutarse en la terminal virtual n?mero 9.

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

5.6.3. Configuraci?n de XDM
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El directorio de configuraci?n de XDM est? en
``/usr/local/lib/X11/xdm``. En este directorio hay varios ficheros que
se usan para intervenir en el comportamiento y la apariencia de XDM.
Normalmente tendr? estos ficheros:

.. raw:: html

   <div class="informaltable">

+-------------------+------------------------------------------------------------------+
| Fichero           | Descripci?n                                                      |
+===================+==================================================================+
| ``Xaccess``       | Reglas de acceso para clientes.                                  |
+-------------------+------------------------------------------------------------------+
| ``Xresources``    | Recursos de X por omisi?n.                                       |
+-------------------+------------------------------------------------------------------+
| ``Xservers``      | Lista de pantallas locales y remotas a gestionar.                |
+-------------------+------------------------------------------------------------------+
| ``Xsession``      | ?script? por omisi?n para el acceso al sistema.                  |
+-------------------+------------------------------------------------------------------+
| ``Xsetup_``\ \*   | ?script? para lanzar aplicaciones antes del acceso al sistema.   |
+-------------------+------------------------------------------------------------------+
| ``xdm-config``    | Configuraci?n de todas las pantallas de este equipo.             |
+-------------------+------------------------------------------------------------------+
| ``xdm-errors``    | Errores generados por el programa servidor.                      |
+-------------------+------------------------------------------------------------------+
| ``xdm-pid``       | El ID de proceso del XDM que est? funcionando.                   |
+-------------------+------------------------------------------------------------------+

.. raw:: html

   </div>

En este directorio tambi?n hay unos cuantos programas y ?scripts? que se
usan para arrancar el escritorio cuando XDM se est? ejecutando. El
objetivo de cada uno de estos ficheros ser? descrito brevemente. La
sintaxis exacta y el uso de todos estos ficheros se describe en
`xdm(1) <http://www.FreeBSD.org/cgi/man.cgi?query=xdm&sektion=1>`__.

La configuraci?n por omisi?n es una simple ventana rectangular de acceso
al sistema con el nombre de la m?quina en la parte superior en un tipo
de letra grande y unos campos para que introduzca?Login:? y ?Password:?
debajo. Este es un buen punto de partida para aprender a cambiar el
aspecto de las pantallas de XDM.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.6.3.1. Xaccess
^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El protocolo para conectar con las pantallas controladas por XDM se
llama ?X Display Manager Connection Protocol? (XDMCP). Este fichero es
un conjunto de reglas para controlar las conexiones XDMCP desde otros
equipos. Por defecto permite a cualquier cliente conectar, pero eso no
importa a menos que ``xdm-config`` se cambie para escuchar conexiones
remotas. La configuraci?n b?sica no permite conexiones desde ning?n
cliente.

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

5.6.3.2. Xresources
^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Este es el fichero de opciones por defecto para el selector de pantalla
y acceso al sistema. Aqu? es donde se puede modificar la apariencia del
programa de ?login?. El formato es id?ntico al fichero de opciones por
defecto descrito en la documentaci?n de X11.

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

5.6.3.3. Xservers
^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Una lista de pantallas remotas entre las que elegir.

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

5.6.3.4. Xsession
^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Este es el ?script? de sesi?n que por defecto XDM arrancar? despu?s de
que el usuario acceda al sistema. Normalmente cada usuario tendr? una
versi?n personalizada del ?script? de sesi?n en ``~/.xsession`` que
sobreescribe el ?script? por defecto.

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

5.6.3.5. Xsetup\_\*
^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Estos se arrancar?n autom?ticamente antes de que se muestre el interfaz
de selecci?n o de acceso al sistema. Hay un ?script? por cada gestor de
ventanas disponible llamados ``Xsetup_`` seguido por el n?mero de
pantalla local (por ejemplo ``Xsetup_0``). Normalmente estos ?scripts?
arrancan uno o dos programas en segundo plano, por ejemplo ``xconsole``.

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

5.6.3.6. xdm-config
^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Este fichero contiene las opciones por defecto aplicables a todas las
pantallas que gestiona la instalaci?n.

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

5.6.3.7. xdm-errors
^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Este fichero contiene la salida de los servidores X que XDM intente
arrancar. Si alguna pantalla que XDM intente arrancar se cuelga por
alguna raz?n este es un buen sitio para buscar los mensajes de error.
Estos mensajes tambi?n se escriben en el fichero ``~/.xsession-errors``
del usuario en cada sesi?n.

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

5.6.4. Ejecutar un servidor de pantalla a trav?s de la red
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Para que otros clientes puedan conectar al servidor de pantalla edite
las reglas de acceso y habilite la escucha en la conexi?n. Por omisi?n
se aplican restricciones. Si quiere que XDM escuche conexiones comente
la siguiente l?nea en el fichero ``xdm-config``:

.. code:: screen

    ! SECURITY: do not listen for XDMCP or Chooser requests
    ! Comment out this line if you want to manage X terminals with xdm
    DisplayManager.requestPort:     0

y despu?s reinicie XDM. Recuerde que los comentarios en los ficheros de
opciones por defecto comienzan con el car?cter?!? en vez del t?pico ?#?.
Puede aplicar controles m?s restrictivos. Consulte las opciones de
ejemplo en ``Xaccess`` y la p?gina de manual de
`xdm(1) <http://www.FreeBSD.org/cgi/man.cgi?query=xdm&sektion=1>`__.

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

5.6.5. Alternativas a XDM
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Hay algunas alternativas al programa por defecto XDM. Una de ellas, kdm
(que se incluye con KDE) se describe m?s adelante en este cap?tulo. kdm
ofrece muchas ventajas visuales y funcionalidad para permitir a los
usuarios elegir su gestor de ventanas en el momento del acceso al
sistema.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------+---------------------------+----------------------------------+
| `Anterior <x-fonts.html>`__?   | `Subir <x11.html>`__      | ?\ `Siguiente <x11-wm.html>`__   |
+--------------------------------+---------------------------+----------------------------------+
| 5.5. Uso de tipos en X11?      | `Inicio <index.html>`__   | ?5.7. Entornos de escritorio     |
+--------------------------------+---------------------------+----------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
