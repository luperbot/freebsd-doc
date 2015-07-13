=======================================
8.3. Inventario de hardware del sistema
=======================================

.. raw:: html

   <div class="navheader">

8.3. Inventario de hardware del sistema
`Anterior <ch08s02.html>`__?
Cap?tulo 8. Configuraci?n del kernel de FreeBSD
?\ `Siguiente <kernelconfig-modules.html>`__

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

8.3. Inventario de hardware del sistema
---------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Escrito por Tom Rhodes.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Antes de aventurarnos en la configuraci?n del kernel nunca est? de m?s
disponer de un inventario completo del hardware que hay en la m?quina.
En los casos en los que FreeBSD no es el sistema operativo principal de
la m?quina puede conseguir el inventario consultando la configuraci?n de
otro sistema operativo. Por ejemplo, el Gestor de dispositivos de
Microsoft? suele contener informaci?n importante sobre los dispositivos
que haya en la m?quina. El Gestor de dispositivos est? en el panel de
control.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Algunas versiones de Microsoft??Windows? tienen un icono de Sistema con
forma de pantalla desde el que se puede acceder al Gestor de
dispositivos.

.. raw:: html

   </div>

Si no hay otro sistema operativo en la m?quina el administrador tendr?
que conseguir la informaci?n por su cuenta. Una forma de hacerlo es
mediante
`dmesg(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dmesg&sektion=8>`__
y `man(1) <http://www.FreeBSD.org/cgi/man.cgi?query=man&sektion=1>`__.
La mayor?a de los controladores de dispositivo que hay en FreeBSD tienen
una p?gina de manual, que suele incluir una lista del hardware que puede
hacer funcionar. En la prueba del sistema durante el arranque va
apareciendo una lista del harware que hay en la m?quina. Por ejemplo,
las siguientes l?neas indican que el controlador ``psm`` ha encontrado
un rat?n:

.. code:: programlisting

    psm0: <PS/2 Mouse> irq 12 on atkbdc0
    psm0: [GIANT-LOCKED]
    psm0: [ITHREAD]
    psm0: model Generic PS/2 mouse, device ID 0

Puede a?adir este controlador al fichero de configuraci?n de su kernel
personalizado o cargarlo utilizando
`loader.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=loader.conf&sektion=5>`__.

A veces los datos que muestra ``dmesg`` solamente muestran mensajes del
sistema en lugar de la salida de la prueba de arranque. En esos casos
puede ver la verdadera salida de ``dmesg`` en el fichero
``/var/run/dmesg.boot``.

Otro m?todo para identificar el hardware del sistema es usar
`pciconf(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pciconf&sektion=8>`__,
que tiene una salida mucho m?s verbosa. Veamos un ejemplo:

.. code:: programlisting

    ath0@pci0:3:0:0:        class=0x020000 card=0x058a1014 chip=0x1014168c rev=0x01 hdr=0x00
        vendor     = 'Atheros Communications Inc.'
        device     = 'AR5212 Atheros AR5212 802.11abg wireless'
        class      = network
        subclass   = ethernet

Este fragmento, obtenido con ``pciconf -lv`` muestra c?mo el controlador
``ath`` ha encontrado un dispositivo Ethernet inal?mbrico. Escriba
``man ath`` para consultar la p?gina de manual de
`ath(4) <http://www.FreeBSD.org/cgi/man.cgi?query=ath&sektion=4>`__.

La opci?n ``-k`` de
`man(1) <http://www.FreeBSD.org/cgi/man.cgi?query=man&sektion=1>`__ le
suministrar? valiosa informaci?n. Sigamos con el ejemplo anterior:

.. code:: screen

    # man -k Atheros

Con esto obtendremos una lista de p?ginas de manual que contienen esa
palabra en particular:

.. code:: programlisting

    ath(4)                   - Atheros IEEE 802.11 wireless network driver
    ath_hal(4)               - Atheros Hardware Access Layer (HAL)

Una vez que tenemos nuestra flamante lista de hardware del sistema el
proceso de compilar un kernel personalizado deber?a parecer un poco
menos inquietante.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------------------------------+---------------------------------+---------------------------------------------------------+
| `Anterior <ch08s02.html>`__?                                    | `Subir <kernelconfig.html>`__   | ?\ `Siguiente <kernelconfig-modules.html>`__            |
+-----------------------------------------------------------------+---------------------------------+---------------------------------------------------------+
| 8.2. ?Qu? razones hay para compilar un kernel personalizado??   | `Inicio <index.html>`__         | ?8.4. Controladores del kernel, subsistemas y m?dulos   |
+-----------------------------------------------------------------+---------------------------------+---------------------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
