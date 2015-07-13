==========
29.12. NTP
==========

.. raw:: html

   <div class="navheader">

29.12. NTP
`Anterior <network-dns.html>`__?
Cap?tulo 29. Networking avanzado
?\ `Siguiente <network-natd.html>`__

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

29.12. NTP
----------

.. raw:: html

   </div>

.. raw:: html

   <div>

Escrito por Tom Hukins.

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

29.12.1. Resumen
~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Seg?n pasa el tiempo el reloj de un computador est? expuesto a ligeros
desplazamientos. NTP (Protocolo de Hora en Red, en ingl?s “Network Time
Protocol”) es un protocolo que permite asegurar la exactitud de nuestro
reloj.

Existen varios servicios de internet que conf?an y se pueden beneficiar
de relojes de computadores precisos. Por ejemplo un servidor web puede
recibir peticiones de un determinado fichero si ha sido modificado
posteriormente a una determinada fecha u hora. Servicios como
`cron(8) <http://www.FreeBSD.org/cgi/man.cgi?query=cron&sektion=8>`__
ejecutan ?rdenes en determinados instantes. Si el reloj no se encuentra
ajustado estas ?rdenes pueden ejecutarse fuera de la hora prevista.

FreeBSD viene con el servidor NTP
`ntpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ntpd&sektion=8>`__
que se puede utilizar para preguntar a otros servidores NTP, de tal
forma que podemos ajustar nuestro reloj seg?n la hora de otros
servidores e incluso proporcionar servicio de hora nosotros mismos.

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

29.12.2. Elecci?n de los servidores de hora adecuados
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Para sincronizar nuestro reloj necesitamos comunicarnos con uno o m?s
servidores NTP. El administrador de nuestra red o nuestro proveedor de
servicios de Internet muy posiblemente hayan configurado alg?n servidor
NTP para estos prop?sitos. Consulte la documentaci?n de que disponga.
Existe una `lista de servidores NTP p?blicamente
accesibles <http://www.eecis.udel.edu/~mills/ntp/servers.html>`__ que se
pueden utilizar para buscar un servidor NTP que se encuentre
geogr?ficamente pr?ximo. Aseg?rese de que conoce la pol?tica de uso de
estos servidores p?blicos ya que en algunos casos es necesario pedir
permiso al administrador antes de de poder utilizarlos, principalmente
por motivos estad?sticos.

