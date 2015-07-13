==============
14.11. OpenSSH
==============

.. raw:: html

   <div class="navheader">

14.11. OpenSSH
`Anterior <ipsec.html>`__?
Cap?tulo 14. Seguridad
?\ `Siguiente <fs-acl.html>`__

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

14.11. OpenSSH
--------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Escrito por Chern Lee.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

OpenSSH es un conjunto de herramientas de conectividad que se usan para
acceder a sistemas remotos de forma segura. Puede usarse como sustituto
directo de ``rlogin``, ``rsh``, ``rcp`` y ``telnet``. Adem?s cualquier
otra conexi?n TCP/IP puede reenviarse o enviarse a trav?s de un t?nel a
trav?s de SSH. OpenSSH cifra todo el tr?fico para eliminar de forma
efectiva el espionaje, el secuestro de conexiones, y otros ataques en la
capa de red.

OpenSSH est? a cargo del proyecto OpenBSD, y est? basado en SSH v1.2.12,
con todos los errores recientes corregidos y todas las actualizaciones
correspondientes. Es compatible con los protocolos SSH 1 y 2. OpenSSH
forma parte del sistema base desde FreeBSD?4.0.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

14.11.1. Ventajas de utilizar OpenSSH
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Normalmente, al utilizar
`telnet(1) <http://www.FreeBSD.org/cgi/man.cgi?query=telnet&sektion=1>`__
o
`rlogin(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rlogin&sektion=1>`__
los datos se env?an a trav?s de la red en limpio, es decir, sin cifrar.
Cualquier “sniffer” de red entre el cliente y el servidor puede robar la
informaci?n de usuario/contrase?a o los datos transferidos durante su
sesi?n. OpenSSH ofrece diversos m?todos de validaci?n y cifrado para
evitar que sucedan estas cosas.

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

14.11.2. Habilitar sshd
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El d?mon sshd est? habilitado por defecto FreeBSD?4.X y puede elegir
habilitarlo o no durante la instalaci?n en FreeBSD?5.X. Si quiere saber
si est? habilitado revise si la siguiente l?nea est? en ``rc.conf``:

.. code:: screen

    sshd_enable="YES"

Esta l?nea cargar?
`sshd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sshd&sektion=8>`__,
el programa d?mon de OpenSSH, en el arranque de su sistema. Puede
ejecutar el d?mon sshd tecleando ``sshd`` en la l?nea de ?rdenes.

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

14.11.3. Cliente SSH
~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

`ssh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh&sektion=1>`__
funciona de manera similar a
`rlogin(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rlogin&sektion=1>`__.

.. code:: screen

    # ssh user@example.com
    Host key not found from the list of known hosts.
    Are you sure you want to continue connecting (yes/no)? yes
    Host 'ejemplo.com' added to the list of known hosts.
    usuario@ejemplo.com's password: *******

El login continuar? como lo har?a si fuera una sesi?n de ``rlogin`` o
``telnet``. SSH utiliza un sistema de huellas de llaves para verificar
la autenticidad del servidor cuando el cliente se conecta. Se le pide al
usuario que introduzca ``yes`` solamente la primera vez que se conecta.
Todos los intentos futuros de login se verifican contra la huella de la
llave guardada la primera vez. El cliente SSH le alertar? si la huella
guardada difiere de la huella recibida en futuros intentos de acceso al
sistema. Las huellas se guardan en ``~/.ssh/known_hosts``, y en
``~/.ssh/known_hosts2`` las huellas SSH v2.

Por defecto las versiones recientes de los servidores OpenSSH solamente
aceptan conexiones SSH v2. El cliente utilizar? la versi?n 2 si es
posible y pasar? como respaldo a la versi?n 1. El cliente puede tambi?n
ser obligado a utilizar una u otra pas?ndole ``-1`` o ``-2``,
respectivamente para la versi?n 1 y la versi?n 2. Se mantiene la
compatibilidad del cliente con la versi?n 1 para mantener la
compatibilidad con versiones antiguas.

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

14.11.4. Copia segura
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

`scp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=scp&sektion=1>`__
funciona de manera muy similar a
`rcp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=rcp&sektion=1>`__;
copia un fichero desde o hacia un sistema remoto, con la diferencia de
que lo hace de una forma segura.

