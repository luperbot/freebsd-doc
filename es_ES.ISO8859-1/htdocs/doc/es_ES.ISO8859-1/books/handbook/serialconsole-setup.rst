===================================
24.6. Configurando la consola serie
===================================

.. raw:: html

   <div class="navheader">

24.6. Configurando la consola serie
`Anterior <dialout.html>`__?
Cap?tulo 24. Comunicaciones serie
?\ `Siguiente <ppp-and-slip.html>`__

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

24.6. Configurando la consola serie
-----------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Contribuido por Kazutaka YOKOTA.

.. raw:: html

   </div>

.. raw:: html

   <div>

Basado en un documento de Bill Paul.

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

24.6.1. Introducci?n
~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD tiene la habilidad de arrancar en un sistema con solo una
terminal tonta como consola. Tal configuraci?n podr?a ser ?til para dos
clases de gente: administradores de sistema que quieran instalar FreeBSD
en m?quinas que no tienen teclado o monitor conectado, y desarrolladores
que quieran corregir errores en el kernel o controladores de
dispositivos.

Como se describe en `Cap?tulo?12, *El proceso de arranque en
FreeBSD* <boot.html>`__, FreeBSD emplea un sistema de arranque de tres
estados. Los primeros dos estados se encuentran en el c?digo del bloque
de arranque el cual es almacenado al principio del slice en el disco de
arranque. El bloque de arranque entonces cargar? y ejecutar? el cargador
de arranque (``/boot/loader``) como la tercera etapa de c?digo.

Para poder configurar la consola serie debe configurar el c?digo del
bloque de arranque, el c?digo del cargador de arranque y el kernel.

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

24.6.2. Configuraci?m de consola serie, versi?n breve
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Esta secci?n asume que est? usando la configuraci?n por omisi?n y solo
quiere una r?pida revisi?n de la configuraci?n de la consola serie.

.. raw:: html

   <div class="procedure">

#. Conecte el cable serie a COM1 y la terminal controladora.

#. Para ver todos los mensajes de arranque en la consola serie escriba
   el siguiente comando mientras est? firmado como superusuario:

   .. code:: screen

       # echo 'console="comconsole"' >> /boot/loader.conf

#. Edite ``/etc/ttys`` y cambie ``dialup`` a ``vt100`` para la entrada
   ``ttyd0``. De otra manera una contrase?a no ser? requerida para
   conectar por medio de la consola serie, resultando en un agujero de
   seguridad potencial.

#. Reinicie el sistema para ver si los cambios tuvieron efecto.

.. raw:: html

   </div>

Si una configuraci?n diferente es requerida, una explicaci?n mas
detallada existe en `Secci?n?24.6.3, “Configuraci?n de la consola
serie” <serialconsole-setup.html#serialconsole-howto>`__.

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

24.6.3. Configuraci?n de la consola serie
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="procedure">

#. Prepare un cable serie.

   Necesitar? ya sea un cable null-modem o un cable serie est?ndar y un
   adaptador null-modem. Vea `Secci?n?24.2.2, “Cables y
   puertos” <serial.html#serial-cables-ports>`__ para una discusi?n
   sobre cables serie.

#. Desconecte su teclado.

   La mayor?a de sistemas PC buscan el teclado durante la autoprueba de
   encendido (POST) y generar?n un error si el teclado no es detectado.
   Algunas m?quinas se quejan fuerte sobre la falta de un teclado y no
   continuar?n arrancando hasta que este contectado.

   Si su computadora se queja con este error, pero arranca de todos
   modos, entonces no tiene que hacer nada especial. (Algunas m?quinas
   con BIOS Phoenix instalado solo mostrar?n Keyboard failed y
   continuar?n arrancando normalmente.)

   Si su computadora se niega a arrancar sin un teclado conectado,
   entonces tendr? que configurar el BIOS para que ignore este error (si
   es posible). Consulte el manual de su tarjeta madre para los detalles
   de como hacer esto.

   .. raw:: html

      <div class="tip" xmlns="">

   Sugerencia:
   ~~~~~~~~~~~

   Poniendo el teclado como “No instalado” en el BIOS *no* significa que
   no pod? usar su teclado. Todo lo que hace es decirle al BIOS que no
   busque un teclado al momento de encender, asi no se quejar? si el
   teclado no se encuentra conectado. Puede dejar el teclado conectado
   incluso si esta bandera est? puesta a “No instalado” y el teclado
   toda?a funcionar?.

   .. raw:: html

      </div>

   .. raw:: html

      <div class="note" xmlns="">

   Nota:
   ~~~~~

   Si su sistema tiene un rat?n PS/2? es muy probable que tambi?n tenga
   que desconectar su rat?n junto con el teclado. Esto se debe a que los
   ratones PS/2? comparten alg?n hardware con el teclado y dejandolo
   conectado puede ocasionar que el sistema piense que el teclado sigue
   conectado. Se dice que un sistema Gateway 2000 Pentium 90?MHz con un
   AMI BIOS se comporta de esta manera. En general, esto no representa
   un problema puesto que el rat?n no es muy ?til sin el teclado de
   todas maneras.

   .. raw:: html

      </div>

