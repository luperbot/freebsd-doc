==========================================
7.2. Configuraci?n de la tarjeta de sonido
==========================================

.. raw:: html

   <div class="navheader">

7.2. Configuraci?n de la tarjeta de sonido
`Anterior <multimedia.html>`__?
Cap?tulo 7. Multimedia
?\ `Siguiente <sound-mp3.html>`__

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

7.2. Configuraci?n de la tarjeta de sonido
------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Escrito por Moses Moore.

.. raw:: html

   </div>

.. raw:: html

   <div>

Ampliado para FreeBSD?5.X por Marc Fonvieille.

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

7.2.1. Configuraci?n del sistema
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Antes de nada tendr? que saber a ciencia cierta el modelo de tarjeta que
tiene, qu? chip utiliza y si es PCI o ISA. FreeBSD admite una amplia
variedad de tarjetas, tanto PCI como ISA. Consulte la lista de
dispositivos de sonido que puede usar en FreeBSD en las `Hardware
Notes <http://www.FreeBSD.org/releases/10.1R/hardware.html>`__. Las
?Hardware Notes? le dir?n tambi?n qu? controlador es el que hace
funcionar su tarjeta.

Para poder usar su dispositivo de sonido en FreeBSD tiene que cargar el
controlador de dispositivo adecuado, cosa que puede hacerse de dos
maneras. La forma m?s f?cil es cargar el m?dulo del kernel
correspondiente a su tarjeta de sonido mediante
`kldload(8) <http://www.FreeBSD.org/cgi/man.cgi?query=kldload&sektion=8>`__.
Puede hacerlo en su shell con la siguiente orden

.. code:: screen

    # kldload snd_emu10k1

o a?adiendo la l?nea apropiada al fichero ``/boot/loader.conf``:

.. code:: programlisting

    snd_emu10k1_load="YES"

Ambos ejemplos son para una tarjeta de sonido Creative SoundBlaster?
Live!. Encontrar? una lista de m?dulos de sonido que puede cargar del
mismo modo en ``/boot/defaults/loader.conf``. Si no est? del todo seguro
sobre el controlador que debe usar pruebe con el m?dulo ``snd_driver``:

.. code:: screen

    # kldload snd_driver

Se trata de un ?metacontrolador? que carga en memoria todos los
controladores m?s habituales. De este modo acelerar? notablemente el
proceso de detectar cu?l es el controlador perfecto para su hardware.
Tambi?n puede cargar todos los controladores de sonido desde
``/boot/loader.conf``.

Si quiere saber qu? controlador se corresponde con su tarjeta de sonido
una vez cargado el ?metadriver? ``snd_driver`` debe comprobar el
contenido de ``/dev/sndstat`` mediante la orden ``cat /dev/sndstat``.

El segundo m?todo es compilar de forma est?tica el soporte para su
tarjeta de sonido dentro de un kernel personalizado. En la siguiente
secci?n encontrar? la informaci?n necesaria para a?adir a su kernel el
soporte que necesita su hardware. Para m?s informaci?n sobre la
compilaci?n de un kernel consulte el `Cap?tulo?8, *Configuraci?n del
kernel de FreeBSD* <kernelconfig.html>`__.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

7.2.1.1. Configuraci?n de un kernel personalizado con soporte de sonido
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Lo primero que hay que hacer es a?adir el controlador del ?framework? de
sonido
`sound(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sound&sektion=4>`__
al kernel; tendr? que a?adir la siguiente l?nea a su fichero de
configuraci?n del kernel:

.. code:: programlisting

    device sound

Una vez hecho esto tiene que a?adir el soporte para su tarjeta de
sonido. Evidentemente tendr? que saber exactamente qu? controlador es el
que hace funcionar su tarjeta. Consulte la lista de dispositivos de
sonido soportados que encontrar? en las `Hardware
Notes <http://www.FreeBSD.org/releases/10.1R/hardware.html>`__ y elija
el controlador perfecto para su tarjeta. Por ejemplo una una tarjeta de
sonido Creative SoundBlaster? Live! usar? el controlador
`snd\_emu10k1(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snd_emu10k1&sektion=4>`__.
Siguiendo con el ejemplo, si queremos a?adir soporte para esta tarjeta
agregaremos lo siguiente:

.. code:: programlisting

    device snd_emu10k1

Por favor, lea la p?gina de manual del controlador si tiene dudas con la
sintaxis. La sintaxis espec?fica para la configuraci?n en el kernel de
cada tarjeta de sonido soportada existente puede encontrarse tambi?n en
``/usr/src/sys/conf/NOTES``.

