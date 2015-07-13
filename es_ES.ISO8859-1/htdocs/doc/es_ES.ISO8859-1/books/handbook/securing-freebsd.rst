======================
14.3. Asegurar FreeBSD
======================

.. raw:: html

   <div class="navheader">

14.3. Asegurar FreeBSD
`Anterior <security-intro.html>`__?
Cap?tulo 14. Seguridad
?\ `Siguiente <crypt.html>`__

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

14.3. Asegurar FreeBSD
----------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Orden vs. protocolo:
~~~~~~~~~~~~~~~~~~~~

En este cap?tulo usaremos el texto en negrita para referirnos a una
orden o aplicaci?n, y una fuente en ``cursiva`` para referirnos a
?rdenes espec?ficas. Usaremos un tipo normal para los protocolos. Esta
diferencia tipogr?fica nos ser? ?til por ejemplo con ssh, que es tanto
un protocolo como una orden.

.. raw:: html

   </div>

Las siguientes secciones cubren los m?todos a seguir para asegurar su
sistema FreeBSD que se mencionados en la `secci?n
anterior <security-intro.html>`__ de este cap?tulo.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

14.3.1. Asegurar la cuenta ``root`` y las cuentas administrativas
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

En primer lugar, no se moleste en asegurar las cuentas administrativas
(o “staff”) si no ha asegurado la cuenta ``root``. La mayor?a de los
sistemas tienen una contrase?a asignada para la cuenta ``root``. Lo
primero que se hace es asumir que la contrase?a est? *siempre*
amenazada. Esto no significa que deba eliminar la contrase?a. La
contrase?a es casi siempre necesaria para el acceso por consola a la
m?quina; significa que no se debe permitir el uso de la contrase?a fuera
de la consola o, mejor a?n, mediante
`su(1) <http://www.FreeBSD.org/cgi/man.cgi?query=su&sektion=1>`__. Por
ejemplo, aseg?rese de que sus ptys aparezcan como *inseguras* en el
fichero ``/etc/ttys``, con lo que har? que los accesos como ``root`` v?a
``telnet`` o ``rlogin`` no sean posibles. Si utiliza otros tipos de
login como sshd aseg?rese de que los accesos al sistema como ``root``
est?n tambi?n deshabilitados. Para ello edite su
``/etc/ssh/sshd_config`` y aseg?rese de que ``PermitRootLogin`` est?
puesto a ``NO``. Estudie cada m?todo de acceso: hay servicios como FTP
que frecuentemente son origen de grietas en la estructura del sistema.
El acceso directo como usuario ``root`` s?lamente debe permitirse a
trav?s de la consola.

Es evidente que, como administrador del sistema, debe usted tener la
posibilidad de acceder a ``root``, as? que tendr? que abrir algunos
agujeros, pero debe asegurarse de que estos agujeros necesiten
contrase?as adicionales para verificar su correcto uso. Puede hacer que
``root`` sea accesible a?adiendo cuentas administrativas al grupo
``wheel`` (en ``/etc/group``). El personal que administra los sistemas
que aparezcan en el grupo en el grupo ``wheel`` pueden hacer ``su`` a
``root``. Nunca debe de proporcionar al personal administrativo el
acceso nativo a ``wheel`` poni?ndolos en el grupo ``wheel`` en su
entrada de contrase?a. Las cuentas administrativas deben colocarse en un
grupo ``staff``, y agregarse despu?s al grupo ``wheel`` en
``/etc/group``. S?lo aquellos administradores que realmente necesiten
acceder a ``root`` deben pertenecer al grupo ``wheel``. Tambi?n es
posible, mediante un m?todo de autentificaci?n como Kerberos, usar el
fichero ``.k5login`` en la cuenta ``root`` para permitir un
`ksu(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ksu&sektion=1>`__ a
``root`` sin tener que colocar a nadie en el grupo ``wheel``. Puede ser
una mejor soluci?n, ya que el mecanismo ``wheel`` a?n permite a un
atacante comprometer ``root`` si el intruso ha conseguido el fichero de
contrase?as y puede comprometer una cuenta de administraci?n. Recurrir
al mecanismo ``wheel`` es mejor que no tener nada, pero no es
necesariamente la opci?n m?s segura.