#. Conecte una terminal tonta a ``COM1`` (``sio0``).

   Si no tiene una terminal tonta, puede utilizar una PC/XT vieja con un
   programa de modem, o el puerto serie en otro equipo UNIX?. Si no
   tiene un ``COM1`` (``sio0``), consiga uno. En este momento, no existe
   manera de seleccionar un puerto diferente a ``COM1`` para los bloques
   de arranque sin recompilar los bloques de arranque. Si ya est?
   utilizando ``COM1`` para otro dispositivo, necesitar? remover
   temporalmente ese dispositivo e instalar un nuevo bloque de arranque
   y kernel una vez que tenga a FreeBSD arriba y funcionando. (Se asume
   que ``COM1`` estar? disponible en un fichero/computadora/servidor de
   terminales de todas maneras; si realmente necesita ``COM1`` para algo
   m?s (y no puede cambiar ese algo a ``COM2`` (``sio1``)), entonces
   probablemente no deber?a de molestarse con todo esto en primer
   lugar.)

#. Aseg?rese de que el fichero de configuraci?n de su kernel tenga las
   banderas apropiadas activadas para ``COM1`` (``sio0``).

   Las banderas relevantes son:

   .. raw:: html

      <div class="variablelist">

   ``0x10``
       Habilita el soporte de consola para esta unidad. Las otras
       banderas de consola son ignoradas a menos que ?sta est? activada.
       Actualmente, al menos una unidad puede tener soporte de consola;
       la primera (en orden de configuraci?n) con esta bandera activada
       es preferida. Esta opci?n por si sola no har? del puerto serie
       una consola. Active la siguiente bandera o utilice la opci?n
       ``-h`` descrita abajo, junto con esta bandera.

   ``0x20``
       Obliga a esta unidad a ser la consola (a menos que exista otra
       consola de mayor prioridad), sin importar la opci?n ``-h``
       discutida abajo. Esta bandera reemplaza la opci?n ``COMCONSOLE``
       en las versiones 2.\ *``X``* de FreeBSD. La bandera ``0x20`` debe
       ser utilizada junto con la bandera ``0x10``.

   ``0x40``
       Reserva esta unidad (en conjunto con ``0x10``) y hace esta unidad
       no disponible para acceso normal. No deber?a activar esta bandera
       en la unidad de puerto serie la cual desee utilizar como la
       consola serie. El ?nico uso de esta bandera es designar la unidad
       para corecci?n de errore remota del kernel. Revise “El manual del
       desarrollador” para mayor informaci?n sobre correcci?n de errores
       remotamente.

       .. raw:: html

          <div class="note" xmlns="">

       Nota:
       ~~~~~

       En FreeBSD?4.0 o posterior la sem?ntica de la bandera ``0x40`` es
       ligeramente diferente y existe otra bandera para especificar un
       puerto serie para correcci?n de errores remotamente.

       .. raw:: html

          </div>

   .. raw:: html

      </div>

   Ejemplo:

   .. code:: programlisting

       device sio0 at isa? port IO_COM1 flags 0x10 irq 4

   Vea la p?gina de manual
   `sio(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sio&sektion=4>`__
   para m?s detalles.

   Si las banderas no fueron activadas, necesita correr UserConfig (en
   una consola diferente) o recompilar el kernel.

