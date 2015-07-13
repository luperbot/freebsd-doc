===============================
29.15. L?nea IP paralela (PLIP)
===============================

.. raw:: html

   <div class="navheader">

29.15. L?nea IP paralela (PLIP)
`Anterior <network-inetd.html>`__?
Cap?tulo 29. Networking avanzado
?\ `Siguiente <network-ipv6.html>`__

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

29.15. L?nea IP paralela (PLIP)
-------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

PLIP nos permite configurar TCP/IP a trav?s del puerto paralelo. Es ?til
para conectar m?quinas que no poseen tarjetas de red, o para instalar
FreeBSD en ciertos viejos modelos de port?tiles. En esta secci?n se
explica lo siguiente:

.. raw:: html

   <div class="itemizedlist">

-  Construcci?n de un cable paralelo (laplink).

-  Conexi?n de dos computadores utilizando PLIP.

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

29.15.1. Construcci?n de un cable paralelo
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Se puede comprar un cable paralelo en cualquier tienda de componentes
inform?ticos. No obstante si no es posible comprarlo o simplemente
queremos saber c?mo hacerlo nosotros mismos, en la siguiente tabla
mostramos como hacer un cable de impresora paralelo.

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Tabla 29.1. Cableado de una conexi?n de cable paralelo para redes

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+----------------------------------+----------------------------------+----------------------------------+----------+----------------------------------+
| Nombre-A                         | Extremo-A                        | Extremo-B                        | Descr.   | Post/Bit                         |
+==================================+==================================+==================================+==========+==================================+
| .. raw:: html                    | .. raw:: html                    | .. raw:: html                    | Data     | .. raw:: html                    |
|                                  |                                  |                                  |          |                                  |
|    <div class="literallayout">   |    <div class="literallayout">   |    <div class="literallayout">   |          |    <div class="literallayout">   |
|                                  |                                  |                                  |          |                                  |
| | DATA0                          | | 2                              | | 15                             |          | | 0/0x01                         |
| |  -ERROR                        | |  15                            | |  2                             |          | |  1/0x08                        |
|                                  |                                  |                                  |          |                                  |
| .. raw:: html                    | .. raw:: html                    | .. raw:: html                    |          | .. raw:: html                    |
|                                  |                                  |                                  |          |                                  |
|    </div>                        |    </div>                        |    </div>                        |          |    </div>                        |
+----------------------------------+----------------------------------+----------------------------------+----------+----------------------------------+
| .. raw:: html                    | .. raw:: html                    | .. raw:: html                    | Data     | .. raw:: html                    |
|                                  |                                  |                                  |          |                                  |
|    <div class="literallayout">   |    <div class="literallayout">   |    <div class="literallayout">   |          |    <div class="literallayout">   |
|                                  |                                  |                                  |          |                                  |
| | DATA1                          | | 3                              | | 13                             |          | | 0/0x02                         |
| |  +SLCT                         | |  13                            | |  3                             |          | |  1/0x10                        |
|                                  |                                  |                                  |          |                                  |
| .. raw:: html                    | .. raw:: html                    | .. raw:: html                    |          | .. raw:: html                    |
|                                  |                                  |                                  |          |                                  |
|    </div>                        |    </div>                        |    </div>                        |          |    </div>                        |
+----------------------------------+----------------------------------+----------------------------------+----------+----------------------------------+
| .. raw:: html                    | .. raw:: html                    | .. raw:: html                    | Data     | .. raw:: html                    |
|                                  |                                  |                                  |          |                                  |
|    <div class="literallayout">   |    <div class="literallayout">   |    <div class="literallayout">   |          |    <div class="literallayout">   |
|                                  |                                  |                                  |          |                                  |
| | DATA2                          | | 4                              | | 12                             |          | | 0/0x04                         |
| |  +PE                           | |  12                            | |  4                             |          | |  1/0x20                        |
|                                  |                                  |                                  |          |                                  |
| .. raw:: html                    | .. raw:: html                    | .. raw:: html                    |          | .. raw:: html                    |
|                                  |                                  |                                  |          |                                  |
|    </div>                        |    </div>                        |    </div>                        |          |    </div>                        |
+----------------------------------+----------------------------------+----------------------------------+----------+----------------------------------+
| .. raw:: html                    | .. raw:: html                    | .. raw:: html                    | Strobe   | .. raw:: html                    |
|                                  |                                  |                                  |          |                                  |
|    <div class="literallayout">   |    <div class="literallayout">   |    <div class="literallayout">   |          |    <div class="literallayout">   |
|                                  |                                  |                                  |          |                                  |
| | DATA3                          | | 5                              | | 10                             |          | | 0/0x08                         |
| |  -ACK                          | |  10                            | |  5                             |          | |  1/0x40                        |
|                                  |                                  |                                  |          |                                  |
| .. raw:: html                    | .. raw:: html                    | .. raw:: html                    |          | .. raw:: html                    |
|                                  |                                  |                                  |          |                                  |
|    </div>                        |    </div>                        |    </div>                        |          |    </div>                        |
+----------------------------------+----------------------------------+----------------------------------+----------+----------------------------------+
| .. raw:: html                    | .. raw:: html                    | .. raw:: html                    | Data     | .. raw:: html                    |
|                                  |                                  |                                  |          |                                  |
|    <div class="literallayout">   |    <div class="literallayout">   |    <div class="literallayout">   |          |    <div class="literallayout">   |
|                                  |                                  |                                  |          |                                  |
| | DATA4                          | | 6                              | | 11                             |          | | 0/0x10                         |
| |  BUSY                          | |  11                            | |  6                             |          | |  1/0x80                        |
|                                  |                                  |                                  |          |                                  |
| .. raw:: html                    | .. raw:: html                    | .. raw:: html                    |          | .. raw:: html                    |
|                                  |                                  |                                  |          |                                  |
|    </div>                        |    </div>                        |    </div>                        |          |    </div>                        |
+----------------------------------+----------------------------------+----------------------------------+----------+----------------------------------+
| GND                              | 18-25                            | 18-25                            | GND      | -                                |
+----------------------------------+----------------------------------+----------------------------------+----------+----------------------------------+

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

