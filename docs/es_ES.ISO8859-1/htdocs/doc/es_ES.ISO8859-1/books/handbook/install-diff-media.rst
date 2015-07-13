==================================================
2.13. C?mo preparar su propio medio de instalaci?n
==================================================

.. raw:: html

   <div class="navheader">

2.13. C?mo preparar su propio medio de instalaci?n
`Anterior <install-advanced.html>`__?
Cap?tulo 2. Instalaci?n de FreeBSD
?\ `Siguiente <basics.html>`__

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

2.13. C?mo preparar su propio medio de instalaci?n
--------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

?Para evitar la repetici?n ?disco FreeBSD? ser? en adelante un CDROM o
un DVD de FreeBSD que haya comprado o hecho por sus propios medios.

.. raw:: html

   </div>

Es posible que tengaque crear su propio medio de instalaci?n de FreeBSD.
Puede tratarse de un medio f?sico como una cinta o una fuente para que
sysinstall pueda obtener los ficheros que vaya necesitando, como un
sitio FTP local, o bien puede tratarse de una partici?n MS-DOS?.

Por ejemplo:

.. raw:: html

   <div class="itemizedlist">

-  Tiene muchas m?quinas conectadas a una red local y un s?lo disco
   FreeBSD. Quiere crear un sitio FTP local con el contenido del disco
   FreeBSD y que desde ?l sus m?quinas obtengan los ficheros en lugar de
   tener que conectarse a Internet.

-  Tiene un disco FreeBSD y FreeBSD no reconoce su unidad CD/DVD pero
   MS-DOS?/Windows? s?. Quiere copiar los ficheros de instalaci?n de
   FreeBSD a una partici?n DOS en mismo sistema y luego instalar FreeBSD
   usando esos ficheros.

-  El sistema en el que quiere instalar FreeBSD no tiene unidad CD/DVD
   ni tarjeta de red pero puede conectar un cable paralelo o un cable
   serie ?Laplink? a una computadora que s? que tiene.

-  Quiere crear una cinta desde la que se pueda instalar FreeBSD.

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

2.13.1. Creaci?n de un CDROM de instalaci?n
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Con cada ?release? el Proyecto FreeBSD libera dos im?genes de CDROM
(?im?genes ISO?). Dichas im?genes pueden copiarse a CD si dispone de una
grabadora y usarse posteriormente para instalar FreeBSD. Si tiene una
grabadora de CD y el ancho de banda no le supone un problema la forma
m?s f?cil de instalar FreeBSD es esta.

.. raw:: html

   <div class="procedure">

