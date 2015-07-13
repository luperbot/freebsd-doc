==============================================
15.5. Administraci?n y personalizaci?n a fondo
==============================================

.. raw:: html

   <div class="navheader">

15.5. Administraci?n y personalizaci?n a fondo
`Anterior <jails-build.html>`__?
Cap?tulo 15. Jaulas
?\ `Siguiente <jails-application.html>`__

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

15.5. Administraci?n y personalizaci?n a fondo
----------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Hay diversas opciones que pueden usarse en las jaulas y varios tipos de
formas de combinar un sistema FreeBSD servidor y las jaulas y poder
disponer de aplicaciones de alto nivel. En esta secci?n se muestra lo
siguiente:

.. raw:: html

   <div class="itemizedlist">

-  Algunas de las opciones disponibles para personalizar el
   comportamiento y las restricciones de seguridad que pueden aplicarse
   en una jaula.

-  Algunas de las aplicaciones de alto nivel creadas para la
   administraci?n de jaulas. Estas aplicaciones est?n en la colecci?n de
   ports y pueden utilizarse en conjunto para implementar productos
   basados en jaulas.

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

15.5.1. Herramientas del sistema para la personalizaci?n de jaulas en FreeBSD
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

La personalizaci?n a fondo de las jaulas se hace en su mayor parte
mediante la configuraci?n de variables
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__.
Hay una subcategor?a especial de sysctl para que sea m?s sencillo
organizar las opciones m?s m?s importantes: se trata de las opciones de
la jerarqu?a ``security.jail.*`` del kernel de FreeBSD. A continuaci?n
veremos una lista de las principales sysctl relacionadas con las jaulas
y los valores que tienen por omisi?n. Los nombres deber?an describir por
s? mismos qu? funci?n tienen (N. del T.: En ingl?s, claro) pero si
necesita m?s informaci?n sobre ellas consulte las p?ginas de manual
`jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8>`__ y
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__.

.. raw:: html

   <div class="itemizedlist">

-  ``security.jail.set_hostname_allowed:          1``

-  ``security.jail.socket_unixiproute_only:          1``

-  ``security.jail.sysvipc_allowed:          0``

-  ``security.jail.enforce_statfs:          2``

-  ``security.jail.allow_raw_sockets:          0``

-  ``security.jail.chflags_allowed:         0``

-  ``security.jail.jailed: 0``

.. raw:: html

   </div>

El administrador del *servidor* puede usar estas variables para a?adir o
quitar limitaciones impuestas por omisi?n al usuario ``root``. Tenga en
cuenta que hay ciertas limitaciones que no pueden quitarse. El usuario
``root`` no puede montar o desmontar sistemas de ficheros desde su
jaula. El usuario ``root`` no puede cargar o descargar reglas de
`devfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=devfs&sektion=8>`__,
configurar reglas de cortafuegos ni ejecutar muchas otras tareas
administrativas que requieran modificaciones o acceso a datos internos
del kernel, como cambiar el nivel de seguridad ``securelevel`` del
kernel.

El sistema base de FreeBSD contiene un conjunto b?sico de herramientas
que permiten el acceso a informaci?n sobre jaulas activas en el sistema,
as? como la conexi?n a una jaula para ejecutar comandos administrativos.
`jls(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jls&sektion=8>`__ y
`jexec(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jexec&sektion=8>`__
forman parte del sistema base de FreeBSD y permiten ejecutar las
siguientes tareas:

.. raw:: html

   <div class="itemizedlist">

-  Mostrar una lista de jaulas activas y sus correspondientes
   identificadores de jaula (JID), direcci?n IP, nombre de m?quina y
   ruta.

-  Conectarse a una jaula en ejecuci? desde el servidor y ejecutar un
   comando dentro de la jaula o realizar tareas administrativas dentro
   de dicha jaula. Esto es muy ?til cuando el usuario ``root`` quiere
   apagar la jaula de forma limpia. La herramienta
   `jexec(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jexec&sektion=8>`__
   permite tambi?n arrancar una shell dentro de la jaula para realizar
   tareas administrativas. Veamos un ejemplo:

   .. code:: screen

       # jexec 1 tcsh

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

15.5.2. Herramientas para tareas administrativas de alto nivel en la Colecci?n de Ports
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Entre las variadas aplicaciones ajenas al Proyecto FreeBSD que han ido
apareciendo para administrar jaulas una de las m?s completas y ?tiles es
`sysutils/jailutils <http://www.freebsd.org/cgi/url.cgi?ports/sysutils/jailutils/pkg-descr>`__.
Es un conjunto de peque?as aplicaciones de mucha ayuda en la gesti?n de
una jaula
(`jail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=jail&sektion=8>`__).
Por favor, consulte su p?gina web para m?s informaci?n.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------+---------------------------+---------------------------------------------+
| `Anterior <jails-build.html>`__?      | `Subir <jails.html>`__    | ?\ `Siguiente <jails-application.html>`__   |
+---------------------------------------+---------------------------+---------------------------------------------+
| 15.4. Creaci?n y gesti?n de jaulas?   | `Inicio <index.html>`__   | ?15.6. Uso de las jaulas                    |
+---------------------------------------+---------------------------+---------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
