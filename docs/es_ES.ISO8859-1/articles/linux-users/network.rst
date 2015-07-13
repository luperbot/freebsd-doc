==========================
5. Configuraci?n de la red
==========================

.. raw:: html

   <div class="navheader">

5. Configuraci?n de la red
`Anterior <startup.html>`__?
?
?\ `Siguiente <firewall.html>`__

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

   <div class="navfooter">

--------------

+--------------------------------------------------------------------+---------------------------+------------------------------------+
| `Anterior <startup.html>`__?                                       | ?                         | ?\ `Siguiente <firewall.html>`__   |
+--------------------------------------------------------------------+---------------------------+------------------------------------+
| 4. Arranque del sistema: ?D?nde est?n los niveles de ejecuci?n??   | `Inicio <index.html>`__   | ?6. Cortafuegos                    |
+--------------------------------------------------------------------+---------------------------+------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
