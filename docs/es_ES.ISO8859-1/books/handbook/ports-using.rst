=================================
4.5. Uso de la colecci?n de ports
=================================

.. raw:: html

   <div class="navheader">

4.5. Uso de la colecci?n de ports
`Anterior <packages-using.html>`__?
Cap?tulo 4. Instalaci?n de aplicaciones: ?packages? y ports
?\ `Siguiente <ports-nextsteps.html>`__

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

4.5. Uso de la colecci?n de ports
---------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

La siguiente secci?n incluye las instrucciones b?sicas para instalar o
eliminar programas mediante la Colecci?n de Ports de su sistema.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.5.1. C?mo obtener la Colecci?n de Ports
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Para poder instalar ports primero debe hacerse, obviamente, con la
Colecci?n de Ports—; en esencia est? compuesta por ``Makefiles``,
parches y ficheros con la descripci?n de los ports y est? en
``/usr/ports``.

Cuando instal? su sistema FreeBSD el programa sysinstall le pregunt? si
quer? instalar la Colecci?n de Ports. Si contest? que no siga estas
instrucciones:

.. raw:: html

   <div class="procedure">

.. raw:: html

   <div class="procedure-title">

Procedimiento 4.1. Mediante CVSup

.. raw:: html

   </div>

Este es un m?todo r?pido de conseguir y mantener una copia de la
Colecci?n de Ports al dia mediante el protocolo CVSup. Si quiere saber
m?s sobre CVSup consulte `Uso de CVSup <cvsup.html>`__.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

La implementaci?n del protocolo CVSup que se incluye en FreeBSD se llama
csup. Apareci? en FreeBSD?6.2. Los usuarios de releases anteriores de
FreeBSD puden instalar
`net/csup <http://www.freebsd.org/cgi/url.cgi?ports/net/csup/pkg-descr>`__
como port o package.

.. raw:: html

   </div>

Aseg?rese de que ``/usr/ports`` est? vac?o antes de ejecutar csup por
primera vez. Si ya tiene la Colecci?n de Ports porque la ha instalado
por otros medios csup no purgar? los parches de ports eliminados.

#. Ejecute ``csup``:

   .. code:: screen

       # csup -L 2 -h cvsup.FreeBSD.org /usr/share/examples/cvsup/ports-supfile

   Cambie *``cvsup.FreeBSD.org``* por alg?n otro servidor CVSup que
   tenga cerca. Consulte `R?plicas CVSup <cvsup.html#cvsup-mirrors>`__
   (`Secci?n?30.2.2, “Servidores” <cvsup.html#cvsup-mirrors>`__), donde
   encontrar? una lista completa de las r?plicas CVSup.

   .. raw:: html

      <div class="note" xmlns="">

   Nota:
   ~~~~~

   Puede usar una versi?n de ``ports-supfile`` confeccionada a su gusto,
   por ejemplo para evitar tener que indicarle el nombre del servidor
   CVSup a mano.

   .. raw:: html

      <div class="procedure" xmlns="http://www.w3.org/1999/xhtml">

   #. Haga lo siguiente: como ``root`` copie
      ``/usr/share/examples/cvsup/ports-supfile`` en otro sitio, por
      ejemplo ``/root`` o su directorio /home.

   #. Edite ``ports-supfile``.

   #. Reemplace *``CHANGE_THIS.FreeBSD.org``* por un servidor CVSup que
      est? cerca de donde est? usted. Consulte `R?plicas
      CVSup <cvsup.html#cvsup-mirrors>`__ (`Secci?n?30.2.2,
      “Servidores” <cvsup.html#cvsup-mirrors>`__) si necesita ver una
      lista completa de las mismas.

   #. Ejecute ``csup``\ del siguiente modo:

      .. code:: screen

          # csup -L 2 /root/ports-supfile

   .. raw:: html

      </div>

   .. raw:: html

      </div>

