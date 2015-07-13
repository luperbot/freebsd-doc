=================
5.3. Instalar X11
=================

.. raw:: html

   <div class="navheader">

5.3. Instalar X11
`Anterior <x-understanding.html>`__?
Cap?tulo 5. El sistema X Window
?\ `Siguiente <x-config.html>`__

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

5.3. Instalar X11
-----------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Xorg es la implementaci?n de X11 por omisi?n en FreeBSD. Xorg est?
basado en c?digo de XFree86™?4.4RC2 y X11R6.6. La versi?n de Xorg que se
distribuye actualmente en la Colecci?n de Ports de FreeBSD es la 7.7.

Para compilar e instalar Xorg desde la colecci?n de ports:

.. code:: screen

    # cd /usr/ports/x11/xorg
    # make install clean

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Si quiere compilar e instalar Xorg entero, aseg?rese de tener como
m?nimo 2GB de espacio disponible.

.. raw:: html

   </div>

Si lo prefiere puede instalar Xorg con packages. Cuando utilice la
capacidad de
`pkg\_add(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_add&sektion=1>`__
para instalar packages que descargue remotamente recuerde que no debe
escribir el n?mero de versi?n.
`pkg\_add(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_add&sektion=1>`__
descargar? autom?ticamente la ?ltima versi?n de la aplicaci?n..

Veamos qu? es lo que hay que hacer para descargar e instalar el package
de Xorg:

.. code:: screen

    # pkg_add -r xorg

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

El anterior ejemplo instala la distribuci?n X11 completa, es decir,
servidores, clientes, tipos de letra, etc. Hay packages y ports con cada
uno de esos elementos por separado.

.. raw:: html

   </div>

En el resto del cap?tulo se explica c?mo configurar X11 y c?mo
configurar un entorno de escritorio que le resulte productivo.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------+---------------------------+------------------------------------+
| `Anterior <x-understanding.html>`__?   | `Subir <x11.html>`__      | ?\ `Siguiente <x-config.html>`__   |
+----------------------------------------+---------------------------+------------------------------------+
| 5.2. Entender X?                       | `Inicio <index.html>`__   | ?5.4. Configuraci?n de X11         |
+----------------------------------------+---------------------------+------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
