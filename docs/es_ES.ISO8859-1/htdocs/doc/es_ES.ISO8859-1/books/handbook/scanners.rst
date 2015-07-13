==========================
7.6. Esc?neres de im?genes
==========================

.. raw:: html

   <div class="navheader">

7.6. Esc?neres de im?genes
`Anterior <tvcard.html>`__?
Cap?tulo 7. Multimedia
?\ `Siguiente <kernelconfig.html>`__

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

7.6. Esc?neres de im?genes
--------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Escrito por Marc Fonvieille.

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

7.6.1. Introducci?n
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El acceso a esc?neres de im?genes en FreeBSD funciona gracias a la API
SANE (siglas de ?Scanner Access Now Easy?, ?el acceso a esc?neres ahora
es f?cil?), disponible en la Colecci?n de Ports de FreeBSD. SANE utiliza
tambi?n ciertos controladores de FreeBSD para acceder al hardware del
esc?ner.

FreeBSD puede utilizar tanto esc?neres SCSI como USB. Aseg?rese de que
el suyo funciona con SANE antes de intentar ning?n tipo de
configuraci?n. SANE tiene una lista de `dispositivos
soportados <http://www.sane-project.org/sane-supported-devices.html>`__
donde encontrar? informaci?n actualizada sobre hasta d?nde funciona el
esc?ner y su estatus. La p?gina de manual de
`uscanner(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uscanner&sektion=4>`__
incluye una listas de esc?neres USB que funcionan con SANE.

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

7.6.2. Configuraci?n del kernel
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Como ya se ha dicho tanto los interfaces USB como las SCSI funcionan.
Seg?n sea el interfaz de su esc?ner necesitar? un tipo diferente de
controlador:

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

7.6.2.1. Interfaz USB
^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El kernel ``GENERIC`` incluye por omisi?n los controladores de
dispositivo necesarios para poder usar esc?neres USB. Si va a
personalizar su kernel aseg?rese de que esto est? en el fichero de
configuraci?n del mismo:

.. code:: programlisting

    device usb
    device uhci
    device ohci
    device uscanner

Seg?n cual sea el chipset de su placa base tendr? que usar
``device uhci`` o ``device ohci``, aunque si tiene ambos no tendr?
problemas por eso.

Si por cualquier motivo no quiere recompilar su kernel y su kernel no es
el ``GENERIC`` puede cargar el m?dulo controlador de dispositivo
`uscanner(4) <http://www.FreeBSD.org/cgi/man.cgi?query=uscanner&sektion=4>`__
con
`kldload(8) <http://www.FreeBSD.org/cgi/man.cgi?query=kldload&sektion=8>`__:

.. code:: screen

    # kldload uscanner

Si quiere cargar este m?dulo cada vez que arranque el sistema debe
a?adir la siguiente l?nea a ``/boot/loader.conf``:

.. code:: programlisting

    uscanner_load="YES"

Tras reiniciar con el kernel correcto (o una vez que el m?dulo est?
cargado) conecte su esc?ner USB. Debe aparecer en el ?buffer? de
mensajes del sistema
(`dmesg(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dmesg&sektion=8>`__)
un mensaje una l?nea como la siguiente:

.. code:: screen

    uscanner0: EPSON EPSON Scanner, rev 1.10/3.02, addr 2

La l?nea del ejemplo muestra que nuestro esc?ner est? utilizando el nodo
de dispositivo\ ``/dev/uscanner0``.

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

7.6.2.2. Interfaz SCSI
^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Si su esc?ner tiene un interfaz SCSI es importante saber qu?
controladora SCSI incorpora. El chipset SCSI que tenga influir? en la
configuraci?n del kernel que tenga que personalizar. El kernel
``GENERIC`` tiene controladores de dispositivo para las controladoras
SCSI m?s comunes. Consulte el fichero ``NOTES`` y a?ada la l?nea
correcta al fichero de configuraci?n de su kernel. Tendr? que a?adir
tambi?n la siguiente l?nea:

.. code:: programlisting

    device scbus
    device pass

Una vez compilado e instalado el kernel correctamente tiene ya que ver
sus nuevos dispositivos en el ?buffer? de mensajes del sistema:

.. code:: screen

    pass2 at aic0 bus 0 target 2 lun 0
    pass2: <AGFA SNAPSCAN 600 1.10> Fixed Scanner SCSI-2 device
    pass2: 3.300MB/s transfers

Si su esc?ner estaba apagado durante el arranque puede forzar
manualmente la detecci?n si ejecuta una b?squeda de buses SCSI con
`camcontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=camcontrol&sektion=8>`__:

.. code:: screen

    # camcontrol rescan all
    Re-scan of bus 0 was successful
    Re-scan of bus 1 was successful
    Re-scan of bus 2 was successful
    Re-scan of bus 3 was successful

El esc?ner aparecer? en la lista de dispositivos SCSI:

