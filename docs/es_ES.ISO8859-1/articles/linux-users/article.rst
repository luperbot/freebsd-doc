=======================================
Gu?a de FreeBSD para usuarios de Linux?
=======================================

.. raw:: html

   <div class="article" lang="es" lang="es">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="authorgroup" xmlns="http://www.w3.org/1999/xhtml">

.. raw:: html

   <div class="author">

John Ferrell
~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div>

Revisi?n: ` <https://svnweb.freebsd.org/changeset/doc/>`__

.. raw:: html

   </div>

.. raw:: html

   <div>

Copyright ? 2008 El Proyecto de Documentaci?n de FreeBSD

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="legalnotice" xmlns="http://www.w3.org/1999/xhtml">

FreeBSD is a registered trademark of the FreeBSD Foundation.

Linux is a registered trademark of Linus Torvalds.

Intel, Celeron, EtherExpress, i386, i486, Itanium, Pentium, and Xeon are
trademarks or registered trademarks of Intel Corporation or its
subsidiaries in the United States and other countries.

Red Hat, RPM, are trademarks or registered trademarks of Red Hat, Inc.
in the United States and other countries.

UNIX is a registered trademarks of The Open Group in the United States
and other countries.

Many of the designations used by manufacturers and sellers to
distinguish their products are claimed as trademarks. Where those
designations appear in this document, and the FreeBSD Project was aware
of the trademark claim, the designations have been followed by the “™”
or the “?” symbol.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div>

por .

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="abstract" xmlns="http://www.w3.org/1999/xhtml">

.. raw:: html

   <div class="abstract-title">

Resumen

.. raw:: html

   </div>

El objetivo de este documento es familiarizar de forma r?pida a usuarios
de nivel intermedio o avanzado de Linux? sobre los conceptos b?sicos de
FreeBSD.

*Traducci?n de G?bor K?vesd?n ``<gabor@FreeBSD.org>``.*

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Tabla de contenidos

.. raw:: html

   </div>

`1. Introducci?n <#intro>`__
`2. Shells: ?No est? Bash? <#shells>`__
`3. Packages y Ports: Instalaci?n de software en FreeBSD <#software>`__
`4. Arranque del sistema: ?D?nde est?n los niveles de
ejecuci?n? <#startup>`__
`5. Configuraci?n de la red <#network>`__
`6. Cortafuegos <#firewall>`__
`7. Actualizaci?n de FreeBSD <#updates>`__
`8. procfs: perdido pero no olvidado <#procfs>`__
`9. Comandos m?s comunes <#commands>`__
`10. Conclusi?n <#conclusion>`__

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

1. Introducci?n
---------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

En este documento se muestran las diferencias entre FreeBSD y Linux?
para que usuarios de nivel intermedio o avanzado de Linux? puedan
aprender r?pidamente los fundamentos de FreeBSD. Es solamente una breve
presentaci?n t?cnica, no intenta explicar las diferencias de las
“filosof?as” que hay detr?s de ambos sistemas operativos.

Este documento presupone que usted ya tiene FreeBSD instalado. Si no lo
ha instalado o necesita ayuda con el proceso de la instalaci?n consulte
el cap?tulo en el que se explica la `instalaci?n de
FreeBSD <../../../../doc/es_ES.ISO8859-1/books/handbook/install.html>`__
del Handbook.

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

2. Shells: ?No est? Bash?
-------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Quienes vienen de Linux? se suelen sorprender de que Bash no sea la
shell por omisi?n, que en FreeBSD es
`tcsh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tcsh&sektion=1>`__.
De hecho Bash ni siquiera forma parte de la instalaci?n m?nima de
FreeBSD. A pesar de esto tanto Bash como cualquiera de sus shell
favoritas est?n en la `Colecci?n de Packages y
Ports <article.html#SOFTWARE>`__ de FreeBSD.

Si instala otras shell puede usar
`chsh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=chsh&sektion=1>`__
como shell por omisi?n para sus usuarios, pero le recomendamos
encarecidamente que no cambie la shell por omisi?n del usuario ``root``.
La raz?n es que las shell que no forman parte de la instalaci?n base
generalmente se instalan en ``/usr/local/bin`` o en ``/usr/bin``. En
caso de problemas es posible que los sistemas de ficheros donde est?n
``/usr/local/bin`` y ``/usr/bin`` no puedan montarse. En un caso as?
``root`` no podr?a acceder a su shell por omisi?n, con lo que no podr?a
iniciar su sesi?n. Para evitar este tipo de problemas se cre? una
segunda cuenta de usuario ``root``, el usuario ``toor``. Consulte la
secci?n de seguridad de las FAQ si quiere saber m?s sobre `la cuenta
toor <../../../../doc/en_US.ISO8859-1/books/faq/security.html#TOOR-ACCOUNT>`__.

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

