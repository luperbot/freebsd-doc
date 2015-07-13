===============
29.5. Puenteado
===============

.. raw:: html

   <div class="navheader">

29.5. Puenteado
`Anterior <network-bluetooth.html>`__?
Cap?tulo 29. Networking avanzado
?\ `Siguiente <network-nfs.html>`__

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

29.5. Puenteado
---------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Escrito por Steve Peterson.

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

29.5.1. Introducci?n
~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Algunas veces resulta ?til dividir una red f?sica (como por ejemplo un
segmento Ethernet) en dos segmentos de red separados, sin tener que
crear subredes IP y sin utilizar una pasarela para comunicar ambos
segmentos. El dispositivo que realiza esta funci?n se denomina “bridge”.
Un sistema FreeBSD con dos interfaces de red puede actuar como un
“bridge” o puente entre ambas.

El “bridge” funciona de tal forma que aprende las direcciones de la capa
MAC (direcciones Ethernet) de los nodos que se encuentran conectados a
cada interfaz de red de tal forma que s?lo se reenv?a tr?fico entre los
segmentos de red cuando las direcciones fuente y destino se encuentran
separadas en segmentos distintos.

En varios aspectos se puede comparar un “bridge” con un “switch” de
pocos puertos.

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

29.5.2. Situaciones donde el puenteado resulta adecuado
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Existen al menos dos situaciones t?picas donde se puede utilizar la
funcionalidad proporcionada por los “ bridges”.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

29.5.2.1. Tr?fico de gran volumen en un segmentos de red
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

La primera situaci?n surge cuando nos encontramos con un segmento de red
congestionado pero por las razones que sean no queremos subdividir la
red e interconectar las nuevas subredes mediante un “route”.

Vamos a considerar un ejemplo de un peri?dico donde los departamentos
editoriales y de producci?n utilizan la misma subred. Los usuarios de la
editorial utilizan el servidor ``A`` como servidor de ficheros y los de
producci?n utilizan el servidor ``B``. Se Se utiliza una red Ethernet
para conectar ambos departamentos y se ha detectado que la alta
utilizaci?n del enlace est? ralentizando el funcionamiento de la red.

Si los usuarios de la editorial pudieran agregarse en un segmento de red
mientras que los usuarios de producci?n se localizaran en otro se
podr?an conectar ambos segmentos mediante un “bridge”. S?lo se utilizar?
el “bridge” para encaminar tr?fico de red destinado a interfaces que se
encuentren en el *otro* lado del “bridge”, reduciendo de esta forma la
congesti?n en cada nuevo segmento.

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

29.5.2.2. Cortafuegos de filtrado/conformaci?n de tr?fico
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

La segunda situaci?n t?pica se produce cuando se necesita un cortafuegos
pero no la Traducci?n de Direcciones de Red (NAT).

A continuaci?n se muestra un ejemplo. Una peque?a compa??a se comunica
con su ISP utilizando DSL o ISDN. Dicha compa??a posee 13 13 direcciones
IP globalmente accesibles delegadas por su ISP y tiene 10 ordenadores en
funcionamiento. En esta situaci?n un un cortafuegos basado en un
“router” resulta dif?cil debido a la distribuci?n del espacio de
direccionamiento disponible (subnetting).

Un cortafuegos implementado sobre un “bridge” se puede utilizar en el
camino de bajado desde el ISP hasta las oficinas de la compa??a sin
necesidad de tener en cuenta ning?n aspecto relacionado con la
distribuci?n de las direcciones IP.

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

29.5.3. Configuraci?n de un “bridge”
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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

29.5.3.1. Selecci?n de la interfaz de red
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Un “bridge” necesita al menos dos tarjetas de red situadas en dos
segmentos de red para su funcionamiento. Por desgracia no todas las
interfaces de red pueden usarse para el puenteo. Consulte
`bridge(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bridge&sektion=4>`__,
ah?n encontrar? m?s informaci?n sobre qu? tarjetas puede usar.

Por favor, instale y pruebe las dos tarjetas de red antes de continuar.

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