#. Al ejecutar
   `csup(1) <http://www.FreeBSD.org/cgi/man.cgi?query=csup&sektion=1>`__
   descargar? y aplicar? todos los cambios recientes que haya sufrido la
   Colecci?n de Ports, pero tenga en cuenta que no actualizar? ninguno
   de los ports que ya tenga instalados en su sistema.

.. raw:: html

   </div>

.. raw:: html

   <div class="procedure">

.. raw:: html

   <div class="procedure-title">

Procedimiento 4.2. Mediante portsnap

.. raw:: html

   </div>

Portsnap es un m?todo alternativo de distribuir la Colecci?n de Ports.
Se incluy? por primera vez en FreeBSD?6.0. Puede instalar
`portsnap(8) <http://www.FreeBSD.org/cgi/man.cgi?query=portsnap&sektion=8>`__
en versiones anteriores de FreeBSD como port
(`ports-mgmt/portsnap <http://www.freebsd.org/cgi/url.cgi?ports/ports-mgmt/portsnap/pkg-descr>`__)
o como package:

.. code:: screen

    # pkg_add -r portsnap

#. Puede saltarse esta paso a partir de FreeBSD?6.1-RELEASE y en
   versiones recientes de Portsnap (port o package). ``/usr/ports`` se
   crear? autom?ticamente la primera vez que ejecute
   `portsnap(8) <http://www.FreeBSD.org/cgi/man.cgi?query=portsnap&sektion=8>`__.
   En versiones anteriores de portsnap hab?a que crear un ``/usr/ports``
   vac?o si no exist?a previamente:

   .. code:: screen

       # mkdir /usr/ports

#. Descargue una instant?nea comprimida de la Colecci?n de Ports en
   ``/var/db/portsnap``. Hecho esto puede desconectar de Internet si
   quiere.

   .. code:: screen

       # portsnap fetch

#. Si est? ejecutando Portsnap por vez primera debe extraer la
   instant?nea en ``/usr/ports``:

   .. code:: screen

       # portsnap extract

   Si ya tiene un ``/usr/ports`` y solamente est? actualizando su ?rbol
   de ports ejecute lo siguiente:

   .. code:: screen

       # portsnap update

.. raw:: html

   </div>

.. raw:: html

   <div class="procedure">

.. raw:: html

   <div class="procedure-title">

Procedimiento 4.3. Mediante Sysinstall

.. raw:: html

   </div>

Este m?todo implica el uso de sysinstall para instalar la Colecci?n de
Ports.

#. Como usuario ``root`` ejecute ``sysinstall`` (``/stand/sysinstall``
   en cualquier versi?n previa a FreeBSD?5.2); del siguiente modo:

   .. code:: screen

       # sysinstall

#. Posici?nese en la opci?n Configure y pulse **Intro**.

#. Seleccione la opci?n Distributions y pulse **Intro**.

#. Seleccione la opci?n ports y pulse la **barra espaciadora**.

#. Seleccione el medio de instalaci?n deseado (CDROM, FTP, etc.)

#. Dir?jase a la opci?n Exit y pulse **Intro**.

#. Pulse **X** para salir de sysinstall.

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

4.5.2. Instalaci?n de ports
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Al hablar de la Colecci?n de Ports lo primero que hay que explicar es a
qu? nos referimos cuando hablamos de un ?esqueleto? (skeleton). El
esqueleto de un port es un conjunto m?nimo de ficheros que indican a
FreeBSD c?mo compilar e instalar un programa. Cada esqueleto incluye:

.. raw:: html

   <div class="itemizedlist">

-  Un ``Makefile``. Este ``Makefile`` contiene diversas sentencias que
   le indican al sistema c?mo compilarlo y d?nde instalarlo en su
   sistema.

-  Un fichero ``distinfo``. Este fichero contiene informaci?n sobre los
   ficheros que se debe descargar para poder compilar el programa, as?
   como el identificador ?checksum?, que se usa para comprobar mediante
   `md5(1) <http://www.FreeBSD.org/cgi/man.cgi?query=md5&sektion=1>`__
   que la descarga ha sido correcta y que el la integridad del fichero
   est? garantizada.

