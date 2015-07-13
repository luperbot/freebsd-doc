===========================
10.4. Instalaci?n de Maple™
===========================

.. raw:: html

   <div class="navheader">

10.4. Instalaci?n de Maple™
`Anterior <linuxemu-mathematica.html>`__?
Cap?tulo 10. Compatibilidad binaria con Linux
?\ `Siguiente <linuxemu-matlab.html>`__

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

10.4. Instalaci?n de Maple™
---------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Escrito por Aaron Kaplan.

.. raw:: html

   </div>

.. raw:: html

   <div>

Gracias a Robert Getschmann.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Maple™ es un programa comercial de matem?ticas similar a Mathematica?.
Puede adquirir este software en ``http://www.maplesoft.com/``; tras
registrarlo recibir? un fichero de licencia. Si quiere instalar este
software en FreeBSD siga los siguienes pasos:

.. raw:: html

   <div class="procedure">

#. Ejecute el “script” de shell ``INSTALL`` desde el lugar de
   instalaci?n del producto. Elija la opci?n “RedHat” cuando le pregunte
   el programa de instalaci?n. ``/usr/local/maple`` es un buen sitio
   para instalar el software.

#. Si no lo ha hecho ya, solicite una licencia para Maple™ a Maple
   Waterloo Software (``http://register.maplesoft.com/``) y c?piela a
   ``/usr/local/maple/license/license.dat``.

#. Instale el gestor de licencias FLEXlm ejecutando el “script” de shell
   de instalaci?n ``INSTALL_LIC`` que viene con Maple™. Introduzca el
   nombre de su m?quina (el servidor de licencias lo necesita).

#. Parch?e el fichero ``/usr/local/maple/bin/maple.system.type`` con lo
   siguiente:

   .. code:: programlisting

          ----- snip ------------------
       *** maple.system.type.orig      Sun Jul  8 16:35:33 2001
       --- maple.system.type   Sun Jul  8 16:35:51 2001
       ***************
       *** 72,77 ****
       --- 72,78 ----
                 # the IBM RS/6000 AIX case
                 MAPLE_BIN="bin.IBM_RISC_UNIX"
                 ;;
       +     "FreeBSD"|\
             "Linux")
                 # the Linux/x86 case
               # We have two Linux implementations, one for Red Hat and
          ----- snip end of patch -----

   Tenga muy presente que despu?s de ``"FreeBSD"|\`` no debe haber
   ning?n espacio en blanco.

   Este parche le dice a Maple™ que interprete “FreeBSD” como un tipo de
   sistema Linux. El “script” de shell ``bin/maple`` llama al “script”
   de shell ``bin/maple.system.type``, que a su vez recurre a
   ``uname -a`` para dictaminar el nombre del sistema operativo.
   Dependiendo de cu?l sea sabr? qu? binarios utilizar.

#. Inicio del servidor de licencias.

   El siguiente “script”, sito en ``/usr/local/etc/rc.d/lmgrd.sh``, le
   permitir? arrancar ``lmgrd``:

   .. code:: programlisting

          ----- snip ------------

       #! /bin/sh
       PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/usr/X11R6/bin
       PATH=${PATH}:/usr/local/maple/bin:/usr/local/maple/FLEXlm/UNIX/LINUX
       export PATH

       LICENSE_FILE=/usr/local/maple/license/license.dat
       LOG=/var/log/lmgrd.log

       case "$1" in
       start)
           lmgrd -c ${LICENSE_FILE} 2<< ${LOG} 1<&2
           echo -n " lmgrd"
           ;;
       stop)
           lmgrd -c ${LICENSE_FILE} -x lmdown 2<< ${LOG} 1<&2
           ;;
       *)
           echo "Usage: `basename $0` {start|stop}" 1<&2
           exit 64
           ;;
       esac

       exit 0
          ----- snip ------------

#. Prueba de arranque de Maple™:

   .. code:: screen

       % cd /usr/local/maple/bin
       % ./xmaple

   Todo deber?a funcionar perfectamente. Si es as? a?n le queda un
   ?ltimo paso: escribir a Maplesoft y decirles que ser?a genial una
   versi?n nativa para FreeBSD.

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

10.4.1. Problemas frecuentes
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="itemizedlist">

-  El gestor de licencias FLEXlm puede ser un tanto dif?cil de usar. En
   caso de necesitarla tiene m?s informaci?n en
   ``http://www.globetrotter.com/``.

-  ``lmgrd`` tiene una reconocida fama de ser muy meticuloso en todo lo
   relacionado con el fichero de licencia; suele generar volcados de
   memoria si se encuentra con alg?n problema. Un fichero de licencia
   correcto tiene que parecerse mucho a este:

   .. code:: programlisting

       # =======================================================
       # License File for UNIX Installations ("Pointer File")
       # =======================================================
       SERVER chillig ANY
       #USE_SERVER
       VENDOR maplelmg

       FEATURE Maple maplelmg 2000.0831 permanent 1 XXXXXXXXXXXX \
                PLATFORMS=i86_r ISSUER="Waterloo Maple Inc." \
                ISSUED=11-may-2000 NOTICE=" Technische Universitat Wien" \
                SN=XXXXXXXXX

   .. raw:: html

      <div class="note" xmlns="">

   Nota:
   ~~~~~

   El n?mero de serie y la clave han sido sobreescritos con X.
   ``chillig`` es el nombre de un equipo.

   .. raw:: html

      </div>

   Puede editar el fichero de licencia siempre que no toque la l?nea
   “FEATURE” (que est? protegida por la clave de la licencia).

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------------+-----------------------------+-------------------------------------------+
| `Anterior <linuxemu-mathematica.html>`__?   | `Subir <linuxemu.html>`__   | ?\ `Siguiente <linuxemu-matlab.html>`__   |
+---------------------------------------------+-----------------------------+-------------------------------------------+
| 10.3. Instalaci?n de Mathematica??          | `Inicio <index.html>`__     | ?10.5. Instalaci?n de MATLAB?             |
+---------------------------------------------+-----------------------------+-------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
