==================
24.2. Introducci?n
==================

.. raw:: html

   <div class="navheader">

24.2. Introducci?n
`Anterior <serialcomms.html>`__?
Cap?tulo 24. Comunicaciones serie
?\ `Siguiente <term.html>`__

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

24.2. Introducci?n
------------------

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

24.2.1. Terminolog?a
~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="variablelist">

bps
    Bits por segundo — la tasa a la cual los datos son transmitidos

DTE
    Data Terminal Equipment (Equipo terminal de datos) — por ejemplo, su
    computadora

DCE
    Data Communications Equipment (Equipo de comunicaci?n de datos) — su
    modem

RS-232
    Est?ndar EIA para hardware de comunicaci?n serie

.. raw:: html

   </div>

Cuando se habla de tasa de comunicaci?n de datos, ?sta secci?n no usa el
t?rmino “baud”. Baud se refiere al n?mero de estados de transici?n
el?ctricos que pueden realizarse en un periodo de tiempo, mientras que
“bps” (bits por segundo) es el t?rmino *correcto* a usar (al menos
parece no molestar demasiado a los m?s aferrados).

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

24.2.2. Cables y puertos
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Para conectar un modem o terminal a su sistema FreeBSD necesitar? un
puerto serie en su computadora y el cable apropiado para conectar a su
dispositivo serie. Si ya est? familiarizado con su hardware y el cable
que requiere, puede saltarse esta secci?n.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

24.2.2.1. Cables
^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Existen diferentes tipos de cables serie. Los dos tipos m?s comunes para
nuestros prop?sitos son cables null-modem y cables RS-232 est?ndar
(“normal”). La documentaci?n de su hardware deber?a describir el tipo de
cable requerido.

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

24.2.2.1.1. Cables null-modem
'''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Un cable null-modem pasa algunas se?ales, como “tierra”, normalmente,
pero cambia otras se?ales. Por ejemplo, el pin “env?o de datos” en un
extremo va al pin “recepci?n de datos” en el otro.

Si le gusta fabricar sus propios cables, puede construir un cable
null-modem para utilizar con terminales. Esta tabla muestra los nombres
de se?al y n?meros de pin en un conector DB-25.

.. raw:: html

   <div class="informaltable">

+---------+---------+--------------+---------+---------+
| Se?al   | Pin #   | ?            | Pin #   | Se?al   |
+=========+=========+==============+=========+=========+
| SG      | 7       | conecta a    | 7       | SG      |
+---------+---------+--------------+---------+---------+
| TD      | 2       | conecta a    | 3       | RD      |
+---------+---------+--------------+---------+---------+
| RD      | 3       | conecta to   | 2       | TD      |
+---------+---------+--------------+---------+---------+
| RTS     | 4       | conecta a    | 5       | CTS     |
+---------+---------+--------------+---------+---------+
| CTS     | 5       | conecta a    | 4       | RTS     |
+---------+---------+--------------+---------+---------+
| DTR     | 20      | conecta a    | 6       | DSR     |
+---------+---------+--------------+---------+---------+
| DCD     | 8       | ?            | 6       | DSR     |
+---------+---------+--------------+---------+---------+
| DSR     | 6       | conecta a    | 20      | DTR     |
+---------+---------+--------------+---------+---------+

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Conectar “Data Set Ready” (DSR) y “Data Carrier Detect” (DCD)
int?rnamente en la capucha del conector, y entonces a “Data Terminal
Ready” (DTR) en la capucha remota.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

24.2.2.1.2. Cables est?ndard RS-232C
''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Un cable serie est?ndar pasa todas las se?ales RS-232C normalmente. Esto
es, el pin “env?o de datos” en un extremo va al pin “env?o de datos” en
el otro extremo. Este es el tipo de cable a utilizar para conectar un
modem a su sistema FreeBSD, y tambi?n es apropiado para algunas
terminales.

.. raw:: html

   </div>

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

24.2.2.2. Puertos
^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Puertos serie son los dispositivos a trav?s de los cuales los datos son
transferidos entre una computadora FreeBSD y la terminal. Esta secci?n
describe los tipos de puertos que existen y como son referidos en
FreeBSD.

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

24.2.2.2.1. Tipos de puertos
''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Existen varios tipos de puertos serie. antes de comprar o construir un
cable, necesita asegurarse que coincida con los puertos en su terminal y
en su sistema FreeBSD.

La mayor?a de las terminales tienen puertos DB25. Computadoras
personales, incluyendo PCs corriendo FreeBSD, tienen puertos DB25 o DB9.
Si tiene una tarjeta multipuertos serie para su PC, tal vez tenga
puertos RJ-12 o RJ-45.

Vea la documentaci?n que acompa?a su hardware para las especificaciones
sobre el tipo de puerto en uso. Una inspecci?n visual del puerto tambi?n
funciona en la mayor?a de los casos.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

24.2.2.2.2. Nombres de puerto
'''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