Una manera indirecta de asegurar las cuentas de staff y el acceso a
``root`` es utilizar un m?todo de acceso alternativo: es lo que se
conoce como “estrellar” las contrase?as cifradas de las cuentas
administrativas. Use
`vipw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=vipw&sektion=8>`__
para reemplazar cada contrase?a cifrada por un s?lo caracter asterisco
(“``*``”). Esto actualizar? ``/etc/master.passwd`` y la base de datos de
usuario/contrase?a y deshabilitar? los accesos al sistema validados
mediante contrase?as.

Veamos una cuenta administrativa t?pica:

.. code:: programlisting

    foobar:R9DT/Fa1/LV9U:1000:1000::0:0:Foo Bar:/home/foobar:/usr/local/bin/tcsh

y c?mo deber?a quedar:

.. code:: programlisting

    foobar:*:1000:1000::0:0:Foo Bar:/home/foobar:/usr/local/bin/tcsh

Este cambio evitar? que se efect?en logins normales, ya que la
contrase?a cifrada nunca se corresponder? con “``*``”. Hecho esto, el
personal de administraci?n tendr? que usar otro mecanismo de validaci?n
como
`kerberos(1) <http://www.FreeBSD.org/cgi/man.cgi?query=kerberos&sektion=1>`__
o `ssh(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh&sektion=1>`__
que use un par de llave p?blica/privada. Si decide usar algo como
Kerberos tendr? que asegurar la m?quina que ejecuta los servidores
Kerberos y su estaci?n de trabajo. Si usa un par de llave
p?blica/privada con ssh, debe asegurar la m?quina *desde* desde la que
se hace el login (normalmente nuestra estaci?n de trabajo). Puede a?adir
una capa adicional de protecci?n al par de llaves protegi?ndolas con
contrase?a al crearlo con
`ssh-keygen(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ssh-keygen&sektion=1>`__.
El “estrellado” de las contrase?as administrativas tambi?n garantiza que
dicho personal s?lo pueda entrar a trav?s de m?todos de acceso que haya
usted configurado. As? obligar? al personal administrativo a usar
conexiones seguras, cifradas, en todas sus sesiones, lo que cierra un
importante agujero de seguridad al que recurren muchos intrusos: usar un
sniffer (olfateador) de red desde una m?quina que le permita hacer tal
cosa.

Los mecanismos de seguridad m?s indirectos tambi?n asumen que est?
validando su identidad desde un servidor m?s restrictivo un servidor
menos restrictivo. Por ejemplo, si su m?quina principal ejecuta toda
clase de servidores su estaci?n de trabajo no debe ejecutar ninguno.
Para que su estaci?n de trabajo sea razonablemente segura debe ejecutar
los m?nimos servidores posibles, si es posible ninguno, y debe usar un
salvapantallas protegido por contrase?a. Es evidente que un atancante
con acceso f?sico al sistema puede romper cualquier barrera de seguridad
que se disponga. Es un problema a tener en cuenta, pero la mayor?a de
las intrusiones tienen lugar de forma remota, a trav?s de la red, por
parte de gente que no tiene acceso f?sico a su estaci?n de trabajo ni a
sus servidores.

Usar Kerberos le ofrece tambi?n el poder de deshabilitar o cambiar la
contrase?a para una cuenta administrativa en un lugar, y que tenga un
efecto inmediato en todas las m?quinas en las cuales ese administrador
pueda tener una cuenta. Si una de esas cuentas se ve comprometida la
posibilidad para cambiar instant?neamente su contrase?a en todas las
m?quinas no debe ser desestimada. Con contrase?as distintas, el cambio
de una contrase?a en N m?quinas puede ser un problema. Tambi?n puede
imponer restricciones de re-contrase?as con Kerberos: no s?lo se puede
hacer un ticket de Kerberos que expire despu?s de un tiempo, sino que el
sistema Kerberos puede requerir al usuario que escoja una nueva
contrase?a despu?s de cierto tiempo (digamos una vez al mes).

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