#. Cree ``boot.config`` en el directorio ra?z de la partici?n ``a`` del
   disco de arranque.

   Este fichero instruir? al c?digo del bloque de arranque como le
   gustar?a arrancar el sistema. Para activar la consola serie, necesita
   una o m?s de las siguientes opciones— si quiere opciones m?ltiples
   incl?yalas todas en la misma l?nea:

   .. raw:: html

      <div class="variablelist">

   ``-h``
       Cambia entre consola interna y serie. Puede usar esto para
       cambiar los dispositivos de consola. Por ejemplo, si arranca
       desde la consola interna (video), puede utilizar ``-h`` para
       dirigir el cargador de arranque y el kernel a que usen el puerto
       serie como su dispositivo de consola. Alternativamente, si
       arranca desde el puerto serie, puede utilizar ``-h`` para decirle
       al cargador de arranque y al kernel que usen el video como
       consola.

   ``-D``
       Cambia entre configuraci?n de consola simple y dual. En la
       configuraci?n simple la consola ser? ya sea la consola interna
       (video) o el puerto serie, dependiendo del estado de la opci?n
       ``-h`` de arriba. En la configuraci?n de consola dual, el video y
       el puerto serie se convertir?n en la consola al mismo tiempo, sin
       importar del estado de la opci?n ``-h``. De todas maneras, note
       que la configuraci?n de consola dual toma efecto solamente
       mientras el bloque de arranca est? corriendo. Una vez que el
       cargador de arranque toma el control, la consola especificada por
       la opci?n ``-h`` se convierte en la ?nica consola.

   ``-P``
       Hace que el bloque de arranque busque el teclado. Si no se
       encuentra un teclado, la opci?n ``-D`` y ``-h`` son activadas
       autom?tivamente.

       .. raw:: html

          <div class="note" xmlns="">

       Nota:
       ~~~~~

       Debido a problemas de espacio en la versi?n actual del bloque de
       arranque, la opci?n ``-P`` es capaz de detectar unicamente
       teclados extendidos. Teclados con menos de 101 teclas (y carentes
       de teclas F11 y F12) no pueden ser detectados. Algunos teclados
       en laptops puede que no sean correctamente encontrados debido a
       esta limitaci?n. Si este es el caso con su sistema, debe
       abandonar el uso de la opci?n ``-P``. Desafortun?damente no hay
       una soluci?n para este problema.

       .. raw:: html

          </div>

   .. raw:: html

      </div>

   Utilice ya sea la opci?n ``-P`` para seleccionar la consola
   autom?ticamente, o la opci?n ``-h`` para activar la consola serie.

   Puede incluir otras opciones descritas en
   `boot(8) <http://www.FreeBSD.org/cgi/man.cgi?query=boot&sektion=8>`__
   tambi?n.

   Las opciones, excepto por ``-P``, ser?n pasadas al cargador de
   arranque (``/boot/loader``). El cargador de arranque determinar? si
   el video interno o el puerto serie deber?a convertirse en la consola
   examinando el estado de la opci?n ``-h`` solamente. Esto significa
   que si especifica la opci?n ``-D`` pero no la opci?n ``-h`` en
   ``/boot.config``, puede utilizar el puerto serie como consola
   solamente durante el bloque de arranque; el cargador de arranque
   usar? el video interno como consola.

#. Arranque la m?quina.

   Cuando inicia su equipo FreeBSD, los bloques de arranque mostrar?n
   los contenidos de ``/boot.config`` a la consola. Por ejemplo:

   .. code:: screen

       /boot.config: -P
       Keyboard: no

   La segunda l?nea aparece solamente si pone ``-P`` en ``/boot.config``
   e indica la presencia/ausencia del teclado. Estos mensajes van a la
   consola serie o a la interna, o a ambas, dependiendo de la opci?n en
   ``/boot.config``.

   .. raw:: html

      <div class="informaltable">

   +----------------------------+---------------------------+
   | Opciones                   | Mensaje va a              |
   +============================+===========================+
   | ninguna                    | consola interna           |
   +----------------------------+---------------------------+
   | ``-h``                     | consola serie             |
   +----------------------------+---------------------------+
   | ``-D``                     | consola serie e interna   |
   +----------------------------+---------------------------+
   | ``-Dh``                    | consola serie e interna   |
   +----------------------------+---------------------------+
   | ``-P``, teclado presente   | consola interna           |
   +----------------------------+---------------------------+
   | ``-P``, teclado ausente    | consola serie             |
   +----------------------------+---------------------------+

   .. raw:: html

      </div>

   Despues de los mensajes de arriba, existir? una pausa peque?a antes
   que los bloques de arranque continuen cargando el cargador de
   arranque y antes de que cualquier mensaje posterior sea impreso en la
   consola. Bajo ciertas circunstancias, no necesita interrumpir los
   bloques de arranque, pero tal vez quiera hacerlo para asegurarse que
   las cosas est?n configuradas corr?ctamente.

   Presione cualquier tecla, diferente a Enter, en la consola para
   interrumpir el proceso de arranque. Los bloques de arranque entonces
   esperar?n una entrada para determinar como continuar. Debe ver algo
   como esto:

   .. code:: screen

       >> FreeBSD/i386 BOOT
       Default: 0:ad(0,a)/boot/loader
       boot:

   Verifique que el mensaje de arriba aparece en la consola serie o en
   la interna o en ambas, de acuerdo a las opciones que puso en
   ``/boot.config``. Si el mensaje aparece en la consola correcta,
   presione Enter para continuar el proceso de arranque.

   Si quiere usar la consola serie pero no ve el prompt en la terminal
   serie, algo est? mal con su configuraci?n. Mientras tanto, entre
   ``-h`` y presione Enter/Return (si es posible) para decirle al bloque
   de arranque (y entonces al cargador de arranque y al kernel) que
   elija el puerto serie como consola. Una vez que el sistema arranque,
   regrese y revise que fu? lo que estuvo mal.