.. code:: screen

    #  scp usuario@ejemplo.com:/COPYRIGHT COPYRIGHT
    usuario@ejemplo.com's password: *******
    COPYRIGHT            100% |*****************************|  4735
    00:00
    #

Ya que la huella se guard? en este equipo durante el ejemplo anterior se
verifica ahora al utilizar
`scp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=scp&sektion=1>`__.

Los argumentos de
`scp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=scp&sektion=1>`__ son
similares a
`cp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=cp&sektion=1>`__, con
el fichero o ficheros como primer argumento, y el destino como segundo.
Ya que el fichero se transfiere a trav?s de la red, a trav?s de SSH, uno
o m?s argumentos tienen la estructura
``user@host:<ruta_al_fichero_remoto>``.

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

14.11.5. Configuraci?n
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Los ficheros de configuraci?n del sistema tanto para el d?mon OpenSSH
como para el cliente est?n en ``/etc/ssh``.

``ssh_config`` contiene las opciones del cliente, mientras que
``sshd_config`` configura el d?mon.

Adem?s las opciones ``sshd_program`` (``/usr/sbin/sshd`` por defecto), y
``sshd_flags`` de ``rc.conf`` ofrecer m?s niveles de configuraci?n.

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

14.11.6. ssh-keygen
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

`ssh-keygen(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-keygen&sektion=1>`__
le permite validar a un usuario sin pedirle la contrase?a:

.. code:: screen

    % ssh-keygen -t dsa
    Generating public/private dsa key pair.
    Enter file in which to save the key (/home/user/.ssh/id_dsa):
    Created directory '/home/user/.ssh'.
    Enter passphrase (empty for no passphrase):
    Enter same passphrase again:
    Your identification has been saved in /home/user/.ssh/id_dsa.
    Your public key has been saved in /home/user/.ssh/id_dsa.pub.
    The key fingerprint is:
    bb:48:db:f2:93:57:80:b6:aa:bc:f5:d5:ba:8f:79:17 usuario@host.ejemplo.com

`ssh-keygen(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-keygen&sektion=1>`__
crear? un par de llaves p?blica y privada para usar en la validaci?n. La
llave privada se guarda en ``~/.ssh/id_dsa`` o en ``~/.ssh/id_rsa``,
mientras que la llave p?blica se guarda en ``~/.ssh/id_dsa.pub`` o en
``~/.ssh/id_rsa.pub``, respectivamente para llaves DSA y RSA. La llave
p?blica debe guardarse en el ``~/.ssh/authorized_keys`` de la m?quina
remota para que la configuraci?n funcione. Las llaves RSA versi?n 1
deben guardarse en ``~/.ssh/authorized_keys``.

De este modo permitir? conexiones a la m?quina remota mediante llaves
SSH en lugar de contrase?as.

Si usa una contrase?a al ejecutar
`ssh-keygen(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-keygen&sektion=1>`__,
se le pedir? al usuario una contrase?a cada vez que quiera utilizar la
llave privada.
`ssh-agent(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-agent&sektion=1>`__
puede evitar la molestia de introducir repetidamente frases largas. esto
se explica m? adelante, en la `Secci?n?14.11.7, “ssh-agent y
ssh-add” <openssh.html#security-ssh-agent>`__.

.. raw:: html

   <div class="warning" xmlns="">

Aviso:
~~~~~~

Las opciones y ficheros pueden ser diferentes seg?n la versi?n de
OpenSSH que tenga en su sistema; para evitar problemas consulte la
p?gina de manual
`ssh-keygen(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-keygen&sektion=1>`__.

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

14.11.7. ssh-agent y ssh-add
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

`ssh-agent(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-agent&sektion=1>`__
y
`ssh-add(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-add&sektion=1>`__
ofrecen m?todos para que las llaves SSH se puedan cargar en memoria,
permitiendo eliminar la necesidad de teclear la contrase?a cada vez que
haga falta.

`ssh-agent(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-agent&sektion=1>`__
gestionar? la validaci?n utilizando la llave (o llaves) privada que le
cargue.
`ssh-agent(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-agent&sektion=1>`__
se usa para lanzar otras aplicaciones. En el nivel m?s b?sico puede
generar una shell o a un nivel m?s avanzado un gestor de ventanas.