Las tarjetas ISA no PnP pueden requerir que se le facilite al kernel la
informaci?n de la configuraci?n de la tarjeta (IRQ, puerto de E/S, etc).
Esto se hace modificando el fichero ``/boot/device.hints``. Durante el
proceso de arranque
`loader(8) <http://www.FreeBSD.org/cgi/man.cgi?query=loader&sektion=8>`__
leer? este fichero y le pasar? los par?metros al kernel. Veamos un
ejemplo: una vieja tarjeta Creative SoundBlaster? 16 ISA no PnP
utilizar? el controlador
`snd\_sbc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snd_sbc&sektion=4>`__
junto con ``snd_sb16``. En el caso de esta tarjeta habr? que a?adir las
siguientes l?neas al fichero de configuraci?n del kernel

.. code:: programlisting

    device snd_sbc
    device snd_sb16

y a?adir lo siguiente a ``/boot/device.hints``:

.. code:: programlisting

    hint.sbc.0.at="isa"
    hint.sbc.0.port="0x220"
    hint.sbc.0.irq="5"
    hint.sbc.0.drq="1"
    hint.sbc.0.flags="0x15"

La tarjeta del ejemplo usa el puerto de E/S ``0x220`` I/O port y la IRQ
``5``.

La sintaxis a utilizar en ``/boot/device.hints`` se explica en la p?gina
de manual de
`sound(4) <http://www.FreeBSD.org/cgi/man.cgi?query=sound&sektion=4>`__
y en la del controlador en cuesti?n.

En el ejemplo se muestran los par?metros por omisi?n. En ciertos casos
habr? que usar otra IRQ o usar otros par?metros para hacer funcionar la
tarjeta de sonido. Consulte la p?gina de manual de
`snd\_sbc(4) <http://www.FreeBSD.org/cgi/man.cgi?query=snd_sbc&sektion=4>`__
para m?s informaci?n sobre esta tarjeta.

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

7.2.2. C?mo probar su tarjeta de sonido
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Una vez que haya reiniciado con su kernel personalizado, o tras cargar
el m?lo del kernel necesario la tarjeta de sonido aparecer? en el b?fer
de mensajes del sistema
(`dmesg(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dmesg&sektion=8>`__);
deber? ser algo muy parecido a esto:

.. code:: screen

    pcm0: <Intel ICH3 (82801CA)> port 0xdc80-0xdcbf,0xd800-0xd8ff irq 5 at device 31.5 on pci0
    pcm0: [GIANT-LOCKED]
    pcm0: <Cirrus Logic CS4205 AC97 Codec>

Puede comprobar el estado de la tarjeta de sonido en el fichero
``/dev/sndstat``:

.. code:: screen

    # cat /dev/sndstat
    FreeBSD Audio Driver (newpcm)
    Installed devices:
    pcm0: <Intel ICH3 (82801CA)> at io 0xd800, 0xdc80 irq 5 bufsz 16384
    kld snd_ich (1p/2r/0v channels duplex default)

El resultado en su sistema seguramente ser? distinto. Si no aparecen
dispositivos ``pcm`` revise todo el proceso a ver d?nde est? el error.
Revise su fichero de configuraci?n del kernel nuevamente y compruebe que
eligi? el controlador de dispositivo adecuado. Tiene una lista de
problemas habituales en la `Secci?n?7.2.2.1, “Problemas
habituales” <sound-setup.html#troubleshooting>`__.

Si todo ha ido bien ya tiene una tarjeta de sonido funcionando en su
sistema. Si los pins de salida de sonido de su CD-ROM o DVD-ROM est?n
colocados correctamente puede poner un CD en la unidad y reproducirlo
con
`cdcontrol(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cdcontrol&sektion=1>`__.

.. code:: screen

    % cdcontrol -f /dev/acd0 play 1

Hay muchas aplicaciones como
`audio/workman <http://www.freebsd.org/cgi/url.cgi?ports/audio/workman/pkg-descr>`__
que le ofrecer?n un interfaz m?s amigable. Si quiere escuchar ficheros
MP3 puede instalar, por ejemplo,
`audio/mpg123 <http://www.freebsd.org/cgi/url.cgi?ports/audio/mpg123/pkg-descr>`__.

Hay otra via a?n m?s r?pida de probar su tarjeta de sonido. Env?e datos
a to ``/dev/dsp`` del siguiente modo:

.. code:: screen

    % cat fichero > /dev/dsp

donde ``fichero`` puede ser cualquier fichero. Esta orden producir?
ruido, lo que confirmar? que la tarjeta de sonido funciona.

Puede manejar los niveles de la tarjeta de sonido con
`mixer(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mixer&sektion=8>`__.
Tiene todos los detalles en la p?gina de manual de
`mixer(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mixer&sektion=8>`__.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

