======================
24.4. Servicio dial-in
======================

.. raw:: html

   <div class="navheader">

24.4. Servicio dial-in
`Anterior <term.html>`__?
Cap?tulo 24. Comunicaciones serie
?\ `Siguiente <dialout.html>`__

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

24.4. Servicio dial-in
----------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Contribuido por Guy Helmer.

.. raw:: html

   </div>

.. raw:: html

   <div>

Adiciones por Sean Kelly.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Configurar su sistema FreeBSD para servicio dial-in es muy similar a
conectar terminales excepto que en lugar de lidiar con terminales se
hace con modems.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

24.4.1. Modems externos vs. internos
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Los modems externos parecen ser m?s convenientes para dial-up, debido a
que los modems externos con frecuencia pueden ser configurados semi
permanentemente v?a par?metros almacenados en RAM no volatil y
usualmente proveen indicadores luminosos que despliegan el estado de
se?ales importantes RS-232. Luces parpadeantes impresionan a los
visitantes, pero las luces son tambi?n ?tiles para ver si un modem se
encuentra operando adecu?damente.

Los modems internos usualmente carecen de RAM no volatil, entonces su
configuraci?n puede estar limitada a especificar DIP switches. Si su
modem interno cuenta con alg?n indicador luminoso de se?ales, es
probablemente dificil observar las luces cuando el sistema est? cubierto
y en su lugar.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

24.4.1.1. Modems y cables
^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Si se encuentra utilizando un modem externo, entonces necesitar? por
supuesto un cable adecuado. Un cable serie est?ndar RS-232C debe ser
suficiente mientras todas las se?ales normales sean cableadas:

.. raw:: html

   <div class="itemizedlist">

-  Transmitted Data (TD)

-  Received Data (RD)

-  Request to Send (RTS)

-  Clear to Send (CTS)

-  Data Set Ready (DSR)

-  Data Terminal Ready (DTR)

-  Carrier Detect (CD)

-  Signal Ground (SG)

.. raw:: html

   </div>

FreeBSD necesita las se?ales RTS y CTS para control de flujo a
velocidades mayores a 2400?bps, la se?al CD para detectar cuando una
llamada ha sido respondida o la l?nea ha sido colgada, y la se?al DTR
para reiniciar el modem despues de completar una sesi?n. Algunos cables
son hechos sin incluir todas las se?ales necesarias, as? que si tiene
problemas, como cuando una sesi?n no finaliza cuando la l?nea es
colgada, tal vez el problema se deba al cable.

Como otros sistemas operativos tipo UNIX?, FreeBSD utiliza las se?ales
de hardware para saber cuando una llamada ha sido contestada o una l?nea
ha sido colgada y poder colgar y reiniciar el modem despues de una
llamada. FreeBSD evita enviar comandos al modem o esperar por reportes
de estado del modem. Si est? familiarizado con la conexi?n de modems una
PC funcionando como BBS, tal ves esto parezca extra?o.

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

24.4.2. Consideraciones de interfaces serie
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD soporta interfaces de comunicaci?n NS8250-, NS16450-, NS16550-,
y NS16550A-basado en EIA RS-232C (CCITT V.24). Los dispositivos 8250 y
16450 tienen buffers de un solo caracter. El dispositivo 16550 brinda un
buffer de 16 caracteres, el cual permite un mejor desempe?o del sistema.
(Errores en 16550 simple impiden el uso del buffer de 16 caracteres, as?
que utilice 16550A si es posible). Debido a que los dispositivos de
buffer de un solo caracter requieren m?s trabajo del sistema operativo
que los dispotivos de buffer de 16 caracteres, las tarjetas de interfaz
serie basadas en 16550A son mayormente preferidas. Si el sistema tiene
muchos puertos serie activos o tendr? una carga elevada, las tarjetas
basadas en 16550A son mejores para comunicaciones con baja tasa de
error.

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

24.4.3. Revisi?n r?pida
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Como con las terminales, ``init`` engendra un proceso ``getty`` para
cada puerto serie configurado para conexiones dial-in. Por ejemplo, si
un modem est? conectado a ``/dev/ttyd0``, el comando ``ps ax`` podr?a
mostrar esto:

.. code:: screen

     4850 ??  I      0:00.09 /usr/libexec/getty V19200 ttyd0