-  Un directorio ``files``. Este directorio contiene los parches
   necesarios para compilar e instalar el programa en su sistema
   FreeBSD. B?sicamente los parches son peque?os ficheros que
   especifican cambios en ficheros concretos. Su formato es en texto
   plano y suelen decir cosas como ?borra la l?nea 10? o ?Cambia la
   l?nea 26 por esto?. Estos parches tambi?n se conocen como ?diffs? ya
   que se generan con
   `diff(1) <http://www.FreeBSD.org/cgi/man.cgi?query=diff&sektion=1>`__.

   Es posible que este directorio tambi? contenga alg?n otro fichero
   necesario para compilar e instalar el port.

-  Un fichero ``pkg-descr``. Es una descripci?n m?s detallada del
   programa. En algunas ocasiones ocupa varias l?neas.

-  Un fichero ``pkg-plist``. Es una lista de todos los ficheros que
   instalar? el port. Tambi?n le indica al sistema de ports qu? ficheros
   eliminar durante la desinstalaci?n del programa.

.. raw:: html

   </div>

Algunos ports tienen otros ficheros, como ``pkg-message``. El sistema de
ports los usa para gestionar situaciones especiales. Si desea conocer
los detalles, incluso sobre los ports en general, consulte el libro
`FreeBSD Porter's
Handbook <http://www.FreeBSD.org/doc/en_EN.ISO8859-1/books/porters-handbook/index.html>`__.

El port incluye las instrucciones necesarias para obtener software a
partir del c?digo fuente, pero no incluye el c?digo. Puede obtener el
c?digo desde un CDROM o desde Internet. El c?digo se distribuye del modo
que el autor estime oportuno. Normalmente es un fichero tar comprimido
con gzip, pero puede comprimirse con otra herramienta o incluso no estar
comprimido. El c?digo del programa, venga como venga, se llama
?distfile?. A continuaci?n veremos los dos m?todos de instalaci?n de un
port.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Debe ser el usuario ``root`` para instalar ports.

.. raw:: html

   </div>

.. raw:: html

   <div class="warning" xmlns="">

Aviso:
~~~~~~

?Antes de instalar cualquier port aseg?rese de tener la Colecci?n de
Ports actualizada y de comprobar en ``http://vuxml.freebsd.org/`` la
existencia de posibles problemas de seguridad que pudiera tener el port.

Puede realizar la comprobaci?n de seguridad con portaudit antes de
instalar cualquier aplicaci?n. Esta herramienta est? en la Colecci?n de
Ports
(`security/portaudit <http://www.freebsd.org/cgi/url.cgi?ports/security/portaudit/pkg-descr>`__).
Le rogamos que al menos considere ejecutar ``portaudit -F`` antes de
instalar un port nuevo para que descargue la nueva base de datos de
vulnerabilidades. Durante la comprobaci?n diaria de seguridad
actualizar? la base de datos y har? una auditor?a del sistema. Para m?s
informaci?n lea las p?ginas de man?al de
`portaudit(1) <http://www.FreeBSD.org/cgi/man.cgi?query=portaudit&sektion=1>`__
y
`periodic(8) <http://www.FreeBSD.org/cgi/man.cgi?query=periodic&sektion=8>`__.

.. raw:: html

   </div>

La Colecci?n de Ports asume que tiene usted conexi?n con Internet. Si no
es as? tendr? que disponer de una copia del distfile en
``/usr/ports/distfiles``.

El primer paso es ubicarse en el directorio del port que desea instalar:

.. code:: screen

    # cd /usr/ports/sysutils/lsof

Una vez en el directorio ``lsof`` puede ver el esqueleto del port. El
siguiente paso es compilar el port. Solamente tiene que teclear ``make``
en el prompt. Una vez hecho ver? algo como esto:

