================================
14.5. Contrase?as de un solo uso
================================

.. raw:: html

   <div class="navheader">

14.5. Contrase?as de un solo uso
`Anterior <crypt.html>`__?
Cap?tulo 14. Seguridad
?\ `Siguiente <tcpwrappers.html>`__

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

14.5. Contrase?as de un solo uso
--------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

S/Key es un esquema de contrase?a de un solo uso basado en una funci?n
de hash de sentido ?nico. FreeBSD utiliza el hash MD4 por
compatibilidad, pero otros sistemas usan MD5 y DES-MAC. S/Key forma
parte del sistema base de FreeBSD desde la versi?n 1.1.5 y se usa
tambi?n en un n?mero creciente de otros sistemas operativos. S/Key es
una marca registrada de Bell Communications Research, Inc.

A partir de la versi?n 5.0 de FreeBSD S/Key fu? reemplazado por su
equivalente OPIE (“One-time Passwords In Everything”, “Contrase?as de un
solo uso para todo”). OPIE usa por defecto hash MD5.

En esta secci?n se explican tres tipos de contrase?a. La primera es la
t?pica contrase?a al estilo UNIX? o Kerberos; las llamaremos
“contrase?as UNIX?”. El segundo tipo es la contrase?a de un solo uso,
que se genera con el programa ``key`` de S/Key o con
`opiekey(1) <http://www.FreeBSD.org/cgi/man.cgi?query=opiekey&sektion=1>`__
de OPIE, y que aceptan los programas ``keyinit``,
`opiepasswd(1) <http://www.FreeBSD.org/cgi/man.cgi?query=opiepasswd&sektion=1>`__,
y el prompt de login; llamaremos a esta una “contrase?a de un solo uso”.
El ?ltimo tipo de contrase?a es la contrase?a secreta que le da usted a
los programas ``key``/``opiekey`` (y a veces
``keyinit``/``opiepasswd``), que se usa para generar contrase?as de un
solo uso; a estas las llamaremos “contrase?as secretas”, o simplemente
“contrase?a”.

La contrase?a secreta no tiene nada que ver con su contrase?a UNIX?;
pueden ser la misma, pero no es recomendable. Las contrase?as secretas
S/Key y OPIE no est?n limitadas a 8 caracteres como las contrase?as
UNIX? antiguas`:sup:`[8]` <#ftn.idp75317712>`__, pueden ser tan largas
como se quiera. Las contrase?as con frases de seis o siete palabras muy
largas son bastante comunes. El funcionamiento del sistema S/Key o el
OPIE es en gran parte completamente independiente del sistema de
contrase?as UNIX?.

Adem?s de la contrase?a hay dos datos que son importantes para S/Key y
OPIE. Uno es lo que se conoce como “semilla” o “llave”, que consiste en
dos letras y cinco d?gitos. El otro dato importante se llama la “cuenta
de iteraci?n”, que es un n?mero entre 1 y 100. S/Key genera la
contrase?a de un solo uso concatenando la semilla y la contrase?a
secreta, aplica el hash MD4/MD5 tantas veces como especifique la cuenta
de iteraci?n y convierte el resultado en seis palabras cortas en ingl?s.
Estas seis palabras en ingl?s son su contrase?a de un solo uso. El
sistema de autentificaci?n (principalmente PAM) mantiene un registro del
uso de contrase?as de un solo uso, y el usuario puede validarse si el
hash de la contrase?a que proporciona es igual a la contrase?a previa.
Como se utiliza un hash de sentido ?nico es imposible generar futuras
contrase?as de un solo uso si una contrase?a que ya ha sido usada fuera
capturada; la cuenta de iteraci?n se reduce despu?s de cada login
correcto para sincronizar al usuario con el programa login. Cuanto la
iteraci?n llega a 1, S/Key y OPIE deben reinicializar.

Hay tres programas involucrados en cada uno de estos sistemas. Los
programas ``key`` y ``opiekey`` aceptan una cuenta iterativa, una
semilla y una contrase?a secreta, y generan una contrase?a de un solo
uso o una lista consecutiva de contrase?as de un solo uso. Los programas
``keyinit`` y ``opiepasswd`` se usan respectivamente para inicializar
S/Key y OPIE, y para cambiar contrase?as, cuentas iterativas o semillas;
toman ya sea una frase secreta, o una cuenta iterativa y una contrase?a
de un solo uso. Los programas ``keyinfo`` y ``opieinfo`` examinan los
ficheros de credenciales correspondientes (``/etc/skeykeys`` o
``/etc/opiekeys``) e imprimen la cuenta iterativa y semilla del usuario
invocante.