Para usar
`ssh-agent(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-agent&sektion=1>`__
en una shell necesitar? primero ser invocado como argumento por una
shell. Segundo, a?ada la identidad ejecutando
`ssh-add(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-add&sektion=1>`__
y facilitando la contrase?a de la llave privada. Completados estos pasos
el usuario puede hacer
`ssh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh&sektion=1>`__ a
cualquier equipo que tenga instalada la llave p?blica correspondiente.
Por ejemplo:

.. code:: screen

    % ssh-agent csh
    % ssh-add
    Enter passphrase for /home/user/.ssh/id_dsa:
    Identity added: /home/user/.ssh/id_dsa (/home/user/.ssh/id_dsa)
    %

Para utilizar
`ssh-agent(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-agent&sektion=1>`__
en X11 tendr? que incluir una llamada a
`ssh-agent(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-agent&sektion=1>`__
en ``~/.xinitrc``. De este modo ofrecer? los servicios de
`ssh-agent(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-agent&sektion=1>`__
a todos los programas lanzados en X11. Veamos un ejemplo de
``~/.xinitrc``:

.. code:: programlisting

    exec ssh-agent startxfce4

Esto lanzar?a
`ssh-agent(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-agent&sektion=1>`__,
que a su vez lanzar?a XFCE cada vez que inicie X11. Hecho esto y una vez
reiniciado X11 para aplicar los cambios puede ejecutar
`ssh-add(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-add&sektion=1>`__
para cargar todas sus llaves SSH.

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

14.11.8. T?neles SSH
~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

OpenSSH permite crear un t?nel en el que encapsular otro protocolo en
una sesi?n cifrada.

La siguiente orden le dice a
`ssh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh&sektion=1>`__ que
cree un t?nel para telnet:

.. code:: screen

    % ssh -2 -N -f -L 5023:localhost:23 usuario@foo.ejemplo.com
    %

Veamos las opciones que se le han suministrado a ``ssh``:

.. raw:: html

   <div class="variablelist">

``-2``
    Obliga a ``ssh`` a utilizar la versi?n 2 del protocolo. (No la use
    si est? trabajando con servidores SSH antiguos)

``-N``
    Indica que no se ejecutar? una orden remota, o solamente t?nel. Si
    se omite, ``ssh`` iniciar?a una sesi?n normal.

``-f``
    Obliga a ``ssh`` a ejecutarse en segundo plano.

``-L``
    Indica un t?nel local seg?n el esquema
    *``puerto local:equipo remoto:puerto remoto``*.

``usuario@foo.ejemplo.com``
    El servidor SSH remoto.

.. raw:: html

   </div>

Un t?nel SSH crea un socket que escucha en ``localhost`` en el puerto
especificado. Luego reenv?a cualquier conexi?n recibida en el
puerto/equipo local v?a la conexi?n SSH al puerto o equipo remoto
especificado.

En el ejemplo el puerto *``5023``* en ``localhost`` se reenv?a al puerto
*``23``* del ``localhost`` de la m?quina remota. Ya que *``23``* es
telnet, esto crear?a una sesi?n telnet segura a trav?s de un t?nel SSH.

Puede usar esto para encapsular cualquier otro protocolo TCP inseguro
como SMTP, POP3, FTP, etc.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Ejemplo 14.1. Uso de SSH para crear un t?nel seguro para SMTP

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    % ssh -2 -N -f -L 5025:localhost:25 usuario@correo.ejemplo.com
    usuario@correo.ejemplo.com's password: *****
    % telnet localhost 5025
    Trying 127.0.0.1...
    Connected to localhost.
    Escape character is '^]'.
    220 correo.ejemplo.com ESMTP

Puede usar esta t?cnica junto con
`ssh-keygen(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-keygen&sektion=1>`__
y cuentas adicionales de usuario para crear un entorno m?s transparente,
esto es, m?s c?modo. Puede usar llaves en lugar de teclear contrase?as y
puede ejecutar los t?neles de varios usuarios.

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

14.11.8.1. Ejemplos pr?cticos de t?neles SSH
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