.. code:: screen

    # make
    >> lsof_4.57D.freebsd.tar.gz doesn't seem to exist in /usr/ports/distfiles/.
    >> Attempting to fetch from ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/.
    ===>  Extracting for lsof-4.57
    ...
    [La salida de la descompresi?n se ha eliminado]
    ...
    >> Checksum OK for lsof_4.57D.freebsd.tar.gz.
    ===>  Patching for lsof-4.57
    ===>  Applying FreeBSD patches for lsof-4.57
    ===>  Configuring for lsof-4.57
    ...
    [La salida de la configuraci?n se ha eliminado]
    ...
    ===>  Building for lsof-4.57
    ...
    [La salida de la compilaci?n se ha eliminado]
    ...
    #

Una vez que acabe la compilaci?n se le devolver? el control del prompt.
El siguiente paso es instalar el port. Para ello bastar? con que a?ada
una palabra a la orden ``make``: esa palabra es ``install``:

.. code:: screen

    # make install
    ===>  Installing for lsof-4.57
    ...
    [La salida de la instalaci?n se ha eliminado]
    ...
    ===>   Generating temporary packing list
    ===>   Compressing manual pages for lsof-4.57
    ===>   Registering installation for lsof-4.57
    ===>  SECURITY NOTE:
          This port has installed the following binaries which execute with
          increased privileges.
    #

Una vez que vuelva usted al prompt podr? ejecutar la aplicaci?n que
acaba de instalar. Dado que ``lsof`` es un programa que se ejecuta con
privilegios altos se le ha mostrado una advertencia de seguridad.
Durante la compilaci?n e instalaci?n es posible que hayan aparecido
otros.

Le recomendamos que borre el directorio que contiene todos los ficheros
temporales necesarios durante la compilaci?n. No solo consume valioso
espacio en disco sino que puede dar problemas cuando vaya a actualizar
el port a una versi?n m?s reciente.

.. code:: screen

    # make clean
    ===>  Cleaning for lsof-4.57
    #

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Puede ahorrarse teclear dos pasos si para instalar un port teclea
``make         install clean`` en lugar de ``make``, ``make install`` y
``make clean`` como tres pasos separados.

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Algunas shells mantienen una cach? de ?rdenes disponibles en los
directorios que aparecen en la variable de entorno ``PATH`` con el fin
de acelerar las operaciones de b?squeda de ejecutables de esas ?rdenes.
Si usa una de esas shells tendr? que utilizar la orden ``rehash`` tras
instalar un port o no podr? ejecutar aplicaciones reci?n instaladas.
Esta orden funciona en shells como ``tcsh``. Utilice ``hash -r`` en
shells ``sh``. Para m?s informaci?n consulte la documentaci?n de su
shell.

.. raw:: html

   </div>

Algunos DVD-ROM de terceros, como el FreeBSD Toolkit de `FreeBSD
Mall <http://www.freebsdmall.com/>`__ contienen distfiles. Puede usarlos
con la Colecci?n de Ports. Monte el DVD-ROM en ``/cdrom``. Si utiliza un
punto de montaje diferente asigne a ``CD_MOUNTPTS`` el valor adecuado.
Los distfiles se ir?n copiando autom?ticamente a medida que vayan siendo
necesarios.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Por favor, tenga en cuenta que la licencia de unos cuantos ports muy
concretos no permite su distribuci?n en CD-ROM. Puede deberse a que es
necesario rellenar un formulario de registro antes de descargarlo,
porque la redistribuci?n no est? permitida o por otra raz?n. Si quiere
instalar un port que no est? en el CD-ROM tendr? que tener salida a
Internet.

.. raw:: html

   </div>

El sistema de ports utiliza
`fetch(1) <http://www.FreeBSD.org/cgi/man.cgi?query=fetch&sektion=1>`__
para descargar ficheros; en este proceso intervienen varias variables de
entorno, como ``FTP_PASSIVE_MODE``, ``FTP_PROXY``, y ``FTP_PASSWORD``.
Si est? detr?s de un cortafuegos tendr? que asignar valores a una o m?s
de estas variables, as? como si necesita utilizar un proxy FTP/HTTP.
Consulte
`fetch(3) <http://www.FreeBSD.org/cgi/man.cgi?query=fetch&sektion=3>`__,
donde econtrar? una lista detallada.