En FreeBSD, se accesa cada puerto serie a trav?s de una entrada en el
directorio ``/dev``. Existen dos tipos de entradas:

.. raw:: html

   <div class="itemizedlist">

-  Puertos de llamada-entrante son llamados ``/dev/ttydN`` donde *``N``*
   es el n?mero de puerto, iniciando desde cero. Generalmente, los
   puertos de llamada-entrante se utilizan para terminales. Los puertos
   de llamada-entrante requieren que la l?nea serie especifique la se?al
   data carrier detect (DCD) para funcionar correctamente.

-  Puertos de llamada-saliente son llamados ``/dev/cuaaN``. Usualmente
   no se utilizan los puertos de llamada-saliente para terminales, solo
   para modems. Puede utilizar el puerto de llamada-saliente si el cable
   serie o la terminal no soporta la se?al de carrier detect.

.. raw:: html

   </div>

Si tiene conectada una terminal al primer puerto serie (``COM1`` en
MS-DOS?), entonces usar? ``/dev/ttyd0`` para referirse a la terminal. Si
la terminal est? en el segundo puerto serie (tambi?n conocido como
``COM2``), utilice ``/dev/ttyd1``, y as? sucesivamente.

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

24.2.3. Configuraci?n del kernel
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD soporta cuatro puertos serie por omisi?n. en el mundo MS-DOS?
?stos son conocidos como ``COM1``, ``COM2``, ``COM3``, y ``COM4``.
FreeBSD actualmente soporta tarjetas de interfaz serie “tontas”, como la
BocaBoard 1008 y 2016, as? como tarjetas multipuerto m?s inteligentes
como las fabricadas por Digiboard y Stallion Technologies. De cualquier
manera, el kernel por omisi?n solo busca por los puertos COM est?ndares.

Para ver si su kernel reconoce cualquiera de sus puertos serie, mire los
mensajes mientras el kernel esta arrancando, o utilice el comando
``/sbin/dmesg`` para repetir los mensajes de arranque del kernel. En
particular busque por mensajes que inicien con el caracter ``sio``.

.. raw:: html

   <div class="tip" xmlns="">

Sugerencia:
~~~~~~~~~~~

Para ver solamente los mensajes que contienen la palabra ``sio``, use el
comando:

.. code:: screen

    # /sbin/dmesg | grep 'sio'

.. raw:: html

   </div>

Por ejemplo, en un sistema con cuatro puertos serie, ?stos son los
mensajes de arranque del kernel espec?ficos de puerto serie:

.. code:: screen

    sio0 at 0x3f8-0x3ff irq 4 on isa
    sio0: type 16550A
    sio1 at 0x2f8-0x2ff irq 3 on isa
    sio1: type 16550A
    sio2 at 0x3e8-0x3ef irq 5 on isa
    sio2: type 16550A
    sio3 at 0x2e8-0x2ef irq 9 on isa
    sio3: type 16550A

