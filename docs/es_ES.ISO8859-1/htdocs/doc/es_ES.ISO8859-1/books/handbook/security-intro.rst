==================
14.2. Introducci?n
==================

.. raw:: html

   <div class="navheader">

14.2. Introducci?n
`Anterior <security.html>`__?
Cap?tulo 14. Seguridad
?\ `Siguiente <securing-freebsd.html>`__

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

14.2. Introducci?n
------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

La seguridad es un trabajo que que comienza y termina en el
administrador de sistema. Aunque que los sistemas multiusuario BSD UNIX?
posean una seguridad inherente, el trabajo de construir y mantener
mecanismos de seguridad adicionales para que los usuarios sean a?n m?s
“honestos” es probablemente una de las mayores tareas de la
administraci?n de sistemas. Los sistemas son tan seguros como uno los
haga, y no hay que olvidar que los problemas de seguridad compiten con
la comodidad a la que tendemos los humanos. Los sistemas UNIX? son
capaces de ejecutar una gran cantidad de procesos simult?neamente,
muchos de los cuales son servidores, lo que significa que las entidades
externas pueden conectarse y “hablar” con ellos. Del mismo modo que las
minicomputadoras de ayer se convirtieron en los sistemas de escritorio
de hoy en d?a, la seguridad se va convirtiendo en un problemas m?s y m?s
acuciante.

La seguridad bien entendida se implementa en capas, a la manera de una
“cebolla”. B?sicamente lo que se hace es crear la mayor cantidad posible
de capas de seguridad, para m?s tarde monitorizar el sistema en busca de
intrusos. No es conveniente exagerar la seguridad, ya que interferir?a
con la detecci?n, y la detecci?n es uno de los aspectos m?s importantes
de cualquier mecanismo de seguridad. Por ejemplo, no tiene mucho sentido
activar la bandera ``schg`` (consulte
`chflags(1) <http://www.FreeBSD.org/cgi/man.cgi?query=chflags&sektion=1>`__)
en cada binario del sistema, ya que aunque proteger?a en cierto modo los
binarios, har?a que cualquier cambio que pudiera realizar un atacante
una vez dentro del sistema fuera m?s dif?cil de detectar o incluso
hacerlo del todo imposible.

La seguridad del sistema depende tambi?n de estar preparados para
distintos tipos de ataque, incluyendo intentos de “tirar” la m?quina o
dejarla en un estado inutilizable, pero que no impliquen intentos de
comprometer el usuario ``root`` Los problemas de seguridad pueden
dividirse en diferentes categor?as:

.. raw:: html

   <div class="orderedlist">

#. Ataques de denegaci?n de servicio (DoS).

#. Comprometer cuentas de usuarios.

#. Comprometer root a trav?s de servidores accesibles.

#. Comprometer root desde cuentas de usuario.

#. Creaci?n de puertas traseras (“Backdoors”).

.. raw:: html

   </div>

Un ataque de denegaci?n de servicio es una acci?n que priva al sistema
de los recursos requeridos para su funcionamiento normal. Generalmente,
los ataques DoS son mecanismos de fuerza bruta que intentan “tumbar” el
sistema o hacerlo inutilizable sobrecargando la capacidad de sus
servidores o de la pila de red. Algunos ataques DoS intentan aprovechar
errores en la pila de red para “tumbar” el sistema con un solo paquete.
Estos ?ltimos ?nicamente pueden solucionarse aplicando al kernel una
actualizaci?n que subsane el error. Los ataques a servidores muchas
veces pueden solucionarse configurando las opciones apropiadas para
limitar la carga del sistema en condiciones adversas. Los ataques de
fuerza bruta a redes son m?s complicados. Los ataques con paquetes
enmascarados, por ejemplo, son casi imposibles de detener, a menos que
desconecte el sistema de Internet. Puede ser que no “tiren” el sistema,
pero saturar?n la conexi?n a Internet.