14.3.2. Asegurar servidores que se ejecutan como ``root`` y binarios SUID/SGID
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Un administrador de sistemas prudente s?lo ejecutar? los servidores que
necesita, ni uno m?s ni uno menos. Dese cuenta de que los servidores
ajenos son los m?s propensos a contener errores. Por ejemplo, ejecutando
una versi?n desfasada de imapd o popper es como dar una entrada
universal de ``root`` al mundo entero. Nunca ejecute un servidor que no
haya revisado cuidadosamente. Muchos servidores no necesitan ejecutarse
como ``root``. Por ejemplo, los d?mons ntalk, comsat y finger pueden
ejecutarse en una *caja de arena (sandbox)* especial de usuario. Una
caja de arena no es perfecta, a menos que pase por muchos problemas,
pero la aproximaci?n de cebolla a la seguridad prevalece a?n y todo: Si
alguien es capaz de penetrar a trav?s de un servidor ejecut?ndose en una
caja de arena, todav?a tendr? que salir de la caja de arena. Cuantas m?s
capas tenga que romper el atacante menor ser? la posibilidad de ?xito
que tenga. Se han encontrado v?as de entrada a ``root`` en virtualmente
todos los servidores que se haya ejecutado como ``root``, incluyendo
servidores b?sicos del sistema. Si est? tiene una m?quina a trav?s de la
cual la gente s?lo entra por sshd, y nunca entra por telnetd, rshd, o
rlogind *apague esos servicios*.

FreeBSD ejecuta por defecto ntalkd, comsat y finger en una caja de
arena. Otro programa que puede ser candidato para ejecutarse en una caja
de arena es
`named(8) <http://www.FreeBSD.org/cgi/man.cgi?query=named&sektion=8>`__.
``/etc/defaults/rc.conf`` contiene las directrices necesarias (con
comentarios) para usar named en una caja de arena. Dependiendo de si
est? instalando un nuevo sistema o actualizando un sistema ya existente,
las cuentas especiales de usuario que usan estas cajas de arena puede
que no est?n instaladas. El administrador de sistemas prudente debe
investigar e implementar cajas de arena para servidores siempre que sea
posible.

Existen numerosos servidores que no se suelen ejecutar en cajas de
arena: sendmail, imapd, ftpd, y otros. Existen alternativas para algunos
de ellos, pero instalarlas puede requerir m?s trabajo del que tal vez
est? dispuesto a realizar (el factor comodidad ataca de nuevo). Tal vez
tenga que ejecutar estos servidores como ``root`` y depender de otros
mecanismos para detectar intrusiones que puedan tener lugar a trav?s de
ellos.

Los otros grandes agujeros potenciales de ``root`` que encontramos en un
sistema son los binarios suid-root y sgid. La mayor?a de estos binarios,
como rlogin, est?n en ``/bin``, ``/sbin``, ``/usr/bin`` o ``/usr/sbin``.
Aunque no hay nada absolutamente seguro los binarios suid y sgid del
sistema por defecto pueden considerarse razonablemente seguros. A?n as?,
de vez en cuando aparecen agujeros ``root`` en estos binarios. En 1998
se encontr? un agujero ``root`` en ``Xlib``, que hac?a a xterm (que
suele ser suid) vulnerable. Es mejor prevenir que curar, y el
administrador de sistemas prudente restringir? los binarios suid, que
s?lo el personal de administraci?n debe ejecutar, a un grupo especial al
que s?lo dicho personal pueda acceder, y deshacerse de cualquier binario
suid (``chmod 000``) que no se use. Un servidor sin pantalla
generalmente no necesita un binario xterm. Los binarios sgid pueden ser
igual de peligrosos. Si un intruso logra comprometer un binario
sgid-kmem, el intruso podr?a leer ``/dev/kmem`` y llegar a leer el
fichero cifrado de contrase?as, poniendo en compromiso potencial
cualquier cuenta con contrase?a. Por otra parte, un intruso que
comprometa el grupo ``kmem`` puede monitorizar las pulsaciones de
teclado que se envien a trav?s de ptys, incluyendo las ptys a las que
acceden usuarios que emplean m?todos seguros. Un intruso que comprometa
el grupo ``tty`` puede escribir en la pty de casi cualquier usuario. Si
un usuario ejecuta un programa de terminal o un emulador capaz de
simular un teclado, el intruso podr?a generar un flujo de datos que
provoque que la terminal del usuario muestre una orden en pantalla,
orden que el usuario ejecutar?.

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