.. code:: screen

    # camcontrol devlist
    <IBM DDRS-34560 S97B>              at scbus0 target 5 lun 0 (pass0,da0)
    <IBM DDRS-34560 S97B>              at scbus0 target 6 lun 0 (pass1,da1)
    <AGFA SNAPSCAN 600 1.10>           at scbus1 target 2 lun 0 (pass3)
    <PHILIPS CDD3610 CD-R/RW 1.00>     at scbus2 target 0 lun 0 (pass2,cd0)

Tiene todos los detalles sobre los dispositivos SCSI en las p?ginas de
manual de
`scsi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=scsi&sektion=4>`__ y
`camcontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=camcontrol&sektion=8>`__.

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

7.6.3. Configuraci?n de SANE
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El sistema SANE se divide en dos partes: los ?backends?
(`graphics/sane-backends <http://www.freebsd.org/cgi/url.cgi?ports/graphics/sane-backends/pkg-descr>`__)
y los ?frontends?
(`graphics/sane-frontends <http://www.freebsd.org/cgi/url.cgi?ports/graphics/sane-frontends/pkg-descr>`__).
Los ?backends? facilitan el acceso al esc?ner propiamente dicho. La
`lista de dispositivos que funcionan
con <http://www.sane-project.org/sane-supported-devices.html>`__ SANE le
dir? qu? ?backend? har? funcionar su esc?ner de im?genes. No hay m?s
remedio que identificar correctamente el ?backend? de su esc?ner para
poder usarlo. Los ?frontends? ofrecen una interfaz gr?fica para escanear
(xscanimage).

Lo primero que hay que hacer es instalar el port o package de
`graphics/sane-backends <http://www.freebsd.org/cgi/url.cgi?ports/graphics/sane-backends/pkg-descr>`__.
Despu?s ejecute la orden ``sane-find-scanner`` para comprobar el
funcionamiento de la detecci?n de esc?neres del sistema SANE:

.. code:: screen

    # sane-find-scanner -q
    found SCSI scanner "AGFA SNAPSCAN 600 1.10" at /dev/pass3

En la salida de la orden anterior se le mostrar? el tipo de interfaz del
esc?ner y el nodo de dispositivo a trav?s del cual el sistema accede a
?l. Es posible que no aparezcan la marca y el modelo, pero eso no tiene
importancia.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Algunos esc?neres USB necesitan que les instale un ?firmware?; esto se
explica en la p?gina de manual del ?backend? correspondiente. Tambi?n
debe leer las p?ginas de manual
`sane-find-scanner(1) <http://www.FreeBSD.org/cgi/man.cgi?query=sane-find-scanner&sektion=1>`__
y `sane(7) <http://www.FreeBSD.org/cgi/man.cgi?query=sane&sektion=7>`__.

.. raw:: html

   </div>

Ahora hay que comprobar que el ?frontend? de escaneo puede identificar
el esc?ner. Por omisi?n los ?backends? de SANE incorporan una
herramienta de l?nea de ?rdenes llamada
`scanimage(1) <http://www.FreeBSD.org/cgi/man.cgi?query=scanimage&sektion=1>`__,
que le mostrar? una lista de dispositivos e incluso una captura de
imagen desde la shell. La opci?n ``-L`` muestra una lista de esc?ners:

.. code:: screen

    # scanimage -L
    device `snapscan:/dev/pass3' is a AGFA SNAPSCAN 600 flatbed scanner

Si el software no lanza ning?n mensaje, o si el mensaje indica que no se
han encontrado esc?neres significa que
`scanimage(1) <http://www.FreeBSD.org/cgi/man.cgi?query=scanimage&sektion=1>`__
no puede identificar su esc?ner. Si este es el caso tendr? que editar el
fichero de configuraci?n del ?backend?y definir en ?l el esc?ner que
quiera utilizar. Encontrar? todos los ficheros de configuraci?n de los
?backends? en el directorio ``/usr/local/etc/sane.d/``. Este problema
con la identificaci?n del hardware es relativamente frecuente con
ciertos modelos de esc?neres USB.

Por ejemplo, con el esc?ner que hemos usado en la `Secci?n?7.6.2.1,
“Interfaz USB” <scanners.html#scanners-kernel-usb>`__ la orden
``sane-find-scanner`` nos da la siguiente informaci?n:

.. code:: screen

    # sane-find-scanner -q
    found USB scanner (UNKNOWN vendor and product) at device /dev/uscanner0

El esc?ner ha sido detectado sin problemas, utiliza el interfaz USB y
est? conectado al nodo de dispositivo ``/dev/uscanner0`` . Ahora
comprobaremos que podemos identificar correctamente el esc?ner:

.. code:: screen

    # scanimage -L

    No scanners were identified. If you were expecting something different,
    check that the scanner is plugged in, turned on and detected by the
    sane-find-scanner tool (if appropriate). Please read the documentation
    which came with this software (README, FAQ, manpages).

