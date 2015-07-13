===============
5.2. Entender X
===============

.. raw:: html

   <div class="navheader">

5.2. Entender X
`Anterior <x11.html>`__?
Cap?tulo 5. El sistema X Window
?\ `Siguiente <x-install.html>`__

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

5.2. Entender X
---------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Usar X por primera vez puede resultar chocante para alguien
familiarizado con otros entornos gr?ficos, como Microsoft??Windows? o
Mac?OS?.

No es necesario entender todos los detalles de los diferentes
componentes de X y como interact?an, pero un conocimiento b?sico hace
posible el sacarle m?s provecho a la potencia de X.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.2.1. ?Por qu? X?
~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

X no es el primer sistema de ventanas escrito para UNIX? pero es el m?s
popular de todos ellos. El equipo original que desarroll? X trabaj? en
otro sistema de ventanas antes de escribir X. Ese sistema se llam? ?W?
(de ?Window? que significa ventana en ingl?s). X era solo la siguiente
letra en el alfabeto Romano.

X se puede llamar ?X? ?X Window System?, ?X11? y de otras formas.
Tambi?n puede usar el t?rmino ?X Windows? para describir X11 si lo que
quiere es ofender a algunas personas; si quiere saber m?s sobre esto
consulte
`X(7) <http://www.FreeBSD.org/cgi/man.cgi?query=X&sektion=7>`__.

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

5.2.2. El modelo cliente/servidor de X
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

X fue dise?ado desde el principio pensando en redes y adopt? un modelo
?cliente-servidor?.

En el modelo de X el ?servidor X? se ejecuta en la m?quina que tiene el
teclado, monitor y rat?n. El servidor es responsable de manejar la
pantalla, la entrada de datos a trav?s del teclado, el rat?n, etc. Cada
aplicaci?n X (como una XTerm o Netscape?) es un ?cliente?. Un cliente
manda mensajes al servidor como ?Por favor dibuja una ventana en estas
coordenadas? y el servidor devuelve mensajes como ?El usuario ha pulsado
el bot?n OK?.

S? solo hay un ordenador involucrado, como en una casa o una peque?a
oficina, el servidor X y los clientes X seguramente se ejecutar?n en el
mismo sistema. Sin embargo, es perfectamente posible ejecutar el
servidor X en un sistema de escritorio menos potente y ejecutar las
aplicaciones X (los clientes) en, por ejemplo, la potente y cara m?quina
que sirve la oficina. En este panorama la comunicaci?n entre el cliente
X y el servidor tiene lugar a trav?s de la red.

Esto confunde a algunas personas, porque la terminolog?a es exactamente
opuesta a lo que ellos esperan. Ellos esperan que el ?servidor X? sea la
m?quina grande que hay en el s?tano y que el ?cliente X? sea la m?quina
de su mesa.

Es importante que recuerde que el servidor X es la m?quina con el
monitor y el teclado y que los clientes X son los programas que muestran
las ventanas.

No hay nada en el protocolo que obligue a que el cliente y el servidor
tengan que usar el mismo sistema operativo o incluso que est?n en el
mismo sistema. Es posible ejecutar un servidor X en Microsoft??Windows?
o en el Mac?OS? de Apple; de hecho hay varias aplicaciones libres y
comerciales que hacen exactamente eso.

A partir de FreeBSD?5.3-RELEASE, el servidor X que se instala con
FreeBSD es Xorg, que es libre y se distribuye bajo una licencia muy
similar a la de FreeBSD. Tambi?n hay servidores X comerciales para
FreeBSD.

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

5.2.3. El gestor de ventanas
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

La filosof?a de dise?o de X es m?s parecida a la de UNIX?:
?herramientas, no normas?. Esto significa que X no impone c?mo debe
hacerse una tarea. En lugar de eso proporciona herramientas al usuario y
es responsabilidad suya decidir qu? hacer con ellas.

Esta filosof?a se extiende a X; no impone como deben verse las ventanas
en la pantalla, c?mo moverlas con el rat?n, qu? teclas deber?an usarse
para moverse entre ventanas (por ejemplo **Alt**+**Tab**, en
Microsoft??Windows?), c?mo deben ser las barras de t?tulo en cada
ventana, si tienen o no bot?n de cierre, etc.

En lugar de eso X delega esta responsabilidad en una aplicaci?n llamada
?gestor de ventanas?. Hay docenas de gestores de ventanas disponibles
para X: AfterStep, Blackbox, ctwm, Enlightenment, fvwm, Sawfish, twm,
Window Maker, etc. Cada uno de estos gestores de ventanas tiene un
aspecto diferente; algunos soportan ?escritorios virtuales?; otros
permiten personalizar las teclas para manejar el escritorio; otros
tienen un bot?n de ?Inicio? o algo similar; otros tienen ?dise?os
modificables?, permitiendo un cambio completo del aspecto mediante un
nuevo dise?o. Estos gestores de ventanas, y muchos otros, est?n en la
categor?a ``x11-wm`` de los ports.