14.3.3. Asegurar las cuentas de usuario
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Las cuentas de usuario suelen ser las m?s dif?ciles de asegurar. Aunque
puede imponer restricciones de acceso draconianas a su personal
administrativo y “estrellar” sus contrase?as, tal vez no pueda hacerlo
con todas las cuentas de todos sus usuarios. Si mantiene el control en
un grado suficiente quiz?s lo logre y sea capaz de hacer que las cuentas
de sus usuarios sean seguras. Si no, tendr? que ser m?s cuidadoso (a?n)
en la monitorizaci?n de esas cuentas. Usar ssh y Kerberos en cuentas de
usuario da m?s problemas debido al soporte t?cnico y administrativo que
requerir?, pero sigue siendo mejor soluci?n que un fichero de
contrase?as cifradas.

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

14.3.4. Asegurar el fichero de contrase?as
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

La ?nica manera segura es ponerle ``*`` a tantas contrase?as como sea
posible y utilizar ssh o Kerberos para acceder a esas cuentas. Aunque el
fichero cifrado de contrase?as (``/etc/spwd.db``) s?lo puede ser legible
para ``root``, puede que un intruso consiga acceso de lectura a ese
fichero, incluso sin haber alcanzado el acceso de escritura como root.

Sus “scripts” de seguridad deben buscar siempre cambios en el fichero de
contrase?as (consulte `Revisi?n de integridad de
ficheros <securing-freebsd.html#security-integrity>`__ m?s abajo) e
informar de ellos.

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

14.3.5. Asegurar el Kernel, dispositivos en bruto y el sistema sistema de ficheros
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Si un atacante compromete ``root`` puede hacer cualquier cosa, pero hay
ciertas cosas que puede usted preparar para “curarse en salud”. Por
ejemplo, la mayor?a de los kernel modernos tienen un dispositivo de los
Kernels modernos tienen un integrado un dispositivo de paquetes. En
FreeBSD se llama ``bpf``. Un intruso t?pico tratar? de ejecutar un
“sniffer” de paquetes en una m?quina comprometida. No deber?a darle a
ese intruso tal recurso, y la mayor?a de los sistemas no necesitan el
dispositivo ``bpf``.

Pero si desactiva el dispositivo ``bpf`` todav?a tendr? que preocuparse
por ``/dev/mem`` y ``/dev/kmem``. Desde ellos el intruso podr?a en
dispositivos de disco en bruto. Tambi?n hay que tener muy en cuenta una
opci?n del kernel llamada cargador de m?dulos,
`kldload(8) <http://www.FreeBSD.org/cgi/man.cgi?query=kldload&sektion=8>`__.
Un intruso con iniciativa puede usar un m?dulo KLD para instalar su
propio dispositivo ``bpf``, u otro dispositivo que le permita el
“sniffing” en un kernel en ejecuci?n. Para prevenir estos problemas debe
ejecutar el kernel en un nivel de seguridad mayor, al menos en
securelevel 1. Puede configurar el securelevel mediante una ``sysctl``
en la variable ``kern.securelevel``. Una vez que tiene su securelevel a
1, los accesos de escritura a dispositivos en bruto se denegar?n y se
impondr?n las banderas especiales ``schg``. Tambi?n debe cerciorarse de
activar la bandera ``schg`` en binarios cr?ticos para el arranque,
directorios y scripts (dicho de otro modo, todo aquello que se ejecuta
*antes* de que se active el securelevel). Puede ser que todo esto sea
una exageraci?n, sobre todo teniendo en cuenta que la actualizaci?n del
sistema se complica bastante a medida que se incrementa el nivel de
seguridad. Puede ejecutar el sistema a un nivel de seguridad superior
pero no activar la bandera ``schg`` en cada fichero y directorio del
sistema. Otra posibilidad es montar ``/`` y ``/usr`` como s?lo lectura.
Recuerde que siendo demasiado draconiano en aquello que busca proteger
puede dificultar mucho la detecci?n de una intrusi?n.

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

