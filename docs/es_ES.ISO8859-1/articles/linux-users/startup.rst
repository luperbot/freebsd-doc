===============================================================
4. Arranque del sistema: ?D?nde est?n los niveles de ejecuci?n?
===============================================================

.. raw:: html

   <div class="navheader">

4. Arranque del sistema: ?D?nde est?n los niveles de ejecuci?n?
`Anterior <software.html>`__?
?
?\ `Siguiente <network.html>`__

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

4. Arranque del sistema: ?D?nde est?n los niveles de ejecuci?n?
---------------------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Linux? usa el sistema de inicio SysV, mientras que FreeBSD usa el
sistema
`init(8) <http://www.FreeBSD.org/cgi/man.cgi?query=init&sektion=8>`__
tradicional en BSD. En el
`init(8) <http://www.FreeBSD.org/cgi/man.cgi?query=init&sektion=8>`__
del estilo BSD no existen ni los niveles de ejecuci?n ni
``/etc/inittab``; en vez de esto el inicio se controla desde
`rc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc&sektion=8>`__. El
script ``/etc/rc`` lee los ficheros ``/etc/defaults/rc.conf`` y
``/etc/rc.conf`` para determinar qu? servicios deben arrancarse. Despu?s
de esto se arrancan los servicios a los que se hace referencia en los
scripts de arranque ubicados en ``/etc/rc.d/`` o
``/usr/local/etc/rc.d/``. Estos scripts son similares a los que hay en
``/etc/init.d/`` en un sistema Linux?.

.. raw:: html

   <div class="sidebar">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   </div>

*?Por qu? los script de arranque arranque est?n en dos sitios?* Los
script situados en ``/etc/rc.d/`` son para programas del sistema “base”,
como
`cron(8) <http://www.FreeBSD.org/cgi/man.cgi?query=cron&sektion=8>`__,
`sshd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sshd&sektion=8>`__,
`syslog(3) <http://www.FreeBSD.org/cgi/man.cgi?query=syslog&sektion=3>`__
y otros. Los scripts de ``/usr/local/etc/rc.d/`` son para software
instalado por el usuario como por ejemplo Apache, Squid, etc.

*?Cu?l es la diferencia entre el sistema “base” y los programas
instalados por el usuario?* FreeBSD se desarrolla como un sistema
operativo completo. En otras palabras, el kernel, las bibliotecas del
sistema y las utilidades (por ejemplo
`ls(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ls&sektion=1>`__,
`cat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cat&sektion=1>`__,
`cp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cp&sektion=1>`__, etc.)
se desarrollan y se publican como un todo. A esto es a lo que nos
referimos como “sistema base”. Los programas instalados por el usuario,
como por ejemplo Apache, X11, Mozilla?Firefox, etc. no forman parte del
sistema “base”. Estos programas normalmente se instalan desde la
`Colecci?n de Packages y Ports <article.html#SOFTWARE>`__. Para
separarlos del sistema “base” se instalan normalmente en
``/usr/local/``. De ah? que los binarios de los programas instalados por
los usuario se sit?en en ``/usr/local/bin/``, los ficheros de
configuraci?n en ``/usr/local/etc/``, etc.

.. raw:: html

   </div>

Los servicios se arrancan mediante l?neas
``NombreDeServicio_enable="YES"`` en ``/etc/rc.conf``
(`rc.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=rc.conf&sektion=5>`__).
Eche un vistazo a ``/etc/defaults/rc.conf``: La configuraci?n por
omisi?n del sistema puede sobreescribirse desde ``/etc/rc.conf``.
Adem?s, al instalar programas debe asegurarse de leer la documentaci?n
para determinar c?mo arrancar los servicios que puedan estar
relacionados.

El siguiente fragmento de ``/etc/rc.conf`` arranca
`sshd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sshd&sektion=8>`__ y
Apache 2.2. Tambi?n hace que Apache arranque con SSL.

.. code:: programlisting

    # enable SSHD
    sshd_enable="YES"
    # enable Apache with SSL
    apache22_enable="YES"
    apache22_flags="-DSSL"

Una vez que un servicio aparece en ``/etc/rc.conf`` el servicio puede
arrancarse desde la l?nea de comandos (sin reiniciar el sistema):

.. code:: screen

    # /etc/rc.d/sshd start

Si un servicio no dispone de la correspondiente entrada en
``/etc/rc.conf`` se puede arrancar desde la l?nea de comandos usando la
opci?n ``forcestart``:

.. code:: screen

    # /etc/rc.d/sshd forcestart

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------------------------+---------------------------+-----------------------------------+
| `Anterior <software.html>`__?                              | ?                         | ?\ `Siguiente <network.html>`__   |
+------------------------------------------------------------+---------------------------+-----------------------------------+
| 3. Packages y Ports: Instalaci?n de software en FreeBSD?   | `Inicio <index.html>`__   | ?5. Configuraci?n de la red       |
+------------------------------------------------------------+---------------------------+-----------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