Cuando un usuario marca la l?nea del modem y el modem conecta, la l?nea
CD (Carrier Detect) es reportada por el modem. El kernel nota que se ha
detectado una portadora y completa la apertura de ``getty`` del puerto.
``getty`` manda un prompt ``login:`` a la velocidad inicial de l?nea
especificada. ``getty`` observa si se reciben caracteres v?lidos, y, en
una configuraci?n t?pica, si encuentra basura (probablemente debido a
que la velocidad de conexi?n del modem es diferente a la velocidad de
``getty``), ``getty`` trata de ajustar la velocidad de la l?nea hasta
que recibe caracteres razonables.

Despues que el usuario entra su nombre de login, ``getty`` ejecuta
``/usr/bin/login``, que completa la entrada preguntando por la
contrase?a del usuario y entonces inicia el shell del usuario.

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

24.4.4. Archivos de configuraci?n
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Existen tres ficheros de configuraci?n del sistema en el directorio
``/etc`` que probablemente necesitar? editar para permitir acceso de
dial-up a su sistema FreeBSD. El primero, ``/etc/gettytab``, contiene
informaci?n de configuraci?n para el daemon ``/usr/libexec/getty``. El
segundo, ``/etc/ttys`` contiene informaci?n que le dice a ``/sbin/init``
que dispositivos ``tty`` deben tener procesos ``getty`` corriendo. Por
?ltimo, puede incluir comandos de inicializaci?n de puerto en el script
``/etc/rc.serial``.

Existen dos escuelas de pensamiento en relaci?n a modems dial-up en
UNIX?. Un grupo gusta de configurar sus modems y sistemas para que sin
importar a que velocidad un usuario remoto marque, la interfaz local
RS-232 computadora-a-modem corra a una velocidad fija. El beneficio de
esta configuraci?n es que el usuario remoto siempre obtiene un prompt de
login del sistema inmedi?tamente. La desventaja es que el sistema no
sabe cual es la tasa de datos verdadera del usuario, as? que programas a
pantalla completa como Emacs no ajustar?n sus m?todos de dibujado de
pantalla para mejorar sus respuestas en conexiones m?s lentas.

La otra escuela configura sus modems de interfaz RS-232 para variar su
velocidad basado en la velocidad de conexi?n del usuario remoto. Por
ejemplo, conexiones V.32bis (14.4?Kbps) al modem podr?an hacer al modem
correr su interfaz RS-232 a 19.2?Kbps, mientras que conexiones 2400?bps
hacen correr la interfaz RS-232 del modem a 2400?bps. Debido a que
``getty`` no entiende el reporte de velocidad de conexi?n de cualquier
modem, ``getty`` brinda un mensaje ``login:`` a una velocidad inicial y
observa los caracteres que regresan en respuesta. Si el usuario recibe
basura, se asume que sabe que debe presionar la tecla Enter hasta que
reciba un prompt reconocible. Si la tasa de datos no concuerda,
``getty`` trata todo lo que el usuario escriba como “basura”, trata
yendo a la siguiente velocidad y brinda el prompt ``login:`` de nuevo.
Este procedimiento puede continuar hasta el cansancio, pero normalmente
solo toma un teclazo o dos antes que el usuario reciba un prompt
correcto. Obviamente, esta secuencia de login no parece tan limpia como
el anterior m?todo de “velocidad fija”, pero un usuario en una conexi?n
de velocidad baja podr?a recibir una respuesta interactiva mejor desde
programas a pantalla completa.

Esta secci?n tratar? de dar informaci?n de configuraci?n balanceada,
pero est? cargada hacia tener la tasa de datos del modem siguiendo la
tasa de conexi?n.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

24.4.4.1. ``/etc/gettytab``
^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

``/etc/gettytab`` es un fichero tipo
`termcap(5) <http://www.FreeBSD.org/cgi/man.cgi?query=termcap&sektion=5>`__
de informaci?n de configuraci?n para
`getty(8) <http://www.FreeBSD.org/cgi/man.cgi?query=getty&sektion=8>`__.
Por favor vea la p?gina de manual
`gettytab(5) <http://www.FreeBSD.org/cgi/man.cgi?query=gettytab&sektion=5>`__
para informaci?n completa del formato del fichero y la lista de
capacidades.

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