.. raw:: html

   </div>

Despues que el cargador de arranque ha cargado y usted se encuentra en
la tercera etapa del proceso de arranque todav?a puede cambiar entre la
consola interna y la consola serie activando las variables de entorno
apropiadas en el cargador de arranque. Vea `Secci?n?24.6.6, “Cambiando
la consola desde el cargador de
arranque” <serialconsole-setup.html#serialconsole-loader>`__.

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

24.6.4. Resumen
~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

aqu? est? el resumen de varias configuraciones discutidas en esta
secci?n y la consola seleccionada eventualmente.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

24.6.4.1. Caso 1: Activ? las banderas a 0x10 para ``sio0``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. code:: programlisting

    device sio0 at isa? port IO_COM1 flags 0x10 irq 4

.. raw:: html

   <div class="informaltable">

+----------------------------+---------------------------------------+----------------------------------------+---------------------+
| Opciones en /boot.config   | Consola durante bloques de arranque   | Consola durante cargador de arranque   | Consola en kernel   |
+============================+=======================================+========================================+=====================+
| ninguna                    | interna                               | interna                                | interna             |
+----------------------------+---------------------------------------+----------------------------------------+---------------------+
| ``-h``                     | serie                                 | serie                                  | serie               |
+----------------------------+---------------------------------------+----------------------------------------+---------------------+
| ``-D``                     | serie e interna                       | interna                                | interna             |
+----------------------------+---------------------------------------+----------------------------------------+---------------------+
| ``-Dh``                    | serie e interna                       | serie                                  | serie               |
+----------------------------+---------------------------------------+----------------------------------------+---------------------+
| ``-P``, teclado presente   | interna                               | interna                                | interna             |
+----------------------------+---------------------------------------+----------------------------------------+---------------------+
| ``-P``, teclado ausente    | serie e interna                       | serie                                  | serie               |
+----------------------------+---------------------------------------+----------------------------------------+---------------------+

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

24.6.4.2. Caso 2: Activ? las banderas a 0x30 para sio0
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. code:: programlisting

    device sio0 at isa? port IO_COM1 flags 0x30 irq 4

.. raw:: html

   <div class="informaltable">

+----------------------------+---------------------------------------+----------------------------------------+---------------------+
| Opciones en /boot.config   | Consola durante bloques de arranque   | Consola durante cargador de arranque   | Consola en kernel   |
+============================+=======================================+========================================+=====================+
| ninguna                    | interna                               | interna                                | serie               |
+----------------------------+---------------------------------------+----------------------------------------+---------------------+
| ``-h``                     | serie                                 | serie                                  | serie               |
+----------------------------+---------------------------------------+----------------------------------------+---------------------+
| ``-D``                     | serie e interna                       | interna                                | serie               |
+----------------------------+---------------------------------------+----------------------------------------+---------------------+
| ``-Dh``                    | serie e interna                       | serie                                  | serie               |
+----------------------------+---------------------------------------+----------------------------------------+---------------------+
| ``-P``, teclado presente   | interna                               | interna                                | serie               |
+----------------------------+---------------------------------------+----------------------------------------+---------------------+
| ``-P``, teclado ausente    | serie e interna                       | serie                                  | serie               |
+----------------------------+---------------------------------------+----------------------------------------+---------------------+

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

