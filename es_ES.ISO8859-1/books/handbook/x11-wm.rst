===========================
5.7. Entornos de escritorio
===========================

.. raw:: html

   <div class="navheader">

5.7. Entornos de escritorio
`Anterior <x-xdm.html>`__?
Cap?tulo 5. El sistema X Window
?\ `Siguiente <common-tasks.html>`__

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

5.7. Entornos de escritorio
---------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Escrito por Valentino Vaschetto.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Est? secci?n describe los diferentes entornos de escritorio disponibles
para X en FreeBSD. Un ?entorno de escritorio? puede ser cualquier cosa
que vaya desde un simple gestor de ventanas hasta una completa ?suite?
de aplicaciones de escritorio como KDE o GNOME.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.7.1. GNOME
~~~~~~~~~~~~

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

5.7.1.1. Acerca de GNOME
^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

GNOME es un entorno de escritorio amigable que permite a los usuarios
una configuraci?n f?cil de sus sistemas. GNOME incluye un panel (para
iniciar las aplicaciones y mostrar su estado), un escritorio (donde
pueden colocarse los datos y las aplicaciones), un conjunto de
herramientas y aplicaciones de escritorio est?ndar y un conjunto de
convenciones para facilitar la creaci?n de aplicaciones que sean
consistentes y colaboren unas con otras. Los usuarios de otros sistemas
operativos o entornos pueden sentirse como en casa utilizando el
poderoso entorno gr?fico GNOME. Encontrar? m?s informaci?n sobre GNOME
en FreeBSD en la p?gina `del Proyecto FreeBSD
GNOME <http://www.FreeBSD.org/gnome>`__.

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

5.7.1.2. Instaci?n de GNOME
^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

GNOME puede instalarse f?cilmente utilizando packages precompilados o
desde la Colecci?n de Ports:

Para instalar el paquete de GNOME desde la red, simplemente teclee:

.. code:: screen

    # pkg_add -r gnome2

Para compilar GNOME a partir del c?digo fuente, es decir, como port:

.. code:: screen

    # cd /usr/ports/x11/gnome2
    # make install clean

Una vez GNOME est? instalado debe indicarle al servidor X como iniciar
GNOME para convertirlo en el gestor de ventanas predeterminado.

La manera m?s f?cil de arrancar GNOME es con GDM, el gestor de pantalla
de GNOME. GDM, que se instala con el escritorio GNOME al ser parte del
mismo (aunque venga desactivado por omisi?n) se activa a?adiendo
``gdm_enable="YES"`` a ``/etc/rc.conf``. Tras reiniciar, GNOME arrancar?
autom?ticamente al acceder al sistema; no es necesario configurar nada
m?s.

Puede arrancar GNOME tambi?n desde la l?nea de ?rdenes configurando
adecuadamente un fichero llamado ``.xinitrc``. Si ya tiene un
``.xinitrc`` personalizado tendr? que reemplazar la l?nea que arranca el
gestor de ventanas anterior por otra que contenga
/usr/local/bin/gnome-session. Si no ha modificado el fichero previamente
basta con que tecl?e lo siguiente:

.. code:: screen

    % echo "/usr/local/bin/gnome-session" > ~/.xinitrc

Despu?s tecl?e ``startx`` y deber?a iniciarse el entorno de escritorio
GNOME.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Si utiliza un gestor de pantalla ant?guo, como XDM, lo anteriormente
descrito no funcionar?. Cree un fichero ejecutable ``.xsession`` con la
misma orden en ?l. Edite el fichero y sustituya la orden para iniciar su
actual gestor de ventanas por /usr/local/bin/gnome-session:

.. raw:: html

   </div>

.. code:: screen

    % echo "#!/bin/sh" > ~/.xsession
    % echo "/usr/local/bin/gnome-session" >> ~/.xsession
    % chmod +x ~/.xsession

Otra opci?n es configurar el gestor de pantalla para que permita
seleccionar el gestor de ventanas durante el acceso; la secci?n de
`detalles de KDE <x11-wm.html#x11-wm-kde-details>`__ explica c?mo
hacerlo para kdm, el gestor de pantalla de KDE.

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

5.7.1.3. Tipos ?Anti-aliased? en GNOME
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