24.4.4.1.1. Configuraci?n de velocidad fija
'''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Si est? fijando la tasa de comunicaci?n de datos de su modem a una
velocidad particular, probablemente no necesitar? ning?n cambio a
``/etc/gettytab``.

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

24.4.4.1.2. Configuraci?n de velocidad concordante
''''''''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Necesitar? crear una entrada en ``/etc/gettytab`` para darle informaci?n
a ``getty`` acerca de las velocidades que desea usar para su modem. Si
tiene un modem 2400?bps, puede probablemente utilizar la entrada
existente ``D2400``.

.. code:: programlisting

    #
    # Fast dialup terminals, 2400/1200/300 rotary (can start either way)
    #
    D2400|d2400|Fast-Dial-2400:\
            :nx=D1200:tc=2400-baud:
    3|D1200|Fast-Dial-1200:\
            :nx=D300:tc=1200-baud:
    5|D300|Fast-Dial-300:\
            :nx=D2400:tc=300-baud:

Si tiene un modem de mayor velocidad, probablemente necesite agregar una
entrada en ``/etc/gettytab``; aqu? est? una entrada que puede utilizar
para un modem 14.4?Kbps con una velociad de interfaz m?xima de
19.2?Kbps:

.. code:: programlisting

    #
    # Additions for a V.32bis Modem
    #
    um|V300|High Speed Modem at 300,8-bit:\
            :nx=V19200:tc=std.300:
    un|V1200|High Speed Modem at 1200,8-bit:\
            :nx=V300:tc=std.1200:
    uo|V2400|High Speed Modem at 2400,8-bit:\
            :nx=V1200:tc=std.2400:
    up|V9600|High Speed Modem at 9600,8-bit:\
            :nx=V2400:tc=std.9600:
    uq|V19200|High Speed Modem at 19200,8-bit:\
            :nx=V9600:tc=std.19200:

esto resultar? en una conexi?n de 8 bits, sin paridad.

El ejemplo de arriba inicia la tasa de comunicaciones a 19.2?Kbps (para
conexiones V.32bis), entonces cicla a trav?s de 9600?bps (para V.32),
2400?bps, 1200?bps, 300?bps, y de vuelta a 19.2?Kbps. El ciclado de la
tasa de comunicaciones es implementado con la capacidad ``nx=``
(“siguiente tabla”). Cada una de las l?neas usa una entrada ``tc=``
(“continuaci?n de tabla”) para recoger el resto de las propiedades
“est?ndar” para una tasa de datos en particular.

Si tiene un modem 28.8?Kbps y/o quiere tomar ventaja de la compresi?n en
un modem 14.4?Kbps, necesita utilizar una tasa de comunicaciones mayor a
19.2?Kbps. Aqu? hay un ejemplo de una entrada ``gettytab`` iniciando a
57.6?Kbps:

.. code:: programlisting

    #
    # Additions for a V.32bis or V.34 Modem
    # Starting at 57.6 Kbps
    #
    vm|VH300|Very High Speed Modem at 300,8-bit:\
            :nx=VH57600:tc=std.300:
    vn|VH1200|Very High Speed Modem at 1200,8-bit:\
            :nx=VH300:tc=std.1200:
    vo|VH2400|Very High Speed Modem at 2400,8-bit:\
            :nx=VH1200:tc=std.2400:
    vp|VH9600|Very High Speed Modem at 9600,8-bit:\
            :nx=VH2400:tc=std.9600:
    vq|VH57600|Very High Speed Modem at 57600,8-bit:\
            :nx=VH9600:tc=std.57600:

Si tiene un CPU lento o un sistema muy cargado y no tiene puertos serie
basados en 16550A, tal vez reciba errores en sio “silo” a 57.6?Kbps.

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

24.4.4.2. ``/etc/ttys``
^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

La configuraci?n del fichero ``/etc/ttys`` fu? cubierto en
`Ejemplo?24.1, “Agregando entradas de terminal a
``/etc/ttys``\ ” <term.html#ex-etc-ttys>`__. La configuraci?n para
modems es similar pero debemos pasar un argumento diferente a ``getty``
y especificar un tipo diferente de terminal. El formato general tanto
para configuraci?n de velocidad fija y velocidad concordante es:

.. code:: programlisting

    ttyd0   "/usr/libexec/getty xxx"   dialup on

El primer componente de la l?nea de arriba es el fichero de dispositivo
especial para esta entrada — ``ttyd0`` significa que ``/dev/ttyd0`` es
el fichero que ``getty`` estar? vigilando. El segundo componente
``"/usr/libexec/getty           xxx"`` (*``xxx``* ser? reemplazado por
la capacidad inicial de ``gettytab``) es el proceso que ``init``
ejecutar? en el dispositivo. El tercer componente, ``dialup``, es el
tipo de terminal por omisi?n. El cuarto par?metro, ``on``, le indica a
``init`` que la l?nea es operacional. Puede existir un quinto par?metro,
``secure``, pero solo deber?a ser utilizado para terminales que est?n
f?sicamente seguras (como la consola del sistema).

El tipo de terminal por omisi?n (``dialup`` en el ejemplo de arriba)
puede depender de preferencias locales. ``dialup`` es el tipo de
terminal tradicional por omisi?n en l?neas dial-up para que los usuarios
puedan personalizar sus scripts de login para reconocer cuando la
terminal es ``dialup`` y ajustar sus tipos de terminal autom?ticamente.
De toda maneras, el autor encuentra m?s sencillo especificar en su sitio
``vt102`` como el tipo de terminal por omisi?n, puesto que los usuarios
solo utilizan emulaci?n VT102 en sus sistemas remotos.

Despues de realizar los cambios a ``/etc/ttys``, puede enviar al proceso
``init`` una se?al HUP para que relea el fichero. Puede utilizar el
comando

.. code:: screen

    # kill -HUP 1

para mandar la se?al. Si esta es su primera vez instalando el sistema,
tal vez quiera esperar hasta que su(s) modem(s) est?n configurados y
conectados correctamente antes de se?alizar a ``init``.

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

24.4.4.2.1. Configuraci?n de velocidad fija
'''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Para una configuraci?n de velocidad fija, su entrada ``ttys`` necesita
tener una entrada de velocidad fija provista en ``getty``. Para un modem
cuya velocidad de puerto est? fijada en 19.2?Kbps, la entrada ``ttys``
podr?a verse as?:

.. code:: programlisting

    ttyd0   "/usr/libexec/getty std.19200"   dialup on

Si su modem est? fijado a un velocidad de datos diferente, sustituya el
valor apropiado por ``std.velocidad`` en lugar de ``std.19200``.
Aseg?rese de usar un tipo v?lido listado en ``/etc/gettytab``.

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

24.4.4.2.2. Configuraci?n de velocidad concordante
''''''''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

En una configuraci?n de velocidad concordante su entrada ``ttys``
necesita referenciar el inicio de la entrada “auto-baud” (sic) en
``/etc/gettytab``. Por ejemplo, si agreg? la entrada sugerida arriba
para un modem con velocidad concordante que inicia a 19.2?Kbps (la
entrada ``gettytab`` conteniendo el punto de inicio ``V19200``), su
entrada ``ttys`` podr?a verse como esta:

.. code:: programlisting

    ttyd0   "/usr/libexec/getty V19200"   dialup on

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

24.4.4.3. ``/etc/rc.serial``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Modems de alta velocidad, como V.32, V.32bis, y V.34, necesitan usar
control de flujo por hardware (``RTS/CTS``). Puede agregar comandos
``stty`` a ``/etc/rc.serial`` para activar la bandera de control de
flujo por hardware en el kernel de FreeBSD para los puertos del modem.

Por ejemplo para activar la bandera ``termios`` ``crtscts`` de
dispositivos de inicializaci?n dial-in y dial-out en el puerto serie #1
(``COM2``), las siguientes l?neas pueden agregarse a ``/etc/rc.serial``:

.. code:: programlisting

    # Serial port initial configuration
    stty -f /dev/ttyid1 crtscts
    stty -f /dev/cuaia1 crtscts

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

24.4.5. Propiedades del modem
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Si tiene un modem cuyos par?metros pueden ser activados permanentemente
en RAM no volatil, necesitar? utilizar un programa de terminal (como
Telix en MS-DOS? o ``tip`` en FreeBSD) para activar los par?metros.
Conecte al modem usando la misma velocidad de comunicaci?n como
velocidad inicial que ``getty`` usar? y configure la RAM no volatil del
modem para que concuerde con estos requerimientos:

.. raw:: html

   <div class="itemizedlist">

-  CD activado cuando est? conectado

-  DTR activado para operaci?n; tirar DTR cuelga la l?nea y reinicia el
   modem

-  CTS control de flujo de datos transmitidos

-  Deshabilitar control de flujo XON/XOFF

-  RTS control de flujo de datos recibidos

-  Modo silencioso (sin c?digos resultantes)

-  Sin eco de comandos

.. raw:: html

   </div>

Por favor lea la documentaci?n de su modem para saber que comandos y/o
switches DIP necesita proporcionarle.

Pro ejemplo, para activar los par?metros de arriba en un modem U.S.
Robotics? Sportster? 14,400 externo, uno podr?a dar estos comandos al
modem:

.. code:: programlisting

    ATZ
    AT&C1&D2&H1&I0&R2&W

Tal vez quiera tambi?n tomar esta oportunidad para ajustar otras
propiedades en el modem, como si utilizar? compresi?n V.42bis y/o MNP5.

El modem U.S. Robotics? Sportster? 14,400 externo tambi?n posee switches
DIP que necesitan activarse; para otros modems, tal vez pueda utilizar
estas propiedades como un ejemplo:

.. raw:: html

   <div class="itemizedlist">

-  Switch 1: ARRIBA — DTR Normal

-  Switch 2: N/A (C?digos resultantes verbales/C?digos resultantes
   num?ricos)

-  Switch 3: ARRIBA — Suprimir c?digos resultantes

-  Switch 4: ABAJO — No eco, comandos offline

-  Switch 5: ARRIBA — Auto respuesta

-  Switch 6: ARRIBA — Detecci?n de se?al Normal

-  Switch 7: ARRIBA — Cargar valores NVRAM por omisi?n

-  Switch 8: N/A (Modo inteligente/Modo tonto)

.. raw:: html

   </div>

C?digos resultantes deber?an ser deshabilitados o suprimidos para modems
dial-up para evitar problemas que pueden ocurrir si ``getty``
erroneamente ofrece un prompt ``login:`` a un modem que se encuentra en
modo de comandos y el modem hace eco del comando o regresa un c?digo
resultante. Esta secuencia puede resultar en una conversaci?n larga y
tonta entre ``getty`` y el modem.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

24.4.5.1. Configuraci?n de velocidad fija
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Para una configuraci?n de velocidad fija necesitar? configurar el modem
para mantener una tasa de datos constante modem-a-computadora
independiente de la tasa de comunicaciones. En un modem U.S. Robotics?
Sportster? 14,400 externo estos comandos fijar?n la tasa de datos
modem-a-computadora a la velocidad utilizada para pasar los comandos:

.. code:: programlisting

    ATZ
    AT&B1&W

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

24.4.5.2. Configuraci?n de velocidad concordante
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Para una configuraci?n de velocidad variable necesitar? configurar su
modem para ajustar la tasa de datos de su puerto serie para que coincida
con la tasa de llamada entrante. En un modem U.S. Robotics? Sportster?
14,400 externo estos comandos fijar?n la tasa de correcci?n de errores
de datos a la velocidad usada para pasar los comandos, pero le permite a
la tasa del puerto serie variar para conexiones que no corrigen errores:

.. code:: programlisting

    ATZ
    AT&B2&W

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

24.4.5.3. Revisando la configuraci?n del modem
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

La mayor?a de los modems de alta velocidad brindan comandos para ver los
par?metros actuales de operaci?n del modem en un modo entendible para
humanos. En el modem U.S. Robotics? Sportster? 14,400 externo, el
comando ``ATI5`` despliega los par?metros que est?n almacenados en la
RAM no volatil. Para ver los par?metros reales de operaci?n del modem
(influenciado por los par?metros de los switches DIP del modem), utilice
el comando ``ATZ`` y entonces ``ATI4``.

Si tiene una marca diferente de modem, revise el manual de su modem para
ver como checar doblemente los par?metros de configuraci?n de su modem.

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

24.4.6. Determinando errores
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Aqu? hay unos cuantos pasos que puede seguir para revisar en sus sistema
el modem dial-up.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