14.11.8.1.1. Acceso seguro a un servidor POP3
'''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

En el trabajo hay un servidor SSH que acepta conexiones desde el
exterior. En la misma red de la oficina reside un servidor de correo que
ejecuta un servidor POP3. La red, o ruta de red entre su casa y oficina
puede o no ser completamente de fiar. Debido a esto necesita revisar su
correo electr?nico de forma segura. La soluci?n es crear una conexi?n
SSH al servidor SSH de su oficina y llegar por un t?nel al servidor de
correo.

.. code:: screen

    % ssh -2 -N -f -L 2110:correo.ejemplo.com:110 usuario@servidor-ssh.ejemplo.com
    usuario@servidor-ssh.ejemplo.com's password: ******

cuando el t?nel est? funcionando haga que su cliente de correo env?e
peticiones POP3 a ``localhost`` en el puerto 2110. La conexi?n ser?
reenviada de forma totalmente segura a trave?s del t?nel a
``correo.ejemplo.com``.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

14.11.8.1.2. Saltarse un cortafuegos draconiano
'''''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Algunos administradores de red imponen reglas de cortafuegos
extremadamente draconianas, filtrando no solo las conexiones entrantes,
sino tambi?n las salientes. Tal vez solo se le otorgue acceso a m?quinas
remotas a trav?s de los puertos 22 y 80 para ssh y navegar en web.

Tal vez quiera acceder a otros servicios (que tal vez ni siquiera est?n
relacionados con el trabajo), como un servidor Ogg Vorbis para escuchar
m?sica. Si ese servidor Ogg Vorbis transmite en un puerto que no sea el
22 o el 80 no podr? tener acceso a ?l.

La soluci?n es crear una conexi?n SSH fuera del cortafuegos de su red y
utilizarla para hacer un t?nel al servidor Ogg Vorbis.

.. code:: screen

    % ssh -2 -N -f -L 8888:musica.ejemplo.com:8000 usuario@sistema-no-filtrado.ejemplo.org
    usuario@sistema-no-filtrado.ejemplo.org's password: *******

Haga que el programa con el que suele escuchar m?sica haga peticiones a
``localhost`` puerto 8888, que ser? reenviado a ``musica.ejemplo.com``
puerto 8000, evadiendo con ?xito el cortafuegos.

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

14.11.9. La opci?n de usuarios ``AllowUsers``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Limitar qu? usuarios pueden entrar y desde d?nde suele ser razonable. La
opci?n ``AllowUsers`` le permite configurarlo, por ejemplo, para
permitir entrar solamente al usuario ``root`` desde ``192.168.1.32``.
Puede hacerlo con algo parecido a esto en ``/etc/ssh/sshd_config``:

.. code:: programlisting

    AllowUsers root@192.168.1.32

Para permitir al usuario ``admin`` la entrada desde cualquier lugar,
solamente introduzca el nombre de usuario:

.. code:: programlisting

    AllowUsers admin

Puede listar m?ltiples usuarios en la misma l?nea:

.. code:: programlisting

    AllowUsers root@192.168.1.32 admin

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Es importante que incluya a cada usuario que necesite entrar a esta
m?quina o no podr?n entrar.

.. raw:: html

   </div>

Despu?s de hacer los cambios a b ``/etc/ssh/sshd_config`` debe decirle a
`sshd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sshd&sektion=8>`__
que cargue de nuevo sus ficheros de configuraci?n ejecutando:

.. code:: screen

    # /etc/rc.d/sshd reload

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

14.11.10. Lecturas complementarias
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

`OpenSSH <http://www.openssh.com/>`__

`ssh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh&sektion=1>`__
`scp(1) <http://www.FreeBSD.org/cgi/man.cgi?query=scp&sektion=1>`__
`ssh-keygen(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-keygen&sektion=1>`__
`ssh-agent(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-agent&sektion=1>`__
`ssh-add(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-add&sektion=1>`__
`ssh\_config(5) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh_config&sektion=5>`__

`sshd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sshd&sektion=8>`__
`sftp-server(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sftp-server&sektion=8>`__
`sshd\_config(5) <http://www.FreeBSD.org/cgi/man.cgi?query=sshd_config&sektion=5>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------+-----------------------------+--------------------------------------------------------------+
| `Anterior <ipsec.html>`__?   | `Subir <security.html>`__   | ?\ `Siguiente <fs-acl.html>`__                               |
+------------------------------+-----------------------------+--------------------------------------------------------------+
| 14.10. VPN sobre IPsec?      | `Inicio <index.html>`__     | ?14.12. Listas de control de acceso a sistemas de ficheros   |
+------------------------------+-----------------------------+--------------------------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