14.3.6. Revisi?n de integridad de ficheros: binarios, ficheros de configuraci?n, etc.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Cuando se piensa de protecc?n, s?lo se puede proteger la configuraci?n
central del sistema y los ficheros de control hasta el momento en el que
el factor comodidad salta a la palestra. Por ejemplo, si usa ``chflags``
para activar el bit ``schg`` en la mayor?a de los ficheros de ``/`` y
``/usr`` probablemente sea contraproducente; puede proteger los ficheros
haci?ndolo, pero tambi?n cierra una v?a de detecci?n. La ?ltima capa de
su modelo de seguridad tipo cebolla es quiz?s la m?s importante: la
detecci?n. El resto de su estructura de seguridad ser? in?til (o peor
a?n, le proporcionar? un sentimiento de seguridad totalmente infundado)
si no puede detectar posibles intrusiones. La mitad del trabajo de la
cebolla es alentar al atacante, en lugar de detenerlo, para darle a la
parte de la ecuaci?n de detecci?n una oportunidad de atraparlo con las
manos en la masa.

La mejor manera de detectar una intrusi?n es buscar ficheros
modificados, perdidos, o cuya presencia o estado sea inesperado. La
mejor forma de buscar ficheros modificados es desde otro sistema (que
muchas veces es centralizado) con acceso restringido. Escribir sus
“scripts” de seguridad en un sistema “extraseguro” y con acceso
restringido los hace casi invisibles a posibles atacantes, y esto es
algo muy importante. potenciales, y esto es importante. Para poderle
sacar el m?ximo partido debe proporcionar a esa m?quina con acceso
restringido un acceso preferente al contenido de las otras m?quinas de
su entorno; suele hacerse mediante la importaci?n v?a NFS de s?lo
lectura de las dem?s m?quinas, o configurando pares de llaves ssh para
acceder a las otras m?quinas desde la que tiene el acceso restringido.
Si exceptuamos el tr?fico de red, NFS es el m?todo menos visible y le
permite monitorizar los sistemas de ficheros de cada m?quina cliente de
forma pr?cticamente indetectable. Si su servidor de acceso restringido
est? conectado a las m?quinas clientes a trav?s de un concentrador o a
trav?s de varias capas de encaminamiento el m?todo NFS puede ser muy
inseguro, por lo que ssh puede ser la mejor opci?n, incluso con las
huellas de auditor?a que ssh va dejando.

Una vez que le da a una m?quina de acceso restringido (al menos) acceso
de lectura a los sistemas cliente que va a monitorizar, tendr? que
escribir “scripts” para efectuar la monitorizaci?n. Si va a usar un
montaje NFS puede escribir “scripts” utilizando simples herramientas del
sistema como
`find(1) <http://www.FreeBSD.org/cgi/man.cgi?query=find&sektion=1>`__ y
`md5(1) <http://www.FreeBSD.org/cgi/man.cgi?query=md5&sektion=1>`__. Es
aconsejable ejecutar MD5 f?sicamente en los ficheros de las m?quinas
cliente al menos una vez al d?a, y comprobar los ficheros de control
(los que hay en ``/etc`` y ``/usr/local/etc``) con una frecuencia
incluso mayor. Si aparecen discrepancias al compararlos con la
informaci?n basada en MD5 que la m?quina de acceso restringido usa como
base debe hacer una comprobaci?n inmediata y profunda. Un buen “script”
tambi?n debe buscar binarios que sean suid sin raz?n aparente, y
ficheros nuevos o borrados en particiones del sistema como ``/`` y
``/usr``.

Si usa ssh en lugar de NFS ser? mucho m?s complicado escribir el
“script” de seguridad. En esencia, tiene que pasar por ``scp`` los
“scripts” a la m?quina cliente para poder ejecutarlos, haci?ndolos
visibles; por seguridad, tambi?n tendr? que pasar v?a ``scp`` los
binarios (por ejemplo find) que utilizan dichos “scripts”. El cliente
ssh de la m?quina cliente puede estar ya bajo el control del intruso.
Con todo y con eso, puede ser necesario usar ssh si trabaja sobre
enlaces inseguros, tambi?n es mucho m?s dif?cil de manejar.

Un buen “script” de seguridad buscar? tambi?n cambios en la
configuraci?n de los ficheros de acceso de usuarios y miembros del
personal de administraci?n: ``.rhosts``, ``.shosts``,
``.ssh/authorized_keys``, etc; en resumen, ficheros fuera del rango de
revisi?n ``MD5``.

