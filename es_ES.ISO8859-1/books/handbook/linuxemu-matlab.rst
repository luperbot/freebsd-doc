============================
10.5. Instalaci?n de MATLAB?
============================

.. raw:: html

   <div class="navheader">

10.5. Instalaci?n de MATLAB?
`Anterior <linuxemu-maple.html>`__?
Cap?tulo 10. Compatibilidad binaria con Linux
?\ `Siguiente <linuxemu-oracle.html>`__

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

10.5. Instalaci?n de MATLAB?
----------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Escrito por Dan Pelleg.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Este documento describe el proceso de instalaci?n de la versi?n para
Linux de MATLAB? version 6.5 en FreeBSD. En general funciona bastante
bien, excepci?n hecha de Java Virtual Machine™ (consulte la
`Secci?n?10.5.3, “Enlace del entorno de ejecuci?n
Java™” <linuxemu-matlab.html#matlab-jre>`__).

La versi?n Linux de MATLAB? puede pedirse directamente en el sitio de
The MathWorks, ``http://www.mathworks.com``. Tiene que recibir tambi?n
el fichero de licencia o instrucciones de c?mo crearlo. Al hacer su
pedido aproveche para decirles que ser?a muy buena idea que ofrecieran
una versi?n nativa de su software para FreeBSD.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

10.5.1. Instalaci?n de MATLAB?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Para instalar MATLAB? haga lo siguiente:

.. raw:: html

   <div class="procedure">

#. Inserte el CD de instalaci?n y m?ntelo. Convi?rtase en ``root`` e
   inicie la instalaci?n:

   .. code:: screen

       # /compat/linux/bin/sh /cdrom/install

   .. raw:: html

      <div class="tip" xmlns="">

   Sugerencia:
   ~~~~~~~~~~~

   El instalador es gr?fico. Si obtiene errores acerca de no ser capaz
   de abrir un display tecl?e ``setenv HOME ~USUARIO``, donde
   *``USUARIO``* es el nombre del usuario con el que hizo
   `su(1) <http://www.FreeBSD.org/cgi/man.cgi?query=su&sektion=1>`__.

   .. raw:: html

      </div>

#. Tecl?e **``/compat/linux/usr/local/matlab``** donde el instalador le
   pida el directorio ra?z de MATLAB?.

   .. raw:: html

      <div class="tip" xmlns="">

   Sugerencia:
   ~~~~~~~~~~~

   Esto ?ltimo le facilitar? la entrada de datos durante el resto de la
   instalaci?n. Introduzca lo siguiente en el “prompt” de su shell:
   ``set MATLAB=/compat/linux/usr/local/matlab``

   .. raw:: html

      </div>

#. Edite el fichero de licencia tal y como consta en las instrucciones
   de la licencia de MATLAB?.

   .. raw:: html

      <div class="tip" xmlns="">

   Sugerencia:
   ~~~~~~~~~~~

   Puede tenerlo ya editado y copiado a ``$MATLAB/license.dat`` desde
   antes de que el instalador se lo pida.

   .. raw:: html

      </div>

#. Complete el proceso de instalaci?n.

.. raw:: html

   </div>

La instalaci?n MATLAB? ha finalizado. Los siguientes pasos aplicar?n el
“pegamento” necesario para conectarlo a su sistema FreeBSD.

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

10.5.2. Inicio del administrador de licencias
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="procedure">

#. Cr?e los enlaces simb?licos que necesitan los “scripts” del
   administrador de licencias:

   .. code:: screen

       # ln -s $MATLAB/etc/lmboot /usr/local/etc/lmboot_TMW
       # ln -s $MATLAB/etc/lmdown /usr/local/etc/lmdown_TMW

#. Cr?e un fichero de inicio en ``/usr/local/etc/rc.d/flexlm.sh``. El
   siguiente ejemplo es una versi?n modificada de
   ``$MATLAB/etc/rc.lm.glnx86`` que viene con la distribuci?n de
   MATLAB?. Los cambios que se han hecho en ?l obedecen a la ubicaci?n
   de los ficheros y el arranque del administrador de licencias bajo
   emulaci?n de Linux.

   .. code:: programlisting

       #!/bin/sh
       case "$1" in
         start)
               if [ -f /usr/local/etc/lmboot_TMW ]; then
                     /compat/linux/bin/sh /usr/local/etc/lmboot_TMW -u nombre-de-usuario && echo 'MATLAB_lmgrd'
               fi
               ;;
         stop)
           if [ -f /usr/local/etc/lmdown_TMW ]; then
                   /compat/linux/bin/sh /usr/local/etc/lmdown_TMW  > /dev/null 2>&1
           fi
               ;;
         *)
           echo "Usage: $0 {start|stop}"
           exit 1
           ;;
       esac

       exit 0

   .. raw:: html

      <div class="important" xmlns="">

   Importante:
   ~~~~~~~~~~~

   El fichero debe ser ejecutable:

   .. code:: screen

       # chmod +x /usr/local/etc/rc.d/flexlm.sh

   Tendr? que reemplazar la entrada *``nombre-de-usuario``* de nuestro
   ejemplo por un nombre de usuario v?lido en su sistema (que no sea
   ``root``).

   .. raw:: html

      </div>