29.5.3.2. Cambios en la configuraci?n del n?cleo
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Para activar el soporte de “bridging” en el n?cleo a?ada

.. code:: programlisting

    options BRIDGE

al fichero de configuraci?n del n?cleo y recompile el kernel.

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

29.5.3.3. Soporte de cortafuegos
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Si se desea utilizar el “bridge” como un cortafuegos, se debe a?adir
adem?s la opci?n ``IPFIREWALL``. Lea el cap?lo de firewalls para obtener
informaci?n general sobre c?mo configurar el bridge para que act?e
adem?s como cortafuegos.

Si adem?s queremos que los paquetes que no sean IP (por ejemplo paquetes
ARP) puedan atravesar el “bridge” deberemos a?adir la opci?n
``IPFIREWALL_DEFAULT_TO_ACCEPT``. Tenga en cuenta opci?n modifica el
comportamiento del cortafuegos de tal forma que por defecto aceptar?
cualquier paquete. Hay que tener cuidado para asegurarse de que el
comportamiento esperado del cortafuegos, que reside en el conjunto de
reglas que se hayan definido, no se vea afectado por este cambio.

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

29.5.3.4. Soporte de conformado de tr?fico
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Si se quiere utilizar el “bridge” como un conformador de tr?fico, es
decir, como un elemento capaz de adaptar los distintos flujos seg?n
determinados patrones, se debe a?adir la opci?n ``DUMMYNET`` a la
configuraci?n del n?cleo. Se ruega consultar
`dummynet(4) <http://www.FreeBSD.org/cgi/man.cgi?query=dummynet&sektion=4>`__
para obtener m?s informaci?n al respecto.

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

29.5.4. C?mo activar el “bridge”
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A?adir la l?nea:

.. code:: programlisting

    net.link.ether.bridge=1

en ``/etc/sysctl.conf`` para habilitar el soporte de “bridging” en
tiempo de ejecuci?n y la l?nea:

.. code:: programlisting

    net.link.ether.bridge_cfg=if1,if2

Para activar el “bridging” en las interfaces especificadas (sustituya
*``if1``* y *``if2``* con los nombres de sus interfaces de red). Si
deseamos filtrar los paquetes puenteados utilizando
`ipfw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ipfw&sektion=8>`__,
debemos a?adir tambi?n:

.. code:: programlisting

    net.link.ether.bridge_ipfw=1

En FreeBSD?5.2-RELEASE y posteriores, se debe utilizar las siguientes
l?neas en lugar de las anteriores:

.. code:: programlisting

    net.link.ether.bridge.enable=1
    net.link.ether.bridge.config=if1,if2
    net.link.ether.bridge.ipfw=1

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

29.5.5. Informaci?n adicional
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Si queremos ser capaces de conectarnos al “bridge” mediante
`telnet(1) <http://www.FreeBSD.org/cgi/man.cgi?query=telnet&sektion=1>`__
se puede asignar una direcci?n IP a una de las tarjetas de red del
“bridge”. Por amplio consenso se considera una mala idea asignar m?s de
una direcci?n IP al “bridge”.

Si poseemos varios “bridges” en nuestra red s?lamente puede existir un
?nico camino entre cualesquiera dos m?quinas de nuestra red.
T?cnicamente hablando esto significa que no existe soporte para gesti?n
de enlace mediante mecanismos basados en ?rboles de recubrimiento
m?nimos (“spanning tree”).

Un “bridge” puede a?adir latencia a los tiempos de respuesta de la orden
`ping(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ping&sektion=8>`__,
especialmente cuando el tr?fico tiene que viajar de un segmento de red
al otro.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------+----------------------------------------+---------------------------------------+
| `Anterior <network-bluetooth.html>`__?   | `Subir <advanced-networking.html>`__   | ?\ `Siguiente <network-nfs.html>`__   |
+------------------------------------------+----------------------------------------+---------------------------------------+
| 29.4. Bluetooth?                         | `Inicio <index.html>`__                | ?29.6. NFS                            |
+------------------------------------------+----------------------------------------+---------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
