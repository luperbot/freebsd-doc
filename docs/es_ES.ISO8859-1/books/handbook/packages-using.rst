================================
4.4. Uso del sistema de packages
================================

.. raw:: html

   <div class="navheader">

4.4. Uso del sistema de packages
`Anterior <ports-finding-applications.html>`__?
Cap?tulo 4. Instalaci?n de aplicaciones: ?packages? y ports
?\ `Siguiente <ports-using.html>`__

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

4.4. Uso del sistema de packages
--------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Texto de Chern Lee.

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

4.4.1. Instalar un package
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Puede usar
`pkg\_add(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_add&sektion=1>`__
para instalar un package de FreeBSD desde un fichero local o desde un
servidor remoto v?a red.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Ejemplo 4.1. Descarga de un paquete manualmente e instalaci?n en nuestro
sistema

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    # ftp -a ftp2.FreeBSD.org
    Connected to ftp2.FreeBSD.org.
    220 ftp2.FreeBSD.org FTP server (Version 6.00LS) ready.
    331 Guest login ok, send your email address as password.
    230-
    230-     This machine is in Vienna, VA, USA, hosted by Verio.
    230-         Questions? E-mail freebsd@vienna.verio.net.
    230-
    230-
    230 Guest login ok, access restrictions apply.
    Remote system type is UNIX.
    Using binary mode to transfer files.
    ftp> cd /pub/FreeBSD/ports/packages/sysutils/
    250 CWD command successful.
    ftp> get lsof-4.56.4.tgz
    local: lsof-4.56.4.tgz remote: lsof-4.56.4.tgz
    200 PORT command successful.
    150 Opening BINARY mode data connection for 'lsof-4.56.4.tgz' (92375 bytes).
    100% |**************************************************| 92375       00:00 ETA
    226 Transfer complete.
    92375 bytes received in 5.60 seconds (16.11 KB/s)
    ftp> exit
    # pkg_add lsof-4.56.4.tgz

.. raw:: html

   </div>

.. raw:: html

   </div>

Si no tiene una fuente local de packages (por ejemplo un CDROM de
FreeBSD) probablemente la mejor opci?n sea utilizar el argumento ``-r``
de
`pkg\_add(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_add&sektion=1>`__,
que har? que determine autom?ticamente el formato del objeto correcto,
para posteriormente descargarlo e instalarlo desde un FTP.

.. code:: screen

    # pkg_add -r lsof

En el ejemplo anterior el package correspondiente se descargar? e
instalar? sin intervenci?n del usuario. Si desea utilizar una r?plica
(?mirror?) de packages que no sea el sitio principal de FreeBSD solo
tiene configurar la variable de entorno ``PACKAGESITE`` correctamente
para sobreescribir el sitio predefinido.
`pkg\_add(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_add&sektion=1>`__
utiliza
`fetch(1) <http://www.FreeBSD.org/cgi/man.cgi?query=fetch&sektion=1>`__
para descargar los ficheros, tomando como referencia varias variables de
entorno, como ``FTP_PASSIVE_MODE``, ``FTP_PROXY`` y ``FTP_PASSWORD``.
Quiz?s deba modificar alguna de estas si se encuentra detr?s de un
cortafuegos, o usa un proxy FTP/HTTP. Consulte
`fetch(3) <http://www.FreeBSD.org/cgi/man.cgi?query=fetch&sektion=3>`__
si quiere ver una lista completa. Observe tambi?n que en el ejemplo
anterior usamos ``lsof`` en vez de ``lsof-4.56.4``. Cuando usamos la
opci?n de descarga remota no es necesario especificar la versi?n del
paquete.
`pkg\_add(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_add&sektion=1>`__
descargar? autom?ticamente la ?ltima versi?n de la aplicaci?n.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

`pkg\_add(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_add&sektion=1>`__
descargar? la ?ltima versi?n de su aplicaci?n si usa FreeBSD-CURRENT o
FreeBSD-STABLE, pero si usa una versi?n -RELEASE, descargar? la versi?n
del package que se construy? con dicha versi?n. Es posible configurar
esto sobreescribiendo la variable de entorno ``PACKAGESITE``.

.. raw:: html

   </div>

Los packages se destribuyen en formatos ``.tgz`` y ``.tbz``. Puede
encontrarlos en ``ftp://ftp.FreeBSD.org/pub/FreeBSD/ports/packages/``, o
en la distribuci?n de FreeBSD en CD-ROM. Todos los CDs en el set de 4
CDs de FreeBSD (y en el PowerPak, etc.) contienen packages en el
directorio ``/packages``. La estructura de los packages es similar a la
del arbol de ``/usr/ports``. Cada categor?a tiene su propio directorio,
y todos los paquetes se pueden encontrar dentro del directorio ``All``.

La estructura del directorio de packageckages es id?ntica a la de los
ports, y funcionan como un todo para conformar el sistema de
paquetes/ports.

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

4.4.2. Eliminar un package
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Para eliminar un package instalado en el sistema utilice
`pkg\_delete(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_delete&sektion=1>`__.

.. code:: screen

    # pkg_delete xchat-1.7.1

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

4.4.3. Miscel?nea
~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Toda la informaci?n de los packages se guarda en ``/var/db/pkg``. Ah?l
encontrar? la lista completa de paquetes instalados y las descripciones
de los mismos.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------------------+---------------------------+---------------------------------------+
| `Anterior <ports-finding-applications.html>`__?   | `Subir <ports.html>`__    | ?\ `Siguiente <ports-using.html>`__   |
+---------------------------------------------------+---------------------------+---------------------------------------+
| 4.3. C?mo encontrar aplicaciones?                 | `Inicio <index.html>`__   | ?4.5. Uso de la colecci?n de ports    |
+---------------------------------------------------+---------------------------+---------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
