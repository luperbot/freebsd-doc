==============================================
4.2. Aproximaci?n a la instalaci?n de software
==============================================

.. raw:: html

   <div class="navheader">

4.2. Aproximaci?n a la instalaci?n de software
`Anterior <ports.html>`__?
Cap?tulo 4. Instalaci?n de aplicaciones: ?packages? y ports
?\ `Siguiente <ports-finding-applications.html>`__

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

4.2. Aproximaci?n a la instalaci?n de software
----------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Si ha usado un sistema UNIX? con anterioridad sabr? que el procedimiento
t?pico para instalar software de terceros es algo similar a esto:

.. raw:: html

   <div class="procedure">

#. Descargar el software, que puede distribuirse en formato de c?digo
   fuente o binario.

#. Desempaquetar el software de su formato de distribuci?n (normalmente
   en un ?tarball? comprimido con
   `compress(1) <http://www.FreeBSD.org/cgi/man.cgi?query=compress&sektion=1>`__,
   `gzip(1) <http://www.FreeBSD.org/cgi/man.cgi?query=gzip&sektion=1>`__
   o
   `bzip2(1) <http://www.FreeBSD.org/cgi/man.cgi?query=bzip2&sektion=1>`__).

#. Consultar la documentaci?n (quiz?s un fichero ``INSTALL`` o
   ``README``, o los ficheros del subdirectorio ``doc/``) para ver como
   instalar el software.

#. Si el software se distribuye como fuente, compilarlo. Esto puede
   requerir que editemos el fichero ``Makefile`` o que ejecutemos el
   ?script? ``configure``, entre otras cosas.

#. Instalar y probar el software.

.. raw:: html

   </div>

Y esto solamente si todo marcha bien. Si est? instalando un software que
no ha sido portado espec?ficamente para FreeBSD, puede que sea necesario
editar el c?digo para que funcione correctamente.

Si lo desea puede continuar instalando software de la forma
?tradicional? en FreeBSD, aunque FreeBSD dispone de dos tecnolog?as que
le pueden ahorrar gran cantidad de tiempo y esfuerzo: los packages y los
ports. En el momento de escribir esto existen m?s de 24,000 aplicaciones
de terceros.

En cualquier aplicaci?n el paquete de FreeBSD es un solo fichero que
tiene que descargar. Los paquetes contienen copia de los programas
binarios precompilados de la aplicaci?n, as? como cualquier fichero de
configuraci?n o documentaci?n. Los paquetes descargados se pueden
manipular con las herramientas de gesti?n de paquetes de FreeBSD:
`pkg\_add(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_add&sektion=1>`__,
`pkg\_delete(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_delete&sektion=1>`__,
`pkg\_info(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_info&sektion=1>`__,
etc. Instalar una aplicaci?n nueva puede realizarse con una sola orden.

Un port de FreeBSD es una colecci?n de ficheros dise?ada para
automatizar el proceso de compilaci?n desde el c?digo fuente.

Recuerde que existen ciertos pasos que deber? llevar a cabo para
compilar un programa por usted mismo (descargar, desempaquetar,
parchear, compilar e instalar). Los ficheros que conforman un port
permiten que el sistema se encargue de todo esto. Usted ejecuta un
conjunto simple de ?rdenes y el c?digo fuente se descarga, desempaqueta,
parchea, compila e instala.

De hecho el sistema de ports tambi?n se puede usar para crear paquetes
que posteriormente se pueden manipular con ``pkg_add`` y las dem?s
utilidades de gesti?n de packages que veremos en breve.

Tanto el sistema de ports como el de paquetes entienden las
*dependencias*. Suponga que desea instalar una aplicaci?n que depende de
que una biblioteca espec?fica est? instalada. Tanto la biblioteca como
la aplicaci?n existen en FreeBSD como paquete o port. Si utiliza
``pkg_add`` o el sistema de ports para instalar la aplicaci?n ambos
notar?n que la biblioteca no est? instalada y proceder?n a instalarla
antes que nada.

Dado que ambas tecnolog?s son similares quiz?s se pregunte por qu?
FreeBSD se toma la molest?a de contar con ambas. Los Packages y los
Ports tienen sus propias ventajas, as? que cu?l utilizar depender? de su
elecci?n en cada momento.