24.6.5. Consejos para la consola serie
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

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

24.6.5.1. Configurando un velocidad de puerto serie m?s r?pida
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Por omisi?n, la configuraci?n del puerto serie es: 9600 baud, 8 bits,
sin paridad, y 1 bit de parada. Si desea cambiar la velocidad, necesita
recompilar al menos los bloques de arranque. Agregue la siguiente l?nea
a ``/etc/make.conf`` y compile nuevos bloques de arranque:

.. code:: programlisting

    BOOT_COMCONSOLE_SPEED=19200

Vea `Secci?n?24.6.5.2, “Usando puertos serie para consola diferentes a
``sio0``\ ” <serialconsole-setup.html#serialconsole-com2>`__ para
instrucciones detalladas sonre construir e instalar nuevos bloques de
arranque.

Si la consola serie est? configurada de alguna otra manera que
arrancando con ``-h``, o si la consola serie usada por el kernel es
diferente de la usada por los bloques de arranque, entonces tambi?n debe
agregar la siguiente opci?n al fichero de configuraci?n del kernel y
compilar un nuevo kernel:

.. code:: programlisting

    options CONSPEED=19200

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

24.6.5.2. Usando puertos serie para consola diferentes a ``sio0``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Utilizar un puerto serie diferente a ``sio0`` como consola requiere
cierta recompilaci?n. Si quiere usar otro puerto serie por la raz?n que
sea, recompile los bloques de arranque, el cargador de arranque y el
kernel como sigue.

.. raw:: html

   <div class="procedure">

#. Consiga las fuentes del kernel. (Vea `Cap?tulo?23, *Lo ?ltimo de lo
   ?ltimo* <cutting-edge.html>`__)

#. Edite ``/etc/make.conf`` y ponga ``BOOT_COMCONSOLE_PORT`` a la
   direcci?n del puerto que quiera usar (0x3F8, 0x2F8, 0x3E8 o 0x2E8).
   Solamente de ``sio0`` hasta ``sio3`` (``COM1`` hasta ``COM4``) pueden
   usarse; tarjetas multipuertos serie no funcionar?n. No se necesita
   especificar interrupci?n.

#. Cree un fichero personalizado de configuraci?n de kernel y agrege las
   banderas apropiadas para el puerto serie que desee utilizar. Por
   ejemplo, si desea hacer de ``sio1`` (``COM2``) la consola:

   .. code:: programlisting

       device sio1 at isa? port IO_COM2 flags 0x10 irq 3

   o

   .. code:: programlisting

       device sio1 at isa? port IO_COM2 flags 0x30 irq 3

   Las banderas de consola para otros puertos serie no deben activarse.

#. Recompile e instale los bloques de arranque y el cargador de
   arranque:

   .. code:: screen

       # cd /sys/boot
       # make clean
       # make
       # make install

#. Reconstruya e instale el kernel.

#. Escriba los bloques de arranque al disco de arranque con
   `disklabel(8) <http://www.FreeBSD.org/cgi/man.cgi?query=disklabel&sektion=8>`__
   y arranque desde el nuevo kernel.

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

24.6.5.3. Accesando DDB Debugger desde la l?nea serie
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Si desea entrar al modo kernel debugger desde una consola serie (?til
para diagn?sticos remotos, !pero tambi?n peligroso si genera un BREAK
ileg?timo en el puerto serie!) entonces debe compilar con las siguientes
opciones:

.. code:: programlisting

    options BREAK_TO_DEBUGGER
    options DDB

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

24.6.5.4. Obteniendo un prompt de login en la consola serie
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Aunque esto no es requerido, tal vez quiera obtener un prompt de *login*
a trav?s de una l?nea serie, ahora que puede ver los mensajes de
arranque y puede entrar a una sesi?n en modo kernel debug a trav?s de la
consola serie. Aqu? est? como hacerlo.

Abra el fichero ``/etc/ttys`` con un editor y localice las l?neas:

.. code:: programlisting

    ttyd0 "/usr/libexec/getty std.9600" unknown off secure
    ttyd1 "/usr/libexec/getty std.9600" unknown off secure
    ttyd2 "/usr/libexec/getty std.9600" unknown off secure
    ttyd3 "/usr/libexec/getty std.9600" unknown off secure