Explicaremos cuatro tipos de operaciones diferentes. La primera es usar
``keyinit`` o ``opiepasswd`` a trav?s de una conexi?n segura para
configurar contrase?as de un solo uso por primera vez, o para cambiar su
contrase?a o semilla. La segunda operaci?n es utilizar ``keyinit`` o
``opiepasswd`` a trav?s de una conexi?n insegura, adem?s de usar ``key``
u ``opiekey`` sobre una conexi?n segura para hacer lo mismo. La tercera
es usar ``key``/``opiekey`` para conectarse a trav?s de una conexi?n
insegura. La cuarta es usar ``opiekey`` o ``key`` para generar numerosas
llaves, que pueden ser escritas para llevarlas con usted al ir a alg?n
lugar desde el que no se puedan hacer conexiones seguras a ning?n sitio.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

14.5.1. Inicializaci?n de conexiones seguras
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Para inicializar S/Key por primera vez cambie su contrase?a, o cambie su
semilla mientras est? conectado a trav?s de una conexi?n segura (esto
es, en la consola de una m?quina o v?a ssh); use ``keyinit`` sin ning?n
par?metro:

.. code:: screen

    % keyinit
    Adding unfurl:
    Reminder - Only use this method if you are directly connected.
    If you are using telnet or rlogin exit with no password and use keyinit -s.
    Enter secret password:
    Again secret password:

    ID unfurl s/key is 99 to17757
    DEFY CLUB PRO NASH LACE SOFT

En OPIE se utiliza ``opiepasswd``:

.. code:: screen

    % opiepasswd -c
    [grimreaper] ~ $ opiepasswd -f -c
    Adding unfurl:
    Only use this method from the console; NEVER from remote. If you are using
    telnet, xterm, or a dial-in, type ^C now or exit with no password.
    Then run opiepasswd without the -c parameter.
    Using MD5 to compute responses.
    Enter new secret pass phrase:
    Again new secret pass phrase:
    ID unfurl OTP key is 499 to4268
    MOS MALL GOAT ARM AVID COED

En ``Enter new secret pass phrase:`` o ``Enter secret password:``, debe
introducir una contrase?a o frase. Recuerde que no es la contrase?a que
utilizar? para entrar, se usar? para generar sus llaves de un solo uso.
La l?nea “ID” da los par?metros de su instancia en particular: su nombre
de login, la cuenta iterativa y semilla. En el momento del login el
sistema recordar? estos par?metros y los presentar? de nuevo para que no
tenga que recordarlos. La ?ltima l?nea proporciona las contrase?as de un
solo uso que corresponden a esos par?metros y su contrase?a secreta; si
fuera a hacer login de manera inmediata, deber?a usar esta contrase?a de
una sola vez.

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

14.5.2. Inicializaci?n de conexiones inseguras
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Para inicializar o cambiar su contrase?a secreta a trav?s de una
conexi?n insegura, necesitar? tener alguna conexi?n segura a alg?n lugar
donde pueda ejecutar ``key`` u ``opiekey``; puede ser gracias a un
accesorio de escritorio o en una Macintosh?, o un prompt de shell en una
m?quina en la que conf?e. Necesitar? tambi?n una cuenta iterativa (100
probablemente sea un buen valor), y puede usar su propia semilla, o usar
una generada aleatoriamente. Siguiendo con la conexi?n insegura (hacia
la m?quina que est? inicializando), ejecute ``keyinit -s``:

.. code:: screen

    % keyinit -s
    Updating unfurl:
    Old key: to17758
    Reminder you need the 6 English words from the key command.
    Enter sequence count from 1 to 9999: 100
    Enter new key [default to17759]:
    s/key 100 to 17759
    s/key access password:
    s/key access password:CURE MIKE BANE HIM RACY GORE

En OPIE debe usar ``opiepasswd``:

.. code:: screen

    % opiepasswd

    Updating unfurl:
    You need the response from an OTP generator.
    Old secret pass phrase:
            otp-md5 498 to4268 ext
            Response: GAME GAG WELT OUT DOWN CHAT
    New secret pass phrase:
            otp-md5 499 to4269
            Response: LINE PAP MILK NELL BUOY TROY

    ID mark OTP key is 499 gr4269
    LINE PAP MILK NELL BUOY TROY

Para aceptar la semilla por defecto (la que el programa ``keyinit``
llama ``key``, “llave”, para terminar de complicar las cosas), pulse
**Enter**. Antes de introducir una una contrase?a de acceso cambie a su
conexi?n o accesorio de escritorio S/Key y dele el mismo par?metro:

.. code:: screen

    % key 100 to17759
    Reminder - Do not use this program while logged in via telnet or rlogin.
    Enter secret password: <secret password>
    CURE MIKE BANE HIM RACY GORE

O para OPIE:

.. code:: screen

    % opiekey 498 to4268
    Using the MD5 algorithm to compute response.
    Reminder: Don't use opiekey from telnet or dial-in sessions.
    Enter secret pass phrase:
    GAME GAG WELT OUT DOWN CHAT

Vuelva a la conexi?n insegura y copie la contrase?a de un solo uso
generada al programa que quiera usar.

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

14.5.3. Generaci?n una sola contrase?a de un solo uso
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Una vez que ha inicializado S/Key u OPIE, cuando haga login ver? un
“prompt” parecido al siguiente:

.. code:: screen

    % telnet ejemplo.com
    Trying 10.0.0.1...
    Connected to ejemplo.com
    Escape character is '^]'.

    FreeBSD/i386 (ejemplo.com) (ttypa)

    login: <username>
    s/key 97 fw13894
    Password: 

O, en el caso de OPIE:

.. code:: screen

    % telnet ejemplo.com
    Trying 10.0.0.1...
    Connected to ejemplo.com
    Escape character is '^]'.

    FreeBSD/i386 (ejemplo.com) (ttypa)

    login: <nombre_de_usuario>
    otp-md5 498 gr4269 ext
    Password: 

Como una nota aparte, el “prompt” de S/Key y OPIE cuenta con una opci?n
?til (que no se muestra aqu?): si pulsa **Enter** en el “prompt” de
contrase?a el “prompt” activar? el eco para que pueda ver en pantalla lo
que teclea. Esto puede ser extremadamente ?til si est? tecleando una
contrase?a a a mano o desde un la lista impresa.

Ahora necesitar? generar su contrase?a de un s?lo uso para responder a
este “prompt” de login. Debe hacerlo en un sistema digno de confianza y
en el que pueda ejecutar ``key`` u ``opiekey``. Existen versiones DOS,
Windows? y tambi?n para Mac?OS?. Ambos usar?n la cuenta iterativa y la
semilla como opciones de l?nea de ?rdenes. Puede cortarlas y pegarlas
desde el “prompt” de login de la m?quina en la que se est?
identificando.

En el sistema de confianza:

.. code:: screen

    % key 97 fw13894
    Reminder - Do not use this program while logged in via telnet or rlogin.
    Enter secret password:
    WELD LIP ACTS ENDS ME HAAG

Con OPIE:

.. code:: screen

    % opiekey 498 to4268
    Using the MD5 algorithm to compute response.
    Reminder: Don't use opiekey from telnet or dial-in sessions.
    Enter secret pass phrase:
    GAME GAG WELT OUT DOWN CHAT

Ahora que tiene su contrase?a de un solo uso puede proceder con el
login:

.. code:: screen

    login: <nombre_de_usuario>
    s/key 97 fw13894
    Password: <Enter para activar el eco>
    s/key 97 fw13894
    Password [echo on]: WELD LIP ACTS ENDS ME HAAG
    Last login: Tue Mar 21 11:56:41 from 10.0.0.2 ... 

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

14.5.4. Generaci?n de m?ltiples contrase?as de un solo uso
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A veces usted hay que ir a lugares donde no hay acceso a una m?quina de
fiar o a una conexi?n segura. En estos casos, puede utilizar ``key`` y
``opiekey`` para generar previamente numerosas contrase?as de un solo
uso para, una vez impresas, llev?rselas a donde hagan falta. Por
ejemplo:

.. code:: screen

    % key -n 5 30 zz99999
    Reminder - Do not use this program while logged in via telnet or rlogin.
    Enter secret password: <secret password>
    26: SODA RUDE LEA LIND BUDD SILT
    27: JILT SPY DUTY GLOW COWL ROT
    28: THEM OW COLA RUNT BONG SCOT
    29: COT MASH BARR BRIM NAN FLAG
    30: CAN KNEE CAST NAME FOLK BILK

O para OPIE:

.. code:: screen

    % opiekey -n 5 30 zz99999
    Using the MD5 algorithm to compute response.
    Reminder: Don't use opiekey from telnet or dial-in sessions.
    Enter secret pass phrase: <secret password>
    26: JOAN BORE FOSS DES NAY QUIT
    27: LATE BIAS SLAY FOLK MUCH TRIG
    28: SALT TIN ANTI LOON NEAL USE
    29: RIO ODIN GO BYE FURY TIC
    30: GREW JIVE SAN GIRD BOIL PHI