3. Packages y Ports: Instalaci?n de software en FreeBSD
-------------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Aparte del m?todo tradicional de instalar software en UNIX? (descargar
fuentes, descomprimir, editar el fuente y compilar), FreeBSD ofrece dos
alternativas para instalar programas: packages y dos alternativas para
instalar programas: package y ports. Una lista y ports. Hay una lista
completa de los ports disponibles
`aqu? <http://www.freebsd.org/ports/master-index.html>`__.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.1. Packages
~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Los “packages” son programas precompilados, equivalentes en FreeBSD a
los ficheros ``.deb`` en sistemas Debian/Ubuntu y ``.rpm`` en sistemas
Red?Hat/Fedora. Los packages se instalan usando
`pkg\_add(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_add&sektion=1>`__.
Por ejemplo, puede instalar Apache 2.2 del siguiente modo:

.. code:: screen

    # pkg_add /tmp/apache-2.2.6_2.tbz

Al usar la opci?n ``-r``,
`pkg\_add(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_add&sektion=1>`__
autom?ticamente descargar? el package indicado y lo instalar?, as? como
todos aquellos que necesite para su funcionamiento. Esto son las
``dependencias``.

.. code:: screen

    # pkg_add -r apache22
    Fetching ftp://ftp.freebsd.org/pub/FreeBSD/ports/i386/packages-6.2-release/Latest/apache22.tbz... Done.
    Fetching ftp://ftp.freebsd.org/pub/FreeBSD/ports/i386/packages-6.2-release/All/expat-2.0.0_1.tbz... Done.
    Fetching ftp://ftp.freebsd.org/pub/FreeBSD/ports/i386/packages-6.2-release/All/perl-5.8.8_1.tbz... Done.
    [snip]

    To run apache www server from startup, add apache22_enable="YES"
    in your /etc/rc.conf. Extra options can be found in startup script.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Si usa una versi?n release de FreeBSD (6.2, 6.3, 7.0, etc., lo que
seguramente es una instalaci?n desde CD-ROM) ``pkg_add -r`` descargar?
packages compilados para esa release espec?fica. Estos packages *pueden
ser* versiones desactualizadas del programa. Puede usar la variable
``PACKAGESITE`` para ignorar este comportamiento, que es el que se
espera por omisi?n del programa. Por ejemplo, asigne a ``PACKAGESITE``
el valor
``ftp://ftp.freebsd.org/pub/FreeBSD/ports/i386/packages-6-stable/Latest/``
si quiere descargar los packages m?s recientes compilados para la
versi?n 6.X.

.. raw:: html

   </div>

Para m?s informaci?n sobre los packages consulte la secci?n 4.4 del
Handbook: `Uso del sistema de
packages <../../../../doc/es_ES.ISO8859-1/books/handbook/packages-using.html>`__.

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

3.2. Ports
~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El segundo m?todo que ofrece FreeBSD para instalar programas es usar la
Colecci?n de Ports. la Colecci?n de Ports es un entorno de ficheros
``Makefile`` y parches adaptados espec?ficamente para poder instalar
desde el c?digo fuente aplicaciones de lo m?s variopinto en sistemas
FreeBSD. Si instala un port el sistema descargar? los fuentes, aplicar?
los parches necesarios, compilar? el c?digo e instalar? el programa (y
har? exactamente los mismo con todas las dependencias).

La Colecci?n de Ports, tambi?n conocida como ?rbol de ports, est? en
``/usr/ports`` si se instal? durante el proceso de instalaci?n de
FreeBSD. Si la Colecci?n de Ports no est? instalada puede hacerlo puede
hacerlo desde los discos de instalaci?n mediante
`sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8>`__
o desde los servidores de FreeBSD gracias a
`csup(1) <http://www.FreeBSD.org/cgi/man.cgi?query=csup&sektion=1>`__ o
`portsnap(8) <http://www.FreeBSD.org/cgi/man.cgi?query=portsnap&sektion=8>`__.
Tiene instrucciones detalladas para instalar la Colecci?n de Ports en la
`secci?n
4.5.1 <../../../../doc/en_US.ISO8859-1/books/handbook/ports-using.html>`__
del Handbook.

Instalar un port es (generalmente) tan simple como entrar en el
directorio del port y ejecutar el proceso de compilaci?n. El ejemplo que
se muestra a continuaci?n instala Apache 2.2 desde la Colecci?n de
Ports:

.. code:: screen

    # cd /usr/ports/www/apache22
    # make install clean

Una de las principales ventajas del uso de ports para instalar software
es la posibilidad de ajustar las opciones de la instalaci?n. Por
ejemplo, es posible activar mod\_ldap dentro de su Apache 2.2 durante la
instalaci?n mediante el uso de la variable ``WITH_LDAP`` de
`make(1) <http://www.FreeBSD.org/cgi/man.cgi?query=make&sektion=1>`__:

.. code:: screen

    # cd /usr/ports/www/apache22
    # make WITH_LDAP="YES" install clean

Para m?s informaci?n sobre la Colecci?n de Ports consulte la secci?n del
Handbook dedicada a `la Colecci?n de
Ports <../../../../doc/es_ES.ISO8859-1/books/handbook/ports-using.html>`__.

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

3.3. ?Qu? deber?a usar? ?Ports o Packages?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Los packages son simplemente ports precompilados, as? que es cuesti?n de
elegir entre instalar desde los fuentes (ports) o instalar binarios
directamente (packages). Cualquiera de los dos tiene sus propias
ventajas:

.. raw:: html

   <div class="itemizedlist">

.. raw:: html

   <div class="itemizedlist-title">

Package (binario)

.. raw:: html

   </div>

-  Instalaci?n m?s r?pida (compilar programas grandes puede llevar su
   tiempo).
-  No hay que comprender el proceso de compilar software.
-  No es necesario instalar compiladores en su sistema.

.. raw:: html

   </div>

.. raw:: html

   <div class="itemizedlist">

.. raw:: html

   <div class="itemizedlist-title">

Ports (fuente)

.. raw:: html

   </div>

-  Es posible ajustar las opciones de la instalaci?n. (Los packages se
   generan normalmente con las opciones est?ndar. Con los ports puede
   ajustar diversas opciones, como disponer de m?dulos adicionales o
   cambiar la ruta por omisi?n.)
-  Puede usar sus propios parches si tiende hacerlo.

.. raw:: html

   </div>

Si no tiene requisitos especiales los packages probablemente cubran sus
necesidades sin problema. Si alguna vez necesita algo m?s ajustado puede
recurrir a los ports. Tenga en cuenta que si necesita un programa a su
medida pero sigue prefiriendo usar packages puede hacerse uno su gusto
mediante ``make`` ``patch`` y luego copie el package a otras m?quinas.

.. raw:: html

   </div>

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

   <div class="sect1">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5. Configuraci?n de la red
--------------------------

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

5.1. Interfaces de red
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Los nombres de interfaces de red representan en FreeBSD el nombre del
controlador seguido por un n?mero, en lugar del esquema que usa Linux?,
el gen?rico. *ethX*. La salida de
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8>`__
que se muestra a continuaci?n presenta dos interfaces del tipo
Intel??Pro?1000 (em0 y em1):

.. code:: screen

    % ifconfig
    em0: flags=8843<UP,BROADCAST,RUNNING,SIMPLEX,MULTICAST> mtu 1500
            options=b<RXCSUM,TXCSUM,VLAN_MTU>
            inet 10.10.10.100 netmask 0xffffff00 broadcast 10.10.10.255
            ether 00:50:56:a7:70:b2
            media: Ethernet autoselect (1000baseTX <full-duplex>)
            status: active
    em1: flags=8843<UP,BROADCAST,RUNNING,SIMPLEX,MULTICAST> mtu 1500
            options=b<RXCSUM,TXCSUM,VLAN_MTU>
            inet 192.168.10.222 netmask 0xffffff00 broadcast 192.168.10.255
            ether 00:50:56:a7:03:2b
            media: Ethernet autoselect (1000baseTX <full-duplex>)
            status: active

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

5.2. Configuraci?n de IP
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Con
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8>`__
puede asignar una direcci?n IP a una interfaz de red. No obstante, si
quiere que la IP siga asignada a la interfaz despu?s de reiniciar tendr?
que incluirla en ``/etc/rc.conf``. En el ejemplo siguiente se especifica
el nombre de la m?quina, la la direcci?n IP y la puerta de enlace por
omisi?n:

.. code:: programlisting

    hostname="servidor1.ejemplo.com"
    ifconfig_em0="inet 10.10.10.100  netmask 255.255.255.0"
    defaultrouter="10.10.10.1"

Con la siguiente configuraci?n la interfaz indicada intentar? obtener
una direcci?n IP mediante DHCP:

.. code:: programlisting

    hostname="servidor1.ejemplo.com"
    ifconfig_em0="DHCP"

.. raw:: html

   </div>

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

6. Cortafuegos
--------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Igual que Linux? dispone de IPTABLES, FreeBSD tambi?n disponde de
cortafuegos integrado en el kernel, solo que FreeBSD en lugar de uno
dispone de tres:

.. raw:: html

   <div class="itemizedlist">

-  `IPFIREWALL <../../../../doc/en_US.ISO8859-1/books/handbook/firewalls-ipfw.html>`__
-  `IPFILTER <../../../../doc/en_US.ISO8859-1/books/handbook/firewalls-ipf.html>`__
-  `PF <../../../../doc/en_US.ISO8859-1/books/handbook/firewalls-pf.html>`__

.. raw:: html

   </div>

IPFIREWALL o IPFW (el programa para manejar las reglas de IPFW es
`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8>`__)
es el cortafuegos que desarrollan y mantienen los desarrolladores de
FreeBSD. IPFW se puede combinar con
`dummynet(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dummynet&sektion=4>`__
para conseguir servicios de “traffic shaping” y simular diferentes tipos
de conexiones.

Veamos un ejemplo de regla que permite la entrada de tr?fico SSH:

.. code:: programlisting

    ipfw add allow tcp from any to me 22 in via $ext_if

IPFILTER es el cortafuegos que desarrolla Darren?Reed. No es espec?fico
de FreeBSD y se ha portado ya a diversos sistemas operativos como
NetBSD, OpenBSD, SunOS, HP/UX y Solaris.

El siguiente ejemplo permite la entrada de tr?fico SSH:

.. code:: programlisting

    pass in on $ext_if proto tcp from any to any port = 22

El ?ltimo cortafuegos, PF, ha sido desarrollado por el proyecto OpenBSD.
PF fue creado como sustituto de IPFILTER, de ah? que la sintaxis de PF
sea muy similar a la de IPFILTER. PF se puede combinar con
`altq(4) <http://www.FreeBSD.org/cgi/man.cgi?query=altq&sektion=4>`__
para disponer de QoS.

En el siguiente ejemplo vemos una regla que permite la entrada de
tr?fico SSH:

.. code:: programlisting

    pass in on $ext_if inet proto tcp from any to ($ext_if) port 22

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

7. Actualizaci?n de FreeBSD
---------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Hay tres m?todos para actualizar FreeBSD: desde los fuentes, mediante
actualizaciones binarias y con los discos de instalaci?n.

Actualizar desde c?digo fuente es el m?todo m?s complejo pero el que
ofrece la mayor flexibilidad. Este proceso implica sincronizar su copia
en local del c?digo fuente de FreeBSD desde los servidores CVS
(Concurrent Versioning System). Una vez actualizado el c?digo puede
compilar nuevas versiones de kernel y utilidades. Si quiere m?s
informaci?n consulte el `cap?tulo
23 <../../../../doc/en_US.ISO8859-1/books/handbook/cutting-edge.html>`__
del Handbook.

Las actualizaciones binarias son semejantes a ``yum`` o ``apt-get`` de
Linux?. El programa
`freebsd-update(8) <http://www.FreeBSD.org/cgi/man.cgi?query=freebsd-update&sektion=8>`__
descargar? las actualizaciones pendientes del sistema y las instalar?.
Las actualizaciones pueden ser programadas con
`cron(8) <http://www.FreeBSD.org/cgi/man.cgi?query=cron&sektion=8>`__.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Si usa
`cron(8) <http://www.FreeBSD.org/cgi/man.cgi?query=cron&sektion=8>`__
para programar las actualizaciones por favor, aseg?rese de poner
``freebsd-update cron`` en su
`crontab(1) <http://www.FreeBSD.org/cgi/man.cgi?query=crontab&sektion=1>`__
para reducir la posibilidad de que una gran cantidad de servidores
descarge actualizaciones al mismo tiempo.

.. code:: programlisting

    0 3 * * * root /usr/sbin/freebsd-update cron

.. raw:: html

   </div>

El ?ltimo m?todo de actualizaci?n es desde los discos de instalaci?n. Es
un proceso bastante claro. Encienda el sistema desde el disco y
seleccione la opci?n de actualizar.

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

8. procfs: perdido pero no olvidado
-----------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Es posible que usando Linux? haya consultado
``/proc/sys/net/ipv4/ip_forward`` para determinar si “IP forwarding”
estaba activado. En FreeBSD tendr? que usar
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
para comprobar ?ste y otros par?metros puesto que
`procfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=procfs&sektion=5>`__
est? obsoleto en las versiones m?s recientes de FreeBSD. Tenga en cuenta
que ``sysctl`` tambi?n existe en Linux?.

