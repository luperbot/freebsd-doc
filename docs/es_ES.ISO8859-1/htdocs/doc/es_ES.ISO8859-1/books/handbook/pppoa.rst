==================================
25.5. Uso de PPP sobre ATM (PPPoA)
==================================

.. raw:: html

   <div class="navheader">

25.5. Uso de PPP sobre ATM (PPPoA)
`Anterior <pppoe.html>`__?
Cap?tulo 25. PPP y SLIP
?\ `Siguiente <slip.html>`__

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

25.5. Uso de PPP sobre ATM (PPPoA)
----------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Lo siguiente describe como configurar PPP utilizando ATM, alias PPPoA.
PPPoA es una alternativa muy com?n entre proveedores de DSL en Europa.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

25.5.1. Uso de PPPoA con un Alcatel Speedtouch USB
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El soporte bajo FreeBSD para este dispositivo se puede encontrar como un
port, por que el firmware es distribuido bajo `la licencia de
Alcatel <http://www.alcatel.com/consumer/dsl/disclaimer_lx.htm>`__.

Para instalar este software, simplemente utilice la `colecci?n de
ports <ports.html>`__. Instale el port
`net/pppoa <http://www.freebsd.org/cgi/url.cgi?ports/net/pppoa/pkg-descr>`__
y siga las instrucciones provistas por el port.

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

25.5.2. Uso de mpd
~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Puede usar mpd para conectarse a una gran variedad de servicios, en
particular servicios pptp. Puede encontrar mpd en la colecci?n de ports,
bajo
`net/mpd <http://www.freebsd.org/cgi/url.cgi?ports/net/mpd/pkg-descr>`__.

Primero debe instalar el port, y posteriormente configurar mpd para que
se ajuste a sus necesidades y a la configuraci?n del proveedor. El port
instala un conjunto de ficheros de configuraci?n de ejemplo, que estan
bien documentados en ``PREFIX/etc/mpd/``. Note que *PREFIX* se refiere
al directorio donde sus ports son instalados, que normalmente es en
``/usr/local``. Una gu?a completa en formato HTML, esta disponible una
vez que se ha instalado el port. Esta se localiza en
``PREFIX/share/mpd/``. Aqui tenemos un ejemplo simple de configuraci?n
para conectarse a un servicio ADSL con mpd. La configuraci?n se divide
en dos ficheros, primero tenemos el fichero ``mpd.conf``.

.. code:: programlisting

    default:
         load adsl

     adsl:
         new -i ng0 adsl adsl
         set bundle authname usuario 
         set bundle password contrase?a 
         set bundle disable multilink

         set link no pap actcomp protocomp
         set link disable chap
         set link accept chap
         set link keep-alive 30 10

         set ipcp no vjcomp
         set ipcp ranges 0.0.0.0/0 0.0.0.0/0

         set iface route default
         set iface disable on-demand
         set iface enable proxy-arp
         set iface idle 0

         open

.. raw:: html

   <div class="calloutlist">

+--------------------------------------+--------------------------------------+
| `|1| <#co-mpd-ex-user>`__            | El nombre de usuario para            |
|                                      | autentificar con su proveedor.       |
+--------------------------------------+--------------------------------------+
| `|2| <#co-mpd-ex-pass>`__            | La contrase?a para autentificar con  |
|                                      | su proveedor.                        |
+--------------------------------------+--------------------------------------+

.. raw:: html

   </div>

El fichero ``mpd.links`` contiene informaci?n a cerca de la, o las
conecciones, que desee establecer. Un ejemplo de ``mpd.links`` y que sea
acompa?ante del ejemplo anterior, se muestra a continuaci?n.

.. code:: programlisting

    adsl:
         set link type pptp
         set pptp mode active
         set pptp enable originate incoming outcall
         set pptp self 10.0.0.140
         set pptp peer 10.0.0.138

La conexi?n es f?cil de inicializarla, al ingresar los siguientes
comandos como ``root``.

.. code:: screen

    # mpd -b adsl

El estatus de la conexi?n la puede ver con el comando.

.. code:: screen

    % ifconfig ng0
     : flags=88d1<UP,POINTOPOINT,RUNNING,NOARP,SIMPLEX,MULTICAST> mtu 1500
          inet 216.136.204.117 --> 204.152.186.171 netmask 0xffffffff