X11 soporta ?anti-aliasing? a trav?s de la extensi?n ?RENDER?. Gtk+ 2.0
y superiores (el ?toolkit? utilizado por GNOME) disponen de esta
funcionalidad. La configuraci?n del ?anti-aliasing? se describe en la
`Secci?n?5.5.3, “Tipos Anti-Aliasing” <x-fonts.html#antialias>`__. Una
vez configurado el software es posible utilizar ?anti-aliasing? en el
entorno de escritorio GNOME. S?lamente tiene que ir a Applications →
Desktop Preferences → Font, y seleccione entre Best shapes, Best
contrast, o Subpixel smoothing (LCDs). En el caso de una aplicaci?n Gtk+
que no forme parte del escritorio GNOME asigne a la variable de entorno
``GDK_USE_XFT`` un valor de ``1`` antes de arrancar el programa.

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

5.7.2. KDE
~~~~~~~~~~

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

5.7.2.1. Acerca de KDE
^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

KDE es un entorno de escritorio contempor?neo y f?cil de usar. Veamos
alguna de las cosas que KDE brinda al usuario:

.. raw:: html

   <div class="itemizedlist">

-  Un bello escritorio contempor?neo.

-  Un escritorio completamente transparente en red.

-  Un sistema de ayuda integrado que facilita un acceso adecuado y
   consistente a la ayuda durante el uso del escritorio KDE y sus
   aplicaciones.

-  Un aspecto consistente de todas las aplicaciones KDE.

-  Men?s y barras de herramientas est?ndares, teclas programables,
   esquemas de color, etc.

-  Internacionalizaci?n: KDE est? disponible en m?s de 40 idiomas.

-  Un di?logo de configuraci?n del escritorio centralizado y
   consistente.

-  Un gran n?mero de ?tiles aplicaciones KDE.

.. raw:: html

   </div>

KDE incluye un navegador web llamado Konqueror, que es un s?lido
competidor del resto de navegadores web existentes en sistemas UNIX?.
Puede encontrar m?s informaci?n sobre KDE en el `sitio web de
KDE <http://www.kde.org/>`__. Si quiere informaci?n espec?fica y
recursos sobre KDE en FreeBSD consulte el sitio web del `equipo de KDE
en FreeBSD <http://freebsd.kde.org/>`__.

Hay dos versiones de KDE en FreeBSD: la versi?n 3 lleva ya bastante
tiempo en el sistema y es muy estable en todos los sentidos. La versi?n
4, la nueva generaci?n de KDE, tambi?n est? en los ports. Si quiere
puede instalar ambas versiones simult?neamente.

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

5.7.2.2. Instalaci?n de KDE
^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Igual que sucede con GNOME o cualquier otro entorno de escritorio puede
instalarlo como package o desde la Colecci?n de Ports:

Si quiere instalar como package KDE3 (desde la red) escriba:

.. code:: screen

    # pkg_add -r kde

Si quiere instalar como package KDE4 (desde la red) escriba:

.. code:: screen

    # pkg_add -r kde4

`pkg\_add(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_add&sektion=1>`__
descargar? autom?ticamente la versi?n m?s reciente de la aplicaci?n.

Si lo que desea es compilar KDE3 desde el c?digo fuente utilice el ?rbol
de ports:

.. code:: screen

    # cd /usr/ports/x11/kde3
    # make install clean

Si lo que desea es compilar KDE4 desde el c?digo fuente utilice el ?rbol
de ports:

.. code:: screen

    # cd /usr/ports/x11/kde4
    # make install clean

Una vez instalado KDE debe indicarle al servidor X c?mo iniciar la
aplicaci?n para que se convierta en el gestor de ventanas por defecto.
Edite ``.xinitrc``:

Para KDE3:

.. code:: screen

    % echo "exec startkde" > ~/.xinitrc

Para KDE4:

.. code:: screen

    % echo "exec /usr/local/kde4/bin/startkde" > ~/.xinitrc

A partir de ahora cuando se llame al sistema X Window con ``startx`` el
escritorio ser? KDE.

Si utiliza un gestor de pantalla, como por ejemplo xdm, la configuraci?n
es ligeramente diferente. En vez de lo antedicho edite ``.xsession``.
Las instrucciones para kdm se decribir?n m?s adelante en este cap?tulo.

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

5.7.3. M?s detalles sobre KDE
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Una vez KDE est? instalado en el sistema la mayor?a de las cosas se
pueden ir descubriendo utilizando las p?ginas de ayuda o sencillamente a
golpe de rat?n en los diversos men?s. Los usuarios de Windows? y Mac? se
sentir?an como en casa.

