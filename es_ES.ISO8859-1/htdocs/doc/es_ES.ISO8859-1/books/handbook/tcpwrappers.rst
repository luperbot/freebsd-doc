==================
14.6. TCP Wrappers
==================

.. raw:: html

   <div class="navheader">

14.6. TCP Wrappers
`Anterior <one-time-passwords.html>`__?
Cap?tulo 14. Seguridad
?\ `Siguiente <kerberosIV.html>`__

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

14.6. TCP Wrappers
------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Escrito por: Tom Rhodes.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Cualquiera que est? familiarizado con
`inetd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=inetd&sektion=8>`__
probablemente haya o?do hablar de TCP Wrappers, pero poca gente parece
comprender completamente su utilidad en un entorno de red. Parece que
todos quieren instalar un cortafuegos para manejar conexiones de red.
Aunque un cortafuegos tiene una amplia variedad de usos hay cosas que un
cortafuegos no es capaz de gestionar, como el env?o de texto como
respuesta al creador de la conexi?n. El software TCP hace esto y m?s. En
las siguientes secciones se explicar?n unas cuantas opciones de TCP
Wrappers y, cuando sea necesario, se mostrar?n ejemplos de
configuraciones.

El software TCP Wrappers extiende las habilidades de ``inetd`` para
ofrecer soporte para cada servidor d?mon bajo su control. Utilizando
este m?todo es posible proveer soporte de logs, devolver mensajes a
conexiones, permitir a un d?mon aceptar solamente conexiones internas,
etc. Aunque algunas de estas opciones pueden conseguirse gracias a un
cortafuegos, no s?lo a?adir? una capa extra de seguridad, sino que ir?
m?s all? del nivel de control ue un cortafuegos puede ofrecerle.

Las brillantes capacidades de TCP Wrappers no deben considerarse una
alternativa a un buen cortafuegos. TCP Wrappers puede usarse
conjuntamente con un cortafuegos u otro sistema de de seguridad, pues
ofrece una capa extra de protecci?n para el sistema.

Ya que es una extensi?n de la configuraci?n de ``inetd``, se da por
hecho que el lector ha le?do la secci?n `configuraci?n de
inetd <network-inetd.html>`__.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Aunque los programas ejecutados por
`inetd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=inetd&sektion=8>`__
no son exactamente “d?mons” tradicionalmente han recibido ese nombre.
D?mon es, por tanto, el t?rmino que usaremos en esta secci?n.

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

14.6.1. Configuraci?n inicial
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El ?nico requisito para usar TCP Wrappers en FreeBSD es que el servidor
``inetd`` se inicie desde ``rc.conf`` con la opci?n ``-Ww`` (es la
configuraci?n por defecto). Por descontado, se presupone que
``/etc/hosts.allow`` estar? correctamente configurado, pero
`syslogd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=syslogd&sektion=8>`__
enviar? mensajes a los logs del sistema si no es as?.

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

A diferencia de otras implementaciones de TCP Wrappers, se ha dejado de
usar ``hosts.deny``. Todas las opciones de configuraci?n deben ir en
``/etc/hosts.allow``.

.. raw:: html

   </div>

En la configuraci?n m?s simple las pol?ticas de conexi?n de d?mons est?n
configuradas ya sea a permitir o bloquear, dependiendo de las opciones
en ``/etc/hosts.allow``. La configuraci?n por defecto en FreeBSD
consiste en permitir una conexi?n a cada d?mon iniciado por ``inetd``.
Es posible modificar esta configuraci?n, pero explicaremos c?mo hacerlo
despu?s de exponer la configuraci?n b?sica.

La configuraci?n b?sica tiene la estructura
``d?mon : direcci?n : acci?n``, donde ``d?mon`` es el nombre de d?mon
que inicia ``inetd``. La ``direcci?n`` puede ser un nombre de equipo
v?lido, una direcci?n IP o IPv6 encerrada en corchetes ([?]). El campo
acci?n puede ser permitir o denegar para el dar el acceso apropiado.
Tenga presente que la configuraci?n funciona en base a la primera regla
cuya sem?ntica concuerde; esto significa que el fichero de configuraci?n
se lee en orden ascendente hasta que concuerde una regla. Cuando se
encuentra una concordancia se aplica la regla y el proceso se detendr?.

Existen muchas otras opciones pero estas se explican en una secci?n
posterior. Una l?nea de configuraci?n simple puede generarse mediante
datos as? de simples. Por ejemplo, para permitir conexiones POP3
mediante el d?mon
`mail/qpopper <http://www.freebsd.org/cgi/url.cgi?ports/mail/qpopper/pkg-descr>`__,
a?ada las siguientes l?neas a ``hosts.allow``:

.. code:: programlisting

    # This line is required for POP3 connections:
    qpopper : ALL : allow

Despues de a?adir esta l?nea tendr? que reiniciar ``inetd``. Use
`kill(1) <http://www.FreeBSD.org/cgi/man.cgi?query=kill&sektion=1>`__ o
use el par?metro *``restart``* de ``/etc/rc.d/inetd``.

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