No hemos podido identificar el esc?ner, as? que hemos de editar el
fichero ``/usr/local/etc/sane.d/epson.conf``. Estamos usando el modelo
de esc?ner EPSON Perfection? 1650, as? que ya sabemos que el esc?ner
utilizar? el ?backend? ``epson``. Lea atentamente los comentarios que
hay en los ficheros de configuraci?n de los ?backends?. Lo que hay que
hacer es muy sencillo: basta con comentar las l?neas en las que aparecen
interfaces que no sean el perfecto para su esc?ner. En nuestro caso
comentaremos todas las l?neas que comiencen por ``scsi`` puesto que
nuestro esc?ner tiene interfaz USB. Despu?s de esto hay que a?adir una
l?na al final del fichero declarando el interfaz y el nodo de
dispositivo que se van a usar. En el caso del ejemplo esto es lo que
a?adimos:

.. code:: programlisting

    usb /dev/uscanner0

Por favor, lea los comentarios que encontrar? en el fichero de
configuraci?n del ?backend? y la p?ngina de manual de del ?backend? si
necesita m?s informaci?n sobre la sintaxis que debe usar. Hecho esto
podemos verificar si ya podemos identificar el esc?ner:

.. code:: screen

    # scanimage -L
    device `epson:/dev/uscanner0' is a Epson GT-8200 flatbed scanner

Hemos identificado nuestro esc?ner USB. Ni tiene importancia si la marca
y modelo que hemos visto no coinciden con nuestro esc?ner. Lo ?nico
realmente importante es el campo ```epson:/dev/uscanner0'``, que nos da
el nombre correcto del ?backend? y el nodo de dispositivo correcto.

Una vez que ``scanimage -L`` llega a ver al esc?ner hemos terminado con
la configuraci?n. El dispositivo est? listo para escanear im?ngenes.

`scanimage(1) <http://www.FreeBSD.org/cgi/man.cgi?query=scanimage&sektion=1>`__
permite ejecutar una captura de im?gen desde la l?nea de ?rdenes, pero
siempre es mejor utilizar un interfaz gr?fico de usuario para estas
tareas. SANE ofrece un interfaz gr?fico simple pero eficiente:
xscanimage
(`graphics/sane-frontends <http://www.freebsd.org/cgi/url.cgi?ports/graphics/sane-frontends/pkg-descr>`__).

Otro ?frontend? gr?fico para escanear que se ha hecho muy popular es
Xsane
(`graphics/xsane <http://www.freebsd.org/cgi/url.cgi?ports/graphics/xsane/pkg-descr>`__).
Este ?frontend? tiene caracter?sticas muy avanzadas como varios modos de
escaneo (fotocopia, fax, etc.), correcci?n de color, escaneo de im?genes
por lotes, etc. Ambas aplicaciones pueden utilizarse adem?s como
?plugins? de GIMP.

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

7.6.4. Dar acceso al esc?ner a otros usuarios
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Todo lo que se ha mostrado en esta secci?n se ha ejecutado con
privilegios de ``root``. Lo normal es que haya otros usuarios que tengan
que tener acceso al esc?ner. Un usuario que quiera usar el esc?ner tiene
que tener acceso de lectura y escritura al nodo de dispositivo que usa
el esc?ner. Por ejemplo, nuestro esc?ner USB utiliza el nodo de
dispositivo ``/dev/uscanner0`` propiedad del grupo ``operator``. Al
a?adir al usuario ``joe`` al grupo ``operator`` ?ste podr? acceder al
esc?ner:

.. code:: screen

    # pw groupmod operator -m joe

Para m?s informaci?n sobre el uso de
`pw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pw&sektion=8>`__ lea su
p?gina de manual. Tendr? tambi?n que configurar correctamente los
permisos de escritura (0660 o 0664) en el nodo de dispositivo
``/dev/uscanner0``; por omisi?n los miembros del grupo ``operator`` s?lo
tienen acceso de lectura en este nodo de dispositivo. A?ada las
siguientes l?neas al fichero lines to the ``/etc/devfs.rules``:

.. code:: programlisting

    [system=5]
    add path uscanner0 mode 660

Ahora a?ada lo siguiente a ``/etc/rc.conf`` y reinicie la m?quina:

.. code:: programlisting

    devfs_system_ruleset="system"

Para m?s informaci?n sobre lo que acaba de leer consulte la p?gina de
manual de
`devfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=devfs&sektion=8>`__.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Por seguridad deber?a pensarse dos veces el hecho mismo de a?adir
cualquier usuario a un grupo y muy especialmente al grupo ``operator``.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------+-------------------------------+----------------------------------------------------+
| `Anterior <tvcard.html>`__?             | `Subir <multimedia.html>`__   | ?\ `Siguiente <kernelconfig.html>`__               |
+-----------------------------------------+-------------------------------+----------------------------------------------------+
| 7.5. Configuraci?n de tarjetas de TV?   | `Inicio <index.html>`__       | ?Cap?tulo 8. Configuraci?n del kernel de FreeBSD   |
+-----------------------------------------+-------------------------------+----------------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