La mejor referencia para KDE es la documentaci?n ?on-line?. KDE incluye
su propio navegador, Konqueror, docenas de ?tiles aplicaciones y una
extensa documentaci?n. El resto de esta secci?n trata sobre cuestiones
t?cnicas que son dif?ciles de aprender mediante una exploraci?n al azar.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.7.3.1. El gestor de pantalla de KDE
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El administrador de un sistemas multiusuario puede querer ofrecer a sus
usuarios una pantalla de bienvenido que se les presente al acceder al
sistema. Tal y como se ha explicado previamente puede usar
`XDM <x-xdm.html>`__. De todos modos KDE incluye su propia alternativa,
alternative, kdm, dise?ado pensando en ser m?s atractivo y tener m?s
opciones que ofrecer en el momento del acceso al sistema. M?s
concretamente ofrece a los usuarios la posibilidad de elegir mediante un
men? qu? entorno de escritorio (KDE, GNOME, o cualquier otro) quiere
ejecutar el usuario una vez validado.

Si quiere activar kdm debe modificar la entrada de ``ttyv8`` en
``/etc/ttys``. La l?nea debe quedar del siguiente modo:

Si va a usar KDE3:

.. code:: programlisting

    ttyv8 "/usr/local/bin/kdm -nodaemon" xterm on secure

En el caso de KDE4:

.. code:: programlisting

    ttyv8 "/usr/local/kde4/bin/kdm -nodaemon" xterm on secure

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

5.7.4. XFce
~~~~~~~~~~~

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

5.7.4.1. Acerca de XFce
^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

XFce es un entorno de escritorio basado en el ?toolkit? GTK utilizado
por GNOME pero es mucho m?s ligero y est? pensado para aquellos que
quieran un escritorio sencillo, eficiente y f?cil de utlizar y
configurar. Visualmente es muy parecido a CDE, que podemos encontrar en
sistemas UNIX? comerciales. Alguna de las caracter?sticas de XFce son:

.. raw:: html

   <div class="itemizedlist">

-  Un escritorio sencillo y f?cil de utilizar.

-  Completamente configurable utilizando el rat?n, con arrastrar y
   soltar, etc.

-  Panel principal similar al de CDE, con men?s, ?applets? y accesos
   directos a las aplicaciones.

-  Gestor de ventanas integrado, gestor de ficheros, gestor de sonido,
   m?dulo de compatibilidad con GNOME, y muchas cosas m?s.

-  Aspecto configurable (utiliza GTK).

-  R?pido, ligero y eficiente: ideal para m?quinas viejas, lentas o
   m?quinas con memoria limitada.

.. raw:: html

   </div>

Puede encontrar m?s informaci?n sobre XFce en el `sitio web de
XFce <http://www.xfce.org/>`__.

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

5.7.4.2. Instalar XFce
^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

En el momento de escribir este texto existe un paquete binario para
XFce. Para instalarlo escriba:

.. code:: screen

    # pkg_add -r xfce4

Tambi?n puede compilarlo desde el c?digo gracias a la Colecci?n de
Ports:

.. code:: screen

    # cd /usr/ports/x11-wm/xfce4
    # make install clean

Para indicar al servidor X que use XFce la pr?xima vez que arranque
simplemente escriba lo siguiente:

.. code:: screen

    % echo "/usr/X11R6/bin/startxfce4" > ~/.xinitrc

La pr?xima vez que arranque X XFce ser? el escritorio. Como antes, si se
usa un gestor de pantalla como ``xdm`` cree un ``.xsession`` tal y como
se ha descrito en la anterior secci?n en
`GNOME <x11-wm.html#x11-wm-gnome>`__, pero con la orden
``/usr/local/bin/startxfce4``; puede configurar el gestor de pantalla
para permitir elegir el escritorio en el momento de acceder al sistema
tal y como se ha explicado en la secci?n de
`kdm <x11-wm.html#x11-wm-kde-kdm>`__.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------+---------------------------+----------------------------------------+
| `Anterior <x-xdm.html>`__?      | `Subir <x11.html>`__      | ?\ `Siguiente <common-tasks.html>`__   |
+---------------------------------+---------------------------+----------------------------------------+
| 5.6. El gestor de pantalla X?   | `Inicio <index.html>`__   | ?Parte?II.?Tareas comunes              |
+---------------------------------+---------------------------+----------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
