===========
29.10. DHCP
===========

.. raw:: html

   <div class="navheader">

29.10. DHCP
`Anterior <network-nis.html>`__?
Cap?tulo 29. Networking avanzado
?\ `Siguiente <network-dns.html>`__

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

29.10. DHCP
-----------

.. raw:: html

   </div>

.. raw:: html

   <div>

Escrito por Greg Sutter.

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

29.10.1. ?Qu? es DHCP?
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

DHCP, el Protocolo de Configuraci?n Dinamica de M?quinas (“Dynamic Host
Configuration Protocol”), especifica un m?todo para configurar
din?micamente los par?metros de red necesarios para que un sistema pueda
comunicarse efectivamente. FreeBSD utiliza la implementaci?n de DHCP
proporcionada por el Internet Software Consortium (ISC) de tal forma que
toda la informaci?n relativa a la configuraci?n de DHCP se basa en la
distribuci?n proporcionada por el ISC.

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

29.10.2. Contenido de esta secci?ns
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Esta secci?n describe tanto los componentes de la parte servidora como
los componentes de la parte cliente del sistema DHCP del ISC. El
programa cliente, denominado forma parte por defecto de los sistemas
FreeBSD y el programa servidor se puede instalar a partir del “port”
`net/isc-dhcp3-server <http://www.freebsd.org/cgi/url.cgi?ports/net/isc-dhcp3-server/pkg-descr>`__.
Las principales fuentes de informaci?n son las p?ginas de manual
`dhclient(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dhclient&sektion=8>`__,
`dhcp-options(5) <http://www.FreeBSD.org/cgi/man.cgi?query=dhcp-options&sektion=5>`__
y
`dhclient.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=dhclient.conf&sektion=5>`__
junto con las referencias que se muestran a continuaci?n en esta misma
secci?n.

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

29.10.3. C?mo funciona
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Cuando el cliente de DHCP, ``dhclient``, se ejecuta en una m?quina
cliente, valga la redundancia, comienza a enviar peticiones “broadcast”
solicitando informaci?n de configuraci?n. Por defecto estas peticiones
se realizan contra el puerto UDP 68. El servidor responde a trav?s del
puerto UDP 67 proporcionando al cliente una direcci?n IP junto con otros
par?metros relevantes para el correcto funcionamiento del sistema en la
red, tales como la m?scara de red, el “ router” por defecto y los
servidores de DNS. Toda esta informaci?n se “presta” y es v?lida s?lo
durante un determinado per?odo de tiempo (configurado por el
administrador del servidor de DHCP). De esta forma direcciones IP
asignadas a clientes que ya no se encuentran conectados a la red pueden
ser reutilizadas al pasar determinado periodo de tiempo.

Los clientes de DHCP pueden obtener una gran cantidad de informaci?n del
servidor. Se puede encontrar una lista completa en
`dhcp-options(5) <http://www.FreeBSD.org/cgi/man.cgi?query=dhcp-options&sektion=5>`__.

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

29.10.4. Integraci?n dentro de los sistemas FreeBSD
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD se integra totalmente con el cliente DHCP del ISC,
``         dhclient``. Este soporte se proporciona tanto en el proceso
de instalaci?n como en la instalaci?n por defecto del sistema base
obviando la necesidad de poseer un conocimiento detallado de aspectos
relacionados con la configuraci?n de redes siempre y cuando se disponga
de servicio de DHCP en la red dada. ``dhclient`` se incluye en todas las
distribuciones de FreeBSD desde la versi?n 3.2.

sysinstall soporta DHCP. Cuando se configura la interfaz de red la
primera pregunta es: “ ?Quiere intentar configurar el interfaz mediante
DHCP?”. Si se responde afirmativamente se ejecutar? ``dhclient`` y si
tiene ?xito se procede con los siguientes pasos de configuraci?n
rellenandose autom?ticamente las variables de arranque necesarias para
completar la configuraci?n de la red.

Existen dos cosas que se deben realizar de tal forma que nuestro sistema
utilice la configuraci?n de red mediante DHCP al arrancar:

.. raw:: html

   <div class="itemizedlist">

-  Asegurarse de que el dispositivo ``               bpf`` se encuentra
   compilado en el kernel. Para ello basta a?adir ``device bpf``
   (``pseudo-device bpf`` en los sistemas FreeBSD?4.X) al fichero de
   configuraci?n del kernel y recompilarlo e instalarlo. Para m?s
   informaci?n sobre la construcci?n de n?cleos consulte `Cap?tulo?8,
   *Configuraci?n del kernel de FreeBSD* <kernelconfig.html>`__.

   El dispositivo ``bpf`` se encuentra activado por defecto dentro del
   fichero de configuraci?n del n?cleo (``GENERIC`` que encontrar? en su
   sistema FreeBSD de forma que si no se est? utilizando un fichero de
   configuraci?n del n?cleo espec?fico (hecho a medida y/o por usted) no
   es necesario crear uno nuevo y se puede utilizar directamente
   ``GENERIC``.

   .. raw:: html

      <div class="note" xmlns="">

   Nota:
   ~~~~~

   Para aquellas personas especialmente preocupadas por la seguridad
   debemos advertir de que el dispositivo ``                 bpf`` es el
   dispositivo que las aplicaciones de captura de paquetes utilizan para
   acceder a los mismos (aunque dichas aplicaciones deben ser ejecutadas
   como ``root``). DHCP *requiere* la presencia de ``bpf`` pero si la
   seguridad del sistema es m?s importante que la configuraci?n
   autom?tica de la red no se recomienda instalar ``bpf`` en el n?cleo.

   .. raw:: html

      </div>

-  Editar el fichero ``/etc/rc.conf`` para para incluir lo siguiente:

   .. code:: programlisting

       ifconfig_fxp0="DHCP"

   .. raw:: html

      <div class="note" xmlns="">

   Nota:
   ~~~~~

   Aseg?rese de sustituir ``fxp0`` con el nombre de interfaz que desea
   que se configure din?micamente, como se describe en `Secci?n?11.1,
   “Configuraci?n de Tarjetas de
   Red” <config-tuning.html#config-network-setup>`__.

   .. raw:: html

      </div>

   Si se utiliza una ubicaci?n distinta para ``dhclient`` o si se desea
   a?adir opciones adicionales a ``dhclient`` se puede incluir,
   adapt?ndolo a las condiciones particulares de cada usuario, lo
   siguiente:

   .. code:: programlisting

       dhcp_program="/sbin/dhclient"
       dhcp_flags=""

.. raw:: html

   </div>

El servidor de DHCP (dhcpd) forma parte del “port”
`net/isc-dhcp3-server <http://www.freebsd.org/cgi/url.cgi?ports/net/isc-dhcp3-server/pkg-descr>`__.
Este “ port” tambi?n contiene la documentaci?n de ISC DHCP.

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

29.10.5. Ficheros
~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="itemizedlist">

-  ``/etc/dhclient.conf``

   ``dhclient`` necesita un fichero de configuraci?n denominado
   ``/etc/dhclient.conf``. Normalmente este fichero s?lo contiene
   comentarios de forma que las opciones que se definen por defecto son
   razonablemente inocuas. Este fichero de configuraci?n se describe en
   la p?gina de manual de
   `dhclient.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=dhclient.conf&sektion=5>`__.

-  ``/sbin/dhclient``

   ``dhclient`` se encuentra enlazado de forma est?tica y reside en
   ``/sbin``. La p?gina de manual de
   `dhclient(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dhclient&sektion=8>`__
   proporciona m?s informaci?n sobre la orden ``dhclient``.

-  ``/sbin/dhclient-script``

   ``dhclient-script`` es el “ script” de configuraci?n del cliente de
   DHCP espec?fico de FreeBSD. Tiene todos los detalles en
   `dhclient-script(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dhclient-script&sektion=8>`__
   pero no necesita hacer ninguna modificaci?n en ?l para que todo
   funcione correctamente.

-  ``/var/db/dhclient.leases``

   El cliente de DHCP mantiene una base de datos de pr?stamos en este
   fichero que se escribe de forma semejante a un “log”. En
   `dhclient.leases(5) <http://www.FreeBSD.org/cgi/man.cgi?query=dhclient.leases&sektion=5>`__
   puede consultar una explicaci?n ligeramente m?s detallada.

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

29.10.6. Lecturas recomendadas
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El protocolo DHCP se describe completamente en `RFC
2131 <http://www.freesoft.org/CIE/RFC/2131/>`__. Tambi?n tiene m?s
informaci?n en `dhcp.org <http://www.dhcp.org/>`__.

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

29.10.7. Instalaci?n y configuraci?n de un servidor de DHCP
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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

29.10.7.1. Qu? temas se tratan en esta secci?n
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Esta secci?n proporciona informaci?n sobre c?mo configurar un sistema
FreeBSD de forma que act?e como un servidor de DHCP utilizando la
implementaci?n proporcionada por el Internet Software Consortium (ISC).

La parte servidora del paquete proporcionado por el ISC no se instala
por defecto en los sistemas FreeBSD pero se puede intalar como “port”
desde
`net/isc-dhcp3-server <http://www.freebsd.org/cgi/url.cgi?ports/net/isc-dhcp3-server/pkg-descr>`__.
Consulte `Cap?tulo?4, *Instalaci?n de aplicaciones: ?packages? y
ports* <ports.html>`__ si necesita saber m?s sobre la Colecci?n de
“ports”.

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

29.10.7.2. Instalaci?n del servidor DHCP
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Para configurar un sistema FreeBSD como servidor de DHCP debe asegurarse
de que el dispositivo
`bpf(4) <http://www.FreeBSD.org/cgi/man.cgi?query=bpf&sektion=4>`__ est?
compilado dentro del n?cleo. Para ello basta a?adir ``device bpf``
(``         pseudo-device bpf`` en FreeBSD?4.X) al fichero de
configuraci?n del n?cleo y reconstruir el mismo. Si necesita saber m?s
sobre el proceso de compilar e instalar el n?cleo consulte `Cap?tulo?8,
*Configuraci?n del kernel de FreeBSD* <kernelconfig.html>`__.

El dispositivo ``bpf`` ya se encuentra activado en el fichero de
configuraci?n ``GENERIC`` del n?cleo que se facilita con FreeBSD de tal
forma que no resulta imprescindible crear un n?cleo a medida para
ejecutar DHCP.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Para aquellas personas especialmente preocupadas por la seguridad
debemos advertir de que el dispositivo ``bpf`` es el dispositivo que las
aplicaciones de captura de paquetes utilizan para acceder a los mismos
(aunque dichas aplicaciones deben ser ejecutadas como ``root``). DHCP
*requiere* la presencia de ``bpf`` pero si la seguridad del sistema es
m?s importante que la configuraci?n autom?tica de la red no se
recomienda instalar ``bpf`` en el n?cleo.

.. raw:: html

   </div>

El siguiente paso consiste en editar el fichero de ejemplo
``dhcpd.conf`` que se crea al instalar el “port”
`net/isc-dhcp3-server <http://www.freebsd.org/cgi/url.cgi?ports/net/isc-dhcp3-server/pkg-descr>`__.
Por defecto el fichero se llama ``/usr/local/etc/dhcpd.conf.sample``,
as? que se debe copiar este fichero a ``/usr/local/etc/dhcpd.conf`` y a
continuaci?n realizar todos los cambios sobre este ?ltimo.

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

29.10.7.3. Configuraci?n del servidor de DHCP
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El fichero ``dhcpd.conf`` se compone de un conjunto de declaraciones que
hacen referencia a m?quinas y a subredes. Esto se entender? mejor
mediante el siguiente ejemplo:

.. code:: programlisting

    option domain-name "ejemplo.com";
    option domain-name-servers 192.168.4.100;
    option subnet-mask 255.255.255.0;

    default-lease-time 3600;
    max-lease-time 86400;
    ddns-update-style none;

    subnet 192.168.4.0 netmask 255.255.255.0 {
      range 192.168.4.129 192.168.4.254;
      option routers 192.168.4.1;
    }

    host mailhost {
      hardware ethernet 02:03:04:05:06:07;
      fixed-address mailhost.ejemplo.com;
    }

.. raw:: html

   <div class="calloutlist">

+--------------------------------------+--------------------------------------+
| `|1| <#domain-name>`__               | Esta opci?n especifica el dominio    |
|                                      | que se proporciona a los clientes y  |
|                                      | que dichos clientes utilizan como    |
|                                      | dominio de b?squeda por defecto.     |
|                                      | Consulte                             |
|                                      | `resolv.conf(5) <http://www.FreeBSD. |
|                                      | org/cgi/man.cgi?query=resolv.conf&se |
|                                      | ktion=5>`__                          |
|                                      | si necesita m?s informaci?n sobre    |
|                                      | qu? significa el dominio de          |
|                                      | b?squeda.                            |
+--------------------------------------+--------------------------------------+
| `|2| <#domain-name-servers>`__       | Esta opci?n especifica la lista de   |
|                                      | servidores de DNS (seperados por     |
|                                      | comas) que deben utilizar los        |
|                                      | clientes.                            |
+--------------------------------------+--------------------------------------+
| `|3| <#subnet-mask>`__               | La m?scara de red que se proporciona |
|                                      | a los clientes.                      |
+--------------------------------------+--------------------------------------+
| `|4| <#default-lease-time>`__        | Un cliente puede solicitar un        |
|                                      | determinado tiempo de vida para el   |
|                                      | pr?stamo. En caso contrario el       |
|                                      | servidor asigna un tiempo de vida    |
|                                      | por defecto mediante este valor      |
|                                      | (expresado en segundos).             |
+--------------------------------------+--------------------------------------+
| `|5| <#max-lease-time>`__            | Este es el m?ximo tiempo que el      |
|                                      | servidor puede utilizar para         |
|                                      | realizar pr?stamos a los clientes.   |
|                                      | Si un cliente solicita un tiempo     |
|                                      | mayor como m?ximo se responder? con  |
|                                      | el valor aqu? configurado,           |
|                                      | ignor?ndose la petici?n de tiempo    |
|                                      | del cliente.                         |
+--------------------------------------+--------------------------------------+
| `|6| <#ddns-update-style>`__         | Esta opci?n especifica si el         |
|                                      | servidor de DHCP debe intentar       |
|                                      | actualizar el servidor de DNS cuando |
|                                      | se acepta o se libera un pr?stamo.   |
|                                      | En la implementaci?n proporcionada   |
|                                      | por el ISC esta opci?n es            |
|                                      | *obligatoria*.                       |
+--------------------------------------+--------------------------------------+
| `|7| <#range>`__                     | Esto indica qu? direcciones IP se    |
|                                      | pueden utilizar para ser prestadas a |
|                                      | los clientes que las soliciten. Las  |
|                                      | direcciones IP pertenecientes a este |
|                                      | rango, incluyendo los extremos, se   |
|                                      | pueden entregar a los clientes.      |
+--------------------------------------+--------------------------------------+
| `|8| <#routers>`__                   | Declara c?al es la pasarela por      |
|                                      | defecto que se proporcionar? a los   |
|                                      | clientes.                            |
+--------------------------------------+--------------------------------------+
| `|9| <#hardware>`__                  | Especifica la direcci?n MAC de una   |
|                                      | m?quina, de tal forma que el         |
|                                      | servidor de DHCP pueda identificar a |
|                                      | la m?quina cuando realice una        |
|                                      | petici?n.                            |
+--------------------------------------+--------------------------------------+
| `|10| <#fixed-address>`__            | Especifica que la m?quina cliente    |
|                                      | deber?a obtener siempre la misma     |
|                                      | direcci?n IP. Recuerde que se puede  |
|                                      | utilizar un nombre de m?quina para   |
|                                      | esto ya que el servidor de DHCP      |
|                                      | resolver? el nombre por s? mismo     |
|                                      | antes de devolver la informaci?n al  |
|                                      | cliente.                             |
+--------------------------------------+--------------------------------------+

.. raw:: html

   </div>

Una vez que se ha acabado de configurar el fichero ``dhcpd.conf`` se
puede proceder con la ejecuci?n del servidor mediante la siguiente
orden:

.. code:: screen

    # /usr/local/etc/rc.d/isc-dhcpd.sh start

Si posteriormente se necesitan realizar cambios en la configuraci?n
anterior tenga en cuenta que el env?o de la se??l ``SIGHUP`` a la
aplicaci?n dhcpd *no* provoca que se lea de nuevo la configuraci?n como
suele ocurrir en la mayor?a de los d?mones. Tendr? que enviar la se?al
``SIGTERM`` para parar el proceso y posteriormente relanzar el d?mon
utilizando la orden anterior.

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

29.10.7.4. Ficheros
^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="itemizedlist">

-  ``/usr/local/sbin/dhcpd``

   dhcpd se encuentra enlazado de forma est?tica y reside en el
   directorio ``/usr/local/sbin``. La p?gina de manual
   `dhcpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dhcpd&sektion=8>`__
   que se instala con el “port” le proporcionar? m?s informaci?n sobre
   dhcpd.

-  ``/usr/local/etc/dhcpd.conf``

   dhcpd necesita un fichero de configuraci?n,
   ``         /usr/local/etc/dhcpd.conf``. Este fichero contiene toda la
   informaci?n relevante que se quiere proporcionar a los clientes que
   la soliciten, junto con informaci?n relacionada con el funcionamiento
   del servidor. Este fichero de configuraci?n se describe en la p?gina
   del manual
   `dhcpd.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=dhcpd.conf&sektion=5>`__
   que instala el “ port”.

-  ``/var/db/dhcpd.leases``

   El servidor de DHCP mantiene una base de datos de pr?stamos o
   alquileres dentro de este fichero, que presenta un formato de fichero
   de “log”. La p?gina del manual
   `dhcpd.leases(5) <http://www.FreeBSD.org/cgi/man.cgi?query=dhcpd.leases&sektion=5>`__
   que se instala con el “port” proporciona una descripci?n ligeramente
   m?s larga.

-  ``/usr/local/sbin/dhcrelay``

   dhcrelay se utiliza en entornos de red avanzados donde un servidor de
   DHCP reenv?a una petici?n de un cliente hacia otro servidor de DHCP
   que se encuentra localizado en otra subred. Si se necesita esta
   funcionalidad se debe instalar el “port”
   `net/isc-dhcp3-server <http://www.freebsd.org/cgi/url.cgi?ports/net/isc-dhcp3-server/pkg-descr>`__.
   La p?gina del manual
   `dhcrelay(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dhcrelay&sektion=8>`__
   proporcionada por el “port” contiene m?s detalles sobre esto.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------+----------------------------------------+---------------------------------------+
| `Anterior <network-nis.html>`__?   | `Subir <advanced-networking.html>`__   | ?\ `Siguiente <network-dns.html>`__   |
+------------------------------------+----------------------------------------+---------------------------------------+
| 29.9. NIS/YP?                      | `Inicio <index.html>`__                | ?29.11. DNS                           |
+------------------------------------+----------------------------------------+---------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.

.. |1| image:: ./imagelib/callouts/1.png
.. |2| image:: ./imagelib/callouts/2.png
.. |3| image:: ./imagelib/callouts/3.png
.. |4| image:: ./imagelib/callouts/4.png
.. |5| image:: ./imagelib/callouts/5.png
.. |6| image:: ./imagelib/callouts/6.png
.. |7| image:: ./imagelib/callouts/7.png
.. |8| image:: ./imagelib/callouts/8.png
.. |9| image:: ./imagelib/callouts/9.png
.. |10| image:: ./imagelib/callouts/10.png