Comprometer una cuenta de usuario es mucho m?s com?n que un ataque DoS.
Muchos administradores de sistemas todav?a ejecutan servidores est?ndar
telnetd, rlogind, rshd y ftpd en sus m?quinas. Estos servidores, por
defecto no operan a trav?s de conexiones cifradas. El resultado es que
se si se tiene una base de usuarios de tama?o medio, tarde o temprando
la contrase?a de uno (o m?s) de sus usuarios ser? descubierta durante
sus accesos al sistema desde ubicaciones remotas.(que es, por otra
parte, la forma m?s com?n y m?s c?moda de acceder a un sistema). El
administrador de sistemas atento analizar? sus logs de acceso remoto en
busca de direcciones origen spspechosas, incluso entre los accesos al
sistema.

Se debe asumir *siempre* que, una vez que el atacante tiene acceso a una
cuenta de usuario, el atacante puede comprometer la cuenta ``root``. En
realidad en un sistema bien mantenido y asegurado el acceso a una cuenta
de usuario no necesariamente da al atacante acceso a ``root``. Esta
precisi?n es importante porque sin acceso a ``root`` el atacante
dif?cilmente podr? esconder sus huellas; podr?, como mucho, hacer poco
m?s que sembrar el caos en los ficheros del usuario o “tirar” la
m?quina. Comprometer cuentas de usuario es muy com?n porque los usuarios
tienden a no tomar las precauciones que toma el administrador.

Los administradores de sistemas deben tener presente que existen muchas
formas potenciales de comprometer la cuenta ``root`` de una m?quina. El
atacante puede conocer la contrase?a de ``root``, el atacante puede
encontrar un error en un servidor que se ejecuta como root y ser capaz
de comprometer ``root`` a trav?s de una conexi?n de red a ese servidor;
puede ser que el atacante sepa de la existencia de un error en un
programa suid-root que le permita comprometer ``root`` una vez dentro de
una cuenta de usuario. Si un atacante encuentra la manera de comprometer
la cuenta ``root`` de una m?quina puede que no necesite instalar una
puerta trasera. Muchos de los agujeros ``root`` encontrados y cerrados
hasta la fecha implican una cantidad considerable de trabajo para el
atacante limpiando todo despu?s del ataque, as? que la mayor?a de los
atacantes instalan puertas traseras. Una puerta trasera facilita al
atacante una forma sencilla de recuperar el acceso de ``root`` al
sistema, pero tambi?n proporciona al administrador de sistemas
inteligente una forma de detectar la intrusi?n. Si hace imposible a un
atacante la instalaci?n de una puerta trasera puede estar actuando en
detrimento de su seguridad, porque no cerrar? el agujero que el atacante
encontr? para accder al sistema la primera vez que lo hizo.

Las medidas de seguridad se implementan en un modelo multicapa (tipo
“cebolla”), que puede categorizarse del siguiente modo:

.. raw:: html

   <div class="orderedlist">

#. Asegurar ``root`` y cuentas administrativas.

#. Asegurar los servidores que se ejecuten como ``root`` los binarios
   suid/sgid.

#. Asegurar cuentas de usuario.

#. Asegurar el fichero de contrase?as.

#. Asegurar el n?cleo del kernel, los dispositivos en bruto y el sistema
   de ficheros.

#. Detecci?n r?pida de cambios hechos al sistema.

#. Paranoia.

.. raw:: html

   </div>

La siguiente secci?n de este cap?tulo tratar? los puntos de arriba con
mayor profundidad.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------+-----------------------------+--------------------------------------------+
| `Anterior <security.html>`__?   | `Subir <security.html>`__   | ?\ `Siguiente <securing-freebsd.html>`__   |
+---------------------------------+-----------------------------+--------------------------------------------+
| Cap?tulo 14. Seguridad?         | `Inicio <index.html>`__     | ?14.3. Asegurar FreeBSD                    |
+---------------------------------+-----------------------------+--------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