El ``-n 5`` pide cinco llaves en secuencia, la opci?n ``30`` especifica
que ese debe ser el ?ltimo n?mero de iteraci?n. Observe que se imprimen
en el orden *inverso* de uso. Si es realmente paranoico escriba los
resultados a mano; si no, puede enviar la salida a ``lpr``. Observe que
cada l?nea muestra la cuenta iterativa y la contrase?a de un solo uso;
puede ir tachando las contrase?as seg?n las vaya utilizando.

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

14.5.5. Restricci?n del uso de contrase?as UNIX?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

S/Key puede implantar restricciones en el uso de contrase?as UNIX?
bas?ndose en el nombre de equipo, nombre de usuario, puerto de terminal
o direcci?n IP de una sesi?n de login. Consulte el fichero de
configuraci?n ``/etc/skey.access``. La p?gina de manual de
`skey.access(5) <http://www.FreeBSD.org/cgi/man.cgi?query=skey.access&sektion=5>`__
contiene m?s informaci?n sobre el formato del fichero y detalla tambi?n
algunas precauciones de seguridad que hay que tener en cuenta antes de
basar nuestra seguridad en este fichero.

Si ``/etc/skey.access`` no existiera (por defecto es as? en sistemas
FreeBSD?4.X) todos los usuarios podr?n disponer de contrase?as UNIX?. Si
el fichero existe se exigir? a todos los usuarios el uso de S/Key, a
menos que se configure de otro modo en ``skey.access``. En todos los
casos las contrase?as UNIX? son admiten en consola.

Aqu? hay un ejemplo del fichero de configuraci?n ``skey.access`` que
muestra las tres formas m?s comunes de configuraci?n:

.. code:: programlisting

    permit internet 192.168.0.0 255.255.0.0
    permit user fnord
    permit port ttyd0

La primera l?nea (``permit internet``) permite a usuarios cuyas
direcciones IP origen (las cuales son vulnerables a una falsificaci?n)
concuerden con los valores y m?scara especificados utilizar contrase?as
UNIX?. Esto no debe usarse como mecanismo de seguridad, sino como medio
de recordarle a los usuarios autorizados que est?n usando una red
insegura y necesitan utilizar S/Key para la validaci?n.

La segunda l?nea (``permit user``) permite al nombre de usuario
especificado, en este caso ``fnord``, utilizar contrase?as UNIX? en
cualquier momento. Hablando en general, esto solo debe ser usado por
gente que no puede usar el programa ``key``, como aquellos con
terminales tontas o refractarios al aprendizaje.

La tercera l?nea (``permit port``) permite a todos los usuarios
validados en la l?nea de terminal especificada utilizar contrase?as
UNIX?; esto puede usarse para usuarios que se conectan mediante
“dial-ups”.

OPIE puede restringir el uso de contrase?as UNIX? bas?ndose en la
direcci?n IP de una sesi?n de login igual que lo har?a S/Key. El fichero
que gestiona esto es ``/etc/opieaccess``, que est? inclu?do por defecto
en sistemas FreeBSD?5.0 o posteriores. Revise
`opieaccess(5) <http://www.FreeBSD.org/cgi/man.cgi?query=opieaccess&sektion=5>`__
para m?s informaci?n sobre este fichero y qu? consideraciones de
seguridad debe tener presentes a la hora de usarlo.

Veamos un ejemplo de ``opieaccess``:

.. code:: programlisting

    permit 192.168.0.0 255.255.0.0

Esta l?nea permite a usuarios cuya direcci?n IP de origen (vulnerable a
falsificaci?n) concuerde con los valores y m?scara especificados,
utilizar contrase?as UNIX? en cualquier momento.

Si no concuerda ninguna regla en ``opieaccess`` se niegan por defecto
los logins no-OPIE.

.. raw:: html

   </div>

.. raw:: html

   <div class="footnotes">

--------------

.. raw:: html

   <div id="ftn.idp75317712" class="footnote">

`:sup:`[8]` <#idp75317712>`__\ En FreeBSD la contrase?a del login
est?ndar puede ser de hasta 128 caracteres de longitud.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------+-----------------------------+---------------------------------------+
| `Anterior <crypt.html>`__?   | `Subir <security.html>`__   | ?\ `Siguiente <tcpwrappers.html>`__   |
+------------------------------+-----------------------------+---------------------------------------+
| 14.4. DES, MD5 y Crypt?      | `Inicio <index.html>`__     | ?14.6. TCP Wrappers                   |
+------------------------------+-----------------------------+---------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