29.15.2. Configuraci?n de PLIP
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

En primer lugar debemos tener en nuesras manos un cable “ laplink”. A
continuaci?n se debe comprobar que ambos sistemas poseen n?cleos con
soporte para el controlador
`lpt(4) <http://www.FreeBSD.org/cgi/man.cgi?query=lpt&sektion=4>`__:

.. code:: screen

    # grep lp /var/run/dmesg.boot
    lpt0: <Printer> on ppbus0
    lpt0: Interrupt-driven port

El puerto paralelo debe ser un puerto controlado por alguna “ irq”. En
FreeBSD?4.X se deber?a tener un l?nea como la siguiente en el fichero de
configuraci?n del kernel:

.. code:: programlisting

    device ppc0 at isa? irq 7

En FreeBSD?5.X el fichero ``/boot/device.hints`` debe contener las
siguientes l?neas:

.. code:: programlisting

    hint.ppc.0.at="isa"
    hint.ppc.0.irq="7"

A continuaci?n se debe comprobar que el fichero de configuraci?n del
n?cleo posee una l?nea con ``device plip`` o tambi?n puede comprobar si
se ha cargado el m?dulo del n?cleo ``plip.ko``. Tanto en un caso como en
el otro, cuando se ejecute
`ifconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ifconfig&sektion=8>`__
deber?a aparecer el interfaz de red paralelo. En FreeBSD?4.X se muestra
algo parecido a lo siguiente:

.. code:: screen

    # ifconfig lp0
    lp0: flags=8810<POINTOPOINT,SIMPLEX,MULTICAST> mtu 1500

y en FreeBSD?5.X:

.. code:: screen

    # ifconfig plip0
    plip0: flags=8810<POINTOPOINT,SIMPLEX,MULTICAST> mtu 1500

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

El nombre del dispositivo utilizado para la interfaz paralela es
distinto en FreeBSD?4.X (``lpX``) y en FreeBSD?5.X (``plipX``).

.. raw:: html

   </div>

Enchufe el cable “laplink” en los interfaces de ambos computadores.

Configure los par?metros de la interfaz de red en ambas m?quinas como
``root``. Por ejemplo, si queremos conectar la m?quina ``host1``
ejecutando FreeBSD?4.X con la m?quina ``host2`` que ejecuta FreeBSD?5.X:

.. code:: programlisting

                     host1 <-----> host2
    Direcci?n IP 10.0.0.1      10.0.0.2

Configure la interfaz de ``host1`` as?:

.. code:: screen

    # ifconfig lp0 10.0.0.1 10.0.0.2

Configure la interfaz de ``host2`` por medio de:

.. code:: screen

    # ifconfig plip0 10.0.0.2 10.0.0.1

Tras esto deber?a disponerse de una conexi?n totalmente funcional. Por
favor, consulte
`lp(4) <http://www.FreeBSD.org/cgi/man.cgi?query=lp&sektion=4>`__ y
`lpt(4) <http://www.FreeBSD.org/cgi/man.cgi?query=lpt&sektion=4>`__ si
quiere saber m?s.

Adem?s se debe a?adir ambas m?quinas al fichero ``/etc/hosts``:

.. code:: programlisting

    127.0.0.1               localhost.mi.dominio localhost
    10.0.0.1                host1.mi.dominio host1
    10.0.0.2                host2.mi.dominio

Para comprobar que efectivamente la conexi?n funciona se puede probar a
hacer un ping desde cada m?quina. Por ejemplo en la m?quina ``host1``:

.. code:: screen

    # ifconfig lp0
    lp0: flags=8851<UP,POINTOPOINT,RUNNING,SIMPLEX,MULTICAST> mtu 1500
            inet 10.0.0.1 --> 10.0.0.2 netmask 0xff000000
    # netstat -r
    Routing tables

    Internet:
    Destination        Gateway          Flags     Refs     Use      Netif Expire
    host2              host1              UH          0       0       lp0
    # ping -c 4 host2
    PING host2 (10.0.0.2): 56 data bytes
    64 bytes from 10.0.0.2: icmp_seq=0 ttl=255 time=2.774 ms
    64 bytes from 10.0.0.2: icmp_seq=1 ttl=255 time=2.530 ms
    64 bytes from 10.0.0.2: icmp_seq=2 ttl=255 time=2.556 ms
    64 bytes from 10.0.0.2: icmp_seq=3 ttl=255 time=2.714 ms

    --- host2 ping statistics ---
    4 packets transmitted, 4 packets received, 0% packet loss
    round-trip min/avg/max/stddev = 2.530/2.643/2.774/0.103 ms

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+----------------------------------------+----------------------------------------+
| `Anterior <network-inetd.html>`__?   | `Subir <advanced-networking.html>`__   | ?\ `Siguiente <network-ipv6.html>`__   |
+--------------------------------------+----------------------------------------+----------------------------------------+
| 29.14. El “Superservidor” inetd?     | `Inicio <index.html>`__                | ?29.16. IPv6                           |
+--------------------------------------+----------------------------------------+----------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