Si su kernel no reconoce todos sus puertos serie, probablemente
necesitar? configurar un kernel FreeBSD personalizado para su sistema.
Para informaci?n detallada sobre configurar su kernel, por favor vea
`Cap?tulo?8, *Configuraci?n del kernel de
FreeBSD* <kernelconfig.html>`__.

Las l?neas de dispositivo relevantes para su fichero de configuraci?n
del kernel podr?n verse de esta manera, para FreeBSD?4.X:

.. code:: programlisting

    device     sio0    at isa? port IO_COM1 irq 4
    device      sio1    at isa? port IO_COM2 irq 3
    device      sio2    at isa? port IO_COM3 irq 5
    device      sio3    at isa? port IO_COM4 irq 9

y de esta manera, para FreeBSD?5.X:

.. code:: programlisting

    device        sio

Puede comentar o remover completamente l?neas de dispositivos que no
tenga en el caso de FreeBSD?4.X; para FreeBSD?5.X tiene que editar su
fichero ``/boot/device.hints`` para configurar sus puertos serie. Por
favor dir?jase a la p?gina de manual
`sio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sio&sektion=4>`__ para
mayor informaci?n sobre puertos serie y configuraci?n de tarjetas
multipuertos. Tenga cuidado si est? utilizando un fichero de
configuraci?n que fu? usado anteriomente para una versi?n diferente de
FreeBSD porque las banderas de dispositivo y la sintaxis han cambiado
entre versiones.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

``port IO_COM1`` es una substituci?n para ``port 0x3f8``, ``IO_COM2`` es
``0x2f8``, ``IO_COM3`` es ``0x3e8``, y ``IO_COM4`` es ``0x2e8``, las
cuales son direcciones de puerto comunes para sus respectivos puertos
serie; interrupciones 4,3,5 y 9 son peticiones comunes de l?neas de
interrupci?n. Note tambi?n que puertos serie regulares *no pueden*
compartir interrupciones en PCs con bus ISA (las tarjetas multipuerto
tienen electr?nicos que les permiten a los 16550A's compartir una o dos
l?neas de peticiones de interrupci?n).

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

24.2.4. Archivos especiales de dispositivo
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

La mayor?a de dispositivos en el kernel son accesados a trav?s de
“ficheros especiales de dispositivo”, los cuales est?n localizados en el
directorio ``/dev``. Los dispositivos ``sio`` son accesados a trav?s de
los dispositivos ``/dev/ttydN`` (dial-in) y ``/dev/cuaaN`` (call-out).
FreeBSD provee tambi?n dispositivos de inicializaci?n (``/dev/ttyidN`` y
``/dev/cuaiaN``) y dispositivos de bloqueo (``/dev/ttyldN`` y
``/dev/cualaN``). Los dispotivos de inicializaci?n son utilizados para
inicializar los par?metros de comunicaci?n de puerto cada vez que un
puerto es abierto, como ``crtscts`` para modems que utilizan
se?alizaci?n ``RTS/CTS`` para control de flujo. Los dispositivos de
bloqueo son utilizados para bloquear banderas en puertos y prevenir que
usuarios o programas cambien ciertos par?metros; vea las p?ginas de
manual
`termios(4) <http://www.FreeBSD.org/cgi/man.cgi?query=termios&sektion=4>`__,
`sio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sio&sektion=4>`__, y
`stty(1) <http://www.FreeBSD.org/cgi/man.cgi?query=stty&sektion=1>`__
para informaci?n de las propiedades de terminales, bloqueo e
inicializaci?n de dispositivos y aplicaci?n de opciones de terminal,
respectivamente.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

24.2.4.1. Creando ficheros de dispositivo especiales
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

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

FreeBSD?5.0 incluye el sistema de ficheros
`devfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=devfs&sektion=5>`__
el cual crea autom?ticamente nodos de dispositivos seg?n se necesiten.
si est? corriendo una versi?n de FreeBSD con ``devfs`` habilitado
entonces puede saltarse esta secci?n.

.. raw:: html

   </div>