La opci?n ``make       fetch`` se cre? para los usuarios que no disponen
de conexi?n cont?nua. Ejecute esta orden en el directorio ra?z
(``/usr/ports``) y se descargar?n todos los ficheros necesarios. Esta
orden tambi?n funciona en directorios situados m?s abajo, por ejemplo
``/usr/ports/net``. Tenga en cuenta que si un port depende de librer?as
u otros ports ?stos distfiles *no* se descargar?n, a menos que reemplace
``fetch`` por ``fetch-recursive``, que se encargar? de descargar todas
las dependencias de cada port.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Si quiere compilar todos los ports de una categor?a y de una sola vez
ejecutando la orden ``make`` en el directorio ra?z, de muy similar
manera que lo que se acaba de ver con ``makefetch``. Tenga en cuenta que
esto es bastante peligroso porque algunos ports no pueden coexistir.
Tambi?n se dan casos de ports que instalan instalan dos ficheros
diferentes con el mismo nombre.

.. raw:: html

   </div>

En algunos casos (raros) el usuario tendr? que descargar los tarball de
un sitio que no es el que se guarda en la variable de entorno
``MASTER_SITES`` (el sitio desde el que se descargan todos los dem?s
normalmente). Puede sobreescribir la opci?n ``MASTER_SITES`` con la
siguiente orden:

.. code:: screen

    # cd /usr/ports/directory
    # make MASTER_SITE_OVERRIDE= \
    ftp://ftp.FreeBSD.org/pub/FreeBSD/ports/distfiles/ fetch

En este ejemplo vamos a darle a la opci?n ``MASTER_SITES`` el valor
``ftp.FreeBSD.org/pub/FreeBSD/ports/distfiles/``.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Algunos ports permiten (o incluso exigen) que se le faciliten opciones
de compilaci?n para activar o desactivar partes de la aplicaci?n que no
se necesiten, determinadas opciones de seguridad, etc. Casos t?picos de
esto son
`www/mozilla <http://www.freebsd.org/cgi/url.cgi?ports/www/mozilla/pkg-descr>`__,
`security/gpgme <http://www.freebsd.org/cgi/url.cgi?ports/security/gpgme/pkg-descr>`__,
and
`mail/sylpheed-claws <http://www.freebsd.org/cgi/url.cgi?ports/mail/sylpheed-claws/pkg-descr>`__.
Cuando debe usted tomar este tipo de decisiones se le muestra un mensaje
con las opciones disponibles.

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

4.5.2.1. Sobreescribir directorios por omisi?n de ports
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Algunas veces es ?til (u obligatorio) utilizar un directorio de trabajo
o un ?target? distinto al que tenemos por omisi?n. Las variables de
entorno ``WRKDIRPREFIX`` y ``PREFIX`` pueden sobreescribirse seg?n
nuestra conveniencia. Veamos un ejemplo:

.. code:: screen

    # make WRKDIRPREFIX=/usr/home/ejemplo/ports install

compilar? el port en ``/usr/home/ejemplo/ports`` y lo instalar? en
``/usr/local``.

.. code:: screen

    # make PREFIX=/usr/home/ejemplo/local install

lo compilar? en ``/usr/ports`` y lo instalar? en
``/usr/home/ejemplo/local``.

Y por supuesto,

.. code:: screen

    # make WRKDIRPREFIX=../ports PREFIX=../local install

combinar? ambas; (ocupa demasiado para mostrarlo en una p?gina, pero la
idea general queda clara).

Puede asignar valores a estas variables del mismo modo que a cualquier
otra de su entorno. Consulte la documentaci?n de su shell para m?s
informaci?n.

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