``ttyd0`` hasta ``ttyd3`` corresponde a ``COM1`` hasta ``COM4``. Cambie
``off`` a ``on`` para el puerto deseado. Si ha cambiado la velocidad del
puerto serie, necesita cambiar ``std.9600`` para que concuerde con los
par?metros actuales, ej. ``std.19200``.

Tal vez tambien desee cambiar el tipo de terminal de ``unknown`` al tipo
actual de su terminal serie.

Despues de editar el fichero, debe hacer un ``kill -HUP 1`` para que
este cambio surta efecto.

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

24.6.6. Cambiando la consola desde el cargador de arranque
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Secciones anteriores describieron como instalar la consola serie
manipulando el bloque de arranque. Esta secci?n muestra que puede
especificar la consola especificando algunos comandos y variables de
entorno en el cargador de arranque. Como el cargador de arranque es
invocado en la tercera etapa del proceso de arranque, despues del bloque
de arranque, las propiedades en el cargador de arranque sobreescribir?n
las del bloque de arranque.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

24.6.6.1. Instalando la consola serie
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Puede facilmente especificarle al cargador de arranque y al kernel que
utilicen la consola serie escribiendo solamente una l?nea en
``/boot/loader.rc``:

.. code:: programlisting

    set console="comconsole"

Esto tendr? efecto sin importar las opciones del bloque de arranque
discutidas en la secci?n previa.

Es mejor que ponga la l?nea de arriba como la primera l?nea en
``/boot/loader.rc`` para ver los mensajes de arranque en la consola
serie tan pronto como sea posible.

De igual manera, puede especificar la consola interna como:

.. code:: programlisting

    set console="vidconsole"

Si no activa la variable de entorno ``console``, el cargador de
arranque, y por consecuencia el kernel, utilizar?n cualquier consola que
est? indicada por la opci?n ``-h`` en el bloque de arranque.

En versiones 3.2 o posteriores, puede especificar la consola en
``/boot/loader.conf.local`` o ``/boot/loader.conf``, en lugar de
``/boot/loader.rc``. En este m?todo su ``/boot/loader.rc`` debe verse
como:

.. code:: programlisting

    include /boot/loader.4th
    start

Entonces, puede crear ``/boot/loader.conf.local`` y ponerle la siguiente
l?nea.

.. code:: programlisting

    console=comconsole

o

.. code:: programlisting

    console=vidconsole

Vea
`loader.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=loader.conf&sektion=5>`__
para mayor informaci?n.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Hasta el momento, el cargador de arranque no tiene una opci?n
equivalente a la opci?n ``-P`` del bloque de arranque, y no existe una
manera de seleccionar autom?ticamente la consola interna y la consola
serie basandose en la presencia del teclado.

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

24.6.6.2. Utilizando un puerto serie para la consola diferente a ``sio0``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Necesita recompilar el cargador de arranque para usar un puerto serie
diferente a ``sio0`` para la consola serie. Siga el procedimiento
descrito en `Secci?n?24.6.5.2, “Usando puertos serie para consola
diferentes a
``sio0``\ ” <serialconsole-setup.html#serialconsole-com2>`__.

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

24.6.7. Advertencias
~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

La idea aqu? es permitir a las personas configurar servidores dedicados
que no requieran hardware de gr?ficos o teclados conectados.
Desafortun?damente, mientras la mayor?a de los sistemas le permitir?n
arrancar sin un teclado, existen bastantes que no le permitir?n arrancar
sin un adaptador de gr?ficos. M?quinas con BIOS AMI pueden configurarse
para arrancar sin adaptadores de gr?ficos instalados cambiando
simplemente la opci?n “graphics adapter” en la configuraci?n del CMOS a
“Not installed.”

De cualquier manera, muchas m?quinas no soportan esta opci?n y se
negar?n a arrancar si no tiene alg?n hardware de gr?ficos instalado en
el sistema. Con estas m?quinas, debe dejar alg?n tipo de tarjeta gr?fica
instalada, (incluso si solamente es una tarjeta mono barata) aunque no
tendr? que conectarle un monitor. Tambi?n puede tratar instalando un
BIOS AMI.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------+--------------------------------+----------------------------------------+
| `Anterior <dialout.html>`__?   | `Subir <serialcomms.html>`__   | ?\ `Siguiente <ppp-and-slip.html>`__   |
+--------------------------------+--------------------------------+----------------------------------------+
| 24.5. Servicio dial-out?       | `Inicio <index.html>`__        | ?Cap?tulo 25. PPP y SLIP               |
+--------------------------------+--------------------------------+----------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