Si tiene que v?rselas con una cantidad enorme de espacio en disco para
usuarios le llevar? mucho tiempo recorrer cada fichero de cada
partici?n. En su caso ser?a una buena idea configurar mediante opciones
de montaje la deshabilitaci?n de binarios y dispositivos suid en esas
particiones. Revise las opciones ``nodev`` y ``nosuid`` de
`mount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount&sektion=8>`__.
Deber?a comprobarlos de todas maneras al menos una vez por semana, ya
que el objeto de esta capa es detectar intrusiones, efectivas o no.

La contabilidad de procesos (vea
`accton(8) <http://www.FreeBSD.org/cgi/man.cgi?query=accton&sektion=8>`__)
es una opci?n con una carga relativamente ligera para el sistema
operativo, y puede ayudarle como mecanismo de evaluaci?n tras una
intrusi?n. Es especialmente ?til para rastrear c?mo consigui?n realmente
acceder el intruso al sistema (asumiendo que el fichero est? intacto
despu?s de la intrusi?n).

Los “scripts” de seguridad deben procesar los logs, y los propios logs
deben generarse de la forma m?s segura posible: un syslog remoto puede
ser muy ?til. Un intruso trata de cubrir sus huellas, los logs son un
recurso cr?tico cuando el administrador de sistemas intenta determinar
la hora y el m?todo de la intrusi?n inicial. La ejecuci?n de la consola
del sistema en un puerto serie y recolectar la informaci?n de forma
peri?dica en una m?quina segura de monitorizaci?n de consolas es una
forma de cumplir esta tarea.

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

14.3.7. Paranoia
~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Un poco de paranoia nunca est? de m?s. Como norma, un administrador de
sistemas puede a?adir cualquier tipo de mecanismo de seguridad siempre y
cuando no afecte a la comodidad, y puede a?adir mecanismos de seguridad
que *s?* afecten a la comodidad si tiene una buena raz?n para hacerlo.
M?s a?n, un administrador de seguridad debe mezclar un poco de ambas
cosas: si sigue al pie de la letra las recomendaciones que se dan en
este documento tambi?n est? sirviendo en bandeja de plata al posible
atancante su metodolog?a. Ese posible atacante tambi?n tiene acceso a
este documento.

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

14.3.8. Ataques de denegaci?n de servicio
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Esta secci?n cubre ataques de denegaci?n de servicio. Un ataque DoS
suele consistir en un ataque mediante paquetes. NO hay mucho que pueda
hacerse contra un ataque mediante paquetes falsificados (“spoofed”) que
busque saturar su red, pero puede limitar el da?o asegur?ndose de que
los ataques no tiren sus servidores.

.. raw:: html

   <div class="orderedlist">

#. Limitaci?n de forks en el servidor.

#. Limitaci?n de ataques “springboard” (ataques de respuesta ICMP, ping
   broadcast, etc.)

#. Cach? de rutas del kernel.

.. raw:: html

   </div>

Un t?pico ataque DoS contra un servidor con instancias (forks) ser?a
tratar de provocar que el servidor consuma procesos, descriptores de
fichero y memoria hasta tirar la m?quina. inetd (consulte
`inetd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=inetd&sektion=8>`__)
dispone de varias opciones para limitar este tipo de ataque. Recuerde
que aunque es posible evitar que una m?quina caiga, generalmente no es
posible evitar que un servicio sea vea interrumpido a causa el ataque.
Consulte la p?gina de manual de inetd atentamente y sobre todo estudie
las las opciones ``-c``, ``-C``, y ``-R``. Observe que los ataques con
direcciones IP falsificadas sortear?n la opci?n ``-C`` de inetd, as? que
debe usar una combinaci?n de opciones. Algunos servidores aut?nomos
(“standalone”) cuentan con par?metros de autolimitaci?n de instancias.

Sendmail tiene la opci?n ``-OMaxDaemonChildren``, que tiende a funcionar
mucho mejor que las opciones de l?mite de carga de sendmail debido al
retraso que provoca la carga. Debe especificar un par?metro
``MaxDaemonChildren`` al inicio de sendmail que sea lo suficientemente
alto como para gestionar la carga esperada, pero no tan alto que la
computadora no pueda absorber tal n?mero de sendmails sin caerse de
boca. Tambi?n es prudente ejecutar sendmail en modo de cola
(``-ODeliveryMode=queued``) y ejecutar el d?mon (``sendmail -bd``) de
manera independiente de las ejecuciones de cola (``sendmail -q15m``). Si
a pesar de todo necesita entregas en tiempo real puede ejecutar la cola
a un intervalo menor, como ``-q1m``, pero aseg?rese de especificar una
opci?n ``MaxDaemonChildren`` razonable para *ese* sendmail y as? evitar
fallos en cascada.