Usar mpd es la forma recomendada para conectarse con servicios ADSL con
FreeBSD.

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

25.5.3. Uso de pptpclient
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Tambi?n es posible usar FreeBSD para conectarse a otros servicios PPPoA
por medio de
`net/pptpclient <http://www.freebsd.org/cgi/url.cgi?ports/net/pptpclient/pkg-descr>`__.

Para conectarse por medio de
`net/pptpclient <http://www.freebsd.org/cgi/url.cgi?ports/net/pptpclient/pkg-descr>`__
a un servicio DSL, instale el port o paquete y edite el fichero
``/etc/ppp/ppp.conf``. Debe ser ``root`` para hacer estas operaciones.
Un ejemplo de la secci?n de ``ppp.conf``, se muestra a continuaci?n.
Para mayor informaci?n sobre las opciones de ``ppp.conf``, consulte la
p?gina de ayuda de ppp;
`ppp(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ppp&sektion=8>`__.

.. code:: programlisting

    adsl:
      set log phase chat lcp ipcp ccp tun command
      set timeout 0
      enable dns
      set authname usuario 
      set authkey contrase?a 
      set ifaddr 0 0
      add default HISADDR

.. raw:: html

   <div class="calloutlist">

+--------------------------------------+--------------------------------------+
| `|1| <#co-pptp-ex-user>`__           | Nombre de usuario de la cuenta DSL.  |
+--------------------------------------+--------------------------------------+
| `|2| <#co-pptp-ex-pass>`__           | La contrase?a de su cuenta.          |
+--------------------------------------+--------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   <div class="warning" xmlns="">

Aviso:
~~~~~~

Debido a que debe poner su contrase?a en el fichero ``ppp.conf`` en
texto plano, debe asegurarse que nadie tenga acceso de lectura a este
fichero. Los siguientes comandos se aseguran de que el fichero solo
pueda se leido por ``root``. Ve las p?ginas de ayuda
`chmod(1) <http://www.FreeBSD.org/cgi/man.cgi?query=chmod&sektion=1>`__
y
`chown(8) <http://www.FreeBSD.org/cgi/man.cgi?query=chown&sektion=8>`__
para mayor informaci?n.

.. code:: screen

    # chown root:wheel /etc/ppp/ppp.conf
     # chmod 600 /etc/ppp/ppp.conf

.. raw:: html

   </div>

Esto abrir? una sesion por medio de PPP con su ruteador DSL. Los m?dems
Ethernet DSL cuentan con una direcci?n IP de LAN preconfigurada a la
cual se puede conectar. En el caso del Alcatel Speedtouch, esta
direcci?n es ``10.0.0.138``. La documentaci?n de su equipo debe
indicarle que direcci?n utiliza. Para abrir el “tunel” e iniciar la
sesi?n ppp, ejecute el siguiente comando.

.. code:: screen

    # pptp direcci?n proveedor

.. raw:: html

   <div class="tip" xmlns="">

Sugerencia:
~~~~~~~~~~~

Puede a?adir un s?mbolo de ampersand (“&”) al final de este comando, ya
que pptp no retorna al shell por default.

.. raw:: html

   </div>

Un dispositivo virtual ``tun`` ser? creado, para interactuar con los
procesos de pptp y ppp. Una vez que regrese al shell puede examinar la
conexi?n por medio del siguiente comando.

.. code:: screen

    % ifconfig tun0
     tun0: flags=8051<UP,POINTOPOINT,RUNNING,MULTICAST> mtu 1500
             inet 216.136.204.21 --> 204.152.186.171 netmask 0xffffff00
             Opened by PID 918

Si no le es posible conectarse, verifique la configuraci?n de su
ruteador, que normalmente es accesible por medio de telnet o de su
navegador web. Si aun no puede conectarse examine la salida que da el
comando pptp y el contenido del fichero de registro (log) de ppp;
``/var/log/ppp.log``.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------------+---------------------------------+--------------------------------+
| `Anterior <pppoe.html>`__?                 | `Subir <ppp-and-slip.html>`__   | ?\ `Siguiente <slip.html>`__   |
+--------------------------------------------+---------------------------------+--------------------------------+
| 25.4. Uso de PPP sobre Ethernet (PPPoE)?   | `Inicio <index.html>`__         | ?25.6. Uso de SLIP             |
+--------------------------------------------+---------------------------------+--------------------------------+

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