Adem?s, los entornos de escritorio KDE y GNOME tienen sus propios
gestores de ventanas integrados con el escritorio.

Cada gestor de ventanas tiene diferentes mecanismos de configuraci?n; en
algunos debe escribir el fichero de configuraci?n a mano, otros tienen
herramientas gr?ficas para la mayor parte de la configuraci?n; y al
menos uno (Sawfish) tiene un fichero de configuraci?n escrito en un
dialecto del lenguaje Lisp.

.. raw:: html

   <div class="note" xmlns="">

Pol?tica de foco:
~~~~~~~~~~~~~~~~~

Otra responsabilidad del gestor de ventanas es la ?pol?tica de foco? del
rat?n. Todos los sistemas de ventanas necesitan algo para elegir una
ventana activa que recibir? los eventos y tambi?n debieran indicar
claramente qu? ventana est? activa.

Una pol?tica muy popular es la de ?click to focus?. Este es el modelo
que utiliza Microsoft??Windows?, en el que una ventana se convierte en
activa al recibir un clic del rat?n.

X no tiene ninguna pol?tica de foco. En lugar de eso el gestor de
ventanas controla qu? ventana tiene el foco en todo momento. Los
diferentes gestores de ventanas tienen diferentes pol?ticas de foco.
Todos soportan la pol?tica ?clic-para-foco? y la mayor?a de ellos
tambi?n soportan otros m?todos.

Las pol?ticas de foco m?s populares son:

.. raw:: html

   <div class="variablelist" xmlns="http://www.w3.org/1999/xhtml">

el-foco-sigue-al-rat?n (``focus-follows-mouse``)
    La ventana que esta bajo el puntero del rat?n es la ventana que
    tiene el foco. No es necesario que la ventana est? encima de las
    dem?s ventanas. El foco se cambia al apuntar a otra ventana, aunque
    no es necesario hacer clic en ella.

foco-descuidado ``sloppy-focus``
    Esta pol?tica es una peque?a extensi?n de ?el-foco-sigue-al-rat?n?.
    En ?el-foco-sigue-al-rat?n? si el rat?n se mueve sobre la ventana
    ra?z (o fondo) ninguna ventana tiene el foco y las pulsaciones del
    teclado se perder?n. Con la pol?tica ?foco-descuidado? el foco s?lo
    cambia cuando el cursor entra en una nueva ventana y no cuando sale
    de la ventana actual.

click-para-foco ``click-to-focus``
    La ventana activa se selecciona con un clic del rat?n. La ventana se
    puede ?levantar? y aparecer delante de las dem?s ventanas. Todas las
    pulsaciones de teclado ser?n redirigidas a esa ventana aunque el
    cursor se mueva a otra ventana.

.. raw:: html

   </div>

Muchos gestores de ventanas soportan otras pol?ticas o variaciones de
estas. Consulte la documentaci?n del propio gestor de ventanas.

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

5.2.4. Widgets
~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

La idea de X de hacer herramientas en vez de normas y se extiende a los
?widgets? que se ven en la pantalla de cada aplicaci?n.

?Widget? es un t?rmino que abarca todos los objetos en el interfaz de
usuario que pueden pulsarse con el rat?n manipularse de alguna manera:
botones, ?check boxes?, listas, etc. Microsoft??Windows? los llama
?controles?.

Microsoft??Windows? y Mac?OS? de Apple tienen una pol?tica de ?widgets?
muy r?gida. Se supone que los desarrolladores de aplicaciones comparten
el aspecto. En X no se consider? imponer un estilo gr?fico o un conjunto
de ?widgets? al que adherirse.

Como resultado no se puede esperar que las aplicaciones de X tengan un
aspecto homog?neo. Hay varios conjuntos de ?widgets? y variaciones muy
populares como el ?widget? Athena creado en el MIT, Motif? (donde los
?widgets? de Microsoft??Windows? fueron modelados, con todos los bordes
biselados y tres tonos de gris), OpenLook, y otros.

Las aplicaciones m?s modernas de X usan un conjunto de ?widgets? con
mejor aspecto, o Qt, utilizado por KDE, o GTK+, que usa el proyecto
GNOME. Se intenta que el aspecto del escritorio de UNIX? sea parecido,
lo que hace la vida m?s f?cil al usuario novato.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------+---------------------------+-------------------------------------+
| `Anterior <x11.html>`__?           | `Subir <x11.html>`__      | ?\ `Siguiente <x-install.html>`__   |
+------------------------------------+---------------------------+-------------------------------------+
| Cap?tulo 5. El sistema X Window?   | `Inicio <index.html>`__   | ?5.3. Instalar X11                  |
+------------------------------------+---------------------------+-------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