Siguiendo con el ejemplo de “IP forwarding” podr?a usar lo siguiente
para determinar si tiene activado “IP forwarding” en su sistema FreeBSD:

.. code:: screen

    % sysctl net.inet.ip.forwarding
    net.inet.ip.forwarding: 0

La opci?n ``-a`` se usa para ver la configuraci?n del sistema:

.. code:: screen

    % sysctl -a
    kern.ostype: FreeBSD
    kern.osrelease: 6.2-RELEASE-p9
    kern.osrevision: 199506
    kern.version: FreeBSD 6.2-RELEASE-p9 #0: Thu Nov 29 04:07:33 UTC 2007
        root@i386-builder.daemonology.net:/usr/obj/usr/src/sys/GENERIC

    kern.maxvnodes: 17517
    kern.maxproc: 1988
    kern.maxfiles: 3976
    kern.argmax: 262144
    kern.securelevel: -1
    kern.hostname: server1
    kern.hostid: 0
    kern.clockrate: { hz = 1000, tick = 1000, profhz = 666, stathz = 133 }
    kern.posix1version: 200112
    ...

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Algunos de estos valores de ``sysctl`` son de s?lo lectura.

.. raw:: html

   </div>

Hay ocasiones en las que es disponer de procfs es imprescindible, por
ejemplo para ejecutar software antiguo, usar
`truss(1) <http://www.FreeBSD.org/cgi/man.cgi?query=truss&sektion=1>`__
para seguir llamadas al sistema y para la `compatibilidad binaria con
Linux? <../../../../doc/en_US.ISO8859-1/books/handbook/linuxemu.html>`__.
(aunque la compatibilidad binaria con Linux? use su propio procfs,
`linprocfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=linprocfs&sektion=5>`__.)
Si necesita montar procfs a?ada las siguientes l?neas a ``/etc/fstab``:

.. code:: screen

    proc                /proc           procfs  rw,noauto       0       0

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

La opci?n ``noauto`` evitar? que ``/proc`` sea montado autom?ticamente
cuando el sistema arranque.

.. raw:: html

   </div>

Hecho esto monte procfs as?:

.. code:: screen

    # mount /proc

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

9. Comandos m?s comunes
-----------------------

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

9.1. Gesti?n de packages
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+-------------------------------------------------------------+----------------------------+--------------------------------------------------+
| Linux? command (Red?Hat/Debian)                             | FreeBSD equivalente        | Resultado                                        |
+=============================================================+============================+==================================================+
| ``yum install <package>`` / ``apt-get install <package>``   | ``pkg_add -r <package>``   | Instalar <package> desde un repositorio remoto   |
+-------------------------------------------------------------+----------------------------+--------------------------------------------------+
| ``rpm -ivh <package>`` / ``dpkg -i <package>``              | ``pkg_add -v <package>``   | Instalar package                                 |
+-------------------------------------------------------------+----------------------------+--------------------------------------------------+
| ``rpm -qa`` / ``dpkg -l``                                   | ``pkg_info``               | Ver packages instalados                          |
+-------------------------------------------------------------+----------------------------+--------------------------------------------------+

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

9.2. Gesti?n del sistema
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+------------------+-------------------------------+-------------------------------------+
| Linux? command   | FreeBSD equivalente           | Resultado                           |
+==================+===============================+=====================================+
| ``lspci``        | ``pciconf``                   | Ver dispositivos PCI                |
+------------------+-------------------------------+-------------------------------------+
| ``lsmod``        | ``kldstat``                   | Ver m?dulos cargados en el kernel   |
+------------------+-------------------------------+-------------------------------------+
| ``modprobe``     | ``kldload`` / ``kldunload``   | Cargar/Borrar m?dulos del kernel    |
+------------------+-------------------------------+-------------------------------------+
| ``strace``       | ``truss``                     | Seguir llamadas del sistema         |
+------------------+-------------------------------+-------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

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

10. Conclusi?n
--------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Esperamos que este documento le haya servido de suficiente ayuda para
empezar a usar FreeBSD. Recuerde visitar el
`FreeBSD?Handbook <../../../../doc/en_US.ISO8859-1/books/handbook/index.html>`__,
donde encontrar? lo tratado aqu? expuesto en profundidad y muchos otros
temas que no se han tocado en este documento.

.. raw:: html

   </div>

.. raw:: html

   </div>