#. Arranque el administrador de licencias:

   .. code:: screen

       # /usr/local/etc/rc.d/flexlm.sh start

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

10.5.3. Enlace del entorno de ejecuci?n Java™
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Cambie el enlace del entorno de ejecuci?n Java™ (JRE) a uno que funcione
en FreeBSD:

.. code:: screen

    # cd $MATLAB/sys/java/jre/glnx86/
    # unlink jre; ln -s ./jre1.1.8 ./jre

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

10.5.4. Creaci?n de un “script” de arranque para MATLAB?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="procedure">

#. Coloque el siguiente “script” de arranque en
   ``/usr/local/bin/matlab``:

   .. code:: programlisting

       #!/bin/sh
       /compat/linux/bin/sh /compat/linux/usr/local/matlab/bin/matlab "$@"

#. Escriba ``chmod +x /usr/local/bin/matlab``.

.. raw:: html

   </div>

.. raw:: html

   <div class="tip" xmlns="">

Sugerencia:
~~~~~~~~~~~

Dependiendo de su versi?n de
`emulators/linux\_base <http://www.freebsd.org/cgi/url.cgi?ports/emulators/linux_base/pkg-descr>`__
tal vez obtenga errores al ejecutar este “script”. Para evitarlo edite
``/compat/linux/usr/local/matlab/bin/matlab`` y cambie la l?nea en la
que aparece:

.. code:: programlisting

    if [ `expr "$lscmd" : '.*->.*'` -ne 0 ]; then

(en la versi?n 13.0.1 es en la l?nea 410) por esta otra l?nea:

.. code:: programlisting

    if test -L $newbase; then

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

10.5.5. Creaci?n de un “script” para detener MATLAB?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Este “script” solucionar? las dificultades que pueda tener para detener
MATLAB? correctamente.

.. raw:: html

   <div class="procedure">

#. Cr?e un fichero llamado ``$MATLAB/toolbox/local/finish.m`` y ponga en
   ?l una sola l?nea con este texto:

   .. code:: programlisting

       ! $MATLAB/bin/finish.sh

   .. raw:: html

      <div class="note" xmlns="">

   Nota:
   ~~~~~

   ``$MATLAB`` debe escribirse tal cual.

   .. raw:: html

      </div>

   .. raw:: html

      <div class="tip" xmlns="">

   Sugerencia:
   ~~~~~~~~~~~

   En el mismo directorio encontrar? los ficheros ``finishsav.m`` y
   ``finishdlg.m``, que le permiten guardar su trabajo antes de salir de
   la aplicaci?n. Si quiere usar alguno de ellos, inserte la l?nea de
   arriba inmediatamente despu?s de ``save``.

   .. raw:: html

      </div>

#. Cr?e un fichero ``$MATLAB/bin/finish.sh`` con el siguiente contenido:

   .. code:: programlisting

       #!/usr/compat/linux/bin/sh
       (sleep 5; killall -1 matlab_helper) &
       exit 0

#. El fichero tiene que ser ejecutable:

   .. code:: screen

       # chmod +x $MATLAB/bin/finish.sh

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

10.5.6. Uso de MATLAB?
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Desde este momento ya puede usted teclear ``matlab`` y empezar a usarlo.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------+-----------------------------+-------------------------------------------+
| `Anterior <linuxemu-maple.html>`__?   | `Subir <linuxemu.html>`__   | ?\ `Siguiente <linuxemu-oracle.html>`__   |
+---------------------------------------+-----------------------------+-------------------------------------------+
| 10.4. Instalaci?n de Maple™?          | `Inicio <index.html>`__     | ?10.6. Instalaci?n de Oracle?             |
+---------------------------------------+-----------------------------+-------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