4.5.2.2. Uso de ``imake``
^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Algunos ports que usan ``imake`` (un componente del Sistema X Window) no
funcionan correctamente con ``PREFIX`` e insistir?n en instalarse en
``/usr/X11R6``. Del mismo modo algunos ports de Perl ignoran ``PREFIX``
y se instalan en el ?rbol de Perl. Hacer que estos ports respeten
``PREFIX`` es dif?cil y a veces imposible.

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

4.5.2.3. Reconfigurar ports
^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Al compilar ciertos ports se le presentar? un men? basado en ncurses en
el cual podr? elegir entre m?s o menos opciones de compilaci?n. No es
raro que los usuarios quieran volver a usar ese men? para a?adir, quitar
o cambiar opciones una vez que el port ya est? compilado. Hay bastantes
formas de hacerlo. Una manera es entrar al directorio que contiene el
port y teclear ``make       config``, que har? que se le presente de
nuevo el men? con las opciones que estuvieran seleccionadas previamente.
Otra opci?n es usar la orden ``make showconfig``, que le mostrar? todas
las opciones de configuraci?n del port. Hay otra opci?n m?s,
``make       rmconfig``, que borrar? todas las opciones que estuvieran
seleccionadas y le permitir? por tanto empezar desde cero. Todas estas
opciones y muchas m?s las encontrar? descritas con gran detalle en
`ports(7) <http://www.FreeBSD.org/cgi/man.cgi?query=ports&sektion=7>`__.

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

4.5.3. C?mo desinstalar ports
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Ahora que sabe instalar ports probablemente quiera saber c?mo
eliminarlos; puede que haya instalado alguno y posteriormente se haya
dado cuenta de que ha instalado el port incorrecto. Vamos a desinstalar
el port del ejemplo anterior (que, para todos aquellos que no estaban
atentos, era ``lsof``). Igual que al instalar ports, lo primero que
debemos hacer es ubicarnos en el directorio del port que deseamos
eliminar del sistema, en nuestro caso ``/usr/ports/sysutils/lsof``. Los
ports se desinstalan exactamente igual que los packages; esto se explica
en la `secci?n de packages <packages-using.html>`__) utilizando la orden
`pkg\_delete(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_delete&sektion=1>`__:

.. code:: screen

    # pkg_delete lsof-4.57

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

4.5.4. Actualizaci?n de ports
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Antes de nada necesita ver una lista de ports instalados de los cuales
exista una nueva versi?n en la Colecci?n de Ports. Utilice
`pkg\_version(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_version&sektion=1>`__:

.. code:: screen

    # pkg_version -v

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

4.5.4.1. ``/usr/ports/UPDATING``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Una vez actualizada la Colecci?n de Ports (y *antes* de intentar
actualizar ning?n port) debe consultar ``/usr/ports/UPDATING``. Este
fichero describe todas las novedades, problemas que pueden encontrarse y
pasos que deben seguir los usuarios al actualizar un port; hay cambios
de formato, cambios de ubicaci?n de ficheros de configuraci?n o
incompatibilidades con versiones anteriores.

Si ``UPDATING`` se contradice de cualquier modo con lo que lea aqu?
tenga muy encuenta que lo que aparezca en ``UPDATING`` tiene prioridad
absoluta.

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

4.5.4.2. Actualizaci?n de ports con portupgrade
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

La aplicaci?n portupgrade se dise?? para actualizar f?cilmente los ports
instalados en un sistema. Puede instalarla desde el port
`ports-mgmt/portupgrade <http://www.freebsd.org/cgi/url.cgi?ports/ports-mgmt/portupgrade/pkg-descr>`__.
La instalaci?n es como al de cualquier otro port, use la orden
``make install     clean`` command:

.. code:: screen

    # cd /usr/ports/ports-mgmt/portupgrade
    # make install clean

Compruebe la lista de ports instalados con ``pkgdb     -F`` y arregle
todas las inconsistencias que aparezcan. Le recomendamos que haga esta
comprobaci?n de forma regular y siempre antes de una actualizaci?n.