Syslogd puede recibir ataques directos y se recomienda encarecidamente
que utilice la opci?n ``-s`` siempre que sea posible, y si no la opci?n
``-a``.

Tambi?n debe ser extremadamente cuidadoso con servicios de conexi?n
inversa como el ident inverso de TCP Wrapper, que puede recibir ataques
directos. No se suele usar el ident inverso de TCP Wrapper por esa misma
raz?n.

Es una muy buena idea proteger los servicios internos de acceso externo
protegi?ndolos v?a con un cortafuegos en los routers de frontera. La
idea es prevenir ataques de saturaci?n desde el exterior de la LAN, y no
tanto para proteger servicios internos de compromisos ``root`` basados
en red. Configure siempre un cortafuegos exclusivo, esto es, “restringir
todo *menos* los puertos A, B, C, D y M-Z”. De esta manera restringir?
todos sus puertos con n?meros bajos excepto ciertos servicios
espec?ficos como named (si es el servidor primario de una zona), ntalkd,
sendmail, y otros servicios accesibles desde Internet. Si configura el
cortafuegos de la otra manera (como un cortafuegos inclusivo o
permisivo), tiene grandes posibilidades de que olvide “cerrar” un par de
servicios, o de que agregue un nuevo servicio interno y olvide
actualizar el cortafuegos. Puede incluso abrir el rango de n?meros de
puerto altos en el cortafuegos para permitir operaciones de tipo
permisivo sin comprometer sus puertos bajos. Recuerde tambi?n que
FreeBSD le permite controlar el rango de n?meros de puerto utilizados
para asignaci?n din?mica a trav?s de las numerosas
``net.inet.ip.portrange`` de ``sysctl``
(``sysctl -a | fgrep portrange``), lo cual tambi?n facilita la
complejidad de la configuraci?n de su cortafuegos. Por ejemplo, puede
utilizar un rango normal primero/?ltimo de 4000 ? 5000, y un rango de
puerto alto de 49152 a 65535; bloqu?e todo por debajo de 4000 (excepto
para ciertos puertos espec?ficos accesibles desde Internet, por
supuesto).

Otro ataque DoS com?n es llamado ataque “springboard”: atacar un
servidor de forma que genere respuestas que lo sobrecarguen,
sobrecarguen la red local o alguna otra m?quina. Los ataques m?s comunes
de este tipo son los *ataques ICMP ping broadcast*. El atacante
falsifica paquetes ping enviados a la direcci?n broadcast de su LAN
simulando que la direcci?n IP origen es la de la m?quina que desean
atacar. Si sus routers de frontera no est?n configurados para lidiar con
pings a direcciones de broadcast su LAN termina generando suficientes
respuestas a la direcci?n origen falsificada como para saturar a la
v?ctima, especialmente cuando el atacante utiliza el mismo truco en
varias docenas de direcciones broadcast en varias docenas de redes
diferentes a la vez. Se han medido ataques de broadcast de m?s de ciento
veinte megabits. Un segundo tipo de ataque “springboard” bastante com?n
se da contra el sistema de informe de error de ICMP. Un atacante puede
saturar la conexi?n entrante de red de un servidor mediante la
construcci?n de paquetes que generen respuestas de error ICMP,
provocando que el servidor sature su conexi?n saliente de red con
respuestas ICMP. Este tipo de ataque tambi?n puede tumbar el servidor
agotando sus “mbufs”, especialmente si el servidor no puede drenar lo
suficientemente r?pido las respuestas ICMP que genera. El kernel de
FreeBSD tiene una opci?n de compilaci?n llamada ``ICMP_BANDLIM``, que
limita la efectividad de este tipo de ataques. La ?ltima gran categor?a
de ataques “springboard” est? relacionada con ciertos servicios de
inetd, como el servicio de eco udp. El atacante simplemente imita un
paquete UDP con el puerdo de eco del servidor A como direcci?n de
origen, y el puerto eco del servidor B como direcci?n de destino,
estando ambos servidores en la misma LAN. Un atacante puede sobrecargar
ambos servidores y la propia LAN inyectando simplemente un par de
paquetes. Existen problemas similares con el puerto chargen. Un
administrador de sistemas competente apagar? todos estos servicios
internos de verificaci?n de inetd.

