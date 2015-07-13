=========================
29.17. ATM en FreeBSD?5.X
=========================

.. raw:: html

   <div class="navheader">

29.17. ATM en FreeBSD?5.X
`Anterior <network-ipv6.html>`__?
Cap?tulo 29. Networking avanzado
?\ `Siguiente <appendices.html>`__

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

29.17. ATM en FreeBSD?5.X
-------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Escrito por Harti Brandt.

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

29.17.1. Configuraci?n de IP cl?sico sobre ATM (PVCs)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

IP cl?sico sobre ATM (CLIP) es el m?todo m?s sencillo de utilizar ATM
con IP. Se puede utilizar con conexiones conmutadas (SVC) y con
conexiones permanentes (PVCs). En esta secci?n se describe c?mo
configurar una red basada en PVCs.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

29.17.1.1. Configuraciones en red mallada completa
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El primer m?todo para configurar CLIP con PVCs consiste en conectar unas
m?quinas con otras mediante circuitos PVC dedicados. Aunque la
configuraci?n parece sencilla llega a resultar imposible de manejar
cuando se posee un n?mero grande de m?quinas. El ejemplo que se muestra
a continuaci?n supone que nuestra red posee cuatro m?quinas y que cada
una se conecta a la red ATM mediante una tarjeta de red ATM. El primer
paso consiste en planificar las direcciones IP y las conexiones ATM que
se van a configurar en las m?quinas.

.. raw:: html

   <div class="informaltable">

+-------------+---------------------+
| M?quina     | Direcci?n IP        |
+=============+=====================+
| ``hostA``   | ``192.168.173.1``   |
+-------------+---------------------+
| ``hostB``   | ``192.168.173.2``   |
+-------------+---------------------+
| ``hostC``   | ``192.168.173.3``   |
+-------------+---------------------+
| ``hostD``   | ``192.168.173.4``   |
+-------------+---------------------+

.. raw:: html

   </div>

Para construir una red completamente mallada necesitamos una conexi?n
ATM entre cada par de m?quinas:

.. raw:: html

   <div class="informaltable">

+-------------------------+------------------+
| M?quinas                | Pareja VPI.VCI   |
+=========================+==================+
| ``hostA`` - ``hostB``   | 0.100            |
+-------------------------+------------------+
| ``hostA`` - ``hostC``   | 0.101            |
+-------------------------+------------------+
| ``hostA`` - ``hostD``   | 0.102            |
+-------------------------+------------------+
| ``hostB`` - ``hostC``   | 0.103            |
+-------------------------+------------------+
| ``hostB`` - ``hostD``   | 0.104            |
+-------------------------+------------------+
| ``hostC`` - ``hostD``   | 0.105            |
+-------------------------+------------------+

.. raw:: html

   </div>

Los valores VPI y VCI en cada extremo de la conexi?n pueden ser
diferentes pero por simplicidad suponemos que son iguales. A
continuaci?n necesitamos configurar las interfaces ATM en cada m?quina:

.. code:: screen

    hostA# ifconfig hatm0 192.168.173.1 up
    hostB# ifconfig hatm0 192.168.173.2 up
    hostC# ifconfig hatm0 192.168.173.3 up
    hostD# ifconfig hatm0 192.168.173.4 up

Suponiendo que la interfaz ATM es ``hatm0`` en todas las m?quinas. Ahora
necesitamos configurar los PVCs en las m?quinas (suponemos que ya se han
configurado de forma correcta en el “switch” ATM, para lo cual puede ser
necesario consultar el manual del “switch”).

.. code:: screen

    hostA# atmconfig natm add 192.168.173.2 hatm0 0 100 llc/snap ubr
    hostA# atmconfig natm add 192.168.173.3 hatm0 0 101 llc/snap ubr
    hostA# atmconfig natm add 192.168.173.4 hatm0 0 102 llc/snap ubr

    hostB# atmconfig natm add 192.168.173.1 hatm0 0 100 llc/snap ubr
    hostB# atmconfig natm add 192.168.173.3 hatm0 0 103 llc/snap ubr
    hostB# atmconfig natm add 192.168.173.4 hatm0 0 104 llc/snap ubr

    hostC# atmconfig natm add 192.168.173.1 hatm0 0 101 llc/snap ubr
    hostC# atmconfig natm add 192.168.173.2 hatm0 0 103 llc/snap ubr
    hostC# atmconfig natm add 192.168.173.4 hatm0 0 105 llc/snap ubr

    hostD# atmconfig natm add 192.168.173.1 hatm0 0 102 llc/snap ubr
    hostD# atmconfig natm add 192.168.173.2 hatm0 0 104 llc/snap ubr
    hostD# atmconfig natm add 192.168.173.3 hatm0 0 105 llc/snap ubr

Por supuesto que se pueden utilizar otras especificaciones de tr?fico
siempre y cuando las tarjetas de red las soporten. En este caso la
especificaci?n del tipo de tr?fico se completa con los par?metros del
tr?fico. Puede acceder a la ayuda de
`atmconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=atmconfig&sektion=8>`__
as?:

.. code:: screen

    # atmconfig help natm add

y por supuesto en la p?gina de manual de
`atmconfig(8) <http://www.FreeBSD.org/cgi/man.cgi?query=atmconfig&sektion=8>`__.

Se puede crear la misma configuraci?n utilizando el fichero
``/etc/rc.conf``. Para la m?quina ``hostA`` ser?a algo as?:

.. code:: programlisting

    network_interfaces="lo0 hatm0"
    ifconfig_hatm0="inet 192.168.173.1 up"
    natm_static_routes="hostB hostC hostD"
    route_hostB="192.168.173.2 hatm0 0 100 llc/snap ubr"
    route_hostC="192.168.173.3 hatm0 0 101 llc/snap ubr"
    route_hostD="192.168.173.4 hatm0 0 102 llc/snap ubr"

El estado de todas las rutas CLIP se puede obtener en todo momento con:

.. code:: screen

    hostA# atmconfig natm show

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------+----------------------------------------+--------------------------------------+
| `Anterior <network-ipv6.html>`__?   | `Subir <advanced-networking.html>`__   | ?\ `Siguiente <appendices.html>`__   |
+-------------------------------------+----------------------------------------+--------------------------------------+
| 29.16. IPv6?                        | `Inicio <index.html>`__                | ?Parte?V.?Ap?ndices                  |
+-------------------------------------+----------------------------------------+--------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