Si ejecuta ``portupgrade -a`` portupgrade intentar? actualizar todos y
cada uno de los ports instalados en su sistema. Utilice el par?metro
``-i`` si quiere que le pida confirmaci?n antes de actualizar cada uno
de los ports.

.. code:: screen

    # portupgrade -ai

Si solamente quiere actualizar una sola aplicaci?n (y no absolutamente
todos los ports) utilice la orden
``portupgrade     nombre-de-aplicaci?n``. A?ada el modificador ``-R`` si
quiere que portupgrade actualice antes todos los ports de los que
depende la aplicaci?n en cuesti?n.

.. code:: screen

    # portupgrade -R firefox

Si quiere usar packages en lugar de ports use el modificador ``-P``
flag. Con esta opci?n portupgrade busca en los directorios locales que
aparezcan en ``PKG_PATH`` o descarga los packages desde un sitio remoto
si es que no los encuentra en local. Si es imposible encontrar los
packages ni en local ni en remoto?portupgrade utilizar? ports. Si no
quiere usar ports pase lo que pase utilice el modificador ``-PP``.

.. code:: screen

    # portupgrade -PP gnome2

Si quiere solamente descargar los distfiles (o los packages, usando
``-P``) sin compilar ni instalar nada, use ``-F``. Para m?s informaci?n
consulte
`portupgrade(1) <http://www.FreeBSD.org/cgi/man.cgi?query=portupgrade&sektion=1>`__.

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

4.5.4.3. Actualizaci?n de ports con portmanager
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Portmanager es otra aplicaci?n pensada para la actualizaci?n sencilla de
ports instalados en el sistema. Puede encontrarla en
`ports-mgmt/portmanager <http://www.freebsd.org/cgi/url.cgi?ports/ports-mgmt/portmanager/pkg-descr>`__:

.. code:: screen

    # cd /usr/ports/ports-mgmt/portmanager
    # make install clean

Puede actualizar todos los ports que tenga instalados con una sola
orden:

.. code:: screen

    # portmanager -u

Si usa el modificador ``-ui`` se le pedir? confirmaci?n a cada paso que
Portmanager vaya a dar. Portmanager tambi?n puede usarse para instalar
nuevos ports. A diferencia del habitual ``make install clean``
actualizar? todos los ports que dependan antes de compilar e instalar
ese port que queramos instalar.

.. code:: screen

    # portmanager x11/gnome2

Si aparecen problemas con las dependencias del port que quiere instalar
puede usar Portmanager para recompilar todos ello en el orden correcto.
Una vez que acabe el port que estaba dando problemas ser? tambi?n
recompilado.

.. code:: screen

    # portmanager graphics/gimp -f

Para m?s informaci?n consulte
`portmanager(1) <http://www.FreeBSD.org/cgi/man.cgi?query=portmanager&sektion=1>`__.

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

4.5.4.4. Actualizaci?n de ports con portmaster
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Portmaster es otra aplicaci?n para actualizar ports. Portmaster se
dise?? para que utilizara las herramientas del sistema ?base? (es decir,
no depende de otros ports) y utiliza la informaci?n que se almacena en
el directorio ``/var/db/pkg/`` para determinar qu? port es el que hay
que actualizar. Puede encontrarlo en
`ports-mgmt/portmaster <http://www.freebsd.org/cgi/url.cgi?ports/ports-mgmt/portmaster/pkg-descr>`__:

.. code:: screen

    # cd /usr/ports/ports-mgmt/portmaster
    # make install clean

Portmaster agrupa los ports en cuatro categor?as:

.. raw:: html

   <div class="itemizedlist">

-  ?Root ports? (no tienen dependencias, ning?n port depende de ellos)

-  ?Trunk ports? (no tienen dependencias, otros ports dependen de ellos)

-  ?Branch ports? (tienen dependencias, otros ports dependen de ellos)

-  ?Leaf ports? (tienen dependencias, ning?n port depende de ellos)