Los ataques con paquetes falsificados pueden utilizarse tambi?n para
sobrecargar la cach? de rutas del kernel. Consulte los par?metros de
``sysctl`` ``net.inet.ip.rtexpire``, ``rtminexpire``, y ``rtmaxcache``.
Un ataque de paquetes falsificados que utiliza una direcci?n IP origen
aleatoria provocar? que el kernel genere una ruta temporal en cach? en
su tabla de rutas, visible con ``netstat -rna | fgrep W3``. Estas rutas
suelen expiran en 1600 segundos m?s o menos. Si el kernel detecta que la
tabla de rutas en cach? es ya demasiado grande reducir? din?micamente
``rtexpire``, pero nunca la reducir? a un valor que sea menor que
``rtminexpire``. Esto nos presenta dos problemas:

.. raw:: html

   <div class="orderedlist">

#. El kernel no reacciona con suficiente rapidez cuando un servidor
   ligeramente cargado es atacado.

#. El ``rtminexpire`` no es lo suficientemente bajo para que el kernel
   sobreviva a un ataque sostenido.

.. raw:: html

   </div>

Si sus servidores est?n conectados a Internet mediante mediante una
l?nea T3 o superior puede ser prudente corregir manualmente ``rtexpire``
y ``rtminexpire`` por medio de
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__.
Nunca ponga ambos par?metros a cero (a menos que des?e estrellar la
m?quina). Configurar ambos par?metros a 2 segundos deber?a bastar para
proteger de ataques la tabla de rutas.

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

14.3.9. Otros aspectos del acceso con Kerberos y SSH
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Existen un par de detalles con respecto a Kerberos y ssh que debe
analizar sy pretende usarlos. Kerberos V es un excelente protocolo de
protocolo de autentificaci?n, pero hay errores en la versi?n kerberizada
de telnet y rlogin que las hacen inapropiadas para gestionar flujos
binarios. Adem? Kerberos no cifra por defecto una sesi?n a menos que
utilice la opci?n ``-x``. ssh cifra todo por defecto.

ssh funciona bastante bien en todos los casos, con la sola salvedad de
que por defecto reenv?a llaves de cifrado. Esto significa que si usted
tiene una estaci?n de trabajo segura, que contiene llaves que le dan
acceso al resto del sistema, y hace ssh a una m?quina insegura, sus
llaves se pueden utilizar. Las llaves en s? no se exponen, pero ssh crea
un puerto de reenv?o durante el login, y si un atacante ha comprometido
el ``root`` de la m?quina insegura, puede utilizar ese puerto para usar
sus llaves y obtener acceso a cualquier otra m?quina que sus llaves
abran.

Le recomendamos que, siempre que sea posible, use ssh combinado con
Kerberos en los login de su personal de administraci?n. para logins de
staff. Puede compilar ssh con soporte de Kerberos. Esto reducir? su
dependencia de llaves ssh expuestas, al mismo tiempo que protege las
contrase?as v?a Kerberos. Las llaves ssh deben usarse s?lamente para
tareas autom?ticas desde m?quinas seguras (algo que Kerberos no hace por
incompatibilidad). Recomendamos tambi?n que desactive el reenv?o de
llaves en la configuraci?n de ssh, o que use la opci?n
``from=IP/DOMAIN`` que ssh incluye en ``authorized_keys``; as? la llave
s?lo podr? ser utilizada por entidades que se validen desde m?quinas
espec?ficas.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------+-----------------------------+---------------------------------+
| `Anterior <security-intro.html>`__?   | `Subir <security.html>`__   | ?\ `Siguiente <crypt.html>`__   |
+---------------------------------------+-----------------------------+---------------------------------+
| 14.2. Introducci?n?                   | `Inicio <index.html>`__     | ?14.4. DES, MD5 y Crypt         |
+---------------------------------------+-----------------------------+---------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