Le recomendamos seleccionar servidores NTP que no se encuentren
conectados entre s? por si alguno de los servidores que use sea
inaccesible o su reloj se aver?e.
`ntpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ntpd&sektion=8>`__
utiliza las respuestas que recibe de otros servidores de una forma
inteligente. servidores de una forma inteligente (Tiene a hacer m?s caso
a los m?s fiables.

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

29.12.3. Configuraci?n de la m?quina
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

29.12.3.1. Configuraci?n b?sica
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Si s?lamente deseamos sincronizar nuestro reloj cuando se arranca la
m?quina se puede utilizar
`ntpdate(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ntpdate&sektion=8>`__.
Esto puede ser adecuado en algunas m?quinas de escritorio que se
reinician frecuentemente y donde la sincronizaci?n no suele ser un
objetivo prioritario pero normalmente la mayor?a de las m?quinas
deber?an ejecutar
`ntpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ntpd&sektion=8>`__.

La utilizaci?n de
`ntpdate(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ntpdate&sektion=8>`__
en tiempo de arranque es tambi?n una buena idea incluso para las
m?quinas que ejecutan
`ntpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ntpd&sektion=8>`__.
El programa
`ntpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ntpd&sektion=8>`__
modifica el reloj de forma gradual, mientras que
`ntpdate(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ntpdate&sektion=8>`__
ajusta directamente el reloj sin importar que tama?o tenga la diferencia
de tiempo existente entre la m?quina y el servidor de tiempo de
referencia.

Para activar
`ntpdate(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ntpdate&sektion=8>`__
en tiempo de arranque, a?ada ``ntpdate_enable="YES"`` al fichero
``/etc/rc.conf``. Tambi?n es necesario especificar todos los servidores
que deseamos utilizar para realizar el proceso de sincronizaci?n y
cualquier par?metro que deseemos pasar a
`ntpdate(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ntpdate&sektion=8>`__
utilizando la variable ``ntpdate_flags``.

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

29.12.3.2. Configuraci?n general
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

NTP se configura mediante el archivo ``/etc/ntp.conf`` utilizando el
formato descrito en
`ntp.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=ntp.conf&sektion=5>`__.
A continuaci?n se muestra un sencillo ejemplo:

.. code:: programlisting

    server ntplocal.ejemplo.com prefer
    server timeserver.ejemplo.org
    server ntp2a.ejemplo.net

    driftfile /var/db/ntp.drift

La opci?n ``server`` especifica qu? servidores se van a utilizar,
especificando un servidor por l?nea. Si se especifica un servidor con el
argumento ``prefer``, como en ``ntplocal.ejemplo.com`` dicho servidor se
prefiere sobre los dem?s. No obstante la respuesta de su servidor
preferido se descartar? si difiere sustancialmente de la respuesta
recibida por parte del resto de los servidores especificados; en caso
contrario s?lo se tendr? en cuenta la respuesta del servidor preferido
sin importar la informaci?n suministrada por el resto. El argumento
``prefer`` se utiliza normalmente en servidores NTP altamente precisos,
como aquellos que poseen hardware de tiempo espec?fico.

La opci?n ``driftfile`` especifica qu? fichero se utiliza para almacenar
el desplazamiento de la fracuencia de reloj de la m?quina. El programa
`ntpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ntpd&sektion=8>`__
utiliza este valor para autom?ticamente compensar el desv?o que
experimenta de forma natural el reloj de la m?quina, permitiendo
mantener una precisi?n acotada incluso cuando se pierde la comunicaci?n
con el resto de referencias externas.

La opci?n ``driftfile`` especifica qu? fichero se utiliza para almacenar
la informaci?n sobre espuestas anteriores de servidores NTP. Este
fichero contiene informaci?n ?til para la implementaci?n de NTP. No
deber?a ser modificada por ning?n otro proceso.

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

29.12.3.3. Control de acceso al servidor NTP
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Por defecto nuestro servidor de NTP puede ser accedido por cualquier
m?quina de Internet. La opci?n ``restrict`` se puede utilizar para
controlar controlar qu? m?quinas pueden acceder al servicio.

Si queremos denegar el acceso a todas las m?quinas existentes basta con
a?adir la siguiente l?nea a ``/etc/ntp.conf``:

.. code:: programlisting

    restrict default ignore

Si s?lo queremos permitir el acceso al servicio de hora a las m?quinas
de nuestra red y al menos tiempo nos queremos asegurar de que dichos
clientes no pueden a su vez configurar la hora del servidor o utilizarse
ellos mismos como nuevos servidores de hora basta con a?adir lo
siguiente en lugar de lo anterior:

.. code:: programlisting

    restrict 192.168.1.0 mask 255.255.255.0 notrust nomodify notrap

donde ``192.168.1.0`` es la direcci?n IP de nuestra red y
``255.255.255.0`` es la m?scara de red.

``/etc/ntp.conf`` puede contener varias opciones de tipo ``restrict``.
Para m?s detalles consulte la secci?n
``Soporte de Control de           Acceso`` de
`ntp.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=ntp.conf&sektion=5>`__.

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

29.12.4. Ejecuci?n del servidor de NTP
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Para asegurarnos de que el servidor de NTP se ejecuta en tiempo de
arranque se debe a?adir la l?nea ``         xntpd_enable="YES"`` al
fichero ``/etc/rc.conf``. Si deseamos pasar opciones adicionales a
`ntpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ntpd&sektion=8>`__ se
puede modificar la variable ``xntpd_flags`` del fichero
``/etc/rc.conf``.

Para ejecutar el servidor sin reiniciar la m?quina ejecute ``ntpd``
junto con todos aquellos par?metros que haya especificado en la variable
de arranque ``xntpd_flags`` del fichero ``/etc/rc.conf``. Por ejemplo:

.. code:: screen

    # ntpd -p /var/run/ntpd.pid

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Bajo FreeBSD?5.X se han renombrado algunas opciones del fichero
``/etc/rc.conf``. Se debe reemplazar cualquier aparici?n ``xntpd`` por
por ``ntpd``.

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

29.12.5. Utilizaci?n de ntpd junto con una conexi?n temporal a Internet
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El programa
`ntpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ntpd&sektion=8>`__ no
necesita una conexi?n permanente a Internet para poder funcionar
correctamente. No obstante si la conexi?n a Internet se encuentra
configurada con marcaci?n bajo demanda es una buena idea impedir que el
tr?fico de NTP lance una marcaci?n autom?tica o que mantenga la conexi?n
viva. Si se utiliza el PPP de entorno de usuario se pueden utilizar las
directivas ``filter`` dentro del fichero ``/etc/ppp/ppp.conf`` para
evitar esto. Por ejemplo:

.. code:: programlisting

     set filter dial 0 deny udp src eq 123
     # Evita que el tr??fico NTP inice una llamada saliente
     set filter dial 1 permit 0 0
     set filter alive 0 deny udp src eq 123
     Evita que el tr??ficoNTP entrante mantenga abierta la conexi??n
     set filter alive 1 deny udp dst eq 123
     Evita que el tr??fico NTP saliente mantenga abierta la conexi??n
     set filter alive 2 permit 0/0 0/0

Para ?s detalles consulte la secci?n ``PACKET FILTERING`` de
`ppp(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ppp&sektion=8>`__ y
los ejemplos que se encuentran en ``/usr/share/examples/ppp/``.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Algunos proveedores de acceso a Internet bloquean paquetes que utilizan
n?meros de puertos bajos impidiendo que los paquetes de vuelta alcancen
nuestra m?quina.

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

29.12.6. Informaci?n adicional
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Hay documentaci?n sobre el servidor NTP en formato HTML en
``/usr/share/doc/ntp/``.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------+----------------------------------------+--------------------------------------------+
| `Anterior <network-dns.html>`__?   | `Subir <advanced-networking.html>`__   | ?\ `Siguiente <network-natd.html>`__       |
+------------------------------------+----------------------------------------+--------------------------------------------+
| 29.11. DNS?                        | `Inicio <index.html>`__                | ?29.13. Traducci?n de direcciones de red   |
+------------------------------------+----------------------------------------+--------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