.. raw:: html

   <div class="itemizedlist">

.. raw:: html

   <div class="itemizedlist-title">

Ventajas de los Paquetes

.. raw:: html

   </div>

-  El fichero tarball de un package es normalmente m?s peque?o que el
   tarball con el c?digo fuente de la aplicaci?n.

-  Los paquetes no requieren compilaci?n. En el caso de aplicaciones
   grandes, como Mozilla, KDE, o GNOME este detalle puede ser
   importante, especialmente si usa un equipo lento.

-  Los paquetes no requieren que comprenda el proceso que envuelve el
   compilar software bajo FreeBSD.

.. raw:: html

   </div>

.. raw:: html

   <div class="itemizedlist">

.. raw:: html

   <div class="itemizedlist-title">

Ventajas de los Ports

.. raw:: html

   </div>

-  Normalmente los paquetes se compilan con opciones conservadoras, en
   virtud del gran n?mero de equipos donde se instalar?n. Al instalar
   como port puede usted editar las preferencias para (por ejemplo)
   generar c?digo espec?fico para un procesador Pentium IV o Athlon.

-  Algunas aplicaciones tienen opciones sobre lo que pueden y lo que no
   pueden hacer. Por ejemplo Apache se puede configurar con una gran
   variedad de opciones. Al compilarlo desde los ports usted no tiene
   por que aceptar las opciones predefinidas, puede seleccionar que
   opciones desea.

   En algunos casos existen varios paquetes para la misma aplicaci?n con
   diferentes opciones. Por ejemplo, Ghostscript est? disponible como
   paquete ``ghostscript`` y como paquete ``ghostscript-nox11``,
   dependiendo de si usted cuenta o no con servidor X11. En este caso
   decidir puede ser sencillo e incluso pueden facilitarse packages con
   ambas opciones, pero elegir se puede volver un problema si hay m?s de
   una o dos opciones de compilaci?n.

-  Las condiciones de la licencia de algunas aplicaciones prohiben la
   distribuci?n de binarios. Solo permiten la distribuci?n del c?digo
   fuente.

-  Existe gente que no conf?a en los binarios. Al menos puede usted (en
   teor?a) revisar el c?digo fuente y localizar problemas potenciales.

-  Si tiene parches locales necesitar? el c?digo fuente para poder
   aplicarlos.

-  Hay gente a la que le gusta tener el c?digo fuente para poder leerlo
   en ratos de ocio, modificarlo, tomar partes prestadas (cuando la
   licencia lo permite, claro est?), etc.

.. raw:: html

   </div>

Para tener constancia de los ports actualizados, suscr?base a la `lista
de correo sobre los ports de
FreeBSD <http://lists.FreeBSD.org/mailman/listinfo/freebsd-ports>`__ y a
la `lista de correo sobre errores en los ports de
FreeBSD <http://lists.FreeBSD.org/mailman/listinfo/freebsd-ports-bugs>`__.

.. raw:: html

   <div class="warning" xmlns="">

Aviso:
~~~~~~

?Antes de instalar cualquier aplicaci?n consulte
``http://vuxml.freebsd.org`` para comprobar los posibles problemas de
seguridad relacionados con ella.

Tambi?n puede instalar
`security/portaudit <http://www.freebsd.org/cgi/url.cgi?ports/security/portaudit/pkg-descr>`__
que autom?ticamente comprobar? las vulnerabilidades conocidas de todas
las aplicaciones instaladas; tambi?n lo comprobar? antes de compilar
cualquier port. Mientras tanto, puede usar ``portaudit -F -a`` despu?s
de instalar algunos packages.

.. raw:: html

   </div>

El resto de este cap?tulo le explicar? c?mo usar los ports y los
packages para instalar software de terceros en FreeBSD.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------------------------------+---------------------------+------------------------------------------------------+
| `Anterior <ports.html>`__?                                     | `Subir <ports.html>`__    | ?\ `Siguiente <ports-finding-applications.html>`__   |
+----------------------------------------------------------------+---------------------------+------------------------------------------------------+
| Cap?tulo 4. Instalaci?n de aplicaciones: ?packages? y ports?   | `Inicio <index.html>`__   | ?4.3. C?mo encontrar aplicaciones                    |
+----------------------------------------------------------------+---------------------------+------------------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
