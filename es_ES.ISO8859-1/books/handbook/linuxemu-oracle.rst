============================
10.6. Instalaci?n de Oracle?
============================

.. raw:: html

   <div class="navheader">

10.6. Instalaci?n de Oracle?
`Anterior <linuxemu-matlab.html>`__?
Cap?tulo 10. Compatibilidad binaria con Linux
?\ `Siguiente <sapr3.html>`__

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

10.6. Instalaci?n de Oracle?
----------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Escrito por Marcel Moolenaar.

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

10.6.1. Prefacio
~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Este texto describe el proceso de instalaci?n de Oracle? 8.0.5 y Oracle?
8.0.5.1 Enterprise Edition para Linux en una m?quina FreeBSD.

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

10.6.2. Instalaci?n del entorno Linux
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Debe tener instalados los ports
`emulators/linux\_base <http://www.freebsd.org/cgi/url.cgi?ports/emulators/linux_base/pkg-descr>`__
y
`devel/linux\_devtools <http://www.freebsd.org/cgi/url.cgi?ports/devel/linux_devtools/pkg-descr>`__.
Si tiene dificultades con estos ports es posible que tenga que usar los
paquetes o quiz?s versiones m?s antiguas de dichas aplicaciones que
encontrar? en la Colecci?n de Ports.

Si quiere usar el agente inteligente tambi?n tendr? que instalar el
paquete Tcl de Red Hat, ``tcl-8.0.3-20.i386.rpm``. La orden gen?rica
para instalar paquetes con el port oficial de RPM
(`archivers/rpm <http://www.freebsd.org/cgi/url.cgi?ports/archivers/rpm/pkg-descr>`__)
es:

.. code:: screen

    # rpm -i --ignoreos --root /compat/linux --dbpath /var/lib/rpm paquete

La instalaci?n de dicho *``paquete``* no debe generar ning?n error.

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

10.6.3. Creaci?n del entorno Oracle?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Antes de instalar Oracle? tendr? que configurar un entorno apropiado.
Este documento solamente explica lo que hay que hacer *especialmente*
para utilizar la versi?n de Linux para Oracle? FreeBSD, no lo que figura
en la gu?a de instalaci?n de Oracle?.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

10.6.3.1. Personalizaci?n del kernel
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Tal y como consta en la gu?a de instalaci?n de Oracle?, debe configurar
la cantidad m?xima de memoria compartida. No utilice ``SHMMAX`` en
FreeBSD. ``SHMMAX`` se calcula a partir de ``SHMMAXPGS`` y ``PGSIZE``,
as? que defina ``SHMMAXPGS``. Todas las dem?s opciones pueden usarse tal
y como se describen en la gu?a. Por ejemplo:

.. code:: programlisting

    options SHMMAXPGS=10000
    options SHMMNI=100
    options SHMSEG=10
    options SEMMNS=200
    options SEMMNI=70
    options SEMMSL=61

Configure estas opciones para que se ajusten al uso que pretenda darle a
Oracle?.

Aseg?rese tambi?n de que las siguientes opciones est?n en el fichero de
configuraci?n de su kernel:

.. code:: programlisting

    options SYSVSHM #SysV shared memory
    options SYSVSEM #SysV semaphores
    options SYSVMSG #SysV interprocess communication

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

10.6.3.2. Cuenta Oracle?
^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Cr?e una cuenta ``oracle`` seg?n el procedimiento habitual de creaci?n
de usuarios. La cuenta ``oracle``, empero, tiene algo especial puesto
que debe teer una shell *de* Linux. A?ada ``/compat/linux/bin/bash`` a
``/etc/shells`` y asigne a la cuenta ``oracle``
``/compat/linux/bin/bash`` como shell por omisi?n.

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

10.6.3.3. Entorno
^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Adem?s de las variables normales para Oracle?, como ``ORACLE_HOME`` y
``ORACLE_SID``, debe configurar las siguientes variables de entorno:

.. raw:: html

   <div class="informaltable">

+-----------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------+
| Variable              | Valor                                                                                                                                                 |
+=======================+=======================================================================================================================================================+
| ``LD_LIBRARY_PATH``   | ``$ORACLE_HOME/lib``                                                                                                                                  |
+-----------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``CLASSPATH``         | ``$ORACLE_HOME/jdbc/lib/classes111.zip``                                                                                                              |
+-----------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``PATH``              | ``/compat/linux/bin /compat/linux/sbin /compat/linux/usr/bin /compat/linux/usr/sbin /bin /sbin /usr/bin /usr/sbin /usr/local/bin $ORACLE_HOME/bin``   |
+-----------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

Le aconsejamos configurar todas las variables de entorno en
``.profile``. Veamos un ejemplo completo:

.. code:: programlisting

    ORACLE_BASE=/oracle; export ORACLE_BASE
    ORACLE_HOME=/oracle; export ORACLE_HOME
    LD_LIBRARY_PATH=$ORACLE_HOME/lib
    export LD_LIBRARY_PATH
    ORACLE_SID=ORCL; export ORACLE_SID
    ORACLE_TERM=386x; export ORACLE_TERM
    CLASSPATH=$ORACLE_HOME/jdbc/lib/classes111.zip
    export CLASSPATH
    PATH=/compat/linux/bin:/compat/linux/sbin:/compat/linux/usr/bin
    PATH=$PATH:/compat/linux/usr/sbin:/bin:/sbin:/usr/bin:/usr/sbin
    PATH=$PATH:/usr/local/bin:$ORACLE_HOME/bin
    export PATH

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

10.6.4. Instalaci?n de Oracle?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Debido a una peque?a inconsistencia en el emulador Linux tendr? que
crear un directorio llamado ``.oracle`` en ``/var/tmp`` antes de iniciar
el instalador. Haga que sea propiedad del usuario ``oracle``. Hecho esto
deber? poder instalar Oracle? sin ning?n problema. Si no es as? *revise
su distribuci?n* Oracle? y su configuraci?n. Una vez finalizada la
instalaci?n de Oracle? aplique los parches que se detallan en las dos
siguientes subsecciones.

Un problema que se da con una cierta frecuencia es que el adaptador del
protocolo TCP no est? correctamente instalado. Como consecuencia no
puede iniciarse ninguna escucha TCP, a las que tambi?n se les llama
directamente ?listeners?. Esto le ayudar? a resolver el problema.:

.. code:: screen

    # cd $ORACLE_HOME/network/lib
    # make -f ins_network.mk ntcontab.o
    # cd $ORACLE_HOME/lib
    # ar r libnetwork.a ntcontab.o
    # cd $ORACLE_HOME/network/lib
    # make -f ins_network.mk install

*No se olvide de ejecutar ``root.sh`` de nuevo*.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

10.6.4.1. C?mo parchear root.sh
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Durante la instalaci?n de Oracle? algunas acciones que requieren ser
ejecutadas como ``root`` deben almacenarse en un “script” de shell
llamado ``root.sh``. Dicho “script” est? en el directorio ``orainst``.
Aplique el siguiente parche a ``root.sh`` para que utilice la ruta
correcta de ``chown`` o ejecute el “script” bajo una shell nativa de
Linux.

.. code:: programlisting

    *** orainst/root.sh.orig Tue Oct 6 21:57:33 1998
    --- orainst/root.sh Mon Dec 28 15:58:53 1998
    ***************
    *** 31,37 ****
    # This is the default value for CHOWN
    # It will redefined later in this script for those ports
    # which have it conditionally defined in ss_install.h
    ! CHOWN=/bin/chown
    #
    # Define variables to be used in this script
    --- 31,37 ----
    # This is the default value for CHOWN
    # It will redefined later in this script for those ports
    # which have it conditionally defined in ss_install.h
    ! CHOWN=/usr/sbin/chown
    #
    # Define variables to be used in this script

Si no est? instalando Oracle? desde un CD puede parchear las fuentes de
``root.sh``. Se llama ``rthd.sh`` y est? en el directorio ``orainst``
del ?rbol de fuentes.

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

10.6.4.2. C?mo parchear genclntsh
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El “script” ``genclntsh`` se usa para crear una biblioteca de cliente
compartida y para construir los demos. Al aplicar el siguiente parche
comentar? la definici?n de ``PATH``:

.. code:: programlisting

    *** bin/genclntsh.orig Wed Sep 30 07:37:19 1998
    --- bin/genclntsh Tue Dec 22 15:36:49 1998
    ***************
    *** 32,38 ****
    #
    # Explicit path to ensure that we're using the correct commands
    #PATH=/usr/bin:/usr/ccs/bin export PATH
    ! PATH=/usr/local/bin:/bin:/usr/bin:/usr/X11R6/bin export PATH
    #
    # each product MUST provide a $PRODUCT/admin/shrept.lst
    --- 32,38 ----
    #
    # Explicit path to ensure that we're using the correct commands
    #PATH=/usr/bin:/usr/ccs/bin export PATH
    ! #PATH=/usr/local/bin:/bin:/usr/bin:/usr/X11R6/bin export PATH
    #
    # each product MUST provide a $PRODUCT/admin/shrept.lst

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

10.6.5. Ejecuci?n de Oracle?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Una vez seguidas estas instrucciones podr? ejecutar Oracle? como si la
hubiera instalado en Linux.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------+-----------------------------+-----------------------------------+
| `Anterior <linuxemu-matlab.html>`__?   | `Subir <linuxemu.html>`__   | ?\ `Siguiente <sapr3.html>`__     |
+----------------------------------------+-----------------------------+-----------------------------------+
| 10.5. Instalaci?n de MATLAB??          | `Inicio <index.html>`__     | ?10.7. Instalaci?n de SAP??R/3?   |
+----------------------------------------+-----------------------------+-----------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