24.4.6.1. Revisando el sistema FreeBSD
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Conecte su modem a su sistema FreeBSD, arranque el sistema, y, si su
modem tiene luces de indicaci?n de estado, mire si el indicador DTR del
modem enciende cuando el prompt ``login:`` aparece en la consola del
sistema — si enciende, eso deber?a significar que FreeBSD ha iniciado un
proceso ``getty`` en el puerto de comunicaciones apropiado y est?
esperando a que el modem acepte la llamada.

Si el indicador DTR no enciende, entre al sistema FreeBSD a trav?s de la
consola y ponga un ``ps            ax`` para ver si FreeBSD est?
tratando de correr un proceso ``getty`` en el puerto correcto. Deber?a
ver l?neas como estas entre los procesos desplegados:

.. code:: screen

      114 ??  I      0:00.10 /usr/libexec/getty V19200 ttyd0
      115 ??  I      0:00.10 /usr/libexec/getty V19200 ttyd1

Si ve algo diferente, como esto:

.. code:: screen

      114 d0  I      0:00.10 /usr/libexec/getty V19200 ttyd0

y el modem no ha aceptado una llamada todav?a, esto significa que
``getty`` ha completado su apertura en el puerto de comunicaciones. Esto
puede indicar un problema con el cableado o un modem mal configurado,
debido a que ``getty`` no podr?a abrir el puerto de comunicaciones hasta
que un CD (detecci?n de se?al) sea afirmado por el modem.

si no ve ning?n proceso ``getty`` esperando para abrir el puerto
``ttydN`` deseado, revise de nuevo sus entradas en ``/etc/ttys`` para
ver si existe alg?n error ah?. Tambi?n revise el fichero de log
``/var/log/messages`` para ver si existe alg?n mensaje de ``init`` o de
``getty`` relacionados a cualquier problema. Si existe cualquier
mensaje, revise nuevamente los ficheros de configuraci?n ``/etc/ttys`` y
``/etc/gettytab``, as? como los ficheros especiales de dispositivo
``/dev/ttydN``, por cualquier error, entradas faltantes, o ficheros
especiales de dispositivo faltantes.

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

24.4.6.2. Trate de llamar
^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Trate de llamar al sistema; aseg?rese de usar 8 bits, sin paridad, y 1
bit de parada en el sistema remoto. Si no obtiene un prompt
inmediatamente, o recibe basura, trate presionando Enter una vez por
segundo. Si continua sin ver un prompt de ``login:`` despues de un
tiempo, trate enviando un ``BREAK``. Si est? usando un modem de alta
velocidad para realizar la marcaci?n, trate marcando de nuevo despues de
fijar la velociad de interfaz del modem (por medio de ``AT&B1`` en un
modem U.S. Robotics? Sportster?, por ejemplo).

Si todav?a no puede obtener un prompt de ``login:``, revise
``/etc/gettytab`` de nuevo y revise nuevamente que

.. raw:: html

   <div class="itemizedlist">

-  El nombre de capacidad inicial especificado en ``/etc/ttys`` para la
   l?nea coincida con un nombre de una capacidad en ``/etc/gettytab``

-  Cada entrada ``nx=`` coincida con otro nombre de capacidad de
   ``gettytab``

-  Cada entrada ``tc=`` coincida con otro nombre de capacidad de
   ``gettytab``

.. raw:: html

   </div>

Si marca pero el modem en el sistema FreeBSD no contesta, aseg?rese que
el modem est? configurado para contestar el tel?fono cuando DTR sea
detectado. Si el modem parece estar configurado correctamente, verifique
que DTR sea detectado revisando las luces indicadoras del modem (si
tiene alguna).

Si ha revisado todo varias veces y todav?a no funciona, tome un descanso
y regrese a eso depues. Si todav?a continua sin funcionar, tal vez puede
mandar un correo electr?nico a `lista de correo para preguntas generales
sobre
FreeBSD <http://lists.FreeBSD.org/mailman/listinfo/freebsd-questions>`__
describiendo su modem y su problema, y las buenas personas en la lista
tratar?n de ayudarle.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------+--------------------------------+-----------------------------------+
| `Anterior <term.html>`__?   | `Subir <serialcomms.html>`__   | ?\ `Siguiente <dialout.html>`__   |
+-----------------------------+--------------------------------+-----------------------------------+
| 24.3. Terminales?           | `Inicio <index.html>`__        | ?24.5. Servicio dial-out          |
+-----------------------------+--------------------------------+-----------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