#. **Descargar la imagen ISO correcta**

   Puede descargar las im?genes ISO de cada ?release? desde
   ``ftp://ftp.FreeBSD.org/pub/FreeBSD/ISO-IMAGES-arquitectura/versi?n``
   o desde la r?plica m?s pr?xima. Sustituya *``arquitectura``* y
   *``versi?n``* por lo que corresponda.

   Ese directorio contendr? normalmente las siguientes im?genes:

   .. raw:: html

      <div class="table">

   .. raw:: html

      <div class="table-title">

   Tabla 2.4. Nombres y funciones de las im?genes de FreeBSD?6.\ *``X``*
   and 7.\ *``X``*

   .. raw:: html

      </div>

   .. raw:: html

      <div class="table-contents">

   +-----------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | Nombre                                  | Contenido                                                                                                                                                                                        |
   +=========================================+==================================================================================================================================================================================================+
   | ``versi?n-RELEASE-arch-bootonly.iso``   | Todo lo necesario para arrancar un kernel de FreeBSD y ejecutar la interfaz de instalaci?n. Los ficheros que vayan haciendo falta tendr?n que irse descargando por FTP o por alg?n otro medio.   |
   +-----------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | ``versi?n-RELEASE-arch-disc1.iso``      | Todo lo necesario para instalar AFreeBSD y un ?live filesystem?, que le ser? muy ?til (conjuntamente con la aplicaci?n ?Repair? de sysinstall.                                                   |
   +-----------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | ``versi?n-RELEASE-arch-disc2.iso``      | Todas las aplicaciones que puedan caber en un disco.                                                                                                                                             |
   +-----------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | ``versi?n-RELEASE-arch-docs.iso``       | La documentaci?N de FreeBSD.                                                                                                                                                                     |
   +-----------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

   .. raw:: html

      </div>

   .. raw:: html

      </div>

   | 

   Descargue la imagen ISO de arranque (si existe para su plataforma) o
   la imagen del disco uno. *No* descargue ambas, puesto que el disco
   uno contiene todo lo que hay en la imagen ISO de arranque.

   Utilice la imagen ISO de arranque si su acceso a Internet es barato.
   Con ella podr? instalar FreeBSD e instalar todo tipo de software
   descarg?ndolo como paquetes/ports (consulte el `Cap?tulo?4,
   *Instalaci?n de aplicaciones: ?packages? y ports* <ports.html>`__)
   cuando lo precise.

   Utilice la imagen del disco uno si quiere disponer en el propio disco
   de una selecci?n bastante completa de software.

   Si tiene acceso de alta velocidad a Internet las dem?s im?genes de
   disco son ?tiles pero no esenciales.

#. **Escribir los CD**

   Si va a grabar los CD en un sistema FreeBSD consulte la
   `Secci?n?18.6, “Creaci?n y uso de medios ?pticos
   (CD)” <creating-cds.html>`__ (en particular la `Secci?n?18.6.3,
   “burncd” <creating-cds.html#burncd>`__ y la `Secci?n?18.6.4,
   “cdrecord” <creating-cds.html#cdrecord>`__).

   Las im?genes se hacen en un formato ISO est?ndar; si va a grabarlas
   en cualquier otra plataforma no deber?a tener problemas para hacerlo
   cualquiera que sea la aplicaci?n que use para grabar CD.

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Si lo que quiere hacer es crear una ?release? personalizada de FreeBSD
consulte el art?culo `Release
Engineering <../../../../doc/es_ES.ISO8859-1/articles/releng>`__.

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

2.13.2. Creaci?n de un sitio FTP local a partir de un disco de instalaci?n de FreeBSD
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Los discos de FreeBSD tienen la misma estructura que los sitios FTP. Esa
circunstancia le facilitar? mucho la tarea de crear un sitio FTP local
para uso de otras m?quinas de su red durante la instalaci?n de FreeBSD.

.. raw:: html

   <div class="procedure">

#. Monte el CDROM en el directorio ``/cdrom`` del sistema que va a
   albergar el sitio FTP.

   .. code:: screen

       # mount /cdrom

#. Cree una cuenta apta para FTP an?nimo en ``/etc/passwd`` editando
   ``/etc/passwd`` con
   `vipw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=vipw&sektion=8>`__.
   A??dale lo siguiente:

   .. code:: programlisting

       ftp:*:99:99::0:0:FTP:/cdrom:/nonexistent

#. Compruebe que el servicio FTP est? activado en ``/etc/inetd.conf``.

.. raw:: html

   </div>

Ahora cualquier m?quina capaz de conectarse a su sistema a trav?s de una
red puede elegir como medio de instalaci?n ?FTP? y escribir
**``ftp://su m?quina``** tras seleccionar ?Other? en el men? de sitios
FTP.

.. raw:: html

   <div class="warning" xmlns="">

Aviso:
~~~~~~

?Acabamos de exponer una buena soluci?n para usar en un sistema de su
propia red y que adem?s est? protegido por un cortafuegos. Si ofrece
servicios FTP a m?quinas de Internet (y no de su red local) expone su
sistema a caer bajo la atenci?n de ?crackers? y otras variedades de
indeseable. Le recomendamos encarecidamente que siga a rajatabla
pol?ticas sensatas de seguridad.

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

2.13.3. Creaci?n de disquetes de instalaci?n
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Si quiere instalar FreeBSD desde disquetes (cosa que, de antemano, le
sugerimos que *no* haga) bien sea porque FreeBSD no soporta cierto
componente necesario de su sistema o sencillamente porque insiste en
querer hacer las cosas de la manera m?s dif?cil, tendr? que tener a mano
unos cuantos disquetes.

Como m?nimo necesitar? tantos disquetes de 1.44?MB o 1.2?MB como hagan
falta para dar cabida a todos los ficheros que hay en ``bin``. Recuerde
la entrada ?binary distribution? (distribuci?n binaria) durante la
instalaci?n. Si est? generando los disquetes en DOS *debe formatearlos*
con ``FORMAT`` de MS-DOS?. Si est? usando Windows? puede usar el
Explorador para formatear disquetes: bot?n derecho del rat?n sobre la
unidad ``A:`` y elija ?Formatear?.

?*No* conf?e en el preformateo de f?brica de los disquetes. Format?elos
usted de nuevo, s?lo para asegurarse. La mayor?a de los problemas de los
que se ha informado se han debido a formateos defectuosos, t?ngalo en
cuenta.

Si puede crear los disquetes en una m?quina FreeBSD un formateo sigue
sin ser una mala idea, pero no necesitar? crear un sistema de ficheros
DOS en cada floppy. Use ``disklabel`` y ``newfs`` para crear un sistema
de ficheros UFS en los disquetes tal y como se muestra aqu? (en un
floppy de 1.44?MB y 3.5") :

.. code:: screen

    # fdformat -f 1440 fd0.1440
    # disklabel -w -r fd0.1440 floppy3
    # newfs -t 2 -u 18 -l 1 -i 65536 /dev/fd0

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

?Tendr? que usar ``fd0.1200`` y ``floppy5`` si usa discos de 5.25" y
1.2?MB.

.. raw:: html

   </div>

Ahora puede montarlos y escribir en ellos igual que en cualquier otro
sistema de ficheros del sistema.

Tras el formateo de los disquetes pasamos a llenarlos. Los ficheros
necesarios para crear la distribuci?n se dividen en partes de tama?o
regular de modo que cinco de ellas entren en otros tantos disquetes de
1.44?MB. Empaquete tantos ficheros como pueda en cada uno hasta que
tenga todas las distribuciones que necesita listas para pasar a los
disquetes. Cada distribuci?n deber?a ir en un subdirectorio del floppy,
por ejemplo ``a:\bin\bin.aa``, ``a:\bin\bin.ab``, etc.

Una vez en el men? de selecci?n de medio de instalaci?n elija Floppy y
siga las instrucciones.

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

2.13.4. Instalaci?n desde una partici?n MS-DOS?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Copie los ficheros de la distribuci?n en un directorio llamado
``freebsd`` en el directorio ra?z de la partici?n, por ejemplo
``c:\freebsd``. La estructura de directorios del sitio FTP o el CDROM
debe reproducirse parcialmente en este directorio, as? que le sugerimos
que use ``xcopy`` si est? copiando los datos desde un CD. En el
siguiente ejemplo vamos a preparar una instalaci?n m?nima de FreeBSD:

.. code:: screen

    C:\> md c:\freebsd
    C:\> xcopy e:\bin c:\freebsd\bin\ /s
    C:\> xcopy e:\manpages c:\freebsd\manpages\ /s

Se ha asumido que ``C:`` es donde tiene espacio libre y ``E:`` es donde
tiene montada su unidad CDROM.

Si no tiene unidad CDROM puede descargar la distribuci?n desde
`ftp.FreeBSD.org <ftp://ftp.FreeBSD.org/pub/FreeBSD/releases/i386/10.1-RELEASE/>`__.
Cada distribuci?n dispone de su propio directorio; por ejemplo, la
distribuci?n *base* est? en el
directorio\ `10.1/base/ <ftp://ftp.FreeBSD.org/pub/FreeBSD/releases/i386/10.1-RELEASE/base/>`__.

La ?nica distribuci?n *imprescindible* es ``BIN``. Guarde esta y todas
las distribuciones que quiera instalar desde una partici?n MS-DOS? bajo
``c:\freebsd``.

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

2.13.5. Creaci?n de una cinta de instalaci?n
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

La instalaci?n desde cinta es probablemente el m?todo m?s f?cil, casi
tanto como una instalaci?n desde una r?plica FTP o desde un CDROM. Lo
?nico que el programa de instalaci?n necesita es que los ficheros est?n
empaquetados con tar y en una cinta. Veamos un ejemplo:

.. code:: screen

    # cd /freebsd/distdir
    # tar cvf /dev/rwt0 dist1 ... dist2

Cuando est? preparando la instalaci?n tenga la precauci?n de dejar sitio
suficiente en alg?n directorio temporal (accesible en ese momento) para
dejar *todos los ficheros* que hubiera en la cinta de instalaci?n. A
causa del acceso secuencial propio del dise?o de las cintas este m?todo
de instalaci?n requiere un poco de almacenamiento temporal.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

?Recuerde que antes de arrancar desde el disquete de arranque la cinta
*debe estar en la unidad*. La prueba de hardware de la instalaci?n no
encontrar?a la cinta.

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

2.13.6. Before Installing over a Network
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Hay tres tipos de instalaci?n a trav?s de una red disponibles en
FreeBSD: Puerto serie (SLIP o PPP), puerto paralelo (PLIP (cable
?laplink?)) y Ethernet.

El adaptador Ethernet es, debido a su velocidad de transferencia, la
mejor elecci?n. FreeBSD soporta la mayor?a de los adaptadores Ethernet.
Tiene una lista de dispositivos soportados en las notas de hardware de
cada ?release? de FreeBSD. Si disponde alguno de los adaptadores
Ethernet PCMCIA soportados por FreeBSD recuerde que debe estar presente
en el sistema *antes* de que el sistema arranque. Por desgracia FreeBSD
no soporta a?n la inserci?n en caliente de tarjetas PCMCIA durante la
instalaci?n.

Tendr? que saber tambi?n la direcci?n IP de la red, la m?scara de red
correcta para la clase de su red y el nombre de su m?quina. Si va a
instalar mediante una conexi?n PPP y no tiene IP est?tica no se
preocupe, su ISP puede asignarle una IP temporal din?micamente. Su
administrador de sistemas seguramente puede ayudarle con la
configuraci?n de su red. Si va a intentar conectarse con otras m?quinas
mediante sus nombres en lugar de sus direcciones IP necesitar? los datos
de un servidor de nombres y es posible que necesite tambi?n la direcci?n
de un ?gateway? (si usa PPP vale con la direcci?n IP de su proveedor).
Si va a instalar por FTP a trav?s de un proxy HTTP necesitar? la
direcci?n del proxy. Si no sabe qu? pueden significar todas (o la
mayor?a) de estas preguntas hable con su administrador de sistemas o con
su ISP *antes* de intentar instalar FreeBSD de esta forma.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

2.13.6.1. Antes de instalar via NFS
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

La instalaci?n por NFS es bastante sencilla. S?lo tendr? que copiar los
ficheros de la distribuci?n a un servidor NFS, seleccionar NFS como
medio de instalaci?n y apuntar a los contenidos a donde los haya
copiado.

si el servidor s?lo soporta ?puertos privilegiados? (que suele ser la
configuraci?n por omisi?n en estaciones de trabajo Sun) tendr? que
seleccionar la opci?n ``NFS Secure`` en el men? ?Options? antes de
comenzar con la instalaci?n.

Si usa tarjeta Ethernet de mala calidad y est? experimentando
velocidades de transferencia muy bajas puede probar con el par?metro
``NFS Slow``.

Para que la instalaci?n via NFS funcione el servidor debe permitir el
montaje de subdirectorios. Por ejemplo, si su distribuci?n FreeBSD?10.1
est? en ``ziggy:/usr/archive/stuff/FreeBSD`` el servidor ``ziggy``
tendr? que permitir que pueda montarse ``/usr/archive/stuff/FreeBSD``,
no simplemente como ``/usr`` o ``/usr/archive/stuff``.

En el fichero ``/etc/exports`` de FreeBSD eso puede controlarse mediante
la opci?n ``-alldirs``. Puede que otros servidores NFS requieran de
par?metros diferentes. Si ve mensajes de permission denied seguramente
no ha activado esto correctamente.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------+----------------------------+------------------------------------------+
| `Anterior <install-advanced.html>`__?   | `Subir <install.html>`__   | ?\ `Siguiente <basics.html>`__           |
+-----------------------------------------+----------------------------+------------------------------------------+
| 2.12. Gu?a avanzada de instalaci?n?     | `Inicio <index.html>`__    | ?Cap?tulo 3. Conceptos b?sicos de Unix   |
+-----------------------------------------+----------------------------+------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