Un script de shell llamado ``MAKEDEV`` en el directorio ``/dev``
administra los ficheros especiales de dispositivo. Para utilizar
``MAKEDEV`` para crear un fichero especial de dispositivo dial-up para
``COM1`` (port 0), ``cd`` a ``/dev`` y ejecute el comando
``MAKEDEV ttyd0``. De la misma manera, para crear ficheros especiales de
dispositivo para ``COM2`` (port 1), utilice ``MAKEDEV ttyd1``.

``MAKEDEV`` no crea solamente el fichero especial de dispositivo
``/dev/ttydN`` tambi?n crea los nodos ``/dev/cuaaN``, ``/dev/cuaiaN``,
``/dev/cualaN``, ``/dev/ttyldN``, y ``/dev/ttyidN``.

Despues de crear ficheros especiales de dispositivo nuevos, aseg?rese de
revisar los permisos en los ficheros (especialmente los ficheros
``/dev/cua*``) para asegurarse que solamente los usuarios que deben
tener acceso a esos ficheros especiales de dispositivo puedan leer y
escribir en ellos — probablemente no desee permitir al usuario promedio
utilizar sus modems para marcar al exterior. Los permisos por omisi?n en
los ficheros ``/dev/cua*`` deber?an ser suficientes:

.. code:: screen

    crw-rw----    1 uucp     dialer    28, 129 Feb 15 14:38 /dev/cuaa1
    crw-rw----    1 uucp     dialer    28, 161 Feb 15 14:38 /dev/cuaia1
    crw-rw----    1 uucp     dialer    28, 193 Feb 15 14:38 /dev/cuala1

Estos permisos permiten al usuario ``uucp`` y usuarios en el grupo
``dialer`` utilizar dispositivos call-out.

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

24.2.5. Configuraci?n de puerto serie
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El dispositivo ``ttydN`` (o ``cuaaN``) es el dispositivo regular que
usted desear? abrir para sus aplicaciones. Cuando un proceso abre el
dispositivo, tendr? un conjunto por omisi?n de propiedades de terminal
E/S. Puede ver estas propiedades con el comando

.. code:: screen

    # stty -a -f /dev/ttyd1

Cuando cambia las propiedades de este dispositivo, las propiedades son
efectivas hasta que el dispositivo es cerrado. Cuando es reabierto
regresa a las propiedades por omisi?n. Para realizar cambios al conjunto
por omisi?n, usted puede abrir y ajustar las propiedades del dispositivo
de “estado inicial” . Por ejemplo, para activar el modo ``CLOCAL``,
comunicaci?n de 8 bits y control de flujo ``XON/XOFF`` por omisi?n para
``ttyd5``, tecl?e:

.. code:: screen

    # stty -f /dev/ttyid5 clocal cs8 ixon ixoff

La inicializaci?n para todo el sistema de los dispositivos serie es
controlada en ``/etc/rc.serial``. Este fichero afecta las propiedades
por omisi?n de dispositivos serie.

Para prevenir que ciertas propiedades sean cambiadas por una aplicaci?n,
haga ajustes al dispositivo “bloquear estado”. Por ejemplo, para
confinar la velocidad en ``ttyd5`` a 57600?bps, tecl?e:

.. code:: screen

    # stty -f /dev/ttyld5 57600

Ahora, una aplicaci?n que abra ``ttyd5`` y trate de cambiar la velocidad
del puerto se mantendr? con 57600?bps.

Naturalmente, deber?a crear los dispositivos de estado inicial y bloqueo
de estado escribible ?nicamente para la cuenta ``root`` .

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+--------------------------------+--------------------------------+
| `Anterior <serialcomms.html>`__?     | `Subir <serialcomms.html>`__   | ?\ `Siguiente <term.html>`__   |
+--------------------------------------+--------------------------------+--------------------------------+
| Cap?tulo 24. Comunicaciones serie?   | `Inicio <index.html>`__        | ?24.3. Terminales              |
+--------------------------------------+--------------------------------+--------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