7.2.2.1. Problemas habituales
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+--------------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Error                                      | Solution                                                                                                                                                                                |
+============================================+=========================================================================================================================================================================================+
| sb\_dspwr(XX) timed out                    | El puerto de E/S no ha sido configurado correctamente.                                                                                                                                  |
+--------------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| bad irq XX                                 | No ha elegido correctamente la IRQ. Aseg?rese de que la IRQ que ha elegido y la IRQ del sonido son la misma.                                                                            |
+--------------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| xxx: gus pcm not attached, out of memory   | No queda memoria suficiente en el sistema para poder usar el dispositivo.                                                                                                               |
+--------------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| xxx: can't open /dev/dsp!                  | Compruebe si hay otra aplicaci?n utilizando (y por tanto ocupando) el dispositivo. Escriba ``fstat | grep dsp``. Los sospechosos habituales son esound y el sistema de sonido de KDE.   |
+--------------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

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

7.2.3. C?mo utilizar m?ltiples fuentes de sonido
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div>

Escrito por Munish Chopra.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Disponer de m?ltiples fuentes de sonido puede ser muy ?til, por ejemplo
cuando esound o artsd no permiten compartir el dispositivo de sonido con
otra aplicaci?n.

FreeBSD permite hacerlo gracias a los *Virtual Sound Channels*
(``canales virtuales de sonido``), que se activan mediante
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__.
Los canales virtuales permiten multiplexar la reproducci?n de sonido de
su tarjeta mezclando el sonido en el kernel.

El n?mero de canales virtuales se configura utilizando dos sysctl; como
``root`` escriba lo siguiente:

.. code:: screen

    # sysctl hw.snd.pcm0.vchans=4
    # sysctl hw.snd.maxautovchans=4

En el ejemplo anterior se han creado cuatro canales virtuales, una
cantidad muy razonable para el uso normal. ``hw.snd.pcm0.vchans`` es el
n?mero de canales virtuales de que dispone ``pcm0``; puede configurarlo
en cuanto el dispositivo sea reconocido por el sistema.
``hw.snd.maxautovchans`` es el n?mero de canales virtuales que se le
asignan a un nuevo dispositivo de audio cuando se conecta al sistema
mediante
`kldload(8) <http://www.FreeBSD.org/cgi/man.cgi?query=kldload&sektion=8>`__.
Puesto que el m?dulo ``pcm`` puede cargarse independientemente de los
controladores de hardware ``hw.snd.maxautovchans`` puede almacenar
cu?ntos canales virtuales tienen asignados los dispositivos que se vayan
conectando al sistema.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

No es posible modificar el n?mero de canales virtuales de un dispositivo
que est? en marcha. Cierre antes todos los programas que est?n
utilizando el dispositivo, como reproductores de m?sica o d?mons de
sonido.

.. raw:: html

   </div>

Si no usa
`devfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=devfs&sektion=5>`__
tendr? que configurar sus aplicaciones para que apunten a
``/dev/dsp0``.\ *``x``*, donde *``x``* es un n?mero entre 0 y 3 si
``hw.snd.pcm.0.vchans`` tiene un valor de 4 como en el ejemplo anterior.
Si se estuviera usando
`devfs(5) <http://www.FreeBSD.org/cgi/man.cgi?query=devfs&sektion=5>`__
en el ejemplo anterior cualquier programa que pidiera ``/dev/dsp0``
ser?a atendido de forma totalmente transparente.

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

7.2.4. Asignaci?n a los canales de mezcla de valores por omisi?n
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div>

Escrito por Josef El-Rayes.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Los valores por defecto de los distintos canales de mezcla est?n fijados
en el c?digo del controlador
`pcm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pcm&sektion=4>`__. Hay
distintas aplicaciones y d?mons que le permitir?n asignar valores al
mezclador y que permanezcan entre uso y uso, pero no es una soluci?n
demasiado limpia. Puede asignar valores por omisi?n a las mezclas a
nivel de controlador definiendo los valores apropiados en
``/boot/device.hints``. Veamos un ejemplo:

.. code:: programlisting

    hint.pcm.0.vol="50"

Esto asignar? al canal de volumen un valor por omisi?n de 50 al cargar
el m?dulo
`pcm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=pcm&sektion=4>`__.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------+-------------------------------+-------------------------------------+
| `Anterior <multimedia.html>`__?   | `Subir <multimedia.html>`__   | ?\ `Siguiente <sound-mp3.html>`__   |
+-----------------------------------+-------------------------------+-------------------------------------+
| Cap?tulo 7. Multimedia?           | `Inicio <index.html>`__       | ?7.3. Sonido MP3                    |
+-----------------------------------+-------------------------------+-------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