14.6.2. Configuraci?n avanzada
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Las opciones avanzadas de TCP Wrappers le permiten un mayor control
sobre la gesti?n de conexiones. En algunos casos puede convenir el en?o
de un comentario a ciertos equipos o conexiones de d?mons. En otros
casos, quiz?s se deba registrar una entrada en un log o enviar un correo
al administrador. Otro tipo de situaciones pueden requerir el uso de un
servicio solamente para conexiones locales. Todo esto es posible gracias
al uso de unas opciones de configuraci?n conocidas como ``comodines``,
caracteres de expansi?n y ejecuci?n de ?rdenes externas. Las siguientes
dos secciones intentar?n cubrir estas situaciones.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

14.6.2.1. ?rdenes externas
^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Imaginemos una situaci?n en la que una conexi?n debe ser denegada pero
se debe mandar un motivo a quien intent? establecer esa conexi?n. ?C?mo?
Mediante la opci?n ``twist``. Ante un intento de conexi?n se invoca a
``twist``, que ejecuta una orden de shell o un “script”. Tiene un
ejemplo en el fichero ``hosts.allow``:

.. code:: programlisting

    # The rest of the daemons are protected.
    ALL : ALL \
            : severity auth.info \
            : twist /bin/echo "No se permite utilizar %d desde %h."

Este ejemplo muestra que el mensaje, “No se permite utilizar ``d?mon``
desde ``nombre de equipo``.” se enviar? en el caso de cualquier d?mon no
configurado previamente en el fichero de acceso. Esto es extremadamente
?til para enviar una respuesta al creador de la conexi?n justo despu?s
de que la conexi?n establecida es rechazada. Observe que cualquier
mensaje que se desee enviar *debe ir* entre comillas ``"``; esta regla
no tiene excepciones.

.. raw:: html

   <div class="warning" xmlns="">

Aviso:
~~~~~~

Es posible lanzar un ataque de denegaci?n de servicio al servidor si un
atacante o grupo de atacantes pueden llegar a sobrecargar estos d?mons
con peticiones de conexi?n.

.. raw:: html

   </div>

Otra posibilidad en estos casos es usar la opci?n ``spawn``. Igual que
``twist``, ``spawn`` niega impl?citamente la conexi?n, y puede usarse
para ejecutar ?rdenes de shell externos o “scripts”. A diferencia de
``twist``, ``spawn`` no enviar? una respuesta al origen de la conexi?n.
Veamos un ejemplo; observe la siguiente l?nea de configuraci?n:

.. code:: programlisting

    # No permitimos conexiones desde ejemplo.com:
    ALL : .ejemplo.com \
        : spawn (/bin/echo %a desde %h intento acceder a %d >> \
          /var/log/connections.log) \
        : deny

Esto denegar? todos los intentos de conexi?n desde el dominio
``*.ejemplo.com``; simult?neamente crear? una entrada con el nombre del
equipo, direcci?n IP y el d?mon al que intent? conectarse al fichero
``/var/log/connections.log``.

Adem?s de la sustituci?n de caracteres ya expuesta m?s arriba (por
ejemplo %a) existen unas cuantas m?s. Si quiere ver la lista completa
consulte la p?gina de manual
`hosts\_access(5) <http://www.FreeBSD.org/cgi/man.cgi?query=hosts_access&sektion=5>`__.

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

14.6.2.2. Opciones comod?n
^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Hasta ahora se ha usado ``ALL`` en todos los ejemplos, pero hay otras
opciones interesantes para extender un poco m?s la funcionalidad. Por
ejemplo, ``ALL`` puede usarse para concordar con cualquier instancia ya
sea un d?mon, dominio o direcci?n IP. Otro comod?n es ``PARANOID``, que
puede utilizarse para concordar con cualquier equipo que presente una
direcci?n IP que pueda estar falsificada. En otras palabras,
``paranoid`` puede usarse para definir una acci?n a tomar siempre que
tenga lugar una conexi?n desde una direcci?n IP que difiera de su nombre
de equipo. Quiz?s todo se vea m?s claro con el siguiente ejemplo:

.. code:: programlisting

    # Bloquear peticiones posiblemente falsificadas a sendmail:
    sendmail : PARANOID : deny

En ese ejemplo todas las peticiones de conexi?n a ``sendmail`` que
tengan una direcci?n IP que var?e de su nombre de equipo ser?n
denegadas.

.. raw:: html

   <div class="caution" xmlns="">

Atenci?n:
~~~~~~~~~

Utilizando ``PARANOID`` puede bloquear el acceso a servidores si el
cliente o el servidor tiene una configuraci?n de DNS incorrecta.
Recomendamos al administrador la m?xima cautela en su uso.

.. raw:: html

   </div>

Consulte
`hosts\_access(5) <http://www.FreeBSD.org/cgi/man.cgi?query=hosts_access&sektion=5>`__
si quiere saber m?s sobre los comodines y sus posibilidades de uso.

Si quiere que cualquiera de los ejemplos citados funcione debe comentar
la primera l?nea de ``hosts.allow`` (tal y como se dijo al principio de
la secci?n.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------------+-----------------------------+--------------------------------------+
| `Anterior <one-time-passwords.html>`__?   | `Subir <security.html>`__   | ?\ `Siguiente <kerberosIV.html>`__   |
+-------------------------------------------+-----------------------------+--------------------------------------+
| 14.5. Contrase?as de un solo uso?         | `Inicio <index.html>`__     | ?14.7. KerberosIV                    |
+-------------------------------------------+-----------------------------+--------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