.. raw:: html

   </div>

Puede ver una lista de los ports instalados y buscar actualizaciones
para ellos usando el modificador ``-L`` :

.. code:: screen

    # portmaster -L
    ===>>> Root ports (No dependencies, not depended on)
    ===>>> ispell-3.2.06_18
    ===>>> screen-4.0.3
            ===>>> New version available: screen-4.0.3_1
    ===>>> tcpflow-0.21_1
    ===>>> 7 root ports
    ...
    ===>>> Branch ports (Have dependencies, are depended on)
    ===>>> apache-2.2.3
            ===>>> New version available: apache-2.2.8
    ...
    ===>>> Leaf ports (Have dependencies, not depended on)
    ===>>> automake-1.9.6_2
    ===>>> bash-3.1.17
            ===>>> New version available: bash-3.2.33
    ...
    ===>>> 32 leaf ports

    ===>>> 137 total installed ports
            ===>>> 83 have new versions available

Con la siguiente orden puede actualizar todos los ports del sistema:

.. code:: screen

    # portmaster -a

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Por omisi?n Portmaster guardar? una copia de seguridad (un package) de
cada port antes de borrarlo. Si la instalaci?n de la nueva versi?n
funciona Portmaster borrar? el package. Si utiliza ``-b`` le dir? a
Portmaster que no borre autom?ticamente el package. Si usa el
modificador ``-i`` arrancar? Portmaster en modo interactivo, lo que
significa que le pedir? confirmaci?n antes de actualizar cada port.

.. raw:: html

   </div>

Si se encuentra con errores durante el proceso de actualizaci?n puede
utilizar el modificador ``-f`` para actualizar o recompilar todos los
ports:

.. code:: screen

    # portmaster -af

Tambi?n puede usar Portmaster para instalar nuevos ports en el sistema,
actualizando todas sus dependencias antes de compilar e instalar el
nuevo port:

.. code:: screen

    # portmaster shells/bash

Por favor, consulte
`portmaster(8) <http://www.FreeBSD.org/cgi/man.cgi?query=portmaster&sektion=8>`__
para m?s informaci?n.

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

4.5.5. Los ports y el espacio en disco
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Usar la Colecci?n de Ports consume mucho espacio de disco seg?n pasa el
tiempo. Por culpa de la tendencia del ?rbol de ports a crecer sin parar
le recomendamos que despu?s de compilar e instalar sofware desde los
ports recuerde limpiar los directorios temporales ``work`` mediante la
orden ``make clean``. Puede limpiar de un plumazo los directorios
temporales de toda la Colecci?n de Ports con la siguiente orden:

.. code:: screen

    # portsclean -C

R?pidamente acumular? gran cantidad de viejas distribuciones de c?digo
en ``distfiles``. Puede borrarlos a mano, pero tambi?n puede usar la
siguiente orden para borrar todos los distfiles que no tengan relaci?n
con ning?n port:

.. code:: screen

    # portsclean -D

Tambi?n puede borrar todos los distfiles sin relaci?n con ning?n port
instalado en el sistema:

.. code:: screen

    # portsclean -DD

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

``portsclean`` forma parte de la ?suite? portupgrade.

.. raw:: html

   </div>

No olvide borrar los ports instalados una vez que deja de necesitarlos.
Hay una herramienta muy ?til para ayudar a automatizar esta tarea:
`ports-mgmt/pkg\_cutleaves <http://www.freebsd.org/cgi/url.cgi?ports/ports-mgmt/pkg_cutleaves/pkg-descr>`__.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------+---------------------------+-------------------------------------------+
| `Anterior <packages-using.html>`__?   | `Subir <ports.html>`__    | ?\ `Siguiente <ports-nextsteps.html>`__   |
+---------------------------------------+---------------------------+-------------------------------------------+
| 4.4. Uso del sistema de packages?     | `Inicio <index.html>`__   | ?4.6. Despu?s de instalar un port         |
+---------------------------------------+---------------------------+-------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
