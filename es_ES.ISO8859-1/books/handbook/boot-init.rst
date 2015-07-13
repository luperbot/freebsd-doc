=================================================
12.6. Init: inicializaci?n del proceso de control
=================================================

.. raw:: html

   <div class="navheader">

12.6. Init: inicializaci?n del proceso de control
`Anterior <device-hints.html>`__?
Cap?tulo 12. El proceso de arranque en FreeBSD
?\ `Siguiente <boot-shutdown.html>`__

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

12.6. Init: inicializaci?n del proceso de control
-------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Ya que el kernel ha finalizado de arrancar, pasar? el control a un
proceso de usuario llamado ``init``, el cual se localiza en
``/sbin/init``, o bien en la ruta especificada por la variable de
entorno ``init_path`` del cargador.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

12.6.1. Secuencia autom?tica de reinicio
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

La secuencia autom?tica de reinicio se asegura de que los sistemas de
ficheros disponibles en el sistema sean consistentes. Si no lo son, y el
programa ``fsck`` no puede arreglar estas inconsistencias, ``init``
envia el sistema a modo
`monousuario <boot-init.html#boot-singleuser>`__, de tal forma que el
administrador pueda ingresar en ?l y arreglar los problemas
directamente.

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

12.6.2. Modo monousuario
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A este modo se puede llegar por medio de la `secuencia autom?tica de
reinicio <boot-init.html#boot-autoreboot>`__, o por medio de la opci?n
``-s`` en el arranque de usuario o al establecer la variable
``boot_single`` en el cargador.

Tambi?n desde el modo `multi-usuario <boot-init.html#boot-multiuser>`__
se puede acceder, al utilizar ``shutdown`` sin la opci?n de reinicio
(``-r``) o la de apagado (``-h``) del sistema.

Si la consola del sistema esta configurada de modo ``inseguro`` en el
fichero ``/etc/ttys``, entonces el sistema solicitar? la contrase?a del
``superusuario`` (root), antes de ingresar al sistema en modo
mono-usuario.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Ejemplo 12.3. Una consola insegura en /etc/ttys

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    # name  getty                           type    status          comments
    #
    # If console is marked "insecure", then init will ask for the root password
    # when going to single-user mode.
    console none                            unknown off insecure

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Una consola ``insegura`` significa que usted considera como insegura
f?sicamente su consola, por lo que desea asegurarse de que s?lo quien
conoce la contrase?a del ``superusuario`` puede ingresar al sistema en
modo mono-usuario, y no que desea ejecutar la consola inseguramente.
Esto es, si desea contar con seguridad escoja la opci?n ``insecure``, y
no ``secure``.

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

12.6.3. Modo multiusuario
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

En el caso de que ``init`` encuentre en buen estado al sistema de
ficheros, o una vez que el usuario ha terminado del modo
`mono-usuario <boot-init.html#boot-singleuser>`__, el sistema entrar? al
modo multi-usuario, en donde comienzan los ficheros de
configuraci?n-fuente del sistema.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

12.6.3.1. Configuraci?n-Fuente(rc)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

La configuraci?n fuente lee la configuraci?n por default del fichero
``/etc/defaults/rc.conf``, y detalles espec?ficos del sistema desde el
fichero ``/etc/rc.conf``, y posteriormente procede a montar los sistemas
de ficheros del sistema, descritos en ``/etc/fstab``, iniciar servicios
de red, as? como varios demonios del sistema, para finalmente ejecutar
los escritos (scripts) de configuraci?n instalados por paquetes,
localmente.

La p?gina de ayuda
`rc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc&sektion=8>`__ es una
buena referencia para conocer m?s de este tipo de ficheros, as? como
examinar los mismos ficheros.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------+---------------------------+-----------------------------------------+
| `Anterior <device-hints.html>`__?   | `Subir <boot.html>`__     | ?\ `Siguiente <boot-shutdown.html>`__   |
+-------------------------------------+---------------------------+-----------------------------------------+
| 12.5. Device Hints?                 | `Inicio <index.html>`__   | ?12.7. Secuencia de apagado             |
+-------------------------------------+---------------------------+-----------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
